Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TEIyx-00015d-DO
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 14:02:19 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 19 Sep 2012 04:49:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,447,1344236400"; d="scan'208";a="194489228"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by azsmga001.ch.intel.com with ESMTP; 19 Sep 2012 04:49:35 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2012 14:49:18 +0300
Message-Id: <cover.1348052899.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [RFC 0/7] Postinstall improvements
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
X-List-Received-Date: Wed, 19 Sep 2012 12:02:19 -0000

Hi,

It's been quite a long time since I sent the first version of postinstall
improvements which, after some debate, we decided it needed run-once
support of postinst scriptlets on host. This patcheset (RFC actually) adds
that.

So, in order to achieve this goal I took advantage of
ROOTFS_POSTPROCESS_COMMAND variable. Basically, if running some postinst
scriptlets is time consuming (even on host) and execute repeatedly,
then we can postpone the running and run the scriplet just once. The idea is
to put the scriptlet in the ${WORKDIR}/intercept_scripts directory. When the
ROOTFS_POSTPROCESS_COMMAND is executed, it will pick up all the scripts in
this directory and execute them.

This actual patchset does the above for the gtk icon cache generation which
takes a very long time to run on target and even on some hosts.

The people willing to give this patchset a test, are most than welcome. Also,
please feel free to review.

Thanks,
Laurentiu

The following changes since commit 913944d904266bf90af0cad94b4f0fb3652bd29d:

  upstream_tracking: update lsb and ltp (2012-09-14 17:12:52 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/pi
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/pi

Laurentiu Palcu (7):
  gtk+: enable gtk+-native
  image.bbclass: run postinst scripts once, at rootfs time
  rootfs generation: export two new variables to postinst scriptlets
  gtk-icon-cache: run the icon generation at rootfs time
  gdk-pixbuf: generate the pixbuf loader's cache ar rootfs time
  sato-icon-theme: make use of the gtk-icon-cache postinst scriptlet
  postinst changes: bump PR to all recipes inheriting gnome and
    gtk-icon-cache

 meta/classes/gtk-icon-cache.bbclass                |   21 +++++++++++++----
 meta/classes/image.bbclass                         |   24 +++++++++++++++++++-
 meta/classes/package_rpm.bbclass                   |    2 ++
 meta/classes/rootfs_deb.bbclass                    |    2 ++
 meta/classes/rootfs_ipk.bbclass                    |    2 ++
 .../connman/connman-gnome_0.7.bb                   |    2 ++
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb |   24 ++++++++++++--------
 meta/recipes-gnome/gnome/gnome-common_2.28.0.bb    |    2 +-
 meta/recipes-gnome/gnome/gnome-desktop.inc         |    2 +-
 meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb |    2 +-
 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb   |    2 +-
 meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb |    2 +-
 meta/recipes-gnome/gnome/libgdata_0.7.1.bb         |    2 ++
 .../recipes-gnome/gnome/libgnome-keyring_2.32.0.bb |    2 +-
 meta/recipes-gnome/gnome/metacity_2.30.3.bb        |    2 +-
 meta/recipes-gnome/gthumb/gthumb_2.12.4.bb         |    2 +-
 meta/recipes-gnome/gtk+/gtk+_2.24.8.bb             |    5 +++-
 .../gtk-engines/gtk-engines_2.20.2.bb              |    2 +-
 .../hicolor-icon-theme/hicolor-icon-theme_0.12.bb  |    2 +-
 meta/recipes-gnome/json-glib/json-glib_0.14.2.bb   |    2 +-
 meta/recipes-gnome/libglade/libglade_2.6.4.bb      |    2 +-
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb       |    2 +-
 meta/recipes-graphics/mutter/mutter_2.29.1.bb      |    2 +-
 meta/recipes-graphics/mutter/mutter_git.bb         |    2 +-
 .../sato-icon-theme/sato-icon-theme.inc            |   13 ++++++-----
 .../sato-icon-theme/sato-icon-theme_0.4.1.bb       |    2 +-
 .../recipes-support/consolekit/consolekit_0.4.5.bb |    2 +-
 meta/recipes-support/libcroco/libcroco_0.6.3.bb    |    2 +-
 meta/recipes-support/vte/vte_0.28.2.bb             |    2 +-
 29 files changed, 94 insertions(+), 41 deletions(-)

-- 
1.7.9.5



