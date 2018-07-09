Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D082274FE7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2018 15:25:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w69FPetN016389
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 9 Jul 2018 08:25:41 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Mon, 9 Jul 2018 08:25:40 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 9 Jul 2018 11:25:32 -0400
Message-ID: <cover.1531149297.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7] kernel/kernel-yocto: conslidated pull request
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
X-List-Received-Date: Mon, 09 Jul 2018 15:25:41 -0000
Content-Type: text/plain

Hi all,

Here's the next consolidated kernel pull request. It has a mixture of some
legwork, version bumps, package re-works and a libc-headers patch I grabbed
from the mailing list.

  [PATCH 4/7] linux-yocto/4.12: bump to v4.12.25
  [PATCH 6/7] linux-yocto/4.12: update to v4.12.26
  
The version bumps are for the 4.12 kernel and are routine CVE/bug fix
updates. We'll continue doing these for a little while longer, but 4.12 will
cease getting SRCREV bumps in the next 6 months or so.

  [PATCH 5/7] linux-yocto-dev: bump to 4.18+

This series also bumps linux-yocto-dev to the 4.18 kernel. This is legwork
for the next "versioned" release kernel, which very well could be 4.18 or
4.19 if we stretch (it depends on timing and if 4.19 is tagged as LTS, etc).

Also note that I'll drop the 4.15 kernel in the next few weeks, and keep
4.14, 4.18+ for the fall release.

  [PATCH 1/7] linux-libc-headers: To fix build error when enable mutilib on aarch64 Big endian.

This multlib bug fix was cherry picked from the mailing list and didn't
cause any issues in my testing.

  [PATCH 2/7] linux-yocto: add qemuarm -tiny support

This is a legwork patch as there was some interest in extendy -tiny support
to qemuarm. This kernel still needs configuration work (and won't boot), but
without this patch, working on the configuration is more of a pain.

  [PATCH 3/7] linux-yocto: igb.cfg: change igb config from m to y

This is a configuration change sent by the Intel folks, and it hasn't caused
any issued here.

  [PATCH 7/7] kernel-devsrc: restructure for out of tree (and on target) module builds

This is the re-submission of the devsrc work that just missed the previous
release window. There are no (large) structural changes to the patch, and it
still meets the requirements of the bug, and also solves many of the issues
reported on the mailing list since it was first submitted.

There was one oustanding multlib issue with the original series, but I have
done that build:

  require conf/multilib.conf
  MULTILIBS = "multilib:lib64"
  DEFAULTTUNE_virtclass-multilib-lib64 = "x86-64"

For qemux86, and I can build kerneldevsrc without issues. If mulitlib blows
up again, send me the config and I'll look further.

Cheers,

Bruce

The following changes since commit 9b034e9a83a58077519ba57ced482662f973a467:

  bitbake: runqueue: Stop on first unsatisfied dependency (2018-07-09 11:26:56 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (6):
  linux-yocto: add qemuarm -tiny support
  linux-yocto: igb.cfg: change igb config from m to y
  linux-yocto/4.12: bump to v4.12.25
  linux-yocto-dev: bump to 4.18+
  linux-yocto/4.12: update to v4.12.26
  kernel-devsrc: restructure for out of tree (and on target) module
    builds

Lei Maohui (1):
  linux-libc-headers: To fix build error when enable mutilib on aarch64
    Big endian.

 .../linux-libc-headers/linux-libc-headers.inc      |   4 +
 meta/recipes-kernel/linux/kernel-devsrc.bb         | 201 ++++++++++++++++-----
 meta/recipes-kernel/linux/linux-yocto-dev.bb       |   4 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |   6 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |   4 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb   |   4 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |   4 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb |   7 +-
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      |  20 +-
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      |  18 +-
 meta/recipes-kernel/linux/linux-yocto_4.15.bb      |  18 +-
 12 files changed, 205 insertions(+), 91 deletions(-)

-- 
2.5.0


