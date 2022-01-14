Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76EBBC4332F
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 00:06:47 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web09.637.1642118806676433435
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 16:06:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: sakib.sajal@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 20E06kFE005745
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 16:06:46 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 20E06kUd006920
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 16:06:46 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 13 Jan 2022 16:06:45 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 13 Jan 2022 16:06:45 -0800
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 13 Jan 2022 16:06:45 -0800
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH 8/8] qemu: CVE-2021-20196
Date: Thu, 13 Jan 2022 19:06:41 -0500
Message-ID: <20220114000641.33969-8-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220114000641.33969-1-sakib.sajal@windriver.com>
References: <20220114000641.33969-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.wrs.com id
 20E06kFE005745
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 00:06:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160550

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  2 +
 .../qemu/qemu/CVE-2021-20196_1.patch          | 54 +++++++++++++++
 .../qemu/qemu/CVE-2021-20196_2.patch          | 67 +++++++++++++++++++
 3 files changed, 123 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20196_1.patc=
h
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20196_2.patc=
h

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 4a5379893c..3401fd7194 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -80,6 +80,8 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
            file://CVE-2021-3713.patch \
            file://CVE-2021-3748.patch \
            file://CVE-2021-3930.patch \
+           file://CVE-2021-20196_1.patch \
+           file://CVE-2021-20196_2.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-20196_1.patch b/met=
a/recipes-devtools/qemu/qemu/CVE-2021-20196_1.patch
new file mode 100644
index 0000000000..bc513277ac
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-20196_1.patch
@@ -0,0 +1,54 @@
+From e907ff3d4cb7fd20d402f45355059e67d0dc93e7 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat=
.com>
+Date: Wed, 24 Nov 2021 17:15:34 +0100
+Subject: [PATCH 11/12] hw/block/fdc: Extract blk_create_empty_drive()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+We are going to re-use this code in the next commit,
+so extract it as a new blk_create_empty_drive() function.
+
+Inspired-by: Hanna Reitz <hreitz@redhat.com>
+Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
+Message-id: 20211124161536.631563-2-philmd@redhat.com
+Signed-off-by: John Snow <jsnow@redhat.com>
+
+Upstream-Status: Backport
+CVE: CVE-2021-20196
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/block/fdc.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/hw/block/fdc.c b/hw/block/fdc.c
+index 4c2c35e22..854b4f172 100644
+--- a/hw/block/fdc.c
++++ b/hw/block/fdc.c
+@@ -61,6 +61,12 @@
+     } while (0)
+=20
+=20
++/* Anonymous BlockBackend for empty drive */
++static BlockBackend *blk_create_empty_drive(void)
++{
++    return blk_new(qemu_get_aio_context(), 0, BLK_PERM_ALL);
++}
++
+ /********************************************************/
+ /* qdev floppy bus                                      */
+=20
+@@ -543,8 +549,7 @@ static void floppy_drive_realize(DeviceState *qdev, =
Error **errp)
+     }
+=20
+     if (!dev->conf.blk) {
+-        /* Anonymous BlockBackend for an empty drive */
+-        dev->conf.blk =3D blk_new(qemu_get_aio_context(), 0, BLK_PERM_A=
LL);
++        dev->conf.blk =3D blk_create_empty_drive();
+         ret =3D blk_attach_dev(dev->conf.blk, qdev);
+         assert(ret =3D=3D 0);
+=20
+--=20
+2.31.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-20196_2.patch b/met=
a/recipes-devtools/qemu/qemu/CVE-2021-20196_2.patch
new file mode 100644
index 0000000000..1e39ed81b1
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-20196_2.patch
@@ -0,0 +1,67 @@
+From 1d48445a951fd5504190a38abeda70ea9372cf77 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat=
.com>
+Date: Wed, 24 Nov 2021 17:15:35 +0100
+Subject: [PATCH 12/12] hw/block/fdc: Kludge missing floppy drive to fix
+ CVE-2021-20196
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Guest might select another drive on the bus by setting the
+DRIVE_SEL bit of the DIGITAL OUTPUT REGISTER (DOR).
+The current controller model doesn't expect a BlockBackend
+to be NULL. A simple way to fix CVE-2021-20196 is to create
+an empty BlockBackend when it is missing. All further
+accesses will be safely handled, and the controller state
+machines keep behaving correctly.
+
+Cc: qemu-stable@nongnu.org
+Fixes: CVE-2021-20196
+Reported-by: Gaoning Pan (Ant Security Light-Year Lab) <pgn@zju.edu.cn>
+Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Hanna Reitz <hreitz@redhat.com>
+Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
+Message-id: 20211124161536.631563-3-philmd@redhat.com
+BugLink: https://bugs.launchpad.net/qemu/+bug/1912780
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/338
+Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Hanna Reitz <hreitz@redhat.com>
+Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
+Signed-off-by: John Snow <jsnow@redhat.com>
+
+Upstream-Status: Backport
+CVE: CVE-2021-20196
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/block/fdc.c | 14 +++++++++++++-
+ 1 file changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/hw/block/fdc.c b/hw/block/fdc.c
+index 854b4f172..a736c4d14 100644
+--- a/hw/block/fdc.c
++++ b/hw/block/fdc.c
+@@ -1365,7 +1365,19 @@ static FDrive *get_drv(FDCtrl *fdctrl, int unit)
+=20
+ static FDrive *get_cur_drv(FDCtrl *fdctrl)
+ {
+-    return get_drv(fdctrl, fdctrl->cur_drv);
++    FDrive *cur_drv =3D get_drv(fdctrl, fdctrl->cur_drv);
++
++    if (!cur_drv->blk) {
++        /*
++         * Kludge: empty drive line selected. Create an anonymous
++         * BlockBackend to avoid NULL deref with various BlockBackend
++         * API calls within this model (CVE-2021-20196).
++         * Due to the controller QOM model limitations, we don't
++         * attach the created to the controller device.
++         */
++        cur_drv->blk =3D blk_create_empty_drive();
++    }
++    return cur_drv;
+ }
+=20
+ /* Status A register : 0x00 (read-only) */
+--=20
+2.31.1
+
--=20
2.33.0


