Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F6AC38147
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 14:22:34 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.16172.1674051745327130099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 06:22:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q4ACmdKw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id f25-20020a1c6a19000000b003da221fbf48so1637867wmc.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 06:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EPfeP7Tw9jQsX58dNQ139Dsl2kloTur9inSXiUiKfMY=;
        b=Q4ACmdKwcmStmUF5XjsIwUq214gSvcPXmRcLDPgd1q20DTiNTeK4BC+OmeW7MkQiDK
         zndgiiNxhjd6Z8YCKIRat9sf7od2j9dxMg/7n/WSTS4B31nDoWduXKY3W4Em2WfO7I0F
         eFEmHVqbe/pqdzv3MB5MjxfS8I+Tma44YlP4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EPfeP7Tw9jQsX58dNQ139Dsl2kloTur9inSXiUiKfMY=;
        b=CnJyQKO4uBHDSRXK/GnT7e7GsZdibwFpbeBDboGL0wRWEAZMTYMqTNAO4owkAX3RkC
         1eCPn4INYVUl3DzelGxgGrdLOyxfZymJgrEP2oTP3huX0VIz1zMIMBY+tAI5/i4y2k8w
         ds5WxFoKmoS2GPlHljwvDYri/6ktA8P11Ob8JrOgELtuj+hrlElhW7UQHiTEHqETcMHH
         2EzAnVsu+UpPTmKYHcvhwoYTukk6DsntgsEsNzzx5bTOMMwhC7H/l1bPH6vK9EgxLICp
         aPI+v61WNEPaPIOPkWzOP/iWlIgHF2mgtGe71GUikjyQ/1fEXhVYwqPEnr0pUBSm3PgW
         bz/A==
X-Gm-Message-State: AFqh2kohIIUV0rcNgPbJNIqdpHMnPeyoNgK6avsbKQb/cm1Bc9pX4lAs
	UBP0gbc5lH+xiJh1XrSHA3wdgrd8fURpCqie
X-Google-Smtp-Source: AMrXdXsRMlhcU7Q4mHYrUlx1fgjG0sbxMlZVt/FzHYYH433omyB1qdC9Jdli8KGqWnvJgGrP9YjaXw==
X-Received: by 2002:a7b:cb88:0:b0:3d9:f801:73bf with SMTP id m8-20020a7bcb88000000b003d9f80173bfmr6990398wmi.12.1674051743485;
        Wed, 18 Jan 2023 06:22:23 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:54cb:642:5dda:e3f7])
        by smtp.gmail.com with ESMTPSA id bd24-20020a05600c1f1800b003db122d5ac2sm2133304wmb.15.2023.01.18.06.22.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 06:22:23 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] pseudo: Update to pull in linux-libc-headers race fix
Date: Wed, 18 Jan 2023 14:22:20 +0000
Message-Id: <20230118142221.1926666-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230118142221.1926666-1-richard.purdie@linuxfoundation.org>
References: <20230118142221.1926666-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 14:22:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176099

Update to pull in:

    pseudo.c: Avoid patch mismatch errors for NAMELESS file entries

    In rare cases we see failures, often in linux-libc-headers for things like:

    |   INSTALL /XXX/linux-libc-headers/6.1-r0/image/usr/include
    | abort()ing pseudo client by server request. See https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.

    Pseudo log:
    path mismatch [2 links]: ino 46662476 db 'NAMELESS FILE' req '/XXX/linux-libc-headers/6.1-r0/image/usr'.
    Setup complete, sending SIGUSR1 to pid 3630890.

    Whilst this doesn't easily reproduce, the issue is that multiple different processes are
    likely working on the directory and the creation in pseudo might not match accesses
    made by other processes.

    Ultimately, the "NAMELESS FILE" is harmless and pseudo will reconcile things
    so rather than error out, we should ignore this case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 1a708066f73..c9386c3f090 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -13,7 +13,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "c9670c27ff67ab899007ce749254b16091577e55"
+SRCREV = "cc1f6167cb5065daba1462056e2dce8ff72aa855"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.37.2


