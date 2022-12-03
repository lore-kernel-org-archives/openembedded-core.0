Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F287C4708E
	for <webhook@archiver.kernel.org>; Sat,  3 Dec 2022 03:29:46 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.96659.1670038178219910251
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Dec 2022 19:29:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=odoFIQh+;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id o12so6589306pjo.4
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 19:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1u25S1YSb2CwBa75yfMOYa839oelH9lKnu9qMPDrbY=;
        b=odoFIQh+BrdtGBf02axwUnA6sjn1nU2H+JP/Fg/nWa+zsSq4uLugxfBnJb5NxAOqYj
         mXhYg5ICGNoJg8F4Qid++LAcgCA40DFhUed8xfQixGAgvCk9D8fnnMvWR8QFdmcxvLOf
         mOqnoVVtIJ9Bw3E7qyJ+z282vC5pZLxAzHFFVOHmhPGjZ0jZMIN0PL2jhoeAyOe1uEnh
         KxigB6gMpb3i0XVgMKZkg3VWDBhvYQ/bfQm3FzwC2ejgoNsswZbZwxIl54CgPoUWDsD+
         SQsNEF4k/KeXX9wcuhdiYWY1KRl7IdqimCvH2QV79rxa5piSqSS+mgYdR0w9T9fHP3Tj
         ZsDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n1u25S1YSb2CwBa75yfMOYa839oelH9lKnu9qMPDrbY=;
        b=QOw0DPkPb59LZP21T1QdGfDgG2o275kLQwcmlCW8pBDdswVc0ovX70kTKf4O9ukltA
         9aMrmGd+2W+EgqqtG4OFi/zffZuHTfxC+dIam4f+Fn6V7SnutfPmycU9MSvLCZGgeb+q
         9ywY3/ig6tbHapjxNagn1aexBN/rQjSm/3pZZB/MVWqMUM3R6O0DvPYKKtjtacFgixRC
         tF40xXiwdkQrYVm7aQPRuyN8/UPcfr/iEM2O9hFAZGw7hZ/djxPowC6K+lrRc3FLjN+Y
         0RHNX/rd/HQejOhTfAmJkTny2NZ0vJZpkjhD1idrx7g4iQlYHzW7ey1xNNT7Ny21EhGF
         dIQA==
X-Gm-Message-State: ANoB5pnWEEkzgbwrzu17sWOkTjUKiSGJQ7vHZd6QYSZs64ScOkt9h+pY
	bJVj0eAI7VmvWrFakzutet7PYMktScA=
X-Google-Smtp-Source: AA0mqf4bL/pOVI/AvH5DvlPU3ms1IZ7KPG3WvEsxYfdcCbUSIOqZmivED7LEzhMKoiP5pOC/gUTJGA==
X-Received: by 2002:a17:90b:2686:b0:218:bb0a:e295 with SMTP id pl6-20020a17090b268600b00218bb0ae295mr62301966pjb.80.1670038177430;
        Fri, 02 Dec 2022 19:29:37 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::d00])
        by smtp.gmail.com with ESMTPSA id m11-20020a170902db0b00b00172951ddb12sm6366234plx.42.2022.12.02.19.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 19:29:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] xkeyboard-config: Extend to build native package
Date: Fri,  2 Dec 2022 19:29:33 -0800
Message-Id: <20221203032933.878802-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221203032933.878802-1-raj.khem@gmail.com>
References: <20221203032933.878802-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Dec 2022 03:29:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174249

Needed by gtk4

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb
index f3d9ac9221..f9322d4866 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb
@@ -28,3 +28,5 @@ do_install:append () {
     install -d ${D}${datadir}/X11/xkb/compiled
     cd ${D}${datadir}/X11/xkb/rules && ln -sf base xorg
 }
+
+BBCLASSEXTEND += "native"
-- 
2.38.1


