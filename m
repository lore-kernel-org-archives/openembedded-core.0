Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD4F2C27C44
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 18:38:26 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.4949.1717094306069774026
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 May 2024 11:38:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=J0qjsinA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-70231ac9093so955592b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 11:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1717094305; x=1717699105; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=atGPPF/NyULmINsv04OmDjHXh/C6bGaWAQKm+9tlnUE=;
        b=J0qjsinAku91woaYFMtkvEGPWjGZ/Jxi+pKVfo3EjCe2D8QASzf8nCAzb3soyeu4HS
         1+wuiR9mtVzucrWxSiqazxuo3yOCEAHFDXZd5u5J+YLjdb/rbwb5o39aEopORRqM2Uxd
         tyGqSgKe0nbqmcQZfYz17OHGrX7q2OrKesYYmIU4edBX/sKZ3xrkbIoNNowURv4adIdQ
         SYZe6w3Rg0PBNYBoFoplc5vhdV2Dllq8OckjlKw40lWw8UIr1Sx7bp1IJ5gvLgO1Wvcf
         qLE5+nsyRMiWDFEk/8VlDwioJ0BFLI/asQcNTWPhBffkHi4dRYXcaYBc92yq4nKo3rMI
         pqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717094305; x=1717699105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=atGPPF/NyULmINsv04OmDjHXh/C6bGaWAQKm+9tlnUE=;
        b=hC3/LJT110I6uQUgkoywl+P2bEcUuoDsiNuhfLVcXoLyWz4aD4B3GPtkXTDSDYt4m7
         mFjC5hgY6fVyX/S5drdLoYANTSX2QVRvfGLw3kA/ubeUmnCRzn726kpygi+8lvcsGwww
         BbNbEvhCnznUzLZLnhrwoZFhY5LFxHw9XLqW6Le1sY9QUBL41MA4NrosEPStzN519MYI
         owfRAJ2SUmkcuGxUwZV/RRGKRPOTTk8bw+UiIl5ftKS2WF7Sc7uTrHh0leVMHNchoitL
         zjmYqSSDqwkobxrsTvdvGBuvHGh7yyZ8vnDvOrrzepNCaYOMfZVitEYtOvhS7wR3vMNA
         lPhQ==
X-Gm-Message-State: AOJu0YzUlqAozDaR3M6zWWKaBNO75ctgCPxWTgnZfcMPbYtFRKg3W1gB
	CYxVROK1a92iEpF3RXwhA19tgDgaf/3tbW7mRF8iHzBH1K1nMI5wdAkxB/0c0BvH27wvN3RTyBO
	N
X-Google-Smtp-Source: AGHT+IGo4ega2HYwA2nP1XySqoGIt8jGqBnToYcKGS9zjp1v20wmtHZ5TVWl0LGn4qSq0awaEMJHcg==
X-Received: by 2002:a05:6a20:7f9b:b0:1b1:d31d:c0c5 with SMTP id adf61e73a8af0-1b264562ef2mr3326351637.37.1717094303957;
        Thu, 30 May 2024 11:38:23 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702423dbfc4sm62005b3a.66.2024.05.30.11.38.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 11:38:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/7] git: Fix multiple CVEs
Date: Thu, 30 May 2024 11:38:06 -0700
Message-Id: <209c41377abf6853455b00af3923f1b244a3766b.1717094145.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717094145.git.steve@sakoman.com>
References: <cover.1717094145.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 18:38:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200045

From: Soumya Sambu <soumya.sambu@windriver.com>

CVE-2024-32002:
Git is a revision control system. Prior to versions 2.45.1, 2.44.1, 2.43.4,
2.42.2, 2.41.1, 2.40.2, and 2.39.4, repositories with submodules can be
crafted in a way that exploits a bug in Git whereby it can be fooled into
writing files not into the submodule's worktree but into a `.git/` directory.
This allows writing a hook that will be executed while the clone operation
is still running, giving the user no opportunity to inspect the code that is
being executed. The problem has been patched in versions 2.45.1, 2.44.1,
2.43.4, 2.42.2, 2.41.1, 2.40.2, and 2.39.4. If symbolic link support is
disabled in Git (e.g. via `git config --global core.symlinks false`), the
described attack won't work. As always, it is best to avoid cloning
repositories from untrusted sources.

CVE-2024-32004:
Git is a revision control system. Prior to versions 2.45.1, 2.44.1, 2.43.4,
2.42.2, 2.41.1, 2.40.2, and 2.39.4, an attacker can prepare a local repository
in such a way that, when cloned, will execute arbitrary code during the
operation. The problem has been patched in versions 2.45.1, 2.44.1, 2.43.4,
2.42.2, 2.41.1, 2.40.2, and 2.39.4. As a workaround, avoid cloning repositories
from untrusted sources.

CVE-2024-32020:
Git is a revision control system. Prior to versions 2.45.1, 2.44.1, 2.43.4,
2.42.2, 2.41.1, 2.40.2, and 2.39.4, local clones may end up hardlinking files
into the target repository's object database when source and target repository
reside on the same disk. If the source repository is owned by a different user,
then those hardlinked files may be rewritten at any point in time by the
untrusted user. Cloning local repositories will cause Git to either copy or
hardlink files of the source repository into the target repository. This
significantly speeds up such local clones compared to doing a "proper" clone and
saves both disk space and compute time. When cloning a repository located on the
same disk that is owned by a different user than the current user we also end up
creating such hardlinks. These files will continue to be owned and controlled by
the potentially-untrusted user and can be rewritten by them at will in the
future. The problem has been patched in versions 2.45.1, 2.44.1, 2.43.4, 2.42.2,
2.41.1, 2.40.2, and 2.39.4.

CVE-2024-32021:
Git is a revision control system. Prior to versions 2.45.1, 2.44.1, 2.43.4,
2.42.2, 2.41.1, 2.40.2, and 2.39.4, when cloning a local source repository that
contains symlinks via the filesystem, Git may create hardlinks to arbitrary
user-readable files on the same filesystem as the target repository in the
`objects/` directory. Cloning a local repository over the filesystem may
creating hardlinks to arbitrary user-owned files on the same filesystem in the
target Git repository's `objects/` directory. When cloning a repository over the
filesystem (without explicitly specifying the `file://` protocol or `--no-local`),
the optimizations for local cloning will be used, which include attempting to
hard link the object files instead of copying them. While the code includes checks
against symbolic links in the source repository, which were added during the fix
for CVE-2022-39253, these checks can still be raced because the hard link
operation ultimately follows symlinks. If the object on the filesystem appears as
a file during the check, and then a symlink during the operation, this will allow
the adversary to bypass the check and create hardlinks in the destination objects
directory to arbitrary, user-readable files. The problem has been patched in
versions 2.45.1, 2.44.1, 2.43.4, 2.42.2, 2.41.1, 2.40.2, and 2.39.4.

CVE-2024-32465:
Git is a revision control system. The Git project recommends to avoid working in
untrusted repositories, and instead to clone it first with `git clone --no-local`
to obtain a clean copy. Git has specific protections to make that a safe
operation even with an untrusted source repository, but vulnerabilities allow
those protections to be bypassed. In the context of cloning local repositories
owned by other users, this vulnerability has been covered in CVE-2024-32004. But
there are circumstances where the fixes for CVE-2024-32004 are not enough: For
example, when obtaining a `.zip` file containing a full copy of a Git repository,
it should not be trusted by default to be safe, as e.g. hooks could be configured
to run within the context of that repository. The problem has been patched in
versions 2.45.1, 2.44.1, 2.43.4, 2.42.2, 2.41.1, 2.40.2, and 2.39.4. As a
workaround, avoid using Git in repositories that have been obtained via archives
from untrusted sources.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-32002
https://nvd.nist.gov/vuln/detail/CVE-2024-32004
https://nvd.nist.gov/vuln/detail/CVE-2024-32020
https://nvd.nist.gov/vuln/detail/CVE-2024-32021
https://nvd.nist.gov/vuln/detail/CVE-2024-32465

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../git/git/CVE-2024-32002-0001.patch         |  69 ++++++
 .../git/git/CVE-2024-32002-0002.patch         | 213 ++++++++++++++++++
 .../git/git/CVE-2024-32002-0003.patch         | 141 ++++++++++++
 .../git/git/CVE-2024-32002-0004.patch         | 150 ++++++++++++
 .../git/git/CVE-2024-32004-0001.patch         |  95 ++++++++
 .../git/git/CVE-2024-32004-0002.patch         | 187 +++++++++++++++
 .../git/git/CVE-2024-32004-0003.patch         | 158 +++++++++++++
 .../git/git/CVE-2024-32020.patch              | 114 ++++++++++
 .../git/git/CVE-2024-32021-0001.patch         |  89 ++++++++
 .../git/git/CVE-2024-32021-0002.patch         |  65 ++++++
 .../git/git/CVE-2024-32465.patch              | 206 +++++++++++++++++
 meta/recipes-devtools/git/git_2.35.7.bb       |  11 +
 12 files changed, 1498 insertions(+)
 create mode 100644 meta/recipes-devtools/git/git/CVE-2024-32002-0001.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2024-32002-0002.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2024-32002-0003.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2024-32002-0004.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2024-32004-0001.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2024-32004-0002.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2024-32004-0003.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2024-32020.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2024-32021-0001.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2024-32021-0002.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2024-32465.patch

diff --git a/meta/recipes-devtools/git/git/CVE-2024-32002-0001.patch b/meta/recipes-devtools/git/git/CVE-2024-32002-0001.patch
new file mode 100644
index 0000000000..c424562e05
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2024-32002-0001.patch
@@ -0,0 +1,69 @@
+From 21496b4c60b2327417c63fc9762096037a185be3 Mon Sep 17 00:00:00 2001
+From: Ævar Arnfjörð Bjarmason <avarab@gmail.com>
+Date: Thu, 1 Sep 2022 01:17:54 +0200
+Subject: [PATCH] submodule--helper: use xstrfmt() in clone_submodule()
+
+Use xstrfmt() in clone_submodule() instead of a "struct strbuf" in two
+cases where we weren't getting anything out of using the "struct
+strbuf".
+
+This changes code that was was added along with other uses of "struct
+strbuf" in this function in ee8838d1577 (submodule: rewrite
+`module_clone` shell function in C, 2015-09-08).
+
+Signed-off-by: Ævar Arnfjörð Bjarmason <avarab@gmail.com>
+Reviewed-by: Glen Choo <chooglen@google.com>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+
+CVE: CVE-2024-32002
+
+Upstream-Status: Backport [https://github.com/git/git/commit/21496b4c60b2327417c63fc9762096037a185be3]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ builtin/submodule--helper.c | 17 +++++++++--------
+ 1 file changed, 9 insertions(+), 8 deletions(-)
+
+diff --git a/builtin/submodule--helper.c b/builtin/submodule--helper.c
+index c5d3fc3..79868c3 100644
+--- a/builtin/submodule--helper.c
++++ b/builtin/submodule--helper.c
+@@ -1761,12 +1761,11 @@ static int clone_submodule(struct module_clone_data *clone_data)
+	sm_gitdir = absolute_pathdup(sb.buf);
+	strbuf_reset(&sb);
+
+-	if (!is_absolute_path(clone_data->path)) {
+-		strbuf_addf(&sb, "%s/%s", get_git_work_tree(), clone_data->path);
+-		clone_data->path = strbuf_detach(&sb, NULL);
+-	} else {
++	if (!is_absolute_path(clone_data->path))
++		clone_data->path = xstrfmt("%s/%s", get_git_work_tree(),
++					   clone_data->path);
++	else
+		clone_data->path = xstrdup(clone_data->path);
+-	}
+
+	if (validate_submodule_git_dir(sm_gitdir, clone_data->name) < 0)
+		die(_("refusing to create/use '%s' in another submodule's "
+@@ -1813,14 +1812,16 @@ static int clone_submodule(struct module_clone_data *clone_data)
+			die(_("clone of '%s' into submodule path '%s' failed"),
+			    clone_data->url, clone_data->path);
+	} else {
++		char *path;
++
+		if (clone_data->require_init && !access(clone_data->path, X_OK) &&
+		    !is_empty_dir(clone_data->path))
+			die(_("directory not empty: '%s'"), clone_data->path);
+		if (safe_create_leading_directories_const(clone_data->path) < 0)
+			die(_("could not create directory '%s'"), clone_data->path);
+-		strbuf_addf(&sb, "%s/index", sm_gitdir);
+-		unlink_or_warn(sb.buf);
+-		strbuf_reset(&sb);
++		path = xstrfmt("%s/index", sm_gitdir);
++		unlink_or_warn(path);
++		free(path);
+	}
+
+	connect_work_tree_and_git_dir(clone_data->path, sm_gitdir, 0);
+--
+2.40.0
diff --git a/meta/recipes-devtools/git/git/CVE-2024-32002-0002.patch b/meta/recipes-devtools/git/git/CVE-2024-32002-0002.patch
new file mode 100644
index 0000000000..36cdb746a7
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2024-32002-0002.patch
@@ -0,0 +1,213 @@
+From 6fac5b2f352efc8c246d6d5be63a66b7b0fc0209 Mon Sep 17 00:00:00 2001
+From: Ævar Arnfjörð Bjarmason <avarab@gmail.com>
+Date: Thu, 1 Sep 2022 01:17:56 +0200
+Subject: [PATCH] submodule--helper: add "const" to passed "module_clone_data"
+
+Add "const" to the "struct module_clone_data" that we pass to
+clone_submodule(), which makes the ownership clear, and stops us from
+clobbering the "clone_data->path".
+
+We still need to add to the "reference" member, which is a "struct
+string_list". Let's do this by having clone_submodule() create its
+own, and copy the contents over, allowing us to pass it as a
+separate parameter.
+
+This new "struct string_list" still leaks memory, just as the "struct
+module_clone_data" did before. let's not fix that for now, to fix that
+we'll need to add some "goto cleanup" to the relevant code. That will
+eventually be done in follow-up commits, this change makes it easier
+to fix the memory leak.
+
+The scope of the new "reference" variable in add_submodule() could be
+narrowed to the "else" block, but as we'll eventually free it with a
+"goto cleanup" let's declare it at the start of the function.
+
+Signed-off-by: Ævar Arnfjörð Bjarmason <avarab@gmail.com>
+Reviewed-by: Glen Choo <chooglen@google.com>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+
+CVE: CVE-2024-32002
+
+Upstream-Status: Backport [https://github.com/git/git/commit/6fac5b2f352efc8c246d6d5be63a66b7b0fc0209]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ builtin/submodule--helper.c | 52 ++++++++++++++++++++-----------------
+ 1 file changed, 28 insertions(+), 24 deletions(-)
+
+diff --git a/builtin/submodule--helper.c b/builtin/submodule--helper.c
+index 79868c3..d1d64db 100644
+--- a/builtin/submodule--helper.c
++++ b/builtin/submodule--helper.c
+@@ -1630,14 +1630,13 @@ struct module_clone_data {
+	const char *name;
+	const char *url;
+	const char *depth;
+-	struct string_list reference;
+	unsigned int quiet: 1;
+	unsigned int progress: 1;
+	unsigned int dissociate: 1;
+	unsigned int require_init: 1;
+	int single_branch;
+ };
+-#define MODULE_CLONE_DATA_INIT { .reference = STRING_LIST_INIT_NODUP, .single_branch = -1 }
++#define MODULE_CLONE_DATA_INIT { .single_branch = -1 }
+
+ struct submodule_alternate_setup {
+	const char *submodule_name;
+@@ -1750,22 +1749,24 @@ static void prepare_possible_alternates(const char *sm_name,
+	free(error_strategy);
+ }
+
+-static int clone_submodule(struct module_clone_data *clone_data)
++static int clone_submodule(const struct module_clone_data *clone_data,
++			   struct string_list *reference)
+ {
+	char *p, *sm_gitdir;
+	char *sm_alternate = NULL, *error_strategy = NULL;
+	struct strbuf sb = STRBUF_INIT;
+	struct child_process cp = CHILD_PROCESS_INIT;
++	const char *clone_data_path;
+
+	submodule_name_to_gitdir(&sb, the_repository, clone_data->name);
+	sm_gitdir = absolute_pathdup(sb.buf);
+	strbuf_reset(&sb);
+
+	if (!is_absolute_path(clone_data->path))
+-		clone_data->path = xstrfmt("%s/%s", get_git_work_tree(),
+-					   clone_data->path);
++		clone_data_path = xstrfmt("%s/%s", get_git_work_tree(),
++					  clone_data->path);
+	else
+-		clone_data->path = xstrdup(clone_data->path);
++		clone_data_path = xstrdup(clone_data->path);
+
+	if (validate_submodule_git_dir(sm_gitdir, clone_data->name) < 0)
+		die(_("refusing to create/use '%s' in another submodule's "
+@@ -1775,7 +1776,7 @@ static int clone_submodule(struct module_clone_data *clone_data)
+		if (safe_create_leading_directories_const(sm_gitdir) < 0)
+			die(_("could not create directory '%s'"), sm_gitdir);
+
+-		prepare_possible_alternates(clone_data->name, &clone_data->reference);
++		prepare_possible_alternates(clone_data->name, reference);
+
+		strvec_push(&cp.args, "clone");
+		strvec_push(&cp.args, "--no-checkout");
+@@ -1784,10 +1785,10 @@ static int clone_submodule(struct module_clone_data *clone_data)
+		if (clone_data->progress)
+			strvec_push(&cp.args, "--progress");
+		if (clone_data->depth && *(clone_data->depth))
+-			strvec_pushl(&cp.args, "--depth", clone_data->depth, NULL);
+-		if (clone_data->reference.nr) {
++				strvec_pushl(&cp.args, "--depth", clone_data->depth, NULL);
++		if (reference->nr) {
+			struct string_list_item *item;
+-			for_each_string_list_item(item, &clone_data->reference)
++			for_each_string_list_item(item, reference)
+				strvec_pushl(&cp.args, "--reference",
+					     item->string, NULL);
+		}
+@@ -1802,7 +1803,7 @@ static int clone_submodule(struct module_clone_data *clone_data)
+
+		strvec_push(&cp.args, "--");
+		strvec_push(&cp.args, clone_data->url);
+-		strvec_push(&cp.args, clone_data->path);
++		strvec_push(&cp.args, clone_data_path);
+
+		cp.git_cmd = 1;
+		prepare_submodule_repo_env(&cp.env_array);
+@@ -1810,25 +1811,25 @@ static int clone_submodule(struct module_clone_data *clone_data)
+
+		if(run_command(&cp))
+			die(_("clone of '%s' into submodule path '%s' failed"),
+-			    clone_data->url, clone_data->path);
++			    clone_data->url, clone_data_path);
+	} else {
+		char *path;
+
+-		if (clone_data->require_init && !access(clone_data->path, X_OK) &&
+-		    !is_empty_dir(clone_data->path))
+-			die(_("directory not empty: '%s'"), clone_data->path);
+-		if (safe_create_leading_directories_const(clone_data->path) < 0)
+-			die(_("could not create directory '%s'"), clone_data->path);
++		if (clone_data->require_init && !access(clone_data_path, X_OK) &&
++		    !is_empty_dir(clone_data_path))
++			die(_("directory not empty: '%s'"), clone_data_path);
++		if (safe_create_leading_directories_const(clone_data_path) < 0)
++			die(_("could not create directory '%s'"), clone_data_path);
+		path = xstrfmt("%s/index", sm_gitdir);
+		unlink_or_warn(path);
+		free(path);
+	}
+
+-	connect_work_tree_and_git_dir(clone_data->path, sm_gitdir, 0);
++	connect_work_tree_and_git_dir(clone_data_path, sm_gitdir, 0);
+
+-	p = git_pathdup_submodule(clone_data->path, "config");
++	p = git_pathdup_submodule(clone_data_path, "config");
+	if (!p)
+-		die(_("could not get submodule directory for '%s'"), clone_data->path);
++		die(_("could not get submodule directory for '%s'"), clone_data_path);
+
+	/* setup alternateLocation and alternateErrorStrategy in the cloned submodule if needed */
+	git_config_get_string("submodule.alternateLocation", &sm_alternate);
+@@ -1853,6 +1854,7 @@ static int module_clone(int argc, const char **argv, const char *prefix)
+ {
+	int dissociate = 0, quiet = 0, progress = 0, require_init = 0;
+	struct module_clone_data clone_data = MODULE_CLONE_DATA_INIT;
++	struct string_list reference = STRING_LIST_INIT_NODUP;
+
+	struct option module_clone_options[] = {
+		OPT_STRING(0, "prefix", &clone_data.prefix,
+@@ -1867,7 +1869,7 @@ static int module_clone(int argc, const char **argv, const char *prefix)
+		OPT_STRING(0, "url", &clone_data.url,
+			   N_("string"),
+			   N_("url where to clone the submodule from")),
+-		OPT_STRING_LIST(0, "reference", &clone_data.reference,
++		OPT_STRING_LIST(0, "reference", &reference,
+			   N_("repo"),
+			   N_("reference repository")),
+		OPT_BOOL(0, "dissociate", &dissociate,
+@@ -1905,7 +1907,7 @@ static int module_clone(int argc, const char **argv, const char *prefix)
+		usage_with_options(git_submodule_helper_usage,
+				   module_clone_options);
+
+-	clone_submodule(&clone_data);
++	clone_submodule(&clone_data, &reference);
+	return 0;
+ }
+
+@@ -3029,6 +3031,7 @@ static int add_submodule(const struct add_data *add_data)
+ {
+	char *submod_gitdir_path;
+	struct module_clone_data clone_data = MODULE_CLONE_DATA_INIT;
++	struct string_list reference = STRING_LIST_INIT_NODUP;
+
+	/* perhaps the path already exists and is already a git repo, else clone it */
+	if (is_directory(add_data->sm_path)) {
+@@ -3045,6 +3048,7 @@ static int add_submodule(const struct add_data *add_data)
+		free(submod_gitdir_path);
+	} else {
+		struct child_process cp = CHILD_PROCESS_INIT;
++
+		submod_gitdir_path = xstrfmt(".git/modules/%s", add_data->sm_name);
+
+		if (is_directory(submod_gitdir_path)) {
+@@ -3084,13 +3088,13 @@ static int add_submodule(const struct add_data *add_data)
+		clone_data.quiet = add_data->quiet;
+		clone_data.progress = add_data->progress;
+		if (add_data->reference_path)
+-			string_list_append(&clone_data.reference,
++			string_list_append(&reference,
+					   xstrdup(add_data->reference_path));
+		clone_data.dissociate = add_data->dissociate;
+		if (add_data->depth >= 0)
+			clone_data.depth = xstrfmt("%d", add_data->depth);
+
+-		if (clone_submodule(&clone_data))
++		if (clone_submodule(&clone_data, &reference))
+			return -1;
+
+		prepare_submodule_repo_env(&cp.env_array);
+--
+2.40.0
diff --git a/meta/recipes-devtools/git/git/CVE-2024-32002-0003.patch b/meta/recipes-devtools/git/git/CVE-2024-32002-0003.patch
new file mode 100644
index 0000000000..bb5702e122
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2024-32002-0003.patch
@@ -0,0 +1,141 @@
+From e77b3da6bb60e9af5963c9e42442afe53af1780b Mon Sep 17 00:00:00 2001
+From: Ævar Arnfjörð Bjarmason <avarab@gmail.com>
+Date: Thu, 1 Sep 2022 01:14:08 +0200
+Subject: [PATCH] submodule--helper: fix a leak in "clone_submodule"
+
+Fix a memory leak of the "clone_data_path" variable that we copy or
+derive from the "struct module_clone_data" in clone_submodule(). This
+code was refactored in preceding commits, but the leak has been with
+us since f8eaa0ba98b (submodule--helper, module_clone: always operate
+on absolute paths, 2016-03-31).
+
+For the "else" case we don't need to xstrdup() the "clone_data->path",
+and we don't need to free our own "clone_data_path". We can therefore
+assign the "clone_data->path" to our own "clone_data_path" right away,
+and only override it (and remember to free it!) if we need to
+xstrfmt() a replacement.
+
+In the case of the module_clone() caller it's from "argv", and doesn't
+need to be free'd, and in the case of the add_submodule() caller we
+get a pointer to "sm_path", which doesn't need to be directly free'd
+either.
+
+Fixing this leak makes several tests pass, so let's mark them as
+passing with TEST_PASSES_SANITIZE_LEAK=true.
+
+Signed-off-by: Ævar Arnfjörð Bjarmason <avarab@gmail.com>
+Reviewed-by: Glen Choo <chooglen@google.com>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+
+CVE: CVE-2024-32002
+
+Upstream-Status: Backport [https://github.com/git/git/commit/e77b3da6bb60e9af5963c9e42442afe53af1780b]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ builtin/submodule--helper.c   | 10 +++++-----
+ t/t1500-rev-parse.sh          |  1 +
+ t/t6008-rev-list-submodule.sh |  1 +
+ t/t7414-submodule-mistakes.sh |  2 ++
+ t/t7506-status-submodule.sh   |  1 +
+ t/t7507-commit-verbose.sh     |  2 ++
+ 6 files changed, 12 insertions(+), 5 deletions(-)
+
+diff --git a/builtin/submodule--helper.c b/builtin/submodule--helper.c
+index d1d64db..1158dcc 100644
+--- a/builtin/submodule--helper.c
++++ b/builtin/submodule--helper.c
+@@ -1756,17 +1756,16 @@ static int clone_submodule(const struct module_clone_data *clone_data,
+	char *sm_alternate = NULL, *error_strategy = NULL;
+	struct strbuf sb = STRBUF_INIT;
+	struct child_process cp = CHILD_PROCESS_INIT;
+-	const char *clone_data_path;
++	const char *clone_data_path = clone_data->path;
++	char *to_free = NULL;;
+
+	submodule_name_to_gitdir(&sb, the_repository, clone_data->name);
+	sm_gitdir = absolute_pathdup(sb.buf);
+	strbuf_reset(&sb);
+
+	if (!is_absolute_path(clone_data->path))
+-		clone_data_path = xstrfmt("%s/%s", get_git_work_tree(),
+-					  clone_data->path);
+-	else
+-		clone_data_path = xstrdup(clone_data->path);
++		clone_data_path = to_free = xstrfmt("%s/%s", get_git_work_tree(),
++						    clone_data->path);
+
+	if (validate_submodule_git_dir(sm_gitdir, clone_data->name) < 0)
+		die(_("refusing to create/use '%s' in another submodule's "
+@@ -1847,6 +1846,7 @@ static int clone_submodule(const struct module_clone_data *clone_data,
+	strbuf_release(&sb);
+	free(sm_gitdir);
+	free(p);
++	free(to_free);
+	return 0;
+ }
+
+diff --git a/t/t1500-rev-parse.sh b/t/t1500-rev-parse.sh
+index 2c429f9..81de584 100755
+--- a/t/t1500-rev-parse.sh
++++ b/t/t1500-rev-parse.sh
+@@ -4,6 +4,7 @@ test_description='test git rev-parse'
+ GIT_TEST_DEFAULT_INITIAL_BRANCH_NAME=main
+ export GIT_TEST_DEFAULT_INITIAL_BRANCH_NAME
+
++TEST_PASSES_SANITIZE_LEAK=true
+ . ./test-lib.sh
+
+ test_one () {
+diff --git a/t/t6008-rev-list-submodule.sh b/t/t6008-rev-list-submodule.sh
+index a0a070b..2cdef6f 100755
+--- a/t/t6008-rev-list-submodule.sh
++++ b/t/t6008-rev-list-submodule.sh
+@@ -8,6 +8,7 @@ test_description='git rev-list involving submodules that this repo has'
+ GIT_TEST_DEFAULT_INITIAL_BRANCH_NAME=main
+ export GIT_TEST_DEFAULT_INITIAL_BRANCH_NAME
+
++TEST_PASSES_SANITIZE_LEAK=true
+ . ./test-lib.sh
+
+ test_expect_success 'setup' '
+diff --git a/t/t7414-submodule-mistakes.sh b/t/t7414-submodule-mistakes.sh
+index cf95603..101afff 100755
+--- a/t/t7414-submodule-mistakes.sh
++++ b/t/t7414-submodule-mistakes.sh
+@@ -1,6 +1,8 @@
+ #!/bin/sh
+
+ test_description='handling of common mistakes people may make with submodules'
++
++TEST_PASSES_SANITIZE_LEAK=true
+ . ./test-lib.sh
+
+ test_expect_success 'create embedded repository' '
+diff --git a/t/t7506-status-submodule.sh b/t/t7506-status-submodule.sh
+index 459300c..d050091 100755
+--- a/t/t7506-status-submodule.sh
++++ b/t/t7506-status-submodule.sh
+@@ -2,6 +2,7 @@
+
+ test_description='git status for submodule'
+
++TEST_PASSES_SANITIZE_LEAK=true
+ . ./test-lib.sh
+
+ test_create_repo_with_commit () {
+diff --git a/t/t7507-commit-verbose.sh b/t/t7507-commit-verbose.sh
+index bd0ae4b..916470c 100755
+--- a/t/t7507-commit-verbose.sh
++++ b/t/t7507-commit-verbose.sh
+@@ -1,6 +1,8 @@
+ #!/bin/sh
+
+ test_description='verbose commit template'
++
++TEST_PASSES_SANITIZE_LEAK=true
+ . ./test-lib.sh
+
+ write_script "check-for-diff" <<\EOF &&
+--
+2.40.0
diff --git a/meta/recipes-devtools/git/git/CVE-2024-32002-0004.patch b/meta/recipes-devtools/git/git/CVE-2024-32002-0004.patch
new file mode 100644
index 0000000000..f2af2b48de
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2024-32002-0004.patch
@@ -0,0 +1,150 @@
+From 97065761333fd62db1912d81b489db938d8c991d Mon Sep 17 00:00:00 2001
+From: Johannes Schindelin <johannes.schindelin@gmx.de>
+Date: Fri, 22 Mar 2024 11:19:22 +0100
+Subject: [PATCH] submodules: submodule paths must not contain symlinks
+
+When creating a submodule path, we must be careful not to follow
+symbolic links. Otherwise we may follow a symbolic link pointing to
+a gitdir (which are valid symbolic links!) e.g. while cloning.
+
+On case-insensitive filesystems, however, we blindly replace a directory
+that has been created as part of the `clone` operation with a symlink
+when the path to the latter differs only in case from the former's path.
+
+Let's simply avoid this situation by expecting not ever having to
+overwrite any existing file/directory/symlink upon cloning. That way, we
+won't even replace a directory that we just created.
+
+This addresses CVE-2024-32002.
+
+Reported-by: Filip Hejsek <filip.hejsek@gmail.com>
+Signed-off-by: Johannes Schindelin <johannes.schindelin@gmx.de>
+
+CVE: CVE-2024-32002
+
+Upstream-Status: Backport [https://github.com/git/git/commit/97065761333fd62db1912d81b489db938d8c991d]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ builtin/submodule--helper.c | 35 +++++++++++++++++++++++++++++++
+ t/t7406-submodule-update.sh | 42 +++++++++++++++++++++++++++++++++++++
+ 2 files changed, 77 insertions(+)
+
+diff --git a/builtin/submodule--helper.c b/builtin/submodule--helper.c
+index 1158dcc..d4147d8 100644
+--- a/builtin/submodule--helper.c
++++ b/builtin/submodule--helper.c
+@@ -1749,11 +1749,34 @@ static void prepare_possible_alternates(const char *sm_name,
+	free(error_strategy);
+ }
+
++static int dir_contains_only_dotgit(const char *path)
++{
++	DIR *dir = opendir(path);
++	struct dirent *e;
++	int ret = 1;
++
++	if (!dir)
++		return 0;
++
++	e = readdir_skip_dot_and_dotdot(dir);
++	if (!e)
++		ret = 0;
++	else if (strcmp(DEFAULT_GIT_DIR_ENVIRONMENT, e->d_name) ||
++		 (e = readdir_skip_dot_and_dotdot(dir))) {
++		error("unexpected item '%s' in '%s'", e->d_name, path);
++		ret = 0;
++	}
++
++	closedir(dir);
++	return ret;
++}
++
+ static int clone_submodule(const struct module_clone_data *clone_data,
+			   struct string_list *reference)
+ {
+	char *p, *sm_gitdir;
+	char *sm_alternate = NULL, *error_strategy = NULL;
++	struct stat st;
+	struct strbuf sb = STRBUF_INIT;
+	struct child_process cp = CHILD_PROCESS_INIT;
+	const char *clone_data_path = clone_data->path;
+@@ -1772,6 +1795,10 @@ static int clone_submodule(const struct module_clone_data *clone_data,
+		      "git dir"), sm_gitdir);
+
+	if (!file_exists(sm_gitdir)) {
++		if (clone_data->require_init && !stat(clone_data_path, &st) &&
++		    !is_empty_dir(clone_data_path))
++			die(_("directory not empty: '%s'"), clone_data_path);
++
+		if (safe_create_leading_directories_const(sm_gitdir) < 0)
+			die(_("could not create directory '%s'"), sm_gitdir);
+
+@@ -1811,6 +1838,14 @@ static int clone_submodule(const struct module_clone_data *clone_data,
+		if(run_command(&cp))
+			die(_("clone of '%s' into submodule path '%s' failed"),
+			    clone_data->url, clone_data_path);
++
++		if (clone_data->require_init && !stat(clone_data_path, &st) &&
++		    !dir_contains_only_dotgit(clone_data_path)) {
++			char *dot_git = xstrfmt("%s/.git", clone_data_path);
++			unlink(dot_git);
++			free(dot_git);
++			die(_("directory not empty: '%s'"), clone_data_path);
++		}
+	} else {
+		char *path;
+
+diff --git a/t/t7406-submodule-update.sh b/t/t7406-submodule-update.sh
+index 53d419c..00ffdb6 100755
+--- a/t/t7406-submodule-update.sh
++++ b/t/t7406-submodule-update.sh
+@@ -1062,4 +1062,46 @@ test_expect_success 'submodule update --quiet passes quietness to fetch with a s
+	)
+ '
+
++test_expect_success CASE_INSENSITIVE_FS,SYMLINKS \
++	'submodule paths must not follow symlinks' '
++	# This is only needed because we want to run this in a self-contained
++	# test without having to spin up an HTTP server; However, it would not
++	# be needed in a real-world scenario where the submodule is simply
++	# hosted on a public site.
++	test_config_global protocol.file.allow always &&
++	# Make sure that Git tries to use symlinks on Windows
++	test_config_global core.symlinks true &&
++	tell_tale_path="$PWD/tell.tale" &&
++	git init hook &&
++	(
++		cd hook &&
++		mkdir -p y/hooks &&
++		write_script y/hooks/post-checkout <<-EOF &&
++		echo HOOK-RUN >&2
++		echo hook-run >"$tell_tale_path"
++		EOF
++		git add y/hooks/post-checkout &&
++		test_tick &&
++		git commit -m post-checkout
++	) &&
++	hook_repo_path="$(pwd)/hook" &&
++	git init captain &&
++	(
++		cd captain &&
++		git submodule add --name x/y "$hook_repo_path" A/modules/x &&
++		test_tick &&
++		git commit -m add-submodule &&
++		printf .git >dotgit.txt &&
++		git hash-object -w --stdin <dotgit.txt >dot-git.hash &&
++		printf "120000 %s 0\ta\n" "$(cat dot-git.hash)" >index.info &&
++		git update-index --index-info <index.info &&
++		test_tick &&
++		git commit -m add-symlink
++	) &&
++	test_path_is_missing "$tell_tale_path" &&
++	test_must_fail git clone --recursive captain hooked 2>err &&
++	grep "directory not empty" err &&
++	test_path_is_missing "$tell_tale_path"
++'
++
+ test_done
+--
+2.40.0
diff --git a/meta/recipes-devtools/git/git/CVE-2024-32004-0001.patch b/meta/recipes-devtools/git/git/CVE-2024-32004-0001.patch
new file mode 100644
index 0000000000..410f3bc5e1
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2024-32004-0001.patch
@@ -0,0 +1,95 @@
+From 5c5a4a1c05932378d259b1fdd9526cab971656a2 Mon Sep 17 00:00:00 2001
+From: Filip Hejsek <filip.hejsek@gmail.com>
+Date: Sun, 28 Jan 2024 04:29:33 +0100
+Subject: [PATCH] t0411: add tests for cloning from partial repo
+
+Cloning from a partial repository must not fetch missing objects into
+the partial repository, because that can lead to arbitrary code
+execution.
+
+Add a couple of test cases, pretending to the `upload-pack` command (and
+to that command only) that it is working on a repository owned by
+someone else.
+
+Helped-by: Jeff King <peff@peff.net>
+Signed-off-by: Filip Hejsek <filip.hejsek@gmail.com>
+Signed-off-by: Johannes Schindelin <johannes.schindelin@gmx.de>
+
+CVE: CVE-2024-32004
+
+Upstream-Status: Backport [https://github.com/git/git/commit/5c5a4a1c05932378d259b1fdd9526cab971656a2]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ t/t0411-clone-from-partial.sh | 60 +++++++++++++++++++++++++++++++++++
+ 1 file changed, 60 insertions(+)
+ create mode 100755 t/t0411-clone-from-partial.sh
+
+diff --git a/t/t0411-clone-from-partial.sh b/t/t0411-clone-from-partial.sh
+new file mode 100755
+index 0000000..fb72a0a
+--- /dev/null
++++ b/t/t0411-clone-from-partial.sh
+@@ -0,0 +1,60 @@
++#!/bin/sh
++
++test_description='check that local clone does not fetch from promisor remotes'
++
++. ./test-lib.sh
++
++test_expect_success 'create evil repo' '
++	git init tmp &&
++	test_commit -C tmp a &&
++	git -C tmp config uploadpack.allowfilter 1 &&
++	git clone --filter=blob:none --no-local --no-checkout tmp evil &&
++	rm -rf tmp &&
++
++	git -C evil config remote.origin.uploadpack \"\$TRASH_DIRECTORY/fake-upload-pack\" &&
++	write_script fake-upload-pack <<-\EOF &&
++		echo >&2 "fake-upload-pack running"
++		>"$TRASH_DIRECTORY/script-executed"
++		exit 1
++	EOF
++	export TRASH_DIRECTORY &&
++
++	# empty shallow file disables local clone optimization
++	>evil/.git/shallow
++'
++
++test_expect_failure 'local clone must not fetch from promisor remote and execute script' '
++	rm -f script-executed &&
++	test_must_fail git clone \
++		--upload-pack="GIT_TEST_ASSUME_DIFFERENT_OWNER=true git-upload-pack" \
++		evil clone1 2>err &&
++	! grep "fake-upload-pack running" err &&
++	test_path_is_missing script-executed
++'
++
++test_expect_failure 'clone from file://... must not fetch from promisor remote and execute script' '
++	rm -f script-executed &&
++	test_must_fail git clone \
++		--upload-pack="GIT_TEST_ASSUME_DIFFERENT_OWNER=true git-upload-pack" \
++		"file://$(pwd)/evil" clone2 2>err &&
++	! grep "fake-upload-pack running" err &&
++	test_path_is_missing script-executed
++'
++
++test_expect_failure 'fetch from file://... must not fetch from promisor remote and execute script' '
++	rm -f script-executed &&
++	test_must_fail git fetch \
++		--upload-pack="GIT_TEST_ASSUME_DIFFERENT_OWNER=true git-upload-pack" \
++		"file://$(pwd)/evil" 2>err &&
++	! grep "fake-upload-pack running" err &&
++	test_path_is_missing script-executed
++'
++
++test_expect_success 'pack-objects should fetch from promisor remote and execute script' '
++	rm -f script-executed &&
++	echo "HEAD" | test_must_fail git -C evil pack-objects --revs --stdout >/dev/null 2>err &&
++	grep "fake-upload-pack running" err &&
++	test_path_is_file script-executed
++'
++
++test_done
+--
+2.40.0
diff --git a/meta/recipes-devtools/git/git/CVE-2024-32004-0002.patch b/meta/recipes-devtools/git/git/CVE-2024-32004-0002.patch
new file mode 100644
index 0000000000..1727f81950
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2024-32004-0002.patch
@@ -0,0 +1,187 @@
+From 17d3883fe9c88b823002ad9fafb42313ddc3d3d5 Mon Sep 17 00:00:00 2001
+From: Johannes Schindelin <johannes.schindelin@gmx.de>
+Date: Mon, 8 Aug 2022 13:27:47 +0000
+Subject: [PATCH] setup: prepare for more detailed "dubious ownership" messages
+
+When verifying the ownership of the Git directory, we sometimes would
+like to say a bit more about it, e.g. when using a platform-dependent
+code path (think: Windows has the permission model that is so different
+from Unix'), but only when it is a appropriate to actually say
+something.
+
+To allow for that, collect that information and hand it back to the
+caller (whose responsibility it is to show it or not).
+
+Note: We do not actually fill in any platform-dependent information yet,
+this commit just adds the infrastructure to be able to do so.
+
+Based-on-an-idea-by: Junio C Hamano <gitster@pobox.com>
+Signed-off-by: Johannes Schindelin <johannes.schindelin@gmx.de>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+
+CVE: CVE-2024-32004
+
+Upstream-Status: Backport [https://github.com/git/git/commit/17d3883fe9c88b823002ad9fafb42313ddc3d3d5]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ compat/mingw.c    |  2 +-
+ compat/mingw.h    |  2 +-
+ git-compat-util.h |  5 ++++-
+ setup.c           | 25 +++++++++++++++----------
+ 4 files changed, 21 insertions(+), 13 deletions(-)
+
+diff --git a/compat/mingw.c b/compat/mingw.c
+index 41fc163..9306a0e 100644
+--- a/compat/mingw.c
++++ b/compat/mingw.c
+@@ -2658,7 +2658,7 @@ static PSID get_current_user_sid(void)
+	return result;
+ }
+
+-int is_path_owned_by_current_sid(const char *path)
++int is_path_owned_by_current_sid(const char *path, struct strbuf *report)
+ {
+	WCHAR wpath[MAX_PATH];
+	PSID sid = NULL;
+diff --git a/compat/mingw.h b/compat/mingw.h
+index ffa53a4..a1a69c5 100644
+--- a/compat/mingw.h
++++ b/compat/mingw.h
+@@ -457,7 +457,7 @@ char *mingw_query_user_email(void);
+  * Verifies that the specified path is owned by the user running the
+  * current process.
+  */
+-int is_path_owned_by_current_sid(const char *path);
++int is_path_owned_by_current_sid(const char *path, struct strbuf *report);
+ #define is_path_owned_by_current_user is_path_owned_by_current_sid
+
+ /**
+diff --git a/git-compat-util.h b/git-compat-util.h
+index 1c651c8..27b84b8 100644
+--- a/git-compat-util.h
++++ b/git-compat-util.h
+@@ -23,6 +23,9 @@
+ #include <crtdbg.h>
+ #endif
+
++struct strbuf;
++
++
+ #define _FILE_OFFSET_BITS 64
+
+
+@@ -475,7 +478,7 @@ static inline void extract_id_from_env(const char *env, uid_t *id)
+	}
+ }
+
+-static inline int is_path_owned_by_current_uid(const char *path)
++static inline int is_path_owned_by_current_uid(const char *path, struct strbuf *report)
+ {
+	struct stat st;
+	uid_t euid;
+diff --git a/setup.c b/setup.c
+index 8686ffe..1ad7330 100644
+--- a/setup.c
++++ b/setup.c
+@@ -1128,16 +1128,17 @@ static int safe_directory_cb(const char *key, const char *value, void *d)
+  * added, for bare ones their git directory.
+  */
+ static int ensure_valid_ownership(const char *gitfile,
+-				const char *worktree, const char *gitdir)
++				  const char *worktree, const char *gitdir,
++				  struct strbuf *report)
+ {
+	struct safe_directory_data data = {
+		.path = worktree ? worktree : gitdir
+	};
+
+	if (!git_env_bool("GIT_TEST_ASSUME_DIFFERENT_OWNER", 0) &&
+-	   (!gitfile || is_path_owned_by_current_user(gitfile)) &&
+-	   (!worktree || is_path_owned_by_current_user(worktree)) &&
+-	   (!gitdir || is_path_owned_by_current_user(gitdir)))
++	    (!gitfile || is_path_owned_by_current_user(gitfile, report)) &&
++	    (!worktree || is_path_owned_by_current_user(worktree, report)) &&
++	    (!gitdir || is_path_owned_by_current_user(gitdir, report)))
+		return 1;
+
+	/*
+@@ -1177,6 +1178,7 @@ enum discovery_result {
+  */
+ static enum discovery_result setup_git_directory_gently_1(struct strbuf *dir,
+							  struct strbuf *gitdir,
++							  struct strbuf *report,
+							  int die_on_error)
+ {
+	const char *env_ceiling_dirs = getenv(CEILING_DIRECTORIES_ENVIRONMENT);
+@@ -1264,7 +1266,7 @@ static enum discovery_result setup_git_directory_gently_1(struct strbuf *dir,
+
+			if (ensure_valid_ownership(gitfile,
+						 dir->buf,
+-				 (gitdir_path ? gitdir_path : gitdirenv))) {
++				 (gitdir_path ? gitdir_path : gitdirenv), report)) {
+				strbuf_addstr(gitdir, gitdirenv);
+				ret = GIT_DIR_DISCOVERED;
+			} else
+@@ -1287,7 +1289,7 @@ static enum discovery_result setup_git_directory_gently_1(struct strbuf *dir,
+		}
+
+		if (is_git_directory(dir->buf)) {
+-			if (!ensure_valid_ownership(NULL, NULL, dir->buf))
++			if (!ensure_valid_ownership(NULL, NULL, dir->buf, report))
+				return GIT_DIR_INVALID_OWNERSHIP;
+			strbuf_addstr(gitdir, ".");
+			return GIT_DIR_BARE;
+@@ -1320,7 +1322,7 @@ int discover_git_directory(struct strbuf *commondir,
+		return -1;
+
+	cwd_len = dir.len;
+-	if (setup_git_directory_gently_1(&dir, gitdir, 0) <= 0) {
++	if (setup_git_directory_gently_1(&dir, gitdir, NULL, 0) <= 0) {
+		strbuf_release(&dir);
+		return -1;
+	}
+@@ -1367,7 +1369,7 @@ int discover_git_directory(struct strbuf *commondir,
+ const char *setup_git_directory_gently(int *nongit_ok)
+ {
+	static struct strbuf cwd = STRBUF_INIT;
+-	struct strbuf dir = STRBUF_INIT, gitdir = STRBUF_INIT;
++	struct strbuf dir = STRBUF_INIT, gitdir = STRBUF_INIT, report = STRBUF_INIT;
+	const char *prefix = NULL;
+	struct repository_format repo_fmt = REPOSITORY_FORMAT_INIT;
+
+@@ -1392,7 +1394,7 @@ const char *setup_git_directory_gently(int *nongit_ok)
+		die_errno(_("Unable to read current working directory"));
+	strbuf_addbuf(&dir, &cwd);
+
+-	switch (setup_git_directory_gently_1(&dir, &gitdir, 1)) {
++	switch (setup_git_directory_gently_1(&dir, &gitdir, &report, 1)) {
+	case GIT_DIR_EXPLICIT:
+		prefix = setup_explicit_git_dir(gitdir.buf, &cwd, &repo_fmt, nongit_ok);
+		break;
+@@ -1424,12 +1426,14 @@ const char *setup_git_directory_gently(int *nongit_ok)
+		if (!nongit_ok) {
+			struct strbuf quoted = STRBUF_INIT;
+
++			strbuf_complete(&report, '\n');
+			sq_quote_buf_pretty(&quoted, dir.buf);
+			die(_("detected dubious ownership in repository at '%s'\n"
++			      "%s"
+			      "To add an exception for this directory, call:\n"
+			      "\n"
+			      "\tgit config --global --add safe.directory %s"),
+-			    dir.buf, quoted.buf);
++			    dir.buf, report.buf, quoted.buf);
+		}
+		*nongit_ok = 1;
+		break;
+@@ -1508,6 +1512,7 @@ const char *setup_git_directory_gently(int *nongit_ok)
+
+	strbuf_release(&dir);
+	strbuf_release(&gitdir);
++	strbuf_release(&report);
+	clear_repository_format(&repo_fmt);
+
+	return prefix;
+--
+2.40.0
diff --git a/meta/recipes-devtools/git/git/CVE-2024-32004-0003.patch b/meta/recipes-devtools/git/git/CVE-2024-32004-0003.patch
new file mode 100644
index 0000000000..08ca1e596d
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2024-32004-0003.patch
@@ -0,0 +1,158 @@
+From f4aa8c8bb11dae6e769cd930565173808cbb69c8 Mon Sep 17 00:00:00 2001
+From: Johannes Schindelin <johannes.schindelin@gmx.de>
+Date: Wed, 10 Apr 2024 14:39:37 +0200
+Subject: [PATCH] fetch/clone: detect dubious ownership of local repositories
+
+When cloning from somebody else's repositories, it is possible that,
+say, the `upload-pack` command is overridden in the repository that is
+about to be cloned, which would then be run in the user's context who
+started the clone.
+
+To remind the user that this is a potentially unsafe operation, let's
+extend the ownership checks we have already established for regular
+gitdir discovery to extend also to local repositories that are about to
+be cloned.
+
+This protection extends also to file:// URLs.
+
+The fixes in this commit address CVE-2024-32004.
+
+Note: This commit does not touch the `fetch`/`clone` code directly, but
+instead the function used implicitly by both: `enter_repo()`. This
+function is also used by `git receive-pack` (i.e. pushes), by `git
+upload-archive`, by `git daemon` and by `git http-backend`. In setups
+that want to serve repositories owned by different users than the
+account running the service, this will require `safe.*` settings to be
+configured accordingly.
+
+Also note: there are tiny time windows where a time-of-check-time-of-use
+("TOCTOU") race is possible. The real solution to those would be to work
+with `fstat()` and `openat()`. However, the latter function is not
+available on Windows (and would have to be emulated with rather
+expensive low-level `NtCreateFile()` calls), and the changes would be
+quite extensive, for my taste too extensive for the little gain given
+that embargoed releases need to pay extra attention to avoid introducing
+inadvertent bugs.
+
+Signed-off-by: Johannes Schindelin <johannes.schindelin@gmx.de>
+
+CVE: CVE-2024-32004
+
+Upstream-Status: Backport [https://github.com/git/git/commit/f4aa8c8bb11dae6e769cd930565173808cbb69c8]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ cache.h                       | 12 ++++++++++++
+ path.c                        |  2 ++
+ setup.c                       | 21 +++++++++++++++++++++
+ t/t0411-clone-from-partial.sh |  6 +++---
+ 4 files changed, 38 insertions(+), 3 deletions(-)
+
+diff --git a/cache.h b/cache.h
+index 281f00a..a59bdbe 100644
+--- a/cache.h
++++ b/cache.h
+@@ -615,6 +615,18 @@ void set_git_work_tree(const char *tree);
+
+ #define ALTERNATE_DB_ENVIRONMENT "GIT_ALTERNATE_OBJECT_DIRECTORIES"
+
++/*
++ * Check if a repository is safe and die if it is not, by verifying the
++ * ownership of the worktree (if any), the git directory, and the gitfile (if
++ * any).
++ *
++ * Exemptions for known-safe repositories can be added via `safe.directory`
++ * config settings; for non-bare repositories, their worktree needs to be
++ * added, for bare ones their git directory.
++ */
++void die_upon_dubious_ownership(const char *gitfile, const char *worktree,
++				const char *gitdir);
++
+ void setup_work_tree(void);
+ /*
+  * Find the commondir and gitdir of the repository that contains the current
+diff --git a/path.c b/path.c
+index d73146b..ae1fb01 100644
+--- a/path.c
++++ b/path.c
+@@ -840,6 +840,7 @@ const char *enter_repo(const char *path, int strict)
+		if (!suffix[i])
+			return NULL;
+		gitfile = read_gitfile(used_path.buf);
++		die_upon_dubious_ownership(gitfile, NULL, used_path.buf);
+		if (gitfile) {
+			strbuf_reset(&used_path);
+			strbuf_addstr(&used_path, gitfile);
+@@ -850,6 +851,7 @@ const char *enter_repo(const char *path, int strict)
+	}
+	else {
+		const char *gitfile = read_gitfile(path);
++		die_upon_dubious_ownership(gitfile, NULL, path);
+		if (gitfile)
+			path = gitfile;
+		if (chdir(path))
+diff --git a/setup.c b/setup.c
+index 1ad7330..475c92e 100644
+--- a/setup.c
++++ b/setup.c
+@@ -1151,6 +1151,27 @@ static int ensure_valid_ownership(const char *gitfile,
+	return data.is_safe;
+ }
+
++void die_upon_dubious_ownership(const char *gitfile, const char *worktree,
++				const char *gitdir)
++{
++	struct strbuf report = STRBUF_INIT, quoted = STRBUF_INIT;
++	const char *path;
++
++	if (ensure_valid_ownership(gitfile, worktree, gitdir, &report))
++		return;
++
++	strbuf_complete(&report, '\n');
++	path = gitfile ? gitfile : gitdir;
++	sq_quote_buf_pretty(&quoted, path);
++
++	die(_("detected dubious ownership in repository at '%s'\n"
++	      "%s"
++	      "To add an exception for this directory, call:\n"
++	      "\n"
++	      "\tgit config --global --add safe.directory %s"),
++	    path, report.buf, quoted.buf);
++}
++
+ enum discovery_result {
+	GIT_DIR_NONE = 0,
+	GIT_DIR_EXPLICIT,
+diff --git a/t/t0411-clone-from-partial.sh b/t/t0411-clone-from-partial.sh
+index fb72a0a..eb3360d 100755
+--- a/t/t0411-clone-from-partial.sh
++++ b/t/t0411-clone-from-partial.sh
+@@ -23,7 +23,7 @@ test_expect_success 'create evil repo' '
+	>evil/.git/shallow
+ '
+
+-test_expect_failure 'local clone must not fetch from promisor remote and execute script' '
++test_expect_success 'local clone must not fetch from promisor remote and execute script' '
+	rm -f script-executed &&
+	test_must_fail git clone \
+		--upload-pack="GIT_TEST_ASSUME_DIFFERENT_OWNER=true git-upload-pack" \
+@@ -32,7 +32,7 @@ test_expect_failure 'local clone must not fetch from promisor remote and execute
+	test_path_is_missing script-executed
+ '
+
+-test_expect_failure 'clone from file://... must not fetch from promisor remote and execute script' '
++test_expect_success 'clone from file://... must not fetch from promisor remote and execute script' '
+	rm -f script-executed &&
+	test_must_fail git clone \
+		--upload-pack="GIT_TEST_ASSUME_DIFFERENT_OWNER=true git-upload-pack" \
+@@ -41,7 +41,7 @@ test_expect_failure 'clone from file://... must not fetch from promisor remote a
+	test_path_is_missing script-executed
+ '
+
+-test_expect_failure 'fetch from file://... must not fetch from promisor remote and execute script' '
++test_expect_success 'fetch from file://... must not fetch from promisor remote and execute script' '
+	rm -f script-executed &&
+	test_must_fail git fetch \
+		--upload-pack="GIT_TEST_ASSUME_DIFFERENT_OWNER=true git-upload-pack" \
+--
+2.40.0
diff --git a/meta/recipes-devtools/git/git/CVE-2024-32020.patch b/meta/recipes-devtools/git/git/CVE-2024-32020.patch
new file mode 100644
index 0000000000..4dfe742ff7
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2024-32020.patch
@@ -0,0 +1,114 @@
+From 1204e1a824c34071019fe106348eaa6d88f9528d Mon Sep 17 00:00:00 2001
+From: Patrick Steinhardt <ps@pks.im>
+Date: Mon, 15 Apr 2024 13:30:41 +0200
+Subject: [PATCH]  builtin/clone: refuse local clones of unsafe repositories
+
+When performing a local clone of a repository we end up either copying
+or hardlinking the source repository into the target repository. This is
+significantly more performant than if we were to use git-upload-pack(1)
+and git-fetch-pack(1) to create the new repository and preserves both
+disk space and compute time.
+
+Unfortunately though, performing such a local clone of a repository that
+is not owned by the current user is inherently unsafe:
+
+  - It is possible that source files get swapped out underneath us while
+    we are copying or hardlinking them. While we do perform some checks
+    here to assert that we hardlinked the expected file, they cannot
+    reliably thwart time-of-check-time-of-use (TOCTOU) style races. It
+    is thus possible for an adversary to make us copy or hardlink
+    unexpected files into the target directory.
+
+    Ideally, we would address this by starting to use openat(3P),
+    fstatat(3P) and friends. Due to platform compatibility with Windows
+    we cannot easily do that though. Furthermore, the scope of these
+    fixes would likely be quite broad and thus not fit for an embargoed
+    security release.
+
+  - Even if we handled TOCTOU-style races perfectly, hardlinking files
+    owned by a different user into the target repository is not a good
+    idea in general. It is possible for an adversary to rewrite those
+    files to contain whatever data they want even after the clone has
+    completed.
+
+Address these issues by completely refusing local clones of a repository
+that is not owned by the current user. This reuses our existing infra we
+have in place via `ensure_valid_ownership()` and thus allows a user to
+override the safety guard by adding the source repository path to the
+"safe.directory" configuration.
+
+This addresses CVE-2024-32020.
+
+Signed-off-by: Patrick Steinhardt <ps@pks.im>
+Signed-off-by: Johannes Schindelin <johannes.schindelin@gmx.de>
+
+CVE: CVE-2024-32020
+
+Upstream-Status: Backport [https://github.com/git/git/commit/1204e1a824c34071019fe106348eaa6d88f9528d]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ builtin/clone.c           | 14 ++++++++++++++
+ t/t0033-safe-directory.sh | 24 ++++++++++++++++++++++++
+ 2 files changed, 38 insertions(+)
+
+diff --git a/builtin/clone.c b/builtin/clone.c
+index 4541a55..11f6b4b 100644
+--- a/builtin/clone.c
++++ b/builtin/clone.c
+@@ -312,6 +312,20 @@ static void copy_or_link_directory(struct strbuf *src, struct strbuf *dest,
+	int iter_status;
+	struct strbuf realpath = STRBUF_INIT;
+
++	/*
++	 * Refuse copying directories by default which aren't owned by us. The
++	 * code that performs either the copying or hardlinking is not prepared
++	 * to handle various edge cases where an adversary may for example
++	 * racily swap out files for symlinks. This can cause us to
++	 * inadvertently use the wrong source file.
++	 *
++	 * Furthermore, even if we were prepared to handle such races safely,
++	 * creating hardlinks across user boundaries is an inherently unsafe
++	 * operation as the hardlinked files can be rewritten at will by the
++	 * potentially-untrusted user. We thus refuse to do so by default.
++	 */
++	die_upon_dubious_ownership(NULL, NULL, src_repo);
++
+	mkdir_if_missing(dest->buf, 0777);
+
+	iter = dir_iterator_begin(src->buf, DIR_ITERATOR_PEDANTIC);
+diff --git a/t/t0033-safe-directory.sh b/t/t0033-safe-directory.sh
+index 239d93f..751cba5 100755
+--- a/t/t0033-safe-directory.sh
++++ b/t/t0033-safe-directory.sh
+@@ -46,4 +46,28 @@ test_expect_success 'safe.directory=*, but is reset' '
+	expect_rejected_dir
+ '
+
++test_expect_success 'local clone of unowned repo refused in unsafe directory' '
++	test_when_finished "rm -rf source" &&
++	git init source &&
++	(
++		sane_unset GIT_TEST_ASSUME_DIFFERENT_OWNER &&
++		test_commit -C source initial
++	) &&
++	test_must_fail git clone --local source target &&
++	test_path_is_missing target
++'
++
++test_expect_success 'local clone of unowned repo accepted in safe directory' '
++	test_when_finished "rm -rf source" &&
++	git init source &&
++	(
++		sane_unset GIT_TEST_ASSUME_DIFFERENT_OWNER &&
++		test_commit -C source initial
++	) &&
++	test_must_fail git clone --local source target &&
++	git config --global --add safe.directory "$(pwd)/source/.git" &&
++	git clone --local source target &&
++	test_path_is_dir target
++'
++
+ test_done
+--
+2.40.0
diff --git a/meta/recipes-devtools/git/git/CVE-2024-32021-0001.patch b/meta/recipes-devtools/git/git/CVE-2024-32021-0001.patch
new file mode 100644
index 0000000000..cc33c54faa
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2024-32021-0001.patch
@@ -0,0 +1,89 @@
+From 150e6b0aedf57d224c3c49038c306477fa159886 Mon Sep 17 00:00:00 2001
+From: Patrick Steinhardt <ps@pks.im>
+Date: Mon, 15 Apr 2024 13:30:26 +0200
+Subject: [PATCH] builtin/clone: stop resolving symlinks when copying files
+
+When a user performs a local clone without `--no-local`, then we end up
+copying the source repository into the target repository directly. To
+optimize this even further, we try to hardlink files into place instead
+of copying data over, which helps both disk usage and speed.
+
+There is an important edge case in this context though, namely when we
+try to hardlink symlinks from the source repository into the target
+repository. Depending on both platform and filesystem the resulting
+behaviour here can be different:
+
+  - On macOS and NetBSD, calling link(3P) with a symlink target creates
+    a hardlink to the file pointed to by the symlink.
+
+  - On Linux, calling link(3P) instead creates a hardlink to the symlink
+    itself.
+
+To unify this behaviour, 36596fd2df (clone: better handle symlinked
+files at .git/objects/, 2019-07-10) introduced logic to resolve symlinks
+before we try to link(3P) files. Consequently, the new behaviour was to
+always create a hard link to the target of the symlink on all platforms.
+
+Eventually though, we figured out that following symlinks like this can
+cause havoc when performing a local clone of a malicious repository,
+which resulted in CVE-2022-39253. This issue was fixed via 6f054f9fb3
+(builtin/clone.c: disallow `--local` clones with symlinks, 2022-07-28),
+by refusing symlinks in the source repository.
+
+But even though we now shouldn't ever link symlinks anymore, the code
+that resolves symlinks still exists. In the best case the code does not
+end up doing anything because there are no symlinks anymore. In the
+worst case though this can be abused by an adversary that rewrites the
+source file after it has been checked not to be a symlink such that it
+actually is a symlink when we call link(3P). Thus, it is still possible
+to recreate CVE-2022-39253 due to this time-of-check-time-of-use bug.
+
+Remove the call to `realpath()`. This doesn't yet address the actual
+vulnerability, which will be handled in a subsequent commit.
+
+Reported-by: Apple Product Security <product-security@apple.com>
+Signed-off-by: Patrick Steinhardt <ps@pks.im>
+Signed-off-by: Johannes Schindelin <johannes.schindelin@gmx.de>
+
+CVE: CVE-2024-32021
+
+Upstream-Status: Backport [https://github.com/git/git/commit/150e6b0aedf57d224c3c49038c306477fa159886]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ builtin/clone.c | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/builtin/clone.c b/builtin/clone.c
+index 11f6b4b..2778d20 100644
+--- a/builtin/clone.c
++++ b/builtin/clone.c
+@@ -310,7 +310,6 @@ static void copy_or_link_directory(struct strbuf *src, struct strbuf *dest,
+	int src_len, dest_len;
+	struct dir_iterator *iter;
+	int iter_status;
+-	struct strbuf realpath = STRBUF_INIT;
+
+	/*
+	 * Refuse copying directories by default which aren't owned by us. The
+@@ -362,8 +361,7 @@ static void copy_or_link_directory(struct strbuf *src, struct strbuf *dest,
+		if (unlink(dest->buf) && errno != ENOENT)
+			die_errno(_("failed to unlink '%s'"), dest->buf);
+		if (!option_no_hardlinks) {
+-			strbuf_realpath(&realpath, src->buf, 1);
+-			if (!link(realpath.buf, dest->buf))
++			if (!link(src->buf, dest->buf))
+				continue;
+			if (option_local > 0)
+				die_errno(_("failed to create link '%s'"), dest->buf);
+@@ -377,8 +375,6 @@ static void copy_or_link_directory(struct strbuf *src, struct strbuf *dest,
+		strbuf_setlen(src, src_len);
+		die(_("failed to iterate over '%s'"), src->buf);
+	}
+-
+-	strbuf_release(&realpath);
+ }
+
+ static void clone_local(const char *src_repo, const char *dest_repo)
+--
+2.40.0
diff --git a/meta/recipes-devtools/git/git/CVE-2024-32021-0002.patch b/meta/recipes-devtools/git/git/CVE-2024-32021-0002.patch
new file mode 100644
index 0000000000..2151d3d0ea
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2024-32021-0002.patch
@@ -0,0 +1,65 @@
+From d1bb66a546b4bb46005d17ba711caaad26f26c1e Mon Sep 17 00:00:00 2001
+From: Patrick Steinhardt <ps@pks.im>
+Date: Mon, 15 Apr 2024 13:30:31 +0200
+Subject: [PATCH] builtin/clone: abort when hardlinked source and target file
+ differ
+
+When performing local clones with hardlinks we refuse to copy source
+files which are symlinks as a mitigation for CVE-2022-39253. This check
+can be raced by an adversary though by changing the file to a symlink
+after we have checked it.
+
+Fix the issue by checking whether the hardlinked destination file
+matches the source file and abort in case it doesn't.
+
+This addresses CVE-2024-32021.
+
+Reported-by: Apple Product Security <product-security@apple.com>
+Suggested-by: Linus Torvalds <torvalds@linuxfoundation.org>
+Signed-off-by: Patrick Steinhardt <ps@pks.im>
+Signed-off-by: Johannes Schindelin <johannes.schindelin@gmx.de>
+
+CVE: CVE-2024-32021
+
+Upstream-Status: Backport [https://github.com/git/git/commit/d1bb66a546b4bb46005d17ba711caaad26f26c1e]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ builtin/clone.c | 21 ++++++++++++++++++++-
+ 1 file changed, 20 insertions(+), 1 deletion(-)
+
+diff --git a/builtin/clone.c b/builtin/clone.c
+index 2778d20..54eb441 100644
+--- a/builtin/clone.c
++++ b/builtin/clone.c
+@@ -361,8 +361,27 @@ static void copy_or_link_directory(struct strbuf *src, struct strbuf *dest,
+		if (unlink(dest->buf) && errno != ENOENT)
+			die_errno(_("failed to unlink '%s'"), dest->buf);
+		if (!option_no_hardlinks) {
+-			if (!link(src->buf, dest->buf))
++			if (!link(src->buf, dest->buf)) {
++				struct stat st;
++
++				/*
++				 * Sanity-check whether the created hardlink
++				 * actually links to the expected file now. This
++				 * catches time-of-check-time-of-use bugs in
++				 * case the source file was meanwhile swapped.
++				 */
++				if (lstat(dest->buf, &st))
++					die(_("hardlink cannot be checked at '%s'"), dest->buf);
++				if (st.st_mode != iter->st.st_mode ||
++				    st.st_ino != iter->st.st_ino ||
++				    st.st_dev != iter->st.st_dev ||
++				    st.st_size != iter->st.st_size ||
++				    st.st_uid != iter->st.st_uid ||
++				    st.st_gid != iter->st.st_gid)
++					die(_("hardlink different from source at '%s'"), dest->buf);
++
+				continue;
++			}
+			if (option_local > 0)
+				die_errno(_("failed to create link '%s'"), dest->buf);
+			option_no_hardlinks = 1;
+--
+2.40.0
diff --git a/meta/recipes-devtools/git/git/CVE-2024-32465.patch b/meta/recipes-devtools/git/git/CVE-2024-32465.patch
new file mode 100644
index 0000000000..f9e2c1dc5f
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2024-32465.patch
@@ -0,0 +1,206 @@
+From 7b70e9efb18c2cc3f219af399bd384c5801ba1d7 Mon Sep 17 00:00:00 2001
+From: Jeff King <peff@peff.net>
+Date: Tue, 16 Apr 2024 04:35:33 -0400
+Subject: [PATCH] upload-pack: disable lazy-fetching by default
+
+The upload-pack command tries to avoid trusting the repository in which
+it's run (e.g., by not running any hooks and not using any config that
+contains arbitrary commands). But if the server side of a fetch or a
+clone is a partial clone, then either upload-pack or its child
+pack-objects may run a lazy "git fetch" under the hood. And it is very
+easy to convince fetch to run arbitrary commands.
+
+The "server" side can be a local repository owned by someone else, who
+would be able to configure commands that are run during a clone with the
+current user's permissions. This issue has been designated
+CVE-2024-32004.
+
+The fix in this commit's parent helps in this scenario, as well as in
+related scenarios using SSH to clone, where the untrusted .git directory
+is owned by a different user id. But if you received one as a zip file,
+on a USB stick, etc, it may be owned by your user but still untrusted.
+
+This has been designated CVE-2024-32465.
+
+To mitigate the issue more completely, let's disable lazy fetching
+entirely during `upload-pack`. While fetching from a partial repository
+should be relatively rare, it is certainly not an unreasonable workflow.
+And thus we need to provide an escape hatch.
+
+This commit works by respecting a GIT_NO_LAZY_FETCH environment variable
+(to skip the lazy-fetch), and setting it in upload-pack, but only when
+the user has not already done so (which gives us the escape hatch).
+
+The name of the variable is specifically chosen to match what has
+already been added in 'master' via e6d5479e7a (git: extend
+--no-lazy-fetch to work across subprocesses, 2024-02-27). Since we're
+building this fix as a backport for older versions, we could cherry-pick
+that patch and its earlier steps. However, we don't really need the
+niceties (like a "--no-lazy-fetch" option) that it offers. By using the
+same name, everything should just work when the two are eventually
+merged, but here are a few notes:
+
+  - the blocking of the fetch in e6d5479e7a is incomplete! It sets
+    fetch_if_missing to 0 when we setup the repository variable, but
+    that isn't enough. pack-objects in particular will call
+    prefetch_to_pack() even if that variable is 0. This patch by
+    contrast checks the environment variable at the lowest level before
+    we call the lazy fetch, where we can be sure to catch all code
+    paths.
+
+    Possibly the setting of fetch_if_missing from e6d5479e7a can be
+    reverted, but it may be useful to have. For example, some code may
+    want to use that flag to change behavior before it gets to the point
+    of trying to start the fetch. At any rate, that's all outside the
+    scope of this patch.
+
+  - there's documentation for GIT_NO_LAZY_FETCH in e6d5479e7a. We can
+    live without that here, because for the most part the user shouldn't
+    need to set it themselves. The exception is if they do want to
+    override upload-pack's default, and that requires a separate
+    documentation section (which is added here)
+
+  - it would be nice to use the NO_LAZY_FETCH_ENVIRONMENT macro added by
+    e6d5479e7a, but those definitions have moved from cache.h to
+    environment.h between 2.39.3 and master. I just used the raw string
+    literals, and we can replace them with the macro once this topic is
+    merged to master.
+
+At least with respect to CVE-2024-32004, this does render this commit's
+parent commit somewhat redundant. However, it is worth retaining that
+commit as defense in depth, and because it may help other issues (e.g.,
+symlink/hardlink TOCTOU races, where zip files are not really an
+interesting attack vector).
+
+The tests in t0411 still pass, but now we have _two_ mechanisms ensuring
+that the evil command is not run. Let's beef up the existing ones to
+check that they failed for the expected reason, that we refused to run
+upload-pack at all with an alternate user id. And add two new ones for
+the same-user case that both the restriction and its escape hatch.
+
+Signed-off-by: Jeff King <peff@peff.net>
+Signed-off-by: Johannes Schindelin <johannes.schindelin@gmx.de>
+
+CVE: CVE-2024-32465
+
+Upstream-Status: Backport [https://github.com/git/git/commit/7b70e9efb18c2cc3f219af399bd384c5801ba1d7]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ Documentation/git-upload-pack.txt | 16 ++++++++++++++++
+ builtin/upload-pack.c             |  2 ++
+ promisor-remote.c                 | 10 ++++++++++
+ t/t0411-clone-from-partial.sh     | 18 ++++++++++++++++++
+ 4 files changed, 46 insertions(+)
+
+diff --git a/Documentation/git-upload-pack.txt b/Documentation/git-upload-pack.txt
+index 8f87b23..eba0e81 100644
+--- a/Documentation/git-upload-pack.txt
++++ b/Documentation/git-upload-pack.txt
+@@ -56,6 +56,22 @@ ENVIRONMENT
+	admins may need to configure some transports to allow this
+	variable to be passed. See the discussion in linkgit:git[1].
+
++`GIT_NO_LAZY_FETCH`::
++	When cloning or fetching from a partial repository (i.e., one
++	itself cloned with `--filter`), the server-side `upload-pack`
++	may need to fetch extra objects from its upstream in order to
++	complete the request. By default, `upload-pack` will refuse to
++	perform such a lazy fetch, because `git fetch` may run arbitrary
++	commands specified in configuration and hooks of the source
++	repository (and `upload-pack` tries to be safe to run even in
++	untrusted `.git` directories).
+++
++This is implemented by having `upload-pack` internally set the
++`GIT_NO_LAZY_FETCH` variable to `1`. If you want to override it
++(because you are fetching from a partial clone, and you are sure
++you trust it), you can explicitly set `GIT_NO_LAZY_FETCH` to
++`0`.
++
+ SEE ALSO
+ --------
+ linkgit:gitnamespaces[7]
+diff --git a/builtin/upload-pack.c b/builtin/upload-pack.c
+index 125af53..9ecaafe 100644
+--- a/builtin/upload-pack.c
++++ b/builtin/upload-pack.c
+@@ -34,6 +34,8 @@ int cmd_upload_pack(int argc, const char **argv, const char *prefix)
+
+	packet_trace_identity("upload-pack");
+	read_replace_refs = 0;
++	/* TODO: This should use NO_LAZY_FETCH_ENVIRONMENT */
++	xsetenv("GIT_NO_LAZY_FETCH", "1", 0);
+
+	argc = parse_options(argc, argv, prefix, options, upload_pack_usage, 0);
+
+diff --git a/promisor-remote.c b/promisor-remote.c
+index db2ebdc..e73df68 100644
+--- a/promisor-remote.c
++++ b/promisor-remote.c
+@@ -19,6 +19,16 @@ static int fetch_objects(struct repository *repo,
+	int i;
+	FILE *child_in;
+
++	/* TODO: This should use NO_LAZY_FETCH_ENVIRONMENT */
++	if (git_env_bool("GIT_NO_LAZY_FETCH", 0)) {
++		static int warning_shown;
++		if (!warning_shown) {
++			warning_shown = 1;
++			warning(_("lazy fetching disabled; some objects may not be available"));
++		}
++		return -1;
++	}
++
+	child.git_cmd = 1;
+	child.in = -1;
+	if (repo != the_repository)
+diff --git a/t/t0411-clone-from-partial.sh b/t/t0411-clone-from-partial.sh
+index eb3360d..b3d6ddc 100755
+--- a/t/t0411-clone-from-partial.sh
++++ b/t/t0411-clone-from-partial.sh
+@@ -28,6 +28,7 @@ test_expect_success 'local clone must not fetch from promisor remote and execute
+	test_must_fail git clone \
+		--upload-pack="GIT_TEST_ASSUME_DIFFERENT_OWNER=true git-upload-pack" \
+		evil clone1 2>err &&
++	grep "detected dubious ownership" err &&
+	! grep "fake-upload-pack running" err &&
+	test_path_is_missing script-executed
+ '
+@@ -37,6 +38,7 @@ test_expect_success 'clone from file://... must not fetch from promisor remote a
+	test_must_fail git clone \
+		--upload-pack="GIT_TEST_ASSUME_DIFFERENT_OWNER=true git-upload-pack" \
+		"file://$(pwd)/evil" clone2 2>err &&
++	grep "detected dubious ownership" err &&
+	! grep "fake-upload-pack running" err &&
+	test_path_is_missing script-executed
+ '
+@@ -46,6 +48,7 @@ test_expect_success 'fetch from file://... must not fetch from promisor remote a
+	test_must_fail git fetch \
+		--upload-pack="GIT_TEST_ASSUME_DIFFERENT_OWNER=true git-upload-pack" \
+		"file://$(pwd)/evil" 2>err &&
++	grep "detected dubious ownership" err &&
+	! grep "fake-upload-pack running" err &&
+	test_path_is_missing script-executed
+ '
+@@ -57,4 +60,19 @@ test_expect_success 'pack-objects should fetch from promisor remote and execute
+	test_path_is_file script-executed
+ '
+
++test_expect_success 'clone from promisor remote does not lazy-fetch by default' '
++	rm -f script-executed &&
++	test_must_fail git clone evil no-lazy 2>err &&
++	grep "lazy fetching disabled" err &&
++	test_path_is_missing script-executed
++'
++
++test_expect_success 'promisor lazy-fetching can be re-enabled' '
++	rm -f script-executed &&
++	test_must_fail env GIT_NO_LAZY_FETCH=0 \
++		git clone evil lazy-ok 2>err &&
++	grep "fake-upload-pack running" err &&
++	test_path_is_file script-executed
++'
++
+ test_done
+--
+2.40.0
diff --git a/meta/recipes-devtools/git/git_2.35.7.bb b/meta/recipes-devtools/git/git_2.35.7.bb
index 9e7b0a8cff..94352d38ef 100644
--- a/meta/recipes-devtools/git/git_2.35.7.bb
+++ b/meta/recipes-devtools/git/git_2.35.7.bb
@@ -12,6 +12,17 @@ SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
            file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch \
            file://CVE-2023-29007.patch \
            file://CVE-2023-25652.patch \
+           file://CVE-2024-32002-0001.patch \
+           file://CVE-2024-32002-0002.patch \
+           file://CVE-2024-32002-0003.patch \
+           file://CVE-2024-32002-0004.patch \
+           file://CVE-2024-32004-0001.patch \
+           file://CVE-2024-32004-0002.patch \
+           file://CVE-2024-32004-0003.patch \
+           file://CVE-2024-32020.patch \
+           file://CVE-2024-32021-0001.patch \
+           file://CVE-2024-32021-0002.patch \
+           file://CVE-2024-32465.patch \
            "
 
 S = "${WORKDIR}/git-${PV}"
-- 
2.34.1


