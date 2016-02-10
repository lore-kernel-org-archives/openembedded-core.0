Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 70822731C1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 12:33:14 +0000 (UTC)
Received: from comp_016_pc_buildenv.localdomain (unknown [31.182.60.238])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id C77011A7AB3;
	Wed, 10 Feb 2016 13:33:12 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org,
	Enrico Jorns <ejo@pengutronix.de>, Roy Li <rongqing.li@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Christopher Larson <chris_larson@mentor.com>,
	Ross Burton <ross.burton@intel.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>,
	Randy MacLeod <randy.macleod@windriver.com>, Tanu Kaskinen <tanuk@iki.fi>
Date: Wed, 10 Feb 2016 13:32:49 +0100
Message-Id: <1455107576-8931-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 2.5.0
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v2 0/7] systemd cleanups & trimming
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
X-List-Received-Date: Wed, 10 Feb 2016 12:33:15 -0000

This is a second iteration of patches aiming at providing more knobs for
configuration of systemd. The default configuration of systemd produces
a package of significant size. By carefully setting the knobs it is
possible to enable/disable functionality that is required for particular
use cases.

The patches attempt to preserve the functionality of currently built
packages. Parties interested in trimming systemd by a couple of MBs need
to override PACKAGECONFIG manually.

By disabling most of flags and skipping systemd-extra-utils package,
depending on the architecture, systemd package should be roughly ~4MB
in size.

The first patch uses bash-completion class for wrapping up bash files.

The second patch is just a small cosmetic change that allows for cleaner
diffs when adding/removing packages.

The third patch is required for the fourth one. The patch provides
handling of a situation when USERADD/GROUPADD/GROUPMEMS are made up of
spaces only. This may happen in a scenarion when the variables are
appended/prepended with spaces, but the content of the append is
conditional. In this case, in the fourth patch, certain users are only
added if specific PACKAGECONFIG flag was set.

The fourth patch adds a number of PACKAGECONFIG flags to systemd.

Patch 5 splits all/most of nonessential binaries into a separate
systemd-extra-utils package. The package is listed in RRECOMMENDS so
that it gets included by default in images. Binaries that get created as
a result of PACKAGECONFIG flags will be included in the main 'systemd'
package to avoid the effect when use has set a flag but the desired
binary is not in the target system.

Patch 6 tightens the user accounts for systemd services: timesyncd and
journal-gateway. The users will be created without separate /home
directory, home set to / and shell set to /bin/nologin.

The last patch renames zsh completion package systemd-zsh to
systemd-zsh-completion to preserve consistency with its bash
counterpart.

If someone wishes to trim down systemd even further, I'd suggest looking
first at generators (~350kB) as these are not essential if one provides
proper unit files in advance. Another potential candidate is
systemd-fsck (~300kB), as it should be possible to skip it completely.
Also systemd-shutdown is large (~150kB), for reasons unclear to me at
the moment. After going through system source code there is a room for
further improvement by splitting the internal static libraries
(libshared, libbase, libsystemd-internal) into shared ones, but I'm
guessing this should be done in agreement with upstream.

Maciej Borzecki (7):
  systemd: move bash completion into separate package
  systemd: realign packages list
  classes/useradd: handle whitespace only USERADD/GROUPADD/GROUPMEMS
  systemd: extend PACKAGECONFIG flags
  systemd: move some tools into systemd-extra-utils package
  systemd: tighten timesyncd and journal-gateway user accounts
  systemd: rename systemd-zsh to systemd-zsh-completion

 meta/classes/useradd.bbclass             |   6 +-
 meta/recipes-core/systemd/systemd_228.bb | 131 ++++++++++++++++++++++++++++---
 2 files changed, 121 insertions(+), 16 deletions(-)

--
2.5.0


