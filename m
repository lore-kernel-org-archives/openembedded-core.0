Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D753D6ACF5
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 12:02:04 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40354.1766059318292912792
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 04:01:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bYnRM8yf;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42fbc544b09so347873f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 04:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766059316; x=1766664116; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FM0pUGHTGEro1bZv+GGoowv+0wFfyCHHqDZ1u9GaHJU=;
        b=bYnRM8yf7kt2ftuun/J86a07JZ4Wzd/34TbaF0jZFUnN0V1bdiVGp6yCJGQ0qAOMks
         jM8OPNkeC0dxPRDOjD7l4g0VC7qqqFo4a8psZcmQ/SQ1+/xqqs049QAyxGidwKM0d6Bk
         VjFczSSsISG4J00QbpaPhQHgeGYo602i24Gm+4ozs5kzc6e8yQOisrbfcraMUNOzIyhB
         q/Mprsm9YcDM9UBKo+i8bXJHD83lAWdM0zSkghcnxo4lvLxy8z4HI8rotNcc2LUV2A1M
         0T7TW6I5bW+gF21A0IC2BhmmEfRZC8sq3TsaAErSDEI8VfuxBUfx+8hFszEepWs8w4Oq
         mtCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766059316; x=1766664116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FM0pUGHTGEro1bZv+GGoowv+0wFfyCHHqDZ1u9GaHJU=;
        b=XC8lSL1AoMwfq0yAS1sGk1Y+aNjdb5W9zOVp8o67yAOvpd36+nCM4XhaJZqY2aCes9
         Y8+aqjJbZchfQFXTlw/xkDQ0tK/uLU7iO0Zg79Sjugwh+sAz49wGL9OfxQJsTl99NAsN
         czE8te3/SSfvYCBXYKTuaUnYr4sZAGjB+8YDhgZif1Ji/D1NTT4ZasHhnzzxblHOpVJW
         YO3KKg0FYCO4DK0FYMmA9TQNNQ/+RQKA5w60JqSYKq/qeq2l34KtIU4dKoDgYYYhZob9
         quLATHkiCP8uaycNNhbikNVLzBJ2VuirO6YqocrZ0DPILkhfGtOBlPZWJ2nprAnBv453
         zXQw==
X-Gm-Message-State: AOJu0YzAAe9vsS1vyFqhYtI5SLeRWmLUk0Qco/za1KuQBBa+yi1JDaem
	wtUp/JDIe8SFO352+K0cXdMlHt3ZVgTZLoGN0PyGqYJFqcS5P2DyJz/hPVvusQ==
X-Gm-Gg: AY/fxX6rCdl9wR2LBH9Mxb5FSDVk0eNcf8lvxSrxJ4cKSzeWii20FiMTvlmn5qudBjD
	9a4+dKhL959fXWo7/ip2FVM7JlZ7BXy/yN45UliJ0k23xW7hEFjxaQt7IV6WSQwBw2WWaoDC9iH
	aiKGfVU4t582xKv9bs6kOJjUE5HNZ5V7IathHxZl15FrYlo/EuS5EcU6bromQ/ri2m5jQNR4OHz
	9Fi+rW4UhCo3wQFxCNKW+hAuvnpA/4lT4AAPzGpv4SCaHThv9MuivvsYiOGThENqjEh/Rm7wOQz
	6GAQG1FBDBAuYM9vzCCoFCk0Yb4El595FbmcvHBlOT5zHolB7Wb1ho9/bi7AuX2vE3kjhqatjPB
	r7gjcp8wUQ4wT2m+QX0R3TLN03zPh4Umi7dJiU6wtGvznD5yGAMVAi700isLBLu6E3V49Q8M9UE
	VzEoKWsoaWPSlHrpnfcpkzoAk=
X-Google-Smtp-Source: AGHT+IEHi2wKdXFMphzfDlZCnyGo8Ac2BfwhgTo6Y6+9tPabizOocai9omE/GNaKVDWzrMPSAB8o5A==
X-Received: by 2002:a5d:5e01:0:b0:431:3a5:d9c1 with SMTP id ffacd0b85a97d-43103a5db47mr9662176f8f.30.1766059315978;
        Thu, 18 Dec 2025 04:01:55 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-43244949ba6sm4684850f8f.19.2025.12.18.04.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 04:01:55 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com
Subject: [OE-core 2/2] spdx30_tasks: Add concluded license support with SPDX_CONCLUDED_LICENSE
Date: Thu, 18 Dec 2025 13:01:39 +0100
Message-ID: <20251218120139.104155-3-stondo@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218120139.104155-1-stondo@gmail.com>
References: <20251218120139.104155-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 12:02:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228119

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Add hasConcludedLicense relationship to SBOM packages with support for
manual license conclusion override via SPDX_CONCLUDED_LICENSE variable.

The concluded license represents the license determination after manual
or external license analysis. This should be set manually in recipes or
layers when:

1. Manual license review identifies differences from the declared LICENSE
2. External license scanning tools detect additional license information
3. Legal review concludes a different license applies

By default, concluded license equals declared license (indicating no
separate license analysis was performed). When differences are found,
users should:

1. Preferably: Correct the LICENSE field in the recipe and contribute
   the fix upstream to OpenEmbedded
2. Alternatively: Set SPDX_CONCLUDED_LICENSE locally in your layer when
   upstream contribution is not immediately possible or when the license
   conclusion is environment-specific

This variable allows tracking license analysis results in the SBOM while
maintaining the recipe LICENSE field for build system compatibility.

The variable is initialized in spdx-common.bbclass with comprehensive
documentation explaining its purpose, usage guidelines, and examples.

Example usage in recipe or layer:
  SPDX_CONCLUDED_LICENSE = "MIT & Apache-2.0"

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/classes/spdx-common.bbclass | 13 +++++++++++++
 meta/lib/oe/spdx30_tasks.py      | 21 +++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index ca0416d1c7..3ca4c70cc0 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -36,6 +36,19 @@ SPDX_LICENSES ??= "${COREBASE}/meta/files/spdx-licenses.json"
 
 SPDX_CUSTOM_ANNOTATION_VARS ??= ""
 
+SPDX_CONCLUDED_LICENSE ??= ""
+SPDX_CONCLUDED_LICENSE[doc] = "The license concluded by manual or external \
+    license analysis. This should only be set when license analysis (manual review \
+    or external scanning tools) identifies differences from the declared LICENSE. \
+    When unset or empty, the concluded license defaults to the declared license, \
+    indicating no separate analysis was performed. When differences are found, the \
+    preferred approach is to correct the LICENSE field in the recipe and contribute \
+    the fix upstream to OpenEmbedded. Use this variable locally only when upstream \
+    contribution is not immediately possible or when the license conclusion is \
+    environment-specific. This allows tracking license analysis results in SBOM \
+    while maintaining recipe LICENSE field for build compatibility. \
+    Example: SPDX_CONCLUDED_LICENSE = 'MIT & Apache-2.0'"
+
 SPDX_MULTILIB_SSTATE_ARCHS ??= "${SSTATE_ARCHS}"
 
 python () {
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 286a08ed9b..84d70f6f72 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -712,6 +712,27 @@ def create_spdx(d):
                 oe.spdx30.RelationshipType.hasDeclaredLicense,
                 [oe.sbom30.get_element_link_id(package_spdx_license)],
             )
+            
+            # Add concluded license relationship
+            # Use SPDX_CONCLUDED_LICENSE if set, otherwise default to declared license
+            concluded_license_str = d.getVar("SPDX_CONCLUDED_LICENSE")
+            if concluded_license_str:
+                # Use explicitly set concluded license
+                if concluded_license_str != package_license and concluded_license_str != d.getVar("LICENSE"):
+                    concluded_spdx_license = add_license_expression(
+                        d, build_objset, concluded_license_str, license_data
+                    )
+                else:
+                    concluded_spdx_license = package_spdx_license
+            else:
+                # Default: concluded = declared (no analysis performed)
+                concluded_spdx_license = package_spdx_license
+            
+            pkg_objset.new_relationship(
+                [spdx_package],
+                oe.spdx30.RelationshipType.hasConcludedLicense,
+                [oe.sbom30.get_element_link_id(concluded_spdx_license)],
+            )
 
             # NOTE: CVE Elements live in the recipe collection
             all_cves = set()
-- 
2.52.0


