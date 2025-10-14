Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B66C5CCD190
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 22:45:27 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.2592.1760481920577477640
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 15:45:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=s7DmcQqh;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b5579235200so3745768a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 15:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760481920; x=1761086720; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w1aXkrmHyxb5VpV+/KxlTxZT80ODHkka8Lm0KNSYaTM=;
        b=s7DmcQqhlsew3h5baENpECQ/BAPuhwads7H0hwU1x8YM4ngpnomWljEG/Ws7EHpFOr
         F54spTjax7UB42rRmamIKZbtcyAcD1Lr3MgpDQfapfFMMWObGUOpUQ6jnd5zSwI3kGei
         foQuzqvzMEbLfeBxtMfLEVyYNa547NRY0yKesTxZGGj39+eeZdQJCYafLxYL8tPer6uD
         6pFjW+tCdhxSTKeHCo6X/5EwZHFs9q6se4KYr3TcR5CofzUlOXwFGuRCJaPYNZ224Dkf
         1EiKzJlbjPtFZu8hxxO/Ou1qCh1I5DpUDRP0miXfRTjfPFGEeOaNz2lJd3nuGz5myVKg
         oWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760481920; x=1761086720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w1aXkrmHyxb5VpV+/KxlTxZT80ODHkka8Lm0KNSYaTM=;
        b=ZoZYeh/0yag5wxAA2k1LDsCI9Mr7T42awm5oQoiXm0lTwROaKxj4XafJNRpIxZA/8c
         9Ae8cerAjKAKPOzRWEZOqEf2ILDmJEsr6z7vZQ9LBe7OcP/P3gYwOc59WW+f0KZ8PojB
         0GNOp7WajY3K9PRRcbnyMPH8R+6OugmcjitYAunGZPNFAAL+QkiW3PYGIFKIL2Ik2fnn
         iGWClEA7aWVQTWz/NCKZY4YyY/osZ1ExIoryEZDygLPkmeWRHCubJe0AhmKwrrQCe8sq
         32zdUeFBwenYrHL3FmM5/oFssTJNcG+2dNy2V20ueHAlOiwilSaaBZsR2XErX9GjE/pj
         MZ0A==
X-Gm-Message-State: AOJu0Yzy5VDfZ2l7EZJBcw1iuL6UsJebu22f/eUR1fN9bHE42vBSLwx8
	WZWo66S393dY3cM5YZaJNqktLzzsRhbwG9D0dA/+6cz5ZwXDoIVMBxkDF5XVliu6v7VXg0XKClV
	9nWW7
X-Gm-Gg: ASbGncvoqcO544eysfIPMaXzGnzrb7AhuOCYc4bl8h//5VSwFkf8OUntOZvJVgNB4JY
	PBl3hfR85mGOeZPIsItsSs2gREL9p6lgjnx79xuY35Cqk2aMXUMph52Majvo867K/lkpBHvO0eX
	EY0nH9XTxR+KSceiKfAgkEzvkJitn+7q0RvOJS/4cawr1DKib0r+Xg/Dj/QLZ8GvrgkPK61ZN40
	Vzl54LOfwV+dUM9wf0v/Qj2Ya0n+q/G4zER7vheWrGSA8Q4/xpSQGsOw6DcRMfIdv5jBOjJLhjx
	XBA/4W2F2+Xfkl2FIia0NrE87jzuVWU9MnD5l28lyP7Dx6frzpZ7DyY4InH/EMCuHQCEPxo39Gj
	bPosOtrkRU3wmhsWAGbdS1nKd4c55mcvh
X-Google-Smtp-Source: AGHT+IEuqirCFBapRMpJCETf/iwBrsuPS9vNnryjPVZKN4h6rRXEHaqWSAfVEgeTEzoz4Psb0nOj+g==
X-Received: by 2002:a17:902:fc4f:b0:280:fe18:8479 with SMTP id d9443c01a7336-290272e0ac5mr287758835ad.51.1760481919826;
        Tue, 14 Oct 2025 15:45:19 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:ebea:520a:7699:bba7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e20479sm174847365ad.47.2025.10.14.15.45.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 15:45:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/14] glibc: : PTHREAD_COND_INITIALIZER compatibility with pre-2.41 versions (bug 32786)
Date: Tue, 14 Oct 2025 15:44:51 -0700
Message-ID: <8f1000d9dad5e51f08a40b0f6650204425cc8efb.1760481775.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760481775.git.steve@sakoman.com>
References: <cover.1760481775.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 22:45:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224868

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
  [1] https://sourceware.org/git/?p=glibc.git;a=commit;h=dbc5a50d12eff4cb3f782129029d04b8a76f58e7
  [2] https://sourceware.org/pipermail/libc-stable/2025-July/002282.html

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glibc/glibc/0026-PR25847-10.patch         | 54 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-10.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-10.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-10.patch
new file mode 100644
index 0000000000..99049d468a
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-10.patch
@@ -0,0 +1,54 @@
+From 4f78382dd671f381db6d1f452e6f1593d17b177e Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Tue, 14 Oct 2025 06:53:40 -0700
+Subject: [PATCH] nptl: PTHREAD_COND_INITIALIZER compatibility with pre-2.41
+ versions (bug 32786)
+
+The new initializer and struct layout does not initialize the
+__g_signals field in the old struct layout before the change in
+commit c36fc50781995e6758cae2b6927839d0157f213c ("nptl: Remove
+g_refs from condition variables").  Bring back fields at the end
+of struct __pthread_cond_s, so that they are again zero-initialized.
+
+The following commits have been cherry-picked from Glibc master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+commit: dbc5a50d12eff4cb3f782129029d04b8a76f58e7
+
+Upstream-Status: Submitted
+[https://sourceware.org/pipermail/libc-stable/2025-July/002282.html]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ sysdeps/nptl/bits/thread-shared-types.h | 2 ++
+ sysdeps/nptl/pthread.h                  | 2 +-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/sysdeps/nptl/bits/thread-shared-types.h b/sysdeps/nptl/bits/thread-shared-types.h
+index 6f17afa4..2354ea21 100644
+--- a/sysdeps/nptl/bits/thread-shared-types.h
++++ b/sysdeps/nptl/bits/thread-shared-types.h
+@@ -99,6 +99,8 @@ struct __pthread_cond_s
+   unsigned int __g1_orig_size;
+   unsigned int __wrefs;
+   unsigned int __g_signals[2];
++  unsigned int __unused_initialized_1;
++  unsigned int __unused_initialized_2;
+ };
+ 
+ typedef unsigned int __tss_t;
+diff --git a/sysdeps/nptl/pthread.h b/sysdeps/nptl/pthread.h
+index bbb36540..8d6d24ff 100644
+--- a/sysdeps/nptl/pthread.h
++++ b/sysdeps/nptl/pthread.h
+@@ -152,7 +152,7 @@ enum
+ 
+ 
+ /* Conditional variable handling.  */
+-#define PTHREAD_COND_INITIALIZER { { {0}, {0}, {0, 0}, 0, 0, {0, 0} } }
++#define PTHREAD_COND_INITIALIZER { { {0}, {0}, {0, 0}, 0, 0, {0, 0}, 0, 0 } }
+ 
+ 
+ /* Cleanup buffers */
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 26e8d8c408..1b5830699f 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -71,6 +71,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0026-PR25847-7.patch \
            file://0026-PR25847-8.patch \
            file://0026-PR25847-9.patch \
+           file://0026-PR25847-10.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.43.0


