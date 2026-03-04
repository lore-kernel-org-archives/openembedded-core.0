Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 310BEEDEC1D
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 17:06:08 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23525.1772643964293959138
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 09:06:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kFe/wNvB;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48379a42f76so59561315e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 09:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772643962; x=1773248762; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OSwz6Q0bosfSFNMXUEKBdXHqAunYPQFf0+puT9za7no=;
        b=kFe/wNvBFRknBnWXwfZObkhRHxYp7m9IIUIlCoevwvUd6Lh2Awp6SpQ+3nMUSqUYyd
         465ZSxewtFVAT18sCnjXuSnX95ddLyLqCjprpaXhBjIS5NJ2PRSA6Jbsn3tPik1cgYem
         2AUN3hPX32b45ZjeEiW00A7/KGwQO9LWmWBKL3tgUBRftXH1fCSm23VuUtUD01kGIuae
         ygMm1PZlElOMsGV9j94CxHdXqP4P1TzyfzFQx5fEP5FS9uWJT2QVtwlk2sH80RlboiMa
         iJXNr9jjziR+Pat6927K+FFJ7PwLNRz/C/pdKXcka32uL696kMsToaCy1cU4wv50Z/mI
         /4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772643962; x=1773248762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OSwz6Q0bosfSFNMXUEKBdXHqAunYPQFf0+puT9za7no=;
        b=ejaixdWP1/FpwYbDes9ZbjvGdY6ua1FrSvA531wn6zcz5oCu9j+rmbMUxWa9ceya8f
         3kZPgPL4faji19hfwAhsbw4nh2bfNPPHtGxtNAn3sT2O10gxiGaU7h+ytDswXxQ9i02Z
         cN/xs77UhiCA9xTmZKwrnQppDdlpW2S37LueiHNv5AuBj7X+TPTSu93oKN9+GeRAc65L
         4Ul6g6NDoBdn2JFLMUS7NyPWw+zc+7P6HAZcOWKBiztwThfAg6ZcBnUpzhLPA2ds6a1k
         NdyPAY6Ua8N+5+6apmp0Mlp1uOpmV39a8AIe+IxGCAjdQvkqw+lhidKqZwEibhRzyncw
         XJiQ==
X-Gm-Message-State: AOJu0YzDw9fwzqDkaROXV/ku0r7P/FtKtGppUeR6tG7H1XYM2BqzgY9m
	0fHMSxg7ICZsCPp1oYmV7I369bZcE1oq2VGJzsE50exB8I4w9xB/nCQ+nlsg+Q==
X-Gm-Gg: ATEYQzxokFepRbu0oc9MX63OIG2erBr7JltmObEKiV0zEP3Gu6/wrwylp175lXhnOwr
	RueGSj+tdor26LjiOPJb67QNDxNkDJj0iY/wrFd8aJp38Cs6SzKMKSsHrt6atYNYi/JgKvLrnIZ
	p21jExvOokcqWzL2Er6f4HsYufM2NTcFNiQIIkNRornpiDuQhGkQZDxdeJX+J5dPXLV/ohMOAVE
	BlYC4cuRjslimP5LJlD/LN5o5qFoUyfeWEbnVI+89STNZgXcb+YHFL1DE6CZ3ClOTq8yG8fv5zb
	MIS+v5gtEWemds/LW8GbRApPIMvV50iNUaoekg7FRlUg1ObErdsjTWi1GkKnlruf7zIo45ixBmM
	2cReFju/huIqNOAUYGgcB+HttAptmI1V3cSt+8UfE+ha6PBhpJRrTTfkWR906yo9aT0+N7Y3fk2
	hY7q4evdN00FHiNwrPfACaCSw=
X-Received: by 2002:a05:600c:6091:b0:477:561f:6fc8 with SMTP id 5b1f17b1804b1-48519837bb1mr49311905e9.5.1772643962226;
        Wed, 04 Mar 2026 09:06:02 -0800 (PST)
Received: from fedora ([165.225.94.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485188914ddsm78557395e9.12.2026.03.04.09.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:05:59 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	jpewhacker@gmail.com,
	mathieu.dubois-briand@bootlin.com
Subject: [PATCH v6 09/10] cve_check: Escape special characters in CPE 2.3 formatted strings
Date: Wed,  4 Mar 2026 18:05:40 +0100
Message-ID: <20260304170541.180868-10-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304170541.180868-1-stefano.tondo.ext@siemens.com>
References: <20260302160114.46884-1-stefano.tondo.ext@siemens.com>
 <20260304170541.180868-1-stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 17:06:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232412

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


