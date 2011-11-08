Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RNZNA-0003Cy-Pt
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 01:17:04 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Nov 2011 16:10:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="72146536"
Received: from unknown (HELO shamshir.jf.intel.com) ([10.7.199.75])
	by orsmga001.jf.intel.com with ESMTP; 07 Nov 2011 16:10:50 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2011 16:10:37 -0800
Message-Id: <cover.1320709417.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7
Subject: [PATCH 00/12] Recipe upgrades, fixes and additions
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
X-List-Received-Date: Tue, 08 Nov 2011 00:17:05 -0000

All,

Here's a series of patches I developed whilst trying to play around with some
Clutter based software.

The interesting pieces may be:
Clutter 1.8 series recipes - do we want/need to keep clutter 1.6 around?
Are we OK with continuing to namespace the clutter recipes by clutter
version?

Gconf - I've pulled in GConf from upstream as the D-Bus backend is maintained
there now. For this I pulled in the gnome-related classes from meta-oe as they
simplified this recipe and I've been wanting to see them merged for some time.

Pulseaudio - whilst adding a required build dependency I changed the recipe so
that it doesn't require X unless the X11 distro feature is enabled.

Cheers,
Joshua

The following changes since commit 0809f98e995d3a2ce24ad25bade3dcd5154061fd:

  lighttpd 1.4.29: rename index.html to avoid clashes with DL_DIR (2011-11-07 14:03:38 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/work
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/work

Joshua Lock (12):
  cogl: add cogl 1.8.0 recipe
  clutter-1.8: add 1.8.0
  clutter-gst-1.8: add 1.4.2 for use with clutter 1.8
  clutter-gtk-1.8: add clutter-gtk 0.11.4
  mx: add mx toolkit 1.3.2
  classes/[gnome|gnomebase|mime]: merge meta-oe's enhance gnome related
    classes
  gconf: add upstream GNOME gconf 3.2.3 and drop gconf-dbus
  libcanberra: add libvorbis to DEPENDS
  gypsy: fix packaging
  connman: split scripts into separate package
  pulseaudio: make X11 dependencies optional and add gtk+
  contacts: fix packaging of icons

 meta/classes/gnome-base.bbclass                    |   15 +++++
 meta/classes/gnome.bbclass                         |   19 +-----
 meta/classes/gnomebase.bbclass                     |   32 +++++++++++
 meta/classes/mime.bbclass                          |   56 +++++++++++++++++++
 meta/conf/distro/include/default-providers.inc     |    2 -
 meta/conf/multilib.conf                            |    2 +-
 meta/recipes-connectivity/connman/connman.inc      |    6 ++-
 meta/recipes-connectivity/gypsy/gypsy_0.8.bb       |    4 +-
 meta/recipes-gnome/gnome/gconf-3.2.3/nointro.patch |   59 ++++++++++++++++++++
 meta/recipes-gnome/gnome/gconf-dbus_705.bb         |   43 --------------
 meta/recipes-gnome/gnome/gconf_3.2.3.bb            |   43 ++++++++++++++
 meta/recipes-graphics/clutter/clutter-1.8_1.8.0.bb |   26 +++++++++
 .../clutter/clutter-gst-1.8_1.4.2.bb               |   22 +++++++
 .../clutter/clutter-gst/enable_tests-1.8.bb        |   15 +++++
 .../clutter/clutter-gtk-1.8_0.11.4.bb              |   11 ++++
 meta/recipes-graphics/clutter/cogl.inc             |    2 +-
 .../clutter/cogl/macro-versions.patch              |   26 +++++++++
 meta/recipes-graphics/clutter/cogl_1.8.0.bb        |    9 +++
 meta/recipes-graphics/mx/mx_1.3.2.bb               |   17 ++++++
 .../pulseaudio/libcanberra_0.28.bb                 |    2 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    4 +-
 meta/recipes-sato/pimlico/contacts.inc             |    3 +-
 22 files changed, 348 insertions(+), 70 deletions(-)
 create mode 100644 meta/classes/gnome-base.bbclass
 create mode 100644 meta/classes/gnomebase.bbclass
 create mode 100644 meta/classes/mime.bbclass
 create mode 100644 meta/recipes-gnome/gnome/gconf-3.2.3/nointro.patch
 delete mode 100644 meta/recipes-gnome/gnome/gconf-dbus_705.bb
 create mode 100644 meta/recipes-gnome/gnome/gconf_3.2.3.bb
 create mode 100644 meta/recipes-graphics/clutter/clutter-1.8_1.8.0.bb
 create mode 100644 meta/recipes-graphics/clutter/clutter-gst-1.8_1.4.2.bb
 create mode 100644 meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.8.bb
 create mode 100644 meta/recipes-graphics/clutter/clutter-gtk-1.8_0.11.4.bb
 create mode 100644 meta/recipes-graphics/clutter/cogl/macro-versions.patch
 create mode 100644 meta/recipes-graphics/clutter/cogl_1.8.0.bb
 create mode 100644 meta/recipes-graphics/mx/mx_1.3.2.bb

-- 
1.7.7



