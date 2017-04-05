Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8435F77A4F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 12:39:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v35CdX2K011172
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 5 Apr 2017 05:39:34 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 5 Apr 2017 05:39:33 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 5 Apr 2017 08:39:32 -0400
Message-ID: <1491395972-25386-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemu arm/x86: drop linux-yocto preferred version
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
X-List-Received-Date: Wed, 05 Apr 2017 12:39:34 -0000
Content-Type: text/plain

We don't make a linux-yocto version available unless it boots
on all qemu targets, hence there is no reason to specify a
specific version .. the latest is always fine.

Also, the other qemu machines don't have this specification, so
this makes x86 and ARM consistent.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/conf/machine/include/x86-base.inc | 1 -
 meta/conf/machine/qemuarm.conf         | 1 -
 2 files changed, 2 deletions(-)

diff --git a/meta/conf/machine/include/x86-base.inc b/meta/conf/machine/include/x86-base.inc
index 40d59577fdb5..82e0cf6a5f36 100644
--- a/meta/conf/machine/include/x86-base.inc
+++ b/meta/conf/machine/include/x86-base.inc
@@ -20,7 +20,6 @@ SERIAL_CONSOLE ?= "115200 ttyS0"
 # kernel-related variables
 #
 PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
-PREFERRED_VERSION_linux-yocto ??= "4.8%"
 
 #
 # XSERVER subcomponents, used to build the XSERVER variable
diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index f9d6dd7e364e..b9b640f974f3 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -16,5 +16,4 @@ QB_MACHINE = "-machine versatilepb"
 QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,115200 console=tty"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND = "-show-cursor -usb -usbdevice tablet -device virtio-rng-pci"
-PREFERRED_VERSION_linux-yocto ??= "4.8%"
 QB_DTB = "${@base_version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
-- 
2.5.0


