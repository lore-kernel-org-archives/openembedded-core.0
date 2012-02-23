Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S0bC5-0004to-1l
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 17:06:57 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Feb 2012 07:58:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128652362"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.72])
	by fmsmga002.fm.intel.com with ESMTP; 23 Feb 2012 07:58:33 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 07:58:16 -0800
Message-Id: <5d0114882afc03c09448fa729f5f71066630aac1.1330012543.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1330012543.git.sgw@linux.intel.com>
References: <cover.1330012543.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330012543.git.sgw@linux.intel.com>
References: <cover.1330012543.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 12/25] e2fsprogs: Cope with ${libdir} and ${base_libdir} being the same
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
X-List-Received-Date: Thu, 23 Feb 2012 16:06:57 -0000

From: Mike Crowe <mac@mcrowe.com>

${libdir} and ${base_libdir} may be the same. If they are don't try and
move files onto themselves.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
index 793393e..aea7d79 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
@@ -1,6 +1,6 @@
 require e2fsprogs.inc
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI += "file://fallocate.patch \
             file://acinclude.m4"
@@ -32,9 +32,11 @@ do_install () {
 
 do_install_append () {
 	# e2initrd_helper and the pkgconfig files belong in libdir
-	install -d ${D}${libdir}
-	mv ${D}${base_libdir}/e2initrd_helper ${D}${libdir}
-	mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
+	if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
+		install -d ${D}${libdir}
+		mv ${D}${base_libdir}/e2initrd_helper ${D}${libdir}
+		mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
+	fi
 }
 
 # blkid used to be part of e2fsprogs but is useful outside, add it
-- 
1.7.6.5



