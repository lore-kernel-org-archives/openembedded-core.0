Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web11.745.1589489383484899417
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 13:49:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l/Yg9t3z;
 spf=pass (domain: gmail.com, ip: 209.85.208.193, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f193.google.com with SMTP id u6so5045207ljl.6
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 13:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B9G8cKuqtoEhXL6eNENXUMg0POXulh3WMVHdSjtCG9Q=;
        b=l/Yg9t3zFbKjAm+hwFx41eKwJKF61huy+V14314QZO8wSm5FhDWBBWqbPy4Q384OMH
         0AxD/VrgjAG9KXWYf6iXlitbkHY1yDp7WGZAHJFjNgok0QMd3K9DgTU0sTh8EODYKtdD
         yKhNttqzTN3Sr7g/cbJfMoUo0NESEaU/lmHJSx6YhlTex7BVaaRJr+dUzhIW7JFY0Dqx
         +B/do0ZdrmnYW5UyAa+g2oGwZyGqejkcsRRmDX2XGLHT06NAErbvWQuOSp89X/BNiZyQ
         3v/XN8YhIHDxs9hBfL7qnB4nlco8wTI4s0aeSC+DIjwKmvfEXcetTSeosD79VMs9C87e
         ylbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B9G8cKuqtoEhXL6eNENXUMg0POXulh3WMVHdSjtCG9Q=;
        b=BVXuckHSHLRkdz8Kqac9M+M6VRW63IbCOVDUDYb11oi4e3CHdyh0l37qh1SiXFDJOk
         h/G/o+21lFUNtpaHwSHORAby069NmP2sn4hlHjuragkYpjSW8eenIjB7kcOWTmppUZUY
         qNY68qeg1sWXjVmvAz+R+zGD3bQqjRAIES/e/O8wcgNvZ6l2qVzhCHwynn/wmNJJsg9U
         rmsm+XFcoVWfqRUbuS0RbplfdMd0nhQmgwv30apw24vSlx8HWiQVFp4ySNigoybXZI2G
         +fFrNsBvzddasSmzAhKBqkSb8VMyLsVPgxpolKh14jGpbQi7e3Lr22RJ6dyNKm7JX7dI
         P0Tw==
X-Gm-Message-State: AOAM530Hf46ZQUM3zaCDvmF9jDm8JsakIH4LYLw/nVHRbm27PDH+j570
	mplCozb5jdPgYV4+laB3F0Ir9jSn
X-Google-Smtp-Source: ABdhPJzubN+H0i7LOZkSSJgdptwnZPIaUQ+E9E+zmpGeUs+cfblU9JyEamxcRSfJwxvIjiqi1wlSZQ==
X-Received: by 2002:a2e:a58e:: with SMTP id m14mr64612ljp.95.1589489381137;
        Thu, 14 May 2020 13:49:41 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se. [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id s7sm8978ljm.58.2020.05.14.13.49.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 13:49:40 -0700 (PDT)
From: "Jacob Kroon" <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] squashfs-tools: Backport fix for compiling with gcc 10
Date: Thu, 14 May 2020 22:49:29 +0200
Message-Id: <20200514204929.991669-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 ...ols-fix-build-failure-against-gcc-10.patch | 45 +++++++++++++++++++
 .../squashfs-tools/squashfs-tools_git.bb      |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/squashfs-tools/files/0001-squashfs-tools-fix-build-failure-against-gcc-10.patch

diff --git a/meta/recipes-devtools/squashfs-tools/files/0001-squashfs-tools-fix-build-failure-against-gcc-10.patch b/meta/recipes-devtools/squashfs-tools/files/0001-squashfs-tools-fix-build-failure-against-gcc-10.patch
new file mode 100644
index 0000000000..fc881862ea
--- /dev/null
+++ b/meta/recipes-devtools/squashfs-tools/files/0001-squashfs-tools-fix-build-failure-against-gcc-10.patch
@@ -0,0 +1,45 @@
+From 94e1911ca24726b7cb3efe2f8b9eb7a784757e18 Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyfox@gentoo.org>
+Date: Sun, 26 Jan 2020 18:35:13 +0000
+Subject: [PATCH] squashfs-tools: fix build failure against gcc-10
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+On gcc-10 (and gcc-9 -fno-common) build fails as:
+
+```
+cc ... -o mksquashfs
+ld: read_fs.o:(.bss+0x0):
+  multiple definition of `fwriter_buffer'; mksquashfs.o:(.bss+0x400c90): first defined here
+ld: read_fs.o:(.bss+0x8):
+  multiple definition of `bwriter_buffer'; mksquashfs.o:(.bss+0x400c98): first defined here
+```
+
+gcc-10 will change the default from -fcommon to fno-common:
+https://gcc.gnu.org/PR85678.
+
+The error also happens if CFLAGS=-fno-common passed explicitly.
+
+Reported-by: Toralf Förster
+Bug: https://bugs.gentoo.org/706456
+Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
+Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
+Upstream-Status: Backport [https://github.com/plougher/squashfs-tools/commit/fe2f5da4b0f8994169c53e84b7cb8a0feefc97b5]
+---
+ squashfs-tools/mksquashfs.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/squashfs-tools/mksquashfs.h b/squashfs-tools/mksquashfs.h
+index 1beefef..b650306 100644
+--- a/squashfs-tools/mksquashfs.h
++++ b/squashfs-tools/mksquashfs.h
+@@ -143,7 +143,7 @@ struct append_file {
+ #endif
+ 
+ extern struct cache *reader_buffer, *fragment_buffer, *reserve_cache;
+-struct cache *bwriter_buffer, *fwriter_buffer;
++extern struct cache *bwriter_buffer, *fwriter_buffer;
+ extern struct queue *to_reader, *to_deflate, *to_writer, *from_writer,
+ 	*to_frag, *locked_fragment, *to_process_frag;
+ extern struct append_file **file_mapping;
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index 9bcf026ce2..b06951df36 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 PV = "4.4"
 SRCREV = "52eb4c279cd283ed9802dd1ceb686560b22ffb67"
 SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https \
+           file://0001-squashfs-tools-fix-build-failure-against-gcc-10.patch;striplevel=2 \
 "
 
 S = "${WORKDIR}/git/squashfs-tools"
