Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D16B071F1B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 18:38:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1KIc49g006307
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 20 Feb 2015 10:38:04 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 20 Feb 2015 10:38:04 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 20 Feb 2015 13:37:58 -0500
Message-ID: <cover.1424456540.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] linux-yocto: consolidated pull request (3.19 + config visibility)
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
X-List-Received-Date: Fri, 20 Feb 2015 18:38:08 -0000
Content-Type: text/plain

Richard/Saul,

Here is the latest version of the 3.19 kernel update for the 1.8 release.
This has been soaking in linux-yocto-dev, has had my local tests 
(core-image-kernel-dev, core-image-sato) and has had a run through the
AB.

I've bumped the libc-headers version to match.

So our coverage is good .. but as usual, I'm sure some things will manage
to bubble up. We have one known dmesg issue with qemumips, and that will
be fixed as a bug.

I'll be sending patches in subsequent series for some other layers that have
bbappends that need to be updated with the kernel version changes.

The other part of this series are two configuration visibility changes that
will highlight if an auto generated kernel board description is used, or
if specific options are dropped from the final .config. Those changes
involve python changes .. and I'm not the world's best python hacker, but
it is functional :) These address two bugzilla entries: YOCTO: #3383, YOCTO: #6943.

Cheers,

Bruce


The following changes since commit 5db6a27f4847e51c6434a968f81d3ceffcc54952:

  bitbake: toaster: importlayer Remove description input field (2015-02-20 12:58:20 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (5):
  linux-libc-headers: update to 3.19
  linux-yocto: make kernel configuration audit user visible
  linux-yocto: remove 3.10 and 3.17 recipes
  linux-yocto: introduce 3.19 versioned recipes
  linux-yocto: warn when a generated BSP description is used

 meta/classes/kernel-yocto.bbclass                  | 33 +++++++++++++++----
 meta/conf/distro/include/tcmode-default.inc        |  2 +-
 .../kern-tools/kern-tools-native_git.bb            |  2 +-
 .../linux-libc-headers_3.17.7.bb                   |  7 ----
 .../linux-libc-headers/linux-libc-headers_3.19.bb  |  7 ++++
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   | 27 ----------------
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb | 22 -------------
 ...yocto-tiny_3.17.bb => linux-yocto-tiny_3.19.bb} |  8 ++---
 meta/recipes-kernel/linux/linux-yocto.inc          |  6 ++++
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 37 ----------------------
 .../{linux-yocto_3.17.bb => linux-yocto_3.19.bb}   | 26 +++++++--------
 11 files changed, 58 insertions(+), 119 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.17.7.bb
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.19.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
 rename meta/recipes-kernel/linux/{linux-yocto-tiny_3.17.bb => linux-yocto-tiny_3.19.bb} (60%)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_3.10.bb
 rename meta/recipes-kernel/linux/{linux-yocto_3.17.bb => linux-yocto_3.19.bb} (58%)

-- 
2.1.0


