Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RHzjk-0001K1-L4
	for openembedded-core@lists.openembedded.org;
	Sun, 23 Oct 2011 17:13:20 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 Oct 2011 08:07:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,394,1315206000"; d="scan'208";a="80904502"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.44])
	by fmsmga002.fm.intel.com with ESMTP; 23 Oct 2011 08:07:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Oct 2011 16:07:16 +0100
Message-Id: <9d907d5fbf2c4b65ea8833f70aefb9046fec42a9.1319382376.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1319382376.git.paul.eggleton@linux.intel.com>
References: <cover.1319382376.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1319382376.git.paul.eggleton@linux.intel.com>
References: <cover.1319382376.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] util-linux: split out mkfs into its own package
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
X-List-Received-Date: Sun, 23 Oct 2011 15:13:21 -0000

For those external tools such as Webmin that call mkfs to do formatting
operations, it is useful to have it in its own package to avoid dragging
in the rest of util-linux.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/util-linux/util-linux.inc       |    6 ++++--
 meta/recipes-core/util-linux/util-linux_2.19.1.bb |    2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 67d81b9..d10bafb 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -29,7 +29,8 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-swaponoff util-linux-losetup util-linux-umount \
              util-linux-mount util-linux-readprofile util-linux-libblkid \
              util-linux-libblkid-dev util-linux-libuuid util-linux-libuuid-dev \
-             util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid"
+             util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid \
+             util-linux-mkfs"
 
 EXTRA_OECONF = "--disable-use-tty-group --disable-makeinstall-chown --enable-elvtune --enable-init --enable-kill --enable-last \
  --enable-mesg --enable-partx --enable-raw --enable-rdev --enable-reset \
@@ -55,13 +56,14 @@ FILES_util-linux-libuuid-dev = "${libdir}/libuuid.so ${libdir}/libuuid.a ${libdi
 FILES_util-linux-lscpu = "${bindir}/lscpu"
 
 FILES_util-linux-fsck = "${base_sbindir}/fsck*"
+FILES_util-linux-mkfs = "${sbindir}/mkfs"
 
 # Util-linux' blkid replaces the e2fsprogs one
 FILES_util-linux-blkid = "${base_sbindir}/blkid*"
 RCONFLICTS_util-linux-blkid = "e2fsprogs-blkid"
 RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
 
-RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile "
+RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs "
 RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup perl"
 
 RRECOMMENDS_${PN}_virtclass-native = ""
diff --git a/meta/recipes-core/util-linux/util-linux_2.19.1.bb b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
index 04f4457..fb5637e 100644
--- a/meta/recipes-core/util-linux/util-linux_2.19.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.19"
-PR = "r8"
+PR = "r9"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
-- 
1.7.4.1



