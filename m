Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ROPOJ-0005b1-6t
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 08:49:43 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2011 23:43:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,488,1315206000"; d="scan'208";a="83351215"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2011 23:43:20 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 23:42:58 -0800
Message-Id: <83e440f545d5038edaeb2cdeb03f73842997057a.1320910946.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL (v2) 16/33] busybox: add grep to temporary links during uninstall
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
X-List-Received-Date: Thu, 10 Nov 2011 07:49:44 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

In the busybox package prerm we set up some temporary links and modify
PATH so that certain utilities are provided for the purpose of running
update-alternatives; if grep is not among these then you get errors when
removing busybox, so add a temporary link for grep as well.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Resorted the link list.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/busybox/busybox.inc       |   11 ++++++-----
 meta/recipes-core/busybox/busybox_1.18.5.bb |    2 +-
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index acd635b..ff31bb7 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -259,17 +259,18 @@ pkg_prerm_${PN} () {
 	# for syslog, httpd and/or udhcpd will fail if there is no other package providing sh
 	tmpdir=`mktemp -d /tmp/busyboxrm-XXXXXX`
 	ln -s /bin/busybox $tmpdir/[
-	ln -s /bin/busybox $tmpdir/test
-	ln -s /bin/busybox $tmpdir/head
-	ln -s /bin/busybox $tmpdir/sh
 	ln -s /bin/busybox $tmpdir/basename
+	ln -s /bin/busybox $tmpdir/dirname
 	ln -s /bin/busybox $tmpdir/echo
-	ln -s /bin/busybox $tmpdir/mv
+	ln -s /bin/busybox $tmpdir/grep
+	ln -s /bin/busybox $tmpdir/head
 	ln -s /bin/busybox $tmpdir/ln
-	ln -s /bin/busybox $tmpdir/dirname
+	ln -s /bin/busybox $tmpdir/mv
 	ln -s /bin/busybox $tmpdir/rm
 	ln -s /bin/busybox $tmpdir/sed
+	ln -s /bin/busybox $tmpdir/sh
 	ln -s /bin/busybox $tmpdir/sort
+	ln -s /bin/busybox $tmpdir/test
 	export PATH=$PATH:$tmpdir
 
 	while read link
diff --git a/meta/recipes-core/busybox/busybox_1.18.5.bb b/meta/recipes-core/busybox/busybox_1.18.5.bb
index bdafb31..17d583e 100644
--- a/meta/recipes-core/busybox/busybox_1.18.5.bb
+++ b/meta/recipes-core/busybox/busybox_1.18.5.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://udhcpscript.patch \
-- 
1.7.6.4



