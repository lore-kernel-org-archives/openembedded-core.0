Return-Path: <tobias.hagelborn@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7181DC54EAA
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 14:20:48 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.41869.1675088441710224115
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jan 2023 06:20:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=NBka95Km;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: tobias.hagelborn@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1675088441;
  x=1706624441;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IPXHjTn7ur+dIjGDYpCXjnU1vLEg5YIjWbVTLTZs0Xk=;
  b=NBka95Kme4jpuCqvy09b7klRptv7t9Oj+9FnGsvHvd5jxBeySSfWfgxa
   +RJP7Zb4ZVc3FigkqY+pHLCPDju/38N8bZetZHgOZlXvR8sPBOMqX6ykw
   /XL/rBWmPNB+hG1opTJZH2qElts6glXXbRUJzt+MaEkguxsljsh1lXEIv
   X33adKANhQcroaly9AG7bfuxoG/sNe8s3S7gNk6u9jD5jel76ILylQmSZ
   5z2VswCRG3b5+m52OGgdkEAJKB/eQsoGLhieCCqHJy6sTVEgMyrJA82CO
   BkKT4If0Vr7PyAXAW9SwjsawgvV0cXYxMi1FZloH7exc4+hngQ7CQj/WL
   w==;
From: Tobias Hagelborn <tobiasha@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv3] sstate.bbclass: Fetch non-existing local .sig files if needed
Date: Mon, 30 Jan 2023 15:20:25 +0100
Message-ID: <20230130142025.3899801-1-tobiasha@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail01w.axis.com
 (10.20.40.7)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 14:20:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176495

For the case of a global shared state cache and a local sstate cache
with a mix of signed and un-signed entries, there is a case where
a .sig is missing locally, but may exist in the global sstate cache.

For this case, do not just fail sstate fetch, but rather backfill
the .sig file from the global sstate cache.

If this case is detected, re-run the fetch operation to get the
global .sig file (if it exists).

Signed-off-by: Tobias Hagelborn <tobias.hagelborn@axis.com>
---
New in v3:
* Use exists
* Consolidate into previously existing fetch block (with new condition)

 meta/classes-global/sstate.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 77e3ea34e1..567de4aba4 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -365,8 +365,9 @@ def sstate_installpkg(ss, d):
     d.setVar("SSTATE_CURRTASK", ss['task'])
     sstatefetch = d.getVar('SSTATE_PKGNAME')
     sstatepkg = d.getVar('SSTATE_PKG')
+    verify_sig = bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG"), False)
 
-    if not os.path.exists(sstatepkg):
+    if not os.path.exists(sstatepkg) or (verify_sig and not os.path.exists(sstatepkg + '.sig')):
         pstaging_fetch(sstatefetch, d)
 
     if not os.path.isfile(sstatepkg):
@@ -377,7 +378,7 @@ def sstate_installpkg(ss, d):
 
     d.setVar('SSTATE_INSTDIR', sstateinst)
 
-    if bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG"), False):
+    if verify_sig:
         if not os.path.isfile(sstatepkg + '.sig'):
             bb.warn("No signature file for sstate package %s, skipping acceleration..." % sstatepkg)
             return False
-- 
2.30.2


