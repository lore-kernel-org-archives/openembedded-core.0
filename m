Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E6E5C636FA
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:59 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.21687.1650136504260653609
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 12:15:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=d/KfVvay;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id
 i24-20020a17090adc1800b001cd5529465aso9526935pjv.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 12:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UIOiC6kQAWSJoTB0wZ07OolBqYr5Xj0UlUlE1+ECyWw=;
        b=d/KfVvayiSvWW+/kJdR3ic4CzZBmsOajXtn4xcCQHnAhQOjY6QTfqWyjO6K24FEKCI
         ZWHMyWGC+vPsFC0mxXfzlxsUhn9juvtauQpFhxcv5q0q2R7JKKn0ixwYd+xuni6B2Dme
         8G13WQt5XD/lxFfBfhgmQyi3HrnvA4KIQ+FypDMtcwf/5dWurIkWvPfGbiO+byU5gPsv
         43K3uM/qq05oDlEiZ+LvLOaAOsizt2Y3ojckO94i1kasUKtpXYnjXOJDUM40J3Z3ixc3
         JIJwc7ArQGsyqu9FtjUnBwfc1s5s0zXixfZzEn7y1Jxot7RzjfLDPND4rrY5US3uPfsY
         sbUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UIOiC6kQAWSJoTB0wZ07OolBqYr5Xj0UlUlE1+ECyWw=;
        b=aMrtimusbBr9zo/pMAEmbwERFU8OsU1pfrSCnm08EgiXgc03iXgfylBuxfOkdw81Xq
         fpLoP67xt4IB96ohT2Yy2C+Jq3puuLbWkcdEKGgR0uatr3IEu74XmeF3cSus3zlU32OX
         Gz6IGTu5KxqTyg5qzmKwESAorGKmsKUTpnw1WzTm9rJl+ELMQgUqH8A8AQsj+oGB/LGV
         I9mFtem6FS0KTWH4Nu+v3YRYy6k+h+TuTdvjVZigaFaTvOQzV8dqZHlXVNJObIqurPbu
         bQnASiddT/60mWSdsxO9vY0lD455nhgFxQOMh18qPJ7SmmuMdWWV7qx88ML7sjs/TzF6
         8pag==
X-Gm-Message-State: AOAM5310LdlocG2/P31ABxvi6njbaKVMpp1edYIGyM6jtmG9/wOoF6Io
	86E/41zQhTAZofW7lE471SD4E54a/mkBraqPKsU=
X-Google-Smtp-Source: 
 ABdhPJzEAZz0jngH/9T0/uxS+ezUFov7Qt3NKI5NzB0EY2uMfCU9Dz3V1XcJLHvAuhcki5NwRYfsYQ==
X-Received: by 2002:a17:902:ec8c:b0:154:2e86:dd51 with SMTP id
 x12-20020a170902ec8c00b001542e86dd51mr4478759plg.99.1650136502332;
        Sat, 16 Apr 2022 12:15:02 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h2-20020a62b402000000b0050a62e582e5sm430004pfn.37.2022.04.16.12.15.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Apr 2022 12:15:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/11] pseudo: Add patch to workaround paths with
 crazy lengths
Date: Sat, 16 Apr 2022 09:14:24 -1000
Message-Id: 
 <5cac1e855e397b58c3c2b251a9794f3d480c8ad6.1650131192.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650131192.git.steve@sakoman.com>
References: <cover.1650131192.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164552

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Update to a version of pseudo which includes a workaround for crazy
long paths, as shown by the libfm failures from the libtool upgrade.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 67dfa32d82b8862e6e543c37315f211aba3ec28b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 1a5d230c69..35240f1616 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -13,7 +13,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "d34f2f6cedccf8488730001bcbde6bb7499f8814"
+SRCREV = "df1d1321fb093283485c387e3c933d2d264e509c"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.25.1


