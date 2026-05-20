Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D60CD4F3C
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:21:22 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7388.1779265282186048763
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:21:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TOBOXj+i;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d75312379so3759679f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 01:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779265280; x=1779870080; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8aV4GRZRpdMpkdCgv6z1BTGvWW7cmgc/G+pwWTzGnH0=;
        b=TOBOXj+iH8ftFbuvzFHW75Z0/TglEQOsuLkAxuKxLRi+W/8BzqMI9a4DwLv+dF8BXh
         KEDYZPjJ98Fld2TYf1hvH6NUbmzXR09Zjf8q/S3smykxLD+FsUKAsBCfrP422X3fL3EY
         vX9CZdcpgpfS504qleghjfvDjYlN5zDRzKXVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265280; x=1779870080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8aV4GRZRpdMpkdCgv6z1BTGvWW7cmgc/G+pwWTzGnH0=;
        b=MMdp6kvOcFpi4gFyP2Ll3wVt0wtjBGkhWTvOnkvqRIsBMAVk3efbHrCqpXtBlBL0Dt
         ZML43BYMP2/9tlB6sME3DFSN8Rw7H1x36lo8F/mZGcrbRAyUgSdpDq534+YQJ4H03ZDw
         UI4UiHXRFWybQH+xEmcWvU6sqSqt2oT9O/evo5DTWUVKNmxaw0IUN1qh1OlJXCVAoqtf
         KnKuWiWbpX1f0LjIdtCczWH1LVuYQVHCXJE2SQMBnPZYSvzkNeITHvvJY7mOuhloEVLY
         5pbs5eNcJVu6805FvRi0u6LvGnrprTaZcwE9d6t3lm4PfxJpnLX7fmLCfH247h5aB5Ac
         /gpA==
X-Gm-Message-State: AOJu0YxMVjUC6S9p3TdvZrr6N8gyYcia6yodWsJ+qZMBtqziZKpl1bWj
	RHlLXHVYy0XWjti/SfTPzxsVPCFyKjQTQ/AT+XMimJ3L1oM9Tq1TaixzKHctUEt+WLl8sLag6Kt
	QImWo
X-Gm-Gg: Acq92OEQZJs8njdTPVORRczJsqcHCjUC8eM3kDseElCrWtJPFcc7/eKD06ly9JyX0p6
	gLSp6YIbFOxiHLcUsYEzls2k6ODTVaJxIKeWPspASsmsJNdDiLw1wPRS9Lvw7QpUrLiOLG8ws8Y
	guPhn+lCvRVlO3CVRASXQKtFqIMpypYwm9amm+mFDIDZF1A3SbPXL30siCR/VfGYEdFL5yoEST+
	ENGbtGzF2iEOJb/6U5ntiQuC/cAxqPKDrDrEuIpm+UCILsTM6OcHLoDq3jnG92475ZATKd1KPRc
	nBWZzyUzHQoMvJsoh16tFA4YRKzz4RLezZnlUlCpdVnPkZyPz1TiT9aFSJGyXADU/fg/MpDw7Dh
	klV8NjocX1JTz3PwAXArK+4G71EsmGj3ftZtpHzF1KhQIPONCbiD6BAXcKWmUR0Gbc0ifRScmMw
	TZAzopTBHJrjE4Pyl3DVQ426tmJbesNVaHNYeQ54ya1uPRPnsEK7W0qKaSNWdJBKmJBr0/eGY8z
	BlvNiyuez11sA+N8eGfvESf4lYxbzwmKLjNvbQ=
X-Received: by 2002:a05:600c:8905:b0:48e:89fa:9811 with SMTP id 5b1f17b1804b1-48fd6361dc2mr345075455e9.13.1779265280281;
        Wed, 20 May 2026 01:21:20 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-250c-63aa-0256-2b9f-d16e-d784.rev.sfr.net. [2a02:8440:250c:63aa:256:2b9f:d16e:d784])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm56350642f8f.10.2026.05.20.01.21.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:21:19 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose v2 25/28] bluez5: add patches to fix 8.56 gatt issue
Date: Wed, 20 May 2026 10:20:26 +0200
Message-ID: <6a3d8f5a481a54bbf4859e5a2d3968b103a15a4e.1779264709.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779264709.git.yoann.congal@smile.fr>
References: <cover.1779264709.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:21:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237424

From: Jinwang Li <jinwang.li@oss.qualcomm.com>

btd_gatt_client_service_removed() can be called reentrantly via
bt_gatt_client_unref() after the services queue has already been freed,
resulting in a use-after-free.

Reset client->ready to false before destroying the services queue to
prevent reentrant calls from dereferencing freed memory.

Upstream-Status: Backport [bluez/bluez@d01616f]
Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 37f8b40d68bdac279d363d946b935716e2843d00)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...use-after-free-caused-by-reentrant-c.patch | 59 +++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-gatt-client-Fix-use-after-free-caused-by-reentrant-c.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 843e36b78de..c792cc9c66c 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -70,6 +70,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-Revert-shared-shell-Don-t-init-input-for-non-interac.patch \
            file://0001-tools-Work-around-broken-stdin-handling-in-home-made.patch \
+           file://0001-gatt-client-Fix-use-after-free-caused-by-reentrant-c.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-gatt-client-Fix-use-after-free-caused-by-reentrant-c.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-gatt-client-Fix-use-after-free-caused-by-reentrant-c.patch
new file mode 100644
index 00000000000..0fcbc0808a2
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-gatt-client-Fix-use-after-free-caused-by-reentrant-c.patch
@@ -0,0 +1,59 @@
+From 45c167591d04e2dfecf5b4642168e54c23abbd40 Mon Sep 17 00:00:00 2001
+From: Jinwang Li <jinwang.li@oss.qualcomm.com>
+Date: Sun, 26 Apr 2026 21:25:15 +0800
+Subject: [PATCH 2/2] gatt-client: Fix use-after-free caused by reentrant
+ client teardown
+
+btd_gatt_client_service_removed() can be called reentrantly via
+bt_gatt_client_unref() after the services queue has already been freed,
+resulting in a use-after-free.
+
+Reset client->ready to false before destroying the services queue to
+prevent reentrant calls from dereferencing freed memory.
+
+This was found with the following backtrace:
+
+    #0  match_service_handle ()
+    #1  queue_remove_if ()
+    #2  queue_remove_all ()
+    #3  btd_gatt_client_service_removed ()
+    #4  gatt_service_removed ()
+    #5  handle_notify ()
+    #6  queue_foreach ()
+    #7  notify_service_changed ()
+    #8  gatt_db_service_destroy ()
+    #9  queue_remove_all ()
+    #10 gatt_db_clear_range ()
+    #11 service_changed_failure ()
+    #12 discovery_op_unref ()
+    #13 bt_gatt_request_unref ()
+    #14 bt_gatt_client_cancel_all ()
+    #15 bt_gatt_client_free ()
+    #16 bt_gatt_client_unref ()
+    #17 bt_gatt_client_free ()
+    #18 bt_gatt_client_unref ()
+    #19 btd_gatt_client_destroy ()
+    #20 device_free ()
+
+Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
+Upstream-Status: Backport [commit d01616f0c276a441dad8afe4e8f7bb261b26ba0a]
+---
+ src/gatt-client.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/gatt-client.c b/src/gatt-client.c
+index 374e67c..3baf95c 100644
+--- a/src/gatt-client.c
++++ b/src/gatt-client.c
+@@ -2261,6 +2261,8 @@ void btd_gatt_client_destroy(struct btd_gatt_client *client)
+ 	if (!client)
+ 		return;
+ 
++	client->ready = false;
++
+ 	queue_destroy(client->services, unregister_service);
+ 	queue_destroy(client->all_notify_clients, NULL);
+ 	queue_destroy(client->ios, NULL);
+-- 
+2.34.1
+

