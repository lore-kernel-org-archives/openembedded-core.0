Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA411C3ABCC
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 15:46:13 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.1979.1746805566343329096
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 08:46:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vjbDF1wU;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-30a99cff4feso2748603a91.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 08:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746805565; x=1747410365; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A2tmG6XyyDCtwIgNxENwlWkpKgp7ImH48gG97i9jZu4=;
        b=vjbDF1wUp/jIy90NmvMBoovcmopVsFMBswTMOmJh5fb5FPuCWlOlcKrkzxF60FR+Z6
         iusohN+0Kog9YQ9a7O3ZZgTYku/WGCAspH0v1zqAcZ5ZaAyW0YsrlsipKG8tcLSRF1rf
         pEH6DqnoQ6y22dyOwfj6X/DqB5wEdyCIkgSx/qQtxaF3Dg7NF6Irpx4wU945YU0syBjA
         sJqwxxB2cFIox5LrUVLwmw+Mur0RxJmSr7mYcjU1rYMcMDgqTHNHPp1hmcdz4+3uNUBl
         JDNlWNeXloipA4nBMS0Ro9jS+/za4CLsbtMEVk529clpc+gMCXC0OEvbLRs6jrmbN4i6
         23Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746805565; x=1747410365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A2tmG6XyyDCtwIgNxENwlWkpKgp7ImH48gG97i9jZu4=;
        b=kkYEqPCuYdpE/d1bpz7Q94Ds2eGshiNXpDDyL92D7CnXoABLq22iSxx0IOWeLlas4P
         NNDr0aCNzwT8E83IcGnB9tdk9d7BM94o3lC/gjEkMAz/ANHaRLpj48bx5wsFWNjR5AJ7
         MXQNQHCMo5DL+x8SDrv+QLxKNHiublmU9Ipe/FmeGai++jR39LpoZM14zgFfMX8nBP0O
         bpD0/w3Z10OMwm26SlaEdAnQrh3rO3utPOGmRChDG9sn3zJ5ijcfp4bL6rKSmV6oKk1R
         ZNdca2iK1EtfmL1J4LCKANOeDiZn8KebKAx1KfpKItK+nOw5OqkCt2fBQ+t9+p0/sdt/
         /taA==
X-Gm-Message-State: AOJu0YzdpP9LoSYDS/8H4e2ehf/GQUnI8K5JVMQJBvGnXyo0l1K31LkZ
	R9tseeh3/VjHVjUrstzySaaB6m8GGKqa+W2jNmS1RF6F9kgXayqw7L8E1WOnWTOTL5Sjeclryy2
	R
X-Gm-Gg: ASbGncs5muN1nZMJJe1+jLluRvUg+GJl8naqlAQlfdADJPNhjTTuN4E1ufdfhH47xRM
	jQacFTyCJ+Ny52WpDdeDU5B4lXLcOpu6xJvCsVaRA8jZ6mU9no0Wd/uymIvvas7uyx/I4oSfeyw
	ABnm07Ya+v8mMR6IkfdJZDe3nh23fGcYyZfDb7zLqooOleVRTvKbZBsT3v4zltEc51hP+778rzs
	58mHACfjz+jeE0qQI/np3zrwQ3MQEu3pSAaSSF4yGdDw+qqrgscgIvkpcsd+myMhFkya9++btbk
	9zt/XsXn3DDS8N7iI6WGbxgQuWG8r8Uj
X-Google-Smtp-Source: AGHT+IHgqRQvRsgnK2tg08cAgkJm4ixBWIqhwU7vIUMNkWvJQqkAFQUWpSxOu3XseajnOgdeir6qng==
X-Received: by 2002:a17:90b:4acb:b0:2fa:137f:5c61 with SMTP id 98e67ed59e1d1-30c3cefe24amr7249223a91.12.1746805565315;
        Fri, 09 May 2025 08:46:05 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1912:b658:11a7:402c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39dee9aasm1983093a91.25.2025.05.09.08.46.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:46:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 2/8] libsoup-2.4: Fix CVE-2024-52531
Date: Fri,  9 May 2025 08:45:49 -0700
Message-ID: <c7ab8b45b1f533ca1b27b07c30f44b7b64a3cfde.1746805404.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746805404.git.steve@sakoman.com>
References: <cover.1746805404.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 15:46:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216228

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
2.43.0


