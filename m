Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.31599.1612763493526671166
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Feb 2021 21:51:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=COQPbcZr;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id x136so2436557pfc.2
        for <openembedded-core@lists.openembedded.org>; Sun, 07 Feb 2021 21:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=69OTNiuz5uc7mms6WXOBe3A0higL2BSrVyvX5bG4c+k=;
        b=COQPbcZrV24qrN+NB+1CTSSq7ZylW3DNWZF5RqH49qo8MFFhgfQvIsyBJeBg2xJaSI
         23RV3Q+A2Xrx3+JZK2le4C9qWbYMkIAQ1vh63a+fzAfHwT/+40zWSCyg5cTubTtWRbbZ
         xp9n5kqHwjq7HlzIHvMasu9wdA/HvBk2oNwr9AD/piFQt6JBQaccB6pmEEmajigkL+c9
         jxng0guOKa6WFv1pNYETPJ02EyRVrITDwjPNcTMRIoyBhw4bhMeZTpj4fdNBO1oef9Q2
         kUUrBNgkByJmhGOSNoQMHxzNgGBWNBSfogJBxuuUMQk1jwGPyZvdh6kqXmTy6N/IAv6Q
         bLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=69OTNiuz5uc7mms6WXOBe3A0higL2BSrVyvX5bG4c+k=;
        b=T3Vk4WLE6YvypekqAROC5N9LQ/tHP16Vl8Z7oidyP2AooJM9TTgosrlm/NY92MvLvO
         z/pLmsAcKZbSpM2CaELFAJmRrVt+f5AxM4jrzdj1vJVbW4PodshZP9GrI1lvBh7uZn5P
         yNGChTEBWXQGiKpuU+K2dnyUgfDU/ZsFOzM0nzSzs0z8R7ZYrA/RT2znx6fm9tiH1qcS
         p/8Rt3uyfZa3173R3yn7foKhRs2+MWFWgjRtSKblai10ZmY3kwzr8Q0bQgB9jGvEDv4x
         0MstcMnLRzNj6hQTiuDEcvCz3+6jb0hwH8PvGPzFbZcrsC9/goqjY0XtKYyFryhXGIvb
         1AEg==
X-Gm-Message-State: AOAM533TbJ1rmhspP/1Vjs6wLaWIHosTc6MsaJtP3rqNfBRMUVUjwAlO
	tfBCi8NhSVsGu1kDGxBXUMNlwpcjCZk=
X-Google-Smtp-Source: ABdhPJyXhd60f8Spl8U25aPcURvEy6EX9Q90IXHi6yDUHAg21s6R3UnMIbMYbqI4ZHEs7cK9iAYoFQ==
X-Received: by 2002:a63:ce4b:: with SMTP id r11mr4765491pgi.148.1612763492865;
        Sun, 07 Feb 2021 21:51:32 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from hilo.hsdl.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id a31sm17254508pgb.93.2021.02.07.21.51.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 21:51:32 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] cve-check: add include/exclude layers
Date: Mon,  8 Feb 2021 05:51:30 +0000
Message-Id: <20210208055130.892351-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208055130.892351-1-akuster808@gmail.com>
References: <20210208055130.892351-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are times when exluding or including a layer
may be desired. This provide the framwork for that via
two variables. The default is all layers in bblayers.

CVE_CHECK_LAYER_INCLUDELIST
CVE_CHECK_LAYER_EXCLUDELIST

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/cve-check.bbclass | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 061af7a2760..112ee3379d3 100644
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

