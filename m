Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD56C54ED0
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 14:59:42 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.1106.1747839574295438633
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 07:59:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FWCa5XbN;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso7666691a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 07:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747839573; x=1748444373; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gm7sS983rNj/5PEt9k6k0vLJ5crKKDImoYL0pjf7kos=;
        b=FWCa5XbNpyAfGl3zCezKxjsrjG7hYUoTAy+CCGa/lh8wNO6z5ljGS1rhVOAOi8gRyR
         PZY5F8GMc+ZOq3wo4s4zVBGnwpMUVEjAonPeMl75T+ZHi6Us0Y9HzOXZKL5bqAniFmY9
         2wikXI/23MpuWAORoQHuz5BIiNdg3OywZKVsqlXBDril6KJo6se7SkV0kVlfmmM4EOGz
         M1q8pYwRT3+bUKNltRxvkfCCGypCWcFD/p4RnvJiuIG3cyM4wfC7cTdz0Ru3B+wtpttf
         I7gfcN3oa3rrUx7GBFzByomtqDbwSBWFpyF7kGEpdk79vz48fUALWqjuybEUxqTU2yz/
         WK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747839573; x=1748444373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gm7sS983rNj/5PEt9k6k0vLJ5crKKDImoYL0pjf7kos=;
        b=G7xWD+mPhmmO7Gx3wC9fLVMJaxIVxk/5V/vItDBHdu/FL+uxhLz27xrf071Pemq9Ph
         CcsLVcnmpaJkYIt8+2FaJ+Rb7DBTisecVKGSdYci+L6J2cinQHr37mqb4lgXn1B8hsPC
         +o+7w94XdQlWR6keWy0fL1xFCMxTpn4mcPqj3CoKD9ieQJWyQpn55CN1vXKVcBpueOvh
         A53HYP/mCZLZZc0irTUfaDuivzdV6Cy81uME4o7Ud5hJcNEp4mnWRIAz3nLFgGBRXAKN
         mRQy68nv4zDw4GwjFc8h0ISCu5Y1MZz2B2c14mLrTVec7/6GOqCLPYrND2DkHIVoYlrU
         9oKw==
X-Gm-Message-State: AOJu0YyMiVC1pMZD2TgjcKK3s5ekQQX44rJGTvubBZJ0ti6ihht1eAb5
	KoS5FBMX1sB01gn4mVokvcTHFdSCw6sfFyzgFPfTAFuknaYYuhAQURlkRxNlklDexIKhtFBFHGI
	SP0eT
X-Gm-Gg: ASbGncskNG34fcvoFMWVQruP++v0b7ytobllUAWQFRItKZg2o6TqP8ZqH28jsxWLT0g
	fMxLYUQWP+GitlWOB0ziUSlEtcDIrpVI3/fjXV8YAfQStGGAsrXjBOdAfRBXKmL9NPvRO6jfDpT
	aDcalac3g6jxbhYeFFuEIDejEtsraKzn+2sVeOlM0HUfXzE2Iq+AUlunMloNdGzT008+Y78317Z
	13DCFyUT5oJv2GR4a278IeAGtP3aWn//wo689TdkMrOHVtQQCNRhrtASc4Csb1WYYE5yQdgwuxa
	2dw71qbLM8GW7ahpxXiwgg9sqVce3L/FMod76TSdxNU=
X-Google-Smtp-Source: AGHT+IH7EiBlTIy60+Qe0e0lXChrqyWVdp+bKjX2vA9AldraA6BemWZACxTy1Y1kexgYNfjeB4P3/Q==
X-Received: by 2002:a17:902:ce8f:b0:224:c46:d166 with SMTP id d9443c01a7336-231de3ae584mr312610485ad.40.1747839573536;
        Wed, 21 May 2025 07:59:33 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:89d4:3586:e576:3ce4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4adb017sm94189645ad.53.2025.05.21.07.59.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 07:59:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 4/7] libsoup-2.4: Fix CVE-2025-46420
Date: Wed, 21 May 2025 07:59:17 -0700
Message-ID: <7c963f68cb8dfdea3e1664078037303ea3f29e65.1747839445.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747839445.git.steve@sakoman.com>
References: <cover.1747839445.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 14:59:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217040

From: Ashish Sharma <asharma@mvista.com>

Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/c9083869ec2a3037e6df4bd86b45c419ba295f8e]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-46420.patch  | 60 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch
new file mode 100644
index 0000000000..37ab16dc05
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch
@@ -0,0 +1,60 @@
+From c9083869ec2a3037e6df4bd86b45c419ba295f8e Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Thu, 26 Dec 2024 18:31:42 -0600
+Subject: [PATCH] soup_header_parse_quality_list: Fix leak
+
+When iterating over the parsed list we now steal the allocated strings that we want and then free_full the list which may contain remaining strings.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/c9083869ec2a3037e6df4bd86b45c419ba295f8e]
+CVE: CVE-2025-46420
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ libsoup/soup-headers.c | 11 +++++------
+ 1 file changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
+index a5f7a7f6..85385cea 100644
+--- a/libsoup/soup-headers.c
++++ b/libsoup/soup-headers.c
+@@ -530,7 +530,7 @@ soup_header_parse_quality_list (const char *header, GSList **unacceptable)
+ 	GSList *unsorted;
+ 	QualityItem *array;
+ 	GSList *sorted, *iter;
+-	char *item, *semi;
++	char *semi;
+ 	const char *param, *equal, *value;
+ 	double qval;
+ 	int n;
+@@ -543,9 +543,8 @@ soup_header_parse_quality_list (const char *header, GSList **unacceptable)
+ 	unsorted = soup_header_parse_list (header);
+ 	array = g_new0 (QualityItem, g_slist_length (unsorted));
+ 	for (iter = unsorted, n = 0; iter; iter = iter->next) {
+-		item = iter->data;
+ 		qval = 1.0;
+-		for (semi = strchr (item, ';'); semi; semi = strchr (semi + 1, ';')) {
++		for (semi = strchr (iter->data, ';'); semi; semi = strchr (semi + 1, ';')) {
+ 			param = skip_lws (semi + 1);
+ 			if (*param != 'q')
+ 				continue;
+@@ -577,15 +576,15 @@ soup_header_parse_quality_list (const char *header, GSList **unacceptable)
+ 		if (qval == 0.0) {
+ 			if (unacceptable) {
+ 				*unacceptable = g_slist_prepend (*unacceptable,
+-								 item);
++								 g_steal_pointer (&iter->data));
+ 			}
+ 		} else {
+-			array[n].item = item;
++			array[n].item = g_steal_pointer (&iter->data);
+ 			array[n].qval = qval;
+ 			n++;
+ 		}
+ 	}
+-	g_slist_free (unsorted);
++	g_slist_free_full (unsorted, g_free);
+ 
+ 	qsort (array, n, sizeof (QualityItem), sort_by_qval);
+ 	sorted = NULL;
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 3aaa06a541..fa4dece0e9 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -22,6 +22,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32906-1.patch \
            file://CVE-2025-32906-2.patch \
            file://CVE-2025-32909.patch \
+           file://CVE-2025-46420.patch \
           "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.43.0


