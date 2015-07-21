Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6BEDE73694
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jul 2015 15:21:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6LFL87S010233
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Jul 2015 08:21:08 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Tue, 21 Jul 2015 08:21:02 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 21 Jul 2015 11:21:03 -0400
Message-ID: <cover.1437491325.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] linux-yocto: build changes, 4.1 and libc-headers
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
X-List-Received-Date: Tue, 21 Jul 2015 15:21:11 -0000
Content-Type: text/plain

Hi all,

This series absolutely needs some more testing and runs through the
autobuilder, but I've done pretty much all I can do with it here.

I have more changes to the build process that will follow this, but 
these changes need to show that they are stable, so here's the first
blast.

With this series:

  - I create the 4.1, and 4.1-rt linux-yocto content. This will be
    the new LTSI kernel. Deletion of 3.14 and 3.19 will follow once
    all machines have been moved forward.

  - libc-headers updated to match the 4.1 kernel version.

And the one that could cause some issues/compatibility issues is the
split of the kernel configuration data from the kernel tree itself.

From the commit log:

  The linux-yocto tree has always been a combined set of kernel changes
  and configuration (meta) data carried in a single tree. While this
  format is effective at keeping kernel configuration and source
  modifications synchronized, it isn't always obvious to developers on
  how to manipulate the meta data versus the source.

  With this change, we remove the meta data processing from the
  kernel-yocto class and use the external meta-data repository that
  has always been used to seed the linux-yocto meta branch.

  After this change, linux-yocto can no longer process combined trees,
  and is simplified as a result.

I'm interested to find out if we get any breakages or severe compability
issues with the change. I don't want to support both variants of the
meta data (in and out of tree), since the goal is to reduce complexity
in the code. Once this change lands, I'll further streamline things.

I've built core-image-kernel-dev and boot tested the qemu* machines.
qemuppc continues to show a boot failure with systemd, but we have a
bugzilla to track that.

I'm now doing graphical testing, but wanted to get this out and soaking
for other images types while I wait for builds to churn.

Cheers,

Bruce

The following changes since commit 0f8d89ce66cfffccc9911d6c61470a585173b79d:

  core-image-lsb-sdk: use kernel-devsrc to ensure kernel module builds work (2015-07-20 10:40:42 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto: split meta data from kernel repository
  kern-tools: standalone tree configuration
  linux-libc-headers: update to 4.1
  linux-yocto: introduce 4.1 versioned recipes

 meta/classes/kernel-yocto.bbclass                  | 76 ++--------------------
 meta/conf/distro/include/tcmode-default.inc        |  2 +-
 .../kern-tools/kern-tools-native_git.bb            |  2 +-
 .../linux-libc-headers/linux-libc-headers.inc      |  2 +
 .../linux-libc-headers/linux-libc-headers_3.19.bb  |  7 --
 .../linux-libc-headers/linux-libc-headers_4.1.bb   |  7 ++
 meta/recipes-kernel/linux/linux-yocto-dev.bb       |  5 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  7 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    | 26 ++++++++
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  7 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb |  7 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb  | 23 +++++++
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      |  7 +-
 meta/recipes-kernel/linux/linux-yocto_3.19.bb      |  7 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb       | 41 ++++++++++++
 15 files changed, 129 insertions(+), 97 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.19.bb
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.1.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_4.1.bb

-- 
2.1.0


