Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.11315.1607008154082934773
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 07:09:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=qB/RYBU0;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id q10so1482599pfn.0
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 07:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=qogv8SDH/BsI/Pjhhc+93OdSVmqvxNToKPKb5YpllZ0=;
        b=qB/RYBU0DqRk7z9iIGnFsi0/jHyWbWB115sqjIcXVDZi3DbIdQhUFO0kwdRcg7e/Us
         fSfmynUF6HeTZ2MscyIq/rZNDlU3iRJo0bOJ5pjArUu5Sz5UkJuFJ3qu7DD1et8GbJbf
         neGHdQzNYmEFS/e4TqdGOhOgjXHlH4EkhVnGgziLnaAWMFZMyN/j/JZEVqcC6jvPGZWL
         3onRO0o+b+NNJQlDsShElP5n1KP+A8O30pPG88bQnHQ0LjI9YAWrdY552FVeEceWibfB
         b0DCzFu1eVYi8Rm4FFvgWGT8dlEyWxDH4mRhryp6KJODL7T222aGB65q19qKk47F23Vi
         1FcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=qogv8SDH/BsI/Pjhhc+93OdSVmqvxNToKPKb5YpllZ0=;
        b=a8x9InBHhRyYm8eYM8K1jYneYx5SoF0FeiR8N57mp0J3oBkNLUVMKEvxGeMedFx5CE
         6QeiO1Sg1lo2LqhLiWAkqsH9NT5hsrSQmrSGyUnk1GzTzmLCQm5zzgyDcRBt7tmxKik5
         g8aWt60delIyIKttxC1GtZt68/Iq2CqTzthdoTKpMpoc2iiwW7+U4Y/rkib+0nXmSgJc
         3fbMIOmYyUvqRRT2qPX0t6kUF9aaMzHa2mBv0lVnPjZ1UGIHKkJxHjQoUU2aGD06n6Yp
         tg0FHkCIZaoq3jIvNEJJ+PmhVQQVZ0vltpKyqSaRpYFO6ChILExVd04VSBnwm0Rl+XGN
         bBmg==
X-Gm-Message-State: AOAM531RzxQE2Or0YOAFg87LF4tDTCVOWArUYpkz3DEo5NLM4L5ZPcHf
	xkaUAcJ9A8IBYbCuTTVE2L79hRGsW3AkfMa2
X-Google-Smtp-Source: ABdhPJwkRAwEDFrkGewNwCJ0GRdal3Joc4iqJ+4VdHLj8qymcTQWM0OpXUYHcMacHuiQOA3PK6yilw==
X-Received: by 2002:aa7:8812:0:b029:199:25e7:4ab7 with SMTP id c18-20020aa788120000b029019925e74ab7mr1682962pfo.30.1607008152672;
        Thu, 03 Dec 2020 07:09:12 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s7sm1632320pju.37.2020.12.03.07.09.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 07:09:11 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/28] base/bitbake.conf: Enable pseudo path filtering
Date: Thu,  3 Dec 2020 05:08:03 -1000
Message-Id: <2098efa83790fcb61bfa95574816b6aeb236fb20.1607007208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607007208.git.steve@sakoman.com>
References: <cover.1607007208.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

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
(cherry picked from commit ad8f5532ffaead9a5ad13e1034fe9e5e1b7979f4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index 1a3c190604..5de5075817 100644
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
index 7aa2e144eb..a710abdbd7 100644
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
index 196c86814e..70ea46ef5b 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -40,6 +40,8 @@ IMAGE_CMD_wic () {
 IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES TOPDIR"
 do_image_wic[cleandirs] = "${WORKDIR}/build-wic"
 
+PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/build-wic"
+
 # Rebuild when the wks file or vars in WICVARS change
 USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
 WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 3e5b1359d6..9b066209d9 100644
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
index 9e6b68b6b6..93a27521fd 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -686,13 +686,15 @@ SRC_URI = ""
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
@@ -874,8 +876,8 @@ BB_CONSOLELOG ?= "${LOG_DIR}/cooker/${MACHINE}/${DATETIME}.log"
 
 # Setup our default hash policy
 BB_SIGNATURE_HANDLER ?= "OEBasicHash"
-BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DIR \
-    SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL \
+BB_HASHEXCLUDE_COMMON ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DIR \
+    THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL \
     USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST \
     STAMPS_DIR PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MAKE \
     CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE CCACHE_NOHASHDIR LICENSE_PATH SDKPKGSUFFIX \
@@ -883,7 +885,8 @@ BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DI
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
index d5a6200562..beaccdc909 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -477,6 +477,8 @@ def OEOuthashBasic(path, sigfile, task, d):
     h = hashlib.sha256()
     prev_dir = os.getcwd()
     include_owners = os.environ.get('PSEUDO_DISABLED') == '0'
+    if "package_write_" in task or task == "package_qa":
+        include_owners = False
     include_timestamps = False
     if task == "package":
         include_timestamps = d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1'
diff --git a/scripts/postinst-intercepts/update_font_cache b/scripts/postinst-intercepts/update_font_cache
index 46bdb8c572..900db042d6 100644
--- a/scripts/postinst-intercepts/update_font_cache
+++ b/scripts/postinst-intercepts/update_font_cache
@@ -5,6 +5,8 @@
 
 set -e
 
+rm -f $D${fontconfigcachedir}/CACHEDIR.TAG
+
 PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D -E ${fontconfigcacheenv} $D${libexecdir}/${binprefix}fc-cache --sysroot=$D --system-only ${fontconfigcacheparams}
 
 chown -R root:root $D${fontconfigcachedir}
-- 
2.17.1

