Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id A4C557FA45
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 14:00:35 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id i12so26874494wro.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 06:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=haCTNdolDgAr5vc2azaUOWwy4yiz2cVcD3OcWNNSDI8=;
	b=IAQrTFsdR5Q3j/r9r00S7fvMXrXqXr6UCbtO1i94jhxa/hinEZdJQl58T8u02pqWlC
	rRf4KE/DbvCUY3vCv3LykASET09Uf1xLq/kL7cYEQAuOOfnilfn7P8+gSf98oG2dS3Ix
	Hedc4MjlyaPH9GVBnyzkK6hHGxVJFysYEeSlYDr0L7ktRGQPdHxQ2EwlrpPuT+dgx8/S
	VjLsmnoi7wNo6U73yc+mu5YWpU+tWRUBGB+nORocorTLK4g/QN3tG9QGy2Vl3DxwjpNF
	ue05JqQhl8+pgbu+9ghvauZMHQi0zOHHDt8/QYsXt88RI+c0L+oXaDyXzYiuUgDF/msy
	NQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=haCTNdolDgAr5vc2azaUOWwy4yiz2cVcD3OcWNNSDI8=;
	b=TL/Mvk84XLQAQU+ufi1yrsN7MjuH6Apx80l3EmSW+2Iw/r173ba9tvLbKPjoSxefOJ
	qcHw0REunOVmZyfdCStoPKTfpuGmdvipRa91tJqBNulqfIG9Mxa989r1sIUv/PnuB7B9
	2LnD7gduHg1jyIRSomWAG0w+CoTG8AlIkjmKRR3z3lyeS7AQ22n0aqVX2Rcet6/gDSoz
	G55bk7tKnG+h4zCtkkWNoJvi2NOCa7kTtQy0B559bUYBiw7XU9ESnFguCnsy2M04TUR2
	lz4eNMbpKQR8o0GzGeWEShDhf6LC7kw42WcgC4+CcpDtABxbShucFnz7zDyhF9OFQYlx
	MUKg==
X-Gm-Message-State: APjAAAUrWmvHQhMxyfoBkJIfehUqr/y3mL1mivEKhRdf19m1kAz69p5h
	FTsR+LedRWx8VZaP9I5X79uxSy2AbY4=
X-Google-Smtp-Source: APXvYqy2LGRCAbsyt67jan1B3nu/2NmFPPjOvslS4a5lbnzWS9z/xnETrpFpYzEfPReof/KnfxTf1w==
X-Received: by 2002:a05:6000:1286:: with SMTP id
	f6mr38490418wrx.44.1574863235927; 
	Wed, 27 Nov 2019 06:00:35 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o1sm19372284wrs.50.2019.11.27.06.00.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 27 Nov 2019 06:00:34 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2019 14:00:25 +0000
Message-Id: <20191127140030.7838-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/6] python: no need to add HOSTPGEN
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
X-List-Received-Date: Wed, 27 Nov 2019 14:00:35 -0000
Content-Transfer-Encoding: 8bit

There's no need to patch in HOSTPGEN when we can just override PGEN directly.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../01-use-proper-tools-for-cross-build.patch   | 17 -----------------
 meta/recipes-devtools/python/python_2.7.17.bb   |  9 ++++++---
 2 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch b/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
index e795a74b911..7d8e95fe5cc 100644
--- a/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
+++ b/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
@@ -16,14 +16,6 @@ Index: Python-2.7.13/Makefile.pre.in
 ===================================================================
 --- Python-2.7.13.orig/Makefile.pre.in
 +++ Python-2.7.13/Makefile.pre.in
-@@ -245,6 +245,7 @@ LIBFFI_INCLUDEDIR=	@LIBFFI_INCLUDEDIR@
- ##########################################################################
- # Parser
- PGEN=		Parser/pgen$(EXE)
-+HOSTPGEN=	$(PGEN)$(EXE)
- 
- PSRCS=		\
- 		Parser/acceler.c \
 @@ -512,7 +513,7 @@ $(BUILDPYTHON):	Modules/python.o $(LIBRA
  			$(BLDLIBRARY) $(LIBS) $(MODLIBS) $(SYSLIBS) $(LDLAST)
  
@@ -33,15 +25,6 @@ Index: Python-2.7.13/Makefile.pre.in
  
  # Create build directory and generate the sysconfig build-time data there.
  # pybuilddir.txt contains the name of the build dir and is used for
-@@ -663,7 +663,7 @@
- 	# Regenerate Include/graminit.h and Python/graminit.c
- 	# from Grammar/Grammar using pgen
- 	@$(MKDIR_P) Include
--	$(PGEN) $(srcdir)/Grammar/Grammar \
-+	$(HOSTPGEN) $(srcdir)/Grammar/Grammar \
- 		$(srcdir)/Include/graminit.h \
- 		$(srcdir)/Python/graminit.c
- 
 @@ -1121,27 +1122,27 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
  			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
  	fi
diff --git a/meta/recipes-devtools/python/python_2.7.17.bb b/meta/recipes-devtools/python/python_2.7.17.bb
index 5b856a50977..6199a5da760 100644
--- a/meta/recipes-devtools/python/python_2.7.17.bb
+++ b/meta/recipes-devtools/python/python_2.7.17.bb
@@ -44,6 +44,9 @@ PACKAGECONFIG ??= "bdb"
 PACKAGECONFIG[bdb] = ",,db"
 PACKAGECONFIG[tk] = ",,tk"
 
+# pgen isn't needed in the current build, but use the binary from python-native just in case.
+EXTRA_OEMAKE = "PGEN=${STAGING_BINDIR_NATIVE}/python-native/pgen"
+
 do_configure_append() {
 	rm -f ${S}/Makefile.orig
         autoreconf -Wcross --verbose --install --force --exclude=autopoint ../Python-${PV}/Modules/_ctypes/libffi
@@ -82,7 +85,7 @@ do_compile() {
 	export CROSS_COMPILE="${TARGET_PREFIX}"
 	export PYTHONBUILDDIR="${B}"
 
-	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python-native/pgen \
+	oe_runmake \
 		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python-native/python \
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
 		STAGING_INCDIR=${STAGING_INCDIR} \
@@ -100,7 +103,7 @@ do_install() {
 
 	# After swizzling the makefile, we need to run the build again.
 	# install can race with the build so we have to run this first, then install
-	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python-native/pgen \
+	oe_runmake \
 		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python-native/python \
 		CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ \
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
@@ -108,7 +111,7 @@ do_install() {
 		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
 		DESTDIR=${D} LIBDIR=${libdir}
 	
-	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python-native/pgen \
+	oe_runmake \
 		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python-native/python \
 		CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ \
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
-- 
2.20.1


