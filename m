Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web08.12310.1604673383306051459
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2020 06:36:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=MFo2FYad;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id a18so1312285pfl.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2020 06:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version:in-reply-to:references
         :content-transfer-encoding;
        bh=XIZa50ZPJ+0bhFb/FoQ42AID3caQziy+UEchhV269Q0=;
        b=MFo2FYadxZlFKtGgNCKlQKvvxlIaB7sCs4vLleSINsc5att5spMATiXuOBJwHC0LoZ
         g3L5i7YwaB4S1rPB1G0WtPVQnbNlrsjT2B3KBP5WzYeNyWV+bOsPgwEDJKPpojkWLLYq
         Kl0MOTuvS535ebuY1/G7Cg9lIgNMYWdCr0ZpEk2jEznEQjB5e+GqZsnvRe+mrveS1O2M
         K3c93+6vDqayyoMfOzhCgVEzuKKF6SOSV2G2R+vtoe+9GTvSdMc6pj6JhFD6LVKsJe2E
         7tHa7af2XYIChd797Kg15DgTIJztPsRa9jwkFOeSx5Xra5HxKEWI9nYhMHxf8ts0Xm2a
         2DCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :in-reply-to:references:content-transfer-encoding;
        bh=XIZa50ZPJ+0bhFb/FoQ42AID3caQziy+UEchhV269Q0=;
        b=dsqJ0RLwtBIhajGGlmubEGbvOiNtK7eVQCpUGxSIouQAwH0PFpd6yCgzzZEYjRZtT5
         pMpyZm0VqpdFhD9V0yOIwwVCUpmO4nWIcB5yaWi7vsHUGV0YeBnpHuxGQmDyeHG9mGCH
         V6TX1b1YfuM0NIRTrRlXOfvEN18K5rQ0GHpCAqGe+mR/yI258NNZ9Pq2u4KKJ1scEq0f
         MNeDO6IB1wC/DdMxMYw34n87KLgwcb6aR+eHA+rsyzTOsxXpmyuDHWIV/WbrlmJFDE2t
         LNIGFFUfTcKjbKKDAtNvJXsHV8wpkna9I/EBrIEuv9vxxdu+TUTNwxCb8GKSzWmuoNzP
         NWqA==
X-Gm-Message-State: AOAM531W1jEfCLgIxLfD21vKrR7AwPm2SS4zstEAcyQAYGBXiJB6ALkc
	de9lXTvSCFoU8Cc0dnK6ZGO7eGaQ3Dacj6ri
X-Google-Smtp-Source: ABdhPJyI+CNSRi6MdxPn+1q4LBOClF+C5RFI2gQX6g6c8c7QP/tM2fYi8JtWrOYe5hHtEgNniF78FA==
X-Received: by 2002:a63:6386:: with SMTP id x128mr1943943pgb.148.1604673382358;
        Fri, 06 Nov 2020 06:36:22 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id jy19sm2765166pjb.9.2020.11.06.06.36.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 06:36:21 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/20] xcb-proto: backport fix for python gcd function
Date: Fri,  6 Nov 2020 04:35:16 -1000
Message-Id: <0f688c1419b1e2dfddff3c985f89a3f1949fc9fb.1604672839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <cover.1604672838.git.steve@sakoman.com>
References: <cover.1604672838.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Richard Leitner <richard.leitner@skidata.com>

This backports the fix [1] for the following build error for nativesdk on
Fedora 33 which is caused by the removal of fractions.gcd() in favor of
math.gcd() in python 3.9 [2]:

ImportError: cannot import name 'gcd' from 'fractions' (/usr/lib64/python3.9/fractions.py)

[1] https://gitlab.freedesktop.org/xorg/proto/xcbproto/-/commit/426ae35bee1fa0fdb8b5120b1dcd20cee6e34512
[2] https://bugs.python.org/issue39350

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...1-xcbgen-use-math-gcd-for-python-3-5.patch | 40 +++++++++++++++++++
 .../xorg-proto/xcb-proto_1.13.bb              |  3 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/xorg-proto/xcb-proto/0001-xcbgen-use-math-gcd-for-python-3-5.patch

diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto/0001-xcbgen-use-math-gcd-for-python-3-5.patch b/meta/recipes-graphics/xorg-proto/xcb-proto/0001-xcbgen-use-math-gcd-for-python-3-5.patch
new file mode 100644
index 0000000000..f9f4424da5
--- /dev/null
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto/0001-xcbgen-use-math-gcd-for-python-3-5.patch
@@ -0,0 +1,40 @@
+From 426ae35bee1fa0fdb8b5120b1dcd20cee6e34512 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bj=C3=B6rn=20Esser?= <besser82@fedoraproject.org>
+Date: Mon, 1 Jun 2020 12:24:16 +0200
+Subject: [PATCH] xcbgen: Use math.gcd() for Python >= 3.5.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+fractions.gcd() has been deprecated since Python 3.5, and
+was finally dropped in Python 3.9.  It is recommended to
+use math.gcd() instead.
+
+Signed-off-by: Björn Esser <besser82@fedoraproject.org>
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/proto/xcbproto/-/commit/426ae35bee1fa0fdb8b5120b1dcd20cee6e34512]
+Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
+---
+ xcbgen/align.py | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/xcbgen/align.py b/xcbgen/align.py
+index d4c12ee..5c4f517 100644
+--- a/xcbgen/align.py
++++ b/xcbgen/align.py
+@@ -2,7 +2,12 @@
+ This module contains helper classes for alignment arithmetic and checks
+ '''
+ 
+-from fractions import gcd
++from sys import version_info
++
++if version_info[:2] >= (3, 5):
++    from math import gcd
++else:
++    from fractions import gcd
+ 
+ class Alignment(object):
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.13.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.13.bb
index 7467090920..1f41821302 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.13.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.13.bb
@@ -11,7 +11,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7 \
                     file://src/dri2.xml;beginline=2;endline=28;md5=f8763b13ff432e8597e0d610cf598e65"
 
-SRC_URI = "http://xcb.freedesktop.org/dist/${BP}.tar.bz2"
+SRC_URI = "http://xcb.freedesktop.org/dist/${BP}.tar.bz2 \
+           file://0001-xcbgen-use-math-gcd-for-python-3-5.patch"
 SRC_URI[md5sum] = "abe9aa4886138150bbc04ae4f29b90e3"
 SRC_URI[sha256sum] = "7b98721e669be80284e9bbfeab02d2d0d54cd11172b72271e47a2fe875e2bde1"
 
-- 
2.17.1

