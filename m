Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC3DCCF2C1
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 22:24:45 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5932.1792189482084913972
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 15:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ObfKp7g+;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e011d370dso246003f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 15:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792189480; x=1792794280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CvV6OwNGlgy99lHzHmnVMai4AtVwiEqWKmZYAo1OniA=;
        b=ObfKp7g+FrZxQQX2cp2aNxBSgHbE5SZP1NZ8Mf9CDqZBcix4Ff2wP2OE+EnuPQ1qO8
         4ak0e1p7TVlM+WXjFUUVKyreSlgFo1WUjs+D6D/IvqB6cer7ViIRRigtJ95brN4ybA3O
         kepGUccAcaSrwEM3TwjeE3ArDC/OucL3d0KMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189480; x=1792794280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CvV6OwNGlgy99lHzHmnVMai4AtVwiEqWKmZYAo1OniA=;
        b=FZEcbQzAIX0vEpcOA2jzQpurYzTgcFeOLDZ1wc0GBbNDdp/D/lRLN+XEPBNlzPYp2o
         KOI64jhp9DeliLJzWjNpNFjsa7X7SLleRG3ngWmhN2THAO8x0sqzmbyc3xTG3d9KRR8X
         YsrzFPHnIuNkdz8olc5O+mv+ni6pys4wh8ydqiy3303sYTyWSniBxY9Gl40bclr8W1MZ
         n/ffrKNLu6yE1ggwX7kSm4qXCbC8QeggOXsH8CK01u5yf/VoLBKdvKjqEvPpOQkNX7SR
         AT5FBKXXq8iCw0j0jwHNE0vtijCsB9sDb1vQEIpTzPatSZPT94opoXm4aj770H2wpbEw
         UTxQ==
X-Gm-Message-State: AFq9FYJv4Tzr05sWgKioZcqXH30ds4EECA+2E97TaiyPAAU2EB4qdI5s
	VYrXaM/D0DuhfMTjAyaJkrsUNaJGXAbwDHmJcmmKsaBIt/aPj/J0sNOKA2KS2953aP+54XFtdfj
	I9lgdipc=
X-Gm-Gg: AYBFou1BA8GsohNdqpRZxX7XyIR5vjkpLCJA6kqK0ixCRyX/fUbSXygin7QkslA2GoL
	NymrUJvM4AecOI9XE7SCI8/vFCh6kCbGxRzzW9fILgodkDRreL+fTi5qN9INxg6t/zoDJR+luhH
	ACNzBww0jqdLrvypsxyyNbK928Vi3AIT+r5zKKNcfQ09mjRGAhJSM0dbOJnYaeUcsX1ITEjVkFO
	r6B4ZX3I5x9QC9On3DtKkt5HZfvn4iB/41KZVvHh3E5aZzoRA1tZwNZdskSJb9YGBzd4UwyA0LV
	Adkm+URyaAEMq0eQCu3BPmqipf1afX74K+u9US0MlBeDfvj9FQk5DQwL/YklQFku9ZVViysVbRX
	crCuvC80ZHElBJG4y+gM0I+TM06KOyDv5C1hUIAGT0FGEAIsbI4NKhfSYNDF5KnhIH7F278cO1U
	JxaYOIKHtBp+3e2BBnaDAnLdRz8ZrXq5WuyZk053sGWrCHUiVkbP6Va997+CaaPsR8/BkWamNcl
	NG0VRHib1r9tnGFaDnFCsAFi9oLS+des0AxlTU66GS/u9ps2rJNb1Jj8BYSGzPSi4/Z0xNDvUM=
X-Received: by 2002:a05:6000:400e:b0:48d:dfff:fe6b with SMTP id ffacd0b85a97d-48e07f9aba7mr1899300f8f.34.1792189480205;
        Fri, 16 Oct 2026 15:24:40 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503862sm7639515f8f.46.2026.10.16.15.24.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:24:39 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 01/17] python3-click: depend on python3-shell for shlex
Date: Sat, 17 Oct 2026 00:24:03 +0200
Message-ID: <2e8d0b832309c5c41a2e0e7d3ac23b362d55387b.1792189264.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792189264.git.yoann.congal@smile.fr>
References: <cover.1792189264.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 22:24:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248050

From: Darsh Kelaiya <dkelaiya@cisco.com>

Click 8.5.0 imports shlex when loading _termui_impl. OE packages
shlex.py in python3-shell, so add it to the main package's runtime
dependencies. Confirmed module ownership in python3-manifest.json.

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8dded0894fdb2c17ab8f8cb2f13f9f95638d493e)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-click_8.5.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-click_8.5.0.bb b/meta/recipes-devtools/python/python3-click_8.5.0.bb
index 05a8fb343a7..d6017e3d7b7 100644
--- a/meta/recipes-devtools/python/python3-click_8.5.0.bb
+++ b/meta/recipes-devtools/python/python3-click_8.5.0.bb
@@ -28,6 +28,7 @@ do_install_ptest:append() {
 RDEPENDS:${PN} += "\
     python3-io \
     python3-threading \
+    python3-shell \
     "
 RDEPENDS:${PN}-ptest += "coreutils less"
 

