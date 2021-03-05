Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web08.12840.1614955650655476728
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 06:47:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=i/B1Mt5p;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d11so1513651plo.8
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 06:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=cp03sNOSowwvl+2cI+lDyklQxK4q9mX15SFudN5jf/U=;
        b=i/B1Mt5pg56DLeS2iiZb+RDMbZV5qonxfvhOiwJNuzfWWFEtjAyBTFPIrJ7K68Oero
         krT438q5HkVM7YQkzGm+9Af4XF8qhRqdL2JZzzkNMvX9kBsZ5vVPYJddl9si1y70rrcq
         /YvdSMtDpHH0vFQe+7nP3LYbJamJtGDzWbxgvoBM5fqY4WIbi2HzKPztCpfyBcwnNIYC
         DhNOS8pyOCUWvBJkIQ42M0yoYTyMHlVXPgtIYbvvsEppldr4p3dB1+94sUoOWsSIteVz
         B2VRtm21edDWrIIHkErtCx5ZbNmfSLpbITDdd0nGsB0Xb06IY/DA2DZPqJ5e3iFn2qSg
         Kr/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cp03sNOSowwvl+2cI+lDyklQxK4q9mX15SFudN5jf/U=;
        b=unT3rdwPDXMGqiDlBnkos20Hhb3BIGy8kgYqtjRPikIcBx7pwHggJtCzFOn1Mq8fM1
         v2CGMeSGSik+pgXwErU5gos9cDjrSkk+mfr1Dd+kystAOxdahU+K6GiCZXHDCoDFkBFd
         UHoCzYSWnpKQa5fdpNgzl9w+uPIZuPEL+59v+p9Ihl8hX5nLTAjSFOnIgL8TFqDToj+r
         Z60Mrx3EYPZoeCQLtdiByD9D8PNsMfOe1ytSH6b7xoSIJyTWkcPRsmWLKUDp1tsq67uE
         G7bpuKHOp9mLaB1xw1UUG6CvnfGw8uQ89FD3PdkcqUXnl9mEvNok8Za4m5nyZgGiKL9y
         goAg==
X-Gm-Message-State: AOAM531bUsugEXO0JUPNOH2YnfxXs7rygFf8YwzW9NmI5t6AL1UJrUAi
	jFBlWCtwN7qBERTVIaOOosPDg0P8Ra8OJcU0
X-Google-Smtp-Source: ABdhPJwZUKtNqReLNlZXlz5QWgWAEAc/mj5TumA1YesSDxlIre20aqY8opliqmb7TNNMZcjT9buWng==
X-Received: by 2002:a17:903:1c2:b029:de:ad0a:2dbf with SMTP id e2-20020a17090301c2b02900dead0a2dbfmr9243584plh.44.1614955649437;
        Fri, 05 Mar 2021 06:47:29 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id c72sm2659261pfb.165.2021.03.05.06.47.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 06:47:29 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/27] wpa-supplicant: fix CVE-2021-0326
Date: Fri,  5 Mar 2021 04:46:15 -1000
Message-Id: <629a275bbafe7436f73ace59ab06d44e316b6b9d.1614955420.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614955420.git.steve@sakoman.com>
References: <cover.1614955420.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Ghinea <stefan.ghinea@windriver.com>

In p2p_copy_client_info of p2p.c, there is a possible out of bounds write
due to a missing bounds check. This could lead to remote code execution
if the target device is performing a Wi-Fi Direct search, with no
additional execution privileges needed. User interaction is not needed
for exploitation.Product: AndroidVersions: Android-10 Android-11
Android-8.1 Android-9 Android ID: A-172937525

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-0326

Upstream patches:
https://w1.fi/cgit/hostap/commit/?id=947272febe24a8f0ea828b5b2f35f13c3821901e<links_for_CVE_patches>

Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b7940edabe100512e8f558cc37f9da836feae74d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../wpa-supplicant/CVE-2021-0326.patch        | 45 +++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.9.bb      |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-0326.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-0326.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-0326.patch
new file mode 100644
index 0000000000..8c90fa3421
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-0326.patch
@@ -0,0 +1,45 @@
+From 947272febe24a8f0ea828b5b2f35f13c3821901e Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <jouni@codeaurora.org>
+Date: Mon, 9 Nov 2020 11:43:12 +0200
+Subject: [PATCH] P2P: Fix copying of secondary device types for P2P group
+ client
+
+Parsing and copying of WPS secondary device types list was verifying
+that the contents is not too long for the internal maximum in the case
+of WPS messages, but similar validation was missing from the case of P2P
+group information which encodes this information in a different
+attribute. This could result in writing beyond the memory area assigned
+for these entries and corrupting memory within an instance of struct
+p2p_device. This could result in invalid operations and unexpected
+behavior when trying to free pointers from that corrupted memory.
+
+Upstream-Status: Backport
+CVE: CVE-2021-0326
+
+Reference to upstream patch:
+[https://w1.fi/cgit/hostap/commit/?id=947272febe24a8f0ea828b5b2f35f13c3821901e]
+
+Credit to OSS-Fuzz: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=27269
+Fixes: e57ae6e19edf ("P2P: Keep track of secondary device types for peers")
+Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
+Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
+---
+ src/p2p/p2p.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/p2p/p2p.c b/src/p2p/p2p.c
+index a08ba02..079270f 100644
+--- a/src/p2p/p2p.c
++++ b/src/p2p/p2p.c
+@@ -453,6 +453,8 @@ static void p2p_copy_client_info(struct p2p_device *dev,
+ 	dev->info.config_methods = cli->config_methods;
+ 	os_memcpy(dev->info.pri_dev_type, cli->pri_dev_type, 8);
+ 	dev->info.wps_sec_dev_type_list_len = 8 * cli->num_sec_dev_types;
++	if (dev->info.wps_sec_dev_type_list_len > WPS_SEC_DEV_TYPE_MAX_LEN)
++		dev->info.wps_sec_dev_type_list_len = WPS_SEC_DEV_TYPE_MAX_LEN;
+ 	os_memcpy(dev->info.wps_sec_dev_type_list, cli->sec_dev_types,
+ 		  dev->info.wps_sec_dev_type_list_len);
+ }
+-- 
+2.17.1
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
index 7cc03fef7d..85ac28d881 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz  \
            file://0001-WPS-UPnP-Do-not-allow-event-subscriptions-with-URLs-.patch \
            file://0002-WPS-UPnP-Fix-event-message-generation-using-a-long-U.patch \
            file://0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch \
+           file://CVE-2021-0326.patch \
           "
 SRC_URI[md5sum] = "2d2958c782576dc9901092fbfecb4190"
 SRC_URI[sha256sum] = "fcbdee7b4a64bea8177973299c8c824419c413ec2e3a95db63dd6a5dc3541f17"
-- 
2.25.1

