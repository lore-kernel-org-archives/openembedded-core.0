Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB83C433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 14:12:46 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.19572.1640182365045737075
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 06:12:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=v600yBvV;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id
 b1-20020a17090a990100b001b14bd47532so2772518pjp.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 06:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ie9/fMRe/41ioLJppNl6wwqzePnNo1HUtTP8/MtZrVg=;
        b=v600yBvVAwhXS05dC4RDlxHY1AWMuCITZu1M/TsyCSgTu0uP9m6uFOR8AM7SrsYIwa
         t9390K4cliH71gfea1pSdclJFdEjsMMqDZvQ8+Xb+ht9f8SgXb8fk9e6fOX/JOn+ppvS
         uoifz9+f3HQJkGA5sGexNu1E+ypybnH0u3iziMZefA2vpokq9Kagm0ZhEfPQ6FN23R+0
         EY+gDMymE4/R8ylXNvoGYxNaZ0iA4aQuZ1otEE49zY6iHoP0hAN3jI0qCnHI1RVKN3NQ
         M5I4cXIoSbTX5THNRMnNIzKZiLQDKa71hwijePmffVkMRACGMxOTSI1ZrP6jckZ8EEH/
         ZxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ie9/fMRe/41ioLJppNl6wwqzePnNo1HUtTP8/MtZrVg=;
        b=Yd1Vt81O9AcsdwBm5oDmOm1pb7664G5vFQK77Nn9xT40HP9KuutSZjSO8DIsPhLa/N
         Sthfl34Bu4LaSBcPCqgMETpxw1C703wFjyrGW7yyuiDea8Dh8iEgfZQor/J+0YXtAxP9
         PizObgBGpXa63owBDLTZm1QPHDV40EKtTEzdC2sAskOCO/ttPLKKWgvRxcZq5yZyTD0p
         wd4SuQEb63lzHbZKAC2aoXk+ouiFWiyihsvd3hjPWJF3vBSIE6HaBsoPo0/0QVWhBj//
         rNdI72CTvU0yluYOuJId/jubuSDPh9034DHXT10dJBAhWUcbXEahG3Fzn45dzbyU08tA
         8SCQ==
X-Gm-Message-State: AOAM5335wo9OY9b5qeani/54RMC/qVlRWVG/3WeCkCEqA7M+YdfD1/rz
	/GHzMzyVS3Bee/nBgyvLNM6s2ru4rr3NEwUC
X-Google-Smtp-Source: 
 ABdhPJwVSWQANHVcYTZnGEwfaryQ1eb+AY+/kAZElway8Oimy2TP9fehTFkdulWk9Onve8VGHa1DGg==
X-Received: by 2002:a17:90a:9907:: with SMTP id
 b7mr1566025pjp.137.1640182364101;
        Wed, 22 Dec 2021 06:12:44 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id l6sm902849pfu.63.2021.12.22.06.12.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 06:12:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/14] bluez: fix CVE-2021-0129
Date: Wed, 22 Dec 2021 04:12:14 -1000
Message-Id: 
 <573ff24c5ba7836b4dd7f95b6e7c7244b80f9d00.1640181998.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640181998.git.steve@sakoman.com>
References: <cover.1640181998.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Dec 2021 14:12:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159946

From: Marta Rybczynska <rybczynska@gmail.com>

Improper access control in BlueZ may allow an authenticated user to
potentially enable information disclosure via adjacent access.

This issue can be fixed in the kernel, in BlueZ or both. This patch
fixes it on the BlueZ side, so that the configuration no longer
depends on the kernel fix.

https://nvd.nist.gov/vuln/detail/CVE-2021-012

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


