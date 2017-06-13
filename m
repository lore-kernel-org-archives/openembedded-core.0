Return-Path: <amarnath.valluri@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 77C466FEFE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 13:25:54 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Jun 2017 06:25:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,338,1493708400"; d="scan'208";a="273652038"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by fmsmga004.fm.intel.com with ESMTP; 13 Jun 2017 06:25:55 -0700
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 16:26:39 +0300
Message-Id: <1497360399-27837-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <79e824d5a63a459e8913c4066efd8463@XBOX02.axis.com>
References: <79e824d5a63a459e8913c4066efd8463@XBOX02.axis.com>
Subject: [PATCH v4 3/8] systemd: changes to support merged /usr
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
X-List-Received-Date: Tue, 13 Jun 2017 13:25:55 -0000

- Enable/disable the split-usr support in systemd based on 'usrmerge'
  DISTRO_FEATURE.
- Modify rootprefix to point to ${root_prefix}, rather than ${base_prefix}.
- And fixed firmware path to use ${nonarch_base_libdir} instead of hard-coded
  '/lib', because when 'usrmege' distro feature enabled this path would be
  '/usr/lib'.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta/recipes-core/systemd/systemd_232.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_232.bb b/meta/recipes-core/systemd/systemd_232.bb
index f843c58..d3903a6 100644
--- a/meta/recipes-core/systemd/systemd_232.bb
+++ b/meta/recipes-core/systemd/systemd_232.bb
@@ -41,7 +41,7 @@ SRC_URI_append_libc-uclibc = "\
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
 PACKAGECONFIG ??= "xz \
-                   ${@bb.utils.filter('DISTRO_FEATURES', 'efi pam selinux ldconfig', d)} \
+                   ${@bb.utils.filter('DISTRO_FEATURES', 'efi pam selinux ldconfig usrmerge', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
                    binfmt \
@@ -122,6 +122,7 @@ PACKAGECONFIG[bzip2] = "--enable-bzip2,--disable-bzip2,bzip2"
 PACKAGECONFIG[lz4] = "--enable-lz4,--disable-lz4,lz4"
 PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
 PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib"
+PACKAGECONFIG[usrmerge] = "--disable-split-usr, --enable-split-usr"
 
 CACHED_CONFIGUREVARS += "ac_cv_path_KILL=${base_bindir}/kill"
 CACHED_CONFIGUREVARS += "ac_cv_path_KMOD=${base_bindir}/kmod"
@@ -131,7 +132,7 @@ CACHED_CONFIGUREVARS += "ac_cv_path_SULOGIN=${base_sbindir}/sulogin"
 
 # Helper variables to clarify locations.  This mirrors the logic in systemd's
 # build system.
-rootprefix ?= "${base_prefix}"
+rootprefix ?= "${root_prefix}"
 rootlibdir ?= "${base_libdir}"
 rootlibexecdir = "${rootprefix}/lib"
 
@@ -149,10 +150,9 @@ CACHED_CONFIGUREVARS_class-target = "\
 EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
                  --with-rootlibdir=${rootlibdir} \
                  --with-roothomedir=${ROOT_HOME} \
-                 --enable-split-usr \
                  --without-python \
                  --with-sysvrcnd-path=${sysconfdir} \
-                 --with-firmware-path=/lib/firmware \
+                 --with-firmware-path=${nonarch_base_libdir}/firmware \
                  --with-testdir=${PTEST_PATH} \
                "
 # per the systemd README, define VALGRIND=1 to run under valgrind
-- 
2.7.4


