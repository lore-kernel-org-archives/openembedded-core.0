Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B94E57706A
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Apr 2016 00:09:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3209SS7023855
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 1 Apr 2016 17:09:28 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 1 Apr 2016 17:09:27 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 1 Apr 2016 20:09:18 -0400
Message-ID: <cover.1459555221.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/8] linux-yocto: consolidated pull request
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
X-List-Received-Date: Sat, 02 Apr 2016 00:09:29 -0000
Content-Type: text/plain

Richard,

Here's another set of 4.1 and 4.4 kernel updates. The majority are routine
backports, and have passed my sanity build and boot testing.

As part of this, I've also bumped linux-yocto-dev to v4.6-rc1. x86, mips
and powerpc are passing sanity. perf had an issue on powerpc, but that
is sorted out in the linux-yocto tree. qemuarm is has a boot issue, but
I'm pushing out the tree while we work on the issues, since it is the
best way to get more eyes on the problem.

There's also the revert of the x86 32bit PAT workaround, since with the
mainline set of 7 patches that were the result of the problem report ..
work as advertised and I was able to build and boot sato.

And finally, there's a minor tweak to the branch handling that fixes
something reported by Steve Sakoman when a specific branch is being
forced as the build branch. This always used to work, but in the
simplification of the routines when the SRCREV validation of the
fetcher came in .. I managed to drop it.

Cheers,

Bruce

The following changes since commit 7dcb4c41272e8f611eabea991fa30df79b9e48e3:

  bitbake: toaster: tests Migrate landing page tests to Selenium (2016-04-01 07:14:59 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (8):
  linux-yocto/4.1: telemetry and dmaengine backports
  linux-yocto/4.4: gpio-pca953x: add PCAL9535 interrupt support
  linux-yocto/4.1: ahci: backport AHCI runtime PM
  linux-yocto-dev: bump to v4.6-rcX
  Revert "linux-yocto: Work around PAT issue on qemux86"
  linux-yocto/4.4: fix PAT for 32bit x86
  linux-yocto/4.4: UVC: Add support for R200 depth camera
  kernel-yocto: enforce SRC_URI specified branch

 meta/classes/kernel-yocto.bbclass                  |  11 +++
 meta/recipes-kernel/linux/linux-yocto-dev.bb       |   2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    |   2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    |   2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb  |   2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  |   2 +-
 .../linux-yocto/0001-Fix-qemux86-pat-issue.patch   | 100 ---------------------
 meta/recipes-kernel/linux/linux-yocto_4.1.bb       |  16 ++--
 meta/recipes-kernel/linux/linux-yocto_4.4.bb       |  18 ++--
 9 files changed, 32 insertions(+), 123 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto/0001-Fix-qemux86-pat-issue.patch

-- 
2.5.0


