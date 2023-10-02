Return-Path: <dse@thaumatec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB35E784AD
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 13:36:53 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.81909.1696253804425560465
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Oct 2023 06:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thaumatec-com.20230601.gappssmtp.com header.s=20230601 header.b=zHx+AARB;
 spf=pass (domain: thaumatec.com, ip: 209.85.167.44, mailfrom: dse@thaumatec.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5046bf37ec1so16033155e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Oct 2023 06:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1696253802; x=1696858602; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBomWkZx08ceVH6BAtRgEbI4MFwvDTT2ezwVxJRh6QA=;
        b=zHx+AARBRJRSRzimht4Bzd1UnYfqBTMZfGk8vlodzm+gIjmQbJpwoRx88KO3VjcBMV
         8nihKUgQwdu2rNZ7jWmeinPnDUmJtKGvbaRDiaXbGX9YXZrpX1MhyNpwcTmD0jaiZicS
         4RP4Zm9mgypgk7mUfkRWRpe9DnoMYMr0D4BnuXigw172DYkaDJgcbmij1+L8Kc9UV1HK
         Ajga71NDbW1x05QQjvY0veqEOf/aJ3dLSj0+dXcDOsNxpSkniIC1Dwca0iihOMx1ky9N
         nye9Tymqlc1AT4nMgXNEtaFlA+O/K7RK6+LFSaMKZaN8weERGxdW8mDDYme42zk4LJoJ
         A+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696253802; x=1696858602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBomWkZx08ceVH6BAtRgEbI4MFwvDTT2ezwVxJRh6QA=;
        b=GhzaLXK7ILi257niNlqf9LUvbsnbioMCq4BcHUWJWzS68ea9eXim9/XT2jKsmZiRpJ
         e+xiy+aJVHiCgwM8ZaAzcHKwJqab+Bz3f8jlKx5ztwrIBKzQZvKtw/ZTchZ8R8HI2Qfm
         Es1fy58m8gsYbxCg5dqEYc3cJwOeu1HsXC+ORISt+pqeClgqnl/orGuuTZhD/3LiG2lc
         EPdGK1t+cNRL1oNqvDrpbJwaW8FpoEpi/p+vblHIKG3unffOftTEatJ/gPRv28QjZ+YW
         FSSp50/rUSZ7jZVjTyv455lcCEaJocILUBXbBey2c1g7ElkbIBcfbj7HczuyzacZLzsZ
         bXyA==
X-Gm-Message-State: AOJu0Yw96iZX7jPRrlIwypbJxuUyNY32HM5bTy+DX82+PczP/EsuZ4+G
	8KPeZ1M7igI5qyBWlD90Y0hN4quk+uakC/0woh4=
X-Google-Smtp-Source: AGHT+IGnAHWf7ifZ0vSA8dl5qvAKrm0LzMZjKjFkyh5Y2Aj+4H5rVNjkqsMG/S89sRGBtOopdTtNMA==
X-Received: by 2002:a05:6512:48cf:b0:500:daec:2817 with SMTP id er15-20020a05651248cf00b00500daec2817mr9167106lfb.54.1696253802731;
        Mon, 02 Oct 2023 06:36:42 -0700 (PDT)
Received: from localhost.localdomain ([91.90.172.13])
        by smtp.gmail.com with ESMTPSA id d14-20020ac24c8e000000b005009c4ba3f0sm4647465lfl.72.2023.10.02.06.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 06:36:42 -0700 (PDT)
From: Daniel Semkowicz <dse@thaumatec.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel Semkowicz <dse@thaumatec.com>
Subject: [PATCH v1 1/3] uboot-extlinux-config.bbclass: Remove repeated space character
Date: Mon,  2 Oct 2023 15:36:13 +0200
Message-ID: <20231002133617.205619-2-dse@thaumatec.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231002133617.205619-1-dse@thaumatec.com>
References: <20231002133617.205619-1-dse@thaumatec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Oct 2023 13:36:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188608

Signed-off-by: Daniel Semkowicz <dse@thaumatec.com>
---
 meta/classes-recipe/uboot-extlinux-config.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uboot-extlinux-config.bbclass b/meta/classes-recipe/uboot-extlinux-config.bbclass
index f752c16b9c..f99100708d 100644
--- a/meta/classes-recipe/uboot-extlinux-config.bbclass
+++ b/meta/classes-recipe/uboot-extlinux-config.bbclass
@@ -98,7 +98,7 @@ python do_create_extlinux_config() {
             if len(labels.split()) > 1:
                 cfgfile.write('menu title Select the boot mode\n')
 
-            timeout =  localdata.getVar('UBOOT_EXTLINUX_TIMEOUT')
+            timeout = localdata.getVar('UBOOT_EXTLINUX_TIMEOUT')
             if timeout:
                 cfgfile.write('TIMEOUT %s\n' % (timeout))
 
-- 
2.41.0


