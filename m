Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1UBU6o-00050a-Q4
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 18:51:21 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 01 Mar 2013 09:34:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,762,1355126400"; d="scan'208";a="207823477"
Received: from unknown (HELO localhost) ([10.255.12.240])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Mar 2013 09:34:37 -0800
From: tom.zanussi@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Mar 2013 11:34:57 -0600
Message-Id: <7f6bfc610d60aabc3e69d8bb3b799ff3a7175c6e.1362158882.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <4e9a2c972a0e3254965fe12cdc8ede1f2acd6faa.1362158882.git.tom.zanussi@linux.intel.com>
References: <4e9a2c972a0e3254965fe12cdc8ede1f2acd6faa.1362158882.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1362158882.git.tom.zanussi@linux.intel.com>
References: <cover.1362158882.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 3/3] systemtap: add python and bash dependencies
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Mar 2013 17:51:35 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

There are a number of scripts in the systemtap installation that use
python and bash, so we need to add run-time dependencies for them.  If
not, we can generate build errors like "no package provides
/usr/bin/python".

Fixes [YOCTO #3951].

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 7fc92c8..22f8959 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -6,6 +6,10 @@ DEPENDS = "elfutils sqlite3 systemtap-native"
 DEPENDS_class-native = "elfutils-native sqlite3-native gettext-native"
 DEPENDS_class-nativesdk = "nativesdk-elfutils nativesdk-sqlite3 nativesdk-gettext"
 
+RDEPENDS_${PN} += "python bash"
+RDEPENDS_${PN}_class-native += "python-native"
+RDEPENDS_${PN}_class-nativesdk += "python-native"
+
 PR = "r1"
 
 EXTRA_OECONF += "--with-libelf=${STAGING_DIR_TARGET} --without-rpm \
-- 
1.7.11.4



