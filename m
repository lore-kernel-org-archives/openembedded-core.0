Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 384CDC43219
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:26 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.3487.1652871533048666129
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e49OLH8J;
 spf=pass (domain: gmail.com, ip: 209.85.218.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id kq17so3054973ejb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fbx0AxuyN/AcCtY4AJseMpdzkobe/fz9lNQC17YFvhk=;
        b=e49OLH8JYmYHWQ7ksCZoXdEvcCuPZIWhYTPUgMUE1PQXGG25uRoDZet3hYPlUlN6hR
         DL78J5ERq7DH+AV7xDzX6cmMs05lP8PxEmBLQJGujoMeYvOK+AcudWJAowlv8ZuOZ2Kx
         wFWzo6KvPySsdmypYAj1QJMXzwilP6R2Whw4hhVcmGT0H3ElKbKAj6ERDGrwTzvlt1Jm
         Gm9ZGMNSHwCxy7Ip5xC8Ge4lrwwCv9DMNaPqLmoWu0pMUIfUlEiYlRW73LfkqMSzRrO3
         KjAaUOBIkBUpz8wK42rXHjsAamR+pOeUsulWE8Y0vFX226cGRUa1+uHac5w5J1WnlvEX
         h8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fbx0AxuyN/AcCtY4AJseMpdzkobe/fz9lNQC17YFvhk=;
        b=qOxnC+JE2ZSadDM+ABIDUcKsUBd2ZQQ09TkES/eMVJNrZUWX7nk2QbioGt2mGpGWoz
         L2JIPO9vVDpQjuW/9TTtXPwAudfKVY9jocZ0Lm0IDEG6Ch70g66S210FosMBzBygc4at
         vBM7XojSQQ+cvoI3bWnEQzD9LklMnm1dGCcQoV3E0P+HpC1V8qFWBdbvfA25O/3ZSMmU
         YNkTdWWIeFDQvQEYvr5Ep2j6F3csnJOLO7XiM5BPa7+G+yUiNuI74u8OJe5t7aKv1s60
         dK6dKretnenIFDu23XAw0QZ6CdhnEGEJqb/agyMd0WBPjLoEhsuHr5VcwpHJDewl/dda
         lrrg==
X-Gm-Message-State: AOAM5334IjC5c7xc4ncU+JEefNTsYwhgdVXmqgr1fzOkmJ6AAsQkV7ul
	Gk5b2eY//FlHroRgqtnQfK2JydP5ELw=
X-Google-Smtp-Source: 
 ABdhPJzAuqYKkvchsur6d0OSOVoIDcZwIsyd4ntY0ZeaLcSX024VNQ45lGlrmP7cx/20z7ereFUNQQ==
X-Received: by 2002:a17:907:6d08:b0:6f4:45ca:c410 with SMTP id
 sa8-20020a1709076d0800b006f445cac410mr24372531ejc.679.1652871558869;
        Wed, 18 May 2022 03:59:18 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:59:17 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 31/49] librsvg: upgrade 2.54.1 -> 2.54.3
Date: Wed, 18 May 2022 12:58:25 +0200
Message-Id: <20220518105843.3299331-31-alex@linutronix.de>
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
 https://lists.openembedded.org/g/openembedded-core/message/165828

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../librsvg/{librsvg_2.54.1.bb => librsvg_2.54.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/librsvg/{librsvg_2.54.1.bb => librsvg_2.54.3.bb} (96%)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.54.3.bb
similarity index 96%
rename from meta/recipes-gnome/librsvg/librsvg_2.54.1.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.54.3.bb
index 7bad2ed816..958e80f00a 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.54.3.bb
@@ -20,7 +20,7 @@ SRC_URI += "file://0001-Makefile.am-pass-rust-target-to-cargo-also-when-not-.pat
            file://0001-system-deps-src-lib.rs-do-not-probe-into-harcoded-li.patch \
            "
 
-SRC_URI[archive.sha256sum] = "d5557efbdcc415a4180e1116b7f736cb711b253d110d95fa86ec830f70026625"
+SRC_URI[archive.sha256sum] = "66158f2ef46dde260026846c4da102e4a9dd4e5293010f30949c6cc26dd6efe8"
 
 # librsvg is still autotools-based, but is calling cargo from its automake-driven makefiles
 # so we cannot use cargo class directly, but still need bits and pieces from it 
-- 
2.30.2


