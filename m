Return-Path: <naveen.kumar.saini@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68131C433F5
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 02:25:23 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web10.2408.1653445518156254837
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 19:25:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=nbIxWHYs;
 spf=pass (domain: intel.com, ip: 192.55.52.120,
 mailfrom: naveen.kumar.saini@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653445518; x=1684981518;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AVhF87JzyKMuRwRGXI3GsW7YB80FzocekpiAFawdrrY=;
  b=nbIxWHYsRY1fPuEraF5CjQrIZ4FIr/VZkgrNfM6Q7cshb0ClB0fYzgqK
   rhk44EH6jGrmKArVc+SNZ++uMfee4ApphnvF5d8iMc++5eSOF3TNyXp3E
   oT/bnrCOGPBzN9no5q3r9zsaMU0eGec+U9tI5iK19zgcgBMy7WpSFGgNR
   5nyoY/dWzedq/XRi0CqvWMsZtiBIg1JCmlIuAFMVuGCpWiW7zHnNsr9eR
   Pz9XWB0n4uhxz5dXgCqJZP5X6Me9WY5EkSWh7atbMBaagpfwFVaV95CFh
   suD3sDGH7VxZfD0Gms3yupahY0QbcY3b50ymLlCyQNZJrW09VCIuUzMBT
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10357"; a="272515537"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600";
   d="scan'208";a="272515537"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 19:25:16 -0700
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600";
   d="scan'208";a="601607900"
Received: from saininav-desk1.png.intel.com ([10.158.87.77])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 19:25:15 -0700
From: Naveen Saini <naveen.kumar.saini@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pciutils: avoid lspci conflict with busybox
Date: Wed, 25 May 2022 10:43:29 +0800
Message-Id: <20220525024329.1557093-1-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 02:25:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166090

if virtualization is enabled as DISTRO_FEATURES, then meta-virtualization layer
enables CONFIG_LSPCI=y for busybox, which in result have conflicts with pciutils

update-alternatives: Error: not linking ..core-image-base/1.0-r0/rootfs/usr/bin/lspci
to /bin/busybox.nosuid since
..core-image-base/1.0-r0/rootfs/usr/bin/lspci exists and is not a link

So marking it as ALTERNATIVE with ALTERNATIVE_PRIORITY set to 100

Ref:
https://git.yoctoproject.org/poky/commit/meta/recipes-bsp/pciutils?id=a81af375dfc51446b21548dce2afa6a77bc02df3
https://github.com/pciutils/pciutils/commit/0b307156c92f61c1a02d232f4c6ed17e888de9a9
https://git.yoctoproject.org/meta-virtualization/tree/recipes-core/busybox/busybox/lspci.cfg
https://git.yoctoproject.org/meta-virtualization/tree/recipes-core/busybox/busybox_virtualization.inc#n4
https://git.yoctoproject.org/meta-virtualization/tree/recipes-core/busybox/busybox_%25.bbappend#n1

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 meta/recipes-bsp/pciutils/pciutils_3.8.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb b/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb
index f3a67d97e4..4f57342e1e 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb
@@ -16,7 +16,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.xz \
 
 SRC_URI[sha256sum] = "91edbd0429a84705c9ad156d4ff38ccc724d41ea54c4c5b88e38e996f8a34f05"
 
-inherit multilib_header pkgconfig
+inherit multilib_header pkgconfig update-alternatives
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'hwdb', '', d)}"
 PACKAGECONFIG[hwdb] = "HWDB=yes,HWDB=no,udev"
@@ -59,3 +59,6 @@ FILES:libpci = "${libdir}/libpci.so.*"
 SUMMARY:${PN}-ids = "PCI utilities - device ID database"
 DESCRIPTION:${PN}-ids = "Package providing the PCI device ID database for pciutils."
 RDEPENDS:${PN} += "${PN}-ids"
+
+ALTERNATIVE:${PN} = "lspci"
+ALTERNATIVE_PRIORITY = "100"
-- 
2.25.1


