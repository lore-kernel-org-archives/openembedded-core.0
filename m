Return-Path: <tgamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A272E7F687
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2019 14:35:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x9IEZE8R013747
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2019 07:35:15 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 18 Oct 2019 07:35:13 -0700
Received: by ala-lpggp2.wrs.com (Postfix, from userid 20958)	id 86185C6112F;
	Fri, 18 Oct 2019 07:35:13 -0700 (PDT)
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Oct 2019 07:35:02 -0700
Message-ID: <20191018143502.81069-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] ncurses: fix CVE-2019-17594, CVE-2019-17595
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Oct 2019 14:35:14 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Backport changes to tinfo/comp_hash.c, tinfo/parse_entry.c,
and progs/dump_entry.c from upstream to fix CVEs.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 ...selective-backport-of-20191012-patch.patch | 169 ++++++++++++++++++
 .../ncurses/ncurses_6.1+20190803.bb           |   1 +
 2 files changed, 170 insertions(+)
 create mode 100644 meta/recipes-core/ncurses/files/0001-ncurses-selective-backport-of-20191012-patch.patch

diff --git a/meta/recipes-core/ncurses/files/0001-ncurses-selective-backport-of-20191012-patch.patch b/meta/recipes-core/ncurses/files/0001-ncurses-selective-backport-of-20191012-patch.patch
new file mode 100644
index 0000000000..7870c4ba32
--- /dev/null
+++ b/meta/recipes-core/ncurses/files/0001-ncurses-selective-backport-of-20191012-patch.patch
@@ -0,0 +1,169 @@
+From 064b77f173337aa790f1cec0d741bfbc61a33d31 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <trevor.gamblin@windriver.com>
+Date: Fri, 18 Oct 2019 09:57:43 -0400
+Subject: [PATCH] ncurses: selective backport of 20191012 patch
+
+Upstream-Status: Backport [https://salsa.debian.org/debian/ncurses/commit/243908b1e3d81]
+
+Contents of the upstream patch that are not applied to comp_hash.c, 
+parse_entry.c, or dump_entry.c have been omitted.
+
+CVE: CVE-2019-17594
+CVE: CVE-2019-17595
+
+Signed-off-by: Trevor Gamblin  <trevor.gamblin@windriver.com>
+
+---
+ ncurses/tinfo/comp_hash.c   | 14 ++++++++++----
+ ncurses/tinfo/parse_entry.c | 32 ++++++++++++++++----------------
+ progs/dump_entry.c          |  7 ++++---
+ 3 files changed, 30 insertions(+), 23 deletions(-)
+
+diff --git a/ncurses/tinfo/comp_hash.c b/ncurses/tinfo/comp_hash.c
+index 21f165ca..a62d38f9 100644
+--- a/ncurses/tinfo/comp_hash.c
++++ b/ncurses/tinfo/comp_hash.c
+@@ -44,7 +44,7 @@
+ #include <tic.h>
+ #include <hashsize.h>
+ 
+-MODULE_ID("$Id: comp_hash.c,v 1.49 2019/03/10 00:06:48 tom Exp $")
++MODULE_ID("$Id: comp_hash.c,v 1.51 2019/10/12 16:32:13 tom Exp $")
+ 
+ /*
+  * Finds the entry for the given string in the hash table if present.
+@@ -63,7 +63,9 @@ _nc_find_entry(const char *string,
+ 
+     hashvalue = data->hash_of(string);
+ 
+-    if (data->table_data[hashvalue] >= 0) {
++    if (hashvalue >= 0
++	&& (unsigned) hashvalue < data->table_size
++	&& data->table_data[hashvalue] >= 0) {
+ 
+ 	real_table = _nc_get_table(termcap);
+ 	ptr = real_table + data->table_data[hashvalue];
+@@ -96,7 +98,9 @@ _nc_find_type_entry(const char *string,
+     const HashData *data = _nc_get_hash_info(termcap);
+     int hashvalue = data->hash_of(string);
+ 
+-    if (data->table_data[hashvalue] >= 0) {
++    if (hashvalue >= 0
++	&& (unsigned) hashvalue < data->table_size
++	&& data->table_data[hashvalue] >= 0) {
+ 	const struct name_table_entry *const table = _nc_get_table(termcap);
+ 
+ 	ptr = table + data->table_data[hashvalue];
+@@ -124,7 +128,9 @@ _nc_find_user_entry(const char *string)
+ 
+     hashvalue = data->hash_of(string);
+ 
+-    if (data->table_data[hashvalue] >= 0) {
++    if (hashvalue >= 0
++	&& (unsigned) hashvalue < data->table_size
++	&& data->table_data[hashvalue] >= 0) {
+ 
+ 	real_table = _nc_get_userdefs_table();
+ 	ptr = real_table + data->table_data[hashvalue];
+diff --git a/ncurses/tinfo/parse_entry.c b/ncurses/tinfo/parse_entry.c
+index f8cca8b5..064376c5 100644
+--- a/ncurses/tinfo/parse_entry.c
++++ b/ncurses/tinfo/parse_entry.c
+@@ -47,7 +47,7 @@
+ #include <ctype.h>
+ #include <tic.h>
+ 
+-MODULE_ID("$Id: parse_entry.c,v 1.97 2019/08/03 23:10:38 tom Exp $")
++MODULE_ID("$Id: parse_entry.c,v 1.98 2019/10/12 00:50:31 tom Exp $")
+ 
+ #ifdef LINT
+ static short const parametrized[] =
+@@ -654,12 +654,12 @@ _nc_capcmp(const char *s, const char *t)
+ }
+ 
+ static void
+-append_acs0(string_desc * dst, int code, int src)
++append_acs0(string_desc * dst, int code, char *src, size_t off)
+ {
+-    if (src != 0) {
++    if (src != 0 && off < strlen(src)) {
+ 	char temp[3];
+ 	temp[0] = (char) code;
+-	temp[1] = (char) src;
++	temp[1] = src[off];
+ 	temp[2] = 0;
+ 	_nc_safe_strcat(dst, temp);
+     }
+@@ -669,7 +669,7 @@ static void
+ append_acs(string_desc * dst, int code, char *src)
+ {
+     if (VALID_STRING(src) && strlen(src) == 1) {
+-	append_acs0(dst, code, *src);
++	append_acs0(dst, code, src, 0);
+     }
+ }
+ 
+@@ -1038,17 +1038,17 @@ postprocess_terminfo(TERMTYPE2 *tp)
+ 	_nc_str_init(&result, buf2, sizeof(buf2));
+ 	_nc_safe_strcat(&result, acs_chars);
+ 
+-	append_acs0(&result, 'l', box_chars_1[0]);	/* ACS_ULCORNER */
+-	append_acs0(&result, 'q', box_chars_1[1]);	/* ACS_HLINE */
+-	append_acs0(&result, 'k', box_chars_1[2]);	/* ACS_URCORNER */
+-	append_acs0(&result, 'x', box_chars_1[3]);	/* ACS_VLINE */
+-	append_acs0(&result, 'j', box_chars_1[4]);	/* ACS_LRCORNER */
+-	append_acs0(&result, 'm', box_chars_1[5]);	/* ACS_LLCORNER */
+-	append_acs0(&result, 'w', box_chars_1[6]);	/* ACS_TTEE */
+-	append_acs0(&result, 'u', box_chars_1[7]);	/* ACS_RTEE */
+-	append_acs0(&result, 'v', box_chars_1[8]);	/* ACS_BTEE */
+-	append_acs0(&result, 't', box_chars_1[9]);	/* ACS_LTEE */
+-	append_acs0(&result, 'n', box_chars_1[10]);	/* ACS_PLUS */
++	append_acs0(&result, 'l', box_chars_1, 0);	/* ACS_ULCORNER */
++	append_acs0(&result, 'q', box_chars_1, 1);	/* ACS_HLINE */
++	append_acs0(&result, 'k', box_chars_1, 2);	/* ACS_URCORNER */
++	append_acs0(&result, 'x', box_chars_1, 3);	/* ACS_VLINE */
++	append_acs0(&result, 'j', box_chars_1, 4);	/* ACS_LRCORNER */
++	append_acs0(&result, 'm', box_chars_1, 5);	/* ACS_LLCORNER */
++	append_acs0(&result, 'w', box_chars_1, 6);	/* ACS_TTEE */
++	append_acs0(&result, 'u', box_chars_1, 7);	/* ACS_RTEE */
++	append_acs0(&result, 'v', box_chars_1, 8);	/* ACS_BTEE */
++	append_acs0(&result, 't', box_chars_1, 9);	/* ACS_LTEE */
++	append_acs0(&result, 'n', box_chars_1, 10);	/* ACS_PLUS */
+ 
+ 	if (buf2[0]) {
+ 	    acs_chars = _nc_save_str(buf2);
+diff --git a/progs/dump_entry.c b/progs/dump_entry.c
+index d0e420ec..8a47084a 100644
+--- a/progs/dump_entry.c
++++ b/progs/dump_entry.c
+@@ -39,7 +39,7 @@
+ #include "termsort.c"		/* this C file is generated */
+ #include <parametrized.h>	/* so is this */
+ 
+-MODULE_ID("$Id: dump_entry.c,v 1.173 2019/05/11 21:02:24 tom Exp $")
++MODULE_ID("$Id: dump_entry.c,v 1.175 2019/10/12 15:59:07 tom Exp $")
+ 
+ #define DISCARD(string) string = ABSENT_STRING
+ #define PRINTF (void) printf
+@@ -1136,7 +1136,8 @@ fmt_entry(TERMTYPE2 *tterm,
+ 				*d++ = '\\';
+ 				*d = ':';
+ 			    } else if (*d == '\\') {
+-				*++d = *s++;
++				if ((*++d = *s++) == '\0')
++				    break;
+ 			    }
+ 			    d++;
+ 			    *d = '\0';
+@@ -1396,7 +1397,7 @@ one_one_mapping(const char *mapping)
+ 
+     if (VALID_STRING(mapping)) {
+ 	int n = 0;
+-	while (mapping[n] != '\0') {
++	while (mapping[n] != '\0' && mapping[n + 1] != '\0') {
+ 	    if (isLine(mapping[n]) &&
+ 		mapping[n] != mapping[n + 1]) {
+ 		result = FALSE;
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/ncurses/ncurses_6.1+20190803.bb b/meta/recipes-core/ncurses/ncurses_6.1+20190803.bb
index a44d78e4fe..e638a3737c 100644
--- a/meta/recipes-core/ncurses/ncurses_6.1+20190803.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.1+20190803.bb
@@ -3,6 +3,7 @@ require ncurses.inc
 SRC_URI += "file://0001-tic-hang.patch \
             file://0002-configure-reproducible.patch \
             file://config.cache \
+            file://0001-ncurses-selective-backport-of-20191012-patch.patch \
 "
 # commit id corresponds to the revision in package version
 SRCREV = "3c9b2677c96c645496997321bf2fe465a5e7e21f"
-- 
2.23.0


