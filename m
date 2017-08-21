Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D03EC78244
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 02:58:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7L2wNQY017244
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 20 Aug 2017 19:58:23 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Sun, 20 Aug 2017 19:58:22 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 20 Aug 2017 22:58:13 -0400
Message-ID: <cover.1503283308.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/9] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Mon, 21 Aug 2017 02:58:23 -0000
Content-Type: text/plain

Hi all,

Here's the collected set of kernel changes that are ready for the M3 builds.

We have some kernel meta data changes:

  kernel-yocto: configuration updates: x86 features
  linux-yocto/4.1: fix fsl-ls10xx sdhci
  linux-yocto: add usb-net configs by default

Some bug fixes:

  kernel-yocto: ensure that only valid BSPs are built
  linux-yocto/4.10: CVE & misc fixes

And the important changes are the addition of the 4.12 kernel + libc headers
and the removal of the 4.1 kernel.

I also have some -stable updates queued for the active kernel versions, but
they will come out once this series has made it into the tree, since I'm
trying to isolate any 4.12 issues from other -stable updates.

I built and booted all the qemu targets for 4.12, and have built for
core-image-sato, core-image-kernel-dev, glibc and muslc for all of the
architectures. My testing didn't pick up any regressions, but I was battling
some other build errors (non kernel related) during my testing, so I can
never be 100% sure.

I've sent patches to poky to remove/bump any references to the 4.1 kernel
.. if I've missed any, I'm sure people will shout.

Cheers,

Bruce


The following changes since commit 04dc76713b57f28457742dd863caa663591d4866:

  devtool/copy_buildsystem: adds meta-skeleton layer in the eSDK installation. (2017-08-19 22:15:39 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (9):
  kernel-yocto: configuration updates: x86 features
  linux-yocto/4.1: fix fsl-ls10xx sdhci
  linux-yocto: add usb-net configs by default
  linux-yocto: introduce 4.12 recipes
  linux-yocto: remove 4.1 recipes
  libc-headers: update to 4.12
  qemu: bump default version to 4.12
  kernel-yocto: ensure that only valid BSPs are built
  linux-yocto/4.10: CVE & misc fixes

 meta/classes/kernel-yocto.bbclass                  |  3 +++
 meta/conf/distro/include/tcmode-default.inc        |  2 +-
 meta/conf/machine/include/x86-base.inc             |  2 +-
 meta/conf/machine/qemuarm.conf                     |  2 +-
 .../kern-tools/kern-tools-native_git.bb            |  2 +-
 ...-headers_4.10.bb => linux-libc-headers_4.12.bb} |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb   |  4 ++--
 ...inux-yocto-rt_4.1.bb => linux-yocto-rt_4.12.bb} | 12 +++++-----
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb    |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb |  4 ++--
 ...-yocto-tiny_4.1.bb => linux-yocto-tiny_4.12.bb} | 12 +++++-----
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb  |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.10.bb      | 18 +++++++--------
 .../{linux-yocto_4.1.bb => linux-yocto_4.12.bb}    | 26 ++++++++++++----------
 meta/recipes-kernel/linux/linux-yocto_4.4.bb       |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.9.bb       |  2 +-
 18 files changed, 56 insertions(+), 47 deletions(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_4.10.bb => linux-libc-headers_4.12.bb} (71%)
 rename meta/recipes-kernel/linux/{linux-yocto-rt_4.1.bb => linux-yocto-rt_4.12.bb} (76%)
 rename meta/recipes-kernel/linux/{linux-yocto-tiny_4.1.bb => linux-yocto-tiny_4.12.bb} (52%)
 rename meta/recipes-kernel/linux/{linux-yocto_4.1.bb => linux-yocto_4.12.bb} (56%)

-- 
2.5.0


