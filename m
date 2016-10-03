Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 86EE371993
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 05:54:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u935sbrM006004
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 2 Oct 2016 22:54:37 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Sun, 2 Oct 2016 22:54:36 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 3 Oct 2016 01:54:29 -0400
Message-ID: <cover.1475473494.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7] linux-yocto: consolidated (and hopefully final) pull request
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
X-List-Received-Date: Mon, 03 Oct 2016 05:54:37 -0000
Content-Type: text/plain

Hi all,

Linus released 4.8 a few hours ago, so I triggered my final round of updates.
Along with the bump to 4.8-final, I've also included pending -stable updates
to 4.1 and 4.4.

We also have a fix for one -rt issue from Paul Gortmaker and hence a minor
update to the preempt-rt branches.

There are also some standard/base cleanups from Cal, as well as some mmc
configuration changes.

The big thing to note about this update .. is that the libc-headers bump
to the 4.8 final tarball picked up some uapi headers that broke the build
of ppp. I never would have thought it was possible, but it happened.

After hunting for a few hours, I found the offending kernel commits, and
have patched them back out of libc-headers. I didn't check this patch
against muslc .. there's only so much I can do. If someone can come up
with a better fix, that's great, I kept the patch i did separate from
the updated libc-headers to make it easy to drop.

I've built and booted core-image for standard and -rt on all arches, I've
built core-image-kernel-dev (which showed me the ppp error), and I've
built lttng*.

That's all that I could possible do in a few hours .. it is 2am, and
that's enough for one night.

Note: I'm sending this now, since I'm packing up and heading on vacation
      Monday afternoon. I'll be around most evenings (eastern to pick up
      any fixes), but I wanted to get this out, and onto the autobuilder
      ASAP ..and more eyes to pick up issues would be great.

Cheers,

Bruce


The following changes since commit 3a73fe0efcb7aeefcca7011bba887caad03d4d03:

  beaglebone.conf: produce wic images for Beaglebone (2016-10-01 21:45:57 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (7):
  linux-yocto/4.8: mmc configuration for x86*
  linux-yocto/4.1: update to 4.1.33
  linux-yocto/4.4: update to v4.4.22
  linux-yocto/4.1/4.4: remove innappropriate standard/base patches
  linux-libc-headers: update to 4.8 final
  linux-yocto/4.8: update to 4.8 -final release
  linux-libc-headers: fix in/if.h includes

 .../0001-ppp-fix-in-if.h-includes.patch            | 83 ++++++++++++++++++++++
 .../linux-libc-headers/linux-libc-headers_4.8.bb   | 11 +--
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    |  6 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    |  6 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb    |  6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb  |  6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  |  6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb  |  6 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb       | 20 +++---
 meta/recipes-kernel/linux/linux-yocto_4.4.bb       | 20 +++---
 meta/recipes-kernel/linux/linux-yocto_4.8.bb       | 20 +++---
 11 files changed, 138 insertions(+), 52 deletions(-)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-ppp-fix-in-if.h-includes.patch

-- 
2.5.0


