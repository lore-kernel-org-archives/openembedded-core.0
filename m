Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED9FFC28B24
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 15:59:24 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.16573.1741190361830414216
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 07:59:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tbz/bB6R;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-223594b3c6dso123555745ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 07:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741190361; x=1741795161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s3bmNvP43qg1JzqjGZ8Jxgfh2xH3ugv2jV7GlPY3Btk=;
        b=tbz/bB6R8sdd83HIyNnscjXjmzZvPShEBd2+9szqgf5wIitSRtH3f88Ps5kUIM+4d/
         ozqxTQl05FF+LUohjAZ9zrUXrizt8P5DuIpciYBQZDOYTF2v3qRBE7DE3xgI7FM61oOe
         QI5tTSOQevbT3K/i7MHj2Bjjw+MglFIP+ik9yMTiNPSchNf/h3NcE3lwRg4yJDcuaRzA
         WgnRncuGebq1dhKn+N5p+SHo1dRc4YycZveOB/88L74eX44fC1nqUgXn2GoO0g5pcqxg
         /+ZIDv1XL02dnOsBZ66VK8vDCmy5nv0xYmRnWyxTIG0yjjTvrYLVKaE2Rr0NIUiF/0+E
         HEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741190361; x=1741795161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s3bmNvP43qg1JzqjGZ8Jxgfh2xH3ugv2jV7GlPY3Btk=;
        b=F3mJ5utoZfeiInAf5NDQLAnmuolVjqRjo561/Mf2OTvRtPalxjK3svTIlM3OOh0ApO
         XYSu7p0x9XkYNrAIadaYWRmQKjBp36W5gCbQIpvWbClNLp8O/MAhJKzHARXiYgu35sKV
         EYdnj2ig8cCFO6EsdjVdIyrSBEBq+OFgXE8UvJQY7kiNgwdRQFbqTlSzrSiKoBz/tMI8
         xt5Pee/uYOznD6PjdxuRv1BfashHTo53YJWyPX8Qc5IXluI3eCgM59GQD2iw/QYaAAxv
         f/X2ckrsCbBon1w3xRpCwpT+zXhOasPeoCqOVeLp+pMKFwnAX09U3c+I7ymZ063MnjlO
         Mq2g==
X-Gm-Message-State: AOJu0Yxwf+skzl2pTO1QD+862EQjiytMGTGQO3JiReX1c1WHNHn1P39M
	zcmsWl7zXieLD4+SBsvRKwf9iJyLpnk6ryG3hXEBakG7LRU8fWTQHvo59txXIdaubYnry0VBNIm
	t
X-Gm-Gg: ASbGncvtNu/LVDZvAH/Ab0z4uzZd4Pt3honnzGA7GVNljXijVbGTDmAAuHZEbb/F4MS
	IwnpooMRK5Bp2JFPYlDi7s7F1Esmn1EGbv13mOecQecGv0+1jxs4Ar1tvOtM+F9kCh5rCCBvy2c
	9SV8pJWbxwV57IVt2AgV/6XWIAyt9PQQ2zn4S/3xgGzB5joEQVXGbNqUhXCH0I6hKRcbfAZoBJo
	R/eHd/IJfT5PisgTXABaFAh9Ch6hk4j+Gr/zWbDc/kygbXqxhdj1HJWzTyINhktsigFI6S7NuUd
	2FT3gbLXRtG27GnMN0ipivDIZ9eKkFR79mQ=
X-Google-Smtp-Source: AGHT+IEPraMxr2j76gfB12okfxRqXP+WZFYqGZTAKO8EQ5pWEE34riqp62ob3hwjH9C7T3T3COxN2A==
X-Received: by 2002:a17:902:ce12:b0:223:5a6e:b2c with SMTP id d9443c01a7336-223f1cd7430mr60135585ad.17.1741190361083;
        Wed, 05 Mar 2025 07:59:21 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:2308:d28:2350:a5eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501f97bfsm115411025ad.85.2025.03.05.07.59.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 07:59:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/16] mesa: Fix missing GLES3 headers in SDK sysroot
Date: Wed,  5 Mar 2025 07:58:45 -0800
Message-ID: <0d9f2fcc2058407eb138297d9f8f12595851b963.1741190221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741190221.git.steve@sakoman.com>
References: <cover.1741190221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 15:59:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212338

From: Johannes Kauffmann <johanneskauffmann@hotmail.com>

Building weston with core-image-weston SDK fails:
```
../libweston/renderer-gl/gl-shader-config-color-transformation.c:29:10: fatal error: GLES3/gl3.h: No such file or directory
   29 | #include <GLES3/gl3.h>
      |          ^~~~~~~~~~~~~
```

Both GLES2 and GLES3 implementations are contained in libGLESv2.so.2,
which is packaged in libgles2-mesa. However, the headers are split
between libgles2-mesa-dev and libgles3-mesa-dev, which is why the
GLES3 headers end up missing in the SDK sysroot.

Add a dependency so the GLES3 headers are properly associated with
the GLES3 implementation.

(From OE-Core rev: 7e1308ec413e69a8427ac5998431005d9e4b8033)

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Johannes Kauffmann <johanneskauffmann@hotmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index afac8014fe..3c85a3ac55 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -191,6 +191,11 @@ RDEPENDS:${PN}-dev = ""
 # development package of libgles3.
 RDEPENDS:libgles3-mesa-dev += "libgles2-mesa-dev"
 
+# GLES2 and GLES3 implementations are packaged in a single library in libgles2-mesa.
+# Add a dependency so the GLES3 dev package is associated with its implementation.
+RDEPENDS:libgles2-mesa += "libgles3-mesa"
+ALLOW_EMPTY:libgles3-mesa = "1"
+
 RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'libclc spirv-tools', '', d)}"
 
 PACKAGES =+ "libegl-mesa libegl-mesa-dev \
-- 
2.43.0


