Return-Path: <B19537@freescale.com>
Received: from db8outboundpool.messaging.microsoft.com
	(mail-db8lp0188.outbound.messaging.microsoft.com [213.199.154.188])
	by mail.openembedded.org (Postfix) with ESMTP id B2A206A507
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 09:00:56 +0000 (UTC)
Received: from mail64-db8-R.bigfish.com (10.174.8.240) by
	DB8EHSOBE036.bigfish.com (10.174.4.99) with Microsoft SMTP Server id
	14.1.225.23; Tue, 28 May 2013 09:00:56 +0000
Received: from mail64-db8 (localhost [127.0.0.1])	by mail64-db8-R.bigfish.com
	(Postfix) with ESMTP id A6B40B006A6	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 09:00:56 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz709fIzz1f42h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ah1fc6hzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dc1h1155h)
Received: from mail64-db8 (localhost.localdomain [127.0.0.1]) by mail64-db8
	(MessageSwitch) id 1369731654110416_20037;
	Tue, 28 May 2013 09:00:54 +0000 (UTC)
Received: from DB8EHSMHS026.bigfish.com (unknown [10.174.8.241])	by
	mail64-db8.bigfish.com (Postfix) with ESMTP id 1932C540050	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 09:00:54 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB8EHSMHS026.bigfish.com
	(10.174.4.36) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 28 May 2013 09:00:52 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Tue, 28 May 2013 09:01:46 +0000
Received: from b19537-desktop.ap.freescale.net
	(b19537-desktop.ap.freescale.net [10.192.208.197])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id r4S90lrU015779;
	Tue, 28 May 2013 02:00:48 -0700
From: Zhenhua Luo <zhenhua.luo@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 May 2013 17:06:24 +0800
Message-ID: <1369731984-16835-1-git-send-email-zhenhua.luo@freescale.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Zhenhua Luo <zhenhua.luo@freescale.com>, b40527@freescale.com
Subject: [PATCH] apr: fix configure issue for ppc64 targets
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
X-List-Received-Date: Tue, 28 May 2013 09:00:57 -0000
Content-Type: text/plain

Fix following error of apr configure for powerpc64 targets:
| configure:27173: checking whether TCP_NODELAY and TCP_CORK can both be enabled
| configure:27179: error: in `/home/yocto/workspace/sdk-devel/build_p5020ds-64b_release/tmp/work/ppc64e5500-fsl-linux/apr/1.4.6-r2/apr-1.4.6':
| configure:27181: error: cannot run test program while cross compiling

Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
---
 meta/recipes-support/apr/apr_1.4.6.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/apr/apr_1.4.6.bb b/meta/recipes-support/apr/apr_1.4.6.bb
index 77dffee..a89d25e 100644
--- a/meta/recipes-support/apr/apr_1.4.6.bb
+++ b/meta/recipes-support/apr/apr_1.4.6.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0c35ff3c4c83b89d2f076e315caac28b \
 
 BBCLASSEXTEND = "native"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://configure_fixes.patch \
@@ -23,6 +23,8 @@ inherit autotools lib_package binconfig multilib_header
 
 OE_BINCONFIG_EXTRA_MANGLE = " -e 's:location=source:location=installed:'"
 
+EXTRA_OECONF_powerpc64 += "apr_cv_tcp_nodelay_with_cork=yes"
+
 do_configure_prepend() {
 	cd ${S}
 	./buildconf
-- 
1.7.9.5



