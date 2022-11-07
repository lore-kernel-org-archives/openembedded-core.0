Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD9D7C43219
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:55:52 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.4230.1667832949932621647
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DhtLuPme;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id fn7-20020a05600c688700b003b4fb113b86so7327900wmb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8sjJDqWyuSZR1LCsdFdJVyG83QquTLxcCso+3VDUaO0=;
        b=DhtLuPmeJ2KlP/IW0W/csqYgAda3mlUFSGkzPCS8LEU+JyLztFQkCUkrcviUoQ9ppi
         yk1857S//tPiiWPVq4VRc0F++nTlNlm+KZ6A1DmeW3aQgshU3eXS6xn32yg6DyofStgH
         air8FiyCL96dJLpf2BxeDcUV9L4dXNpGl0mK4OF424bKfjLzAKABjMo1GG52pGrBgo+U
         TXMa0Ww708TSJ564T7jY400tvsEemVDYZK/57GNl+zD64DwaP8RFf2n0V3ob1WD/eK7v
         doqQApnVUUkmBKIwCkFp8wyy2SeQDn7zCcW6s5ZcOOlbeG491WXB7NyDpbDRJ+BA3Yjh
         N+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8sjJDqWyuSZR1LCsdFdJVyG83QquTLxcCso+3VDUaO0=;
        b=Win2udXhMo5No2TCkcyw1sTdBTQiorVzbaJzNdY3x+a9xac88066eK4GZbk83Y7cG1
         f4GAYxSduBbOes77feqzhdw9kmnQxWcxVkEA3UzoE8S5MAViAz4un2C4mR00ltUu4oMe
         QaG3NKVMCemsYPiHFTyZxRctUGi5qYNFAblYVQn4mFYt45iuna2Y/SWelhOaEoYUpcig
         BJ2robu/Xd05jvI8UpxIfwgoOvF/8HsS0pnH7aDeuiWmAKdudP1ALupSSawZg4a4vnst
         sXGH/QQU+T6e3eEppy7XJRIIvEL42I9D2kibGvIe+ZQ5g3sO56QuqVWlpW5S6bKrDrq6
         IZaQ==
X-Gm-Message-State: ACrzQf2GovVoOonmPlhw8phrHoy6cSaCKP+AgaSQRz7aeCZIdycrRS5i
	PY/ViEbxbELBywZJwbyfwkQfd2vnqQw=
X-Google-Smtp-Source: AMsMyM5+N2pJQrVOPizbbjXp/VBA/Rraq1yc8dwvCW7U5m3gq0LTy+8brXT8HZdxiui6QXCxEpJ3Qw==
X-Received: by 2002:a05:600c:5543:b0:3cf:81e8:20c7 with SMTP id iz3-20020a05600c554300b003cf81e820c7mr21834904wmb.140.1667832948435;
        Mon, 07 Nov 2022 06:55:48 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:47 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 34/48] harfbuzz: upgrade 5.3.0 -> 5.3.1
Date: Mon,  7 Nov 2022 15:54:54 +0100
Message-Id: <20221107145508.1051404-34-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:55:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172884

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../harfbuzz/{harfbuzz_5.3.0.bb => harfbuzz_5.3.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_5.3.0.bb => harfbuzz_5.3.1.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_5.3.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb
index 1c21610fb5..f56403d428 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6ee0f16281694fb6aa689cca1e0fb3da \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "a05e19e3f52da24ed071522f0fddf872157d7d25e869cfd156cd6f1e81c42152"
+SRC_URI[sha256sum] = "4a6ce097b75a8121facc4ba83b5b083bfec657f45b003cd5a3424f2ae6b4434d"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection github-releases
 
-- 
2.30.2


