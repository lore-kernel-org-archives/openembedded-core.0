Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6A3F971A18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 12:41:39 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id h129so6209483qke.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 04:41:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=G6Zv3NC8GXHYB9LoqJtkKgiOJy+bEmkvpH4Ru229KYI=;
	b=kt2Znd9uKKCzTbJTLWVmnuA+Kb8P4RD8E+N2dMeujNGoQEDF3LwFPTYc09QqiZ0G2/
	NdIp25kJWaI/axgQCUgRxRRcdmG+t1zXC5lKq0EepB8XensSI0yEHUOBPLeRvavLRo5E
	tl1w/espTqZmtZphkq9NPJInl7ZkgBPWy+szAd6Ka2pcBa1A1bC192NbzLqEiyj6kCBd
	vwi5Jd64VaHgIYWeSwe7QvJQmvUEvOxSrCzMFXnh5NakIbQfCFGY5E1rEJy0DHHJwO3/
	AaL3gilI0O63dncOCH6xBYz2F1xBTl6wEh2UbAEZOOogHb/dEysxwY99rBBkx1CLFJOe
	MQ/Q==
X-Gm-Message-State: APf1xPAJC9VWZJZi29AhObMerTtYa7VogEoFjZzun9YSWhX79NUAGQcv
	eHSuSrDlb1OYq65aYYNsXe8o8g==
X-Google-Smtp-Source: AH8x224HNSRhkZXqqzyQU80efRQemWUxGpliLMJGbTFuW3erP5Pha3ELvbhxgZRM1VV4zUZCa59Xcw==
X-Received: by 10.55.152.71 with SMTP id a68mr10451927qke.297.1519303300108;
	Thu, 22 Feb 2018 04:41:40 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id x49sm2230qth.62.2018.02.22.04.41.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 22 Feb 2018 04:41:39 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 22 Feb 2018 09:41:32 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Feb 2018 09:41:30 -0300
Message-Id: <20180222124130.29581-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2] u-boot-mkimage: Add dependency on dtc
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
X-List-Received-Date: Thu, 22 Feb 2018 12:41:39 -0000

The dtc is used when generating images which use Device Tree and we
must use the OE version to avoid relying on the host one.

Reported-by: Renato Caldas <rm.santos.caldas@gmail.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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


