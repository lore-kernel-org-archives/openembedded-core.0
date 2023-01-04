Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 318EBC63705
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:32 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.9378.1672830369815591871
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qwmMQUcd;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id bs20so30464034wrb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m78zYsLGMb1Z1MwtLk3V9y58jebLmCdVYD+swkkBLCQ=;
        b=qwmMQUcdX2iATTOtbbGfjajjVvSvPjfftUs0o+73SWoDs2gft6CW1Dzc+b7jKWut1w
         p/TxO3Oz8fobmLnmqvdYkXz3H9yXO3H3ysJ9SYMHK7awfslHUPv3G7Sdn31oE/WCD+dh
         MuwZznSEATjRytaaB1QXIVXh5x4lalxAI/5S/qitpeZzdWME0OOXLiwleTVAT/LgeIIS
         rCqlt/BTrzxxf6UtQox7qr4b029kOGsvlG2yHmOicPaIYYlBUGkTGMWmobiMbPQUd5iG
         rLuSBmJR/aM52X6Jls5yntGlIyo5PYTfEPbgBtyqZC52/zF9Jldvbp+RYYwmu84UZW6E
         FkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m78zYsLGMb1Z1MwtLk3V9y58jebLmCdVYD+swkkBLCQ=;
        b=uDt/5ucoywsrNyBZAFG1h1adLI9J95XOrTKTZZvePN1IH7Xv46XVO4mWF0WiRKeCnB
         TMozNnmNx4EJuWn1+gWJxa6ax1uYmtTmDiZDKxGKRCEy4s8evSyKbqNHYLfrxwxortSq
         Sjz++AWcsfCqsMSJYtFmed9/FRZSYS7fMzumTG++PRuI5g1NG19mDk/+13oQ8TXJNL9Z
         s3ZBw7GrceaJ6P9A0Ah0oP+DF9hBS1q7kCNvI12tUsOzphQN70sM/X/QUP9Cozi6aoev
         q4hxYTcuIm+xPyFPudkfpZ1Qpm6yddoIcqmEKhpPgIQPIxXEIyd+N/gI34ZKK6rXb+xg
         AadQ==
X-Gm-Message-State: AFqh2kpAVev9efcCTpyWo7Kxbphov0QgknU02IdpC5CJmxF70rWNSTJh
	GDYcndJXH228TZEwKsKoYtfZypSTWPg=
X-Google-Smtp-Source: AMrXdXs6FUZpf+poISiP6Yj3AIYjUFvGFjKs1kiWXas/qYaU8sGLCROri8cFF1e4FTHm4lLyTln3yA==
X-Received: by 2002:a5d:5a19:0:b0:242:2088:1546 with SMTP id bq25-20020a5d5a19000000b0024220881546mr39001455wrb.61.1672830385054;
        Wed, 04 Jan 2023 03:06:25 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:24 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 43/77] python3-urllib3: upgrade 1.26.12 -> 1.26.13
Date: Wed,  4 Jan 2023 12:05:14 +0100
Message-Id: <20230104110548.2537259-43-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175428

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-urllib3_1.26.12.bb => python3-urllib3_1.26.13.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_1.26.12.bb => python3-urllib3_1.26.13.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb b/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-urllib3_1.26.12.bb
rename to meta/recipes-devtools/python/python3-urllib3_1.26.13.bb
index 1cd69bcb10..7af95117cf 100644
--- a/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
 
-SRC_URI[sha256sum] = "3fa96cf423e6987997fc326ae8df396db2a8b7c667747d47ddd8ecba91f4a74e"
+SRC_URI[sha256sum] = "c083dd0dce68dbfbe1129d5271cb90f9447dea7d52097c6e0126120c521ddea8"
 
 inherit pypi setuptools3
 
-- 
2.30.2


