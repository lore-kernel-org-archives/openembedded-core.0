Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D02CA0FF7
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 21:30:19 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.6636.1756330215794510243
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 14:30:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=q6AG4kKP;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3276f46c1caso296856a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 14:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756330215; x=1756935015; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vD7CzLxT0EbV6AAnNP+li2rvCd/tGGNuFIVHWPRUkA4=;
        b=q6AG4kKPLOsBM60MDaIoYt1Bi9S25FkmfFuhlRk4dvwSxiJhP0E86hDBr/n8q9V2Y8
         orpiwN0cLWuZEFhSXtvnZuHO6Ie8pY7q2rZePEnggPuKXoEv5Tch/Fem1xz93sHBgwn9
         l/FhuO0lunIWZEiVp0gPQz24BSEpDHpR+wRvrLD3Oe0XLUKdul50qkL7IwIYnCPxn3Fc
         SHWJ2s9IyAqn53T8xJxXbvS2oW90tWc+0pXgYNvlNwQ4SHPnG6hlEaIwhe+BVzF2BHpb
         czTM0PoFt6Djzn33F17ejWUnb3dWPrbb7JB2pzPpb6l1/p6g1LHjfLCNtiFHp3s0yTrJ
         GvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756330215; x=1756935015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vD7CzLxT0EbV6AAnNP+li2rvCd/tGGNuFIVHWPRUkA4=;
        b=D8X8ImfmB+LjH5jJSTPSSRchd8oOoAmlEQR4cdPH0O+0mw9NbNCv+tKyF35gohm2Nw
         rOVX6gfiBaPpQAjjirdPqQrmiPqWnAEP+kbJl2pvrFFAwOkFm8bAJnRYadXki4ifKMFT
         pK1lpPwVjKyHFRmdvj6keT80M+JNBUr1dfRyLJYDX/OZRWUKpt76p7R2ZUYiXe4O/x3k
         7k0SF5tEOkOOKWyj01mdZZtzXs40Lqb48d1/TLYbIVLyCw95zqaIFgHWgOBYugHs+UL9
         RAnRCue2QddPhzxhPjq4Lz7EC4ynI3vUJmRw94ujNlak5t3RjpnrO1/9p4QuE6n4vbUl
         GPOg==
X-Gm-Message-State: AOJu0YwfoM+DQV9wLPEgiv5BLUgeYamS+tQ1OWtVgI0DC+LKMvExZgXV
	6h9GET0h2dn6QpPWny5vcRKM38Ls2kFtWjGQyy2jTgRM6k3rSdkbPPjEU9NmF6okbi8Fko+PNOD
	KFmNA
X-Gm-Gg: ASbGncvcw2xczUSuiDVfBIfAnHdUKQyUEtdNxySKjp19V01ecd31gE6mPQO+SbCn+CZ
	CvH7XwQfRcgRAUcn6bjHbJGkzFvAbFbo0Ed6e3eCbJgClFs9VcdJc5n+cF7BHwEo7Qu5r6cJ9I6
	dCIKfQtoCiiSLjcbv/0hyR/iYTGK8AgSM62NUbeF55k4+x+GcKTXi6Gz9E+HHTEk2vaH8WMn831
	wtRnSwkMS7S2ygFYo5eRmTZcZ6UYnjKbuDJvgRniGRQetESnjqKgaoEh4WS1r7i6CYP7AAHZaWZ
	ipeWHCj0y63cK/FatVlnwmpGwKXOHqLsOduJjATYCBhcsoQFhCMQKHOCbepNbyXuQSgUmRMregt
	iuXKlPzvHRNsz8g==
X-Google-Smtp-Source: AGHT+IEVe6YsVyl8Ap0lLd3haWRXqNHPL1CEANeqjwOGmRGG5fpel5w4F2gxGc5h7RUfUpVQUeDI9Q==
X-Received: by 2002:a17:90b:1f8a:b0:327:53f0:6368 with SMTP id 98e67ed59e1d1-32753f06524mr7514803a91.2.1756330214812;
        Wed, 27 Aug 2025 14:30:14 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d0c9:1052:20fd:8423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce1f30sm2905857a91.23.2025.08.27.14.30.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 14:30:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/33] libarchive: patch regression of patch for CVE-2025-5918
Date: Wed, 27 Aug 2025 14:29:19 -0700
Message-ID: <d2b8d2f7d579779a9effcff677960dbc576b1cc8.1756329972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756329972.git.steve@sakoman.com>
References: <cover.1756329972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 21:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222520

From: Peter Marko <peter.marko@siemens.com>

Picked commit per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2025-5918

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libarchive/CVE-2025-5918-0003.patch       | 51 +++++++++++++++++++
 .../libarchive/libarchive_3.7.9.bb            |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5918-0003.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-5918-0003.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5918-0003.patch
new file mode 100644
index 0000000000..bc6903d41c
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5918-0003.patch
@@ -0,0 +1,51 @@
+From 51b4c35bb38b7df4af24de7f103863dd79129b01 Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <tobias@stoeckmann.org>
+Date: Tue, 27 May 2025 17:09:12 +0200
+Subject: [PATCH] Fix FILE_skip regression
+
+The fseek* family of functions return 0 on success, not the new offset.
+This is only true for lseek.
+
+Fixes https://github.com/libarchive/libarchive/issues/2641
+Fixes dcbf1e0ededa95849f098d154a25876ed5754bcf
+
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+
+CVE: CVE-2025-5918
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/51b4c35bb38b7df4af24de7f103863dd79129b01]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libarchive/archive_read_open_file.c | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/libarchive/archive_read_open_file.c b/libarchive/archive_read_open_file.c
+index 6ed18a0c..742923ab 100644
+--- a/libarchive/archive_read_open_file.c
++++ b/libarchive/archive_read_open_file.c
+@@ -132,7 +132,7 @@ FILE_skip(struct archive *a, void *client_data, int64_t request)
+ #else
+ 	long skip = (long)request;
+ #endif
+-	int64_t old_offset, new_offset;
++	int64_t old_offset, new_offset = -1;
+ 	int skip_bits = sizeof(skip) * 8 - 1;
+ 
+ 	(void)a; /* UNUSED */
+@@ -170,11 +170,14 @@ FILE_skip(struct archive *a, void *client_data, int64_t request)
+ #ifdef __ANDROID__
+ 			new_offset = lseek(fileno(mine->f), skip, SEEK_CUR);
+ #elif HAVE__FSEEKI64
+-			new_offset = _fseeki64(mine->f, skip, SEEK_CUR);
++			if (_fseeki64(mine->f, skip, SEEK_CUR) == 0)
++				new_offset = _ftelli64(mine->f);
+ #elif HAVE_FSEEKO
+-			new_offset = fseeko(mine->f, skip, SEEK_CUR);
++			if (fseeko(mine->f, skip, SEEK_CUR) == 0)
++				new_offset = ftello(mine->f);
+ #else
+-			new_offset = fseek(mine->f, skip, SEEK_CUR);
++			if (fseek(mine->f, skip, SEEK_CUR) == 0)
++				new_offset = ftell(mine->f);
+ #endif
+ 			if (new_offset >= 0)
+ 				return (new_offset - old_offset);
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
index f08673ea3b..f4b1be2337 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -37,6 +37,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2025-5917.patch \
            file://CVE-2025-5918-0001.patch \
            file://CVE-2025-5918-0002.patch \
+           file://CVE-2025-5918-0003.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-- 
2.43.0


