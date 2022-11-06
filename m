Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE95DC4167B
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 14:18:21 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.16781.1667744281328696036
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 06:18:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=X6YTqE9l;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id d13-20020a17090a3b0d00b00213519dfe4aso8219533pjc.2
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 06:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qav6wVxwGX3eFCzXUrOkTf+3oLBlAdHhYs/AIetSmMo=;
        b=X6YTqE9l+x16ufepKV7TOi5U6fGwboiq/OwGrUXnqBOL9z+h7z0LBYZtwgH1uxdkH4
         FEJlDFHmFbza+XT6I+PJJLrOPU+94/LdsYxbQCDpTJ3Ynqylh1KLFaSjoRTGeOJNBBIn
         l4X82Wp52Bj79Djiyc+VMqBqgky/v6pbXbmjbXAonV68uO+/QXkLQFu/stXlUUzaJ0GQ
         AHlrm/D14UATRkLQ1Jqn5f3hifSPwhfLoaTwPPgLow4zv4l46tsOH/Uy3yXlJ9TV2H+1
         4Ky7Pr50ZXcmfcXPBFcGR4WiHHE/VeQQ3tqfheHFAV2ON2W+bydeu9TSKIrdSQnUsHcG
         t+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qav6wVxwGX3eFCzXUrOkTf+3oLBlAdHhYs/AIetSmMo=;
        b=VBwToYZ36TQFsHsbFeXjUzAA5O9oFPGzohAvKoGsBbs3VHOa5Phlqiu/16iADhgIf2
         IoDu6t6+0XmhwvZNHJqT3+E66A8YODk/46KQ1eZB7oZUzXceeGARRn/z+lWmZR+9dfRH
         BDzmzmlj3Wi2GaJPnTdkUmFQ56r7i4UUyoeNnfnE3S3j/5W+Vf4IYbbc54OJCLr2+K6w
         1MnJzvJlIs9ufZmmQEKO/VpDPV39VqNFs/5XKm9VLNc48sdqiHciJTTO7kW36vdubHOv
         UlDTwIuTV84F5rI7p3SkDVPe/PsGlmgqEba2K7sGHABnzPJGUtAWj2rCH0SUDyIkwFFZ
         /iPw==
X-Gm-Message-State: ACrzQf1M5vmEbcfOOpGxCUh6Z+wLKIDVS9bxAtsCjd3MsHWylgLjeRIr
	lZoBstLRW71wFORNFuN+7gZQ8U4YmiT3wCvn
X-Google-Smtp-Source: AMsMyM7ZpmtjC032LAh6CHvzf+3mpZG3l+C8xGBifRclUEWmhtfzT9pLDvKrRO73TvUKguP+jGHFPg==
X-Received: by 2002:a17:902:ecc2:b0:187:85a:2889 with SMTP id a2-20020a170902ecc200b00187085a2889mr45151773plh.65.1667744294413;
        Sun, 06 Nov 2022 06:18:14 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b0017534ffd491sm3224907pll.163.2022.11.06.06.18.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 06:18:14 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 22/34] create-spdx: Remove ";name=..." for downloadLocation
Date: Sun,  6 Nov 2022 04:17:05 -1000
Message-Id: <e2258c34a7a587f67b233617613a12fe4549932a.1667744095.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667744095.git.steve@sakoman.com>
References: <cover.1667744095.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 14:18:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172790

From: Keiya Nobuta <nobuta.keiya@fujitsu.com>

Signed-off-by: Keiya Nobuta <nobuta.keiya@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit bbecab53d1b27f3bb8c5882cb0ec39b04ef300a3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/create-spdx.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 47dd12c383..c190ad3889 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -459,6 +459,7 @@ python do_create_spdx() {
 
     for s in d.getVar('SRC_URI').split():
         if not s.startswith("file://"):
+            s = s.split(';')[0]
             recipe.downloadLocation = s
             break
     else:
-- 
2.25.1


