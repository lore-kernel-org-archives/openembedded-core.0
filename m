Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C929FC0502A
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 14:40:21 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.26503.1661956816756906991
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 07:40:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=DLGNIHf1;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id c66so4351294pfc.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 07:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=eCneqyGvbYDadHx+RU/O/GuHPb3/PG5BEVAWyssZphs=;
        b=DLGNIHf1lz9+UgycHIqSwH99xEvD97EUecEB2N3RAh/39NituV42NycstaI88+Jj0H
         PTQhhG13rKraS4QT9UHBmUgR3SoZsXIOsDyWNhi8SMk6+ty0r7k9bDb9RWf6yZSZygLb
         bP7BUwHrKyhNFGVBa5Yb/p/qA1CmGuLHxNTNQldJwRmRSEakPyhyg958uzbeJVVL4dkh
         BqArCAAD5v+JwRiSw2Y8nh3uNUlqavrivAYIp1ry1at+qMtY1/7Zfeeb5h1cXTvmLSL3
         6P/n+FzyGzN98WmZLs+HJsON8eF4WXSb5SoVHp9I3t3pINbvENAbiJTaRIqstHeAJ4rL
         r/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=eCneqyGvbYDadHx+RU/O/GuHPb3/PG5BEVAWyssZphs=;
        b=8IyF6nmYnxnHVFHTsQYrouemK7zujKicfva6Fbznk3zv4ti8hTeVUVgie/uC2Sf5lF
         5VmSN/m8jLHDImNJ7dSvCLTf3tTIMpKOO6YO2F21/zRPUG0TYH/MbEkFIwUV9RK+5hzQ
         C3XKvcUoAmAOeLFUGy/WRFtpTe6dpM4bK9wkcOIFcZAVkepMdzKwvyn0gdG9TMF5sh4w
         z3mHTZPEmMEuIDiDdOevNp58Fw5vwVBP/B/ohreBBkcFSUkdL0hqN3nfFdjaTycgZg5z
         soobin70BBe+DkPBO6YvTpaGSFJpDxW9I9elvc34HqJOsbo7onQCZxaJTgL/Gx8SwHOn
         qSQQ==
X-Gm-Message-State: ACgBeo2auRA95iRV7MBJ8rkyEyKhGnfABO8dNcY5RkF752e8ylmL8rLR
	TXgcq6ZQkeYazTvxvY8G18X1STi+V4Ums7u6
X-Google-Smtp-Source: 
 AA6agR5hL3hzQ0DQ+zMHar84tL07HIDMoZG4O1GmO/1ZhbWm3bTUNGBmRiapSEGNS5O+EcANvxxCXQ==
X-Received: by 2002:a63:564f:0:b0:425:f2cd:d0ce with SMTP id
 g15-20020a63564f000000b00425f2cdd0cemr22011633pgm.143.1661956815750;
        Wed, 31 Aug 2022 07:40:15 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g5-20020a170902d1c500b00174d715cb76sm6070780plb.2.2022.08.31.07.40.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 07:40:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/19] shadow: Avoid nss warning/error with musl
Date: Wed, 31 Aug 2022 04:39:31 -1000
Message-Id: 
 <e5ce33228858fcc12051548399c71ce10346bf5b.1661956484.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661956484.git.steve@sakoman.com>
References: <cover.1661956484.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 14:40:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170122

From: Andrei Gherzan <andrei.gherzan@huawei.com>

The libnss configuration file is only installed when glibc is used. The
inexistence of it on a musl-based rootfs, will make shadow complain
about it:

Failed opening /etc/nsswitch.conf

This is because shadow will try to use nsswich when dealing with
subordinate IDs and the message is just a warning as the tool will still
generate them correctly in subuid/subgid files.

We drop this log message for class native to avoid an error when rootfs
logs are checked ('Failed' will match the regex bitbake is using to
check for rootfs generation errors).

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...f-message-when-not-in-place-eg.-musl.patch | 27 +++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc       |  2 ++
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/0001-Drop-nsswitch.conf-message-when-not-in-place-eg.-musl.patch

diff --git a/meta/recipes-extended/shadow/files/0001-Drop-nsswitch.conf-message-when-not-in-place-eg.-musl.patch b/meta/recipes-extended/shadow/files/0001-Drop-nsswitch.conf-message-when-not-in-place-eg.-musl.patch
new file mode 100644
index 0000000000..6c04769713
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-Drop-nsswitch.conf-message-when-not-in-place-eg.-musl.patch
@@ -0,0 +1,27 @@
+From aed5a184401fbbe901cb825be4004ced885b6f9a Mon Sep 17 00:00:00 2001
+From: Andrei Gherzan <andrei.gherzan@huawei.com>
+Date: Wed, 24 Aug 2022 00:54:47 +0200
+Subject: [PATCH] Drop nsswitch.conf message when not in place - eg. musl
+
+Upstream-Status: Inappropriate [issue reported at https://github.com/shadow-maint/shadow/issues/557]
+Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
+---
+ lib/nss.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/nss.c b/lib/nss.c
+index af3e95a..74e0e16 100644
+--- a/lib/nss.c
++++ b/lib/nss.c
+@@ -57,7 +57,7 @@ void nss_init(char *nsswitch_path) {
+ 	//   subid:	files
+ 	nssfp = fopen(nsswitch_path, "r");
+ 	if (!nssfp) {
+-		fprintf(shadow_logfd, "Failed opening %s: %m", nsswitch_path);
++		//fprintf(shadow_logfd, "Failed opening %s: %m", nsswitch_path);
+ 		atomic_store(&nss_init_completed, true);
+ 		return;
+ 	}
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index b3ae2b4874..5106b95571 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -26,6 +26,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:class-native = " \
            file://0001-Disable-use-of-syslog-for-sysroot.patch \
            file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
+           file://0001-Drop-nsswitch.conf-message-when-not-in-place-eg.-musl.patch \
            "
 SRC_URI:append:class-nativesdk = " \
            file://0001-Disable-use-of-syslog-for-sysroot.patch \
@@ -33,6 +34,7 @@ SRC_URI:append:class-nativesdk = " \
 
 SRC_URI[sha256sum] = "f262089be6a1011d50ec7849e14571b7b2e788334368f3dccb718513f17935ed"
 
+
 # Additional Policy files for PAM
 PAM_SRC_URI = "file://pam.d/chfn \
                file://pam.d/chpasswd \
-- 
2.25.1


