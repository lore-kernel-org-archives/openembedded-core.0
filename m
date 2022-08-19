Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7577C38142
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:28:18 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.477.1660894090787610898
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GkMEkg41;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id r16so4177792wrm.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=o8JkrKT3DkolDhL7Dm/5RUr7tVy/Nb2yRB4cJkhIDYo=;
        b=GkMEkg41rwsFwo1hcuvxjKAubEB2JIoxY0KBXU9v6xE3Jxgt9s2Fw3dlpjeAc1uaTb
         hNMAT7KGIQSO2RSHdTBnjPCI1e1pdkzxvGGUgjJg7QnkrsIIbrPqD6i3iE4lEIfEEmAk
         7ESJT+QTH6mXT3xL5AKhFwbvWKEylNC1CcSGWOk71FxQxWZT4tYKRGVA1IRYx+t8Cz/b
         FwiyKUthBZMvtAUTcc83b0Ch81eFHmhuFfdkdUbrf5gTGkBD38vZUrnoLJMPD8R7UHDL
         cfnBZFFdvQSEzC5NOhXt8hZ3erbCmS1w4ZTaPJaSZM4F9n6aXBh5OLfdLdqF5s+riR5I
         zQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=o8JkrKT3DkolDhL7Dm/5RUr7tVy/Nb2yRB4cJkhIDYo=;
        b=0LxbAaZXaKy1kWxh3Mwk9bnaHr1kmU8L7ajeRrYZTegy1W6LZMG5miQFJRzS3xihF7
         82J/8oDzZXPsmH0uYYeUqlmeDT2y9NHWmnqWhm74d/hpxSEso2eJRrIXbyBX/Tc38USM
         Q22ImXaixqEDmf5HXp+20V5jhQh6YyZ41ukiTEiAPADHtRXL7PlsmONeNcS9P+uVzhfp
         3HMY4UXnjxETCnDjNqZ5HTuyk5zyUSsAjgx96xbimi6XhXtN1PXNo2oKFSRQ+RbDGq3p
         pbyunxWTHguNJYg/NSL3uxlT/MskDEcKsWir3qxeSCXm8CSWXVo5JoR7DCXbcmDOrcYA
         8EOQ==
X-Gm-Message-State: ACgBeo24xWlgmR1EAmUxzmiUKC+wckT+YJKW7vfQiTVkzYOHW5XtmeTC
	ePtgBH/9PxJvEDKdM5QVu2pkO+hNJu4=
X-Google-Smtp-Source: 
 AA6agR7Sq8UV7ykVkRtDxBGH9fQqFWxK6WfYK9WtZKarl1kIaCpx645Y8ReV15beoq/GjF3kI0ivjQ==
X-Received: by 2002:a5d:6acb:0:b0:21e:efd7:c7be with SMTP id
 u11-20020a5d6acb000000b0021eefd7c7bemr3430151wrw.293.1660894089324;
        Fri, 19 Aug 2022 00:28:09 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:28:08 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 26/42] pkgconf: upgrade 1.8.0 -> 1.9.2
Date: Fri, 19 Aug 2022 09:27:11 +0200
Message-Id: <20220819072727.2236928-26-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819072727.2236928-1-alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:28:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169597

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../pkgconf/{pkgconf_1.8.0.bb => pkgconf_1.9.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_1.8.0.bb => pkgconf_1.9.2.bb} (96%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_1.8.0.bb b/meta/recipes-devtools/pkgconf/pkgconf_1.9.2.bb
similarity index 96%
rename from meta/recipes-devtools/pkgconf/pkgconf_1.8.0.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_1.9.2.bb
index 887e15e28c..576710b8fc 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_1.8.0.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_1.9.2.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "ef9c7e61822b7cb8356e6e9e1dca58d9556f3200d78acab35e4347e9d4c2bbaf"
+SRC_URI[sha256sum] = "db6bf5426e0e9fc107042cc85fc62b1f391f1d7af46c4a3c39b7f5b5231dfa09"
 
 inherit autotools
 
-- 
2.30.2


