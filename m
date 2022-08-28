Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1960ECAAA2
	for <webhook@archiver.kernel.org>; Sun, 28 Aug 2022 17:37:00 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.61477.1661708211404342756
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 10:36:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=evTcaYlY;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: ptsneves@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id l8so8330271lfc.12
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 10:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=wcP/E5EYn9rgnvTt+5PSBj6opzUH+AH/7G2LLw0Zc+w=;
        b=evTcaYlYDrKhEsgSGKUaTtwa98JA4Ad5y66pHDM8oh60nVNifhKwKxEdYtUzNBsr8l
         V/FRAPjdCwGr176e0+GPei43S+PJicNCc0whv+dQfGncP4v3nm7Tx6PNgC6PHqFVif83
         AAChRQMFxjhAYw26TYmssXKxgXrWnXSAySXWvcjdceg1TCw7oVUlgkaC4NHpdiEgxhsW
         7HVihQuTFe/tRY1ObxKwULQAu8klriz1+SsGrEJSS4hqV3r53FgbsQXu/ZuhcKiWiJ8E
         lKRvBWBg/cHE8B5DwL6yAc965tQ6pg+ENSPZggYZ+G/nUJIY9vGGmRHmBRcGYqgYj6Wk
         Mnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=wcP/E5EYn9rgnvTt+5PSBj6opzUH+AH/7G2LLw0Zc+w=;
        b=uL/Yw02n5R10xKsf8lPaSEuXVXj++4VF1z9IbGSlQqfvKTIFT4BdZM4Fj+bYlGWmgg
         Opw5XFnnp3lm0jNvd4oBHCg2Siu4lSbLYBY0adDe131kxAWq6bCP+7sCXFFCg4VSdXpZ
         wWwAdE8MB9ZK1kTQPOV+DFrrIgkvQlKky4aC9/5OemPn+dmjRZanKgXOtOburD1SG34B
         IaCHIOzxEEyIoK6AXCFGBNSJa5JFHHuHS1F6shDEpkrjR4PKVqNlBi/+Iple4olRYtIq
         KwTsMGsTmfuKQm1Ub56Ohdttp/dbyplyl9S5ZkusfJ+ZZKtFx1CeNLw3ANDTAMoWDf8E
         6fZg==
X-Gm-Message-State: ACgBeo1oUFiLOUSIP5JgNkebEGcAt8M1dkar0GfuGfJMTAmWBKRXPln8
	CsJ+nIluEm20sJqTnNh/kjoeqGmyR4ZL
X-Google-Smtp-Source: 
 AA6agR59On6YX3LzrGoilYGj2HFqxdU1aGgHxq5UKDU9Rua9+r0F/DXqCSPbhycIQ4p/WczNcDfytQ==
X-Received: by 2002:a05:6512:10d2:b0:492:ddd1:6271 with SMTP id
 k18-20020a05651210d200b00492ddd16271mr5026813lfg.171.1661708209407;
        Sun, 28 Aug 2022 10:36:49 -0700 (PDT)
Received: from localhost.localdomain
 (031011128148.dynamic-3-poz-k-0-2-0.vectranet.pl. [31.11.128.148])
        by smtp.gmail.com with ESMTPSA id
 h1-20020a05651c124100b0026181a42284sm570946ljh.88.2022.08.28.10.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Aug 2022 10:36:48 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH v2 1/2] ntirpc: Add ntirpc recipe
Date: Sun, 28 Aug 2022 19:36:45 +0200
Message-Id: <20220828173646.3072653-1-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Aug 2022 17:37:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169989

ntirpc is an actively maintained rpc implementation. We cannot completely
remove libtirpc due to arising circular dependencies where ntirpc
depends on libnsl2, which in turn depends on an RPC implementation.

libtirpc and ntirpc are not mutually exclusive.

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 meta/recipes-extended/ntirpc/ntirpc_4.0.bb    | 36 +++++++++++++++++++
 meta/recipes-extended/quota/quota_4.06.bb     |  2 +-
 .../recipes-extended/rpcbind/rpcbind_1.2.6.bb |  2 +-
 .../watchdog/watchdog_5.16.bb                 |  2 +-
 .../xorg-xserver/xserver-xorg.inc             |  2 +-
 .../recipes-support/liburcu/liburcu_0.13.1.bb |  1 +
 6 files changed, 41 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-extended/ntirpc/ntirpc_4.0.bb

diff --git a/meta/recipes-extended/ntirpc/ntirpc_4.0.bb b/meta/recipes-extended/ntirpc/ntirpc_4.0.bb
new file mode 100644
index 0000000000..eff9d36069
--- /dev/null
+++ b/meta/recipes-extended/ntirpc/ntirpc_4.0.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Transport-Independent RPC library (nfs-ganesha fork)"
+DESCRIPTION = "ntirpc is a port of Suns Transport-Independent RPC library to Linux"
+SECTION = "libs/network"
+HOMEPAGE = "https://github.com/nfs-ganesha/ntirpc"
+BUGTRACKER = "https://github.com/nfs-ganesha/ntirpc/issues"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f835cce8852481e4b2bbbdd23b5e47f3 \
+    file://src/netname.c;beginline=1;endline=27;md5=f8a8cd2cb25ac5aa16767364fb0e3c24"
+
+SRC_URI = "https://download.nfs-ganesha.org/4/${PV}/ntirpc-${PV}.tar.gz"
+SRC_URI[md5sum] = "17b0baada54936dcde80eba27bb6d88d"
+SRC_URI[sha256sum] = "6a7921cd48d02077b394a02be42bf4f9b4678d4ebfd86a7ae4385bbcdce55462"
+
+DEPENDS = "liburcu libnsl2"
+
+inherit cmake pkgconfig
+
+PACKAGECONFIG[gss] = "-DUSE_GSS=true,-DUSE_GSS=false,krb5"
+PACKAGECONFIG[rdma] = "-DUSE_RPC_RDMA=true,-DUSE_RPC_RDMA=false,rdma-core"
+PACKAGECONFIG[winbind] = "-D_MSPAC_SUPPORT=true,-D_MSPAC_SUPPORT=false,samba"
+PACKAGECONFIG[profile] = "-DUSE_PROFILE=true,-DUSE_PROFILE=false,gperftools"
+PACKAGECONFIG[lttng] = "-DUSE_LTTNG=true,-DUSE_LTTNG=false,lttng-ust lttng-tools"
+
+# Sort out the brain-dead cmake file
+# (https://github.com/nfs-ganesha/ntirpc/issues/150)
+do_install:append() {
+    if [ "${prefix}/lib64" != "${libdir}" -a -d ${D}${prefix}/lib64 ]; then
+        mv ${D}${prefix}/lib64 ${D}${libdir}
+    fi
+}
+
+BBCLASSEXTEND = "native nativesdk"
+EXTRA_OECMAKE:armv5 += '-DSYSTEM_LIBRARIES="-latomic"'
+EXTRA_OECMAKE:riscv32 += '-DSYSTEM_LIBRARIES="-latomic"'
+EXTRA_OECMAKE:riscv64 += '-DSYSTEM_LIBRARIES="-latomic"'
+EXTRA_OECMAKE:powerpc += '-DSYSTEM_LIBRARIES="-latomic"'
diff --git a/meta/recipes-extended/quota/quota_4.06.bb b/meta/recipes-extended/quota/quota_4.06.bb
index 0535d14c20..304477d72b 100644
--- a/meta/recipes-extended/quota/quota_4.06.bb
+++ b/meta/recipes-extended/quota/quota_4.06.bb
@@ -30,6 +30,6 @@ PACKAGECONFIG ??= "tcp-wrappers rpc bsd"
 PACKAGECONFIG:libc-musl = "tcp-wrappers rpc"
 
 PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
-PACKAGECONFIG[rpc] = "--enable-rpc,--disable-rpc,libtirpc"
+PACKAGECONFIG[rpc] = "--enable-rpc,--disable-rpc,ntirpc"
 PACKAGECONFIG[bsd] = "--enable-bsd_behaviour=yes,--enable-bsd_behaviour=no,"
 PACKAGECONFIG[ldapmail] = "--enable-ldapmail,--disable-ldapmail,openldap"
diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
index dd89726afc..e30a23909c 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "The rpcbind utility is a server that converts RPC \
 SECTION = "console/network"
 HOMEPAGE = "http://sourceforge.net/projects/rpcbind/"
 BUGTRACKER = "http://sourceforge.net/tracker/?group_id=201237&atid=976751"
-DEPENDS = "libtirpc quota"
+DEPENDS = "ntirpc quota"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b46486e4c4a416602693a711bb5bfa39 \
diff --git a/meta/recipes-extended/watchdog/watchdog_5.16.bb b/meta/recipes-extended/watchdog/watchdog_5.16.bb
index 26fcc10487..5f5fd4dc87 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.16.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.16.bb
@@ -28,7 +28,7 @@ UPSTREAM_CHECK_REGEX = "/watchdog/(?P<pver>(\d+[\.\-_]*)+)/"
 
 inherit autotools update-rc.d systemd pkgconfig
 
-DEPENDS += "libtirpc"
+DEPENDS += "ntirpc"
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"
 LDFLAGS += "-ltirpc"
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 057a1ba6ad..2085f742d6 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -36,7 +36,7 @@ inherit meson pkgconfig
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
-LIB_DEPS = "pixman libxfont2 xtrans libxau libxext libxdmcp libdrm libxkbfile libpciaccess libxcvt libtirpc"
+LIB_DEPS = "pixman libxfont2 xtrans libxau libxext libxdmcp libdrm libxkbfile libpciaccess libxcvt ntirpc"
 DEPENDS = "xorgproto ${LIB_DEPS} font-util"
 
 # Split out some modules and extensions from the main package
diff --git a/meta/recipes-support/liburcu/liburcu_0.13.1.bb b/meta/recipes-support/liburcu/liburcu_0.13.1.bb
index 66763349d2..d7e831e803 100644
--- a/meta/recipes-support/liburcu/liburcu_0.13.1.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.13.1.bb
@@ -22,3 +22,4 @@ CPPFLAGS:append:riscv64  = " -pthread -D_REENTRANT"
 do_install:append() {
     oe_multilib_header urcu/config.h
 }
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


