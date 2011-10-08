Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1RCSSs-0002Ej-2b
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Oct 2011 10:41:02 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 Oct 2011 01:35:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="61168955"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga002.jf.intel.com with ESMTP; 08 Oct 2011 01:35:22 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Sat,  8 Oct 2011 16:30:43 +0800
Message-Id: <e315a66f8b76ba1c3282ed8907d276ba298050db.1318062305.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1318062305.git.edwin.zhai@intel.com>
References: <cover.1318062305.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1318062305.git.edwin.zhai@intel.com>
References: <cover.1318062305.git.edwin.zhai@intel.com>
Subject: [PATCH 1/1] gnutls: Fix configure failure
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 08 Oct 2011 08:41:02 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

gnutls fails in configure as depends on p11-kit after last upgrade. Removing
this dependency via configure option can fix following error:


| checking for fork... (cached) yes
| checking for P11_KIT... configure: error: Package requirements (p11-kit-1 >= 0.2) were not met:
|
| No package 'p11-kit-1' found
|
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
|
| Alternatively, you may set the environment variables P11_KIT_CFLAGS
| and P11_KIT_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
|
| ERROR: oe_runconf failed


Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/recipes-support/gnutls/gnutls.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 9257880..8818c32 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/gnutls/"
 BUGTRACKER = "https://savannah.gnu.org/support/?group=gnutls"
 DEPENDS = "zlib lzo libtasn1 libgcrypt (>= 1.4.2) libcap"
 
-INC_PR = "r2"
+INC_PR = "r3"
 
 LICENSE = "GPLv3+ & LGPLv2.1+"
 LICENSE_${PN} = "LGPLv2.1+"
@@ -24,7 +24,7 @@ EXTRA_OECONF="--with-included-opencdk --with-included-libcfg --disable-rpath \
               --with-libgcrypt --with-libgcrypt-prefix=${STAGING_DIR_HOST}${prefix} \
               --with-libdl-prefix=${STAGING_DIR_HOST}${prefix} \
               --with-libpthread-prefix=${STAGING_DIR_HOST}${prefix} \
-              --with-lzo --disable-guile \
+              --with-lzo --disable-guile --without-p11-kit \
               "
 do_configure_prepend() {
 	for dir in . lib libextra; do
-- 
1.7.1



