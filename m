Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD11C54E65
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:53:47 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.7477.1747821221338136091
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 02:53:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=SuO7+d0V;
 spf=pass (domain: mvista.com, ip: 209.85.210.175, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-742c2ed0fe1so4042822b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 02:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1747821220; x=1748426020; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ts6jLcET2VrgC7KYIXQZkQYWHX9JCQDhQyr1PaupgDM=;
        b=SuO7+d0VD4H5ox+77fnaKms4NJGAaIsj+k5p5aMn/f0SrToVhwMp15AgHwzvWOmWgZ
         T4FI8JgiwjsyqEkW5pmZT9POyENP84EbXZswDpa3689jvkIB7W6FLX5ncQblNUMNn9A4
         EPCxvoKPLkZv8iyMn+gjgGHJp54c1i+ivYR1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747821220; x=1748426020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ts6jLcET2VrgC7KYIXQZkQYWHX9JCQDhQyr1PaupgDM=;
        b=wl70oTVIV+R9oIayCfyCWU03Yqya3/YfSxCrk8P5o/nunCoL1ZuOP3bvgcjOJ9ve+W
         c70FOvhmoFOeWs0HeFVduTIoZokfiF3YFuo5PFVVpgAREVIgqFx9vPFlCzayLythRL08
         ogCAGrV7z8I+giwLPDE6AtTeWb3KLQtoXdr0dwiXGR75JE33hze6RZ1fb/j0Sl8HjGLA
         86JR79QRsTWsMhFrBMNBvDyBiGOikh/rw6NN7Co6wfKYCYtOgTVkQcXiYERmriYJeGvv
         8kYomq77zdjGrh9TH5RS0Km3xbINmIBkd/rFqcDF3coSlPXeOCC7TIp+zmJ7xeilWHgu
         WBng==
X-Gm-Message-State: AOJu0YyNkZhzWbUsFizJKWYboOOkYZlwgI5vV5KhMeIM4+V8RE49Uz1t
	CWyUQja6H6x1flO1OHQaNqaQHdCGDliMtUOAgX5FKVibob8j3Mvf5rTJ77cnRlYvxGLBx8vIIv2
	vOs8vfWk=
X-Gm-Gg: ASbGnctRIfe/1nWMPW4Qop28tdKNk/hDlqVXFFcSgBBzr7nwGWVMoOk6Fv8cXdo5GJo
	4sLlxEIKMBoiHNO+0VKMetAKP4c+ByMDzZhTMi4hEn5qp3Ptlr/CR35zuuH5bght32J0P6Eq+Ct
	gNhZ8FMhZ4tYJgUgJqYHl6CnLvBhnMIYk8mxuh/QDKuh3/JARn5BAYrn9H5+PCodHu0UccCvTM7
	CmUAO3xPg1SCoEKlNcH6joK3jgIONL2iSaBz2mpuZXBq5EYSpY085k99XubtBS6OZzfHleLUs/0
	elkIoyFEs4MoZcwBzoSkthZ64d8J2dBJersyO7OmMW4Qn1ldlwJFSfCq3saPNUg=
X-Google-Smtp-Source: AGHT+IFN2tL+fhK0IQkpTOBP/TkjGJ6Ox39TqR/z0e8hADXP7og+ZjAeJpric3D7WA3seVEVJJ1oYA==
X-Received: by 2002:a05:6a00:ab87:b0:73c:c11:b42e with SMTP id d2e1a72fcca58-742a98d427dmr26049108b3a.20.1747821220153;
        Wed, 21 May 2025 02:53:40 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.212.152])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829cb7sm9241325b3a.111.2025.05.21.02.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 02:53:39 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH 2/4] libsoup-2.4: Fix CVE-2025-32911 & CVE-2025-32913
Date: Wed, 21 May 2025 15:23:22 +0530
Message-Id: <20250521095324.92028-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250521095324.92028-1-vanusuri@mvista.com>
References: <20250521095324.92028-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 09:53:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217013

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.gnome.org/GNOME/libsoup/-/commit/7b4ef0e004ece3a308ccfaa714c284f4c96ade34
& https://gitlab.gnome.org/GNOME/libsoup/-/commit/f4a761fb66512fff59798765e8ac5b9e57dceef0

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../CVE-2025-32911_CVE-2025-32913-1.patch     | 72 +++++++++++++++++++
 .../CVE-2025-32911_CVE-2025-32913-2.patch     | 44 ++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  2 +
 3 files changed, 118 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32911_CVE-2025-32913-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32911_CVE-2025-32913-2.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32911_CVE-2025-32913-1.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32911_CVE-2025-32913-1.patch
new file mode 100644
index 0000000000..4652635294
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32911_CVE-2025-32913-1.patch
@@ -0,0 +1,72 @@
+From 7b4ef0e004ece3a308ccfaa714c284f4c96ade34 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Fri, 27 Dec 2024 17:53:50 -0600
+Subject: [PATCH] soup_message_headers_get_content_disposition: Fix NULL deref
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/7b4ef0e004ece3a308ccfaa714c284f4c96ade34]
+CVE: CVE-2025-32911 CVE-2025-32913 #Dependency Patch
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/soup-message-headers.c | 13 +++++++++----
+ tests/header-parsing-test.c    | 14 ++++++++++++++
+ 2 files changed, 23 insertions(+), 4 deletions(-)
+
+diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers.c
+index 56cc1e9d..04f4c302 100644
+--- a/libsoup/soup-message-headers.c
++++ b/libsoup/soup-message-headers.c
+@@ -1660,10 +1660,15 @@ soup_message_headers_get_content_disposition (SoupMessageHeaders  *hdrs,
+ 	 */
+ 	if (params && g_hash_table_lookup_extended (*params, "filename",
+ 						    &orig_key, &orig_value)) {
+-		char *filename = strrchr (orig_value, '/');
+-
+-		if (filename)
+-			g_hash_table_insert (*params, g_strdup (orig_key), filename + 1);
++                if (orig_value) {
++                        char *filename = strrchr (orig_value, '/');
++
++                        if (filename)
++                                g_hash_table_insert (*params, g_strdup (orig_key), filename + 1);
++                } else {
++                        /* filename with no value isn't valid. */
++                        g_hash_table_remove (*params, "filename");
++                }
+ 	}
+ 	return TRUE;
+ }
+diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
+index 5e423d2b..d0b360c8 100644
+--- a/tests/header-parsing-test.c
++++ b/tests/header-parsing-test.c
+@@ -1039,6 +1039,7 @@ do_param_list_tests (void)
+ #define RFC5987_TEST_HEADER_FALLBACK "attachment; filename*=Unknown''t%FF%FF%FFst.txt; filename=\"test.txt\""
+ #define RFC5987_TEST_HEADER_NO_TYPE  "filename=\"test.txt\""
+ #define RFC5987_TEST_HEADER_NO_TYPE_2  "filename=\"test.txt\"; foo=bar"
++#define RFC5987_TEST_HEADER_EMPTY_FILENAME ";filename"
+ 
+ static void
+ do_content_disposition_tests (void)
+@@ -1139,6 +1140,19 @@ do_content_disposition_tests (void)
+         g_assert_cmpstr (parameter2, ==, "bar");
+ 	g_hash_table_destroy (params);
+ 
++        /* Empty filename */
++        soup_message_headers_clear (hdrs);
++        soup_message_headers_append (hdrs, "Content-Disposition",
++				     RFC5987_TEST_HEADER_EMPTY_FILENAME);
++	if (!soup_message_headers_get_content_disposition (hdrs,
++							   &disposition,
++							   &params)) {
++		soup_test_assert (FALSE, "empty filename decoding FAILED");
++		return;
++	}
++        g_assert_false (g_hash_table_contains (params, "filename"));
++	g_hash_table_destroy (params);
++
+ 	soup_message_headers_free (hdrs);
+ 
+ 	/* Ensure that soup-multipart always quotes filename */
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32911_CVE-2025-32913-2.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32911_CVE-2025-32913-2.patch
new file mode 100644
index 0000000000..5d9f33c736
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32911_CVE-2025-32913-2.patch
@@ -0,0 +1,44 @@
+From f4a761fb66512fff59798765e8ac5b9e57dceef0 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Fri, 27 Dec 2024 18:00:39 -0600
+Subject: [PATCH] soup_message_headers_get_content_disposition: strdup
+ truncated filenames
+
+This table frees the strings it contains.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/f4a761fb66512fff59798765e8ac5b9e57dceef0]
+CVE: CVE-2025-32911 CVE-2025-32913
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/soup-message-headers.c | 2 +-
+ tests/header-parsing-test.c    | 1 +
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers.c
+index 04f4c302..ee7a3cb1 100644
+--- a/libsoup/soup-message-headers.c
++++ b/libsoup/soup-message-headers.c
+@@ -1664,7 +1664,7 @@ soup_message_headers_get_content_disposition (SoupMessageHeaders  *hdrs,
+                         char *filename = strrchr (orig_value, '/');
+ 
+                         if (filename)
+-                                g_hash_table_insert (*params, g_strdup (orig_key), filename + 1);
++                                g_hash_table_insert (*params, g_strdup (orig_key), g_strdup (filename + 1));
+                 } else {
+                         /* filename with no value isn't valid. */
+                         g_hash_table_remove (*params, "filename");
+diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
+index d0b360c8..07ea2866 100644
+--- a/tests/header-parsing-test.c
++++ b/tests/header-parsing-test.c
+@@ -1150,6 +1150,7 @@ do_content_disposition_tests (void)
+ 		soup_test_assert (FALSE, "empty filename decoding FAILED");
+ 		return;
+ 	}
++        g_free (disposition);
+         g_assert_false (g_hash_table_contains (params, "filename"));
+ 	g_hash_table_destroy (params);
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index b27c56895b..8d974c2d59 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -26,6 +26,8 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32910-1.patch \
            file://CVE-2025-32910-2.patch \
            file://CVE-2025-32910-3.patch \
+           file://CVE-2025-32911_CVE-2025-32913-1.patch \
+           file://CVE-2025-32911_CVE-2025-32913-2.patch \
           "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.25.1


