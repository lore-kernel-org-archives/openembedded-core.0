Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6511ECAAD4
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 21:03:19 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.3757.1661806994067360129
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 14:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=I4I8CU0I;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id u22so9150936plq.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 14:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=KSAlUrX+Pfx9v9728UHhJmtX1+ZnNho72K8FS5qR1QA=;
        b=I4I8CU0Iz4SBvDztL9g9CVSBX4r4WNxFsBBXs4EVcYKY0+JotDmPJXg2tRPCiabuVp
         6T7CCj7ZYNPEZVe6/fC6sDVYB7aXChNWMzXQr2VF+obphXItaaRcBb42mELwXGLtEQIG
         Frl2v29w+kg+6jefLwMYFpTdoHrFl68Usd9iRcA/E6rcpWwrzOdPOC3ZUMcOLI24GJ8W
         cSptXLHGcJXHWcpOW+t7wri2bnjRaDocvlUmht0eudW/cHWRT6qSOgObggWnpBiTH6BR
         caeE389MV8I1SaiyCopcVC515/xrSEgegYuQniu6IarnPn/X9tjTCRUYAyG44nus7LMF
         oPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=KSAlUrX+Pfx9v9728UHhJmtX1+ZnNho72K8FS5qR1QA=;
        b=kiW/m5XkK21A7i+wPbMQdXleHFzjambDjoKMyn2d33FzGWzQSAQGGdAjHffNgXq7AW
         zEafW1YzBH2rp1ihhVgASIB6cyLYHvOiIOIvnLmMS4kDn/c06oKj/4v6j8AwNMRHQgbz
         36STkgASxuQnSN515SPJorhGLq2WAv0yhcN4/cbq4nckF/PRrinzHynpvCBEOA/JSiIm
         yfW0jxZ5jpwNVTrI+jC1tEjbdVT0dD6RglziopGWKxjZ6NVZA7lWSNMrguGFtysgJn9y
         lv57cAYHtXAjQI8BZxWDxMEWYlTJ0WmqjolhIUL/ehFIJu911E5bdaNjAeBHjY2Mq9s5
         ZkOw==
X-Gm-Message-State: ACgBeo0usRzyV6b9ue0r3BwqIW01z2h52spsQk2xkWfXn2d6vqiXX3nD
	3LqsSBoH8EfD0ot11DPza85nSjzBbMAvmfQA
X-Google-Smtp-Source: 
 AA6agR51Cf5XDvDCwayqT2va+Nas9+xdWaolgcrD/7yAS5b2qsxOF4mOhWCXY+9MDJOaABFflwl2/w==
X-Received: by 2002:a17:902:70c4:b0:172:d8f5:b4bc with SMTP id
 l4-20020a17090270c400b00172d8f5b4bcmr17918554plt.32.1661806993060;
        Mon, 29 Aug 2022 14:03:13 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 q15-20020a17090311cf00b0016eede528b4sm8058957plh.61.2022.08.29.14.03.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 14:03:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/14] cryptodev-module: fix build with 5.11+
 kernels
Date: Mon, 29 Aug 2022 11:02:32 -1000
Message-Id: 
 <653b03aa6fc8effd3b2215a7a0ba005979e78e9f.1661806803.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661806803.git.steve@sakoman.com>
References: <cover.1661806803.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Aug 2022 21:03:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170038

From: Anuj Mittal <anuj.mittal@intel.com>

Backport patch to fix:

| cryptodev-module/1.10-r0/git/ioctl.c:875:4: error: implicit declaration of function 'ksys_close'; did you mean 'ksys_chown'? [-Werror=implicit-function-declaration]
|   875 |    ksys_close(fd);
|       |    ^~~~~~~~~~
|       |    ksys_chown
| cc1: some warnings being treated as errors

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../cryptodev/cryptodev-module_1.10.bb        |  1 +
 .../files/fix-build-for-Linux-5.11-rc1.patch  | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-kernel/cryptodev/files/fix-build-for-Linux-5.11-rc1.patch

diff --git a/meta/recipes-kernel/cryptodev/cryptodev-module_1.10.bb b/meta/recipes-kernel/cryptodev/cryptodev-module_1.10.bb
index e4f7d1e372..d7c7918515 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev-module_1.10.bb
+++ b/meta/recipes-kernel/cryptodev/cryptodev-module_1.10.bb
@@ -11,6 +11,7 @@ SRC_URI += " \
 file://0001-Disable-installing-header-file-provided-by-another-p.patch \
 file://0001-Fix-build-for-Linux-5.8-rc1.patch \
 file://0001-Fix-build-for-Linux-5.9-rc1.patch \
+file://fix-build-for-Linux-5.11-rc1.patch \
 "
 
 EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
diff --git a/meta/recipes-kernel/cryptodev/files/fix-build-for-Linux-5.11-rc1.patch b/meta/recipes-kernel/cryptodev/files/fix-build-for-Linux-5.11-rc1.patch
new file mode 100644
index 0000000000..3ae77cb9d6
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/files/fix-build-for-Linux-5.11-rc1.patch
@@ -0,0 +1,32 @@
+From 55c6315058fc0dd189ffd116f2cc27ba4fa84cb6 Mon Sep 17 00:00:00 2001
+From: Joan Bruguera <joanbrugueram@gmail.com>
+Date: Mon, 28 Dec 2020 01:41:31 +0100
+Subject: [PATCH] Fix build for Linux 5.11-rc1
+
+ksys_close was removed, as far as I can tell, close_fd replaces it.
+
+See also: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8760c909f54a82aaa6e76da19afe798a0c77c3c3
+          https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1572bfdf21d4d50e51941498ffe0b56c2289f783
+
+Upstream-Status: Backport [https://github.com/cryptodev-linux/cryptodev-linux/commit/55c6315058fc0dd189ffd116f2cc27ba4fa84cb6]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ ioctl.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/ioctl.c b/ioctl.c
+index 3d332380..95481d4f 100644
+--- a/ioctl.c
++++ b/ioctl.c
+@@ -871,8 +871,10 @@ cryptodev_ioctl(struct file *filp, unsigned int cmd, unsigned long arg_)
+ 		if (unlikely(ret)) {
+ #if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 17, 0))
+ 			sys_close(fd);
+-#else
++#elif (LINUX_VERSION_CODE < KERNEL_VERSION(5, 11, 0))
+ 			ksys_close(fd);
++#else
++			close_fd(fd);
+ #endif
+ 			return ret;
+ 		}
-- 
2.25.1


