Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DBF4C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 07:31:48 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.8972.1741851103927732919
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 00:31:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=SO0B3vKZ;
 spf=pass (domain: mvista.com, ip: 209.85.214.172, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-223594b3c6dso11261085ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 00:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1741851103; x=1742455903; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pv0JmC1SSujVZ85gMAlRJSH4ntNcSLrSJMR3ia8ctms=;
        b=SO0B3vKZPNSjDBQq87k+qhZTXO2qgC1Y3q2uVbH1cH4sZnMiaSvyKk8R1Bzjrw42bH
         8h2hlPerjDiGQ+t+OX5TkjMSGH1nAXKFqucFfNcSMZZcbq6B81u/SIwu0hn8ghfiZAH9
         m80OELpl+71ldlQCRFTtj4ljHAu7QWDgDQTGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741851103; x=1742455903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pv0JmC1SSujVZ85gMAlRJSH4ntNcSLrSJMR3ia8ctms=;
        b=G84sMFyMy7coFCoJzjjxfUni3oHbe2jyHBviaoUIjmsFh4FgG62Na96ZCBs2lIyHEC
         DGUYFUZ6TftnHseIC06jGC6hTqXNZnErcQ/zncqgTaadtP9xkxZcu+QBUutcJgnMt+85
         SpyIkkHSpiI6b5A/g5mKvWlM+HLXTIeYLORw8eHHbtCZiVUgJjBOpa3ApAKBvZkklZrM
         Lr8Cw6gyGk+rRHvNE5cKXF9BlOgc25i33eWYsB8MHg47AXmbsJMV9wD28qYhiOgWoeJ+
         tNi41hJ5/H7poT276b8OeR41biAI92tGcWcgTdAPlvsSh9Zyfeb//q8oRLpdusrtdyPm
         kk2g==
X-Gm-Message-State: AOJu0YxMiroevzq1iSHv5R7uhEJ3C2IWtAn4I8XUETiOC2TP73EWxEzD
	qd1N9A9I+6cIVw3jbMUnun+iLETJqmfTbIh3qtJPkPH3xTc1rbHVlL4OSq8pdNfESp3MlKJ0APR
	J
X-Gm-Gg: ASbGnctH8MJ+TLyM3G1VEve7dcuLYtt8isftQUB3haVvSBzcYYjE1Uhfi/E9ewPcqOg
	ICxW9JUHtHUgr0/o7fQGsG526lXvnXwv69yT1KkB1wJQYw5pRuQAOe5+Dgi8JLA1ICzyuC0cYVZ
	GZL7JkhkjyG+96IEjgDmelKrd8H7h92/aSNVgesJmXyzyk2GqRdXvTdnj0Neq4kIVQpS5koeGE2
	WBfzkpxqWHXhojs6CmJ7HasWZWnP9DdToaZR+U8CJU1HTzSPjc5gProEmayzjZAnLHdTU9giHzN
	GoRja3S+NgHUKNg0/E7W56PejEM8PnKxnrZ5eSt+gta73CY9/dlbnNr6ng==
X-Google-Smtp-Source: AGHT+IEkAo0OJYK8oxLZgN+UmEMfRnT5K5K7zKa0UXxhvowfVDhKU2gjhMdtqAIjxDGvk7/Z8hfIkg==
X-Received: by 2002:a17:902:ce87:b0:21f:5cd8:c67 with SMTP id d9443c01a7336-22428ab58d8mr411710355ad.31.1741851102780;
        Thu, 13 Mar 2025 00:31:42 -0700 (PDT)
Received: from MVIN00016.mvista.com ([43.249.234.149])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7371157369bsm697211b3a.75.2025.03.13.00.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 00:31:42 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] grub: Fix multiple CVEs
Date: Thu, 13 Mar 2025 13:01:29 +0530
Message-Id: <20250313073129.216073-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 07:31:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212740

Backport fixes for:

* CVE-2024-45774 - Upstream-Status: Backport from https://git.savannah.gnu.org/cgit/grub.git/commit/?id=2c34af908ebf4856051ed29e46d88abd2b20387f
* CVE-2024-45775 - Upstream-Status: Backport from https://git.savannah.gnu.org/cgit/grub.git/commit/?id=05be856a8c3aae41f5df90cab7796ab7ee34b872
* CVE-2024-45776 - Upstream-Status: Backport from https://git.savannah.gnu.org/cgit/grub.git/commit/?id=09bd6eb58b0f71ec273916070fa1e2de16897a91
* CVE-2024-45777 - Upstream-Status: Backport from https://git.savannah.gnu.org/cgit/grub.git/commit/?id=b970a5ed967816bbca8225994cd0ee2557bad515
* CVE-2024-45778_CVE-2024-45779 - Upstream-Status: Backport from https://git.savannah.gnu.org/cgit/grub.git/commit/?id=26db6605036bd9e5b16d9068a8cc75be63b8b630
* CVE-2024-45780 - Upstream-Status: Backport from https://git.savannah.gnu.org/cgit/grub.git/commit/?id=0087bc6902182fe5cedce2d034c75a79cf6dd4f3
* CVE-2024-45781 - Upstream-Status: Backport from https://git.savannah.gnu.org/cgit/grub.git/commit/?id=c1a291b01f4f1dcd6a22b61f1c81a45a966d16ba
* CVE-2024-45782_CVE-2024-56737 - Upstream-Status: Backport from https://git.savannah.gnu.org/cgit/grub.git/commit/?id=417547c10410b714e43f08f74137c24015f8f4c3
* CVE-2024-45783 - Upstream-Status: Backport from https://git.savannah.gnu.org/cgit/grub.git/commit/?id=f7c070a2e28dfab7137db0739fb8db1dc02d8898

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../0001-misc-Implement-grub_strlcpy.patch    | 68 +++++++++++++
 .../grub/files/CVE-2024-45774.patch           | 40 ++++++++
 .../grub/files/CVE-2024-45775.patch           | 41 ++++++++
 .../grub/files/CVE-2024-45776.patch           | 42 ++++++++
 .../grub/files/CVE-2024-45777.patch           | 60 ++++++++++++
 .../files/CVE-2024-45778_CVE-2024-45779.patch | 58 +++++++++++
 .../grub/files/CVE-2024-45780.patch           | 96 +++++++++++++++++++
 .../grub/files/CVE-2024-45781.patch           | 38 ++++++++
 .../files/CVE-2024-45782_CVE-2024-56737.patch | 39 ++++++++
 .../grub/files/CVE-2024-45783.patch           | 42 ++++++++
 meta/recipes-bsp/grub/grub2.inc               | 10 ++
 11 files changed, 534 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0001-misc-Implement-grub_strlcpy.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45774.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45775.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45776.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45777.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45778_CVE-2024-45779.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45780.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45781.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45782_CVE-2024-56737.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45783.patch

diff --git a/meta/recipes-bsp/grub/files/0001-misc-Implement-grub_strlcpy.patch b/meta/recipes-bsp/grub/files/0001-misc-Implement-grub_strlcpy.patch
new file mode 100644
index 0000000000..0ff6dff33a
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0001-misc-Implement-grub_strlcpy.patch
@@ -0,0 +1,68 @@
+From ea703528a8581a2ea7e0bad424a70fdf0aec7d8f Mon Sep 17 00:00:00 2001
+From: B Horn <b@horn.uk>
+Date: Sat, 15 Jun 2024 02:33:08 +0100
+Subject: [PATCH 1/2] misc: Implement grub_strlcpy()
+
+grub_strlcpy() acts the same way as strlcpy() does on most *NIX,
+returning the length of src and ensuring dest is always NUL
+terminated except when size is 0.
+
+Signed-off-by: B Horn <b@horn.uk>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=ea703528a8581a2ea7e0bad424a70fdf0aec7d8f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ include/grub/misc.h | 39 +++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 39 insertions(+)
+
+diff --git a/include/grub/misc.h b/include/grub/misc.h
+index 1578f36c3..14d8f37ac 100644
+--- a/include/grub/misc.h
++++ b/include/grub/misc.h
+@@ -64,6 +64,45 @@ grub_stpcpy (char *dest, const char *src)
+   return d - 1;
+ }
+ 
++static inline grub_size_t
++grub_strlcpy (char *dest, const char *src, grub_size_t size)
++{
++  char *d = dest;
++  grub_size_t res = 0;
++  /*
++   * We do not subtract one from size here to avoid dealing with underflowing
++   * the value, which is why to_copy is always checked to be greater than one
++   * throughout this function.
++   */
++  grub_size_t to_copy = size;
++
++  /* Copy size - 1 bytes to dest. */
++  if (to_copy > 1)
++    while ((*d++ = *src++) != '\0' && ++res && --to_copy > 1)
++      ;
++
++  /*
++   * NUL terminate if size != 0. The previous step may have copied a NUL byte
++   * if it reached the end of the string, but we know dest[size - 1] must always
++   * be a NUL byte.
++   */
++  if (size != 0)
++    dest[size - 1] = '\0';
++
++  /* If there is still space in dest, but are here, we reached the end of src. */
++  if (to_copy > 1)
++    return res;
++
++  /*
++   * If we haven't reached the end of the string, iterate through to determine
++   * the strings total length.
++   */
++  while (*src++ != '\0' && ++res)
++   ;
++
++  return res;
++}
++
+ /* XXX: If grub_memmove is too slow, we must implement grub_memcpy.  */
+ static inline void *
+ grub_memcpy (void *dest, const void *src, grub_size_t n)
diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45774.patch b/meta/recipes-bsp/grub/files/CVE-2024-45774.patch
new file mode 100644
index 0000000000..f4cbd50022
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2024-45774.patch
@@ -0,0 +1,40 @@
+From 2c34af908ebf4856051ed29e46d88abd2b20387f Mon Sep 17 00:00:00 2001
+From: Daniel Axtens <dja@axtens.net>
+Date: Fri, 8 Mar 2024 22:47:20 +1100
+Subject: [PATCH] video/readers/jpeg: Do not permit duplicate SOF0 markers in
+ JPEG
+
+Otherwise a subsequent header could change the height and width
+allowing future OOB writes.
+
+Fixes: CVE-2024-45774
+
+Reported-by: Nils Langius <nils@langius.de>
+Signed-off-by: Daniel Axtens <dja@axtens.net>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2024-45774
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=2c34af908ebf4856051ed29e46d88abd2b20387f]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ grub-core/video/readers/jpeg.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/grub-core/video/readers/jpeg.c b/grub-core/video/readers/jpeg.c
+index 6019b6a..5e5e39c 100644
+--- a/grub-core/video/readers/jpeg.c
++++ b/grub-core/video/readers/jpeg.c
+@@ -330,6 +330,10 @@ grub_jpeg_decode_sof (struct grub_jpeg_data *data)
+   if (grub_errno != GRUB_ERR_NONE)
+     return grub_errno;
+ 
++  if (data->image_height != 0 || data->image_width != 0)
++    return grub_error (GRUB_ERR_BAD_FILE_TYPE,
++		       "jpeg: cannot have duplicate SOF0 markers");
++
+   if (grub_jpeg_get_byte (data) != 8)
+     return grub_error (GRUB_ERR_BAD_FILE_TYPE,
+ 		       "jpeg: only 8-bit precision is supported");
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45775.patch b/meta/recipes-bsp/grub/files/CVE-2024-45775.patch
new file mode 100644
index 0000000000..4328e4249f
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2024-45775.patch
@@ -0,0 +1,41 @@
+From 05be856a8c3aae41f5df90cab7796ab7ee34b872 Mon Sep 17 00:00:00 2001
+From: Lidong Chen <lidong.chen@oracle.com>
+Date: Fri, 22 Nov 2024 06:27:55 +0000
+Subject: [PATCH] commands/extcmd: Missing check for failed allocation
+
+The grub_extcmd_dispatcher() calls grub_arg_list_alloc() to allocate
+a grub_arg_list struct but it does not verify the allocation was successful.
+In case of failed allocation the NULL state pointer can be accessed in
+parse_option() through grub_arg_parse() which may lead to a security issue.
+
+Fixes: CVE-2024-45775
+
+Reported-by: Nils Langius <nils@langius.de>
+Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+Reviewed-by: Alec Brown <alec.r.brown@oracle.com>
+
+CVE: CVE-2024-45775
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=05be856a8c3aae41f5df90cab7796ab7ee34b872]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ grub-core/commands/extcmd.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/grub-core/commands/extcmd.c b/grub-core/commands/extcmd.c
+index 90a5ca2..c236be1 100644
+--- a/grub-core/commands/extcmd.c
++++ b/grub-core/commands/extcmd.c
+@@ -49,6 +49,9 @@ grub_extcmd_dispatcher (struct grub_command *cmd, int argc, char **args,
+     }
+ 
+   state = grub_arg_list_alloc (ext, argc, args);
++  if (state == NULL)
++    return grub_errno;
++
+   if (grub_arg_parse (ext, argc, args, state, &new_args, &new_argc))
+     {
+       context.state = state;
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45776.patch b/meta/recipes-bsp/grub/files/CVE-2024-45776.patch
new file mode 100644
index 0000000000..66b997dd69
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2024-45776.patch
@@ -0,0 +1,42 @@
+From 09bd6eb58b0f71ec273916070fa1e2de16897a91 Mon Sep 17 00:00:00 2001
+From: Lidong Chen <lidong.chen@oracle.com>
+Date: Fri, 22 Nov 2024 06:27:56 +0000
+Subject: [PATCH] gettext: Integer overflow leads to heap OOB write or read
+
+Calculation of ctx->grub_gettext_msg_list size in grub_mofile_open() may
+overflow leading to subsequent OOB write or read. This patch fixes the
+issue by replacing grub_zalloc() and explicit multiplication with
+grub_calloc() which does the same thing in safe manner.
+
+Fixes: CVE-2024-45776
+
+Reported-by: Nils Langius <nils@langius.de>
+Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+Reviewed-by: Alec Brown <alec.r.brown@oracle.com>
+
+CVE: CVE-2024-45776
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=09bd6eb58b0f71ec273916070fa1e2de16897a91]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ grub-core/gettext/gettext.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/grub-core/gettext/gettext.c b/grub-core/gettext/gettext.c
+index 4d02e62..55d8b67 100644
+--- a/grub-core/gettext/gettext.c
++++ b/grub-core/gettext/gettext.c
+@@ -323,8 +323,8 @@ grub_mofile_open (struct grub_gettext_context *ctx,
+   for (ctx->grub_gettext_max_log = 0; ctx->grub_gettext_max >> ctx->grub_gettext_max_log;
+        ctx->grub_gettext_max_log++);
+ 
+-  ctx->grub_gettext_msg_list = grub_zalloc (ctx->grub_gettext_max
+-					    * sizeof (ctx->grub_gettext_msg_list[0]));
++  ctx->grub_gettext_msg_list = grub_calloc (ctx->grub_gettext_max,
++					    sizeof (ctx->grub_gettext_msg_list[0]));
+   if (!ctx->grub_gettext_msg_list)
+     {
+       grub_file_close (fd);
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45777.patch b/meta/recipes-bsp/grub/files/CVE-2024-45777.patch
new file mode 100644
index 0000000000..2591609760
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2024-45777.patch
@@ -0,0 +1,60 @@
+From b970a5ed967816bbca8225994cd0ee2557bad515 Mon Sep 17 00:00:00 2001
+From: Lidong Chen <lidong.chen@oracle.com>
+Date: Fri, 22 Nov 2024 06:27:57 +0000
+Subject: [PATCH] gettext: Integer overflow leads to heap OOB write
+
+The size calculation of the translation buffer in
+grub_gettext_getstr_from_position() may overflow
+to 0 leading to heap OOB write. This patch fixes
+the issue by using grub_add() and checking for
+an overflow.
+
+Fixes: CVE-2024-45777
+
+Reported-by: Nils Langius <nils@langius.de>
+Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+Reviewed-by: Alec Brown <alec.r.brown@oracle.com>
+
+CVE: CVE-2024-45777
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=b970a5ed967816bbca8225994cd0ee2557bad515]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ grub-core/gettext/gettext.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/grub-core/gettext/gettext.c b/grub-core/gettext/gettext.c
+index 55d8b67..85ea44a 100644
+--- a/grub-core/gettext/gettext.c
++++ b/grub-core/gettext/gettext.c
+@@ -26,6 +26,7 @@
+ #include <grub/file.h>
+ #include <grub/kernel.h>
+ #include <grub/i18n.h>
++#include <grub/safemath.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -99,6 +100,7 @@ grub_gettext_getstr_from_position (struct grub_gettext_context *ctx,
+   char *translation;
+   struct string_descriptor desc;
+   grub_err_t err;
++  grub_size_t alloc_sz;
+ 
+   internal_position = (off + position * sizeof (desc));
+ 
+@@ -109,7 +111,10 @@ grub_gettext_getstr_from_position (struct grub_gettext_context *ctx,
+   length = grub_cpu_to_le32 (desc.length);
+   offset = grub_cpu_to_le32 (desc.offset);
+ 
+-  translation = grub_malloc (length + 1);
++  if (grub_add (length, 1, &alloc_sz))
++    return NULL;
++
++  translation = grub_malloc (alloc_sz);
+   if (!translation)
+     return NULL;
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45778_CVE-2024-45779.patch b/meta/recipes-bsp/grub/files/CVE-2024-45778_CVE-2024-45779.patch
new file mode 100644
index 0000000000..e224c41776
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2024-45778_CVE-2024-45779.patch
@@ -0,0 +1,58 @@
+From 26db6605036bd9e5b16d9068a8cc75be63b8b630 Mon Sep 17 00:00:00 2001
+From: Daniel Axtens <dja@axtens.net>
+Date: Sat, 23 Mar 2024 15:59:43 +1100
+Subject: [PATCH] fs/bfs: Disable under lockdown
+
+The BFS is not fuzz-clean. Don't allow it to be loaded under lockdown.
+This will also disable the AFS.
+
+Fixes: CVE-2024-45778
+Fixes: CVE-2024-45779
+
+Reported-by: Nils Langius <nils@langius.de>
+Signed-off-by: Daniel Axtens <dja@axtens.net>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2024-45778
+CVE: CVE-2024-45779
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=26db6605036bd9e5b16d9068a8cc75be63b8b630]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ grub-core/fs/bfs.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/grub-core/fs/bfs.c b/grub-core/fs/bfs.c
+index 47dbe20..8d704e2 100644
+--- a/grub-core/fs/bfs.c
++++ b/grub-core/fs/bfs.c
+@@ -30,6 +30,7 @@
+ #include <grub/types.h>
+ #include <grub/i18n.h>
+ #include <grub/fshelp.h>
++#include <grub/lockdown.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -1104,7 +1105,10 @@ GRUB_MOD_INIT (bfs)
+ {
+   COMPILE_TIME_ASSERT (1 << LOG_EXTENT_SIZE ==
+ 		       sizeof (struct grub_bfs_extent));
+-  grub_fs_register (&grub_bfs_fs);
++  if (!grub_is_lockdown ())
++    {
++      grub_fs_register (&grub_bfs_fs);
++    }
+ }
+ 
+ #ifdef MODE_AFS
+@@ -1113,5 +1117,6 @@ GRUB_MOD_FINI (afs)
+ GRUB_MOD_FINI (bfs)
+ #endif
+ {
+-  grub_fs_unregister (&grub_bfs_fs);
++  if (!grub_is_lockdown ())
++    grub_fs_unregister (&grub_bfs_fs);
+ }
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45780.patch b/meta/recipes-bsp/grub/files/CVE-2024-45780.patch
new file mode 100644
index 0000000000..91d1e11005
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2024-45780.patch
@@ -0,0 +1,96 @@
+From 0087bc6902182fe5cedce2d034c75a79cf6dd4f3 Mon Sep 17 00:00:00 2001
+From: Lidong Chen <lidong.chen@oracle.com>
+Date: Fri, 22 Nov 2024 06:27:58 +0000
+Subject: [PATCH] fs/tar: Integer overflow leads to heap OOB write
+
+Both namesize and linksize are derived from hd.size, a 12-digit octal
+number parsed by read_number(). Later direct arithmetic calculation like
+"namesize + 1" and "linksize + 1" may exceed the maximum value of
+grub_size_t leading to heap OOB write. This patch fixes the issue by
+using grub_add() and checking for an overflow.
+
+Fixes: CVE-2024-45780
+
+Reported-by: Nils Langius <nils@langius.de>
+Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+Reviewed-by: Alec Brown <alec.r.brown@oracle.com>
+
+CVE: CVE-2024-45780
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=0087bc6902182fe5cedce2d034c75a79cf6dd4f3]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ grub-core/fs/tar.c | 23 ++++++++++++++++++-----
+ 1 file changed, 18 insertions(+), 5 deletions(-)
+
+diff --git a/grub-core/fs/tar.c b/grub-core/fs/tar.c
+index c551ed6..a9e39b0 100644
+--- a/grub-core/fs/tar.c
++++ b/grub-core/fs/tar.c
+@@ -25,6 +25,7 @@
+ #include <grub/mm.h>
+ #include <grub/dl.h>
+ #include <grub/i18n.h>
++#include <grub/safemath.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -76,6 +77,7 @@ grub_cpio_find_file (struct grub_archelp_data *data, char **name,
+ {
+   struct head hd;
+   int reread = 0, have_longname = 0, have_longlink = 0;
++  grub_size_t sz;
+ 
+   data->hofs = data->next_hofs;
+ 
+@@ -97,7 +99,11 @@ grub_cpio_find_file (struct grub_archelp_data *data, char **name,
+ 	{
+ 	  grub_err_t err;
+ 	  grub_size_t namesize = read_number (hd.size, sizeof (hd.size));
+-	  *name = grub_malloc (namesize + 1);
++
++	  if (grub_add (namesize, 1, &sz))
++	    return grub_error (GRUB_ERR_BAD_FS, N_("name size overflow"));
++
++	  *name = grub_malloc (sz);
+ 	  if (*name == NULL)
+ 	    return grub_errno;
+ 	  err = grub_disk_read (data->disk, 0,
+@@ -117,15 +123,19 @@ grub_cpio_find_file (struct grub_archelp_data *data, char **name,
+ 	{
+ 	  grub_err_t err;
+ 	  grub_size_t linksize = read_number (hd.size, sizeof (hd.size));
+-	  if (data->linkname_alloc < linksize + 1)
++
++	  if (grub_add (linksize, 1, &sz))
++	    return grub_error (GRUB_ERR_BAD_FS, N_("link size overflow"));
++
++	  if (data->linkname_alloc < sz)
+ 	    {
+ 	      char *n;
+-	      n = grub_calloc (2, linksize + 1);
++	      n = grub_calloc (2, sz);
+ 	      if (!n)
+ 		return grub_errno;
+ 	      grub_free (data->linkname);
+ 	      data->linkname = n;
+-	      data->linkname_alloc = 2 * (linksize + 1);
++	      data->linkname_alloc = 2 * (sz);
+ 	    }
+ 
+ 	  err = grub_disk_read (data->disk, 0,
+@@ -148,7 +158,10 @@ grub_cpio_find_file (struct grub_archelp_data *data, char **name,
+ 	  while (extra_size < sizeof (hd.prefix)
+ 		 && hd.prefix[extra_size])
+ 	    extra_size++;
+-	  *name = grub_malloc (sizeof (hd.name) + extra_size + 2);
++
++	  if (grub_add (sizeof (hd.name) + 2, extra_size, &sz))
++	    return grub_error (GRUB_ERR_BAD_FS, N_("long name size overflow"));
++	  *name = grub_malloc (sz);
+ 	  if (*name == NULL)
+ 	    return grub_errno;
+ 	  if (hd.prefix[0])
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45781.patch b/meta/recipes-bsp/grub/files/CVE-2024-45781.patch
new file mode 100644
index 0000000000..fb91fa45c7
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2024-45781.patch
@@ -0,0 +1,38 @@
+From c1a291b01f4f1dcd6a22b61f1c81a45a966d16ba Mon Sep 17 00:00:00 2001
+From: B Horn <b@horn.uk>
+Date: Sun, 12 May 2024 02:03:33 +0100
+Subject: [PATCH 2/2] fs/ufs: Fix a heap OOB write
+
+grub_strcpy() was used to copy a symlink name from the filesystem
+image to a heap allocated buffer. This led to a OOB write to adjacent
+heap allocations. Fix by using grub_strlcpy().
+
+Fixes: CVE-2024-45781
+
+Reported-by: B Horn <b@horn.uk>
+Signed-off-by: B Horn <b@horn.uk>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2024-45781
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=c1a291b01f4f1dcd6a22b61f1c81a45a966d16ba]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ grub-core/fs/ufs.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/grub-core/fs/ufs.c b/grub-core/fs/ufs.c
+index 34a698b..4727266 100644
+--- a/grub-core/fs/ufs.c
++++ b/grub-core/fs/ufs.c
+@@ -463,7 +463,7 @@ grub_ufs_lookup_symlink (struct grub_ufs_data *data, int ino)
+   /* Check against zero is paylindromic, no need to swap.  */
+   if (data->inode.nblocks == 0
+       && INODE_SIZE (data) <= sizeof (data->inode.symlink))
+-    grub_strcpy (symlink, (char *) data->inode.symlink);
++    grub_strlcpy (symlink, (char *) data->inode.symlink, sz);
+   else
+     {
+       if (grub_ufs_read_file (data, 0, 0, 0, sz, symlink) < 0)
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45782_CVE-2024-56737.patch b/meta/recipes-bsp/grub/files/CVE-2024-45782_CVE-2024-56737.patch
new file mode 100644
index 0000000000..5ba779f9ee
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2024-45782_CVE-2024-56737.patch
@@ -0,0 +1,39 @@
+From 417547c10410b714e43f08f74137c24015f8f4c3 Mon Sep 17 00:00:00 2001
+From: B Horn <b@horn.uk>
+Date: Sun, 12 May 2024 02:48:33 +0100
+Subject: [PATCH] fs/hfs: Fix stack OOB write with grub_strcpy()
+
+Replaced with grub_strlcpy().
+
+Fixes: CVE-2024-45782
+Fixes: CVE-2024-56737
+Fixes: https://savannah.gnu.org/bugs/?66599
+
+Reported-by: B Horn <b@horn.uk>
+Signed-off-by: B Horn <b@horn.uk>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2024-45782
+CVE: CVE-2024-56737
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=417547c10410b714e43f08f74137c24015f8f4c3]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ grub-core/fs/hfs.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/grub-core/fs/hfs.c b/grub-core/fs/hfs.c
+index f419965..bb7af5f 100644
+--- a/grub-core/fs/hfs.c
++++ b/grub-core/fs/hfs.c
+@@ -379,7 +379,7 @@ grub_hfs_mount (grub_disk_t disk)
+      volume name.  */
+   key.parent_dir = grub_cpu_to_be32_compile_time (1);
+   key.strlen = data->sblock.volname[0];
+-  grub_strcpy ((char *) key.str, (char *) (data->sblock.volname + 1));
++  grub_strlcpy ((char *) key.str, (char *) (data->sblock.volname + 1), sizeof (key.str));
+ 
+   if (grub_hfs_find_node (data, (char *) &key, data->cat_root,
+ 			  0, (char *) &dir, sizeof (dir)) == 0)
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45783.patch b/meta/recipes-bsp/grub/files/CVE-2024-45783.patch
new file mode 100644
index 0000000000..793192d05a
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2024-45783.patch
@@ -0,0 +1,42 @@
+From f7c070a2e28dfab7137db0739fb8db1dc02d8898 Mon Sep 17 00:00:00 2001
+From: B Horn <b@horn.uk>
+Date: Sun, 12 May 2024 06:22:51 +0100
+Subject: [PATCH] fs/hfsplus: Set a grub_errno if mount fails
+
+It was possible for mount to fail but not set grub_errno. This led to
+a possible double decrement of the module reference count if the NULL
+page was mapped.
+
+Fixing in general as a similar bug was fixed in commit 61b13c187
+(fs/hfsplus: Set grub_errno to prevent NULL pointer access) and there
+are likely more variants around.
+
+Fixes: CVE-2024-45783
+
+Reported-by: B Horn <b@horn.uk>
+Signed-off-by: B Horn <b@horn.uk>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2024-45783
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=f7c070a2e28dfab7137db0739fb8db1dc02d8898]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ grub-core/fs/hfsplus.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/grub-core/fs/hfsplus.c b/grub-core/fs/hfsplus.c
+index 19c7b33..e7fd98a 100644
+--- a/grub-core/fs/hfsplus.c
++++ b/grub-core/fs/hfsplus.c
+@@ -393,7 +393,7 @@ grub_hfsplus_mount (grub_disk_t disk)
+ 
+  fail:
+ 
+-  if (grub_errno == GRUB_ERR_OUT_OF_RANGE)
++  if (grub_errno == GRUB_ERR_OUT_OF_RANGE || grub_errno == GRUB_ERR_NONE)
+     grub_error (GRUB_ERR_BAD_FS, "not a HFS+ filesystem");
+ 
+   grub_free (data);
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 3e96426b82..259a0a4c3d 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -41,6 +41,16 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
 	   file://CVE-2023-4692.patch \
            file://CVE-2023-4693.patch \
            file://0001-fs-fat-Don-t-error-when-mtime-is-0.patch \
+           file://0001-misc-Implement-grub_strlcpy.patch \
+           file://CVE-2024-45774.patch \
+           file://CVE-2024-45775.patch \
+           file://CVE-2024-45776.patch \
+           file://CVE-2024-45777.patch \
+           file://CVE-2024-45778_CVE-2024-45779.patch \
+           file://CVE-2024-45780.patch \
+           file://CVE-2024-45781.patch \
+           file://CVE-2024-45782_CVE-2024-56737.patch \
+           file://CVE-2024-45783.patch \
 "
 
 SRC_URI[sha256sum] = "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
-- 
2.25.1


