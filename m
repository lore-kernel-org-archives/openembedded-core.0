Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1R7LHX-0003ti-TL
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Sep 2011 08:00:12 +0200
Received: by ywf7 with SMTP id 7so4316423ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2011 22:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=NeFCMko1yTP809vc8Sq08kG8kF/qmLpaW0DtzSrpvoQ=;
	b=FzxrZNw/MyVECPLOllgXqGYDUbpe3jAUxVjPoRzNr8UgrhEZnfIA7EtXv2z4gG8iqc
	rxU3mrooztHAQAEh0sechSpM4AAgvyTvtbwSZqFmbgTn0OaMNRbUiyefylQ6e/Hh17S5
	FmjUT8VBkMUlre8xzEe9+DKYEigm/EXDYG2oo=
Received: by 10.151.144.7 with SMTP id w7mr3432187ybn.59.1316843688509;
	Fri, 23 Sep 2011 22:54:48 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id s19sm47242916anm.20.2011.09.23.22.54.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Sep 2011 22:54:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Sep 2011 22:54:25 -0700
Message-Id: <1316843665-26137-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] gnome-doc-utils: Prepend PKG_CONFIG_SYSROOT_DIR to the path returned from PKG_CONFIG
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
X-List-Received-Date: Sat, 24 Sep 2011 06:00:12 -0000

If we build say gnome based image on a build system which does not have
gnome e.g. kubuntu then packages like gedit do not build since it uses
gnome files from host system which are non existent on kubuntu

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gnome-doc-utils/sysrooted-pkg-config.patch     |   37 ++++++++++++++++++++
 meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb |    6 ++-
 2 files changed, 41 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-gnome/gnome/gnome-doc-utils/sysrooted-pkg-config.patch

diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils/sysrooted-pkg-config.patch b/meta/recipes-gnome/gnome/gnome-doc-utils/sysrooted-pkg-config.patch
new file mode 100644
index 0000000..e17e8b4
--- /dev/null
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils/sysrooted-pkg-config.patch
@@ -0,0 +1,37 @@
+In cross environment we have to prepend the sysroot to the path found by
+pkgconfig since the path returned from pkgconfig does not have sysroot prefixed
+it ends up using the files from host system. Now usually people have gnome installed
+so the build succeeds but if you dont have gnome installed on build host then
+it wont find the files on host system and packages using gnome-doc-utils wont
+compile.
+
+This should work ok with non sysrooted builds too since in those cases PKG_CONFIG_SYSROOT_DIR
+will be empty
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: gnome-doc-utils-0.20.6/tools/gnome-doc-utils.make
+===================================================================
+--- gnome-doc-utils-0.20.6.orig/tools/gnome-doc-utils.make	2011-09-23 22:22:26.000000000 -0700
++++ gnome-doc-utils-0.20.6/tools/gnome-doc-utils.make	2011-09-23 22:30:03.479787196 -0700
+@@ -133,12 +133,12 @@ _DOC_ABS_SRCDIR = @abs_srcdir@
+ _xml2po ?= `which xml2po`
+ _xml2po_mode = $(if $(DOC_ID),mallard,docbook)
+ 
+-_db2html ?= `$(PKG_CONFIG) --variable db2html gnome-doc-utils`
+-_db2omf  ?= `$(PKG_CONFIG) --variable db2omf gnome-doc-utils`
+-_malrng  ?= `$(PKG_CONFIG) --variable malrng gnome-doc-utils`
+-_chunks  ?= `$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/chunks.xsl
+-_credits ?= `$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/credits.xsl
+-_ids ?= $(shell $(PKG_CONFIG) --variable xmldir gnome-doc-utils)/gnome/xslt/docbook/utils/ids.xsl
++_db2html ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable db2html gnome-doc-utils`
++_db2omf  ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable db2omf gnome-doc-utils`
++_malrng  ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable malrng gnome-doc-utils`
++_chunks  ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/chunks.xsl
++_credits ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/credits.xsl
++_ids ?= ${PKG_CONFIG_SYSROOT_DIR}$(shell $(PKG_CONFIG) --variable xmldir gnome-doc-utils)/gnome/xslt/docbook/utils/ids.xsl
+ 
+ if ENABLE_SK
+ _ENABLE_SK = true
diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb b/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb
index c65cf64..9e3d4c4 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb
@@ -1,10 +1,12 @@
 require gnome-doc-utils.inc
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=eb723b61539feef013de476e68b5c50a \
 		    file://COPYING.LGPL;md5=a6f89e2100d9b6cdffcea4f398e37343"
-PR = "r5"
+PR = "r6"
 
 SRC_URI += "file://xsltproc_nonet.patch \
-	    file://use-usr-bin-env-for-python-in-xml2po.patch"
+	    file://use-usr-bin-env-for-python-in-xml2po.patch \
+            file://sysrooted-pkg-config.patch \
+           "
 
 SRC_URI[archive.md5sum] = "8f6e05071599bc073007830ea0a68391"
 SRC_URI[archive.sha256sum] = "091486e370480bf45349ad09dac799211092a02938b26a0d68206172cb6cebbf"
-- 
1.7.5.4



