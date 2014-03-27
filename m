Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C41AD6F877
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 18:25:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2RIPCLK026212
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Mar 2014 11:25:12 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 27 Mar 2014 11:25:11 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 27 Mar 2014 14:24:55 -0400
Message-ID: <cover.1395944068.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 00/13] linux-yocto: 3.4, 3.8, 3.10 AND 3.14 updates
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
X-List-Received-Date: Thu, 27 Mar 2014 18:25:16 -0000
Content-Type: text/plain

Richard/Saul,

Here are the udpates to the various kernels that have been soaked and
tested long enough to head into the main trees.

3.4:
  - minor configuration updates for the monhonpeak

3.10:
  - BSP configuration updates
  - korg stable integrations
  - build fixes

3.8:
  - removal

3.14:
  - versioned 3.14 recipes
  - libc-headers update to 3.14, removal of old libc-headers recipes

The obvious changes to take note of are introduction of the 3.14 versioned
recipes, and libc-headers. Since Linus decided to do a -rc8, we decided to
not wait for the full release to put out the 3.14 versioned recipes and
libc-headers updates.

In particular with the 3.14 libc-headers, I've made it look like the 3.14
release headers with the recipe name, but within the recipe I have some
forcing to 3.14-rc8. When the release tarball is availble, I'll follow up
with changes to the recipe itself.

This is the same tree that has been soaking via linux-yocto-dev, with an
update to -rc8. Build and boot testing has been completed on all targets,
as has the building of packages known to be sensitive to kernel version
changes (core-image-kernel-dev). You already have the perf fixes, so nothing
to send there.

3.4 and 3.10 are ready immediately for merge, the 3.14 related changes
feel free to soak them until the full release .. or if they pass MUT, we
can go ahead and merge.

Thanks to Darren, Tom, Nitin and everyone else that has been testing 
the changes, and reporting issues.

Cheers,

Bruce


The following changes since commit 5eceedf0326abaee632b32c7cb7ec74e6ba2d6d7:

  ocf-linux: remove recipe (2014-03-27 15:46:52 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (13):
  linux-yocto/3.10: intel-core*/common configuration updates
  linux-yocto/3.4: update mohonpeak.cfg for SATA, SMBus, LPC, WDT,
    crypto & highmem64g
  linux-yocto/3.10: update EFI configuration
  linux-yocto/3.10: update to v3.10.33
  linux-yocto/3.10: add valleyisland io
  linux-yocto/3.10: update to v3.10.34
  linux-yocto/3.10: update intel common meta data
  linux-yocto/3.10: fix drm build failure
  linux-yocto/3.8: remove versioned recipes
  linux-yocto/3.14: introduce versioned recipes
  linux-libc-headers: add 3.14 libc headers
  libc-headers: set TC default to 3.14
  linux-libc-headers: remove 3.10 recipe

 meta/conf/distro/include/tcmode-default.inc        |  2 +-
 ...1-ptrace.h-remove-ptrace_peeksiginfo_args.patch | 50 ------------------
 ...lude-asm-byteorder.h-in-linux-raid-md_p.h.patch | 34 -------------
 ...efile.headersinst-install-headers-from-sc.patch | 59 ----------------------
 .../linux-libc-headers/linux-libc-headers_3.10.bb  | 11 ----
 .../linux-libc-headers/linux-libc-headers_3.14.bb  | 13 +++++
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  8 +--
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb    | 30 -----------
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  6 +--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb | 21 ++++++++
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb  |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb  | 26 ----------
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 18 +++----
 .../{linux-yocto_3.8.bb => linux-yocto_3.14.bb}    | 24 ++++-----
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       |  2 +-
 16 files changed, 65 insertions(+), 243 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-ptrace.h-remove-ptrace_peeksiginfo_args.patch
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/UAPI-include-asm-byteorder.h-in-linux-raid-md_p.h.patch
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/scripts-Makefile.headersinst-install-headers-from-sc.patch
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.10.bb
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.14.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
 rename meta/recipes-kernel/linux/{linux-yocto_3.8.bb => linux-yocto_3.14.bb} (52%)

-- 
1.8.1.2


