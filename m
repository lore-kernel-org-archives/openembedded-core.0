Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1ScGqr-0005Ms-Sm
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 16:04:46 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 06 Jun 2012 06:53:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="152347805"
Received: from unknown (HELO localhost) ([10.255.12.119])
	by azsmga001.ch.intel.com with ESMTP; 06 Jun 2012 06:53:12 -0700
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jun 2012 08:53:01 -0500
Message-Id: <216f9c0af161c3bbb5367bb3c4b313a661ff753a.1338990374.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <73f473e10d4b1670823ff5b1ec9d8220f2751f9f.1338990374.git.tom.zanussi@intel.com>
References: <73f473e10d4b1670823ff5b1ec9d8220f2751f9f.1338990374.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1338990374.git.tom.zanussi@intel.com>
References: <cover.1338990374.git.tom.zanussi@intel.com>
Subject: [PATCH 2/2] gnupg: disable CCID driver
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
X-List-Received-Date: Wed, 06 Jun 2012 14:04:46 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

The CCID driver driver is apparently unnecessary, so disable it.

Also remove the associated libusb dependency, since that won't be
needed either.

According to Scott Garman <scott.a.garman@intel.com>:

I'd just note that the CCID smartcard reader is a specific piece of
hardware that is unlikely to be used in a majority of our use cases.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/recipes-support/gnupg/gnupg_2.0.19.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/gnupg/gnupg_2.0.19.bb b/meta/recipes-support/gnupg/gnupg_2.0.19.bb
index 9a0f160..d014f03 100644
--- a/meta/recipes-support/gnupg/gnupg_2.0.19.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.0.19.bb
@@ -4,8 +4,8 @@ LICENSE = "GPLv3 & LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
                     file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6"
 
-DEPENDS = "pth libassuan libksba zlib bzip2 readline libgcrypt libusb"
-PR = "r1"
+DEPENDS = "pth libassuan libksba zlib bzip2 readline libgcrypt"
+PR = "r2"
 
 inherit autotools gettext
 
@@ -15,6 +15,7 @@ SRC_URI[md5sum] = "6a8589381ca1b0c1a921e9955f42b016"
 SRC_URI[sha256sum] = "efa23a8a925adb51c7d3b708c25b6d000300f5ce37de9bdec6453be7b419c622"
 
 EXTRA_OECONF = "--disable-ldap \
+		--disable-ccid-driver \
 		--with-zlib=${STAGING_LIBDIR}/.. \
 		--with-bzip2=${STAGING_LIBDIR}/.. \
                 --with-readline=${STAGING_LIBDIR}/.. \
-- 
1.7.0.4



