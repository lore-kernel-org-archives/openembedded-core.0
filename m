Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7203AC4332F
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 17:10:27 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.8404.1635527427114167420
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Oct 2021 10:10:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lpXAYY2I;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id f8so7229395plo.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Oct 2021 10:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M1qMUA0RnaBK/F0eWVnjN6Dg44kmeLBHFNABM2rOxs8=;
        b=lpXAYY2Ik0AW8qBmo2cSJZKYxNwBA59MrNcEezn9mkCPT9jPTW1iAm0MVfhznU3K/o
         6NY9NGZp8tBq15Ava0fwu69V5KsybO1NMQ0cj1VB0DXX11Ogd4EEZ8iSFXlp/TJd6ClB
         16A6g79+hnGgkqfTyKr4Hy39WJEv8KZs0W2LCw9lC5zx5ZKug2DMGX4J/hGUcboytwnm
         s5i9LiwLUix7jySFFPG9vUororFH5m/ZXGQ7kw8BL151pAF8oeOgdFc7hGmdRqkrUnjv
         Z6E8Zwk0T92E9ntB1PZmffRw6irXGhc0IBC26q0dPlpR16puPHkaVxHfeMrFDKQmw3+g
         SLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M1qMUA0RnaBK/F0eWVnjN6Dg44kmeLBHFNABM2rOxs8=;
        b=WhhO7KG1TDDp/P4OWpo4oGJVzjlWgP81Ovop9b21gJ0hG08/EXfTyiXsSg5Rz52FoN
         SHns1rd5jufsl8MEP2o7TOJqWWoWdk5jH229LBQVUbTzkLqy4n/JNvj8Ekw3TjPjJpaL
         yzYtIXLkmCnNYFhxH/vlAJuhJfH20WyzHpmd0XabmXD38P/pajSdVXdNLAIpyVyn9X48
         rTrNBu7diDSiLq73dX1SQNiaNh4RprA5roTg0Q1tu9q7fy2npKK0PStKu17Uq3D5PVYg
         VljG7w38p4DPVkmmtpOeVNQEeMgwbj4sY85qLXYAVQfFki08X9C1Vy2viceMiOTCSdxD
         HU+g==
X-Gm-Message-State: AOAM532Fzfct3VyXwLn22SJqwgTQsnS0pNrPHVT/0GjgTsG64/lRZvi9
	NEqtndVVEMb2j3bTxNkDuBxd5GoOwzc=
X-Google-Smtp-Source: 
 ABdhPJzuyeboBfu4OA+ujDsPEqkDhhKrWikPuCqbFv2VBZDMNpLSFYsCzlUaNBQ0cA5Bb+JKEWZtCQ==
X-Received: by 2002:a17:90b:1c8e:: with SMTP id
 oo14mr21239468pjb.224.1635527426392;
        Fri, 29 Oct 2021 10:10:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id
 z7sm5887805pgo.11.2021.10.29.10.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 10:10:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 3/3] libsolv: Enable correct qsort_r on musl
Date: Fri, 29 Oct 2021 10:10:22 -0700
Message-Id: <20211029171022.1279107-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211029171022.1279107-1-raj.khem@gmail.com>
References: <20211029171022.1279107-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Oct 2021 17:10:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157633

Newer musl now has this function implemented and signatures are same as
glibc, current codepaths forces it on BSD path which is wrong for musl
and results in random segfaults in apps using libsolv e.g. opkg

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebased on master-next

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
index 6861def533..21017c3902 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.20.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.20.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 DEPENDS = "expat zlib"
 
 SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master \
+           file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
 "
 
 SRCREV = "f618e6aae1d44be633b2ab91d4fd4f4f974f4d40"
-- 
2.33.1


