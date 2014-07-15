Return-Path: <Yang.Shi@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C056D705C3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 15:08:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6FF8I0H002934
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 08:08:18 -0700 (PDT)
Received: from yshi-Precision-T5600.corp.ad.wrs.com (147.11.216.166) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 15 Jul 2014 08:08:18 -0700
From: Yang Shi <yang.shi@windriver.com>
To: <bruce.ashfield@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Jul 2014 08:03:57 -0700
Message-ID: <1405436638-25131-1-git-send-email-yang.shi@windriver.com>
X-Mailer: git-send-email 1.9.2
MIME-Version: 1.0
Subject: [PATCH 0/1] Fix KERNEL_ALT_IMAGETYPE deploy
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
X-List-Received-Date: Tue, 15 Jul 2014 15:08:19 -0000
Content-Type: text/plain


When trying to bootup qemuarma9 BSP with uImage, I ran into the below issues:

1. Need u-boot-mkimage-native depend.
kernel.bbclass just checks if KERNEL_IMAGETYPE is uImage, if it is the depend will be added. But, it doesn't check KERNEL_ALT_IMAGETYPE.
In the patch, the check for alt image is added.

2. UBOOT_LOADADDRESS is passed to uboot-mkimage in do_uboot_mkimage. But, this function just check if KERNEL_IMAGETYPE is uImage or not. It doesn't check KERNEL_ALT_IMAGETYPE.
The patch adds the check.

3. KERNEL_ALT_IMAGETYPE is not deployed at all, although it is built. So, we need install, deploy and package the atl image.

Yang


The following changes since commit 68824d9b8f6e290da078383316b3f4b732585f2b:

  u-boot-fw-utils: install config file (2014-06-25 13:51:49 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib yshi/kernel_altimg
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=yshi/kernel_altimg

for you to fetch changes up to 8454e4b077364d1f52f1f583ce8abe26d6195371:

  kernel: Deploy KERNEL_ALT_IMAGETYPE and check it for uImage (2014-07-14 13:21:24 -0700)

----------------------------------------------------------------
Yang Shi (1):
      kernel: Deploy KERNEL_ALT_IMAGETYPE and check it for uImage

 meta/classes/kernel.bbclass | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

