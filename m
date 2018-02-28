Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 48E5578873
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 02:06:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w1S26vNB022878
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 27 Feb 2018 18:06:57 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 27 Feb 2018 18:06:30 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 27 Feb 2018 21:06:53 -0500
Message-ID: <cover.1519783331.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] kernel: consolidated pull request
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
X-List-Received-Date: Wed, 28 Feb 2018 02:07:00 -0000
Content-Type: text/plain

Hi all,

I have some more -stable changes queued for the kernels, but didn't want
to sit on these any longer, in particulare the re-work of kernel-devsrc
to not suck up hundreds of megs, or hundreds of seconds of processing.

The 4.12 update is a feature addition, while 4.14/4.15 are yaffs2 warning
fixes.

The commit log for kernel-devsrc explains the changes:

-----------------------

    Subject: [PATCH 3/3] kernel-devsrc: restructure for out of tree (and on  target) module builds

    The existing kernel-devsrc package starts with a full copy of the kernel
    source and then starts to strip out elements that are not required.

    This results in extra time (I/O) and extra space being taken up in the
    final package. The main purpose of the kernel-devsrc package has been to
    build modules against the running kernel, not to include a full copy of
    the source code for re-building the kernel. The end result was a
    600M kernel-devsrc package.

    This restructuring of the package uses an approach similar to other
    distros, where the kernel-devsrc package is for building against the
    running kernel and uses a curated set of copied infrastructure, versus
    a mass copy of the entire kernel.

    The differences in this approach versus other is largely due to the
    architecture support and the split build/source directory of the
    kernel.

    The result is a kernel-devsrc package of about 10M, which is capable
    of running "make scripts" and compiling kernel modules against the
    running kernel.

    Along with the changes to the copying of the infrascture, we also
    have the following changes:

     - a better/more explicit listing of dependencies for on-target
       builds of "make scripts" or "make modules_prepare"

     - The kernel source is installed into /lib/modules/<version>/build
       and a symlink created from /usr/src/kernel to the new location.
       This aligns with the standard location for module support
       code

     - There is also a symlink from /lib/modules/<version>/source -> build
       to reserve a spot for a new package that is simply the kernel
       source. That package is not part of this update.

    [YOCTO #12535]

    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

-----------------------

Cheers,

Bruce

The following changes since commit 1b7a9d4f63d07d61d53daac12da275e8ef2feb24:

  buildhistory-diff: honour report_all flag (2018-02-24 10:35:59 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto/4.14/4.15: yaffs2 fixes
  linux-yocto/4.12: add stratix10 SoC development board
  kernel-devsrc: restructure for out of tree (and on target) module
    builds

 meta/recipes-kernel/linux/kernel-devsrc.bb         | 178 ++++++++++++++++-----
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |   2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |   4 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb   |   4 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |   2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |   4 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb |   4 +-
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      |  16 +-
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      |  18 +--
 meta/recipes-kernel/linux/linux-yocto_4.15.bb      |  18 +--
 10 files changed, 174 insertions(+), 76 deletions(-)

-- 
2.5.0


