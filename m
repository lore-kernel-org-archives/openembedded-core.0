Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web08.3498.1612593103532249318
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 22:31:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FqhSEDAw;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id o63so6109782pgo.6
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Feb 2021 22:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6H0sTnDW2s3pgL+lyRCG/lJxgFN72KrajOkqg4DTK8g=;
        b=FqhSEDAwru/RhV/EBbcWFMNI9KLcvaN9wHq+ZNIK0lIzMcaewEj2Pv5leYDpoAGvIK
         hVpc4ZI/ILhnxjKxrP8xyQHkNb69sQIzCf2G39ngZXOxjt/Yd+/EPvo2FF1/t180qnGI
         iuyvhn7JzAb22766RUgyB4dWShm81RtO5JAopIqGB2a8Fgbr9ukP9iG0Nk520A/lbJGy
         /SXb2i7UCvEGAD6l4Mrsu84Uxap3dG0lxZ3whQeK3jimcb8h6jrmxcY71Nv8MkQNQC0e
         SncfrP7V7oyRnX3x3OFCe9+1fE9NNT0or+x0EWojgI19EXpJqQIPdZRxEYoMOVYlrmc8
         Cicg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6H0sTnDW2s3pgL+lyRCG/lJxgFN72KrajOkqg4DTK8g=;
        b=KTCc71yimP5AGUoEiWh5goHcwIp/Nyb8Ld422/aAMsYJv78O0PpNPoRFLbaoo+Io+l
         QhTBUeE0JFv4AI/MDDzGYrO7mP4v/EO1HxxubF/+DsI0sJcvViZAUtffw6c3g3341UYP
         L0vNb2XImBzOWaRaEs+3CZmc3PbDLN23H/1G3dM/eDx1/Z7iqPHUd+tzLuXBgiCFuJev
         +/Sjs1StzUk723YuQYCuyxghpotkBxAQaKjMyuyRxj161JQ76BhKixt9qUTk2qLz9dKK
         gMWyqPJftNs8JSYHbxdZlSLny7CtMGqlESoaP9ygv27e6NVn16yvj4SqJsu4PMGnzxT+
         4Djw==
X-Gm-Message-State: AOAM532jSLgCJB5B3SzuNSVqb3CKx4+oMgdWv9fwYmdGBFfUPK68A6wa
	t/iI9oxn+Dv9mCKRUlhzuVzrGY/YZo5ZpA==
X-Google-Smtp-Source: ABdhPJz6WkAiWiW+YXHoeuTZbTCEWYjd1N+DdopdH2A33aZaxeYOUSa8Ljd18x/KDukbQSm81gTx7w==
X-Received: by 2002:aa7:983c:0:b029:1d0:1014:3d46 with SMTP id q28-20020aa7983c0000b02901d010143d46mr8303451pfl.43.1612593102199;
        Fri, 05 Feb 2021 22:31:42 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d188])
        by smtp.gmail.com with ESMTPSA id j9sm12861152pgb.47.2021.02.05.22.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 22:31:41 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] security_flags.inc: Use -O with -D_FORTIFY_SOURCE
Date: Fri,  5 Feb 2021 22:31:38 -0800
Message-Id: <20210206063138.1649019-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

compiler can only use fortify options when some level of optimization is
on, otherwise it ends up sending some warnings.

warning: _FORTIFY_SOURCE requires compiling with optimization (-O) [-W#warnings]

this is usually OK, since -O<level> would be added via CFLAGS to
compiler cmdline in normal compile stages, however during configure
there are problems when CC,CPP,CXX are probed alone in configure tests
which results in above warning, which confuses the configure results and
autotools 2.70+ detects it as error e.g.

configure:17292: error: C preprocessor "riscv32-yoe-linux-clang -target riscv32-yoe-linux      -mlittle-endian -mno-relax -Qunused-arguments -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/mnt/b/yoe/master/build/tmp/work/riscv32-yoe-linux/ndpi/3.4-r0/recipe-sysroot -E" fails sanity check
See `config.log' for more details

therefore adding a -O ( which actually is -O1 ) to lcl_maybe_fortify
means we can properly test these configure tests and real -O<level> will
still override -O added here, so overrall behavior improves

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/security_flags.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 4e64eb99f9..05253b2df9 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -10,7 +10,7 @@ GCCPIE ?= "--enable-default-pie"
 
 # _FORTIFY_SOURCE requires -O1 or higher, so disable in debug builds as they use
 # -O0 which then results in a compiler warning.
-lcl_maybe_fortify ?= "${@oe.utils.conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE=2',d)}"
+lcl_maybe_fortify ?= "${@oe.utils.conditional('DEBUG_BUILD','1','','-O -D_FORTIFY_SOURCE=2',d)}"
 
 # Error on use of format strings that represent possible security problems
 SECURITY_STRINGFORMAT ?= "-Wformat -Wformat-security -Werror=format-security"
-- 
2.30.0

