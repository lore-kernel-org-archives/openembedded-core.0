Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoMF7-0005el-Rt
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 00:15:46 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2012 15:04:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="175229687"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.214])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jul 2012 15:04:35 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2012 15:04:34 -0700
Message-Id: <1341871474-8719-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] gnupg: ensure deterministic build by disabling libcurl
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
X-List-Received-Date: Mon, 09 Jul 2012 22:15:46 -0000

gnupg has it's own fake curl, since we use gnupg with zypper, there does not
seem to be a strong reason to add curl to the depends list.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/gnupg/gnupg_2.0.19.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/gnupg/gnupg_2.0.19.bb b/meta/recipes-support/gnupg/gnupg_2.0.19.bb
index 24219a8..996a8e8 100644
--- a/meta/recipes-support/gnupg/gnupg_2.0.19.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.0.19.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
 DEPENDS = "${PTH} libassuan libksba zlib bzip2 readline libgcrypt"
 PTH = "pth"
 PTH_libc-uclibc = "npth"
-PR = "r3"
+PR = "r4"
 
 inherit autotools gettext
 
@@ -18,6 +18,7 @@ SRC_URI[sha256sum] = "efa23a8a925adb51c7d3b708c25b6d000300f5ce37de9bdec6453be7b4
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
+                --without-libcurl \
 		--with-zlib=${STAGING_LIBDIR}/.. \
 		--with-bzip2=${STAGING_LIBDIR}/.. \
                 --with-readline=${STAGING_LIBDIR}/.. \
-- 
1.7.7.6



