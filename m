Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBD9DF3C25E
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 13:29:26 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14255.1773062963048979325
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 06:29:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h3NIlM1L;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: stondo@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7982c3b7dfcso116516217b3.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 06:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773062962; x=1773667762; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6CigqNrWZDm8nD29vgAcTpWDDoEJtFRn37uUgr+KqQE=;
        b=h3NIlM1LpTZgnyK0R2nKP7XAJZ9IWjYFMlVCr9Ei3+UOEZRsclD8MGPkQILJSa5u9j
         umKovhFclQy4ORJtF+LlF1Wrzq2ecacchhJC9B1h5ua3CTIh913X3UmMXr3/7T7z7imI
         a1Qd7a5utAet95V4JBJfRIqrVNlDyyk0qNDpNc3Lb652IAKWV9gdRnCX3LOuBz/eJL7F
         Lstv56pRAcDQfOrXYrNgEGiHgHG0oN+Z0KeFwBiyT4n77OACv/NzkJZdjg81IKdGdSfx
         9I0u++rRzqWT/0X1VIRvtitCLd8gy2yrZUyfu29xM/C5oN5yO9fQ8TJCZhmWUsHigv/F
         Dg1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773062962; x=1773667762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6CigqNrWZDm8nD29vgAcTpWDDoEJtFRn37uUgr+KqQE=;
        b=duKh+Dyjk5lYrcgZzqFX3RFo5J+GTKBb+of1GhwB4ijplUBC0cb+iKgQWLWyUKCXzi
         kCGGT+zi8nqUEbjpofN8+qmDYZ1jI+K2LXlUE+q0jyzMQaf59hwitHYF3/WWohGSxXPT
         +TOhosvm3S7Dy5GvUBp8dU5t67wuk8up7a8toHkYXJTfMIUMdCNxNkjE2qlsQMZLf200
         eM7Nav3nFprINBkZaJXfs4dHrQOiQmPvO7uY+sqMpuWm5rKCS/aEhDrgMgdMV1dkVgzG
         LChkrLuRyrbz/jlbh/hHn7IzUTIneZ7FUkSBNoxivh8d+weGeZLYqDsWbYHMBmfgbGCN
         mrVA==
X-Gm-Message-State: AOJu0YzDJtN6VHbT4kKoR3crUiSStHvk9lHm6cDIwJGYZAM3XG08Ej8E
	2u70yaDwgOyG5ww2tgh7alKGDnqYCKt05rAyoVXG/aEeNwXML9L7vUaxiLsMLw==
X-Gm-Gg: ATEYQzzG59fH0+H/AkVGXVZV1B1UHzR+BACgUDyWNSTUxIFPLhmrewxwn9U2vzTIv4W
	m2fGZnRRZUnbUQ0nvhUjWTUAC8EoLoqjR3sa9/77M9c5AqfBcRGoNA/MRW9HiTWHXERDTl494Qv
	IPiFhbC7qpYlCErBSBA9WaQCoinP0ZrJGwp8GwOHUW1YZTezx5SJ1fdyj/j86wMROfyACgWBPu5
	c/OVlzKRTw6n7FCJq/E4O6eCVVVcg39BCNMJJE378+PGPyKjPyRReG1FFZZsbnq/M1OSjehDojv
	VDOCsDf5x3sGpxFvtTAQMcZRroeeWNmJ/AgcJiqpQbEaBRYRKPeqtYXW80V2POrvply6B2NJRAj
	JbATyfgxtwtu5URlc1LWeGCxzhYO/FouWCrVGTiibA+hGk9+CR9dGqrQTZQh+MbtSMsbz5bBoId
	06tl9u3fQnZ5uZyWRWR33bUSIKp6XRxyiYy2dIIj0KZDHwmqbyKrRSRbBk+iuLYCxlDKnF+qQg+
	dclst9SxsbgMRtg92c=
X-Received: by 2002:a05:690c:4c02:b0:798:99ae:765 with SMTP id 00721157ae682-798dd788971mr102631187b3.46.1773062961972;
        Mon, 09 Mar 2026 06:29:21 -0700 (PDT)
Received: from fedora (mob-194-230-161-149.cgn.sunrise.net. [194.230.161.149])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-798dee6afd5sm44299437b3.45.2026.03.09.06.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 06:29:21 -0700 (PDT)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	mathieu.dubois-briand@bootlin.com
Subject: [OE-core][PATCH v8 6/7] cve_check: Escape special characters in CPE 2.3 strings
Date: Mon,  9 Mar 2026 14:28:53 +0100
Message-ID: <20260309132854.128375-7-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309132854.128375-1-stondo@gmail.com>
References: <cover.1772805096.git.stefano.tondo.ext@siemens.com>
 <20260309132854.128375-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 13:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232715

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

CPE 2.3 formatted string binding (cpe:2.3:...) requires
backslash escaping for special meta-characters per NISTIR 7695.
Characters like '++' and ':' in product names must be escaped.

The CPE 2.3 specification defines two bindings:
- URI binding (cpe:/...) uses percent-encoding
- Formatted string (cpe:2.3:...) uses backslash escaping

Escape the required meta-characters with backslash:
- Backslash (\) -> \\
- Question mark (?) -> \?
- Asterisk (*) -> \*
- Colon (:) -> \:
- Plus (+) -> \+

All other characters are kept as-is without encoding.

Example CPE identifiers:
- cpe:2.3:*:*:crow:1.0\+x:*:*:*:*:*:*:*
- cpe:2.3:*:*:sdbus-c\+\+:2.2.1:*:*:*:*:*:*:*

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
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


