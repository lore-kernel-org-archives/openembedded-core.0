Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F55C433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 17:33:14 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.14273.1647365593755340745
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 10:33:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gBhajj9t;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id j26so30148677wrb.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 10:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wm4qG7UEMZ3qZiZnc3iz0e4ruwhrytnTp+x7VbPSuGE=;
        b=gBhajj9t6BuMVK9oScjAdK9z1qktmhSINzafXDH5SMGyHCVc6HJrTvCR93GkTt3gTG
         pjrwqArWmE2V10XDnvMtrAJADG9rZ4xRYndnqxM9qUyws+0J7ONiiGbJae4AOTwTmSLO
         AexSyG3Pgp01wP/LOBTZwa+ZOuQGl5O+L0MgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wm4qG7UEMZ3qZiZnc3iz0e4ruwhrytnTp+x7VbPSuGE=;
        b=dJE29BF3U0PeYH9wymz12SopOwsq/Hy3XGbcv4sZcpS1Sifz3LfF2WnTFFm247Soxc
         0skMU6Q1TsfnF6mCqJcO8dHWXoH3UwQ5A64qmiuArEjbJ5FWo/ADZ/MYt9VVWcsHag91
         oVFvVXWCaJGelNJWvot//CZWNlZQX+LUC1UxHSwXe/KqeNa6QWP2LhIASNBlJ15lmnXo
         vFmK+L3YHlFmHUGlux9c15NkkOKd+AeBgqgEWC5UT+WEXRlcMthHsccF+MLIqzRWipup
         gi3kuokyQgcbB3Y4PahGy6tQ63P4Zg8JqXO9p6iyiBZlgC5ErsUfwKoJsTI+KJDt846Y
         f7Yw==
X-Gm-Message-State: AOAM533JulQyMiF0cJyrFlF3Z5BgUgQO5imB+InYdEuE1apPOpRz3Ja5
	jWB1qVerDbreUTDOsyC03nhnelFNXIBw9eaK
X-Google-Smtp-Source: 
 ABdhPJzWXY+zxD24g5Bf/RIeqD4RFqNsp89Z9m5GSNlvpqoKR1GS4+VJ95hMdj2gZqoXjibA52ufxw==
X-Received: by 2002:a05:6000:170d:b0:1f1:fefa:db85 with SMTP id
 n13-20020a056000170d00b001f1fefadb85mr20855200wrc.148.1647365591706;
        Tue, 15 Mar 2022 10:33:11 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 n1-20020a5d5981000000b00203d8ea8c94sm1720762wri.84.2022.03.15.10.33.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 10:33:11 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] create-spdx: Use function rather than AVAILABLE_LICENSES
Date: Tue, 15 Mar 2022 17:33:09 +0000
Message-Id: <20220315173310.889973-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 17:33:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163311

We can directly call the function rather than using the variable indirection.
As this is the last user of the variable, it then allows removal of it in a
followup patch.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/create-spdx.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index daf99ca676c..1a4804a7c50 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -94,7 +94,7 @@ def convert_license_to_spdx(lic, document, d, existing={}):
     from pathlib import Path
     import oe.spdx
 
-    available_licenses = d.getVar("AVAILABLE_LICENSES").split()
+    avail_licenses = available_licenses(d)
     license_data = d.getVar("SPDX_LICENSE_DATA")
     extracted = {}
 
@@ -112,7 +112,7 @@ def convert_license_to_spdx(lic, document, d, existing={}):
         if name == "PD":
             # Special-case this.
             extracted_info.extractedText = "Software released to the public domain"
-        elif name in available_licenses:
+        elif name in avail_licenses:
             # This license can be found in COMMON_LICENSE_DIR or LICENSE_PATH
             for directory in [d.getVar('COMMON_LICENSE_DIR')] + (d.getVar('LICENSE_PATH') or '').split():
                 try:
@@ -122,11 +122,11 @@ def convert_license_to_spdx(lic, document, d, existing={}):
                 except FileNotFoundError:
                     pass
             if extracted_info.extractedText is None:
-                # Error out, as the license was in available_licenses so should
+                # Error out, as the license was in avail_licenses so should
                 # be on disk somewhere.
                 bb.error("Cannot find text for license %s" % name)
         else:
-            # If it's not SPDX, or PD, or in available licenses, then NO_GENERIC_LICENSE must be set
+            # If it's not SPDX, or PD, or in avail_licenses, then NO_GENERIC_LICENSE must be set
             filename = d.getVarFlag('NO_GENERIC_LICENSE', name)
             if filename:
                 filename = d.expand("${S}/" + filename)
-- 
2.32.0


