Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A131D6D25C
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 06:47:13 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.111184.1732862824543739659
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Nov 2024 22:47:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=XqyRPLpV;
 spf=pass (domain: mvista.com, ip: 209.85.215.172, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7fbbe0fb0b8so1030594a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 22:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1732862823; x=1733467623; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VKhN1TSO9xW+Glj6m8uTv11pxeAG3SIhrw9+lfF3BGU=;
        b=XqyRPLpV9hZx2tw0BQDiVCYSmVM6O48z3I9r6/ht9EJyGpoa6iEJMiX90XfvOZiSDJ
         l5q0I2cJMCg++ACXO+I7JFRyKxdb8y/k5bKGgpo1uCFGqFEMtvSpZ4wFlywY+Hpqt/Uf
         V6ObjBgeIgvPsKzmqXukKF/oXyFD4Yw2TVduQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732862823; x=1733467623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VKhN1TSO9xW+Glj6m8uTv11pxeAG3SIhrw9+lfF3BGU=;
        b=qMtpYzPW5HSIdvWD4K+chqDmnq4s0B2KuJYG2Hv5LtqgOl/p0EDQS9dVhn2aE9axq3
         ftYSqPqClMIId5w+fFharn1yFbLARAtTEhM1R9T2hTwtfK4KtzAPhQIm0y/7ISl2aTDD
         KNcun1ggAPDquf3ojkHD7LzxztxWWLy9S1qP6VMEwD4O3Mx4qCCaX9UIZw9aYLV1bRSV
         pZhNiVQNl0AvcGKuTtmrLPk6znK5viUTtCrBYo0Fal6O5m46xVNK7pYXtvKfv31fQ2qZ
         Aeg/AOV2omBBeFwNtAhbw9EGfNO0RHbKJmv2aALFuqH60HIaDPrFmPVdH0BDAx0YL3aU
         8d2A==
X-Gm-Message-State: AOJu0YxWz4eowAmtSS9rk/3tSlegHcUUnDMBMAV8Tz1Ota6EK711Jg/1
	4E3CmblzOIez9804aSGVhHRAp/+t2Yua2GXEnaz2m6fBK4oa/3hpkjiVJ2v4TWFek9BzNM8RIkw
	mw9E=
X-Gm-Gg: ASbGncv02cIQkGqtFjzeuGIGj9WyFg+Mi7OBVI71KA3oHPyQ8Y5eq7vifG3PqQ1Z8or
	Dzgc2BsSb71Zr2YLuLwIdZTkSkriKs3iVVd55W8YwmmV3NpCKTtaumkQIjKrccBZ51nyfXbX2HT
	T3j6lHDrjIQxnpdromfC6HkU9z98Y/DX9BYrBYO+nd+/SO6zpZwgRUCQSxcbhamjYWw6OPpHhHw
	Rngr9pf67jHgZRZpL7Nw/0ULgjW2eSgL1A9pNt4MlqHhhvwse1NsHCd4KB3nMI=
X-Google-Smtp-Source: AGHT+IFRWGY9x0E3lkQTzsAzJ8a6KopVTTBwN1zYqSpEwtREQGyG9iI9gZEMOjfuvG1xHw0ojOy0dg==
X-Received: by 2002:a05:6a21:328d:b0:1d9:6c9c:75ea with SMTP id adf61e73a8af0-1e0e0aa83d5mr14845580637.5.1732862823266;
        Thu, 28 Nov 2024 22:47:03 -0800 (PST)
Received: from MVIN00020.mvista.com ([2401:4900:882c:6e76:becb:8edc:f76:25bf])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72541849447sm2782738b3a.181.2024.11.28.22.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 22:47:02 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] libsoup-2.4: Backport fix for CVE-2024-52531
Date: Fri, 29 Nov 2024 12:16:52 +0530
Message-Id: <20241129064652.36920-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 06:47:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208002

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
2.25.1


