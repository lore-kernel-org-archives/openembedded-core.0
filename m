Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D33C36004
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 04:39:11 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.4313.1742272746415245566
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 21:39:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jNhqRXwg;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-223f4c06e9fso86714005ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 21:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742272745; x=1742877545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V76gE1t15i7HtBeNxC7RLmZPcN5O/9N+2cvLc5uxWCw=;
        b=jNhqRXwgYeECN8m1JHX5mEo3z8CKywF47gpyJ1jJKm0WPzCdKjmU4LTjqUgyGqDNL3
         BQhc4o1yMd9MoKldqhkIPhkcKo4U+4shwp9dSIakBhheDIlbaAxMd7oGWD4zQVg69VhJ
         /w4R82NyK8t2Yp1LZO85lWkFY7fyprHqiv7eKYNU+hW2taM+p8RzWDVbirAxei8MUWMM
         3nTPsTEkA0LYESDi0kazXVVfjqquD4Q0YtZ+gbd/fO6xP7OziTX387noKRSTUb6dsWgZ
         SnEgI3R1N7JfReOwUFmgdvkAMLa0IN7evAzzgVlSg4PcFGMB4eyQwbroD7aJyL34lJdZ
         eIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742272745; x=1742877545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V76gE1t15i7HtBeNxC7RLmZPcN5O/9N+2cvLc5uxWCw=;
        b=LqPFc052rtuyfLEZBDBrlNirJup3W8ibBW5qNl47FdzMRgiIazKhsjBbqhzpBvzl1K
         KJVixFwlWLCS5ZpxC4FOvmmdP5OyN2JUK6QCYz9ChihH3DDUQEnByxGT/Htm57GGy8J+
         spo8h+6m82XspX0SDp5uUd12msqZ7Q/R+3EB32yWjQGGpPqLaf0xT55Qryd3YexRM/tb
         06PRPCva+b2A26mXFF6hAuhji3xjVFaINsTaDWhcTTUbqJukRPd6Ydw7BIDBI+RSViyc
         fwT1oAOByV0e566Tdyk/JuuiTuz3Hm51WjqAO7damR5RWgqIFi/NPcaLDKmU9KzsS7JX
         wj6Q==
X-Gm-Message-State: AOJu0YzQCy5fkJ8NLhKgM79GSV2YuxiDYSoMqn5vjURGUYA/PEyP6/OH
	btqkmVj/UTar9pDg+lJJZxhpKTQ0SY2rDHu9HKNttdf2kSV4FeqHTbHCFhNB
X-Gm-Gg: ASbGncvawKCYCMox5/BQHa88122h4PKyRpPRNzde3HOZDxo4xRTT5Ji+xHiAj7yFGBG
	NC7mnS2gT6d/Br9quNt4wD0S8iNWdvUJQUQ9zZ8J0fDPvJKqs7MIYs3ZZCPfkjPEnPjdQ8aCvB9
	p0Z4mAJyxIN2gGi3SAAAoUJklNy665uVdnMTGyCc90F2KzjMKFBmFrjZAcF5e5TRRmfIC/UlX78
	C0QEJsTWZaiKbiUpmZtZlo5F+x1s6v3mat+xDxyjLRqUxcdxLS45eHCWJHwNR7FkiTb8EfVPi99
	/HPScPn1QS2fADxFLfXnpA2AwYV6sWuFSU7y
X-Google-Smtp-Source: AGHT+IGtGcYTLNewb9G+s3cXatEb6ilx2MXsiJ1JL+qj1dKOZySXB+9izEbG3iRKLCWXEenZvIQ56w==
X-Received: by 2002:a17:903:2349:b0:215:58be:334e with SMTP id d9443c01a7336-2262c9b26ebmr21022215ad.10.1742272745551;
        Mon, 17 Mar 2025 21:39:05 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbc8c6sm84112375ad.160.2025.03.17.21.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:39:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 18/24] makedumpfile: Fix build with GCC-15
Date: Mon, 17 Mar 2025 21:38:38 -0700
Message-ID: <20250318043846.2422141-18-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318043846.2422141-1-raj.khem@gmail.com>
References: <20250318043846.2422141-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 04:39:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213152

fix gcc-15 compiling error: too many arguments to function eppic_init

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-compiling-error-too-many-arguments-.patch | 43 +++++++++++++++++++
 .../makedumpfile/makedumpfile_1.7.6.bb        |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-kernel/makedumpfile/makedumpfile/0001-PATCH-fix-gcc-15-compiling-error-too-many-arguments-.patch

diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile/0001-PATCH-fix-gcc-15-compiling-error-too-many-arguments-.patch b/meta/recipes-kernel/makedumpfile/makedumpfile/0001-PATCH-fix-gcc-15-compiling-error-too-many-arguments-.patch
new file mode 100644
index 00000000000..90f1b4038be
--- /dev/null
+++ b/meta/recipes-kernel/makedumpfile/makedumpfile/0001-PATCH-fix-gcc-15-compiling-error-too-many-arguments-.patch
@@ -0,0 +1,43 @@
+From 73e62a08022bf8e5edad250f8c1452f0be3771a3 Mon Sep 17 00:00:00 2001
+From: Coiby Xu <coxu@redhat.com>
+Date: Thu, 23 Jan 2025 17:47:10 +0800
+Subject: [PATCH] [PATCH] fix gcc-15 compiling error: too many arguments to function eppic_init
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=2340813
+
+When building makekdumpfile against gcc-15, the following error is
+shown,
+
+    erase_info.c: In function ‘process_eppic_file’:
+    erase_info.c:2226:13: error: too many arguments to function ‘eppic_init’; expected 0, have 1
+     2226 |         if (eppic_init(&eppic_cb)) {
+          |             ^~~~~~~~~~ ~~~~~~~~~
+    make: *** [Makefile:109: erase_info.o] Error 1
+
+Upstream-Status: Backport [https://github.com/makedumpfile/makedumpfile/commit/73e62a08022bf8e5edad250f8c1452f0be3771a3]
+
+Signed-off-by: Coiby Xu <coxu@redhat.com>
+Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
+---
+ erase_info.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/erase_info.c b/erase_info.c
+index cbe1681..af6bfae 100644
+--- a/erase_info.c
++++ b/erase_info.c
+@@ -2192,7 +2192,7 @@ process_eppic_file(char *name_config)
+ {
+ 	void *handle;
+ 	void (*eppic_load)(char *), (*eppic_unload)(char *);
+-	int (*eppic_init)();
++	int (*eppic_init)(struct call_back *);
+ 
+ 	/*
+ 	 * Dynamically load the eppic_makedumpfile.so library.
+-- 
+2.48.1
+
diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.6.bb b/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.6.bb
index 21847ece6b8..46be13e7d0f 100644
--- a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.6.bb
+++ b/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.6.bb
@@ -26,6 +26,7 @@ FILES:${PN}-tools = "${bindir}/*.pl"
 SRC_URI = "\
     git://github.com/makedumpfile/makedumpfile;branch=${SRCBRANCH};protocol=https \
     file://0001-makedumpfile-replace-hardcode-CFLAGS.patch \
+    file://0001-PATCH-fix-gcc-15-compiling-error-too-many-arguments-.patch \
 "
 
 S = "${WORKDIR}/git"

