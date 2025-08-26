Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C03CA0FE7
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 13:41:16 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.64591.1756215668819062579
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 06:41:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iYcfRLiY;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-32597b88e40so1607473a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 06:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756215668; x=1756820468; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GUD/U+SPc+adCYnVtRq39+nHGM/rTdXPxCt9DfZfNoI=;
        b=iYcfRLiYC1ZRoAxsQgWlwgdl2vGpiBSviBAE4vGFBv6o/2z13aYJN3uAibCKFxuI6R
         ukhZ3e95IsfvDA3w6HHncevFVAXPmjv2CdE+muhDXRZ35SeEvNHvTkBxg0Xkv2itZaTQ
         qAzAKgYRwcqGvg9MVhIHcAxhm4fZ6/5lSUkTBqiUwxIYQGV6HAN2gvnmUTWm1lV6yvFg
         RItISJlVyqKYR2jlKekGThUgZbeP8Buu/WS3A34KTunI27uXtDL9Q9reQEodNFDoZFL7
         ly5sEoH6D0NTLBSuC8Dnw2QbTCEnEeeTancMOxThKziEyI0lnLXh9rNbkwKs7+J6BYbp
         cFWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215668; x=1756820468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GUD/U+SPc+adCYnVtRq39+nHGM/rTdXPxCt9DfZfNoI=;
        b=DZhIZp1ZLZtSVF7viSYy4ahR2dehb/wo/qxug864UyRCh3pnfeqF0qLFDunI9Qxkzs
         VzxQqe95z3g7tFhBoIfop4PfWMsMKrPfUJLDJhk4OqBeK8iEhOzs+C+TnOBnZNdbcLu1
         BRvIXzbwgm9cFMzkNEA8GMiFuq/j5mvUsCw9hxsEQkiXpfZpSSjU64wUVsI5LsfH2EEZ
         4CSXBKI25gItJ2zyleNqiAFQNxisNjEwcpukUIKtPRmy6aUXLqHmyAfckJj3jfM5SMlN
         5y6cuXMH8NZyb16iAnWuBryj9ALmZPTznY4DCvO2rJf04BhsrOIS95sZp0gJdb7JiUzS
         fWVQ==
X-Gm-Message-State: AOJu0Yw5Sgp6ynNpiHo5cHQkn1lBICggasRQbMQgzbm2IE7PTKentx9T
	J0M+IG3036LKbSt2FhLcWMhvR/u6ROxDfXsNlPkgXMo15t7JwBvCEPbuUbtrIUP6+/GD889DkSM
	Lnv4N
X-Gm-Gg: ASbGncv2t9fI6ncBBnfPAxZX67pLfi7nW5Rqpeq5PErk19RVvhrQvz3lUN+5r3jfTcZ
	33HDqJLFwzh/TpD+Dtfs58OIlSafyuKQ0Wo3L/AOhjiuUUyPnY3aEcZG/lNAHgLwKiDLLql5LJD
	pnjspTrfThORZ3GreyY3GVpZZYJ1fJ9Jy5TjJyitsdt780bT7eWJ5+AsZH6bSonoUtLGXrZc7Op
	Y+1FJNYiuQZPl8cQk/nLJmdtp8ZG6/Nm4Cy4PCRS50ikAFveLYo7Nxy2zTLS51RCx2W26Q7hNAM
	Qyvmy8ImtDVDHC5jEH2U9IwpvVXrWbn2xxQHk+NCLPg33eewgnRO8N8j0KqL1I4p5h5ITI1KTYa
	rsF/CXl3Jil+Cdw==
X-Google-Smtp-Source: AGHT+IGy++Mt56tpKhNL+um72KfguCYC02W6gzKppyzCHwxiqnhR2gYPGhYoCX48uT80j/IMAhnFmg==
X-Received: by 2002:a17:90b:4a07:b0:313:aefa:b08 with SMTP id 98e67ed59e1d1-3275085dbbdmr1801288a91.16.1756215667648;
        Tue, 26 Aug 2025 06:41:07 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1687:ddce:d4c7:f578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3274191c389sm1007414a91.4.2025.08.26.06.41.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 06:41:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 02/19] libarchive: patch CVE-2025-5916
Date: Tue, 26 Aug 2025 06:40:36 -0700
Message-ID: <aa9adf9b4d5b0169dfe44503c247d48538d16929.1756215509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756215509.git.steve@sakoman.com>
References: <cover.1756215509.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 13:41:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222442

From: Peter Marko <peter.marko@siemens.com>

Pick commit per [1]

[1] https://security-tracker.debian.org/tracker/CVE-2025-5916

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libarchive/libarchive/CVE-2025-5916.patch | 111 ++++++++++++++++++
 .../libarchive/libarchive_3.7.9.bb            |   1 +
 2 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5916.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-5916.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5916.patch
new file mode 100644
index 0000000000..0ea2278cb6
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5916.patch
@@ -0,0 +1,111 @@
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
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/ef093729521fcf73fa4007d5ae77adfe4df42403]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ Makefile.am                                   |  1 +
+ libarchive/archive_read_support_format_warc.c |  7 ++++--
+ libarchive/test/test_read_format_warc.c       | 24 +++++++++++++++++++
+ .../test_read_format_warc_incomplete.warc.uu  | 10 ++++++++
+ 4 files changed, 40 insertions(+), 2 deletions(-)
+ create mode 100644 libarchive/test/test_read_format_warc_incomplete.warc.uu
+
+diff --git a/Makefile.am b/Makefile.am
+index efc49180..f372cbcb 100644
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
+index fcec5bc4..696f959c 100644
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
+index 91e6dc67..745aabff 100644
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
+index 00000000..b91b97ef
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
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
index c091508799..1015de3fce 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -32,6 +32,7 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
 SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2025-5914.patch \
            file://CVE-2025-5915.patch \
+           file://CVE-2025-5916.patch \
            "
 
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
-- 
2.43.0


