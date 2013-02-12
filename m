Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U5Iix-0000zM-1h
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 17:28:56 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Feb 2013 08:11:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,650,1355126400"; d="scan'208";a="284741993"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 12 Feb 2013 08:12:49 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Feb 2013 18:12:35 +0200
Message-Id: <cover.1360684306.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 00/11] Postinstall intercept fall-back solution + leftover patches with postinstall fixes
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
X-List-Received-Date: Tue, 12 Feb 2013 16:29:35 -0000
X-List-Received-Date: Tue, 12 Feb 2013 16:29:35 -0000

Hi all,

This patchset adds the fall-back solution to intercept hooks. That is, if
intercept hooks fail than the postinstalls will run on target, at first boot.
This way we will avoid unwanted situations when the intercept hooks fail and
the build cannot complete. The previous solution had some issue with adding the
final package names to the intercept hook. So, after having a discussion with
Richard, we agreed to use a separate directory in scripts/ where we can put
all the intercept hooks. This solution also avoids adding extra, unnecesary
code (from the target point of view), to the postinstall scriptlets.

Besides this, there are other postinstall fixes from a previous patchset that I
adviced not to be merged so I can resend them with the latest changes in place.

Thanks,
Laurentiu

The following changes since commit 02d2a5e68cab490cb83db6e4f2f0802221efe8a2:

  distro_check: Remove creation of empty Meego filelist. (2013-02-12 13:22:44 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/intercept
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/intercept

Laurentiu Palcu (11):
  Add separate directory for postinstall intercepts
  image.bbclass: add fall-back functionality when running intercepts
  rootfs_(ipk|deb|rpm).bbclass: check package installation status after
    ROOTFS_POSTPROCESS_COMMAND
  gtk-icon-cache.bbclass: use postinst_intercept script
  fontcache.bbclass: use the postinst_intercept script
  Add pixbufcache class
  gdk-pixbuf: use the new pixbufcache class
  librsvg: use the new pixbufcache class
  gnome-keyring: compile schemas on host
  gtk-immodules-cache: add weak asignment for GTKIMMODULES_PACKAGES
  gtk+: use gtk-immodules-cache class

 meta/classes/fontcache.bbclass                     |   20 +++-----
 meta/classes/gtk-icon-cache.bbclass                |   39 ++++-----------
 meta/classes/gtk-immodules-cache.bbclass           |    2 +
 meta/classes/image.bbclass                         |   43 ++++++++++++++---
 meta/classes/pixbufcache.bbclass                   |   50 ++++++++++++++++++++
 meta/classes/rootfs_deb.bbclass                    |   14 +++---
 meta/classes/rootfs_ipk.bbclass                    |   13 +++--
 meta/classes/rootfs_rpm.bbclass                    |   20 ++++----
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb |   48 ++-----------------
 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb   |   12 +----
 meta/recipes-gnome/gtk+/gtk+.inc                   |    8 +---
 meta/recipes-gnome/gtk+/gtk+3_3.4.4.bb             |   12 +----
 meta/recipes-gnome/gtk+/gtk+_2.24.14.bb            |    4 +-
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb       |   21 ++------
 scripts/postinst-intercepts/postinst_intercept     |   37 +++++++++++++++
 scripts/postinst-intercepts/update_font_cache      |    7 +++
 scripts/postinst-intercepts/update_icon_cache      |   12 +++++
 scripts/postinst-intercepts/update_pixbuf_cache    |   10 ++++
 18 files changed, 207 insertions(+), 165 deletions(-)
 create mode 100644 meta/classes/pixbufcache.bbclass
 create mode 100755 scripts/postinst-intercepts/postinst_intercept
 create mode 100644 scripts/postinst-intercepts/update_font_cache
 create mode 100644 scripts/postinst-intercepts/update_icon_cache
 create mode 100644 scripts/postinst-intercepts/update_pixbuf_cache

-- 
1.7.9.5



