Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DBCDC4167D
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 15:47:35 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web12.65902.1643816854011182405
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 07:47:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: sakib.sajal@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 212FlWhq024549
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 2 Feb 2022 07:47:32 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 212FlQXh023439
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 2 Feb 2022 07:47:32 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 2 Feb 2022 07:47:27 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 2 Feb 2022 07:47:27 -0800
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 2 Feb 2022 07:47:27 -0800
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH 5/8] qemu: fix CVE-2021-3713
Date: Wed, 2 Feb 2022 10:47:17 -0500
Message-ID: <20220202154720.18976-5-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220202154720.18976-1-sakib.sajal@windriver.com>
References: <20220202154720.18976-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.wrs.com id
 212FlWhq024549
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 15:47:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161212

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-3713.patch             | 68 +++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3713.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 4198d3a52c..970aa96608 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -77,6 +77,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
            file://CVE-2021-3595_1.patch \
            file://CVE-2021-3595_2.patch \
            file://CVE-2021-3594.patch \
+           file://CVE-2021-3713.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3713.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2021-3713.patch
new file mode 100644
index 0000000000..33fca66d3d
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3713.patch
@@ -0,0 +1,68 @@
+From 9a8f71ec660e67c51cc5905dd9d2a12ff78ce743 Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Wed, 18 Aug 2021 14:05:05 +0200
+Subject: [PATCH 08/12] uas: add stream number sanity checks.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+The device uses the guest-supplied stream number unchecked, which can
+lead to guest-triggered out-of-band access to the UASDevice->data3 and
+UASDevice->status3 fields.  Add the missing checks.
+
+Fixes: CVE-2021-3713
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Reported-by: Chen Zhe <chenzhe@huawei.com>
+Reported-by: Tan Jingguo <tanjingguo@huawei.com>
+Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
+Message-Id: <20210818120505.1258262-2-kraxel@redhat.com>
+(cherry picked from commit 13b250b12ad3c59114a6a17d59caf073ce45b33a)
+Signed-off-by: Michael Roth <michael.roth@amd.com>
+
+Upstream-Status: Backport [36403e8788a264dc96174f52584681ebcb4f54b1]
+CVE: CVE-2021-3713
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/usb/dev-uas.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
+index cec071d96..157734eb0 100644
+--- a/hw/usb/dev-uas.c
++++ b/hw/usb/dev-uas.c
+@@ -831,6 +831,9 @@ static void usb_uas_handle_data(USBDevice *dev, USBP=
acket *p)
+         }
+         break;
+     case UAS_PIPE_ID_STATUS:
++        if (p->stream > UAS_MAX_STREAMS) {
++            goto err_stream;
++        }
+         if (p->stream) {
+             QTAILQ_FOREACH(st, &uas->results, next) {
+                 if (st->stream =3D=3D p->stream) {
+@@ -858,6 +861,9 @@ static void usb_uas_handle_data(USBDevice *dev, USBP=
acket *p)
+         break;
+     case UAS_PIPE_ID_DATA_IN:
+     case UAS_PIPE_ID_DATA_OUT:
++        if (p->stream > UAS_MAX_STREAMS) {
++            goto err_stream;
++        }
+         if (p->stream) {
+             req =3D usb_uas_find_request(uas, p->stream);
+         } else {
+@@ -893,6 +899,11 @@ static void usb_uas_handle_data(USBDevice *dev, USB=
Packet *p)
+         p->status =3D USB_RET_STALL;
+         break;
+     }
++
++err_stream:
++    error_report("%s: invalid stream %d", __func__, p->stream);
++    p->status =3D USB_RET_STALL;
++    return;
+ }
+=20
+ static void usb_uas_unrealize(USBDevice *dev)
+--=20
+2.31.1
+
--=20
2.33.0


