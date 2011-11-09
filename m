Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RO70P-0002cc-B8
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 13:11:50 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Nov 2011 04:05:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="72732061"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.103])
	by orsmga002.jf.intel.com with ESMTP; 09 Nov 2011 04:05:33 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 12:05:29 +0000
Message-Id: <65800b1433cf95084cb7541fbc14419086234470.1320839130.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1320839130.git.paul.eggleton@linux.intel.com>
References: <cover.1320839130.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1320839130.git.paul.eggleton@linux.intel.com>
References: <cover.1320839130.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] busybox: add grep to temporary links during uninstall
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
X-List-Received-Date: Wed, 09 Nov 2011 12:11:50 -0000

In the busybox package prerm we set up some temporary links and modify
PATH so that certain utilities are provided for the purpose of running
update-alternatives; if grep is not among these then you get errors when
removing busybox, so add a temporary link for grep as well.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/busybox/busybox.inc       |    1 +
 meta/recipes-core/busybox/busybox_1.18.5.bb |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index acd635b..f8fee51 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -270,6 +270,7 @@ pkg_prerm_${PN} () {
 	ln -s /bin/busybox $tmpdir/rm
 	ln -s /bin/busybox $tmpdir/sed
 	ln -s /bin/busybox $tmpdir/sort
+	ln -s /bin/busybox $tmpdir/grep
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
1.7.5.4



