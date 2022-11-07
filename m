Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 856CDC4167D
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:55:32 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.4287.1667832926771685340
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ex3pl3IJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 187-20020a1c02c4000000b003cf9c3f3b80so2299496wmc.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ouyimvlA6Lf9p3/ZaBhZXN5yZ4z5KOwexQK4O6l7ggY=;
        b=ex3pl3IJuuJERcaJg1PIblUsHUAgwR5OziM/1JINHI5WI7AgBKn4im5NfCHwpulAbm
         tDByues3qcLyIbGpXORceps58/cjzPhQjulrYAgN41+Gj73KModL+RBf9zmn/rLo/cBX
         7SHKZQO1JwArzYSbSHvBazw0YcRzTmxp2D8h5GudTA3Xq/iBM2zehauDeUh3p8UD68f7
         FnQij9Fb/w8XK8a6z8+mH29a0G10TZfGeceu9FK8WAPujg1cBrAMp9eaPpoapY2pXn9y
         NnvQFSWWzDPcWJWCCCY2pUp6dZHJj8eBgcfdEKTb6eWO0lK3PyC6k3HLPBj+tjg6UQ4p
         Zabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ouyimvlA6Lf9p3/ZaBhZXN5yZ4z5KOwexQK4O6l7ggY=;
        b=s1AE6FIYmP/yN/y4b3WKjMT4qmQ0XUtTC6xOTLJXHnBj42F5yatTTSijBsVocAyq0q
         c0YDZXlSpUxCLbWwtpc5VPzYxrmpvV3+YIWUzJHwWGN/eJotOdSjq6CKgy0GU3rl2JJT
         OZaVwALM5glOKUm9X4c6JBHjVLHVgHPlKswQCc3aWi1dNr4wzGwZgFhD+Z6rxptkqhPn
         5tBdSkw3FsNett6CtUxFHG8Fs4q1RDMACWYceFB6ZIwtKzru3lfm7bXhGFqA2KPY8wxw
         t7BuFLjytQwuCaMpWcgjkztPrGE2YP9s8QK+sFd5F9OiZvq5wjg3rIoV8WTU1mIqHWOJ
         8cEQ==
X-Gm-Message-State: ACrzQf0Dz43Ny+8dzGUPQSBCFFFaPCiUP4Jnx9FlhpTOSnhh3b0KrnKn
	t7i82kn9e4pN7IIAaL0EOgj3SVza+cw=
X-Google-Smtp-Source: AMsMyM70AOLtEzIOBm0MyofQRKibwUD8iaeI0B6WYYkkjZjRJ5aLzOr4oYor9fjqlNxdXGMiJrmWOw==
X-Received: by 2002:a05:600c:654a:b0:3c6:f83e:d142 with SMTP id dn10-20020a05600c654a00b003c6f83ed142mr33004242wmb.147.1667832925311;
        Mon, 07 Nov 2022 06:55:25 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:24 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/48] libsoup: upgrade 3.2.0 -> 3.2.1
Date: Mon,  7 Nov 2022 15:54:33 +0100
Message-Id: <20221107145508.1051404-13-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172863

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libsoup/{libsoup_3.2.0.bb => libsoup_3.2.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libsoup/{libsoup_3.2.0.bb => libsoup_3.2.1.bb} (94%)

diff --git a/meta/recipes-support/libsoup/libsoup_3.2.0.bb b/meta/recipes-support/libsoup/libsoup_3.2.1.bb
similarity index 94%
rename from meta/recipes-support/libsoup/libsoup_3.2.0.bb
rename to meta/recipes-support/libsoup/libsoup_3.2.1.bb
index 60fbea5504..d14667ea8e 100644
--- a/meta/recipes-support/libsoup/libsoup_3.2.0.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.2.1.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
-SRC_URI[sha256sum] = "2832370698ca8f9fbf174c345b73d89b60561103a626c2df70726b0707f79bd3"
+SRC_URI[sha256sum] = "b1eb3d2c3be49fbbd051a71f6532c9626bcecea69783190690cd7e4dfdf28f29"
 
 PROVIDES = "libsoup-3.0"
 CVE_PRODUCT = "libsoup"
-- 
2.30.2


