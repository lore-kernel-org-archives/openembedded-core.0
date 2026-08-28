Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD4B6C61DEB
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:22 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3053.1787945901647018900
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=iWyoa0dW;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso12488085e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945900; x=1788550700; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ihnwxsW+c3nfdo7GusNuNyy4wQ2S91pj6C4drfdY8Jw=;
        b=iWyoa0dWMWjRKd6LhspAL1X1ZhljSRStCF1twNrcYVyagt6kCRTKNVrw7k3hWwHh4M
         luzgE11nYuXPDrUbsMrBWjYgn58bhuzd/HKMvSoqDEV/DruC/2pV07FY5/yQjngwUxT+
         xPafKpUS1zJZdfmz3s3fFqSKPRPLIfc7RlQ18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945900; x=1788550700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ihnwxsW+c3nfdo7GusNuNyy4wQ2S91pj6C4drfdY8Jw=;
        b=pBeNQ9Mhb1T59L7rFz9Ci3r83IjSNMG4NCzF65K86KnKiGFHY6OeZYTostffTx/Xy+
         pZh+eJsEOnMbZjuwesCVrKaWMUeq5T5ZMWj55TjPNG1NT7BH7wRAhUHGSZ4cBukEHKan
         pa6u4qUm6TXHuHg3ERRnWTUw25wEBfwy80e4TB28G99US7l4JiVadmi1Rtjf7hPE7+/2
         Br9k3Tc47cMbtcphv97F2x9glITh4rVwrIfYUe18ft+5Oikwi+ykrdMPtpQl78hcwnLr
         MWhPY0UI0sO4IffHk5oVs3UMBOUBTkqWWMpyfgDQy4/CTlJU3rUgzDfGra5cUFMAGRun
         U5qw==
X-Gm-Message-State: AFuF++lj9aeixVf8tpwzE56o5onaLk1gdUt/g+vj2ECFTIBwg31D4inR
	ZxuG95UlG5bPIuFf4WoyBfQUqtGH6Jg9JMcdE+hYgw8hKL2M5GgfoXPqex48HwfAx5hSNso9Dlt
	qd2h5sIQ=
X-Gm-Gg: AR+sD13RHeuc7ORQFqAN2gLbDMLVty4ob4bkmR+4cLkUlc1mc50hHdTzNa9F3sGUaot
	pAh8chYuzKiFaNrNmKWtaU04iauOlk1g2krZe8bZhPo6dvpxUVlzGzFFVi1ILlLOZG1Ngk5ZMHy
	6RtmSuYQsBWHZgcWcq3DykpxrY0dac/vQc5BU+SEPnCUVI1UufkuyN61ZINzPPn1S2iD0GGvYil
	qCrhXnHf3fixIYv5P+FuiigGRui3GNWn3RUu1Z86DAB5Pi1X0xXYl4jOhie3pN3wYTERA3eT2BS
	btrM+fFoGOJT5zhKUNDzxQ9BvJAvgnQ1OxjzzKfhm6BCAfXi6NfbhgmT3Jyf+ShKGxleFGgXTIu
	pbFtnH/oat0B0FPbroAYO95O6weJj3uosuVkSHtyk/d0m5Hc8htt+cklk7x7i0cBg2NFJSyWOJ6
	YZwbFNbhQREYHhDW0HxSAlR8zwZdRSAwq9+70k56869uNd7QxKZshmzM9RXZ0d8XKPn8VbsNc8/
	GYlhh8uU0upoe89mYZgQucBJ4Yw7gw87hEzbLWc+Lr5rGSBgVItNMROJ3dNjre2
X-Received: by 2002:a05:600c:4fc5:b0:49b:72e4:6223 with SMTP id 5b1f17b1804b1-49b91c2bcddmr120487405e9.7.1787945899785;
        Fri, 28 Aug 2026 12:38:19 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:19 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 27/56] gstreamer1.0: disable an intermittently failing test
Date: Fri, 28 Aug 2026 21:35:37 +0200
Message-ID: <edea697f5965a56848315b4198bb0c2f734b35c6.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244588

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 79ec3a84acc65594942ca9352fddf93d90952d71)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest b/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
index 44dc350eb3b..83a78fabd0f 100755
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
@@ -23,4 +23,8 @@ GST_CHECKS_IGNORE="$GST_CHECKS_IGNORE,parser_pull_short_read"
 # https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3524
 GST_CHECKS_IGNORE="$GST_CHECKS_IGNORE,parser_convert_duration,parser_pull_frame_growth,parser_reverse_playback"
 
+# Intermittent fail
+# https://gitlab.freedesktop.org/gstreamer/gstreamer/-/work_items/5163
+GST_CHECKS_IGNORE="$GST_CHECKS_IGNORE,test_device_monitor"
+
 gnome-desktop-testing-runner --parallel=4 gstreamer "$@"

