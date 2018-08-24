Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2C63A750F9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 15:00:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7OF015n003234
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 24 Aug 2018 08:00:01 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Fri, 24 Aug 2018 08:00:00 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 24 Aug 2018 10:59:47 -0400
Message-ID: <cover.1535118570.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/12] kernel: consolidated pull request
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
X-List-Received-Date: Fri, 24 Aug 2018 15:00:01 -0000
Content-Type: text/plain

Hi all,

This series is a collection of fixes I've been carrying, as well as new
work for the upcoming release (in particular the 4.18 kernel work).

If there are isses with the 4.18 parts, everything else should be stand
alone enough for merging.

The breakdown of changes are:

 - stable updates:

     [linux-yocto/4.12: update to v4.12.28]
     [linux-yocto/4.14: update to v4.14.62]

 - config/bug fixes:

     [linux-yocto/4.14: rt: Revert mm/vmstat.c: fix vmstat_update() preemption BUG]
     [linux-yocto: add qemuarm64 preempt-rt BSP definition]
     [linux-yocto: add selftest and security configuration blocks]
     [linux-yocto/standard: enable bpf configs in standard kernel]

 - bsp audit/status cleanup:

     [classes/kernel-yocto: Cleanup getstatusoutput usage]
     [kernel-yocto: restore BSP audit visibility]

     When working with the getstatusoutput patch from Joshua Watt, I noticed that
     proper audit info hasn't been output for quite some time. I've fixed up the
     warnings that I see, but expect to see a few more in the various kernels as
     we iterate to clean them up.

 - 4.18 introduction

     [lttng: uprev to 2.10.7]
     [linux-yocto: introduce 4.18 recipes]
     [libc-headers: update to 4.18]
     [qemu/bsp: update 4.15 preferred versions to 4.18]

     This is the suggested/proposed kernel for the upcoming release. Once we get
     the hardware reference boards updated from 4.15 -> 4.18, I'll follow up with
     the removal of 4.12/4.15 and that will leave us 4.14/4.18 for the release.

     I have a patch I'll send to poky to make 4.18 the default kernel for qemu*
     there, while we work on those last updates.

     This block of changes also has an associated libc-headers update, as well
     as an uprev of lttng to build against the 4.18 kernel.

     I've built core-image-sato (booted, confirmed the desktop), core-image-kernel-dev
     for qemu*, for both glibc and muslc. No issues were observed in my testing.

     The -rt branches are also populated for this kernel version and boot tests
     have been performed there as well.

     I expect we'll need another revision of these patches, but they are ready
     for more coverage.

Cheers,

Bruce
    
The following changes since commit 00b360c75bfcdc7f2b51ebd07e294b9912de9ded:

  utils: Fix patch merging error (2018-08-23 17:58:59 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (11):
  linux-yocto/4.14: rt: Revert mm/vmstat.c: fix vmstat_update() preemption  BUG
  linux-yocto/standard: enable bpf configs in standard kernel
  kernel-yocto: restore BSP audit visibility
  linux-yocto: add qemuarm64 preempt-rt BSP definition
  linux-yocto/4.12: update to v4.12.28
  linux-yocto/4.14: update to v4.14.62
  linux-yocto: add selftest and security configuration blocks
  lttng: uprev to 2.10.7
  linux-yocto: introduce 4.18 recipes
  libc-headers: update to 4.18
  qemu/bsp: update 4.15 preferred versions to 4.18

Joshua Watt (1):
  classes/kernel-yocto: Cleanup getstatusoutput usage

 meta/classes/kernel-yocto.bbclass                  | 44 +++++++++++++++++---
 meta/conf/distro/include/tcmode-default.inc        |  2 +-
 meta/conf/machine/include/x86-base.inc             |  2 +-
 meta/conf/machine/qemuarm.conf                     |  2 +-
 .../kern-tools/kern-tools-native_git.bb            |  2 +-
 .../linux-libc-headers/linux-libc-headers.inc      |  4 +-
 ...eaders_4.15.7.bb => linux-libc-headers_4.18.bb} |  5 +--
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  6 +--
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |  6 +--
 meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb   | 43 +++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  6 +--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |  6 +--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb | 29 +++++++++++++
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 20 ++++-----
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 20 ++++-----
 meta/recipes-kernel/linux/linux-yocto_4.15.bb      |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.18.bb      | 48 ++++++++++++++++++++++
 ...g-modules_2.10.6.bb => lttng-modules_2.10.7.bb} |  6 +--
 20 files changed, 204 insertions(+), 53 deletions(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_4.15.7.bb => linux-libc-headers_4.18.bb} (75%)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_4.18.bb
 rename meta/recipes-kernel/lttng/{lttng-modules_2.10.6.bb => lttng-modules_2.10.7.bb} (85%)

-- 
2.5.0


