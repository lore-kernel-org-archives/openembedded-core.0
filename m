Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC814C61DBD
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 05:10:43 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14948.1771650636388239017
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 21:10:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MINA67XD;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4359228b7c6so2091402f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 21:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771650634; x=1772255434; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GtFFnUFc4RlPHdJF36FYDPqXrJtSd99HmxT6JrOHwk=;
        b=MINA67XD42NeMwVEXx0G9+9fIaw2QFpQtJpxyOmgpT8XvEv6ABplnjcbOvbGFigDyV
         U/xiWp9XZScMIpXoFhHk1GCRPlrHJRNeDNvY8tg+Sfx19c6/3QRbFWG4+WwiM4OqLiex
         a69ZyViwfqT1NRJpUuP2cd7NpuJ37oV68W89JOB5LV77uLDMCfbxYx1/QzPfN4lNPd1x
         21XBYO7P2idlJwsHoNGAxP+tiOj7sziL7Edu4krbNIx296TgFWdVDlK5lL62mruL6/tZ
         gcEqvBmp09MrZQAZEKeK+QkOv1ADrs1LVqDzJJbUTOa+cWWHRf02tiYs7BfnL2vM6IoG
         jHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771650634; x=1772255434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2GtFFnUFc4RlPHdJF36FYDPqXrJtSd99HmxT6JrOHwk=;
        b=GR+fqXkEW20J4xRFPi8sId3+ryJCzI5sKFe6aOjXktNU8ci95k/uJho/ShpfpBUG8d
         vhRRxZsrrB9NjySMhv8n84Y3KVmziVQgRGjfu1721aQewh4zgdPaBmY5OSLtbXz0ZIlH
         xZbnMyNHWb0A0SsLkvCljj3A9PV/GW0Ad8YOu10EECORQ6CBQC3stztIxQrLc8ODv6EK
         XFV5c+C8yPI1aFOk5ZPRZM8k4ebWYl+Qe/azA95BgMrhXAUFe7OjmlmS+420Vq0VJGBe
         6XOlw5xfPKaFdxoML2dSiIHwpgCtysbuVnTB0Niy2azc50lKMIRlkTYpCWbvW/pjxvwI
         LvzA==
X-Gm-Message-State: AOJu0YzLsPIXuCcHgviYjcIE5e7YXOA0P9mT6w9GLZKiAFpngI0qzkXZ
	2Nefz5Hpa30ynhXj/WDinAOY6rxlgvH2hqLmyI7cu2IV5mEpTDd/uPdPjtQdWQ==
X-Gm-Gg: AZuq6aIRuDgjENZiCccsWqSxROFOA2nEcJJC+49KRIqwbPO5yVHARDF7ZiGS2ISt0Jw
	dCR0JDVrXtUZ/tlaLEa5vfzIudC0MLWONCPedsfueb5cI3HETlhysWB7r2MVKS3in4Jj11Mfyle
	qSy+dWf/xYliLrwRMSfdNxdBEoEvxcX9NvAN4zmcMojjdRLfk4zRkQCJs11B50TZFpoEWnhGTkP
	RL8i3Z5qhxuYNoJkO+RBRWYDQRUi+gNQHOsn9Sg1oa5h8airRfHYAYLVf7XsuHXY6l7oXlJEjFK
	F4lwtZFB7qvly5t+pPmbKRReWGg3IAjyWieJpe2uEv5OpEkbBa2KqQjwyNOF9sl8bAdcwqz6Eqc
	CvDdArvVSfs1AE+w0bc0NU4SP9A4oL3D+Ul1lHg0qTa7/kQHV4g8JiDGxCA9+cYUmU12Nv6EaAA
	Z/y4Mx84sXpAmzvBiXsMMVOPYxodRy+zPp2OjsqytdFWKS2A==
X-Received: by 2002:a05:6000:1845:b0:437:6bcd:77f9 with SMTP id ffacd0b85a97d-4396f185382mr3488775f8f.40.1771650634417;
        Fri, 20 Feb 2026 21:10:34 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bfa1bdsm2455901f8f.3.2026.02.20.21.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 21:10:33 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com
Subject: [PATCH v2 14/18] cve_check: Escape special characters in CPE 2.3 formatted strings
Date: Sat, 21 Feb 2026 06:10:02 +0100
Message-ID: <20260221051006.335141-15-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221051006.335141-1-stondo@gmail.com>
References: <20260221051006.335141-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 05:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231594

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


