Return-Path: <scott.branden@broadcom.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1A5CF606AA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 20:41:10 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id d6so690101pgn.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 12:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=B1EUfSsIclAPoMmW0HBMP5j0r4pqTxK/PN1J6PH7x0E=;
	b=XV8i9InHS9DVnLdCT7vbDXsGWpSnHDf3W4GfgJht7TVM7YqlDFjmk+bcaUtVoQGbyL
	CBlYh7aQBBVEOOlnaRIEKtpHguEQZ9dLos3C1VyaQ4p9zW+8xNKA1IwVDT5mECDFOTVt
	6QTC2eDoOD7cY5yxiI+GEFuVTPKLjHq+72/ps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=B1EUfSsIclAPoMmW0HBMP5j0r4pqTxK/PN1J6PH7x0E=;
	b=auzv6Yx161fmKihAz3VNRSVFQ//oZOAM1I9FE+aw22qocfLow9ZC8cAe2thoaM/syp
	9LPvnuZpXBWDAK0bEgTehmWBEtzqma2Q0W9H0pCvh5T5zAWP99WsAIi9Vmgt57mz3wQt
	PFgqxpszYkNOiKjAu7JL6bScOHmERBK1PIavo+lw5u4+SPGBW83yPFOiFx03tiHUmqM/
	xxyHSlnxNBFatdq1+VnCeB0N5WurlxKYyHw6aenkkmnl69LAu5QRNERV+XXGC1wxvZ7/
	6HsQbo9qm0Smw5CYpfrg0aJiRW8WtHZIvsfh/rzmjQ3sIk6POU8h2Wy9LQRZNPkxckkT
	UhKQ==
X-Gm-Message-State: APjAAAWOtaSjbTcxclFFPg/tSAVJaIR7MfJvvhLsphQYkFmPJhMuV48J
	ETZQLLU8ABJIh8YepgsFEfuT2jZ5JFImsiXTp3xPF3pYSPU4VAzl3NJ3rKcFOgGYVlYOnzo3mo6
	Y+dLdR/uUgVoJxoTHapZxpC0Ze9FEqi65M0XZhtiyGWHi1fN8qduZC3se57x9X1+J6tSbII64lo
	H7TtD+h7I6nyvCwAJwViVTBElMpew=
X-Google-Smtp-Source: APXvYqw650EVGBuK8XmMd9uMlBuhbgWRfxZ9FfGqFkzO+5bQ4ohasQC6+f9bNLDb3nDnwosOHHVncg==
X-Received: by 2002:a65:4d0d:: with SMTP id i13mr29176479pgt.346.1582144871676;
	Wed, 19 Feb 2020 12:41:11 -0800 (PST)
Received: from lbrmn-lnxub113.broadcom.net ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id a13sm513769pfg.65.2020.02.19.12.41.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 19 Feb 2020 12:41:11 -0800 (PST)
From: Scott Branden <scott.branden@broadcom.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2020 12:41:03 -0800
Message-Id: <20200219204103.14617-1-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH v4] iproute2: add devlink support to iproute2
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
X-List-Received-Date: Wed, 19 Feb 2020 20:41:11 -0000

Add devlink support to iproute2 recipe.

Signed-off-by: Scott Branden <scott.branden@broadcom.com>
---
 .../iproute2/iproute2.inc                     | 34 +++++++++++++------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index fc31b8444e..403d264308 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -15,12 +15,19 @@ inherit update-alternatives bash-completion pkgconfig
 
 CLEANBROKEN = "1"
 
-PACKAGECONFIG ??= "tipc elf"
+PACKAGECONFIG ??= "tipc elf devlink"
 PACKAGECONFIG[tipc] = ",,libmnl,"
 PACKAGECONFIG[elf] = ",,elfutils,"
+PACKAGECONFIG[devlink] = ",,libmnl,"
 
-EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip bridge misc genl \
-                ${@bb.utils.contains('PACKAGECONFIG', 'tipc', 'tipc', '', d)}' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
+EXTRA_OEMAKE = "\
+    CC='${CC}' \
+    KERNEL_INCLUDE=${STAGING_INCDIR} \
+    DOCDIR=${docdir}/iproute2 \
+    SUBDIRS='lib tc ip bridge misc genl ${@bb.utils.filter('PACKAGECONFIG', 'devlink tipc', d)}' \
+    SBINDIR='${base_sbindir}' \
+    LIBDIR='${libdir}' \
+"
 
 do_configure_append () {
     sh configure ${STAGING_INCDIR}
@@ -39,14 +46,18 @@ do_install () {
 # The .so files in iproute2-tc are modules, not traditional libraries
 INSANE_SKIP_${PN}-tc = "dev-so"
 
-PACKAGES =+ "${PN}-tc \
-             ${PN}-lnstat \
-             ${PN}-ifstat \
-             ${PN}-genl \
-             ${PN}-rtacct \
-             ${PN}-nstat \
-             ${PN}-ss \
-             ${@bb.utils.contains('PACKAGECONFIG', 'tipc', '${PN}-tipc', '', d)}"
+PACKAGES =+ "\
+    ${PN}-devlink \
+    ${PN}-genl \
+    ${PN}-ifstat \
+    ${PN}-lnstat \
+    ${PN}-nstat \
+    ${PN}-rtacct \
+    ${PN}-ss \
+    ${PN}-tc \
+    ${PN}-tipc \
+"
+
 FILES_${PN}-tc = "${base_sbindir}/tc* \
                   ${libdir}/tc/*.so"
 FILES_${PN}-lnstat = "${base_sbindir}/lnstat \
@@ -58,6 +69,7 @@ FILES_${PN}-rtacct = "${base_sbindir}/rtacct"
 FILES_${PN}-nstat = "${base_sbindir}/nstat"
 FILES_${PN}-ss = "${base_sbindir}/ss"
 FILES_${PN}-tipc = "${base_sbindir}/tipc"
+FILES_${PN}-devlink = "${base_sbindir}/devlink"
 
 ALTERNATIVE_${PN} = "ip"
 ALTERNATIVE_TARGET[ip] = "${base_sbindir}/ip.${BPN}"
-- 
2.17.1


