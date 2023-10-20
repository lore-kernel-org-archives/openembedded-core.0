Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AACAAC07480
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 15:52:09 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.57875.1697817125999021860
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 08:52:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=D3YmWBtj;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6bee11456baso859468b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 08:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697817125; x=1698421925; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJo8zKN+0dzA/cLAQqZpJo98vczXap30m2ZbW5Bd+Tk=;
        b=D3YmWBtjW9j/lXXde3PPE8Fewljc/ckoo2szsVrFU+ON+vz4B37ers5wQGro8env+N
         X4u0Ff424I3WTy/wXM1ZaN6hUpx5QGxcUfM5vaMaXaXdma5/z35/M5CbnC9oKXpXCUUS
         U0/IB+lidU4k/yTutGKb1vg7dxyklU+RkhNpLIhvCsaTVAxJN9TDCeWrRsEBJ8CVoJSV
         AgfLzo4KfoYUBW3usd7V4xvIG0RWepMhNpVH1C6+yb/ODfIpRyGh5qoOYnzOCuOfSV4U
         5sk61zmJWh+VYOIXG3qEfu2HACnMfyXh0X2cuhGKsv97aW+NgOHJc47WeOfSzUd35BDU
         b7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697817125; x=1698421925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJo8zKN+0dzA/cLAQqZpJo98vczXap30m2ZbW5Bd+Tk=;
        b=Iixqpq2xJigFt+G/MLBLPGU1WcSuz2b2/JYbKzKYcraGDv4ZhGd087w4ijiv4nPaVY
         avTLOvZppFWQkiFLKNVWdvm8k1ob5ztFD9Be3sYTmwqUr96L+iI5LMMCiVe1OUR9Cvy3
         RfMSoQqWsL48Fo5XJbYW0PdlrUNZ7rervYDXxhcgzwzP6yIUhuq6zs7VJdQTzrmzle3z
         a23Lb97F+BSHCfRbFNKVDZ9e9rVgltWF5YvKjRubZIzgUnayn22GFN5nQf8eEIHOAl+a
         zC79T/lh6DZeNvv3LU2zvdJueaUVKS5g/ZiYprQlEsGEWXqHQTiwaWKGDu0ewV71W/Lm
         hDHw==
X-Gm-Message-State: AOJu0Yzo+thu+VcuPukZoCSwpE4Xh+6HNpt3AMo1VYl3dU849jT1yFcn
	1n2VNHbY3PHHTQz/YGXfsE6uiea0O0u715ntdB8=
X-Google-Smtp-Source: AGHT+IHmbmHtyzhBlDCnBo8A4Q0p0+28Av3J5h0wxt1XlKGl80fzVBG77brzuMZeaxMdR69eYoJc+A==
X-Received: by 2002:a05:6300:8004:b0:171:8e16:ea86 with SMTP id an4-20020a056300800400b001718e16ea86mr2227331pzc.31.1697817125012;
        Fri, 20 Oct 2023 08:52:05 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q12-20020a170902dacc00b001c71ec1866fsm1679244plx.258.2023.10.20.08.52.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 08:52:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 17/24] fontcache.bbclass: avoid native recipes depending on target fontconfig
Date: Fri, 20 Oct 2023 05:51:19 -1000
Message-Id: <7956db86a7377bc3afefcbbb6f92aae9161df715.1697816789.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697816789.git.steve@sakoman.com>
References: <cover.1697816789.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 15:52:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189562

From: Martin Jansa <martin.jansa@gmail.com>

* this caused liberation-font-native to depend on TUNE_PKGARCH target fontconfig
  because ${MLPREFIX}fontconfig-utils is added to RDEPENDS in anonymous python

* the dependency tree for liberation-font-native got much shorter
  (just quilt-native and liberation-font-native itself):
   2 after/pn-buildlist
  78 before/pn-buildlist

* fixes graphviz-native signature issue as well as detected with sstate-diff-machines.sh

  $ bitbake-diffsigs \
    sstate-after/mako/x86_64-linux/graphviz-native/8.1.0.do_populate_sysroot.sigdata.184d4fd355f1e7a2d7d929ef4b5f62b94e2071df9dd674b2067ec21bfc7bcc1b \
    sstate-after/qemux86-64/x86_64-linux/graphviz-native/8.1.0.do_populate_sysroot.sigdata.35da674d2dbc275bac02869dfce4165466315023910bdef65a6026e2cb942a46
  Hash for task dependency liberation-fonts-native:do_populate_sysroot changed from 310d3da04ad9abf8ee99997e53d1ffa71c2b7d9d60fb0e8de85171a9ab6a77d3 to 048420ad1410c2b8d95498fc3c11681207335a2c722836f1f3e683cc449814da

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 998d4da9d89aea77dc0f2cbac60ea64258331756)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/fontcache.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/fontcache.bbclass b/meta/classes-recipe/fontcache.bbclass
index 0d496b72dd..6f4978369d 100644
--- a/meta/classes-recipe/fontcache.bbclass
+++ b/meta/classes-recipe/fontcache.bbclass
@@ -13,6 +13,7 @@ PACKAGE_WRITE_DEPS += "qemu-native"
 inherit qemu
 
 FONT_PACKAGES ??= "${PN}"
+FONT_PACKAGES:class-native = ""
 FONT_EXTRA_RDEPENDS ?= "${MLPREFIX}fontconfig-utils"
 FONTCONFIG_CACHE_DIR ?= "${localstatedir}/cache/fontconfig"
 FONTCONFIG_CACHE_PARAMS ?= "-v"
-- 
2.34.1


