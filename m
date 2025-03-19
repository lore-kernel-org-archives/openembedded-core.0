Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92ABFC35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 21:42:30 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.7177.1742420541487522988
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 14:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BtTckSH5;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22398e09e39so586305ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 14:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742420541; x=1743025341; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZwvUPhg0zmXaS74gLgBF+hjFnxoQ0KnZ7SOFmWX+cM=;
        b=BtTckSH5FjdwsO+ITzYC2K1x9cfEdoSpVKa/LR9zER/wNAGIlKrGlJRcIkJ/QhTIqk
         a+/CXZKmpYOw8WEDx5j4evi/XiVGztUAT5mk1t8zaQc5jGGCwEVKu4UwfI+AIr2FwuG/
         neh6Zn7mPwHjFi8ti0tOa3BwQShgDMVxuZwvWMnUXmJqIrVLGFAidm6prUab/2+8SXYk
         EjUJFDnDBs7zenwNnTh53wMTXfBf4iNL1acUGERVMPwx+B8pkHzq/D3xHRGjECKpJxHu
         kGvQ5uraJIus8bNW1AZC7AoXc4eXjrJvCUlvEnGpuNvtmTxWBaU+kVCbrzu+1iXP5HGf
         ajrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742420541; x=1743025341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZwvUPhg0zmXaS74gLgBF+hjFnxoQ0KnZ7SOFmWX+cM=;
        b=gXCvt6fAIyWH+T1ODcQ0TkUZTbbRNYW/l6auYqMUn9K+wPtiN/GrLPVGKEXAkThA55
         DdvQV8wl7v7ttowAzW+PL0mKlemr3AmZBN/tQ+OxarQ1ToR46ZxGoYVQmJKiW9B7kLnc
         OAPXhKkiDWgfGTWhF6rJKare0leJkNSn9MSfN92gXff1A35S2VAeN5rxlGGj0/MG5Q7N
         YCpxW4OVp871pOons32htuz87lYGw8u4w2qoc8lJqS3dlQjga8PGmoHpPaSZ5fxftAtS
         12Xl8GBXKW0wQpFSX1ZT04g+Ybyws/rUbD7YcKRRhDNuEA9SAxgIIrTmAdvxm0fL49Zh
         jPZQ==
X-Gm-Message-State: AOJu0YxOORuo9r4Ko802n2o7+zGTCjR1yyAGyH/UuMdPSZ5BgdKJHHNb
	pEdGGHq0KnhctpBxCRs3k2yTiLtGyh/emf/c6cPO7KB1mi2UVhGdC2oru/p5
X-Gm-Gg: ASbGncvQ/q4jGG6xfca/KWKq5JSGhVfsCxZN7KEJYcJSYkQpHiVXb7UlVu+baeYGDVG
	tyiH1scTKHknjlX6oVMrQ6gwog48mPQMuVssH6b8mD0w9bcApBjKUtpFdx1OiyuxIe6fcQOCnXc
	2qBGsIYSG25SPd091CE7dHRudUGJiQkSpzKqvct/TLCmOx3vDQDZbaIRPulIUDJIEbs4GrB7+aU
	iJzxzOWx9q2aXW4QuSZbj7a7sA4VIDhvdF7MI8FFp8yghmgoypZo5hA2IPEQ8yFtLbllkEUE1vA
	8mpnYfnei6C8lVPGFzK5uRmOqSnx+xlMXi7B
X-Google-Smtp-Source: AGHT+IErHLV3TBI8LVkqq6Z9FUgvoVlZf4U6Ju/jZZ//C1sH+5HYSyXT2rtOOM+2R80OKfXhXPncpA==
X-Received: by 2002:a05:6a00:4fc8:b0:736:55ec:ea8b with SMTP id d2e1a72fcca58-7377aa66ea2mr1493489b3a.24.1742420540472;
        Wed, 19 Mar 2025 14:42:20 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73766322e03sm3604964b3a.99.2025.03.19.14.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:42:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v4 4/9] unzip: Fix build with GCC-15
Date: Wed, 19 Mar 2025 14:42:07 -0700
Message-ID: <20250319214213.2505249-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319214213.2505249-1-raj.khem@gmail.com>
References: <20250319214213.2505249-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 21:42:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213359

Add a patch to remove redundant declarations

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/unzip/unzip/gcc15.patch | 17 +++++++++++++++++
 meta/recipes-extended/unzip/unzip_6.0.bb      |  1 +
 2 files changed, 18 insertions(+)
 create mode 100644 meta/recipes-extended/unzip/unzip/gcc15.patch

diff --git a/meta/recipes-extended/unzip/unzip/gcc15.patch b/meta/recipes-extended/unzip/unzip/gcc15.patch
new file mode 100644
index 00000000000..42a2f81681e
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/gcc15.patch
@@ -0,0 +1,17 @@
+Do not redefine gmtime(), localtime()
+
+They are already provided by system time.h header
+
+Upstream-Status: Inactive-Upstream [need a new release]
+
+Sign-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/unix/unxcfg.h
++++ b/unix/unxcfg.h
+@@ -117,7 +117,6 @@ typedef struct stat z_stat;
+ #  endif
+ #else
+ #  include <time.h>
+-   struct tm *gmtime(), *localtime();
+ #endif
+ 
+ #if (defined(BSD4_4) || (defined(SYSV) && defined(MODERN)))
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index c13e7a008ea..0a88b4c092b 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -32,6 +32,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
         file://CVE-2022-0530.patch \
         file://0001-configure-Add-correct-system-headers-and-prototypes-.patch \
         file://0001-unix-configure-fix-detection-for-cross-compilation.patch \
+        file://gcc15.patch \
 "
 UPSTREAM_VERSION_UNKNOWN = "1"
 

