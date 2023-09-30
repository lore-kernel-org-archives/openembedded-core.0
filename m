Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06316E748E2
	for <webhook@archiver.kernel.org>; Sat, 30 Sep 2023 19:40:35 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.47409.1696102834120862060
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Sep 2023 12:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RnVofxtL;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.43, mailfrom: steve@sakoman.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1dc6195bf93so8180460fac.1
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 12:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696102833; x=1696707633; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o5fvG01yHX/FH4Cu/E862Q1Qa4IgWLrMjsf6DCZsBR8=;
        b=RnVofxtLGTDY0L65WEdgyIip96jlsncYakXSoGUGMEZsRR+1Jb5QyQ5UONG1ugt/T3
         JvwsrPVw3p5DTxydm6mr7HsZt3MKqPhwyliJdYlAg2HyA1ZsOatzi2CAa75+KIqAtg2c
         ioYIEs+SslVoPLzCsjTfqU6RxvB3RCZMqHHNs4u03wFXucaOVJpHiNSPMhzDXwghZSZ3
         RJAeeHSZg8bcnP5uZAVk3fOcB3e3LsVAenbqNh1CAqN2MvuGn7GGIzsmMmd/y9ac2pSz
         E950F0ncUF2glQZFJcX4tmXtWcfEYRWBV+qXt3RO5Yho5IT66JpZij5/iHjHLQFMYjbY
         MXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696102833; x=1696707633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o5fvG01yHX/FH4Cu/E862Q1Qa4IgWLrMjsf6DCZsBR8=;
        b=Ytp7o856VT2NcNfu6b1jAyfUnSgS4xGzgoK4/NIuYopVamu+8AyqBrQQtr2iikOa2i
         9B047WPhnNL/k32K/K/1aIppfTfYjwFvzVQzKXZ4QTRg12EwDztlb6AGJzTSZFX0pbkh
         KXmagX37JdjPfgnKYfUkXi0G+5W3IWlNu/GAUWXW8bF0+WmpA8S2FCy09YpZiyFLsZco
         SXgNVZUdGjmdpEWF1+V3GCPFkVCg1X8uclFbaBnI3LujO2AyzjS2rfsB9U7uCv8tUfva
         enB+JbDy+q0SOd9pauXKUqwKw/KkFOx5G21dCM62wQq2yTfHeIAKYuzUJwhnXyjQ8RSG
         nQqw==
X-Gm-Message-State: AOJu0YwNe0pYeOrFaB0lC1yqXJHqiZJK7tLUbZJ8tpI9sUGbZihpsK34
	6PD4WkNQwhaCH3LhCW39FWBZMmk+/I5ME00dm/8=
X-Google-Smtp-Source: AGHT+IEzLu0C3W4fsh3P1//4B1Dpli61vb7P+v60HO6n9aBn8tpcHXEh2jTwUR6Oz7yvHpvWAjIrTQ==
X-Received: by 2002:a05:6870:c22c:b0:1b0:18e8:9536 with SMTP id z44-20020a056870c22c00b001b018e89536mr9145377oae.52.1696102832900;
        Sat, 30 Sep 2023 12:40:32 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id p2-20020a62ab02000000b006936d053677sm2880011pff.133.2023.09.30.12.40.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Sep 2023 12:40:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/13] python3: update to 3.8.18
Date: Sat, 30 Sep 2023 09:40:05 -1000
Message-Id: <9205496344bede4a16372ca7a02c2819a976640b.1696102675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696102675.git.steve@sakoman.com>
References: <cover.1696102675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 19:40:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188473

From: Lee Chee Yang <chee.yang.lee@intel.com>

https://docs.python.org/release/3.8.18/whatsnew/changelog.html#changelog

Release date: 2023-08-24

Security
gh-108310: Fixed an issue where instances of ssl.SSLSocket were
vulnerable to a bypass of the TLS handshake and included protections
(like certificate verification) and treating sent unencrypted data as if
it were post-handshake TLS encrypted data. Security issue reported as
CVE-2023-40217 by Aapo Oksman. Patch by Gregory P. Smith.

Library
gh-107845: tarfile.data_filter() now takes the location of symlinks into
account when determining their target, so it will no longer reject some
valid tarballs with LinkOutsideDestinationError.

Tools/Demos
gh-107565: Update multissltests and GitHub CI workflows to use OpenSSL
1.1.1v, 3.0.10, and 3.1.2.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/{python3_3.8.17.bb => python3_3.8.18.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.8.17.bb => python3_3.8.18.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.8.17.bb b/meta/recipes-devtools/python/python3_3.8.18.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.8.17.bb
rename to meta/recipes-devtools/python/python3_3.8.18.bb
index 00c4ff497a..9d0f72ecf9 100644
--- a/meta/recipes-devtools/python/python3_3.8.17.bb
+++ b/meta/recipes-devtools/python/python3_3.8.18.bb
@@ -43,8 +43,8 @@ SRC_URI_append_class-native = " \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
 
-SRC_URI[md5sum] = "70223497e664524303ca2364208647e1"
-SRC_URI[sha256sum] = "2e54b0c68191f16552f6de2e97a2396540572a219f6bbb28591a137cecc490a9"
+SRC_URI[md5sum] = "5ea6267ea00513fc31d3746feb35842d"
+SRC_URI[sha256sum] = "3ffb71cd349a326ba7b2fadc7e7df86ba577dd9c4917e52a8401adbda7405e3f"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.34.1


