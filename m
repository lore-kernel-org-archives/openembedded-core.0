Return-Path: <tobias.hagelborn@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECB6CC54EAA
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 11:40:39 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.100075.1674819632138358395
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jan 2023 03:40:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=TDpDgy/9;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: tobias.hagelborn@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1674819632;
  x=1706355632;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=qkP+1Nzctifr4RcKAo6sNYpu4yzLyzTxoZhUxsd3glM=;
  b=TDpDgy/9mONX+k2ChuHqB1UvMxZ2mEAj9mL2r7FH0qT4fagPVjhQvk9I
   d1TggNfshttjVM93LhpC+prHEP70hEg9a2GQltt+QktU5/6NKIm9I81oj
   MTHaGe05fyrY2PcKt0r8uYCJVplvyjVLVLUBTv1bn3QiI6FNt2RcmIvbA
   ZtfjRtR73iRkma4Hv4bpGCLKjOv88QII9+OFmDkfpwTaGzbxdoWqQfLdF
   IW/LpJugApVj+L7Qyp6cEncgHSbc6JwOYT8SIVV5S9KYj6XS0ctcfxeuh
   tvJF76xyIfYN5yzjo2BNwOVAIyvVwqasmrxFVgkGNvms8htNFherpHvst
   w==;
From: Tobias Hagelborn <tobiasha@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] sstate.bbclass: Fetch non-existing local .sig files if needed
Date: Fri, 27 Jan 2023 12:40:12 +0100
Message-ID: <20230127114012.30108-1-tobiasha@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <173DE02DC4E595DC.21537@lists.openembedded.org>
References: <173DE02DC4E595DC.21537@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail04w.axis.com (10.20.40.10) To se-mail01w.axis.com
 (10.20.40.7)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jan 2023 11:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176441

For the case of a global shared state cache and a local sstate cache
with a mix of signed and un-signed entries, there is a case where
a .sig is missing locally, but may exist in the global sstate cache.

For this case, do not just fail sstate fetch, but rather backfill
the .sig file from the global sstate cache.

If this case is detected, re-run the fetch operation to get the
global .sig file (if it exists).

Signed-off-by: Tobias Hagelborn <tobias.hagelborn@axis.com>
---
 meta/classes-global/sstate.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 77e3ea34e1..7f0240b434 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -365,8 +365,9 @@ def sstate_installpkg(ss, d):
     d.setVar("SSTATE_CURRTASK", ss['task'])
     sstatefetch = d.getVar('SSTATE_PKGNAME')
     sstatepkg = d.getVar('SSTATE_PKG')
+    verify_sig = bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG"), False)
 
-    if not os.path.exists(sstatepkg):
+    if not os.path.exists(sstatepkg) or (verify_sig and not os.path.isfile(sstatepkg + '.sig')):
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


