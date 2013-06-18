Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E977E6041F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 15:20:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5IFK5Ye013355
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Jun 2013 08:20:05 -0700 (PDT)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.130.143) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 18 Jun 2013 08:20:03 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 18 Jun 2013 11:20:00 -0400
Message-ID: <cover.1371567827.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1]
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
X-List-Received-Date: Tue, 18 Jun 2013 15:20:05 -0000
Content-Type: text/plain

Richard/Saul,

Here's the integration of a change from Khem to fix the gcc 4.8 ARM
boot issues.

I'm still seeing some quasi random issues, but this definitely fixes
the issue at hand, gets us up and running and is much better than 
what we had before.

The patch pretty much says everything else:

linux-yocto/3.8: fix gcc 4.8 ARM boot issues

Updating the linux-yocto-3.8 SRCREVs to fix a boot issue with ARM boards
when gcc 4.8 is used.

Without the following mainline backports:

  f200475 ARM: 7670/1: fix the memset fix
  8215b0e ARM: 7668/1: fix memset-related crashes caused by recent GCC (4.7.2) optimizations

The following trap will be seen on boot:

    [<c00fc3b8>] (kmem_cache_alloc_trace+0x54/0x210) from [<c039f074>] (con_insert_unipair+0xcc/0x11c)
    [<c039f074>] (con_insert_unipair+0xcc/0x11c) from [<c039fec8>] (con_set_default_unimap+0xfc/0x198)
    [<c039fec8>] (con_set_default_unimap+0xfc/0x198) from [<c07ee258>] (console_map_init+0x44/0x58)
    [<c07ee258>] (console_map_init+0x44/0x58) from [<c07ee738>] (vty_init+0x16c/0x1b0)
    [<c07ee738>] (vty_init+0x16c/0x1b0) from [<c07edb68>] (tty_init+0x108/0x148)
    [<c07edb68>] (tty_init+0x108/0x148) from [<c07eead0>] (chr_dev_init+0xb4/0xd8)
    [<c07eead0>] (chr_dev_init+0xb4/0xd8) from [<c0008a18>] (do_one_initcall+0x11c/0x18c)
    [<c0008a18>] (do_one_initcall+0x11c/0x18c) from [<c07d89d0>] (kernel_init_freeable+0x16c/0x254)
    [<c07d89d0>] (kernel_init_freeable+0x16c/0x254) from [<c05a3810>] (kernel_init+0x18/0x160)
    [<c05a3810>] (kernel_init+0x18/0x160) from [<c000e530>] (ret_from_fork+0x14/0x20)
    Code: e593a000 e35a0000 0a000020 e5943014 (e79a1003)
    ---[ end trace e6c62de166779f86 ]---
    Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b

Moderate stress and board testing shows the fix to hold, and it is good for
broader testing.

[YOCTO #4549]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Cheers,

Bruce

The following changes since commit 1dd643b142c69ac9035e29bff11d02201638dc65:

  licences: Add SGI license (2013-06-17 16:45:37 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-yocto/3.8: fix gcc 4.8 ARM boot issues

 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb   |    6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb |    4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.8.bb      |   14 +++++++-------
 3 files changed, 12 insertions(+), 12 deletions(-)

-- 
1.7.10.4


