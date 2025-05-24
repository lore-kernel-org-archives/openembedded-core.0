Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D0EEC5B541
	for <webhook@archiver.kernel.org>; Sat, 24 May 2025 13:36:54 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.7016.1748093807583469226
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 May 2025 06:36:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bnGLwVg6;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-31122925a18so190044a91.1
        for <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 06:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748093807; x=1748698607; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Unpusg62R4yFfugwvtG58oq8A1AWONlspb511AlHnLk=;
        b=bnGLwVg6gU8noxvWntnhtecq2dXK4dqDqI7upS9S+uMmPhPL4mdalETmVr2Rh4NGOE
         o+yGVRVXVOBGjfyqFA/NhdbFo8cQhP3RJsrytzUiI4NYYSNp7us/D113OyDX5IgdsEFa
         s8IxYR9rJttoloBvWL3B7H0MC7F+/z/MR3dbHpAg0MVYMUfR4M5frbOt7jctJPA6Y8qD
         E/RtzUgT32sAWiPOPWKSn1xF5Ww4Z+fSMN1i7IftoQQSnakjdoyBMtaQQmyeXnuj1Dde
         X4osfnq16rHTPpqHD6Q2fgc5tOWQEEuoJEtMb/PWWhjqg/arJ2mDhdm5k/57oA0iVpdX
         Tvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748093807; x=1748698607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Unpusg62R4yFfugwvtG58oq8A1AWONlspb511AlHnLk=;
        b=q3+M3pEUiXnuoazIvGs4Wta0VcBROljAk/Rbm+MGGBzKkz1Z38j5W1JHcSMRUtBGLY
         4zGU7gFkNuWdCUxwP1Wop4AxHCZCiXz2qWyV/n7ZxGVzvx5uAxrsHkewvKxu+dG1zlgN
         drIvjl2dG4RAqPTL/yC6KGPrDY4H9+ZM28hA4/BmlZh2AEr4MpyrdiyDUv78eX+lVuvF
         w0HasgDjdnuUzQhwXaqRW5hTnUC0jiVTL6QsG5wc3R76xyiWMWJJhratuCW0X8w7sGz/
         gm3i165X1nlJvLAI9AQ+fm/adJ1rLhmqXCcWl1H1pkH7SMhYoMPO2sGJzXbdlEa9Fn6U
         djjg==
X-Gm-Message-State: AOJu0Yz6tK9rUiHcIUxuC19D1M9v5Iq2mqrj51kARo3Zzs0cTlIcF9HX
	hMo1k4XZ5+JU8e++riZWjbG4V0qeXzXpvh13sIvFF2msIkoTGURlIw/B6OVe7rlCeB1hAhG8/tW
	YZ9m/
X-Gm-Gg: ASbGncv2mZPhAWI3E5npwacbF99BQY6uno2G1gstcg20WxA4Gg7JgzR1IIIJLLdgfV2
	grM7yuyhu3FC+O0hMibi8UVUakk3TolOpYU3oYRZnLeWtaZdsUSpcV/88FwuQ0RrcWFsOIBmrBP
	+AhH40P/576JjwZxP21tpehLMHZwzxIWMJW4NKVraE5koJt5rzwJitZ01VgtiyRex/2PND+xBUW
	vq4u9aSeNAmLYIrMmQu67fDeb/RmXfIrmIIKaXM2n9mHJxczel1MscMiNJdWLllLigZT/+gGxhb
	LW31KiVsNNn0TljpP7p8vHaFko4eRFuiBBLSkOEL7Oc=
X-Google-Smtp-Source: AGHT+IGzwttOv8EKZv/2tVzYOQA9o796fQywriMTvebTUgOYxb/U3OX/T92ueg1QfYRbFzTRH7mUTA==
X-Received: by 2002:a17:90b:4c0e:b0:2ff:7b28:a51a with SMTP id 98e67ed59e1d1-3110f920c85mr4870481a91.17.1748093806739;
        Sat, 24 May 2025 06:36:46 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3157:44bf:9f62:fea8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365c4f9csm9058913a91.20.2025.05.24.06.36.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 06:36:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/12] libsoup-2.4: Fix CVE-2025-32911 & CVE-2025-32913
Date: Sat, 24 May 2025 06:36:22 -0700
Message-ID: <ff1896b14347c7b4a166716338d3822da97be2e4.1748093626.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748093626.git.steve@sakoman.com>
References: <cover.1748093626.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 13:36:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217231

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.gnome.org/GNOME/libsoup/-/commit/7b4ef0e004ece3a308ccfaa714c284f4c96ade34
& https://gitlab.gnome.org/GNOME/libsoup/-/commit/f4a761fb66512fff59798765e8ac5b9e57dceef0

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../CVE-2025-32911_CVE-2025-32913-1.patch     | 72 +++++++++++++++++++
 .../CVE-2025-32911_CVE-2025-32913-2.patch     | 44 ++++++++++++
 .../libsoup/libsoup-2.4_2.74.2.bb             |  2 +
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
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
index 517a8e4539..4e7667402b 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
@@ -26,6 +26,8 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32910-1.patch \
            file://CVE-2025-32910-2.patch \
            file://CVE-2025-32910-3.patch \
+           file://CVE-2025-32911_CVE-2025-32913-1.patch \
+           file://CVE-2025-32911_CVE-2025-32913-2.patch \
           "
 SRC_URI[sha256sum] = "f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b7823b6018b40d01159"
 
-- 
2.43.0


