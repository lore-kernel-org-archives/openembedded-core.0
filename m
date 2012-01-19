Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnoL6-0004ka-Iq
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 10:31:24 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Jan 2012 01:23:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97472139"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 19 Jan 2012 01:23:05 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2012 01:22:51 -0800
Message-Id: <0e32767b653bbcc8cf941a546e765d6c08191b7a.1326964778.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 30/33] autogen-native: new recipe for grub-efi-native
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
X-List-Received-Date: Thu, 19 Jan 2012 09:31:24 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

grub-efi-native build is failing due to missing autogen command.
Hence created this recipe.

The newer versions of autogen 5.13 & 5.14 both are dumping core while
building from source, so going back to the working 5.12 version.

Also noticed that no distro vendor has picked up 5.13 or 5.14 versions
of autogen yet.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../autogen/autogen-native_5.12.bb                 |   24 ++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/autogen/autogen-native_5.12.bb

diff --git a/meta/recipes-devtools/autogen/autogen-native_5.12.bb b/meta/recipes-devtools/autogen/autogen-native_5.12.bb
new file mode 100644
index 0000000..cdf1ea9
--- /dev/null
+++ b/meta/recipes-devtools/autogen/autogen-native_5.12.bb
@@ -0,0 +1,24 @@
+SUMMARY = "AutoGen is a tool to manage programs that contain large amounts of repetitious text."
+DESCRIPTION = "AutoGen is a tool designed to simplify the creation and\
+ maintenance of programs that contain large amounts of repetitious text.\
+ It is especially valuable in programs that have several blocks of text\
+ that must be kept synchronized."
+HOMEPAGE = "http://www.gnu.org/software/autogen/"
+SECTION = "devel"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504" 
+
+SRC_URI = "${GNU_MIRROR}/autogen/rel${PV}/autogen-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "6c6671b76021fb30dd43b0d5fdb7180b"
+SRC_URI[sha256sum] = "37e885d6c8a58f33ab198d38bb972fa4c14236f951d628161dde6e20527d0df2"
+
+PR = "r1"
+
+DEPENDS = "guile-native libtool-native libxml2-native"
+RDEPENDS = "automake pkgconfig"
+
+inherit autotools native
+
+# Following line will be needed for the non-native target recipe.
+#CFLAGS += "-L${STAGING_LIBDIR} -lguile-2.0 -lgc -pthread -I${STAGING_INCDIR}/guile/2.0 -I${STAGING_INCDIR}"
-- 
1.7.6.5



