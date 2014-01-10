Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id A603E60D27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 17:55:02 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id w62so4381561wes.20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 09:55:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=zCFsIuenengFE25s5Hg65RTmfYwLTurvNgmQuGlvWwk=;
	b=BTsf6aLKyrgA+Zj6+hwrcKdWV8UkHHRhgVQ6UXdUGBbQK1c8UUISVzaXUjuOWKKizc
	fd7g7xau/wYf4lDoGuDExzUVjFuavPUh+uSG3koyPc21YtmA43yiCaLj8gAShkElAJ3j
	ByZkt81ib6vCJcGR65ob4vDBYxbFeyeNvbHM5AIwt8Np3dYQTXmutjG6so6jEoJETn79
	vaHJKRLmFoyPCygLp5tH9SYCX1lFylrS8KAEAicwJUegZd3JwPJ1YXlDNLJQ+x4DG88L
	UFC/g3BDnD8AGio8Zj+IPxUD0xRvoleYnA+BXElFhcphc9Ob72qQIWpRVme6cMIJAs6C
	qywg==
X-Gm-Message-State: ALoCoQlBLVM/7jwSjeu50LhNIw/SdfK3tD/iIVHhmX1gkPTgJATqdptQQrZbTCCdFLKu4fbOjvzh
X-Received: by 10.194.170.133 with SMTP id am5mr9833163wjc.42.1389376503245;
	Fri, 10 Jan 2014 09:55:03 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id a9sm3686306wiy.10.2014.01.10.09.55.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Jan 2014 09:55:02 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jan 2014 17:54:46 +0000
Message-Id: <1389376488-22286-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1389376488-22286-1-git-send-email-ross.burton@intel.com>
References: <1389376488-22286-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 1/3] cmake: respect ${S} and ${B}
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
X-List-Received-Date: Fri, 10 Jan 2014 17:55:03 -0000

Instead of the class-specific variables OECMAKE_BUILDPATH and
OECMAKE_SOURCEPATH, just use ${B} and ${S}.

If these two paths are different, delete any existing ${B} before running a
build so that previous builds don't taint the current build.

Note that OECMAKE_SOURCEPATH and OECMAKE_BUILDPATH are not respected, so recipes
that manually set these in the past will need to be updated to either use
something along the lines of separatebuilddir.inc or set B themselves.  If the
old variables are set, a warning is displayed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/cmake.bbclass |   35 +++++++++++------------------------
 1 file changed, 11 insertions(+), 24 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 30c1792..1dc406d2 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -6,15 +6,6 @@ CCACHE = ""
 # We want the staging and installing functions from autotools
 inherit autotools
 
-# Use in-tree builds by default but allow this to be changed
-# since some packages do not support them (e.g. llvm 2.5).
-OECMAKE_SOURCEPATH ?= "."
-
-# If declaring this, make sure you also set EXTRA_OEMAKE to
-# "-C ${OECMAKE_BUILDPATH}". So it will run the right makefiles.
-OECMAKE_BUILDPATH ?= ""
-B="${S}"
-
 # C/C++ Compiler (without cpu arch/tune arguments)
 OECMAKE_C_COMPILER ?= "`echo ${CC} | sed 's/^\([^ ]*\).*/\1/'`"
 OECMAKE_CXX_COMPILER ?= "`echo ${CXX} | sed 's/^\([^ ]*\).*/\1/'`"
@@ -73,10 +64,14 @@ EOF
 addtask generate_toolchain_file after do_patch before do_configure
 
 cmake_do_configure() {
-	if [ ${OECMAKE_BUILDPATH} ]
-	then
-		mkdir -p ${OECMAKE_BUILDPATH}
-		cd ${OECMAKE_BUILDPATH}
+	if [ "${OECMAKE_BUILDPATH}" -o "${OECMAKE_SOURCEPATH}" ]; then
+		bbnote "cmake.bbclass no longer uses OECMAKE_SOURCEPATH and OECMAKE_BUILDPATH. This recipe now will do in-tree builds, to do out-of-tree builds set S and B."
+	fi
+
+	if [ "${S}" != "${B}" ]; then
+		rm -rf ${B}
+		mkdir -p ${B}
+		cd ${B}
 	fi
 
 	# Just like autotools cmake can use a site file to cache result that need generated binaries to run
@@ -88,7 +83,7 @@ cmake_do_configure() {
 
 	cmake \
 	  ${OECMAKE_SITEFILE} \
-	  ${OECMAKE_SOURCEPATH} \
+	  ${S} \
 	  -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
 	  -DCMAKE_INSTALL_SO_NO_EXE=0 \
 	  -DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain.cmake \
@@ -98,20 +93,12 @@ cmake_do_configure() {
 }
 
 cmake_do_compile()  {
-	if [ ${OECMAKE_BUILDPATH} ]
-	then
-		cd ${OECMAKE_BUILDPATH}
-	fi
-
+	cd ${B}
 	base_do_compile
 }
 
 cmake_do_install() {
-	if [ ${OECMAKE_BUILDPATH} ];
-	then
-		cd ${OECMAKE_BUILDPATH}
-	fi
-
+	cd ${B}
 	autotools_do_install
 }
 
-- 
1.7.10.4


