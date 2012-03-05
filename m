Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1S4PFs-0007SO-D4
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Mar 2012 05:10:36 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2541bnd002549;
	Sun, 4 Mar 2012 20:01:37 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Sun,  4 Mar 2012 23:01:18 -0500
Message-Id: <cover.1330919584.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 0/3] linux-yocto: consolidated pull request
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Mar 2012 04:10:36 -0000

Richard/Saul,

Here's the latest consolidated kernel pull request. The patches are as follows:

3/3 is the kernel updates:

  - v3.0.23 stable update
  - v3.2.9 stable update
  - 3.0/3.2: fri2 updates (pch + configuration changes) from Darren Hart
  - 3.0: pvr merge from Kishore Bodke
  - linux-yocto/rt: update to 3.0.23-rt38
  - linux-yocto/rt: update to 3.2.9-rt15

These have been built for all qemu targets, and built for the appropriate
hardware platforms.

2/3 is the switch to use the 'bareclone' option that I had previously sent
to be added to bitbake. Using this, the management of the linux-yocto branches
in the build directory is much easier, and it removes the remaining restrictions
around bare vs non-bare clones.

1/3 is linux-yocto: respect FILESPATH directories. This came from debugging the
patching issues found with the linux-korg recipe. The solution (outside of
re-writing the entire routine to python .. which I will do shortly) was to add
a new routine that returns both the absolute patch source and the url's subdirectory.
Using this all patches in WORKDIR, regardless of where they are on FILESPATH can
be found. I tested linux-korg, and patching of all the kernels with this in place.

All three changes are isolated, so you can pick them up in any order that makes
sense.

Cheers,

Bruce

cc: Darren Hart <dvhart@linux.intel.com>
cc: Kishore Bodke <kishore.k.bodke@intel.com>

The following changes since commit a439d32dd843d10a9f65cc858b02422fac7deb50:

  soc-family.inc: to be included in machine.conf to add SOC_FAMILY to MACHINEOVERRIDE (2012-03-04 05:41:11 -0800)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-oe

Bruce Ashfield (3):
  linux-yocto: respect FILESPATH directories
  linux-yocto: use bareclone option
  linux-yocto: v3.2.9, v3.0.23 + fixes and updates

 meta/classes/kernel-yocto.bbclass                 |   30 ++++++++++++++++++---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb   |   12 ++++----
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb   |   13 ++++-----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb |   10 +++---
 meta/recipes-kernel/linux/linux-yocto_2.6.37.bb   |    4 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb      |   20 +++++++-------
 meta/recipes-kernel/linux/linux-yocto_3.2.bb      |   21 +++++++-------
 7 files changed, 65 insertions(+), 45 deletions(-)

-- 
1.7.4.1



