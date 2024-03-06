Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC15DC54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:20 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.14874.1709739738687743447
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eZiw884i;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a45606c8444so420375866b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739737; x=1710344537; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrYx5XNTYSV7ke/RLZQy6QVGG589Q05nv3nmp+KLgfg=;
        b=eZiw884ilrbJHMY4srMPkjrfvF7UV1330IpAthAMugIyH9dtMVbjuKYQjOg3Qy5BDf
         i//7E91Bu05NjENzO9001zdFbBjKa4iqMMZTWageC0gRHfF8T70hQNsudz75yG55BxEj
         Btmm/hNA/N9A2AgKbTKQX+n/aBXBgm53/8D2Y1JxjBD+s74Lc9EBD8YSkHEtaTlwf4Gj
         lMoPxKJls0VI33AraScegQYXAdX+VN3LjXS90VMH42hRyO3GRIYwQBxJuLLqIy+yZCTU
         KT4BgMlbO/wDQeicoiLrCNYpEWxgJxxy41elklX6lHVmpHBFIcLO5a/cpRH5yQHdAr6t
         N+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739737; x=1710344537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rrYx5XNTYSV7ke/RLZQy6QVGG589Q05nv3nmp+KLgfg=;
        b=TQAN+pfwjWVBn56P9Jf77vi+zLq60C9ivD3oF+e7KTNgQdbHqTpeafqhjDiLjq6ptQ
         DarCRQuq4FVbid1/VZ7XEitEijUwdwoSh7N6OnzqxdyldNO7z3z1pT3Tl4+e9oGHFcpc
         UTHN9qxaYbYLVs3xCAbLV/JTD7Jmp+aTQVmA8ByTyAv7KHI+mukBRjGPypDjiA5C5KRs
         B7pGK8aqEu70ZFtI9DLN9l8yhvnpqTcf1lAYnF5/QPkR61OLdLRD2ASRWC2JcREZVHNX
         2ZM7qd537eCQ26Vgi6neQ2zlzveVYOdVs1NQjSAEArxuyu0cFHavzXWQqh+/Eqihshi2
         8ExA==
X-Gm-Message-State: AOJu0YyFZufysNsyqFlZESARWz/6gKjY63xANkywHGkv1BUtpbCwimXK
	VPBoWocpeegcmL89aqZ3LWJX4rN9XH3peA6w/9EaWwbr7YOzNQLeNsGVCO2K
X-Google-Smtp-Source: AGHT+IHdNh5BNrylMnuMJCg4q9sZc9KVjSWCj7cDQJoozUN2VvxRRlwXpTyURXfbWO2di0k7F0wgdg==
X-Received: by 2002:a17:906:7cd7:b0:a45:af0c:e22c with SMTP id h23-20020a1709067cd700b00a45af0ce22cmr2657911ejp.37.1709739737073;
        Wed, 06 Mar 2024 07:42:17 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 30/47] orc: upgrade 0.4.37 -> 0.4.38
Date: Wed,  6 Mar 2024 16:41:34 +0100
Message-Id: <20240306154151.3741709-30-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196713

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/orc/{orc_0.4.37.bb => orc_0.4.38.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/orc/{orc_0.4.37.bb => orc_0.4.38.bb} (92%)

diff --git a/meta/recipes-devtools/orc/orc_0.4.37.bb b/meta/recipes-devtools/orc/orc_0.4.38.bb
similarity index 92%
rename from meta/recipes-devtools/orc/orc_0.4.37.bb
rename to meta/recipes-devtools/orc/orc_0.4.38.bb
index 9985204d744..5d2296694a5 100644
--- a/meta/recipes-devtools/orc/orc_0.4.37.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.38.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
-SRC_URI[sha256sum] = "85638c0d447d989cd0d7e03406adbfbc380e67db2a622a4727a0ce3d440b2974"
+SRC_URI[sha256sum] = "a55a98d4772567aa3faed8fb84d540c3db77eaba16d3e2e10b044fbc9228668d"
 
 inherit meson pkgconfig gtk-doc
 
-- 
2.39.2


