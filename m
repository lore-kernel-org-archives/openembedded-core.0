Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id B4944738AE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 10:10:03 +0000 (UTC)
Received: from comp_016_pc_buildenv.localdomain (unknown [31.182.60.238])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 2A9383FD017;
	Mon,  8 Feb 2016 11:10:02 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org,
	Enrico Jorns <ejo@pengutronix.de>, Roy Li <rongqing.li@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Christopher Larson <chris_larson@mentor.com>,
	Ross Burton <ross.burton@intel.com>
Date: Mon,  8 Feb 2016 11:09:37 +0100
Message-Id: <1454926183-22439-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 2.5.0
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH 0/6] systemd cleanup & package split
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
X-List-Received-Date: Mon, 08 Feb 2016 10:10:06 -0000

A couple of patches that allow us to build a slimmer variant of
systemd. As of now, systemd is configured with most options enabled. The
resulting package is large, roughly 14359kB (for x86 builds) and is a
bit of concern if one is trying to build smaller images. This patch
series attempts to address the problem, while trying to remain
compatible with current way of doing things.

After applying patches, leaving default PACKAGECONFIG flags and skipping
systemd-extra-utils, the systemd takes ~4000kB in the image. It should
be possible to strip it even further just leaving systemd and systemctl
in the target image, but figuring out which units are necessary yet
failed to work might be a bit of a pain.

The first patch follows the approach of zsh completion files and splits
bash completion handlers into separate package - systemd-bash.

The second patch is just a small cosmetic change that allows for cleaner
diffs when adding/removing packages.

The third patch adds a number of PACKAGECONFIG flags to systemd. By
default only a handful of these is enabled, plus a couple of features
that stem from DISTRO or MACHINE features. Flag 'binfmt' is enabled as
we're building systemd-binfmt package. Flag 'sysusers' is enabled as
well, as this enabled cleanups in patch 4. Flag 'randomseed' is enabled
as it just made sense to have systemd-random-seed run during
boot. Almost every --enable-feature configure switch has been exposed as
PACKAGECONFIG flag, so it's fairly easy to opt-in for particular
functionality if needed.

Patch 4 uses sysusers for creating users. The user accounts created by
systemd are by default slightly more restricted than ones brought up by
useradd class. Namely the shell is set to /bin/nologin and no home
directory is created.

Patch 5 splits all/most of nonessential binaries into a separate
systemd-extra-utils package. The package is listed in RRECOMMENDS so
that it gets included by default in images. Binaries that get created as
a result of PACKAGECONFIG flags will be included in the main 'systemd'
package to avoid the effect when use has set a flag but the desired
binary is not in the target system.

Patch 6 removes chown on /var/lib/journal that may no longer be
necessary.

Maciej Borzecki (6):
  systemd: move bash completion into separate package
  systemd: realign packages list
  systemd: extend PACKAGECONFIG flags
  systemd: use sysusers for setting up required users/groups
  systemd: move some tools into systemd-extra-utils package
  systemd: remove unnecessary code

 meta/recipes-core/systemd/systemd_228.bb | 128 +++++++++++++++++++++++++++----
 1 file changed, 112 insertions(+), 16 deletions(-)

--
2.5.0


