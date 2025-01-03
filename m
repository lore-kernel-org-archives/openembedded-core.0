Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE69E7719B
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 10:45:45 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.27856.1735901137499722724
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jan 2025 02:45:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GuzfPvOl;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso82660035e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 02:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735901136; x=1736505936; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWFNDLVMfDacxHB6aq1t9qYYfb75lTaU+ozAlk/ema8=;
        b=GuzfPvOlKdKv09Bek8sbjemcAEkg4n/iqb/gJkTO1bmZOLSN/1JvD0UHnBEvGzAoBF
         ovrqYWUR0xaxQaLNuMnN8h1q50EIIRhOA1BnT5tJPRiFVNiGBJqscQQn4HAy2D+gA1N1
         t80m/QGNyvAr9FxD3a5FXgXwNw0wtU/6zcNDUi4KdjaS0KrraZ6ZMi+UTBActFBMdq+s
         lChHSDghdgcKxeQaTOCGqETQw2DVYsS1TBoVo865ekSkLMKXNshK82x65WLqgogHmC5p
         +DNQoFMK+HvcpDQrchoVsYKTbrv+ljVqZu5C9/dEnPqfOrnWiTQvAP47rBkHd/wVf9/B
         Rp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735901136; x=1736505936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWFNDLVMfDacxHB6aq1t9qYYfb75lTaU+ozAlk/ema8=;
        b=QqiPBamNdtcrdHeEnoY7tE4UjS4t6STRoXAaDQTr9gWrODGSPyBB6mX03aLO2x/1qx
         zho+/RTG9shrEd5r+LGBpQVbfgKDidMHrgusJIATvoPBuZs+lcs5ynSoYCGGdSM2iwro
         kDOxv8pOkXVX1Dn/behAEzuFrRYuNN/Dx2mwuKBFBjHV7vzPpDcxW44DMjdVkae8kL7T
         QM48hVa3iKWC8NjsKp3IUFl+bW/Jt6WcsflxkNaIWlffTFnMYZStAyG2o8/KNZIYP5ne
         D4hwZawrE0fPxCIoH/xDC/OymqfVzRujUSETdjVGAs5kw+vMP7BpPmzcxHYZ6l9oFJXv
         xJqQ==
X-Gm-Message-State: AOJu0YyzgKl5POHYNi7C36VVOLNgAQWSpjkbsAxWtMVIcGnhWBWBK7bB
	+CPkhrDYLaBNo2tIzQOcEjYeXBQ+NxyPaPlwB584ZHBzbft34DV1VTzFyg==
X-Gm-Gg: ASbGncsfKpxcLmbe2khtPMLQ32F/D6M0Gu0z+ORe/+AguT50IDh3QccOd+Nix/McYQQ
	/SW2XS5qiMryzDeaXzd8ABi8iFa4VqZtSAGjjcuXL1KDfNgKdxxRWRa9bv36FdrSilV2s1LkqBi
	aRHghXuphy+nt+8Yb7o9Z+CFPEjA8BoTi6YP4oniHQsdG08sqFpLKQ5wJahkNPU0PAccVThOlL8
	WUWVnBotUmTh6e24VKcdoip70FnLn74sR+2rVOPH9H3cDNSwjlePesWcRXXgPuNzsKfe4YTgwqG
	YQxK7Q+vxPAqJgWtLg==
X-Google-Smtp-Source: AGHT+IHgqXD3v0LP5fYmmSlqFY/sqFPR9UnIqDeJbCPSoXY72VunQ1gvEigBS/mZppr265yZRqF5Yg==
X-Received: by 2002:a05:6000:4715:b0:385:e2c4:1f8d with SMTP id ffacd0b85a97d-38a221f0f40mr41672767f8f.19.1735901135523;
        Fri, 03 Jan 2025 02:45:35 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661289995sm476935865e9.36.2025.01.03.02.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 02:45:35 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/11] libdnf: backport a python 3.13.1 compatibility patch
Date: Fri,  3 Jan 2025 11:45:20 +0100
Message-Id: <20250103104524.4053846-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250103104524.4053846-1-alex.kanavin@gmail.com>
References: <20250103104524.4053846-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 10:45:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209338

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...n-iterator-of-a-ConfigParser-section.patch | 76 +++++++++++++++++++
 meta/recipes-devtools/libdnf/libdnf_0.73.4.bb |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-Fix-a-segfault-in-iterator-of-a-ConfigParser-section.patch

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Fix-a-segfault-in-iterator-of-a-ConfigParser-section.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Fix-a-segfault-in-iterator-of-a-ConfigParser-section.patch
new file mode 100644
index 00000000000..64334e08fda
--- /dev/null
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-Fix-a-segfault-in-iterator-of-a-ConfigParser-section.patch
@@ -0,0 +1,76 @@
+From 18e69ca69a6a401922275d1e18bbaf96b84ca795 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://github.com/rpm-software-management/libdnf/commit/f3302a865b230e021e9defbcea978ed1290a9b2f]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
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


