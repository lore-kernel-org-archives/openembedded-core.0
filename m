Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web09.8186.1630503933352060079
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 06:45:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Gf8V21rV;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id n27so3887537oij.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 06:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2z+gxx3H+ws0jf+h5h7bzdyq33QlTpMCoIXmCZrEVsk=;
        b=Gf8V21rVTDAJwVO3fOuKocU9ylPECOsSQm6Bhjmy+FYRs9aOxwSTyb3/M8DxzYnqF+
         +bXgGlmRQHESbnUdAI/oyTpwlG/i6fD9mR2rrDvLfKXrVprSR8z9/YWvAhPIdrXXHXKd
         yu8JRDU0c2oErM/20p9rjCUlnmJye6SRINFncW953RaFBylAcHvXWmV/WVpOdmdMvClV
         VHPMVXvexrLnZ6b2ph2pdNHG1oM0o3upRmguJ4xJtu6IYA23jN2znjQm2zAZMkKk6Kxf
         fDStjfK4vg4d2pO482wrw88QvX5YNTJJ9Y29imgxW9Dbt6IDxPVkjLnr7x+iINpu4owV
         nnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2z+gxx3H+ws0jf+h5h7bzdyq33QlTpMCoIXmCZrEVsk=;
        b=TqgGC0S1RG6tR+c8tA49PP3FE1Mj2YLbWCpbgNdrx3Dwdi0yO2e9d+G2soqAKOE6Qn
         fVAFZB8IsfQqWR47ZKIaCevYUysgjaT8uQUPWjzeWuf7Gsv/EyYkBnvZx2yHzhYc/HzQ
         me0wcIBcQAL/gyrkHaKJfc7xCznZTU8hLBWryqO6NmbPCt7D9VYIgfy/E3jk/16/Pzqk
         9nZy72SGpGrjoWUXiYAJ1R3G+UuxDWYCeuFdHOH5WI+ihKCekFdNY9Fo1pcpWQJsL1oE
         QtTKhkUNkFfkzvzN75MjuN4hq6jaOHggzVMEy1u3JS0CHXbBL9IKjGuAopxQdrhmo18U
         8kRQ==
X-Gm-Message-State: AOAM532IG6F62/ChSEJZzs3OlUveW/JwUGL+Sq1lBuMLMpf7M8Bz/8cE
	pe85LpfBU9SFRKBc25VNjlCVnMzqK3w=
X-Google-Smtp-Source: ABdhPJw+QHLWKXWV7WHq00yX9pb7P0EJDdV4qsUjr8h+MdRyDhgPAwyWBRK1g2oVN23FgDMuyth6Ow==
X-Received: by 2002:aca:a90a:: with SMTP id s10mr7156965oie.12.1630503932472;
        Wed, 01 Sep 2021 06:45:32 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id c75sm4283772oob.47.2021.09.01.06.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 06:45:32 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	saul.wold@windriver.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 14/31] classes/create-spdx: Add special exception for Public Domain license
Date: Wed,  1 Sep 2021 08:44:53 -0500
Message-Id: <20210901134510.29561-15-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901134510.29561-1-JPEWhacker@gmail.com>
References: <20210901134510.29561-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Public Domain license (PD) needs a special exception in the license
processing since there is no common license text to be extracted for
these licenses.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx.bbclass | 33 ++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index aa640977f9..f72b7b762e 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -51,6 +51,23 @@ def convert_license_to_spdx(lic, document, d):
     import oe.spdx
 
     license_data = d.getVar("SPDX_LICENSE_DATA")
+
+    def add_extracted_license(ident, name, text):
+        nonlocal document
+
+        for lic_data in license_data["licenses"]:
+            if lic_data["licenseId"] == ident:
+                return False
+
+        spdx_lic = oe.spdx.SPDXExtractedLicensingInfo()
+        spdx_lic.name = name
+        spdx_lic.licenseId = ident
+        spdx_lic.extractedText = text
+
+        document.hasExtractedLicensingInfos.append(spdx_lic)
+
+        return True
+
     def convert(l):
         if l == "(" or l == ")":
             return l
@@ -67,19 +84,11 @@ def convert_license_to_spdx(lic, document, d):
                 return spdx_license
 
         spdx_license = "LicenseRef-" + l
-        for spdx_lic in document.hasExtractedLicensingInfos:
-            if spdx_lic.licenseId == spdx_license:
-                return spdx_license
-
-        bb.warn("No SPDX License found for %s. Creating a place holder" % l)
 
-        spdx_lic = oe.spdx.SPDXExtractedLicensingInfo()
-        spdx_lic.name = l
-        spdx_lic.licenseId = spdx_license
-        # TODO: Extract the actual license text from the common license files
-        spdx_lic.extractedText = "This software is licensed under the %s license" % l
-
-        document.hasExtractedLicensingInfos.append(spdx_lic)
+        if l == "PD":
+            add_extracted_license(spdx_license, l, "Software released to the public domain")
+        elif add_extracted_license(spdx_license, l, "This software is licensed under the %s license" % l):
+            bb.warn("No SPDX License found for %s. Creating a place holder" % l)
 
         return spdx_license
 
-- 
2.32.0

