Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id BB90D6DD22
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 00:39:07 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id q59so16152780wes.27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2013 16:39:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=e0vz0AK0KAqznk3grp8mc+uWvN4Mk0jGWlPCl2kqjlk=;
	b=Yd1U8tyMDa+0tNB2Ygy6EYnPf/cyirtr5PQs6597JHni1kcgo0yN6MTJHvGvlZW+9n
	xaH+yy4E/5zBveRDrl7+PLcoJdYlJm+GpcI4siA6MecF4jzZ2w9cnLnnYslaSYmxOzSW
	HG1WHSoersWT5I5v+vk1K4feSqOx0LuO38k4q4i0sWWm0z+CggL6eHNOdg42mE9yOOuh
	c3aYzZLCdRlafiEwvppXS2NspC3jpqTOVZxXjVr9xTGrCAIyf95zeZv5wCVoBPurm6Jl
	S9RGh3De+kqDR2SW4BP4lPXRvSeC4JTwiZoZL/Qm4lj6K3stOrU6YUpoPL/R/wXBczmA
	vWOA==
X-Gm-Message-State: ALoCoQmcC1xOne1UutpgBCxFZkhyDFu1Z3bIr7XEi1DqjUzZtyatGuzaOhRKI3pRdut+IDbe9kfw
X-Received: by 10.180.108.162 with SMTP id hl2mr9542432wib.56.1386203947090;
	Wed, 04 Dec 2013 16:39:07 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id qc10sm1032500wic.9.2013.12.04.16.39.05
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Dec 2013 16:39:06 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2013 00:38:58 +0000
Message-Id: <1386203938-13338-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1386203938-13338-1-git-send-email-ross.burton@intel.com>
References: <1386203938-13338-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH] cmake: respect ${S} and ${B}
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
X-List-Received-Date: Thu, 05 Dec 2013 00:39:08 -0000

Instead of the class-specific variables OECMAKE_BUILDPATH and
OECMAKE_SOURCEPATH, just use ${B} and ${S}.

If these two paths are different, delete any existing ${B} before running a
build so that previous builds don't taint the current build.

Note that OECMAKE_SOURCEPATH and OECMAKE_BUILDPATH are not respected at all, so
recipes that manually set these in the past will need to be updated to either
use something along the lines of separatebuilddir.inc or set B themselves.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/cmake.bbclass |   31 +++++++------------------------
 1 file changed, 7 insertions(+), 24 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 30c1792..4d1489a 100644
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
@@ -73,10 +64,10 @@ EOF
 addtask generate_toolchain_file after do_patch before do_configure
 
 cmake_do_configure() {
-	if [ ${OECMAKE_BUILDPATH} ]
-	then
-		mkdir -p ${OECMAKE_BUILDPATH}
-		cd ${OECMAKE_BUILDPATH}
+	if [ "${S}" != "${B}" ]; then
+		rm -rf ${B}
+		mkdir -p ${B}
+		cd ${B}
 	fi
 
 	# Just like autotools cmake can use a site file to cache result that need generated binaries to run
@@ -88,7 +79,7 @@ cmake_do_configure() {
 
 	cmake \
 	  ${OECMAKE_SITEFILE} \
-	  ${OECMAKE_SOURCEPATH} \
+	  ${S} \
 	  -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
 	  -DCMAKE_INSTALL_SO_NO_EXE=0 \
 	  -DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain.cmake \
@@ -98,20 +89,12 @@ cmake_do_configure() {
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


