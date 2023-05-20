Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 525D6C77B7D
	for <webhook@archiver.kernel.org>; Sat, 20 May 2023 16:05:25 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.13613.1684598719094240004
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 May 2023 09:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=cBxrxCOL;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-64d30ab1ef2so1353775b3a.2
        for <openembedded-core@lists.openembedded.org>; Sat, 20 May 2023 09:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684598718; x=1687190718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oWjA9fIz4PL1lT6H1Bq+jYL+y5L1+anVWSzTTmCANCo=;
        b=cBxrxCOLuh/0WBptb/BomMtZjpjyhuX7GoJ89WKSwnBL861hIw2A66WYG3XO1DIDni
         VepfMCsM8g+1WUzMXMdDhkHaMYaHTIYAdt0nzMD4oWqcpEXXxTecwuCru38wgLUCnUZ4
         AF3BffLNmWmTLU9AWXJpZg32fAc6xOja1S/siPH/CraIEj3mdQrb7JxRReDEDC6cVTUL
         VnUlLVf6pvwNIwrijQuR792/fEj/77u0PmXDU6RfvdXXmrkUXTJpIZBbAUV29LjQ88hS
         eRzjlgseXEhkp+c9vkfeCuq4dJMJx3rLqKf0EoEd7guKLUB4nRaqOdXQkstv6hXQRr0e
         Gt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684598718; x=1687190718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oWjA9fIz4PL1lT6H1Bq+jYL+y5L1+anVWSzTTmCANCo=;
        b=CvvOPKbTa3x/uGFZKmuOND4cRaicofC+Wxtk0/kkoi9jGANCANHXcHZI7U++Ka731Z
         sJAbl7gy/g82Hoi3rcCTI7frXJmEqSjJFZuRUSRD0LjMgbbtIvQDGo9CKniSqi27lz/O
         TZBekWfycr1x36IcjiEFUym+GuswJUjqiRjfZH3yvC5SHR4RC+TwM9rKWULx5qNcZxe7
         IgNABltPxVfqnrAXi/xMSHeZovCGin+XzdN09rhf12BMLP076g5hb5OZZdykBqamAH4T
         YiNKdFo6VE6hUpBNLZ1ZLup2O62r04Kus8qvtIVTJNchVbMn/sqxyUMbXaGjzwHmIiwt
         IQ9w==
X-Gm-Message-State: AC+VfDzrrEtRYeoN3436u/AKxOEuCHwRdHZCC/5lge0zLkjn3BXkQ7h5
	xHaf20bEh1anZaSm0OGo3IcWxBEmsXqt2rnylU4=
X-Google-Smtp-Source: ACHHUZ4HtNS7x+djrvBip7WoqSqqqpX7EpBi6GkLnBXbBmu1VJYjlVxlTUnimCsXRkqQjX/VlAuMRQ==
X-Received: by 2002:a05:6a00:18a3:b0:640:e12a:3a20 with SMTP id x35-20020a056a0018a300b00640e12a3a20mr8505041pfh.1.1684598718099;
        Sat, 20 May 2023 09:05:18 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a24-20020a62e218000000b00642f1e03dc1sm1457790pfi.174.2023.05.20.09.05.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 May 2023 09:05:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/11] git: fix CVE-2023-29007
Date: Sat, 20 May 2023 06:04:57 -1000
Message-Id: <db4c152441aebe4c04a7bb7aceb88d8941a6576b.1684598568.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684598568.git.steve@sakoman.com>
References: <cover.1684598568.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 May 2023 16:05:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181564

From: Hitendra Prajapati <hprajapati@mvista.com>

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

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../git/files/CVE-2023-29007.patch            | 159 ++++++++++++++++++
 meta/recipes-devtools/git/git.inc             |   1 +
 2 files changed, 160 insertions(+)
 create mode 100644 meta/recipes-devtools/git/files/CVE-2023-29007.patch

diff --git a/meta/recipes-devtools/git/files/CVE-2023-29007.patch b/meta/recipes-devtools/git/files/CVE-2023-29007.patch
new file mode 100644
index 0000000000..e166c01412
--- /dev/null
+++ b/meta/recipes-devtools/git/files/CVE-2023-29007.patch
@@ -0,0 +1,159 @@
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
+Upstream-Status: Backport [https://github.com/git/git/commit/528290f8c61222433a8cf02fb7cfffa8438432b4]
+CVE: CVE-2023-29007
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ config.c          | 36 +++++++++++++++++++++++++-----------
+ t/t1300-config.sh | 30 ++++++++++++++++++++++++++++++
+ 2 files changed, 55 insertions(+), 11 deletions(-)
+
+diff --git a/config.c b/config.c
+index e7052b3..676b687 100644
+--- a/config.c
++++ b/config.c
+@@ -2987,9 +2987,10 @@ void git_config_set_multivar(const char *key, const char *value,
+ 					multi_replace);
+ }
+ 
+-static int section_name_match (const char *buf, const char *name)
++static size_t section_name_match (const char *buf, const char *name)
+ {
+-	int i = 0, j = 0, dot = 0;
++	size_t i = 0, j = 0;
++	int dot = 0;
+ 	if (buf[i] != '[')
+ 		return 0;
+ 	for (i = 1; buf[i] && buf[i] != ']'; i++) {
+@@ -3042,6 +3043,8 @@ static int section_name_is_ok(const char *name)
+ 	return 1;
+ }
+ 
++#define GIT_CONFIG_MAX_LINE_LEN (512 * 1024)
++
+ /* if new_name == NULL, the section is removed instead */
+ static int git_config_copy_or_rename_section_in_file(const char *config_filename,
+ 				      const char *old_name,
+@@ -3051,11 +3054,12 @@ static int git_config_copy_or_rename_section_in_file(const char *config_filename
+ 	char *filename_buf = NULL;
+ 	struct lock_file lock = LOCK_INIT;
+ 	int out_fd;
+-	char buf[1024];
++	struct strbuf buf = STRBUF_INIT;
+ 	FILE *config_file = NULL;
+ 	struct stat st;
+ 	struct strbuf copystr = STRBUF_INIT;
+ 	struct config_store_data store;
++	uint32_t line_nr = 0;
+ 
+ 	memset(&store, 0, sizeof(store));
+ 
+@@ -3092,16 +3096,25 @@ static int git_config_copy_or_rename_section_in_file(const char *config_filename
+ 		goto out;
+ 	}
+ 
+-	while (fgets(buf, sizeof(buf), config_file)) {
+-		int i;
+-		int length;
++	while (!strbuf_getwholeline(&buf, config_file, '\n')) {
++		size_t i, length;
+ 		int is_section = 0;
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
+ 			; /* do nothing */
+-		if (buf[i] == '[') {
++		if (buf.buf[i] == '[') {
+ 			/* it's a section */
+-			int offset;
++			size_t offset;
+ 			is_section = 1;
+ 
+ 			/*
+@@ -3118,7 +3131,7 @@ static int git_config_copy_or_rename_section_in_file(const char *config_filename
+ 				strbuf_reset(&copystr);
+ 			}
+ 
+-			offset = section_name_match(&buf[i], old_name);
++			offset = section_name_match(&buf.buf[i], old_name);
+ 			if (offset > 0) {
+ 				ret++;
+ 				if (new_name == NULL) {
+@@ -3193,6 +3206,7 @@ static int git_config_copy_or_rename_section_in_file(const char *config_filename
+ out_no_rollback:
+ 	free(filename_buf);
+ 	config_store_data_clear(&store);
++	strbuf_release(&buf);
+ 	return ret;
+ }
+ 
+diff --git a/t/t1300-config.sh b/t/t1300-config.sh
+index 983a0a1..9b67f6b 100755
+--- a/t/t1300-config.sh
++++ b/t/t1300-config.sh
+@@ -616,6 +616,36 @@ test_expect_success 'renaming to bogus section is rejected' '
+ 	test_must_fail git config --rename-section branch.zwei "bogus name"
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
+2.25.1
+
diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 36318eed20..8b864053eb 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -28,6 +28,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
            file://CVE-2023-22490-2.patch \
            file://CVE-2023-22490-3.patch \
            file://CVE-2023-23946.patch \
+           file://CVE-2023-29007.patch \
            "
 S = "${WORKDIR}/git-${PV}"
 
-- 
2.34.1


