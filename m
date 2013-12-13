Return-Path: <B40290@freescale.com>
Received: from am1outboundpool.messaging.microsoft.com
	(am1ehsobe006.messaging.microsoft.com [213.199.154.209])
	by mail.openembedded.org (Postfix) with ESMTP id 710D7610D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 07:06:48 +0000 (UTC)
Received: from mail25-am1-R.bigfish.com (10.3.201.250) by
	AM1EHSOBE006.bigfish.com (10.3.204.26) with Microsoft SMTP Server id
	14.1.225.22; Fri, 13 Dec 2013 07:06:46 +0000
Received: from mail25-am1 (localhost [127.0.0.1])	by mail25-am1-R.bigfish.com
	(Postfix) with ESMTP id 030561202E7	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 07:06:47 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah1fc6hzz1de098h8275bh1de097hz2dh2a8h839he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h2327h2336h1155h)
Received: from mail25-am1 (localhost.localdomain [127.0.0.1]) by mail25-am1
	(MessageSwitch) id 1386918404812981_18845;
	Fri, 13 Dec 2013 07:06:44 +0000 (UTC)
Received: from AM1EHSMHS020.bigfish.com (unknown [10.3.201.240])	by
	mail25-am1.bigfish.com (Postfix) with ESMTP id C2620C0045;
	Fri, 13 Dec 2013 07:06:44 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS020.bigfish.com
	(10.3.207.158) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Fri, 13 Dec 2013 07:06:44 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Fri, 13 Dec 2013 07:06:42 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id rBD76d2p016411;	Fri, 13 Dec 2013 00:06:40 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Dec 2013 15:06:34 +0800
Message-ID: <1386918394-13381-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [PATCH] lttng-modules: build as 64-bit kernel module on e6500
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
X-List-Received-Date: Fri, 13 Dec 2013 07:06:51 -0000
Content-Type: text/plain

   *e6500 is built with 32b rootfs/64b kernel, build lttng-modules as 64bit too.
   *Fix the below build issue on e6500 core:
    | DEBUG: Executing shell function do_make_scripts
    | make: Entering directory `.../tmp/sysroots/t4240qds/usr/src/kernel'
    | CC scripts/mod/empty.o | scripts/mod/empty.c:1:0: error: -mcmodel not supported in this configuration
    | make[2]: *** [scripts/mod/empty.o] Error 1
    | make[1]: *** [scripts/mod] Error 2
    | make: *** [scripts] Error 2

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb b/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb
index dd06546..2a48c1a 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb
@@ -22,6 +22,18 @@ export KERNEL_SRC="${STAGING_KERNEL_DIR}"
 
 S = "${WORKDIR}/git"
 
+# Build as 64-bit kernel module on e6500
+python () {
+
+    promote_kernel = d.getVar('BUILD_64BIT_KERNEL')
+
+    if promote_kernel == "1":
+        d.setVar('KERNEL_CC_append', ' -m64')
+        d.setVar('KERNEL_LD_append', ' -melf64ppc')
+
+}
+
+
 do_install_append() {
 	# Delete empty directories to avoid QA failures if no modules were built
 	find ${D}/lib -depth -type d -empty -exec rmdir {} \;
-- 
1.7.5.4



