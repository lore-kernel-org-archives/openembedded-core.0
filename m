Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23074C5DF82
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 04:24:43 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14409.1771647881957848800
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 20:24:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k2FEYper;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4836f363d0dso22942185e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 20:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771647880; x=1772252680; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GtFFnUFc4RlPHdJF36FYDPqXrJtSd99HmxT6JrOHwk=;
        b=k2FEYpermFwjaVgXbiALHPpqwp/6AYYLzhIehExI43vNh5sd337fnMEhtFl2p8WT4o
         sXNIHimLGRA/+JL1vfOOxBlNfwGJ7CmBNijYeQbHLYpC1RfMy1JORwrgveYVlPensL8A
         GutVbGf0uLgoby/OACZkQ1iFe5auy86w8/84k/hgHbvnItetVdtENsI1uzcW3bHVfNVo
         hz39/U4SWLUbSmowno9w27bbPJ6M5uJ+U1AZy2leNIjBrVBMZJt3nTp7CzXgl7WZyxhS
         JV4yZgXrqCMY8Dsl3EPw5b7sSI3gAx/6LGyR6D6i5VlHgv1tnfNtT4/pbmtslKU47Z6B
         7btA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771647880; x=1772252680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2GtFFnUFc4RlPHdJF36FYDPqXrJtSd99HmxT6JrOHwk=;
        b=aOuklKd1b3JnU/1hKeZlvgRH8Jww0YMrfstn3yh4TpoZW6kKsxsyxfe3uCkfrBnQXq
         Ie8jrAs70sRZB/weDh3DJVXRBdrDcrmG+/v2RB4suxR41VR+6zkvLFassNnhZaAV1COy
         1xirbrsnUgzABCO7jNLx7WaF7iOuHpPgs/eEZXIh8OmY1Dl2f74EM92qlD7qMLUkbRal
         KnHTkY5zjOdLHRP73dl+XUAdJu+02/Vq+UE7o+DkRrGKqkRtQnQCn4Sd1/qh1kX43LLG
         5CSmB/agMJYXnMuxrVS8Rtwi+CxJkfds8vTPdtyFkoPtrJESU/JXlAfEV3r1BpRH+PQh
         P/Nw==
X-Gm-Message-State: AOJu0Yw1eoHnpZfK6VOQvOljUuxH/JVYAqf7Ox7IoLRufT4sXEjHzrpm
	9KyVsWN7SaiNDAJwfAvqx2oZnb4+J0LOoVZKkO1iajQK3bb2uIE8zjI8uUT+bw==
X-Gm-Gg: AZuq6aKvAyLzDun81jjnqXrCYVFUKvYY6cwIk1W3+recjKelqpRso1jQK9GPkQSKO+X
	e1vvM4lZBgBWAo29tfYvIH8K/GqXeIOaWzCFhebaeI3wTgMJMLWV3ImHlx/TTpNcg12RJhHH/7V
	c3M2FpD6c0lItCmwVDI0eY4SchqXazKDfxxIzPkYJ4DV+CyCGFl35XEOKQzZpmZBZkZTofJWyIP
	JQOtFjJafe4cnAu4rj5FSAi1KUICaWzvIughzcmWnMdxpNX2em6JKdLxpKSOR7gDuDrH7ZmhWXO
	mZsXLWekqJAxMPjCGHqfIY0L6oKBS+2NfOM6BqAG3KtwXBRra2R9PO2mb5x5f4YJvPRW77OJDWB
	To3Df/UNASX0qdAM/ffltxsKf7ld3nxfrNqN4TiDk8fZuZq8tX/5Gdsbkgn5sGPbui7GdPlvD0Z
	v3PfP+Tb0C/owbiFGhAPKQJkIfR/f4pVKNg8s=
X-Received: by 2002:a05:600c:4e4a:b0:483:129e:b573 with SMTP id 5b1f17b1804b1-483a962d1d1mr31721215e9.18.1771647879951;
        Fri, 20 Feb 2026 20:24:39 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31ff4d7sm117340865e9.15.2026.02.20.20.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 20:24:39 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com
Subject: [PATCH 14/14] cve_check: Escape special characters in CPE 2.3 formatted strings
Date: Sat, 21 Feb 2026 05:24:18 +0100
Message-ID: <20260221042418.317535-15-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221042418.317535-1-stondo@gmail.com>
References: <20260221042418.317535-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 04:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231570

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


