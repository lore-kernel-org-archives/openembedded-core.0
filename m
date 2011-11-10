Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ROPOK-0005ag-Tk
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 08:49:45 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2011 23:43:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,488,1315206000"; d="scan'208";a="83351227"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2011 23:43:21 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 23:43:04 -0800
Message-Id: <bc7d30f3e12892ff208683c05fb29c5e9c631954.1320910946.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL (v2) 22/33] xinit: Fix `startx` looking for `mcookie` in sysroot
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
X-List-Received-Date: Thu, 10 Nov 2011 07:49:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Menzel <paulepanter@users.sourceforge.net>

`startx` run on a system based on the demo systemd image [1] and `opkg`-installed packages fails with the following error.

	/usr/bin/startx: line 139: /OE/tentacle/build/tmp-angstrom_2010_x/sysroots/x68_64-linux/usr/bin/mcookie: No such file or directory

Applying commit 443bcc07 [1] from OE-classic

        Author: Tom Rini <tom_rini@mentor.com>
        Date:   Thu Apr 7 10:36:43 2011 -0700

            xinit: Fix mcookie / util-linux-ng dependency

            xinit just needs to know the runtime path of mcookie so we need to
            RDEPEND on util-linux-ng and pass the runtime path in via EXTRA_OECONF

            Signed-off-by: Tom Rini <tom_rini@mentor.com>

fixes this issue. Commit 7f6cec6f [2]

        Author: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
        Date:   Sun Feb 21 18:11:30 2010 +0100

            xinit: add dependency on util-linux-ng

        […]

tried to address the same problem but apparently did not help, because Tom still had problems.

[1] http://www.angstrom-distribution.org/demo/beagleboard/Angstrom-systemd-image-eglibc-ipk-v2011.11-core-beagleboard.rootfs.tar.bz2
[2] http://git.openembedded.org/openembedded/commit/443bcc0785bc004e471b3750a34d12d2fd2e5dad
[3] http://git.openembedded.org/openembedded/commit/7f6cec6f0adb6203a6dbaf8a43c67c2c4f8bf84e

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 meta/recipes-graphics/xorg-app/xinit_1.3.0.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-app/xinit_1.3.0.bb b/meta/recipes-graphics/xorg-app/xinit_1.3.0.bb
index ee7c64d..6953ccc 100644
--- a/meta/recipes-graphics/xorg-app/xinit_1.3.0.bb
+++ b/meta/recipes-graphics/xorg-app/xinit_1.3.0.bb
@@ -9,9 +9,14 @@ systems. When this first client exits, xinit will kill the X server and \
 then terminate."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=0d4b5eef75f1584ccbdc5e4a34314407"
-PR = "r0"
+
+PR = "r1"
 PE = "1"
 
+EXTRA_OECONF = "ac_cv_path_MCOOKIE=${bindir}/mcookie"
+
+RDEPENDS_${PN} += "util-linux"
+
 FILES_${PN} += "${libdir}X11/xinit"
 
 SRC_URI[md5sum] = "bc4e8b7d1919597cc37a0d24aa149dda"
-- 
1.7.6.4



