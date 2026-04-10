Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C09F44868
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 13:11:13 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156112.1775826665250257337
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 06:11:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=rI9/sFB9;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B2B3E4E429B1
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 13:11:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 89F0D603F0;
	Fri, 10 Apr 2026 13:11:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2109F1045001B;
	Fri, 10 Apr 2026 15:11:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775826662; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gjvUFLuzT4zQp2RWZ1gOwG0K4OCcBBp0bIxviaKoJgA=;
	b=rI9/sFB9RqNwgG/dSp3jCfSEJNFxjJDN6KR1/9Ovvil8j6TXMUY4YxAEW0+f2X0ePTnwFX
	Aibv8B1z3VqjqC6foIWiIZgfHAk2m96BAGvex6V0Z1FI7kruml9KZXGTVDa8vb6k0EoCzC
	enuRQQb4aR8Pdkct4Mpz+86//Ev4Gx2x9sHwPUi4Wq8CSXs60elL63GrcnufZ6HSi6eUua
	MA5P1m5zvlMJGqfHCKCtS2jAKzrSUAbOElKQ/YK6xLHKDWaM0657WEcArMFb4vAnUTHRhb
	HMMCMehebpUfyIznqDQkD6HbV3v7OYa1paIBWZLCideYyZf12RR+9znGaeBPOQ==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Fri, 10 Apr 2026 15:10:43 +0200
Subject: [PATCH 1/4] cve_check: Improve escaping of special characters in
 CPE 2.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-fix-cpe-escaping-v1-1-ed63c2477f46@bootlin.com>
References: <20260410-fix-cpe-escaping-v1-0-ed63c2477f46@bootlin.com>
In-Reply-To: <20260410-fix-cpe-escaping-v1-0-ed63c2477f46@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, ross.burton@arm.com, 
 peter.marko@siemens.com, stefano.tondo.ext@siemens.com, 
 jpewhacker@gmail.com, olivier.benjamin@bootlin.com, 
 antonin.godard@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 thomas.petazzoni@bootlin.com, Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.1
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 13:11:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235026

According to the NISTIR 7695 specification [1], multiple characters
require escaping when using formatted strings (e.g., `cpe:2.3:...`),
which use backslash escaping. In "Figure 6-3. ABNF for Formatted String
Binding"", the characters that need escaping are referenced by "escape",
"special", and "punc". More characters must be escaped than just
`\`, `?`, `*`, `:`, and `+`.

Additionally, use `maketrans()` with `translate()`, which is more
efficient than a simple `replace()`.

[1] https://nvlpubs.nist.gov/nistpubs/legacy/ir/nistir7695.pdf

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 meta/lib/oe/cve_check.py | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index 65557435149a..22b5062c977c 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -205,33 +205,29 @@ def get_patched_cves(d):
     return patched_cves
 
 
+_CPE23_ENCODE_TRANS_TABLE = str.maketrans(
+    {c: f"\\{c}" for c in [
+        "\\", "!", '"', "#", "$", "%", "&", "'", "(", ")", "+", ",", "/", ":", ";",
+        "<", "=", ">", "@", "[", "]", "^", "`", "{", "|", "}", "~", "?", "*"
+    ]}
+)
+
+
 def cpe_escape(value):
-    r"""
+    """
     Escape special characters for CPE 2.3 formatted string binding.
 
     CPE 2.3 formatted string binding (cpe:2.3:...) uses backslash escaping
     for special meta-characters, NOT percent-encoding. Percent-encoding is
     only used in the URI binding (cpe:/...).
 
-    According to NISTIR 7695, these characters need escaping:
-    - Backslash (\) -> \\
-    - Question mark (?) -> \?
-    - Asterisk (*) -> \*
-    - Colon (:) -> \:
-    - Plus (+) -> \+ (required by some SBOM validators)
+    According to NISTIR 7695, various characters referenced in the "Figure 6-3.
+    ABNF for Formatted String Binding" need escaping: escape, special and punc.
     """
     if not value:
         return value
 
-    # Escape special meta-characters for CPE 2.3 formatted string binding
-    # Order matters: escape backslash first to avoid double-escaping
-    result = value.replace('\\', '\\\\')
-    result = result.replace('?', '\\?')
-    result = result.replace('*', '\\*')
-    result = result.replace(':', '\\:')
-    result = result.replace('+', '\\+')
-
-    return result
+    return value.translate(_CPE23_ENCODE_TRANS_TABLE)
 
 
 def get_cpe_ids(cve_product, version):

-- 
2.53.0


