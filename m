Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C9CC001DF
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:34 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.7470.1686734973395183811
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=GNtj6rmO;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-9827bd8e0afso31451666b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734972; x=1689326972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDRde6ulhBFE0kDzNHrSy7PKk4pxAJzjzFCta+dVErY=;
        b=GNtj6rmOp1hAE46Ef4uYnF4Lzg96xbHnOClHcJPMPjklF2kTYqdEe+XoIs7yUSQ8Ea
         +xcdZPa+Rr28IjbNrhB8EAtUbH3dVtvsNDz2kWMFusHFx5D5JVWsYvES5zj4lLPtJFW6
         KUaByf2xiXdSdT6mvdtNQ1WlYg+y7KSISJAV+gtBem/7JH1rB+F3kxdhShogeYzY10mF
         hAZ9t6GsOXvuRLrJwVf78Zqyot0wZTbtqUU9clvi1tB0SkaYtDbSPXQt6uPOlUzFNVjI
         rgWnB2Rk4tb5uV7TLbL2z8XC23CRrRxDXVHtsm1JyKc343ebc2NLY7RN5b9ZNXxsMcZ/
         CAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734972; x=1689326972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cDRde6ulhBFE0kDzNHrSy7PKk4pxAJzjzFCta+dVErY=;
        b=BJOaNANOl0MPZqQrJ4kSNQs7kXS+Hot2wX7Z4d27luaY1AfQvHLobl1/nLs7bQK3K3
         2A2gQ3CiOqWyauGINPJGXAptjO9UumYVvKZXH1Aa6AbJcZt2vgp31J5z9RxkMhMNTsan
         t61ZqE9Re51SaAdzXuoxFU14mhmDUGNEP2DO8WOegjP0wtXusf9wMuUAjqYm/jJA+nWe
         yDrCWZ81zyPKh/9+LsMCMvGeKB1brZssmGHLquiFe2V7GCv84DywTE8PCdnd3C8B1mQK
         djqfpVTKiHthghww8MD2Xy8v/lRC4FTeh5YyHPGGbxlJXzgqR1/LnTlUmfcod82Qsg9B
         D26A==
X-Gm-Message-State: AC+VfDyS326RFjgav9y66/vUmHx45lRM0XikoQ28+gVaBYiOnoj2nx2d
	ukWk/mgKX7zf7WlKGhIZwCKl0ZAWY7k=
X-Google-Smtp-Source: ACHHUZ4qhV9mNaGHfBoDbN0TcK2h5P6d+YFBxC7JKBpcVB9tvJ6OX6Hgo2nLAY3XjU6k/W5gvRDdpQ==
X-Received: by 2002:a17:907:3ea1:b0:96f:be1e:bf1d with SMTP id hs33-20020a1709073ea100b0096fbe1ebf1dmr14540486ejc.69.1686734971819;
        Wed, 14 Jun 2023 02:29:31 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:31 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/55] at-spi2-core: upgrade 2.48.0 -> 2.48.3
Date: Wed, 14 Jun 2023 11:28:33 +0200
Message-Id: <20230614092918.4065570-10-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182755

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../atk/{at-spi2-core_2.48.0.bb => at-spi2-core_2.48.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.48.0.bb => at-spi2-core_2.48.3.bb} (95%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.48.0.bb b/meta/recipes-support/atk/at-spi2-core_2.48.3.bb
similarity index 95%
rename from meta/recipes-support/atk/at-spi2-core_2.48.0.bb
rename to meta/recipes-support/atk/at-spi2-core_2.48.3.bb
index e9648ffe074..17b0e39a5e9 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.48.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.48.3.bb
@@ -11,7 +11,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "905a5b6f1790b68ee803bffa9f5fab4ceb591fb4fae0b2f8c612c54f1d4e8a30"
+SRC_URI[sha256sum] = "37316df43ca9989ce539d54cf429a768c28bb38a0b34950beadd0421827edf55"
 
 DEPENDS = " \
 	dbus \
-- 
2.30.2


