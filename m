Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web12.49.1618612123717528155
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Apr 2021 15:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OweM3OzZ;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: paulo.zaneti@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id 18so13637564qkl.3
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Apr 2021 15:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AUGzWsECCDdTtPydCK+MyOOt44ds2nmnqyaSiuMyXg8=;
        b=OweM3OzZgoAeP0iKJ2mdHX2JQ6XjrTkAZyIVu00l2xc6zALkko48V3mMONKFWjaaz9
         fV607I4+NqQN1xz05uWZuuYAJ5FEI3wVEn2Ct2XN0HFICj4s0QxXkZ41ysqKc1UKUY4k
         thwvH1lCP38DBZyJFREIXRXiR8+GJl1EHLrKaMh8mZm/MW1w3/zQOoeF5pAPmNGULAM4
         /doSg4OI6u6VHAtoFVZDPJRXHrRk+QaHUVHV05tNgaRZ2k2QlKrulb8lE9FJHGlWjSPJ
         ob5CZ2xTdFdJmXCb9FC0sU5FeuV0WEtqZo6BfLRRyhCT9m0Taf4GsehKTFgcRfuuWtJ8
         PTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AUGzWsECCDdTtPydCK+MyOOt44ds2nmnqyaSiuMyXg8=;
        b=UtjgSwvLureUitVL5QhJxBY3bxhGV9Xx+aY861mAvUlTAI84iGnH34f9BlTw6D7h4i
         C7GmcoGrz5atRX9u3ks+JkTW6zCR9CniDP6RBx/XJcxbemdKRcZ+06frVGOUMvO3oD0h
         AV+HLlvBkHfuh+vYxALs2dZwwevOl5kcPQJ+DOBDmVn+CYtTPVAiaU0MdBZvm3OOBxTV
         WnFlwENm8vNNPJoQcQkQ7jhKXqBpwFBo4hB/bbrAyX6iFmPyAoR11krNUUuGQg5LaqU2
         vmpeYoShYOvdI2guuKD7F5gPfJ2aNIHOO0TTzKs2QpQGGeGLPOk6pP37L2w2LozMo7uE
         YrAw==
X-Gm-Message-State: AOAM530IDlTZCzY50LrGoPaSxe0meFE8Dy6SQ7r72UKBq0ite7oA0Fzh
	hkt8HLnPlhxbRRpxmruzICj782gFWBt0OA==
X-Google-Smtp-Source: ABdhPJxx9eGFGcFccDfiQyHdq2P7qRNT44xQV/W0A66t5zELByZ6rPUv4tKHZoNUmJkB6diJEMXnLQ==
X-Received: by 2002:a37:a854:: with SMTP id r81mr406740qke.350.1618612121760;
        Fri, 16 Apr 2021 15:28:41 -0700 (PDT)
Return-Path: <paulo.zaneti@gmail.com>
Received: from localhost.localdomain ([2804:d55:6127:1900:309b:fce7:9959:4286])
        by smtp.gmail.com with ESMTPSA id p6sm415680qkk.30.2021.04.16.15.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 15:28:41 -0700 (PDT)
From: paulo.zaneti@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Paulo Cesar Zaneti <paulo.zaneti@gmail.com>
Subject: [PATCH] perl: fix startperl configuration option for perl-native
Date: Fri, 16 Apr 2021 19:28:34 -0300
Message-Id: <20210416222834.273394-1-paulo.zaneti@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unlike vanilla Perl "Configure" script, perl-cross "configure" does not
derive "startperl" from "bin". It instead derives from "perlpath".

This patch aims to fix "startperl" configuration option for perl-native by
correctly setting "perlpath" on perl-cross "configure" script.

Signed-off-by: Paulo Cesar Zaneti <paulo.zaneti@gmail.com>
---
 meta/recipes-devtools/perl/perl_5.32.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/perl/perl_5.32.1.bb b/meta/recipes-devtools/perl/perl_5.32.1.bb
index b28040c7fb..82c2922066 100644
--- a/meta/recipes-devtools/perl/perl_5.32.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.32.1.bb
@@ -95,6 +95,7 @@ do_configure_class-nativesdk() {
 do_configure_class-native() {
     ./configure --prefix=${prefix} \
     -Dbin=${bindir}/perl-native \
+    -Dperlpath=${bindir}/perl-native/perl \
     -Duseshrplib \
     -Dsoname=libperl.so.5 \
     -Dvendorprefix=${prefix} \
-- 
2.25.1

