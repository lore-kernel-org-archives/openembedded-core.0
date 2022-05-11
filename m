Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BFB0C433FE
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 02:57:58 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web10.6480.1652237869110482622
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 19:57:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=dcRdKL/u;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652237872; x=1683773872;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=9bRaH5tqdjpcJCVxbCNvIGcujSc0cO8LPQdKqQFK+bw=;
  b=dcRdKL/uz+YvsYZfS5n4ooE5HtKUjzjppTedmMiM2MsMF3p3fOn2p6l5
   B6SalS5kD65jsn99ipAdeCm2qhDJN3+xA8bCBVhmPl2XPzhbox7gUOv8z
   RCd5ORrJtixkff6sAjSnTcOq13fyto5ozat1OA24YAOlDCmNzSjGhjM2n
   HtW5FXhbKyY8ExG0hRyhAKCfvLNjK6k26gvWIp5oWk6ahzKL/9KQZdR0t
   eqHDsdQjiEM65nE/pIleldKy5NuAe06NAhmSmsWBPvKQ9nn5EPeRPB3FK
   MsXLvZF0IqpCFhAcr4su13J7gD88yZYYzJOj1jkCrwadAYmlVSgnr+2cL
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="257106033"
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600";
   d="scan'208";a="257106033"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 19:57:51 -0700
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600";
   d="scan'208";a="602754760"
Received: from ukandhax-mobl3.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.214.163.3])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 19:57:50 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 08/17] install/devshell: Introduce git intercept
 script due to fakeroot issues
Date: Wed, 11 May 2022 10:57:23 +0800
Message-Id: 
 <262470f5c01c08826e0fcf3d08337d17952a257d.1652231471.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1652231471.git.anuj.mittal@intel.com>
References: <cover.1652231471.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 02:57:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165476

From: Paul Gortmaker <paul.gortmaker@windriver.com>

In a devshell, recent versions of git will complain if the repo is owned
by someone other than the current UID - consider this example:

 ------
  bitbake -c devshell linux-yocto

  [...]

  kernel-source#git branch
  fatal: unsafe repository ('/home/paul/poky/build-qemuarm64/tmp/work-shared/qemuarm64/kernel-source' is owned by someone else)
  To add an exception for this directory, call:

        git config --global --add safe.directory /home/paul/poky/build-qemuarm64/tmp/work-shared/qemuarm64/kernel-source
  kernel-source#
 ------

Of course the devshell has UID zero and the "real" UID is for "paul" in
this case.  And so recent git versions complain.

As the whole purpose of the devshell is to invoke a shell where development
can take place, having a non-functional git is clearly unacceptable.

Richard suggested we could use PSEUDO_UNLOAD=1 to evade this issue, and I
suggested we probably will see other similar instances like this and should
make use of PATH to intercept via devshell wrappers - conveniently we already
have examples of this.

Here, we copy the existing "ar" example and tune it to the needs of git to
combine Richard's suggestion and mine.

As such we now also can store commit logs and use send-email with our user
specific settings, instead of "root", so in additon to fixing basic
commands like "git branch" it should also increase general usefulness.

RP: Tweaked the patch so the PATH change only applies to the devshell task
and is a generic git intercept rather than devshell specific.

RP: Also apply the PATH change to do_install tasks since that also runs under
fakeroot and several software projects inject "git describe" output into
their binaries (systemd, iputils, llvm, ipt-gpu-tools at least) causing
reproducibility issues from systems with different git versions.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3266c327dfa186791e0f1e2ad63c6f5d39714814)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/base.bbclass     |  1 +
 meta/classes/devshell.bbclass |  2 ++
 scripts/git-intercept/git     | 19 +++++++++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100755 scripts/git-intercept/git

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 070341d1aa..78cc8279dd 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -339,6 +339,7 @@ addtask install after do_compile
 do_install[dirs] = "${B}"
 # Remove and re-create ${D} so that is it guaranteed to be empty
 do_install[cleandirs] = "${D}"
+PATH:prepend:task-install = "${COREBASE}/scripts/git-intercept:"
 
 base_do_install() {
 	:
diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index 76dd0b42ee..b6212ebd89 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -2,6 +2,8 @@ inherit terminal
 
 DEVSHELL = "${SHELL}"
 
+PATH:prepend:task-devshell = "${COREBASE}/scripts/git-intercept:"
+
 python do_devshell () {
     if d.getVarFlag("do_devshell", "manualfakeroot"):
        d.prependVar("DEVSHELL", "pseudo ")
diff --git a/scripts/git-intercept/git b/scripts/git-intercept/git
new file mode 100755
index 0000000000..8adf5c9ecb
--- /dev/null
+++ b/scripts/git-intercept/git
@@ -0,0 +1,19 @@
+#!/usr/bin/env python3
+#
+# Wrapper around 'git' that doesn't think we are root
+
+import os
+import shutil
+import sys
+
+os.environ['PSEUDO_UNLOAD'] = '1'
+
+# calculate path to the real 'git'
+path = os.environ['PATH']
+path = path.replace(os.path.dirname(sys.argv[0]), '')
+real_git = shutil.which('git', path=path)
+
+if len(sys.argv) == 1:
+    os.execl(real_git, 'git')
+
+os.execv(real_git, sys.argv)
-- 
2.35.3


