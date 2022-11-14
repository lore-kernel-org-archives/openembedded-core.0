Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6AB2C4167E
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 19:01:26 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.755.1668452476914074796
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Nov 2022 11:01:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XuvtuF3A;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id j5-20020a05600c410500b003cfa9c0ea76so8617122wmi.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 11:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMXEms9tNm8B7Ja5vY+dYwfSQWv22vj6as0oF5KhWOo=;
        b=XuvtuF3AdvTB5w38YEalvi1PTTXniu4StmctxsJhPy5h0qCbH8gzAKdJWPcQY1J2pO
         7pu386NmS83BAEP8xSAfCthFOB2Jl7y/I30UdJJz+P2fhF67Ooeb3CIPA5SLkkvQ+8By
         skc0kZO5pWeG3B1Bo8UDqIal3ALRMFU92gEV7RpN7DmqNmA1xLSU8gJ0X9L8ekFOgo5f
         ranCLELekae+cGIlMYo80XrZDDVO3Fa5BXKlhzV3GFzBP7ls9jurVWEoKtJElKjzYFBl
         orYEdYhJQoIbqbRlYkeYCTr2BOrKKOYC6nuiydIgmYc778zOg6zt4vZjfJLFibVBBPU6
         4cxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aMXEms9tNm8B7Ja5vY+dYwfSQWv22vj6as0oF5KhWOo=;
        b=3Pq9ORXI7R+QRSUjGX5mpG+FLYhRM39/GaBSo5CPp2UpQ54MV2kCePn0pU8bX3F/mx
         VlI8yZiIBei+vfmNRN8nkoy6eLII5s41c+9t6yLxq8yoIBD/7Iz2a+n2Sgobv67d72GV
         MCSsA/RSI4C2Mzf+ciIc77c4P4s1TW5eKeGZmnjQw8gvHNYYpsyT5iVN0gAXNS2Srh7o
         QvqycyXZ5jyc+WMnnuInlnpYAvzAReJchhiQdES/JomL6GHL8mWzLfpAmmT2MN1QojH5
         yM12+73jJvKtF5K3586r737nVfljMK0LcmwOSGjRewdUKbPcTZSlBBlWafvYxKmoGHDB
         H3rA==
X-Gm-Message-State: ANoB5pmcgZFzk5tV4K2cQvNkMD517Zx4kjOrauzhfcA0oTjkPm1HdUon
	/y68Nr3BpQaePJSye6xGTJtK+J7a07M=
X-Google-Smtp-Source: AA0mqf5XAraEone41HlyU5zhInxk4uRZ8FXYtAdvocSxJvD/2YUZmoLNbzQSPr5IVh+EcbTIgTh2Rg==
X-Received: by 2002:a05:600c:4e54:b0:3cf:7981:9a7 with SMTP id e20-20020a05600c4e5400b003cf798109a7mr8969363wmq.87.1668452475383;
        Mon, 14 Nov 2022 11:01:15 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id c7-20020a1c3507000000b003c6f1732f65sm18091811wma.38.2022.11.14.11.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 11:01:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/8] glib-networking: update 2.72.2 -> 2.74.0
Date: Mon, 14 Nov 2022 20:00:51 +0100
Message-Id: <20221114190056.2612669-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221114190056.2612669-1-alex@linutronix.de>
References: <20221114190056.2612669-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 19:01:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173256

glib-2.0-native is needed for gio-querymodules executable

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{glib-networking_2.72.2.bb => glib-networking_2.74.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.72.2.bb => glib-networking_2.74.0.bb} (91%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.72.2.bb b/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb
similarity index 91%
rename from meta/recipes-core/glib-networking/glib-networking_2.72.2.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.74.0.bb
index 746d1bc39c..dc0be23357 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.72.2.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb
@@ -7,9 +7,9 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SECTION = "libs"
-DEPENDS = "glib-2.0"
+DEPENDS = "glib-2.0-native glib-2.0"
 
-SRC_URI[archive.sha256sum] = "cd2a084c7bb91d78e849fb55d40e472f6d8f6862cddc9f12c39149359ba18268"
+SRC_URI[archive.sha256sum] = "1f185aaef094123f8e25d8fa55661b3fd71020163a0174adb35a37685cda613b"
 
 PACKAGECONFIG ??= "openssl ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 
-- 
2.30.2


