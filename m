Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
 by mx.groups.io with SMTP id smtpd.web10.377.1592848817460081083
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 11:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=BQLlL4gq;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.67, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f67.google.com with SMTP id 72so257543otc.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 11:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ep2z3KekPlP0YAY3eZm42PC66AO4Kz/19FKwc0y/yIw=;
        b=BQLlL4gquboofy42RallKQN0A7bu8rjF3oi9V5+NV81eszkTPwm0UDyGYFdmdRt6N+
         NlarHx90d4ERNfaaVoVIPDXNakUakzxaG1wzNkC+/MLCUQiYxjFr7d2AgvHi/FT80v8S
         IsWNJgtm6ivtemc0c08/hPZ7FmgeRaM4PFB+XGvBluUbWF/rkGNvH8GlNY0xX9DZ20dF
         lr6gyDA0ln/ZwAfJVkxEC4Tnm/aEpOP8SpidIO9kt8E+vwU6AsqxaiuqkBPNK999dBYj
         i5VMC/MnJA13YyG/xFloZ0HrF+Q2bnUTkkVDEDUMxzM2LP1iOQChYxzwwdxt1SI8tQoB
         Eyng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ep2z3KekPlP0YAY3eZm42PC66AO4Kz/19FKwc0y/yIw=;
        b=bZ1K6zx22BU14C8Rz/8SPOZJoOxEU+kVdBP/DRAdM8nghVoa2nE8dgoMcjsAIxZDgj
         oGd5bvHOHtQk9orRKJWXg5VZIeME0DxqOLjt2C76HKz9N9IYjcPVwNxjYRaGr7Ap/D2J
         vb31H9ZzSOF8YPQ3oEveaij7rBDLtuxGdKOcVDIrosvGond306fLPViC7fMRPqwfLON3
         udNQJiQ2jBQQHjit3NIsIZZ1VMmJbgKQRoOZGMSmy29yHtltUi2zURol9MhrXnvKTW5y
         054IPKgXDninu8g1/djFnZXmwwzOohQR3GYfepWLWTMy9909jsLUlFwwTyYN+VNDlE50
         3hqA==
X-Gm-Message-State: AOAM533N9lKse7GZLGUpuE2paWvXpQjXcDEguoRhbDCYonHW7f8opQRk
	p5JCTLm1duSIm1TfrGoiBXEhYEf/HZyG0w==
X-Google-Smtp-Source: ABdhPJxOu3KWoxLwUv3utWYVF9H6t4GhcKEe0Btj3rHcDDUP7q7I4+eB8CjaUs6/WK6AQGxpWPDy6A==
X-Received: by 2002:a9d:7f17:: with SMTP id j23mr15901708otq.144.1592848816378;
        Mon, 22 Jun 2020 11:00:16 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id n60sm3422659otn.75.2020.06.22.11.00.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 11:00:15 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/33] buildtools-tarball: export OPENSSL_CONF in environment setup
Date: Mon, 22 Jun 2020 07:58:05 -1000
Message-Id: <f47fe24317d2fd19112c7e38858b21b3457835d9.1592848337.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592848337.git.steve@sakoman.com>
References: <cover.1592848337.git.steve@sakoman.com>

The autobuilder has been experiencing SSL: CERTIFICATE_VERIFY_FAILED
errors during error report uploads when using buildtools due to looking
for certs in /opt/poky

Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 197f1d5d14b8e57295f5a81c03c86abba5328614)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 977b6a5e1d..edf67ce2ad 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -74,6 +74,7 @@ create_sdk_files_append () {
 	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${SDK_SYS}
 
 	echo 'export GIT_SSL_CAINFO="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
+	echo 'export SSL_CERT_FILE="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
 	echo 'export OPENSSL_CONF="${SDKPATHNATIVE}${sysconfdir}/ssl/openssl.cnf"' >>$script
 
 	mkdir -p ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/
-- 
2.17.1

