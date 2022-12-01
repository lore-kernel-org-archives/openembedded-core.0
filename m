Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26342C47089
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 19:02:56 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.53541.1669921373115486623
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 11:02:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JVW2opOn;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id k7so2525351pll.6
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 11:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTRP+/QdWGSbPHfm2BLvlDStBgIqU0Lc/0ZxgsacCeA=;
        b=JVW2opOnNQ1vpo8omsU46nZsnTxkC2M5dzh9ArdyaPykmdP71T7uCVwYipvwvgOF/+
         1fzg/sTGXqHO8lzyxchGYOL/yIMGJf6JycGKxdSvEwrOljQyD3JU8NkqxRxA1yapiAZe
         oCM/5IYUxistFpbIuBcxV7u7fzomUe7N1FZBumqzduHYhuSaX65P/G8rA87vge4U+nnk
         Ph//tVTs6y6jIHrdBRvXzC1b4G4lrccFSKePYQoOpHSXF8NphSAvxSCvPo4jGnofSvjj
         0FLaFEu718/AHLfkRo40bqitWBrwddhSzEoRw++kyxRYdVHHk1ezfJCiz1QD4a5E/Ea2
         xR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTRP+/QdWGSbPHfm2BLvlDStBgIqU0Lc/0ZxgsacCeA=;
        b=OuLTwmEOhkQ+4OzCnfq1YDM4LO7AuJkC0u0P/BH1vnOBqWkHN/P+5TMYdAjqAmk8U+
         EQKmrFtUsr50jbhPXzxDvGNNMd/JavkG2CkcrmGRpyHlmvYIrmoLBsjYSlhoEeXnZpBw
         IcyTwDGIMcVy2MxgW/vCuiWciSkWsvCTarxNIk2FIBH3YNSvH+UdlZOToCQe72E7l7nl
         IqhvFGn3MkkKq88SOwVGlW8Q8lO3pv3pCImxtNCf+QDbvx2fB2ARiuJ2vGghb97LfCmc
         4WGodAxy3eG37mSzLf2EA5v1s6nzdosTYCv48NlDHs7NZMMg+iiBVsOO/4iKqJK6hX/H
         PgNw==
X-Gm-Message-State: ANoB5pl5DDND8bqbR32r/FNt2prAqTMEPQTPMSM8Qneg9sZknsc3tGAG
	hI6HmNeyq664jkLcWaybn3I3w6v+JH8=
X-Google-Smtp-Source: AA0mqf6UcO8KI/m9oD80Lu20x5yhc12foKWujPZUu1UOH2Zp5ml3DxhdH1AnjaqXeTqRpR/SjFg7vw==
X-Received: by 2002:a17:902:7d97:b0:188:f87d:70d3 with SMTP id a23-20020a1709027d9700b00188f87d70d3mr48094869plm.43.1669921372326;
        Thu, 01 Dec 2022 11:02:52 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::d00])
        by smtp.gmail.com with ESMTPSA id 19-20020a621413000000b00576489088c7sm321092pfu.37.2022.12.01.11.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 11:02:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/6] acl: Enable largefile support by default
Date: Thu,  1 Dec 2022 11:02:44 -0800
Message-Id: <20221201190248.175753-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201190248.175753-1-raj.khem@gmail.com>
References: <20221201190248.175753-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 19:02:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174203

This ensures right flags are passed so enable it. Musl and decoupled
these APIs from _GNU_SOURCE and now are only available when
_LARGEFILE64_SOURCE macro is enabled

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...rtable-version-of-dirent-and-readdir.patch | 39 +++++++++++++++++++
 meta/recipes-support/attr/acl_2.3.1.bb        |  3 ++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-support/attr/acl/0001-chacl-Use-portable-version-of-dirent-and-readdir.patch

diff --git a/meta/recipes-support/attr/acl/0001-chacl-Use-portable-version-of-dirent-and-readdir.patch b/meta/recipes-support/attr/acl/0001-chacl-Use-portable-version-of-dirent-and-readdir.patch
new file mode 100644
index 0000000000..c51b90216f
--- /dev/null
+++ b/meta/recipes-support/attr/acl/0001-chacl-Use-portable-version-of-dirent-and-readdir.patch
@@ -0,0 +1,39 @@
+From 1a5671a4eb13b81b98c3e71f00370781563f66d8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 10 Nov 2022 17:57:24 -0800
+Subject: [PATCH] chacl: Use portable version of dirent and readdir
+
+Using 64bit versions on 32bit architectures should be enabled with
+--enable-largefile, this makes it portable across musl and glibc
+
+Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/acl-devel/2022-11/msg00005.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tools/chacl.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tools/chacl.c b/tools/chacl.c
+index 525a7ff..8fff875 100644
+--- a/tools/chacl.c
++++ b/tools/chacl.c
+@@ -320,7 +320,7 @@ walk_dir(acl_t acl, acl_t dacl, const char *fname)
+ {
+ 	int failed = 0;
+ 	DIR *dir;
+-	struct dirent64 *d;
++	struct dirent *d;
+ 	char *name;
+ 
+ 	if ((dir = opendir(fname)) == NULL) {
+@@ -332,7 +332,7 @@ walk_dir(acl_t acl, acl_t dacl, const char *fname)
+ 		return(0);	/* got a file, not an error */
+ 	}
+ 
+-	while ((d = readdir64(dir)) != NULL) {
++	while ((d = readdir(dir)) != NULL) {
+ 		/* skip "." and ".." entries */
+ 		if (strcmp(d->d_name, ".") == 0 || strcmp(d->d_name, "..") == 0)
+ 			continue;
+-- 
+2.38.1
+
diff --git a/meta/recipes-support/attr/acl_2.3.1.bb b/meta/recipes-support/attr/acl_2.3.1.bb
index aca04a9aac..5fb8f9ae35 100644
--- a/meta/recipes-support/attr/acl_2.3.1.bb
+++ b/meta/recipes-support/attr/acl_2.3.1.bb
@@ -19,12 +19,15 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/acl/${BP}.tar.gz \
            file://run-ptest \
            file://0001-tests-do-not-hardcode-the-build-path-into-a-helper-l.patch \
            file://0001-test-patch-out-failing-bits.patch \
+           file://0001-chacl-Use-portable-version-of-dirent-and-readdir.patch \
            "
 
 SRC_URI[sha256sum] = "760c61c68901b37fdd5eefeeaf4c0c7a26bdfdd8ac747a1edff1ce0e243c11af"
 
 inherit autotools gettext ptest
 
+EXTRA_OECONF += "--enable-largefile"
+
 PACKAGES =+ "lib${BPN}"
 
 FILES:lib${BPN} = "${libdir}/lib*${SOLIBS}"
-- 
2.38.1


