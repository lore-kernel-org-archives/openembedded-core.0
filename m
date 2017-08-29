Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 22AA878258
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 07:24:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7T7OVBx001933
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 Aug 2017 00:24:31 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 29 Aug 2017 00:24:30 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>,
	<raj.khem@gmail.com>, <randy.macleod@windriver.com>
Date: Tue, 29 Aug 2017 15:25:17 +0800
Message-ID: <1503991517-3965-2-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503991517-3965-1-git-send-email-yi.zhao@windriver.com>
References: <1503991517-3965-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [PATCH 2/2] iproute2: enable build tipc by default
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
X-List-Received-Date: Tue, 29 Aug 2017 07:24:32 -0000
Content-Type: text/plain

By default, TIPC is enabled as a module in Yocto Kernel:
CONFIG_TIPC=m
CONFIG_TIPC_MEDIA_UDP=y

So we can enable build tipc by default in iproute2.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-connectivity/iproute2/iproute2.inc | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index 57309b7..79ea635 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -9,14 +9,11 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://ip/ip.c;beginline=3;endline=8;md5=689d691d0410a4b64d3899f8d6e31817"
 
-DEPENDS = "flex-native bison-native iptables elfutils"
+DEPENDS = "flex-native bison-native iptables elfutils libmnl"
 
 inherit update-alternatives bash-completion pkgconfig
 
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[tipc] = ",,libmnl,"
-
-EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip bridge misc genl ${@bb.utils.contains('PACKAGECONFIG', 'tipc', 'tipc', '', d)}' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
+EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip bridge misc genl tipc' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
 
 do_configure_append () {
     sh configure ${STAGING_INCDIR}
@@ -35,7 +32,7 @@ do_install () {
 # The .so files in iproute2-tc are modules, not traditional libraries
 INSANE_SKIP_${PN}-tc = "dev-so"
 
-PACKAGES =+ "${PN}-tc ${PN}-lnstat ${PN}-ifstat ${PN}-genl ${PN}-rtacct ${PN}-nstat ${PN}-ss ${@bb.utils.contains('PACKAGECONFIG', 'tipc', '${PN}-tipc', '', d)}"
+PACKAGES =+ "${PN}-tc ${PN}-lnstat ${PN}-ifstat ${PN}-genl ${PN}-rtacct ${PN}-nstat ${PN}-ss ${PN}-tipc"
 FILES_${PN}-tc = "${base_sbindir}/tc* \
                   ${libdir}/tc/*.so"
 FILES_${PN}-lnstat = "${base_sbindir}/lnstat ${base_sbindir}/ctstat ${base_sbindir}/rtstat"
-- 
2.7.4


