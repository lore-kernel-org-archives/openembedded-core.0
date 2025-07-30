Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB1B7C87FC9
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 21:29:34 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.47221.1753910969328846312
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 14:29:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=u1AOTJOT;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2400f746440so3009075ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 14:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753910968; x=1754515768; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0PsW6GTZOTGPcMAwoK9zRqYkw0mWb7kLhx84ASX8E5s=;
        b=u1AOTJOTXCT22kTEP2Pa+53WwV3lLHH0ulVcoX9H1zZz8Y/AKkjFrqydhLpg+lz1+5
         Nl6UuuwaRd87q/1q2KELkB2EmNJVw6xXyzuOk2UQec4WtyqbkY05bxxTgx2ENlFoypVi
         8fJAQWTMS49Ya4Q/0EjsZrk4a30UOm8RpqIq0ZPF7PBeYn2NkUf3OdTK31GjTIwX/oCP
         AKJgesr9nQ8OItfQ9iVMHg5n1uR4crBHzNmCsZNrwMpDoN97PNeWeEY1KQtoY/zEKWE2
         z0fBH2DrVHZvNURQRn/Z94vB+JXukrwwQy8cuttYSbTUND5svo/iVDKZdBN0RPOKwsLS
         8i5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753910968; x=1754515768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0PsW6GTZOTGPcMAwoK9zRqYkw0mWb7kLhx84ASX8E5s=;
        b=k5MFl1QRB4lLdwmMgqC4eTs8K61ZP4BZBUTCPt2giGvZsxMkkXhdJhBZkRONZa1gH3
         318hh3ty1TigMDhK4xwCIyWGXPnfWmXWHHV3uveL0FjxghA1EsYitiG9KADEni/zYlgB
         uDDPOs6dlu9zLnKRFJA/dTrXAqU7B9NHeNY2isAgH0JrYEgtBSJaoM4uH8fJYKKnwuZH
         P4IpYECH/+iYHBFLAG/tlTNlTT/9/wasypNcBdhtfRD4VCC8Db1X1ptBbezHqRZqObuM
         rZpkopNwFTszzvWsktpZCCRmwmTVbWMIFWjs7o78rP38gr0CJx8TbPBaLxhtz3JDntb1
         b34A==
X-Gm-Message-State: AOJu0Yxrtm0bZQ+C+bWQRERp/YRjxiOiVhJLFaiSE9/ba76AP5pXLCTj
	Y2PZrCmuFmpIBcomRouz3LepsBgtIRwhW/SpW4JgTgvl1njjdR2rN1lwp7eP4k5PiJyIKbCGkbi
	weJay
X-Gm-Gg: ASbGnctgKK73uZPLRiYiBhnYEt2yXV5zyVevUeQVwZCs2+Su9t8jXUDErDGxJHz9kWa
	BK5c0g/5wMqziTiqRsGQ5JG99GrRtBOcLux1c+hD7dpQZVJxLTzVZIAa0z/ju5SnKEz2mP2CvgH
	uCWFI8hlC0hWYpJyg4r+V5NlYi6gFDIWm2ur+u6Gtrjcn35dXSma0b6qQV7hyV60dIX6qp6Wp40
	3PNaBXf3aPdbFiKm8gDk055yJlt5jUJsm2v5WyXvgu9cOMy5PA6j7tII1ZQbAnBKAxHedh/Baa8
	ny11ENTR+fYxhaD1dIlKMHBesldBj7bkoYc9Nc8JjvG6tT2/G87ao0yPGYMKwV037StsbhWjT4j
	LHmhhkdnbgWxhDc8cKfXxcHI=
X-Google-Smtp-Source: AGHT+IHHVGRVpnUbetTF/y12W5bNVr3FNLkvZKqLuWF/zaCsdZRYurH70ViQhbLtMORt7yhtCQtF0g==
X-Received: by 2002:a17:903:1ca:b0:240:fc:abd7 with SMTP id d9443c01a7336-24096b23bc8mr68273545ad.31.1753910968442;
        Wed, 30 Jul 2025 14:29:28 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:58fd:da9:30d5:829a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899b4adsm576365ad.132.2025.07.30.14.29.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 14:29:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/11] linux-libc-headers: Fix invalid conversion in cn_proc.h
Date: Wed, 30 Jul 2025 14:29:02 -0700
Message-ID: <f023779af6c0e5c838bdacbd6d9765d1c6740575.1753910853.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753910853.git.steve@sakoman.com>
References: <cover.1753910853.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 21:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221170

From: Fabio Berton <fbberton@gmail.com>

Backport 'connector: Fix invalid conversion in cn_proc.h' commit to fix
error:
/
|/usr/include/linux/cn_proc.h: In function 'proc_cn_event
| valid_event(proc_cn_event)':
|/usr/include/linux/cn_proc.h:72:17: error: invalid conversion from
| 'unsigned int' to 'proc_cn_event' [-fpermissive]
|   72 |         ev_type &= PROC_EVENT_ALL;
|      |                 ^
|      |                 |
|      |                 unsigned int
\

Change is already merged in kernel branch linux-6.6.y [1].

1 - https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.6.y&id=06e785aeb9ea8a43d0a3967c1ba6e69d758e82d4

Signed-off-by: Fabio Berton <fbberton@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-Fix-invalid-conversion-in-cn_proc.h.patch | 40 +++++++++++++++++++
 .../linux-libc-headers_6.6.bb                 |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-connector-Fix-invalid-conversion-in-cn_proc.h.patch

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-connector-Fix-invalid-conversion-in-cn_proc.h.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-connector-Fix-invalid-conversion-in-cn_proc.h.patch
new file mode 100644
index 0000000000..e245d97de0
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-connector-Fix-invalid-conversion-in-cn_proc.h.patch
@@ -0,0 +1,40 @@
+From 06e785aeb9ea8a43d0a3967c1ba6e69d758e82d4 Mon Sep 17 00:00:00 2001
+From: Matt Jan <zoo868e@gmail.com>
+Date: Tue, 14 May 2024 12:10:46 +0800
+Subject: [PATCH] connector: Fix invalid conversion in cn_proc.h
+
+The implicit conversion from unsigned int to enum
+proc_cn_event is invalid, so explicitly cast it
+for compilation in a C++ compiler.
+/usr/include/linux/cn_proc.h: In function 'proc_cn_event valid_event(proc_cn_event)':
+/usr/include/linux/cn_proc.h:72:17: error: invalid conversion from 'unsigned int' to 'proc_cn_event' [-fpermissive]
+   72 |         ev_type &= PROC_EVENT_ALL;
+      |                 ^
+      |                 |
+      |                 unsigned int
+
+Signed-off-by: Matt Jan <zoo868e@gmail.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=9258d795978f398ecf2d222a8388cff81d37d34d]
+---
+ include/uapi/linux/cn_proc.h | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/include/uapi/linux/cn_proc.h b/include/uapi/linux/cn_proc.h
+index f2afb7cc4926..18e3745b86cd 100644
+--- a/include/uapi/linux/cn_proc.h
++++ b/include/uapi/linux/cn_proc.h
+@@ -69,8 +69,7 @@ struct proc_input {
+ 
+ static inline enum proc_cn_event valid_event(enum proc_cn_event ev_type)
+ {
+-	ev_type &= PROC_EVENT_ALL;
+-	return ev_type;
++	return (enum proc_cn_event)(ev_type & PROC_EVENT_ALL);
+ }
+ 
+ /*
+-- 
+2.50.1
+
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb
index d68de6ec7e..11e7524fed 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb
@@ -8,6 +8,7 @@ SRC_URI:append:libc-musl = "\
 
 SRC_URI += "\
     file://0001-kbuild-install_headers.sh-Strip-_UAPI-from-if-define.patch \
+    file://0001-connector-Fix-invalid-conversion-in-cn_proc.h.patch \
 "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-- 
2.43.0


