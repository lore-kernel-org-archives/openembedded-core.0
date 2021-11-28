Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F3CC433FE
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 09:46:26 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web12.46079.1638092785078759670
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 01:46:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Epl3gJaA;
 spf=pass (domain: gmail.com, ip: 209.85.208.182,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id j18so15202571ljc.12
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 01:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7pfXGJggDWSf/XdwGX175BXISzcZSV2L4SrWoMJy92s=;
        b=Epl3gJaAKPbNIYhiuBa/zRQ4WhrkDmIeVGJfvYUssG8ZWYvtrkPOvOoBYFyNj5uNQe
         gjfJnH995Lcp9d/tA4JwG5Bm5igA77vxXbrOxUp8+dZxCWMaBq/7ep4bfR7TPSht5ZaM
         Fndo/8GJt/kX4sOYBU9XBIEBIulYr4qPu1lPWowiZnLmewM7nKBIeNTUijIjkUwXCfgN
         NZXDi9Z74BoS+Xp17mQ4mUByEAHTPMP43ai5qlP6tmeet0z+GqHq9Fr/W1/BU1ouqE0W
         8c8imqPHlLTU/DToZuRl/hn3HJjmIXSyifEBQ6XAcIvFx9ASWguskrnnEoGyEu6EoS39
         CQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7pfXGJggDWSf/XdwGX175BXISzcZSV2L4SrWoMJy92s=;
        b=Boya4Cta/62QowUecadPa6QkTpO6TcrL8Ev4TEdWZO6gHU/PsNpRQQ+d3g+qil5/2N
         DbbBDxmb9luLKj74RNkUTv9Ng9sbyFDQ6aw9gCQpnv1S3KxPtWFiPHAu3LQtNrgWz9rR
         kCmJwSaDrx4wXRhels1Mutdezn/fHw0w3Ho25Fy82WCImVZ5/WmuV208uilma6L3D/Gd
         +kmmOsfk7I1XiYVmQpmuzpsxmpcAFpD7mrTd3ZaaonlhD+m7HH15dH+ZW2uD7T7ckA7C
         QbwU1VAcmZCYoUROPiQOl/JvlVB/jO1C0i/359v34hhqbovsAi6TlkTobvDG146ud69a
         NeFg==
X-Gm-Message-State: AOAM5322xxAplEn+G1PkCkB5hsGfzeKrPuYojPKK5uY/OiK1hlY0Hvc6
	YEl5N3vOImPT5cvqgSxgOprxNnlxS0RMqA==
X-Google-Smtp-Source: 
 ABdhPJxu6KMPOpLOukCXbe5nFDx8WoYaygUCsgq2tZo1RZy9qonuQxcYhLLbfr9GvPMWgLjHL8TAsg==
X-Received: by 2002:a05:651c:1548:: with SMTP id
 y8mr43271949ljp.458.1638092783507;
        Sun, 28 Nov 2021 01:46:23 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 k15sm1031749ljg.123.2021.11.28.01.46.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 01:46:23 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 7/9] util-linux: Improve native reproducibility
Date: Sun, 28 Nov 2021 10:45:30 +0100
Message-Id: <20211128094532.1145820-8-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211128094532.1145820-1-jacob.kroon@gmail.com>
References: <20211128094532.1145820-1-jacob.kroon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 09:46:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158874

Avoid encoding build-specific paths in the resulting binaries.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/recipes-core/util-linux/util-linux_2.37.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.37.2.bb b/meta/recipes-core/util-linux/util-linux_2.37.2.bb
index d609c30067..09f83eb4dd 100644
--- a/meta/recipes-core/util-linux/util-linux_2.37.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.37.2.bb
@@ -83,7 +83,7 @@ EXTRA_OECONF = "\
 "
 
 EXTRA_OECONF:append:class-target = " --enable-setpriv"
-EXTRA_OECONF:append:class-native = " --without-cap-ng --disable-setpriv"
+EXTRA_OECONF:append:class-native = " --without-cap-ng --disable-setpriv --runstatedir=/non/existent SYSCONFSTATICDIR=/non/existent"
 EXTRA_OECONF:append:class-nativesdk = " --without-cap-ng --disable-setpriv"
 EXTRA_OECONF:append = " --disable-hwclock-gplv3"
 

