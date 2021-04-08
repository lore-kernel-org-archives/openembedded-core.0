Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.7470.1617886655539161897
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Apr 2021 05:57:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hyprua-org.20150623.gappssmtp.com header.s=20150623 header.b=gWB8cp2h;
 spf=none, err=SPF record not found (domain: hyprua.org, ip: 209.85.221.42, mailfrom: mathieu.dubois-briand@hyprua.org)
Received: by mail-wr1-f42.google.com with SMTP id e12so2026229wro.11
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Apr 2021 05:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hyprua-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NAB2mdYqcTorZbGrGCg/kpBoThuTxte1NCeyZz2XZlg=;
        b=gWB8cp2hq8vln+J31QwZVNyYI/Gvsrw7Gz5uJCM+peR/jnjSfrm3mkXWV/0HjXCQy5
         K/9zIcaZXuruix5DoYj8I++IDPBs9qgaZ7leWpOK13FhcYwoMQiC53Z9n452e3docc/4
         +0YlYbPq0NbBNfF3TenxGxKpsHV4PpSZy4YnZ3ZKuREKGc1O1DI8KauYcTYceSbaWY0M
         Zop2BD7/Sll5o3fkSIb8NtTQvzuQbFYI6iUchl9vCFnqW7VgQDl0unwomtFegXwgTk3H
         aoPkUTl26O/Lt+l/kMplQocDl+RzogazbH2GOXyuI2JVWahksDc304vAHI8+1L3OtMYA
         yB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NAB2mdYqcTorZbGrGCg/kpBoThuTxte1NCeyZz2XZlg=;
        b=aN4lqL8isfPzfITawwx8zdC6OkJZ7wCY4PnNgF8nH/k4mUUxJxbh5qBNchJPTZCxlu
         b6kD9YdHSENX/zOeOo5D7KM59hAu7tXKwWoROnMZhlapl58+4hkZy4v7tvSFv/3j9B1u
         3/tvuPfyoKUF+anHLv1YYf0zeAHnjtCXjR7S0PxyIY2fdxfdzgVI/P+aISQDXg5X56Xt
         YO6BMrSI/tdHTwCdT4XbdOc4UXwIW127tR1vngavk0O8zgw/nXFo3TfU8LPrhpDiq1vO
         7fV4ptn1PLtA024TXNh/GWIwaL79AtCBDJk3uW5kzQhMbrYgajH78DyfBAB2tSkdAij+
         z42w==
X-Gm-Message-State: AOAM530dcJGNIAR4KqpTEXPZ5lWeZrJLfb7t6ZqOYz4PJS7d8a69Ioq1
	3fIKR9s0mGleHiKSJJkdGyC+A6Vz4+hK4BQy
X-Google-Smtp-Source: ABdhPJzoTngaTgAOsR+QC/J8uL5pnJ4c4v18nq8eq7AhdyXRGSQbccNjcwlxl7OyXNqRFO/c+KYswg==
X-Received: by 2002:adf:f58b:: with SMTP id f11mr11197815wro.322.1617886653659;
        Thu, 08 Apr 2021 05:57:33 -0700 (PDT)
Return-Path: <mathieu.dubois-briand@hyprua.org>
Received: from WIPC17090108.witekio.dom ([2a01:e0a:4b9:9060:e944:e560:9cfe:1967])
        by smtp.gmail.com with ESMTPSA id y10sm17375267wrp.31.2021.04.08.05.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 05:57:33 -0700 (PDT)
From: mathieu.dubois-briand@hyprua.org
X-Google-Original-From: Mathieu Dubois-Briand <mbriand@witekio.com>
To: openembedded-core@lists.openembedded.org
Cc: Mathieu Dubois-Briand <mbriand@witekio.com>
Subject: [PATCH] e2fsprogs: use default inode size for small fs
Date: Thu,  8 Apr 2021 14:57:21 +0200
Message-Id: <20210408125721.3524723-1-mbriand@witekio.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch e2fsprogs configuration file so the default inode size when
formatting a "small" partition (less than 512MB) is the global default
size (256 bytes) and not a specific value (128 bytes).

Inode size of 128 bytes can only store 32 bits timestamps, forbidding
dates beyond January 19, 2038. Following warning message can be seen in
kernel log when mounting such partition in rw mode:

ext4 filesystem being mounted at /mnt supports timestamps until 2038
(0x7fffffff)

Signed-off-by: Mathieu Dubois-Briand <mbriand@witekio.com>
---
 ...se-default-inode-size-for-small-filesystems.patch | 12 ++++++++++++
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb  |  1 +
 2 files changed, 13 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/use-default-inode-size-for-small-filesystems.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/use-default-inode-size-for-small-filesystems.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/use-default-inode-size-for-small-filesystems.patch
new file mode 100644
index 000000000000..97e4b1f9c6e7
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/use-default-inode-size-for-small-filesystems.patch
@@ -0,0 +1,12 @@
+diff --git c/misc/mke2fs.conf.in w/misc/mke2fs.conf.in
+index 01e35cf83150..29f41dc06df1 100644
+--- c/misc/mke2fs.conf.in
++++ w/misc/mke2fs.conf.in
+@@ -16,7 +16,6 @@
+ 	}
+ 	small = {
+ 		blocksize = 1024
+-		inode_size = 128
+ 		inode_ratio = 4096
+ 	}
+ 	floppy = {
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb
index be8b67c35d0e..bf62a688f859 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb
@@ -8,6 +8,7 @@ SRC_URI += "file://remove.ldconfig.call.patch \
 
 SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
                                 file://quiet-debugfs.patch \
+                                file://use-default-inode-size-for-small-filesystems.patch \
 "
 
 
-- 
2.25.1

