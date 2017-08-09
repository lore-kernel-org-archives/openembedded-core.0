Return-Path: <juro.bystricky@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1D9A977D6E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 17:49:03 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 09 Aug 2017 10:49:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,348,1498546800"; d="scan'208";a="117337352"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga004.jf.intel.com with ESMTP; 09 Aug 2017 10:48:35 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Aug 2017 10:48:22 -0700
Message-Id: <1502300913-40295-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: jurobystricky@hotmail.com
Subject: [PATCH v3 00/11] Reproducible binaries
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
X-List-Received-Date: Wed, 09 Aug 2017 17:49:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch-set contains basic changes needed in order to support building of
reproducible bianries. The set containes the following patches:

0001-reproducible_build.bbclass-initial-support-for-binar.patch
0002-image-prelink.bbclass-support-binary-reproducibility.patch
0003-rootfs-postcommands.bbclass-support-binary-reproduci.patch
0004-busybox.inc-improve-reproducibility.patch
0005-image.bbclass-support-binary-reproducibility.patch
0006-cpio-provide-cpio-replacement-native.patch
0007-image_types.bbclass-improve-cpio-image-reproducibili.patch
0008-python2.7-improve-reproducibility.patch
0009-python3-improve-reproducibility.patch
0010-kernel.bbclass-improve-reproducibility.patch
0011-poky-reproducible.conf-Initial-version.patch

Using this patch set while building core-image minimal (two clean builds, same
machine/OS, same date, two different folders, at two different times) I got the
following results:

Same:

core-image-minimal-initramfs-qemux86
bzImage-qemux86.bin
vmlinux.gz-qemux86.bin
(Some binaries i.e. ext4 differ, but the differnce is due to conversion to
.ext4)

Comparing Debian packages in tmp/deploy/deb:

Same:  4005
Different:  38
Total: 4043

(The remaining packages that still differ can be dealt with on an individual basis)


Although the patches contain commit messages explaining the purpose and implementation,
a somewhat more detailed description of selected patches seems prudent:

0001-reproducible_build.bbclass-initial-support-for-binar.patch
===============================================================

This patch creates a new class "reproducible_build.bbclass",
introducing two new variables:

BUILD_REPRODUCIBLE_BINARIES: "0" (default) business as usual, "1" turn on various pieces of
codes to improve reproducible builds

REPRODUCIBLE_TIMESTAMP_ROOTFS: only used if BUILD_REPRODUCIBLE_BINARIES="1".
Catch-all timestamp for various rootfs files, pre-linker, etc. If needed, timestamps can
be better granulated later on, right now we use a single value.

Having a new variable BUILD_REPRODUCIBLE_BINARIES serves two purposes:
1. Lets user decide (there are minor trade-offs)
2. Setting to "0" will guarantee to cause zero regressions.
3. Setting to "1" will force the the environment to contain SOURCE_DATE_EPOCH

BUILD_REPRODUCIBLE_BINARIES is globally exported, as this will initially force all kinds
of rebuilds. I know no simple way around this, though. This variable is needed in numerous
places: configuration, compilation, rootfs creation, packaging etc. 
REPRODUCIBLE_TIMESTAMP_ROOTFS does not need to be globally exported, it is exported locally
based on the need.
Once these variables are "official", various classes and recipes can be modified to conditionally
support binary reproducibility.

Setting SOURCE_DATE_EPOCH is essential for binary reproducibility.
We need to set a recipe specific SOURCE_DATE_EPOCH in each recipe environment for various tasks.
One way would be to modify all recipes one-by-one, but that is not realistic. So determining
SOURCE_DATE_EPOCH is done in this class automatically: After sources are unpacked (but
before they are patched), we try to determine the value for SOURCE_DATE_EPOCH.

There are 4 ways to determine SOURCE_DATE_EPOCH:
1. Use value from src-data-epoch.txt file if this file exists. This file was most likely created
  in the previous build by one of the following methods 2,3,4.
  (But it could be actually provided by a recipe via SRC_URI)

If the file does not exist:
2. Use .git last commit date timestamp (git does not allow checking out files and preserving their
   timestamps)
3. Use "known" files such as NEWS, CHANGLELOG, ...
4. Use the youngest file of the source tree.

Once the value of SOURCE_DATE_EPOCH is determined, it is stored in the recipe source tree in
a text file "src-date-epoch.txt'.

If this file is found by other recipe task, the value is placed in the SOURCE_DATE_EPOCH var in
the task environment. This is done in an anonymous python function, so SOURCE_DATE_EPOCH is
guaranteed to exist for all tasks. (If the file is not found SOURCE_DATE_EPOCH is set to 0)
This can optimized in the future, as some tasks (all tasks before fetch, tasks such as package QA,
rm_work, ...) do not need SOURCE_DATE_EPOCH in the environment.


0008-python2.7-improve-reproducibility.patch
0009-python3-improve-reproducibility.patch
============================================
These are back ports of existing patches. They ensure the compiled .pyc files
contain timestamp based on SOURCE_DATE_EPOCH (if defined in the environment).
(May not be needed in the future, my understanding is support for SOURCE_DATE_EPOCH is already
upstreamed in master)


0010-kernel.bbclass-improve-reproducibility.patch
=================================================

This patch contains several changes, was created by squashing several commits.
Several tweaks to improve reproducibility:

We want to set KBUILD_BUILD_TIMESTAMP to some reproducible value. Normally,
we would use the value for SOURCE_DATE_EPOCH. However, to accommodate local kernel sources,
these are not obtained the usual way via do_unpack and hHence we end up with
SOURCE_DATE_EPOCH set to 0. In this case we obtain the timestamp from top entry of GIT repo,
or (if there is no GIT repo) fallback to REPRODUCIBLE_TIMESTAMP_ROOTFS as the last resort.
    
Kernel and kernel modules contain hard coded paths referencing the host
build system. This is usually because the source code contains __FILE__
at some place. This prevents binary reproducibility. However, some compilers
allow remapping of the __FILE__ value. If we detect the compiler is capable
of doing this, we replace the source path $(S) part of __FILE__ by a string "/kernel-source".
This works very well for oe-embedded cross-compilers, but it is not guaranteed to work for
external toolchains. Hence, the check for the option being supported. Note that this
is done regardless of the value od BUILD_REPRODUCIBLE_BINARIES.

When compressing vmlinux.gz, use gzip "-n" option as recommended in all guidelines to achieve
binary reproducibility.


0011-poky-reproducible.conf-Initial-version.patch
=================================================
Support building of reproducible images by setting
DISTRO="poky-reproducible"

This is mostly for convenience so the user does not have to modify
local.conf.

Please note setting LDCONFIGDEPEND = ""
This prevents building of ldconfig cache, which (when built) breaks binary
reproducibility. 

Also, it should avoid reproducibility issue with etc/passwd, where for example
two different builds can lead to two different values i.e:

build 1:
distcc:x:993:65534::/dev/null:/bin/sh
pulse:x:994:1001::/var/run/pulse:/bin/false

build 2:
pulse:x:993:1001::/var/run/pulse:/bin/false
distcc:x:994:65534::/dev/null:/bin/sh



Juro Bystricky (11):
  reproducible_build.bbclass: initial support for binary reproducibility
  image-prelink.bbclass: support binary reproducibility
  rootfs-postcommands.bbclass: support binary reproducibility
  busybox.inc: improve reproducibility
  image.bbclass: support binary reproducibility
  cpio: provide cpio-replacement-native
  image_types.bbclass: improve cpio image reproducibility
  python2.7: improve reproducibility
  python3: improve reproducibility
  kernel.bbclass: improve reproducibility
  poky-reproducible.conf: Initial version

 meta-poky/conf/distro/include/reproducible-group   |  50 ++++++++++
 meta-poky/conf/distro/include/reproducible-passwd  |  25 +++++
 meta-poky/conf/distro/poky-reproducible.conf       |  38 ++++++++
 meta/classes/base.bbclass                          |   4 +
 meta/classes/image-prelink.bbclass                 |  12 ++-
 meta/classes/image.bbclass                         |  16 ++-
 meta/classes/image_types.bbclass                   |  14 ++-
 meta/classes/kernel.bbclass                        |  39 +++++++-
 meta/classes/reproducible_build.bbclass            | 108 +++++++++++++++++++++
 meta/classes/rootfs-postcommands.bbclass           |  27 +++++-
 meta/recipes-core/busybox/busybox.inc              |   7 ++
 .../python/python-native_2.7.13.bb                 |   1 +
 .../python/python/reproducible.patch               |  34 +++++++
 .../python/python3-native_3.5.3.bb                 |   1 +
 .../support_SOURCE_DATE_EPOCH_in_py_compile.patch  |  97 ++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.3.bb      |   1 +
 meta/recipes-devtools/python/python_2.7.13.bb      |   1 +
 meta/recipes-extended/cpio/cpio_v2.inc             |   2 +
 18 files changed, 467 insertions(+), 10 deletions(-)
 create mode 100644 meta-poky/conf/distro/include/reproducible-group
 create mode 100644 meta-poky/conf/distro/include/reproducible-passwd
 create mode 100644 meta-poky/conf/distro/poky-reproducible.conf
 create mode 100644 meta/classes/reproducible_build.bbclass
 create mode 100644 meta/recipes-devtools/python/python/reproducible.patch
 create mode 100644 meta/recipes-devtools/python/python3/support_SOURCE_DATE_EPOCH_in_py_compile.patch

-- 
2.7.4


