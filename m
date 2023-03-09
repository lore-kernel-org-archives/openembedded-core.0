Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EECFC6FD1C
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 22:58:55 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.5701.1678402730973247224
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 14:58:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=nMDXdEn1;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id n5so2520194pfv.11
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 14:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678402730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vLEV+om+J/OBXe1CzMpSmax+Hc4+IoFXRSGQVNo4ghk=;
        b=nMDXdEn1LIL/xzpjPLHBGj9Uodq1UfaQ67CTsF1EwLedFsD/kBmavw/fDOInAr3qUp
         dOLdLVwmm08+RUmISPjwsbOa8xckknuA7Q8Bnz5fIUKt310Uug/aWY7fvCX7XtaMGNkk
         gzIXLhg/6ds5sJRTx2GeflbTo2ePoZyZUCuC+xbKs4xbPXmgDozIBwJTfEc5HJ8P5rda
         uhXufRR4RdJ6AvagX/GWbBI9CzmteRlJ77J5vqabcRwQHfMqizte1URv816TI5zUi8UM
         Hk3HOuGt8+cggwsxfFUHd+MD8S51FP6xAxNKylLQueMD0/mBAd72S5kfV47sGPnPGYPY
         /boQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678402730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vLEV+om+J/OBXe1CzMpSmax+Hc4+IoFXRSGQVNo4ghk=;
        b=SFwOO+vSr6oIGWjBMj518rsyi3kuKN+nyCaTvUO2Iq3rB2ru5y/L09LGxNJ4WLQl+M
         l17DNJRIAMZ73+9S9SMLQY5Yf+UFezhahTdYXwa5XvlVCQtgTxCgm3e5Yon77RJ9z308
         7CcWXA9+w+7XYHBuGWQzSmD0n7T8zN6KYFecWSVGGEzyQeLq7uSyz+oVqDCYLccC0Eoh
         OS36la/yxkRDYHfP8BWlDm8ceYbiew7GT6/YkcHLn0SnkazaQFtuSmEO7IXE9/T+2ejo
         UNzT56KoGDf6967BxXqt41msHQHxUCWg+iDjC1FsIvLOK+zQmcKwhp0YA4yn6F2jfxwx
         7ylw==
X-Gm-Message-State: AO0yUKXHAeikgAPNkTDG9R9WyW9jzEHQwwoFbxvMlYqK3knYPDO3tjT7
	ABFtOSvXEY04ilMf/OxZB6hQo5TlVWXB2hUV3oc=
X-Google-Smtp-Source: AK7set+Z3B3H1zGxqSKCDxSyHGQb3ytsVRdoBnpNTP8QwGySguFSbutdGH+htzxMFLl/pxonNj+/lw==
X-Received: by 2002:a62:528e:0:b0:5aa:2cf8:97dd with SMTP id g136-20020a62528e000000b005aa2cf897ddmr16790362pfb.22.1678402729925;
        Thu, 09 Mar 2023 14:58:49 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id j9-20020aa79289000000b0058db8f8bce8sm89717pfa.166.2023.03.09.14.58.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 14:58:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 21/27] rpm: Fix hdr_hash function prototype
Date: Thu,  9 Mar 2023 12:57:56 -1000
Message-Id: <4b71eb73c9c5d198ce2c52c37d0ff7a945221ff1.1678401759.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678401759.git.steve@sakoman.com>
References: <cover.1678401759.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 22:58:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178294

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 0e812b4c22ac077f2defd6842f82b5c993db24c2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...y_hash_t-instead-of-long-in-hdr_hash.patch | 35 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.18.0.bb       |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-python-Use-Py_hash_t-instead-of-long-in-hdr_hash.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-python-Use-Py_hash_t-instead-of-long-in-hdr_hash.patch b/meta/recipes-devtools/rpm/files/0001-python-Use-Py_hash_t-instead-of-long-in-hdr_hash.patch
new file mode 100644
index 0000000000..d0e637191a
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-python-Use-Py_hash_t-instead-of-long-in-hdr_hash.patch
@@ -0,0 +1,35 @@
+From 6ef189c45b763aedac5ef57ed6a5fc125fa95b41 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 3 Mar 2023 09:54:48 -0800
+Subject: [PATCH] python: Use Py_hash_t instead of long in hdr_hash
+
+Fixes
+python/header-py.c:744:2: error: incompatible function pointer types initializing 'hashfunc' (aka 'int (*)(struct _object *)') with an expression of type 'long (PyObject *)' (aka 'long (struct _object *)') [-Wincompatible-function-pointer-types]
+|         hdr_hash,                       /* tp_hash */
+|         ^~~~~~~~
+
+Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/2409]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ python/header-py.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/python/header-py.c b/python/header-py.c
+index 0aed0c9267..c15503f359 100644
+--- a/python/header-py.c
++++ b/python/header-py.c
+@@ -316,9 +316,9 @@ static PyObject * hdr_dsOfHeader(PyObject * s)
+                                  "(Oi)", s, RPMTAG_NEVR);
+ }
+ 
+-static long hdr_hash(PyObject * h)
++static Py_hash_t hdr_hash(PyObject * h)
+ {
+-    return (long) h;
++    return (Py_hash_t) h;
+ }
+ 
+ static PyObject * hdr_reduce(hdrObject *s)
+-- 
+2.39.2
+
diff --git a/meta/recipes-devtools/rpm/rpm_4.18.0.bb b/meta/recipes-devtools/rpm/rpm_4.18.0.bb
index 5f3986d8a3..db83a8c099 100644
--- a/meta/recipes-devtools/rpm/rpm_4.18.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.18.0.bb
@@ -40,6 +40,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.18.x;protoc
            file://0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch \
            file://0001-configure.ac-add-linux-gnux32-variant-to-triplet-han.patch \
            file://fifofix.patch \
+           file://0001-python-Use-Py_hash_t-instead-of-long-in-hdr_hash.patch \
            "
 
 PE = "1"
-- 
2.34.1


