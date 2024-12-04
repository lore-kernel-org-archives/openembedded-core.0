Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EAC4E7716F
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 06:49:41 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.8146.1733294975017936668
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 22:49:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KvfH8WbC;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4349fd77b33so52682875e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733294973; x=1733899773; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+fyuWaOHhNWZ7gkM0etO2QEqcB0CjhzL8ribiyrYH0k=;
        b=KvfH8WbCIqnAzkIg0mvKn9+NedZEaAsCcJOsZoVoS0aDxFvxgs2dZ4dA3d1PijFwz2
         ZmpXHbgKZeILxefSPhoj/Pu16Zz/mwvcoCgMJ9I+MbiTh6kz0g2aFYuuHjyR7k9H0QjS
         2wYsSnA4KluZyHfUOwUQOQ0tOE9B+xLlkOSLfLP3v7zSGX7tVKeEHXzYD35IR+VlooEe
         QOsuROt5js5XnwUZ/2cn4FqWsIYoPKLSbDeTC+HDpEijuV4bT6BU/nuqLO/ZYYX2HFH0
         K4tCzK23FNbSJMEwiJge5RbjML8mtnMYckJwCbsoA85uOZaArmeyAmpHcPx0xaTBt2ik
         It4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733294973; x=1733899773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+fyuWaOHhNWZ7gkM0etO2QEqcB0CjhzL8ribiyrYH0k=;
        b=b9QzP2H3YTFZ87UuPcKovxW329MMA8OBuIJ19TPsUEaea86neoe3S1jM9OCj1hct11
         lwT7exiKUJhF9/N/BKPVydhypGe5Xp1bK1AdqwlEOta5hkyUADt6FBfE7vDI8adA98vn
         qH2PT4gkCMEh7YYDfB2D9DfwaqU04+vh7zDdsyAyvl3Mm/UmthDLWszzM2yZbwd8qEtt
         FuLAnwzO5yOpVe3xYA95EeEufAkqhR9qG/OFGooo1wN/ocwWB37s+e7rgTVssfb1tDcc
         hqLPNkOI2ipLvvEwoG2ptNS8wLRwKYYzqLlt14LBbMSTl8vm33w74aSk/tNnl/YvmzLY
         sOyw==
X-Gm-Message-State: AOJu0Yz31uWtsfiOGhvhmDzfbEQ94xr/D/ErEqE38rISJXMFbdqYas4N
	UKu7BqHouMK2iBufQpmXv151l34Qo1NQG5Cn6iYY1SIH702U4Aq552P+8Q==
X-Gm-Gg: ASbGncut11lXZhtnsg2U/PmJGAwPFrEB1a+d+nPWrYD6jqlT/nv5YDxq35d+Hi6keu/
	WbiIlqCqTn8pW9MIsinUvPBwSTMqTjLjMChLpGk1GQONIZYEAQtcrIt9arMKG75CSEJ5B+l2rGu
	GKSNgon1zXB19kHY8Se5WHoZgoFGaJ7Mo9NCLw8Lz6NirKsMGhn8g4EwIPSi8icHBIo0dLrZVP1
	OgRi1p/kO4XNtctavPCEGzY2u35xeoWIdzZ/ByfVmAGyl41czqJoWB98pWoTDOJkj3R79svNnVt
	VaJ81bGhdX4=
X-Google-Smtp-Source: AGHT+IFoj8NQuzW8wPD1nUhEsL3FMZw8E9YDld2Lfx56q7PqN/PQH7n6TgG+DC8yGr6tb3XMoqIFtA==
X-Received: by 2002:a05:600c:1ca2:b0:434:9e1d:7626 with SMTP id 5b1f17b1804b1-434d0a03d92mr43111855e9.25.1733294973372;
        Tue, 03 Dec 2024 22:49:33 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f343f293sm7435757f8f.36.2024.12.03.22.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 22:49:32 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/37] gcr: drop obsolete autotools setting
Date: Wed,  4 Dec 2024 07:48:48 +0100
Message-Id: <20241204064920.817016-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204064920.817016-1-alex.kanavin@gmail.com>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 06:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208234

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-gnome/gcr/gcr_4.3.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-gnome/gcr/gcr_4.3.0.bb b/meta/recipes-gnome/gcr/gcr_4.3.0.bb
index 6c620dc391d..dcd8658d9cb 100644
--- a/meta/recipes-gnome/gcr/gcr_4.3.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_4.3.0.bb
@@ -11,8 +11,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 DEPENDS = "p11-kit glib-2.0 libgcrypt gnupg-native \
            ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'libxslt-native', '', d)}"
 
-CACHED_CONFIGUREVARS += "ac_cv_path_GPG='gpg'"
-
 CFLAGS += "-D_GNU_SOURCE"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
-- 
2.39.5


