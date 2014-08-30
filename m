Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CF05F71223
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Aug 2014 04:38:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7U4cP4F013724
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 29 Aug 2014 21:38:26 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 29 Aug 2014 21:38:25 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sat, 30 Aug 2014 00:38:03 -0400
Message-ID: <cover.1409345003.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/18] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Sat, 30 Aug 2014 04:38:30 -0000
Content-Type: text/plain

Richard/Saul,

Here's the pending queue of kernel changes for the 1.7 feature freeze.
The queue is large, but I've actually been building and running with 
most of these changes for 6 months now, so they've been soaked for
quite a while.

This block of changes is largely about removing some of the old code,
the corner cases, and removing checks that are now handled by the
fetcher (awesome!). They are incremental cleanups, and nothing significant
changes .. in fact, I'm probably the only one that really even cares 
about the changes (since I have more features to do on top of them):

  kernel-yocto: use cat-file instead of git-show
  kernel-yocto: move SRCREV validation to patching phase
  kernel-yocto: remove containing branch check
  kernel-yocto: remove SRC_URI kbranch validation
  kernel-yocto: remove branch existence checking in do_validate_branches
  kernel-yocto: remove KBRANCH_DEFAULT
  kernel-yocto: simplify branch SRCREV validation
  kernel-yocto: use show-ref instead of branch -a
  kernel-yocto: clean overly complex branch checkout
  kernel-yocto: allow custom non-meta, SRCREV format builds
  kernel-yocto: remove KBRANCH_DEFAULT
  kernel-yocto: convert echo statements to bb* equivalents
  kern-tools: allow meta branch and meta data directory to differ

The next change is:

  images: introduce core-image-kernel-dev

  This is the image type that I've been using for the same 6 month window
  to build and boot test kernel updates. There's nothing really new here, 
  but it is a named image type that selects existing package groups and
  puts them all in one place. After it built for all arches and 3.16 .. we
  had no failures.

  There are moer packages to add to this, but that's post 1.7 work.

And finally, libc-headers, kernel version updates and removals:

  linux-yocto/3.14: vhost, vxland, openvswitch and block/bfq updates
  linux-yocto/3.14: update to v3.14.17
  linux-yocto/3.4: remove 3.4 name recipes
  linux-libc-headers: update to 3.16

  With those changes, we have an up to date 3.14, have dropped the 3.4
  kernel and have updated the libc-headers. The kernel-dev image was
  built to test everything out.

That's the breakdown of the changes, and I can tweak as necessary. With
that size a queue, I'm sure something will go boom, so I'm around to adjust
as required.

Cheers,

Bruce

The following changes since commit 37d7b218e9faef6093caedd67875c2d72b8111e2:

  kernel-yocto: remove redundant SRCREV check (2014-08-29 16:32:23 -0400)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (18):
  kernel-yocto: use cat-file instead of git-show
  kernel-yocto: move SRCREV validation to patching phase
  kernel-yocto: remove containing branch check
  kernel-yocto: remove SRC_URI kbranch validation
  kernel-yocto: remove branch existence checking in do_validate_branches
  kernel-yocto: remove KBRANCH_DEFAULT
  kernel-yocto: simplify branch SRCREV validation
  kernel-yocto: use show-ref instead of branch -a
  kernel-yocto: clean overly complex branch checkout
  kernel-yocto: allow custom non-meta, SRCREV format builds
  kernel-yocto: remove KBRANCH_DEFAULT
  kernel-yocto: convert echo statements to bb* equivalents
  kern-tools: allow meta branch and meta data directory to differ
  images: introduce core-image-kernel-dev
  linux-yocto/3.14: vhost, vxland, openvswitch and block/bfq updates
  linux-yocto/3.14: update to v3.14.17
  linux-yocto/3.4: remove 3.4 name recipes
  linux-libc-headers: update to 3.16

 meta/classes/kernel-yocto.bbclass                  | 201 ++++++++-------------
 meta/conf/distro/include/tcmode-default.inc        |   2 +-
 .../images/core-image-kernel-dev.bb                |  16 ++
 .../kern-tools/kern-tools-native_git.bb            |   2 +-
 .../linux-libc-headers/linux-libc-headers_3.14.bb  |   7 -
 .../linux-libc-headers/linux-libc-headers_3.16.bb  |   7 +
 meta/recipes-kernel/linux/linux-yocto-dev.bb       |   1 -
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |   4 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  12 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |  30 ---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |   3 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |   8 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb  |  26 ---
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      |  15 +-
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      |  34 ++--
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       |  38 ----
 16 files changed, 140 insertions(+), 266 deletions(-)
 create mode 100644 meta/recipes-extended/images/core-image-kernel-dev.bb
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.14.bb
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.16.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_3.4.bb

-- 
1.8.1.2


