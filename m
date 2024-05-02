Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1C5BC4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 08:50:04 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.8918.1714639800439644092
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 01:50:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pik1cCxm;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: zboszor@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51f036e9f4dso769997e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 01:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714639798; x=1715244598; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BRfNRgPncPSIrOrSVA73JgS1SYFavW6B/WupNk9w0O8=;
        b=Pik1cCxmV57VL6BJTv6QExYqzO1IEJOiC2q/teS2hcFd9ALTkjkBzGK9wLhcsWo5vH
         0uWUCwXg2qkVowEWRkHu/MYKhnp4bVhb93ZJQUfuyzu3Il0N+wAuWUCYJlZBrIpud6G2
         TS0lDli2De4d/e6FYWffLkiLeguqoNMbmLrAGqngO5Bbe0wofDo9baENiwSNyGtmD/4G
         30wQuoa5aYniib2msw+vDCZRWCRdqBrTP4v99KoD1FUH6x/x26k/GvwVUU2gOBUmAWdG
         ZNd4/xfowYpDWIjfDfPWrnnpQeCGGNJXpMhVazIRWWocGyX6BVXz/GjWIsvEL2Tr2Iz9
         mEsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714639798; x=1715244598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BRfNRgPncPSIrOrSVA73JgS1SYFavW6B/WupNk9w0O8=;
        b=ub5LpUPZiCmf2QGuvE8MGBSPVsXP4KingGVzvqT5kHbRoCXPDlCwlxfS45/igUF3TP
         pytW4EshFG8Bt0/arIsfOEQUwyGWeDB+/R/NhzCKe6yz8md9aRKeOm8GAvb1DhC20QkA
         Dfc+xdJQYs/qH20h7PMv5mihPi1N3vAKuVDBa08H1aqIi7nObxkGW6WA75cn2oPjLX79
         vaLZ+rORWLOCDw/vio5bHsbBhuixk4RO8mqhzVqwcwVUUH9dhttEpPOlrCqHCm5Srxg2
         9ypEhUVWk9geUseRgS/a81Y1QUsfoMAnEUStNmltNKLhTFT34rQap86BAO1EDk2koRzJ
         xdQw==
X-Gm-Message-State: AOJu0Yx4slDVjOu1cP0X+odpMUssRP/tlDQp07nWS2XDx3vy64/xKzgX
	ELAGxdWY2hdPTEgZRtZObZUwrpG7G37GpuFAtUVtJ8nVN0vE8ggyQqS06OW/
X-Google-Smtp-Source: AGHT+IFOx+7Zn6FKS1FX4Wb/aHxpWXZcV7yakOE5Sg0kncqZGmYpNXBKm+zsxWTr719AUTpuHVtIFA==
X-Received: by 2002:ac2:4c4e:0:b0:51b:f78d:c189 with SMTP id o14-20020ac24c4e000000b0051bf78dc189mr4100858lfk.14.1714639797603;
        Thu, 02 May 2024 01:49:57 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id p13-20020a056000018d00b0034e229a7d5bsm724832wrx.7.2024.05.02.01.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 01:49:57 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2] syslinux: Fix build with GCC 14
Date: Thu,  2 May 2024 10:49:33 +0200
Message-ID: <20240502084933.1784665-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 08:50:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198904

Add a patch from Fedora 40 to fix build with GCC 14.

Remove internal (long obsolete) copies of ext2_fs.h that clash
with the one from e2fsprogs when built with GCC 14.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../syslinux/0008-Fix-build-with-GCC-14.patch | 63 +++++++++++++++++++
 .../syslinux/syslinux_6.04-pre2.bb            |  5 ++
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/0008-Fix-build-with-GCC-14.patch

diff --git a/meta/recipes-devtools/syslinux/syslinux/0008-Fix-build-with-GCC-14.patch b/meta/recipes-devtools/syslinux/syslinux/0008-Fix-build-with-GCC-14.patch
new file mode 100644
index 0000000000..d7c8aa50d0
--- /dev/null
+++ b/meta/recipes-devtools/syslinux/syslinux/0008-Fix-build-with-GCC-14.patch
@@ -0,0 +1,63 @@
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
+Signed-off-by: rpm-build <rpm-build@fedora.org>
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


