Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.1477.1592676024491062741
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2020 11:00:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Pyb5Zz6q;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id e12so10355177eds.2
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2020 11:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tkoS7eMAVq1fV9XSQYQHmX2vL4MRvOEPsxw8xxte27w=;
        b=Pyb5Zz6qcJGBg0XvsFaF8VLIAhr93miHEA4gjURhKJESGNqrZQoaJ06rVcsP0I/d+E
         G9ln0CP17PjQhSNf2vWEuFvP1OKS6cpK7SqdsA6pmgHzQt972wRvqk3HyDzwjYIXI/Cp
         sQ0X0Nh+zXhgWSfz1Cvd9LYwXiLdKRv78GLvQAXH0y/NKANTv7NGr/WVeH9j3vsviVeC
         kmmSDpMWqoeb71J9CWfNqZ/cBcbwv9uF3I9dKp9NDjnByid9J7UvxsfBDbvKxLQ15Ya6
         TLsud7mLIrrlGM8GTB/O1HsTf9l0FrQF5cSUjYdDb3QPYl0wSI9lMmS0/4o8UN1e3Hwb
         t42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tkoS7eMAVq1fV9XSQYQHmX2vL4MRvOEPsxw8xxte27w=;
        b=SGG1J+aErLmoJnMCnhEqbMYwiqEQiIshuaKGYZzEAjMFr2TA2diFzxg5rmzRu16pY3
         eSNsOSJDcFGkw5pWWhZe1vZdtCP8Iw81SolJls89uVL2lJwQZMtK2NcGkUEUeISzRUXX
         q3B+C2771IsWIdd6f5cKXBQ/mqTrj4sV52uIKnAcNikbGs9OaHJUIvjAumkGxuh1oBq0
         HWgt5VdDcOlswCADMTv5z5PjDv1BF+/QqAqZiAvyRYj/iWQh7IwuSLEfq5szg/htpEjj
         ypqbMjPB8EGcT/h2+Bz/gsuBgP6zAfm10SDIO2mj5YOyYev643vrIxrcIbrP8XQ7YMWC
         wqsg==
X-Gm-Message-State: AOAM532si6zIyCHxnDtvjsn8RqqfNzTiMIrNXDLgnOUOhNq2uX1hLDpu
	HI4ku3FtxNiOmm0Uwbo83U/UHT5Puyzk4A==
X-Google-Smtp-Source: ABdhPJyQK+RC4sRbAOtkd1tqzoomIOwM+ox7VIabMVVpzmJi0tA64dYJTlPUvFYMQEGVSyNsvDYUUA==
X-Received: by 2002:a50:b065:: with SMTP id i92mr9627824edd.112.1592676021853;
        Sat, 20 Jun 2020 11:00:21 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f07a073c7ed84e0f8e2ef6e.dip0.t-ipconnect.de. [2003:f0:7f07:a073:c7ed:84e0:f8e2:ef6e])
        by smtp.gmail.com with ESMTPSA id i21sm7901648edr.68.2020.06.20.11.00.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 11:00:21 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] boost: Add upstream patch to fix build on depending projects
Date: Sat, 20 Jun 2020 20:00:13 +0200
Message-Id: <20200620180013.4020192-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

KDE's krita failed with:
| error: 'typedef void boost::static_visitor<void>::result_type' is inaccessible within this context

Note that only boost 0.173 is affected. 0.172 (dunfell) does not have this
problem and the patch will be included in upcoming 0.174.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...l-rtree-visitors-insert-base-class-p.patch | 30 +++++++++++++++++++
 meta/recipes-support/boost/boost_1.73.0.bb    |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost/0001-Make-index-detail-rtree-visitors-insert-base-class-p.patch

diff --git a/meta/recipes-support/boost/boost/0001-Make-index-detail-rtree-visitors-insert-base-class-p.patch b/meta/recipes-support/boost/boost/0001-Make-index-detail-rtree-visitors-insert-base-class-p.patch
new file mode 100644
index 0000000000..80f9f6f9ca
--- /dev/null
+++ b/meta/recipes-support/boost/boost/0001-Make-index-detail-rtree-visitors-insert-base-class-p.patch
@@ -0,0 +1,30 @@
+From aafbceccc76dccb75963dd4f596fd1f10ee34b03 Mon Sep 17 00:00:00 2001
+From: Jonathan Wakely <boost@kayari.org>
+Date: Fri, 5 Jun 2020 19:29:27 +0100
+Subject: [PATCH] Make index::detail::rtree::visitors::insert base class public
+
+Fixes #721
+
+Upstream-Status: Applied[https://github.com/boostorg/geometry/commit/aafbceccc76dccb75963dd4f596fd1f10ee34b03]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ boost/geometry/index/detail/rtree/visitors/insert.hpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/boost/geometry/index/detail/rtree/visitors/insert.hpp b/boost/geometry/index/detail/rtree/visitors/insert.hpp
+index 2d324cb7f..5709a930c 100644
+--- a/boost/geometry/index/detail/rtree/visitors/insert.hpp
++++ b/boost/geometry/index/detail/rtree/visitors/insert.hpp
+@@ -265,7 +265,7 @@ struct insert_traverse_data
+ // Default insert visitor
+ template <typename Element, typename MembersHolder>
+ class insert
+-    : MembersHolder::visitor
++    : public MembersHolder::visitor
+ {
+ protected:
+     typedef typename MembersHolder::box_type box_type;
+-- 
+2.26.2
+
diff --git a/meta/recipes-support/boost/boost_1.73.0.bb b/meta/recipes-support/boost/boost_1.73.0.bb
index 5e9e0d87d7..995c14e8cc 100644
--- a/meta/recipes-support/boost/boost_1.73.0.bb
+++ b/meta/recipes-support/boost/boost_1.73.0.bb
@@ -7,4 +7,5 @@ SRC_URI += "file://arm-intrinsics.patch \
            file://0001-Apply-boost-1.62.0-no-forced-flags.patch.patch \
            file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
            file://0001-dont-setup-compiler-flags-m32-m64.patch \
+           file://0001-Make-index-detail-rtree-visitors-insert-base-class-p.patch \
            "
-- 
2.26.2

