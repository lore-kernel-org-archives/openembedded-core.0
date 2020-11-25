Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.6954.1606312098403602466
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2020 05:48:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=k3Kswz/l;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=axis.com; l=3646; q=dns/txt; s=axis-central1;
  t=1606312098; x=1637848098;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Rp+y+ThYrc9ZQR7ePeJ8/DegjPhy4B8JzMDMOGgOX0c=;
  b=k3Kswz/lxbWjKUB5gpL4mrdWK+QuZN3ZdCEglEFmQ/CBOO/vijpxZmr3
   c7sLd8sYwNkGrDx4pRQ6PLuitBN7h00GKC+1DZ8/IXx2R5Xu8Fa9h9DT2
   fRPzRapvxQctxjOF96+KeYO6yVoUbHnRr1HSGC6cfA+phxWahYyw7m86r
   adJJdWOl/NlPFj0jOCvKLV66+flEXBm0SwoM38F0vcNGFWLjFlvDzZD+z
   d4Al7AoP/QcE4j0Biw/kxm7nnXMnZIWAepnx/CLFqh7oDH3F7nd/NZasz
   vYtGHo0nKphwSYoOgprLN92DdRbSs66e546rIkg3f3LA8Jl4f9SScSfeO
   Q==;
IronPort-SDR: dx6RTPUj0hG1FPW3fd0QTTj8oKyf+6K0jsdZiGGafFKRIRlp0j8Y2J+Eskx69Pzwm8N6+l4em/
 IxUuYFMkG/9biXuUyKp9bMBIaiELpknOxwBkQ8nnpp1KWyZCpDikur6IBTnRqcd4ofgsY3FVIL
 gfNbOqkDDG/gbfIONqzuudE2FGST4AUuljt8VQvL//GpmynioSTbvnO0KAvrewoP9tw3UD7c5B
 LxFIGuBzwkaDp7yJQRtVG/pZhe5X/OQTSgXL/va6rUVdUmbc9rGWvBPThhd/cHOFePw/7jTtS9
 1mU=
X-IronPort-AV: E=Sophos;i="5.78,368,1599516000"; 
   d="scan'208";a="14882342"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 3/4] bitbake.conf: Canonicalize paths in PSEUDO_IGNORE_PATHS
Date: Wed, 25 Nov 2020 14:48:12 +0100
Message-ID: <9b62c1babb6a53472329d57fa6ec2ac8ed70a3f8.1606312002.git.pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <cover.1606312002.git.pkj@axis.com>
References: <cover.1606312002.git.pkj@axis.com>
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Introduce PSEUDO_IGNORE_REAL_PATHS and make it contain the canonicalized
paths from PSEUDO_IGNORE_PATHS, obtained by passing the latter to
oe.path.to_real_paths(). This is needed since pseudo's
pseudo_client_ignore_path_chroot() will compare the ignored paths to
paths that have been canonicalized.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/conf/bitbake.conf | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9742fe4fe2..4862095a1b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -685,15 +685,16 @@ SRC_URI = ""
 PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
 PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
 PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
+PSEUDO_IGNORE_REAL_PATHS = "${@','.join(os.path.realpath(path) for path in (d.getVar('PSEUDO_IGNORE_PATHS') or '').split(','))}"
 PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${@','.join(d.getVar('BBLAYERS').split())},${CCACHE_DIR}"
 
 export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
 #export PSEUDO_BINDIR = "${STAGING_DIR_NATIVE}${bindir_native}"
 #export PSEUDO_LIBDIR = "${STAGING_DIR_NATIVE}$PSEUDOBINDIR/../lib/pseudo/lib
-FAKEROOTBASEENV = "PSEUDO_BINDIR=${PSEUDO_SYSROOT}${bindir_native} PSEUDO_LIBDIR=${PSEUDO_SYSROOT}${prefix_native}/lib/pseudo/lib PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_IGNORE_PATHS=${PSEUDO_IGNORE_PATHS} PSEUDO_DISABLED=1"
+FAKEROOTBASEENV = "PSEUDO_BINDIR=${PSEUDO_SYSROOT}${bindir_native} PSEUDO_LIBDIR=${PSEUDO_SYSROOT}${prefix_native}/lib/pseudo/lib PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_IGNORE_PATHS=${PSEUDO_IGNORE_REAL_PATHS} PSEUDO_DISABLED=1"
 FAKEROOTCMD = "${PSEUDO_SYSROOT}${bindir_native}/pseudo"
-FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1 PSEUDO_IGNORE_PATHS=${PSEUDO_IGNORE_PATHS} PSEUDO_DISABLED=0"
+FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1 PSEUDO_IGNORE_PATHS=${PSEUDO_IGNORE_REAL_PATHS} PSEUDO_DISABLED=0"
 FAKEROOTNOENV = "PSEUDO_UNLOAD=1"
 FAKEROOTDIRS = "${PSEUDO_LOCALSTATEDIR}"
 PREFERRED_PROVIDER_virtual/fakeroot-native ?= "pseudo-native"
@@ -884,7 +885,8 @@ BB_HASHEXCLUDE_COMMON ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DI
     BB_WORKERCONTEXT BB_LIMITEDDEPS BB_UNIHASH extend_recipe_sysroot DEPLOY_DIR \
     SSTATE_HASHEQUIV_METHOD SSTATE_HASHEQUIV_REPORT_TASKDATA \
     SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSERVE GIT_CEILING_DIRECTORIES"
-BB_HASHBASE_WHITELIST ?= "${BB_HASHEXCLUDE_COMMON} PSEUDO_IGNORE_PATHS BUILDHISTORY_DIR SSTATE_DIR "
+BB_HASHBASE_WHITELIST ?= "${BB_HASHEXCLUDE_COMMON} PSEUDO_IGNORE_PATHS \
+    PSEUDO_IGNORE_REAL_PATHS BUILDHISTORY_DIR SSTATE_DIR "
 BB_HASHCONFIG_WHITELIST ?= "${BB_HASHEXCLUDE_COMMON} DATE TIME SSH_AGENT_PID \
     SSH_AUTH_SOCK PSEUDO_BUILD BB_ENV_EXTRAWHITE DISABLE_SANITY_CHECKS \
     PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV BB_INVALIDCONF BBINCLUDED \
