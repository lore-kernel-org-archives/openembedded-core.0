Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GCz-000124-TE
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:26:54 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2012 05:15:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="186181473"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2012 05:14:59 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:13:38 +0300
Message-Id: <4f112eebda659de83609683459918c24a27ee1ae.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
In-Reply-To: <cover.1344946189.git.sgw@linux.intel.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED REQUEST 51/64] sysfsutils: install libs to base_libdir
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
X-List-Received-Date: Tue, 14 Aug 2012 12:26:55 -0000

From: Wenzong Fan <wenzong.fan@windriver.com>

Fix the warning form pcmciautils building:

"WARNING: QA Issue: pcmciautils: /sbin/pccardctl, installed in the
base_prefix, requires a shared library under exec_prefix (/usr):
libsysfs.so.2 => /usr/lib/libsysfs.so.2"

Just refer to Debian/Ubuntu distributions, install sysfsutils libs
to "/lib*" instead of "/usr/lib*".

[YOCTO #2907]

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb b/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
index 3e4fdda..f01d19b 100644
--- a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
+++ b/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
@@ -8,7 +8,7 @@ LICENSE_libsysfs = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3d06403ea54c7574a9e581c6478cc393 \
                     file://cmd/GPL;md5=d41d4e2e1e108554e0388ea4aecd8d27 \
                     file://lib/LGPL;md5=b75d069791103ffe1c0d6435deeff72e"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/linux-diag/sysfsutils-${PV}.tar.gz \
 	  file://sysfsutils-2.0.0-class-dup.patch \
@@ -24,3 +24,5 @@ PACKAGES =+ "libsysfs libsysfs-dev libsysfs-staticdev"
 FILES_libsysfs = "${libdir}/lib*${SOLIBS}"
 FILES_libsysfs-dev = "${libdir}/lib*${SOLIBSDEV} ${includedir}"
 FILES_libsysfs-staticdev = "${libdir}/lib*.a"
+
+export libdir = "${base_libdir}"
-- 
1.7.7.6



