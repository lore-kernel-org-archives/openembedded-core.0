Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12629CDB47F
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 13:14:47 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20456.1782220482056607275
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 06:14:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=o57qVcpx;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490b3637b90so43820835e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 06:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782220480; x=1782825280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/S1Bia18xO+cq+GYNzHbU1JiQlMuw22mJyf1K1HG1a8=;
        b=o57qVcpxo7Gmfvk7p9DGBG6IPCjlCW/k14awsg3OImUMhP1/HkB98FgsP23GsVfbz2
         rh9rpocrqmqDXHbwPjBf0RSR6kM/uWXFusmoJki6lj1D6Tt1Z5ykbEUp1uxkaYylD08J
         DwukIuwSWnjlQcKQXXaVIwBqka0XmylB5R5pI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220480; x=1782825280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/S1Bia18xO+cq+GYNzHbU1JiQlMuw22mJyf1K1HG1a8=;
        b=tNEGEZPbiKy/R0d59bQcERYjBTkKGIf/UpoIv4rYv9ZMRoIS0QLzb3KuXefloRxOv7
         7ysJbkVp8p4p4/EONp3UXBm1dIpCdYxihaorXIT4d8KDqBAzHxWZs/8nuSTJnnaZFqJT
         AuwXNCInKJ0LKR+XPHL+RTfPUuZWpvlnMYKMMnqBksbek/87zC6eX5y+ZoXIpzukhtvo
         ZEub0IBRQ9kCl8wHTLeBeiW2ECfW/NBZSv0VCQanyBdu0yUx/HdLo58jenwYr/QVIKD9
         RwZ8VMsQsW1+rRssQIrUgNBoQkrqjl80tpawOZCb+AJ4sY/Nrs5mnuQ6r6TIi94+hSw6
         qnlQ==
X-Gm-Message-State: AOJu0YyFH8H2mxdGIvcKFD9/1YQ+OzuTFY9DJk7ZK+pl1McKs5QyzqXM
	ViWfR0a3UGksuRzfZNKGL8Py6m/MoFjGYQS+Xp0hv4GagerIBkjrei3kiV7mve4koYASWw3n7Yi
	qmeqx
X-Gm-Gg: AfdE7ckqNnTUX10l0CV5oVCLmTm2bxcaKkPtKJB7JH3ruvZX01y3g6b1AtTtddepjtH
	X1TvX2UwVUELKpSJ5qXjXfjVnMjg/OeT5si5lnXaozGx+TnO4DNIpsms7Ik2lZSgJtyrOw3pI0r
	RrkS+q64Del1GtDD6mXbNAX8zILURTwkvEcosTrvoviRjtHyixaFPfvAGml+jXy6gOIZRmU4fHz
	aKR7tTBysx+3fzYVxjNyJQr5WCTnFXcEa04LIVxDcv8Uhc5+msv5Mx1yJC/ytfyiwd76+eaHogi
	ebl8whyaVkQNuZw2OoWbe9YCNmp8t7asQSZy9G/F9qlFWraAY4UM8uPmUv9LatfV7Xf+KCwDDqF
	ncqW04HX0YeFm5Zy9JPh3FLcbyG19MptIvXO/eUR7Pje+aRUO3Wwj/Y2N/IctKXf/LbJwmu+he3
	uN/H4GopFhbl5oB/xMiKz4CnqqIIFMWsqxQ55ihV0y7/Vmrk4+JaBSuSFZEUvXnYwhWwmkvLh0G
	OdRSnAA+Dfi2oiatg==
X-Received: by 2002:a05:600c:2481:b0:491:7325:39c4 with SMTP id 5b1f17b1804b1-4925b3bc013mr25470395e9.34.1782220479978;
        Tue, 23 Jun 2026 06:14:39 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa008234f3c115adbb1a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8234:f3c1:15ad:bb1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4925d013a69sm24334285e9.3.2026.06.23.06.14.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:14:39 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 19/26] classes/gtk-icon-cache: fix libdir passed to the postrm intercept
Date: Tue, 23 Jun 2026 15:14:00 +0200
Message-ID: <cd46a25fa3f7ffe5518c7c95f280a7760455aac8.1782220259.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782220259.git.yoann.congal@smile.fr>
References: <cover.1782220259.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 13:14:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239385

From: Ross Burton <ross.burton@arm.com>

Back in 2015[1] I fixed the libdir passed to the postinst intercept, but
I forgot to also update the postrm intercept.  This should also be
libdir_native, not libdir.

[ YOCTO #13896 ]

[1] oe-core 0fe8400717 ("gtk-icon-cache: pass the native libdir to the intercept")

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 92dd67114be325e019c149bddaf5f874f6917094)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/gtk-icon-cache.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/gtk-icon-cache.bbclass b/meta/classes-recipe/gtk-icon-cache.bbclass
index 9ecb49916c2..2ff10c21181 100644
--- a/meta/classes-recipe/gtk-icon-cache.bbclass
+++ b/meta/classes-recipe/gtk-icon-cache.bbclass
@@ -46,7 +46,7 @@ gtk_icon_cache_postrm() {
 if [ "x$D" != "x" ]; then
 	$INTERCEPT_DIR/postinst_intercept update_gtk_icon_cache ${PKG} \
 		mlprefix=${MLPREFIX} \
-		libdir=${libdir}
+		libdir_native=${libdir_native}
 else
 	for icondir in /usr/share/icons/* ; do
 		if [ -d $icondir ] ; then

