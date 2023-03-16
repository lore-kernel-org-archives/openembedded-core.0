Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B8CC7618E
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 21:45:54 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.5081.1679003146620913086
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 14:45:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=E+M7Bbdw;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id a2so3270289plm.4
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 14:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679003146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v4daizuM18z2yeix3M+QKNJjgogZqnSQtT+iP8Bo5Ro=;
        b=E+M7BbdwOByi6ZQ/Rd4ZCKtaVr7oaUGsJ6Xta3sv9yk+DDVUHz2IsC2bx2gdGLs2kk
         v4/mbn/1y7gPjtKFSLv0+f/4iNvLolHnVkLVBqxRCjeGdWz+fpUl5ESpm8qMLRZZ1u18
         soHjC5e7jzpMFbS82F1YDhwqcTgyIfQaLQDz1eMzygxDvKtAxlQ89aO5DYofDfWg1QLw
         YItExnyp678L60llgHVvlr49em3j8S75wIJ2yqBzju3Jrh0ew7FRzT3y7oBbr4TC4izw
         DTZ8poDKBY5x9h6Q6Ve+R2VZcYxhpQwHZNlJBP3QjgQ/wqHwwmBNZjUhjLDopnYg118+
         yZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679003146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v4daizuM18z2yeix3M+QKNJjgogZqnSQtT+iP8Bo5Ro=;
        b=MW9yYUnbSYoOh2/kuLXv6V+5jz3yRmw+YqHyXsk05gHD2SXxDWIyIL7i5GfsHZ/ESb
         YVgvSbgTCSOqKX5c5hx09hHtL8WS5D8dXkbwNddbec+AmpJCspoqbQg9SqY/VZQTvNR/
         c3QLH8vuj7UVAIS+UPKYuow/wqIwt10svynNx16vd27Ygcv04XZx7eXMLSZdUbvWyKvb
         OGj7NLYps/EKArJnwOyPbTQ3O9NbWNJDS18paen6UhYsMyXlB0s27M1KzvzL9js1WhNJ
         B4BgXMEHlzUVeiGeoyMTid5zOoif9uMQeucuoXDlo5RJvbHzL7NeeIpJ17yX40SE3JG7
         H1/A==
X-Gm-Message-State: AO0yUKXzG5hIDeG6Z9YJsjUF5wK+tz7eA1ffijtD5GESnnGSf8agGMs1
	BdXHy6UjLuPKwwPQZFUr6mWPY7JNC5qv2PDrqpc=
X-Google-Smtp-Source: AK7set9jrgtQ6n5yJwfrcFq0pm7KvTNOlJJ8+qbYemAxqjIdxV8oEAhfgysoy0pZbsj4XYMtgqJ/tg==
X-Received: by 2002:a05:6a20:1d58:b0:d3:aba7:807c with SMTP id cs24-20020a056a201d5800b000d3aba7807cmr3904335pzb.34.1679003145733;
        Thu, 16 Mar 2023 14:45:45 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id bn10-20020a056a00324a00b005a84ef49c63sm137746pfb.214.2023.03.16.14.45.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 14:45:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 10/23] glibc: Add missing binutils dependency
Date: Thu, 16 Mar 2023 11:45:07 -1000
Message-Id: <b49f0a29be4f81009b0812f0649b1d9301d1ea1a.1679003014.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679003014.git.steve@sakoman.com>
References: <cover.1679003014.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 21:45:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178721

From: Richard Purdie <richard.purdie@linuxfoundation.org>

glibc has it's dependencies handled more manually due to it's place
in the toolchain bootstrap. It depends upon the compiler and indirectly
through that to binutils. This did mean that if binutils changes and the
compiler does not, sstate and hash equivalence could mean that glibc
wouldn't rebuild.

Add a direct dependency on binutils that if it changes, it forces glibc
to rebuild, as it should.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c4a7b3decff636292f5e76e95406a22b6fe4a994)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index fdd241d973..3b940b8ab2 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -1,7 +1,9 @@
 require glibc-common.inc
 require glibc-ld.inc
 
-DEPENDS = "virtual/${TARGET_PREFIX}gcc libgcc-initial linux-libc-headers"
+DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}binutils${BUSUFFIX} libgcc-initial linux-libc-headers"
+BUSUFFIX= ""
+BUSUFFIX:class-nativesdk = "-crosssdk"
 
 PROVIDES = "virtual/libc"
 PROVIDES += "virtual/libintl virtual/libiconv"
-- 
2.34.1


