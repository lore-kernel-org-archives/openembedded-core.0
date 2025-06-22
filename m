Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29AB1C7115A
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 15:02:52 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.27635.1750604564702867280
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jun 2025 08:02:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ceOewjhm;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.170, mailfrom: steve@sakoman.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4a3db0666f2so83130241cf.1
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 08:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750604563; x=1751209363; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PZWnmOkB/Nio2RcZ+583GWntoa6cHXA68JbZ/3ON3RM=;
        b=ceOewjhm78aj3GILFUIYP7dTDDQGB/4V07R0lMis3fzjtLqBdBFl/WtVahSi++8CFa
         nxbDrQEcSNpsx5Jas3AZz1mIyOPr2W+eYBMyQ21IRw86YX5I4FM/j26IrOxyMBZHygIb
         0KLpAWDnJCzdI91kaJnFSghTNOb7+thuYrQsGDZupbynb0OA+MAP5uUZD4haugqeykxl
         vaoDjNbWYdkJd5ugMyrvQK9hXQhnQ2eqQ+CtuRFVFEiG2C3zHvrFfq352u71DsNVQNPU
         FLYXHiQ7SYn682Gdta671CGqtWz2orLJAZ0CRxfoIz8EvM8Mz18SyIyjVlA4Mp3NPdc5
         tARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750604563; x=1751209363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PZWnmOkB/Nio2RcZ+583GWntoa6cHXA68JbZ/3ON3RM=;
        b=pMulo7IMf5E9tSlvuFxw6E8rJPucemGNIP2liFmyM4p7CoVc0LM0QJKF6emW6w2bVH
         0pwLbc4oRFCo7BauLupYwpylWeyuWVzf4jva41fOnP/qtQfAm+7vpLUs4TDwSuAnzbFD
         yjnASXcKfL+GfAAeWhuPEiD+KU+pPY7CZ3znlVxf0N+O1QyRuuV3zbJNCS9r0wjhBUbc
         n3vyWxbxYNiptGOqZtInBfkhnGU/pZLSZteTOxZ51ZNj++SGivoiXehP39dtrYk2k/Dh
         9rRC8X92r8XAe20UE5KceNYeWMavwOQoluGQIjg2U1u7TVrSrfBAwqWS9UR5Q0Wn7RN1
         3N+w==
X-Gm-Message-State: AOJu0YyLlY28TbKMdZrWzpOGjz3iE/Wci1h87JQSrkZIdFNqJGtXZEFz
	fg+DRLK+9TVNR/rAFRPwdTrx33J7wsHZrMaElSqI+iyjLnsD4fBiDVxc1DVxsrOsdzAGy+uwfcD
	vnRi348o=
X-Gm-Gg: ASbGnctbwyxGYt4/FEBpWjh6uJeSsFZoB6vePowFJ5cWWsSdovPxh15AUDGxiIEW3RY
	/J3mhEfkKFai4kH+1ZTnUkzWpRJGS8BhV0Ohj2RuWo2ESqaX9Ya0KH6O0HORo9/IJ8XCUWjWe3A
	Tb4jlBfUZQiAHmjOqQ1XkTmZ0k2rDEqAEvEDyhTCw+5nQ9r1XNNML8MFjfw3CRlwkH4BX0joRsq
	UWNUNpIOk2e4iIusT/OgZJ+6W50JnRfohHmRVvtWsqhtNRM8kvkdyefj/t2dLWxAzoW002PuTA5
	j0sl7SuJSA0Oa2EDtOgdjY+/XZYBTpmIi+0MVX54lZ7vbYWvc+nhTm7BEviin0z+
X-Google-Smtp-Source: AGHT+IEsRGsxuLMJVywY4crebw77Xy0822NjXFvDFn4l1ODDIFQ2VcL+wfgb2s2CggJsdeBvBb12MA==
X-Received: by 2002:a05:6a00:4f8c:b0:732:2484:e0ce with SMTP id d2e1a72fcca58-7490da9cd1amr14504689b3a.17.1750604551953;
        Sun, 22 Jun 2025 08:02:31 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a75:9ad8:d661:8bd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a46eb71sm6222521b3a.22.2025.06.22.08.02.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 08:02:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/14] libsoup: fix CVE-2025-4948
Date: Sun, 22 Jun 2025 08:00:01 -0700
Message-ID: <95383d7d95631a4c3b385a073ce1deff744bf725.1750604257.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750604257.git.steve@sakoman.com>
References: <cover.1750604257.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 15:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219192

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/449

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup/CVE-2025-4948.patch       | 97 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4948.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-4948.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-4948.patch
new file mode 100644
index 0000000000..07c85f5381
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-4948.patch
@@ -0,0 +1,97 @@
+From a23ce8f8e60e79990e26376c8b0d40841aed4b81 Mon Sep 17 00:00:00 2001
+From: Milan Crha <mcrha@redhat.com>
+Date: Thu, 15 May 2025 17:49:11 +0200
+Subject: [PATCH] soup-multipart: Verify boundary limits for multipart body
+
+It could happen that the boundary started at a place which resulted into
+a negative number, which in an unsigned integer is a very large value.
+Check the body size is not a negative value before setting it.
+
+Closes https://gitlab.gnome.org/GNOME/libsoup/-/issues/449
+
+Part-of: <https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/463>
+
+CVE: CVE-2025-4948
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/463/diffs?commit_id=f2f28afe0b3b2b3009ab67d6874457ec6bac70c0]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-multipart.c |  2 +-
+ tests/multipart-test.c   | 40 ++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 41 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
+index e1c442e..27257e4 100644
+--- a/libsoup/soup-multipart.c
++++ b/libsoup/soup-multipart.c
+@@ -204,7 +204,7 @@ soup_multipart_new_from_message (SoupMessageHeaders *headers,
+ 		 */
+ 		part_body = g_bytes_new_from_bytes (body, // FIXME
+ 						    split - body_data,
+-						    end - 2 - split);
++						    end - 2 >= split ? end - 2 - split : 0);
+ 		g_ptr_array_add (multipart->bodies, part_body);
+ 
+ 		start = end;
+diff --git a/tests/multipart-test.c b/tests/multipart-test.c
+index 84852e2..2ae888c 100644
+--- a/tests/multipart-test.c
++++ b/tests/multipart-test.c
+@@ -548,6 +548,45 @@ test_multipart_bounds_bad_2 (void)
+ 	g_bytes_unref (bytes);
+ }
+ 
++static void
++test_multipart_too_large (void)
++{
++	const char *raw_body =
++		"-------------------\r\n"
++		"-\n"
++		"Cont\"\r\n"
++		"Content-Tynt----e:n\x8erQK\r\n"
++		"Content-Disposition:   name=  form-; name=\"file\"; filename=\"ype:i/  -d; ----\xae\r\n"
++		"Content-Typimag\x01/png--\\\n"
++		"\r\n"
++		"---:\n\r\n"
++		"\r\n"
++		"-------------------------------------\r\n"
++		"---------\r\n"
++		"----------------------";
++	GBytes *body;
++	GHashTable *params;
++	SoupMessageHeaders *headers;
++	SoupMultipart *multipart;
++
++	params = g_hash_table_new (g_str_hash, g_str_equal);
++	g_hash_table_insert (params, (gpointer) "boundary", (gpointer) "-----------------");
++	headers = soup_message_headers_new (SOUP_MESSAGE_HEADERS_MULTIPART);
++	soup_message_headers_set_content_type (headers, "multipart/form-data", params);
++	g_hash_table_unref (params);
++
++	body = g_bytes_new_static (raw_body, strlen (raw_body));
++	multipart = soup_multipart_new_from_message (headers, body);
++	soup_message_headers_unref (headers);
++	g_bytes_unref (body);
++
++	g_assert_nonnull (multipart);
++	g_assert_cmpint (soup_multipart_get_length (multipart), ==, 1);
++	g_assert_true (soup_multipart_get_part (multipart, 0, &headers, &body));
++	g_assert_cmpint (g_bytes_get_size (body), ==, 0);
++	soup_multipart_free (multipart);
++}
++
+ int
+ main (int argc, char **argv)
+ {
+@@ -578,6 +617,7 @@ main (int argc, char **argv)
+ 	g_test_add_func ("/multipart/bounds-good", test_multipart_bounds_good);
+ 	g_test_add_func ("/multipart/bounds-bad", test_multipart_bounds_bad);
+ 	g_test_add_func ("/multipart/bounds-bad-2", test_multipart_bounds_bad_2);
++	g_test_add_func ("/multipart/too-large", test_multipart_too_large);
+ 
+ 	ret = g_test_run ();
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
index 49aa28964c..3ddcb3e568 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -43,6 +43,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32051-1.patch \
            file://CVE-2025-32051-2.patch \
            file://CVE-2025-46421.patch \
+           file://CVE-2025-4948.patch \
           "
 SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
-- 
2.43.0


