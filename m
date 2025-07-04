Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D8B7C83F09
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 15:10:48 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.14463.1751641847321551658
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 08:10:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GKouSTAD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-73c17c770a7so1396261b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 08:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751641846; x=1752246646; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ncMR0oyeGhhz30FBN0mxvOGXXCXkcihQcttmLxO1GcA=;
        b=GKouSTADv8x9zF2PeOt4+v0ZCeH7sCdd//Bk9koVFEOz0Gc2v+t/o7SGBu66nUqRMN
         yT0ZBcPyHm6pm/CuEg70TOWftt4S5VWi3Zwrnkt3UnemBGhMFBnI9sjnuJbgGQBy5hpX
         fDkoKvu8cOR0C+ZwzBI/DZrb9dl+s72MMwp82TAi1DkYaMC/w03BdSnTBF3mHALTa7hX
         WD52gqrQlZdWBD9rEzryVJHOaQdM+5htgu7dT9cr1ZyoNFeqzRyFc3ir7Z/n03ulYcy2
         SG4ZvGe8FEi4s8wxSMBGFZzep8iVaLoFMY0QMQmUt/ynHJTTr4mINhW9XPB9YPePuMmI
         yZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751641846; x=1752246646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ncMR0oyeGhhz30FBN0mxvOGXXCXkcihQcttmLxO1GcA=;
        b=ea1oHUMb5lR5xCtaGQOry9x9VVWW6LXUo/xVS3xGS09SgiBckOsYzFSqJQ5sb/zUs1
         zBWJGAg+3hbSYsOQ2ElACDil7d6Qu8qNriIYK/5IeILjzeYOUYyxTNbzAMQA8g0Oq/xx
         qBX6pIX8a8V7Qphx885vlsfQBts7JCoyABDdufw7WO+SvHkvmq5sTfJggqEviZeAvUnu
         I02Umkk1nnBhoodq92TIk3twydBv6lVVfoh8NVfJYK+OdwXjKWqORNnrQ/rO8dybb/T/
         fVc2Lm6oIUHjB9gRdBjtugHMG293tec/sPJEzLCjMKzPDj87Gq2YX1/0yD4wv//oI+b6
         /2Bg==
X-Gm-Message-State: AOJu0YyFpK2TKKMeFCdnPrkmxrLG3WfL8IZUfeGDZkVz0iB4h/h5PXAj
	y2+j1iJbNoupfz9IXN3mTcmkNOGZ73a2AUQQgq2YyTrunv+K64ojyCAXObVy1JgQdi09QpfHC79
	Lb4Cp
X-Gm-Gg: ASbGncvnj8OVGkmsxuAv0DZ2+T/9WR4G3w/PlZvki21JMPq6KB1lbg0d8K7BMCVrac5
	Eq57vQbU9I7F6M2kNgC2+AC2ZGz88jlRq0CQlCnajcxvTf99LaTn4V+8OY70hOTNbngpEiHJwMW
	RUpHoLGBv1pcDPLWBjXgdhUyia/b4OH290PLR1FAjYUFAndZQPGgt7oTzoCO/k3wcdj5flF0PJs
	vt5ph14yBsm0fwJ5qpHXdGdaQrEvmtroBWkGwkn3qnH9zSoBypMiOXO90BkRUglEniDai6zlquo
	QwemI8a2wdwUNLWMVioggfgMvbp6P2utai0hpOH+QBCHzHR/K+neng==
X-Google-Smtp-Source: AGHT+IGV8JDeEYM5ZtRycEuSkMj3y6845yDX24Wyl7BqtBCm10PUGAPS6Yesqy0FdUW2qoebveC4/w==
X-Received: by 2002:a05:6a20:e687:b0:220:83e1:4996 with SMTP id adf61e73a8af0-2260c83932emr3502300637.28.1751641846496;
        Fri, 04 Jul 2025 08:10:46 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d985:cb7d:ae84:68cc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417e869sm2159592b3a.82.2025.07.04.08.10.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:10:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/11] libarchive: fix CVE-2025-5916
Date: Fri,  4 Jul 2025 08:10:26 -0700
Message-ID: <9c74d3a096fed68d173f8711b373a42f158d6cc7.1751641631.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751641631.git.steve@sakoman.com>
References: <cover.1751641631.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 15:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219929

From: Divya Chellam <divya.chellam@windriver.com>

A vulnerability has been identified in the libarchive library. This flaw
involves an integer overflow that can be triggered when processing a Web
Archive (WARC) file that claims to have more than INT64_MAX - 4 content
bytes. An attacker could craft a malicious WARC archive to induce this
overflow, potentially leading to unpredictable program behavior, memory
corruption, or a denial-of-service condition within applications that
process such archives using libarchive.

Reference:
https://security-tracker.debian.org/tracker/CVE-2025-5916

Upstream-patch:
https://github.com/libarchive/libarchive/commit/ef093729521fcf73fa4007d5ae77adfe4df42403

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libarchive/libarchive/CVE-2025-5916.patch | 116 ++++++++++++++++++
 .../libarchive/libarchive_3.7.9.bb            |   1 +
 2 files changed, 117 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5916.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-5916.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5916.patch
new file mode 100644
index 0000000000..a1dfc7b286
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5916.patch
@@ -0,0 +1,116 @@
+From ef093729521fcf73fa4007d5ae77adfe4df42403 Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <stoeckmann@users.noreply.github.com>
+Date: Mon, 7 Apr 2025 00:24:13 +0200
+Subject: [PATCH] warc: Prevent signed integer overflow (#2568)
+
+If a warc archive claims to have more than INT64_MAX - 4 content bytes,
+the inevitable failure to skip all these bytes could lead to parsing
+data which should be ignored instead.
+
+The test case contains a conversation entry with that many bytes and if
+the entry is not properly skipped, the warc implementation would read
+the conversation data as a new file entry.
+
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+
+CVE: CVE-2025-5916
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/ef093729521fcf73fa4007d5ae77adfe4df42403]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ Makefile.am                                   |  1 +
+ libarchive/archive_read_support_format_warc.c |  7 ++++--
+ libarchive/test/test_read_format_warc.c       | 24 +++++++++++++++++++
+ .../test_read_format_warc_incomplete.warc.uu  | 10 ++++++++
+ 4 files changed, 40 insertions(+), 2 deletions(-)
+ create mode 100644 libarchive/test/test_read_format_warc_incomplete.warc.uu
+
+diff --git a/Makefile.am b/Makefile.am
+index 9f3a6d1..7627ec5 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -964,6 +964,7 @@ libarchive_test_EXTRA_DIST=\
+ 	libarchive/test/test_read_format_ustar_filename_eucjp.tar.Z.uu \
+ 	libarchive/test/test_read_format_ustar_filename_koi8r.tar.Z.uu \
+ 	libarchive/test/test_read_format_warc.warc.uu \
++	libarchive/test/test_read_format_warc_incomplete.warc.uu \
+ 	libarchive/test/test_read_format_xar_doublelink.xar.uu \
+ 	libarchive/test/test_read_format_xar_duplicate_filename_node.xar.uu \
+ 	libarchive/test/test_read_format_zip.zip.uu \
+diff --git a/libarchive/archive_read_support_format_warc.c b/libarchive/archive_read_support_format_warc.c
+index fcec5bc..696f959 100644
+--- a/libarchive/archive_read_support_format_warc.c
++++ b/libarchive/archive_read_support_format_warc.c
+@@ -386,7 +386,8 @@ start_over:
+ 	case LAST_WT:
+ 	default:
+ 		/* consume the content and start over */
+-		_warc_skip(a);
++		if (_warc_skip(a) < 0)
++			return (ARCHIVE_FATAL);
+ 		goto start_over;
+ 	}
+ 	return (ARCHIVE_OK);
+@@ -439,7 +440,9 @@ _warc_skip(struct archive_read *a)
+ {
+ 	struct warc_s *w = a->format->data;
+ 
+-	__archive_read_consume(a, w->cntlen + 4U/*\r\n\r\n separator*/);
++	if (__archive_read_consume(a, w->cntlen) < 0 ||
++	    __archive_read_consume(a, 4U/*\r\n\r\n separator*/) < 0)
++		return (ARCHIVE_FATAL);
+ 	w->cntlen = 0U;
+ 	w->cntoff = 0U;
+ 	return (ARCHIVE_OK);
+diff --git a/libarchive/test/test_read_format_warc.c b/libarchive/test/test_read_format_warc.c
+index 91e6dc6..745aabf 100644
+--- a/libarchive/test/test_read_format_warc.c
++++ b/libarchive/test/test_read_format_warc.c
+@@ -78,3 +78,27 @@ DEFINE_TEST(test_read_format_warc)
+ 	assertEqualIntA(a, ARCHIVE_OK, archive_read_close(a));
+ 	assertEqualInt(ARCHIVE_OK, archive_read_free(a));
+ }
++
++DEFINE_TEST(test_read_format_warc_incomplete)
++{
++	const char reffile[] = "test_read_format_warc_incomplete.warc";
++	struct archive_entry *ae;
++	struct archive *a;
++
++	extract_reference_file(reffile);
++	assert((a = archive_read_new()) != NULL);
++	assertEqualIntA(a, ARCHIVE_OK, archive_read_support_filter_all(a));
++	assertEqualIntA(a, ARCHIVE_OK, archive_read_support_format_all(a));
++	assertEqualIntA(a, ARCHIVE_OK,
++	    archive_read_open_filename(a, reffile, 10240));
++
++	/* Entry cannot be parsed */
++	assertEqualIntA(a, ARCHIVE_FATAL, archive_read_next_header(a, &ae));
++
++	/* Verify archive format. */
++	assertEqualIntA(a, ARCHIVE_FILTER_NONE, archive_filter_code(a, 0));
++
++	/* Verify closing and resource freeing */
++	assertEqualIntA(a, ARCHIVE_OK, archive_read_close(a));
++	assertEqualInt(ARCHIVE_OK, archive_read_free(a));
++}
+diff --git a/libarchive/test/test_read_format_warc_incomplete.warc.uu b/libarchive/test/test_read_format_warc_incomplete.warc.uu
+new file mode 100644
+index 0000000..b91b97e
+--- /dev/null
++++ b/libarchive/test/test_read_format_warc_incomplete.warc.uu
+@@ -0,0 +1,10 @@
++begin 644 test_read_format_warc_incomplete.warc
++M5T%20R\Q+C`-"E=!4D,M5'EP93H@8V]N=F5R<VEO;@T*5T%20RU$871E.B`R
++M,#(U+3`S+3,P5#$U.C`P.C0P6@T*0V]N=&5N="U,96YG=&@Z(#DR,C,S-S(P
++M,S8X-30W-S4X,#<-"@T*5T%20R\Q+C`-"E=!4D,M5'EP93H@<F5S;W5R8V4-
++M"E=!4D,M5&%R9V5T+55223H@9FEL93HO+W)E861M92YT>'0-"E=!4D,M1&%T
++M93H@,C`R-2TP,RTS,%0Q-3HP,#HT,%H-"D-O;G1E;G0M5'EP93H@=&5X="]P
++M;&%I;@T*0V]N=&5N="U,96YG=&@Z(#,X#0H-"E1H92!R96%D;64N='AT('-H
++4;W5L9"!N;W0@8F4@=FES:6)L90H`
++`
++end
+-- 
+2.40.0
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
index 42c91e641e..250a3c016f 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://configurehack.patch \
            file://CVE-2025-5914.patch \
            file://CVE-2025-5915.patch \
+           file://CVE-2025-5916.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-- 
2.43.0


