Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9531CC0218D
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 03:03:57 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.34436.1737515030848104327
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 19:03:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=X7KOP/FG;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21a7ed0155cso102957125ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 19:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737515030; x=1738119830; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FGIeZ/sV0dPjifRMXXSkyKSvOTDY+G6/otZoJ2/Mvpg=;
        b=X7KOP/FGwn6zdNM64kNAbUCGSusYquNVjFzw7QU3Kk03OxmBB6B/YcjG+DdSmtmpZB
         +t+CSn1Va1k3ppAPBzQZ+ku4sXq0XI73U0ijv1aUWDhMz3NndyTLC+XeaKD4Acl2LcmB
         +viPQVF8Z6vetVGrFcJDXXkR7lHqX6wQDE31Zaf8gYZQuHLPb7MaEHU9rWbqSEkOulWt
         VcGdB6npnHbx3SWfK2ZIN/M1Umx1f2UjyCe7vVmy/38uTvhg33M3Y9OCI9ho/bupOaLA
         wKoGmlCRusQ7TnrHy2Sjn01AeeMPvVf6bdI0LEdrTWu1zf8dkUUvISFLaznbqj8VhnLg
         SSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737515030; x=1738119830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FGIeZ/sV0dPjifRMXXSkyKSvOTDY+G6/otZoJ2/Mvpg=;
        b=XaR1WQu7ID54xdPBFqLOyw9iQrsPBVBsvWMevgw0e1BGT26jBFDN2dYrypw0FJcfys
         m9oKRrBd6HCQofbPdIvKVLmorsBLk/EQICe1rfgjfwzWrPWBXRO1cYYlMw3V2NV0k74B
         zdI82Lvm8sxznEF3cMusaobm1yxe1FNhrKR9npXcsB0CckkGPukOBm6rJmUXwjsaQtqZ
         H2qjclrfZ9EdoyWD1c+lc8KlKK/KoFznSh3kqjKBTH2NsgopqFq7IZZ3GpNP1ItEbS74
         wRbtPTN6Mfw0Q7R3wjRGzuY10SKco8AaCquAp3OKxJCvYs/dZ9izzALdkvuKbY7m8+JF
         13Sw==
X-Gm-Message-State: AOJu0Yxe/5HlYF/EMjBRZnrFwy0D/wB4bLhd+Szkb47ZBLtIy5iMwgWm
	LOnsrZJYR02bn7r6DFmIEM8xZzDRL6e4dtMNsFwRytS+AkRWVLOQtwJZRuUL/n53IbHv7Dld+b3
	n+74=
X-Gm-Gg: ASbGncvC97ijQpyMq1FkRwwhGQgWC6Go+LBefDGQ1yGdFY3IPqHkP7yDHopSqq+cufV
	rkIkZH738poQLbf3s+CDXBgUCIlTRE21XW3A0AIfTRQ3QJ7iq3+eEWgXkND9WPNqzzVZKQBqdky
	JzpIXGrmPIMYDW5FZXsOOY1v2e70d2g0Cv4so2kimivjOefrCtNWWNZ/HLyuuoVUDz2/1z4S6fd
	no6K5K8//6XyEBM6NuA7OK2rayXFFBujwKHD0k5W6LCDBJsvwQxKtVEdPs=
X-Google-Smtp-Source: AGHT+IGSCgFL+4W3h9hrrnEm7F21TowxskD+n7tmisC3XuITh6z5wyv8jrbNGWg76s6FAJJBnE53cA==
X-Received: by 2002:a05:6a00:21c8:b0:725:b4f7:378e with SMTP id d2e1a72fcca58-72daf7a762cmr29739079b3a.0.1737515030066;
        Tue, 21 Jan 2025 19:03:50 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab8112c1sm9800337b3a.37.2025.01.21.19.03.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 19:03:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/14] libgfortran: fix buildpath QA issue
Date: Tue, 21 Jan 2025 19:03:10 -0800
Message-ID: <660e00469f9c99fe733cc8b37f67438a96ff2e97.1737514842.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737514842.git.steve@sakoman.com>
References: <cover.1737514842.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 03:03:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210128

From: Chen Qi <Qi.Chen@windriver.com>

The '-fdebug-prefix-map' options are used to map source files locations,
otherwise, DW_AT_comp_dir will contain buildpath.

The '-gno-record-gcc-switches' option is used to fix the buildpath introduced
by '-fintrinsic-modules-path' option, which is automatically added by fortran.
Here's some output from 'readelf --debug-dump libgfortran.so.5.0.0' when this
option is not added:
"""
<0><1a37d3>: Abbrev Number: 4 (DW_TAG_compile_unit)
   <1a37d4>   DW_AT_producer    : (indirect string, offset: 0xd653): GNU Fortran2008 14.2.0 -m64
                -march=core2 -mtune=core2 -msse3
                -mfpmath=sse -mshstk -g -O2 -O2 -fstack-protector-strong -fimplicit-none
                -fno-repack-arrays -fno-underscoring -fcf-protection=full
                -fallow-leading-underscore -fbuilding-libgfortran -fPIC
                -fintrinsic-modules-path /ala-lpggp72/qichen/Yocto/builds/build-poky/tmp/work/
                core2-64-poky-linux/libgfortran/14.2.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux
                /../../lib/x86_64-poky-linux/gcc/x86_64-poky-linux/14.2.0/finclude
                -fpre-include=../../../../recipe-sysroot/usr/include/finclude/math-vector-fortran.h
"""

See https://gcc.gnu.org/pipermail/fortran/2024-October/061204.html for more
detailed information.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/libgfortran.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-devtools/gcc/libgfortran.inc
index c68645e392..2a08872c25 100644
--- a/meta/recipes-devtools/gcc/libgfortran.inc
+++ b/meta/recipes-devtools/gcc/libgfortran.inc
@@ -8,7 +8,7 @@ EXTRA_OECONF_PATHS = "\
 # An arm hard float target like raspberrypi4 won't build
 # as CFLAGS don't make it to the fortran compiler otherwise
 # (the configure script sets FC to $GFORTRAN unconditionally)
-export GFORTRAN = "${FC}"
+export GFORTRAN = "${FC} -fcanon-prefix-map -fdebug-prefix-map=${S}=${TARGET_DBGSRC_DIR} -fdebug-prefix-map=${B}=${TARGET_DBGSRC_DIR} -gno-record-gcc-switches"
 
 do_configure () {
 	for target in libbacktrace libgfortran
-- 
2.43.0


