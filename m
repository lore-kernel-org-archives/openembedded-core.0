Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE538C53200
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 08:30:32 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7396.1785054628681117926
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 01:30:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TaLDsPjU;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4955de8797cso10340605e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 01:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785054627; x=1785659427; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/HYXkCuMlma+ftjn8rIOlMb/NQ0WcxQ3BemwR6arwlw=;
        b=TaLDsPjUh7uLVK7y/QhyGEXps35+o6u55g/VV9x/1COGNjJJcneoaOx2E0NztmIH4B
         8CYKfHQhAWLtj4193hOHxkWKvTb83HDaYP/K8akbMCdRdv9P6kAdGwDpH/J/wbkOlICO
         rOQDy+BLzuIW42loL9Hy+CyylvR461BBNl2yA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785054627; x=1785659427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/HYXkCuMlma+ftjn8rIOlMb/NQ0WcxQ3BemwR6arwlw=;
        b=IH9Zjeyt+GhYbBRT0rBP7BuTU0JfzfO4g73hNXNUInRjW956obxV7gmpMtaIADVEhT
         fR5P5XlC81A2VzxLmoMH4qda8+FmFnzd8M120/PzqTCwgLO02XOS2tLCokN8t9E+B/Kb
         Y46ZeaTy73xZJVxWwT0+1fS1jcMQ2Z426IjAAN56v4lA2tO29yapQ54AN1EwhGk3x3PD
         ij8WOrz2+PBowXqqnvtgMERqjtCljrKiIq23WFF62j85e3PetjKFBl6CD8RStwTBIZE5
         AQ/Uk996zXrsESzKBlnGDwAGmDIH5/gw2uaR07vPBTN/XMxMHYgCQROtAQjF7uAmWuWz
         FsFA==
X-Gm-Message-State: AOJu0YxBtjUEnFH9y3RogrtKVostTFq6wPWCHiwD1BneakR8waio4VAH
	lBZ460izlxQWcjE8Yt2zDsjuG6+M2bKtuggCEDtprgomUVyCGvynVE4OAFPimp2MxqQSfEwa4RV
	wRECduiw=
X-Gm-Gg: AR+sD13TNuFe1ogzUHNoUocGii1DjYg+Kqv0BcQWh4TOXwpo8L2VBrWnz7ugDIjEDOg
	tjtFsdEjZ/Skf2nmmrlZn8pcb7+Kt35PWcS1+uVA4QwBfCgMIs3KaGyVQbY7udiQ0KI+XOPky4l
	AWvajyd36kDUj7If/1Rccozm3WSACtlK6o3PTkzxmxYomijJ/8UrSQnatuy+IgONM5M2s2pcT4a
	vxoXmlxXRj2pdnuYg4LrUBGvh0irLjbdZYZJi3iVS+5ExVYh4AVKXlIKpgWsiRijUMPPYnbuG6F
	STAbrm9i+pfnAMJMWL7XPGoB5DBbiDtZUBilYwOaWoavKAzkp1YPY7eF5xvBAR44EQ+CD1riLgx
	UY3wwAjMUq23LWasbjeW4THNoSi/78Wnsi0gFnI/bA/1kbE946eTyg96AwT6K/jagRl7+mqI+5y
	doMoRFYXCzRj8qq3Qc4Zq7UeiB35EIHgTwhKXzWqXvYXDbYVxSh86jJ8mcECtgvE5ZW1fKD4Vrz
	7w0iQ==
X-Received: by 2002:a05:600c:253:b0:493:df5d:6ca6 with SMTP id 5b1f17b1804b1-496b571c5fdmr43302845e9.25.1785054626802;
        Sun, 26 Jul 2026 01:30:26 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f24a93sm142482505e9.11.2026.07.26.01.30.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 01:30:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 29/31] glib-2.0: fix CVE-2026-58014
Date: Sun, 26 Jul 2026 10:29:53 +0200
Message-ID: <cb3cbcb16363f6c351492d19e240c0a02f073749.1785054430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785054429.git.yoann.congal@smile.fr>
References: <cover.1785054429.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 08:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242011

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream 2.88.1 backport for
CVE-2026-58014. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://gitlab.gnome.org/GNOME/glib/-/commit/94ecb5b44a1cae09f481dd5e693832f129948893
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58014

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../glib-2.0/glib-2.0/CVE-2026-58014.patch    | 106 ++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |   1 +
 2 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58014.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58014.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58014.patch
new file mode 100644
index 00000000000..4e5262b66de
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58014.patch
@@ -0,0 +1,106 @@
+From ba0478c206bc04542df774343c6c85f77df49f6e Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Sat, 11 Apr 2026 14:42:57 +0100
+Subject: [PATCH] gkeyfile: Fix a one-byte heap under-read with
+ g_key_file_get_locale_string_list()
+
+If this method was called on a key file key which has an empty value,
+`len == 0` and this leads to a one-byte under-read off the start of the
+key file buffer.
+
+Spotted by linhlhq as #YWH-PGM9867-200. The suggested fix is theirs, and
+the unit test is adapted from their report. I added the fuzzing test.
+
+Fixes: #3930
+
+CVE: CVE-2026-58014
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/94ecb5b44a1cae09f481dd5e693832f129948893]
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+(cherry picked from commit 94ecb5b44a1cae09f481dd5e693832f129948893)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ fuzzing/fuzz_key.c   |  9 +++++++++
+ glib/gkeyfile.c      |  2 +-
+ glib/tests/keyfile.c | 23 +++++++++++++++++++++++
+ 3 files changed, 33 insertions(+), 1 deletion(-)
+
+diff --git a/fuzzing/fuzz_key.c b/fuzzing/fuzz_key.c
+index 77cb684..7d00443 100644
+--- a/fuzzing/fuzz_key.c
++++ b/fuzzing/fuzz_key.c
+@@ -26,11 +26,20 @@ test_parse (const gchar   *data,
+             GKeyFileFlags  flags)
+ {
+   GKeyFile *key = NULL;
++  char *comment = NULL;
++  char **list = NULL;
+ 
+   key = g_key_file_new ();
+   g_key_file_load_from_data (key, (const gchar*) data, size, G_KEY_FILE_NONE,
+                              NULL);
+ 
++  /* Also try some additional parsing and see if it crashes */
++  comment = g_key_file_get_comment (key, "group", "key", NULL);
++  g_free (comment);
++
++  list = g_key_file_get_locale_string_list (key, "group", "key", "de", NULL, NULL);
++  g_strfreev (list);
++
+   g_key_file_free (key);
+ }
+ 
+diff --git a/glib/gkeyfile.c b/glib/gkeyfile.c
+index d08a485..54d77a5 100644
+--- a/glib/gkeyfile.c
++++ b/glib/gkeyfile.c
+@@ -2421,7 +2421,7 @@ g_key_file_get_locale_string_list (GKeyFile     *key_file,
+     }
+ 
+   len = strlen (value);
+-  if (value[len - 1] == key_file->list_separator)
++  if (len > 0 && value[len - 1] == key_file->list_separator)
+     value[len - 1] = '\0';
+ 
+   list_separator[0] = key_file->list_separator;
+diff --git a/glib/tests/keyfile.c b/glib/tests/keyfile.c
+index bc125c1..289bd2b 100644
+--- a/glib/tests/keyfile.c
++++ b/glib/tests/keyfile.c
+@@ -850,6 +850,28 @@ test_locale_string_multiple_loads (void)
+   g_free (old_locale);
+ }
+ 
++static void
++test_locale_string_empty (void)
++{
++  GKeyFile *keyfile = NULL;
++  GError *local_error = NULL;
++  const char *data =
++    "[valid]\n"
++    "key1=\n";
++
++  g_test_summary ("Check that loading an empty translatable string works");
++  g_test_bug ("https://gitlab.gnome.org/GNOME/glib/-/issues/3930");
++
++  keyfile = g_key_file_new ();
++
++  g_key_file_load_from_data (keyfile, data, -1, G_KEY_FILE_NONE, &local_error);
++  g_assert_no_error (local_error);
++
++  check_locale_string_list_value (keyfile, "valid", "key1", NULL, NULL);
++
++  g_key_file_free (keyfile);
++}
++
+ static void
+ test_lists (void)
+ {
+@@ -1939,6 +1961,7 @@ main (int argc, char *argv[])
+   g_test_add_func ("/keyfile/number", test_number);
+   g_test_add_func ("/keyfile/locale-string", test_locale_string);
+   g_test_add_func ("/keyfile/locale-string/multiple-loads", test_locale_string_multiple_loads);
++  g_test_add_func ("/keyfile/locale-string/empty", test_locale_string_empty);
+   g_test_add_func ("/keyfile/lists", test_lists);
+   g_test_add_func ("/keyfile/lists-set-get", test_lists_set_get);
+   g_test_add_func ("/keyfile/group-remove", test_group_remove);
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
index 9516231cbad..e15aa1fe206 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
@@ -53,6 +53,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2026-58011.patch \
            file://CVE-2026-58012.patch \
            file://CVE-2026-58013.patch \
+           file://CVE-2026-58014.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \

