Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 562AFC83F03
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 15:19:45 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.18577.1752074375476644728
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jul 2025 08:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iJ1kPFcJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7494999de5cso3600119b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 08:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752074375; x=1752679175; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PiKokZTdeh8PGJt/RQN3Wxs1Q435JQazaanc0c3ko9c=;
        b=iJ1kPFcJc141BNrIpv80lurEUkGYVtT4HDWjodHLSk/Ak5h4Sx/ldqyM+ipKgbl0GC
         k+0HhiTWyVDD76FC2JFP7yji5hVVt+Y2rgY1T2gb+1sjxfbFMr5RH5rKyV2t6fDDnE5B
         YNr7gI70TRUw0jJWg7FgpCnJRgQhEnnDjJSIDG50kIX6h/iJUmk72ycrsj19AAuBVn9K
         cOQ7oBlVPdSoeNUi6qrGbt6j4rUq2uj/Fcahs9bw2eERm54FBtJB5weJRhDFeOq1oEAb
         AxffbhAq41O/Q83duiknYYUtzCi3zW2ANgutE8sZEAEhKL6k5Vh2nCgQzq8F6oUSRW96
         g7xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752074375; x=1752679175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PiKokZTdeh8PGJt/RQN3Wxs1Q435JQazaanc0c3ko9c=;
        b=InmIKfU9l18LwcCIdu45XvKXEoSrg5WlJRPCk//S9JCqXwWchMo6ONvJjlgXsHW3+Z
         HRdP8cSd+vwLiXPnaPZmoosAQe8jdypR2uLvIqU+fEnX50VAlTKM4iq2F/E1SA/nbIo2
         0BkclIFTM1gxaaZx1i32ofUL5Zuo4Iw+xxHLU8eJwGjjbd9Y/ndAzC8EmbbgFN9rT6QR
         EOHKbKWd7h9D9HmmHJv30S+O4baKhCZXUddFkhZJkAVacWFSMq0IKw7F4E3GqgT4yqwJ
         SiupJMk65TwCGEcLTQoJoW7QwocrLzzeYTT9y+p0mi6OOp0/E245wMLLICETbrYUS2WO
         CfCw==
X-Gm-Message-State: AOJu0Yw0bZuBcYzWZVmS3zU6mKSIZi1EAPGgDH12bxETIeC0jMZd1ldD
	qD0isjfPsF1N/qMagHvjoSl6ANTkDgpF+TUD6ePwe9PPGUwpFg6aRQWq3pDm0RyD+sok2NCY5qc
	bNZus
X-Gm-Gg: ASbGnctG6dPQvGR53QtKf6lA30Oryy2txDlqbjeaLWzNPYl9cgFUkSaZEHcapx/8nK5
	BAO24PbIB2Fp1EDCvVmlQmyt6k712S6kjsfagp4njtv0JhQpZq4LpUUSTqhsHDSkI9aNgHv7A2Q
	WikF6ncY+tCC8lmLCZjidhcoFyPBnBUZY0nOsNyyeM5HEBHWsRGXB+fvqplw0on5Whe3pO307Dc
	NQus60Q8n/9X62MKB9KYqyvFoPNQGIC+BabFmvHwvDKSGu4s5t6z/wE+YbsdtNtsXjjT5pbA3Yc
	oR4uxsngWQIy7ODRLDxgoauam9NMNKStnVVEfdLYZRewjyDqKvHt7w==
X-Google-Smtp-Source: AGHT+IH+LHWzw0W1iYKSSYR3UIi8vJv5oiZjoMqvUektX3Oq/FZZbCdjBignCGLWZHXsBik3EvftPg==
X-Received: by 2002:a17:903:1665:b0:232:1daf:6f06 with SMTP id d9443c01a7336-23ddb34bc13mr48235015ad.47.1752074374545;
        Wed, 09 Jul 2025 08:19:34 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:a6e1:d218:3fcc:fd7d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3019e934sm2340536a91.33.2025.07.09.08.19.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 08:19:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/11] libarchive: fix CVE-2025-5916
Date: Wed,  9 Jul 2025 08:19:12 -0700
Message-ID: <0e939bf5fc7412c7357fcd7d8ae760f023ac40eb.1752073806.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752073806.git.steve@sakoman.com>
References: <cover.1752073806.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 15:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220100

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
 .../libarchive/libarchive_3.6.2.bb            |   1 +
 2 files changed, 117 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5916.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-5916.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5916.patch
new file mode 100644
index 0000000000..d32c8ee84e
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
+index e486a8d..dd1620d 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -913,6 +913,7 @@ libarchive_test_EXTRA_DIST=\
+ 	libarchive/test/test_read_format_ustar_filename_eucjp.tar.Z.uu \
+ 	libarchive/test/test_read_format_ustar_filename_koi8r.tar.Z.uu \
+ 	libarchive/test/test_read_format_warc.warc.uu \
++	libarchive/test/test_read_format_warc_incomplete.warc.uu \
+ 	libarchive/test/test_read_format_zip.zip.uu \
+ 	libarchive/test/test_read_format_zip_7075_utf8_paths.zip.uu \
+ 	libarchive/test/test_read_format_zip_7z_deflate.zip.uu \
+diff --git a/libarchive/archive_read_support_format_warc.c b/libarchive/archive_read_support_format_warc.c
+index 2732996..19cf5a3 100644
+--- a/libarchive/archive_read_support_format_warc.c
++++ b/libarchive/archive_read_support_format_warc.c
+@@ -379,7 +379,8 @@ start_over:
+ 	case LAST_WT:
+ 	default:
+ 		/* consume the content and start over */
+-		_warc_skip(a);
++		if (_warc_skip(a) < 0)
++			return (ARCHIVE_FATAL);
+ 		goto start_over;
+ 	}
+ 	return (ARCHIVE_OK);
+@@ -432,7 +433,9 @@ _warc_skip(struct archive_read *a)
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
+index 658ab8a..8a6d178 100644
+--- a/libarchive/test/test_read_format_warc.c
++++ b/libarchive/test/test_read_format_warc.c
+@@ -80,3 +80,27 @@ DEFINE_TEST(test_read_format_warc)
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
diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index c612c1b7e0..f90063ba3a 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -37,6 +37,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2025-25724.patch \
            file://CVE-2025-5914.patch \
            file://CVE-2025-5915.patch \
+           file://CVE-2025-5916.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-- 
2.43.0


