Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7332E6916D
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:07:54 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87655.1766434072580107668
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:07:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=keRXlx74;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-64b8e5d1611so4891788a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434071; x=1767038871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsy+i1vg+KtpTvTPSf+hXaKi0v+cyChmww64Ce4KmaY=;
        b=keRXlx74ieJEyYsbMTcEHa1r89w3Fiox/uIpO39wF0cMLrPYn2dvRAxhcLbimiA3lt
         NpbNDklXIs/pz0XmVUtxxBCNTkpH/CPjESClHVM+RVD+TlqUgGgXj+q5SROl6xonVaEG
         m7OA3v0/rHzrYo6VwiHrSGXLtlCIEEePl3Qf5R9nY24591qrSbQxXgco5yeZyOP9HMO3
         dFeJppLBCxwti6JyGDX898ppU3Yog/xzRLQgehsoJRfeeyiNz7P4+/3dYgxe4fqqr2kh
         lyzq3Kq+PZrYkz/tXcThtB6oAGIRbBICnAVu6MtnHH/K9LAP0+pcGeW9xHB+Vmtvzh4r
         yYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434071; x=1767038871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fsy+i1vg+KtpTvTPSf+hXaKi0v+cyChmww64Ce4KmaY=;
        b=XJeLCaXvh7numnOyHwk+MQEdXOZGuiIMFcVPvX65zZZci/HsNPy2W/D9rW+uv6HIcZ
         4Atl86Q+K60kC9V/EZWwYY60XXBBXV738DDhMzM0+OXjeGTKvCAE1FDc5yAvUl/RkD/f
         uGUAbmYxlFwFB+nEwPt0I4PZBRq/qJbGQsgpe8zwTwt2npjP8uK90ORppmIsYMUa97Du
         +wFih40K4yqd38gHLPdVuM1CvOO7j5KVi3WCyskJ3CcR7rdualscQXL5HT7+PUaTGVOf
         ZwS7sVX+jyjxw4CqWlLLOeWn3gyvoKZ+Si50dnuc+j7zsOaXnCDOFdZhxLOj3VGai3GY
         YThg==
X-Gm-Message-State: AOJu0YxebTeSG9TzDWMeP9njmejMt1Hzdu8bqRFFyUPksP0lStDYvroV
	GMXwYTmbhIIp2DijTuIN6D4J7N1P0eSiGDBIO2kPsKlAst4+HBNO8pSU8f7bvQ==
X-Gm-Gg: AY/fxX65jd3K3OJISPAiI/rmfwLYgToMItVYeN2k3zszkpUyDGqY3/POTZEWqqUwJEd
	DixIjEiDDixuWVbUr3O36unnWOkeeygoZgEQGLnE8x5VO//m89tDF1BT0d2dXHa6ZQK3BLk8Rx1
	gXPWNE7MKi0+QlIFku4sk/c+8wIoQdkGMWJsBHPHf2oadK1QKaRdHTkmbiLb9/mrWbwkXDr0hqw
	cDa9lMAu3aY/m6ojIMTjgcaGuS9bS146vOwFAcfQu+42fTKRnoqFMkL7drzgF1HgBIfYV3flC1v
	aGNPOm9albuTYSDvHcdZhBg0T1xLJXa2vQUGo+5dO/Sgvv3TRL6aqkYyepwy3naq+pEjlOw2Do9
	yvKMZR7TkpIPOuMATVUNZSpmtH2jlZr4Dz/CYRzoej04jEsyg25nH3BfZ7cJPF1KkoL5Je6Uwb3
	jLgw6iRN5m1HWcWGe9bUK6hM3NcNjdcwwe6ImFs39feUTVTbzPzQh/M8aNMQ==
X-Google-Smtp-Source: AGHT+IEd7cJ6B2WVeqPnhP8G1An0okqQfuCQCtUGiS5Uxs4O+MOUwxBkuYfpbW1Bpx3ykrJi/jauEQ==
X-Received: by 2002:a17:907:3f98:b0:b73:78f3:15b3 with SMTP id a640c23a62f3a-b80371f98f1mr1190570666b.47.1766434070686;
        Mon, 22 Dec 2025 12:07:50 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:07:50 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 008/114] boost: upgrade 1.89.0 -> 1.90.0
Date: Mon, 22 Dec 2025 21:05:50 +0100
Message-ID: <20251222200739.2278706-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:07:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228333

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../boost/{boost-1.89.0.inc => boost-1.90.0.inc}              | 2 +-
 ...st-build-native_1.89.0.bb => boost-build-native_1.90.0.bb} | 0
 ...Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch | 4 ++--
 .../boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch  | 4 ++--
 .../boost/boost/boost-math-disable-pch-for-gcc.patch          | 4 ++--
 .../boost/{boost_1.89.0.bb => boost_1.90.0.bb}                | 0
 6 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-support/boost/{boost-1.89.0.inc => boost-1.90.0.inc} (90%)
 rename meta/recipes-support/boost/{boost-build-native_1.89.0.bb => boost-build-native_1.90.0.bb} (100%)
 rename meta/recipes-support/boost/{boost_1.89.0.bb => boost_1.90.0.bb} (100%)

diff --git a/meta/recipes-support/boost/boost-1.89.0.inc b/meta/recipes-support/boost/boost-1.90.0.inc
similarity index 90%
rename from meta/recipes-support/boost/boost-1.89.0.inc
rename to meta/recipes-support/boost/boost-1.90.0.inc
index ea2827ec14..9b0ce592d9 100644
--- a/meta/recipes-support/boost/boost-1.89.0.inc
+++ b/meta/recipes-support/boost/boost-1.90.0.inc
@@ -12,7 +12,7 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "https://archives.boost.io/release/${PV}/source/${BOOST_P}.tar.bz2"
-SRC_URI[sha256sum] = "85a33fa22621b4f314f8e85e1a5e2a9363d22e4f4992925d4bb3bc631b5a0c7a"
+SRC_URI[sha256sum] = "49551aff3b22cbc5c5a9ed3dbc92f0e23ea50a0f7325b0d198b705e8ee3fc305"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "release/(?P<pver>.*)/source/"
diff --git a/meta/recipes-support/boost/boost-build-native_1.89.0.bb b/meta/recipes-support/boost/boost-build-native_1.90.0.bb
similarity index 100%
rename from meta/recipes-support/boost/boost-build-native_1.89.0.bb
rename to meta/recipes-support/boost/boost-build-native_1.90.0.bb
diff --git a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
index 25512d582b..4314f9e532 100644
--- a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
+++ b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
@@ -1,4 +1,4 @@
-From e2cc24d6d8b7b24a6d0a30c52c7ad69a001a0ad5 Mon Sep 17 00:00:00 2001
+From c2c2a53afc46775146c0960fc6c5f714530afa21 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 18 Dec 2018 15:42:57 +0100
 Subject: [PATCH] Don't set up arch/instruction-set flags, we do that
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 153 deletions(-)
 
 diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
-index b7825d4e6..ed7e39baf 100644
+index 2b6caed41..8325a3f65 100644
 --- a/tools/build/src/tools/gcc.jam
 +++ b/tools/build/src/tools/gcc.jam
 @@ -1143,156 +1143,3 @@ local rule cpu-flags ( toolset variable : architecture : instruction-set + :
diff --git a/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch b/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch
index d23cf03b1a..9a9e8cde62 100644
--- a/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch
+++ b/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch
@@ -1,4 +1,4 @@
-From b0728812241c048907e6f1ba168292cd9948347d Mon Sep 17 00:00:00 2001
+From bb73dd0d99a13e9c5aecbed34b166ff810a00dae Mon Sep 17 00:00:00 2001
 From: Anuj Mittal <anuj.mittal@intel.com>
 Date: Thu, 14 Nov 2019 10:13:53 +0800
 Subject: [PATCH] dont setup compiler flags -m32/-m64
@@ -13,7 +13,7 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
  1 file changed, 16 deletions(-)
 
 diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
-index ed7e39baf..90513f84a 100644
+index 8325a3f65..5a95046e7 100644
 --- a/tools/build/src/tools/gcc.jam
 +++ b/tools/build/src/tools/gcc.jam
 @@ -375,22 +375,6 @@ local rule compile-link-flags ( * )
diff --git a/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch b/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch
index ad90d96ddd..9dd5f63218 100644
--- a/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch
+++ b/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch
@@ -1,4 +1,4 @@
-From e7491f9874411fd9855957812ba9bac948a61356 Mon Sep 17 00:00:00 2001
+From 52f928686da5ef699dec7f7a296c5226d82180c1 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Fri, 23 Sep 2016 01:04:50 -0700
 Subject: [PATCH] boost-math: disable pch for gcc
@@ -14,7 +14,7 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libs/math/build/Jamfile.v2 b/libs/math/build/Jamfile.v2
-index 500c77363..504d7d8c6 100644
+index 80c99384d..38461c25f 100644
 --- a/libs/math/build/Jamfile.v2
 +++ b/libs/math/build/Jamfile.v2
 @@ -15,7 +15,7 @@ project
diff --git a/meta/recipes-support/boost/boost_1.89.0.bb b/meta/recipes-support/boost/boost_1.90.0.bb
similarity index 100%
rename from meta/recipes-support/boost/boost_1.89.0.bb
rename to meta/recipes-support/boost/boost_1.90.0.bb
-- 
2.47.3


