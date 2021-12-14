Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0F97C433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 09:50:54 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.23807.1639475441634634631
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 01:50:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KPhmTHiS;
 spf=pass (domain: gmail.com, ip: 209.85.128.42,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso15830639wms.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 01:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dijGapbN8/h/QfjyUOoLh523HHszqtWR3NvVA/oe158=;
        b=KPhmTHiSFcWgl/Jde8KWc1FjlH6fm2BUT6RhWSK8KGuNzQA50CShR1yD4LyYs5G4fo
         QXt4YuOZu+2PF8arpGv51XVMi7b0XXfFlXrl9ThXQ8sRL11LjJocyhFyRVeMcFRV4IJ+
         Dzl8ZUyrtXzfPQ1Bv6Gv81iqdzTdcyPHVPKNhdkqRvpCnT4YVVJe2fhDUvZMkou3vYei
         lo/yKavSQaiZGjB+SkifrCa+V3U7ahoqmj5O8/y6XcMlbqC1TkAEic/OBWcEQnFCapSl
         SSXVVDU1bjQeFOmTSMxiNkGpeyPSy4YztSTxbGhkaPcMMvkvw/mgZdcDcEF6by+kIEcK
         X4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dijGapbN8/h/QfjyUOoLh523HHszqtWR3NvVA/oe158=;
        b=wf/TexzNw/0SyfFn9Z919nHAXBeMPU/wvtuDw7jVxzlYBtS+QMxGxMrEIJ6DyYPLq2
         6xJ1aTVSD2eI7Gp4AIEKJnPHQ4Q2p3O78z6lx8m8kotsOA546mmFfcA40Lp19MJjL1dX
         OQB9irmY1/349+jlG+bdKTOcC3/9J89zVF1ztyHntKiMtX7qxevBzPqA3Sbe98oQxkAN
         5Xw9X5bH4Luf68NMbKir71IenENuWBSWEEWXURbWdo0bP44THcicDgrcmz+eM4J9ZT1X
         UCTfHVwX38TkQgQ7IXenUiXVnuGep6RGvipShFEdvQOo7FRiNN00hiXFZihO7bk2cRln
         OPog==
X-Gm-Message-State: AOAM533TV0awwWgg6U/JZU53JOOZ3ov9FhG36SUGh3GzLxUtEPDVWslv
	QLs1AtPgs5fhvPwH1Z5AS3QZLX0Kep4=
X-Google-Smtp-Source: 
 ABdhPJwUisETWqfLFuZvMNhBXP5YdwBOkd++iVqDnC1b1f2Y3lcBHpIm+Glp7/MBmiTp1Rh65Tooug==
X-Received: by 2002:a7b:cc96:: with SMTP id p22mr5606784wma.69.1639475439913;
        Tue, 14 Dec 2021 01:50:39 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.237])
        by smtp.gmail.com with ESMTPSA id
 r15sm1519689wmh.13.2021.12.14.01.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 01:50:39 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@huawei.com>
To: openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [dunfell][PATCH] bluez: fix CVE-2021-0129
Date: Tue, 14 Dec 2021 10:50:27 +0100
Message-Id: <20211214095027.55683-1-marta.rybczynska@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 09:50:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159682

From: Marta Rybczynska <rybczynska@gmail.com>

Improper access control in BlueZ may allow an authenticated user to
potentially enable information disclosure via adjacent access.

This issue can be fixed in the kernel, in BlueZ or both. This patch
fixes it on the BlueZ side, so that the configuration no longer
depends on the kernel fix.

https://nvd.nist.gov/vuln/detail/CVE-2021-012

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
 .../bluez5/bluez5/CVE-2021-0129.patch         | 109 ++++++++++++++++++
 2 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2021-0129.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 202a14dee0..34796fdd20 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -52,6 +52,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
+           file://CVE-2021-0129.patch \
            file://CVE-2021-3588.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
diff --git a/meta/recipes-connectivity/bluez5/bluez5/CVE-2021-0129.patch b/meta/recipes-connectivity/bluez5/bluez5/CVE-2021-0129.patch
new file mode 100644
index 0000000000..b39730dc10
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/CVE-2021-0129.patch
@@ -0,0 +1,109 @@
+From 00da0fb4972cf59e1c075f313da81ea549cb8738 Mon Sep 17 00:00:00 2001
+From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
+Date: Tue, 2 Mar 2021 11:38:33 -0800
+Subject: shared/gatt-server: Fix not properly checking for secure flags
+
+When passing the mask to check_permissions all valid permissions for
+the operation must be set including BT_ATT_PERM_SECURE flags.
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/bluetooth/bluez.git/patch/?id=00da0fb4972cf59e1c075f313da81ea549cb8738]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+CVE: CVE-2021-0129
+---
+ src/shared/att-types.h   |  8 ++++++++
+ src/shared/gatt-server.c | 25 +++++++------------------
+ 2 files changed, 15 insertions(+), 18 deletions(-)
+
+diff --git a/src/shared/att-types.h b/src/shared/att-types.h
+index 7108b4e94..3adc05d9e 100644
+--- a/src/shared/att-types.h
++++ b/src/shared/att-types.h
+@@ -129,6 +129,14 @@ struct bt_att_pdu_error_rsp {
+ #define BT_ATT_PERM_WRITE_SECURE	0x0200
+ #define BT_ATT_PERM_SECURE		(BT_ATT_PERM_READ_SECURE | \
+ 					BT_ATT_PERM_WRITE_SECURE)
++#define BT_ATT_PERM_READ_MASK		(BT_ATT_PERM_READ | \
++					BT_ATT_PERM_READ_AUTHEN | \
++					BT_ATT_PERM_READ_ENCRYPT | \
++					BT_ATT_PERM_READ_SECURE)
++#define BT_ATT_PERM_WRITE_MASK		(BT_ATT_PERM_WRITE | \
++					BT_ATT_PERM_WRITE_AUTHEN | \
++					BT_ATT_PERM_WRITE_ENCRYPT | \
++					BT_ATT_PERM_WRITE_SECURE)
+ 
+ /* GATT Characteristic Properties Bitfield values */
+ #define BT_GATT_CHRC_PROP_BROADCAST			0x01
+diff --git a/src/shared/gatt-server.c b/src/shared/gatt-server.c
+index b5f7de7dc..970c35f94 100644
+--- a/src/shared/gatt-server.c
++++ b/src/shared/gatt-server.c
+@@ -444,9 +444,7 @@ static void process_read_by_type(struct async_read_op *op)
+ 		return;
+ 	}
+ 
+-	ecode = check_permissions(server, attr, BT_ATT_PERM_READ |
+-						BT_ATT_PERM_READ_AUTHEN |
+-						BT_ATT_PERM_READ_ENCRYPT);
++	ecode = check_permissions(server, attr, BT_ATT_PERM_READ_MASK);
+ 	if (ecode)
+ 		goto error;
+ 
+@@ -811,9 +809,7 @@ static void write_cb(struct bt_att_chan *chan, uint8_t opcode, const void *pdu,
+ 				(opcode == BT_ATT_OP_WRITE_REQ) ? "Req" : "Cmd",
+ 				handle);
+ 
+-	ecode = check_permissions(server, attr, BT_ATT_PERM_WRITE |
+-						BT_ATT_PERM_WRITE_AUTHEN |
+-						BT_ATT_PERM_WRITE_ENCRYPT);
++	ecode = check_permissions(server, attr, BT_ATT_PERM_WRITE_MASK);
+ 	if (ecode)
+ 		goto error;
+ 
+@@ -913,9 +909,7 @@ static void handle_read_req(struct bt_att_chan *chan,
+ 			opcode == BT_ATT_OP_READ_BLOB_REQ ? "Blob " : "",
+ 			handle);
+ 
+-	ecode = check_permissions(server, attr, BT_ATT_PERM_READ |
+-						BT_ATT_PERM_READ_AUTHEN |
+-						BT_ATT_PERM_READ_ENCRYPT);
++	ecode = check_permissions(server, attr, BT_ATT_PERM_READ_MASK);
+ 	if (ecode)
+ 		goto error;
+ 
+@@ -1051,9 +1045,8 @@ static void read_multiple_complete_cb(struct gatt_db_attribute *attr, int err,
+ 		goto error;
+ 	}
+ 
+-	ecode = check_permissions(data->server, next_attr, BT_ATT_PERM_READ |
+-						BT_ATT_PERM_READ_AUTHEN |
+-						BT_ATT_PERM_READ_ENCRYPT);
++	ecode = check_permissions(data->server, next_attr,
++						BT_ATT_PERM_READ_MASK);
+ 	if (ecode)
+ 		goto error;
+ 
+@@ -1129,9 +1122,7 @@ static void read_multiple_cb(struct bt_att_chan *chan, uint8_t opcode,
+ 		goto error;
+ 	}
+ 
+-	ecode = check_permissions(data->server, attr, BT_ATT_PERM_READ |
+-						BT_ATT_PERM_READ_AUTHEN |
+-						BT_ATT_PERM_READ_ENCRYPT);
++	ecode = check_permissions(data->server, attr, BT_ATT_PERM_READ_MASK);
+ 	if (ecode)
+ 		goto error;
+ 
+@@ -1308,9 +1299,7 @@ static void prep_write_cb(struct bt_att_chan *chan, uint8_t opcode,
+ 	util_debug(server->debug_callback, server->debug_data,
+ 				"Prep Write Req - handle: 0x%04x", handle);
+ 
+-	ecode = check_permissions(server, attr, BT_ATT_PERM_WRITE |
+-						BT_ATT_PERM_WRITE_AUTHEN |
+-						BT_ATT_PERM_WRITE_ENCRYPT);
++	ecode = check_permissions(server, attr, BT_ATT_PERM_WRITE_MASK);
+ 	if (ecode)
+ 		goto error;
+ 
+-- 
+cgit 1.2.3-1.el7
+
-- 
2.33.0


