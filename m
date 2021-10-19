Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5258EC433FE
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:59 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.11401.1634657698712926551
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZW+T9paG;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id
 y74-20020a1c7d4d000000b00322f53b9bbfso3344736wmc.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kLIwgW7jAseselFfwbjI0XDakV6mkkyruT7PT6Gv7/A=;
        b=ZW+T9paGZd24CGtqmXBlEtDzNCNKoJLMN5rqQpVqD0kLq2E92glb8Z11WD4RCzlO3n
         dNNn8Kj342ReeRf5ccS6rZ5yXhjDyN0WowTdNnxPt7BBoBQ6TadTxJ/ySDqvS3/IuFIS
         rOnoabNC6dEkS4amZwVDV9QSSt25/9MgPooFTFOTW/xptY14xg/IAuYMUGlu/RcIpBac
         HQc4zFeUvZ6HOvCm7Ua4E6mUwWNslQwmWpJQAIG09jUza1zf5xPkRu3h2Mm9hPwCP6VU
         vTx8GXNuATzmwqwVUdi0rG1eMy7GNR82mXsMsWqvh+s6V3Xb0bMGhmggjfEqpw8NIiyv
         FI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kLIwgW7jAseselFfwbjI0XDakV6mkkyruT7PT6Gv7/A=;
        b=l/j1qN/dyP/8Ws4SozZfrdJ6zOlSm6knx9xHMpfGoxZ98SfRn0EPvZhaLE3WjLA5uk
         OWfvxump2gPTo/ypG+WBSrP88fDdzBsMsKy6xWEgGe7znTvaNvPJ2J5vuhvINmv6UrIN
         PcfOdGdheH/7m59czUv3OpFvP8+DxFNoKfAWoRhwnTn4LxWPIAW0/ETeLY58w66MVsvs
         WwOqw3hvhGSKRsbCcPZYcQEU/DZoXkVAfIvbnGmwru3Mkr4VvtAm1mZiOOistrMbv+Db
         NlCR9zCh9CdBgdmL4dNqxDD6wUW4qLkkim3zU3apiM/NR7xkT3ofS/rvc2CGqwWr4aJX
         ouKA==
X-Gm-Message-State: AOAM532bYgodIVnnfNHUcKynBP86lmzPjL8MBmJ6JDQMB1mtY0OpZSLN
	Ii8ZuNFqbpH9UPO3+Uk5gzju4C4rVcM=
X-Google-Smtp-Source: 
 ABdhPJymAm64aZnbBPSHoiTzAYemmmdoCCbN5bjaMUqVI8fy1uxwXYPCIVT1IeF0s3alsN4EIWyF7A==
X-Received: by 2002:a05:600c:4305:: with SMTP id
 p5mr6817641wme.185.1634657695806;
        Tue, 19 Oct 2021 08:34:55 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:55 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 45/65] json-glib: upgrade 1.6.4 -> 1.6.6
Date: Tue, 19 Oct 2021 17:33:59 +0200
Message-Id: <20211019153419.3319802-45-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157164

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../json-glib/{json-glib_1.6.4.bb => json-glib_1.6.6.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/json-glib/{json-glib_1.6.4.bb => json-glib_1.6.6.bb} (92%)

diff --git a/meta/recipes-gnome/json-glib/json-glib_1.6.4.bb b/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb
similarity index 92%
rename from meta/recipes-gnome/json-glib/json-glib_1.6.4.bb
rename to meta/recipes-gnome/json-glib/json-glib_1.6.6.bb
index 072c2406c7..c3572a16f2 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.6.4.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb
@@ -19,7 +19,7 @@ GIDOCGEN_MESON_ENABLE_FLAG = 'enabled'
 GIDOCGEN_MESON_DISABLE_FLAG = 'disabled'
 
 SRC_URI += " file://run-ptest"
-SRC_URI[archive.sha256sum] = "b1f6a7930808f77a827f3b397a04bb89d4c0c0b2550885d4a5e4c411dfa13f5f"
+SRC_URI[archive.sha256sum] = "96ec98be7a91f6dde33636720e3da2ff6ecbb90e76ccaa49497f31a6855a490e"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native xmlto-native"
-- 
2.20.1


