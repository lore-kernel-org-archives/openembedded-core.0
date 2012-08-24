Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T4lTH-0001VZ-F8
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 06:26:11 +0200
Received: by pbcwy7 with SMTP id wy7so2695260pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2012 21:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=QvImN/mWcOdAco0sR40iJsCe42pRLnIA+3s/FPgA21w=;
	b=bP/sMRnUDrno+lTb45w5/BZJeKBrJk461iPvqkyyqxAUcP9470aRoE4SErSCTUaMEv
	Gx48iXJa9q/1FOt7TC5RqZO+0uDhdUzp5v790VmaqfinvyB3dgDRJ7HQvN7SHU9nRcdF
	hDBKJeewOFNAPXARLpp6xNwfNtk/fbz3un7J6SzaymkAFiGYzu9u7dPmSdE0PfX3pSP6
	qxLBror33OfWal/msG5smMMk7OKJ9jYqsl+f+6TibdSGrb+BgT2Wd4lJ9T2Qj8KmktlN
	kwYvuxjyrbsCE69rJNyc0fqLTMBUupOJjGTlGzop8EZOq8779Va7CyJR90x+TUN95DP9
	hY4w==
Received: by 10.68.231.10 with SMTP id tc10mr9568841pbc.107.1345781643435;
	Thu, 23 Aug 2012 21:14:03 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id vd4sm7411022pbc.41.2012.08.23.21.14.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Aug 2012 21:14:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Aug 2012 21:13:28 -0700
Message-Id: <1345781608-2198-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH V2] iputils: Fix postinst to run on cross rootfs generation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Aug 2012 04:26:11 -0000

rpm shows error messages like /bin/traceroute6 not found
when building cross rootfs

Yocto # 2892

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/iputils/iputils_s20101006.bb |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/iputils/iputils_s20101006.bb b/meta/recipes-extended/iputils/iputils_s20101006.bb
index 62e2b5e..bbaff5e 100644
--- a/meta/recipes-extended/iputils/iputils_s20101006.bb
+++ b/meta/recipes-extended/iputils/iputils_s20101006.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://ping.c;beginline=1;endline=35;md5=f9ceb201733e9a6cf8f
 
 DEPENDS = "openssl docbook-utils-native sgmlspl-native"
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://www.skbuff.net/iputils/${BPN}-${PV}.tar.bz2 \
            file://debian/fix-dead-host-ping-stats.diff \
@@ -59,15 +59,15 @@ ALTERNATIVE_${PN}-ping6 = "ping6"
 ALTERNATIVE_LINK_NAME[ping6] = "${base_bindir}/ping6"
 
 pkg_postinst_${PN}-ping () {
-       chmod 4555 ${base_bindir}/ping
+       chmod 4555 $D${base_bindir}/ping
 }
 
 pkg_postinst_${PN}-ping6 () {
-       chmod 4555 ${base_bindir}/ping6
+       chmod 4555 $D${base_bindir}/ping6
 }
 
 pkg_postinst_${PN}-traceroute6 () {
-	chmod 4555 ${base_bindir}/traceroute6
+	chmod 4555 $D${base_bindir}/traceroute6
 }
 
 PACKAGES += "${PN}-ping ${PN}-ping6 ${PN}-arping ${PN}-tracepath ${PN}-tracepath6 ${PN}-traceroute6"
-- 
1.7.9.5



