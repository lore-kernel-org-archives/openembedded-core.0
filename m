Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC537CA0FF8
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 13:44:56 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.64678.1756215893291954678
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 06:44:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OA9Gcy4S;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b47052620a6so4765477a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 06:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756215892; x=1756820692; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=84ZwvVYOLOR3YqXWmdHJtzOKhNrLA/jKB2FGvuweOxI=;
        b=OA9Gcy4S+pABBLlrhNxElKku/aIG1/KiMSZr1Hn1Aq549db1P3f4/mDYoodHVBwhBZ
         njlvU6Qh/raur9xxUs5ypuZCjSg5iVGWc7AkdQGu14ASTmJvIdRweGjgb/TYMXRKuOcP
         LttpXkDC53jWj57X8NN/uNsORFlY1tUbUz+J/QawSYL965FHW/wFTMdly0KZvrYHfuIM
         OoUMuCOoWHHitS77SjvvL1YrQHEJFYEAu7u2uDYrwnEMEGDWhr1O7+ydZ9JufirZtyPO
         y6Wpkgj3Gys/PxEag7A20A2k+gr2UCaUr3dJMj+U+/PfZI+geRu5OFVUG37mJgLUMz2H
         7zGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215892; x=1756820692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=84ZwvVYOLOR3YqXWmdHJtzOKhNrLA/jKB2FGvuweOxI=;
        b=krngE83cFCDySv7W8FGdeqQuNwSn3AHP3c8rfTfJyC4GkGYqxLV9/b9m/USQVgpJNx
         tz7VS087mijBqt4bN8DOpfV55cgtkTBb8Dj3H2gwU9PeLM8wH7wybzubJOwAmT8WeBod
         8liudugs1RAuYWTd9+zxIw1SuS/r8mvSt4L4QKk56LKby2jZO59PUp+KyM0DN6mXEGq3
         O+Bp+cyuxO2q1sPltT16vtxDc9muK344qlS7JTZ4brd7YqV3+8rxVz87FNjSF1L20K3o
         sWRhl86mwWmTA0M9a6TpSAYND8dW0fqgxl/CgNYTlb5P1N1FBr2/LvSJpVXge9jt2cWB
         UdBA==
X-Gm-Message-State: AOJu0YyM9UGvOEbKWvL987Cdjnd1iKEqTMFOassVyODuipznR+EdtV7t
	0Z9W4J5zAx0xXKnJtp4cIzK0pNOiLsgVt3Dl5JJWT9gDbcjWDvslK2bKQUiR7y/UE0qtaWj0B4C
	2AxzE
X-Gm-Gg: ASbGnctfruiI+tHKKIw1F5xVldCuxY3zFKwAQizju6lJehd9LvGvcvB3uYb2sK69Ut+
	D6/9caaOxoSg8CC+w2VnTh6OLtrParz6spgxXCTOhlPaj1A3pcbjj5sb+v5PzgulBjD9sqNkTOX
	yM7R3KKKzV9N4ngfTXrYwKFSli9cFvqJOWO0yewNtIBNVYy061lS49X8s5XkkVTyB8e7zNxluix
	7mMq0hCyvMjt2ekOxvyioejTpbN6QT2RqpZ3FhuNakDJUgDM4tWs3A+x7fFaeu91k9RY6fsqHww
	+Wf5u2ZlWO8tPpEhV7pXj2D3wiZSTMK6ujonXIbzELuImHZh07NIB7OhoquBGVf5AZEu/nBngjJ
	0b38p0/+0ujWL6IJzMtF7UuWw
X-Google-Smtp-Source: AGHT+IGQekE+/NCnIi5Fryhy8jeXEB51xHoB/ftvVCmnBSxyEGca4wfjZnN5WZPV9m5duAU/52VADw==
X-Received: by 2002:a17:902:f788:b0:234:325:500b with SMTP id d9443c01a7336-248753a2773mr16270235ad.22.1756215892378;
        Tue, 26 Aug 2025 06:44:52 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1687:ddce:d4c7:f578])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24668779fa9sm96941595ad.27.2025.08.26.06.44.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 06:44:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 9/9] libarchive: patch regression of patch for CVE-2025-5918
Date: Tue, 26 Aug 2025 06:44:31 -0700
Message-ID: <c947e01b3c27e9f08dc55ee4939d5537318f12e3.1756215756.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756215756.git.steve@sakoman.com>
References: <cover.1756215756.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 13:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222470

From: Peter Marko <peter.marko@siemens.com>

Picked commit per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2025-5918

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...2025-5918.patch => CVE-2025-5918-01.patch} |  0
 .../libarchive/CVE-2025-5918-02.patch         | 51 +++++++++++++++++++
 .../libarchive/libarchive_3.6.2.bb            |  3 +-
 3 files changed, 53 insertions(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/libarchive/{CVE-2025-5918.patch => CVE-2025-5918-01.patch} (100%)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5918-02.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-5918.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5918-01.patch
similarity index 100%
rename from meta/recipes-extended/libarchive/libarchive/CVE-2025-5918.patch
rename to meta/recipes-extended/libarchive/libarchive/CVE-2025-5918-01.patch
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-5918-02.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5918-02.patch
new file mode 100644
index 0000000000..223cd01c0d
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5918-02.patch
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
+@@ -133,7 +133,7 @@ FILE_skip(struct archive *a, void *client_data, int64_t request)
+ #else
+ 	long skip = (long)request;
+ #endif
+-	int64_t old_offset, new_offset;
++	int64_t old_offset, new_offset = -1;
+ 	int skip_bits = sizeof(skip) * 8 - 1;
+ 
+ 	(void)a; /* UNUSED */
+@@ -171,11 +171,14 @@ FILE_skip(struct archive *a, void *client_data, int64_t request)
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
diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index bfd4df8ad1..65b4649147 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -41,7 +41,8 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2025-5917.patch \
            file://0001-FILE-seeking-support-2539.patch \
            file://0001-Improve-lseek-handling-2564.patch \
-           file://CVE-2025-5918.patch \
+           file://CVE-2025-5918-01.patch \
+           file://CVE-2025-5918-02.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-- 
2.43.0


