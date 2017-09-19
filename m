Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id CE52E780A1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 13:19:52 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id c69so2219663qke.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 06:19:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=EX/Ad8eXczLyfylDrLC/lbmfGwLRF+uVd3Z1idsjAhg=;
	b=dmgQzAuYGD1pnG5EoILsJxG3NMkyZnAJr4wms7TJbNeBpER5VT12/k7gLpeug9S/40
	W60hc71R/nDjKxXbYiT3aBUgEI2LVoIiM/ojpvlBQRQ1BSKbqRsmVezmh94RDU6clkbm
	7oNH0grMwzsNIstG0EUq8q/f7dTgFyW82VAV76S23wiemCCljTDUvffQwqLA/uZLuvAC
	BRYFJlnZ+5XD3+WHpHv9NcIO9ceWloLoxH8RbQOavRW6s4L0vsByD8nYxTgny9r/YBPi
	fISZj2WVrote/L+fA5vGULB6ZC1CSa3iuclB5G0sFd4BCO1JYe3MPJFd5Te79DqLHKyV
	daTg==
X-Gm-Message-State: AHPjjUiM8c6i0wcMXYM9Q20TckWUVqMd50zd7f5fmG0BIkIxUBut38hd
	4lkKjjP3mFF7CgWAFpAmpATCUw==
X-Google-Smtp-Source: AOwi7QAKCeiB+XxyZEvUXY5u0W5Dsq7V6rrCgltv2p1Qt7DrvLXwDA3Zmv6cWjRUaFw3pEPlrtsWhw==
X-Received: by 10.55.18.137 with SMTP id 9mr1883051qks.208.1505827193440;
	Tue, 19 Sep 2017 06:19:53 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	m18sm1098956qtb.77.2017.09.19.06.19.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 19 Sep 2017 06:19:52 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 19 Sep 2017 10:19:42 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Sep 2017 10:19:41 -0300
Message-Id: <20170919131941.23618-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
Organization: O.S. Systems Software LTDA.
Cc: trini@konsulko.com, Otavio Salvador <otavio@ossystems.com.br>,
	marek.vasut@gmail.com
Subject: [PATCH v3] u-boot-fw-utils: Fix cross and target builds
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
X-List-Received-Date: Tue, 19 Sep 2017 13:19:53 -0000

 - The environment tools target has change to envtools;
 - The HOSTCC variable must be used to set CC for cross;
 - Drop ARCH variable as it is set on config;

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v3:
- drop ARCH (trini)

Changes in v2:
- pass V=1 for cross - sorry

 meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
index c2e8f0fb84..02887a138a 100644
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
@@ -5,13 +5,13 @@ DEPENDS = "mtd-utils"
 
 INSANE_SKIP_${PN} = "already-stripped"
 EXTRA_OEMAKE_class-target = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" V=1'
-EXTRA_OEMAKE_class-cross = 'ARCH=${TARGET_ARCH} CC="${CC} ${CFLAGS} ${LDFLAGS}" V=1'
+EXTRA_OEMAKE_class-cross = 'HOSTCC="${CC} ${CFLAGS} ${LDFLAGS}" V=1'
 
 inherit uboot-config
 
 do_compile () {
 	oe_runmake ${UBOOT_MACHINE}
-	oe_runmake env
+	oe_runmake envtools
 }
 
 do_install () {
-- 
2.14.1


