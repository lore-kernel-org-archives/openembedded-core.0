Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6A990734B8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 14:30:22 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP; 26 Aug 2016 07:30:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,581,1464678000"; 
   d="scan'208";a="1525514"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by orsmga004.jf.intel.com with ESMTP; 26 Aug 2016 07:30:22 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 17:28:15 +0300
Message-Id: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH 00/28] Enable gtk-doc
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
X-List-Received-Date: Fri, 26 Aug 2016 14:30:23 -0000

This patchset adds gtk-doc support to OE-core. It requires running
transient binaries during build time, which is achieved via qemu,
and so there are all the same caveats as with gobject-introspection.

Gtk-doc generation happens if 'api-documentation' distro feature is enabled
(it is by default), and 'qemu-usermode' is in machine features. Disable
the former if api documentation is not needed in your distro; disable the latter
if qemu does not work correctly for your target machine.

Gtk-doc support is a part of a broader task to enable API documentation
support in OE-core; later on I will add support for doxygen and docbook, enable
more manpages, and clean up the legacy SGML stack if possible.

The following changes since commit a81b326933d15f08e06780f92d8dc0d4efb3cd23:

  combo-layer: python3: fix UnicodeDecodeError (2016-08-24 13:58:28 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/enable-documentation
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/enable-documentation

Alexander Kanavin (28):
  source-highlight: add a recipe
  gtk-doc: add a recipe, remove gtk-doc-stub
  bitbake.conf: add "api-documentation" to default distro features
  gtk-doc.bbclass: enable building gtk-doc based documentation
  kmod: do not let gtkdocize fail
  systemd: drop unused gtkdoc-related variable
  libglade: remove the recipe
  gstreamer1.0: enable gtk-doc support
  webkitgtk: enable gtk-doc support
  gcr: disable gtk-doc on x86_64
  gcr, libsecret, webkitgtk: disable gtk-doc on mips64
  webkitgtk: re-enable introspection on powerpc
  dbus-glib: enable gtk-doc
  orc: enable gtk-doc
  libidn: enable gtk-doc
  libuser: enable gtk-doc
  gdk-pixbuf: enable gtk-doc
  gnome-desktop3: enable gtk-doc
  json-glib: enable gtk-doc
  libgudev: enable gtk-doc
  libenck3: enable gtk-doc
  cairo: enable gtk-doc
  harfbuzz: enable gtk-doc
  gnutls: enable gtk-doc
  libtasn1: enable gtk-doc
  libsoup-2.4: enable gtk-doc
  p11-kit: enable gtk-doc
  util-linux: do not enable gtk-doc and explain why

 meta/classes/gtk-doc.bbclass                       |  72 ++-
 meta/conf/bitbake.conf                             |   2 +-
 meta/conf/distro/include/security_flags.inc        |   1 +
 meta/recipes-core/dbus/dbus-glib.inc               |   2 +-
 meta/recipes-core/systemd/systemd_230.bb           |   2 -
 meta/recipes-core/util-linux/util-linux.inc        |   1 +
 meta/recipes-devtools/orc/orc_0.4.25.bb            |   2 +-
 meta/recipes-extended/libidn/libidn_1.33.bb        |   2 +-
 meta/recipes-extended/libuser/libuser_0.62.bb      |   2 +-
 meta/recipes-gnome/gcr/gcr_3.20.0.bb               |   4 +-
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.34.0.bb |   2 +-
 .../gnome-desktop/gnome-desktop3_3.20.2.bb         |   2 +-
 ...t-Import-introspection-stub-machinery-too.patch | 305 -------------
 .../recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb |  33 --
 meta/recipes-gnome/gtk-doc/gtk-doc_1.25.bb         |  37 ++
 meta/recipes-gnome/json-glib/json-glib_1.2.2.bb    |   2 +-
 .../libglade/libglade-2.6.4/glade-cruft.patch      | 102 -----
 .../libglade/libglade-2.6.4/no-xml2.patch          | 501 ---------------------
 .../libglade-2.6.4/python_environment.patch        |  14 -
 meta/recipes-gnome/libglade/libglade_2.6.4.bb      |  31 --
 meta/recipes-gnome/libgudev/libgudev_230.bb        |   2 +-
 meta/recipes-gnome/libsecret/libsecret_0.18.5.bb   |   2 +-
 meta/recipes-gnome/libwnck/libwnck3_3.20.1.bb      |   2 +-
 meta/recipes-graphics/cairo/cairo.inc              |   2 +-
 meta/recipes-graphics/harfbuzz/harfbuzz_1.3.0.bb   |   2 +-
 meta/recipes-kernel/kmod/kmod.inc                  |   2 +-
 .../gstreamer/gstreamer1.0-libav.inc               |   2 +-
 .../gstreamer/gstreamer1.0-omx.inc                 |   2 +-
 .../gstreamer/gstreamer1.0-plugins.inc             |  14 +-
 .../gstreamer/gstreamer1.0-rtsp-server.inc         |  14 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |  16 +-
 ...c-settings-so-that-gtkdoc-generation-work.patch |  49 ++
 meta/recipes-sato/webkit/webkitgtk_2.12.3.bb       |  13 +-
 meta/recipes-support/gnutls/gnutls.inc             |   4 +-
 meta/recipes-support/gnutls/libtasn1_4.9.bb        |   2 +-
 meta/recipes-support/libsoup/libsoup-2.4_2.54.1.bb |   2 +-
 meta/recipes-support/p11-kit/p11-kit_0.22.1.bb     |  22 +-
 ...light.pc.in-do-not-add-Boost-s-libraries-.patch |  30 ++
 .../source-highlight/source-highlight_3.1.8.bb     |  28 ++
 39 files changed, 287 insertions(+), 1042 deletions(-)
 delete mode 100644 meta/recipes-gnome/gtk-doc-stub/files/0001-Revert-Import-introspection-stub-machinery-too.patch
 delete mode 100644 meta/recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb
 create mode 100644 meta/recipes-gnome/gtk-doc/gtk-doc_1.25.bb
 delete mode 100644 meta/recipes-gnome/libglade/libglade-2.6.4/glade-cruft.patch
 delete mode 100644 meta/recipes-gnome/libglade/libglade-2.6.4/no-xml2.patch
 delete mode 100644 meta/recipes-gnome/libglade/libglade-2.6.4/python_environment.patch
 delete mode 100644 meta/recipes-gnome/libglade/libglade_2.6.4.bb
 create mode 100644 meta/recipes-sato/webkit/files/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch
 create mode 100644 meta/recipes-support/source-highlight/files/0001-source-highlight.pc.in-do-not-add-Boost-s-libraries-.patch
 create mode 100644 meta/recipes-support/source-highlight/source-highlight_3.1.8.bb

-- 
2.9.3


