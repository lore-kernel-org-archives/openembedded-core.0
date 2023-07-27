Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24947EB64DD
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 19:44:32 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.16732.1690487071895815197
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 12:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=kQgvEp8M;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-267fcd6985cso934580a91.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 12:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690487071; x=1691091871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vhV1uO58QQdhg3sCh9tELHTMB9wwNF+OJ5Rz6JrRpbQ=;
        b=kQgvEp8M8go1v4i2KZ5llNekWf/kiU+6bJuSuoXS5nlzPFBB+oJPNYJWhdQQ9kwtad
         jMr6/4arbPIlnodiR+qPzif40D0C89BMJXmTyyglUdHOkhGgR5+E0ZzmazRdPFQlcQUK
         cmlCb1oBLNtoedr+tI126CV8omMpWT+JCNye8rHYGGU3ZV1TLXD4zj0b5/7E6ANOmTdf
         KKq9xIHXhoR3VmDnHnVKSkIb61K+qbz2wzl0XMdOcHDnYhCSKL7UVSdhVJdRXyiDZkW+
         /h452B/iKDnDu5TfLTVWica0ub3nBe4ydkMWxucGiW1Ix2e6XgIbtmTVqKrRVi6TfL/R
         54uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690487071; x=1691091871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vhV1uO58QQdhg3sCh9tELHTMB9wwNF+OJ5Rz6JrRpbQ=;
        b=SIYFd28ckjiBMzOoxJQTWsdHR68GC8JMuNDSbHDC+hm8NHcwR5A4brJxugdmPndEyc
         fdgdgMid/4ZOC6tNhs9wE9SKIE7F1w/6DW81CvikKUeimeVmjkOei3X92IiLUepb7Xph
         vgR9LJPi5wphlsrM4vFKLEV8z37F73j/buVq2o37Rk0AcPfadQWT9h+q7pUNfutVK/sr
         YtrQhPOpRkd/kq7Ilg2ddqFyfiiVhagru6qMLHyUUxJfwj5ymzpI1vGKdl2Y/UW7atzE
         Ft/iZinm9Bn1EZuvOhvpCPBQAGAVU9xVTcW2PP0zly8o/zEOgXjaLhm+hHvnnE+lCCxS
         b1lA==
X-Gm-Message-State: ABy/qLaUbPvLvzCdUVYF0ZE1WIeQTaLLdzbSgnS6ni9u3EVnDS+yyH8f
	mrDFWFwUXeasAQbFbswXMcsCKeN/FAqeeaq9ubU=
X-Google-Smtp-Source: APBJJlG+XZdL7abfMqyX/oVMxm2x5QXQiTkCas4bWkM9e1LLxhkaQ05XsWacbJ7Puy8bWOJeJIBESA==
X-Received: by 2002:a17:90a:6b4e:b0:24e:4b1c:74d2 with SMTP id x14-20020a17090a6b4e00b0024e4b1c74d2mr263725pjl.32.1690487070949;
        Thu, 27 Jul 2023 12:44:30 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 29-20020a17090a01dd00b0025bcdada95asm1620532pjd.38.2023.07.27.12.44.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 12:44:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 20/27] meson.bbclass: Point to llvm-config from native sysroot
Date: Thu, 27 Jul 2023 09:43:38 -1000
Message-Id: <aa91fb2f0af1a32809ab1755598da5986b2dd06d.1690486929.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690486929.git.steve@sakoman.com>
References: <cover.1690486929.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 19:44:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184995

From: Khem Raj <raj.khem@gmail.com>

Default search in meson would grok /usr/bin for llvm-config and if found
will use it, which might add wrong paths into cflags/ldflags, since we
depend on llvm-native when building gallium support ( thats when
llvm-config is effective), its better to point llvm-config into native
sysroot so it can add correct paths into compiler/linker cmdline

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cc73360b9728812ed6123e30559b77d8e89cc21c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/meson.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.bbclass
index 48688bed75..7f5e9b1943 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -111,6 +111,7 @@ nm = ${@meson_array('BUILD_NM', d)}
 strip = ${@meson_array('BUILD_STRIP', d)}
 readelf = ${@meson_array('BUILD_READELF', d)}
 objcopy = ${@meson_array('BUILD_OBJCOPY', d)}
+llvm-config = '${STAGING_BINDIR_NATIVE}/llvm-config'
 pkgconfig = 'pkg-config-native'
 ${@rust_tool(d, "BUILD_SYS")}
 
-- 
2.34.1


