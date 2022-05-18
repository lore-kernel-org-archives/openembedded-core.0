Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25B21C433F5
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:26 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.3543.1652871558006799806
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ou2Xfxty;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id i40so2471928eda.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ddP3XrfwLv2nV7GNwcDOACv/SpnpOzr/7inG3BdaNDE=;
        b=ou2XfxtyN82/FXA5sbkbrDw2sTaXwq6Jl1F+/RcVuIRcvc0g8YETRU0Aq6aaGAHR0I
         98n7/D6f8K9yFwxL+ug1MIXHaH9cvC2BjM/+0h/vWbd/zXbVnJlmXBETAlb2jG6tJlv5
         i/BqcvvEfhWGNsXCnzixXgsjtXujM+fVSkesBg0RrLE9qvrwneIEiZ0XyvUoB6mmwxia
         mkjORAW7l2TJX+R5Hwe612NSNMVLhpafdfw/LaJ49k2JfqnKUC9iEe1qiE4MnDOpCJp1
         SyhMuXpm/wh/5m5ZGHV28fdhrUKqRZFSY08lrCaeZqStOb91Yy0UJVmdbmxLi/w/MLJY
         E19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ddP3XrfwLv2nV7GNwcDOACv/SpnpOzr/7inG3BdaNDE=;
        b=Qy1VwanuAsY1nO0DCRRb3azes++FnhmUAmyLnfL6GnYpflicsDgOwtowM7ua0EOH7S
         Byv7R983g5xT6KQv0YVw5sBfrGR487f6pO6PHNraM8Gg7e/fh+OywOcEWdSgo4XXdIMr
         KT+ODyINgTRZ3ppR2uxlUTjzo+KX+bq+l2Nl89lNEBu0ugR/xmJce/Vs5w3fwB7TsI0i
         ylWZ/o0EbRhU1KTupMVGRQZhxElEwuTn0H4swPHIyCyb2SFJyzR+IEP4j5GRrdlzTAYu
         qSMCAaMfuJJ5CXnd6mCdw9NW9QhuFJ8RTyZ7ARtldYGvqx1Rv30nU21NbMBcWkjVhH20
         zWLQ==
X-Gm-Message-State: AOAM531lqVBXZeCD1+guEKLWqqs/npBvRdYkbdzKeCUWRONZAlWYP2un
	h9F63/wWMYyVBAmvEaoems28JjN0E5w=
X-Google-Smtp-Source: 
 ABdhPJwlnpJ39ey23I9Sqfols4RwfY2pRlNKKRcPQ5211ES5QngZDKy7AyVl7awhF2iP7C8KOv1/0g==
X-Received: by 2002:a05:6402:2815:b0:420:c32e:ebe2 with SMTP id
 h21-20020a056402281500b00420c32eebe2mr24295956ede.1.1652871556606;
        Wed, 18 May 2022 03:59:16 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:59:15 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 29/49] libnotify: upgrade 0.7.11 -> 0.7.12
Date: Wed, 18 May 2022 12:58:23 +0200
Message-Id: <20220518105843.3299331-29-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165826

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libnotify/{libnotify_0.7.11.bb => libnotify_0.7.12.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libnotify/{libnotify_0.7.11.bb => libnotify_0.7.12.bb} (93%)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.7.11.bb b/meta/recipes-gnome/libnotify/libnotify_0.7.12.bb
similarity index 93%
rename from meta/recipes-gnome/libnotify/libnotify_0.7.11.bb
rename to meta/recipes-gnome/libnotify/libnotify_0.7.12.bb
index 54f3e2c9ba..21e737fd45 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.7.11.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.7.12.bb
@@ -22,7 +22,7 @@ inherit gnomebase gtk-doc features_check gobject-introspection
 # depends on gtk+3 if tests are enabled
 ANY_OF_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'tests', '${GTK3DISTROFEATURES}', '', d)}"
 
-SRC_URI[archive.sha256sum] = "dd5682ec68220339e11c5159b7e012204a318dd1b3683a09c482ca421ab07375"
+SRC_URI[archive.sha256sum] = "744b2b37508135f8261b755a9debe6e09add421adc75bde930f6e198b70ab46e"
 
 EXTRA_OEMESON = "-Dman=false"
 
-- 
2.30.2


