Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06753C4706F
	for <webhook@archiver.kernel.org>; Sat, 23 Dec 2023 19:52:13 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.13324.1703361124016439458
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Dec 2023 11:52:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IIGtFg4B;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a23566e91d5so333061766b.0
        for <openembedded-core@lists.openembedded.org>; Sat, 23 Dec 2023 11:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703361122; x=1703965922; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iDfkn5+DELS+Jp8R283Rs8dG0KEonFlPJY8L8cU0dJY=;
        b=IIGtFg4BbHy9EYfEa2l/Mlcf8eMIE6Jf9CVJE5ZQBBFD0jQHf5DYszZ/25+0lATZq+
         kgshVo9Yl5cM4yGleVANwFqV7G7tZIOO/C1b+j+h6vcKT9CnxZFH5V7hrG4w8fdR6UBR
         IlIL5r9plyt7szBrK2YUPBH5tdVn/7nxI5p4h22CEHovCYMYDOm2O8RheHESoPqjIQxK
         sJJ2iDszKWrViFxhe0YarDrA8PcCiLwlPDekVhwIZ3wYJh83T5IHhHQM4uwXfscrzTS9
         G0+L1yRrS83jjB0VvWZjVLAnYTmQ4N+8V4wWYhiCQ0K5BBViuuFn6+8mkRYz28GP5n9v
         KTpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703361122; x=1703965922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iDfkn5+DELS+Jp8R283Rs8dG0KEonFlPJY8L8cU0dJY=;
        b=FznB3xbdFQJ4OdbdPM768qo0d/5uH+ucdOEeQ+XssL4sqo3OIAOwrsPJyAvqCG64GH
         Dii5MSQITjEPi/2JSVA2gue1maKMyejYTNZxNwKmOgw8o4+MwAXNleNIRqgMRWf1wfu5
         O9F3OZwihOX6FBRM2dAL06j9J/VG+xy7mJ8riWNEAIywfhSkGOFotkgQIRB8aebxhbf9
         I7KHHw76+AWuzGAqPIzAdv0l22fGR/x5NJ/YS8AXU5D18arfxtZgJ68H9DhCfJXSvobP
         039sZ5TDjqWmG5NaT5Q2QUrJVT2t584R20xNLYf4pBhdutmBJeGX3SfjCMBH3rY/NRC8
         4A7A==
X-Gm-Message-State: AOJu0YygDnbbWcs8Bu26MqI9ap/HsxC7eo1Mw70bLhZFOAKTeLzJHygz
	RE/ZeqgEDp97yVQsB+xNogeR0AwtnbY=
X-Google-Smtp-Source: AGHT+IE3OmeiLQ1nV9MTWe6exnH+Q7yJZg65TXorpYCYlIT9Yo1XsMNRYpb8RbnvWlJmb+kcPdjK0w==
X-Received: by 2002:a17:906:7f0e:b0:a19:a19b:4271 with SMTP id d14-20020a1709067f0e00b00a19a19b4271mr1121215ejr.220.1703361122281;
        Sat, 23 Dec 2023 11:52:02 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ey6-20020a1709070b8600b00a26abdff0ebsm2773293ejc.142.2023.12.23.11.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Dec 2023 11:52:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [kirkstone][PATCH] elfutils: Disable stringop-overflow warning for build host
Date: Sat, 23 Dec 2023 20:51:48 +0100
Message-ID: <20231223195148.3289580-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Dec 2023 19:52:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192887

From: Khem Raj <raj.khem@gmail.com>

Some distributions shipping gcc12 end up with stringop-overflow warnings
e.g.
/usr/include/bits/unistd.h:74:10: error: ‘__pread_alias’ specified size between 9223372036854775813 and 18446744073709551615 exceeds maximum object size 9223372036854775807 [-Werror=stringop-overflow=]
   74 |   return __glibc_fortify (pread, __nbytes, sizeof (char),
      |          ^~~~~~~~~~~~~~~

Until fixed, lets not treat this warning as hard error

MJ: this is needed e.g. on ubuntu 24.04 after gcc was upgraded
    from 13.2.0-8ubuntu1 to 13.2.0-9ubuntu1 which includes
    switch _FORTIFY_SOURCE to 3:
    https://changelogs.ubuntu.com/changelogs/pool/main/g/gcc-13/gcc-13_13.2.0-9ubuntu1/changelog

elfutils config.log then shows:

configure:6762: checking whether to add -D_FORTIFY_SOURCE=2 to CFLAGS
configure:6779: gcc  -c -D_FORTIFY_SOURCE=2 -isystem/work/x86_64-linux/elfutils-native/0.186-r0/recipe-sysroot-native/usr/include -O2 -pipe -Werror -isystem/work/x86_64-linux/elfutils-native/0.186-r0/recipe-sysroot-native/usr/include conftest.c >&5
<command-line>: error: "_FORTIFY_SOURCE" redefined [-Werror]
<built-in>: note: this is the location of the previous definition
cc1: all warnings being treated as errors
configure:6786: result: no

and -D_FORTIFY_SOURCE=2 missing in CFLAGS later causes the above error
in do_compile

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.186.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.186.bb b/meta/recipes-devtools/elfutils/elfutils_0.186.bb
index 46ee40cce6..d742a2e14e 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.186.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.186.bb
@@ -35,6 +35,8 @@ PTEST_ENABLED:libc-musl = "0"
 
 EXTRA_OECONF = "--program-prefix=eu-"
 
+BUILD_CFLAGS += "-Wno-error=stringop-overflow"
+
 DEPENDS_BZIP2 = "bzip2-replacement-native"
 DEPENDS_BZIP2:class-target = "bzip2"
 
-- 
2.43.0


