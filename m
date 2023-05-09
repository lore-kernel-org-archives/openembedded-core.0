Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DECAC7EE26
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 22:32:55 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.3051.1683671570184988800
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 15:32:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=5GYP2ISB;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6439bbc93b6so4334064b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 15:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683671569; x=1686263569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TciNgDxDqxwrKCzygVRi6uG3xwpr3U1O7Y5NvpuFoE0=;
        b=5GYP2ISBsqh8pmKg7s35sVPtf6qeVmXmAJs3rrGkRQprA/GKwg3Y128YtN06FCUWDU
         VYuQ5TBcLpW9bkLGeNLAai5kh+Na/wHeR8ISYrK6hAgowaBxb9wkwRbAFERV80dpwryN
         9UKTegwNFNQIv7yI1Sna6YV9/6kNYVpNTgTpmIsqMH/zKbLQC5BcmzVoumryY3k9425y
         LXQFOWawdugAuUzhYq6x0CSIbEY6FG0uf5ljGkyUaHD/Ds9uFdgQ1DVtpLdIMuM3C6pb
         UHE3ixRnNGNCyKlN17D4qIcYYUyfjZOzNFxCVySYtdZFFs3Tk/2bqAjIf4coodpmywtD
         m7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683671569; x=1686263569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TciNgDxDqxwrKCzygVRi6uG3xwpr3U1O7Y5NvpuFoE0=;
        b=JCHJJacNo8sZLD7ugofBwgauiFs65E3x28A8RkMgiEfS9xklMmlbHr8xODI9miKqUl
         d78hnlKSY15J9foFtkZ7XgdAnEoWrrOEwEz5NRzud+boB9oHzLaeLW/UmueUPDbW99zN
         O8SK/N507UeoySOPhVNFs2T3BKQsdAof6G5oEoKpWEMD39Mtc82v/QK9q1EfUIyDJxoD
         6pc38dJH8adVWvmL0GP/Bd2KtMDBbs+a1ZaNVAFb9Ez5jqWoMXMidVHOUrUplYEaoerx
         YyfMQuU8psAjvDJR6yxWNfyUk5Ep1RMcVfx8y3/xX5b+nfUD7QkRwW13AJHIgz5TNvvt
         kphQ==
X-Gm-Message-State: AC+VfDwAZlp+6pKvW0dcUELCcPs03S6jMYu/ob9sG4PH3RTNryi+A/fj
	Thb8C/poV/fzcT6wPttTlHSBL+HNqJNjavOeBlY=
X-Google-Smtp-Source: ACHHUZ7xVD4748KUCDl6xyn5RcesuCEMP5kxYhxPLqbJmcxpwzlHaM5taN01D1USyAGHyB5Mm6q6uw==
X-Received: by 2002:a05:6a20:1455:b0:f2:7dd:2753 with SMTP id a21-20020a056a20145500b000f207dd2753mr21042375pzi.33.1683671568912;
        Tue, 09 May 2023 15:32:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u17-20020aa78491000000b0063d2dae6247sm2263125pfn.77.2023.05.09.15.32.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 15:32:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/15] git: fix CVE-2023-29007
Date: Tue,  9 May 2023 12:32:27 -1000
Message-Id: <1b55343b6346437b80b8a8180ae1bc9f480d92ef.1683671423.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683671423.git.steve@sakoman.com>
References: <cover.1683671423.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 22:32:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181086

From: Archana Polampalli <archana.polampalli@windriver.com>

Git is a revision control system. Prior to versions 2.30.9, 2.31.8, 2.32.7, 2.33.8,
2.34.8, 2.35.8, 2.36.6, 2.37.7, 2.38.5, 2.39.3, and 2.40.1, a specially crafted
`.gitmodules` file with submodule URLs that are longer than 1024 characters can used
to exploit a bug in `config.c::git_config_copy_or_rename_section_in_file()`. This bug
can be used to inject arbitrary configuration into a user's `$GIT_DIR/config` when
attempting to remove the configuration section associated with that submodule. When the
attacker injects configuration values which specify executables to run (such as
`core.pager`, `core.editor`, `core.sshCommand`, etc.) this can lead to a remote code
execution. A fix A fix is available in versions 2.30.9, 2.31.8, 2.32.7, 2.33.8, 2.34.8,
2.35.8, 2.36.6, 2.37.7, 2.38.5, 2.39.3, and 2.40.1. As a workaround, avoid running
`git submodule deinit` on untrusted repositories or without prior inspection of any
submodule sections in `$GIT_DIR/config`.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-29007

Upstream patches:
https://github.com/git/git/commit/528290f8c61222433a8cf02fb7cfffa8438432b4
https://github.com/git/git/commit/29198213c9163c1d552ee2bdbf78d2b09ccc98b8
https://github.com/git/git/commit/a5bb10fd5e74101e7c07da93e7c32bbe60f6173a
https://github.com/git/git/commit/e91cfe6085c4a61372d1f800b473b73b8d225d0d
https://github.com/git/git/commit/3bb3d6bac5f2b496dfa2862dc1a84cbfa9b4449a

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../git/git/CVE-2023-29007.patch              | 162 ++++++++++++++++++
 meta/recipes-devtools/git/git_2.35.7.bb       |   1 +
 2 files changed, 163 insertions(+)
 create mode 100644 meta/recipes-devtools/git/git/CVE-2023-29007.patch

diff --git a/meta/recipes-devtools/git/git/CVE-2023-29007.patch b/meta/recipes-devtools/git/git/CVE-2023-29007.patch
new file mode 100644
index 0000000000..472f4022b2
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2023-29007.patch
@@ -0,0 +1,162 @@
+From 057c07a7b1fae22fdeef26c243f4cfbe3afc90ce Mon Sep 17 00:00:00 2001
+From: Taylor Blau <me@ttaylorr.com>
+Date: Fri, 14 Apr 2023 11:46:59 -0400
+Subject: [PATCH] Merge branch 'tb/config-copy-or-rename-in-file-injection'
+
+Avoids issues with renaming or deleting sections with long lines, where
+configuration values may be interpreted as sections, leading to
+configuration injection. Addresses CVE-2023-29007.
+
+* tb/config-copy-or-rename-in-file-injection:
+  config.c: disallow overly-long lines in `copy_or_rename_section_in_file()`
+  config.c: avoid integer truncation in `copy_or_rename_section_in_file()`
+  config: avoid fixed-sized buffer when renaming/deleting a section
+  t1300: demonstrate failure when renaming sections with long lines
+
+Signed-off-by: Taylor Blau <me@ttaylorr.com>
+
+Upstream-Status: Backport
+CVE: CVE-2023-29007
+
+Reference to upstream patch:
+https://github.com/git/git/commit/528290f8c61222433a8cf02fb7cfffa8438432b4
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ config.c          | 36 +++++++++++++++++++++++++-----------
+ t/t1300-config.sh | 30 ++++++++++++++++++++++++++++++
+ 2 files changed, 55 insertions(+), 11 deletions(-)
+
+diff --git a/config.c b/config.c
+index 2bffa8d..6a01938 100644
+--- a/config.c
++++ b/config.c
+@@ -3192,9 +3192,10 @@ void git_config_set_multivar(const char *key, const char *value,
+					flags);
+ }
+
+-static int section_name_match (const char *buf, const char *name)
++static size_t section_name_match (const char *buf, const char *name)
+ {
+-	int i = 0, j = 0, dot = 0;
++	size_t i = 0, j = 0;
++	int dot = 0;
+	if (buf[i] != '[')
+		return 0;
+	for (i = 1; buf[i] && buf[i] != ']'; i++) {
+@@ -3247,6 +3248,8 @@ static int section_name_is_ok(const char *name)
+	return 1;
+ }
+
++#define GIT_CONFIG_MAX_LINE_LEN (512 * 1024)
++
+ /* if new_name == NULL, the section is removed instead */
+ static int git_config_copy_or_rename_section_in_file(const char *config_filename,
+				      const char *old_name,
+@@ -3256,11 +3259,12 @@ static int git_config_copy_or_rename_section_in_file(const char *config_filename
+	char *filename_buf = NULL;
+	struct lock_file lock = LOCK_INIT;
+	int out_fd;
+-	char buf[1024];
++	struct strbuf buf = STRBUF_INIT;
+	FILE *config_file = NULL;
+	struct stat st;
+	struct strbuf copystr = STRBUF_INIT;
+	struct config_store_data store;
++	uint32_t line_nr = 0;
+
+	memset(&store, 0, sizeof(store));
+
+@@ -3297,16 +3301,25 @@ static int git_config_copy_or_rename_section_in_file(const char *config_filename
+		goto out;
+	}
+
+-	while (fgets(buf, sizeof(buf), config_file)) {
+-		unsigned i;
+-		int length;
++	while (!strbuf_getwholeline(&buf, config_file, '\n')) {
++		size_t i, length;
+		int is_section = 0;
+-		char *output = buf;
+-		for (i = 0; buf[i] && isspace(buf[i]); i++)
++		char *output = buf.buf;
++
++		line_nr++;
++
++		if (buf.len >= GIT_CONFIG_MAX_LINE_LEN) {
++			ret = error(_("refusing to work with overly long line "
++				      "in '%s' on line %"PRIuMAX),
++				    config_filename, (uintmax_t)line_nr);
++			goto out;
++		}
++
++		for (i = 0; buf.buf[i] && isspace(buf.buf[i]); i++)
+			; /* do nothing */
+-		if (buf[i] == '[') {
++		if (buf.buf[i] == '[') {
+			/* it's a section */
+-			int offset;
++			size_t offset;
+			is_section = 1;
+
+			/*
+@@ -3323,7 +3336,7 @@ static int git_config_copy_or_rename_section_in_file(const char *config_filename
+				strbuf_reset(&copystr);
+			}
+
+-			offset = section_name_match(&buf[i], old_name);
++			offset = section_name_match(&buf.buf[i], old_name);
+			if (offset > 0) {
+				ret++;
+				if (new_name == NULL) {
+@@ -3398,6 +3411,7 @@ static int git_config_copy_or_rename_section_in_file(const char *config_filename
+ out_no_rollback:
+	free(filename_buf);
+	config_store_data_clear(&store);
++	strbuf_release(&buf);
+	return ret;
+ }
+
+diff --git a/t/t1300-config.sh b/t/t1300-config.sh
+index 78359f1..b07feb1 100755
+--- a/t/t1300-config.sh
++++ b/t/t1300-config.sh
+@@ -617,6 +617,36 @@ test_expect_success 'renaming to bogus section is rejected' '
+	test_must_fail git config --rename-section branch.zwei "bogus name"
+ '
+
++test_expect_success 'renaming a section with a long line' '
++	{
++		printf "[b]\\n" &&
++		printf "  c = d %1024s [a] e = f\\n" " " &&
++		printf "[a] g = h\\n"
++	} >y &&
++	git config -f y --rename-section a xyz &&
++	test_must_fail git config -f y b.e
++'
++
++test_expect_success 'renaming an embedded section with a long line' '
++	{
++		printf "[b]\\n" &&
++		printf "  c = d %1024s [a] [foo] e = f\\n" " " &&
++		printf "[a] g = h\\n"
++	} >y &&
++	git config -f y --rename-section a xyz &&
++	test_must_fail git config -f y foo.e
++'
++
++test_expect_success 'renaming a section with an overly-long line' '
++	{
++		printf "[b]\\n" &&
++		printf "  c = d %525000s e" " " &&
++		printf "[a] g = h\\n"
++	} >y &&
++	test_must_fail git config -f y --rename-section a xyz 2>err &&
++	test_i18ngrep "refusing to work with overly long line in .y. on line 2" err
++'
++
+ cat >> .git/config << EOF
+   [branch "zwei"] a = 1 [branch "vier"]
+ EOF
+--
+2.40.0
diff --git a/meta/recipes-devtools/git/git_2.35.7.bb b/meta/recipes-devtools/git/git_2.35.7.bb
index faf0b67051..199ac950fa 100644
--- a/meta/recipes-devtools/git/git_2.35.7.bb
+++ b/meta/recipes-devtools/git/git_2.35.7.bb
@@ -10,6 +10,7 @@ PROVIDES:append:class-native = " git-replacement-native"
 SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
            file://fixsort.patch \
            file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch \
+           file://CVE-2023-29007.patch \
            "
 
 S = "${WORKDIR}/git-${PV}"
-- 
2.34.1


