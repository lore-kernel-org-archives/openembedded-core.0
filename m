Return-Path: <Yang.Shi@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 91D7570295
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 18:46:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6GIkZGq010617
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 11:46:35 -0700 (PDT)
Received: from yshi-Precision-T5600.corp.ad.wrs.com (147.11.216.166) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 16 Jul 2014 11:46:35 -0700
From: Yang Shi <yang.shi@windriver.com>
To: <bruce.ashfield@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Jul 2014 11:42:11 -0700
Message-ID: <1405536132-31250-1-git-send-email-yang.shi@windriver.com>
X-Mailer: git-send-email 1.9.2
MIME-Version: 1.0
Subject: [PATCH 0/1 V2] Fix KERNEL_ALT_IMAGETYPE deploy
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
X-List-Received-Date: Wed, 16 Jul 2014 18:46:40 -0000
Content-Type: text/plain


When trying to bootup qemuarma9 BSP with uImage, I ran into the below issues:

1. Need u-boot-mkimage-native depend.
kernel.bbclass just checks if KERNEL_IMAGETYPE is uImage, if it is the depend will be added. But, it doesn't check KERNEL_ALT_IMAGETYPE.
In the patch, the check for alt image is added.

2. UBOOT_LOADADDRESS is passed to uboot-mkimage in do_uboot_mkimage. But, this function just check if KERNEL_IMAGETYPE is uImage or not. It doesn't check KERNEL_ALT_IMAGETYPE.
The patch adds the check.

3. KERNEL_ALT_IMAGETYPE is not deployed at all, although it is built. So, we need install, deploy and package the atl image.

Changelog V1 -> V2:
Check if KERNEL_ALT_IMAGETYPE is empty or not. If KERNEL_ALT_IMAGETYPE is empty, just skip alt image install and deploy, otherwise it is failed to install/deploy
because KERNEL_ALT_OUTPUT doesn't point to a real kernel image file.

Yang


The following changes since commit 68824d9b8f6e290da078383316b3f4b732585f2b:

  u-boot-fw-utils: install config file (2014-06-25 13:51:49 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib yshi/kernel_altimg_v2
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=yshi/kernel_altimg_v2

for you to fetch changes up to a4d3971a48d0fb490537d755a19740cb25ea5f4c:

  oe-core/kernel: Deploy KERNEL_ALT_IMAGETYPE and check it for uImage (2014-07-16 11:36:12 -0700)

----------------------------------------------------------------
Yang Shi (1):
      oe-core/kernel: Deploy KERNEL_ALT_IMAGETYPE and check it for uImage

 meta/classes/kernel.bbclass | 38 +++++++++++++++++++++++++++++++++++---
 1 file changed, 35 insertions(+), 3 deletions(-)

