Return-Path: <mac@mcrowe.com>
X-Greylist: delayed 451 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 05 Oct 2018 13:56:59 UTC
Received: from avasout03.plus.net (avasout03.plus.net [84.93.230.244])
	by mail.openembedded.org (Postfix) with ESMTP id 3BF3A74579
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 13:56:58 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id 8QTvgf59GO2g28QTwgTcjK; Fri, 05 Oct 2018 14:49:28 +0100
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=DKChHRFb c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=smKx5t2vBNcA:10 a=Q4-j1AaZAAAA:8 a=-An2I_7KAAAA:8
	a=sDvd-inOrAXmIWsuIfUA:9
	a=fviYiCotTKoA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Sq34B_EcNBM9_nrAYB9S:22
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>)
	id 1g8QTu-0001Fv-7y; Fri, 05 Oct 2018 14:49:26 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Oct 2018 14:49:13 +0100
Message-Id: <20181005134913.30271-2-mac@mcrowe.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181005134913.30271-1-mac@mcrowe.com>
References: <20181005134913.30271-1-mac@mcrowe.com>
X-CMAE-Envelope: MS4wfM0R8wYwViErlGbKdKWKmGBdutlzo0AoTDeICLNj4rbxElFQ6THTvPbYHIaomW02kDjhk65CS8qXHROeryF8UcMV5KtSXLpNlUjLwV5prA5ME/AT4OYC
	yXkcoR3ofuK5zsCzFj0rEIh1nmMSZJCZHAJP5C/OzB5OTRQ70G6Ui+RN
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] gcc: Remove unnecessary --with-mpfr and --with-mpc when cross compiling
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
X-List-Received-Date: Fri, 05 Oct 2018 13:56:59 -0000

Passing --with-mpfr and --with-mpc when compiling the cross compiler
appears to be at best unnecessary, and at worst can cause build failures.

Firstly, the paths passed in gcc-cross-canadian are using the undefined
${layout_exec_prefix}. This results in configure passing
-I${STAGING_DIR_HOST}/include twice to the compiler when it's doing its
test builds. This is mostly pointless since that directory doesn't exist
with the default oe-core configuration - the correct path would be
-I${STAGING_DIR_HOST}/usr/include.

The path for mpfr passed in gcc-cross is correct, but unnecessary since it
is just the sysroot default.

I've gone back through the history, and it seems that these lines (or
similar ones) were originally added way back in
8800d8be25295dd7c7d84dde62c3be4df8e43346 for GCC 4.1.1 in 2006! I asked[1]
if anyone knew why this was necessary but received no response, so I can
only assume that no-one knows.

I've successfully built for various targets with this patch applied and
observed no problems.

[1] http://lists.openembedded.org/pipermail/openembedded-core/2018-September/155971.html

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 5 -----
 meta/recipes-devtools/gcc/gcc-cross.inc          | 1 -
 2 files changed, 6 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index bdd6f7ec82..2f32d3407f 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -160,11 +160,6 @@ SYSTEMLIBS1 = "${target_libdir}/"
 
 EXTRA_OECONF += "--enable-poison-system-directories"
 
-EXTRA_OECONF += "\
-    --with-mpfr=${STAGING_DIR_HOST}${layout_exec_prefix} \
-    --with-mpc=${STAGING_DIR_HOST}${layout_exec_prefix} \
-"
-
 EXTRA_OECONF_append_libc-baremetal = " --without-headers"
 EXTRA_OECONF_remove_libc-baremetal = "--with-sysroot=/not/exist"
 EXTRA_OECONF_remove_libc-baremetal = "--with-build-sysroot=${STAGING_DIR_TARGET}"
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 95f5968fd4..89b19684be 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -28,7 +28,6 @@ EXTRA_OECONF_append_sh4 = " \
 "
 
 EXTRA_OECONF += "\
-    --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native} \
     --with-system-zlib \
 "
 
-- 
2.11.0


