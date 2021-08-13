Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web12.37302.1628865139397397187
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Aug 2021 07:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ChRInRc+;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id om1-20020a17090b3a8100b0017941c44ce4so2568097pjb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Aug 2021 07:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=I3R3r8+aD21WJGcGebVnSfCrkMPF4I5dTfw9E1lTjHY=;
        b=ChRInRc+RICP+WY48XJMGPbyd4YON5JsP8b7FXW8DWzguBb3IEjJ1Q3TDIORXAXaMo
         PNDwjOsUy5XRjq8qJayYGt22V0yhz6LLx1DrMqzlr1AS3H8PiDno8Rzsffv5zCUblbgG
         1v6HZe7nYmIE2du6YaI81ZuHXjhCNCusJCRyefPBEyWCRWlSp5MFL0ZNnkdJxQQtpvU9
         4Xe04Z0I70HCLCQUElUPXn0aEKrYsVFYzRys1m7E9hrbLlLD8q3AHcQIKWlCrzdUQXb3
         5DqD+dZUZdaXDTRX7BfPNnbAn9rbDCtnC+QigwspI52pwD42NOx4tzKQgOzjqjNcr5g9
         zbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I3R3r8+aD21WJGcGebVnSfCrkMPF4I5dTfw9E1lTjHY=;
        b=qi+BfJC0gzJDD/STVDSG5HcOI0isq6PkWaKDyY0J+xqzlznaK/k3mi/pzIoyzjdFsg
         adhtds7nNk29+EpPf2w6+hZM6WkNRggEEXE3Fu+rDGtRzPjcHJAX8Ia38i8bxEzesMuA
         OHh2hZRwxTxrYKT85UliMQl+56g+3TCkFTAbpghMZlp8+irDhdIsS32Q90VfL5y+Yaow
         +FzZph7hPxG8U76Vz8vtNipcFUlwz027x9jv6EL+n72drWZhSHuVfKAIGFnE1WASeH3D
         QUHXm3SdOj+KzE8DZ8ohkxzBKp0y6r+N3tHXQ2u6FCMYD3B0NkY3azB4cbm7nZA+0Ydv
         9JiA==
X-Gm-Message-State: AOAM532keB3QerLjVSeOfnaadpLsZ8cLUVl0q5lSEZxCN27MCPQbcejE
	rCjt+UzjOMqHtY7bwzKHJgoXxL68L/028oa6
X-Google-Smtp-Source: ABdhPJzs/ykpmCKGxOrEuUpD6SR2LH+yh+GFkFS1oc1GukJDf9xwqbdW8rIobLwGYeqRo0hkqSG7xQ==
X-Received: by 2002:a17:90b:3618:: with SMTP id ml24mr2911395pjb.196.1628865138525;
        Fri, 13 Aug 2021 07:32:18 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id nl9sm2113182pjb.33.2021.08.13.07.32.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 07:32:17 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/17] cve-check: add include/exclude layers
Date: Fri, 13 Aug 2021 04:29:52 -1000
Message-Id: <3f705c227aea7a8acd8893f5f510ec16043ce9a8.1628863869.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628863869.git.steve@sakoman.com>
References: <cover.1628863869.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: akuster <akuster808@gmail.com>

There are times when exluding or including a layer
may be desired. This provide the framwork for that via
two variables. The default is all layers in bblayers.

CVE_CHECK_LAYER_INCLUDELIST
CVE_CHECK_LAYER_EXCLUDELIST

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5fdde65ef58b4c1048839e4f9462b34bab36fc22)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 8086cf05e9..8e7e3c60ff 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -53,6 +53,13 @@ CVE_CHECK_PN_WHITELIST ?= ""
 #
 CVE_CHECK_WHITELIST ?= ""
 
+# Layers to be excluded
+CVE_CHECK_LAYER_EXCLUDELIST ??= ""
+
+# Layers to be included 
+CVE_CHECK_LAYER_INCLUDELIST ??= ""
+
+
 # set to "alphabetical" for version using single alphabetical character as increament release
 CVE_VERSION_SUFFIX ??= ""
 
@@ -334,10 +341,20 @@ def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
     CVE manifest if enabled.
     """
 
+
     cve_file = d.getVar("CVE_CHECK_LOG")
     fdir_name  = d.getVar("FILE_DIRNAME")
     layer = fdir_name.split("/")[-3]
 
+    include_layers = d.getVar("CVE_CHECK_LAYER_INCLUDELIST").split()
+    exclude_layers = d.getVar("CVE_CHECK_LAYER_EXCLUDELIST").split()
+
+    if exclude_layers and layer in exclude_layers:
+        return
+
+    if include_layers and layer not in include_layers:
+        return
+
     nvd_link = "https://web.nvd.nist.gov/view/vuln/detail?vulnId="
     write_string = ""
     unpatched_cves = []
-- 
2.25.1

