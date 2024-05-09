Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13070C25B78
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 12:05:20 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.8619.1715256316612581158
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 05:05:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mhDVJIX5;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6f450f43971so727320b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 05:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1715256316; x=1715861116; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X02rc0IRX90FRW2nfswApLLk7HmB8P1zHWN5O5EyFBI=;
        b=mhDVJIX5Ue5o9dVb4730STzcTdfKMtjxfIdng8/BzVFgvB+uneXYMzxBR0ZF4N+d8J
         NVG6nysvesljfYnBCZNX5riFm2K3HrLIKPTTU28qR4miVhAuzdomu7iLnHTgCC8vfW92
         4n32MVa/2LhUDrhjnerq8VrMONyItGzkRBRIFHdXxwMNqLPjmcB5w8ytDpa5hK+WMg9c
         xq1D2PW9OH6Oyw0gR52SumiCJDZUW53E8CDVKhNxr+4pLhLv8nIavDXsz1biL747i+MC
         M0Z47Yilo+J2lpXG/0LTLhBBUca/lQDsyVecoE4jUoNa8ug3/XmIudrFL1vRKIdVvvy3
         vE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715256316; x=1715861116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X02rc0IRX90FRW2nfswApLLk7HmB8P1zHWN5O5EyFBI=;
        b=Pu61p6A+YxrZkZNoygX6G4awfQFQ0i+kMHxgGhEhrfxxHnFL77mmYB+K9V72G9Ltzm
         sIPeNkUD4mhUu3RbZ5sABUh3WWnSv/MSZwOmN05ceeWiOlswzV1lLd+BSrjiJ79Ftxgs
         rne/MAZSrZysjaKd4T8Nsi2fW+Q74ipXnJ9MzytWQwH9EEoBeBPOprxZMtHDpIAeB5Sw
         /FJo09le+4+H8aADtpShEzhDnfDKKsptqkG5LfqdnKcPuXqmAYhRBrw+apx9Twe7kFBW
         dza+8z35GaRyrmqTkwwZqhnxuGfztDJz6EhzoTkPmfXoIzije72wMolep4cirEPXWxX+
         uv+w==
X-Gm-Message-State: AOJu0YzlMMyn3BxxxknGEOkMQWq6euwsIv2wgx4aZ2hfjh8IsnZBSY1E
	7V0gWBSFvGXGxE6JazSoKjvogQ26+aUbSguEDalpr5cT70/UViqsux9CFgA895Zo9YWuBksAKUa
	h
X-Google-Smtp-Source: AGHT+IGVp/qgTaE7ZcNJ0xHL3Ut1ZujnkME2bcxZ1mFAeiOHp4wUnTPfJvZU2v5CtCWn8vPxkYwuNQ==
X-Received: by 2002:a05:6a20:1014:b0:1a7:a3ee:5e4a with SMTP id adf61e73a8af0-1afc8d5e2f4mr5285162637.33.1715256315787;
        Thu, 09 May 2024 05:05:15 -0700 (PDT)
Received: from xps13.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2af2c41sm1185613b3a.172.2024.05.09.05.05.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 05:05:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/23] ncurses: Fix CVE-2023-45918
Date: Thu,  9 May 2024 05:04:43 -0700
Message-Id: <60b34c34351833f0a9be4b31c5bc3b94ad960c60.1715256149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715256149.git.steve@sakoman.com>
References: <cover.1715256149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 12:05:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199152

From: Soumya Sambu <soumya.sambu@windriver.com>

ncurses 6.4-20230610 has a NULL pointer dereference in tgetstr in tinfo/lib_termcap.c.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-45918

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ncurses/files/CVE-2023-45918.patch        | 180 ++++++++++++++++++
 .../ncurses/ncurses_6.3+20220423.bb           |   1 +
 2 files changed, 181 insertions(+)
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2023-45918.patch

diff --git a/meta/recipes-core/ncurses/files/CVE-2023-45918.patch b/meta/recipes-core/ncurses/files/CVE-2023-45918.patch
new file mode 100644
index 0000000000..172b3f8859
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
+index 8ccb1570..101bbe09 100644
+--- a/ncurses/tinfo/read_entry.c
++++ b/ncurses/tinfo/read_entry.c
+@@ -140,12 +140,13 @@ convert_16bits(char *buf, NCURSES_INT2 *Numbers, int count)
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
+@@ -161,13 +162,10 @@ convert_strings(char *buf, char **Strings, int count, int size, char *table)
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
+@@ -177,10 +175,25 @@ convert_strings(char *buf, char **Strings, int count, int size, char *table)
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
+@@ -383,7 +396,10 @@ _nc_read_termtype(TERMTYPE2 *ptr, char *buffer, int limit)
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
+@@ -484,8 +500,10 @@ _nc_read_termtype(TERMTYPE2 *ptr, char *buffer, int limit)
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
+@@ -519,10 +537,13 @@ _nc_read_termtype(TERMTYPE2 *ptr, char *buffer, int limit)
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
+@@ -575,13 +596,17 @@ _nc_read_file_entry(const char *const filename, TERMTYPE2 *ptr)
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
diff --git a/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb b/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
index da1e6d838d..1fa5e036e9 100644
--- a/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
@@ -5,6 +5,7 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch \
            file://CVE-2023-29491.patch \
            file://CVE-2023-50495.patch \
+           file://CVE-2023-45918.patch \
            "
 # commit id corresponds to the revision in package version
 SRCREV = "a0bc708bc6954b5d3c0a38d92b683c3ec3135260"
-- 
2.34.1


