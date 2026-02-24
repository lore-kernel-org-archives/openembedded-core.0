Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B803DE9B278
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 16:30:24 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24472.1771950619018970357
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 08:30:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mttfpDkB;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-483487335c2so52096155e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 08:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771950617; x=1772555417; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GtFFnUFc4RlPHdJF36FYDPqXrJtSd99HmxT6JrOHwk=;
        b=mttfpDkBjBbU3qSwZKwb/EN35w1awqBMAAG7e4MEalEU6W3RXyKh9YiVNRv4u5VXtu
         LShHn4MMMK8QA4KMjs58PsK2TI+4SeWOi+8BgIk2MrpnmlZn/AJ94YrKJ3wLpAxj2nik
         aXQH+N7A5rObL04p4JgN14BBMWdZQdh5lgcwAnU19OC/7gTanfJUTHccGOIsuN23P36G
         bPBATqoZbu0YQtrlzXArKeX8eQE19pnbciwzFv9dI9DmU3vohFcU/3awTqwdxeDUFCvx
         GYH5GycwpHCB+5IOuXZCAK69+SLeqhxnR9L61inlP0AbGOdug9113hOhh8D7SL7ZYjbP
         zjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771950617; x=1772555417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2GtFFnUFc4RlPHdJF36FYDPqXrJtSd99HmxT6JrOHwk=;
        b=hKK298KZfyjlCoTDz980oLLOmK+PF0nN7s2uVlC2YbTApYAKJHCVf6J65UyTOBGSZ4
         XkhpJebiTRFD8S8WZfZDQQFo9YQ0fflg+SspMRVwwi8gsMGdKCCA8XECWOzdvylaRJc1
         Q/8mKsOE8kYTbNDfKVo5Q4RWQaX895lQBLAvDTljyRFe9osX0c85dMMbGXSR4r5jnN9h
         GCQ6TUnFwy9nhKHOyJvtmTrDAx4LYH+Q9VA5uViaXgvmifBIi6wTfW2pjaCLA9wgO8yM
         2PNfv/4gHY4AFzoUoos0e4JNrHpYzgSQkqUUrV5J5xcJ3l1FDRv1vfY62WSaay1YqTqT
         5DMw==
X-Gm-Message-State: AOJu0YzcvPPACcAmFpL/xJcIANAJm+Ar20Wgptqmnox7sWdnOwEUaMV9
	wtQu1lviYViMJS1H1eDQBGw3UyAXlsFoESf3prQZnHdiB4vjPRp1Pe1nkoO1KA==
X-Gm-Gg: AZuq6aJRd2tNNK1JDU9oxMqgvhPtDhkmjh+w8aDO947uf1cc4htbkzJ8XL5v2CvNiGk
	fFpcM0LKcP5ZtxH8PspNo8O3RxNVvTPNhzTvJdcBR/o41InhsWkmWrSSS+tdygRN4MyGGK7F+QS
	ADuTCn47t1EZkKeTQkoxYWqGjdEICMr+pms4jA8XHlDxmJUVJpPSkb7OT+uOWJpb2J8rH4PUFst
	LuLurG9NH4qnLTQHIJEVT3xba/pe7xtJU8nYytB8Ryr3YocYTMNP2VhAPrzUTWlTGBr7jYz1kqa
	1fQiPD21niwCLxnnnaj7hZqm/7WYFEw/gAJODNQIKBxqeaHW+qg0vPZb5S5THxpxVzIJ2pUaJbr
	Rw94p4cjEJYohis35jNW2RjOWQaZHqs2TG+3eFyT+pvc4QNVBzheH5JdOzfx45TdBN2lg3X471g
	Ut5O1yFIjCFjUTgTC7h81YQZZVqzzXAZJEdRFoGPhzN3YskNEHNJFZ4WC7hf/UsEeDeL6SvXysm
	f1yCH4PgB8gNC/kPpY=
X-Received: by 2002:a05:600c:45ce:b0:483:a895:9d85 with SMTP id 5b1f17b1804b1-483a95b3e18mr231767185e9.2.1771950616597;
        Tue, 24 Feb 2026 08:30:16 -0800 (PST)
Received: from fedora (mob-194-230-144-218.cgn.sunrise.net. [194.230.144.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd6f3124sm9716355e9.1.2026.02.24.08.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 08:30:15 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com,
	mathieu.dubois-briand@bootlin.com
Subject: [PATCH v3 10/11] cve_check: Escape special characters in CPE 2.3 formatted strings
Date: Tue, 24 Feb 2026 17:29:45 +0100
Message-ID: <20260224162946.4000445-11-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224162946.4000445-1-stondo@gmail.com>
References: <20260224162946.4000445-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 16:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231887

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


