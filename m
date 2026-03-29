Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A753FC9814
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 22:38:19 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38625.1774823893269265769
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 15:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FKMSnz6Z;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439c56e822eso4226964f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 15:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774823891; x=1775428691; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D4ZyTCSo7Fp4GsJZT1B18oMoyKG3O3t8R4ztEVjHDGI=;
        b=FKMSnz6ZYO+kMUbsr2ZnOAB1iCwkSjPuSx7b7kzth4S0xHAnk9YWmdoaY/npRzzRMZ
         T64zr37R6/1b8mWd6qBj+INUCufi4yW8QGT9PwUtbyxHxebdNRSLsbkVWId/h6V7FWrn
         YzQPI4zcXxDtMZR+0bdpXaOsR3458ZRTonpuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774823891; x=1775428691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D4ZyTCSo7Fp4GsJZT1B18oMoyKG3O3t8R4ztEVjHDGI=;
        b=bvmvS+1+w56kXMgdyAy64lKrgt5RMDecKRUXR8OuHPwS7OtHrJV5+gHcsC+mjXxq4I
         wBWvRls1lkZwDXA7hxkO8DbKjwwFGrDUZEuUAid55hvcxPyd4AD1cZCPYAnaNCi/AFcR
         aj1odC8cNgyfW7for/4YsnvdFb0o/Y2BL7n56wsMRii/sa4eES9rlFFk9MFSGY08FPqr
         Zv/k4qzMvrGLNHdXwq/3UeENNetLLDEA5BJMN6SlW4WfKT6qtXko8N/NifuNwSE4bUda
         xWgtssI8NE+XZe5Fbs0yQc67A+rilfFP9+tV7hltMGQvv/i3WPGN3T+AA4CBSTcwBQ0C
         I16g==
X-Gm-Message-State: AOJu0YwPqpAEN1KlEY9qwyX3kJYyibZBx3OI4q5WcYawJFi7AbhUoCKA
	+V9r6fEz7xm02DsM6tUpNImNRl9gcdSSN/t80lwkKvyTCWKbay4M8JfSfvamlA8BuGqhrXKi1NA
	BVw+XHAA=
X-Gm-Gg: ATEYQzx/yKI5+OFSqK0ADpp6SHc+3gwW477CYg/Ya51fErff7bx65io7AquRAZbfiSh
	GA70EyXIDsz7x6IKYXcTUip34b6A9AQTapp9b3n6uEng3A1tkTd3v+yVz1MfCYaMg9uEkLDzGn6
	mcrv6kLu6ZxNeyuf4cj0NY66IY5gOoLX9bqwVB2Ae6n2FzcBb03iEYChwXv8FHIWOFSxdDXJrjU
	uVoXiGkzuf4Vi2jCxoOnfeZJp41A7DIXjnx3i+2vYD6cmZiXpZWFHckbPS8LYS10yfH4GEXw6Z2
	9yJbbmmoLMNMbcZSSqQ5QXy2QhQEVUXAYTrdOS3dHpzuB3/xQptx1LA9Z7/ymnodbx65vLDf+qZ
	67Yqbc+D86rkJeSjQlOhCt7B+x1+uoQmGIdq3w3+j/Dw/2Sfpywu5f4AieC7JUJ30cGtdMn/7Ej
	ChfDpghKhXW7IKhLSA/sowGtR2scjb//aZBuLLoZMA1aU9y0BU7kcWDRStnt4NLqCcY4WUkvAb6
	j83VnUGRUgmdH+YerRRRS8k4m0=
X-Received: by 2002:a05:6000:2210:b0:439:c2b6:d5d8 with SMTP id ffacd0b85a97d-43b9eaaeae8mr17224900f8f.36.1774823891285;
        Sun, 29 Mar 2026 15:38:11 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2471ee2sm13038542f8f.29.2026.03.29.15.38.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 15:38:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/16] systemd: backport patch to fix journal-file issue
Date: Mon, 30 Mar 2026 00:37:45 +0200
Message-ID: <5c63919aec50486f218123890585d791c0e45aab.1774823430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774823430.git.yoann.congal@smile.fr>
References: <cover.1774823430.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 22:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234171

From: sureshha <suresh.ha@bti.bmwgroup.com>

Backport patch to fix systemd journal-file assertion on removed or corrupted files

Extracted from systemd MR:
https://github.com/systemd/systemd/pull/40378

Signed-off-by: sureshha <suresh.ha@bmwtechworks.in>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...not-trigger-assertion-on-removed-or-.patch | 65 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_255.21.bb   |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0023-journal-file-do-not-trigger-assertion-on-removed-or-.patch

diff --git a/meta/recipes-core/systemd/systemd/0023-journal-file-do-not-trigger-assertion-on-removed-or-.patch b/meta/recipes-core/systemd/systemd/0023-journal-file-do-not-trigger-assertion-on-removed-or-.patch
new file mode 100644
index 00000000000..5f5551870ac
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0023-journal-file-do-not-trigger-assertion-on-removed-or-.patch
@@ -0,0 +1,65 @@
+From 1350f39db7e72116c3b2423db02da3ddc8e29082 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Sun, 18 Jan 2026 19:15:31 +0900
+Subject: [PATCH] journal-file: do not trigger assertion on removed or
+ corrupted journal file
+
+When a journal file is removed or corrupted, then the value `p`, which is
+read from Object.data.entry_offset, may be zero.
+
+Note, journal_file_move_to_object() checks the passed offset and return
+-EBADMSG if it is invalid.
+
+Fixes the issue reported at
+https://github.com/systemd/systemd/pull/40372#issuecomment-3762907261.
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/2185c30de333b09f46ef28b743b123f45e774738]
+
+Comment: Patch is refreshed as per codebase of v255
+
+Signed-off-by: sureshha <suresh.ha@bmwtechworks.in>
+---
+ src/libsystemd/sd-journal/journal-file.c | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/src/libsystemd/sd-journal/journal-file.c b/src/libsystemd/sd-journal/journal-file.c
+index 08f3b82..633de5b 100644
+--- a/src/libsystemd/sd-journal/journal-file.c
++++ b/src/libsystemd/sd-journal/journal-file.c
+@@ -3305,7 +3305,9 @@ use_extra:
+
+ static int test_object_offset(JournalFile *f, uint64_t p, uint64_t needle) {
+         assert(f);
+-        assert(p > 0);
++
++        if (p <= 0)
++                return -EBADMSG;
+
+         if (p == needle)
+                 return TEST_FOUND;
+@@ -3341,7 +3343,6 @@ static int test_object_seqnum(JournalFile *f, uint64_t p, uint64_t needle) {
+         int r;
+
+         assert(f);
+-        assert(p > 0);
+
+         r = journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
+         if (r < 0)
+@@ -3382,7 +3383,6 @@ static int test_object_realtime(JournalFile *f, uint64_t p, uint64_t needle) {
+         int r;
+
+         assert(f);
+-        assert(p > 0);
+
+         r = journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
+         if (r < 0)
+@@ -3423,7 +3423,6 @@ static int test_object_monotonic(JournalFile *f, uint64_t p, uint64_t needle) {
+         int r;
+
+         assert(f);
+-        assert(p > 0);
+
+         r = journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
+         if (r < 0)
+--
+2.34.1
diff --git a/meta/recipes-core/systemd/systemd_255.21.bb b/meta/recipes-core/systemd/systemd_255.21.bb
index 87e186bbfac..504d6cbef60 100644
--- a/meta/recipes-core/systemd/systemd_255.21.bb
+++ b/meta/recipes-core/systemd/systemd_255.21.bb
@@ -29,6 +29,7 @@ SRC_URI += " \
            file://0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0003-timedated-Respond-on-org.freedesktop.timedate1.SetNT.patch \
            file://0008-implment-systemd-sysv-install-for-OE.patch \
+           file://0023-journal-file-do-not-trigger-assertion-on-removed-or-.patch \
            "
 
 # patches needed by musl

