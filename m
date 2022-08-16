Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC6FAC25B0F
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 03:36:05 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.11465.1660620957310320540
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 20:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ozu1sy5p;
 spf=pass (domain: gmail.com, ip: 209.85.210.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d20so8279555pfq.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 20:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=rguoUtePaIbF3i6BVTQALfz0lwp827kiHAtaDdQDmRM=;
        b=Ozu1sy5p5J2nnIhFbu2bfFc0Vj3yGauXMuFgvQIOe5ixxtBMijjYq62cKzg/t+W5mG
         K5c2bq5XIT3cD6+9gha7v1NolGHmL3tjtKq/eOB+cZGTGuM9cxyhcH7vkezFAclAl9Ys
         aPRuC6Q29hfavkefxjahz/gIHCo21xDUEl9OMP+A3l4NHzKyFSqR/GpVQHur6it40L4l
         nlFFSrbuiITgUYPVu5MegEhBBqdCV287SK5z0Mcu3g5VrOoDD0KI6b+hJQjSfh7Fczd7
         p63cgXfFxPHGcJ2W2Bgg+dFZBpbELAqkQz16DvifnmLmm6hnaHdL9oJuU1yJePrNsFMe
         lRuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=rguoUtePaIbF3i6BVTQALfz0lwp827kiHAtaDdQDmRM=;
        b=iK/wFUW8u1aCrOd664EAdqlLjt/ra3DL9HHo236hJmEoJKQalbTAUj+tpRueROufs3
         h7NeH5pXH7iwcoO+90jpLbtiwwuHROcd9FxUoZvzsE5aVScAsKxHJCb44lh0vRV5ByFQ
         WnEpLR1OYrezNFgFmXsuyzUkggfxoq2bp0T7aFAWj0PQ20Fs6vCeAqVaQaMMq2ruUNU7
         gHizbDVXWkWM+oMBlD1Wu8H0tJGWHUuACTPm7HVOHXchGuvfI/hq+wWVeuMRXnWBLzPS
         elQ61hg+3flNvWBXWlAebngxUKGWUpajk830x6x/r5XTCD0BZhvzpoZhqb3oANQWhEPc
         wNoQ==
X-Gm-Message-State: ACgBeo1m73CbQTVp3/HaepOYtLXxpyOjgQ0+zzPOwrNy01BIjcmx0Rp3
	GJYi4jlW4tdS52aI507ZXw0RFuWd2ISCgw==
X-Google-Smtp-Source: 
 AA6agR7NZ4c8clksXEKt6iuR/cqJkFB+Zk3hadMzHDTtzLFg8knpXgT6Q3vruKO9RXO+acNxcGmlMw==
X-Received: by 2002:a63:224a:0:b0:41e:1d36:5063 with SMTP id
 t10-20020a63224a000000b0041e1d365063mr15858778pgm.568.1660620956223;
        Mon, 15 Aug 2022 20:35:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 f8-20020a170902ce8800b001714853e503sm7821428plg.36.2022.08.15.20.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 20:35:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 2/5] binutils-cross: Disable gprofng for when building
 cross binutils
Date: Mon, 15 Aug 2022 20:35:48 -0700
Message-Id: <20220816033551.2701240-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220816033551.2701240-1-raj.khem@gmail.com>
References: <20220816033551.2701240-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 03:36:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169421

This does not work in cross settings yet

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-cross.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/binutils/binutils-cross.inc b/meta/recipes-devtools/binutils/binutils-cross.inc
index 02ec891606d..835d4fa69b7 100644
--- a/meta/recipes-devtools/binutils/binutils-cross.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross.inc
@@ -16,6 +16,7 @@ SRC_URI += "file://0002-binutils-cross-Do-not-generate-linker-script-directo.pat
 # and mean the linker scripts have to be relocated.
 EXTRA_OECONF += "--with-sysroot=${STAGING_DIR_TARGET} \
                 --disable-install-libbfd \
+                --disable-gprofng \
                 --enable-poison-system-directories \
                 --with-lib-path==${target_base_libdir}:=${target_libdir} \
                 "
-- 
2.37.2


