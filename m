Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QND4S-0006Xa-6x
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 01:56:05 +0200
Received: by pwj9 with SMTP id 9so1523105pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 16:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=FdPaX2EI4J/xyqIih4/aFYV/NwuAQN+NSLhAe/pumjs=;
	b=WJEL39MM+4m8j6HG7YFc8VbQPISw+In7OIqVg2fWFZ+OFtr6OLNIenwXVIa8dHQnNe
	y3V8xqMW/pDS2NLwzBZJysmZMO61iXRKHyJ3Crutr9ezF6Q9BLNNgNpOXFU/XCQx/ssc
	fTWOSOHLxBqhWfkaEcgLv9MqK/Ypgs3gNP7/c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=OJDl2ijweXlOErdxHCQwc2BYDvLIpo45BLjDF3vsABfmGMZ/V1DaM4OptOZH1VmkBn
	PGMKwzZ/fqcg52hKghxt+SVlK2xcBDpHrcTJ/aB8GHLjXKs5Szia53FuI9xJhURDpmfm
	bDszJhZLW3L1krrrI3/I1ICVAJMU8GzMrgDdU=
Received: by 10.68.4.167 with SMTP id l7mr3416340pbl.2.1305849169536;
	Thu, 19 May 2011 16:52:49 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id z5sm2067303pbb.5.2011.05.19.16.52.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 May 2011 16:52:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 19 May 2011 16:52:30 -0700
Message-Id: <0a1ad440f372eec668b742c775188249c9609f11.1305848960.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1305848960.git.raj.khem@gmail.com>
References: <cover.1305848960.git.raj.khem@gmail.com>
Subject: [PATCHv2 1/2] opkg_svn.bb: Install rcS.d into ${D} instead of ${IMAGE_ROOTFS}
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
X-List-Received-Date: Thu, 19 May 2011 23:56:05 -0000

Remove headerfix.patch, its already applied upstream

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/opkg/opkg/headerfix.patch |   19 -------------------
 meta/recipes-devtools/opkg/opkg_svn.bb          |    3 +--
 2 files changed, 1 insertions(+), 21 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg/opkg/headerfix.patch

diff --git a/meta/recipes-devtools/opkg/opkg/headerfix.patch b/meta/recipes-devtools/opkg/opkg/headerfix.patch
deleted file mode 100644
index b3515a0..0000000
--- a/meta/recipes-devtools/opkg/opkg/headerfix.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Without this, the FILE reference in this header can cause compile issues.
-
-RP - 29/1/10
-
-Upstream-Status: Pending
-
-Index: trunk/libopkg/pkg_dest.h
-===================================================================
---- trunk.orig/libopkg/pkg_dest.h	2010-01-29 09:37:22.000000000 +0000
-+++ trunk/libopkg/pkg_dest.h	2010-01-29 09:37:33.000000000 +0000
-@@ -18,6 +18,8 @@
- #ifndef PKG_DEST_H
- #define PKG_DEST_H
- 
-+#include <stdio.h>
-+
- typedef struct pkg_dest pkg_dest_t;
- struct pkg_dest
- {
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index 5964a47..dfe71e5 100644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -11,7 +11,6 @@ RREPLACES_${PN} = "opkg-nogpg"
 
 SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
            file://add_vercmp.patch \
-           file://headerfix.patch \
 "
 
 S = "${WORKDIR}/trunk"
@@ -34,7 +33,7 @@ do_install_append() {
 pkg_postinst_${PN} () {
 #!/bin/sh
 if [ "x$D" != "x" ]; then
-	install -d ${IMAGE_ROOTFS}/${sysconfdir}/rcS.d
+	install -d ${D}/${sysconfdir}/rcS.d
 	# this happens at S98 where our good 'ole packages script used to run
 	echo "#!/bin/sh
 opkg-cl configure
-- 
1.7.4.1



