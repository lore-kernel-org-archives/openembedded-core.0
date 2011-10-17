Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RFpAB-0008IF-Jh
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Oct 2011 17:31:39 +0200
Received: by eyd9 with SMTP id 9so3001201eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 08:25:42 -0700 (PDT)
Received: by 10.14.15.16 with SMTP id e16mr377459eee.72.1318865141874;
	Mon, 17 Oct 2011 08:25:41 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id t14sm30307595eeh.7.2011.10.17.08.25.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Oct 2011 08:25:40 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Oct 2011 17:25:34 +0200
Message-Id: <1318865134-4380-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] bind 9.8.1: fix build after recent update
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Oct 2011 15:31:39 -0000

| checking linking as -lgssapi -lkrb5 -ldes -lcrypt -lasn1 -lroken -lcom_err... no
| checking linking as -lgssapi -lkrb5 -lcrypto -lcrypt -lasn1 -lroken -lcom_err... no
| checking linking as -lgss -lkrb5... no
| configure: error: could not determine proper GSSAPI linkage
| + bbfatal 'oe_runconf failed'
| + echo 'ERROR: oe_runconf failed'

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-connectivity/bind/bind_9.8.1.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/bind/bind_9.8.1.bb b/meta/recipes-connectivity/bind/bind_9.8.1.bb
index 330acdb..af473e9 100644
--- a/meta/recipes-connectivity/bind/bind_9.8.1.bb
+++ b/meta/recipes-connectivity/bind/bind_9.8.1.bb
@@ -6,10 +6,10 @@ LICENSE = "ISC & BSD"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=0fbe2a3ab3c68ac3fea3cad13093877c"
 
 DEPENDS = "openssl"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
-	   file://conf.patch \
+           file://conf.patch \
            file://cross-build-fix.patch \
 	   "
 
@@ -19,6 +19,7 @@ SRC_URI[sha256sum] = "02285dc429cb2a6687a1b2446e9ee22c1df27f2577225b05be5092395e
 # --enable-exportlib is necessary for building dhcp
 EXTRA_OECONF = " --enable-ipv6=no --with-randomdev=/dev/random --disable-threads \
                  --disable-devpoll --disable-epoll --with-gost=no \
+                 --with-gssapi=no \
                  --sysconfdir=${sysconfdir}/bind \
                  --with-openssl=${STAGING_LIBDIR}/.. --with-libxml2=${STAGING_LIBDIR}/.. \
                  --enable-exportlib --with-export-includedir=${includedir} --with-export-libdir=${libdir} \
-- 
1.6.6.1



