Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71FABC4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 14:28:42 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.2854.1702391313425797118
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 06:28:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1ySo3i7Y;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6ce934e9d51so3552211b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 06:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702391312; x=1702996112; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f1z9CwmikODnfGtaNgDDPL8QkZGV9rRJjAtzNaHRlhQ=;
        b=1ySo3i7YbCRiLDl2JY6HZ7n/yQ2A/9OnsxFB3q4k2Htvz248URtj8S5bjDDgLa4Xx7
         7NV/kELuJyP8zmAoxfpQue2FSKJsaIVIe2+MkGo4rtInXM9psUNjRK/DU46qxHQlBBhE
         GL4/+4oECSDgm+EbOa9LJ/utyQfwpOuKltBe31/KeVSaxjR3qaMOZLQMBM7A7WXR0sZm
         i9O12rWIaEngZI1nJMWyG13gU8MuPdjrEcwi2l24cHLOTF6vgUF/vzejMqODTasJ7SDl
         J4MO05jUEgd4lzz/nDvAoVIvniPPw1k+ouGf0DuVspjMe2xyhpZ+mOcbVqpUqWjL/13o
         HwHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702391312; x=1702996112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f1z9CwmikODnfGtaNgDDPL8QkZGV9rRJjAtzNaHRlhQ=;
        b=LKQ2b200Oy6wYnGyJBf4FaQGp7DdytYFZFyZfkDFyRGbMEpyhsN9ywkIUg7Lm3TlbK
         jD9tb0bFW6yOLLQE2MK2Ovdo6opQZXRI30xcYme2tNY4jpsNdpjV6DI/YpenNq2FXizV
         mkVrxzCcyCIAkev4QT+pdjwoaHa6lXu6a/RDb5GdUKWgQAIu04usevsUkhfgBnv6w3wu
         M/NFxxXoIyfUdqrPU9GNeddq0q0Bat3IqBtzAjC8oy6YEZjyrOL5DByt26M+2B724WN3
         h3GqIr2zFz8cmGgdQenEKetb1PI2mTcw3UZvh9wSbhOGKYiDkIMNrBlI8cMqOSyarGAH
         tSyw==
X-Gm-Message-State: AOJu0YyQx31QgDXIhoYWEZvNueI2RdrNLBi1BmjP4boSqX6Y/e1ZJH83
	ZfRbDtQ8xG1oZwNFc319dWRqlkNNNXtb3nUX9qw=
X-Google-Smtp-Source: AGHT+IHgyOY8xOlXGzTA/8iFh2Hqwj+62h6lewmQRwYTHaMw1rm9u3CBx0Sa2CzjSbSBAMi1+1z6kg==
X-Received: by 2002:a05:6a20:1006:b0:18f:97c:9293 with SMTP id gs6-20020a056a20100600b0018f097c9293mr2929835pzc.120.1702391312183;
        Tue, 12 Dec 2023 06:28:32 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n23-20020a056a000d5700b006cbb40669b1sm8188928pfv.23.2023.12.12.06.28.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 06:28:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 26/29] update_gtk_icon_cache: Fix for GTK4-only builds
Date: Tue, 12 Dec 2023 04:27:32 -1000
Message-Id: <9de44606319c1bcf5a0a80399073e391954dfdbe.1702391115.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702391115.git.steve@sakoman.com>
References: <cover.1702391115.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:28:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192230

From: Zoltán Böszörményi <zboszor@gmail.com>

Try to execute both gtk-update-icon-cache and
gtk4-update-icon-cache after checking whether the
commands are available.

This attempts to match what gtk-icon-cache.bbclass is doing.

This fixes running update_gtk_icon_cache during do_rootfs
for an image that contains only GTK4 related packages.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/postinst-intercepts/update_gtk_icon_cache | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/postinst-intercepts/update_gtk_icon_cache b/scripts/postinst-intercepts/update_gtk_icon_cache
index 99367a2855..a92bd840c6 100644
--- a/scripts/postinst-intercepts/update_gtk_icon_cache
+++ b/scripts/postinst-intercepts/update_gtk_icon_cache
@@ -11,7 +11,11 @@ $STAGING_DIR_NATIVE/${libdir_native}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders --u
 
 for icondir in $D/usr/share/icons/*/ ; do
     if [ -d $icondir ] ; then
-        gtk-update-icon-cache -fqt  $icondir
+        for gtkuic_cmd in gtk-update-icon-cache gtk4-update-icon-cache ; do
+            if [ -n "$(which $gtkuic_cmd)" ]; then
+                $gtkuic_cmd -fqt  $icondir
+            fi
+        done
     fi
 done
 
-- 
2.34.1


