Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F3BCDE005
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 22:27:15 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32864.1782253630039697113
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 15:27:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Yf0+0WrI;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-46255b269c2so270071f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 15:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782253628; x=1782858428; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/S1Bia18xO+cq+GYNzHbU1JiQlMuw22mJyf1K1HG1a8=;
        b=Yf0+0WrI1sdyxdej3cqEsVu0Ce9QNrzYz3U97Li+23Xyrn1P94EWWVeLWqX05o8bdv
         JIYy80iIj9sPpM05wZIawtILgvvFFpU68auP5Ac5je5E4TVrUVgu4rIAgWKwvVC42+aA
         oAOPKUwXuQlkZ7vRj3m5ZKG1HkZLlViifjZnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782253628; x=1782858428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/S1Bia18xO+cq+GYNzHbU1JiQlMuw22mJyf1K1HG1a8=;
        b=hykUwcdS4PKKlNbrk5hsYIgk8AhdnUX2PRMmfXJw5cztQSfML3nKyt8HzpipfRqnf0
         v416HdcVZc6JBA58thNW8ZtyyTZ7HeCdN9S2dhbgo0bcF2ri4MyPLybMNnXRHad7Ji/l
         k3vTj56jokJCT+qNbsyFYV+j6X8IWFJfeD5HVISmPDUQCmtJ/CS2YMboB+PwHJvJFiiI
         KiGBIk6LPFJAMRanNKUlAQzlM+13Gutca8sAGt1BtTOTSd74nyJvHVFPlCXsyprJS9vr
         2MkcYQk/KmdntX6gKjSzHPdbHGDNhxs50PC4uQMpDYqAg3u3Yt1DS9W1lD960RaVnS8l
         KFyw==
X-Gm-Message-State: AOJu0YwpKWRmdHvc74RDAEDL03L4KzcxVMNxTQnN6UVLZkI/HzfqICHh
	6alW19+y4U7RF3I/bkbd3GnGOxG53HdTCeA3opLlk0d8rY9t1lkOr5vZX9A1BLS1V01bMuIHnLE
	vWcW1
X-Gm-Gg: AfdE7cmONO5ChkHUKk1f5tnGkvt1lzHPfo+3N6vqAQpU+06liX1rArggTbekqTTp5u9
	VocwiRqkmfh8eFWwEUkaTGGdOUZpjvLVM8KhIffnD0AFDupKU+WEeDnFEa0s29iI+ikBfueXAQF
	HO5jglykjAvorl+eMC61LZHfN9ZjQ/SFvPSrSX6RAUZ3zkansFs+ZQP5Z/oQjnrkmS6xw2HRJsm
	S7PUm3zsM7v0ChQwzMg4HQd1GydOUDsLF+D9RUTDfCuz1sz30nE6X2kGsqRxWI6b6XK8bKlVhw7
	2moI0Gh+IksdGjgwd6+/DagkzgGHq/+5x1RI+LoiZvKn5USPvOWGsdWOwdp6RwhzGxGVT6JNrrk
	e+QQTzfVVW5PhRYwYvnsnZ45DdyKnSN46asOO1z40AHzu9bTgznKRHxhF2DU5jCvk0t9hmXgSWo
	3A4ljZiOJCQFAXwU3Ee/bpP3cfySUSVrc/jxVDp1bZv3XI0j1Ov7jWVTsJBWyM0VChTt7YEQgFO
	L6I6RYDWu6irmAU
X-Received: by 2002:a05:600c:6553:b0:492:4c2e:9610 with SMTP id 5b1f17b1804b1-492608481d8mr4227765e9.11.1782253628258;
        Tue, 23 Jun 2026 15:27:08 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0055dd0cae868d89dd.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:55dd:cae:868d:89dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd21dbdsm370786745e9.6.2026.06.23.15.27.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:27:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 19/41] classes/gtk-icon-cache: fix libdir passed to the postrm intercept
Date: Wed, 24 Jun 2026 00:26:18 +0200
Message-ID: <cd46a25fa3f7ffe5518c7c95f280a7760455aac8.1782252148.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782252148.git.yoann.congal@smile.fr>
References: <cover.1782252148.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 22:27:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239441

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

