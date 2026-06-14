Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E52BCD98DE
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:04:11 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.105052.1781424244894540400
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RxhDwnss;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so15063645e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424243; x=1782029043; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+wh9S6pw3hLpKTOSt2d60QG4KWezMxs6u6CVi/lDAR8=;
        b=RxhDwnss6EB6D+kgLBCOJR6Srti2b0zQCINJG1V4UER0acLwv1NDb+SApiUkVh7j9l
         oG2dQw7v5uEdMaU4+N4fy0kepCRKGOrlST7pUcRKToGz0FP6LC0Hk4E+EPO0m2Tu39tV
         F9YYVrviIid425uOiI5mliENwSQ8r2Ht98ebQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424243; x=1782029043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+wh9S6pw3hLpKTOSt2d60QG4KWezMxs6u6CVi/lDAR8=;
        b=LCxT8gS0KY0ZhTiIeaGg/ImfhfKsRS8srzg8tuDCamNvPBq618Za+YiAdy5Avyd5VH
         QkB6n5SCTG9XGk8wf/toazZvnixJKTyjMUTLDSOBpwVbADU25C1/siQQGvuA0tsCOXfl
         paycYnbu34jIvmBytdzvSKvOYxzvrqzBN1T7+vLFaSXZu+p89wrdpTc72WZsVryG+954
         dwc9aLkUpb1Lu8mDfOT81oGef4A6jmW2QoB/GdciPWAFikU+dnD+bMMnbWiCkDvHu2iO
         sRBnzWxTPUFkEg3JmYHz1kT8JXtn8kx4e8w0PGGMrTDpIYezW/PGPp8tsa/el0s7cS8e
         zGyQ==
X-Gm-Message-State: AOJu0YzxuPZYRUJ5QDlOgIiOSq1dfBUWzOzW0objnIo6fQjQxGAY/2lY
	2Ar33cUWoBAbxw7jJDOZs306o2KH7gl7Lf7qW+waj0CV0cq94rd6QY5Q7A+czo8aRJgvdQULgQ9
	jQnlN
X-Gm-Gg: Acq92OEEhgBC95w7UEoq0YCuNkJ6TMVUkN8uiq2SMel+9lTU5oqSYssGVIWNGoY6rkg
	8PEB2UHrlUPYCSk9KMfPF81i1ifmvhfv0tUFuG8jnmNvKIcspx8yJaDMLOrYjwU1btBusB0E7um
	F2AslHF0ndJL68JdfVx5ut4DJq595HIOr9rosK2gewvT+IgQBn8GgOnkSjPZCGfFu5SSsiU/eG6
	Roid1GqugnC/cxXKi0hWnbZ9PiZLEmtVXaTLy+FSlNDd0w5Wlw7QVZAf64vncT+w3DT2WUhtOv+
	vNpfeEXjzE5pU6y9Wjs60FmRIiOtWMQfgfDx9WBGLBXa3JkiR0GivjWkXCnpr+Wa4MGdDz9aQcY
	40H5hsRPKoloYhB14WboVOdQM0eee08h3jxhXAte9tolTYWFjk5A8kErTsT4Af5FbpSYLDeFZO+
	ljpz8EDbApIRkoURQqctviNfubtDc37Wtd/ZF3F7I5B4iTJ8NB9kMd
X-Received: by 2002:a7b:cbd3:0:b0:492:834:24a2 with SMTP id 5b1f17b1804b1-49220095624mr43156975e9.16.1781424243149;
        Sun, 14 Jun 2026 01:04:03 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.04.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:04:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 34/56] python3-numpy: upgrade 2.4.5 -> 2.4.6
Date: Sun, 14 Jun 2026 09:02:45 +0100
Message-ID: <20260614080307.4017177-34-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:04:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238718

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...1-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch | 2 +-
 .../python/python3-numpy/0001-python-sysroot.patch              | 2 +-
 .../python/python3-numpy/fix_reproducibility.patch              | 2 +-
 .../python/{python3-numpy_2.4.5.bb => python3-numpy_2.4.6.bb}   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.4.5.bb => python3-numpy_2.4.6.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
index 4015e05aced..ba999976534 100644
--- a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
+++ b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
@@ -1,4 +1,4 @@
-From e1feb7f7052980d8df2635ecc30a30b70ba73a44 Mon Sep 17 00:00:00 2001
+From e6a9ec520a5924af57ad5d117bc45cf6d8bcdb9a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 10 Dec 2015 13:20:30 +0200
 Subject: [PATCH] Don't search /usr and so on for libraries by default to
diff --git a/meta/recipes-devtools/python/python3-numpy/0001-python-sysroot.patch b/meta/recipes-devtools/python/python3-numpy/0001-python-sysroot.patch
index 7575e011f57..681876fa521 100644
--- a/meta/recipes-devtools/python/python3-numpy/0001-python-sysroot.patch
+++ b/meta/recipes-devtools/python/python3-numpy/0001-python-sysroot.patch
@@ -1,4 +1,4 @@
-From a4609765d97bc25cdd6d9ee06c7026a2ca3481e3 Mon Sep 17 00:00:00 2001
+From ced528318cddfef6c5e676c2815e64b5caa45c64 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Wed, 21 Jan 2026 14:12:36 +0000
 Subject: [PATCH] Add sysroot to pkgconfig libdir
diff --git a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
index e9ac56c59c7..ca5dde1f32e 100644
--- a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
+++ b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
@@ -1,4 +1,4 @@
-From b9ab979957e1ba14ce42b696c476a5910a07f1aa Mon Sep 17 00:00:00 2001
+From b8bae174cfca4541a7288edcfdbc340d54f2673a Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 29 Sep 2023 22:53:24 +0100
 Subject: [PATCH] This regex decides whether to use O3 opimisation on numpy or
diff --git a/meta/recipes-devtools/python/python3-numpy_2.4.5.bb b/meta/recipes-devtools/python/python3-numpy_2.4.6.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-numpy_2.4.5.bb
rename to meta/recipes-devtools/python/python3-numpy_2.4.6.bb
index 56446eb6663..2c892e97567 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.4.5.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.4.6.bb
@@ -13,7 +13,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://run-ptest \
            file://0001-python-sysroot.patch \
            "
-SRC_URI[sha256sum] = "ca670567a5683b7c1670ec03e0ddd5862e10934e92a70751d68d7b7b74ca7f9f"
+SRC_URI[sha256sum] = "f3a3570c4a2a16746ac2c31a7c7c7b0c186b95ce902e33db6f28094ed7387dda"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"

