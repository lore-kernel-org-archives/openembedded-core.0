Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80402C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 14:15:13 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web08.11308.1645452912951958566
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:15:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=qWlz8Kop;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id
 ev16-20020a17090aead000b001bc3835fea8so3411531pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=HZQgrPG35kwTyIYUCxVBbNuq1tRiyqtFdzmvfPu7Vno=;
        b=qWlz8Kop1CBmxjB+GvPx4Lgmm/jhQfmCzKTOx1Z8jobhGPkhPkoJv4G9fYJ2yfq7hb
         7mX0/jRPnb+rB/KN9j4GjlMkkMCzNKLAi8lzhCdk90c2jmslNYYqzsUdQ1Lq8JksmY0G
         ch4MtSZtsUgbn+9UT5gY+t9Q5wg43O70zK+v0zIsfYP3nVRCjuYCr+tX7cihw1eEgk+a
         xQjz8U+IBc9CcFofa2C09FKHy7jg2lBzpUV8vXTCxaOwWe29S9HSOa2owil3HtDbuW3L
         CUzMJdVHKzy8m4pZdnlZyoertxF7ED3sVupnMIv3+oD8GE3JRTw7w53vJ6YmZ8pzh7Ir
         Pq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HZQgrPG35kwTyIYUCxVBbNuq1tRiyqtFdzmvfPu7Vno=;
        b=6C9hb+PxoDdIO4ay70Cb6pufmqmLTrS5ZuizpjK23eNgp8oQ7hqA85ejFQjWupCvQU
         KMMPVGdKUeD8kTBGjiHkZGSSgCicKeDR90rtZsop+zmjhIio/bbO/wbvQVLeexSVqW0q
         xuCgjzbOupSulAkAnVXZKrqGWfC9s1tq3ZICDSDmTQkiX+HZgG7EwRlZ9xlcd9FcKDRW
         UwumKvriRcrXou2VQtIJ7VgyRZ4v+jdyIdhT4LAsQe+/Z0IVf+iXNrIhVa0eRVX64iUC
         w5uL/N77XVDaDUA/Ni80+HD6Gtq1geIEElzy3awrxRpCw5ZEjHgHP/SH2pw2KmRC2oM2
         V9Hg==
X-Gm-Message-State: AOAM5322awbfeJa+ZmF7r4903ta7ncJVZdT/FZRIZIo1m1fT+iYqtcte
	3WNcv2AvBGw7fC9yL5KbxoAtkgNDLvUovuFT
X-Google-Smtp-Source: 
 ABdhPJwKzvtcAB0v2RNfd4IYO7ywNpg23fm0dFKTUQU7w5fx6rpacPkqtJ9KywCp2jSdOHV3IF3frA==
X-Received: by 2002:a17:90a:4e47:b0:1bc:190e:c87b with SMTP id
 t7-20020a17090a4e4700b001bc190ec87bmr9071826pjl.205.1645452912103;
        Mon, 21 Feb 2022 06:15:12 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 8sm12919235pfl.164.2022.02.21.06.15.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 06:15:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 20/20] ruby: correctly set native/target
 dependencies
Date: Mon, 21 Feb 2022 04:14:18 -1000
Message-Id: 
 <b9d88fa46bad2987bd045b0fa98ecde7b42dbb1c.1645452535.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645452535.git.steve@sakoman.com>
References: <cover.1645452535.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 14:15:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162048

From: Alexander Kanavin <alex.kanavin@gmail.com>

In particular libffi was missing from native, which
led to linking with host libffi instead.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 293c9f879252a814107579542e8fca9af9dde599)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/ruby/ruby.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
index 7b6d4edc61..367cd98d09 100644
--- a/meta/recipes-devtools/ruby/ruby.inc
+++ b/meta/recipes-devtools/ruby/ruby.inc
@@ -14,8 +14,8 @@ LIC_FILES_CHKSUM = "\
     file://LEGAL;md5=2b6d62dc0d608f34d510ca3f428110ec \
 "
 
-DEPENDS = "ruby-native zlib openssl libyaml gdbm readline libffi"
-DEPENDS_class-native = "openssl-native libyaml-native readline-native zlib-native"
+DEPENDS = "zlib openssl libyaml gdbm readline libffi"
+DEPENDS_class-target:append = " ruby-native"
 
 SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
-- 
2.25.1


