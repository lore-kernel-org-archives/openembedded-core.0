Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE719C77B7A
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 20:01:11 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.61091.1684353666988217901
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 13:01:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PZJ4GaaR;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3f420618d5bso8587095e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 13:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684353665; x=1686945665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ct6tkN9vOR2mkU4qJH1P0J3yZAtqfMpo9paERCNQ/xE=;
        b=PZJ4GaaR090Xnlr0q+4YOkVeBDWHvYAcff9BXjflmRtD1FP2V92RBl++cuQzppYWH7
         knJpudeXgra6q7HBQhrl/eJC58BpTqnSjdD1Yz1rZ9wc4Ll0zFxSiCuuzU0DDD9IG0Fz
         0fQklQh0wbN5sBL8cIV6+Zshyf7Xyt4K2Tua/vJegeWEo+NL0KcS8zyRlB45EZVopj+r
         bf/YktDe7Ge+N+OP/UfiW4482kveTDrr8DxIvRWHr01uBOblAbu/Vy8gd6ZHmlieVubB
         H6tn/zNEOoCPJyPyxU3ECPK4WM8OFhLn3HkmNYOrTdjw7grRkqEBm/3iwDA7fcgBbSUS
         vxYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684353665; x=1686945665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ct6tkN9vOR2mkU4qJH1P0J3yZAtqfMpo9paERCNQ/xE=;
        b=DyD5GubZYHlTzgarWYR2yVRYKVpjo8wy+n2nA9ujXJkKECDQBJHXicPwAUO8An1UV4
         5E7H+6NWNhxAJDyq/Fblr5voSaVuL1LBIWll5zW2oCR66NUNlfbMrpc3erEefZjl+JF6
         OY9QZ/KNOTUZzc16kJF4sQcjcVOAt7UFh6XKdpT7PxcAmxGITAmiQF1WFa69OUVpjnVV
         Yc/MdLcqwfKz3RqjMvRJVQVrbSTCQRSc3qdIvYEeN86APVUzHzaoJzyh2/2ERcDfDx+Q
         zGmA+acr5+CBllG4vZNA8d1S4nBTXmsxKHD/xFJ4yFv/OXOB80808ti+h3EI/N2z1CHT
         eDnw==
X-Gm-Message-State: AC+VfDzq9OgZtr6r11TjrqUtQ3mQLidT2SWm8HIpYq4Mte3W7WrQaoeT
	98sxYSwMo2obhR9drrDC1v0mdojQiGQ=
X-Google-Smtp-Source: ACHHUZ4rI8BxnfBSzCI2q+phx5Q2Jv63KA7l4J7Fyqz60LXKNkocPwdNCaUfxt/71ov9YFUbwowznQ==
X-Received: by 2002:a7b:c7cd:0:b0:3f5:1728:b13f with SMTP id z13-20020a7bc7cd000000b003f51728b13fmr4873717wmk.11.1684353664302;
        Wed, 17 May 2023 13:01:04 -0700 (PDT)
Received: from debian.office.codethink.co.uk ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id a3-20020a1cf003000000b003f4f9274d10sm3198881wmb.16.2023.05.17.13.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 13:01:04 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] dhcpcd: upgrade to v10.0.1
Date: Wed, 17 May 2023 21:01:00 +0100
Message-Id: <20230517200100.12284-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 20:01:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181501

Changes:
Update license checksum: change in copyright year.
Rebase patches for upstream changes.
Remove upstream applied patches.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 .../{dhcpcd_9.4.1.bb => dhcpcd_10.0.1.bb}     |  9 ++---
 ...mprove-the-sitation-of-working-with-.patch |  4 +--
 ...low-getrandom-sysctl-for-newer-glibc.patch | 30 ----------------
 ...x-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch | 34 -------------------
 ...sep-Allow-newfstatat-syscall-as-well.patch | 31 -----------------
 5 files changed, 5 insertions(+), 103 deletions(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_9.4.1.bb => dhcpcd_10.0.1.bb} (83%)
 delete mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-privsep-Allow-getrandom-sysctl-for-newer-glibc.patch
 delete mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-privsep-linux-fix-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch
 delete mode 100644 meta/recipes-connectivity/dhcpcd/files/0002-privsep-Allow-newfstatat-syscall-as-well.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.1.bb
similarity index 83%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.1.bb
index 21b2eebbd8..de007a6e6c 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.1.bb
@@ -7,20 +7,17 @@ DESCRIPTION = "dhcpcd runs on your machine and silently configures your \
 HOMEPAGE = "http://roy.marples.name/projects/dhcpcd/"
 
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d148485768fe85b9f1072b186a7e9b4d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ba9c7e534853aaf3de76c905b2410ffd"
 
-SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=dhcpcd-9 \
+SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=master \
            file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch \
            file://0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch \
-           file://0001-privsep-Allow-getrandom-sysctl-for-newer-glibc.patch \
-           file://0002-privsep-Allow-newfstatat-syscall-as-well.patch \
-           file://0001-privsep-linux-fix-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch \
            file://dhcpcd.service \
            file://dhcpcd@.service \
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            "
 
-SRCREV = "3c458fc7fa4146029a1e4f9e98cd7e7adf03081a"
+SRCREV = "5d9bf80c26b4b7dc9d8aa175d96d5a24e75b4d48"
 S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools-brokensep systemd useradd
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
index 6f90c88249..8d1ed6671a 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
@@ -27,7 +27,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 13 insertions(+), 4 deletions(-)
 
 diff --git a/hooks/20-resolv.conf b/hooks/20-resolv.conf
-index 504a6c53..eb6e5845 100644
+index 7c29e276..becc019f 100644
 --- a/hooks/20-resolv.conf
 +++ b/hooks/20-resolv.conf
 @@ -11,8 +11,12 @@ nocarrier_roaming_dir="$state_dir/roaming"
@@ -35,7 +35,7 @@ index 504a6c53..eb6e5845 100644
  "
  : ${resolvconf:=resolvconf}
 +resolvconf_from_systemd=false
- if type "$resolvconf" >/dev/null 2>&1; then
+ if command -v "$resolvconf" >/dev/null 2>&1; then
  	have_resolvconf=true
 +	if [ $(basename $(readlink -f $(which $resolvconf))) = resolvectl ]; then
 +		resolvconf_from_systemd=true
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-privsep-Allow-getrandom-sysctl-for-newer-glibc.patch b/meta/recipes-connectivity/dhcpcd/files/0001-privsep-Allow-getrandom-sysctl-for-newer-glibc.patch
deleted file mode 100644
index 68ab93416a..0000000000
--- a/meta/recipes-connectivity/dhcpcd/files/0001-privsep-Allow-getrandom-sysctl-for-newer-glibc.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From c6cdf0aee71ab4126d36b045f02428ee3c6ec50b Mon Sep 17 00:00:00 2001
-From: Roy Marples <roy@marples.name>
-Date: Fri, 26 Aug 2022 09:08:36 +0100
-Subject: [PATCH 1/2] privsep: Allow getrandom sysctl for newer glibc
-
-Fixes #120
-
-Upstream-Status: Backport [c6cdf0aee71ab4126d36b045f02428ee3c6ec50b]
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/privsep-linux.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/privsep-linux.c b/src/privsep-linux.c
-index b238644b..479a1d82 100644
---- a/src/privsep-linux.c
-+++ b/src/privsep-linux.c
-@@ -300,6 +300,9 @@ static struct sock_filter ps_seccomp_filter[] = {
- #ifdef __NR_getpid
- 	SECCOMP_ALLOW(__NR_getpid),
- #endif
-+#ifdef __NR_getrandom
-+	SECCOMP_ALLOW(__NR_getrandom),
-+#endif
- #ifdef __NR_getsockopt
- 	/* For route socket overflow */
- 	SECCOMP_ALLOW_ARG(__NR_getsockopt, 1, SOL_SOCKET),
--- 
-2.17.1
-
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-privsep-linux-fix-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch b/meta/recipes-connectivity/dhcpcd/files/0001-privsep-linux-fix-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch
deleted file mode 100644
index 1c514f9b8c..0000000000
--- a/meta/recipes-connectivity/dhcpcd/files/0001-privsep-linux-fix-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 7a2d9767585ed2c407d4985bd2d81552034fb90a Mon Sep 17 00:00:00 2001
-From: CHEN Xiangyu <xiangyu.chen@aol.com>
-Date: Thu, 9 Feb 2023 18:41:52 +0800
-Subject: [PATCH] privsep-linux: fix SECCOMP_AUDIT_ARCH missing ppc64le (#181)
-
-when dhcpcd running on ppc64le platform, it would be killed by SIGSYS.
-
-Upstream-Status: Backport [7a2d9767585ed2c407d4985bd2d81552034fb90a]
-
-Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
----
- src/privsep-linux.c | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/src/privsep-linux.c b/src/privsep-linux.c
-index 7372d26b..6a301950 100644
---- a/src/privsep-linux.c
-+++ b/src/privsep-linux.c
-@@ -232,7 +232,11 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
- #elif defined(__or1k__)
- #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_OPENRISC
- #elif defined(__powerpc64__)
--#  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_PPC64
-+#  if (BYTE_ORDER == LITTLE_ENDIAN)
-+#    define SECCOMP_AUDIT_ARCH AUDIT_ARCH_PPC64LE
-+#  else
-+#    define SECCOMP_AUDIT_ARCH AUDIT_ARCH_PPC64
-+#  endif
- #elif defined(__powerpc__)
- #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_PPC
- #elif defined(__riscv)
--- 
-2.34.1
-
diff --git a/meta/recipes-connectivity/dhcpcd/files/0002-privsep-Allow-newfstatat-syscall-as-well.patch b/meta/recipes-connectivity/dhcpcd/files/0002-privsep-Allow-newfstatat-syscall-as-well.patch
deleted file mode 100644
index c5d2cba305..0000000000
--- a/meta/recipes-connectivity/dhcpcd/files/0002-privsep-Allow-newfstatat-syscall-as-well.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 7625a555797f587a89dc2447fd9d621024d5165c Mon Sep 17 00:00:00 2001
-From: Roy Marples <roy@marples.name>
-Date: Fri, 26 Aug 2022 09:24:50 +0100
-Subject: [PATCH 2/2] privsep: Allow newfstatat syscall as well
-
-Allows newer glibc variants to work apparently.
-As reported in #84 and #89.
-
-Upstream-Status: Backport [7625a555797f587a89dc2447fd9d621024d5165c]
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/privsep-linux.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/privsep-linux.c b/src/privsep-linux.c
-index 479a1d82..6327b1bc 100644
---- a/src/privsep-linux.c
-+++ b/src/privsep-linux.c
-@@ -328,6 +328,9 @@ static struct sock_filter ps_seccomp_filter[] = {
- #ifdef __NR_nanosleep
- 	SECCOMP_ALLOW(__NR_nanosleep),	/* XXX should use ppoll instead */
- #endif
-+#ifdef __NR_newfstatat
-+	SECCOMP_ALLOW(__NR_newfstatat),
-+#endif
- #ifdef __NR_ppoll
- 	SECCOMP_ALLOW(__NR_ppoll),
- #endif
--- 
-2.17.1
-
-- 
2.30.2


