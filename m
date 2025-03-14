Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC6E3C3DA4A
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 19:36:03 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.2790.1741980958397802777
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 12:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Q7HG2yOH;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22423adf751so40341515ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 12:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741980958; x=1742585758; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0xQx9g9vrnjZtQUiUBybHDlx54xXQkiVVvlB7/G7wfA=;
        b=Q7HG2yOHZn3hGT/S1SoR56cnwE60+1RAnE8kVbT/u81mr47OjFVskX4iu8OpmPazvY
         4FT+SFUHwNZNLKpWce34om587LMOEfKX7Ne4Q84NARzk5QIcZzrx61YUvlclW4Y9xPCV
         iziBX/g/N4bZ+etFtKK7t0pcw5UYccc7R2g006T4KHjNvbPR6g9kU/lJkliUKoP6J+o/
         wX8JJP/3Pd+xmcxsBvzrbwothQJ6vAtocT5hONOY9QbYCTpnYfcYIsfvewzs+3fjCyA6
         XS2C1gMXNt6tyT7GRqX+Zjuo3A+rjVhtnDmFv1Hlqn9aEATD8+JbVsVaKH5QO8m8A3q7
         +mMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741980958; x=1742585758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0xQx9g9vrnjZtQUiUBybHDlx54xXQkiVVvlB7/G7wfA=;
        b=oLEiGsLaE5OjzRpUZyPL+B4yUbs3ita8TF0sZM3wjd5yKOqIE9I2KfrL6aGBUr/uTO
         gibGvl2mTHjxq6RF/AqnJoi8XICs/GfmFH+0SNhtjSiHUIOkX13W+ecpbNeuzCCJhRic
         aJq2TUyjhmHCMkNC+nafJmMcOXUmpzAGV6pGGkLbO7eJSucBijiU62sXDa2zSO0QvR+H
         qSNjNYcUIkXOWc+gXtvH7fesdo41ypedyiz0Rr2JIRWko59MmIxu5qopLkT4tyebaYWM
         5axmEqaikwNH02vRuyDFZb+3DYa+883/JXMU5C+AzU0d/xlUMeWWUrJxvPaaBEZtpprc
         FGfw==
X-Gm-Message-State: AOJu0YxGjVycjAocoeAf78NT7RDI1YK8I7PrptAjURS36IGT9g+bm/Dy
	z1S3gNtVZsJLeCXbpjJweG0XoY2/6ktOsu0jMstvSICJqIsbrmRyHh+azbLKVyaaTWm+o1thVFD
	J
X-Gm-Gg: ASbGncuAFnVaJjkvD61DP9N3ot7aqyFIJQDhzWtNx01xQl5DSJVtMSlhLvgmXjRBjnt
	lnUx8HzgPJn0LZLM4u+OvYQyWszOcwF2lItLUM6tos3MGA5SfvJSEFkH6USQSnwPtn3vWYqzKXI
	6q/r/OwBwv7zea2/j2mqpkf2wTLER6grCfQQhVd/StcI1FojrKU7U4CvXiq5R+LKVe3R9C93Ihl
	wwH45KoAOtH3IL3DmaGPHPQ9YpKCC7Fe8nvd13+PKI5k56TCZByGirnNeSEZ4NtAGzVdGYe92gn
	XxJiFuTO8XGwZd3yI3aPgLLYnWQUvtWDXpQ8
X-Google-Smtp-Source: AGHT+IEz9s+ovpR+DrQCWJJl+bYkffNCmxP/7/ore5xJjARPMa5nS7VVBWs9ZsBNRdwt1AyRBKIafw==
X-Received: by 2002:a17:902:c406:b0:224:c47:cbd with SMTP id d9443c01a7336-225e08682b3mr43664415ad.0.1741980957645;
        Fri, 14 Mar 2025 12:35:57 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:6978:e88e:1ab7:676a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6d5dsm32265685ad.153.2025.03.14.12.35.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 12:35:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 1/4] libarchive: patch CVE-2025-1632 and CVE-2025-25724
Date: Fri, 14 Mar 2025 12:35:36 -0700
Message-ID: <a4ff82c789d50a3f411170636679ce46c8f84b25.1741980835.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741980835.git.steve@sakoman.com>
References: <cover.1741980835.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 19:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212860

From: Peter Marko <peter.marko@siemens.com>

Pick commit referencing this MR which was merged to master.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../CVE-2025-1632_CVE-2025-25724.patch        | 83 +++++++++++++++++++
 .../libarchive/libarchive_3.7.4.bb            |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-1632_CVE-2025-25724.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-1632_CVE-2025-25724.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-1632_CVE-2025-25724.patch
new file mode 100644
index 0000000000..459b664180
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2025-1632_CVE-2025-25724.patch
@@ -0,0 +1,83 @@
+From c9bc934e7e91d302e0feca6e713ccc38d6d01532 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Peter=20K=C3=A4stle?= <peter@piie.net>
+Date: Mon, 10 Mar 2025 16:43:04 +0100
+Subject: [PATCH] fix CVE-2025-1632 and CVE-2025-25724 (#2532)
+
+Hi,
+
+please find my approach to fix the CVE-2025-1632 and CVE-2025-25724
+vulnerabilities in this pr.
+As both error cases did trigger a NULL pointer deref (and triggered
+hopefully everywhere a coredump), we can safely replace the actual
+information by a predefined invalid string without breaking any
+functionality.
+
+CVE: CVE-2025-1632
+CVE: CVE-2025-25724
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/c9bc934e7e91d302e0feca6e713ccc38d6d01532]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---------
+
+Signed-off-by: Peter Kaestle <peter@piie.net>
+---
+ tar/util.c       |  5 ++++-
+ unzip/bsdunzip.c | 10 +++++++---
+ 2 files changed, 11 insertions(+), 4 deletions(-)
+
+diff --git a/tar/util.c b/tar/util.c
+index 3b099cb5..f3cbdf0b 100644
+--- a/tar/util.c
++++ b/tar/util.c
+@@ -748,7 +748,10 @@ list_item_verbose(struct bsdtar *bsdtar, FILE *out, struct archive_entry *entry)
+ #else
+ 	ltime = localtime(&tim);
+ #endif
+-	strftime(tmp, sizeof(tmp), fmt, ltime);
++	if (ltime)
++		strftime(tmp, sizeof(tmp), fmt, ltime);
++	else
++		sprintf(tmp, "-- -- ----");
+ 	fprintf(out, " %s ", tmp);
+ 	safe_fprintf(out, "%s", archive_entry_pathname(entry));
+ 
+diff --git a/unzip/bsdunzip.c b/unzip/bsdunzip.c
+index 7c8cafc3..4a9028b7 100644
+--- a/unzip/bsdunzip.c
++++ b/unzip/bsdunzip.c
+@@ -904,6 +904,7 @@ list(struct archive *a, struct archive_entry *e)
+ 	char buf[20];
+ 	time_t mtime;
+ 	struct tm *tm;
++	const char *pathname;
+ 
+ 	mtime = archive_entry_mtime(e);
+ 	tm = localtime(&mtime);
+@@ -912,22 +913,25 @@ list(struct archive *a, struct archive_entry *e)
+ 	else
+ 		strftime(buf, sizeof(buf), "%m-%d-%g %R", tm);
+ 
++	pathname = archive_entry_pathname(e);
++	if (!pathname)
++		pathname = "";
+ 	if (!zipinfo_mode) {
+ 		if (v_opt == 1) {
+ 			printf(" %8ju  %s   %s\n",
+ 			    (uintmax_t)archive_entry_size(e),
+-			    buf, archive_entry_pathname(e));
++			    buf, pathname);
+ 		} else if (v_opt == 2) {
+ 			printf("%8ju  Stored  %7ju   0%%  %s  %08x  %s\n",
+ 			    (uintmax_t)archive_entry_size(e),
+ 			    (uintmax_t)archive_entry_size(e),
+ 			    buf,
+ 			    0U,
+-			    archive_entry_pathname(e));
++			    pathname);
+ 		}
+ 	} else {
+ 		if (Z1_opt)
+-			printf("%s\n",archive_entry_pathname(e));
++			printf("%s\n", pathname);
+ 	}
+ 	ac(archive_read_data_skip(a));
+ }
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.4.bb b/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
index 80b2e49eac..156a6bdaae 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
@@ -34,6 +34,7 @@ SRC_URI += "file://configurehack.patch \
             file://CVE-2024-48957.patch \
             file://CVE-2024-48958.patch \
             file://CVE-2024-20696.patch \
+            file://CVE-2025-1632_CVE-2025-25724.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-- 
2.43.0


