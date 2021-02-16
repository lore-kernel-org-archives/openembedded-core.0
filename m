Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web10.8616.1613486588245557211
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 06:43:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=I3rZHF7q;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 100so9181320otg.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 06:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BxzFaRp0dkN8olfhroLof4BlhQpWGEcpwjzxynMF6pE=;
        b=I3rZHF7qO2seiGrWdbZZmgXbvHxvnThqR0h9pZPDgKn8y04c9cbEmu+BX9tqMNWcyH
         waufUcpeqVSfa3uzPFlUlYUL+f9RKmSUwX/XzCuhfAm7CYw0PlybA9IULdphxzG1FvMc
         c0gxFoyquDAc75kDECVrTNthGRKpG4or/HbXR0nBe1ea/YMmMkiQYuLBxoraDOBU/EWM
         dSNgNnjPiZuWRQF/hMzYYTz8ANP+JrYgZRP29BLrqUxks6+g+fP2yV2V5VveYhNiiwxa
         jUyjV9s3mRcql4yOQuJqMhWaRXI3Dm6EAR3zJDN2h33aVPmHEf6uj5lj6PM7vZeAoneu
         rxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BxzFaRp0dkN8olfhroLof4BlhQpWGEcpwjzxynMF6pE=;
        b=MO8+MS/F0+8Sg2PY+pSgXrsW7+7u9rV4o72izcu/8nfQ4BoBfqDgMpxgEy+T2E9OIJ
         hmrcDVAZ9b0rkpH0jYRjG5XLxxXbXGjrjLFhTqUUTxxofqV2OBdaHWcUtmVzH6ABZqsQ
         oxrRLPVVw86e3vp4mkSfFK5RodMSOajtWkIi+0kIwSb/KpdVpTZIgKzjPUAn/Lf0D422
         UVfrd7Waz+iyeU44g6QnlvahGjWQRv1fPvFObBFVy120RSBiYz4eP1cgXoZfpbujSrc1
         zBgD/QICrLGBFtEpEdCDVhZn6tyxOy2u980z1INfg7JMcV8D9dkfQXam4Hg9vsLBJUyL
         xKBw==
X-Gm-Message-State: AOAM532lEO9u9XfI22DVSik66e4FyvvNm5dkW+1z3kZueK64sIGIsEoN
	yv5D4t5x/w1g8w40t1SIylYpdtTMnss=
X-Google-Smtp-Source: ABdhPJybUHpOwP40muCs6YTk5AhSMOiJOdcaRc1dJN9BYGyX1i8m2TWlnnp92Gz9YnWYQ/kaXP96hQ==
X-Received: by 2002:a9d:684f:: with SMTP id c15mr14124364oto.40.1613486587394;
        Tue, 16 Feb 2021 06:43:07 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id z24sm4291909ote.1.2021.02.16.06.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 06:43:06 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 1/2] bison: Fix up file name mapping
Date: Tue, 16 Feb 2021 08:43:02 -0600
Message-Id: <20210216144303.33986-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210216144303.33986-1-JPEWhacker@gmail.com>
References: <20210216144303.33986-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

File name mapping was added to bison, but needs to be applied in more
cases. Add a patch to enable file name mapping for symbols

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 ...001-Use-mapped-file-name-for-symbols.patch | 62 +++++++++++++++++++
 meta/recipes-devtools/bison/bison_3.7.5.bb    |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-devtools/bison/bison/0001-Use-mapped-file-name-for-symbols.patch

diff --git a/meta/recipes-devtools/bison/bison/0001-Use-mapped-file-name-for-symbols.patch b/meta/recipes-devtools/bison/bison/0001-Use-mapped-file-name-for-symbols.patch
new file mode 100644
index 0000000000..568ee4df19
--- /dev/null
+++ b/meta/recipes-devtools/bison/bison/0001-Use-mapped-file-name-for-symbols.patch
@@ -0,0 +1,62 @@
+From 2a3db4e3b8d33bad5577c2fcfe124ee7a202ef4f Mon Sep 17 00:00:00 2001
+From: Joshua Watt <JPEWhacker@gmail.com>
+Date: Mon, 15 Feb 2021 20:39:57 -0600
+Subject: [PATCH] Use mapped file name for symbols
+
+Applies the file name mapping before exporting it as a symbol. This
+allows the symbols to correctly respect the --file-prefix-map command
+line option.
+
+Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bison-patches/2021-02/msg00014.html]
+---
+ src/muscle-tab.c | 4 +++-
+ src/output.c     | 8 ++++++--
+ 2 files changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/src/muscle-tab.c b/src/muscle-tab.c
+index b610d0b8..3e7657ca 100644
+--- a/src/muscle-tab.c
++++ b/src/muscle-tab.c
+@@ -204,8 +204,10 @@ static void
+ muscle_syncline_grow (char const *key, location loc)
+ {
+   obstack_printf (&muscle_obstack, "]b4_syncline(%d, ", loc.start.line);
++  char *f = map_file_name (loc.start.file);
+   obstack_quote (&muscle_obstack,
+-                 quotearg_style (c_quoting_style, loc.start.file));
++                 quotearg_style (c_quoting_style, f));
++  free (f);
+   obstack_sgrow (&muscle_obstack, ")dnl\n[");
+   char const *extension = obstack_finish0 (&muscle_obstack);
+   muscle_grow (key, extension, "", "");
+diff --git a/src/output.c b/src/output.c
+index 391d8e65..34dbc671 100644
+--- a/src/output.c
++++ b/src/output.c
+@@ -531,7 +531,9 @@ user_actions_output (FILE *out)
+           {
+             fprintf (out, "b4_syncline(%d, ",
+                      rules[r].action_loc.start.line);
+-            string_output (out, rules[r].action_loc.start.file);
++            char *f = map_file_name (rules[r].action_loc.start.file);
++            string_output (out, f);
++            free(f);
+             fprintf (out, ")dnl\n");
+           }
+         fprintf (out, "[%*s%s]],\n[[",
+@@ -629,8 +631,10 @@ prepare_symbol_definitions (void)
+ 
+           if (p->code)
+             {
++              char *f = map_file_name (p->location.start.file);
+               SET_KEY2 (pname, "file");
+-              MUSCLE_INSERT_C_STRING (key, p->location.start.file);
++              MUSCLE_INSERT_C_STRING (key, f);
++              free (f);
+ 
+               SET_KEY2 (pname, "line");
+               MUSCLE_INSERT_INT (key, p->location.start.line);
+-- 
+2.30.0
+
diff --git a/meta/recipes-devtools/bison/bison_3.7.5.bb b/meta/recipes-devtools/bison/bison_3.7.5.bb
index f8263f93a3..c8bbea4454 100644
--- a/meta/recipes-devtools/bison/bison_3.7.5.bb
+++ b/meta/recipes-devtools/bison/bison_3.7.5.bb
@@ -11,6 +11,7 @@ DEPENDS = "bison-native flex-native"
 
 SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://add-with-bisonlocaledir.patch \
+           file://0001-Use-mapped-file-name-for-symbols.patch \
            "
 SRC_URI[sha256sum] = "e8c53bc5bc396d636622d0f25e31ca92fd53f00b09629f13ef540d564a6b31ab"
 
-- 
2.30.0

