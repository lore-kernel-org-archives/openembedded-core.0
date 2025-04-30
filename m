Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 572EAC3ABAA
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 02:54:27 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.8291.1745981657825528852
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 19:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MnOIlLE4;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-301a4d5156aso9320724a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 19:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745981657; x=1746586457; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6NmgpNueJyRmyWZ3mRJdK3/PU1Rsx+wCEbaQ1tHuMtk=;
        b=MnOIlLE4x7FbuMes/3k8+xBV+gsQtA04my2ota5hXF7UULU7nh6DPGyKqRAPq1IdRc
         gE+qZY6CU6VPrMYzbp8/O1U5fYWVNMUhAlevLcMDQ8GKLHXREmCm4Nf3PiqKFFwCacsV
         eyWRAYYXG7YjR2/Enrg5LrxkvHy/6Tt8COAdT1oao30EUpO9fUyN1++bmpQWzL1U+cI6
         YQNqmnmciHkAGO7IEhM0caxfNutC/Ayph1ny6lgYOrU347TlhtSVPiuPtUG1CmdbaTMh
         Lm6QJd7H0Vd2XXNgL20oMd0EMEQjsJkC1/R1WOwD3QARVSUU78DcrX8CESrrTJkKf0oT
         HgBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745981657; x=1746586457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6NmgpNueJyRmyWZ3mRJdK3/PU1Rsx+wCEbaQ1tHuMtk=;
        b=BeQYNU/rNLYL5XrwHctc0Kt6GOM3OPfR5h1tWlitZufm7ANRWqSxTYORjETYlgnKRr
         91TiTOUqHedE4K8I/+8RaTy31jxN0xe7nNrnJPekmmM9FjYafGuJsabI/sp/S1ib0j+F
         4KTfo//O1fh6sPYn6mQs5YRgK3u1sPnjMbdd+T5OQf2D+2kNjal4ELCTOu/2F12u+MSr
         h+VIXY2bXmmOTdszwRrLkqN0LSbsagnF5G4TghCwZuHKp4bxTmeWGIVtTMA4S/0EUjnn
         bAJSZ58dQH+xQn00Xu7u5aXyQEINOeq5n6lcpAF4g21OA/p5rgk5ZAZoLiMqAqYIRHWp
         7kjw==
X-Gm-Message-State: AOJu0YzFn+8/uqlFAZT9ydxq0Oj0Ov+03sUzlQy79kXSRYBTeOvICDAr
	Oa50SHxTPMaq/tZIzd2+ESXHQziakjP6CYlRpJUmnXcTzD/GUX2uiBLbiA8226oSie6npStw05S
	1
X-Gm-Gg: ASbGnctAYDfWk1obMuAhd9zLT/34OGRw0Gud2BNTlVrX6YwJC8sPiokJok3alaRqPQI
	PksWaQs1nfjzcN4zsGr2hhcNLwuvjY/Ov4JL41gx0g80CcxSwMNzVtaVFFmnVcwu06kRtJvAk5L
	XE2al3Pm36KWvO1Fme2H8gq5FGOopah1rOS2sY6kR4SQZIVqxFsFq6ba5U8KntFLyE4a/MTNqq5
	5PNmHtENxadtx7qXZt4vli9ySQvv1jw/IiwNc7Ao2wRsOjvf4bUpOxgHkI9Ncsr6sjwm1rsgWLG
	0LkOgHBBiA/t+cWqD5/GGCDihTx2XBnwopBqB3sVsA==
X-Google-Smtp-Source: AGHT+IFfxJWbeyyCSqur3tI8XY/9Fg9CkGrtPwWpCiE7t4EpIja14Brq6THs9p6PTdfShxn5mQhOUg==
X-Received: by 2002:a17:90b:1f8b:b0:2fe:a614:5cf7 with SMTP id 98e67ed59e1d1-30a332d5b79mr1880836a91.3.1745981656963;
        Tue, 29 Apr 2025 19:54:16 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34b:e5e0:c38a:7e03])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34a2ea46sm347852a91.31.2025.04.29.19.54.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 19:54:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/14] systemd: backport patch to fix journal issue
Date: Tue, 29 Apr 2025 19:53:37 -0700
Message-ID: <ea59aed1ff7dbfb28d1e2cd55adca80dad2502e2.1745981510.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745981510.git.steve@sakoman.com>
References: <cover.1745981510.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 02:54:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215703

From: Chen Qi <Qi.Chen@windriver.com>

Backport a patch to fix systemd journal issue about
sd_journal_next not behaving correctly after sd_journal_seek_tail.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...journal_previous-next-return-0-at-HE.patch | 87 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_250.14.bb   |  1 +
 2 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-journal-Make-sd_journal_previous-next-return-0-at-HE.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-journal-Make-sd_journal_previous-next-return-0-at-HE.patch b/meta/recipes-core/systemd/systemd/0001-journal-Make-sd_journal_previous-next-return-0-at-HE.patch
new file mode 100644
index 0000000000..17e83448e3
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-journal-Make-sd_journal_previous-next-return-0-at-HE.patch
@@ -0,0 +1,87 @@
+From e8d0681eb49697d91f277e2f9f4cff32a30b316c Mon Sep 17 00:00:00 2001
+From: Daan De Meyer <daan.j.demeyer@gmail.com>
+Date: Tue, 5 Jul 2022 15:22:01 +0200
+Subject: [PATCH] journal: Make sd_journal_previous/next() return 0 at
+ HEAD/TAIL
+
+Currently, both these functions don't return 0 if we're at HEAD/TAIL
+and move in the corresponding direction. Let's fix that.
+
+Replaces #23480
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/977ad21b5b8f6323515297bd8995dcaaca0905df]
+
+[Rebased for v250]
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/journal/test-journal-interleaving.c | 4 ++++
+ src/libsystemd/sd-journal/sd-journal.c  | 8 ++++----
+ 2 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/src/journal/test-journal-interleaving.c b/src/journal/test-journal-interleaving.c
+index c543b87b69..f0ed1b4c74 100644
+--- a/src/journal/test-journal-interleaving.c
++++ b/src/journal/test-journal-interleaving.c
+@@ -158,6 +158,7 @@ static void test_skip(void (*setup)(void)) {
+          */
+         assert_ret(sd_journal_open_directory(&j, t, 0));
+         assert_ret(sd_journal_seek_head(j));
++        assert_ret(sd_journal_previous(j) == 0);
+         assert_ret(sd_journal_next(j));
+         test_check_numbers_down(j, 4);
+         sd_journal_close(j);
+@@ -166,6 +167,7 @@ static void test_skip(void (*setup)(void)) {
+          */
+         assert_ret(sd_journal_open_directory(&j, t, 0));
+         assert_ret(sd_journal_seek_tail(j));
++        assert_ret(sd_journal_next(j) == 0);
+         assert_ret(sd_journal_previous(j));
+         test_check_numbers_up(j, 4);
+         sd_journal_close(j);
+@@ -174,6 +176,7 @@ static void test_skip(void (*setup)(void)) {
+          */
+         assert_ret(sd_journal_open_directory(&j, t, 0));
+         assert_ret(sd_journal_seek_tail(j));
++        assert_ret(sd_journal_next(j) == 0);
+         assert_ret(r = sd_journal_previous_skip(j, 4));
+         assert_se(r == 4);
+         test_check_numbers_down(j, 4);
+@@ -183,6 +186,7 @@ static void test_skip(void (*setup)(void)) {
+          */
+         assert_ret(sd_journal_open_directory(&j, t, 0));
+         assert_ret(sd_journal_seek_head(j));
++        assert_ret(sd_journal_previous(j) == 0);
+         assert_ret(r = sd_journal_next_skip(j, 4));
+         assert_se(r == 4);
+         test_check_numbers_up(j, 4);
+diff --git a/src/libsystemd/sd-journal/sd-journal.c b/src/libsystemd/sd-journal/sd-journal.c
+index 7a6cc4aca3..04cafdf1c8 100644
+--- a/src/libsystemd/sd-journal/sd-journal.c
++++ b/src/libsystemd/sd-journal/sd-journal.c
+@@ -611,9 +611,9 @@ static int find_location_for_match(
+                 /* FIXME: missing: find by monotonic */
+ 
+                 if (j->current_location.type == LOCATION_HEAD)
+-                        return journal_file_next_entry_for_data(f, dp, DIRECTION_DOWN, ret, offset);
++                        return direction == DIRECTION_DOWN ? journal_file_next_entry_for_data(f, dp, DIRECTION_DOWN, ret, offset) : 0;
+                 if (j->current_location.type == LOCATION_TAIL)
+-                        return journal_file_next_entry_for_data(f, dp, DIRECTION_UP, ret, offset);
++                        return direction == DIRECTION_UP ? journal_file_next_entry_for_data(f, dp, DIRECTION_UP, ret, offset) : 0;
+                 if (j->current_location.seqnum_set && sd_id128_equal(j->current_location.seqnum_id, f->header->seqnum_id))
+                         return journal_file_move_to_entry_by_seqnum_for_data(f, dp, j->current_location.seqnum, direction, ret, offset);
+                 if (j->current_location.monotonic_set) {
+@@ -704,9 +704,9 @@ static int find_location_with_matches(
+                 /* No matches is simple */
+ 
+                 if (j->current_location.type == LOCATION_HEAD)
+-                        return journal_file_next_entry(f, 0, DIRECTION_DOWN, ret, offset);
++                        return direction == DIRECTION_DOWN ? journal_file_next_entry(f, 0, DIRECTION_DOWN, ret, offset) : 0;
+                 if (j->current_location.type == LOCATION_TAIL)
+-                        return journal_file_next_entry(f, 0, DIRECTION_UP, ret, offset);
++                        return direction == DIRECTION_UP ? journal_file_next_entry(f, 0, DIRECTION_UP, ret, offset) : 0;
+                 if (j->current_location.seqnum_set && sd_id128_equal(j->current_location.seqnum_id, f->header->seqnum_id))
+                         return journal_file_move_to_entry_by_seqnum(f, j->current_location.seqnum, direction, ret, offset);
+                 if (j->current_location.monotonic_set) {
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/systemd/systemd_250.14.bb b/meta/recipes-core/systemd/systemd_250.14.bb
index ef0476fad9..b79284d79c 100644
--- a/meta/recipes-core/systemd/systemd_250.14.bb
+++ b/meta/recipes-core/systemd/systemd_250.14.bb
@@ -29,6 +29,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-nspawn-make-sure-host-root-can-write-to-the-uidmappe.patch \
            file://fix-vlan-qos-mapping.patch \
            file://0001-core-fix-build-when-seccomp-is-off.patch \
+           file://0001-journal-Make-sd_journal_previous-next-return-0-at-HE.patch \
            "
 
 # patches needed by musl
-- 
2.43.0


