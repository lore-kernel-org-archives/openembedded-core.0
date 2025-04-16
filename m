Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61B88C369BA
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 05:13:41 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.12372.1744780417738735152
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 22:13:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=fCbhQx70;
 spf=pass (domain: mvista.com, ip: 209.85.215.180, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-af5cdf4a2f8so4753218a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 22:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1744780417; x=1745385217; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqA0dwcb6NJcufyouZsyzvXz+zbBVy3YoyRy3pBI7LU=;
        b=fCbhQx70vMdNqTrNGsWewWegj4Dj2Kwa28rSuw7Zug9NWJSEtkEA+Gahbp+vmFA02r
         p9ICs6urSLnsbR20FlhcNVBtS/BJrb1Nbdgb6HOXMYxGyqLarAEjyFYZ2UhHKXsOrNqu
         Tr+V639pQkR8P+gvrWQaDiaEBdOUXFhyz6+fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744780417; x=1745385217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eqA0dwcb6NJcufyouZsyzvXz+zbBVy3YoyRy3pBI7LU=;
        b=BmRA9Z6J9kYsKckWYwIrjOdjbUfjCITiioTKVzExkywqBPCLnJSc0TA7Yed1HrLmd0
         qG8bVDz36aWbqt84ptu5SAIlihRyKBZqKdvX+ehrkfFvom+548de2kmKifK84MvRVbbb
         peUjMRGKLNbntF4lyppxXodOM7ax+fXwjarVw+YskTRTplrPqZPZUrX8J58Kn9ucSnze
         RAeBO1lQjDxzGjMMgy/lHXgWJ7kWF/kticForXSylGqbX/RaGaFLwMjb+Sc+VnjIKDY8
         bZnVHo5uXz4GRtwlC4JTGQ5T3z85wqMb0m8U1fMcSFWEGAz9irOsAWQiEq0Uap/psTWf
         5JUQ==
X-Gm-Message-State: AOJu0YzaWW4DVoXbpzlPeYq3CumY/aMdh/gg9u7dy4kUV/aN4LPJDaii
	6KEgR6Z7zZAoprb8FXmO8F7rk9zczbVKuJ1FFJ1ZYW03cqTzIAyukRhz4oai9ilI28+sUXMapm0
	dNV8=
X-Gm-Gg: ASbGncvnlw4+18CZNPpThWRABXZxABeEP3G9NSsfUThqmy8+TlqAVDNLI8yZecAnhSc
	o+Ud7ZjKTW0XRqGgTLmUF1EiYZO5v4oZmzPMctkXEgF6xPLs94soI6TBHa/zwEprw64RXjo6BHO
	EIOMrmlaH2Ik0V8uZrYxfNedYdPpwO56x//6gGLPeBiVgVbnl9pBJf55KzXPi/3F1IO3BnDmwlp
	jjqG6VloT8SFOGSeTNLky1qIxAaZFesPg2+3ykWk5Y85KhnsAZg2U9o/59vFXWASiz6a1qposK+
	0iJw1qMTewJ3gSR6Jaw1bMUGZYmzIvd5jcRNfyKELPPmoYzijRs=
X-Google-Smtp-Source: AGHT+IHfqfdsSNULvio2yE/Jmv68rOxCo3Sl3yhxGEPi0RBoq67XFizWFfMf9aSDNrGQ54HsaY/h7A==
X-Received: by 2002:a17:90b:4ecf:b0:2ff:6788:cc67 with SMTP id 98e67ed59e1d1-30864172844mr583241a91.34.1744780416707;
        Tue, 15 Apr 2025 22:13:36 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.229.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3086122a8absm582419a91.35.2025.04.15.22.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 22:13:36 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH 3/5] libsoup: Fix CVE-2025-32913
Date: Wed, 16 Apr 2025 10:43:12 +0530
Message-Id: <20250416051314.96105-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250416051314.96105-1-vanusuri@mvista.com>
References: <20250416051314.96105-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 05:13:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214976

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.gnome.org/GNOME/libsoup/-/commit/7b4ef0e004ece3a308ccfaa714c284f4c96ade34
& https://gitlab.gnome.org/GNOME/libsoup/-/commit/f4a761fb66512fff59798765e8ac5b9e57dceef0

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libsoup-3.4.4/CVE-2025-32913-1.patch      | 72 +++++++++++++++++++
 .../libsoup-3.4.4/CVE-2025-32913-2.patch      | 44 ++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  2 +
 3 files changed, 118 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32913-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32913-2.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32913-1.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32913-1.patch
new file mode 100644
index 0000000000..1d6a9aa193
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32913-1.patch
@@ -0,0 +1,72 @@
+From 7b4ef0e004ece3a308ccfaa714c284f4c96ade34 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Fri, 27 Dec 2024 17:53:50 -0600
+Subject: [PATCH] soup_message_headers_get_content_disposition: Fix NULL deref
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/7b4ef0e004ece3a308ccfaa714c284f4c96ade34]
+CVE: CVE-2025-32913 #Dependency Patch
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
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32913-2.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32913-2.patch
new file mode 100644
index 0000000000..6d30bb91d3
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32913-2.patch
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
+CVE: CVE-2025-32913
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
index ec3305aed7..0b464d274b 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -20,6 +20,8 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2024-52531-3.patch \
            file://CVE-2025-32910.patch \
            file://CVE-2025-32909.patch \
+           file://CVE-2025-32913-1.patch \
+           file://CVE-2025-32913-2.patch \
           "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.25.1


