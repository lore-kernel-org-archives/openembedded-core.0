Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4ao-0006h6-JD
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:40:34 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 00:32:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96632860"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:32:52 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:31:54 -0800
Message-Id: <365d1d6fdd94af0bb73b349e7e445b9c8ec91b2f.1326786989.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 09/62] locale: fix package's "provides" tag
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
X-List-Received-Date: Tue, 17 Jan 2012 08:40:35 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Fixes this bug: [YOCTO #1874]

Fixes an issue where a locale package depends on one package while it
also provides the same, as seen bellow.

Package: locale-base-de-de
Version: 2.12-r19
Depends: eglibc-binary-localedata-de-de
Provides: virtual-locale-de-de, virtual-locale-de,
eglibc-binary-localedata-de-de

Actually the eglibc-binary-localedata-de-de is ia separate package,
 and it should not be part of provides of the locale-base-de-de.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/classes/libc-package.bbclass          |    3 ---
 meta/recipes-core/eglibc/eglibc-locale.inc |    2 +-
 2 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 1796d3d..8cd5fec 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -248,9 +248,6 @@ python package_do_split_gconvs () {
 			libc_name = name
 		d.setVar('RDEPENDS_%s' % pkgname, legitimize_package_name('%s-binary-localedata-%s' \
 			% (bpn, libc_name)))
-		rprovides = (d.getVar('RPROVIDES_%s' % pkgname, True) or "").split()
-		rprovides.append(legitimize_package_name('%s-binary-localedata-%s' % (bpn, libc_name)))
-		d.setVar('RPROVIDES_%s' % pkgname, " ".join(rprovides))
 
 	commands = {}
 
diff --git a/meta/recipes-core/eglibc/eglibc-locale.inc b/meta/recipes-core/eglibc/eglibc-locale.inc
index d9720e4..b4646fa 100644
--- a/meta/recipes-core/eglibc/eglibc-locale.inc
+++ b/meta/recipes-core/eglibc/eglibc-locale.inc
@@ -26,7 +26,7 @@ BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64 powerpc mips"
 # set "0" for qemu emulation of native localedef for locale generation
 LOCALE_GENERATION_WITH_CROSS-LOCALEDEF = "1"
 
-PR = "r18"
+PR = "r19"
 
 PKGSUFFIX = ""
 PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
-- 
1.7.6.5



