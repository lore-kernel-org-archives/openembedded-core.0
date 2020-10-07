Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.9875.1602065697412002521
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 03:14:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eFUxUjgr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id q5so1717075wmq.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2020 03:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oYbfI+rusqIJKkSEtpVMF8qV9wSUNUUN4ay1q7qn8kE=;
        b=eFUxUjgrQ+HzaTyOrSXYC9w5wZ11Q4+PFlo+7TYSPFomoX2CvlviF15PkfzXlYq/uH
         I2e3ILB3GVyURQBXg5LITG4O18D4IkBfy38hEUFcUR+pRkc7m8HbCo7ocDRbjU+//61S
         UXfSXvZA3K4Pvkwz1kLmoKHdF1VgLCFttqLG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oYbfI+rusqIJKkSEtpVMF8qV9wSUNUUN4ay1q7qn8kE=;
        b=Vv4EFB49NVdpbD0tdepBUkpvtmc/j6xPXTHEtP41VEm3ycCIPIHlQ6mXvGgIDW6zAE
         QfOIpfbwtY4ZQeSPg8EiL4Ziqg5UCPNeU1eNpQbS3vRiPgZV3oW7OzewsVlsOXPxfSiO
         Hod6SK+CanuRiJmjW1KQB6sVO5S1W8TNcZf6a2VYbHvXpYtMKN3SnTaCVQtMTn5glQEa
         57/dC4QE725Efu7cBXI9xCsCZlsFTXdTPG7HB/FrEgRlT1XSPLdiyOum/aEMryTmUmEY
         dCU/reemmDMQRd2tbkQOuCGLOi3QbuDqkRdhV++Cp8z/9vr4OvpfzZ58qFTQvRBtzGzK
         ZT4A==
X-Gm-Message-State: AOAM532ZfcadQDpCUiF2FyNwkXAAarq/Vd89gmjLKYWXFr5is1P8ivwE
	R6vRemz7hEOECI9tN67xXrbnLS1lGNpY4A==
X-Google-Smtp-Source: ABdhPJzUy9dVXBH0qcGi0SkHb+hsZRbVfb6ZOHcz6P+jzQuZJIEVYWTTz+pFRr2XPDjCibUduxcDxw==
X-Received: by 2002:a1c:98d4:: with SMTP id a203mr2614022wme.83.1602065695615;
        Wed, 07 Oct 2020 03:14:55 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.c.8.7.1.0.8.4.a.6.c.a.3.f.8.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:f8f3:ac6a:4801:78cf])
        by smtp.gmail.com with ESMTPSA id v2sm2183956wme.19.2020.10.07.03.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 03:14:55 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: seebs@seebs.net
Subject: [PATCH 8/9] base/bitbake.conf: Enable pseudo path filtering
Date: Wed,  7 Oct 2020 11:14:48 +0100
Message-Id: <20201007101449.3132127-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201007101449.3132127-1-richard.purdie@linuxfoundation.org>
References: <20201007101449.3132127-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a pretty big change to the way pseudo operates when used in OpenEmbedded.
Normally, pseudo monitors and logs (adds to its database) any file created or
modified whilst in a fakeroot environment. There are large numbers of files
we simply don't care about the permissions of whilst in that fakeroot context,
for example ${S}, ${B}, ${T}, ${SSTATE_DIR}, the central sstate control
directories,

This change uses new functionality in pseudo to ignore these directory trees,
resulting in a cleaner database with less chance of "stray" mismatches if files
are modified outside pseudo context. It also should reduce some overhead from
pseudo as the interprocess round trip to the server is avoided.

There is a possible complication where some existing recipe may break, for
example, we found a recipe which was writing to "${B}/install" for
"make install" in do_install and since we listed ${B} as not to be tracked,
there were errors trying to chown root for files in this location.

This patch fixes a few corner cases in OE-Core when used with this new
ignore list:

* The archiver directory matched a "${WORKDIR}/deploy*" pattern so was renamed
  to something else since that directory does need its root permissions
* The ${S} and ${B} ignoring is conditional on them being different to ${WORKDIR}
* package_write_* task output (the debs/rpms/ipks) are now owned by the build
  user so we don't want the file ownership information in the hashequiv outhash
  calculation even if they are built under pseudo.
* The fontcache postinstall intercept is run under qemu outside of pseudo context
  so delete files it may delete up front where pseudo can see this.
* SSTATE_DIR is in PSEUDO_PATHS_IGNORE, which is in FAKEROOTENV which is cached
  by bitbake. We therefore need to trigger reparsing if this changes, which means
  SSTATE_DIR can be in BB_HASHBASE_WHITELIST but not BB_HASHCONFIG_WHITELIST.
  Rework the variables to handle this. This otherwise breaks some of our sstate
  tests in oe-selftest.
* Ignore the temp directory wic uses for rebuilding rootfs.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/archiver.bbclass                 |  2 +-
 meta/classes/base.bbclass                     |  5 +++++
 meta/classes/image_types_wic.bbclass          |  2 ++
 meta/classes/populate_sdk_base.bbclass        |  2 ++
 meta/conf/bitbake.conf                        | 13 ++++++++-----
 meta/lib/oe/sstatesig.py                      |  2 ++
 scripts/postinst-intercepts/update_font_cache |  2 ++
 7 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index aff1f9dbb04..598298ef6f6 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -53,7 +53,7 @@ ARCHIVER_MODE[recipe] ?= "0"
 ARCHIVER_MODE[mirror] ?= "split"
 
 DEPLOY_DIR_SRC ?= "${DEPLOY_DIR}/sources"
-ARCHIVER_TOPDIR ?= "${WORKDIR}/deploy-sources"
+ARCHIVER_TOPDIR ?= "${WORKDIR}/archiver-sources"
 ARCHIVER_OUTDIR = "${ARCHIVER_TOPDIR}/${TARGET_SYS}/${PF}/"
 ARCHIVER_RPMTOPDIR ?= "${WORKDIR}/deploy-sources-rpm"
 ARCHIVER_RPMOUTDIR = "${ARCHIVER_RPMTOPDIR}/${TARGET_SYS}/${PF}/"
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 4c681cc870d..6309d709b8d 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -388,6 +388,11 @@ python () {
     oe.utils.features_backfill("DISTRO_FEATURES", d)
     oe.utils.features_backfill("MACHINE_FEATURES", d)
 
+    if d.getVar("WORKDIR") != d.getVar("S"):
+        d.appendVar("PSEUDO_IGNORE_PATHS", ",${S}")
+    if d.getVar("WORKDIR") != d.getVar("B"):
+        d.appendVar("PSEUDO_IGNORE_PATHS", ",${B}")
+
     # Handle PACKAGECONFIG
     #
     # These take the form:
diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 4f888ef6e44..b2e5fb43e85 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -39,6 +39,8 @@ IMAGE_CMD_wic () {
 IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES TOPDIR"
 do_image_wic[cleandirs] = "${WORKDIR}/build-wic"
 
+PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/build-wic"
+
 # Rebuild when the wks file or vars in WICVARS change
 USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
 WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 990505e89b8..61b31d5e5e5 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -178,6 +178,8 @@ do_populate_sdk[sstate-inputdirs] = "${SDKDEPLOYDIR}"
 do_populate_sdk[sstate-outputdirs] = "${SDK_DEPLOY}"
 do_populate_sdk[stamp-extra-info] = "${MACHINE_ARCH}${SDKMACHINE}"
 
+PSEUDO_IGNORE_PATHS .= ",${SDKDEPLOYDIR}"
+
 fakeroot create_sdk_files() {
 	cp ${COREBASE}/scripts/relocate_sdk.py ${SDK_OUTPUT}/${SDKPATH}/
 
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e6338b0c75e..e0f46b09cf4 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -685,13 +685,15 @@ SRC_URI = ""
 PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
 PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
 PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
+PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts"
+
 export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
 #export PSEUDO_BINDIR = "${STAGING_DIR_NATIVE}${bindir_native}"
 #export PSEUDO_LIBDIR = "${STAGING_DIR_NATIVE}$PSEUDOBINDIR/../lib/pseudo/lib
-FAKEROOTBASEENV = "PSEUDO_BINDIR=${PSEUDO_SYSROOT}${bindir_native} PSEUDO_LIBDIR=${PSEUDO_SYSROOT}${prefix_native}/lib/pseudo/lib PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_DISABLED=1"
+FAKEROOTBASEENV = "PSEUDO_BINDIR=${PSEUDO_SYSROOT}${bindir_native} PSEUDO_LIBDIR=${PSEUDO_SYSROOT}${prefix_native}/lib/pseudo/lib PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_IGNORE_PATHS=${PSEUDO_IGNORE_PATHS} PSEUDO_DISABLED=1"
 FAKEROOTCMD = "${PSEUDO_SYSROOT}${bindir_native}/pseudo"
-FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1 PSEUDO_DISABLED=0"
+FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1 PSEUDO_IGNORE_PATHS=${PSEUDO_IGNORE_PATHS} PSEUDO_DISABLED=0"
 FAKEROOTNOENV = "PSEUDO_UNLOAD=1"
 FAKEROOTDIRS = "${PSEUDO_LOCALSTATEDIR}"
 PREFERRED_PROVIDER_virtual/fakeroot-native ?= "pseudo-native"
@@ -873,8 +875,8 @@ BB_CONSOLELOG ?= "${LOG_DIR}/cooker/${MACHINE}/${DATETIME}.log"
 
 # Setup our default hash policy
 BB_SIGNATURE_HANDLER ?= "OEBasicHash"
-BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DIR \
-    SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL \
+BB_HASHEXCLUDE_COMMON ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DIR \
+    THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL \
     USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST \
     STAMPS_DIR PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MAKE \
     CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE CCACHE_NOHASHDIR LICENSE_PATH SDKPKGSUFFIX \
@@ -882,7 +884,8 @@ BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DI
     BB_WORKERCONTEXT BB_LIMITEDDEPS BB_UNIHASH extend_recipe_sysroot DEPLOY_DIR \
     SSTATE_HASHEQUIV_METHOD SSTATE_HASHEQUIV_REPORT_TASKDATA \
     SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSERVE GIT_CEILING_DIRECTORIES"
-BB_HASHCONFIG_WHITELIST ?= "${BB_HASHBASE_WHITELIST} DATE TIME SSH_AGENT_PID \
+BB_HASHBASE_WHITELIST ?= "${BB_HASHEXCLUDE_COMMON} PSEUDO_IGNORE_PATHS BUILDHISTORY_DIR SSTATE_DIR "
+BB_HASHCONFIG_WHITELIST ?= "${BB_HASHEXCLUDE_COMMON} DATE TIME SSH_AGENT_PID \
     SSH_AUTH_SOCK PSEUDO_BUILD BB_ENV_EXTRAWHITE DISABLE_SANITY_CHECKS \
     PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV BB_INVALIDCONF BBINCLUDED \
     GIT_PROXY_COMMAND ALL_PROXY all_proxy NO_PROXY no_proxy FTP_PROXY ftp_proxy \
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 21ae0a7657f..4b8f264012c 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -482,6 +482,8 @@ def OEOuthashBasic(path, sigfile, task, d):
     h = hashlib.sha256()
     prev_dir = os.getcwd()
     include_owners = os.environ.get('PSEUDO_DISABLED') == '0'
+    if "package_write_" in task or task == "package_qa":
+        include_owners = False
     extra_content = d.getVar('HASHEQUIV_HASH_VERSION')
 
     try:
diff --git a/scripts/postinst-intercepts/update_font_cache b/scripts/postinst-intercepts/update_font_cache
index 46bdb8c572b..900db042d64 100644
--- a/scripts/postinst-intercepts/update_font_cache
+++ b/scripts/postinst-intercepts/update_font_cache
@@ -5,6 +5,8 @@
 
 set -e
 
+rm -f $D${fontconfigcachedir}/CACHEDIR.TAG
+
 PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D -E ${fontconfigcacheenv} $D${libexecdir}/${binprefix}fc-cache --sysroot=$D --system-only ${fontconfigcacheparams}
 
 chown -R root:root $D${fontconfigcachedir}
-- 
2.25.1

