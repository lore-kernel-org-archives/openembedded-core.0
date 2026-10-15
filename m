Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E13CC6B3D
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:04:14 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32847.1792040650836795597
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:04:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HCVHrLRR;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so38668945e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040649; x=1792645449; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aXl+HBhqmQf9ZN1CIhCQfojMTMy0xECyOdPzzFQ1f8A=;
        b=HCVHrLRRgOTJtCrmqgOF97R1CdR81tN6B6gtNX1gGl7BylOzDveFmcFgFiXw7kMzjh
         Gp76NKnBjSlmPKThPMb4XlWGrbXMS4dfFy9O6kZxJF73YBYU9o3fg6jZ8SznYkctYQ9U
         uIOlryiuA6XAluQiFku+I2A9zzdxb5keeF+r0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040649; x=1792645449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aXl+HBhqmQf9ZN1CIhCQfojMTMy0xECyOdPzzFQ1f8A=;
        b=11Zhju9ByNmrG2Zxed0jiUYRrItPlDdjv2Tnf5O6q/mE8RWDlRipbhp01kTQ8rAy6D
         sgwrj/E921j44pI0229kvKUoJtXcsjC8UYYcRhNZEtaS160aAsBLxioQohlou4Yjne77
         xmloG/FEGh5YibnNAZPNmoDMd36T+ra/Dlol8wX9KO7dyMFruhwly5OgOqIKxiv5b1kH
         kUNFeGAXSSGDaSH/uJSVcP4qdZ31viz/K5ytuPDcqD5NNJKrb/bvOyk4QfnpE2/R4uCv
         c4tYjl+HtmuI3cWIM3paMSCLEteUgXbyV/q+HyymySlrUyOOJkrXUHf3Wo0BAmJ3FHE4
         TTew==
X-Gm-Message-State: AFq9FYKjzA9DJRWmNvZ7EZfJXwisBlM65nKXTOTbEiVbtsKjuzKOEe4+
	XQOwZ4+96z5ZeXYspDgWNQ8Y9xT3Pdav4Vb4KfTAR/0f/KWsz46I1SF4SbXHbkQT4LvJv9HZ+Ib
	R7CdHRsw=
X-Gm-Gg: AYBFou1dgCqfV6uraIWO5zm3WC9ilz0+Mxx/K6vaSgzjE3mmlLT3rCYnD96oxFy/m6D
	6VgpQwLAIVoZdjGwXYGSs6pecRuDc3UeLwMPJMN6GlzcOSAbkCqz7Z12Cxp+9P3lm3z1pRYIcfD
	dR+6O6XHCiR0SDuY3k1MSs1592+8bRikbDoAkuFsL9gF8tWeiNfjHfdkO7VEu7jpQAuS6yfUP8M
	9LsTED8W0ksTLRXbYhnAFG8yWt/TLwiu47LCndwYMXgWv5pgtRc8ZTYsSGIGRC3fAHgCNdiW5UX
	ugukv9bGMjt0ELj56X8H8xbD7jT3i7HFmG/42tL/C7fRuFiOSUysEF7EEtBj8yQl/rvV7xLUMia
	3qFBCatDfBU5X3u0eDusEnhZHBLKXBZLVBuLxQSQZfNu0btR5BaJccdPFgXK025TM4TjWCBLo4/
	xgjwLlYk2yiP1oaWpLWNMIXfPiWmqNFAqpIOpR3+UFEWXF3YNOtGFv55pi+a8YDgsKTi0HBPbsR
	4g5Xk0m9wqakLQIfDRv54fBun8OtahGKEhmWB8PHLHh1AI9WZouCkamkQqXP4pb8PzQ4nwN1g==
X-Received: by 2002:a05:600c:8b58:b0:49f:bcce:13f5 with SMTP id 5b1f17b1804b1-4a18e4ca287mr326402365e9.24.1792040647653;
        Wed, 14 Oct 2026 22:04:07 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.04.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:04:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 44/55] systemd: replace a bunch of assert() with friendlier checks
Date: Thu, 15 Oct 2026 07:03:07 +0200
Message-ID: <5a949112ac0d8baecc3da1ef7b20c3af9da4d1db.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:04:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247842

From: Suresh H A <Suresh.HA@bmwtechworks.in>

Backport a patch that replaces a bunch of assert() with friendlier checks
Fix is already available since systemd v258-rc1.

Journal file contents can change or be inconsistent on disk, so they
must not be checked with assert(). We hit this on systemd 255.21, where
dlt-system aborted in sd-journal:

  dlt-system[1284]: Assertion 'd->object.type == OBJECT_DATA' failed at
  src/libsystemd/sd-journal/journal-file.c:3237,
  function generic_array_bisect_for_data(). Aborting.

generic_array_bisect_for_data() received a data object whose object.type
was not OBJECT_DATA, and the assert aborted the whole process.

The patch replaces these asserts with
"if (type != expected) return -EBADMSG;" in bump_entry_array(),
generic_array_bisect_for_data() and the journal_file_move_to_entry_*_for_data()
functions. A bad object is then reported as an error to the caller instead of
aborting it.

Signed-off-by: Suresh H A <Suresh.HA@bmwtechworks.in>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...a-bunch-of-assert-with-friendlier-ch.patch | 108 ++++++++++++++++++
 meta/recipes-core/systemd/systemd_255.22.bb   |   1 +
 2 files changed, 109 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0023-journal-replace-a-bunch-of-assert-with-friendlier-ch.patch

diff --git a/meta/recipes-core/systemd/systemd/0023-journal-replace-a-bunch-of-assert-with-friendlier-ch.patch b/meta/recipes-core/systemd/systemd/0023-journal-replace-a-bunch-of-assert-with-friendlier-ch.patch
new file mode 100644
index 00000000000..aa78f4d797d
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0023-journal-replace-a-bunch-of-assert-with-friendlier-ch.patch
@@ -0,0 +1,108 @@
+From 5ee8b3edb385b216eb4f3316323ae1287824971a Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Thu, 5 Jun 2025 22:26:03 +0200
+Subject: [PATCH] journal: replace a bunch of assert() with friendlier checks
+
+We should not rely that data stored in the journal files remains
+entirely untouched at all times. Because we unallocate files, data might
+go away any time. Hence, never assert() on any expectations on what the
+file contains. Instead, handle it more gracefully as a corruption issue,
+and return EBADMSG.
+
+Fixes: #35229 #32436
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/pull/37757/commits/5ee8b3edb385b216eb4f3316323ae1287824971a]
+
+Signed-off-by: Suresh H A <Suresh.HA@bmwtechworks.in>
+---
+ src/libsystemd/sd-journal/journal-file.c | 28 ++++++++++++++++++------
+ 1 file changed, 21 insertions(+), 7 deletions(-)
+
+diff --git a/src/libsystemd/sd-journal/journal-file.c b/src/libsystemd/sd-journal/journal-file.c
+index fecddb932f..acceea7770 100644
+--- a/src/libsystemd/sd-journal/journal-file.c
++++ b/src/libsystemd/sd-journal/journal-file.c
+@@ -2740,7 +2740,9 @@ static int bump_entry_array(
+ 
+         if (direction == DIRECTION_DOWN) {
+                 assert(o);
+-                assert(o->object.type == OBJECT_ENTRY_ARRAY);
++
++                if (o->object.type != OBJECT_ENTRY_ARRAY)
++                        return -EBADMSG;
+ 
+                 *ret = le64toh(o->entry_array.next_entry_array_offset);
+         } else {
+@@ -3241,9 +3243,11 @@ static int generic_array_bisect_for_data(
+ 
+         assert(f);
+         assert(d);
+-        assert(d->object.type == OBJECT_DATA);
+         assert(test_object);
+ 
++        if (d->object.type != OBJECT_DATA)
++                return -EBADMSG;
++
+         n = le64toh(d->data.n_entries);
+         if (n <= 0)
+                 return 0;
+@@ -3609,9 +3613,11 @@ int journal_file_move_to_entry_for_data(
+ 
+         assert(f);
+         assert(d);
+-        assert(d->object.type == OBJECT_DATA);
+         assert(IN_SET(direction, DIRECTION_DOWN, DIRECTION_UP));
+ 
++        if (d->object.type != OBJECT_DATA)
++                return -EBADMSG;
++
+         /* FIXME: fix return value assignment. */
+ 
+         /* This returns the first (when the direction is down, otherwise the last) entry linked to the
+@@ -3671,7 +3677,9 @@ int journal_file_move_to_entry_by_offset_for_data(
+ 
+         assert(f);
+         assert(d);
+-        assert(d->object.type == OBJECT_DATA);
++
++        if (d->object.type != OBJECT_DATA)
++                return -EBADMSG;
+ 
+         return generic_array_bisect_for_data(
+                         f,
+@@ -3697,7 +3705,9 @@ int journal_file_move_to_entry_by_monotonic_for_data(
+ 
+         assert(f);
+         assert(d);
+-        assert(d->object.type == OBJECT_DATA);
++
++        if (d->object.type != OBJECT_DATA)
++                return -EBADMSG;
+ 
+         /* First, pin the given data object, before reading the _BOOT_ID= data object below. */
+         r = journal_file_pin_object(f, d);
+@@ -3763,7 +3773,9 @@ int journal_file_move_to_entry_by_seqnum_for_data(
+ 
+         assert(f);
+         assert(d);
+-        assert(d->object.type == OBJECT_DATA);
++
++        if (d->object.type != OBJECT_DATA)
++                return -EBADMSG;
+ 
+         return generic_array_bisect_for_data(
+                         f,
+@@ -3783,7 +3795,9 @@ int journal_file_move_to_entry_by_realtime_for_data(
+ 
+         assert(f);
+         assert(d);
+-        assert(d->object.type == OBJECT_DATA);
++
++        if (d->object.type != OBJECT_DATA)
++                return -EBADMSG;
+ 
+         return generic_array_bisect_for_data(
+                         f,
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/systemd/systemd_255.22.bb b/meta/recipes-core/systemd/systemd_255.22.bb
index 3c5e59542bf..84d41a86c9b 100644
--- a/meta/recipes-core/systemd/systemd_255.22.bb
+++ b/meta/recipes-core/systemd/systemd_255.22.bb
@@ -38,6 +38,7 @@ SRC_URI += " \
            file://CVE-2026-29111-03.patch \
            file://CVE-2026-29111-04.patch \
            file://CVE-2026-4105.patch \
+           file://0023-journal-replace-a-bunch-of-assert-with-friendlier-ch.patch \
            "
 
 # patches needed by musl

