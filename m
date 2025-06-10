Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FBBFC677C4
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 16:09:18 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.91290.1749571754955601544
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 09:09:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=n4ECDFy0;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-234c5b57557so52717365ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749571754; x=1750176554; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sFlBW4I2YZkIwab4d70x9ZLwMIZn2StQ6yHnwqhjRDg=;
        b=n4ECDFy05DVI/qquJ3/QXCyBQjaRYvWhRZ/EYukJxiJxrWorqxGRjr/Kj1ygkOC4+g
         akWnJ2eqOh3WKJjC/RCo44pE4gDGd44ZOLvOhPRziMF+/ae0xMXJtrWiS/x2HMABpp6g
         GDLN4n/YwiZAcHFR2diGqm8he6o/LVu1T3XkEHGFWlOuoTrvKPWd8/p/PhjL6NjRRRED
         ochI5G41Q5NhQxO2lktSHX3J+INxuyehANOPFz/yp/BJEP+dlwY6Bc0qpGKazJnA/W6c
         f51AKVzwR6Q8nut9yb8dJe8fnjfKJ0z2j96w0gVSL4vy6U0DwCxJXNh9qxvR8lBK8b49
         vJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571754; x=1750176554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sFlBW4I2YZkIwab4d70x9ZLwMIZn2StQ6yHnwqhjRDg=;
        b=eQlqPaqZ1a8cNtGMsrQox/r2HyDeU12JvTnhovJg2MyJ+I1LCNtoD+7kuunRjpFcd9
         dFvbP1QgaBgKlzuZC9mTcQvSkgu6sgbTIBnNP9eDg7MefuzDF+NLQnV5qHcx5hBwfeDP
         aC7Oincz7d8Z5K9SLQPpFJjaMybN/lmWYbNhKLi7FxyV8EqmxyJNfDBbP71wh3t9GCtG
         ThNa7S1W+Y7SGuljGabIm3k0MeAQBsBJS7V0AdTWK0otYiRbgXVB0zj1NZEGjYbm1ebR
         pQUv4nTPK4JotSrvi6paGIZA1pHJahTTlB6wqyYsNIRgTzITzChfj50ESwCeSSmGy3sL
         92Jg==
X-Gm-Message-State: AOJu0YzsWWIOCt7cQAna/G/5Da1V/9ccqZqQ9iw8EGn2Z02FsC+PnRzE
	DLbfz7Jh6ObOjjjKNASCVyhlywd2CqBXM5cbr0h/pUaXvciMrJsuM5VpDFc6Ewo/KLW8pWkeIvG
	Pui1O
X-Gm-Gg: ASbGncvK4AEBAJpNy1GBzGjAO/tw8OBpMJ10NmXGZ4Dnj54KFEMqe24pWZhSraarwjD
	CNFPf/K4l3aStkxFG6QtKtdHRYblos2SbKsz4ZDJGmTQKvkruuWQUWKZfcXriJiKwEVawfD6tKn
	Z5E1SftiA4ALoxvy+ggPcvt+qYPmdetQmGD0ZPEsXifo3BofyfgeE+OiIwXDjq8ZYdnrGiXx+1y
	zYFOPEjE6e6JOwAbezL6JuHj6Rjya3cuzB6oY6xH9Fa6jieSKAV8PZLP78p8e7UUP+Qi2RzUyhE
	JdYFnvOQ8TdTH4uXhbLxN7nkiCkdMqmd1LzxognkyhzTEr1UQyd7TA==
X-Google-Smtp-Source: AGHT+IFOs0LcVM3UZb3jf9DRyTTCsat+93a6B9KqYbOUWOvV2Jt8a+EgCU4jROeTQq+k4b6jMlkmvA==
X-Received: by 2002:a17:903:3c23:b0:235:c9a7:d5fb with SMTP id d9443c01a7336-23601d021a1mr250611185ad.16.1749571754040;
        Tue, 10 Jun 2025 09:09:14 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056e7sm72597295ad.166.2025.06.10.09.09.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:09:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 14/32] libsoup-2.4: fix CVE-2024-52531
Date: Tue, 10 Jun 2025 09:08:27 -0700
Message-ID: <34e9c7cfd832ed03b71fc4c23d82e853ff8c1711.1749571556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749571556.git.steve@sakoman.com>
References: <cover.1749571556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 16:09:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218383

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/423

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup-2.4/CVE-2024-52531-1.patch        |  39 +++++
 .../libsoup-2.4/CVE-2024-52531-2.patch        | 133 ++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |   2 +
 3 files changed, 174 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-2.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-1.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-1.patch
new file mode 100644
index 0000000000..9de0310c8d
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-1.patch
@@ -0,0 +1,39 @@
+From 8331e681c85c3b1893d8d5193783f631bfc07acb Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 16 May 2025 13:42:08 +0800
+Subject: [PATCH] tests: Add test for passing invalid UTF-8 to
+ soup_header_parse_semi_param_list()
+
+CVE: CVE-2024-52531
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/407/diffs?commit_id=825fda3425546847b42ad5270544e9388ff349fe]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ tests/header-parsing-test.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
+index b811115..cfcc003 100644
+--- a/tests/header-parsing-test.c
++++ b/tests/header-parsing-test.c
+@@ -836,6 +836,17 @@ static struct ParamListTest {
+ 	    { "filename", "t\xC3\xA9st.txt" },
+ 	  },
+ 	},
++
++/* This tests invalid UTF-8 data which *should* never be passed here but it was designed to be robust against it. */
++	{ TRUE,
++	  "invalid*=\x69\x27\x27\x93\x93\x93\x93\xff\x61\x61\x61\x61\x61\x61\x61\x62\x63\x64\x65\x0a; filename*=iso-8859-1''\x69\x27\x27\x93\x93\x93\x93\xff\x61\x61\x61\x61\x61\x61\x61\x62\x63\x64\x65\x0a; foo",
++	   {
++		{ "filename", "i''\302\223\302\223\302\223\302\223\303\277aaaaaaabcde" },
++		{ "invalid", "\302\223\302\223\302\223\302\223\303\277aaaaaaabcde" },
++		{ "foo", NULL },
++	   },
++	}
++
+ };
+ static const int num_paramlisttests = G_N_ELEMENTS (paramlisttests);
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-2.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-2.patch
new file mode 100644
index 0000000000..740c28c016
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-2.patch
@@ -0,0 +1,133 @@
+From 12523a592f1216450d18706bcf6c16e0f1ab0ce0 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 16 May 2025 13:52:37 +0800
+Subject: [PATCH] headers: Be more robust against invalid input when
+ parsing params
+
+If you pass invalid input to a function such as soup_header_parse_param_list_strict()
+it can cause an overflow if it decodes the input to UTF-8.
+
+This should never happen with valid UTF-8 input which libsoup's client API
+ensures, however it's server API does not currently.
+
+CVE: CVE-2024-52531
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/407/diffs?commit_id=a35222dd0bfab2ac97c10e86b95f762456628283]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-headers.c | 45 +++++++++++++++++++++---------------------
+ 1 file changed, 23 insertions(+), 22 deletions(-)
+
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
+index 67905b2..39e8d34 100644
+--- a/libsoup/soup-headers.c
++++ b/libsoup/soup-headers.c
+@@ -642,8 +642,9 @@ soup_header_contains (const char *header, const char *token)
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
+@@ -657,10 +658,11 @@ decode_quoted_string (char *quoted_string)
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
+@@ -689,14 +691,7 @@ decode_rfc5987 (char *encoded_string)
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
+@@ -706,15 +701,16 @@ parse_param_list (const char *header, char delim, gboolean strict)
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
++ 		char *item, *eq, *name_end;
++		gboolean override, duplicated;
++		GString *parsed_value = NULL;
+ 		item = iter->data;
+ 		override = FALSE;
+ 
+@@ -729,19 +725,19 @@ parse_param_list (const char *header, char delim, gboolean strict)
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
++			}
+ 
+ 		duplicated = g_hash_table_lookup_extended (params, item, NULL, NULL);
+ 
+@@ -749,11 +745,16 @@ parse_param_list (const char *header, char delim, gboolean strict)
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
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index ed36d7c12b..089a032a4f 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -31,6 +31,8 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32910-2.patch \
            file://CVE-2025-32910-3.patch \
            file://CVE-2025-32912.patch \
+           file://CVE-2024-52531-1.patch \
+           file://CVE-2024-52531-2.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.43.0


