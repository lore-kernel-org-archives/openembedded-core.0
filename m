Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id BB71B6EAA9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2014 04:11:59 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id x10so2544134pdj.39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 20:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=KrLZdXOc/v6TY0kN+KkYKVrIx1CQlHu0gIHfeiapqwU=;
	b=aTowk2g6wc+8biYCEijFR2xiCtrYIn7u6yvHRMf0yz9f03uTYQWF4WI7KRGLJ3by4+
	0zFdre8ojCGsZDdcpmcutgM0FIVgxtMgbYerBXKuoD0mRAYs4oJgQZwhgx5V52bTvCb1
	0rJnL3mzVFZNQAuHwbLVXbY7zgZfDWve6DOqGVlQrgi6hUKZYazsXPQ1kdwqz91zeXhA
	YOfaM09tqbRznXGOFtEBld9FImEtGqjCZNbOM+6e+6M6nyLK+BCarbrUYjGfgfncbdiq
	OZ5eTGk1zfVY02+8usGWxTWlao/GxDwULgRjcSzLeXL75eHhPGCpbzRmydzJJqqukR4k
	tj1A==
X-Received: by 10.66.138.40 with SMTP id qn8mr12249446pab.154.1391055121129;
	Wed, 29 Jan 2014 20:12:01 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	iu7sm12388951pbc.45.2014.01.29.20.12.00 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Jan 2014 20:12:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2014 20:12:36 -0800
Message-Id: <d06e1325e86111a1be0ced5513a99e073f6044d3.1391054829.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <c47e65e2da5790bc54aaf1bca87f2702dac64988.1391054829.git.raj.khem@gmail.com>
References: <c47e65e2da5790bc54aaf1bca87f2702dac64988.1391054829.git.raj.khem@gmail.com>
In-Reply-To: <cover.1391054829.git.raj.khem@gmail.com>
References: <cover.1391054829.git.raj.khem@gmail.com>
Subject: [PATCH 14/15] python3: Fix staging warnings due to duplicate install
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
X-List-Received-Date: Thu, 30 Jan 2014 04:11:59 -0000

This fixes the warnings like

WARNING: The recipe python3 is trying to install files into a shared
area when those files already exist. Those files and their manifest
location are:

builds/world/tmp/sysroots/qemux86-64/usr/include/python3.3m/pyconfig.h
builds/world/tmp/sysroots/qemux86-64/usr/lib/libpython3.3m.so.1.0
builds/world/tmp/sysroots/qemux86-64/usr/lib/libpython3.3m.so
builds/world/tmp/sysroots/qemux86-64/usr/lib/python3.3/config/Makefile

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python/python3_3.3.3.bb |   20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.3.3.bb b/meta/recipes-devtools/python/python3_3.3.3.bb
index 643df9e..68b81d8 100644
--- a/meta/recipes-devtools/python/python3_3.3.3.bb
+++ b/meta/recipes-devtools/python/python3_3.3.3.bb
@@ -75,17 +75,6 @@ do_compile() {
         sed -e 's,${STAGING_DIR_HOST},,g' -i *.py
         cd -
 
-	#
-	# Copy config.h and an appropriate Makefile for distutils.sysconfig,
-	# which laters uses the information out of these to compile extensions
-	#
-	# The following part (until python compilation) should probably moved to an
-	# -initial recipe to handle staging better
-	#
-	install -d ${STAGING_INCDIR}/python${PYTHON_BINABI}/
-	install -d ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
-	install -m 0644 pyconfig.h ${STAGING_INCDIR}/python${PYTHON_BINABI}/
-
 	# remove hardcoded ccache, see http://bugs.openembedded.net/show_bug.cgi?id=4144
 	sed -i -e s,ccache,'$(CCACHE)', Makefile
 
@@ -103,7 +92,6 @@ do_compile() {
 		-e 's,^INCLUDEDIR=.*,INCLUDE=${STAGING_INCDIR},g' \
 		-e 's,^CONFINCLUDEDIR=.*,CONFINCLUDE=${STAGING_INCDIR},g' \
 		Makefile
-	install -m 0644 Makefile ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
 	# save copy of it now, because if we do it in do_install and 
 	# then call do_install twice we get Makefile.orig == Makefile.sysroot
 	install -m 0644 Makefile Makefile.sysroot
@@ -120,8 +108,6 @@ do_compile() {
 		ARCH=${TARGET_ARCH} \
 		OPT="${CFLAGS}" libpython3.so
 
-	oe_libinstall -so libpython${PYTHON_BINABI} ${STAGING_LIBDIR}
-
 	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python-native3/pgen \
 		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python-native3/python3 \
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
@@ -163,12 +149,18 @@ do_install() {
 	oe_multilib_header python${PYTHON_MAJMIN}/pyconfig.h
 }
 
+do_install_append_class-nativesdk () {
+	create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo'
+}
+
 SSTATE_SCAN_FILES += "Makefile"
 PACKAGE_PREPROCESS_FUNCS += "py_package_preprocess"
 
 py_package_preprocess () {
 	# copy back the old Makefile to fix target package
 	install -m 0644 Makefile.orig ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
+	# Remove references to buildmachine paths in target Makefile
+	sed -i -e 's:--sysroot=${STAGING_DIR_TARGET}::g' -e s:'--with-libtool-sysroot=${STAGING_DIR_TARGET}'::g ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
 }
 
 require python-${PYTHON_MAJMIN}-manifest.inc
-- 
1.7.10.4


