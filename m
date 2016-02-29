Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id ED1E76FFCE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 22:10:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u1TMAUfd025654
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 29 Feb 2016 14:10:30 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 29 Feb 2016 14:10:29 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 29 Feb 2016 17:10:20 -0500
Message-ID: <cover.1456782981.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, california.l.sullivan@intel.com,
	saul.wold@intel.com
Subject: [v2 PATCH 0/8] linux-yocto: consolidated pull request
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
X-List-Received-Date: Mon, 29 Feb 2016 22:10:33 -0000
Content-Type: text/plain

Hi all,

v2: actually cc oe-core on the series.

Here is the consolidated pull request for linux-yocto 4.1 and 4.4. Most of the
changes are updates to -stable for the kernels, and the others are updates for
specific boards.

I've been building and booting these for qemu*, but of course, more mileage and
combinations in the autobuilder is best.

Some things to note:

 - We have some refactored kernel configuration updates to the base/core policy
   of the standard kernel, with a new "developer" kernel type being available,
   leaving standard as a smaller variant. Existing board configs have been
   flipped to use developer, so they'll see no change, leaving new board configs
   to take advantage of the smaller, standard kernel type.

 - The yocto reference BSPs haven't been updated yet, and we need to find
   someone with the h/w to do the updates. These may just have to stay on
   4.1 LTSI for this cycle.

 - We are still seeing the 32 bit x86 X issue on the 4.4 kernel , with a splat on
   boot up. I've tried to bisect this twice, leading to inconclusive results, but
   regardless, I need to march 4.4 onto the latest -stable, and we'll continue
   looking into this issue in the M4 timeframe.

 - There still seem to be some races in perf, and something is up with sstate
   and the kexec/kboot builds using meta-initramfs and linux-yocto-tiny-kexecboot.
   Now that these updates are out, I'll revisit them and hold any stable updates
   (unless there are significant CVEs) in the M4 cycle.

Cheers,

Bruce

The following changes since commit 4006a7f2762ccd5dcbc6cdff49482d4387a73261:

  sanity: Fix int verses string reference (2016-02-28 22:54:09 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (8):
  linux-yocto/4.1: Galileo updates
  linux-yocto/4.1: clkdev updates
  linux-yocto/4.1: update to 4.1.18
  linux-yocto/4.4: yaffs2 build fixes
  linux-yocto: braswell: Remove feature and move DRM_I915_PRELIMINARY_HW_SUPPORT option
  linux-yocto/4.4: update to -stable 4.4.2
  linux-yocto/4.1: iwlwifi: mvm: don't allow sched scans without matches to be started
  linux-yocto/4.4: update to 4.4.3

 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 20 ++++++++++----------
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 20 ++++++++++----------
 6 files changed, 32 insertions(+), 32 deletions(-)

-- 
2.5.0


