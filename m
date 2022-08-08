Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F3E0C282E7
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:43:06 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web08.22248.1659940977695670407
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=llG5ZY35;
 spf=pass (domain: gmail.com, ip: 209.85.218.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id gk3so14780753ejb.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RtpV3pk4IciE9NIun1lrwyw3/FV/UZM6C7fric7zjzE=;
        b=llG5ZY35QsiD7yuQ2bfIa4CUzBBkjngLcJt6IBnZCsci3PcvzAmO1R8t9XFBR0xe5U
         KLqOFOH1XN9bEwa2K7LP/fCc/YL9898lEJFI6Gehaff62UMqz3oTqhRtffJuwjT7Bmnw
         XMacObcPdkeWtBIswOjULAn8zpZkivJmzOUV8cyMla0g2LxC0alNo/CN3XMOFWOgy70E
         lO7sfKsAcDJW6x9TTdSTwnnPJtU4WtFoYZ5ajiJIxvVSNDxoSf5j86vS0KnCdoUzDjSt
         eaBIWljB/WXJaRBeD7ELRgMcrvXPfiKWuyBx50noEFncGkNcPWMhjJwP0UnzAKzzvlJB
         HC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RtpV3pk4IciE9NIun1lrwyw3/FV/UZM6C7fric7zjzE=;
        b=qJbhmckuO/cAqcUC7bP2FYuiS0Y7SXUxieVJ3hUNa0h5wxhV7vO8LHw8OmuHsy+e9v
         I+A32XWrY11rDEBgopIGlcD4SQsKsot1DJUz8q/Lquxzw6QgAHYOMuI0kijDDh2bbC5B
         cKeihjH/2j2zujQKXbHKoCmv1X6caCrmFhsxsSNxhf5p8/ff2d6c3a0F35wksw3yMuHP
         trrQaG0IuBC8X2mPeLf4+Wo+7x0ENRECnJa6U2hATBhnlqnNLWarxJB5n8hd15YIRKYJ
         ODaXDrjvM2W43BXXTwQiM+bpZifTqUj1rnPPRCAPkF7UP7J/jy35H3VRVISnd9leearl
         JtlA==
X-Gm-Message-State: ACgBeo3MZneEtA9CPklP/PQ27kYOONeem5JA8VT6I/iPrs7yDTZw4Sby
	dClmCEI5j+qjgjl7VyVw+1cjXSciYBc=
X-Google-Smtp-Source: 
 AA6agR7FaBbHBECgW7KAU32DD4ru2xyhGznZAaEEYpw0mJHvzOQtQaf31wf0XMzgoOlByytV894zdA==
X-Received: by 2002:a17:906:844d:b0:730:cd6a:a487 with SMTP id
 e13-20020a170906844d00b00730cd6aa487mr12433682ejy.50.1659940979467;
        Sun, 07 Aug 2022 23:42:59 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:42:59 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 21/44] kexec-tools: upgrade 2.0.24 -> 2.0.25
Date: Mon,  8 Aug 2022 08:42:14 +0200
Message-Id: <20220808064237.3975347-21-alex@linutronix.de>
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
 https://lists.openembedded.org/g/openembedded-core/message/169045

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../kexec/{kexec-tools_2.0.24.bb => kexec-tools_2.0.25.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.24.bb => kexec-tools_2.0.25.bb} (97%)

diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.24.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.25.bb
similarity index 97%
rename from meta/recipes-kernel/kexec/kexec-tools_2.0.24.bb
rename to meta/recipes-kernel/kexec/kexec-tools_2.0.25.bb
index fdad40ed6a..9784404cff 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.24.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.25.bb
@@ -20,7 +20,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch \
            "
 
-SRC_URI[sha256sum] = "1ff9137327aeac3b2ab922a71bc6eb4655571a0ff77c071cb92783a9a59d4d26"
+SRC_URI[sha256sum] = "4eea6f8641ea3e349653a52c7fd33be1132322a5f3dc9f1a6ade886019767320"
 
 inherit autotools update-rc.d systemd
 
-- 
2.30.2


