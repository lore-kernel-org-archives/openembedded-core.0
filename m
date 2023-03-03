Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C839EC7EE2D
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 18:19:48 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.190.1677867580041723209
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 10:19:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dGBO3G2S;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id me6-20020a17090b17c600b0023816b0c7ceso7043701pjb.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 10:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677867579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rRVo5TMVKPB8GTRs1uxJrsXhzcBDgiRFE8WCo6h8zWU=;
        b=dGBO3G2SmemF6FKz4WBHzBOTyno1gIyubllYtBsaAYekCsa1dfrolcwaXkge+RLoPL
         mcpGsDDEqyM7paytly8i0xXTRFlFAo7Q8dURE4g3ycqSfJ6/BAqTIXj98Rg0rok1y4dd
         f9Wwenxliutb20GzRYGJ5Ub8l7C6enZHvxEfEG+WUGbrpZLKVTtsPamKxRN7uAL7yyEw
         ltQjqcBHUz0GKssX+OWEClo0ee3CxU+EexBSGUVw7A/yG0D7FLCSVWZ8H55uaIUotKQw
         f8D2eWPKgn2Ed4UU7EsHgfwsZglkOoDte/geJvwMxDJtmOJyApyhgeCc5b5jIdSh9RGD
         H6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677867579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rRVo5TMVKPB8GTRs1uxJrsXhzcBDgiRFE8WCo6h8zWU=;
        b=2hPapNMOoroFZOPyBluYZcStN/k582UuWnWrQviM6rZOX1Id4iR5j3EAQzmQ9c6g8Y
         I72SLNo97XpK1lHl4A0hGS2Z+a1eP3iR5CIi4NnsbmVbS2nPd9MYIeFydaD+2xvlJgCP
         wWH+27cBa/T0cQwPIDCJOOBD6C48ZWc41oiKhmbWA4BzFiNJzmOpU0iZmTrDa4IXBO1U
         zqm6KscCBgZoJ8WWbK8Zuqn5j5TOCUYLMPERA3DRC8ioBFtpMe9fjO5S1Xq+inhD1HSy
         0PX0OKSm+GAEkgrKLFRrbRvtX7JMh9vVoWn4UI4puwbdKgCaT0Gt3H4M2j3JW25my+uJ
         VKEg==
X-Gm-Message-State: AO0yUKW5natmfGpbwvDxmEB5RSt8EXQtluk21+ZH7C1dg5MNlEL6Lpcl
	8+NRVmHroK1sac0YEd2JUFrKIdXUoGE=
X-Google-Smtp-Source: AK7set/ke/2aWnsvbCLKCkyvrhCNSNM4r8mcUBpTNspNIqSNi9GwQXQapOrmLNxU5RcHSjBMb3L7pA==
X-Received: by 2002:a17:902:e5ce:b0:19e:2ea9:2174 with SMTP id u14-20020a170902e5ce00b0019e2ea92174mr3809579plf.33.1677867578936;
        Fri, 03 Mar 2023 10:19:38 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::1ac4])
        by smtp.gmail.com with ESMTPSA id kz5-20020a170902f9c500b00196025a34b9sm1799968plb.159.2023.03.03.10.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 10:19:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] rpm: Fix hdr_hash function prototype
Date: Fri,  3 Mar 2023 10:19:36 -0800
Message-Id: <20230303181936.2629781-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 18:19:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178020

Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
index 61e395a9d0..be81c3eb08 100644
--- a/meta/recipes-devtools/rpm/rpm_4.18.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.18.0.bb
@@ -39,6 +39,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.18.x;protoc
            file://0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch \
            file://0001-configure.ac-add-linux-gnux32-variant-to-triplet-han.patch \
            file://fifofix.patch \
+           file://0001-python-Use-Py_hash_t-instead-of-long-in-hdr_hash.patch \
            "
 
 PE = "1"
-- 
2.39.2


