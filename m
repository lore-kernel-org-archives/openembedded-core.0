Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE4D4C43219
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 03:01:57 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.7190.1667530910969347622
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 20:01:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=gFNUpbLj;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id f5-20020a17090a4a8500b002131bb59d61so6665817pjh.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 20:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ySZ833MMlgVqGc6WNu6YL2ro9jlPh9nmk3gNMclbV7Q=;
        b=gFNUpbLjyZOEEAi5An4B+Oi9d7Ag7z13osItxmwRqY61W4hAv4uNGiT7zY/OcxqB2w
         tQV3tnanbllxrDy6o7g5FSKohxKG5cyS26axzv6jGIMQCJGaFuAfNiiqvIV3BB6egCKz
         YHdRZLoYHSaRv/PsR8ebAjU49Hbifs5x+9rNlG02M5z2txTEnzhHa91n4F5/fldBEOtt
         REwXr6P7DrXAPJxSTBF14bI0bSAdMfKfC9i3uJWHnmuioJbzk1aLNInlntTtIPUMiSw/
         DOwRQhreOl/bhn+jij5d77x+TMweFn3dh2JutldhtwyQlJeYbLZXIYJ1NgKqepXMfmP6
         CQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ySZ833MMlgVqGc6WNu6YL2ro9jlPh9nmk3gNMclbV7Q=;
        b=eYGkVvLWPlanb4B13oUec8Xb3tKWVILL31JG9YiDvC/yCD4UPISGXbv6lU997IYmc3
         tYRTiEif+HBgIW3sUeFN8qQ4Y5xxBJZXOIJ8Uvt2M3rAW4KHpqDe9WGkRuWR/L5yEg+i
         AqPhCvCWdIVVAaM49CTPli63F9jluvSClunYogQ9NgRllZSZvrA1vRU/Qsrc7c7KNqSd
         Nrmub+XuR8rNeLJ4PktZV23eN8cHsPXRjbpYueq0ilJAkghjyeK7v4Xz7QbRPnuBthgT
         5vpcbaW514bueP6IQPCLCy9A0RSzKmL7NvJThHXreMbNYxmP8DwvEvrGpHJMevI8Xt1d
         oqDA==
X-Gm-Message-State: ACrzQf1Nma8+gsx9NELOEwYzURfziY0FhZaqk3lkMBj5U4v/SasIJ2G1
	djwqsr9iyF7uFVzFAn2WdJiZZ+DyAsJ27DIu
X-Google-Smtp-Source: AMsMyM7Rj/1MoPTnP1y6xUQqMp1Zr1l9sIJToW1q0HfCOHpkWDUTh885xd9W8bbrCFHOEFf8PTnK/A==
X-Received: by 2002:a17:90a:1657:b0:213:7c4d:768a with SMTP id x23-20020a17090a165700b002137c4d768amr43505787pje.199.1667530910045;
        Thu, 03 Nov 2022 20:01:50 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r7-20020a17090a454700b0020b7de675a4sm667902pjm.41.2022.11.03.20.01.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 20:01:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/31] opkg-utils: use a git clone, not a dynamic snapshot
Date: Thu,  3 Nov 2022 17:00:51 -1000
Message-Id: <e790bd1ca41db01d56259c2e15960e2c3cd2d2fa.1667530733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667530733.git.steve@sakoman.com>
References: <cover.1667530733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 03:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172677

From: Ross Burton <ross.burton@arm.com>

opkg-utils fetches using a cgit snapshot of a tag, which is not
reproducible as the tag could move, not reliable as a future dynamic
snapshot could have a different checksum, and a waste of CPU load as
these tarballs are built on demand.

Switch opkg-utils to use a proper git clone of the relevant SHA.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dafd2631a20ffd94e6f21c46938a010e92b57da4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb
index e72c171b92..b27e3ded33 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb
@@ -7,12 +7,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://opkg.py;beginline=2;endline=18;md5=ffa11ff3c15eb31c6a7ceaa00cc9f986"
 PROVIDES += "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtual/update-alternatives', '', d)}"
 
-SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV}.tar.gz \
+SRC_URI = "git://git.yoctoproject.org/opkg-utils;protocol=https;branch=master \
            file://0001-update-alternatives-correctly-match-priority.patch \
            "
-UPSTREAM_CHECK_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/refs/"
+SRCREV = "9239541f14a2529b9d01c0a253ab11afa2822dab"
 
-SRC_URI[sha256sum] = "55733c0f8ffde2bb4f9593cfd66a1f68e6a2f814e8e62f6fd78472911c818c32"
+S = "${WORKDIR}/git"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-- 
2.25.1


