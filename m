Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web12.3447.1611009457150345520
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 14:37:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=UQ/9uGRa;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id lw17so487445pjb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Jan 2021 14:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=sG+N2kBKXBgAjY05d8Q7Yo2nDGMKovlj7xG+wlUL9aA=;
        b=UQ/9uGRa3lc+Xgy5DQWkycOP/eeT1YtGYL3tRJ62gLMy9Yhr/rFQmkoMV16zl7r4Qv
         BUrREoNSMWaP9h4iloAupwkhNs/tpDKy1ty8H8xK1ceTYrmZai6tsvNgbk8S19TLGkaS
         xcFY3OIwQWrYhh726kx+E/l+Hl9RImkPi5cTU4McrvD8GMx0v/cpHqrmUgYlfjL07zoJ
         SbAq0o4Os1B4MmlOL9gFrcRGi/XQvtjx02gyxoU9lweF/Pkg5fFnGEaBMx79TTcuREp/
         UDiUL+KwWeQwkuCHCvQNDSeQVQeHOf05eWEP6l1aoGYyV0OSyXl8JY2pUjYjrIXYa3G7
         mvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=sG+N2kBKXBgAjY05d8Q7Yo2nDGMKovlj7xG+wlUL9aA=;
        b=Jzxb8txIEzsnzejaCV1W13C7Mmp+gTnZ6Xm0U2COqtwkcO/udpxYak23eRp5zZxxQ2
         n3eSAiIoZOfQ9pteXbdkNP883wgwKsGoiKACalmX30yqcqmyFpKRKgBNQj34DMNLBMC3
         V/G27ci/amjYu5b/IqBnhZwBb4Yn3ed12/JzEc+fZ5jHfAAS8rWGai6tuCKLIBRXL1kg
         zI873Eg3lw/ReZN65iFUo6Clel+bVX9+QhXGiKUNIjqeyBBpGzMP2bhwSUTfl14sDql7
         Ju+2mtjGOaB89RIfcO8nHUkqfW6tJ/rCFB+0WsZjyInQnWXocGrdPJ9H4vmIGKtuZ4xz
         oM4Q==
X-Gm-Message-State: AOAM5300DM4QrmRNI/vH0g5IeR1FpKecBbhEfCIDDgG38urpxNrUShFO
	uOSw8FMjcXe/TebSfUUNRWVISLHJX3YYhFOlbTc=
X-Google-Smtp-Source: ABdhPJwhT2tkoBI7TPuqoJ34CL18gKDkQ5P/fSJuh+K4KflAVeiZ2LI4dkrKfJk8ts/kFfTjBK6uIg==
X-Received: by 2002:a17:90a:a608:: with SMTP id c8mr1568489pjq.61.1611009456161;
        Mon, 18 Jan 2021 14:37:36 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.150])
        by smtp.gmail.com with ESMTPSA id a12sm16835556pgq.5.2021.01.18.14.37.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 14:37:35 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/19] scripts: oe-run-native, fix *-native directories
Date: Mon, 18 Jan 2021 12:36:15 -1000
Message-Id: <d5cb96e3b5501b7349d075c47636902c9ce1c49c.1611009050.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1611009050.git.steve@sakoman.com>
References: <cover.1611009050.git.steve@sakoman.com>

From: Adrian Herrera <adrian.herrera@arm.com>

This fixes a crash with "find" when running a native tool and *-native
directories do not exist under the binary directory in the sysroot.
This happened because the directory wildcard was passed as part of the
root directory.
The directory wildcard is now passed by "-name", which returns an empty
result if no matching directory.

Signed-off-by: Adrian Herrera <adrian.herrera@arm.com>
Change-Id: Iba7acd8bbd7e0beb4d25c984f6af7a4fd21486e6
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f6c90ed0ad24b7d4f892e22e088b1578824eb1d3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/oe-run-native | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-run-native b/scripts/oe-run-native
index 4e63e69cc4..22958d97e7 100755
--- a/scripts/oe-run-native
+++ b/scripts/oe-run-native
@@ -43,7 +43,7 @@ fi
 OLD_PATH=$PATH
 
 # look for a tool only in native sysroot
-PATH=$OECORE_NATIVE_SYSROOT/usr/bin:$OECORE_NATIVE_SYSROOT/bin:$OECORE_NATIVE_SYSROOT/usr/sbin:$OECORE_NATIVE_SYSROOT/sbin$(find $OECORE_NATIVE_SYSROOT/usr/bin/*-native -maxdepth 1 -type d -printf ":%p")
+PATH=$OECORE_NATIVE_SYSROOT/usr/bin:$OECORE_NATIVE_SYSROOT/bin:$OECORE_NATIVE_SYSROOT/usr/sbin:$OECORE_NATIVE_SYSROOT/sbin$(find $OECORE_NATIVE_SYSROOT/usr/bin -maxdepth 1 -name "*-native" -type d -printf ":%p")
 tool_find=`/usr/bin/which $tool 2>/dev/null`
 
 if [ -n "$tool_find" ] ; then
-- 
2.17.1

