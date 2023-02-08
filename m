Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F17C636CC
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 11:49:46 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.6536.1675856977033051490
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Feb 2023 03:49:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p8Lt9D4U;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: badganchipv@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id o16-20020a17090ad25000b00230759a8c06so2045032pjw.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 03:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JiNwP8pBZthvFseDwhjH7JV4QdXDA6iTMVqTEafQ8pw=;
        b=p8Lt9D4UqSrYQ49f9DVEpXsIxI7P+O6EJQsrvsWRGqhh/p0Mzy9dmgfTp/gqWd6dAm
         qqgh89m+xqZPd3VyaFz/k5oJfz0Lb6j0EIMKBL4FOh+zWtqc2OxAFGErBk8KyrMZxYKZ
         cfsK3xbXYrl1qLavnCYxrUMCgmfpnaPcEY2qMwwL8EX1WfLVPOAG/zGhp9si9RuO3yMK
         Ip+mVI5MZ5l/TqOodRrlPvI09kTiu1+vgDZwOOoRTfvCp8U8vyawL3US+LGkH4ChX/Rz
         MMHo4E6PFSEuURm3f2nEgP4Nlyd7oB33whthUJn5GcMH8RyLo/AVAmbBLbXDS5+Iaye+
         rF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JiNwP8pBZthvFseDwhjH7JV4QdXDA6iTMVqTEafQ8pw=;
        b=QpvVJFvmw9IBX0h0s4vQB/7xBYRY6ZA9rG9yo230maojm6UtAiASn2txNhifX1HgPl
         8C7nk+w7cKbRptVQrWiySE/Y1Ghmwp9x6Vv75TupOPWZGIJSrBDyk+zVE37xIzuqTXei
         DkhpMTHZ6bob/vcOZl+TbEO6Uv8v44YLMZiMKU/14eFMdCykRj1SCwZLnfmC07vfMzmE
         DUSmXbHfw4JG6K8Z+6trb0UbN/xethM/M9/Uc6g1KO2Qwkx5GOdCvnTgb1X3GiBQdQ9T
         764SQWqy3/heatY6E6JcIegEanoF8QHAENFUHyyOAlThx9nDiAIstK3q2ofNbKa24JBk
         2X9Q==
X-Gm-Message-State: AO0yUKUiA5fM44YPUyQIe/Ju662BxxkjG4HNlVm9N7HIUwhYa71lH/9D
	Lm/PuBtLeXnlFee0Go18R4i7C2jH+ro=
X-Google-Smtp-Source: AK7set/Y0uyY+VhB53KpkhpfwlwIBI/wyahcKPtWW9EWPjAQF8orrVltCLHsIRcCgwNhEUds9Eyt6A==
X-Received: by 2002:a17:902:e74e:b0:196:6226:94c3 with SMTP id p14-20020a170902e74e00b00196622694c3mr7797946plf.7.1675856976172;
        Wed, 08 Feb 2023 03:49:36 -0800 (PST)
Received: from localhost.localdomain ([2409:4042:490:3b31:b22a:d691:4a0b:70bb])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902784c00b00192b23b8451sm10731651pln.108.2023.02.08.03.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 03:49:35 -0800 (PST)
From: pawan <badganchipv@gmail.com>
To: openembedded-core@lists.openembedded.org,
	badganchipv@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Omkar Patil <omkar.patil@kpit.com>
Subject: [meta][dunfell][PATCH] sudo: Fix CVE-2023-22809
Date: Wed,  8 Feb 2023 17:18:46 +0530
Message-Id: <20230208114846.60702-1-badganchipv@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 11:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176902

From: Omkar Patil <omkar.patil@kpit.com>

Add CVE-2023-22809.patch to fix CVE-2023-22809.

Signed-off-by: Omkar Patil <omkar.patil@kpit.com>
Signed-off-by: pawan <badganchipv@gmail.com>
---
 .../sudo/files/CVE-2023-22809.patch           | 113 ++++++++++++++++++
 meta/recipes-extended/sudo/sudo_1.8.32.bb     |   1 +
 2 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2023-22809.patch

diff --git a/meta/recipes-extended/sudo/files/CVE-2023-22809.patch b/meta/recipes-extended/sudo/files/CVE-2023-22809.patch
new file mode 100644
index 0000000000..6c47eb3e44
--- /dev/null
+++ b/meta/recipes-extended/sudo/files/CVE-2023-22809.patch
@@ -0,0 +1,113 @@
+Backport of:
+
+# HG changeset patch
+# Parent  7275148cad1f8cd3c350026460acc4d6ad349c3a
+sudoedit: do not permit editor arguments to include "--"
+We use "--" to separate the editor and arguments from the files to edit.
+If the editor arguments include "--", sudo can be tricked into allowing
+the user to edit a file not permitted by the security policy.
+Thanks to Matthieu Barjole and Victor Cutillas of Synacktiv
+(https://synacktiv.com) for finding this bug.
+
+CVE: CVE-2023-22809
+Upstream-Staus: Backport [http://archive.ubuntu.com/ubuntu/pool/main/s/sudo/sudo_1.8.31-1ubuntu1.4.debian.tar.xz]
+Signed-off-by: Omkar Patil <omkar.patil@kpit.com>
+
+--- a/plugins/sudoers/editor.c
++++ b/plugins/sudoers/editor.c
+@@ -56,7 +56,7 @@ resolve_editor(const char *ed, size_t ed
+     const char *cp, *ep, *tmp;
+     const char *edend = ed + edlen;
+     struct stat user_editor_sb;
+-    int nargc;
++    int nargc = 0;
+     debug_decl(resolve_editor, SUDOERS_DEBUG_UTIL)
+ 
+     /*
+@@ -102,6 +102,21 @@ resolve_editor(const char *ed, size_t ed
+ 	    free(editor_path);
+ 	    while (nargc--)
+ 		free(nargv[nargc]);
++	    free(nargv);
++	    debug_return_str(NULL);
++	}
++
++	/*
++	 * We use "--" to separate the editor and arguments from the files
++	 * to edit.  The editor arguments themselves may not contain "--".
++	 */
++	if (strcmp(nargv[nargc], "--") == 0) {
++	    sudo_warnx(U_("ignoring editor: %.*s"), (int)edlen, ed);
++	    sudo_warnx("%s", U_("editor arguments may not contain \"--\""));
++	    errno = EINVAL;
++	    free(editor_path);
++	    while (nargc--)
++		free(nargv[nargc]);
+ 	    free(nargv);
+ 	    debug_return_str(NULL);
+ 	}
+--- a/plugins/sudoers/sudoers.c
++++ b/plugins/sudoers/sudoers.c
+@@ -616,20 +616,31 @@ sudoers_policy_main(int argc, char * con
+ 
+     /* Note: must call audit before uid change. */
+     if (ISSET(sudo_mode, MODE_EDIT)) {
++	const char *env_editor = NULL;
+ 	int edit_argc;
+-	const char *env_editor;
+ 
+ 	free(safe_cmnd);
+ 	safe_cmnd = find_editor(NewArgc - 1, NewArgv + 1, &edit_argc,
+ 	    &edit_argv, NULL, &env_editor, false);
+ 	if (safe_cmnd == NULL) {
+-	    if (errno != ENOENT)
++	    switch (errno) {
++	    case ENOENT:
++		audit_failure(NewArgc, NewArgv, N_("%s: command not found"),
++		    env_editor ? env_editor : def_editor);
++		sudo_warnx(U_("%s: command not found"),
++		    env_editor ? env_editor : def_editor);
++		goto bad;
++	    case EINVAL:
++		if (def_env_editor && env_editor != NULL) {
++		    /* User tried to do something funny with the editor. */
++		    log_warningx(SLOG_NO_STDERR|SLOG_SEND_MAIL,
++			"invalid user-specified editor: %s", env_editor);
++		    goto bad;
++		}
++		/* FALLTHROUGH */
++	    default:
+ 		goto done;
+-	    audit_failure(NewArgc, NewArgv, N_("%s: command not found"),
+-		env_editor ? env_editor : def_editor);
+-	    sudo_warnx(U_("%s: command not found"),
+-		env_editor ? env_editor : def_editor);
+-	    goto bad;
++	    }
+ 	}
+ 	if (audit_success(edit_argc, edit_argv) != 0 && !def_ignore_audit_errors)
+ 	    goto done;
+--- a/plugins/sudoers/visudo.c
++++ b/plugins/sudoers/visudo.c
+@@ -308,7 +308,7 @@ static char *
+ get_editor(int *editor_argc, char ***editor_argv)
+ {
+     char *editor_path = NULL, **whitelist = NULL;
+-    const char *env_editor;
++    const char *env_editor = NULL;
+     static char *files[] = { "+1", "sudoers" };
+     unsigned int whitelist_len = 0;
+     debug_decl(get_editor, SUDOERS_DEBUG_UTIL)
+@@ -342,7 +342,11 @@ get_editor(int *editor_argc, char ***edi
+     if (editor_path == NULL) {
+ 	if (def_env_editor && env_editor != NULL) {
+ 	    /* We are honoring $EDITOR so this is a fatal error. */
+-	    sudo_fatalx(U_("specified editor (%s) doesn't exist"), env_editor);
++	    if (errno == ENOENT) {
++		sudo_warnx(U_("specified editor (%s) doesn't exist"),
++		    env_editor);
++	    }
++	    exit(EXIT_FAILURE);
+ 	}
+ 	sudo_fatalx(U_("no editor found (editor path = %s)"), def_editor);
+     }
diff --git a/meta/recipes-extended/sudo/sudo_1.8.32.bb b/meta/recipes-extended/sudo/sudo_1.8.32.bb
index 10785beedf..5bc48ec6fa 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.32.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.32.bb
@@ -5,6 +5,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            file://0001-Include-sys-types.h-for-id_t-definition.patch \
            file://0001-Fix-includes-when-building-with-musl.patch \
            file://CVE-2022-43995.patch \
+           file://CVE-2023-22809.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"
-- 
2.38.1


