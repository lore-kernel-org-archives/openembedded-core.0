Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SoGyw-00043E-28
	for Openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 18:38:43 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2012 09:27:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="175108542"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jul 2012 09:27:30 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2012 09:26:13 -0700
Message-Id: <25bc540634a486accfee43a44d68d2c4038acbcc.1341850982.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <8d1d42a68d5930bc374b9d6126cc1371a22a37db.1341850982.git.nitin.a.kamble@intel.com>
References: <8d1d42a68d5930bc374b9d6126cc1371a22a37db.1341850982.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1341850982.git.nitin.a.kamble@intel.com>
References: <cover.1341850982.git.nitin.a.kamble@intel.com>
Subject: [PATCH 12/15] telepathy-glib: fix build with automake 1.12.x
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
X-List-Received-Date: Mon, 09 Jul 2012 16:38:43 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

automake 1.12.x automatically deletes empty directories, so
the additional rmdir from the do_install_append fails.

cleanup the do_install_append for automake 1.12.x

avoid this issue:
| rmdir: failed to remove `/srv/home/nitin/builds/build-gcc47/tmp/work/i586-poky-linux/telepathy-glib-0.18.1-r0/image/usr/bin': No such file or directory
NOTE: package telepathy-glib-0.18.1-r0: task do_install: Failed

no PR bump as no change in the output

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../telepathy/telepathy-glib_0.19.0.bb             |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.0.bb b/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.0.bb
index 6c4e12c..9799605 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.0.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.0.bb
@@ -16,9 +16,3 @@ inherit autotools pkgconfig gettext
 
 FILES_${PN} += "${datadir}/telepathy \
                 ${datadir}/dbus-1"
-
-do_install_append() {
-	rmdir ${D}${bindir}
-	rmdir ${D}${libexecdir}
-	rmdir ${D}${servicedir}
-}
-- 
1.7.3.4



