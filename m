Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C9ACD63958
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 13:58:04 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.13865.1732111075647322135
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 05:57:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vMNjMC4H;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21263dbbbc4so15224075ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 05:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732111075; x=1732715875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oPCMHF49nDAH5fr5PBi7YAsxuxjLpnf+/f4Vg93hGDM=;
        b=vMNjMC4HsZnivLnFK9gjH9rVqC4OudTPjbfGnt90Cr/PfZsbca0iuIQgS3Ikxv6jF2
         +CTTLG/qBQM3Df1/EK2x67u0QM9q5LPgO26BVcGKJQHJGsy+d4TbomOnWJr8fM3/HMoC
         8p+qkE4iROcD5eYx4YaIvwiGFDvbQvzzoP1+ITj0zZLMjV/dX7c5yBckrw2xwuuo0Jw3
         eOuiaPT3I3hpfX10AefOWDYTqTEoWMDxaBM7q3ghtnLuy9xApxvqbOKWhBhqUpXDjgp8
         6xvRjbj9GiVvq/ZLlb6vbXbR8G6v8aJhxs4AtZQpO1eXySOpx/z7eMPWLtFv3ABs1Ol1
         bDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111075; x=1732715875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oPCMHF49nDAH5fr5PBi7YAsxuxjLpnf+/f4Vg93hGDM=;
        b=E2Rr1QnGFlF99jaiszWZ1lgieoC/kuQQyoJnDFDx8ybC0vC8pSL2fZMhG/ZE7VF32H
         0H1oxb6CbNKkrecD4dmUqdZ2Rvnl7VRolj1DIsvntURwFrPmlb0YpsTbp3ZwoKTd7Mo3
         PFP0slnQzzLNhJZv8fWdPOGjrhwSbgp+2o5B/3hyh60fpJ5uiNItqqaKJR0QuJgbNNJj
         luS/wcJ28nEqSbmvUWeiWpDUf4aW5hIQ8SwZ7MbAVhpfLfK/xSdBnrOahidwjZMGp8fQ
         3deWs5mbyOiSxu2Uz1QR83Rn/zcK3dWI09unu8R/W7ZJgJHeyEXlEPM/WRP4JShEDjWi
         hWbA==
X-Gm-Message-State: AOJu0YyjrrNW4m0d7u+naQhbkFHZIqMCUl2vYIvBxJty8e+yPmh3kPMu
	nhWwhSLcnOc5/PpwooLW5/Hii20ysbBQ2hVBN//qcxK9radCOgAeSiUMkP1NTL1LGZPBF68gjtm
	/
X-Google-Smtp-Source: AGHT+IFccX0LlOFphxQDvBT/DtZlU07DtQdNPWY9dyN5CJMM7++kZsFAfp1Mf5rmOaPaJH3645694w==
X-Received: by 2002:a17:902:e842:b0:20c:e6e4:9daf with SMTP id d9443c01a7336-2126c0e07b7mr30163795ad.13.1732111074886;
        Wed, 20 Nov 2024 05:57:54 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2127a4db5b3sm4658175ad.233.2024.11.20.05.57.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 05:57:54 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 26/31] libgfortran: fix buildpath QA issue
Date: Wed, 20 Nov 2024 05:56:58 -0800
Message-Id: <821eed0bc6489aed1b9f93d06481a6c3a03a0260.1732110892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732110892.git.steve@sakoman.com>
References: <cover.1732110892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 13:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207450

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
(cherry picked from commit 1eb084956bcba83782bc2b24cf8cc89459a57e34)
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
2.34.1


