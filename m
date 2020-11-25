Received: from smtp1.axis.com (smtp1.axis.com [])
 by mx.groups.io with SMTP id smtpd.web11.6636.1606311051097155170
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2020 05:30:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=onyOYgMI;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=axis.com; l=3646; q=dns/txt; s=axis-central1;
  t=1606311055; x=1637847055;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Rp+y+ThYrc9ZQR7ePeJ8/DegjPhy4B8JzMDMOGgOX0c=;
  b=onyOYgMIvNaQScYJFMjIl2TTiarWC68B7p2AD511Z5kWZetIng6lBSyk
   58ODpYLosHuN2v161VkWu4bncL4wHENT7cLuq1zuDix8f1EgnjPLaOYzv
   AHAVhkPEyTb4NMlUqbEn7JHds10+ORxbH8kSUgPQwbOJ/Wv8RG2j2mMWk
   sxbrlz7zcye/JsmgYPho31r2PJJzhtLu1fFHkuc2B2B0aV2zp0x8Olmq8
   GWQoTFFRWmA+upaEjOYAIWx48V2vUqPdoxIkK4K7XP8dOwD1vaNMgibgr
   rjGRfly7TzxK+kp33MePqkxrFWzDv46Eab+eiGjIN+NfE8chEYV3sH6vf
   w==;
IronPort-SDR: IYOII+2p+xY9BSLJlzM4/+mhM13mrShFk6CUeRc8ybIs0md5uqyk3tJdOYi9buZUW4XePtSiZr
 Ocsf1aYU6CgW2KU6FnHGvpirw55pQspMX1iRAOMmydfStpHrFB6wlPLjy/rLSdV8m/STk/PoBg
 t0ll16pa7N9s24ynRPD4aYvyBoPwaU8eYSDG5eKESaE0PbZpltbofS716Beu6dnaI6eRm46xeC
 L1oqiv0DxwaCUedMLxqZKjQveqCEwHLmdkPyfRAq3HQJCpEQwcql/m7Y5Y9LAc/roxdXA8uBLR
 PDU=
X-IronPort-AV: E=Sophos;i="5.78,368,1599516000"; 
   d="scan'208";a="15421898"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/4] bitbake.conf: Canonicalize paths in PSEUDO_IGNORE_PATHS
Date: Wed, 25 Nov 2020 14:30:39 +0100
Message-ID: <6a67c9795e44b0c91de8abb855e67bc5c1d251d1.1606310940.git.pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <cover.1606310940.git.pkj@axis.com>
References: <cover.1606310940.git.pkj@axis.com>
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
