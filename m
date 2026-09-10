Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C5DFC79FBB
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 20:55:51 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25191.1789073741659194084
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 13:55:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=iW3Vhm+L;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-202609102055389233c4886e000207c3-udess6@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202609102055389233c4886e000207c3
        for <openembedded-core@lists.openembedded.org>;
        Thu, 10 Sep 2026 22:55:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=rZWLDyxZtPTzZ4TbVfRXZVJXYR1uMGrzAOVYog8jaXc=;
 b=iW3Vhm+LHFwCHWMfyjNvOs6vLSMQgcIWqV8tWd1bZp9C024Q+oVLng5PMF6pHGTLhCCu9r
 fPwncFLdof/zGE5egwnp0xftxvGRiuj37jwB4EoMVhpHO5LSmGWjVxO7CMCoAVaALhQzT7YL
 4AKwsYkC9oz985Q8WuDuLK7dFpmsZ2062o3ltdeWTfhR28La0wW3QAxxIHId2EfcW10E5mXI
 UEYNW4tVauPJw0gC1DCvSNbsiJgBuh3p0OSkgIPHqjoZ0HHfz9fco8fbMYzlwzhch5m+Jfwi
 MYZ8awxEKCCrUcU672JA+iT32YLV6djaOsh/tJjJT+pMwc992TIOdmGg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] runqemu-extract-sdk: fix PATH loss in pseudo_native_environment()
Date: Thu, 10 Sep 2026 22:55:27 +0200
Message-ID: <20260910205527.192893-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 20:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245600

From: Adrian Freihofer <adrian.freihofer@siemens.com>

pseudo_native_environment() built a fresh dict with only
OECORE_NATIVE_SYSROOT and PSEUDO instead of the caller's environment.
extract_sdk_rootfs() passes it straight to subprocess.run(env=...),
which replaces the child's environment wholesale, so PATH (and
everything else) was lost and tar fell back to the tar form the host.
This regression was introduced in commit 78c176df1 (the Python refactor).

Symptom: "tar: unrecognized option '--zstd'" on hosts where the
default-PATH tar doesn't support it (e.g. RHEL8's tar 1.30).

Fix by starting from a copy of os.environ, matching how
devtool/ide_sdk.py's extract_nfs_rootfs() already builds its own
environment.

Also derive the "Accepted types" error message in _tar_options() from
tar_extract_options's keys instead of a separately hardcoded list.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/pseudo_rootfs_utils.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/pseudo_rootfs_utils.py b/scripts/lib/pseudo_rootfs_utils.py
index 89d082f672..12431e2080 100644
--- a/scripts/lib/pseudo_rootfs_utils.py
+++ b/scripts/lib/pseudo_rootfs_utils.py
@@ -37,7 +37,8 @@ def pseudo_native_environment():
     if not native_sysroot or not os.path.exists(native_sysroot):
         raise PseudoRootfsError("%s doesn't exist" % native_sysroot)
 
-    environment = {'OECORE_NATIVE_SYSROOT': native_sysroot}
+    environment = dict(os.environ)
+    environment['OECORE_NATIVE_SYSROOT'] = native_sysroot
     environment['PSEUDO'] = os.path.join(native_sysroot, 'usr', 'bin', 'pseudo')
     return environment
 
@@ -55,7 +56,7 @@ def _tar_options(rootfs_tarball):
             return ['--numeric-owner', *option.split()]
     raise PseudoRootfsError(
         'Unable to determine sdk tarball format\n'
-        'Accepted types: .tar / .tar.gz / .tar.bz2 / .tar.xz / .tar.zst')
+        'Accepted types: %s' % ' / '.join(tar_extract_options))
 
 
 def pseudo_state_dir(rootfs_dir):
-- 
2.55.0


