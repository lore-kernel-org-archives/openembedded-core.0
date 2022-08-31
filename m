Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBAA6ECAAD4
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 14:40:21 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.26504.1661956818767966885
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 07:40:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=BDnpyV3e;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id r69so13688359pgr.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 07:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=0aaaBN3ev3VxjpU4pCHyKqmtPyevTWGmNl4aH11EMzI=;
        b=BDnpyV3eh8zQCIELHYDTnkZw1gBM4qQCLJE0B2Qnw/LHN9SjN/P6uu4M1H6E7iAqah
         vGH53S50TCMvbjZ+DZVGtz0lWtgZn2/dpeAjCsFOFyRUa8+EkhN0TAGWRcg76LRa6TpQ
         hWZTDpbxF2cxw22ODmtJFtYfhZiDtQZHbn2SorGoXlhNrWA9Kf1PlzaVu48qdu3NNlnm
         iAPCmTHNef2Eri4O/0F++DrFHiaL/OHbh+jMWrqC9W/S5vvdtQkYiohuOo2C/VENTNcI
         1it82qNeP3+0LO5laRjs0IIfej/aKwXH62Cm/fGS8fwbfaLG+4KO/UhPw8frYEJ625hD
         kgBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=0aaaBN3ev3VxjpU4pCHyKqmtPyevTWGmNl4aH11EMzI=;
        b=yG4czk03rJr4ii6kexYUq66wZCsjf2U5CKKQlk/JvqtJCYqq9OBeoJ2xPjNg0l/HJj
         RLPEVilLSPuoiBoISXtFJQZfXVFA1IqeX2gsZG5/wRqPKnhJ8LKJZuZgD8QHQPppbGN0
         eslujPo+A2K8Br/G0gh4hGvXoW9OYP6pYUNYLMQ1vZQjGpS0ywuZ9CflkerXtmO3J4ok
         /mnoO841xob/hywAzu+dBC1QVAWFryRvczBhG52tF98sZQgFijh23gibZ04EBwqRWP+p
         CLnXJfbX+u5YtTgfACSHfAh9CQ86Q0JOCxah3HLjG3sCaZj2DnmOTCQCQkHYQYTIAmqm
         s47A==
X-Gm-Message-State: ACgBeo3Te3qjmjF7tW7BfJ3W4z2FUf7zEeAHqCmyPxyU1i0TSHfDtlVz
	p1kqNrXI1jK9nnkJuuPdnPjPKKU9iwvIyW2M
X-Google-Smtp-Source: 
 AA6agR76o3CFfkkRRSnGg2zd6XYfDsPXxunTlINkh5IsKlcHAOvG5FQmXP5eomfACN7z4kV2g9VU2g==
X-Received: by 2002:a65:6bc4:0:b0:3c2:2f7c:cc74 with SMTP id
 e4-20020a656bc4000000b003c22f7ccc74mr22005467pgw.307.1661956817815;
        Wed, 31 Aug 2022 07:40:17 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g5-20020a170902d1c500b00174d715cb76sm6070780plb.2.2022.08.31.07.40.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 07:40:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/19] util-linux: Remove --enable-raw from
 EXTRA_OECONF
Date: Wed, 31 Aug 2022 04:39:32 -1000
Message-Id: 
 <8acf5a1b5dd7827e72a722ef9ce35bf6bbc0df6b.1661956484.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661956484.git.steve@sakoman.com>
References: <cover.1661956484.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 14:40:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170123

From: Mateusz Marciniec <mateuszmar2@gmail.com>

Having both enable and disable flags for raw is confusing.
Raw should be disabled so --enable-raw flag can be removed.

Signed-off-by: Mateusz Marciniec <mateuszmar2@gmail.com>
Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 011c549e2b005205923db6f69b60f8b29bee415f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/util-linux/util-linux_2.37.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.37.4.bb b/meta/recipes-core/util-linux/util-linux_2.37.4.bb
index b39020884f..f6d3ea2bc1 100644
--- a/meta/recipes-core/util-linux/util-linux_2.37.4.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.37.4.bb
@@ -69,7 +69,7 @@ EXTRA_OECONF = "\
     --enable-libuuid --enable-libblkid \
     \
     --enable-fsck --enable-kill --enable-last --enable-mesg \
-    --enable-mount --enable-partx --enable-raw --enable-rfkill \
+    --enable-mount --enable-partx --enable-rfkill \
     --enable-unshare --enable-write \
     \
     --disable-bfs --disable-login \
-- 
2.25.1


