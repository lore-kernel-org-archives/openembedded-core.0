Return-Path: <tobias.hagelborn@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE89C05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 13:52:03 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.73921.1674741122551952499
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 05:52:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Q2SWlTgy;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: tobias.hagelborn@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1674741123;
  x=1706277123;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wuDLyMI40mwCcF7vWfQB6VLe++PFd80nFR0JJtcdrGA=;
  b=Q2SWlTgyo9Tjiip37b8hQ02JwLJNVzxjVMcg6QxNjkaOAgyY7V734Vyc
   BpcdIrwI1+3NeSKzKCGovlCc/u6/2Jaabp6J+X3DMsZwqhd+x6fkrTm/3
   2Yz7Ya4gXliNgVfb/A95v1wrYVj6F/0kWhwF1JJu/QBfv/mBggIo7PfzY
   MMIXXmlmGWIwmfUWaYOEvAsCZMjfqSL17Lb5spNmKYu7jeizUuDlm8If9
   0r468tM1Y3I0OALrv/BY9oEMCVQLgxN1+Zhxl6OCb/Aum6SuNe0eDaNlv
   OHR/Va09i2t92kXUlZ7M2bKeLIyH4KtzdYG0wv9vULxD/OKFnlptjhUpe
   g==;
From: Tobias Hagelborn <tobiasha@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] sstate.bbclass: Fetch non-existing local .sig files if needed
Date: Thu, 26 Jan 2023 14:51:45 +0100
Message-ID: <20230126135145.2499985-1-tobiasha@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail07w.axis.com (10.20.40.13) To se-mail01w.axis.com
 (10.20.40.7)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 13:52:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176397

For the case of a global shared state cache and a local sstate cache
with a mix of signed and un-signed entries, there is a case where
a .sig is missing locally, but may exist in the global sstate cache.

For this case, do not just fail sstate fetch, but rather backfill
the .sig file from the global sstate cache.

If this case is detected, re-run the fetch operation to get the
global .sig file (if it exists).

Change-Id: Id0491af1d3a0d29b2773d1607be9edfb7fa5ad70
Signed-off-by: Tobias Hagelborn <tobias.hagelborn@axis.com>
---
 meta/classes-global/sstate.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 77e3ea34e1..584d86ee2f 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -365,6 +365,7 @@ def sstate_installpkg(ss, d):
     d.setVar("SSTATE_CURRTASK", ss['task'])
     sstatefetch = d.getVar('SSTATE_PKGNAME')
     sstatepkg = d.getVar('SSTATE_PKG')
+    verify_sig = bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG"), False)
 
     if not os.path.exists(sstatepkg):
         pstaging_fetch(sstatefetch, d)
@@ -373,11 +374,14 @@ def sstate_installpkg(ss, d):
         bb.note("Sstate package %s does not exist" % sstatepkg)
         return False
 
+    if verify_sig and not os.path.isfile(sstatepkg + '.sig'):
+        pstaging_fetch(sstatefetch, d)
+
     sstate_clean(ss, d)
 
     d.setVar('SSTATE_INSTDIR', sstateinst)
 
-    if bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG"), False):
+    if verify_sig:
         if not os.path.isfile(sstatepkg + '.sig'):
             bb.warn("No signature file for sstate package %s, skipping acceleration..." % sstatepkg)
             return False
-- 
2.30.2


