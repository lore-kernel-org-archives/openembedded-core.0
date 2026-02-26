Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51903FCE064
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 12:19:10 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68805.1772108341005383236
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 04:19:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kyjUcVch;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48336a6e932so4731615e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 04:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772108338; x=1772713138; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GtFFnUFc4RlPHdJF36FYDPqXrJtSd99HmxT6JrOHwk=;
        b=kyjUcVcha3mdglPigodyF2aUi+FlwHP1X+7RHYQFsn894HJcRZn21xDIJI/G2LZrJM
         R3iFjibTQsULKQDBFDqrOue/G2uCfEw46m/HSvLFscdECV2Ibg4y+j+18yv0Y5D9uKjB
         2kxlnWl0V3lF6Lj2jaWCdA2fu6MEOIUpB9UM5TvRqm6UoNBVL56hiYDyCtG7pFRSl4gb
         76L26NKPNeBa90nZwnre3Y8YsWuukqGSBzJceN3JqUy2WNT2+GYO2G6fbjwgQ81VvNnX
         J0s/ZSY4pDXnFaR51INGm82aTfbNwkx/ubF/odxG/gOn3ZLgOYkBXL7qs1OIJDsFLWar
         4bdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772108338; x=1772713138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2GtFFnUFc4RlPHdJF36FYDPqXrJtSd99HmxT6JrOHwk=;
        b=dx56XIzkg65nT3l71dgaNQqjfDMoiBZKDr+LivbYXuqnT1/MwAB066Vfsod1eJjN3U
         FF6+efcGvbzGKqUtUohkmz4+1fWewKT2X/0LY02bMxlZjahkn23yuV3rULY1WsHHkFj9
         Wk8974JvoDBbYIizTv/Rk0qIY0AFKp2D44xIa7ede4Kjbd6Al+RQs/yHNwJldraVzvAb
         YquTwUyOooq9uq8aPUaNXkdF+rVe+//WHKys5yGdTChlv0E9ZXRbM4jn/VXiRBON5MtR
         vvMkxKelApPpvVHd9pmtdEOjpviIwpgO6+iqae7uXP1c6Es+yNYQcLuPX9m0w25+o6JQ
         BEdg==
X-Gm-Message-State: AOJu0YzF6zkgTgQnELmn0DTcgUscqURSmWMi/q6/ccph+73WcJzMlN1e
	N0JuMIQ6ZmRrjfSYol90EA6XN2hzsN4QTtyDQW1nyoBb2PBilQjH0JvSnFwLIw==
X-Gm-Gg: ATEYQzwIRjG0zK/07nqfrpRj1NnGKRA4Jp1a3wjqWWMv7VCnfkVqPiUrgKNGqEuswjJ
	TlidKxbPNxQq9el3Qb3hobYWPK2eeNmGF0mvDFKFrqBWWAdr3f2AE84VZParT5eacjxwO7mxg10
	EaxPZ3Od2Kk1nspsy+nBrQRpY4zJDT55R2DGAqzjxl5cqf1QCfxLAyUEGe+6WZRd2HBAQDs+OgZ
	W087ugyfUbkjjhRgf6VpuRyYhFyHuJxaHnZ+RJL6mjyWw3/jwcHhmZ0GqHjcl080x/NpwmMdG3f
	XZFDfY8LJPDtc2DULWbclw89760La0+w8kCJeMOPv9F8NbKLjZNlL8raPzlM2yczo0PLiVM/GD2
	jaAI8Z9C/2VpRjDaitnpyoXRnHq6Jv7O9xEtPdBEvdjO3VaBxqriKmGYHByMqhJ4aIyRIoO4XR+
	Caq2jQEQ==
X-Received: by 2002:a05:600c:450a:b0:477:5cc6:7e44 with SMTP id 5b1f17b1804b1-483c2171795mr61449485e9.11.1772108338371;
        Thu, 26 Feb 2026 04:18:58 -0800 (PST)
Received: from fedora ([165.225.94.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb77466sm48483955e9.5.2026.02.26.04.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 04:18:56 -0800 (PST)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	jpewhacker@gmail.com,
	mathieu@bootlin.com,
	Ross.Burton@arm.com
Subject: [PATCH v4 10/11] cve_check: Escape special characters in CPE 2.3 formatted strings
Date: Thu, 26 Feb 2026 13:18:22 +0100
Message-ID: <20260226121823.149327-11-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226121823.149327-1-stondo@gmail.com>
References: <20260226121823.149327-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 12:19:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232015

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

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


