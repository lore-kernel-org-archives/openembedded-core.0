Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-10.prod.phx3.secureserver.net
	(p3plsmtpa07-10.prod.phx3.secureserver.net [173.201.192.239])
	by mail.openembedded.org (Postfix) with ESMTP id 4653170621
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 21:13:23 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa07-10.prod.phx3.secureserver.net with 
	id DxDM1p00G0BVjqb01xDMup; Mon, 10 Nov 2014 14:13:23 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Nov 2014 15:12:57 -0600
Message-Id: <cover.1415647839.git.pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
Subject: [RFC 00/14] add virtual/bluez
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
X-List-Received-Date: Mon, 10 Nov 2014 21:13:28 -0000

I'm a bit out of my comfort zone here but I needed to do a lot of this
for myself, so figured I'd see how close this is to being mergeable.

This series is a proposed fix for Yocto 5031, providing virtual/bluez to
select between bluez4 and bluez5.  The intent is to continue using
bluez4 as the default, but to allow distros to switch to bluez5 if the
packages they need support the new interface.

There are conflicts.

bluez-hcidump got integrated into bluez5, so there's now virtual build
and runtime support to select the right one.

gst-plugin-bluetooth was removed from bluez5 and AFAICT has no
replacement.

obexd also got integrated into bluez5.  That's harder, because it
crosses the oe-core/meta-oe boundary so the virtual selectors can't be
done solely on oe-core.  I'm proposing an in-recipe conditional on
PREFERRED_PROVIDER-virtual/bluez to select the correct provider for
gnome-bluetooth.

I get my bluez5 builds with the following settings:

PREFERRED_PROVIDER_virtual/bluez = "bluez5"
VIRTUAL-RUNTIME_bluez = "bluez5"
PREFERRED_PROVIDER_bluez-hcidump = "bluez5"
PNBLACKLIST[bluez-hcidump] = "superseded by bluez5"
PNBLACKLIST[gst-plugin-bluetooth] = "dropped from bluez5"
PNBLACKLIST[bluez4] = "superseded by bluez5"

If there's a way to infer the required blacklists from the setting for
virtual/bluez that'd probably be a better approach.

I'm aware that gstreamer1.0-plugins-bad doesn't currently support
bluez5, and I've noted that in the commit message (bluetooth support
will be silently disabled by configure).

There are other packages and other features that don't fully support
bluez5; for example I don't think the issue with headsets is fully
resolved.  I don't feel that this should block merging bluez5 support,
as not everybody who wants bluez5 is going to care about those missing
features, and bluez4 support remains available for those who do.

I've done what I can to make sure all recipes I touched build with both
bluez4 and bluez5 but can't test whether their bluetooth support is
complete.

There's a corresponding set of patches to meta-openembedded for
virtual/bluez support at:

  git://git.openembedded.org/meta-openembedded-contrib pabigot/wip/virtual-bluez

The following changes since commit 3c741a8d33acbf4b3d5eecc04533bc76e2f37253:

  oprofile: 0.9.9 -> 1.0.0 (2014-11-09 10:21:24 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pabigot/wip/virtual-bluez
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pabigot/wip/virtual-bluez

Peter A. Bigot (14):
  bluez5: upgrade to 5.25
  bluez5: fix QA error from configure option
  default-providers: support virtual/bluez
  bluez-hcidump: select provider for bluez4/bluez5
  packagegroup-base: switch to VIRTUAL-RUNTIME_bluez
  pulseaudio: switch to virtual/bluez
  qt-mobility: switch to virtual/bluez
  gstreamer1.0-plugins-bad: switch to virtual/bluez
  ofono: switch to virtual/bluez
  neard: switch to VIRTUAL-RUNTIME_bluez
  libpcap: switch to virtual/bluez
  connman: switch to virtual/bluez
  bluez5: support experimental through PACKAGECONFIG
  bluez5: add a package for tools left in the build area

 meta/conf/distro/include/default-providers.inc     |  3 ++
 .../bluez/bluez-hcidump_2.5.bb                     |  2 +
 meta/recipes-connectivity/bluez/bluez4.inc         |  1 +
 meta/recipes-connectivity/bluez5/bluez5.inc        | 31 +++++++++++++-
 meta/recipes-connectivity/bluez5/bluez5_5.22.bb    |  3 --
 meta/recipes-connectivity/bluez5/bluez5_5.25.bb    | 50 ++++++++++++++++++++++
 meta/recipes-connectivity/connman/connman.inc      |  4 +-
 meta/recipes-connectivity/libpcap/libpcap.inc      |  2 +-
 meta/recipes-connectivity/neard/neard.inc          |  2 +-
 meta/recipes-connectivity/ofono/ofono.inc          |  2 +-
 .../packagegroups/packagegroup-base.bb             |  2 +-
 .../gstreamer/gstreamer1.0-plugins-bad.inc         |  4 +-
 .../gstreamer/gstreamer1.0-plugins-bad_git.bb      |  2 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |  2 +-
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |  2 +-
 15 files changed, 96 insertions(+), 16 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.22.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.25.bb

-- 
1.8.5.5


