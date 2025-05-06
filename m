Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D45DC3ABBC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 15:57:56 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.79444.1746547070304968456
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 08:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=C0ItxMf5;
 spf=pass (domain: mvista.com, ip: 209.85.214.181, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22928d629faso55171075ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 08:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1746547069; x=1747151869; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gn0bdOIYpPxUcNy0xRu8CIRVyRHB1FaGDm0WO771eQU=;
        b=C0ItxMf5ToNUmlhZiIQuKqzsgMzwLfWb5dtM6JVpkR7XPrdAt++BYwi6TpDBzDLqnK
         NjiTAfTlLNqw3EBV4djzDOfjbgzmcZiU+Ot/g6RDYumBT4uFPAEQVanfFdu/Jes2dr/G
         TooWQ/dqP7+ENoszpVgWfXxY+mVAHU5imfVus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746547069; x=1747151869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gn0bdOIYpPxUcNy0xRu8CIRVyRHB1FaGDm0WO771eQU=;
        b=kIFYGzNxLyEhN0Mr5oh92knq6jSyQZaUYJ0usTQ9iwRTySFH4Jqmr8u5hlRaqyalO/
         GY4PR39DEcxHraGejOVyriRtYBK41fQMJMXLI/hMzPoRQCjIHi5W3bJjs1pKIAEPIie8
         Op+uTCmdo07LM8GrfJv72IEViD2z7Dn1/Go17LIayzYa1Hg5/8DJ43ZOKYGyI6wIciyo
         At+hzzFFlwqv0ngbCLuTJYDF5bZRnkzeCF8lMniXI9yPE0kbDJFvtZnq091thTc1SF+E
         ERqF9b7JhkLYA7ahpTiWghX6rFZ50v+WYEyEGKXEc5DzfS0E9lp+O7N3M244Ag594o88
         lSbg==
X-Gm-Message-State: AOJu0Yzp+v9k73M2IIXJyRHPRa6HovbsfHj3l7TT5inm/fB1EV/J4tSJ
	k07xT1523j7NDb2N8GZslSAcAfkc9pv9/dWOy9p92/3Y7cSi1ZOdnGGXagIf+aREpGlao/o6XML
	ZAVI=
X-Gm-Gg: ASbGncuNMyWldMSmW8qpKiRubuAmQly2j/WIratng0mCNPgQ79v9a4LSqh4OvS+qnB5
	3FX/hZKI+aVUG0adG36eV+nPwWF6l7ASVdFZ6jp0b2erDRreynD3qDq1pH0S0cAXr0pMKH/iWRj
	YgcJXQd/cgB5LK5SVbPEunEfz8si5Ef1yWYejadjlv7igoJUj4BWohhGUpIDISkPk4mkcp6dGhd
	rKKYBJnGR94VD7y4d8+TTVlCcHAQ4pG2Nj9mGzOOynD2hVgm91Ahu3cVVYD99tPflmloj/F94mM
	L64Ls8688IQ+iucnUE7iHpW5uJI/fHXSUXchBUhYeUgl+QCsJ7cnXRfB7QuV0Q==
X-Google-Smtp-Source: AGHT+IFjm/6q0ZqQHPGp9i0EmDjY62N+6OZ492u83fOvsrWX5d9GIaTded9aILL08RGEuXJb4AHkyQ==
X-Received: by 2002:a17:903:32cc:b0:224:216e:3342 with SMTP id d9443c01a7336-22e1ea8d0f9mr169732595ad.43.1746547068819;
        Tue, 06 May 2025 08:57:48 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.214.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e152204desm75502685ad.140.2025.05.06.08.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:57:48 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH 2/5] libsoup-2.4: Fix CVE-2024-52531
Date: Tue,  6 May 2025 21:27:28 +0530
Message-Id: <20250506155731.677168-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250506155731.677168-1-vanusuri@mvista.com>
References: <20250506155731.677168-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 15:57:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216069

From: Vijay Anusuri <vanusuri@mvista.com>

import patch from ubuntu to fix
 CVE-2024-52531

Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/libsoup2.4/tree/debian/patches?h=ubuntu/jammy-security
Upstream commit
https://gitlab.gnome.org/GNOME/libsoup/-/commit/a35222dd0bfab2ac97c10e86b95f762456628283
&
https://gitlab.gnome.org/GNOME/libsoup/-/commit/825fda3425546847b42ad5270544e9388ff349fe]

Reference:
https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/407/
https://ubuntu.com/security/CVE-2024-52531

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libsoup-2.4/CVE-2024-52531-1.patch        | 131 ++++++++++++++++++
 .../libsoup-2.4/CVE-2024-52531-2.patch        |  36 +++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |   2 +
 3 files changed, 169 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-2.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-1.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-1.patch
new file mode 100644
index 0000000000..d56ad0ff5e
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-1.patch
@@ -0,0 +1,131 @@
+From a35222dd0bfab2ac97c10e86b95f762456628283 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Tue, 27 Aug 2024 13:53:26 -0500
+Subject: [PATCH 1/2] headers: Be more robust against invalid input when
+ parsing params
+
+If you pass invalid input to a function such as soup_header_parse_param_list_strict()
+it can cause an overflow if it decodes the input to UTF-8.
+
+This should never happen with valid UTF-8 input which libsoup's client API
+ensures, however it's server API does not currently.
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/libsoup2.4/tree/debian/patches/CVE-2024-52531-1.patch?h=ubuntu/jammy-security
+Upstream commit https://gitlab.gnome.org/GNOME/libsoup/-/commit/a35222dd0bfab2ac97c10e86b95f762456628283]
+CVE: CVE-2024-52531
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/soup-headers.c | 46 ++++++++++++++++++++++--------------------
+ 1 file changed, 24 insertions(+), 22 deletions(-)
+
+Index: libsoup2.4-2.74.2/libsoup/soup-headers.c
+===================================================================
+--- libsoup2.4-2.74.2.orig/libsoup/soup-headers.c
++++ libsoup2.4-2.74.2/libsoup/soup-headers.c
+@@ -643,8 +643,9 @@ soup_header_contains (const char *header
+ }
+ 
+ static void
+-decode_quoted_string (char *quoted_string)
++decode_quoted_string_inplace (GString *quoted_gstring)
+ {
++	char *quoted_string = quoted_gstring->str;
+ 	char *src, *dst;
+ 
+ 	src = quoted_string + 1;
+@@ -658,10 +659,11 @@ decode_quoted_string (char *quoted_strin
+ }
+ 
+ static gboolean
+-decode_rfc5987 (char *encoded_string)
++decode_rfc5987_inplace (GString *encoded_gstring)
+ {
+ 	char *q, *decoded;
+ 	gboolean iso_8859_1 = FALSE;
++	const char *encoded_string = encoded_gstring->str;
+ 
+ 	q = strchr (encoded_string, '\'');
+ 	if (!q)
+@@ -690,14 +692,7 @@ decode_rfc5987 (char *encoded_string)
+ 		decoded = utf8;
+ 	}
+ 
+-	/* If encoded_string was UTF-8, then each 3-character %-escape
+-	 * will be converted to a single byte, and so decoded is
+-	 * shorter than encoded_string. If encoded_string was
+-	 * iso-8859-1, then each 3-character %-escape will be
+-	 * converted into at most 2 bytes in UTF-8, and so it's still
+-	 * shorter.
+-	 */
+-	strcpy (encoded_string, decoded);
++	g_string_assign (encoded_gstring, decoded);
+ 	g_free (decoded);
+ 	return TRUE;
+ }
+@@ -707,15 +702,17 @@ parse_param_list (const char *header, ch
+ {
+ 	GHashTable *params;
+ 	GSList *list, *iter;
+-	char *item, *eq, *name_end, *value;
+-	gboolean override, duplicated;
+ 
+ 	params = g_hash_table_new_full (soup_str_case_hash, 
+ 					soup_str_case_equal,
+-					g_free, NULL);
++					g_free, g_free);
+ 
+ 	list = parse_list (header, delim);
+ 	for (iter = list; iter; iter = iter->next) {
++		char *item, *eq, *name_end;
++		gboolean override, duplicated;
++		GString *parsed_value = NULL;
++
+ 		item = iter->data;
+ 		override = FALSE;
+ 
+@@ -730,19 +727,19 @@ parse_param_list (const char *header, ch
+ 
+ 			*name_end = '\0';
+ 
+-			value = (char *)skip_lws (eq + 1);
++			parsed_value = g_string_new ((char *)skip_lws (eq + 1));
+ 
+ 			if (name_end[-1] == '*' && name_end > item + 1) {
+ 				name_end[-1] = '\0';
+-				if (!decode_rfc5987 (value)) {
++				if (!decode_rfc5987_inplace (parsed_value)) {
++					g_string_free (parsed_value, TRUE);
+ 					g_free (item);
+ 					continue;
+ 				}
+ 				override = TRUE;
+-			} else if (*value == '"')
+-				decode_quoted_string (value);
+-		} else
+-			value = NULL;
++			} else if (parsed_value->str[0] == '"')
++				decode_quoted_string_inplace (parsed_value);
++		}
+ 
+ 		duplicated = g_hash_table_lookup_extended (params, item, NULL, NULL);
+ 
+@@ -750,11 +747,16 @@ parse_param_list (const char *header, ch
+ 			soup_header_free_param_list (params);
+ 			params = NULL;
+ 			g_slist_foreach (iter, (GFunc)g_free, NULL);
++			if (parsed_value)
++				g_string_free (parsed_value, TRUE);
+ 			break;
+-		} else if (override || !duplicated)
+-			g_hash_table_replace (params, item, value);
+-		else
++		} else if (override || !duplicated) {
++			g_hash_table_replace (params, item, parsed_value ? g_string_free (parsed_value, FALSE) : NULL);
++		} else {
++			if (parsed_value)
++				g_string_free (parsed_value, TRUE);
+ 			g_free (item);
++		}
+ 	}
+ 
+ 	g_slist_free (list);
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-2.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-2.patch
new file mode 100644
index 0000000000..19b1872866
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-2.patch
@@ -0,0 +1,36 @@
+From 825fda3425546847b42ad5270544e9388ff349fe Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Tue, 27 Aug 2024 13:52:08 -0500
+Subject: [PATCH 2/2] tests: Add test for passing invalid UTF-8 to
+ soup_header_parse_semi_param_list()
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/libsoup2.4/tree/debian/patches/CVE-2024-52531-2.patch?h=ubuntu/jammy-security
+Upstream commit https://gitlab.gnome.org/GNOME/libsoup/-/commit/825fda3425546847b42ad5270544e9388ff349fe]
+CVE: CVE-2024-52531
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ tests/header-parsing-test.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+Index: libsoup2.4-2.74.2/tests/header-parsing-test.c
+===================================================================
+--- libsoup2.4-2.74.2.orig/tests/header-parsing-test.c
++++ libsoup2.4-2.74.2/tests/header-parsing-test.c
+@@ -825,6 +825,17 @@ static struct ParamListTest {
+ 	    { "filename", "t\xC3\xA9st.txt" },
+ 	  },
+ 	},
++
++        /* This tests invalid UTF-8 data which *should* never be passed here but it was designed to be robust against it. */
++        { TRUE,
++              "invalid*=\x69\x27\x27\x93\x93\x93\x93\xff\x61\x61\x61\x61\x61\x61\x61\x62\x63\x64\x65\x0a; filename*=iso-8859-1''\x69\x27\x27\x93\x93\x93\x93\xff\x61\x61\x61\x61\x61\x61\x61\x62\x63\x64\x65\x0a; foo",
++              {
++                    { "filename", "i''\302\223\302\223\302\223\302\223\303\277aaaaaaabcde" },
++                    { "invalid", "\302\223\302\223\302\223\302\223\303\277aaaaaaabcde" },
++                    { "foo", NULL },
++
++                },
++        }
+ };
+ static const int num_paramlisttests = G_N_ELEMENTS (paramlisttests);
+ 
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index b833d2cfa9..bd58773ba3 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -14,6 +14,8 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch \
            file://CVE-2024-52530.patch \
+           file://CVE-2024-52531-1.patch \
+           file://CVE-2024-52531-2.patch \
           "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.25.1


