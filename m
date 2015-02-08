Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-07.prod.phx3.secureserver.net
	(p3plsmtpa07-07.prod.phx3.secureserver.net [173.201.192.236])
	by mail.openembedded.org (Postfix) with ESMTP id D2D5B60556
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Feb 2015 18:42:47 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa07-07.prod.phx3.secureserver.net with 
	id puin1p00C0BVjqb01uioVe; Sun, 08 Feb 2015 11:42:48 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Feb 2015 12:42:12 -0600
Message-Id: <cover.1423420390.git.pab@pabigot.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCHv3 00/10] bluez4/bluez5 selection fixing Yocto 5031
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
X-List-Received-Date: Sun, 08 Feb 2015 18:42:57 -0000

This series has been in RFC for over two months; not that I mean to be
impatient, but it's pretty straightforward.  I've rebased it once
more.  Please give it serious consideration before some feature freeze
means another Yocto release won't support modern Bluetooth
infrastructure.

Details from the previous submission can be found here:

http://lists.openembedded.org/pipermail/openembedded-core/2014-November/099312.html

With this all you should need to switch to bluez5 is the following in
local.conf or some similar location:

    DISTRO_FEATURES_append = " bluez5"
    PREFERRED_PROVIDER_bluez-hcidump = "bluez5"
    PNBLACKLIST[bluez-hcidump] = "superseded by bluez5"
    PNBLACKLIST[gst-plugin-bluetooth] = "dropped from bluez5"
    PNBLACKLIST[bluez4] = "superseded by bluez5"

The following changes since commit 870323cac1e40e8f95ea7bd6f425a85dcfbab612:

  linux-yocto/3.14: fix qemumips build error (2015-02-08 08:00:30 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pabigot/bluez5
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pabigot/bluez5

Peter A. Bigot (10):
  bluez5: upgrade to 5.28
  bluetooth.bbclass: simplify recipe inference of bluetooth provider
  packagegroup-base: select distro preference for bluez provider
  pulseaudio: select distro preference for bluez provider
  qt-mobility: select distro preference for bluez provider
  gstreamer1.0-plugins-bad: select distro preference for bluez provider
  ofono: select distro preference for bluez provider
  neard: select distro preference for bluez provider
  libpcap: select distro preference for bluez provider
  connman: depend on distro provider of bluez

 meta/classes/bluetooth.bbclass                             | 14 ++++++++++++++
 .../bluez5/{bluez5_5.27.bb => bluez5_5.28.bb}              |  7 ++++---
 meta/recipes-connectivity/connman/connman.inc              |  6 ++++--
 meta/recipes-connectivity/libpcap/libpcap.inc              |  6 ++++--
 meta/recipes-connectivity/neard/neard.inc                  |  4 ++--
 meta/recipes-connectivity/ofono/ofono.inc                  |  6 +++---
 meta/recipes-core/packagegroups/packagegroup-base.bb       |  3 ++-
 .../gstreamer/gstreamer1.0-plugins-bad.inc                 |  6 +++---
 .../gstreamer/gstreamer1.0-plugins-bad_git.bb              |  1 -
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc          |  4 ++--
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc                  |  6 ++++--
 11 files changed, 42 insertions(+), 21 deletions(-)
 create mode 100644 meta/classes/bluetooth.bbclass
 rename meta/recipes-connectivity/bluez5/{bluez5_5.27.bb => bluez5_5.28.bb} (85%)

-- 
1.9.1


