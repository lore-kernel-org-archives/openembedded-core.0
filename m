Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sh11S-00027z-74
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 18:11:18 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jun 2012 09:00:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="155520371"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.123])
	by orsmga001.jf.intel.com with ESMTP; 19 Jun 2012 09:00:06 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2012 08:59:46 -0700
Message-Id: <8377ebf0d8b8b42bc3f556a5aebd6542248b039a.1340121099.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
Subject: [PATCH 28/39] libidn: clean up FILE after PACKAGE reorder
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
X-List-Received-Date: Tue, 19 Jun 2012 16:11:18 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/libidn/libidn_0.6.14.bb |    6 +++++-
 meta/recipes-extended/libidn/libidn_1.24.bb   |    3 ++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/libidn/libidn_0.6.14.bb b/meta/recipes-extended/libidn/libidn_0.6.14.bb
index 67c9381..e740250 100644
--- a/meta/recipes-extended/libidn/libidn_0.6.14.bb
+++ b/meta/recipes-extended/libidn/libidn_0.6.14.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://lib/idna.h;firstline=6;endline=18;md5=6d9d5532eb28b99e860262281c540d02 \
                     file://src/idn.c;firstline=6;endline=18;md5=41b6aec531cc6a9d54a6c4deee251bf5"
-PR = "r0"
+PR = "r1"
 
 inherit pkgconfig autotools gettext
 
@@ -25,3 +25,7 @@ do_configure_prepend() {
 	sed -i -e "/AC_REQUIRE(\[gl_USE_SYSTEM_EXTENSIONS/d" ${S}/lib/gl/m4/gnulib-comp.m4
 	rm -f ${S}/lib/gl/m4/extensions.m4
 }
+
+do_install_append() {
+	rm -rf ${D}${libdir}/Libidn.dll
+}
diff --git a/meta/recipes-extended/libidn/libidn_1.24.bb b/meta/recipes-extended/libidn/libidn_1.24.bb
index c6ecea7..a4ecce1 100644
--- a/meta/recipes-extended/libidn/libidn_1.24.bb
+++ b/meta/recipes-extended/libidn/libidn_1.24.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9c9d9d207a3468a696a03368913d360b \
                     file://COPYINGv3;md5=d32239bcb673463ab874e80d47fae504 \
                     file://lib/idna.h;endline=21;md5=7364f6a250728ffe16170f5e3ab37512 \
                     file://src/idn.c;endline=20;md5=7d7235e7951ac87d9dfac42e1b69d9cb"
-PR = "r1"
+PR = "r2"
 
 inherit pkgconfig autotools gettext
 
@@ -28,5 +28,6 @@ FILES_idn = "${bindir}/*"
 EXTRA_OECONF = " --disable-tld"
 
 do_install_append() {
+	rm -rf ${D}${libdir}/Libidn.dll
 	rm -rf ${D}${datadir}/emacs
 }
-- 
1.7.7.6



