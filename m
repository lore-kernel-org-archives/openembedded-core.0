Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.17085.1605656922523335224
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 15:48:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=avRCRICh;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.43, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f43.google.com with SMTP id i18so27759ots.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 15:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Bu+/ARscPXYtLb0W1GJ9xPYFN5c03WX3TkYO/ULcb9E=;
        b=avRCRICha2/38kJpReaQHeOx+sNzdVvAdZDhDgAwB6SS8Qa9yMdAaQuNCQi8nbndkM
         TMzHQKdzTegQTWapFEKdbYpbWVqqyngrEWCFOj1xDd7Jp5d6ZERXE8hvoJ0Mceq1gUwI
         45c2C85+mZPEvOknE6HE57UVrNAqenMG9lI0AEXmOPbEXrTfDdVSAyapJk8zkeURGQFz
         Nes6/xam94r8eaDm76DUVWyUmrzjZAQTC6w/a+xwlH80J2gwMwyzokJsKSXbpsUWLE/5
         nMzNQxiZEZ8KIrwXO8PDMix0caKbVQyA4jLmdrTAkHCdc/yhhnonv9O8P9OVyQXHIRlt
         BY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Bu+/ARscPXYtLb0W1GJ9xPYFN5c03WX3TkYO/ULcb9E=;
        b=YGMPgQ3Pd647yySOfhNinNHItupO3gELOhzLnB8nACd/VFN+QzzJKxO3CvFcXObfEs
         aA8S0uBfJQCVxNIv6SHUh7VGONSc2PTQ6JnSRJZ/EqqY4vELlE/+p+IKKcDWcA9L2rp7
         XRGmIZzuZMeM0vk2kwR468oYJuMxzm0OfzEE55YMqlvfU3qkZqNSIMcY+XyjgThtKG7i
         GPmHZ8NMmZd5ERZ3yd5soSxCAvjzpcH3jr2jo+C6s2F8DjYHDrcwd3c6uekYCxMBB5ze
         z+W06Cpofjl2icBFa6sgg1wUWbeY6oQXp7XdJFqRAX3CrBuT0MwzldYNHC7Ta7Gjmk7o
         D5Bg==
X-Gm-Message-State: AOAM5332TndJTVjrgC8tZqPhYxcnh0tgbNivvM2FrRCpbmTPVaFiTMVU
	970uIEbSju5pS/OUP+UJv7j4P6GGu9ucu6a1
X-Google-Smtp-Source: ABdhPJwFqjzGD5NpvnweCgQnd4uoL8QVYhq3O4Kep03Evrmmh5P+/AIu8cCxm5aOCh5zSSOrztjyUw==
X-Received: by 2002:a9d:dc8:: with SMTP id 66mr4820529ots.302.1605656921456;
        Tue, 17 Nov 2020 15:48:41 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id s131sm6715936oie.58.2020.11.17.15.48.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 15:48:40 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 7/9] ptest-runner: Backport patch to fix inappropriate ioctl error
Date: Tue, 17 Nov 2020 13:47:37 -1000
Message-Id: <a724eeeead28cbe7cfb8ffbcf40f6ac29e22ff61.1605656725.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605656725.git.steve@sakoman.com>
References: <cover.1605656725.git.steve@sakoman.com>

From: Khem Raj <raj.khem@gmail.com>

The srcrev bump is actually bring single commit [1] on top of 2.4.0 which fixes ptest
runs with messges like

ERROR: Unable to detach from controlling tty, Inappropriate ioctl for device

[1] https://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/commit/?id=834670317bd3f6e427e1ac461c07ada6b8936dfd

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 791da075619139fa55751f8013c73d2fbf0cf64c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
index 73c08c6add..8b9938f572 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
@@ -7,8 +7,8 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "1e9a84585909b970cc8850d3ea02a7215dcfa5a3"
-PV = "2.4.0+git${SRCPV}"
+SRCREV = "834670317bd3f6e427e1ac461c07ada6b8936dfd"
+PV .= "+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2 \
 "
-- 
2.17.1

