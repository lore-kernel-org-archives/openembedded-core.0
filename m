Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web12.17634.1590940464365310745
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:54:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=etv+T3xg;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id gl26so6843603ejb.11
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8lejxFsxEkwqqgog9gWOzUy0J02e0kEx9ALK9yQCxsA=;
        b=etv+T3xgzmcufjfve5IlbnUoljNeVbNTCptYjEUS0XrpgViNxjO4gigUBwzNu4c+Ej
         Hm1mNnWpc03BtFH3ImTJD/wvE735lGeVA7YXgeIIYy/89pjClfy6cXjiobvkAeCDvtZa
         YWfrA3DnC+mi06FNlIzv5MncsHf9A37Ub51bE9CZhDP6M2naDaqpmZvsGVaj19UDliyh
         hkDRreutkQxn6UGFsvjZxm1ummssVWgROIEUXdN3A5SHxDW+o8/jt5ARDL7pUx8TOI4N
         Rw+OWJxMbAdbDBl+jL2yUQKTcqeobb7nIoZ1QCQapcU0Fb4ijjCHJq7seegHCIfcaoC3
         9L9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8lejxFsxEkwqqgog9gWOzUy0J02e0kEx9ALK9yQCxsA=;
        b=Qt5s0pdi5Cfa+IZgbu0s4MRxwr1L4jhUN6yHZjTnSNp5xqNWuZCBjUn+SdjZVETlQK
         yB5yUn31cJCiEQU6uTGMp9be47I2gypCieW2NwGJX9DTGPRMVEBUSzanzh1f/+aIhkU8
         qKJzeRb0QcEo4g7NRlH/5V7fd90oMvh8JBaUxMufycMQG0LlYx45iPa/V4kggr+yTodp
         lAimOpfi6Pe6hQG7X2gcS5BENCIkDILgqoOpF9twWPS8Te6bvf32nfzuvApsEzcLg7k7
         lo9GDcRVBgLhIc6de14r6kmPb49lR1W+K8F8GEkwiiysu0GZ5DArdfga4KHU0Gbn5VXr
         GVfA==
X-Gm-Message-State: AOAM530o169ULMA7BEAQv/uL8+pnt6qh9TaBI6kOehejrUvyvRIEDcb6
	e5NimgecD2K7oM+IpArZGpQhTYQL
X-Google-Smtp-Source: ABdhPJwZnBvPmY4eThnkiHgHsVp2a/vQTr0RreooFcO3ZMENH5lu79u26CAzsVHFsXOFXOMwmwuZ1Q==
X-Received: by 2002:a17:906:1c4a:: with SMTP id l10mr14919086ejg.499.1590940462519;
        Sun, 31 May 2020 08:54:22 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:54:22 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 63/70] ethtool: upgrade 5.4 -> 5.6
Date: Sun, 31 May 2020 17:52:47 +0200
Message-Id: <20200531155254.10283-63-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../ethtool/avoid_parallel_tests.patch        | 10 +++---
 .../ethtool/ethtool/fix-printf.patch          | 32 +++++++++++++++++++
 .../{ethtool_5.4.bb => ethtool_5.6.bb}        |  9 ++++--
 3 files changed, 43 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-extended/ethtool/ethtool/fix-printf.patch
 rename meta/recipes-extended/ethtool/{ethtool_5.4.bb => ethtool_5.6.bb} (80%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index d5c93244fa..2f2d04ca07 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From f8333f7759717b4d163cfe8e3ef8861c5a667324 Mon Sep 17 00:00:00 2001
+From 1c6c017e56ec536f5cceacdb02092777d390debb Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -15,15 +15,15 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 2127fdb..4910e6f 100644
+index 1169b7f..ed82524 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 5.4, netdev@vger.kernel.org)
+ AC_INIT(ethtool, 5.6, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
--AM_INIT_AUTOMAKE([gnu])
-+AM_INIT_AUTOMAKE([gnu serial-tests])
+-AM_INIT_AUTOMAKE([gnu subdir-objects])
++AM_INIT_AUTOMAKE([gnu subdir-objects serial-tests])
  AC_CONFIG_HEADERS([ethtool-config.h])
  
  AM_MAINTAINER_MODE
diff --git a/meta/recipes-extended/ethtool/ethtool/fix-printf.patch b/meta/recipes-extended/ethtool/ethtool/fix-printf.patch
new file mode 100644
index 0000000000..9effa4f3f4
--- /dev/null
+++ b/meta/recipes-extended/ethtool/ethtool/fix-printf.patch
@@ -0,0 +1,32 @@
+From 8dcdb3d22a66f18770e5566c0e72e86a0701aeac Mon Sep 17 00:00:00 2001
+From: Robert Scheck <robert@fedoraproject.org>
+Date: Tue, 12 May 2020 20:33:12 +0200
+Subject: Rewrite printf() due to -Werror=format-security
+
+Avoid -Werror=format-security leading to: netlink/settings.c:378:2: error:
+format not a string literal and no format arguments [-Werror=format-security]
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+Signed-off-by: Robert Scheck <robert@fedoraproject.org>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+---
+ netlink/settings.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/netlink/settings.c b/netlink/settings.c
+index c8a911d..0212465 100644
+--- a/netlink/settings.c
++++ b/netlink/settings.c
+@@ -375,7 +375,7 @@ static int dump_link_modes(struct nl_context *nlctx,
+ after:
+ 	if (first && if_none)
+ 		printf("%s", if_none);
+-	printf(after);
++	printf("%s", after);
+ 
+ 	return 0;
+ err:
+-- 
+cgit 1.2.3-1.el7
+
diff --git a/meta/recipes-extended/ethtool/ethtool_5.4.bb b/meta/recipes-extended/ethtool/ethtool_5.6.bb
similarity index 80%
rename from meta/recipes-extended/ethtool/ethtool_5.4.bb
rename to meta/recipes-extended/ethtool/ethtool_5.6.bb
index d6eafaa8dc..eda32c877c 100644
--- a/meta/recipes-extended/ethtool/ethtool_5.4.bb
+++ b/meta/recipes-extended/ethtool/ethtool_5.6.bb
@@ -9,17 +9,20 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://run-ptest \
            file://avoid_parallel_tests.patch \
+           file://fix-printf.patch \
            "
 
-SRC_URI[md5sum] = "fbb24aa414ab9a11ff66d351b5b8493b"
-SRC_URI[sha256sum] = "0b25a46b61bc6e26f56dcb973fc28acea159e2c32c9d6da42c0fa8d1a6339829"
+SRC_URI[sha256sum] = "e904e980294baf5878df410ebcf1d660497ba19bc3a77f798a04dba569f44a7e"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-inherit autotools ptest bash-completion
+inherit autotools ptest bash-completion pkgconfig
 
 RDEPENDS_${PN}-ptest += "make"
 
+PACKAGECONFIG ?= "netlink"
+PACKAGECONFIG[netlink] = "--enable-netlink,--disable-netlink,libmnl,"
+
 do_compile_ptest() {
    oe_runmake buildtest-TESTS
 }
-- 
2.26.2

