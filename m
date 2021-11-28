Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC2FC433EF
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 21:59:18 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.53486.1638136758157097506
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=AZ9O/PLW;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id
 gf14-20020a17090ac7ce00b001a7a2a0b5c3so13802436pjb.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=izwL6H+fnIKGJiy/OvTGQRyALrttrVKHV2qTneMQZLU=;
        b=AZ9O/PLWCJO6mb6THJ6YvZFLQNouV2qZ3J2AOHJ7AjfQyWKlKcQKvpXNcQBDNQhFeB
         UVCoBVWkvlkrmb9GwI54DuyG8ThTpt1affS718Oi7VbMmERWKGczsmJXJL1BSVgjjo7h
         LlE8DoYy8G3afb4MuJ7pAqpU3a6viT6ZjaIy5yD31yoUFgFarMPft04qEDrj8ONwA8Yu
         iiVgWkGZu6SYwfIDRZSaWr1IggsRKuv0wF1eURCUB81GLa8af1YNWwWrkDpNP199ABXE
         SKMcsA9GTU6JwYvtl7yV4iDsJcnjuMTv/pZEMc/mpH6531A07xBIzLu1yQO+UbOUpBvA
         kqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=izwL6H+fnIKGJiy/OvTGQRyALrttrVKHV2qTneMQZLU=;
        b=O0TOHKQNmUSNwY58Ywct4YUDHelOwqV79LVgCg6Kh17za7+JgZkgWpy/wei0OOuVeI
         6I4M2Lx30wySBCQIKrnPDqR1LiZSPlA0mBgkywOobcARqZ0H3XU6PmlksU2oCuW9nWGA
         v836psAZiOz9hKg0M9E2bdLdaYvp39cQmZ+hW6N0Kkmg4xGWfMOpICiJ3GPSD8Vg1jys
         qSwr/NL8W7K/IF9ZA68Jcv2oC5qISIS1SPKzdFR7kbqQZW5j6/3i1EdXnkT2JD5QZ15j
         yOnRAMyAz0vqmL8NflW93PTRt/IdGItSSaUgEyFp8pdaw7gAJs47IcN9gUcQry6ZOTRb
         +ltg==
X-Gm-Message-State: AOAM533VUbZUn6VLUTC/rlUOIKVNaT2ird3vJprFQY0hpMWSTD3OBt+V
	eAn9rMSaiFdcUieCw4m8V8y6VkmesxYm/WBGlf8=
X-Google-Smtp-Source: 
 ABdhPJwbe+AqKuEZbKKrNHtnzgjvj5jpQ+2BIWEtTnW0NEnuD+HmfIVnDaW4zjJQGcTYM/Htcxqf5w==
X-Received: by 2002:a17:902:b581:b0:144:e601:de7 with SMTP id
 a1-20020a170902b58100b00144e6010de7mr55558644pls.71.1638136757054;
        Sun, 28 Nov 2021 13:59:17 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.59.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:59:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 23/42] lrzsz: Use Cross AR during compile
Date: Sun, 28 Nov 2021 11:57:35 -1000
Message-Id: 
 <bdae79da1386e01711c89a833919501be8fffa4c.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 21:59:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158905

From: Khem Raj <raj.khem@gmail.com>

Current code hardcodes archiver to be 'ar' from build host

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 74ed1d10434213ad3fcf54ded49879090f979e1e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...mpilation-using-autoconf-detected-AR.patch | 36 +++++++++++++++++++
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb       |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0001-Fix-cross-compilation-using-autoconf-detected-AR.patch

diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0001-Fix-cross-compilation-using-autoconf-detected-AR.patch b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0001-Fix-cross-compilation-using-autoconf-detected-AR.patch
new file mode 100644
index 0000000000..47c7ec4170
--- /dev/null
+++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0001-Fix-cross-compilation-using-autoconf-detected-AR.patch
@@ -0,0 +1,36 @@
+From ecdcf0df6c28c65ca6d1e5638726e13e373c76c5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 11 Nov 2020 22:58:55 -0800
+Subject: [PATCH] Fix cross compilation using autoconf detected AR
+
+currently its using 'ar' program from build host, which is not expected,
+we need to respect AR passed in environment
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.in | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/configure.in b/configure.in
+index 4ddbe8b..b7c3c31 100644
+--- a/configure.in
++++ b/configure.in
+@@ -84,6 +84,13 @@ AC_ARG_ENABLE(syslog,
+ 	  ])
+ 
+ dnl Checks for programs.
++m4_ifndef([AC_PROG_AR],[dnl
++  AN_MAKEVAR([AR], [AC_PROG_AR])
++  AN_PROGRAM([ar], [AC_PROG_AR])
++  AC_DEFUN([AC_PROG_AR],
++  [AC_CHECK_TOOL(AR, ar, :)])
++])
++AC_PROG_AR
+ AC_PROG_CC
+ AC_PROG_GCC_TRADITIONAL
+ dnl AC_PROG_INSTALL  included in AM_INIT_AUTOMAKE
+-- 
+2.29.2
+
diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
index 4129237c59..54c431eeb3 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
+++ b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://www.ohse.de/uwe/releases/lrzsz-${PV}.tar.gz \
            file://lrzsz-check-locale.h.patch \
            file://cve-2018-10195.patch \
            file://include.patch \
+           file://0001-Fix-cross-compilation-using-autoconf-detected-AR.patch \
            "
 
 SRC_URI[md5sum] = "b5ce6a74abc9b9eb2af94dffdfd372a4"
-- 
2.25.1


