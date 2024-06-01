Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F17C25B76
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 12:25:06 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.36106.1717244697817727688
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 05:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=A/wX2HoK;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-6c53a315c6eso1045693a12.3
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 05:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1717244697; x=1717849497; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cq6mLixbadsvOWNNEFBjvZdLE6AU1MF33U2+QnxNg8o=;
        b=A/wX2HoKhRQwQiglGpRz9jE99zqJKt63lUMPxI7abTkJ55WdkKQRNFUjC78kNT+B/f
         z5IMbJ0Uu31dY1+JsaLr0z8ErilEhIhume2QtrTqp6JWzfPnqmiSGm7GQsDgtp/sWpPn
         OzGCxvwnuShptcczN9PMYjZt3WKAX7tGTSYUE1xbp385CWEE/s3putj4r4Ql4KwCIfaO
         g5SBg7DLHhAQ5OTt96NpC0Fgvpmv4pjFDgTHwGpUb4+d7vHPQXajrgOxpp2b5SvYZCDn
         JoaMAxk4hedo/aAxkrHvCP3IDBTnxru9TmmDkxkaH6AwKBOtOb4e5d6H/fAXgCxn1Kmj
         BGPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717244697; x=1717849497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cq6mLixbadsvOWNNEFBjvZdLE6AU1MF33U2+QnxNg8o=;
        b=d5C5NBcvV3mq6kDSrVQ+tE0tfl56UZh0lxXxoziiQ88yYCkbHk/EUEXDwHSZ1Isn+4
         2ra7OTIJGHY6yNP8SL8oEij1DD2bl9l5sLZO3ahWNnCxjNMT6nJpLrNOVg+GKCYYM5mF
         mNadVD3FMN5pl3jw1zU9Yd+8FRf7azrV6V9PmWucce8es033oslohPW3PUXwpLejWYPZ
         sr1FsmqPzmhtg6VZzjprHIZFtr3jNfL8AX3yuK/WmSEXjRJx2fiO2Hm5a9PO9B7cdKjF
         oFyRmSE2cE/k0VkOJrh/bgc9epnFe+X9tzu5df634P2J85oYxtg4X4XejBu/6VN9Ogir
         T2pA==
X-Gm-Message-State: AOJu0Yw1njETs18OZS/vWFq0YkhvsHek2JgrkzTdHzcE8nGo5m9tNFTi
	PCySxxYkkD6PxsSaJl4zneOuq/szs6lGu1vGaVXntEKBu6rLxBW8CuvFo26ZrXTxvEez7suH3LI
	l
X-Google-Smtp-Source: AGHT+IEbAfbyEofdfVFij3FgYRq83jrf5tgVGi16aLH7mpKsqq6r/x/3620g5nNG19o1vMOFd/m8Mg==
X-Received: by 2002:a17:902:eb8c:b0:1f3:35d9:432b with SMTP id d9443c01a7336-1f636fd2790mr45075995ad.10.1717244696993;
        Sat, 01 Jun 2024 05:24:56 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63241d4d9sm31804165ad.296.2024.06.01.05.24.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 05:24:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/21] ncurses: Fix CVE-2023-45918
Date: Sat,  1 Jun 2024 05:24:28 -0700
Message-Id: <5385b15345dddc958fc961246e56b962db735276.1717243719.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717243719.git.steve@sakoman.com>
References: <cover.1717243719.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 12:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200098

From: Soumya Sambu <soumya.sambu@windriver.com>

From: Soumya Sambu <soumya.sambu@windriver.com>

ncurses 6.4-20230610 has a NULL pointer dereference in tgetstr in tinfo/lib_termcap.c.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-45918

(From OE-Core rev: 6573995adf4cfd48b036f8463b39f3864fcfd85b)

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ncurses/files/CVE-2023-45918.patch        | 180 ++++++++++++++++++
 meta/recipes-core/ncurses/ncurses_6.4.bb      |   1 +
 2 files changed, 181 insertions(+)
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2023-45918.patch

diff --git a/meta/recipes-core/ncurses/files/CVE-2023-45918.patch b/meta/recipes-core/ncurses/files/CVE-2023-45918.patch
new file mode 100644
index 0000000000..fbdae49a61
--- /dev/null
+++ b/meta/recipes-core/ncurses/files/CVE-2023-45918.patch
@@ -0,0 +1,180 @@
+From bcf02d3242f1c7d57224a95f7903fcf4b5e7695d Mon Sep 17 00:00:00 2001
+From: Thomas E. Dickey <dickey@invisible-island.net>
+Date: Fri, 16 Jun 2023 02:54:29 +0530
+Subject: [PATCH] Fix CVE-2023-45918
+
+CVE: CVE-2023-45918
+
+Upstream-Status: Backport [https://ncurses.scripts.mit.edu/?p=ncurses.git;a=commit;h=bcf02d3242f1c7d57224a95f7903fcf4b5e7695d]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ ncurses/tinfo/comp_error.c | 15 ++++++---
+ ncurses/tinfo/read_entry.c | 65 ++++++++++++++++++++++++++------------
+ 2 files changed, 56 insertions(+), 24 deletions(-)
+
+diff --git a/ncurses/tinfo/comp_error.c b/ncurses/tinfo/comp_error.c
+index 48f48784..ee518e28 100644
+--- a/ncurses/tinfo/comp_error.c
++++ b/ncurses/tinfo/comp_error.c
+@@ -60,8 +60,15 @@ _nc_get_source(void)
+ NCURSES_EXPORT(void)
+ _nc_set_source(const char *const name)
+ {
+-    FreeIfNeeded(SourceName);
+-    SourceName = strdup(name);
++    if (name == NULL) {
++	free(SourceName);
++	SourceName = NULL;
++    } else if (SourceName == NULL) {
++	SourceName = strdup(name);
++    } else if (strcmp(name, SourceName)) {
++	free(SourceName);
++	SourceName = strdup(name);
++    }
+ }
+
+ NCURSES_EXPORT(void)
+@@ -95,9 +102,9 @@ static NCURSES_INLINE void
+ where_is_problem(void)
+ {
+     fprintf(stderr, "\"%s\"", SourceName ? SourceName : "?");
+-    if (_nc_curr_line >= 0)
++    if (_nc_curr_line > 0)
+	fprintf(stderr, ", line %d", _nc_curr_line);
+-    if (_nc_curr_col >= 0)
++    if (_nc_curr_col > 0)
+	fprintf(stderr, ", col %d", _nc_curr_col);
+     if (TermType != 0 && TermType[0] != '\0')
+	fprintf(stderr, ", terminal '%s'", TermType);
+diff --git a/ncurses/tinfo/read_entry.c b/ncurses/tinfo/read_entry.c
+index 341337d2..b0c3ad26 100644
+--- a/ncurses/tinfo/read_entry.c
++++ b/ncurses/tinfo/read_entry.c
+@@ -138,12 +138,13 @@ convert_16bits(char *buf, NCURSES_INT2 *Numbers, int count)
+ }
+ #endif
+
+-static void
+-convert_strings(char *buf, char **Strings, int count, int size, char *table)
++static bool
++convert_strings(char *buf, char **Strings, int count, int size,
++		char *table, bool always)
+ {
+     int i;
+     char *p;
+-    bool corrupt = FALSE;
++    bool success = TRUE;
+
+     for (i = 0; i < count; i++) {
+	if (IS_NEG1(buf + 2 * i)) {
+@@ -159,13 +160,10 @@ convert_strings(char *buf, char **Strings, int count, int size, char *table)
+		TR(TRACE_DATABASE, ("Strings[%d] = %s", i,
+				    _nc_visbuf(Strings[i])));
+	    } else {
+-		if (!corrupt) {
+-		    corrupt = TRUE;
+-		    TR(TRACE_DATABASE,
+-		       ("ignore out-of-range index %d to Strings[]", nn));
+-		    _nc_warning("corrupt data found in convert_strings");
+-		}
+-		Strings[i] = ABSENT_STRING;
++		TR(TRACE_DATABASE,
++		   ("found out-of-range index %d to Strings[%d]", nn, i));
++		success = FALSE;
++		break;
+	    }
+	}
+
+@@ -175,10 +173,25 @@ convert_strings(char *buf, char **Strings, int count, int size, char *table)
+		if (*p == '\0')
+		    break;
+	    /* if there is no NUL, ignore the string */
+-	    if (p >= table + size)
++	    if (p >= table + size) {
+		Strings[i] = ABSENT_STRING;
++	    } else if (p == Strings[i] && always) {
++		TR(TRACE_DATABASE,
++		   ("found empty but required Strings[%d]", i));
++		success = FALSE;
++		break;
++	    }
++	} else if (always) {	/* names are always needed */
++	    TR(TRACE_DATABASE,
++	       ("found invalid but required Strings[%d]", i));
++	    success = FALSE;
++	    break;
+	}
+     }
++    if (!success) {
++	_nc_warning("corrupt data found in convert_strings");
++    }
++    return success;
+ }
+
+ static int
+@@ -382,7 +395,10 @@ _nc_read_termtype(TERMTYPE2 *ptr, char *buffer, int limit)
+	if (Read(string_table, (unsigned) str_size) != str_size) {
+	    returnDB(TGETENT_NO);
+	}
+-	convert_strings(buf, ptr->Strings, str_count, str_size, string_table);
++	if (!convert_strings(buf, ptr->Strings, str_count, str_size,
++			     string_table, FALSE)) {
++	    returnDB(TGETENT_NO);
++	}
+     }
+ #if NCURSES_XNAMES
+
+@@ -483,8 +499,10 @@ _nc_read_termtype(TERMTYPE2 *ptr, char *buffer, int limit)
+	       ("Before computing extended-string capabilities "
+		"str_count=%d, ext_str_count=%d",
+		str_count, ext_str_count));
+-	    convert_strings(buf, ptr->Strings + str_count, ext_str_count,
+-			    ext_str_limit, ptr->ext_str_table);
++	    if (!convert_strings(buf, ptr->Strings + str_count, ext_str_count,
++				 ext_str_limit, ptr->ext_str_table, FALSE)) {
++		returnDB(TGETENT_NO);
++	    }
+	    for (i = ext_str_count - 1; i >= 0; i--) {
+		TR(TRACE_DATABASE, ("MOVE from [%d:%d] %s",
+				    i, i + str_count,
+@@ -516,10 +534,13 @@ _nc_read_termtype(TERMTYPE2 *ptr, char *buffer, int limit)
+	    TR(TRACE_DATABASE,
+	       ("ext_NAMES starting @%d in extended_strings, first = %s",
+		base, _nc_visbuf(ptr->ext_str_table + base)));
+-	    convert_strings(buf + (2 * ext_str_count),
+-			    ptr->ext_Names,
+-			    (int) need,
+-			    ext_str_limit, ptr->ext_str_table + base);
++	    if (!convert_strings(buf + (2 * ext_str_count),
++				 ptr->ext_Names,
++				 (int) need,
++				 ext_str_limit, ptr->ext_str_table + base,
++				 TRUE)) {
++		returnDB(TGETENT_NO);
++	    }
+	}
+
+	TR(TRACE_DATABASE,
+@@ -572,13 +593,17 @@ _nc_read_file_entry(const char *const filename, TERMTYPE2 *ptr)
+	int limit;
+	char buffer[MAX_ENTRY_SIZE + 1];
+
+-	if ((limit = (int) fread(buffer, sizeof(char), sizeof(buffer), fp))
+-	    > 0) {
++	limit = (int) fread(buffer, sizeof(char), sizeof(buffer), fp);
++	if (limit > 0) {
++	    const char *old_source = _nc_get_source();
+
+	    TR(TRACE_DATABASE, ("read terminfo %s", filename));
++	    if (old_source == NULL)
++		_nc_set_source(filename);
+	    if ((code = _nc_read_termtype(ptr, buffer, limit)) == TGETENT_NO) {
+		_nc_free_termtype2(ptr);
+	    }
++	    _nc_set_source(old_source);
+	} else {
+	    code = TGETENT_NO;
+	}
+--
+2.40.0
diff --git a/meta/recipes-core/ncurses/ncurses_6.4.bb b/meta/recipes-core/ncurses/ncurses_6.4.bb
index 31f18bbadc..97130c06d6 100644
--- a/meta/recipes-core/ncurses/ncurses_6.4.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.4.bb
@@ -7,6 +7,7 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://0001-Fix-CVE-2023-29491.patch \
            file://0001-Updating-reset-code-ncurses-6.4-patch-20231104.patch \
            file://CVE-2023-50495.patch \
+           file://CVE-2023-45918.patch \
            "
 # commit id corresponds to the revision in package version
 SRCREV = "79b9071f2be20a24c7be031655a5638f6032f29f"
-- 
2.34.1


