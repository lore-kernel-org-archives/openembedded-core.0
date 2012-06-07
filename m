Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eflanagan@envy.jf.intel.com>) id 1ScmQP-00047r-To
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 01:47:34 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 07 Jun 2012 16:37:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="154476606"
Received: from envy.jf.intel.com ([10.7.201.175])
	by orsmga002.jf.intel.com with ESMTP; 07 Jun 2012 16:37:01 -0700
Received: from envy.jf.intel.com (localhost [127.0.0.1])
	by envy.jf.intel.com (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id
	q57NbFao006531 for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jun 2012 16:37:15 -0700
Received: (from eflanagan@localhost)
	by envy.jf.intel.com (8.14.4/8.14.4/Submit) id q57NbFov006530
	for openembedded-core@lists.openembedded.org;
	Thu, 7 Jun 2012 16:37:15 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jun 2012 16:36:55 -0700
Message-Id: <8f3fca5e04e7a85ad12bd9becd0054d882223eb6.1339111944.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <480358f458a7874b5705fc48547489d19a9df72c.1339111944.git.elizabeth.flanagan@intel.com>
References: <480358f458a7874b5705fc48547489d19a9df72c.1339111944.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1339111944.git.elizabeth.flanagan@intel.com>
References: <cover.1339111944.git.elizabeth.flanagan@intel.com>
Subject: [Consolidated Pull 07/22] gnupg: disable CCID driver
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
X-List-Received-Date: Thu, 07 Jun 2012 23:47:34 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

The CCID driver driver is apparently unnecessary, so disable it.

Also remove the associated libusb dependency, since that won't be
needed either.

According to Scott Garman <scott.a.garman@intel.com>:

I'd just note that the CCID smartcard reader is a specific piece of
hardware that is unlikely to be used in a majority of our use cases.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
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
1.7.5.4



