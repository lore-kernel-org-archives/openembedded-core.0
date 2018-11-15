Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 930956C1A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 08:56:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="48180142"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Nov 2018 16:56:54 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 624A84B714D6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 16:56:52 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Thu, 15 Nov 2018 16:56:59 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <1535847279-58757-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-yoursite-MailScanner-ID: 624A84B714D6.A9EDA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [master][thud][PATCH] nfs-utils: Enable libnfsidmap.
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
Date: Thu, 15 Nov 2018 08:56:55 -0000
X-Original-Date: Sun, 2 Sep 2018 08:14:39 +0800
X-List-Received-Date: Thu, 15 Nov 2018 08:56:55 -0000
Content-Type: text/plain

Because libnfsidmap has been remove, enable libnfsidmap to keep consistency of nfs-utils.

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.1.bb
index 6d450c7..0ff7d2d 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.1.bb
@@ -64,6 +64,7 @@ EXTRA_OECONF = "--with-statduser=rpcuser \
 
 PACKAGECONFIG ??= "tcp-wrappers \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
+    nfsv4 \
 "
 PACKAGECONFIG_remove_libc-musl = "tcp-wrappers"
 PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,--without-tcp-wrappers,tcp-wrappers"
@@ -73,7 +74,7 @@ PACKAGECONFIG[nfsv41] = "--enable-nfsv41,--disable-nfsv41,libdevmapper"
 # keyutils is available in meta-security
 PACKAGECONFIG[nfsv4] = "--enable-nfsv4,--disable-nfsv4,keyutils"
 
-PACKAGES =+ "${PN}-client ${PN}-mount ${PN}-stats"
+PACKAGES =+ "${PN}-client ${PN}-mount ${PN}-stats libnfsidmap"
 
 CONFFILES_${PN}-client += "${localstatedir}/lib/nfs/etab \
 			   ${localstatedir}/lib/nfs/rmtab \
@@ -98,6 +99,8 @@ RDEPENDS_${PN}-stats = "python3-core"
 
 FILES_${PN} += "${systemd_unitdir}"
 
+FILES_libnfsidmap += "${libdir}/libnfsidmap"
+
 do_configure_prepend() {
         sed -i -e 's,sbindir = /sbin,sbindir = ${base_sbindir},g' \
             ${S}/utils/mount/Makefile.am
-- 
2.7.4




