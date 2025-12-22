Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38DBEE6ADC1
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:26 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87686.1766434104633730505
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EQp5q0Cd;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-640e9f5951aso8112179a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434103; x=1767038903; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3OmU51PHEoAzeuJAxGYzWuJ69POAc8lUb5KAvlqLl4=;
        b=EQp5q0CdmLjHKVNGbQpSSOAVjUrBI2LG0ItCmzV6gchRBhSnzN059lDpXunua6czlJ
         IJxIa7ZUVFeAlrRmCOzzfTLZOyajuHc21jkq26uOAVc1gkRGXCQ3O+ByBon3Aln/mxd9
         FVa7frOvvGX+1RnFeKs9s6NsQ317YyLtce+VdkZnt/rATHMJvaoBrB3KLGVx6UxW4lCs
         DmLDaMX4jbHaFwGzDPZ6SP9gHMNylmaqP8IP2zrh0CJ3cVVqcPUHQtjSpIhn6rzWthPz
         6Y5W5kNSvASiBSp8KC+Gwy2k3Zy9vzy+O1SyV5LKmnFd+rCu8KRUyUVewMRUU3V4fthM
         wI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434103; x=1767038903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g3OmU51PHEoAzeuJAxGYzWuJ69POAc8lUb5KAvlqLl4=;
        b=aHBEc5DJRQ261vF/ul858p2Kv9XwsogulH/D0s9/4POXghDDla9iEmJY4DqkCn4zcQ
         V4bFD70h4/lD6TeT4ZqJs6907TxYVqJqL1txYEGSyv/r/+Utd1YHz2/Ikuda3+t2YOHr
         D5kPJCLkszHcf53S/ORRZGN275eQbM6MGQixqVNVrcz8WyFoMLtKgYj/VZXIr4n+OHgF
         cWmcgyrOwUZywN8uIIYBzorDrlwYB8rtyZxMIjz8jKhJ9Vt4wz3eCK3zKko1Y6CojjQR
         zUDeLsNJSw33/1yzEEhr08Hr8P9e1v2tXBBeU5I0YUso5A3tUyj9gB9Gyh0fZJf7Lw32
         0k7g==
X-Gm-Message-State: AOJu0YwZCPF1q8ZfQoPlewcn7jUfWz9+qIZrtq6aR6wXMJSXcwl0VyFy
	MIin/K3PrVC1l7mpGkOJR0oaFwfEoWk63nKeqLQbAIwxYASSzwCCFwEwFTQrYg==
X-Gm-Gg: AY/fxX7E/wZveNAvhRk5mlwK8vEWmEaPhFDv6aTqpF8Fn5A8GpPI3vlCUsKjBzLftnv
	OPoGMsxkWllanSGPd9jPIqwjCo3IDpszx0qz9xiQ2mHyfDHkKjLw6gJ3FVJd0rrW25MYTLHgcua
	lbcHmclOh5UdzgXJ1nXhIhB/EQ3xIesnQvH/C52OnTKMVU8yibnrRl9omuAPcWjPZdqWiWgov6k
	nHmlH/EzNwVUVIJTyrmtrjywoZxepLEx9g7+Dd+orvwSAik3T/81xk2JuboEAPb6VwooVberu2c
	p6kNzJym1lRNNH8oJotfxr7sicZKjJpfMaMTJ5n7oRJ3mABbO73Z+dCnScqW7vJIWe4mz3KiWC2
	bN9GxaCiiXi6e8/SVlYK7Rv6IF4ThSQVRQD40QEoDlr8ATURNVVfmq0EyW68dCooO5B7uYUdDfP
	rYqNsfjb8IZiGNPRooX5SOpnrxoVsqsqs7aBrmnkBNIfSTQqQ=
X-Google-Smtp-Source: AGHT+IHnICAdG3/n6i78pnI3bej8Hi5vZKUDUpatdS8+mwzqmZBReLt3poXTAZXAfpjA6gUQApYeMg==
X-Received: by 2002:a17:907:7216:b0:b71:60a3:a8b9 with SMTP id a640c23a62f3a-b80358bd67emr1289386466b.29.1766434102716;
        Mon, 22 Dec 2025 12:08:22 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 053/114] python3-cffi: upgrade 1.17.1 -> 2.0.0
Date: Mon, 22 Dec 2025 21:06:35 +0100
Message-ID: <20251222200739.2278706-53-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228378

From: Alexander Kanavin <alex@linutronix.de>

License-Update: MIT -> MIT no attribution variant
Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ize_t-to-avoid-c-11-narrowing-warnin.patch | 34 -------------------
 ...3-cffi_1.17.1.bb => python3-cffi_2.0.0.bb} |  9 +++--
 2 files changed, 4 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-cffi/0001-Cast-offset-to-size_t-to-avoid-c-11-narrowing-warnin.patch
 rename meta/recipes-devtools/python/{python3-cffi_1.17.1.bb => python3-cffi_2.0.0.bb} (74%)

diff --git a/meta/recipes-devtools/python/python3-cffi/0001-Cast-offset-to-size_t-to-avoid-c-11-narrowing-warnin.patch b/meta/recipes-devtools/python/python3-cffi/0001-Cast-offset-to-size_t-to-avoid-c-11-narrowing-warnin.patch
deleted file mode 100644
index a919f4f6fb..0000000000
--- a/meta/recipes-devtools/python/python3-cffi/0001-Cast-offset-to-size_t-to-avoid-c-11-narrowing-warnin.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 2ac63f8765e62f1492ef3ee06791636700bc6cfb Mon Sep 17 00:00:00 2001
-From: triallax <triallax@tutanota.com>
-Date: Sat, 29 Jun 2024 15:25:24 +0100
-Subject: [PATCH] Cast offset to size_t to avoid c++11-narrowing warning (#92)
-
-e.g. with clang 18 on chimera linux:
-
-_CFFI_test_verify_anonymous_struct_with_star_typedef.cpp:583:10: error: non-constant-expression cannot be narrowed from type 'long' to 'size_t' (aka 'unsigned long') in initializer list [-Wc++11-narrowing]
-  583 |   { "a", ((char *)&((foo_t)4096)->a) - (char *)4096,
-      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-_CFFI_test_verify_anonymous_struct_with_star_typedef.cpp:583:10: note: insert an explicit cast to silence this issue
-  583 |   { "a", ((char *)&((foo_t)4096)->a) - (char *)4096,
-      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-      |          static_cast<size_t>(                      )
-
-Upstream-Status: Backport [https://github.com/python-cffi/cffi/pull/92]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/cffi/recompiler.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/cffi/recompiler.py b/src/cffi/recompiler.py
-index ac6c163e..14d578ee 100644
---- a/src/cffi/recompiler.py
-+++ b/src/cffi/recompiler.py
-@@ -953,7 +953,7 @@ class Recompiler:
-                 if cname is None or fbitsize >= 0:
-                     offset = '(size_t)-1'
-                 elif named_ptr is not None:
--                    offset = '((char *)&((%s)4096)->%s) - (char *)4096' % (
-+                    offset = '(size_t)(((char *)&((%s)4096)->%s) - (char *)4096)' % (
-                         named_ptr.name, fldname)
-                 else:
-                     offset = 'offsetof(%s, %s)' % (tp.get_c_name(''), fldname)
diff --git a/meta/recipes-devtools/python/python3-cffi_1.17.1.bb b/meta/recipes-devtools/python/python3-cffi_2.0.0.bb
similarity index 74%
rename from meta/recipes-devtools/python/python3-cffi_1.17.1.bb
rename to meta/recipes-devtools/python/python3-cffi_2.0.0.bb
index 5a3af03d9f..9bfc430dde 100644
--- a/meta/recipes-devtools/python/python3-cffi_1.17.1.bb
+++ b/meta/recipes-devtools/python/python3-cffi_2.0.0.bb
@@ -1,13 +1,12 @@
 SUMMARY = "Foreign Function Interface for Python calling C code"
 HOMEPAGE = "http://cffi.readthedocs.org/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
+LICENSE = "MIT-0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c0158ab9b75875f3bb7fea081d388818"
 DEPENDS += "libffi python3-pycparser"
 
-SRC_URI[sha256sum] = "1c39c6016c32bc48dd54561950ebd6836e1670f2ae46128f67cf49e789c52824"
+SRC_URI[sha256sum] = "44d1b5909021139fe36001ae048dbdde8214afa20200eda0f64c068cac5d5529"
 
-SRC_URI += "file://run-ptest \
-            file://0001-Cast-offset-to-size_t-to-avoid-c-11-narrowing-warnin.patch"
+SRC_URI += "file://run-ptest"
 
 inherit pypi python_setuptools_build_meta ptest pkgconfig
 
-- 
2.47.3


