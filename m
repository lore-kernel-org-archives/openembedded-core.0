Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1U1HRm-0004la-97
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 15:18:32 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r11E2fTN000226;
	Fri, 1 Feb 2013 06:02:42 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri,  1 Feb 2013 09:02:33 -0500
Message-Id: <cover.1359726620.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Fri, 01 Feb 2013 14:18:55 -0000

Richard/Saul,

This pull request is a collection of bug fixes and feature additions
for the 1.4 release. Documentation updates are underway for the new
features, but they've soaked long enough here, so I wanted to get
them out while there's lots of time to address any issues.

[PATCH 1/5] guilt: remove GIT_EXEC_BASE export

  This fixes a bug that has been reported off and on for nearly a 
  year now. I finally saw it on my local machine and was able to
  track down the cause .. and export of GIT_EXEC_BASE that is no
  longer needed. Although I may get rid of guilt shortly, it's still
  worth fixing this now.

[PATCH 2/5] kernel-yocto: make configuration audit details debug only

  This addresses [YOCTO #3415], and simply makes the full kernel
  configuration audit slightly less visible, but yet still available.

[PATCH 3/5] kernel-yocto: fix .scc and .cfg matching

  I ran into this while implementing a new feature, some local 
  SRC_URIs were matching fragments incorrectly. With this fix
  I'm back to only getting .scc and .cfg files.

[PATCH 4/5] kernel-yocto: allow multiple / shared kernel feature directories

  This is the most interesting addition of this series, and it's
  the start of solving the problem of having multiple people developing
  disjoint sets of kernel configuration blocks, or kernel features. 

  To promote the reuse and sharing of configuration fragments this change
  allows any kernel-yocto based recipe to have multiple alternate git repositories
  which provide kernel feature directory trees listed on the SRC_URI.

  These feature directories are in addition to any in-tree kernel meta data branches
  that may be available (described via the KMETA variable in linux-yocto recipes).

  Features found within these directories can be used from recipes via the
  KERNEL_FEATURES variable. Features found within a feature directory are free
  to include any other features that are available in any directories. In both
  cases the path to a feature description (a .scc file) is relative to the
  root of a given feature directory (which is how existing .scc files work)

  The search order for features is determined by the order that repositories
  appear on the SRC_URI.

  Normal SRC_URI rules apply to any repository that is added as a kernel
  feature container. A SRCREV must be supplied and it must be unpacked to
  a unique directory, which is controlled via the "destsuffic" url parameter.

  In addition to these standard requirements, any kernel feature repository
  reference should identify itself via the "type=kmeta" url parameter. If
  type=kmeta is not supplied, the repository will not be processed for
  kernel features.

  As an example, the following in a linux-yocto bbappend makes two additional
  feature directories available to KERNEL_FEATURES and fragments.

    SRC_URI += "git://git.yoctoproject.org/yocto-kernel-cache;protocol=git;branch=master;type=kmeta;name=feat1;destsuffix=kernel-cache/"
    SRC_URI += "git://${KSRC_linux_yocto_3_4};protocol=file;branch=meta;name=feat2;type=kmeta;destsuffix=kernel-features-experimental/"

    SRCREV_feat1 = "${AUTOREV}"
    SRCREV_feat2 = "${AUTOREV}"

[PATCH 5/5] kernel-yocto/linux-yocto-custom: support low bandwidth options

  To support configurations where active development is not being done within
  the oe/bitbake build environment and restricted bandwidth situations, this
  commit allows the SRC_URI to point to a kernel tgz instead of a full git
  repository.

  Outside of the upstream tgz instead of a kernel git repository, the
  restrictions, config and patch process is the same as any linux-yocto-custom
  recipe.

  An example linux-yocto-custom based recipe would have a configuration like
  this to build the 3.7 kernel, using an externally supplied config, from the
  3.7 tgz:

    SRC_URI = "http://kernel.org/pub/linux/kernel/v3.0/linux-3.7.tar.bz2"
    PV = "3.7"
    S = "${WORKDIR}/linux-3.7"
    SRC_URI[md5sum] = "5323f3faadd051e83af605a63be5ea2e"
    SRC_URI[sha256sum] = "dc08d87a579fe2918362e6666e503a95a76296419195cb499aa9dd4dbe171a9e"

  [YOCTO #2686]

Cheers,

Bruce

The following changes since commit 828b1143477da079956a5541f8cc66c07ab6a3cc:

  multilib: skip packages that provide virtual/kernel (2013-01-31 12:39:47 -0500)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel-dev
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (5):
  guilt: remove GIT_EXEC_BASE export
  kernel-yocto: make configuration audit details debug only
  kernel-yocto: fix .scc and .cfg matching
  kernel-yocto: allow multiple / shared kernel feature directories
  kernel-yocto/linux-yocto-custom: support low bandwidth options

 meta/classes/kernel-yocto.bbclass                  |   77 +++++++++++++++-----
 meta/recipes-devtools/guilt/guilt-native_0.33.bb   |    3 +-
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 3 files changed, 62 insertions(+), 20 deletions(-)

-- 
1.7.10.4



