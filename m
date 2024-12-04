Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57398E77171
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 17:54:45 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.21201.1733334883820510016
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 09:54:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hvk1j6v3;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7fbd9be84bdso56537a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 09:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733334883; x=1733939683; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pnGyj9tbYDaPs3BJr+2vp6Ifzu1Xeliy3d6GGBJHSi4=;
        b=hvk1j6v3V0mFEVLppO2NNg7edMl0tSWNftc13R1QGh2S9gmVAtMLlJmdTbSrZUGjsL
         +iZ+fT01YXVv0q9lICDhMCEqcujJLa9EdvvIJo8YNWTeiZ4dakXm/EOdAv5fNwcFO2u6
         BEcloKC84hP4sD8NwmE6M9E3HVkza8Osk7GNqu3oT+bHuEFHONEaFJBrrE5aoG+9JfCj
         fCxjvGmi0a9XF1vUaNgRMArZR17bLb8caD9j4RrUJxoeUsoFkDWHEdwdlxbIka7iUQzW
         941E8WZhVgBV3H0INF98AOTtUr5Eaavsw+e0q/O7R0OvtUYnuEDib+NBJ+00QfMVqcIc
         3DHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733334883; x=1733939683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pnGyj9tbYDaPs3BJr+2vp6Ifzu1Xeliy3d6GGBJHSi4=;
        b=G4s1vWoKjkqSKKhgvfPffzq/7MxHbLx9QWjidG4iQvYdbYOaLZLiDZw0wiDj4oheLB
         hrJ+gS2qhu0UDRQ0YQLqBzcIODrhsHnjOS9ppV4uXusO9hUbJS1POTJEAXwibep/1bQe
         O9dsQT+SkMQtpUQwAFmU3nHG9zanPJ4qt1iCGByueU09EhaqL1YurKUOXYgUPqaPjRcQ
         tJtM2RHUCdxPIsyzdlU3zXDZKOhFVUh42KEZ+RivjxC3G96/NNlLp7Ttc4Ht/VealVGv
         iNBOhxxy3viWjXOTuOE0wfrcPXvastI0JFyKLwIjEPdYjxkVlfvdixYvCO8XORT6D+51
         LRrA==
X-Gm-Message-State: AOJu0YxAmgS521VFUB5L7iXbDbggnpKhPvmJpLbsD/vIM9JcaSNNDvC3
	99TGTHFbBg7PbncDW3BJY3oOy54Gk74Kf/IIo4UkD5/JwC3KeexUAcKnQh6xI7t8DLbhDorSNHw
	y
X-Gm-Gg: ASbGnctpIxEQNrqoWtovllQ6Shd9JTBsruOS/IfEMiQNdAHXKR/7noF/mADaqNUPAtL
	9IPWhrSA2NXrxSA0R3+D11mnw4PIlZNK5xE7YHmFSPK5ZYK38JOgBtsiW948m8ajLs81PewJ0JC
	ElGf30J65sNuV4zTUpgazSVW2vl2vCewFBuVfu8gJHtLpjqALnlIkOpXCpbYPsAfbLP8krGgeek
	9r9mr1mp34idKsNAMaCis3MkSz80ei0TElrioo=
X-Google-Smtp-Source: AGHT+IHOlaJksbjNO/legKa0BP0JRjEz9c5QhKHlGCk7hUGQPKkh+GwJDpM/z9d1aNL1M7WH9LIkvg==
X-Received: by 2002:a05:6a21:32a6:b0:1e0:d1c5:123 with SMTP id adf61e73a8af0-1e1653b9e10mr11696478637.12.1733334882804;
        Wed, 04 Dec 2024 09:54:42 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d5af1sm11727765a12.16.2024.12.04.09.54.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:54:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/38] libsoup-2.4: Backport fix for CVE-2024-52531
Date: Wed,  4 Dec 2024 09:53:43 -0800
Message-Id: <763af055ccb1cbcc4f8fa0944815ec02e3bff87c.1733334655.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733334655.git.steve@sakoman.com>
References: <cover.1733334655.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 17:54:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208299

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup-2.4/CVE-2024-52531-1.patch        | 131 ++++++++++++++++++
 .../libsoup-2.4/CVE-2024-52531-2.patch        |  36 +++++
 .../libsoup/libsoup-2.4_2.74.2.bb             |   2 +
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
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
index b1962961ce..88d08ad0ec 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
@@ -16,6 +16,8 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2024-52530.patch \
            file://CVE-2024-52532-1.patch \
            file://CVE-2024-52532-2.patch \
+           file://CVE-2024-52531-1.patch \
+           file://CVE-2024-52531-2.patch \
           "
 SRC_URI[sha256sum] = "f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b7823b6018b40d01159"
 
-- 
2.34.1


