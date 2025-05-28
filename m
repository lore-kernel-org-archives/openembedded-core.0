Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF8AC5AE59
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 06:12:55 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.9626.1748412765642224165
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 23:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=JPSGqxp4;
 spf=pass (domain: mvista.com, ip: 209.85.210.180, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-742c5f3456fso3309280b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 23:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1748412765; x=1749017565; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n0of23t3Om1oWX4aexOcqDm2IZX/8CE3l6l4cFC644E=;
        b=JPSGqxp4GCQRTkR12F7iqzu8HvsO6s7mH2gPTvpJSdtj/HG40m7NuArNSU/DOjstta
         gQIgOeX7pyPwppBIrasgUTPnxvT9jGNEaoD/KvkAG1lpdeDDlXyeE+mbVJIH/j1vxKAG
         Xq96mtptwEKIXK6h0LdPiGqr75D2myx/M2qes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748412765; x=1749017565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n0of23t3Om1oWX4aexOcqDm2IZX/8CE3l6l4cFC644E=;
        b=NOaCglmXb0KICV6Cg5aj9hGX3RMCHth6QbSDQc4tzr6h/Zujm/gOR3UOyz4l3P4rDM
         iAkT/BALJVv9Wsi8R1MLwHViU4lk1Fl0oeZ7AETwSiWZfzQgRKuRJwjnPK3nik7wKpgK
         rvQI4YFwQlBMt/Y4vVlh0HPm+HIYgAJe/fw/1EdsiJfpSoWqc6oXzVEG4joEjsSAS8xn
         sncsNUiOSpNUqYsUKD1yb5+0C0FZxZ5jm4nbzAQ4v7g/USacDbg9KjN/M4EDQic0YU9C
         cqDNeD1NgvoDM4lUlTDQuAKGPsp1Hg0arILraATq4WuK7N9P4XlJZ6C4jG98wFme9kd/
         B1KA==
X-Gm-Message-State: AOJu0YzBa2fNgMxCNMZgjwMCOBHKzAaxUzzJsfuAM9ZbQPgWsuZRK88n
	UTORrBKHfqASbt3pHmG4WRM1N2EelJmko2lZnZxCNzoYN7WXMM7can3mRlVC9DfZS70se7Sf8N5
	0/UV4
X-Gm-Gg: ASbGnctNa6eLnwmbA8psKKq2Cs5gxxdroZOdQ7gRg1GdXTpIPMM5Vsd38hdNOx3VulK
	9/oCoSBE8cAHA2fcHS6MJN0J+y8Ca4+14oMmTtln1fOgb6jzXEk0OSzWugWIj+y6NlWevJvq6gI
	BUhDrpVxAVdyllmmuv8Rl+ejiyvIhDDcL6drTDVIybx4agjab3C2sDTOmzXtnXNHEKMwGrnA7sz
	zyERWCqPuf+JSkf3f8B7rpqCeISJ9LuFABJfTx7r2DOeqEeC8NKgn6xnAXM+i2m7wTzjB7bO2ZF
	o9UzYOHfQavEhZ0SVAO4w/3xfflPJ938vByDmlIf99YxKjGsj+jLE8XBilwLthA5Vm8NWiImKpP
	/
X-Google-Smtp-Source: AGHT+IE0b9zyWOyDGw8SsP2/X9Cbinzs+wyn3DDSMWsFYZN0P7BfyZil2RKUPV/t9YUmOKfKvaR4Cw==
X-Received: by 2002:a05:6a21:1587:b0:216:5f67:98f7 with SMTP id adf61e73a8af0-2188c36c2b8mr24189906637.33.1748412764844;
        Tue, 27 May 2025 23:12:44 -0700 (PDT)
Received: from MVIN00016.mvista.com ([150.129.170.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2d99edf09csm461677a12.77.2025.05.27.23.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 23:12:44 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] libsoup-2.4: Fix CVE-2025-4969
Date: Wed, 28 May 2025 11:42:30 +0530
Message-ID: <20250528061230.70782-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 06:12:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217335

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libsoup/-/commit/07b94e27afafebf31ef3cd868866a1e383750086

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-4969.patch   | 76 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
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
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index b986e2eea2..df97a68b9c 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -31,6 +31,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32912-1.patch \
            file://CVE-2025-32912-2.patch \
            file://CVE-2025-32914.patch \
+           file://CVE-2025-4969.patch \
           "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.49.0


