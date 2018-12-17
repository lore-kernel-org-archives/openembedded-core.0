Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C5BB57BDA6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 03:38:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wBH3cVfu021269
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 16 Dec 2018 19:38:31 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sun, 16 Dec 2018 19:38:30 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 16 Dec 2018 22:38:12 -0500
Message-ID: <cover.1545017774.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/17] linux-yocto: consolidated pull request
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
X-List-Received-Date: Mon, 17 Dec 2018 03:38:34 -0000
Content-Type: text/plain

Hi all,

Here is the latest linux-yocto consolidated pull request. Some of these commits
are re-sends of changes that didn't make the release, and others are new.

Most are routine -stable bumps, configuration cleanups, etc, and shouldn't cause
any issues.

The more interesting part of this queue is the introduction of 4.19 reference
kernels to replace 4.14 as the LTS version in master. I've built and booted it
on qemu*, so it is sane from that point of view.

I'm trying to separate out the kernel bumps into distict pull requests so I
can deal with one set of issues at a time:

 - I'm not removing 4.18 yet, since it will be replaced by 4.20+ as the "latest"
   kernel in the next release. Plus our h/w reference BSPs need to be updated
   before I can drop it.
   
 - I'm not bumping libc-headers in this pull, I'll do that in my next queue, and
   we'll jump to 4.20 for the libc-headers at that time. There will be one more
   bump to match the 'latest' reference kernel for the release.

I will also follow up to the appropriate list with a bump to the poky-lsb distro
builds that are using 4.14 as their default kernel version.

I'm not convinced this is issue free (i.e. did I miss some reference to a 4.14
kernel ??), but some people have been asking about 4.19 support, so I wanted to
get this queue out, and start dealing with any issues it brings.

Cheers,

Bruce

The following changes since commit d47e89f338992b626d052b9c7e24d9ea9076b689:

  mdadm: Drop redundant patches and fix build with clang (2018-12-09 11:08:11 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (17):
  linux-yocto: remove obselete options from lxc config
  linux-yocto/4.14: configuration cleanups
  linux-yocto/4.18: -rt sync and config cleanups
  linux-yocto/tiny: switch default branch to standard/tiny/base
  linux-yocto/tiny: restore qemuarm support
  linux-yocto/4.18: bug fixes and configuration tweaks
  linux-yocto/4.18: update to v4.18.17
  linux-yocto/4.14: update to v4.14.79
  linux-yocto/4.18: integrate CVE fixes
  linux-yocto/4.18: update to v4.18.20
  linux-yocto: introduce 4.19 recipes
  linux-yocto/4.19: configuration cleanups
  linux-yocto: drop 4.14 recipes
  linux-yocto/4.19: update to v4.19.8
  linux-yocto/4.18: update to v4.18.21
  kern-tools: tools/kconf_check: modify grep pattern
  linux-yocto: configuration updates (virtio and tpm)

 .../kern-tools/kern-tools-native_git.bb            |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb   |  6 ++--
 ...nux-yocto-rt_4.14.bb => linux-yocto-rt_4.19.bb} | 14 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb | 13 ++++---
 ...yocto-tiny_4.14.bb => linux-yocto-tiny_4.19.bb} | 16 +++++----
 meta/recipes-kernel/linux/linux-yocto_4.18.bb      | 20 +++++------
 .../{linux-yocto_4.14.bb => linux-yocto_4.19.bb}   | 41 +++++++++++-----------
 7 files changed, 61 insertions(+), 51 deletions(-)
 rename meta/recipes-kernel/linux/{linux-yocto-rt_4.14.bb => linux-yocto-rt_4.19.bb} (77%)
 rename meta/recipes-kernel/linux/{linux-yocto-tiny_4.14.bb => linux-yocto-tiny_4.19.bb} (53%)
 rename meta/recipes-kernel/linux/{linux-yocto_4.14.bb => linux-yocto_4.19.bb} (46%)

-- 
2.5.0


