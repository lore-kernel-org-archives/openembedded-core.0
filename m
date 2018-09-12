Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id A0E7379585
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 01:36:30 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id E134B220044;
	Wed, 12 Sep 2018 13:27:11 +1200 (NZST)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Sep 2018 13:27:01 +1200
Message-Id: <20180912012707.30046-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 0/6] Reproducible: Find the git repo in WORKDIR/git or S first
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
X-List-Received-Date: Wed, 12 Sep 2018 01:36:41 -0000

Change the search regime for find_git_folder():

1. WORKDIR/git: This is the default git fetcher unpack path
2. ${S}
3. Go looking for .git/ under the WORKDIR as a last resort.

linux-yocto:
We had an existing (silent) defect. The linux-yocto recipes all specify
two git SRC_URIs, one for the kernel source itself, the other for the
kmeta data (config fragments and friends). find_git_folder() was finding
the git checkout for the kmeta data, but due to a typo in the git log -1
--pretty=%ct line, we were (silently) reading the source_date_epoch from
the ${S} directory = STAGING_KERNEL_DIR, which is empty. If your
build/ happened to be inside a git checkout, git would walk up the
directory tree, and silently read the commit timestamp from this other
git checkout. The correct path to read the git commit timestamp from is
the "gitpath", being that found by find_git_folder(), though this
function was incorrectly finding the kmeta data checkout, not the kernel
source tree.

Non-kernel git recipes:
The default git fetcher clones and checks out the sources at
WORKDIR/git/ regardless of the setting of S (unless subpath or
destsuffix is set). find_git_folder() now looks for the
WORKDIR/git/.git/ directory first.

Non-yocto linux kernels:
Kernel recipes that don't inherit kernel-yocto should always set
S = ${WORKDIR}/git, so that when base_do_unpack_append() in
kernel.bbclass moves the checkout down to the STAGING_KERNEL_DIR and
symlinks it as WORKDIR/git, the build can still work by following the
symlink. We were previously failing to follow the symlink in the
os.walk(), but we now look first for WORKDIR/git/.git/, and find it due
to the symlink.

If none of the above mechanisms work for finding the git checkout,
perhaps there was a subpath or destsuffix specified in the SRC_URI.
We go looking for the git checkout under the WORKDIR as a last resort.

Douglas Royds (6):
  Reproducible: Tidy class description
  Reproducible: Refactor: get_source_date_epoch_from_youngest_file()
  Reproducible: Rename ambiguous "path" var to sourcedir or workdir as appropriate
  Reproducible: Find the git repo in WORKDIR/git or S first
  Reproducible: Don't enforce existence of ${S} dir
  Reproducible: Consistent debug logging

 meta/classes/reproducible_build.bbclass | 149 +++++++++++++-----------
 1 file changed, 81 insertions(+), 68 deletions(-)

-- 
2.17.1


