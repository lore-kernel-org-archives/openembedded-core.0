Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75685C02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 22:09:42 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.689.1738706975127308486
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 14:09:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UtLS3Exs;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2161eb95317so108886005ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 14:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738706974; x=1739311774; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c5CXBp3KXtJLRei/sNe0NtkyV//ulcOKnNl7GyTnD/Q=;
        b=UtLS3ExsexYQGrmx6e2qjcqzhI5fQZSNZqRTXdwUX+3fDpdLThhxaSKpIxQewRGvlk
         DVGiSypSVIZRjyHeEwuvCZrpfdO43O+hQUuCtl7xiKZA1NWjHIjJXnXdGWV1qIXrBIuk
         sXY4VAZwiwxAb1TdyZsGMbVdAFFm5r91XoJoEa14OMepNtQRERdeAFz+fvWPrH+bRMH9
         r3reFSLasPUziRbsW4AIIVdtkg9B89SzWbIHCILwyqTU8enGtWXxG7q7qcEzGJfv3hBU
         w2wxxr7+0u8sq6lOaWW7R0Qx1Nz8fXM9Dg2x2kAoT0A3NRbRnhC92wrKh2zYaQ5W0iqA
         u4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738706974; x=1739311774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c5CXBp3KXtJLRei/sNe0NtkyV//ulcOKnNl7GyTnD/Q=;
        b=PvJAdg5g3FrCeV9M/5nKefJ40uAAx4hnA5n2Gp2ohh7pRg8vAp7bMLryGKtA9sqRkt
         2vFWkH6qNF/+MiwMCwI/OgPTm7892YYNWlFaad14qMGdb1qnnOT9Nf0U7BgYh0GAnHaa
         yzgCpkXGOQs6bno5KmpdSM0MmJnXplvGvKtgqDu0uUXAdP9c0KtkFNipiu+LVjGnEwIK
         khsTpCQeFqCzAJJWt0/9c1OAvkMQPpDBRgbrj/OvP8/IdauMxL6g1xjUorCWNEhF+TJ0
         IYsn0gJoXGJmEdoqukMuc6WJneD/Nkzekoh0nSQqK3o5kcxCqOVAzYsh50dNFfrgDYwN
         BTIA==
X-Gm-Message-State: AOJu0YwassXzRyVI1mgKSgpHujqdmqhP8Xs45wQSwy0sYWK0lAn51fv3
	IJjV9dngm/8ktdbb2pNsDnx65+9V/3flMliaMZJsYo00AcLz5PfGFfqy0kSu
X-Gm-Gg: ASbGnctjE1IpzxavhEzdIbEEkLH5peI86wP3K1wr5IKm/ld/Ztex0DllzICZiI2wiTS
	Wxc4QNWGVOIMs4XwZS5Tu+Zn/ApUzZ/oLE1QR4vjLQFVzRc3mD6ua9KZCELufpc3sVV63PP+vS0
	gyuYZnS/UhpK9/TJyOZ22RXYRbLGoxXNU2L4PaC8v7dVg0whCIvrJ0UOPo4v1pBdTyK/9RYC61Z
	5rx70kMypZL7mvg21DXQd+JeYgqgeobGuwuqYFEHCKuctW2Bxgu9iAu6AqwRHubIAhJhf7jinWJ
	CNdSxw8=
X-Google-Smtp-Source: AGHT+IE2wLp2CC7jm5Eb97yMArJZ6zhrC+tlMpivdGnv5BUUWfHS7xHHNAJkBOmVn/au1vEvcZX4cw==
X-Received: by 2002:a17:903:8c4:b0:21d:dae6:d956 with SMTP id d9443c01a7336-21f17e27204mr6746455ad.24.1738706972676;
        Tue, 04 Feb 2025 14:09:32 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::c09e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f07651559sm18166795ad.56.2025.02.04.14.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 14:09:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] python3-cffi: Fix failing ptests with clang
Date: Tue,  4 Feb 2025 14:09:30 -0800
Message-ID: <20250204220930.722230-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 22:09:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210825

Clang finds additional warnings with cffi generated code

_CFFI_test_verify_anonymous_struct_with_star_typedef.cpp:587:10: error: non-constant-expression cannot be narrowed from type 'long' to 'size_t' (ak│a 'unsigned long') in initializer list [-Wc++11-narrowing]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ize_t-to-avoid-c-11-narrowing-warnin.patch | 34 +++++++++++++++++++
 .../python/python3-cffi_1.17.1.bb             |  3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-cffi/0001-Cast-offset-to-size_t-to-avoid-c-11-narrowing-warnin.patch

diff --git a/meta/recipes-devtools/python/python3-cffi/0001-Cast-offset-to-size_t-to-avoid-c-11-narrowing-warnin.patch b/meta/recipes-devtools/python/python3-cffi/0001-Cast-offset-to-size_t-to-avoid-c-11-narrowing-warnin.patch
new file mode 100644
index 00000000000..a919f4f6fbf
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cffi/0001-Cast-offset-to-size_t-to-avoid-c-11-narrowing-warnin.patch
@@ -0,0 +1,34 @@
+From 2ac63f8765e62f1492ef3ee06791636700bc6cfb Mon Sep 17 00:00:00 2001
+From: triallax <triallax@tutanota.com>
+Date: Sat, 29 Jun 2024 15:25:24 +0100
+Subject: [PATCH] Cast offset to size_t to avoid c++11-narrowing warning (#92)
+
+e.g. with clang 18 on chimera linux:
+
+_CFFI_test_verify_anonymous_struct_with_star_typedef.cpp:583:10: error: non-constant-expression cannot be narrowed from type 'long' to 'size_t' (aka 'unsigned long') in initializer list [-Wc++11-narrowing]
+  583 |   { "a", ((char *)&((foo_t)4096)->a) - (char *)4096,
+      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+_CFFI_test_verify_anonymous_struct_with_star_typedef.cpp:583:10: note: insert an explicit cast to silence this issue
+  583 |   { "a", ((char *)&((foo_t)4096)->a) - (char *)4096,
+      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+      |          static_cast<size_t>(                      )
+
+Upstream-Status: Backport [https://github.com/python-cffi/cffi/pull/92]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/cffi/recompiler.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/cffi/recompiler.py b/src/cffi/recompiler.py
+index ac6c163e..14d578ee 100644
+--- a/src/cffi/recompiler.py
++++ b/src/cffi/recompiler.py
+@@ -953,7 +953,7 @@ class Recompiler:
+                 if cname is None or fbitsize >= 0:
+                     offset = '(size_t)-1'
+                 elif named_ptr is not None:
+-                    offset = '((char *)&((%s)4096)->%s) - (char *)4096' % (
++                    offset = '(size_t)(((char *)&((%s)4096)->%s) - (char *)4096)' % (
+                         named_ptr.name, fldname)
+                 else:
+                     offset = 'offsetof(%s, %s)' % (tp.get_c_name(''), fldname)
diff --git a/meta/recipes-devtools/python/python3-cffi_1.17.1.bb b/meta/recipes-devtools/python/python3-cffi_1.17.1.bb
index fbe9051a90b..5a3af03d9f6 100644
--- a/meta/recipes-devtools/python/python3-cffi_1.17.1.bb
+++ b/meta/recipes-devtools/python/python3-cffi_1.17.1.bb
@@ -6,7 +6,8 @@ DEPENDS += "libffi python3-pycparser"
 
 SRC_URI[sha256sum] = "1c39c6016c32bc48dd54561950ebd6836e1670f2ae46128f67cf49e789c52824"
 
-SRC_URI += "file://run-ptest"
+SRC_URI += "file://run-ptest \
+            file://0001-Cast-offset-to-size_t-to-avoid-c-11-narrowing-warnin.patch"
 
 inherit pypi python_setuptools_build_meta ptest pkgconfig
 

