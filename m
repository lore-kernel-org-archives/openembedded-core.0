Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Rg3C5-0006PT-Rw
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Dec 2011 00:46:02 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 28 Dec 2011 15:38:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="106814273"
Received: from unknown (HELO localhost) ([10.255.13.53])
	by fmsmga002.fm.intel.com with ESMTP; 28 Dec 2011 15:38:43 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org, raj.khem@gmail.com,
	koen@dominion.thruhere.net, kergoth@gmail.com, martin.jansa@gmail.com,
	Bruce Ashfield <bruce.ashfield@windriver.com>,
	Tom Zanussi <tom.zanussi@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 28 Dec 2011 15:38:10 -0800
Message-Id: <42ae58f20c3f62753fc41d798d271e4f8cf6a188.1325115066.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325115066.git.dvhart@linux.intel.com>
References: <cover.1325115066.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1325115066.git.dvhart@linux.intel.com>
References: <cover.1325115066.git.dvhart@linux.intel.com>
Subject: [PATCH 2/4] eglibc: Only add eglibc-utils to PACKAGES if wchar is supported
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
X-List-Received-Date: Wed, 28 Dec 2011 23:46:02 -0000

eglibc-utils RDEPENDS on bash which requires gettext which requires
wchar support. If wchar support is not included in DISTRO_FEATURES,
gettext will fail to compile.

By removing eglibc-utils from the PACKAGES listing, bitbake doesn't
try to build the dependency chain.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/recipes-core/eglibc/eglibc-package.inc |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 020f558..ab62654 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -20,7 +20,11 @@ USE_LDCONFIG ?= "1"
 PKGSUFFIX = ""
 PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
 
-PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} ${PN}-utils eglibc-extra-nss${PKGSUFFIX} eglibc-thread-db${PKGSUFFIX} ${PN}-pic ${PN}-dev ${PN}-doc libcidn${PKGSUFFIX} libmemusage${PKGSUFFIX} libsegfault${PKGSUFFIX} ${PN}-pcprofile libsotruss${PKGSUFFIX}"
+PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} eglibc-extra-nss${PKGSUFFIX} eglibc-thread-db${PKGSUFFIX} ${PN}-pic ${PN}-dev ${PN}-doc libcidn${PKGSUFFIX} libmemusage${PKGSUFFIX} libsegfault${PKGSUFFIX} ${PN}-pcprofile libsotruss${PKGSUFFIX}"
+
+# eglibc-utils rdepends on bash which depends on gettext which requires wchar
+# support. Only include it in the PACKAGES list if we can build the RDEPENDS.
+PACKAGES += ${@base_contains('DISTRO_FEATURES', 'libc-posix-clang-wchar', '${PN}-utils', '', d)}
 
 # The ld.so in this eglibc supports the GNU_HASH
 RPROVIDES_${PN} = "glibc${PKGSUFFIX} rtld(GNU_HASH)"
-- 
1.7.6.4



