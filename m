Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 239F1D0D15D
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 18:10:08 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12694.1767809403151071150
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 10:10:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GYGeqARO;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43246af170aso654106f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 10:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767809401; x=1768414201; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+nBYNduXJDDjKfG5ymvNf1Ur5wAuwPezbiujqoYkUY=;
        b=GYGeqAROw3WrxhBALjsWOZFsUk/Kt9pvPsB92EHwp58hdPImWbCERXTJKZ5va8qiT8
         QoHK5DYg1Qa0b+tQ5kXVfgXu4xXr+etts9ZSsjUnA4hGGhbK56D2VvGLSzQMFmNrGk4n
         2hGDUlQsQX6n8h60Cch/y0X51pa67eUF2y0BmdrBrZUlAv3FEhbF8f69YpTQMQ1XPIZx
         CdJbZMo1MSW6wIMJSUOc2WOeeBd3oV5MqgRSYuikzzS2mG4BnIHr1kfP+DOLIjXddmF2
         kjenY4PiM7L4FoyUavCDN0OD5QSeyqfK7l+6Jy7bNcTMTAYp5OKVydktqAMSw2d6MPlL
         k5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767809401; x=1768414201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F+nBYNduXJDDjKfG5ymvNf1Ur5wAuwPezbiujqoYkUY=;
        b=V5G7huokTIKVJUyQNlvqfHbshtxzYkKUHQWMO5ToJuthfAdnHX3jS8it+J+0t6qqry
         7kOXPORoZys7TJ5zsc7V4LYMZxPi8lwrePavv8JQkrnfwcqEXl1pGQdAWpeRhv896ytB
         JtKU4Bt9XDui6Ujkk2yRerhiyHZLBPyGDXN2ovNvDmlMWOhRrG32zwlgI8kRtx5UAWfY
         4YnIgjO8wV1wk8P3ueW64xGJ7WjiKk8FkXib0gSQLd8e5iki8xKFDLSkfOevo+/0aeQ1
         UFyUpaDRq2sK+P0o58hZidRgMUtF9e8LcDG9OEDV6dSk183ZrttiRVq4m+IBJDHX1pDc
         tUNQ==
X-Gm-Message-State: AOJu0YyVkWTH+Jwq++fQT6wQyoMNtilYjyJKB/oi+BBGOs0bFVsFJ99h
	fbW0TF7ci13t81E6gTZ5Ug1QzknXC8DXY6tigk7JYcW2skg0EwsEy/H3FUMagg==
X-Gm-Gg: AY/fxX7ji3XPoakCccIiBvVPcKG738gfWapOBaCOR/9R/Cv9lrYZzmV1CXtRWc2bjio
	phA/VzZ88AFQ5WZJroyFpT0IrhQ7g63/Ofgmstpt5j4zXlnx+dCbVwygkPlFiQtDAHnoMVtSTCy
	XqLREx1f5+GoU6C/gBV64d1OsUHnf36AhuQ6bQHSRI/ULR5o5zza7h3XZhcI6BQxpSiGmJX2Wq5
	/KIXivYCJOi7tB8p1DSOcegOT0/PsiHpBOo0x8PoYV6fhh6tzsXoG11gD5WwiXl+5Q+yyqcu+Co
	ldWC8iCoWZpnBhHwNvMzZythQrXlukY47JWQNQ7b/fdX9DZYjGVNiIYgNJt2AJLsxfILwctZJSO
	x6acoDUdtm59JSMBQvhXpt0yav2JN74Si7x6Kesl76P7UgZtEcxu3/UQi/tyK7+TP77/bPj1cN/
	qfoceRPtTFA3mXIh+dt03FYXg=
X-Google-Smtp-Source: AGHT+IG9AVFlUYU6/QbZzl5cv7XZSOYYuRZTH+uafgKeymtiwSFDwePYDMiJYdPMalzvWlvs9kYqUg==
X-Received: by 2002:a5d:5d11:0:b0:429:d3c9:b8af with SMTP id ffacd0b85a97d-432c3764450mr4390076f8f.25.1767809400910;
        Wed, 07 Jan 2026 10:10:00 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-432bd5df9c5sm11895630f8f.22.2026.01.07.10.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 10:10:00 -0800 (PST)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: stondo@gmail.com,
	stefano.tondo.ext@siemens.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com
Subject: [PATCH 4/4] spdx30_tasks: Add source package PURL support
Date: Wed,  7 Jan 2026 19:09:50 +0100
Message-ID: <20260107180951.140895-4-stondo@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107180951.140895-1-stondo@gmail.com>
References: <20260107180951.140895-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 18:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229023

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

- Move generate_purl() to module level for broader accessibility
  (fixes NameError when called from add_download_files)
- Add PURL generation for source packages with type=source qualifier
- Follows ECMA-427 PURL spec (similar to Maven's classifier=sources)

This allows source packages to be properly identified with PURLs
like pkg:yocto/core/glibc@2.42+git?type=source, distinguishing
them from runtime packages while maintaining compatibility with
the PURL specification.
---
 meta/lib/oe/spdx30_tasks.py | 68 ++++++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 31 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index c685b649b3..95ec4ebafb 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -576,9 +576,14 @@ def add_download_files(d, objset):
             if dep_version:
                 dl.software_packageVersion = dep_version
 
-            # Add PURL if generated
+            # Add PURL if generated for dependencies, otherwise generate recipe PURL for source
             if dep_purl:
                 dl.software_packageUrl = dep_purl
+            elif primary_purpose == oe.spdx30.software_SoftwarePurpose.source:
+                # For the main recipe source, generate PURL with type=source qualifier
+                recipe_purl = generate_purl(d)
+                # Add type=source qualifier to distinguish from runtime packages
+                dl.software_packageUrl = f"{recipe_purl}?type=source"
 
             if fd.method.supports_checksum(fd):
                 # TODO Need something better than hard coding this
@@ -601,6 +606,37 @@ def add_download_files(d, objset):
     return inputs
 
 
+def generate_purl(d, package=None):
+    """
+    Generate Package URL (purl) for a package according to Yocto PURL spec.
+    Format: pkg:yocto/<LAYERNAME>/<BPN>@<PV>
+
+    See: https://github.com/package-url/purl-spec/pull/372
+    """
+    bpn = d.getVar("BPN")
+    pv = d.getVar("PV")
+
+    # Get layer name using FILE_LAYERNAME
+    # This is the correct variable that contains the layer name from BBFILE_COLLECTIONS
+    # (BBFILE_COLLECTIONS itself is not available outside of layer.conf)
+    layer = d.getVar("FILE_LAYERNAME")
+
+    if not layer:
+        layer = "core"  # Default to core if layer detection fails
+
+    # For sub-packages, use BPN (base package name)
+    # Per spec: BPN has prefixes/suffixes removed
+    name = bpn
+
+    # Normalize name per PURL spec (lowercase only)
+    # Note: Underscores are not allowed in recipe names
+    name = name.lower()
+
+    purl = f"pkg:yocto/{layer}/{name}@{pv}"
+
+    return purl
+
+
 def set_purposes(d, element, *var_names, force_purposes=[]):
     purposes = force_purposes[:]
 
@@ -634,36 +670,6 @@ def create_spdx(d):
         if val:
             setattr(obj, name, val)
 
-    def generate_purl(d, package=None):
-        """
-        Generate Package URL (purl) for a package according to Yocto PURL spec.
-        Format: pkg:yocto/<LAYERNAME>/<BPN>@<PV>
-
-        See: https://github.com/package-url/purl-spec/pull/372
-        """
-        bpn = d.getVar("BPN")
-        pv = d.getVar("PV")
-
-        # Get layer name using FILE_LAYERNAME
-        # This is the correct variable that contains the layer name from BBFILE_COLLECTIONS
-        # (BBFILE_COLLECTIONS itself is not available outside of layer.conf)
-        layer = d.getVar("FILE_LAYERNAME")
-
-        if not layer:
-            layer = "core"  # Default to core if layer detection fails
-
-        # For sub-packages, use BPN (base package name)
-        # Per spec: BPN has prefixes/suffixes removed
-        name = bpn
-
-        # Normalize name per PURL spec (lowercase only)
-        # Note: Underscores are not allowed in recipe names
-        name = name.lower()
-
-        purl = f"pkg:yocto/{layer}/{name}@{pv}"
-
-        return purl
-
     license_data = oe.spdx_common.load_spdx_license_data(d)
 
     deploydir = Path(d.getVar("SPDXDEPLOY"))
-- 
2.52.0


