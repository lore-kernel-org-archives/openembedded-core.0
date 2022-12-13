Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7573C25B04
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 11:11:36 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.70634.1670929893095739320
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 03:11:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N234KJFu;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id f18so15215788wrj.5
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 03:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zx9VZu2taO8+VS++EUQMV/Um5DzTA36sPWNOGZ4ST20=;
        b=N234KJFuHoWpCYWD51rgxek2kE3K5h7qPORIlB3KoXol6PYQigndY0A2khA0/TSNRs
         6/lM9IaCXEeGjC2EhT6bjZPpjBwJcVL6wkqG4OcARb4KLIvGIXUf4KzHTZlqxPhgppfZ
         FiGd4r9sSakzRJLk4VgBg2/w6ZuQd/yUrlgFNha5tBiGZV2MqSoaWHyFsElXSvl/TJwk
         Sg8kanC2oGIwADPHFuD2dq3w/ONoLTP/UxjzQq7RRhQxD7KSk65Gly9xr96zbRSL/UTm
         WmXl9n72qfFbQj90atpe+DRx6LS9+vyf0kdIEH+Q5hQCfBm8p7ofc9Czf50QtnYcM7kb
         WjAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zx9VZu2taO8+VS++EUQMV/Um5DzTA36sPWNOGZ4ST20=;
        b=fO3eidwCwwJUtbYPp3uePGefTjAsq6wE9sxpbAKXruX4xnGLw2+ZEVKNWR6cqeGb2L
         1xDrhAm/zs6rs9Dp1pculwSDmjTi1UObjGKEkNt8Z2RqQxg8GwGRFbHNPzQGl/2bxJrt
         1qJXSZMekmYPnIPCM9ufS0+ETZkvuIK4RuiQxH709qfzpiNUZm5v5n97DvrfjgfHhkyD
         /TJZh+dXboH45ucdFUAT8VjNZKosGwd53dQglONdlK9PonmZr88USWpNTLlCQ53Wnp16
         mPKLCN3fq2Yqd1TpCnc4jAGWI4aup8ZTUXdiyQnejfkj8aM0ycQpj1sgSiIZK0rKuGay
         7LMw==
X-Gm-Message-State: ANoB5pnkjtRkVdBab6xAyDlNNpCpkImEeqCneQwgvUtCUPmA6By9yUFJ
	0M5jWaOBweg4YVc3omR9yGL3llAsSa4=
X-Google-Smtp-Source: AA0mqf5WCiAsjq1fJiLm6okSW9rh3uG6qx2wOQEjEUDerCK1JvBEZCEE7WAU+6bjNUcYoJU4CGRr+Q==
X-Received: by 2002:a5d:4908:0:b0:242:285:6b39 with SMTP id x8-20020a5d4908000000b0024202856b39mr13232756wrq.50.1670929891465;
        Tue, 13 Dec 2022 03:11:31 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m8-20020a056000008800b002366c3eefccsm11362665wrx.109.2022.12.13.03.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 03:11:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/24] libxrandr: update 1.5.2 -> 1.5.3
Date: Tue, 13 Dec 2022 12:11:06 +0100
Message-Id: <20221213111118.149697-12-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221213111118.149697-1-alex@linutronix.de>
References: <20221213111118.149697-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 11:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174523

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-lib/{libxrandr_1.5.2.bb => libxrandr_1.5.3.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxrandr_1.5.2.bb => libxrandr_1.5.3.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb b/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb
rename to meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb
index 482017d2ae..b74459263e 100644
--- a/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb
@@ -16,8 +16,8 @@ DEPENDS += "virtual/libx11 xorgproto libxrender libxext"
 PE = "1"
 
 XORG_PN = "libXrandr"
+XORG_EXT = "tar.xz"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "18f3b20d522f45e4dadd34afb5bea048"
-SRC_URI[sha256sum] = "8aea0ebe403d62330bb741ed595b53741acf45033d3bda1792f1d4cc3daee023"
+SRC_URI[sha256sum] = "897639014a78e1497704d669c5dd5682d721931a4452c89a7ba62676064eb428"
-- 
2.30.2


