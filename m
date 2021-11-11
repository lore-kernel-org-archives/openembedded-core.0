Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F00C433EF
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 04:09:13 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web12.6188.1636603752245843443
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 20:09:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ykTiNqjS;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 188so4065276pgb.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 20:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=y4LcuLKjMqaWt/HqVlCPEs2d0zrv2iXBHBzE9biSB5A=;
        b=ykTiNqjSE58hdi0N20xxHDFN0NzyV3J9Jzkm/f6YQB8WzdXjjUuiPHk0LL6AYPYPCh
         D3NTDMefmGvryZSmOW4lmjs1f+g91GCh4EYhemMv8Qr9jZ2PCFJNdry2eTzqdSxStN9j
         n6Tpr/5dJkKQHLRqfnv6mK8RlUZ26tU03eFK+Y96uy0dk+TnbSj4AnXMQxJbzym+AMA9
         /jurrxwOSSr8geTZFXhuvIgulqSQ8godntubcb9zgaB+Ji4snpm9eLxmNdnUNR6NJz1G
         /RnptmNTInkeX7sq8QsbQMxraWExUO7FpyN/l1HFosw9AcEXNcuHEhf07yF30tYc0U+F
         /5+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y4LcuLKjMqaWt/HqVlCPEs2d0zrv2iXBHBzE9biSB5A=;
        b=wU56GUnnNyL1aCTmY0cRo8foWWK1gE9Quz+KHDEcriL5VXVPuQ9zEUzLm3kVZ6HoxR
         fWlN/xkxbbxWlMwylQjAyCTgQlmgpGLBjl1ivXEB/MTSrlBaHs2lbO0j8BUQh3bXj0Ud
         zIFBmS+IjlQoQBBXCdkfLSvMkYbFe6YPSsvwmxhMTD3gD04xkFsR1E/8nmHvR0EhNOGU
         7+GD3WbJXLiBaLgZACC1z3PgHiJhKQB2zkj/2R50kI4akR/0AwMMaheH8TrCKy3ZdxW2
         PAlu16RTsNqs8+Bh98pNyaxbibPfsDlo9G4089pzFUD8A/v07gaCYdiS5sUFmHrzaOvX
         +T9g==
X-Gm-Message-State: AOAM533FlyTct1m1CtgUXgYtytwH9m8C2shVDtAwnEDEH1ozj1clDEpZ
	1BXtC1PJbaK7gQgow5MUwR091Yeo9dc2k3pcb/w=
X-Google-Smtp-Source: 
 ABdhPJwaF752pPnIdH7ZJOGIcWpcv+KlemJdjDRyBSOzs4w/p/hWW9MdShuOLaNluWe0L7zH+Lch6Q==
X-Received: by 2002:a05:6a00:114c:b0:47b:b98b:2210 with SMTP id
 b12-20020a056a00114c00b0047bb98b2210mr4087009pfm.75.1636603751219;
        Wed, 10 Nov 2021 20:09:11 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 i2sm1207686pfg.90.2021.11.10.20.09.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 20:09:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/14] linunistring: Add missing gperf-native
 dependency
Date: Wed, 10 Nov 2021 18:08:30 -1000
Message-Id: 
 <fc7dddf939b04dbd5b5d92ecf3a5c422ee5caf15.1636591208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636591208.git.steve@sakoman.com>
References: <cover.1636591208.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 04:09:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158137

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 73d3efbaeb2f412ab8d3491d2da3f3124fc009f3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libunistring/libunistring_0.9.10.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libunistring/libunistring_0.9.10.bb b/meta/recipes-support/libunistring/libunistring_0.9.10.bb
index 97fac4ecfa..2197b6656d 100644
--- a/meta/recipes-support/libunistring/libunistring_0.9.10.bb
+++ b/meta/recipes-support/libunistring/libunistring_0.9.10.bb
@@ -18,6 +18,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
                     file://README;beginline=45;endline=65;md5=08287d16ba8d839faed8d2dc14d7d6a5 \
                     file://doc/libunistring.texi;md5=287fa6075f78a3c85c1a52b0a92547cd \
                    "
+DEPENDS = "gperf-native"
 
 SRC_URI = "${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz \
            file://iconv-m4-remove-the-test-to-convert-euc-jp.patch \
-- 
2.25.1


