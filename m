Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BCD2ECAAD1
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 17:46:44 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web12.51243.1661622403314638447
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 10:46:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=q4X7M18L;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: ptsneves@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id l8so5867095lfc.12
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 10:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=UPPk+uwp8cevFBC4j45ztQkA33HBxIPzKjYiYY8swVc=;
        b=q4X7M18LapMg+WAdkAfgDUfYmRL00iCuKqMFiDSg7kKCnVZwbwrVqIFhGkiiotshZg
         R/x9C8TNHrO+3ly/k0cxoXQfg7ft9QhMRf7TFrAt2NW2nhzKj3jHtm8kfDPFGY4KRRpE
         mfullKvWB6+0Al3o7yHvUe25+55WGeDZVVZn6QXsFCOt1t9c/13rrFFAjXqi2/FqrAxb
         1UJyrA7hx/vP4oU7adkjH+4iMR4mZRH0iamChI6aux5DcoOJmc8gZPH6b6jfiDASUOwM
         D9Q9xLR3P+Cr3Z2TRaiu9bJobzrvcq8gNpGcrAYZTXi8JJ1osgF1/tz9AyUpstY3eVPY
         rYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=UPPk+uwp8cevFBC4j45ztQkA33HBxIPzKjYiYY8swVc=;
        b=5ANFofk21mpC7EXEnxRK0K47cr1IlnH1/1qPTmOXkZlKrJQmvD5ltFUWndLZH2HSFT
         vwWnT3vaCsMk183HYPSx3feLSDp0dhtu/uYhbv2L9IldlX8TXZ8IOkP9oLL8Q/XVZyx+
         fc5XHPvAuuepjXRoit6Wb/BGbHyjQC/DAIYtDPsbO/ztWM92xvdj5UMgFxaSvgEH3hNJ
         kVF7o12G/qvysQyxqqsSh15UfW7crxYT1xACfk41G1hcvb7uylC+zvAWDgr+tYiSOT2u
         Zt+kkue+Lk6D2kshtzvA6PWoogkzJlpEhHJOhl9RdA8+DdyPoFF/fNorbfjczQF7jjq/
         vwNA==
X-Gm-Message-State: ACgBeo3M3AebCK3L2sKP/jPbku611xDeImltTDLsKdoZ8JrhNNtEk2Uu
	15pPUhjqtitQ3T7CeGgE8FuJ+YULkQ==
X-Google-Smtp-Source: 
 AA6agR4S37d0gPDuSCzYJ5BY4ex2QO1O+Ys8HbMCoU+RtntwIiMt9YVOg1rfoj57YclOmsa9uuDhkg==
X-Received: by 2002:ac2:4bc1:0:b0:48b:2ac7:bd67 with SMTP id
 o1-20020ac24bc1000000b0048b2ac7bd67mr4014569lfq.499.1661622401480;
        Sat, 27 Aug 2022 10:46:41 -0700 (PDT)
Received: from pneves-XPS-15-9550.home
 (217.97.110.52.ipv4.supernova.orange.pl. [217.97.110.52])
        by smtp.gmail.com with ESMTPSA id
 s20-20020a197714000000b00492e7b8e26asm715692lfc.208.2022.08.27.10.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 10:46:40 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH 1/2] ntirpc: Add ntirpc recipe
Date: Sat, 27 Aug 2022 19:46:32 +0200
Message-Id: <20220827174633.2772165-1-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 17:46:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169934

ntirpc is an actively maintained rpc implementation. We cannot completely
remove libtirpc due to arising circular dependencies. libtirpc and ntirpc
are not mutually exclusive.

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 meta/recipes-extended/ntirpc/ntirpc_4.0.bb    | 30 +++++++++++++++++++
 meta/recipes-extended/quota/quota_4.06.bb     |  2 +-
 .../recipes-extended/rpcbind/rpcbind_1.2.6.bb |  2 +-
 .../watchdog/watchdog_5.16.bb                 |  2 +-
 .../xorg-xserver/xserver-xorg.inc             |  2 +-
 .../recipes-support/liburcu/liburcu_0.13.1.bb |  1 +
 6 files changed, 35 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-extended/ntirpc/ntirpc_4.0.bb

diff --git a/meta/recipes-extended/ntirpc/ntirpc_4.0.bb b/meta/recipes-extended/ntirpc/ntirpc_4.0.bb
new file mode 100644
index 0000000000..edebcb8ca9
--- /dev/null
+++ b/meta/recipes-extended/ntirpc/ntirpc_4.0.bb
@@ -0,0 +1,30 @@
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f835cce8852481e4b2bbbdd23b5e47f3"
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


