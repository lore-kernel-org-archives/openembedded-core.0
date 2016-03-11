Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8B5BB607A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 13:06:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 11 Mar 2016 05:06:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,320,1455004800"; d="scan'208";a="931739825"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 11 Mar 2016 05:06:39 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Mar 2016 15:12:12 +0200
Message-Id: <cover.1457698804.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [RFC PATCH 00/12] Sato desktop upgrade (Gtk3 etc.)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Mar 2016 13:06:50 -0000

Here's a snapshot of the Sato upgrade I've been working on (YOCTO
 #3169). It's based on Ross' work from 2.5 years back. The bigger
changes currently live as my forks of the upstream projects (gtk3
branches of various projects at https://github.com/jku), and the
patchset here modifies recipes to temporarily use those forks:
this is intended to make testing and review possible but also
means this is just an RFC: once the upstream changes are merged,
I'll update this patchset.


For those not familiar with it, the goal of the exercise is to
 1. Bring Sato desktop closer to this decade (Don't depend on
    ancient components, remove deprecated code)
 2. Focus more on delivering an environment for validating and
    testing oe-core, less on building a DE for mobile devices


Major changes:
 * Ports to GTK3: matchbox-desktop, matchbox-panel-2,
   connman-gnome, sato-screenshot, xsettings-daemon
 * GTK+ theme is Adwaita (upstream default)
 * Matchbox WM theme modified to somewhat resemble Adwaita (boring
   gray instead of in-your-face green)
 * Matchbox panel is no longer drawn on top of application titlebars
   because that fails badly with client side decorations. Instead
   it's a thinner panel always on top of screen, like gnome2 panel.
 * Custom GTK theme engine is dropped
Here's a screenshot showing the panel and window decoration:
http://imgur.com/noqptiu


Regressions:
 * on-screen keyboard: I've not looked very closely but I
   believe this requires IM work for GTK3
 * startup notification


Questions:
 * Schedule: this is for Yocto 2.1 in bugzilla (now M3) but got
   delayed. it's a bigger change and isn't ready to merge
   (as the upstream patches need review). Should I aim for next
   release instead?
 * How should we do review on this? The upstreams are mostly on
   yoctoproject.org so I could send patches to some YP mailing list...
   but testing many of the patches is impossible without the patches
   for the other projects.
 * Are the regressions listed above blockers?
 * Anything I've missed? Theme design bikeshedding?


Cheers,
  Jussi


The following changes since commit 37b61b059031e3c272a929b834e12fd83f46598c:

  siteinfo: Add ppc64le support. (2016-03-10 23:13:55 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/matchbox-wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/matchbox-wip

Jussi Kukkonen (12):
  gnome-themes-standard: Add new recipe
  packagegroup-core-x11-sato: Update for GTK3 changes
  matchbox-theme-sato: Upgrade to JKU
  matchbox-desktop: Ugrade to JKU
  matchbox-panel-2: Upgrade to JKU
  matchbox-session-sato: Update session startup
  sato-screenshot: Upgrade to JKU
  settings-daemon: Upgrade to JKU
  gtk-sato-engine: Remove as unused
  matchbox-wm: Upgrade to JKU
  connman-gnome: Upgrade to JKU
  matchbox-panel-2: Depend on dbus-glib-native for binding-tool

 .../connman-gnome-fix-dbus-interface-name.patch    | 187 ---------------------
 .../connman-gnome/images/connman-signal-01.png     | Bin 490 -> 0 bytes
 .../connman-gnome/images/connman-signal-02.png     | Bin 496 -> 0 bytes
 .../connman-gnome/images/connman-signal-03.png     | Bin 492 -> 0 bytes
 .../connman-gnome/images/connman-signal-04.png     | Bin 470 -> 0 bytes
 .../connman-gnome/images/connman-signal-05.png     | Bin 419 -> 0 bytes
 .../connman/connman-gnome_0.7.bb                   |  12 +-
 .../gnome/gnome-themes-standard_3.18.0.bb          |  37 ++++
 .../matchbox-wm/matchbox-wm_git.bb                 |   4 +-
 meta/recipes-sato/gtk-engines/gtk-sato-engine.inc  |  25 ---
 .../gtk-engines/gtk-sato-engine_git.bb             |  14 --
 .../matchbox-desktop/matchbox-desktop_git.bb       |   7 +-
 .../matchbox-panel-2/files/silence-warnings.patch  |  64 -------
 .../matchbox-panel-2/matchbox-panel-2_git.bb       |  12 +-
 .../matchbox-sato/matchbox-session-sato/session    |   9 +-
 .../matchbox-sato/matchbox-session-sato_0.1.bb     |   4 +-
 .../matchbox-theme-sato/matchbox-theme-sato_0.1.bb |   8 -
 .../matchbox-theme-sato/matchbox-theme-sato_git.bb |   8 +-
 .../packagegroups/packagegroup-core-x11-sato.bb    |   6 +-
 .../sato-screenshot/sato-screenshot_git.bb         |   6 +-
 .../files/dso_linking_change_build_fix.patch       |  31 ----
 .../settings-daemon/settings-daemon_git.bb         |   8 +-
 22 files changed, 65 insertions(+), 377 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/connman-gnome-fix-dbus-interface-name.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-01.png
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-02.png
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-03.png
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-04.png
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-05.png
 create mode 100644 meta/recipes-gnome/gnome/gnome-themes-standard_3.18.0.bb
 delete mode 100644 meta/recipes-sato/gtk-engines/gtk-sato-engine.inc
 delete mode 100644 meta/recipes-sato/gtk-engines/gtk-sato-engine_git.bb
 delete mode 100644 meta/recipes-sato/matchbox-panel-2/files/silence-warnings.patch
 delete mode 100644 meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.1.bb
 delete mode 100644 meta/recipes-sato/settings-daemon/files/dso_linking_change_build_fix.patch

-- 
2.1.4


