Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F86CD128A
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 13:11:18 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.165497.1712754668941563471
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Apr 2024 06:11:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VpmEewNz;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6ed04c91c46so4747947b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 06:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1712754668; x=1713359468; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHEN3oP+JVIo//JYJZmATjArSNvN458jU5XoSoA2WfQ=;
        b=VpmEewNz5Ln8hxRVR0dz2O4mRnGrNaiOq4P3pEXwDMSgKoFQqMzJ3VqstBjgDaKF0v
         LqUYGPQLjC1nGWQ5m+4HA1k0EBchP+Q+gEZEOvqETvpN2XOv7F04SxJONVdxDv5KdYNY
         ULrY7+ldqXOttPwONSnHEnB+34O2e6jVif/pvkolHi0lZ8jV6x/EadyI24GvE5DVOtl2
         RI3jOoCmZOYcm3DPPQCUR0cG54jZAK5Uv0+ZeFthUnQcmKY1sHF/kk8IQGMF25B5D9WS
         R8HG2l5QT7xZ9tlec4+aAM8ph5xEprB7WVhv/kETVXhyKSHhgoXANZct6eI+frCIXNGQ
         MgQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712754668; x=1713359468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHEN3oP+JVIo//JYJZmATjArSNvN458jU5XoSoA2WfQ=;
        b=Dcjk1GQX1oZIn7JvbXXifAafI/bl6xSI2qLXkk3jUC6fCUwxTFmB2K/7XVPMx2LV4N
         HQaAUY6eNfN2DmfpsU12XenFH8owgdxjJQQ/mN5Cdd5UUTdSPVt/gFr8OI8gB3Weefm2
         krmw4dlh2ELK+bthkMZ31GtsDZff7tziqVfT6LsoEEVcskPp9qNfa5He6mu83ulwNMbM
         qxKao1L0PkHL0QEK6X0p9eTsN+otZyag39PS/nZRMvzg6Yivj5rlL4UBULtzErW3iZZf
         U6btU9yq3t7iZgVW00xN33oGyf6WqC82H1Tc44NJt8Fd6HmDKtfQ2FgU54gBam5NKlrv
         B8nQ==
X-Gm-Message-State: AOJu0YxXgIZhjSjGD3YM6V5vZ2oMeZDFO7sosY3Db3dY9kibc313DgXO
	hGNjjPJrSugm2y3zLBPxoTvbwAPdKS7Z/j92nNu8yorCHQ0YZk2N+gwX4pQv51I3lTeAf9qyKrL
	zplc=
X-Google-Smtp-Source: AGHT+IHQEe+qF+pkBCgaQmTtuh+gf1ZY3Vwyn8yWImOPUW+Qce0DpqNE1Jc90UFZgzxBvLtrvwEZgA==
X-Received: by 2002:a05:6a00:9a3:b0:6ed:435f:ec9b with SMTP id u35-20020a056a0009a300b006ed435fec9bmr2943555pfg.20.1712754666697;
        Wed, 10 Apr 2024 06:11:06 -0700 (PDT)
Received: from xps13.. ([199.58.97.236])
        by smtp.gmail.com with ESMTPSA id c17-20020aa78c11000000b006ed0199bd57sm10054887pfd.177.2024.04.10.06.11.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 06:11:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/5] ncurses: Backport fix for CVE-2023-50495
Date: Wed, 10 Apr 2024 06:10:54 -0700
Message-Id: <530314b699a7ad53e6dcd96658873cef7014e483.1712754495.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712754495.git.steve@sakoman.com>
References: <cover.1712754495.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 13:11:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198094

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/ThomasDickey/ncurses-snapshots/commit/efe9674ee14b14b788f9618941f97d31742f0adc

Reference: https://invisible-island.net/archives/ncurses/6.4/ncurses-6.4-20230424.patch.gz

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ncurses/files/CVE-2023-50495.patch        | 79 +++++++++++++++++++
 meta/recipes-core/ncurses/ncurses_6.2.bb      |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2023-50495.patch

diff --git a/meta/recipes-core/ncurses/files/CVE-2023-50495.patch b/meta/recipes-core/ncurses/files/CVE-2023-50495.patch
new file mode 100644
index 0000000000..58c23866d1
--- /dev/null
+++ b/meta/recipes-core/ncurses/files/CVE-2023-50495.patch
@@ -0,0 +1,79 @@
+Fix for CVE-2023-50495 from upstream:
+https://github.com/ThomasDickey/ncurses-snapshots/commit/efe9674ee14b14b788f9618941f97d31742f0adc
+
+Reference:
+https://invisible-island.net/archives/ncurses/6.4/ncurses-6.4-20230424.patch.gz
+
+Upstream-Status: Backport [import from suse ftp.pbone.net/mirror/ftp.opensuse.org/update/leap-micro/5.3/sle/src/ncurses-6.1-150000.5.20.1.src.rpm
+Upstream commit https://github.com/ThomasDickey/ncurses-snapshots/commit/efe9674ee14b14b788f9618941f97d31742f0adc]
+CVE: CVE-2023-50495
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ ncurses/tinfo/parse_entry.c | 23 ++++++++++++++++-------
+ 1 file changed, 16 insertions(+), 7 deletions(-)
+
+diff --git a/ncurses/tinfo/parse_entry.c b/ncurses/tinfo/parse_entry.c
+index 23574b66..56ba9ae6 100644
+--- a/ncurses/tinfo/parse_entry.c
++++ b/ncurses/tinfo/parse_entry.c
+@@ -110,7 +110,7 @@ _nc_extend_names(ENTRY * entryp, const char *name, int token_type)
+ 	/* Well, we are given a cancel for a name that we don't recognize */
+ 	return _nc_extend_names(entryp, name, STRING);
+     default:
+-	return 0;
++	return NULL;
+     }
+ 
+     /* Adjust the 'offset' (insertion-point) to keep the lists of extended
+@@ -142,6 +142,11 @@ _nc_extend_names(ENTRY * entryp, const char *name, int token_type)
+ 	for (last = (unsigned) (max - 1); last > tindex; last--)
+ 
+     if (!found) {
++	char *saved;
++
++	if ((saved = _nc_save_str(name)) == NULL)
++	    return NULL;
++
+ 	switch (token_type) {
+ 	case BOOLEAN:
+ 	    tp->ext_Booleans++;
+@@ -169,7 +174,7 @@ _nc_extend_names(ENTRY * entryp, const char *name, int token_type)
+ 	TYPE_REALLOC(char *, actual, tp->ext_Names);
+ 	while (--actual > offset)
+ 	    tp->ext_Names[actual] = tp->ext_Names[actual - 1];
+-	tp->ext_Names[offset] = _nc_save_str(name);
++	tp->ext_Names[offset] = saved;
+     }
+ 
+     temp.nte_name = tp->ext_Names[offset];
+@@ -337,6 +342,8 @@ _nc_parse_entry(ENTRY * entryp, int literal, bool silent)
+ 	bool is_use = (strcmp(_nc_curr_token.tk_name, "use") == 0);
+ 	bool is_tc = !is_use && (strcmp(_nc_curr_token.tk_name, "tc") == 0);
+ 	if (is_use || is_tc) {
++	    char *saved;
++
+ 	    if (!VALID_STRING(_nc_curr_token.tk_valstring)
+ 		|| _nc_curr_token.tk_valstring[0] == '\0') {
+ 		_nc_warning("missing name for use-clause");
+@@ -350,11 +357,13 @@ _nc_parse_entry(ENTRY * entryp, int literal, bool silent)
+ 			    _nc_curr_token.tk_valstring);
+ 		continue;
+ 	    }
+-	    entryp->uses[entryp->nuses].name = _nc_save_str(_nc_curr_token.tk_valstring);
+-	    entryp->uses[entryp->nuses].line = _nc_curr_line;
+-	    entryp->nuses++;
+-	    if (entryp->nuses > 1 && is_tc) {
+-		BAD_TC_USAGE
++	    if ((saved = _nc_save_str(_nc_curr_token.tk_valstring)) != NULL) {
++		entryp->uses[entryp->nuses].name = saved;
++		entryp->uses[entryp->nuses].line = _nc_curr_line;
++		entryp->nuses++;
++		if (entryp->nuses > 1 && is_tc) {
++		    BAD_TC_USAGE
++		}
+ 	    }
+ 	} else {
+ 	    /* normal token lookup */
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/ncurses/ncurses_6.2.bb b/meta/recipes-core/ncurses/ncurses_6.2.bb
index 33285bcb5b..dbff149f55 100644
--- a/meta/recipes-core/ncurses/ncurses_6.2.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.2.bb
@@ -6,6 +6,7 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://CVE-2021-39537.patch \
            file://CVE-2022-29458.patch \
            file://CVE-2023-29491.patch \
+           file://CVE-2023-50495.patch \
            "
 # commit id corresponds to the revision in package version
 SRCREV = "a669013cd5e9d6434e5301348ea51baf306c93c4"
-- 
2.34.1


