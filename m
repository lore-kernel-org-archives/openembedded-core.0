Return-Path: <petter@technux.se>
Received: from bin-vsp-out-02.atm.binero.net (vsp-unauthed01.binero.net
	[195.74.38.225])
	by mail.openembedded.org (Postfix) with ESMTP id 36AD272B05
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Jan 2015 14:46:35 +0000 (UTC)
X-Halon-ID: 9a804ce0-98d6-11e4-8a31-005056917f90
Authorized-sender: petter@technux.se
Received: from elxbvzzwp1-cy.lan (unknown [81.229.90.163])
	by bin-vsp-out-02.atm.binero.net (Halon Mail Gateway) with ESMTPSA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Jan 2015 15:40:20 +0100 (CET)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Sat, 10 Jan 2015 15:40:09 +0100
Message-Id: <cover.1420899992.git.petter@technux.se>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [RFC PATCH 0/5] base.bbclass: detect when S has been set incorrectly
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
X-List-Received-Date: Sat, 10 Jan 2015 14:46:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Peter Mabacker <petter@technux.se>

This is my proposed solution for [YOCTO #5627].

I'm will gratefully recieve feedback regarding especially the removal of auto-create 'S'
in base.bbclass and if 'S' not set to a proper value, should generate a warning or error.

I have chosen a warning (at least to start with). Since a lot of recipes have
faulty $S (for example S=WORKDIR/$PN (default) instead of S=WORKDIR), you might assume
that a lot of external layers have recipes with this problem as well and display an error and
abort might be a bit to hard. At least until people have had the chance to clean this up.

So the suggestion is to start with a warning and consider changing this to error later on (in 1.9?).

The following changes since commit 876370419a50264a28feb4278f8c465b0019e709:

  bitbake: toaster: implementation of project page (2015-01-08 22:34:38 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib petmab/bug5627
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=petmab/bug5627

Petter Mabäcker (5):
  base.bbclass: detect when S has been set incorrectly
  makedevs: set and handle S in a proper way
  lsof: handle S in a proper way
  xorg-minimal-fonts: set and handle S in a proper way
  meta: set proper S value

 meta/classes/base.bbclass                               | 17 +++++++++++++----
 meta/recipes-bsp/alsa-state/alsa-state.bb               |  2 ++
 meta/recipes-bsp/hostap/hostap-conf_1.0.bb              |  2 ++
 meta/recipes-bsp/keymaps/keymaps_1.0.bb                 |  2 ++
 meta/recipes-connectivity/connman/connman-conf.bb       |  2 ++
 meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb  |  2 ++
 meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb    |  2 ++
 meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb   |  2 ++
 .../initrdscripts/initramfs-framework_1.0.bb            |  2 ++
 .../initrdscripts/initramfs-live-boot_1.0.bb            |  2 ++
 .../initramfs-live-install-efi-testfs_1.0.bb            |  2 ++
 .../initrdscripts/initramfs-live-install-efi_1.0.bb     |  2 ++
 .../initrdscripts/initramfs-live-install-testfs_1.0.bb  |  2 ++
 .../initrdscripts/initramfs-live-install_1.0.bb         |  2 ++
 meta/recipes-core/initscripts/initscripts_1.0.bb        |  2 ++
 meta/recipes-core/systemd/systemd-systemctl-native.bb   |  2 ++
 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb  |  2 +-
 meta/recipes-core/udev/udev-extraconf_1.1.bb            |  2 ++
 meta/recipes-devtools/makedevs/makedevs_1.0.1.bb        |  6 ++----
 meta/recipes-devtools/opkg/opkg-collateral.bb           |  2 ++
 .../recipes-devtools/run-postinsts/run-postinsts_1.0.bb |  2 ++
 meta/recipes-extended/lsof/lsof_4.88.bb                 |  7 +++++++
 meta/recipes-extended/shadow/shadow-securetty_4.2.1.bb  |  2 ++
 meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb   |  4 +++-
 .../xorg-xserver/xserver-xf86-config_0.1.bb             |  2 ++
 .../modutils-initscripts/modutils-initscripts.bb        |  3 +++
 meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb             |  2 ++
 meta/recipes-support/ptest-runner/ptest-runner_1.0.bb   |  2 ++
 28 files changed, 73 insertions(+), 10 deletions(-)

-- 
1.9.1


