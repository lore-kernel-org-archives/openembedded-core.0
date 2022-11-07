Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE700C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:55:52 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.4229.1667832947549542280
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LvyB/ZNP;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id v7so7061000wmn.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7cZgt0Dv0mwKFm68NP1dKy/Q2ODKdwGEjYeSODYmbc=;
        b=LvyB/ZNPhRwnzpcRFUBO34zP+ApcptG9pKcZ6EhGYJeR5ojyho4HcZbG0KHinK6/3N
         1i0sDTFK1h3pN90TwolDnF0tziBxKBJnvOmNsXkctQVKoS9bfFbG9XeCFH9wptF4a0sC
         604Y/0hlHg4n1MmYH98F8icGcBU2jUGSqK6T/rDqkf7fWr7d5WSddwJRU/2+ZKjL1s2m
         XSwibwInYX+iyb+DWJejPex1b5rHmjr8sIE8iqFffRyP4823waZt0U+He/SCvzWKEnVi
         wrgADpG5mftId6icCj1jP0xkMM91KhXH91TWoduFqdpvkeeLZO9oYsSTTeCESdkpDDtS
         Z7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F7cZgt0Dv0mwKFm68NP1dKy/Q2ODKdwGEjYeSODYmbc=;
        b=niBSqyvU2uLl7Ig5razKghemcXkgCyhE+0MYjOFzSbKcAT7Z/qphd2xYo9DxApR8Gh
         rftdGhZLowozbsw80sMJIYufv21Ox8UPV58wFF13MsgmzR9nCA7ynDj2xBCkaSSFTNHl
         WoaKPQKjaIVZtQWJNNXqqojntzVqE7xBfIOAqrwVN4T4tTrbKEYtWy1Id8bB/8O44cYX
         IKgPGroSoAw5RjJs7izPQk7kBprI96tZOkk3jgnPJYqVbt7Wuw31NQo/lMQwnERaWnXX
         GY9FCnHvrpXk0v1/7MCesIdXZfIFO6zlLjfRdaSnayl4Yvw1tqP/K/GVuzE3FUYVywG4
         Fdlw==
X-Gm-Message-State: ACrzQf2wh3nwU6C7FkXoR+lS6151N/406efNkl/0/KhUsYbMh4S2aqpz
	CTfoNZikfY5aCVeZH7+aZR4/VqOX89k=
X-Google-Smtp-Source: AMsMyM6XMavFfgdzwSXfBuIxBNXy6Er/6I3IYvdfxMaiDNhyJkyVtpe28t1+ukP64ar8ZD0GtSl0nQ==
X-Received: by 2002:a05:600c:654f:b0:3c3:b5b7:43a9 with SMTP id dn15-20020a05600c654f00b003c3b5b743a9mr44311703wmb.201.1667832946037;
        Mon, 07 Nov 2022 06:55:46 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:45 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 32/48] libsoup-2.4: upgrade 2.74.2 -> 2.74.3
Date: Mon,  7 Nov 2022 15:54:52 +0100
Message-Id: <20221107145508.1051404-32-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:55:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172882

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libsoup/{libsoup-2.4_2.74.2.bb => libsoup-2.4_2.74.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.74.2.bb => libsoup-2.4_2.74.3.bb} (95%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
similarity index 95%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 6ff393c9a3..79281fbf5b 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
-SRC_URI[sha256sum] = "f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b7823b6018b40d01159"
+SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
 CVE_PRODUCT = "libsoup"
 
-- 
2.30.2


