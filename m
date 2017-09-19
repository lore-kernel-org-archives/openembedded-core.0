Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5C30B71AC5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 05:41:15 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id d70so1642024qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 22:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=vsDmaTvVk/q2Ulfj9+0ndBq2O86mMRiBm3z5X/oHj7g=;
	b=izD8UziXhZmaJXB/lUwN7WO5KEPYFzzAeZsYSp7R37vXuAvEi1IEh9VySEXU9EdcPk
	RxYCiLwRdG1DGQcUQqKqV3FdEsEhAk4ymtCsAfjs6LFNvkim75MT+IeTzkfpC3VgkBcA
	8Lzg7es+gqCDyS0dO2rPbPzL1MkdRu0FUiHsSKme8SdNudJRoUeHyaG7m1tWj8K3NnWY
	DySMMlRnV7XSE2808naxgwKUGVQpgMWMpYxazSMQNW/76BkLScVSqsvoHomH3hxO8VsX
	k0ZuAnkIDqq4EIFzhbna+oHYpIyDfMy2Slrr0wvcV4AUC2UMoVrmV/iFoYjwMc5BR2lC
	6kzg==
X-Gm-Message-State: AHPjjUireDl11w4Ur+/0cMFZGd+shhWVaI+UK9ABWjPGfJZ7QhChp1Mo
	IyPEglLma2cWo2/otklYmLPIrw==
X-Google-Smtp-Source: AOwi7QBOP4Q/NOWle8H9zlzpa8Intnk8SLM3jAhqjGbNyLRbiyqIPo6b/upLGNsYhKwI/Bc2mL9Frg==
X-Received: by 10.55.52.207 with SMTP id b198mr386939qka.60.1505799676927;
	Mon, 18 Sep 2017 22:41:16 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	m20sm6459848qtm.22.2017.09.18.22.41.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Sep 2017 22:41:16 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 19 Sep 2017 02:41:05 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Sep 2017 02:40:58 -0300
Message-Id: <20170919054058.20380-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
Organization: O.S. Systems Software LTDA.
Cc: trini@konsulko.com, Otavio Salvador <otavio@ossystems.com.br>,
	lukma@denx.de, marek.vasut@gmail.com
Subject: [PATCH] u-boot-fw-utils: Fix cross and target builds
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
X-List-Received-Date: Tue, 19 Sep 2017 05:41:16 -0000

 - The environment tools target has change to envtools;
 - The HOSTCC variable must be used to set CC for cross;
 - The ARCH variable must be set for cross;

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
index c2e8f0fb84..21ab5b3e6d 100644
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
@@ -5,13 +5,13 @@ DEPENDS = "mtd-utils"
 
 INSANE_SKIP_${PN} = "already-stripped"
 EXTRA_OEMAKE_class-target = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" V=1'
-EXTRA_OEMAKE_class-cross = 'ARCH=${TARGET_ARCH} CC="${CC} ${CFLAGS} ${LDFLAGS}" V=1'
+EXTRA_OEMAKE_class-cross = 'ARCH=${ARCH} HOSTCC="${CC} ${CFLAGS} ${LDFLAGS}" V=0'
 
-inherit uboot-config
+inherit kernel-arch uboot-config
 
 do_compile () {
 	oe_runmake ${UBOOT_MACHINE}
-	oe_runmake env
+	oe_runmake envtools
 }
 
 do_install () {
-- 
2.14.1


