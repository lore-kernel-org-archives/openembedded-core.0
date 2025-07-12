Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775E4C83F1B
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 01:56:32 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.28786.1752285389377574425
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jul 2025 18:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mtKHUYxJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: hiagofranco@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-23649faf69fso21269935ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 18:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752285388; x=1752890188; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=233JiaaPLpSfyKv3ZyK+7tL7SdH2zvfq7/+pFKBy7Dk=;
        b=mtKHUYxJM0ZsJKtz5Sjy6Tfk0WqNr8pfc8dREJuUc8qh9Mtnpht88KUXMjr2Fkg+w/
         1/mGExDffsQPqZkWTs1j1t5Ovl6xBMjdwecoq4KNGjIeWv6lypYLJ7Oo77/3C/ymRiy6
         dRPqXBKts7t80kY7SYTYzvsjnM4xt//LN4BdixN+VqMjDFkncFas1icBq+vru7paHl7l
         YPgK70/fzQN6UNJ+3HEu0A3/j768kJy53qmpAwPHZsOuJN93IzaxUY4VjjrPuhl1+vSw
         5mhMVG97A1LYPBW6T5HiWPmvgpgEtrXAolqI+551hqyP7/I/z5qMUrGCr8R4WqzP7sLd
         UphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752285388; x=1752890188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=233JiaaPLpSfyKv3ZyK+7tL7SdH2zvfq7/+pFKBy7Dk=;
        b=NnJ4ABSsfW6w/VLAw+YcyUbIth7UhEbAnhbQQ1RZDD2GlyjkCkQ7aDeo7sZvtd/34I
         JjNxNTmFGxzl7xNL/V8Md5AWHM/+j8kCV+z3BqWgz9pgt0E7rdm45WjKEGrRaT4NnimV
         EevGzit8imjYX+RckMqjZVGgwrIkECYBX1vRaH/KeRgCLBYmChG555d7veqXvuC8ULlp
         8VEm/63us6nFrXWFFLcoA9Pcicw2Jww3w/UWDoIA3BrglitnKv5R1Nx1eRd7rmUNDleZ
         NXkxXmHWKjzwutQRrSRbbt3AyDiA84gg4m+t7A6an3C2aMRSfVKiPhb9aYXesALR5umh
         B4Zg==
X-Gm-Message-State: AOJu0YzlZvVDZqyhvONEhGJ4+8Y9WpozYgNh+rsK0A8ZkGUvw70Q9bta
	iPJ6cslaTILUo3cbEMD+6rybNrZ3n2R8HPrRBWFwjV7GOGA1Bra+7sis6Zm6AQ==
X-Gm-Gg: ASbGncv/rWIJQLQ0vpxsNtCs6mnhBHgFNQVE+Brv8JDarb3JvOI3UJrSRCYblrpS25Y
	m/vRd/4hXNRTY2XLVd9vJBP3u80dGVf+SJPj7JOdeyF0sq+U54yXyl0z0gSim3jFIBpKGTQwWkb
	mgUqIBFraIhHsPF1UcaruzjpQAGsZU9gItSqFUgcJIpXRS0bs3Owg5HB/STwc7juhr1zZPHjSER
	/qRD9Fsu5szVS82BPn70TnpgYUS/bCqD2/1IFyJ1GdpqD07/G+laqnFdNgZP4DgultVvTDY5LSI
	IBY757oJGdn3PH5Dr+FOsLReaZsmMXFiTPRFZWv2/x+745+7w6/ePH7WeGCDgS+dM7dNXSYV58M
	n+vdAuS7MgFZEbhcWdXrUwtYaRjEp/Xus8BtyfA==
X-Google-Smtp-Source: AGHT+IFoy+197XRf4efu1XvNNp0a75qsf8NvzzkxgM9WSU9XzB6bKI3zzdOc2G91Jo6Zg6ym9rtqCQ==
X-Received: by 2002:a17:902:fc4b:b0:22d:b243:2fee with SMTP id d9443c01a7336-23dee1e6ffemr66983225ad.13.1752285388341;
        Fri, 11 Jul 2025 18:56:28 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a7c1:459e:e3dd:d2e:b1ee:b9ec])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4365b10sm54982835ad.240.2025.07.11.18.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 18:56:27 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH] mtd-utils: add optional systemd service for ubihealthd
Date: Fri, 11 Jul 2025 22:56:04 -0300
Message-Id: <20250712015604.148635-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Jul 2025 01:56:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220172

From: Hiago De Franco <hiago.franco@toradex.com>

Add support for deploying a ubihealthd.service systemd unit through a
new 'ubihealthd-service' PACKAGECONFIG option.

This change allows systems using systemd to easily enable and manage the
UBI health monitoring daemon as a background service.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
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
index 47f0b01abe0f..d99a1d5c7b70 100644
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
+PACKAGECONFIG[ubihealthd-service] = ",,systemd"
 
 CPPFLAGS:append:riscv64  = " -pthread -D_REENTRANT"
 
@@ -54,6 +56,9 @@ ALTERNATIVE_LINK_NAME[flash_lock] = "${sbindir}/flash_lock"
 ALTERNATIVE_LINK_NAME[flash_unlock] = "${sbindir}/flash_unlock"
 ALTERNATIVE_LINK_NAME[flashcp] = "${sbindir}/flashcp"
 
+SYSTEMD_SERVICE:${PN} = "ubihealthd.service"
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


