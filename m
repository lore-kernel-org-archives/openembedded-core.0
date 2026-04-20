Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE689F36C51
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 07:44:59 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14471.1776671088623350828
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 00:44:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=hATJK1RV;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id ACB15C5C98B;
	Mon, 20 Apr 2026 07:45:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E89B55FFA5;
	Mon, 20 Apr 2026 07:44:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5313B10460ADD;
	Mon, 20 Apr 2026 09:44:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776671086; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=z90vHRKR1kkuj68tHX2F5RSZd76YXCdqa+4IrgUNZTE=;
	b=hATJK1RVid6Nk5D2qKBnCYGKygjmX70IunZfaO1B9JIeoF8J6uOZ8driTPknNd9p6BhsaQ
	1ezNm/Uj6wOqrYubA+NLQls2DUhtVIk9gwmr+lwZRq5ea0+Af0otJWnOt5qeXbFT82UhIB
	JNTjMAFd0Su4tmMP0YF+TFT091tHL4jJq1C+V4i4rBKIhL5h5uwrGmfUsy5ecCic/+olgY
	NKmnd8hAkjYnygDToDAJrOIhQAT6GM7qZkmYflhcZq9ae5/smDuyRMqUMfhqsiay9T81rV
	HCamVqx+OMiIpkhRVzfcyDxlWYiJuxyKCik1qbZvQSJBJJy01A+uLsIymjS1gA==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Mon, 20 Apr 2026 09:44:32 +0200
Subject: [PATCH 01/10] oe/sbom30: Remove unneeded oe.sbom30. to reference
 local symbol
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-spdx3-improvements-v1-1-27e0d5edcdbe@bootlin.com>
References: <20260420-spdx3-improvements-v1-0-27e0d5edcdbe@bootlin.com>
In-Reply-To: <20260420-spdx3-improvements-v1-0-27e0d5edcdbe@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, peter.marko@siemens.com, 
 ross.burton@arm.com, jpewhacker@gmail.com, olivier.benjamin@bootlin.com, 
 antonin.godard@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 thomas.petazzoni@bootlin.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 07:44:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235542

The class OEDocumentExtension is declared within the sbom30.py file.
There is no need to use its full package path to reference it.
Same for get_element_link_id() function.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 meta/lib/oe/sbom30.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index b386b0f55bd3..9f50821af087 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -279,7 +279,7 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
 
     def is_native(self):
         for e in self.doc.extension:
-            if not isinstance(e, oe.sbom30.OEDocumentExtension):
+            if not isinstance(e, OEDocumentExtension):
                 continue
 
             if e.is_native is not None:
@@ -289,14 +289,14 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
 
     def set_is_native(self, is_native):
         for e in self.doc.extension:
-            if not isinstance(e, oe.sbom30.OEDocumentExtension):
+            if not isinstance(e, OEDocumentExtension):
                 continue
 
             e.is_native = is_native
             return
 
         if is_native:
-            self.doc.extension.append(oe.sbom30.OEDocumentExtension(is_native=True))
+            self.doc.extension.append(OEDocumentExtension(is_native=True))
 
     def add_aliases(self):
         for o in self.foreach_type(oe.spdx30.Element):
@@ -633,7 +633,7 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
         self.new_relationship(
             [spdx_file],
             oe.spdx30.RelationshipType.hasDeclaredLicense,
-            [oe.sbom30.get_element_link_id(lic_alias) for lic_alias in file_licenses],
+            [get_element_link_id(lic_alias) for lic_alias in file_licenses],
         )
         spdx_file.extension.append(OELicenseScannedExtension())
 

-- 
2.53.0


