Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9DB4571BFC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 16:22:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w16GM1FC019749
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Feb 2018 08:22:01 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 6 Feb 2018 08:21:57 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 6 Feb 2018 11:21:51 -0500
Message-ID: <cover.1517931042.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/9] kernel-yocto: kernel updates/drops/refreshes
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
X-List-Received-Date: Tue, 06 Feb 2018 16:22:01 -0000
Content-Type: text/plain

Hi all,

Here is my first proposed set of kernel updates for the April release. Some
elements that I'd like to point out:

 - I've moved to a single/branch versioned linux-yocto repository that I first
   proposed in the 4.8 kernel cycle, no one objected, so I've moved v4.14 and
   v4.15 into that repository and adjusted the recipes to use it.

   Other than a few more branches to wade through, it won't change any workflows
   and will save download space for this update and for the future.

 - On that note, I'm moving master to v4.14 as the LTS/LTSI kernel, with
   v4.15 available as the "latest" kernel. I'm also keeping 4.12 around for a
   bit longer to move the reference BSPs to v4.14+.

   I'll send a second series for meta-yocto that updates the default versions to
   match the v4.14+ kernel revisions.

   Note: This doesn't mean that I'm no longer maintaining the other kernels for
         CVEs/stable updates, it just means that they won't get SRCREV bumps in
         master. Anything older than 4.14 is a big maintenance concern for
         fixes/security due to the recent CVEs, etc. It was a mistake to allow
         as many kernels to be active in master as there currently is, so taking
         both factors into account, I'm correcting to v4.14/v4.15 + yocto-dev
         for the release.

 - linux-libc-headers is updated to the latest kernel, and I've refreshed the
   mulsc patches as part of that update.

 - I uprev'd lttng to v2.10.5 to build against v4.15+

 - I've built qemu* core-image-sato/core-image-kernel-dev for both v4.14 and
   v4.15 and performed boot tests. I've also built poky-lsb for v4.14 and also
   done boot tests. I've also built mulsc based systems and done the same boot
   tests.

So I've done my best to cover all the possible build combinations, but it is
a rather large matrix, so I'll be watching this go through the autobuilders
and other tests (and failures).

Cheers,

Bruce

The following changes since commit 385944254d0ef88bd6450a221a54cbcb40020b42:

  tcmode-default.inc: drop preferred version of gzip-native (2018-01-31 17:01:20 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (9):
  linux-yocto: introduce 4.14 recipes
  linux-yocto: introduce 4.15 recipes
  linux-libc-headers: update to v4.15
  linux-yocto/4.12: pinctrl backports
  lttng-modules: update to v2.10.5 for kernel 4.15
  linux-yocto/4.10: drop recipe
  linux-yocto/4.4: drop recipe
  linux-yocto/4.9: drop recipe
  machines: bump default linux-yocto to v4.15

 meta/conf/distro/include/tcmode-default.inc        |  2 +-
 meta/conf/machine/include/x86-base.inc             |  2 +-
 meta/conf/machine/qemuarm.conf                     |  2 +-
 ...mpat.h-fix-some-issues-arising-from-in6.h.patch | 29 ++++++-------
 ...t.h-prevent-redefinition-of-struct-ethhdr.patch | 36 +++--------------
 ...aders_4.14.13.bb => linux-libc-headers_4.15.bb} |  4 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  4 +-
 ...nux-yocto-rt_4.10.bb => linux-yocto-rt_4.14.bb} | 12 +++---
 ...inux-yocto-rt_4.9.bb => linux-yocto-rt_4.15.bb} | 12 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    | 36 -----------------
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  4 +-
 ...yocto-tiny_4.10.bb => linux-yocto-tiny_4.14.bb} | 12 +++---
 ...x-yocto-tiny_4.9.bb => linux-yocto-tiny_4.15.b} |  8 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb | 47 ++++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  | 23 -----------
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 18 ++++-----
 .../{linux-yocto_4.10.bb => linux-yocto_4.14.bb}   | 46 ++++++++++-----------
 meta/recipes-kernel/linux/linux-yocto_4.15.bb      | 47 ++++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto_4.4.bb       | 42 -------------------
 meta/recipes-kernel/linux/linux-yocto_4.9.bb       | 44 --------------------
 ...g-modules_2.10.4.bb => lttng-modules_2.10.5.bb} |  4 +-
 21 files changed, 179 insertions(+), 255 deletions(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_4.14.13.bb => linux-libc-headers_4.15.bb} (71%)
 rename meta/recipes-kernel/linux/{linux-yocto-rt_4.10.bb => linux-yocto-rt_4.14.bb} (78%)
 rename meta/recipes-kernel/linux/{linux-yocto-rt_4.9.bb => linux-yocto-rt_4.15.bb} (78%)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
 rename meta/recipes-kernel/linux/{linux-yocto-tiny_4.10.bb => linux-yocto-tiny_4.14.bb} (54%)
 rename meta/recipes-kernel/linux/{linux-yocto-tiny_4.9.bb => linux-yocto-tiny_4.15.b} (71%)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
 rename meta/recipes-kernel/linux/{linux-yocto_4.10.bb => linux-yocto_4.14.bb} (40%)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_4.15.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_4.4.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_4.9.bb
 rename meta/recipes-kernel/lttng/{lttng-modules_2.10.4.bb => lttng-modules_2.10.5.bb} (90%)

-- 
2.5.0


