Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B1CE7718B
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 16:21:05 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.16407.1734970855438817936
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 08:20:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=OSbFCK9k;
 spf=pass (domain: baylibre.com, ip: 209.85.222.181, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7b6e8814842so359683485a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 08:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734970854; x=1735575654; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XRvo7qDkcpNYcIw2WxMDv4ta+nvyltPWRXpA/5pomeg=;
        b=OSbFCK9ky6bYlQTimwUC9zHGshp0fT/gYjwIU39QaFP97MX//GM+dSUPbUWKyZKqNN
         gCq5/AiSIYApr+ON9lK82OLvD/3/87LWkPSWSVXWo/gbibOliVhqjn7xrBx16PpMaeJ1
         7Parsnrh4QQ334nZ22f6MPaxQ0Z31fpBLckttIxj6BX93gAuLsL4FaTE+oW6fuoKLMeW
         wNt7ywcSJovhKIENdUVxtZypZtHsElmzfx7Ch1Ss7qeQlOFH+USBET+DK2VPce0mgwZo
         eF7JdFPTTKiRCTe0exWua17PjRmdqTmdNbGezo2ImtLnkzmaifiCqdTBkxjQCxfjgmRO
         6AEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734970854; x=1735575654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XRvo7qDkcpNYcIw2WxMDv4ta+nvyltPWRXpA/5pomeg=;
        b=G+UxbSdjJUrkMLBynsy2bRLHiL3ROuB2dWswv9s6cN4DdgwzEf/srY3YBjzk+FkwZD
         SWLPK3R6cRI7eTyU69aV/g5UGu8+iEFm1Ikwbivp2VaxKzrmkmYnqio8O9VPiKGHyRGh
         Q3O/VXHlhQ2pCyfqSrMfuXFCb741W4ziRjzKVY/4T1Z9S/nnhvewubIiGYuWBPUj55Rz
         M4LOZzOuvJBEp+FLyaTzqa/BXzNtw6u0d+ncFznBxDhGTejOLzp3pk0jrIN5m95H0TUF
         sLURt+iKejmDAQ4Q7ctuGC3whmVEOwgUOMuiPvEuqYRUQTftiWa3pkIgNw21LyHUCfKd
         PbUg==
X-Gm-Message-State: AOJu0Yw34ikQgTpM5nV9Wyw3NMK19aqhdyW+85SqcCcjNCtWyg2Un8hU
	UPXkqQRsvYO/+udPChzy+t/NO5xn/MFjnLPlEDwIluxnPV+rin96Ip0erDgMiJjoU0m3Mp0kAcd
	h
X-Gm-Gg: ASbGncsKB7fWKv6h2+95kvDFONpiok9f+T6eSQWAxLM+HAQySTqYRkG5PoYSfW4lvSh
	B65QJbdw5awe5jZbWtyZJUugH9KqxkhJjvtYSi2pOOJ2vPI5FnnMXLIzLfEihjmMBP8Kdelyle1
	GXdF6KaQGJzQ5Qczb46KiQATcA5g0Q2ljmHkp99Y6xux41MEeDFY8hdBftYTb+Bm9cutzVHJS0e
	SezluWNjAhBheL8rQtRexnZ2yrrc7/8U8z98imUZyFPtjJqSVyUtNE3OA1BQtGJR3xfUGDYGzWX
	nLxSwfWX19qVy1UX
X-Google-Smtp-Source: AGHT+IFZvfA8m6sbG80Tg8COrh5gDGxzdXH/nqJyACn377wZEq2HXXAyjhS4eC3l7gcMn7UZLfh3HQ==
X-Received: by 2002:a05:620a:1727:b0:7b6:edd0:d74d with SMTP id af79cd13be357-7b9ba7f720bmr2206217985a.48.1734970854279;
        Mon, 23 Dec 2024 08:20:54 -0800 (PST)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac4cbd5csm396127685a.108.2024.12.23.08.20.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 08:20:54 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] libdnf: backport patch to fix segfault
Date: Mon, 23 Dec 2024 11:20:51 -0500
Message-Id: <20241223162052.612087-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 16:21:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209043

This is needed to allow libdnf to build OK with python 3.13.1. Without
it, a vague "Could not invoke dnf" error is seen during rootfs (e.g.
when building core-image-full-cmdline), with a return code of -11.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...n-iterator-of-a-ConfigParser-section.patch | 84 +++++++++++++++++++
 meta/recipes-devtools/libdnf/libdnf_0.73.4.bb |  1 +
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-Fix-a-segfault-in-iterator-of-a-ConfigParser-section.patch

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Fix-a-segfault-in-iterator-of-a-ConfigParser-section.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Fix-a-segfault-in-iterator-of-a-ConfigParser-section.patch
new file mode 100644
index 00000000000..1c62d02455e
--- /dev/null
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-Fix-a-segfault-in-iterator-of-a-ConfigParser-section.patch
@@ -0,0 +1,84 @@
+From f3302a865b230e021e9defbcea978ed1290a9b2f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Miro=20Hron=C4=8Dok?= <miro@hroncok.cz>
+Date: Fri, 6 Dec 2024 18:01:16 +0100
+Subject: [PATCH] Fix a segfault in iterator of a ConfigParser section
+
+An iterator should return self on __iter__.
+
+So that this works:
+
+    >>> it1 = iter(sectObj)
+    >>> it2 = iter(it1)
+    >>> it1 is it2
+    True
+
+Previously, this iterator did not return self on __iter__, it was like this:
+
+    class PreserveOrderMapStringStringIterator(object):
+        ...
+        def __iter__(self):
+            return _common_types.PreserveOrderMapStringStringIterator___iter__(self)
+
+And that returned a new Python object.
+
+This fixes https://bugzilla.redhat.com/2330562 by avoiding a second iterator object.
+
+My SWIG skills are close to zero,
+perhaps this is not the best way to return self, but it seems to work.
+
+Upstream-Status: Backport
+(https://github.com/rpm-software-management/libdnf/commit/f3302a865b)
+
+Backport so that it works properly with Python 3.13.1.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+
+---
+ bindings/swig/common_types.i | 11 +++++++----
+ bindings/swig/conf.i         |  4 ----
+ 2 files changed, 7 insertions(+), 8 deletions(-)
+
+diff --git a/bindings/swig/common_types.i b/bindings/swig/common_types.i
+index c9ae798a..a1f90d9e 100644
+--- a/bindings/swig/common_types.i
++++ b/bindings/swig/common_types.i
+@@ -63,10 +63,6 @@ template<class T>
+ class Iterator {
+ public:
+     Iterator(typename T::iterator _cur, typename T::iterator _end) : cur(_cur), end(_end) {}
+-    Iterator* __iter__()
+-    {
+-      return this;
+-    }
+ 
+     typename T::iterator cur;
+     typename T::iterator end;
+@@ -165,3 +161,10 @@ EXTEND_TEMPLATE_PreserveOrderMapIterator(std::string, std::string)
+ EXTEND_TEMPLATE_PreserveOrderMapIterator(std::string, libdnf::PreserveOrderMap<std::string, std::string>)
+ 
+ %exception;  // beware this resets all exception handlers if you import this file after defining any
++
++%pythoncode %{
++def PreserveOrderMapStringStringIterator___iter__(self):
++    return self
++PreserveOrderMapStringStringIterator.__iter__ = PreserveOrderMapStringStringIterator___iter__
++del PreserveOrderMapStringStringIterator___iter__
++%}
+diff --git a/bindings/swig/conf.i b/bindings/swig/conf.i
+index b6a0ce88..2f77003f 100644
+--- a/bindings/swig/conf.i
++++ b/bindings/swig/conf.i
+@@ -71,10 +71,6 @@ template<class T>
+ class Iterator {
+ public:
+     Iterator(typename T::iterator _cur, typename T::iterator _end) : cur(_cur), end(_end) {}
+-    Iterator* __iter__()
+-    {
+-        return this;
+-    }
+ 
+     typename T::iterator cur;
+     typename T::iterator end;
+-- 
+2.39.5
+
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb b/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb
index 0817da7ca69..5b9e734e82d 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb
@@ -11,6 +11,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;p
            file://enable_test_data_dir_set.patch \
            file://0001-drop-FindPythonInstDir.cmake.patch \
            file://armarch.patch \
+           file://0001-Fix-a-segfault-in-iterator-of-a-ConfigParser-section.patch \
            "
 
 SRCREV = "79ed383cd5a822e6d8d9d549835383f5c5106204"
-- 
2.39.5


