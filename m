Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08DA3C98308
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:12:16 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2836.1790154726075804652
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:12:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tcOv+NtS;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso4523645e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154724; x=1790759524; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KRBaUH478EaABtyvYdPzfJVUQ6uQSq7JcwO6hlXaHqI=;
        b=tcOv+NtSJhDaR3gO28CuTQ0l5TwgfNTgkfk3wVzYQrsXYp5J53odVU0cEDvAUnAeD0
         yup0idXj3gCqDjFyUH3kF4ZdanANn7+GkoNrv3id7HQXoylz4rmlAn+hNqHEJrEt3POd
         +gCKEj0A5FTt784BIy6hP5tHk85DAfaa+Ly+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154724; x=1790759524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KRBaUH478EaABtyvYdPzfJVUQ6uQSq7JcwO6hlXaHqI=;
        b=ghSxPvoHpTza1gtVu0WSDk9PB5g2oQuotqwxrsyWLISvHCOd8D5DIpXYQ3l6yrun+L
         G3cOrEl5JKNlowktY/E7wKPFyDthk/qJCwcYmdwpkVKw5xeACKrbwgFkMIlTGmXhw4kW
         w6z6M6tUIpQiPjR6EYTxwJ+NtCRdxpQcas6GWG9fBoX7Fo1eZBdi18UBd+brZu4RIXBG
         nQ+ZR1sQEGpuZJ3ruXi0Y23tVxn7zv+169PZCTe3dZYN5PLynRxXIFbKM5Tp+gBIFAVz
         QkdLksH6Yj9tJuTBT7Hph/ygf4vhloXn5P3Chiv0yVSau2WYfR8JyxubJtjFWMhKLSck
         Txlw==
X-Gm-Message-State: AFuF++mJOSVU4IcNo+KE92CPoqm6Sz7Ep6Q83jQuG6arMi4mgSPNzavd
	KAEOUhkkIdoOhls37WmCW1bOEdpwE7Qa/N8+vlgjJ2KXPP5RggnHJIhrb3Ex6JMMLywFBmb/nhq
	8CGcPNZA=
X-Gm-Gg: AYBFou2HKU+f1ivdpf1GQPoaRrzqHtoyrmVn3c4V5xis5bMJCdadPdyqhQN2RJOy3VE
	KVHZDAC39LeCxbRD+UDl5SwBloHDdK4v8Mv32qgxY8loAKmVdRkXR9u6WobT9Rsut0PmxcJA5oT
	1+b78fu1vR/zRrjTnJUw0SOdeRiDvrMIHvUzO683+WzsW6MxvXSTJ8HCsQ6h59tr47cX4sTzeR4
	jGzUFjRNligf5od3ulfdiQEGo8GLR137RcN/eqKeLQcVQHtU/1gL8e0FOwK6Gb+5+IfOVYpEeFz
	yNULdzHuEoXFWeAX79N7y5TTo7bfItVIjNKVXDo4DyWxqAytkqTJ8NNTwgf3X7TRSvXAfWA5eR+
	M6uSUj9UPF9AhStBY55SP9WFSx5uos7Oh+pH0FPJxy/hVq93iy0vFEfskieY/fVnmZhUD5tUIFo
	z3wbLlCeng3uBkCwlRT3wnlVb/wm76Rzxw5n/3vquwqeCAHBBkJS93Zmt8TsdVlj7dIhsxmt17f
	t/Qn66ygqmg4yimo7wzva0R3KEoXqtvmwS+siI/+asDggU2VkTEMeAG+fNTeTQNY+m9i74XP2on
	xACy/j8=
X-Received: by 2002:a05:600c:c176:b0:49f:c451:b4ab with SMTP id 5b1f17b1804b1-49fdf152561mr24568985e9.29.1790154724303;
        Wed, 23 Sep 2026 02:12:04 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.12.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:12:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 37/48] pseudo: Add in openat2, exec and linkat fixes
Date: Wed, 23 Sep 2026 11:10:39 +0200
Message-ID: <f24e702b80f517aba83809ec6df333c0c3c29729.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246499

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pull in:

 * linkat: Fix AT_EMPTY_PATH handling
 * makewrappers/openat2: Add noignore_path option
 * pseudo_util: Correctly free memory allocated by pseudo_setupenvp
 * exec*: Replace bash workaround to avoid memory corruption
 * pseudo_util: Clean up memory handling for setupenvp results
 * pseudo_util: Avoid a memory leak in pseudo_dropenv()
 * pseudo_util: Ensure pseudo_setupenvp handles memory consistently
 * pseudo_util: Avoid accidental free calls for without_libpseudo()
 * pseudo.h: Avoid accessing unallocated memory

[YOCTO #16316]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 90f823defa32477c9dbd91d264f581fdf0ee4068)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 3d7dd62448f..7b1177f7970 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,9 +12,9 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "823895ba708c63f6ae4dcbfc266210f26c02c698"
+SRCREV = "ca47829825f297d7bf83665c0541a9de4aa78009"
 S = "${WORKDIR}/git"
-PV = "1.9.8"
+PV = "1.9.8+git"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be

