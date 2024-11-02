Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB502E67814
	for <webhook@archiver.kernel.org>; Sat,  2 Nov 2024 21:15:01 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.25184.1730582099668745072
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Nov 2024 14:14:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kbg1FFy9;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71e625b00bcso2674138b3a.3
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Nov 2024 14:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730582098; x=1731186898; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0V3jAHHSwbneL4DUfVnpMq5l/QTfhhOjb33Tz34p1NE=;
        b=Kbg1FFy9s3g2XAwv+70JkoP+wD+3U9KXaxZHZQlsEr7rWAAEGTqs2+D/3xwAFvZxrS
         fRrYT0sxRBREmp6GYROjG6rCaeDgCl8FSahZ+Mso88hsBITFOUSZdwsDIYZ0XG4nCrwX
         fQwxYLI7TndsPdDGeo6pN1MWCUCHUhsBaRNJ954/CCltxlJXJv3cWo5xqcpf7Z7+ubMf
         Y4WquQ1dx3y9lSx2W2Jh3VcUH4VtNuSErzc8Cm7EuQkN21V3S5LgRoAxRhVbDVS+/2S/
         bcV0cfVzkgrMpQcGSJW6niT+e3Cgvkty7cYPzZvy6sPOqMwFnzqj6m5iZIlJXIGCgKZw
         Z1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730582098; x=1731186898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0V3jAHHSwbneL4DUfVnpMq5l/QTfhhOjb33Tz34p1NE=;
        b=rr0HC+JVibjzegMe9njjCoDTeNblLSUbx14c+U/do5yKZFjvcA6hELRKgBlnlJ6ljk
         ikJ9e33odeQ2h1Z+M0dDXViRHHvHysbFfMSIcJjoejbrznvHCztl0X8pQa5sNVfi5yfZ
         Kdr4xzgDQyIrxCfawd4/IvOvJSDCMbkfAoP+Kt0PIedZ/KfeA+DpXXgbWC3Z8baLj/e1
         KQl2ovGt+E1Am5DLOftO00fWzotiw3dmu+r/Qexe4w9LuLKA3mUmDXQlsdL89Tr+ZZav
         6+3e/4SnHQAiDLOwqTYnYgPEo1dqzSLmGS9EA/FTFs8ltuc+o3utUSZitI6130fnBS/G
         in8Q==
X-Gm-Message-State: AOJu0Yzicjm60+Zv+SwA4gb8Go+P3rZRXnrYNh5C82bVb3qb93a9CiSn
	ExnOstycmyY2HVlp/o/bxFoOW5HBleSItO2tkNJhg/KmoSkeKD1mF+Bu5Kk3
X-Google-Smtp-Source: AGHT+IEzpHdr7Kv+5lLd7xDRIxjV+pyE8QOkrisDfPp569VbhCQjyze6BmvQS8rcQ9UkeclBpkkdVQ==
X-Received: by 2002:a05:6a20:c998:b0:1d9:857a:585c with SMTP id adf61e73a8af0-1db91d89bc3mr15918708637.19.1730582098407;
        Sat, 02 Nov 2024 14:14:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::d73f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee459f8fb9sm4320185a12.61.2024.11.02.14.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 14:14:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH v4] python3-libarchive-c: Avoid using find_library python API
Date: Sat,  2 Nov 2024 14:14:55 -0700
Message-ID: <20241102211455.2060594-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Nov 2024 21:15:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206657

find_library API depends on platform to provide ldconfig, ld, gcc, objdump
etc, so either we add these dependencies or avoid them by computing the
libarchive library name during build, which we can be done.

This ensures that ffi module works with musl as well as glibc equally
as musl does not provide ldconfig like glibc does

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@arm.com>
---
v2: rebased
v3: rebased
v4: Add an anchor as a patch for sed

 ...a-replacable-anchor-for-find_library.patch | 29 +++++++++++++++++++
 .../python/python3-libarchive-c_5.1.bb        |  9 ++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-libarchive-c/0001-ffi-Insert-a-replacable-anchor-for-find_library.patch

diff --git a/meta/recipes-devtools/python/python3-libarchive-c/0001-ffi-Insert-a-replacable-anchor-for-find_library.patch b/meta/recipes-devtools/python/python3-libarchive-c/0001-ffi-Insert-a-replacable-anchor-for-find_library.patch
new file mode 100644
index 00000000000..7b8775802fc
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-libarchive-c/0001-ffi-Insert-a-replacable-anchor-for-find_library.patch
@@ -0,0 +1,29 @@
+From ed20aba335996d3aa97d99dfc122eb5a3a26ba1b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 2 Nov 2024 11:06:01 -0700
+Subject: [PATCH] ffi: Insert a replacable anchor for find_library
+
+@@REPLACE_FIND_LIBRARY_API@@ must be sustituted from bitbake environment via
+recipe. This also helps in detecting changes to code from upstream in
+this area as this patch will fail to apply.
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libarchive/ffi.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libarchive/ffi.py b/libarchive/ffi.py
+index 1fc321a..991f1b6 100644
+--- a/libarchive/ffi.py
++++ b/libarchive/ffi.py
+@@ -22,7 +22,7 @@ logger = logging.getLogger('libarchive')
+ 
+ page_size = mmap.PAGESIZE
+ 
+-libarchive_path = os.environ.get('LIBARCHIVE') or find_library('archive')
++libarchive_path = os.environ.get('LIBARCHIVE') or @@REPLACE_FIND_LIBRARY_API@@
+ libarchive = ctypes.cdll.LoadLibrary(libarchive_path)
+ 
+ 
diff --git a/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb b/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
index 3116c6b62ec..333831c4b65 100644
--- a/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
+++ b/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=bcab380227a83bc147350b40a81e6ffc"
 
 SRC_URI += " \
         file://new-libarchive.patch \
+        file://0001-ffi-Insert-a-replacable-anchor-for-find_library.patch \
         file://run-ptest \
 "
 
@@ -16,6 +17,14 @@ inherit pypi setuptools3 ptest
 
 SRC_URI[sha256sum] = "7bcce24ea6c0fa3bc62468476c6d2f6264156db2f04878a372027c10615a2721"
 
+DEPENDS += "patchelf-native libarchive"
+# Avoid using find_library API which needs ldconfig and ld/objdump
+# https://docs.python.org/3/library/ctypes.html#ctypes-reference
+#
+do_configure:append() {
+    sed -i -e "s|@@REPLACE_FIND_LIBRARY_API@@|'${libdir}/$(patchelf --print-soname ${STAGING_LIBDIR}/libarchive.so)'|" ${S}/libarchive/ffi.py
+}
+
 RDEPENDS:${PN} += "\
   libarchive \
   python3-ctypes \

