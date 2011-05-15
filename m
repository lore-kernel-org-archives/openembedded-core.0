Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QLVJB-0000AP-Bn
	for openembedded-core@lists.openembedded.org;
	Sun, 15 May 2011 09:00:10 +0200
Received: by pxi6 with SMTP id 6so2799990pxi.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 May 2011 23:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=FrViV9HpkbiwuAwJtRn+Yh68L87oWzN1NFnoZnYnquA=;
	b=S9wtIcHVUbLeKwbRYhML5i8gzF9v/D/DSISPcNUctIpT+QCznkoVmlJTMNTBqYP5+T
	SL2MgE0eXL3fczGQ9NzrGFE1cJhcmAj4gatMiDx9OhL5hXjdNjpAQTQ9sQhpdDavKVpS
	+hmE5uY2n9teb3b/6gzDb1e5XTHhoKCsygn0g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=L/W++MEuVMriz0V7qOEjaHip4LJqQpArbGGgjSFoQ177TcaMQtxw9A8Bgdfkfl4tYJ
	IzOPsSB6jDx/c6BCxk3Vzr3LFUHMupx6yJo4XR6XoMwLm/155URWbGlIChKz7ylRdDrr
	BT6RVpZweJAU6/YL8AROQzQuWwnmv7UvhBHkk=
Received: by 10.68.11.228 with SMTP id t4mr5320124pbb.294.1305442637911;
	Sat, 14 May 2011 23:57:17 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id o20sm2481989pbt.50.2011.05.14.23.57.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 14 May 2011 23:57:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sat, 14 May 2011 23:57:10 -0700
Message-Id: <6694e8260278e184016ebae2c5c1d755afbd30ab.1305442428.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1305442428.git.raj.khem@gmail.com>
References: <cover.1305442428.git.raj.khem@gmail.com>
Subject: [PATCH 1/2] opkg: Bump SRCREV to 609
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
X-List-Received-Date: Sun, 15 May 2011 07:00:10 -0000

Disable curl gpg ssl sha
Backported from OE

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/opkg/opkg.inc    |    8 ++++++--
 meta/recipes-devtools/opkg/opkg_svn.bb |    3 ++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
index 50f1afc..a649213 100644
--- a/meta/recipes-devtools/opkg/opkg.inc
+++ b/meta/recipes-devtools/opkg/opkg.inc
@@ -7,7 +7,6 @@ BUGTRACKER = "http://code.google.com/p/opkg/issues/list"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/opkg-cl.c;beginline=1;endline=20;md5=321f658c3f6b6c832e25c8850b5dffba"
-DEPENDS = "curl gpgme openssl"
 DEPENDS_virtclass-native = "curl-native"
 DEPENDS_virtclass-nativesdk = "curl-nativesdk"
 
@@ -21,9 +20,14 @@ do_configure_prepend() {
 }
 
 inherit autotools pkgconfig
+EXTRA_OECONF += " --disable-gpg \
+                  --disable-openssl \
+                  --disable-ssl-curl \
+                  --disable-curl \
+                  --disable-sha256"
 
 target_localstatedir := "${localstatedir}"
-EXTRA_OECONF = "--with-opkglibdir=${localstatedir}/lib"
+EXTRA_OECONF += "--with-opkglibdir=${localstatedir}/lib"
 EXTRA_OECONF_virtclass-native = "--with-opkglibdir=${target_localstatedir}/lib --disable-gpg --disable-curl --disable-openssl"
 EXTRA_OECONF_virtclass-nativesdk = "--with-opkglibdir=${target_localstatedir}/lib --disable-gpg --disable-curl --disable-openssl"
 
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index 5664a09..5964a47 100644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -7,6 +7,7 @@ RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} opkg-config-base"
 RDEPENDS_${PN}_virtclass-native = ""
 RDEPENDS_${PN}_virtclass-nativesdk = ""
 PACKAGE_ARCH_update-alternatives-cworth = "all"
+RREPLACES_${PN} = "opkg-nogpg"
 
 SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
            file://add_vercmp.patch \
@@ -15,7 +16,7 @@ SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
 
 S = "${WORKDIR}/trunk"
 
-SRCREV = "596"
+SRCREV = "609"
 PV = "0.1.8+svnr${SRCPV}"
 PR = "r2"
 
-- 
1.7.4.1



