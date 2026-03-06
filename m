Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E984AF51406
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 14:00:18 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69539.1772805617894774723
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 06:00:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=InpUvH9Q;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4836e3288cdso62820535e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 06:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772805616; x=1773410416; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OSwz6Q0bosfSFNMXUEKBdXHqAunYPQFf0+puT9za7no=;
        b=InpUvH9Q80HdyES1sfRGq6dn6mlmhGNojo2A5meXwjcBBSPIRhDz4J3dzIhJ7lmnhN
         c9Gt9H7uiDbAxaP6pVv1JR9zoRhurGaicZMPaP7+8HWr+SA1G3g4549Y344swhQa7JLZ
         g91Tho5uxJlc9rakLRZ3Rvf1sVjPf2bKpCQpYklqZuBHe0xVIGGVjVArZxvsoE+Ba/Al
         oaS6P39GG3sCpVP3Q3HdJbXAlfwDLAhFkVQX75TrfK4ctkXontoR7uqVVuzTeXQImq/R
         PMfr1ApN1uU2jMKYEB4vHpTAeqVeCv9aMygFd7YiAXDJrEBk6wtzae864/s4VBPjt3ap
         jfLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805616; x=1773410416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OSwz6Q0bosfSFNMXUEKBdXHqAunYPQFf0+puT9za7no=;
        b=QawD2IXdSKjx9KhgfOHKWEbyhfdkrcAiz/uggZ5fkgh6pH8ddXdAZV2owto46PMLqV
         oOgf1wI/FZpAC4epJGwfJUBw9YA9WIRSC4yDDxfv8DWdaYHhg6uu8VhBixEp11w1ZmRf
         8y3gfX1xZ2hepbp3a3b9pdDm2drczwY2gI7lg1MwA3V5dRg5vB0yVh9qZR0GYPTvY41R
         3s8BNtc9/mPE6fADiszb2h+WO6D916D7Fl8HIiRBuipoe8IM0KWqLYkeCAFlTWHvQNTX
         E3s4v6LZnC6R/DGyQ+c5mFtJEb5SaDuyHju+riIiI+glNwr+R1RRb81ZFIuDiLZwrTCz
         2AKg==
X-Gm-Message-State: AOJu0Yyl2DheWzKqYBiwTzczjZvVMVp3NVDsUZO9HCDdAMLlBI06Jimm
	tXwr7PxqJ/guIqiNSQElWXGkBrETxDSuI/7xqpb1+krcrMT/PheWpcXoQ2k4zw==
X-Gm-Gg: ATEYQzwqdS/0cmaDS7gy45nIcqNZdE9yVfhFBdBkmeV6944WH7YmBRjdnefj+ngzzKA
	WZ2RptdcdUr+NNgEw9bFpLTJUoaMYKxCpOZcrX7f4cUzjs0QVL2sMqsjMCE1vN0RBKOdbHoLbTX
	hRmBHidz0zijVTjev5ZbLiMIm36c0dJXvE1Xn0FrD5eGZKUgwyTjxYXwPXelYjK3JsEucyS7n0W
	zQ1KF1DSeLC5DyeFDlzLfR6pg5vdXeUQasv3/tmBiWLrPnmqudngWd5RRTlVS3Fm7EEbI7EvErE
	ThLzmIlhtxJEppS4QRZmZ0I5GV9IOrwqfeF7/lnFm6p7/IwsoeKXj2I1VSYjzAv0Oe6Bdz5EhxZ
	eOo/iHO1vSCVw3C/ZkijFgrGuL7lhgSEwcawQapbzSMTp8zKvRb5YxG43wPa8r/IdpJ4nlckKD4
	/siiJAFoeoZL1JRJxV3gXcOQ7Rsy2LhHRHkcIHGW06UAaEgsfz/cyg
X-Received: by 2002:a05:600c:64c7:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-4852671d9c3mr32266265e9.8.1772805615646;
        Fri, 06 Mar 2026 06:00:15 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb4257csm187098845e9.15.2026.03.06.06.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:00:14 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com,
	joshua.watt@garmin.com,
	ross.burton@arm.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Subject: [OE-core][PATCH v7 09/10] cve_check: Escape special characters in CPE 2.3 formatted strings
Date: Fri,  6 Mar 2026 15:00:01 +0100
Message-ID: <fdb53e8be6a3d57a67979648cd8f6c8f4a65466f.1772805096.git.stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772805096.git.stefano.tondo.ext@siemens.com>
References: <cover.1772805096.git.stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 14:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232575

CPE 2.3 formatted string binding (cpe:2.3:...) requires backslash escaping
for special meta-characters according to NISTIR 7695. Characters like '++'
and ':' in product names must be properly escaped to pass SBOM validation.

The CPE 2.3 specification defines two bindings:
- URI binding (cpe:/...) uses percent-encoding
- Formatted string binding (cpe:2.3:...) uses backslash escaping

This patch implements the formatted string binding properly by escaping
only the required meta-characters with backslash:
- Backslash (\) -> \\
- Question mark (?) -> \?
- Asterisk (*) -> \*
- Colon (:) -> \:
- Plus (+) -> \+ (required by some SBOM validators)

All other characters including -, etc. are kept as-is without encoding.

Example CPE identifiers:
- cpe:2.3:*:*:crow:1.0+x:*:*:*:*:*:*:*
- cpe:2.3:*:*:sdbus-c++:2.2.1:*:*:*:*:*:*:*

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oe/cve_check.py | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index ae194f27cf..fa210e2037 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -205,6 +205,34 @@ def get_patched_cves(d):
     return patched_cves
 
 
+def cpe_escape(value):
+    r"""
+    Escape special characters for CPE 2.3 formatted string binding.
+
+    CPE 2.3 formatted string binding (cpe:2.3:...) uses backslash escaping
+    for special meta-characters, NOT percent-encoding. Percent-encoding is
+    only used in the URI binding (cpe:/...).
+
+    According to NISTIR 7695, these characters need escaping:
+    - Backslash (\) -> \\
+    - Question mark (?) -> \?
+    - Asterisk (*) -> \*
+    - Colon (:) -> \:
+    - Plus (+) -> \+ (required by some SBOM validators)
+    """
+    if not value:
+        return value
+
+    # Escape special meta-characters for CPE 2.3 formatted string binding
+    # Order matters: escape backslash first to avoid double-escaping
+    result = value.replace('\\', '\\\\')
+    result = result.replace('?', '\\?')
+    result = result.replace('*', '\\*')
+    result = result.replace(':', '\\:')
+    result = result.replace('+', '\\+')
+
+    return result
+
 def get_cpe_ids(cve_product, version):
     """
     Get list of CPE identifiers for the given product and version
@@ -221,7 +249,14 @@ def get_cpe_ids(cve_product, version):
         else:
             vendor = "*"
 
-        cpe_id = 'cpe:2.3:*:{}:{}:{}:*:*:*:*:*:*:*'.format(vendor, product, version)
+        # Encode special characters per CPE 2.3 specification
+        encoded_vendor = cpe_escape(vendor) if vendor != "*" else vendor
+        encoded_product = cpe_escape(product)
+        encoded_version = cpe_escape(version)
+
+        cpe_id = 'cpe:2.3:*:{}:{}:{}:*:*:*:*:*:*:*'.format(
+            encoded_vendor, encoded_product, encoded_version
+        )
         cpe_ids.append(cpe_id)
 
     return cpe_ids
-- 
2.53.0


