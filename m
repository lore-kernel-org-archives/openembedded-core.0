Return-Path: <liu.ming50@gmail.com>
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
	[209.85.208.45])
	by mail.openembedded.org (Postfix) with ESMTP id DDCF37BE3C
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Aug 2019 13:03:16 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id d4so76363586edr.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Aug 2019 06:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=IemNmq/GN0hv7As2xlDl9xzEOoWTSJNVcQ5OyfuxjLA=;
	b=BzXUVMC4vLxfnO+p2BM+dGCRCvebVihLtUrAaGA2kDLb1g9N8vVY0kyTVwKhkc9PKX
	Z9WzvnYEbYP228EI3iF2AUSMxwVlJyoR0Kx9O9vLEMMj+2uZENNo9xWrC7VE4pEIvmR2
	cq/wnt/620Cw5nXkl/gmluD5jtbzj81hOyLpjQI9nYc/M/3lZ/m9xArBl/JAXPLdt1GY
	BK5bdIyeqeK8xz9YW2mbg7po6SIoSclKXu81ZiDNMtg2crRBBZ1+ZcxG5ZZXwIJvs6Vr
	Z/EVvqq67UYnNfMu71oX+rskgnhWUQYuxVJAqlHWg3zMHKFrq/3toSHaVRq7XpM3X0ir
	TWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IemNmq/GN0hv7As2xlDl9xzEOoWTSJNVcQ5OyfuxjLA=;
	b=U1bJyhYvTKCqwy2W4EJ8Plo+4sS4OcwZsdopUrIC98gj1qW0oh/u6gv3FKVLh+MklN
	6hwo/On1pgccqIBtBxCi3c0zoVfv7FQjt9WleEMk7ljwlaHaJPBmJJXSaDQjOy5YVNVy
	J2rRqz0+doqIfSEHBD9jTDG3Nz5RS+SEsH60TjAp5FpWw30WL8bH6xqHwEdF3CWzDs++
	isYcO812Cd4cEGjR9dCbjemYkL1gNmu+0zQBRS3JUy7NMrJ3SIFK6DIXL1cMpl6fHYZE
	hdtHe2yrZaFfGyFFKw94N0KZgug9BCnon3dosDYFPY2OGggbri0wH3SoF+Z/KHEc3kYw
	trFg==
X-Gm-Message-State: APjAAAXT8rz6eFpaNTh4rO/owgWJ86TTxVTiCB8YEQLzpNg1Z4gFKPBu
	zvh1nHAtj50Z9ydfGynEbePpZFpY3xY=
X-Google-Smtp-Source: APXvYqxe0OIFNoz0NgRFN8X4TcCT7J6YcPs06mwwrHsioi8ZbNwLYqcBvQG34T/EHnXVwO7GS6P7aQ==
X-Received: by 2002:a50:9846:: with SMTP id h6mr126045869edb.263.1564923797304;
	Sun, 04 Aug 2019 06:03:17 -0700 (PDT)
Received: from peterliu-Precision-7530.toradex.int ([27.191.200.33])
	by smtp.gmail.com with ESMTPSA id
	y22sm18520275edw.94.2019.08.04.06.03.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 04 Aug 2019 06:03:16 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Aug 2019 21:03:06 +0800
Message-Id: <1564923786-13805-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] opensbi: handle deploy task under sstate
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
X-List-Received-Date: Sun, 04 Aug 2019 13:03:17 -0000

From: Ming Liu <liu.ming50@gmail.com>

Inherit deploy bbclass and install files to DEPLOYDIR rather than in
DEPLOY_DIR_IMAGE.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-bsp/opensbi/opensbi_0.4.bb | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-bsp/opensbi/opensbi_0.4.bb b/meta/recipes-bsp/opensbi/opensbi_0.4.bb
index 068ae76..3827528 100644
--- a/meta/recipes-bsp/opensbi/opensbi_0.4.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_0.4.bb
@@ -6,7 +6,7 @@ DEPENDS += "dtc-native"
 
 require opensbi-payloads.inc
 
-inherit autotools-brokensep
+inherit autotools-brokensep deploy
 
 SRCREV = "ce228ee0919deb9957192d723eecc8aaae2697c6"
 SRC_URI = "git://github.com/riscv/opensbi.git \
@@ -35,13 +35,12 @@ do_install_append() {
 }
 
 do_deploy () {
-	install -d ${DEPLOY_DIR_IMAGE}
-	install -m 755 ${D}/platform/${RISCV_SBI_PLAT}/firmware/fw_payload.* ${DEPLOY_DIR_IMAGE}/
-	install -m 755 ${D}/platform/${RISCV_SBI_PLAT}/firmware/fw_jump.* ${DEPLOY_DIR_IMAGE}/
-	install -m 755 ${D}/platform/${RISCV_SBI_PLAT}/firmware/fw_dynamic.* ${DEPLOY_DIR_IMAGE}/
+	install -m 755 ${D}/platform/${RISCV_SBI_PLAT}/firmware/fw_payload.* ${DEPLOYDIR}/
+	install -m 755 ${D}/platform/${RISCV_SBI_PLAT}/firmware/fw_jump.* ${DEPLOYDIR}/
+	install -m 755 ${D}/platform/${RISCV_SBI_PLAT}/firmware/fw_dynamic.* ${DEPLOYDIR}/
 }
 
-addtask deploy after do_install
+addtask deploy before do_build after do_install
 
 FILES_${PN} += "/platform/${RISCV_SBI_PLAT}/firmware/fw_jump.*"
 FILES_${PN} += "/platform/${RISCV_SBI_PLAT}/firmware/fw_payload.*"
-- 
2.7.4


