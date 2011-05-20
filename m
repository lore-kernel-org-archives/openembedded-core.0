Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QNZ1o-00017I-AS
	for openembedded-core@lists.openembedded.org;
	Sat, 21 May 2011 01:22:44 +0200
Received: by pxi6 with SMTP id 6so3107029pxi.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 16:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=7LHoIaHczhttlwGzzXlVFJ9xcTavOSllHyZLdLxUXbc=;
	b=tWZb5UEAyRWmqzVsl59Ar9+1XI+XbdWod/thEYMEgC9DCyfGpEoUVuOdBNZyeR+rzh
	E10sxQU4cxuFrLRghN10rdapCUQQEXmr0Q5TrUucPh0FXnT6PA3fqtWzdbw8AZQ4kRzf
	hBGpyHpUquWjlO+cQi2iDK0bwX1vfko6UY2fU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=BvZ/RR1exaT5sJLiT9S5dKodeYXwFAaPLprp0VydBDu1U+3EAPBEn+io03tyc3vzpa
	xqiuZuKbAiITdh9FpvLnaplIxMhk5Ee/m9LEJlHD5bnej86qLyWoXa0Me253yBFOSdCS
	61iwP6H57N5R/mbQFeRl6b0oFlL86XFqWU9C0=
Received: by 10.142.247.7 with SMTP id u7mr23517wfh.255.1305933586284;
	Fri, 20 May 2011 16:19:46 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x15sm2787929wfd.0.2011.05.20.16.19.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 May 2011 16:19:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Fri, 20 May 2011 16:19:31 -0700
Message-Id: <43cfb965113150ea56c55c3880b67ba272b3c719.1305933509.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1305933509.git.raj.khem@gmail.com>
References: <cover.1305933509.git.raj.khem@gmail.com>
Subject: [PATCH 1/2] opkg_svn.bb: Install rcS.d into ${D} instead of ${IMAGE_ROOTFS}
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
X-List-Received-Date: Fri, 20 May 2011 23:22:44 -0000

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
index 5964a47..3f2c22b 100644
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
+	install -d $D/${sysconfdir}/rcS.d
 	# this happens at S98 where our good 'ole packages script used to run
 	echo "#!/bin/sh
 opkg-cl configure
-- 
1.7.4.1



