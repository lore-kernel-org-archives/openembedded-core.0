Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C47EBC47077
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 16:08:08 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.151597.1703866081292832321
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 08:08:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uTnojMec;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6d9bd63ec7fso1591882b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 08:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703866080; x=1704470880; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CWppa8OMqRd2hFqwC8KDrm8XWDfxNHqjXBgkW69GbfQ=;
        b=uTnojMechnqq09UwHALyZ7BgY4zr5kGTkAl+o2lyXmGfes4a/Vm2nz6RMsMsYBT9b6
         YJYIdqTQhJXxUdACb3Lll6FMK6Cpi9QVqZttBwhyzAF6TwHcVr/u/qhWocu2c3VDk+Ie
         a+C9/2bkP9MdtMVkuL6lF+yCHrEq4UicBwE7/Xwd96gWVOisaMk0iqw482RmUuzL/N6D
         FMFJTFMBosQSIDQO8LPLeJTklzm9DD82qgDaPTjNbNJPq28xBtoi7RU1GkyrwaCgAf7L
         K4APQdeQYDcYfXYl0Zlcs4wWO4eYCmGIi7766jRVu8K4KU+vVaP6MvWJmjxpq0VD1wT8
         jufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703866080; x=1704470880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CWppa8OMqRd2hFqwC8KDrm8XWDfxNHqjXBgkW69GbfQ=;
        b=EbF2+YfEBayKMB7zjB4q9CbNWsLznoFmUlR7Yi99y8XVNUIZfIcMHStKbJMOtLlO2Y
         yp5iV/Ln73xkMQsA6i944likVZmelXT8jJO0m7AY7YayR+io/Z5QjU85LNYxnKkIj1kA
         FsVLhdPyBWDwJtjeXkpFr2MeTjDQzj0SryrBfHy5t36bzEsOwqfPeCljMgahE/fd4SG0
         zxhv/FHrwCvbs5Emq5Awte87tycakDaYnaWPAYZoK5gHVBSBobhrb54vnk/9WG3sb/k+
         xX3LWsKSk79cE/MujG8TYP4x5/wFleNxJZJDqNLzoSxYOOZ1YFSj5p0LnJuxcz2/Hmnq
         +uFQ==
X-Gm-Message-State: AOJu0YxjpUdDQs/8AUlegYn3opqzMTiau+A985doAoNy82vys8QfyMLW
	ABTC5LDyWRssW0xMk1NIGWONCY8gSOsEX9RXhPTZHuKzpu8OyQ==
X-Google-Smtp-Source: AGHT+IEvOrO+foaTsC0LBzUp9qkSJjqT+RG8+TSOHc0NXYdYUenxhD6u1fuvaiU5tnSu9IHu/AYoQw==
X-Received: by 2002:aa7:91c1:0:b0:6d9:975e:b375 with SMTP id z1-20020aa791c1000000b006d9975eb375mr4563050pfa.48.1703866080430;
        Fri, 29 Dec 2023 08:08:00 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id u25-20020aa78499000000b006d9b2682c91sm10028691pfn.113.2023.12.29.08.07.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 08:08:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/4] elfutils: Disable stringop-overflow warning for build host
Date: Fri, 29 Dec 2023 06:07:47 -1000
Message-Id: <94d1640d374c9a8827957cba8dbc1c1f978701b5.1703865952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703865952.git.steve@sakoman.com>
References: <cover.1703865952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 16:08:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193062

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


