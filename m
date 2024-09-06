Return-Path: <t.remmet@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3191CE7AE0
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 07:25:33 +0000 (UTC)
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by mx.groups.io with SMTP id smtpd.web11.29548.1725607529184986518
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 00:25:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=a4 header.b=WLN4or6O;
 spf=pass (domain: phytec.de, ip: 91.26.50.163, mailfrom: t.remmet@phytec.de)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1725607526; x=1728199526;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Graq59ih8Ju8cLfLex/X04wbje616BNjOwe1THgaupE=;
	b=WLN4or6OqiZfzEDmVLxvXQo9mZBp+mmzSbXoZgJ6QRGX1/negGyEK5rEcnsRlI1B
	38nUg2o0Dl31xTtybmU/ZimEBlpgF2Nsoxf3HDhi7UKcBp8/8g0P1RjOzLeLHX2l
	mil5Llnsln5HUu+Am/yInJCV7Y3t3c3Wmo2wherN2NA=;
X-AuditID: ac14000a-4637f70000004e2a-ed-66daae664dee
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 86.1C.20010.66EAAD66; Fri,  6 Sep 2024 09:25:26 +0200 (CEST)
Received: from augenblix2.phytec.de (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Fri, 6 Sep 2024
 09:25:26 +0200
From: Teresa Remmet <t.remmet@phytec.de>
To: <openembedded-core@lists.openembedded.org>
CC: <upstream@lists.phytec.de>
Subject: [PATCH] recipes-bsp: usbutils: Fix usb-devices command using busybox
Date: Fri, 6 Sep 2024 09:25:16 +0200
Message-ID: <20240906072516.1901872-1-t.remmet@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Florix.phytec.de (172.25.0.13) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrALMWRmVeSWpSXmKPExsWyRpKBRzdt3a00gyl3FS3u/HzHbtH9Tt2B
	yePcxhWMHv3dLawBTFFcNimpOZllqUX6dglcGQc+b2ct2ChSseNqN0sD4xHBLkZODgkBE4nJ
	Pw+xdTFycQgJLGGS+HvnKSOE84hRYsPEp2wgVWwCGhJPV5xm6mLk4BAR0JO4+k8UxGQWkJNY
	1l8EYgoL+Eo8fyQFUswioCLxdPlPdhCbV8BS4kBfAxvEKnmJmZe+Q8UFJU7OfMICYjMDxZu3
	zmaGsCUkDr54AWYLAcV3XTrJCNM77dxrZgg7VOLIptVMExgFZiEZNQvJqFlIRi1gZF7FKJSb
	mZydWpSZrVeQUVmSmqyXkrqJERSKIgxcOxj75ngcYmTiYDzEKMHBrCTC+9TzVpoQb0piZVVq
	UX58UWlOavEhRmkOFiVx3tUdwalCAumJJanZqakFqUUwWSYOTqkGRkfRNvEChsvqCUe2ZkS5
	blII3BoicPnUop4pus88dFe+fKy+zlbCTSlx83/VCKlXp9sVqpL6sp88tlo3RXvq7YvaTjaq
	m2cvmrb317OYnSxZHrfv3Ln84CKfoK/QXomEMwdZjsXX93pKKpXezu2srs1gswiMjXQ8N2HG
	Tze5M5kF6l8Ozv7EpcRSnJFoqMVcVJwIADIkqdozAgAA
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 07:25:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204249

Unknown find parameter -printf makes usb-devices script unusable with
busybox. Replace the parameter to fix this issue.

Signed-off-by: Teresa Remmet <t.remmet@phytec.de>
---
 ...devices-Fix-usb-devices-with-busybox.patch | 37 +++++++++++++++++++
 meta/recipes-bsp/usbutils/usbutils_017.bb     |  1 +
 2 files changed, 38 insertions(+)
 create mode 100755 meta/recipes-bsp/usbutils/usbutils/0001-usb-devices-Fix-usb-devices-with-busybox.patch

diff --git a/meta/recipes-bsp/usbutils/usbutils/0001-usb-devices-Fix-usb-devices-with-busybox.patch b/meta/recipes-bsp/usbutils/usbutils/0001-usb-devices-Fix-usb-devices-with-busybox.patch
new file mode 100755
index 000000000000..dbe5d7c18b6d
--- /dev/null
+++ b/meta/recipes-bsp/usbutils/usbutils/0001-usb-devices-Fix-usb-devices-with-busybox.patch
@@ -0,0 +1,37 @@
+From da155d965a34b5c5770dc30fa52eb7ef405f3a30 Mon Sep 17 00:00:00 2001
+From: Teresa Remmet <t.remmet@phytec.de>
+Date: Thu, 5 Sep 2024 08:37:48 +0200
+Subject: [PATCH] usb-devices: Fix usb-devices with busybox
+
+The busybox find command is missing the -printf parameter leading to
+the error:
+
+find: unrecognized: -printf
+
+Replace the parameter with sed.
+
+This patch was originally created by Daniel Fancsali.
+
+Upstream-Status: Backport [https://github.com/gregkh/usbutils/commit/da155d965a34b5c5770dc30fa52eb7ef405f3a30]
+
+Signed-off-by: Teresa Remmet <t.remmet@phytec.de>
+---
+ usb-devices | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/usb-devices b/usb-devices
+index 5f60ad5a1ed0..51f48b4ad628 100755
+--- a/usb-devices
++++ b/usb-devices
+@@ -192,7 +192,7 @@ if [ ! -d /sys/bus ]; then
+ 	exit 1
+ fi
+ 
+-for device in $(find /sys/bus/usb/devices -name 'usb*' -printf '%f\n' | sort -V)
++for device in $(find /sys/bus/usb/devices -name 'usb*' | sed -E 's#^.*/##g' | sort -V)
+ do
+ 	print_device "/sys/bus/usb/devices/$device" 0 0 0
+ done
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/usbutils/usbutils_017.bb b/meta/recipes-bsp/usbutils/usbutils_017.bb
index a2e340ea4f50..83d5c7287d44 100644
--- a/meta/recipes-bsp/usbutils/usbutils_017.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_017.bb
@@ -13,6 +13,7 @@ DEPENDS = "libusb1 virtual/libiconv udev"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
            file://0001-usbutils.pc.in-Fix-Cflags-entry.patch \
+           file://0001-usb-devices-Fix-usb-devices-with-busybox.patch \
           "
 SRC_URI[sha256sum] = "f704c4cb78a060db88b43aac6ebfd3d93c2c5cf1d6dd0e42936faaf00814ab00"
 
-- 
2.25.1


