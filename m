Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QjwvK-0002zI-1s
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 19:20:34 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-146-217.ottawa.windriver.com [128.224.146.217])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6LHGDp6016866;
	Thu, 21 Jul 2011 10:16:14 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 21 Jul 2011 13:16:04 -0400
Message-Id: <cover.1311267679.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 0/4] kernel: consolidated pull request
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
X-List-Received-Date: Thu, 21 Jul 2011 17:20:34 -0000

Richard/Saul,

What follows is a set of kernel changes that have been brewing for a while
now:

  294170 kern-tools: update SRCREV
  65d8b50 linux-yocto: update LICENSE to GPLv2
  069e9d9 kernel: copy defconfig to {B} vs {S}
  6796e11 linux-yocto: kernel-3.0 support recipe

The patches are pretty self explanitory, but a few comments follow. 

The kern-tools tweak Fixes [YOCTO #1261], which allows both the 2.6.34
and 3.0 based -rt kernels to build again. 

The next two changes are small cleanups and a allow linux-yocto to inherit
changes to the base kernel class' do_configure().

And finally, we create the 3.0 base recipe. A few notes about this are:

  - it is a carry forward of the immediately available 2.6.37 (and before)
    functionality
  - it has an audit and cleanup of the config fragments, which was one
    of the 1.1 deliverables
  - it has been built for all core arches, and (attempted) boot tested on 
    them as well.
  - it is not the default for any target at the moment, this needs more
    testing, and there are two known issues I'm tracking a qemumips boot
    failure that snuck in during the 3.0 -rc cycle (it did boot) and 
    qemuppc interrupts being lost. I'll update the preferred versions as
    targets are validated.
  - I've built and booted the core-images on them, but functionality like
    graphics, etc, still needs to be tested. There's only so much I 
    can do :)
  - the -rt branch is populated with tglx's recent update of -rt!
  - separate patches will go out for other layers (meta-kernel-dev, meta-rt,
    meta-yocto, etc) shortly.

** This obviously builds on the other hard work done to get userspace and
tools ready for the 3.0 kernel version change. Many thanks for that, since
it allowed me to focus on the kernel only.

Patches are welcome for any misbehaving boards or qemu targets :

cc: Darren Hart <dvhart@linux.intel.com>
cc: Tom Zanussi <tom.zanussi@intel.com>

The following changes since commit 1df5ab5ee285b3220348ce0cf371b81446d55832:

  parse/ConfHandler: Fix multiline variable corruption (2011-07-21 11:09:47 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto: kernel-3.0 support recipe
  kernel: copy defconfig to {B} vs {S}
  linux-yocto: update LICENSE to GPLv2
  kern-tools: update SRCREV

 meta/classes/kernel-yocto.bbclass                  |    6 ---
 meta/classes/kernel.bbclass                        |    4 +-
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 meta/recipes-kernel/linux/linux-yocto.inc          |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |   47 ++++++++++++++++++++
 5 files changed, 51 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_3.0.bb

-- 
1.7.4.1



