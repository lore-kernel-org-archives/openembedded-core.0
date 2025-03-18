Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD4CC35FF3
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 11:23:54 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.9391.1742297025378487616
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 04:23:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Nr+fD/8K;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so32336695e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 04:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742297023; x=1742901823; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=j9afkmMGVzpH3NEiG/s/Fl1I0sqpjYItODAxCms7o18=;
        b=Nr+fD/8KX2Q8btDxH4EGUX+JSy6a8nYjzm8qhJqVQ9rPGjHCHPsySxhDF0CX5rE0Od
         WtbGAoonCFZ4gGPzfW06NorNrxJRxKEPUPJ4jT5IiIDOeMw8a1DzIhqosRiBCqdyi54o
         C5MHEE/hXiJcAZ/2NLoNYbDXjqPA80Yw73DwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742297023; x=1742901823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j9afkmMGVzpH3NEiG/s/Fl1I0sqpjYItODAxCms7o18=;
        b=dwXfty47+fvF/pzP5sPQ9H0z3ZQdOaSE7R2aQA+4Nfj8IJngTQLwMTmhV1R2zxmfmq
         Dn+aUd3aFsqHPaO2PjWH+m+havSko2vGBprC/jJu6ZCS2ky2hDBqzqt+INiVTtCfy/OQ
         nOYTyCvPijAw39Mjoc7ri6tELQM8iEZfcQpR7grJA399QUj5pCpEcNZ5r2+74KuZ/ETw
         +aADC8koGMVGYtWo+y4s0qxowiEE5QymkhNLaLbb/58tq8zzoRsY9YOHcID8twLzbO7d
         vwaT/4txebVYWJ/EuqRe/fP5YXSTfITXTl03gOQTVhV3aySdL/Wojz5eFmuXAjAYRNbo
         24eg==
X-Gm-Message-State: AOJu0Yxy4lYyPwviT1lAWf9cYRqrH33JFFzL3LPy2sYc0ux/VWKAvYqL
	0Bj9ZFpDRl2LDcUObCDzmMPbgxvlJvAbD80AbokwyZee2/3CMeShg7GfyYjymul0vg+vJSaj2Ua
	K
X-Gm-Gg: ASbGncsOobsoeix+PfWaH0aGwZvjy16OAEVgKsyDyzFM/TDATHLefpsRGXUEri1/bG2
	9ZfA9o5uWq8uouoH0ijXcG5OU7nURh2ldWmjfNT9+RTrWwF+OfnLUpyybbdEyCd72C0gyEkbyXA
	BFb/TdTlhzmzigh6CDpHUVzqgH9Qxwf8Qc1pjSEgmJW3jgJ2vjibHe6e4CDIybzRONEUEzZB3lK
	E6XityN2mAn2EaNyVtMW1/nD7SyczZ7RqLRiu13P/VEnOtNSCSv77hIkyxqnrWLHYdupz1Rm1VG
	yABLIU6Vp+gmvudDcmNP5pNIOnEMXsQBZbXRJTF2SmeZIpBEhEORN6QTxOcNPtfZ49vIYzdO/A=
	=
X-Google-Smtp-Source: AGHT+IEoqk0WhF9MMpoEhbZzjIHvwhUP9ZNAVVkqNAFkZyI1FwJG/tkLCfzJTSEcnQnHQrefvWlf7w==
X-Received: by 2002:a05:600c:450d:b0:43d:683:8cb2 with SMTP id 5b1f17b1804b1-43d3b9b2f56mr19902295e9.14.1742297023309;
        Tue, 18 Mar 2025 04:23:43 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:791f:f4e7:28a8:7096])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb40cdafsm17972232f8f.62.2025.03.18.04.23.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 04:23:42 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] dhcpcd: upgrade 10.1.0 -> 10.2.2
Date: Tue, 18 Mar 2025 11:23:41 +0000
Message-ID: <20250318112341.3941239-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 11:23:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213204

License-Update: Copyright years change only

Drop a backported patch

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{dhcpcd_10.1.0.bb => dhcpcd_10.2.2.bb}    |  5 ++--
 ...mprove-the-sitation-of-working-with-.patch |  5 +---
 ...-conflict-error-when-enable-multilib.patch |  4 +--
 ...llow-the-__NR_rt_sigprocmask-syscall.patch | 30 -------------------
 ...e-INCLUDEDIR-to-prevent-build-issues.patch |  4 +--
 5 files changed, 7 insertions(+), 41 deletions(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.1.0.bb => dhcpcd_10.2.2.bb} (91%)
 delete mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-linux-Allow-the-__NR_rt_sigprocmask-syscall.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.2.bb
similarity index 91%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.2.bb
index 99b72852bf3..0b4345e7fa4 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.2.bb
@@ -7,7 +7,7 @@ DESCRIPTION = "dhcpcd runs on your machine and silently configures your \
 HOMEPAGE = "http://roy.marples.name/projects/dhcpcd/"
 
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d296c4bec306f351e676705aaf237c8c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4dda5beb433a809f2e0aeffbf9da3d91"
 
 SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=master \
            file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch \
@@ -15,10 +15,9 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://dhcpcd.service \
            file://dhcpcd@.service \
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
-           file://0001-linux-Allow-the-__NR_rt_sigprocmask-syscall.patch \
            "
 
-SRCREV = "57c3506a5622e199cf0e3fc1ef26a71cdedc9521"
+SRCREV = "f6983c18dbf7989f43a2838beeaf62a54c53ff1d"
 S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools-brokensep systemd useradd
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
index 8d1ed6671a5..4f687b0292e 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
@@ -1,4 +1,4 @@
-From 02acc4d875ee81e6fd19ef66d69c9f55b4b4a7e7 Mon Sep 17 00:00:00 2001
+From 33710a648a805d96abf49d5adf6ca55b89f9c858 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 9 Nov 2022 16:33:18 +0800
 Subject: [PATCH] 20-resolv.conf: improve the sitation of working with systemd
@@ -77,6 +77,3 @@ index 7c29e276..becc019f 100644
  		"$resolvconf" -d "$ifname" -f
  	else
  		if [ -e "$resolv_conf_dir/$ifname" ]; then
--- 
-2.17.1
-
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
index b958110ef1c..484b84f94ae 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
@@ -1,4 +1,4 @@
-From 1115784dfdf2e7095cf599f9becef705ac57f80e Mon Sep 17 00:00:00 2001
+From e9b1376c59b15e7b03611429187d9d89167154b5 Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@fujitsu.com>
 Date: Fri, 10 Mar 2023 03:48:46 +0000
 Subject: [PATCH] dhcpcd.8: Fix conflict error when enable multilib.
@@ -29,7 +29,7 @@ Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/dhcpcd.8.in b/src/dhcpcd.8.in
-index 04bf7d90..9cf10d24 100644
+index 91fdde2c..b467dc3b 100644
 --- a/src/dhcpcd.8.in
 +++ b/src/dhcpcd.8.in
 @@ -826,7 +826,7 @@ Configuration file for dhcpcd.
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-linux-Allow-the-__NR_rt_sigprocmask-syscall.patch b/meta/recipes-connectivity/dhcpcd/files/0001-linux-Allow-the-__NR_rt_sigprocmask-syscall.patch
deleted file mode 100644
index 7058330165f..00000000000
--- a/meta/recipes-connectivity/dhcpcd/files/0001-linux-Allow-the-__NR_rt_sigprocmask-syscall.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From e9e40400003db2e4f12dba85acabbaf2212a520f Mon Sep 17 00:00:00 2001
-From: Scott Shambarger <devel@shambarger.net>
-Date: Sat, 7 Dec 2024 16:37:28 +0000
-Subject: [PATCH] linux: Allow the __NR_rt_sigprocmask syscall
-
-Fixes recent glibc changes to getrandom() used by arc4random().
-Fixes #421.
-
-Upstream-Status: Backport
-See details in https://github.com/NetworkConfiguration/dhcpcd/issues/421
-
-Signed-off-by: Scott Shambarger <devel@shambarger.net>
----
- src/privsep-linux.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/privsep-linux.c b/src/privsep-linux.c
-index 8357904c9c9a..e3485a2efdfc 100644
---- a/src/privsep-linux.c
-+++ b/src/privsep-linux.c
-@@ -409,6 +409,9 @@ static struct sock_filter ps_seccomp_filter[] = {
- #ifdef __NR_recvmsg
- 	SECCOMP_ALLOW(__NR_recvmsg),
- #endif
-+#ifdef __NR_rt_sigprocmask
-+	SECCOMP_ALLOW(__NR_rt_sigprocmask),
-+#endif
- #ifdef __NR_rt_sigreturn
- 	SECCOMP_ALLOW(__NR_rt_sigreturn),
- #endif
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
index 8890c2d7dc6..fd3fae7e7e0 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
@@ -1,4 +1,4 @@
-From 69babef33b0ee4c60d8821797777b9affedd47da Mon Sep 17 00:00:00 2001
+From c2ebc32112e0cd29390b4dc951b65efae36d607b Mon Sep 17 00:00:00 2001
 From: Stefano Cappa <stefano.cappa.ks89@gmail.com>
 Date: Sun, 13 Jan 2019 01:50:52 +0100
 Subject: [PATCH] remove INCLUDEDIR to prevent build issues
@@ -11,7 +11,7 @@ Signed-off-by: Stefano Cappa <stefano.cappa.ks89@gmail.com>
  1 file changed, 5 deletions(-)
 
 diff --git a/configure b/configure
-index 1a772b02..0f915b39 100755
+index a60da137..3673de8b 100755
 --- a/configure
 +++ b/configure
 @@ -26,7 +26,6 @@ BUILD=

