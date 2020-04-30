Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.3986.1588240722977614477
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 02:58:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ksiJ1Kxu;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id i10so6080638wrv.10
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 02:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cPHeNxSeGru8rvRLwH5DWcw3qPf1D4gbfWrvRq06NPM=;
        b=ksiJ1KxuwxlhAjI9nRnLHLuKDk2XlSJgEzEx/Cdfn1mNB2OM9NnGtiIXEiLeL4z87y
         Ddg3NTKUStvJeVnNV0JllXO4QckcIaBHuAOQQhNU4XkSSJ5Q1NYaedqwOyFsa9fVUql7
         i1Tz6BLpe+sZuhpZAIVvPyIOJwmtMT22YtSbOpNNssxLNjsGJHsm6O/RVWvlTrWww/Ab
         YuosDKi5y+y9dhIBgWDa5il90jad95a8T5XuqqQJYKzslNqEkSVUFbmR+7gQVlJpoTZw
         yuYDtMIV0uRLd6Za/bnshgJrW0nfgh3TtkgmnaNYEjLq3YPc61MccDdAfKYit6j/FpxF
         xXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cPHeNxSeGru8rvRLwH5DWcw3qPf1D4gbfWrvRq06NPM=;
        b=rvvHoY9Q2nh4qUIWLg1IfZ9KPuNnaQQJ97yjYzJCfOVh/cnqUl7xLk/01/PkMjQJH9
         vt0elxKpaxIs3yPCchU3sTcKVPYK6dnO97Qj3Ob9w1WFwDtctxgzCTLxtmRn0MkI09LD
         eDyGAYYOPc0ALmvW+j83uEDK1zj1mZqFz7mFo8tFuNqFcexZ3H/M8NZr4cHqQVekVKOL
         B+6NKvaAHnHr83bLy5AvNMeRIR1uHWPgm26mJRE7rVIJ0hAgpjNFkrozp4qX5IJAQClH
         PaoP4uPTsAvNWzDs5m3tOwrZt16H1XEDYUzcJXzpUUlK1c+34b6MrqpxT5DBu9dFALN5
         sSTg==
X-Gm-Message-State: AGi0PuZhy3evSVjQnsX0tZAORxrA2fNspaN+Uxdnf69k1C8gsocYmbpS
	zERfm+Lea/nDSJaVUs/2w7XjhBuz
X-Google-Smtp-Source: APiQypL8MfrDI0noJagKyGvM3SyWe0l1vrldpjbQl0Tv4yArShsil7HPKS5YzDuhCrsdf4f/IUA7iQ==
X-Received: by 2002:adf:fd46:: with SMTP id h6mr3307676wrs.90.1588240721220;
        Thu, 30 Apr 2020 02:58:41 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id b82sm12380682wmh.1.2020.04.30.02.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 02:58:40 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 13/17] libevdev: update to 1.9.0
Date: Thu, 30 Apr 2020 11:58:11 +0200
Message-Id: <20200430095815.2824-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200430095815.2824-1-alex.kanavin@gmail.com>
References: <20200430095815.2824-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libevdev/libevdev/determinism.patch       | 53 +++++++++++--------
 .../{libevdev_1.8.0.bb => libevdev_1.9.0.bb}  |  4 +-
 2 files changed, 33 insertions(+), 24 deletions(-)
 rename meta/recipes-support/libevdev/{libevdev_1.8.0.bb => libevdev_1.9.0.bb} (78%)

diff --git a/meta/recipes-support/libevdev/libevdev/determinism.patch b/meta/recipes-support/libevdev/libevdev/determinism.patch
index 33a6076b78..f6b7fc82d3 100644
--- a/meta/recipes-support/libevdev/libevdev/determinism.patch
+++ b/meta/recipes-support/libevdev/libevdev/determinism.patch
@@ -1,3 +1,8 @@
+From 4f196323aba5b0f49979826533c65633b8a9b6a2 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Fri, 7 Feb 2020 12:29:56 +0000
+Subject: [PATCH] libevdev: Fix determinism issue
+
 The order of dict values is not deterministic leading to differing header file generation.
 Sort to remove this inconsistency.
 
@@ -6,29 +11,33 @@ RP 2020/2/7
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 Upstream-Status: Pending
 
-Index: a/libevdev/make-event-names.py
-===================================================================
+---
+ libevdev/make-event-names.py | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/libevdev/make-event-names.py b/libevdev/make-event-names.py
+index 88addd7..c973e2a 100755
 --- a/libevdev/make-event-names.py
 +++ b/libevdev/make-event-names.py
-@@ -67,10 +67,10 @@ def print_bits(bits, prefix):
- 	if  not hasattr(bits, prefix):
- 		return
- 	print("static const char * const %s_map[%s_MAX + 1] = {" % (prefix, prefix.upper()))
--	for val, name in list(getattr(bits, prefix).items()):
-+	for val, name in sorted(list(getattr(bits, prefix).items())):
- 		print("	[%s] = \"%s\"," % (name, name))
- 	if prefix == "key":
--		for val, name in list(getattr(bits, "btn").items()):
-+		for val, name in sorted(list(getattr(bits, "btn").items())):
- 			print("	[%s] = \"%s\"," % (name, name))
- 	print("};")
- 	print("")
-@@ -111,7 +111,7 @@ def print_lookup(bits, prefix):
- 	if not hasattr(bits, prefix):
- 		return
+@@ -70,10 +70,10 @@ def print_bits(bits, prefix):
+     if not hasattr(bits, prefix):
+         return
+     print("static const char * const %s_map[%s_MAX + 1] = {" % (prefix, prefix.upper()))
+-    for val, name in list(getattr(bits, prefix).items()):
++    for val, name in sorted(list(getattr(bits, prefix).items())):
+         print("    [%s] = \"%s\"," % (name, name))
+     if prefix == "key":
+-        for val, name in list(getattr(bits, "btn").items()):
++        for val, name in sorted(list(getattr(bits, "btn").items())):
+             print("    [%s] = \"%s\"," % (name, name))
+     print("};")
+     print("")
+@@ -118,7 +118,7 @@ def print_lookup(bits, prefix):
+     if not hasattr(bits, prefix):
+         return
  
--	names = list(getattr(bits, prefix).items())
-+	names = sorted(list(getattr(bits, prefix).items()))
- 	if prefix == "btn":
- 		names = names + btn_additional;
+-    names = list(getattr(bits, prefix).items())
++    names = sorted(list(getattr(bits, prefix).items()))
+     if prefix == "btn":
+         names = names + btn_additional
  
diff --git a/meta/recipes-support/libevdev/libevdev_1.8.0.bb b/meta/recipes-support/libevdev/libevdev_1.9.0.bb
similarity index 78%
rename from meta/recipes-support/libevdev/libevdev_1.8.0.bb
rename to meta/recipes-support/libevdev/libevdev_1.9.0.bb
index 3523dc0968..a2116a492f 100644
--- a/meta/recipes-support/libevdev/libevdev_1.8.0.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.9.0.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=75aae0d38feea6fda97ca381cb9132eb \
 
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz \
            file://determinism.patch"
-SRC_URI[md5sum] = "879631080be18526737e33b63d848039"
-SRC_URI[sha256sum] = "20d3cae4efd277f485abdf8f2a7c46588e539998b5a08c2c4d368218379d4211"
+SRC_URI[md5sum] = "13c3f0911f9326d4b9fa103365f84421"
+SRC_URI[sha256sum] = "e7e18a64264f2dea19b6c50a481f8c062529d42919ccda0bc861495bce28eb9e"
 
 inherit autotools pkgconfig
 
-- 
2.26.1

