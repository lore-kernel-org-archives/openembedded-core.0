Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B129C4708E
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:42 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.9383.1672830373513666754
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PO/HR49U;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id s9so553814wru.13
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1m3lU0Y6CuAJRVuxOpKfnpOjbPScV1gZ+ibBG76E6VU=;
        b=PO/HR49UAwYoU1OoLJwi340vIv6FKlGMTZcNwT416qVV4L0dmtj31Prox0xZ142212
         K1K9rmN8qN3QfKahsEYjcxlYcf1El+dYfu2sK0DlSERsLvELqjHHd3ydx4pYi8j7bjCY
         POt7B18Bjjg1V45hXoXrkdRUU30+gcZC5cqz/NVwt0X28GOdhefEPtsrRBwJo9/gpzej
         7yG5ynu9ZZb3yLLTbsHWwS94iKebN40/GWh/JZRpbrRcbeAEsXEgW+yoUMP5zCELN5Ej
         CdhxeqEbukujkUGpNwcAeQq+WlsXNzVRtx42qjyGBNY1Mt6f4NZ7LcPDFbc+fHTXSdw7
         BEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1m3lU0Y6CuAJRVuxOpKfnpOjbPScV1gZ+ibBG76E6VU=;
        b=HyFgpR/dGJUjhivLwHWpNQSWN3l7mkyZh2F93O6CC7FFrWCNj0g5RRlLMLvtWTRAHL
         1xkZcUlK9nQZf0G1BP8dNmJEoNKIKzb5XWSIze04u+I3rY5FqZVYguS8tZNWZJTxWUsn
         YEyCuFVEOo73+IbgL3bEdPsIrE+/vrgD0ecZqdZdiBKV8clF3nNCFzrINEtGeLxz9iTd
         6ZzgpwUJzVUscFblKC2fagRE851gP0vTWnGOOqLNA3pWJaIWnIWjihxJCn3r6P6ahWlu
         V8DCn1OHKtby3lOpXgio+GZNIqBvnF7a9MqiZ8xBvTe0murk1VaenRjDsVC3QzUlDp8r
         OE7g==
X-Gm-Message-State: AFqh2kpxA0I5kcxXlommd0+XoNB8owRBkua/D75hAFB3sHVjNVl+Z7lc
	y85Dr6IF6XY94YMQCqe2t6zpzKWDVhE=
X-Google-Smtp-Source: AMrXdXuet63i1O/wNlVnNZlfKbIfLpg3LhH3keqL4gNJR5pwXmOsjRUXpE4mbDLiykjJU6XmMI2+jw==
X-Received: by 2002:a05:6000:102:b0:2a4:a315:dfc5 with SMTP id o2-20020a056000010200b002a4a315dfc5mr822845wrx.28.1672830400541;
        Wed, 04 Jan 2023 03:06:40 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:40 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 63/77] kexec-tools: upgrade 2.0.25 -> 2.0.26
Date: Wed,  4 Jan 2023 12:05:34 +0100
Message-Id: <20230104110548.2537259-63-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175448

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../kexec/{kexec-tools_2.0.25.bb => kexec-tools_2.0.26.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.25.bb => kexec-tools_2.0.26.bb} (97%)

diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.25.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.26.bb
similarity index 97%
rename from meta/recipes-kernel/kexec/kexec-tools_2.0.25.bb
rename to meta/recipes-kernel/kexec/kexec-tools_2.0.26.bb
index 9784404cff..bc83afb5b6 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.25.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.26.bb
@@ -20,7 +20,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch \
            "
 
-SRC_URI[sha256sum] = "4eea6f8641ea3e349653a52c7fd33be1132322a5f3dc9f1a6ade886019767320"
+SRC_URI[sha256sum] = "89bdd941542c64fec16311858df304ed3a3908c1a60874d69df5d9bf1611e062"
 
 inherit autotools update-rc.d systemd
 
-- 
2.30.2


