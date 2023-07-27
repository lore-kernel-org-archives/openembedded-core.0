Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 882F0C04FE0
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 14:36:40 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.8983.1690468597290827711
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 07:36:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=cOuy/eV7;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so4806107a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 07:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690468595; x=1691073395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ZhDWBiXh/qblQWTPd9MTHGcQjugtL2oGK2cRnv3wZE=;
        b=cOuy/eV7YGDXPauUZx0k1IIRMnmc4Y1uYPPlPhEkB44lrYZocG1Dnz/Cl7OABij5gj
         HflU/CcCu58KDrFF1LacEqBSDFqM04a9JABoKhQj9OniWSLcfle22h7MID6Jcp9qdGlj
         S+sxI7/SASV1I/4TSY7/EtgGD7yz84K3o7W3GUu55+aq7uK2QIWcD0pIfCyS5Ci38wPL
         NOccKxyf70WkX8s0jKPQuOqgDZ8qvcXI2aYW8Y3y/omrLkALkGrNaYwznfA7nE4kR6sk
         Y3Zdx1rFYIX5t5wWoL87AsFWy9Y4OisAl63R/ZIE4wlE6wkrO5S+hbEt5Qc+BmDgXEqX
         l8ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690468595; x=1691073395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ZhDWBiXh/qblQWTPd9MTHGcQjugtL2oGK2cRnv3wZE=;
        b=i/snHWWX6W3FnQFC6u0XszCR7mzqhFbLSm4waKf/G57KWtLoFD/+/WpqB2Lum6rnSI
         u2iOs1kwScOGP9hUjrXbamrtxh5JG70d+Nls61F7BCcWVH4d/PHJokDppKux+Lx43Aqd
         6ZFE3zFCnRC6ouwXQDkBC0f2eU7qmF3HXX40Qnm6nLg/agdshQUIwhjpYx5cUhPfbm6B
         4UoXIRz0khqcTsbPRqTyLPlEaXExHWNjjhlOf3NxkfdT3d99+Bef0M4gX3ePen2YMfLn
         jCziRiSYzcn3F/ggHWrf91l9b6pWIGMuviQR2P1c2vF3M24+237XOzmJJqbIJejLNjxu
         KphQ==
X-Gm-Message-State: ABy/qLa89CkPhUjEWwtI5oXX/reVXzQDsPjlmZ4L6Gc3N7uoQuoJIdWX
	XXG2TSk5YxHjlJUePkbaAycxZKrn8bc=
X-Google-Smtp-Source: APBJJlEnyhjV39BM0J39J4ckil254ISF4NH1i+0vXZ/8god33uXthOeTCFb3NMDENQ2byTgkzimsKw==
X-Received: by 2002:a17:906:7699:b0:994:1805:1fad with SMTP id o25-20020a170906769900b0099418051fadmr2713576ejm.10.1690468595562;
        Thu, 27 Jul 2023 07:36:35 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m10-20020a17090607ca00b0099bcf9c2ec6sm846725ejc.75.2023.07.27.07.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:36:35 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/21] kbd: upgrade 2.6.0 -> 2.6.1
Date: Thu, 27 Jul 2023 16:36:16 +0200
Message-Id: <20230727143627.3718496-10-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230727143627.3718496-1-alex@linutronix.de>
References: <20230727143627.3718496-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 14:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184949

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/kbd/{kbd_2.6.0.bb => kbd_2.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/kbd/{kbd_2.6.0.bb => kbd_2.6.1.bb} (94%)

diff --git a/meta/recipes-core/kbd/kbd_2.6.0.bb b/meta/recipes-core/kbd/kbd_2.6.1.bb
similarity index 94%
rename from meta/recipes-core/kbd/kbd_2.6.0.bb
rename to meta/recipes-core/kbd/kbd_2.6.1.bb
index 9a3e0a74766..112039b9192 100644
--- a/meta/recipes-core/kbd/kbd_2.6.0.bb
+++ b/meta/recipes-core/kbd/kbd_2.6.1.bb
@@ -16,7 +16,7 @@ RCONFLICTS:${PN} = "console-tools"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
            "
 
-SRC_URI[sha256sum] = "9c159433db5df8ef31d86b42f5b09d32311bdda2ed35107fb1926243da60b28a"
+SRC_URI[sha256sum] = "2eb6c6c972be9589bab733275bf020beb5f644d5f9439737920e701af6cf3485"
 
 EXTRA_OECONF = "--disable-tests"
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
-- 
2.30.2


