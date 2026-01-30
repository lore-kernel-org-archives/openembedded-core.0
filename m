Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A98D49C72
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 07:53:58 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5979.1769759629649873188
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 23:53:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=I8yP/ksu;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-202601300753461598f3bbad0002072e-2yz9oy@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202601300753461598f3bbad0002072e
        for <openembedded-core@lists.openembedded.org>;
        Fri, 30 Jan 2026 08:53:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=bE3r7NnBjxkcEdZlhzGn2Lf/U8rJinkq6vqyijLx0SQ=;
 b=I8yP/ksuU0K08Wjq5koz9Y/U2mkmJGVx0cBh3z8HLD0SEBeNN5SPhoY9VFxz1Vrp3MZt36
 JSyftUh/+EwwLDzo2K5UteU2nNeV17ygZvhj2SvpLemA3obF5CZJYsjh9t7pz3QQxR14FOy/
 E09pyGREFWQjRByhgmECwOUe0+IlILT1pfcK8A8iWpEvbpy9qTb5FUCr/DkOJzPLYzgEEwS9
 JYL8iGiIS2UX8nrFdxiq3dMYqf8Tg4cXAxnVDOXb3J3PQ+n6Kl2qkn+wGzEZum/hKOmFFqbJ
 h1jxUcejL1pwM86U/3xbrjl3KMwcA17xqT3/scF3FTWLJfHvcL9gIHOA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/2] build-sysroots: Serialize native and target sysroot population
Date: Fri, 30 Jan 2026 08:52:31 +0100
Message-ID: <20260130075333.940897-2-adrian.freihofer@siemens.com>
In-Reply-To: <20260130075333.940897-1-adrian.freihofer@siemens.com>
References: <20260130075333.940897-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 07:53:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230185

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Calling (what devtool ide-sdk --mode shared does internally):
  bitbake meta-ide-support:do_build cmake-example:do_populate_sysroot
  bitbake build-sysroots:do_build_target_sysroot \
          build-sysroots:do_build_native_sysroot

can fail with errors like:
  Exception: subprocess.CalledProcessError:
  Command '.../tmp/sysroots/qemux86-64/usr/bin/postinst-base-passwd'
  returned non-zero exit status 1.

  Subprocess output:
  .../tmp/sysroots/x86_64/usr/sbin/useradd
  Running groupadd commands...
  NOTE: cmake-example: Performing groupadd with
    [--root ../tmp/sysroots/qemux86-64 --system cmake-example]
  awk: error while loading shared libraries: libtinfo.so.5: cannot open
       shared object file: No such file or directory
  ERROR: cmake-example: groupadd command did not succeed.

The root cause is a race condition between do_build_target_sysroot and
do_build_native_sysroot. When run in parallel, do_build_target_sysroot
executes postinstall scripts (e.g., useradd) that invoke awk, while
do_build_native_sysroot is concurrently installing gawk-native into the
shared native sysroot (which is in PATH for do_build_target_sysroot).

Since sstate artifact installation is not atomic, awk binaries can be
installed before their dependent libraries. If do_build_target_sysroot
picks up the newly installed but incomplete awk, it fails with missing
library errors.

The situation is created by a mix of:
- gawk-native in ASSUME_PROVIDED (use host awk)
- glibc depending on gawk-replacement-native (builds gawk-native)
- Both tasks populating the same shared native sysroot directory

Fix this by adding a lockfile to both tasks, ensuring they cannot run
concurrently and avoiding the race condition where partially installed
native tools are accessed. While lockfiles are generally avoided in
BitBake due to performance concerns, this is acceptable here since these
tasks are not on a critical performance path.

[YOCTO #16135]

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/recipes-core/meta/build-sysroots.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/meta/build-sysroots.bb b/meta/recipes-core/meta/build-sysroots.bb
index b0b8fb3c79..3ee9565862 100644
--- a/meta/recipes-core/meta/build-sysroots.bb
+++ b/meta/recipes-core/meta/build-sysroots.bb
@@ -36,6 +36,7 @@ python do_build_native_sysroot () {
 }
 do_build_native_sysroot[cleandirs] = "${STANDALONE_SYSROOT_NATIVE}"
 do_build_native_sysroot[nostamp] = "1"
+do_build_native_sysroot[lockfiles] = "${WORKDIR}/build-sysroots.lock"
 addtask do_build_native_sysroot
 
 python do_build_target_sysroot () {
@@ -47,6 +48,7 @@ python do_build_target_sysroot () {
 }
 do_build_target_sysroot[cleandirs] = "${STANDALONE_SYSROOT}"
 do_build_target_sysroot[nostamp] = "1"
+do_build_target_sysroot[lockfiles] = "${WORKDIR}/build-sysroots.lock"
 addtask do_build_target_sysroot
 
 do_clean[cleandirs] += "${STANDALONE_SYSROOT} ${STANDALONE_SYSROOT_NATIVE}"
-- 
2.52.0


