Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A3B9C7EE2F
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 17:03:06 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.69591.1677430978056977106
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 09:03:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=mK7gJUbw;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id z2so4380379plf.12
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 09:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GgaU1jloGCLapcq54PC8SDiLyxVBf+hCZlPJmyRowkQ=;
        b=mK7gJUbwlOByd2v/HsdMEuacypXicaz1yqT85cnsnplOIx9JV7+CLFtxzV9ItUTAX8
         ztwGoZJRSVyYISUwSjVLc2tAAh/R92a+ijkOcwdy3MSR+knU5Nczc/oMPxvRn7I7CRNZ
         YZLrY+PEVbh+j/G0JPjWAO3VhtY+xW20IpObM2ozVrlvsQAapPnqPWjYQNXCGHEBeFJ0
         G5pX2ZL0+k1i8T6kxuHMRtHbcPytiybcFhwDFdkuUO5wdxLlITsEvbnT1knbQhaScdtg
         DcouTJimyUhR6s+HESPdcqOwJgSWvPy+phGGIysa5HVTQ7JIXiBryiatoRRM613kVQDo
         dXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GgaU1jloGCLapcq54PC8SDiLyxVBf+hCZlPJmyRowkQ=;
        b=VsI5shv+k2cSdUUxbQ/HQltRh2uDxQ/C1u+mu7rmN8Znd02DAwYREMX0SxjoWv0kIk
         d76VsxDFyqV99koUKY7L9LhedKBnn/J6mEoHuPYTSGGD+ZKe5wSmeu4D+2RTKQ9TRAqj
         xwqBGIJK5VzNngTkfpnxHgWP9cZt81+LqE1bGN/cK4Gy9e9E98AdeJlJz/g2sTwZd+mb
         5XPe4g/cvrAtVmrdk8U+Kr8n1V12To699d9RvDtzHkLEn1IRl138I0c4Y/IvplMxfzUu
         Ip05uH8vB4eU8j8SOeDoq6tYKkuae271Ij2LJtc1HTI4Nf1H4NrV9WAm2bp0XuidLpXT
         hh0A==
X-Gm-Message-State: AO0yUKUFjfUJanUb7PFJu7NEgw9bTLGbaTznYUPYS5FMBqEkH6Y6j4xG
	pnhyJfKpcRNUxkDFC+lLBfMEWm0a9Ll3qODq5Xw=
X-Google-Smtp-Source: AK7set9ikx1Eci7vNRJ5NgULKHpfYKmddehq0LXpmibwxdS2A5WuRUQmXmWi8m17iP37niR5Mr/piw==
X-Received: by 2002:a05:6a20:6998:b0:cb:a64b:6e1b with SMTP id t24-20020a056a20699800b000cba64b6e1bmr23149645pzk.58.1677430984292;
        Sun, 26 Feb 2023 09:03:04 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id s25-20020a63af59000000b004f1cb6ffe81sm2500856pgo.64.2023.02.26.09.03.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 09:03:03 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 19/28] dhcpcd: fix dhcpcd start failure on qemuppc64
Date: Sun, 26 Feb 2023 07:02:15 -1000
Message-Id: <add5856e9a2d0646869756abf1a6b1d7d9629176.1677430770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677430770.git.steve@sakoman.com>
References: <cover.1677430770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 17:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177757

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Backport patch to fix dhcpcd start failed on qemuppc64.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a31d658198566de12cdd1aad18776b8da8065787)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../dhcpcd/dhcpcd_9.4.1.bb                    |  1 +
 ...x-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-privsep-linux-fix-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
index 5cf77fa0f6..39e689d2f6 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch \
            file://0001-privsep-Allow-getrandom-sysctl-for-newer-glibc.patch \
            file://0002-privsep-Allow-newfstatat-syscall-as-well.patch \
+           file://0001-privsep-linux-fix-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch \
            file://dhcpcd.service \
            file://dhcpcd@.service \
            "
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-privsep-linux-fix-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch b/meta/recipes-connectivity/dhcpcd/files/0001-privsep-linux-fix-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch
new file mode 100644
index 0000000000..1c514f9b8c
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-privsep-linux-fix-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch
@@ -0,0 +1,34 @@
+From 7a2d9767585ed2c407d4985bd2d81552034fb90a Mon Sep 17 00:00:00 2001
+From: CHEN Xiangyu <xiangyu.chen@aol.com>
+Date: Thu, 9 Feb 2023 18:41:52 +0800
+Subject: [PATCH] privsep-linux: fix SECCOMP_AUDIT_ARCH missing ppc64le (#181)
+
+when dhcpcd running on ppc64le platform, it would be killed by SIGSYS.
+
+Upstream-Status: Backport [7a2d9767585ed2c407d4985bd2d81552034fb90a]
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ src/privsep-linux.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/privsep-linux.c b/src/privsep-linux.c
+index 7372d26b..6a301950 100644
+--- a/src/privsep-linux.c
++++ b/src/privsep-linux.c
+@@ -232,7 +232,11 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
+ #elif defined(__or1k__)
+ #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_OPENRISC
+ #elif defined(__powerpc64__)
+-#  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_PPC64
++#  if (BYTE_ORDER == LITTLE_ENDIAN)
++#    define SECCOMP_AUDIT_ARCH AUDIT_ARCH_PPC64LE
++#  else
++#    define SECCOMP_AUDIT_ARCH AUDIT_ARCH_PPC64
++#  endif
+ #elif defined(__powerpc__)
+ #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_PPC
+ #elif defined(__riscv)
+-- 
+2.34.1
+
-- 
2.34.1


