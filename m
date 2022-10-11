Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BDAEC433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 16:04:11 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.9216.1665504242135129205
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:04:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Cla4UIrx;
 spf=pass (domain: mvista.com, ip: 209.85.214.174,
 mailfrom: vkumbhar@mvista.com)
Received: by mail-pl1-f174.google.com with SMTP id 10so13696315pli.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AC4eEm7yxg9NG5zxAIkKy/uM20egxYKjMU+bTlzJMpk=;
        b=Cla4UIrxPjfklLhLu8OpHYhDnP6aWpgdXD9vmH+iV8RK1TN8o81LBLDA11p7tcfaiX
         X9ToWF3HcgMJoEiGInFg4RP89zTaOLY9zqsGRX/auvbmEbHJ2a1ncAd2LI3lkDOI6p3c
         +2puXccbKfGL4FuHXhSFpy96FnbOfdZDZ37C8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AC4eEm7yxg9NG5zxAIkKy/uM20egxYKjMU+bTlzJMpk=;
        b=j5vNrdVF/MomGcKlZLKjDFHnckNaVhMSePLbOQEm0p74lroo+mxt91YuT3szIT4/BT
         DSGgpAD4nDkJcjsaU202d1C3/8RiLc2xC4UpZwTrfT4UHAFQZKR6I447zJWC5ucIyWXJ
         urC8YhK1eBMDLd4Oq6cIBI/U5ynkE4U7I3ZsXfYhEoOj2ia4Sc1OaPUwOI/yLazfZiEb
         JusdlXYze2eTQeJ1Yq2rT9M+Jus3CWJhHxsf5Xv2YSYnhuUCp2wuhU32juZv4JCEOZHE
         qDEkCNhLTLoQeaMCNc2EyNKlfYWyZHkEjLkdy62nY1n5KLfY/5VOX9r93wF78fpU1QiV
         9Gig==
X-Gm-Message-State: ACrzQf28YxBzTAIRTI8m0RNxaKgL8CSFRwtStwWCZEzg3sAmW43I/Pyq
	O6ATs26sTOtuCEFwtOEmCXm8RuxgCR9z7Q==
X-Google-Smtp-Source: 
 AMsMyM6bB03XlPLajWZ7zYgwnxXxhNxRQXuZEZc8uIRE++0JenHd26bOmdEWx38NxMXPX/LJPgQTXA==
X-Received: by 2002:a17:90b:1e0b:b0:20d:7ddf:9b08 with SMTP id
 pg11-20020a17090b1e0b00b0020d7ddf9b08mr1219061pjb.187.1665504241293;
        Tue, 11 Oct 2022 09:04:01 -0700 (PDT)
Received: from MVIN00002.mvista.com ([14.102.17.18])
        by smtp.gmail.com with ESMTPSA id
 r32-20020a63fc60000000b00454f8a8cc24sm7950201pgk.12.2022.10.11.09.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 09:04:00 -0700 (PDT)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][dunfell][PATCH] bluez: fix CVE-2022-39177
Date: Tue, 11 Oct 2022 21:33:36 +0530
Message-Id: <20221011160336.39990-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 16:04:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171631

Source: https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=e2b0f0d8d63e1223bb714a9efb37e2257818268b
MR: 122138
Type: Security Fix
Disposition: Backport from https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=e2b0f0d8d63e1223bb714a9efb37e2257818268b
ChangeID: 680cf2af29d34d7925523e413b40008a71b0a26c
Description:
    avrcp: Fix not checking if params_len match number of received bytes

    This makes sure the number of bytes in the params_len matches the
    remaining bytes received so the code don't end up accessing invalid
    memory.

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 .../bluez5/bluez5/0001-CVE-2022-39177.patch   | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-CVE-2022-39177.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index f34ba0dce5..f7d5f57c75 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -52,6 +52,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
+           file://0001-CVE-2022-39177.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-CVE-2022-39177.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-CVE-2022-39177.patch
new file mode 100644
index 0000000000..54709e0cb1
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-CVE-2022-39177.patch
@@ -0,0 +1,34 @@
+From e5c8613fe171f0dc3aa812270bb15063aaa73d45 Mon Sep 17 00:00:00 2001
+From: Vivek Kumbhar <vkumbhar@mvista.com>
+Date: Sun, 9 Oct 2022 21:06:51 +0530
+Subject: [PATCH] CVE-2022-39177
+
+Upstream-Status: https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=e2b0f0d8d63e1223bb714a9efb37e2257818268b
+CVE: CVE-2022-39177
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ profiles/audio/avrcp.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/profiles/audio/avrcp.c b/profiles/audio/avrcp.c
+index d9471c0..0233d53 100644
+--- a/profiles/audio/avrcp.c
++++ b/profiles/audio/avrcp.c
+@@ -1916,6 +1916,14 @@ static size_t handle_vendordep_pdu(struct avctp *conn, uint8_t transaction,
+ 		goto err_metadata;
+ 	}
+ 
++	operands += sizeof(*pdu);
++	operand_count -= sizeof(*pdu);
++
++	if (pdu->params_len != operand_count) {
++		DBG("AVRCP PDU parameters length don't match");
++		pdu->params_len = operand_count;
++	}
++
+ 	for (handler = session->control_handlers; handler->pdu_id; handler++) {
+ 		if (handler->pdu_id == pdu->pdu_id)
+ 			break;
+-- 
+2.25.1
+
-- 
2.25.1


