Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web11.25791.1591983236820284184
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 10:33:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id k22so7724083qtm.6
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2020 10:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=r4jqpYUlAZKtq8It5OUjHphTuWFMZuDq3JSKM3knUGA=;
        b=JqIMDsBF+TIzv41hdC1s9CEcJ8aCU3VLcgnMhf62IcaOyaw8imC483lWBUIN/vaxJy
         yhxTU2otwSVRxLfzP9bXFhe+tnpGmi3JKmOxQVQGcR9zymeLeyR503wFZECTbyZjE2Lh
         OFVsVlsVB0dfSk8dCFafRQA0Dsg5FzRoSO2yOV+FXVpyjGk1BXK+hFhGOh4fxbsKQZ6s
         cI/Rn0x1yqzX0x1nqbolJuWxQN58dGHokTLrfCKHguIIDQ7axr8QEkAAalICs+4l7BzR
         dQE6NDZ+F1v6RSBxuSQWf8fwCktsB1nWJ9+rY+1/33mMBaRUaF+cu1K0UIuavcbGIBCg
         o+VQ==
X-Gm-Message-State: AOAM530JutvtfdRTtjrLSjeviJ56xRM8P4RCpCjQVnx5wJkdE/T14Ahr
	5dtL0TbdYHW98BX87IK5Z1v419FB73c=
X-Google-Smtp-Source: ABdhPJzbf1CtklX3ntt3bRjcW8zZsn2PrYAhJtnfKpFOi6u0flpVWMxwBArtWeNmKyc5lBak+YX21w==
X-Received: by 2002:ac8:53cf:: with SMTP id c15mr4410989qtq.230.1591983235701;
        Fri, 12 Jun 2020 10:33:55 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id p185sm4621172qkd.128.2020.06.12.10.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 10:33:55 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Richard Leitner <richard.leitner@skidata.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [dunfell-backport PATCH 9/9] binutils: add patch to fix issues with gcc 10
Date: Fri, 12 Jun 2020 14:33:18 -0300
Message-Id: <20200612173318.103232-9-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200612173318.103232-1-otavio@ossystems.com.br>
References: <20200612173318.103232-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: Richard Leitner <richard.leitner@skidata.com>

gcc 10 introduced "-fno-common" as default. Therefore backport the
according binutils patch to fix this issue.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fbeb572e1872cf64786d01d5c6408a6765f814ce)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../binutils/binutils-2.34.inc                |  1 +
 ...dundant-program_name-definition-fno-.patch | 61 +++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-binutils-drop-redundant-program_name-definition-fno-.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.34.inc b/meta/recipes-devtools/binutils/binutils-2.34.inc
index 66a3850ef2..f65fdb7328 100644
--- a/meta/recipes-devtools/binutils/binutils-2.34.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.34.inc
@@ -41,6 +41,7 @@ SRC_URI = "\
      file://0014-Detect-64-bit-MIPS-targets.patch \
      file://0015-sync-with-OE-libtool-changes.patch \
      file://0016-Check-for-clang-before-checking-gcc-version.patch \
+     file://0017-binutils-drop-redundant-program_name-definition-fno-.patch \
      file://CVE-2020-0551.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0017-binutils-drop-redundant-program_name-definition-fno-.patch b/meta/recipes-devtools/binutils/binutils/0017-binutils-drop-redundant-program_name-definition-fno-.patch
new file mode 100644
index 0000000000..55af9abc13
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0017-binutils-drop-redundant-program_name-definition-fno-.patch
@@ -0,0 +1,61 @@
+From 57a3e055605b28a9449b1b27eda7125737c42b00 Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <siarheit@google.com>
+Date: Sat, 1 Feb 2020 23:16:11 +0000
+Subject: [PATCH] binutils: drop redundant 'program_name' definition
+ (-fno-common)
+
+	* coffdump.c (program_name): Drop redundant definition.
+	* srconv.c (program_name): Likewise
+	* sysdump.c (program_name): Likewise
+
+Upstream-Status: Accepted (commit 0b398d69ac)
+Signed-off-by: Sergei Trofimovich <siarheit@google.com>
+Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
+---
+ binutils/coffdump.c | 2 --
+ binutils/srconv.c   | 2 --
+ binutils/sysdump.c  | 2 --
+ 3 files changed, 6 deletions(-)
+
+diff --git a/binutils/coffdump.c b/binutils/coffdump.c
+index 531a4e46c3..336da57ca2 100644
+--- a/binutils/coffdump.c
++++ b/binutils/coffdump.c
+@@ -456,8 +456,6 @@ coff_dump (struct coff_ofile *ptr)
+     dump_coff_section (ptr->sections + i);
+ }
+ 
+-char * program_name;
+-
+ static void
+ show_usage (FILE *file, int status)
+ {
+diff --git a/binutils/srconv.c b/binutils/srconv.c
+index 5742b16759..f071794f0a 100644
+--- a/binutils/srconv.c
++++ b/binutils/srconv.c
+@@ -1687,8 +1687,6 @@ prescan (struct coff_ofile *otree)
+     }
+ }
+ 
+-char *program_name;
+-
+ ATTRIBUTE_NORETURN static void
+ show_usage (FILE *ffile, int status)
+ {
+diff --git a/binutils/sysdump.c b/binutils/sysdump.c
+index d433e71ed9..7eebbd61d3 100644
+--- a/binutils/sysdump.c
++++ b/binutils/sysdump.c
+@@ -633,8 +633,6 @@ module (void)
+     }
+ }
+ 
+-char *program_name;
+-
+ ATTRIBUTE_NORETURN static void
+ show_usage (FILE *ffile, int status)
+ {
+-- 
+2.26.2
+
-- 
2.27.0

