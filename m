Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B31CCA47A
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 19:35:27 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.21999.1655667319360080207
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ILiZzjr/;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id
 x1-20020a17090abc8100b001ec7f8a51f5so4894603pjr.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dX2/Xa8Pn99XMtJqunaMAJ9iI5URGpn2pM/3M5WmS0Q=;
        b=ILiZzjr/iasUUd5i2H7c9M3LQNL3ExnVUQHbnRUIFcWwkVgoWUZM0QqxIJvVuO2d3b
         qmonZJe2s9ncNdqp2K+6pcTW42CDFLNMVcY9PQgf5SWxjM4RbjzHX3OVqOqQJW/kF7H2
         TW1wqGqoHDqWZk1CgWlWQVsQwIYEfFzzOH9dm8cZpi07K30kBLDFqK/ZLca0XIrHL1S5
         ZMXwqjq7WBzCiRI5i3F5p5m1R50AIu/Q5+lCJE6gua92wSu5Hnfvy2ft8GagiszOy8Gi
         JcbMThMeFPEnVV7p1bEYHr9b8X5JuqTY2i/YM/8N00ZuvkuHTf4CFNENQwz1CU88OwKn
         Sk2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dX2/Xa8Pn99XMtJqunaMAJ9iI5URGpn2pM/3M5WmS0Q=;
        b=Nhaku4scJb/XOCycz+khSSrkww1V1q+1o0kXXwQXIk5JRqs2ijBBlaMyA3M6REl8aH
         TwLVAs56FL1yGv8TANzfy13WApf7dURjiq2FEgqyM0LKE6iAVC0kNtMPIW6ZLOraXO7l
         DI+O+kKUxp1sB5QH1f8eLjjG6wx2yYP9pLxZjTee7VFQ8PK0S6ME/9CX02R7JPeVaZgE
         L9I5it4ot3fszvTBNBjm9MQ05O0l63p/Nm6HnUArfNkXPt3mGlL/iyWaDEX/JDBZB+cU
         fjFLOArcOgiYGwRRBZszsKcYHQ2ojT0C3t2Udf6CTgT2D829VP5YfWdDU5XLonXfOe7u
         SnhQ==
X-Gm-Message-State: AJIora8Gw7j+1jGBAaXmdXgu2cPkwCRqSr4sFI2uIHSRKRXIlgPO3dQk
	Ti5MTJJQk1wTbk+1dgbAxTir8+ObJb80mcOJ
X-Google-Smtp-Source: 
 AGRyM1szC0gSA5CgRQUAbITuqCl/oWr36VoUGkrzINrfexht0CARTto1TVVSKy375KzC5V6DfF0Ljw==
X-Received: by 2002:a17:902:a609:b0:169:a8b:7c3c with SMTP id
 u9-20020a170902a60900b001690a8b7c3cmr17484693plq.67.1655667318247;
        Sun, 19 Jun 2022 12:35:18 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 e5-20020a170902ed8500b001678dcb4c5asm216994plj.100.2022.06.19.12.35.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:35:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/12] cups: fix CVE-2022-26691
Date: Sun, 19 Jun 2022 09:34:55 -1000
Message-Id: 
 <cc657868d31cc8b4218a07aa10fa098c379e473c.1655667170.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655667170.git.steve@sakoman.com>
References: <cover.1655667170.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 19:35:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167063

In scheduler/cert.c the previous algorithm didn't expect the strings can
have a different length, so one string can be a substring of the other
and such substring was reported as equal to the longer string.

Backport patch from upstream to fix:
https://github.com/OpenPrinting/cups/commit/de4f8c196106033e4c372dce3e91b9d42b0b9444

CVE: CVE-2022-26691

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cups/cups.inc           |  3 +-
 .../cups/cups/CVE-2022-26691.patch            | 33 +++++++++++++++++++
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2022-26691.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 15f46937e1..21c56e1430 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -13,6 +13,7 @@ SRC_URI = "https://github.com/apple/cups/releases/download/v${PV}/${BP}-source.t
            file://0002-don-t-try-to-run-generated-binaries.patch \
            file://0003-cups_1.4.6.bb-Fix-build-on-ppc64.patch \
            file://0004-cups-fix-multilib-install-file-conflicts.patch\
+           file://CVE-2022-26691.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/apple/cups/releases"
@@ -119,4 +120,4 @@ cups_sysroot_preprocess () {
 
 # -25317 concerns /var/log/cups having lp ownership.  Our /var/log/cups is
 # root:root, so this doesn't apply.
-CVE_CHECK_WHITELIST += "CVE-2021-25317"
\ No newline at end of file
+CVE_CHECK_WHITELIST += "CVE-2021-25317"
diff --git a/meta/recipes-extended/cups/cups/CVE-2022-26691.patch b/meta/recipes-extended/cups/cups/CVE-2022-26691.patch
new file mode 100644
index 0000000000..1fa5a54c70
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2022-26691.patch
@@ -0,0 +1,33 @@
+From de4f8c196106033e4c372dce3e91b9d42b0b9444 Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Thu, 26 May 2022 06:27:04 +0200
+Subject: [PATCH] scheduler/cert.c: Fix string comparison (fixes
+ CVE-2022-26691)
+
+The previous algorithm didn't expect the strings can have a different
+length, so one string can be a substring of the other and such substring
+was reported as equal to the longer string.
+
+CVE: CVE-2022-26691
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/de4f8c196106033e4c372dce3e91b9d42b0b9444]
+Signed-off-by: Steve Sakoman
+
+---
+diff --git a/scheduler/cert.c b/scheduler/cert.c
+index b268bf1b2..9b65b96c9 100644
+--- a/scheduler/cert.c
++++ b/scheduler/cert.c
+@@ -434,5 +434,12 @@ ctcompare(const char *a,		/* I - First string */
+     b ++;
+   }
+ 
+-  return (result);
++ /*
++  * The while loop finishes when *a == '\0' or *b == '\0'
++  * so after the while loop either both *a and *b == '\0',
++  * or one points inside a string, so when we apply logical OR on *a,
++  * *b and result, we get a non-zero return value if the compared strings don't match.
++  */
++
++  return (result | *a | *b);
+ }
-- 
2.25.1


