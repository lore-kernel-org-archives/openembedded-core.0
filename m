Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DBC2C25B0E
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:43:06 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web09.22276.1659940975209834636
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p6YsGukY;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id gb36so14772574ejc.10
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sN6S7+xCOPwHUx4Y+ivn2/P4eo2cNhwHvXmG9nzi1Ig=;
        b=p6YsGukYnK/QaNGXJ8Cx5b90Lf/m5XKfOfAI/ffgi9l9NJ3pP+Vm3jPMbJD3Dum2vK
         cME5aGZiUqMo2oXj9atKUYcMiW6hrJ6IVUSAT4KsopxSYDzQ2zKp0FVr33/bKj+sXhey
         gj5E2IOXMnbrBcVsw69YirWCreYtcml7IFKU1sXZYxTDkM36LhUERkFDfa8VcqoLZnt2
         j/RZKCq98h4Q7LUWZ17aAmMzJO+HUZlwGtZhGSKO6WKgHVeW+XMV/jyK671tK+bkXX1r
         41kPlWdcTv7KoV0+RgFojWm82qZEPMxkgqkNSwBIpwVYd7wHgPQg7rBZlxjH3kZR9mdk
         hq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sN6S7+xCOPwHUx4Y+ivn2/P4eo2cNhwHvXmG9nzi1Ig=;
        b=xrcTpTzxtlZNVN4HxDQcl+3tWVcQC1n7L7lyQek89aqKjGid15qmUYxjR9fvlq9lbj
         324Ek+D1y7MbTn9nZ1Ey8ITBOEhJSlurgIE8usuMWDFIf2J9YkUtT67h9mgdpBUTsoGQ
         xn2qItkYlHuOduqa6DM1hm57JiKkaLp+IOiUIMSKef2k3iZnoJutNiWKdEW0lDe1hY9l
         Am51Gfq31x/ZsPo8NIV2lEdPOiFc0luRR+lIMWDJMzEh2ZLyPZnb5OxVzTjD05Srby7a
         JLvZaOjOc7/QnBQFpGfq4+7qIH1InIeVzc9Yp4wjI1yHCVIHoUDQjKpP+PEfz5f3PzLF
         nVdg==
X-Gm-Message-State: ACgBeo2EItNbyOrPylVBnFWAkaxwNmv2Q4bBi9g/anxdznzEG+TRN1nd
	93uY3csrkUln6Vph273K5xw9CkbPDgo=
X-Google-Smtp-Source: 
 AA6agR5Rmqa2QqrON6RzLWW/FPpuC+C47OmGb2LUyYbCG2lA/LyB3ftDB92PLTMuM72vHk8M6Ztmew==
X-Received: by 2002:a17:906:58d5:b0:72f:2b21:eb20 with SMTP id
 e21-20020a17090658d500b0072f2b21eb20mr13435461ejs.508.1659940982244;
        Sun, 07 Aug 2022 23:43:02 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:43:01 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 24/44] libnotify: upgrade 0.8.0 -> 0.8.1
Date: Mon,  8 Aug 2022 08:42:17 +0200
Message-Id: <20220808064237.3975347-24-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:43:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169048

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libnotify/{libnotify_0.8.0.bb => libnotify_0.8.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libnotify/{libnotify_0.8.0.bb => libnotify_0.8.1.bb} (93%)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb b/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb
similarity index 93%
rename from meta/recipes-gnome/libnotify/libnotify_0.8.0.bb
rename to meta/recipes-gnome/libnotify/libnotify_0.8.1.bb
index 9c9af87e1a..3bdc70d224 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb
@@ -22,7 +22,7 @@ inherit gnomebase gtk-doc features_check gobject-introspection
 # depends on gtk+3 if tests are enabled
 ANY_OF_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'tests', '${GTK3DISTROFEATURES}', '', d)}"
 
-SRC_URI[archive.sha256sum] = "46a26f0db4e64cf24016291eb1579ed9f0ba7611fe6cd9e1afec8f42780d3924"
+SRC_URI[archive.sha256sum] = "d033e6d4d6ccbf46a436c31628a4b661b36dca1f5d4174fe0173e274f4e62557"
 
 EXTRA_OEMESON = "-Dman=false"
 
-- 
2.30.2


