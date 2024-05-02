Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83031C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 07:44:34 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.8198.1714635864635087440
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 00:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Gq2AAy3m;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-34dc9065606so761843f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 00:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714635863; x=1715240663; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HpCccaA6SbuR+i9ymEIVX6Aq6PB9gbgq4/ErnijsoK8=;
        b=Gq2AAy3mMdIKTW9VlKkcRS4/jNcojwC2oM/ZamCgGHBTbmcxxstTFLjjP5vUDok/C8
         AEk5vdv0uN1LoCpsO6CntJ8QZFNgt82s0bKN2tCt6nbO/XUZeSH99Kn7F3ohNU4LHVl9
         nk9cnemnq96DZk34ZR9TNuENsaC7u+7LAGJfxiIh9SZ9l3sw49w5VnUO5LY3Ge87wmRU
         //Xjng7NSxoXfipOpyOB8VoqDmUNniUUeXPNEJuyXJ2JpGbvAqH50VDCffk/6qKo9EBD
         pTDKqBVUZmuQP78F5oHfs/Yjq4fECGFBAham4zIvJxlkCEa+MWXdfWNOTbxLE039Cctd
         HqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714635863; x=1715240663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HpCccaA6SbuR+i9ymEIVX6Aq6PB9gbgq4/ErnijsoK8=;
        b=CIfO9tPMxPeaUZvLghqcBj/HaylVV8orS813Hm4X6XR3BwRReGS+Wchxr5diVlhWsn
         HVpU9SubLGm18obKZLfp2yqjZjs91V404W8yrI+untdIa7TTlkwnG1kK6zno8mkwyqAg
         CneWlOOqsa+dGT1KAqY4MD9aQ6ZewHJp5jkrKt826O0CJU+uCNRMixApiGi7thVnyxeh
         13GG6fmgoboopZ53t+tx4jRU1iBGKyfSiMVqDQ4roqvwFo8f+V9sCQuoPhwocLAxuSLT
         gGQ+/M2jzX/S42+Q+9c84bDJrGkoTlHQhbgfw+g+xGDmH7gMijOZDR5+zorFT3nDvvz2
         FswQ==
X-Gm-Message-State: AOJu0YzX4ToaLjM5VqSIVZp2bzBHdru2mjXQJMfJV7t2uzmTfz73hR0L
	BRrZD8npB3hq0kj/j39PAqx24vhAg34IiYAWEd1rRdhMPiljMVQWzKj3fTZk
X-Google-Smtp-Source: AGHT+IEINNHLNlzeXwK4OU+ojdUgksBj/gk72lxyC1VZuO6Y6CUKN6ZmPRkvpuzkfuEL/1B3V4vyaw==
X-Received: by 2002:a5d:66c8:0:b0:34d:13c9:eb52 with SMTP id k8-20020a5d66c8000000b0034d13c9eb52mr1281015wrw.3.1714635862517;
        Thu, 02 May 2024 00:44:22 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id q15-20020a5d658f000000b0034ddf05a3e6sm564982wru.76.2024.05.02.00.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 00:44:22 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH] syslinux: Fix build with GCC 14
Date: Thu,  2 May 2024 09:44:19 +0200
Message-ID: <20240502074419.1422773-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 07:44:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198901

Add a patch from Fedora 40 to fix build with GCC 14.

Remove internal (long obsolete) copies of ext2_fs.h that clash
with the one from e2fsprogs when built with GCC 14.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../syslinux/0008-Fix-build-with-GCC-14.patch | 62 +++++++++++++++++++
 .../syslinux/syslinux_6.04-pre2.bb            |  5 ++
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/0008-Fix-build-with-GCC-14.patch

diff --git a/meta/recipes-devtools/syslinux/syslinux/0008-Fix-build-with-GCC-14.patch b/meta/recipes-devtools/syslinux/syslinux/0008-Fix-build-with-GCC-14.patch
new file mode 100644
index 0000000000..41414ed0f5
--- /dev/null
+++ b/meta/recipes-devtools/syslinux/syslinux/0008-Fix-build-with-GCC-14.patch
@@ -0,0 +1,62 @@
+From 321433861cc9cd3c7e0ee02830e561bc0f956998 Mon Sep 17 00:00:00 2001
+From: rpm-build <rpm-build>
+Date: Sun, 4 Feb 2024 11:46:02 -0500
+Subject: [PATCH] Fix build with GCC 14
+
+com32/lib/syslinux/debug.c: In function ‘syslinux_debug’:
+com32/lib/syslinux/debug.c:91:5: error: implicit declaration of function ‘printf’
+
+com32/libupload/upload_tftp.c: In function ‘upload_tftp_write’:
+com32/libupload/upload_tftp.c:64:11: error: implicit declaration of function ‘tftp_put’
+
+com32/chain/chain.c: In function ‘main’:
+com32/chain/chain.c:517:44: error: passing argument 3 of ‘loadfile’ from incompatible pointer type
+com32/include/syslinux/loadfile.h:11:37: note: expected ‘size_t *’ but argument is of type ‘addr_t *’
+
+Upstream-Status: Inactive-Upstream [no upstream]
+---
+ com32/chain/chain.c        | 2 +-
+ com32/lib/syslinux/debug.c | 1 +
+ com32/libupload/tftp.h     | 3 +++
+ 3 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/com32/chain/chain.c b/com32/chain/chain.c
+index 4e9e32d..b11b880 100644
+--- a/com32/chain/chain.c
++++ b/com32/chain/chain.c
+@@ -514,7 +514,7 @@ int main(int argc, char *argv[])
+     if (opt.file) {
+ 	fdat.base = (opt.fseg << 4) + opt.foff;
+ 
+-	if (loadfile(opt.file, &fdat.data, &fdat.size)) {
++	if (loadfile(opt.file, &fdat.data, (size_t*)&fdat.size)) {
+ 	    error("Couldn't read the boot file.");
+ 	    goto bail;
+ 	}
+diff --git a/com32/lib/syslinux/debug.c b/com32/lib/syslinux/debug.c
+index d9ab863..e8f53d5 100644
+--- a/com32/lib/syslinux/debug.c
++++ b/com32/lib/syslinux/debug.c
+@@ -1,6 +1,7 @@
+ #include <linux/list.h>
+ #include <string.h>
+ #include <stdbool.h>
++#include <stdio.h>
+ 
+ #ifdef DYNAMIC_DEBUG
+ 
+diff --git a/com32/libupload/tftp.h b/com32/libupload/tftp.h
+index 323dc16..09aa40b 100644
+--- a/com32/libupload/tftp.h
++++ b/com32/libupload/tftp.h
+@@ -19,4 +19,7 @@ TFTP_OK	= 11, /* Not in RFC */
+ };
+ 
+ extern const char *tftp_string_error_message[];
++
++extern int tftp_put(struct url_info *url, int flags, struct inode *inode,
++                               const char **redir, char *data, int data_length);
+ #endif
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
index c8e7f25d2b..190891b6fe 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://www.zytor.com/pub/syslinux/Testing/6.04/syslinux-${PV}.tar.xz
            file://0012-libinstaller-Fix-build-with-glibc-2.36.patch \
            file://0013-remove-clean-script.patch \
            file://0014-Fix-reproducibility-issues.patch \
+           file://0008-Fix-build-with-GCC-14.patch \
 "
 
 SRC_URI[md5sum] = "2b31c78f087f99179feb357da312d7ec"
@@ -71,6 +72,10 @@ PACKAGECONFIG[mtools] = ",,,"
 # Tasks for native/nativesdk which just build the installer.
 #
 do_configure() {
+	# These clash with ext2_fs.h from e2fsprogs when built with GCC 14
+	rm -f ${S}/core/fs/ext2/ext2_fs.h
+	rm -f ${S}/libinstaller/ext2fs/ext2_fs.h
+
 	oe_runmake firmware="bios" clean
 }
 
-- 
2.44.0


