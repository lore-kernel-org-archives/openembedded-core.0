Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 297D4E77198
	for <webhook@archiver.kernel.org>; Mon,  6 Jan 2025 15:32:23 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.62102.1736177532782959028
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jan 2025 07:32:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BlTCJMQh;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43623f0c574so99853215e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jan 2025 07:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736177531; x=1736782331; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m2vA99N2zkwR1eMd4cCPXKCBJWygTIQTHWEOwKx0794=;
        b=BlTCJMQhzzRMsQ7LyYNuOn8OnJkCLarBAD6SDLROGeT6wl4wGBlc45FsUI0U91q1J9
         DHq1I2cZwaXZMEmSjrVGZEkLZUG5SfrboFxsc2DucxeDpG+pPA/Jt9h2Ueb/Q0o4dW1k
         sXCOJdSGS4Mo+XrDsQVPFCaqEE4ZZ/1ASapK5m/BV5ji+SRM81LmE8C/nOKXOCnGLUCM
         uI2feUqIHFs6k4HY7MVwBBIAlhD1+j7wvgEXxtub43nd3UxCS1OUPAIxPJqbXvVkBmpl
         N/aOUNDNl1nURs1paayYeGM0PZrXFVjzjRxSXc5ddmf3wqmzN8H+t5fyaAbAwqBcATi6
         vQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736177531; x=1736782331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2vA99N2zkwR1eMd4cCPXKCBJWygTIQTHWEOwKx0794=;
        b=HBndlJjJI/1keBEzrYivMgEbOaQ+XOegsyaMQ5tD/b7K5EpqWMthMtmNpUybnGa9jF
         3WeSGJ6A4V1D3Yb5FVrihEemVqD6J2vlp7y0CmbQqwrNEZmSSZyx3x5aJ3fPbypHP3G3
         OFrUKhIr/mLwTWl9Wpo/CyVbttBgMrPUnSmfMXqKpmIBUL15OavU0EXCEQig6sJQ2TOA
         616Tqs2y+Ngp/SHpGPIx5fz4Ve1qE+maPR02Gd0/tk9XV/Jc6SBKNLz0/HZIlenn5Bt3
         GGqoPBsdrlovNDh3rTqlSqMETDgP6ZE7+HILXUiP9wA3sKAcuc3ge/GMj7b97O/yCJsS
         eiZQ==
X-Gm-Message-State: AOJu0YycFtWOTtYkO9oaXTId0B07aVvG2Hbw3DCKNvr6H5jysL6vLgS7
	6U06koj8V06V9WiZPDQgBXlIciqMb8804dDr/1NKyr0wk+KvD1qmHybrOQ==
X-Gm-Gg: ASbGncuG2b1/dK35IEw5R54avNn+fwmJojB14wuBQ1V44JcapygBXo0B0hJ8dU1IcSx
	jhVDXHElyYSxx6sw9oU5GD5WeXSc3P5lLzGQl5JHvja+6U92tTNfirV65+s614Qj3LyitsXqGOu
	wB6+zXHP8SesPeX7oLH/TGbvqulT03L+r5pP3XXh9aCpv7nHe4rqx39p9lDTnO3oqGBASUZVUXI
	2kLuCTHN9K+PYr4CctcKZXlepZgDaOmMOgn5uga2Bxv6s3aQd3I50hjMEaMqzeqnERqUOzgIYRR
	DAQMVrtWK6ghfg==
X-Google-Smtp-Source: AGHT+IGMoKxTtL5vulrxkGgoXZxLougD0GA7cq/xwdroaLn/GKxLZb8ef03W9wa20uLv668+Lffatg==
X-Received: by 2002:a05:600c:1c87:b0:434:a10f:c3 with SMTP id 5b1f17b1804b1-4366864320emr520812635e9.9.1736177530922;
        Mon, 06 Jan 2025 07:32:10 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b4432dsm601572385e9.41.2025.01.06.07.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 07:32:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Chen Qi <Qi.Chen@windriver.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH] libgfortran: fix buildpath QA issue
Date: Mon,  6 Jan 2025 16:32:06 +0100
Message-ID: <20250106153206.4017267-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jan 2025 15:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209427

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
2.47.1


