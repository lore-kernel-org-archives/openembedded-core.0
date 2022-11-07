Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA06C4321E
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:55:52 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web09.4344.1667832951273061268
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M8P5XKmc;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id r132-20020a1c448a000000b003cf4d389c41so166245wma.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OaZ6xw7Tgp5Hogu0Feo7YcdBjvP1c+aftIFGerp4xUQ=;
        b=M8P5XKmc1BK+eO9fXfMgk/U1aHm1Sk0hRu/3NTGLTGY/K/AuiJRmnOF5h3BwVMSlJ1
         8dCNFgBq/88mNCRxCRrOM6xQxov+u5D6wmApAFfiArbA6cTmdGZne/lRtxzhCM7wuOxF
         V4DOLt+FWweQYTlUNniZ6mpwuEqserCGzfjCb1Kb56j7qJp5tUAUFgK8UV4Ms8yeFKzN
         xRvgIBnc+KPwpzxVjym+HcqsWD9P0WB/mymUEEGlxsq68tKHsDl+iE3EG2uBFD77+3EQ
         ZT7jLZnJh26xqAjLKk0tN0XcAGqOGEImaNXhlIDyRpCUt2C4Fqk/PNbkHWgv4Z2jCan7
         ml9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OaZ6xw7Tgp5Hogu0Feo7YcdBjvP1c+aftIFGerp4xUQ=;
        b=4DNKhkHHTbYTUJYpchTnaFIleGlruSKqr/PH4DiEp3gnVIvdRaSzVXlzPXc9SF2RxR
         yaUSI/5fXoyvYQQdlT4Tfv1Rhd5l3l/OfYWdLIGQP4AzVSATIxsQZ9yfEbCdPD7+lOE2
         FJMp6M2HhBtfkd71worfJ0g80zslDy059QNlatoZUQH7UOY+3pZGoPhximqfDV+291k1
         tL5P/bt4zEeSav7Ik4OgFBSjVl+t/Z4aCXTm60zbGTwoLF9q833zonObc/HIEnE+l2o8
         zuU437hlvryNEl032uM7LZ797Ta2WXOU+GZI21NadRBbJfNmIP7Xjgqt3Vg6It8Zrb+D
         /4nQ==
X-Gm-Message-State: ACrzQf2dIc5rm1qaz1G52U8b0617YmqI7GnIfsWxZ1MUp+4ywsCZiBOd
	YDtGEB+15FKCZWrSIkg2JeIhTAXETK0=
X-Google-Smtp-Source: AMsMyM5QK5yVxcDWLAfgCuJQDAqhP1mx+Bt8A2fd4fcHG0lOpsU9UqQHIlvKKCVtXn8pY0RkZdg3Jg==
X-Received: by 2002:a05:600c:4f49:b0:3cf:82b9:2fb7 with SMTP id m9-20020a05600c4f4900b003cf82b92fb7mr22314135wmq.198.1667832949631;
        Mon, 07 Nov 2022 06:55:49 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:48 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 35/48] netbase: upgrade 6.3 -> 6.4
Date: Mon,  7 Nov 2022 15:54:55 +0100
Message-Id: <20221107145508.1051404-35-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:55:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172885

License-Update: formatting, copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../recipes-core/netbase/{netbase_6.3.bb => netbase_6.4.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta/recipes-core/netbase/{netbase_6.3.bb => netbase_6.4.bb} (77%)

diff --git a/meta/recipes-core/netbase/netbase_6.3.bb b/meta/recipes-core/netbase/netbase_6.4.bb
similarity index 77%
rename from meta/recipes-core/netbase/netbase_6.3.bb
rename to meta/recipes-core/netbase/netbase_6.4.bb
index bec6498cdd..5a448a4b91 100644
--- a/meta/recipes-core/netbase/netbase_6.3.bb
+++ b/meta/recipes-core/netbase/netbase_6.4.bb
@@ -3,14 +3,14 @@ DESCRIPTION = "This package provides the necessary infrastructure for basic TCP/
 HOMEPAGE = "http://packages.debian.org/netbase"
 SECTION = "base"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=78dd2c7c6f487348e4a0092c17a19d42"
 PE = "1"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.tar.xz"
 
 inherit allarch
 
-SRC_URI[sha256sum] = "7c42a6a1cafa0c64103c71cab6431fc8613179b2449a1a00e55e3584e860d81c"
+SRC_URI[sha256sum] = "fa6621826ff1150e581bd90bc3c8a4ecafe5df90404f207db6dcdf2c75f26ad7"
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/netbase/"
 
@@ -21,3 +21,5 @@ do_install () {
 	install -m 0644 ${S}/etc/services ${D}${sysconfdir}/services
 	install -m 0644 ${S}/etc/ethertypes ${D}${sysconfdir}/ethertypes
 }
+
+S = "${WORKDIR}/netbase"
-- 
2.30.2


