Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7971477E50
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 05:43:13 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id u48so1699815qtc.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 22:43:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=wY+tLqvUC+pMgva8hFDU90IIOs6XqQYXkViEonJhhF4=;
	b=e1/tx18MVG/wHjSc2Zw1uf6gHKNTikdttGyMb0GraJRbWdwEdGzt80maYgJiBXBDRE
	HYPnUPLiGSvY+WzzO6alEU1YG4ip9DhIVr1UfVXE2IZEcgw3564sY3DCdn5iTqzKKvMG
	ctRdcm+0Hfo+w2E89YI4CC64eUsoR9EWh42+Qa1HVIDqM5uU5+hRiIpZKAzjf3R2vgRb
	2fkWy4Fe58k4xYAeGzy5cVvnfiwnTElKEpjZafr8+wbBlwJFqhXYgL3zE+aBxRXtKbBC
	ahDojXnzponlnqAktvagMY2Ej82F3Pf/wE9YprSiOwWnRSN6INjmsmcQkqnhs1Pu5sMP
	O20g==
X-Gm-Message-State: AHPjjUgHIsBG7P+pDuUaMbXlxi6OmZ9uycgxWTi80jsVmD+NJvqvD6V3
	S88Y18MXlQ8o049pG7W0ZMtd7g==
X-Google-Smtp-Source: AOwi7QC2ZyOUT+Wlina69+lLwcdRcLmXGRr9id2W1fhorsZxlDs69soRHRAJuW7LDgMlnChTXXQugA==
X-Received: by 10.237.61.108 with SMTP id h41mr347289qtf.213.1505799795116;
	Mon, 18 Sep 2017 22:43:15 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	y31sm6557515qta.83.2017.09.18.22.43.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Sep 2017 22:43:13 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 19 Sep 2017 02:43:06 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Sep 2017 02:43:05 -0300
Message-Id: <20170919054305.20628-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
Organization: O.S. Systems Software LTDA.
Cc: trini@konsulko.com, Otavio Salvador <otavio@ossystems.com.br>,
	lukma@denx.de, marek.vasut@gmail.com
Subject: [PATCH v2] u-boot-fw-utils: Fix cross and target builds
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
X-List-Received-Date: Tue, 19 Sep 2017 05:43:14 -0000

 - The environment tools target has change to envtools;
 - The HOSTCC variable must be used to set CC for cross;
 - The ARCH variable must be set for cross;

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
- pass V=1 for cross - sorry

 meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
index c2e8f0fb84..1f92159bef 100644
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
@@ -5,13 +5,13 @@ DEPENDS = "mtd-utils"
 
 INSANE_SKIP_${PN} = "already-stripped"
 EXTRA_OEMAKE_class-target = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" V=1'
-EXTRA_OEMAKE_class-cross = 'ARCH=${TARGET_ARCH} CC="${CC} ${CFLAGS} ${LDFLAGS}" V=1'
+EXTRA_OEMAKE_class-cross = 'ARCH=${ARCH} HOSTCC="${CC} ${CFLAGS} ${LDFLAGS}" V=1'
 
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


