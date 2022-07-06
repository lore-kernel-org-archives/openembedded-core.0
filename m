Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D76CECCA473
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 08:07:41 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web08.3741.1657094852829277067
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YwYNkrT7;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id g26so25667048ejb.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P4FF2h0CZcew3F9hB7ENZXctKazdb0o8eG6U5hYrRW0=;
        b=YwYNkrT7n7lAGrAFUPK6hDWx29obxaZfQsrfz6reEV74J3xCGfeMmO9wWb4ILk2Nnv
         k2Yjp30MutWkauphgu7PZ5lqELaPlwofSiqbiJuZiW3544QpSjA6IdzKKveL1JKMjne0
         e8F3yYXD3mYrGRL7PN2ovIUNPIjv0nlcWGDsSG2FuzBk15n63Xl5QBB6LNzAGpW1EY3J
         ZBuJcuZWGe49DRuqqkZLFElg/PbXI4NOMoch0YEuf3Ij1wH0ypgVr22FAX+wRLedIN40
         kj0a0SaV6/EAFBahsu9HDpDlwmh0Vy+TLAcNsVyMkrV9jtAOL7CuLMTCTUv6x6nFvJoM
         +KTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P4FF2h0CZcew3F9hB7ENZXctKazdb0o8eG6U5hYrRW0=;
        b=d+F2ED8eWZfwAUNTiO2xLl12Qvd4Bw76206BzEKXAS97VUi2fFM3e6So0lDgRfgAQO
         mY7Z8hPTrRzjc1HmDXLmuHJvHfjH76HYX5DYhYU5nOYzzmOtcae/NJJvUDOtz/rgy7qj
         A0f5GmmqowuLgatUroMgw82EXwmMkuLMJJnf4oZ0/b1Hknb820iia/eoLwBP53+Gw+er
         Ga152Bi/flJ3pPTntUnWpONOrssgC6lIIXVdx49V+wvxsOtH1lVTjzZC8t5PzmR6vUFP
         nfjoPC1OPkomDHNSXz0F5yshMLxb7dHIFaY7nBcQ6vvkahOZDhV1HStwupO4yba/PTRt
         KZCA==
X-Gm-Message-State: AJIora/P8K1IqbB9RMzTzjg6I7g+YFRD2qfwvKsv/TPVaEw12tB6KWdl
	PwMupBf37PEwShPHLCjs5QCF25C/JR7QEg==
X-Google-Smtp-Source: 
 AGRyM1ujsUg0qQaXOSP9bvJnIZu/9rVBFUZZCAguZqlJ+BFEbna8AIjUTqO/ja8vWkUfjFBYKepJuA==
X-Received: by 2002:a17:907:1693:b0:726:4322:c330 with SMTP id
 hc19-20020a170907169300b007264322c330mr38397875ejc.9.1657094851305;
        Wed, 06 Jul 2022 01:07:31 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 v19-20020a170906381300b00721d8e5bf0bsm17001344ejc.6.2022.07.06.01.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 01:07:30 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/27] kmod: upgrade 29 -> 30
Date: Wed,  6 Jul 2022 10:07:01 +0200
Message-Id: <20220706080721.3072553-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220706080721.3072553-1-alex@linutronix.de>
References: <20220706080721.3072553-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 08:07:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167694

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...dd-support-for-excluding-a-directory.patch | 172 ------------------
 .../kmod/{kmod_29.bb => kmod_30.bb}           |   3 +-
 2 files changed, 1 insertion(+), 174 deletions(-)
 delete mode 100644 meta/recipes-kernel/kmod/kmod/0001-depmod-Add-support-for-excluding-a-directory.patch
 rename meta/recipes-kernel/kmod/{kmod_29.bb => kmod_30.bb} (96%)

diff --git a/meta/recipes-kernel/kmod/kmod/0001-depmod-Add-support-for-excluding-a-directory.patch b/meta/recipes-kernel/kmod/kmod/0001-depmod-Add-support-for-excluding-a-directory.patch
deleted file mode 100644
index ea0570af2b..0000000000
--- a/meta/recipes-kernel/kmod/kmod/0001-depmod-Add-support-for-excluding-a-directory.patch
+++ /dev/null
@@ -1,172 +0,0 @@
-From f50e2d67575ac5f256fb853ca9d29aeac92d9a57 Mon Sep 17 00:00:00 2001
-From: Saul Wold <saul.wold@windriver.com>
-Date: Thu, 31 Mar 2022 14:56:28 -0700
-Subject: [PATCH] depmod: Add support for excluding a directory
-
-This adds support to depmod to enable a new exclude directive in
-the depmod.d/*.conf configuration file. Currently depmod
-already excludes directories named source or build. This change
-will allow additional directories like .debug to be excluded also
-via a new exclude directive.
-
-depmod.d/exclude.conf example:
-exclude	.debug
-
-Upstream-Status: Accepted
-
-Signed-off-by: Saul Wold <saul.wold@windriver.com>
-[ Fix warnings and make should_exclude_dir() return bool ]
-Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
----
- man/depmod.d.xml | 14 ++++++++++
- tools/depmod.c   | 66 +++++++++++++++++++++++++++++++++++++++++++++---
- 2 files changed, 76 insertions(+), 4 deletions(-)
-
-diff --git a/man/depmod.d.xml b/man/depmod.d.xml
-index b315e93..76548e9 100644
---- a/man/depmod.d.xml
-+++ b/man/depmod.d.xml
-@@ -131,6 +131,20 @@
-           </para>
-         </listitem>
-       </varlistentry>
-+      <varlistentry>
-+        <term>exclude <replaceable>excludedir</replaceable>
-+        </term>
-+        <listitem>
-+          <para>
-+            This specifies the trailing directories that will be excluded
-+            during the search for kernel modules.
-+          </para>
-+          <para>
-+	    The <replaceable>excludedir</replaceable> is the trailing directory
-+	    to exclude
-+          </para>
-+        </listitem>
-+      </varlistentry>
-     </variablelist>
-   </refsect1>
- 
-diff --git a/tools/depmod.c b/tools/depmod.c
-index 07a35ba..4117dd1 100644
---- a/tools/depmod.c
-+++ b/tools/depmod.c
-@@ -458,6 +458,11 @@ struct cfg_external {
- 	char path[];
- };
- 
-+struct cfg_exclude {
-+	struct cfg_exclude *next;
-+	char exclude_dir[];
-+};
-+
- struct cfg {
- 	const char *kversion;
- 	char dirname[PATH_MAX];
-@@ -469,6 +474,7 @@ struct cfg {
- 	struct cfg_override *overrides;
- 	struct cfg_search *searches;
- 	struct cfg_external *externals;
-+	struct cfg_exclude *excludes;
- };
- 
- static enum search_type cfg_define_search_type(const char *path)
-@@ -580,6 +586,30 @@ static void cfg_external_free(struct cfg_external *ext)
- 	free(ext);
- }
- 
-+static int cfg_exclude_add(struct cfg *cfg, const char *path)
-+{
-+	struct cfg_exclude *exc;
-+	size_t len = strlen(path);
-+
-+	exc = malloc(sizeof(struct cfg_exclude) + len + 1);
-+	if (exc == NULL) {
-+		ERR("exclude add: out of memory\n");
-+		return -ENOMEM;
-+	}
-+	memcpy(exc->exclude_dir, path, len + 1);
-+
-+	DBG("exclude add: %s\n", path);
-+
-+	exc->next = cfg->excludes;
-+	cfg->excludes = exc;
-+	return 0;
-+}
-+
-+static void cfg_exclude_free(struct cfg_exclude *exc)
-+{
-+	free(exc);
-+}
-+
- static int cfg_kernel_matches(const struct cfg *cfg, const char *pattern)
- {
- 	regex_t re;
-@@ -657,6 +687,11 @@ static int cfg_file_parse(struct cfg *cfg, const char *filename)
- 			}
- 
- 			cfg_external_add(cfg, dir);
-+		} else if (streq(cmd, "exclude")) {
-+			const char *sp;
-+			while ((sp = strtok_r(NULL, "\t ", &saveptr)) != NULL) {
-+				cfg_exclude_add(cfg, sp);
-+			}
- 		} else if (streq(cmd, "include")
- 				|| streq(cmd, "make_map_files")) {
- 			INF("%s:%u: command %s not implemented yet\n",
-@@ -857,6 +892,12 @@ static void cfg_free(struct cfg *cfg)
- 		cfg->externals = cfg->externals->next;
- 		cfg_external_free(tmp);
- 	}
-+
-+	while (cfg->excludes) {
-+		struct cfg_exclude *tmp = cfg->excludes;
-+		cfg->excludes = cfg->excludes->next;
-+		cfg_exclude_free(tmp);
-+	}
- }
- 
- 
-@@ -1229,6 +1270,25 @@ add:
- 	return 0;
- }
- 
-+static bool should_exclude_dir(const struct cfg *cfg, const char *name)
-+{
-+	struct cfg_exclude *exc;
-+
-+	if (name[0] == '.' && (name[1] == '\0' ||
-+			(name[1] == '.' && name[2] == '\0')))
-+		return true;
-+
-+	if (streq(name, "build") || streq(name, "source"))
-+		return true;
-+
-+	for (exc = cfg->excludes; exc != NULL; exc = exc->next) {
-+		if (streq(name, exc->exclude_dir))
-+			return true;
-+	}
-+
-+	return false;
-+}
-+
- static int depmod_modules_search_dir(struct depmod *depmod, DIR *d, size_t baselen, struct scratchbuf *s_path)
- {
- 	struct dirent *de;
-@@ -1240,11 +1300,9 @@ static int depmod_modules_search_dir(struct depmod *depmod, DIR *d, size_t basel
- 		size_t namelen;
- 		uint8_t is_dir;
- 
--		if (name[0] == '.' && (name[1] == '\0' ||
--				       (name[1] == '.' && name[2] == '\0')))
--			continue;
--		if (streq(name, "build") || streq(name, "source"))
-+		if (should_exclude_dir(depmod->cfg, name))
- 			continue;
-+
- 		namelen = strlen(name);
- 		if (scratchbuf_alloc(s_path, baselen + namelen + 2) < 0) {
- 			err = -ENOMEM;
--- 
-2.31.1
-
diff --git a/meta/recipes-kernel/kmod/kmod_29.bb b/meta/recipes-kernel/kmod/kmod_30.bb
similarity index 96%
rename from meta/recipes-kernel/kmod/kmod_29.bb
rename to meta/recipes-kernel/kmod/kmod_30.bb
index 32dc49c126..8eb83efe6d 100644
--- a/meta/recipes-kernel/kmod/kmod_29.bb
+++ b/meta/recipes-kernel/kmod/kmod_30.bb
@@ -15,12 +15,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                    "
 inherit autotools bash-completion gtk-doc pkgconfig manpages update-alternatives
 
-SRCREV = "b6ecfc916a17eab8f93be5b09f4e4f845aabd3d1"
+SRCREV = "5d46434a63ae0160150a0efdde1914873697e273"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git;branch=master \
            file://depmod-search.conf \
            file://avoid_parallel_tests.patch \
-           file://0001-depmod-Add-support-for-excluding-a-directory.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.30.2


