Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.2476.1592679781692102184
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2020 12:03:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ngc1TdtO;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id cy7so3905587edb.5
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2020 12:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qv4N63R1MEluJlW4Hw4Gnk0ll0VGPSNOpQAmPUpZmpg=;
        b=Ngc1TdtO3cmjyTE7L/aSrjGxhYZa1Y3VFthVnfKwJirHz3iwNPstopoBoNOyAuS4MF
         /cLX5Ff2GwVwFqJ7gxWJxJvdYip5oXjxe3tZKN4MKKkdd3jbtqLlRBXm+nJnmA0vfOTy
         LidK5g48vedCbADwBZSJcWnxCkjyoucF8GXzMPeaSujRd3bXPsoXDGRhMEBblRGcvdBz
         Euy/mXzYKAnedsi8WTVDEbSOpKvaRtKcgVF2Vlg+i3a4eB/me/w5S7j2+BdRrTzm1WIz
         rKsmIIIiRxltiiE2LvftPrcP8DQ0NeQC7bfRxDWIEf+DVNyYg3/ChY6tONBHDIbJRULb
         2Kxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qv4N63R1MEluJlW4Hw4Gnk0ll0VGPSNOpQAmPUpZmpg=;
        b=ER6Qj104ivxYm5WIlcmMl5JAjL7qxvNSmdbwdJR6sqb7MlcH4eDwi+3RaUrbM2C7lK
         IO6ljpILz8bVwBR6wLVUxTCJ4xAUTY7GtKY6+VT9SzbAS+WaPE10TnuQFbfGPnrIWNT8
         NBikFop6D8UKPBB90a8DjlBW7YuiQS5Zmz918kJIFRdcuhDdaBBai4YFFrbUAKJvKE3R
         SLZGuuv9P9q+YkGC1OKxrY2+JQTiKtnsxjxLkEemY0ggV7e3eifZDMZYb5s22akKDM+f
         53F2htNU/G+jIOSsAPBRRPzx/pm94YJ+VxdQw3E+RSEa3wKJLv3zKVIuSrr+Kwo5tL3J
         Qq7A==
X-Gm-Message-State: AOAM533Va1Tuthv6SGyLSeuEiccEPE1FdrPUrXA87ipDmhpzKKG4kgxA
	lAUjuKZFqHfnpO2JCxm8++bskc+5Odmgww==
X-Google-Smtp-Source: ABdhPJxUQayCavDTJgHeOil6bBQ+chw8O12tCB2afVk2V0cP4PLUGRHRpXp8gP7W39XMuV5b3gJERQ==
X-Received: by 2002:a50:d753:: with SMTP id i19mr4742109edj.9.1592679779810;
        Sat, 20 Jun 2020 12:02:59 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f07a073c7ed84e0f8e2ef6e.dip0.t-ipconnect.de. [2003:f0:7f07:a073:c7ed:84e0:f8e2:ef6e])
        by smtp.gmail.com with ESMTPSA id cb6sm8103624edb.18.2020.06.20.12.02.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 12:02:59 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH V2] boost: Add upstream patch to fix build on depending projects
Date: Sat, 20 Jun 2020 21:02:51 +0200
Message-Id: <20200620190251.4060642-1-schnitzeltony@gmail.com>
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
index 0000000000..fb31823dd4
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
+Upstream-Status: Accepted [https://github.com/boostorg/geometry/commit/aafbceccc76dccb75963dd4f596fd1f10ee34b03]
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

