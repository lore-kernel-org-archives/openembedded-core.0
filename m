Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC8771091914
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 16:50:05 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17749.1774025401700724751
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 09:50:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gzyEx2iy;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso7752125e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 09:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774025399; x=1774630199; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2ST2hgit7R7JDdz4yfdMgwx/zS66swVCh9Bow1twfw=;
        b=gzyEx2iyMAM+63rKtAmCDauoa5u5u4cy2pH/SsibqtSKspC1TGISYRX6db5ikJEe+b
         +HnLddOtsV8nJn1MvEf5iHGPTgZgKXeV4us4XVlxX/7q6Ofs4lz7mm/OCloqd1dACpEs
         2PUrIUHQQxtJVgBLbwUDkZvqQRGqH3lv8SNKtODdV9NSqu+o+GIpxD810iM7RCrEMscn
         8yIiTZelv3VRpzI2HeaIIFcYhpDfwOmqKVAlALxSS9+ZQCaLAhj4iqANyiqiNJ7FnvQE
         ZYcKnhqyPpYzd2s+B4jtYNOHGhtJ5znxqSi+PSjbHy21jHEh8Wg6FlxoYFA3Xku8Wg9C
         38hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774025399; x=1774630199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F2ST2hgit7R7JDdz4yfdMgwx/zS66swVCh9Bow1twfw=;
        b=eKKu0WSQ6FdrhUgIf6VYfYzQbIlcPmATn/P157g7WM5voMGTqFltc6ODWV3wgX6h5T
         kDYJXsFn212ECbBIY5MVc1BZxHxo1TwXXxxXS08RVk17EefHww+60jxphojEvUXkTszO
         YtOW3A03raY8yQgP1CqnkbTNMWTJG19vVDWUHlMYNAPBEWyTm18ZgohruEKGLQXrON2w
         +xGrQi6ezlcCKA4aZU3YstUKAtqN6VcTT2BZk7IoP65TCjhvl/039RzmAQzai7MNF2IW
         3KCs5J/pTGzA+X2zcHbq1N6FApFkSXdzln3dqghYbDjpGqWEVOL375L4TWCkCotFEF7Q
         suvA==
X-Gm-Message-State: AOJu0YxPUD95VcSy4Ym5cokT22yXMfHd+QNPzK4IPhyBoYiGucyzqJGU
	2f+w3LD2Z3ZRbPOvyRUQO1g7BkhEFwfhjqwhTjDDC8BedR+cJ1n1MrfDXEALytEB
X-Gm-Gg: ATEYQzzT70zaszKDZm8uQ+XBhlp677HkBqdgG9nYJb09yoDF8SgBBbAsP8UqXol/5CH
	IY9XbOAVi7JE8A8LRaFpevIrYqn0ilQoPrfzdMOiuVUhdLAJhIHN8SVLXOpgkooEfYFZMWs6Lvb
	spifoCAzj68t0zCuQbLZmNkvphR97MxIL0f+RZTMuM9qVtBh3YzZDqsOWYko6TwoMC2AkhdICGk
	cKDYkawF5ANQyUGJFnsJSi9thqEFoPOUOEWo+VBUSSe6JQyhGgrvFdCFZtKVi+72gUtMnhzQPeR
	VeGoPFyX0yWX8mjzmeP4Bagw2aKX3wmMaRMwdAU/2LM1YVQS7NBZ9MYyp/EMZM+RdnNn0GUxAk4
	yy3vzxJgePSEZQIDk5Ezt4kWiqwsh7J4xf4bqbEz36S/7YDRbdySajCItYwzm3lC7RY25ydiyun
	Pt+Oe3T6PFeXrwncImwbDoZ19XSvxiaBlvriw=
X-Received: by 2002:a05:600c:620c:b0:485:3dfc:569 with SMTP id 5b1f17b1804b1-486fee0fa70mr53296585e9.16.1774025399464;
        Fri, 20 Mar 2026 09:49:59 -0700 (PDT)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe6d91fbsm73018905e9.3.2026.03.20.09.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 09:49:58 -0700 (PDT)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	richard.purdie@linuxfoundation.org,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com
Subject: [OE-core][PATCH v10 6/7] cve_check: Escape special characters in CPE 2.3 strings
Date: Fri, 20 Mar 2026 17:49:50 +0100
Message-ID: <20260320164951.128572-7-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320164951.128572-1-stondo@gmail.com>
References: <20260312153845.164369-1-stondo@gmail.com>
 <20260320164951.128572-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 16:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233626

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

CPE 2.3 formatted string binding (cpe:2.3:...) requires
backslash escaping for special meta-characters per NISTIR 7695.
Characters like '++' and ':' in product names must be escaped.

The CPE 2.3 specification defines two bindings:
- URI binding (cpe:/...) uses percent-encoding
- Formatted string (cpe:2.3:...) uses backslash escaping

Escape the required meta-characters with backslash:
- Backslash (\\) -> \\
- Question mark (?) -> \?
- Asterisk (*) -> \*
- Colon (:) -> \:
- Plus (+) -> \+

All other characters are kept as-is without encoding.

Example CPE identifiers:
- cpe:2.3:*:*:crow:1.0\+x:*:*:*:*:*:*:*
- cpe:2.3:*:*:sdbus-c\+\+:2.2.1:*:*:*:*:*:*:*

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/cve_check.py | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index ae194f27cf..6555743514 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -205,6 +205,35 @@ def get_patched_cves(d):
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
+
 def get_cpe_ids(cve_product, version):
     """
     Get list of CPE identifiers for the given product and version
@@ -221,7 +250,14 @@ def get_cpe_ids(cve_product, version):
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


