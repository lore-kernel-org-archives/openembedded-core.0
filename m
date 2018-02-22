Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id F0FCB6FFCD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 12:51:48 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id d206so6257329qkb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 04:51:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=diyp203gwzCAVMEJIcqX1r6Gbs1s/ojdQpIG5bpddKM=;
	b=PU0q39oOaTOY76ZgXZUqHHk4OKnr7AUJUqWriA0OstHX0EZE21tlolDdhatYEDzr2i
	uMK+Z7+l3YmN6d+Uqp8PoiCIxIfAH50Ak1OTrl+lsBjkzjoiORmHmwG9Be5UtaLftSmB
	epxA+JiOs61r15z5RiVKnTadBBOLK8KuTVqTcsYq7O2fXUMhWtyfhpfCNRI3XaUu3NM9
	fhV5yR5SQlHJEKoFIWWeeaS5EHZPap+MmVt4M8+sSJeWatBdZf7D5djnNBd7O2gHKcL6
	ZYevRQi8rX6ZsaLQKoRMXiUAFp70h1fowkdvUEaTyuLfP+ghX4YgE996J2WbtSFSp5jR
	YbNw==
X-Gm-Message-State: APf1xPAUKxoo6rzEbGn9FsAb9gjr6e0N3QZ6nUEILGkzJ8+l4CBJy7ub
	JmKCp7s21Bdix74uMQr8LoSGiw==
X-Google-Smtp-Source: AH8x224G8IOF31fyBtnvNR6rc6WD8PfZ7nRpaiT0+M7jGotaZ1xr7ub8rNGwNtcnE3Fa7ctKnDWapw==
X-Received: by 10.55.212.150 with SMTP id s22mr9947662qks.85.1519303909873;
	Thu, 22 Feb 2018 04:51:49 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id q2sm9268qti.81.2018.02.22.04.51.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 22 Feb 2018 04:51:49 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 22 Feb 2018 09:51:42 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Feb 2018 09:51:40 -0300
Message-Id: <20180222125140.2161-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v3] u-boot-mkimage: Add dependency on dtc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Feb 2018 12:51:49 -0000

The dtc is used when generating images which use Device Tree and we
must use the OE version to avoid relying on the host one.

Reported-by: Renato Caldas <rm.santos.caldas@gmail.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v3:
- just rdepends on dtc; it is not used during mkimage build

Changes in v2:
- add rdepends on dtc
- fix depends on dtc-native for native

 meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb
index f1fc5644922..d691cdce658 100644
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb
@@ -2,6 +2,7 @@ require u-boot-common_${PV}.inc
 
 SUMMARY = "U-Boot bootloader image creation tool"
 DEPENDS = "openssl"
+DEPENDS_append_class-native = " dtc-native"
 
 EXTRA_OEMAKE_class-target = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
 EXTRA_OEMAKE_class-native = 'CC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
@@ -24,4 +25,6 @@ do_install () {
 	ln -sf uboot-mkimage ${D}${bindir}/mkimage
 }
 
+RDEPENDS_${PN} += "dtc"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.16.2


