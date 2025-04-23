Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F16F2C369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 13:20:46 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.8317.1745414438455997011
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 06:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FuRVywD9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-73bb647eb23so4920499b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 06:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745414438; x=1746019238; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DLkMbREjkoL7KlFcHQW1VnJQ5arFF6/bfBX9WJSGG7g=;
        b=FuRVywD9SgMAdhEXnar1QubLusizrMVvA1pbch2oluOWvFoNcWkWopxw+97oqUkIYE
         HUz/vMjY4twbNbRwcivQxop8hXgtfIAmgYlIqUKUDpxlymsRaOtDpqNaG+daRrU020e2
         NbKG747lVKjxw8gGkq/bepfO3WPtD6tE7ylGT8n5STkizF9JxBkn7/IwGkzH7gR1JtSa
         oUltgaMNVcZdC18vDj/QFWMlspvA/HgO7h8gENO3bCkiEA+ZrQO4f1WJqpaKNvmmskqr
         yd8j7GneJ0Sn1eKd1kdnekdKdsT1sNQAfLPVCAkvBo+nJVK9tb0oC2T/jch91NEUwUDE
         r3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745414438; x=1746019238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DLkMbREjkoL7KlFcHQW1VnJQ5arFF6/bfBX9WJSGG7g=;
        b=CjCyw50OBlzSnWDpj9AZo7fO8NYOcteeQpJirc7E8BWmChsYWVSSMI3Z5tZWoGE7XE
         fuszoD/Cc1RzFDHK6GSNRq+lXsxFV+GKmFCRt3e3lEtaudppxNxQYxs4MgYgEeHxbQkW
         VuzD6KMnH9kwUeJ3yGh0i0F+bDfEvtd5fWSvEGZOjpwcPtcGcMCvGvGdemfmm47nwdi/
         I6pOalgyzSQ8/RxXZqVcpuKM/whURlBPYJKCqsc3Vel68h5Ys/V2+w9c9sJur6wGMDIS
         Lbl+J4PtdWvgbjAaDNx1KKiOOkwSOk7cjtdM726wGivH185kkYRcbnfn81z0XuMrjEqC
         +MMw==
X-Gm-Message-State: AOJu0Yz9OUv609rAGrJ1ABmGgv8RYG+hUxOmf61pjytU9iNSZDVu18X4
	QA7fzzjS8RLtFrIWGAf8mBB4KW3DX78F2kK5YjpnLGONpmnv2z/P5n7CllXKmKAzCoEv6eiXF5s
	C
X-Gm-Gg: ASbGncvFYpsuQKMmVl0/DLZHPE+1VwJbQurfUKKpx+XTJP+0CZ2bvPhr6GZfR4bA9t4
	Xyio31GXBTW6YwY4VQRXC8iYOQyvsJIHlfN1g0H1I2XmLmBXgcXCspTKnWeAnHZQbtWxYKwP/Wo
	PA22pv0J7bkO+0Mxlpx5gmnS9bNjToCO1BNhmXqxCSxX5bC+fX4BvTnu0UNQG/Yi7amD4JCRyri
	cCEsQuZajAH0apDUVeXDYLuTx8zpss8oo1b9tGxSXB7cbtW6Apv64RXudiD+se+FHDL1H2FRxjf
	i4W4gHO8PPPIqmgscY3pO23Y4ggWMY4=
X-Google-Smtp-Source: AGHT+IE8vFmDhbaHD6lmbb6gLzisEsTGadODWNYJSA0C2HfuRsvPRqeu5RGxqiMAXX88P+AfnAxuJg==
X-Received: by 2002:a05:6a21:6d93:b0:1f5:8714:8147 with SMTP id adf61e73a8af0-203cbc7489dmr26257593637.23.1745414437687;
        Wed, 23 Apr 2025 06:20:37 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:371e:10cb:f3ce:33f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e510bsm10898037b3a.66.2025.04.23.06.20.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:20:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/14] libsoup: Fix CVE-2025-32911 & CVE-2025-32913
Date: Wed, 23 Apr 2025 06:20:14 -0700
Message-ID: <c1bf4fca316c67b9ce1134c7e5bdc9c0ac9ab878.1745356684.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745356684.git.steve@sakoman.com>
References: <cover.1745356684.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 13:20:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215296

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.gnome.org/GNOME/libsoup/-/commit/7b4ef0e004ece3a308ccfaa714c284f4c96ade34
& https://gitlab.gnome.org/GNOME/libsoup/-/commit/f4a761fb66512fff59798765e8ac5b9e57dceef0

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


