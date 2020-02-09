Return-Path: <scott.branden@broadcom.com>
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id A3A4E60F11
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Feb 2020 20:26:21 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id d5so3249104pjz.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Feb 2020 12:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=U+0IDgRDwbniHwof8qCDEpTRO8s+RLWsyqZ2RVgoqZo=;
	b=F5H6uejRgfxYSDwyaip50mRFZerNSmk4NwZavmNoKizm/JALqkDseOOE2tcU8gTJAG
	Re+URYGTQynfgNJQ1b0lHeC+7yYoIyY/TTvs4YDRWth3bb0p2CVz4lndgFQMsF+86wO/
	v1LfvdBr3KHucg45gFKIMgujiPcoLKUPGGxJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=U+0IDgRDwbniHwof8qCDEpTRO8s+RLWsyqZ2RVgoqZo=;
	b=YUwAEivIOY8iUsyNjrtKDyB73XOo3NOWQXwVAT/lvHEsG1XYrBtj4ojPlYmQP2BdJi
	2kMSRawvt2HOIBx6xW60KT9XP9PWRXzFOWDozd8ndcwLQKJsbgPlQQKDhNpv1cyt9aGj
	mI7k356mS/VtikGsgb8aXAiUWeP9oh2Zb594LPRqrfn9VNEXpXNJS+prnL5MClcDHJot
	C2rm2vwRvpjR4yV0lHOm8lgPsIJumbaEtt6URjJ58xAdmYxdenBpHnvNdrDdFSYAvERG
	0O8FAglS6aOc2Irn9e6nEbH1Meb+2ZKLVDStQ2oVsOeSFu8E/NLi53Pt7wFXCJCCT9x1
	ej/Q==
X-Gm-Message-State: APjAAAWtjDBPYXYKT9mkwmMvN5Y3LkiiO5SvtVctXRJpzpM98kj3Aizc
	nwLm27AUCXu3p7vSnFMkF/6E4U4fnE8eAqLZJTWx5z+cOGYK0huvQtNDfccyIPWYt+HXIkNWBGb
	ver2V4/gZi9rAVhMxL8H3sVFouwBVxnnsEPmf+HX3TpuHLJrcAuNgf13LZUvUQkW51lJoPfjosB
	uq7VEdbD3sTJxaGQwrVhETC8nD1UE=
X-Google-Smtp-Source: APXvYqxDVxa7JtJPPrrkUlFDDNyHrve2U+i7d5MXjKzeAMEFCTwcETQunClkJhX03T+0Z85uml7Yvw==
X-Received: by 2002:a17:90a:2351:: with SMTP id
	f75mr16792172pje.133.1581279982080; 
	Sun, 09 Feb 2020 12:26:22 -0800 (PST)
Received: from lbrmn-lnxub113.broadcom.net ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id d3sm8822832pjx.10.2020.02.09.12.26.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 12:26:21 -0800 (PST)
From: Scott Branden <scott.branden@broadcom.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Feb 2020 12:26:00 -0800
Message-Id: <20200209202600.2918-1-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] iproute2: add devlink support to iproute2
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
X-List-Received-Date: Sun, 09 Feb 2020 20:26:21 -0000

Add devlink support to iproute2 recipe.

Signed-off-by: Scott Branden <scott.branden@broadcom.com>
---
 meta/recipes-connectivity/iproute2/iproute2.inc | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index fc31b8444e..6ef9201258 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -15,11 +15,13 @@ inherit update-alternatives bash-completion pkgconfig
 
 CLEANBROKEN = "1"
 
-PACKAGECONFIG ??= "tipc elf"
+PACKAGECONFIG ??= "tipc elf devlink"
 PACKAGECONFIG[tipc] = ",,libmnl,"
 PACKAGECONFIG[elf] = ",,elfutils,"
+PACKAGECONFIG[devlink] = ",,libmnl,"
 
-EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip bridge misc genl \
+EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} DOCDIR=${docdir}/iproute2 SUBDIRS='lib devlink tc ip bridge misc genl \
+                ${@bb.utils.contains('PACKAGECONFIG', 'devlink', 'devlink', '', d)}                                               \
                 ${@bb.utils.contains('PACKAGECONFIG', 'tipc', 'tipc', '', d)}' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
 
 do_configure_append () {
@@ -46,7 +48,8 @@ PACKAGES =+ "${PN}-tc \
              ${PN}-rtacct \
              ${PN}-nstat \
              ${PN}-ss \
-             ${@bb.utils.contains('PACKAGECONFIG', 'tipc', '${PN}-tipc', '', d)}"
+             ${@bb.utils.contains('PACKAGECONFIG', 'tipc', '${PN}-tipc', '', d)} \
+             ${@bb.utils.contains('PACKAGECONFIG', 'devlink', '${PN}-devlink', '', d)}"
 FILES_${PN}-tc = "${base_sbindir}/tc* \
                   ${libdir}/tc/*.so"
 FILES_${PN}-lnstat = "${base_sbindir}/lnstat \
@@ -58,6 +61,7 @@ FILES_${PN}-rtacct = "${base_sbindir}/rtacct"
 FILES_${PN}-nstat = "${base_sbindir}/nstat"
 FILES_${PN}-ss = "${base_sbindir}/ss"
 FILES_${PN}-tipc = "${base_sbindir}/tipc"
+FILES_${PN}-devlink = "${base_sbindir}/devlink"
 
 ALTERNATIVE_${PN} = "ip"
 ALTERNATIVE_TARGET[ip] = "${base_sbindir}/ip.${BPN}"
-- 
2.17.1


