Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web12.2793.1620847521163674003
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 12:25:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qwUeq7G/;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id i13so19488964pfu.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 12:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zUcyZ0i/2FOnlxlyi3+4VBn+S8piTZ8aHKBxoq4iCu4=;
        b=qwUeq7G/rYtCULThXrI+sc0dfEdhEFDH+KL04y1R7EStZVeCXJIYgB0P/cDQee6zOO
         qj5Bf/BOuM1F1dslwNXbuqHcBToaEom1fx3EObiPZBAeogOzDZt6KJLkITJavGKwKAws
         cGHzT8g/aYCUSoaFC1qsmPRqV537+kloe50p7jnCHJbpqC19OUf8Jy4R+/3lk8VeU+fB
         Sy9sFJY+jNU/E1rkRasPeDUk19tKwdH5aGYN8X5L8Ndl2HhdFYa7Ld5WEFEEC3Sted5R
         kV3eLvwzFi0qzhX36xzU/iyucYTOTiheMpOgWMm39vSJoGCTRS3OY2gNlSZLKqy2OcEC
         Usgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zUcyZ0i/2FOnlxlyi3+4VBn+S8piTZ8aHKBxoq4iCu4=;
        b=M39i5EISftr6MrqsMrMHscVQVnWw+UPasSskzEu+jlHm31+X79BVKv0xto99iCOAIq
         XOuw5khXCWUL6Ox6n3bzZca+f2xz2I6+HZNFS6OFL3f+OMv5nK20ka1k9btSPhaBzXGI
         YMLMaQatMdkJgA0KJcpvVgXToviaW0BxqHIymRWBCK3R6cmdQ4i2HKNuolC0wJNAT0b7
         pBnVDd8xmK+imGfin/zoDeE6QRLZ4zRwA+pcWKCbKbI2haY8Xy3wYyYBrzWCQf3e6U+V
         ZlBe6de65H26O9NAZEebxe5Q5+MWhDfwqUwOMXJjz+LaE65KaaE1tPDCO6N8sXcD+yn1
         YrhA==
X-Gm-Message-State: AOAM532iNr2toEQ9VUlz4zYcOUyg9p3NCeEtIpiBaauel2s5Pg6EcOsX
	PNuaS5UsJY5whsHV7+5OrkNhDvGSetMjdQ==
X-Google-Smtp-Source: ABdhPJyUUnvuPW4DkpCFVZ1Az++RAZ3gqYrzwqXw/4JhcOPmpYtMKvX9kvVC1hudp+CXkcPaY2REuQ==
X-Received: by 2002:a17:90a:ea92:: with SMTP id h18mr42053016pjz.105.1620847520233;
        Wed, 12 May 2021 12:25:20 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a7ac])
        by smtp.gmail.com with ESMTPSA id ha14sm418891pjb.40.2021.05.12.12.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 12:25:19 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] npth: Link with libpthread
Date: Wed, 12 May 2021 12:25:17 -0700
Message-Id: <20210512192517.2690596-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

libnpth.so uses pthread_create so ensure its linked in

Fixes

tmp/work/core2-32-yoe-linux/npth/1.6-r0/recipe-sysroot-native/usr/bin/i686-yoe-linux/i686-yoe-linux-ld: ../src/.libs/libnpth.so: undefined reference to `pthread_create'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/npth/npth_1.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/npth/npth_1.6.bb b/meta/recipes-support/npth/npth_1.6.bb
index 94a3f00eac..7b3ad0c95d 100644
--- a/meta/recipes-support/npth/npth_1.6.bb
+++ b/meta/recipes-support/npth/npth_1.6.bb
@@ -18,6 +18,8 @@ BINCONFIG = "${bindir}/npth-config"
 
 inherit autotools binconfig-disabled multilib_header
 
+LDFLAGS += "-pthread"
+
 FILES_${PN} = "${libdir}/libnpth.so.*"
 FILES_${PN}-dev += "${bindir}/npth-config"
 
-- 
2.31.1

