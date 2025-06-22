Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04EE3C7115D
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 15:02:42 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.27813.1750604554452473035
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jun 2025 08:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BCi36lCr;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-748f5a4a423so1981562b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 08:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750604554; x=1751209354; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1RIeD9kFPZnPGWHcL1Mdr+6oNklS999fC3dcQVIWsDU=;
        b=BCi36lCrGliz7dDRM7GnnldccIHrZPqYkndT//cgT3dym1kBPGqoJDjM5IBZyxXE9i
         2YONrIMh9x4JJh5ZyCpBRwGzOH1Xfn+FK8z4MgIB7GM51dzpIKgvy1S9JlFzQRX9Q08H
         lrQ+HofvY1Y5gwlGT3hHStP/wAuzO2qP01RSM/X4VqQ0kVtzff6XfGZuqRD1L5YB+ufT
         5Tp1CGjJafVeyKPyJ6TMc6cnERO2HrMfixyD30puLVqQSIcyn1zuud58VXuVZuj3gVWN
         O/YtJRoBmQI4z1i3/+A98wNgUK0CSzKTAeOU+rYLW4sWiNqGV+YkqcxQ6QsPH4oyB0Io
         GeMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750604554; x=1751209354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1RIeD9kFPZnPGWHcL1Mdr+6oNklS999fC3dcQVIWsDU=;
        b=osRA2FWnZVhUQSO87Z8fTd2HDpypWMH/w3oJzzWP8Z1/phFUG4PnCVEjSfEyJ7wACp
         am++/rDA8ASntKiVhyKFsVhvspias08Mh+R3XSaxkH3m6ind8ypMVI+6xlbSfcg2XhgZ
         7Jtc8/zhtjZYNZNu3+d0VmuCJ9ar+UWJfOdpY8TsjKySm/BHrHF/cdmkuMzqA1toQMO8
         n+DlIK3cDOhVMKggpAGPIR2BQ7yDAU868ZXtryss+N33n4o128Y8Dq/Vo4P24jeLhWcy
         a8bsKA9czeudtkrkTrhW+9YkenAnvpJsO2m9AbTL1Dz08SMfrVv0OcasA8BmA+UnzoA1
         I+Cg==
X-Gm-Message-State: AOJu0YzByVXDhgipP9Sq1YftqqMvcXaOXbVMId55dNkTFYvy9/xCOUKp
	hw1UR8u4xAVlTNWJLArTQcytzGHYIt7K9h8egkCZhlNbzIrXWbqRhfMZ6W6hAoja7n6rwv2/6s3
	biZ1Oljs=
X-Gm-Gg: ASbGncsVrf1kpbdtc/jZ+y+4kUDXGENWHmOAbhqJpsx2lNoMl7qVbcmJ4cJv0Bb75vZ
	h2Qz5LgIrngxXU3bXzmpCKleq4uDrgJnZs8ZQV7Ycw1luYlwbELQ53ZtbSB7j1cOb+VT2rhK79u
	TUykwpo6WC9AXFmW7+OilF4moRfy4FF6cxI5e8Nhc+iABqAloDBFmU07ARU2uVlCRvASW78Ovkc
	82QSIw9msqdu4yNH1heSqdZblHMyRlXgb008pMxGkgw6m6Y/8RdDGoWPeraRrBrb0Mu0Wi/77I6
	4Eyq1Hdjd4omFMELwwKIiCJeThXg4Q5qPPWVKoDMgonJ/2fKlm7ppQ==
X-Google-Smtp-Source: AGHT+IGt9cShZxvVgE3FHQaVSL4SCMWPCz8ebkzAmiieQ/yXOh4cb5gLIdaoc3B5jIGPNxXSYsrIOg==
X-Received: by 2002:a05:6a00:a1f:b0:73e:10ea:b1e9 with SMTP id d2e1a72fcca58-7490d6153b4mr12802477b3a.6.1750604553532;
        Sun, 22 Jun 2025 08:02:33 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a75:9ad8:d661:8bd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a46eb71sm6222521b3a.22.2025.06.22.08.02.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 08:02:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/14] libsoup-2.4: Fix CVE-2025-4969
Date: Sun, 22 Jun 2025 08:00:02 -0700
Message-ID: <5a6af5bcbe45184e7ac0535549c25cbe64113ba7.1750604257.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750604257.git.steve@sakoman.com>
References: <cover.1750604257.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 15:02:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219185

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libsoup/-/commit/07b94e27afafebf31ef3cd868866a1e383750086

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-4969.patch   | 76 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.2.bb             |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
new file mode 100644
index 0000000000..d45b2a2cb0
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
@@ -0,0 +1,76 @@
+From 07b94e27afafebf31ef3cd868866a1e383750086 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/07b94e27afafebf31ef3cd868866a1e383750086]
+CVE: CVE-2025-4969
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ libsoup/soup-multipart.c |  2 +-
+ tests/multipart-test.c   | 22 ++++++++++++++++++++++
+ 2 files changed, 23 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
+index dd93973..b3611db 100644
+--- a/libsoup/soup-multipart.c
++++ b/libsoup/soup-multipart.c
+@@ -108,7 +108,7 @@ find_boundary (const char *start, const char *end,
+ 			continue;
+ 
+ 		/* Check that it's at start of line */
+-		if (!(b == start || (b[-1] == '\n' && b[-2] == '\r')))
++		if (!(b == start || (b - start >= 2 && b[-1] == '\n' && b[-2] == '\r')))
+ 			continue;
+ 
+ 		/* Check for "--" or "\r\n" after boundary */
+diff --git a/tests/multipart-test.c b/tests/multipart-test.c
+index 834b181..980eb68 100644
+--- a/tests/multipart-test.c
++++ b/tests/multipart-test.c
+@@ -562,6 +562,27 @@ test_multipart_bounds_bad (void)
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
++	soup_message_headers_free (headers);
++	g_bytes_unref (bytes);
++}
++
+ int
+ main (int argc, char **argv)
+ {
+@@ -593,6 +614,7 @@ main (int argc, char **argv)
+ 	g_test_add_data_func ("/multipart/async-small-reads", GINT_TO_POINTER (ASYNC_MULTIPART_SMALL_READS), test_multipart);
+ 	g_test_add_func ("/multipart/bounds-good", test_multipart_bounds_good);
+ 	g_test_add_func ("/multipart/bounds-bad", test_multipart_bounds_bad);
++	g_test_add_func ("/multipart/bounds-bad-2", test_multipart_bounds_bad_2);
+ 
+ 	ret = g_test_run ();
+ 
+-- 
+2.49.0
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
index 61ebebeacd..11552df80a 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
@@ -37,6 +37,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32050.patch \
            file://CVE-2025-32052.patch \
            file://CVE-2025-32053.patch \
+           file://CVE-2025-4969.patch \
           "
 SRC_URI[sha256sum] = "f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b7823b6018b40d01159"
 
-- 
2.43.0


