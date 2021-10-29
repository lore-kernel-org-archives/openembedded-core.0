Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D14CC433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 17:06:56 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.8351.1635527215723951988
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Oct 2021 10:06:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iAE+cjA1;
 spf=pass (domain: gmail.com, ip: 209.85.214.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id n18so7260541plc.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Oct 2021 10:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8kfGlmNYr0Ld+ZorjMA5f00qAn2uDzB6fnpJr1IZIrU=;
        b=iAE+cjA1uHnEkNUDsCENcgTvyAPr/+Dy7aBojcg4zY1jiPunVo5NcBWmOydjRApsLt
         fDhSDWw7bsGbQ0hU7z5zuilGApULuA1JFAT232uRE7ctCbMivdeFJNQJiSLwuOM+78pf
         3cx63hMQbqmK5TVDavGRidVeAQTZS9tsnWf1Ck63Gzy1+XfP+Pho5N+n25wm9znZTNuv
         gRDDDtkKctEMrSJ2yTTGHNusakFzmMW8iRr5mdVjNVimavfZbQhuEIyNN3Wyfng6LvPF
         X05gLyzxDIk+w9WWrSj4hvH7C0EacoR/zyaMDH0EQGWG/+lxtmkCfQmuFVZJbl8bhrit
         g74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8kfGlmNYr0Ld+ZorjMA5f00qAn2uDzB6fnpJr1IZIrU=;
        b=Dy8J2BqpIDy7+vRJxrjuRwsNseJJNBrfoF698T/UU7LkMq797g+DLcLkE/JlGFVeMW
         nlWx8iwAgifd4kNxLTsClxVH+fB+u112HDD/VGfRZgE5ulL37m1ZJ9tz3kL0jgdBHD39
         iYM3OymjLcnSp5iOt71/g+MNi0OB3XjArX4deW/A6xPVRL6w75ZWiYFRkj83R6EowV0V
         qbqoOWWbGoCD2DpXqZaJ2eeQSpSq92KZWB0droTEWz5qKMB6VRE1p2XmnSz2p86wUsCz
         tOAOiifatBjLMPN4sbgr1JfKE/6oluA0YgWv/fVlnWQ5nPUxh7zFIZ2EHU38ypkH55Wh
         9RFA==
X-Gm-Message-State: AOAM5319HOhsJuz4/n/2QK/+3x/A+HhsRKu42h6Rr4R5yowm3mH06XKt
	7UaavGglxO3mp16rELM7/6q9K67cImA=
X-Google-Smtp-Source: 
 ABdhPJy8abU3LUJ39IrLqbX2UYxIXz4Dy+EMgLpv10dSXG6JqJ+HN976vZiwMlryU//YQl6dyzB30A==
X-Received: by 2002:a17:90a:1503:: with SMTP id
 l3mr12666214pja.198.1635527214995;
        Fri, 29 Oct 2021 10:06:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id
 j12sm7341797pfu.33.2021.10.29.10.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 10:06:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] libsolv: Enable correct qsort_r on musl
Date: Fri, 29 Oct 2021 10:06:49 -0700
Message-Id: <20211029170650.1278607-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211029170650.1278607-1-raj.khem@gmail.com>
References: <20211029170650.1278607-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Oct 2021 17:06:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157629

Newer musl now has this function implemented and signatures are same as
glibc, current codepaths forces it on BSD path which is wrong for musl
and results in random segfaults in apps using libsolv e.g. opkg

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...s-Conside-musl-when-wrapping-qsort_r.patch | 34 +++++++++++++++++++
 .../libsolv/libsolv_0.7.20.bb                 |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch b/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
new file mode 100644
index 0000000000..6f0dea2e9c
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
@@ -0,0 +1,34 @@
+From 06321f1a2aa89b8e028946e793344657eaad0165 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 28 Oct 2021 22:28:45 -0700
+Subject: [PATCH] utils: Conside musl when wrapping qsort_r
+
+musl now has implemented qsort_r, the signature however matches glibc
+and not BSD, current check makes it such that it falls into BSD case
+when building for musl, which clearly is wrong, therefore instead of
+just checking for glibc check for linux to decide which qsort_r
+signature to use. This covers both glibc and musl
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/util.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/util.c b/src/util.c
+index 72426e09..8f29bc5a 100644
+--- a/src/util.c
++++ b/src/util.c
+@@ -159,7 +159,7 @@ solv_setcloexec(int fd, int state)
+ 
+    see also: http://sources.redhat.com/ml/libc-alpha/2008-12/msg00003.html
+  */
+-#if (defined(__GLIBC__) || defined(__NEWLIB__)) && (defined(HAVE_QSORT_R) || defined(HAVE___QSORT_R))
++#if (defined(__linux__) || defined(__NEWLIB__)) && (defined(HAVE_QSORT_R) || defined(HAVE___QSORT_R))
+ 
+ void
+ solv_sort(void *base, size_t nmemb, size_t size, int (*compar)(const void *, const void *, void *), void *compard)
+-- 
+2.33.1
+
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.20.bb b/meta/recipes-extended/libsolv/libsolv_0.7.20.bb
index d4d6538965..9df5d709b2 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.20.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.20.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 DEPENDS = "expat zlib"
 
 SRC_URI = "git://github.com/openSUSE/libsolv.git \
+           file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
 "
 
 SRCREV = "f618e6aae1d44be633b2ab91d4fd4f4f974f4d40"
-- 
2.33.1


