Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D9FC433F5
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 04:36:30 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web08.20253.1637901389082391941
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Tx7N3hk9;
 spf=pass (domain: gmail.com, ip: 209.85.210.174,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id p13so35654pfw.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=nMbY8tf6GQoyYqplg/MDxl/3B7UeCtSZt23x1wgVVeg=;
        b=Tx7N3hk9WRUXvg4O/v/sjmg5vUcbJzOjwD02+LEad8hPWjXHCZclt8n1X5ejqUBIXp
         WlY0jcFGDg38PYvS4EkUE5GMO58wc4P2HcfsXk3z1kOTmCBWxiO/mK9wRezK/9hlaPSZ
         hIDGjwPhbtx4gACADpfatSE5zU8tdsVztnDYmBVFBw1hsV5gCP5V8zBGChGXtnv4GOy+
         m3ndcTtnQ1bBfdwaO5DhJiTPRwtvQr/RvenIoAcsOgCOZC5QE+6FV6lSfNNjPb1QBisu
         4abUwjVD9vmgMhnnj9XgdQ7htFaledBOmHFoyKizGQYco45AnZyMnEdIJf7Qrceh1qKY
         ip7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nMbY8tf6GQoyYqplg/MDxl/3B7UeCtSZt23x1wgVVeg=;
        b=vKgWOSWNhJUNKVZRRbDuATNk5vdJuEDeb1siFrQafuftB8jdr/z9vyDcwJluOIzZOg
         PkrecPRZjZ6YLIMBgBzx4EA8mc6bMeB45O0Lk8G91FISY02vwuuBoTFooJhdURao3MdJ
         ocjMoQQ0HhsyV6fm8r76/AXsP/CB5it1clPcy9Yr0qMgJKf74cj5Ji0fxSV1tFzNYLJc
         vERyIQyy4T3PFd7HmF9ydx2Pk86HbC2rfnceik2Q4Xi353uNLaj0kbUzxb810Emc0JI7
         qrdMk7RrbNUmKTTkCfVYmjJ4T0yud+HGF/VLYo3U1BeugXuttUiJrohVs8ZD7ABYDV/4
         xGuA==
X-Gm-Message-State: AOAM533rInGemw7j/UNM0gFAHdtMu8WIRjm3pcALWsJiNGVXg0OyW10o
	FTV8KMWoj9Q8Kve2WlluSyonaKjN6GM=
X-Google-Smtp-Source: 
 ABdhPJwV+vWlEKYgTS/z3yUF6ELFGAU4WKe2SjtJ2U4gfZATFhjqF4KU7i7BMaGIUGuwSGXRQDPj4g==
X-Received: by 2002:a05:6a00:1242:b0:44c:2025:29e3 with SMTP id
 u2-20020a056a00124200b0044c202529e3mr18919278pfi.59.1637901388314;
        Thu, 25 Nov 2021 20:36:28 -0800 (PST)
Received: from nereus.local ([2601:1c0:6000:1830:2111:e66e:a58a:6736])
        by smtp.gmail.com with ESMTPSA id
 fw21sm8909282pjb.25.2021.11.25.20.36.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 20:36:27 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 16/26] bind: inherit setuptools3-base instead of distutils
Date: Thu, 25 Nov 2021 20:35:55 -0800
Message-Id: 
 <5f8000e0846ff04fc7e38747ef5a475be245649e.1637900380.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1637900380.git.timothy.t.orling@intel.com>
References: <cover.1637900380.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 04:36:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158812

[YOCTO #14610]

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 meta/recipes-connectivity/bind/bind_9.16.23.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bind/bind_9.16.23.bb b/meta/recipes-connectivity/bind/bind_9.16.23.bb
index c1bf250c26e..f4db113c7e1 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.23.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.23.bb
@@ -46,7 +46,7 @@ EXTRA_OECONF = " --with-libtool --disable-devpoll --disable-auto-validation --en
                "
 LDFLAGS:append = " -lz"
 
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native distutils3-base', '', d)}
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native setuptools3-base', '', d)}
 
 # dhcp needs .la so keep them
 REMOVE_LIBTOOL_LA = "0"
-- 
2.30.2


