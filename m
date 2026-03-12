Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A438A106705E
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 15:39:03 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24811.1773329939135434886
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 08:38:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O0Nzflas;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439c5b40f60so1071540f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 08:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773329937; x=1773934737; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2ST2hgit7R7JDdz4yfdMgwx/zS66swVCh9Bow1twfw=;
        b=O0NzflasT8k8A20ZZ+jzVuURrUceYKoNjPV/wOKsxojCyhhXULmc/rKIcAGQ+22b8h
         QEJTaKJtmaxVnot1VIf2yCKWfX8AHpM7+Nwlv+4T3+1QZ2Wbd1NMjttyGjjViwunp0q6
         G2srOZx+vyuAusZIIoTsReS0FF0DDOndjyuXuaRwsDMdBgf5bUN1hEH7FfvAgfEgEx+Y
         obnLkiUx4OE2zWRnOcg9Ljb4hfNvoqiUrfbjMGOgDYUmw9zXJj4ztqFyNVf1kna0wVrH
         HjTF2VhO3Hyj2x3u+VnEZLCwkKvdXRJWMF901cC3CzFPgBAA+BtI0lnPVJTleTuhVIm+
         6jfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773329937; x=1773934737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F2ST2hgit7R7JDdz4yfdMgwx/zS66swVCh9Bow1twfw=;
        b=N1e+yXqCt+kVQZahEcHpM0+AkrOi9503uvpCFU0YV7e4VWf8IbmU2sp0YePESkJmzE
         2T4wNYzIOINOnqy7G8tsRM7GDCmpziNJ+npwfYGzjLgIAhaq7aeeWrhFZVHvQ3jU/slq
         vWRYcUvORrLz+5DjSrze4ZljW3cNpVXyIy31nuIA9GPECUrXIceIRH6Zxxmc+Vc5DUiw
         KQY6v9/ioB9zrUrmsIvWvuQtzFtYJV9pclnqGwS2d0LKC+hCjGpGLpcZTeGVz04BIKux
         v67kBVcEorvH45ElnJBtCqNvnduFiI7A4P5xuTdnwitMNe50zLxp4ZKp+C+ybudWL++u
         3JhA==
X-Gm-Message-State: AOJu0Ywt8rvqUfYKLjXFMohuIerAS4XkRs+IRI6Soz/x9xrT2vBbo3N9
	a5oRXKrItm4wSqAI9zS6FzuGi3ZUJiNDwlARxvvU7rpLa7LS0Q0XRjlmJqjQLg==
X-Gm-Gg: ATEYQzzHd0HpOkoEbOlkBnEFsP/LBxfl7oqOhhx7x5lg1Uf/aa4/yIezCKYfIe3c1UV
	Y60hFi5Sp6z1otLHAPdhQfuhiRqw8q9NdHVM2UDvvM3MmQFMM4zcYlE6rYpwCDQ9xjWbmyPDolQ
	Q4IDlkp/HI23Vb712kDcFk8w/3LDYCpUxLZmthKVQWuD/mZuCx7wwXoldST99/7OxovIpKI8lbb
	W8qZfyjHBKFUpigFYfGGuw4tfyaIn88zT8LaA9jND9g55rssMn1FmkduxwnZWcrcZscecmEVFX0
	MLS9alkqvN/BM9w7Bo1ToTc+NlfmxdfGDoTbpflrVwjGnl2BKEDAT7o7zMuXdO6BHa/tRFL3JPf
	ihbUcMkWgTi/I3sNFOiaXZFdY7KOk3DxFqNQVfqL47TqVXFe7auQhZx1rKfRbcG1C2rTGcGmNdB
	+bzA4x9oj6UYjr2p9fYE7OHcy3c7OJh0kxY5k=
X-Received: by 2002:a05:600c:3106:b0:485:39d1:b500 with SMTP id 5b1f17b1804b1-4854b10576cmr141380595e9.16.1773329936769;
        Thu, 12 Mar 2026 08:38:56 -0700 (PDT)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0dcf2asm74857385e9.8.2026.03.12.08.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:38:55 -0700 (PDT)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Subject: [OE-core][PATCH v9 6/7] cve_check: Escape special characters in CPE 2.3 strings
Date: Thu, 12 Mar 2026 16:38:44 +0100
Message-ID: <20260312153845.164369-7-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312153845.164369-1-stondo@gmail.com>
References: <20260309132854.128375-1-stondo@gmail.com>
 <20260312153845.164369-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 15:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232979

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


