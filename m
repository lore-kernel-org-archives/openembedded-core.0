Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.36807.1614009685491576194
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 08:01:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: kTDIxCjzlRxjyHNkNs4zSXzPkFd/N3I1Pw14EiDm+X2t/eCiCDIOe+XSvqpKSKt9WpdP7M0Wc5
 CTzTs8mkdthQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="163706251"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="163706251"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:01:24 -0800
IronPort-SDR: qhnglVCR2wj3pM5MuJLJb1uphS5uoqNwNOF32BSB9P1oIcH6MV4HiB5BXTJw3o6im0myb92h1P
 rfqAKOCu64ZA==
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="430302156"
Received: from yrajendx-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.39])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:01:21 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 29/30] bison: Fix up file name mapping
Date: Tue, 23 Feb 2021 00:00:32 +0800
Message-Id: <a47a39a70918f18f092d0f38313f015ee79cadbf.1614009417.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614009417.git.anuj.mittal@intel.com>
References: <cover.1614009417.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joshua Watt <JPEWhacker@gmail.com>

File name mapping was added to bison, but needs to be applied in more
cases. Add a patch to enable file name mapping for symbols

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5a213506377b0db4e88ca094215eadf08c21a2e1)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...001-Use-mapped-file-name-for-symbols.patch | 62 +++++++++++++++++++
 meta/recipes-devtools/bison/bison_3.7.2.bb    |  1 +
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
diff --git a/meta/recipes-devtools/bison/bison_3.7.2.bb b/meta/recipes-devtools/bison/bison_3.7.2.bb
index ace4ea5c3f..6fd9d288e0 100644
--- a/meta/recipes-devtools/bison/bison_3.7.2.bb
+++ b/meta/recipes-devtools/bison/bison_3.7.2.bb
@@ -11,6 +11,7 @@ DEPENDS = "bison-native flex-native"
 
 SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://add-with-bisonlocaledir.patch \
+           file://0001-Use-mapped-file-name-for-symbols.patch \
            "
 SRC_URI[sha256sum] = "7948d193104d979c0fb0294a1854c73c89d72ae41acfc081826142578a78a91b"
 
-- 
2.29.2

