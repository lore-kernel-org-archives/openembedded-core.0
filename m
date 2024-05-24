Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F89C25B7A
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 12:14:41 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.14310.1716552875006590435
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 May 2024 05:14:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Mwi+FWnJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f332528c1aso19889785ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 05:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1716552874; x=1717157674; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9jhEEo6EQQKr5b1N59XdtBMTk5f2s9+y6R4sQBL6hLQ=;
        b=Mwi+FWnJ4oi4pZk18uqEAVVSU7LvWbc69OtFz0hHsLguFwj0LPTSCVAOXQuph+aeiF
         GuCXj3bBXC4AWpieHZSuRh45MdM76wEjhi8AbIfowQMTdIIxbXqp/AAhjEHTmlhQdon/
         9Hsgg0JSP+YRr+GnCMI4Qkj9C5wJHIAlNd55/xID+ouRYE0dFPw5hu6sHMuU8mJYaY6C
         vHCyrLiViSHrweCE/AunET+kigitvsODyr9GynpAiP+EgQTYA3cpgKofR8jTemII9vMP
         OCHQe9PEBxCC4vVh9w7xOgrlOksJNYNkd98LRAi9HfNG9wZK2kGjNzIeeIiQArlg1NF+
         nFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716552874; x=1717157674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9jhEEo6EQQKr5b1N59XdtBMTk5f2s9+y6R4sQBL6hLQ=;
        b=TWt/5UJZxbOg9XGmssQVia9wnTA/UGTPSmE5k5tbd+3JG9GrUoUdVNggFkVGXgw3F6
         E7ACqinPW08hCK2l8zZ3REyTn8igiXbF6NOXoxdTVPqDIps6buxDW7Xc/RfxCRI0/MAk
         9IcVJmHR+f/dbBWoG/Y9nrxQwW13J2FY6WukIy+g+Y6iRbwPIUurmdtjAdQztB5It1fm
         Sig7f+xhVHmZdjmRSojdMr3dGG/7UZDrpLecQ51mzun4D0qABhNA8a3BlB6sAiA0xJcW
         FNQ+oQNKVYG6wDBx0SleKlVE4P+SGyjtpTw/qF3HM0WoJijuHYR2TffBp5TndMwC+ugW
         JhYw==
X-Gm-Message-State: AOJu0YykvhutmCnUqmAeSse4EDRKLFV6z9q7PZUhiPUVTw6NT3QPonuY
	Y8yTJkFqi/i1F0/d49nEqcNMvTJe1rhRHWEIM00zgoZbaY3cciRBiL8agJDYstMf+xdDctfsaSh
	T
X-Google-Smtp-Source: AGHT+IGTFAWjPzNclp2ltQeteBI0A9Wv+4uUMthNmB+w/WrQlbzWtteym0KyHV53fbKlexQjYtpIsQ==
X-Received: by 2002:a17:902:f54d:b0:1f3:11bc:20b5 with SMTP id d9443c01a7336-1f44874038emr22552965ad.23.1716552874197;
        Fri, 24 May 2024 05:14:34 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c9a5388sm12592845ad.220.2024.05.24.05.14.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 05:14:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/8] libarchive: fix CVE-2024-26256
Date: Fri, 24 May 2024 05:14:17 -0700
Message-Id: <1ee5ba41cab2ce490fa0ddf67b83f57af1206c35.1716552687.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716552687.git.steve@sakoman.com>
References: <cover.1716552687.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 12:14:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199843

From: Yogita Urade <yogita.urade@windriver.com>

libarchive Remote Code Execution Vulnerability

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-26256
https://bugzilla.suse.com/show_bug.cgi?id=CVE-2024-26256

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libarchive/CVE-2024-26256.patch           | 29 +++++++++++++++++++
 .../libarchive/libarchive_3.6.2.bb            |  5 ++--
 2 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2024-26256.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2024-26256.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2024-26256.patch
new file mode 100644
index 0000000000..717a31f0e1
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2024-26256.patch
@@ -0,0 +1,29 @@
+From eb7939b24a681a04648a59cdebd386b1e9dc9237 Mon Sep 17 00:00:00 2001
+From: Wei-Cheng Pan <legnaleurc@gmail.com>
+Date: Tue, 14 May 2024 08:50:44 +0000
+Subject: [PATCH] fix: OOB in rar e8 filter (#2135) This patch fixes an
+ out-of-bound error in rar e8 filter.
+
+CVE: CVE-2024-26256
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/eb7939b24a681a04648a59cdebd386b1e9dc9237]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ libarchive/archive_read_support_format_rar.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/archive_read_support_format_rar.c
+index 793e8e9..b8397d0 100644
+--- a/libarchive/archive_read_support_format_rar.c
++++ b/libarchive/archive_read_support_format_rar.c
+@@ -3624,7 +3624,7 @@ execute_filter_e8(struct rar_filter *filter, struct rar_virtual_machine *vm, siz
+   uint32_t filesize = 0x1000000;
+   uint32_t i;
+
+-  if (length > PROGRAM_WORK_SIZE || length < 4)
++  if (length > PROGRAM_WORK_SIZE || length <= 4)
+     return 0;
+
+   for (i = 0; i <= length - 5; i++)
+--
+2.40.0
diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index 7d328a0060..c83eec9b1a 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -29,8 +29,9 @@ PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd,"
 EXTRA_OECONF += "--enable-largefile --without-iconv"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
-    file://0001-pax-writer-fix-multiple-security-vulnerabilities.patch \
-"
+           file://0001-pax-writer-fix-multiple-security-vulnerabilities.patch \
+           file://CVE-2024-26256.patch \
+           "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
 SRC_URI[sha256sum] = "ba6d02f15ba04aba9c23fd5f236bb234eab9d5209e95d1c4df85c44d5f19b9b3"
-- 
2.34.1


