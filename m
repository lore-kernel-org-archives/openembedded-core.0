Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE5BC636D4
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 21:11:07 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.21039.1676236267366923079
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 13:11:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Tl/PF/nI;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id b5so11631235plz.5
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 13:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9HhoXqTm7NGsxvfx09idKWjJvv/BZS5wYSkFr02DAQA=;
        b=Tl/PF/nI6oSnkwfaQ5UMc38O6/cjddfOt3oeWwg5n3WTcp4NuGljqaO5wU6IHXXH9l
         QKR3VbY+4wjv61kBY4SEO6g9m+MBtGzz5lQmXS9gCjO61xtpVNjoqh5xqjnsNfgrLOyt
         2av/rbGfoJtUTKeiCl4+VLUyC8R6Zbioap+g0BcEJypsMgsD8TosRE8iG4Conhiey1BT
         JTWaTsrLx4Zmhb4o+uQ0fWlwm8UFUtBO1PyYQMY6QiU32kU6DXTztErmxdZ1hcuXHsCH
         ohNjqmScqM5Eyk2M7fn0t1KTiYaBtSDdycMZYZYdSFWWZX4uyDe5duV0Fa0+E6fm1ZDy
         2c9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9HhoXqTm7NGsxvfx09idKWjJvv/BZS5wYSkFr02DAQA=;
        b=4GLnR5xPmoO+Ktc1ebNZurSYGCr3OVgBw8AE0fURpR2/PEWZ8yU+jxCEcT97Y9TiHu
         GXN0xaoc+rYo7vHK5IaorE0hpFCz4MWCgaybSR84ULTFwbNiwI6F6VAWN1h4aZr2cSbT
         fgx3GLk5MNX2s+pbqYNUj/iDN4s1z13lfLD24uwo7g1Td1nSIjGj2/VAlyIBnhAzUTkL
         Xj49uK6ntDNJboRNmCnb5XnaB8DbIsBmmMPvJsyKHOZsIEX8ddIIySaA5SYNVRMAImwu
         2eukjyWOXhIq5gMt4PpEzMds1IB1CodJSLpWvY58E3QRf4F+bfFMIybI1oZGOgaV6oyI
         WknQ==
X-Gm-Message-State: AO0yUKW7G6ma8HvGC5qsMi34+s/8wMSPE2m89pTbE2kNQs6sdeP0rwt+
	1AV9BcHzJ6zyswbWVUqpV3kUmjOEh2Jc24jErQI=
X-Google-Smtp-Source: AK7set+mIcJZKFC1t9PPdNI6w2Wya0V/NN0XrCICyKHbqdDNy0XYFTIkP7gcv66M7peIu1eLuzuVKQ==
X-Received: by 2002:a17:902:da8b:b0:199:38a:afd8 with SMTP id j11-20020a170902da8b00b00199038aafd8mr27013040plx.19.1676236266466;
        Sun, 12 Feb 2023 13:11:06 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d23-20020a170902b71700b001933b4b1a49sm5675482pls.183.2023.02.12.13.11.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 13:11:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/27] buildtools-tarball: set pkg-config search path
Date: Sun, 12 Feb 2023 11:10:24 -1000
Message-Id: <9a110453f6b4b2c2d86af4ae20860037796a284d.1676236110.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676236110.git.steve@sakoman.com>
References: <cover.1676236110.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 21:11:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177052

From: Ross Burton <ross.burton@arm.com>

The buildtools-tarball includes a native sysroot with .pc files, and
in the case of buildtools-extended-tarball a pkg-config binary too.

If we're using the host pkg-config then it doesn't know to search in the
native sysroot.  If we're using our pkg-config then it searches in the
build-time prefix and not the actual SDK installation location.

Neither of these are correct, so set PKG_CONFIG_LIBDIR to search:
- The native sysroot
- The host pkg-config's default search path, if present
- Falling back to /usr/lib/pkgconfig, if not

In an ideal world this would be handled by the generic toolchain script,
but that is slightly more involved.

[ YOCTO #15007 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8f768a3f4c7ff477e994d60800e5a1b83891615a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index de399173ba..34f7773398 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -75,6 +75,9 @@ create_sdk_files:append () {
 		echo 'export REQUESTS_CA_BUNDLE="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
 		echo 'export CURL_CA_BUNDLE="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
 	fi
+	echo 'HOST_PKG_PATH=$(command -p pkg-config --variable=pc_path pkg-config 2>/dev/null)' >>$script
+	echo 'export PKG_CONFIG_LIBDIR=${SDKPATHNATIVE}/${libdir}/pkgconfig:${SDKPATHNATIVE}/${datadir}/pkgconfig:${HOST_PKG_PATH:-/usr/lib/pkgconfig:/usr/share/pkgconfig}' >>$script
+	echo 'unset HOST_PKG_PATH'
 
 	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${SDK_SYS}
 
-- 
2.34.1


