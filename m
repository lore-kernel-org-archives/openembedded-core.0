Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnoL7-0004ka-Ft
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 10:31:25 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Jan 2012 01:23:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97472152"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 19 Jan 2012 01:23:08 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2012 01:22:54 -0800
Message-Id: <d6883105f5d7d369c28f3fc04a7980e0de2a2edc.1326964778.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 33/33] gnutls: Fix configure issue wrt to rm
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
X-List-Received-Date: Thu, 19 Jan 2012 09:31:27 -0000

From: Khem Raj <raj.khem@gmail.com>

Add -f option so if the files dont exist then we can
still continue. Fixes errors like

| + do_configure
| + for dir in . lib libextra
| + rm ./aclocal.m4 ./m4/libtool.m4 './m4/lt*.m4'
| rm: cannot remove `./m4/libtool.m4': No such file or directory
| rm: cannot remove `./m4/lt*.m4': No such file or directory

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/gnutls/gnutls.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 5991540..c639b11 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/gnutls/"
 BUGTRACKER = "https://savannah.gnu.org/support/?group=gnutls"
 DEPENDS = "zlib lzo libtasn1 libgcrypt (>= 1.4.2) libcap readline"
 
-INC_PR = "r4"
+INC_PR = "r5"
 
 LICENSE = "GPLv3+ & LGPLv2.1+"
 LICENSE_${PN} = "LGPLv2.1+"
@@ -31,7 +31,7 @@ EXTRA_OECONF="--with-included-opencdk --with-included-libcfg --disable-rpath \
               "
 do_configure_prepend() {
 	for dir in . lib libextra; do
-		rm ${dir}/aclocal.m4 ${dir}/m4/libtool.m4 ${dir}/m4/lt*.m4
+		rm -f ${dir}/aclocal.m4 ${dir}/m4/libtool.m4 ${dir}/m4/lt*.m4
 	done
 }
 
-- 
1.7.6.5



