Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D44C678D5
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 22:20:42 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.27668.1676931636337738602
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 14:20:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=BdHGt0nm;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id d1-20020a17090a3b0100b00229ca6a4636so3004485pjc.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rqHledPBZOHdUI+rDi994danzU+faEx3RO61ITwTows=;
        b=BdHGt0nmWbdBNGyCv1TjVqq/Wg5JMc/8VGU3RpDb562w7AhZbKmk8YFxf43teiALH/
         xlWss/sGAX34Hk3vBfRn/JoAvkY21LG5iNoc9bGyHSDfAQIyp5Bqk/m8ScTOkbd3cfQg
         FLfb148UfbyF1xLmCUygoZfi6nRg8gWzBxl+PPEFBISWrkE7HdVljVhtr5/tFE+u9phG
         kF0ozhDFriGxEC8UwdxhRsWDCxhCAtXpD6Wp5/JeYmS/CoiuFKP857T4tMorfYXHMAM8
         q9fUQvm7MjTcrmaSJCrx7RF1MzumyJi+kyCLcw1+BmD4v1Dg2EmZVdknmCa/UfZeTkeF
         QkHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rqHledPBZOHdUI+rDi994danzU+faEx3RO61ITwTows=;
        b=0BkJ54CVRHb7oM/rhyieElP0RLQorvQt15aT1T0WKSu7ZgrxgK/EqyNB2BTpZ32agH
         gVppGhS9NJi1oaMgXvDSCTbM0V8Z/Ps/q26S09M3pCtW3OZIwhM9mxFQBali/P4XEFmH
         JKznMNJNfsf9enF7cmhzpLbkgXQflyWfeht8e7n2VN8K1RNAWmrjtH3zfzdrtBiIiD2X
         6erKTMnqCDtKyYWjcQMOSDlblnmc6KP/al889Hp5MD0W3KMS2l8+aFE5SqL8DzDrDYyF
         qXFfVh7KOaMMb62jhMkQO+fd3D54v3I13wGHquNkLawtpGtbJQy0XywhnqTGkCREOXlP
         ne7Q==
X-Gm-Message-State: AO0yUKXbyLEoQnWU65SdkFbhy8d+0/quR6jqy5bIZoQyVLUht6PqZYVV
	fdjRktXT6+O6WXaKpDWOXXJT4cFR8iOXhA0Lu5c=
X-Google-Smtp-Source: AK7set9o0Q2MCSRiuqPI7rTcSFziAvp26Eoq+IwBhplrwVrS0NVJtg63XHTNX7ts0kLA9oRP/OoKuQ==
X-Received: by 2002:a17:902:e5d1:b0:198:f1c4:dd59 with SMTP id u17-20020a170902e5d100b00198f1c4dd59mr4973495plf.14.1676931635087;
        Mon, 20 Feb 2023 14:20:35 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709027fc600b0019719f752c5sm8401200plb.59.2023.02.20.14.20.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 14:20:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/16] sudo: Fix CVE-2023-22809
Date: Mon, 20 Feb 2023 12:20:10 -1000
Message-Id: <186a5ab41927e6be0920e03e743f32ae4477c58e.1676931497.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676931497.git.steve@sakoman.com>
References: <cover.1676931497.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 22:20:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177463

From: Omkar Patil <omkar.patil@kpit.com>

Add CVE-2023-22809.patch to fix CVE-2023-22809.

Signed-off-by: Omkar Patil <omkar.patil@kpit.com>
Signed-off-by: pawan <badganchipv@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


