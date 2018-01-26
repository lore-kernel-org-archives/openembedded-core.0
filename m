Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E3F1E78432
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 13:59:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w0QDxPrM011510
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 26 Jan 2018 05:59:25 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 26 Jan 2018 05:59:24 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 26 Jan 2018 08:59:11 -0500
Message-ID: <cover.1516973739.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/12] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Fri, 26 Jan 2018 13:59:27 -0000
Content-Type: text/plain

Hi all,

Here is another consolidated pull request. I was in a cycle waiting for
the right set of Spectre/Meltdown fixes to land, and finally they did
appear for 4.4 and 4.9, so I've triggerd this pull request.

On that CVE note, mitigations for 4.12 and 4.8 (i.e. kernels that have
been released as defaults in the past) will follow in a bit, they just
aren't quite ready yet.

My plan on the kernel front is to get mitigations in place, and then
for the next release put everything but 4.14 and 4.15+ into maintenance
mode.

Along with the -stable updates, I have a build failure fix ([YOCTO #12430)

   [PATCH 02/12] linux-yocto/4.9: fix aufs build

As well as some bug fix backports:

   [PATCH 04/12] linux-yocto/4.12: CQM and rdt backports
   [PATCH 05/12] linux-yocto/4.12: coffeeLake-s graphics and audio support
   [PATCH 06/12] linux-yocto/4.12: drm & mips fixes
   [PATCH 08/12] linux-yocto/4.12: iwlwifi and pci id backports

There is also a build process fix ([YOCTO #12487])

   [PATCH 07/12] kernel-yocto: make SRC_URI defconfig removal more specific

And finally, a RFC patch that tweaks the way make-mod-scripts are built.
I've been carrying this in my tree since last Fall and haven't had any
issues .. but I've still left it as RFC to indicate if there's feedback
please do send it along. That's for YOCTO #12228 if you need extra history
on the bug.

  [RFC][PATCH 12/12] make-mod-scripts: change how some kernel module tools are built

I've built and booted all the arches and variants that I possibly could,
but the test matrix is large, so there always remains the possibility that
something has slipped through.

And finally, here are the Spectre/Meltdown reports for 4.9 and 4.4:

4.4 spectre test:
-----------------

CVE-2017-5753 [bounds check bypass] aka 'Spectre Variant 1'
* Mitigated according to the /sys interface:  NO  (kernel confirms your system is vulnerable)
> STATUS:  VULNERABLE  (Vulnerable)

CVE-2017-5715 [branch target injection] aka 'Spectre Variant 2'
* Mitigated according to the /sys interface:  NO  (kernel confirms your system is vulnerable)
* Mitigation 1
  * Kernel is compiled with IBRS/IBPB support:  NO 
  * Currently enabled features
    * IBRS enabled for Kernel space:  NO 
    * IBRS enabled for User space:  NO 
    * IBPB enabled:  NO 
* Mitigation 2
  * Kernel compiled with retpoline option:  YES 
  * Kernel compiled with a retpoline-aware compiler:  NO  (kernel reports minimal retpoline compilation)
  * Retpoline enabled:  YES 
> STATUS:  VULNERABLE  (Vulnerable: Minimal generic ASM retpoline)

CVE-2017-5754 [rogue data cache load] aka 'Meltdown' aka 'Variant 3'
* Mitigated according to the /sys interface:  YES  (kernel confirms that the mitigation is active)
* Kernel supports Page Table Isolation (PTI):  YES 
* PTI enabled and active:  YES 
* Running as a Xen PV DomU:  NO 
> STATUS:  NOT VULNERABLE  (Mitigation: PTI)


4.9 Spectre test:
----------------

CVE-2017-5753 [bounds check bypass] aka 'Spectre Variant 1'
* Mitigated according to the /sys interface:  NO  (kernel confirms your system is vulnerable)
> STATUS:  VULNERABLE  (Vulnerable)

CVE-2017-5715 [branch target injection] aka 'Spectre Variant 2'
* Mitigated according to the /sys interface:  NO  (kernel confirms your system is vulnerable)
* Mitigation 1
  * Kernel is compiled with IBRS/IBPB support:  NO 
  * Currently enabled features
    * IBRS enabled for Kernel space:  NO 
    * IBRS enabled for User space:  NO 
    * IBPB enabled:  NO 
* Mitigation 2
  * Kernel compiled with retpoline option:  YES 
  * Kernel compiled with a retpoline-aware compiler:  NO  (kernel reports minimal retpoline compilation)
  * Retpoline enabled:  YES 
> STATUS:  VULNERABLE  (Vulnerable: Minimal generic ASM retpoline)

CVE-2017-5754 [rogue data cache load] aka 'Meltdown' aka 'Variant 3'
* Mitigated according to the /sys interface:  YES  (kernel confirms that the mitigation is active)
* Kernel supports Page Table Isolation (PTI):  YES 
* PTI enabled and active:  YES 
* Running as a Xen PV DomU:  NO 
> STATUS:  NOT VULNERABLE  (Mitigation: PTI)

Cheers,

Bruce

The following changes since commit 902b77bf91d96517b935bce00a11003604dc3d54:

  lib/oe/package_manager/sdk: Ensure do_populate_sdk_ext and do_populate_sdk repos don't conflict (2018-01-22 10:39:10 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (11):
  linux-yocto/4.9: update to v4.9.71
  linux-yocto/4.9: fix aufs build
  linux-yocto/4.4: update to 4.4.99
  linux-yocto/4.12: CQM and rdt backports
  linux-yocto/4.12: coffeeLake-s graphics and audio support
  linux-yocto/4.12: drm & mips fixes
  kernel-yocto: make SRC_URI defconfig removal more specific
  linux-yocto/4.12: iwlwifi and pci id backports
  linux-yocto/4.4: update to v4.4.113
  linux-yocto/4.9: update to v4.9.78
  linux-yocto/4.12: update to v4.12.19

Joe Slater (1):
  make-mod-scripts: change how some kernel module tools are built

 meta/classes/kernel-yocto.bbclass                  |  2 +-
 meta/classes/module-base.bbclass                   | 12 +++--------
 meta/classes/module.bbclass                        |  4 ----
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb    |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb  |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 20 +++++++++---------
 meta/recipes-kernel/linux/linux-yocto_4.4.bb       | 20 +++++++++---------
 meta/recipes-kernel/linux/linux-yocto_4.9.bb       | 20 +++++++++---------
 .../make-mod-scripts/make-mod-scripts_1.0.bb       | 24 ++++++++++++++++++++++
 13 files changed, 76 insertions(+), 62 deletions(-)
 create mode 100644 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb

-- 
2.5.0


