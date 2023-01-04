Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 598D6C54EBD
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:01 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.9363.1672830358029391186
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:05:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VAtSlRzM;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id p1-20020a05600c1d8100b003d8c9b191e0so26138828wms.4
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pr21doVspobAD5uXWZZ+kHYLgFzQkDPyzK2uF+qjGpw=;
        b=VAtSlRzMsS6bhRJ1YLsHcBA4H/EYn788nGNejpWwcPuAKT7OmIsOukyRQHGsLZH6sH
         iqV7kUsb/+3Jg808EzJrBXTjggICwy227cex6gZaEIqnhWsEWiPUt3mHPzmI9V4olB9x
         QZCFmEwOuq4g2w3iaVB81qoPoXNa+3m947Ub/Bndcry3LjGWYMDo7hdmSlYFs2fWvv3x
         ZDCRzrcnrBmjqlP23vrxEIYAH/bueKHW0DKqmq/FlYOXNn7N6zXcsfuEE5OCZZhE9dLh
         XqdoECOvluS7+/53fpw7PAos7vGRYfOIsMDANzH6eUpvaq52EauiZDG6gTNO5AwIylKf
         PnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pr21doVspobAD5uXWZZ+kHYLgFzQkDPyzK2uF+qjGpw=;
        b=iDub+hPhg5tT3NRIp338fDPkudjXhsbvbHlIqffL0iBz7TY8xs19/eM1QSBM/R/33+
         go5DrynlR1TQy3I88ktxSSQaUYIFBhg0bcubvk8TMHmG3UQDNGwdQJCqcZ8kctcHej/+
         VCHAYK6wL94qWclRMccq4rDkIlMVfDqjvEER54A98hmXCM5Y7LZF0HjyIEaJ5hHgFm/a
         mQoJopMPX59Pw1WN9wZTqZxwRrPnbRaXZVN12c1lT7M6UMkIGJcaVJRy1Rs/X1NvMR9Y
         3OfS3wgUfEUJoRZ38j7Xq4V24+YsxSXS2R/9hTCoTlTv7RWWeopqZt5l+80e9milA+TC
         Aanw==
X-Gm-Message-State: AFqh2koMtfaVD0m/Po/35J7xV0V6+gXwFIMW+7VbliyT9AW6O/+xi4vS
	tSNSTTUNHvlcybh94PrLwiYoyWt2Mig=
X-Google-Smtp-Source: AMrXdXuJ+dkbHK4q8eB6J/a8hlwpNF6QxlS+kTNeF16LHuqU8mRbz+S9jwmBLuDeyE+KXTbn5fUU5g==
X-Received: by 2002:a05:600c:4e09:b0:3d4:5741:af9b with SMTP id b9-20020a05600c4e0900b003d45741af9bmr37073799wmq.0.1672830356551;
        Wed, 04 Jan 2023 03:05:56 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:05:56 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/77] ffmpeg: use nasm patched-in debug-prefix-map option to restore reproducibility
Date: Wed,  4 Jan 2023 12:04:36 +0100
Message-Id: <20230104110548.2537259-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175390

Latest nasm requires this as it otherwise writes full paths into its output.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
index 06eca4fefe..0f67c9e949 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
@@ -142,6 +142,7 @@ EXTRA_OEMAKE = "V=1"
 
 do_configure() {
     ${S}/configure ${EXTRA_OECONF}
+    sed -i -e "s,^X86ASMFLAGS=.*,& --debug-prefix-map=${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} --debug-prefix-map=${B}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR},g" ${B}/ffbuild/config.mak
 }
 
 # patch out build host paths for reproducibility
-- 
2.30.2


