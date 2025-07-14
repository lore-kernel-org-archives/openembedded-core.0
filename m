Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D11FC83F1A
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 17:33:14 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.84216.1752514389541362062
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 10:33:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SKpRXZVZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: hiagofranco@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-742c7a52e97so3690446b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 10:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752514389; x=1753119189; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gAd6Rkyen73tNjJvOebAkq9s/RHbKQsm8pnHr4tqVik=;
        b=SKpRXZVZhdsWF+7me1dqF+1m9bvWxxHU2Sc2NHvQMA1AWy8K0SkBQWOzBMlaIFWcfN
         YBqCgImcn/jAwQpHYUJssgVLJepZvXp0+Jk1chExmoEpT8toTpZshGs5JVSVKl9OREWf
         Po6+UztXI9zZhcvuu1FbE0c9vI/PnRafEfjewiVQ5f9wVp1oJZVb9xlMt5VO/hpW2pB5
         8KMjWL5AbD9ZUhI6wuqKDxBedJvLfHS+UUL8xwEUxlk1ulek/QVceYI7sbX6mAI2ucth
         lhLvCGKsrf9C3XdcKaWQS6sE+FlewW/yoEnEIGK2mmL1Ha0Pz2yhpilfah3KQTNTNkgR
         qUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752514389; x=1753119189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gAd6Rkyen73tNjJvOebAkq9s/RHbKQsm8pnHr4tqVik=;
        b=cjKD8Rcxd4bpVI7QUORSGqdyX1nPfgXzNLKlk3SuFa54cXJ2BFHtsoNfDP6w/Tdjwm
         Tl/2MIv14+Fl/ZWHV0SdyvmFgP1ghrvfsBHSbtFSwVtxZoQNSJzxzmLWeNY/5NHJWYpo
         WAv3cuj4sFmULzUX08eeI33j/FNAy8fPoKeT7EkxANzxMcBj7/CbBkkygJ3g29fcvccb
         tCXa2FBUQngoUM0JABBLI+MJDryxcS3Ke3tyr7hs7rSxCrNT1JvgBJYyRQt3fGs3/aeT
         9NdlxVA4Sr7P9JcqWI/k/ICBfHR4UAP+3jlE1sdt2TKVxQ/f1iqGT9rX8yrxWpVLdf/x
         ZE4w==
X-Gm-Message-State: AOJu0YxmheFaQK0iPzBhrEHbUkIqS13/llrfxtuUiVF6An2JxUmBsmQQ
	whzfw3UQ8ADKnmCOxUqjiYIoL4j+nlXSO6gEl5Q4vfA6gzJRupFJQM2mConXYg==
X-Gm-Gg: ASbGncubBn+4I/3LfhSnOJdSFfzIU9jS35MDG1HYqwjpuZi+QZWUwz0NVLHuMnN/70n
	0IyvMD9vFNRvMALt53iWV6hEjhU+oB+avSJw9IL+6WCNXrWOweelPxj2VaRh3UJGriVmz0PQGrP
	rZM5Ytg3A3zp7epyO0toIVztzeX0n3qeQY9+wIes4faTFwfBarF51OpE2Sa0MdGy+jIVO6p9+yC
	Noh4N2N2gF1tsrwakcYb8KJOZZVdWLXPVo7GlYKCHN10QnKUMNljIyTGk7coSWek90Iio04dFZb
	cBvxbGVdL2HvWyPViIpqxCIjjUAh1AlVmKmQV5U1WhrF+SkkGRNrww4kLsHFzfCg/1F+o10j/RI
	ZUWEYuQt4oBorA8CYgY+Rm6V43iND8zUFSDHQ5WDz9A==
X-Google-Smtp-Source: AGHT+IHc59B9gZABOX+fpbV0P00G/YpuCa+MqrAP4ToQMSd9SjNPAre7amzrVSe3SnFsPJXH5FzjEA==
X-Received: by 2002:a05:6a00:4644:b0:74c:e253:6c83 with SMTP id d2e1a72fcca58-74ee12977cemr17596336b3a.6.1752514388225;
        Mon, 14 Jul 2025 10:33:08 -0700 (PDT)
Received: from hiagonb.tailf8f1f.ts.net ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f90d66sm10626359b3a.173.2025.07.14.10.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 10:33:07 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>,
	"Marko, Peter" <Peter.Marko@siemens.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH v2] mtd-utils: add optional systemd service for ubihealthd
Date: Mon, 14 Jul 2025 14:32:40 -0300
Message-Id: <20250714173240.44572-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 17:33:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220257

From: Hiago De Franco <hiago.franco@toradex.com>

Add support for deploying a ubihealthd.service systemd unit through a
new 'ubihealthd-service' PACKAGECONFIG option.

This change allows systems using systemd to easily enable and manage the
UBI health monitoring daemon as a background service.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
v2:
 - 'systemd' removed from 'ubihealthd-service' PACKAGECONFIG.
 - Added the correct '{PN}-ubifs' for SYSTEMD_SERVICE variable override.
 - Added a PACKAGECONFIG check for SYSTEMD_SERVICE, it will only include
   the service file if 'ubihealthd-service' is enable.
v1:
 - https://lore.kernel.org/openembedded-core/20250712015604.148635-1-hiagofranco@gmail.com/
---
 .../mtd/files/ubihealthd.service              | 10 +++++++++
 meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb  | 21 ++++++++++++++++---
 2 files changed, 28 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/mtd/files/ubihealthd.service

diff --git a/meta/recipes-devtools/mtd/files/ubihealthd.service b/meta/recipes-devtools/mtd/files/ubihealthd.service
new file mode 100644
index 000000000000..74b8df655b5c
--- /dev/null
+++ b/meta/recipes-devtools/mtd/files/ubihealthd.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=UBI health daemon
+After=multi-user.target
+
+[Service]
+Type=forking
+ExecStart=@SBINDIR@/ubihealthd
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb b/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
index 47f0b01abe0f..08ab6776768c 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
 
-inherit autotools pkgconfig update-alternatives
+inherit autotools pkgconfig systemd update-alternatives
 
 DEPENDS = "zlib e2fsprogs util-linux"
 RDEPENDS:mtd-utils-tests += "bash"
@@ -17,7 +17,8 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master \
            file://0002-ubifs-utils-journal-Include-sys-stat.h.patch \
            file://0003-ubifs-utils-link-libmissing.a-in-case-execinfo.h-isn.patch \
            file://0004-ubifs-utils-extract_files-Include-linux-limits.h.patch \
-           file://0001-Improve-check-for-GCC-compiler-version.patch"
+           file://0001-Improve-check-for-GCC-compiler-version.patch \
+           file://ubihealthd.service"
 
 # xattr support creates an additional compile-time dependency on acl because
 # the sys/acl.h header is needed. libacl is not needed and thus enabling xattr
@@ -29,6 +30,7 @@ PACKAGECONFIG[crypto] = "--with-crypto,--without-crypto,openssl"
 PACKAGECONFIG[jffs] = "--with-jffs,--without-jffs"
 PACKAGECONFIG[ubifs] = "--with-ubifs,--without-ubifs"
 PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
+PACKAGECONFIG[ubihealthd-service] = ",,"
 
 CPPFLAGS:append:riscv64  = " -pthread -D_REENTRANT"
 
@@ -54,6 +56,9 @@ ALTERNATIVE_LINK_NAME[flash_lock] = "${sbindir}/flash_lock"
 ALTERNATIVE_LINK_NAME[flash_unlock] = "${sbindir}/flash_unlock"
 ALTERNATIVE_LINK_NAME[flashcp] = "${sbindir}/flashcp"
 
+SYSTEMD_SERVICE:${PN}-ubifs = "${@bb.utils.contains('PACKAGECONFIG', 'ubihealthd-service', 'ubihealthd.service', '', d)}"
+SYSTEMD_AUTO_ENABLE = "disable"
+
 do_install () {
 	oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
 	install -d ${D}${includedir}/mtd
@@ -64,6 +69,12 @@ do_install () {
 	install -m 0644 ${S}/include/libubigen.h ${D}${includedir}
 	oe_libinstall -a libubi ${D}${libdir}/
 	oe_libinstall -a libmtd ${D}${libdir}/
+
+	if ${@bb.utils.contains('PACKAGECONFIG', 'ubihealthd-service', 'true', 'false', d)}; then
+		install -d ${D}${systemd_system_unitdir}
+		install -m 0644 ${UNPACKDIR}/ubihealthd.service ${D}${systemd_system_unitdir}
+		sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdir}/ubihealthd.service
+	fi
 }
 
 PACKAGES =+ "mtd-utils-misc mtd-utils-tests"
@@ -71,7 +82,11 @@ PACKAGES =+ "${@bb.utils.contains("PACKAGECONFIG", "jffs", "mtd-utils-jffs2", ""
 PACKAGES =+ "${@bb.utils.contains("PACKAGECONFIG", "ubifs", "mtd-utils-ubifs", "", d)}"
 
 FILES:mtd-utils-jffs2 = "${sbindir}/mkfs.jffs2 ${sbindir}/jffs2dump ${sbindir}/jffs2reader ${sbindir}/sumtool"
-FILES:mtd-utils-ubifs = "${sbindir}/mkfs.ubifs ${sbindir}/ubi*"
+FILES:mtd-utils-ubifs = "\
+    ${sbindir}/mkfs.ubifs \
+    ${sbindir}/ubi* \
+    ${@bb.utils.contains('PACKAGECONFIG', 'ubihealthd-service', '${systemd_system_unitdir}/ubihealthd.service', '', d)} \
+    "
 FILES:mtd-utils-misc = "${sbindir}/nftl* ${sbindir}/ftl* ${sbindir}/rfd* ${sbindir}/doc* ${sbindir}/serve_image ${sbindir}/recv_image"
 FILES:mtd-utils-tests = "${libexecdir}/mtd-utils/*"
 
-- 
2.39.5


