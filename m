Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DED0C369C2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 14:04:58 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.9612.1744898695063609040
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 07:04:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=LpEPboXf;
 spf=pass (domain: mvista.com, ip: 209.85.210.179, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7399838db7fso821520b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 07:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1744898694; x=1745503494; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGke4S3EKsrIe9DiKkaSU2zi1I0Y2utWI0pX8XDMfW4=;
        b=LpEPboXfwVAVlRKlnzlL+PjprtwwimxzvgqGiqkqEM6aOsJTARVeXCerkbu1nN/gMv
         QDz7A/+cBDe4F8cfO0DCTdWLROweXjayqhRHfJvM5qm6bmUz15tsIGpIkhdMLjmH/8MV
         wPLgD5AE/8dRO2VOpdm1lnU1wsR0p1vLtQZfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744898694; x=1745503494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lGke4S3EKsrIe9DiKkaSU2zi1I0Y2utWI0pX8XDMfW4=;
        b=s7i6sDAhxDBRNtzNEVysx9bht68ikzy0bwvrXg+minKGNFFWfi6Rb86mkkOCrVZyte
         b6R2aikaEg7uwxSSrfpvTkOcG2fRrccmbRJ7h0RGn3SEmF/PkW/LhuDbL8mseROM5s1y
         VQk/OFC6NynD3g2x5BgzsQDhdSOe9m4GA0wue4C1kvuTQSGBmKtt9sK1eCkYVOUyvVu2
         j8H0/2M1n35yCZKcPM1FjiPO1Qei2Ao2ZZrpyZ6aQfiR/eemz61sTZpQ1NsGPYmRFNoD
         p4+HntsEOcRhhQkB+Gn5kAEfwD2Npfn24zSlbuHmaaiM2Lj4ElB54R71ld4dosGMlOea
         0bRw==
X-Gm-Message-State: AOJu0Yx48yLWXWbzsej14jMmpm9ofUOMxU0sacnBsVlwN4bpVLUg8oD4
	6XqZzxLHtbTPNC+5C/sMQ3sQQi6AwVjoFGHqAIZUDQCZw9FlZgI4k4zQXygQNEoscXKJQPqNMgm
	+i8c=
X-Gm-Gg: ASbGncsyHt1QZjVKYZjfe5XN7i/XLxEwe0U0lVNZA3K4UFR8i4+F0NNRv8AhTXEck2l
	NJf2E3qMFJxjmO/MMw32vc3W+tquZxsHIayyRJ4MMDH8dscblmNcaw2ywvDDjOlbBGRZMdBXxv1
	SuZk9t1+YqgVvhkY4Eiwnq8DvJiUHVn3esAz2Qkn3GPlXE4tLbp5q62pxnVdytrCWqgsmiNsHoQ
	iiIOkg6GQ8pFB2WUBMLO+ivjYLCNOIb5VI3MQkZw5MFB8X+nQeI54fyXvKtCaWC9bNKjucAs3qK
	2W0GOxpDWon8Czus7d1ojztkg2kFzrQ1mQQT28XudwxzV8d8RSGg
X-Google-Smtp-Source: AGHT+IEP6L75Ln5crVDsZYaDLwLP5MvmVknZ+1ZYz0HEYmubuF1MHp56imtcJM7uK+YypHgSgn6Geg==
X-Received: by 2002:a05:6a00:1414:b0:732:1ce5:4a4c with SMTP id d2e1a72fcca58-73cf28f5949mr3579644b3a.1.1744898693811;
        Thu, 17 Apr 2025 07:04:53 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.223.203])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73db4717bfasm1127812b3a.129.2025.04.17.07.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:04:53 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH v3 3/5] libsoup: Fix CVE-2025-32911 & CVE-2025-32913
Date: Thu, 17 Apr 2025 19:34:27 +0530
Message-Id: <20250417140429.136534-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250417140429.136534-1-vanusuri@mvista.com>
References: <20250417140429.136534-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 14:04:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215081

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.gnome.org/GNOME/libsoup/-/commit/7b4ef0e004ece3a308ccfaa714c284f4c96ade34
& https://gitlab.gnome.org/GNOME/libsoup/-/commit/f4a761fb66512fff59798765e8ac5b9e57dceef0

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../CVE-2025-32911_CVE-2025-32913-1.patch     | 72 +++++++++++++++++++
 .../CVE-2025-32911_CVE-2025-32913-2.patch     | 44 ++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  2 +
 3 files changed, 118 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32911_CVE-2025-32913-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32911_CVE-2025-32913-2.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32911_CVE-2025-32913-1.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32911_CVE-2025-32913-1.patch
new file mode 100644
index 0000000000..4e1d8212f5
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32911_CVE-2025-32913-1.patch
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
+ 	soup_message_headers_unref (hdrs);
+ 
+ 	/* Ensure that soup-multipart always quotes filename */
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32911_CVE-2025-32913-2.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32911_CVE-2025-32913-2.patch
new file mode 100644
index 0000000000..5d9f33c736
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32911_CVE-2025-32913-2.patch
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
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index afba5ac12d..167163b91f 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -22,6 +22,8 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32910-2.patch \
            file://CVE-2025-32910-3.patch \
            file://CVE-2025-32909.patch \
+           file://CVE-2025-32911_CVE-2025-32913-1.patch \
+           file://CVE-2025-32911_CVE-2025-32913-2.patch \
           "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.25.1


