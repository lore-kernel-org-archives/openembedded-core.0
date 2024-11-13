Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C05BD597DB
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 03:16:48 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.3478.1731467807425478725
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 19:16:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VQhHqxRs;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.53, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7181caa08a3so3602379a34.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 19:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1731467806; x=1732072606; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=usguIwgmuvs9D0QCZdRPiXh/b/rh9zwLwi1v7rl6A6I=;
        b=VQhHqxRsvV+WOOJAwIaUCONdAigasKwD6DOkWTTiX0qA9vQhU6OR3UTEXKixhUBzCp
         nsHundS2+iedg+qiDxJmmHJjA0qbneCDz44meD+jKJmml8QQ+LAuoGG0tYnEgWWTr5/e
         cTFfTXfkauAO2bE4upW0W130IL2X4uIVMK/IxaGpJsRWUcEqhppfZzw50jBxQlI9phoM
         cjOQBkNz4qYLImFKUR3FeKPSmqi0KF90z36lBfR+fq0j8APCRgRrMrBMtdz/tvM2rGZf
         Ryc3kjabux3QcvQeqvi6th7mv8eelRxK1/r4rK2sdTC2YM7NPrrjR+OPVowZaNSJJ5oB
         okyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731467806; x=1732072606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=usguIwgmuvs9D0QCZdRPiXh/b/rh9zwLwi1v7rl6A6I=;
        b=mJ7KFIwNyeF0cqDid5u57WY5NaeQx35Ni9/vrXWFCW4mat4jk9jEZdrBSxtClLQRLx
         3DYcj7kemGOEfPi8h3hrhD/NcR4bFFUaLO4proMr2Is1gD5vL/AeAoyW78fBv7KYekhK
         swOou2gFuHT/y5EMsr7c9iga/S9eJWgGeIfDV7gprukhVVknYQ6cbdl1GT2/mdFBfTEH
         BLDKz80GY8uCrVwgxwTRo3XgmT9WxUAULcS0j8lbgoDWij4WgLhmJ8b2Qgh56OA9txaW
         MO/k79hQ+T5iaOQ0/vRLJK/8sbLC1XGbTX2qG8Sw3Gs6bDdw3/5tshci/VMs0eZSi/QC
         mPkg==
X-Gm-Message-State: AOJu0YyPUDgXXfL20l0OysELyB20Yc8kjKl+A22DlH7zOr6AdDoPlkTn
	VuYQFX6zvgwVYj29kKyDudrx2HcNKFr18O48BwboPA1DNBtLfOUCxkS2rPoZxVHSrCDAFAMz4HW
	d
X-Google-Smtp-Source: AGHT+IEigs6HStaUZeqUyfrefMBSgeNNBCKeq17BhNZ700ME7Pe4uW8+NkgM4Bf29X/zmEGJzD5PDA==
X-Received: by 2002:a05:6830:6e99:b0:718:c7f:5cbd with SMTP id 46e09a7af769-71a1c26d439mr20364342a34.28.1731467805671;
        Tue, 12 Nov 2024 19:16:45 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f64616csm9660213a12.64.2024.11.12.19.16.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 19:16:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/19] pseudo: Fix to work with glibc 2.40
Date: Tue, 12 Nov 2024 19:16:10 -0800
Message-Id: <63d7c11b46119f0c97d08f2fa837c02e633ab75f.1731467662.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731467662.git.steve@sakoman.com>
References: <cover.1731467662.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 03:16:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207090

From: Richard Purdie <richard.purdie@linuxfoundation.org>

glibc 2.40 renames some internal header variables. Update our hack to
work with the new version. These kinds of problems illustrate we need to
address the issue properly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/files/glibc238.patch | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/files/glibc238.patch b/meta/recipes-devtools/pseudo/files/glibc238.patch
index da4b8caee3..dfb5c283f6 100644
--- a/meta/recipes-devtools/pseudo/files/glibc238.patch
+++ b/meta/recipes-devtools/pseudo/files/glibc238.patch
@@ -9,7 +9,7 @@ Index: git/pseudo_wrappers.c
 ===================================================================
 --- git.orig/pseudo_wrappers.c
 +++ git/pseudo_wrappers.c
-@@ -6,6 +6,15 @@
+@@ -6,6 +6,18 @@
   * SPDX-License-Identifier: LGPL-2.1-only
   *
   */
@@ -21,6 +21,9 @@ Index: git/pseudo_wrappers.c
 +#undef __GLIBC_USE_ISOC2X
 +#undef __GLIBC_USE_C2X_STRTOL
 +#define __GLIBC_USE_C2X_STRTOL 0
++#undef __GLIBC_USE_ISOC23
++#undef __GLIBC_USE_C23_STRTOL
++#define __GLIBC_USE_C23_STRTOL 0
 +
  #include <assert.h>
  #include <stdlib.h>
@@ -29,7 +32,7 @@ Index: git/pseudo_util.c
 ===================================================================
 --- git.orig/pseudo_util.c
 +++ git/pseudo_util.c
-@@ -8,6 +8,14 @@
+@@ -8,6 +8,17 @@
   */
  /* we need access to RTLD_NEXT for a horrible workaround */
  #define _GNU_SOURCE
@@ -41,6 +44,9 @@ Index: git/pseudo_util.c
 +#undef __GLIBC_USE_ISOC2X
 +#undef __GLIBC_USE_C2X_STRTOL
 +#define __GLIBC_USE_C2X_STRTOL 0
++#undef __GLIBC_USE_ISOC23
++#undef __GLIBC_USE_C23_STRTOL
++#define __GLIBC_USE_C23_STRTOL 0
  
  #include <ctype.h>
  #include <errno.h>
-- 
2.34.1


