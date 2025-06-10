Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50354C677C4
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 16:09:38 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.91297.1749571772757520099
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 09:09:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xCKkeziC;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-235ae05d224so48519335ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749571772; x=1750176572; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sv8AAU08tnJxIqGKu6TasaB5g9Nuzbg/Zwdg7aAj2wg=;
        b=xCKkeziCEYjtlDy+DH1vBX1WBQbSuihIcsgcEp5ljyPq8sEN7OpJPe0ZHmAsZBKcjc
         oAIttxij+G2d/bTWRHiJkjZ3dK+jdEU+UZMNwwMsT1Hn+YZUzVYKdG2MxKRlj2dY9bvE
         ce3p2fUvLRiJnczgMDU5yNcmOCkFWiSnxNwnD4dQL3uRRXIx3aMuOI/7u3wU3knJKY/s
         nP1Q3xfFr0FdGefOO9KxQ5HDX2ijEOXLonrb2bd0n5Bo9Z7Ju7Hn8paclgSq1KcHg+DJ
         Ed8pmg7DaXrsHyY1egb/gGwpFllTkFhgStXdCEe7Oem2jC/J0cyt7eq75zbDYEs1Rkhu
         LEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571772; x=1750176572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sv8AAU08tnJxIqGKu6TasaB5g9Nuzbg/Zwdg7aAj2wg=;
        b=YxajaSLzqloQ6qS51T5SvTaLaAeTvsRZ+7xKMSre73t5AHQSYGo+vdZMRzXmQolhbC
         fJMp7k8OP51Vjau586Z78vomy97pFle+CxqqPADz3QR6lFvdCOl9+kfgirZUW3dAU/Qq
         gTgdu7ouRtQamO3N3iOktE/VyQOPQ7p7kd0S60hdxgwNxwYdrQDnzfVozKZTloyQbuHh
         10s6ZvmHQJr4atVsFSi/tM+hhZJFN/1ODqXE8hpJeagHT0SWcponWuqAtfGiIaeyWIds
         aD2VWt7HnmnkV5SZY1YZz9paUMayPdkvPY2RMlduWTBY32HKTLPqlBy1m7xVKFxuBy4o
         BwbQ==
X-Gm-Message-State: AOJu0Yz7S4G7Ztb1SyMOcc3xYbBygu0mGSqDbYzBNOngIG7NWP8EAw1r
	2CbEZLEV8vpqp2FLnIQXcqmW1c3kjSsn8J3pIFJSALa3cnQBWlvnu2IatZ6Ii95CiphaswURsQR
	Twz2H
X-Gm-Gg: ASbGncvgfaXv7EMk4+YZhBsGM50bhzUytJdbR1mVtO3l+jZVXAYIExQ5Ly+LzNlcoHW
	GWBSyGZPkOSopsK/3x8rL0NMIM8ppHlcMKbzZFdy3v82TkytUhqKEPWUNt4UR/4Ccnmtlw1kBBW
	UyFfbQluO9zIlRkv4l4aR4fxiuTPTlrayMIWxayQFEZMNMyx1+W5/+909Frj0xtsQ4EYjxOITz3
	QwjjDPlVANCHBRJrPFhc66KKYCyqmmQnK84tKt6FO1ch05MZVBZdq25iK911XOQ4OR4t9pbOm+F
	VZHg57B/EfnsP0W4TuvpmTSjtK3YAO1Z5IGQtN6J20Tjm6vrzJ+Dag==
X-Google-Smtp-Source: AGHT+IGS/tOonaeDfEjJTZM8+2c8wd2sWesOYh9yAxLadozHb29HJTemIjP9E1K00vDLd+CFx5zNNQ==
X-Received: by 2002:a17:902:e742:b0:22e:457d:3989 with SMTP id d9443c01a7336-23641526179mr511245ad.0.1749571771974;
        Tue, 10 Jun 2025 09:09:31 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056e7sm72597295ad.166.2025.06.10.09.09.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:09:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 25/32] libsoup: fix CVE-2025-4969
Date: Tue, 10 Jun 2025 09:08:38 -0700
Message-ID: <2fd6621812f62acc2bbce47db9e9dc96349d8e3e.1749571556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749571556.git.steve@sakoman.com>
References: <cover.1749571556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 16:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218394

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/447

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup/CVE-2025-4969.patch       | 78 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.6.5.bb |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4969.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-4969.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-4969.patch
new file mode 100644
index 0000000000..97702a3d08
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-4969.patch
@@ -0,0 +1,78 @@
+From e8ef88ed86929c9a0dc343a4c7d29a8f2bcf400f Mon Sep 17 00:00:00 2001
+From: Milan Crha <mcrha@redhat.com>
+Date: Mon, 19 May 2025 17:48:27 +0200
+Subject: [PATCH] soup-multipart: Verify array bounds before accessing its
+ members
+
+The boundary could be at a place which, calculated, pointed
+before the beginning of the array. Check the bounds, to avoid
+read out of the array bounds.
+
+Closes https://gitlab.gnome.org/GNOME/libsoup/-/issues/447
+
+CVE: CVE-2025-4969
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/467/commits]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-multipart.c |  2 +-
+ tests/multipart-test.c   | 22 ++++++++++++++++++++++
+ 2 files changed, 23 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
+index a587fe7..27257e4 100644
+--- a/libsoup/soup-multipart.c
++++ b/libsoup/soup-multipart.c
+@@ -104,7 +104,7 @@ find_boundary (const char *start, const char *end,
+ 			continue;
+ 
+ 		/* Check that it's at start of line */
+-		if (!(b == start || (b[-1] == '\n' && b[-2] == '\r')))
++		if (!(b == start || (b - start >= 2 && b[-1] == '\n' && b[-2] == '\r')))
+ 			continue;
+ 
+ 		/* Check for "--" or "\r\n" after boundary */
+diff --git a/tests/multipart-test.c b/tests/multipart-test.c
+index 92b673e..3792563 100644
+--- a/tests/multipart-test.c
++++ b/tests/multipart-test.c
+@@ -527,6 +527,27 @@ test_multipart_bounds_bad (void)
+ 	g_bytes_unref (bytes);
+ }
+ 
++static void
++test_multipart_bounds_bad_2 (void)
++{
++	SoupMultipart *multipart;
++	SoupMessageHeaders *headers;
++	GBytes *bytes;
++	const char *raw_data = "\n--123\r\nline\r\n--123--\r";
++
++	headers = soup_message_headers_new (SOUP_MESSAGE_HEADERS_MULTIPART);
++	soup_message_headers_append (headers, "Content-Type", "multipart/mixed; boundary=\"123\"");
++
++	bytes = g_bytes_new (raw_data, strlen (raw_data));
++
++	multipart = soup_multipart_new_from_message (headers, bytes);
++	g_assert_nonnull (multipart);
++
++	soup_multipart_free (multipart);
++	soup_message_headers_unref (headers);
++	g_bytes_unref (bytes);
++}
++
+ static void
+ test_multipart_too_large (void)
+ {
+@@ -595,6 +616,7 @@ main (int argc, char **argv)
+ 	g_test_add_data_func ("/multipart/async-small-reads", GINT_TO_POINTER (ASYNC_MULTIPART_SMALL_READS), test_multipart);
+ 	g_test_add_func ("/multipart/bounds-good", test_multipart_bounds_good);
+ 	g_test_add_func ("/multipart/bounds-bad", test_multipart_bounds_bad);
++	g_test_add_func ("/multipart/bounds-bad-2", test_multipart_bounds_bad_2);
+ 	g_test_add_func ("/multipart/too-large", test_multipart_too_large);
+ 
+ 	ret = g_test_run ();
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.6.5.bb b/meta/recipes-support/libsoup/libsoup_3.6.5.bb
index 772e21e09b..457a30ec70 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.5.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.5.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32908-1.patch \
            file://CVE-2025-32908-2.patch \
            file://CVE-2025-4948.patch \
+           file://CVE-2025-4969.patch \
 "
 SRC_URI[sha256sum] = "6891765aac3e949017945c3eaebd8cc8216df772456dc9f460976fbdb7ada234"
 
-- 
2.43.0


