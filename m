Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B53BC677C4
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 19:34:39 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.96405.1749584073075803212
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 12:34:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=a+R9A049;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-234c5b57557so55104645ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749584072; x=1750188872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yACBrJUSnmmne8HnIO14GFqinCch1pZ81EeZIYcM9uQ=;
        b=a+R9A0494ApHO9qh/LEh2R7sAhzTMqy/chWpJwY8iDlxZb5qSGTEGWaEjK26J8JDAT
         mFwgKtK3w+2mPh6DPcKiaeFn6+IoQrm3QCbk521hQXxNUkA5DpTHIwyCI8ZFoPjhuF5T
         rGNIn2JlY59zzTBHzosgK50lIEVKlWZc/7+dOfMeTEyN3ruLRQu0SHX3jKuoO1i6bVzR
         TrbRz5P1nH7By0qtk7di77ZECXwa56joo7rKlIZHy+ocwNDPGyeG9we9EZ+GYZUGVwvW
         SjS67YxHD4iCH1b7SwRjXqJ8KRrn/dQXRSAUuLiRTW0vH9XcMRC7FSv2HgtPa8Aq807L
         MVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584072; x=1750188872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yACBrJUSnmmne8HnIO14GFqinCch1pZ81EeZIYcM9uQ=;
        b=Xy4G4EQ84Ygl0LC4be4pEvEw62U2DN4AaS3LJvpVU1kCfJDkl+AOVjNJPH2W37Rf5/
         0MhYYlxuMiGbAtynXEJh2uPO/ugEJeNlYPQugcNHMGJiSdga1/uUvDr6Gimg8AuVwHPF
         +JoznCh4cMK2QmzaBzTm2QN5cvm6y90k8ZY+21s77YS99mzNzn+vvu0csfCuupbYd3/I
         5sRbKHjVudoI8+QCNyz4DLBjWhW7eyB9aNBzPoJadASTKcd+CxZeaQSvuOicYtQHLH3a
         Q7sIr5hKu37itzs5ebt0FI4adaNffu/HJmVDxEBQPOVeb1NT+qaOTia3e1S0E6TVbde9
         9Kmg==
X-Gm-Message-State: AOJu0YxMjNdd7nEIMj/lc1r4GveTlFz9haMhKPutPVSl+g6YhZ0qgBlx
	SuBXs3/DRwVVys7VUKlGGhfT2EuuQwgqZoQWcFjC85Bb+xmc9F1DH4uK28x1emQNIB35CRUNsqK
	DiiSE
X-Gm-Gg: ASbGncvyupQvDgjiUqMTAUhxRHCa3qpzfc9JCsjgTF24bgekRDIkJYalNi+PNJ5Nojf
	XUj4NxrtEc1orIeFrE2sglbhubKtPDrbVgIEs0knRLGD/aAEERnm3N1oXlKWrXTt7YiBmBZgzO9
	eV1KgQP+2jtQoQ3Yqp+YR+F83Y9IDbAsrrfZbMXRpapueB0Mz6gqsVvvzvNSL1Tg+SjSGxAnZEJ
	0cLJw51tFv9dRYgSwhn8I3J6JGntpcJHHBV5c5gdkbbMPMbu3LTXBC67XTToy+bHWCDTa6aRh98
	ZwwtPthZJylleoO5ErrGupwElo2z4BxzKd4KOUKgZQGew/mVW+g8rA==
X-Google-Smtp-Source: AGHT+IEp02+aooUF9VpHdteytHKlyDH9D7u7IsNah3bjfGjOoKqvd2BfU3zgsISSdkI1XNA2LwF3uw==
X-Received: by 2002:a17:903:1acb:b0:235:27b6:a897 with SMTP id d9443c01a7336-23642683e40mr565795ad.34.1749584072267;
        Tue, 10 Jun 2025 12:34:32 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313b10c7a88sm73897a91.33.2025.06.10.12.34.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:34:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/16] libsoup-2.4: fix CVE-2025-32050
Date: Tue, 10 Jun 2025 12:33:59 -0700
Message-ID: <d16627901125854f5346711e96d635c704438705.1749583904.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749583904.git.steve@sakoman.com>
References: <cover.1749583904.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:34:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218409

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/424

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-32050.patch  | 29 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch
new file mode 100644
index 0000000000..c032846ef0
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch
@@ -0,0 +1,29 @@
+From 5709dfffb6fdc5b66ce001bf82a755ad8ad1d992 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Mon, 28 Oct 2024 12:29:48 -0500
+Subject: [PATCH] Fix using int instead of size_t for strcspn return
+
+CVE: CVE-2025-32050
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/9bb0a55de55c6940ced811a64fbca82fe93a9323]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-headers.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
+index 9707ca0..67905b2 100644
+--- a/libsoup/soup-headers.c
++++ b/libsoup/soup-headers.c
+@@ -902,7 +902,7 @@ append_param_quoted (GString    *string,
+ 		     const char *name,
+ 		     const char *value)
+ {
+-	int len;
++	gsize len;
+ 
+ 	g_string_append (string, name);
+ 	g_string_append (string, "=\"");
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 96bb53a033..a4a8a03152 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -35,6 +35,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32907.patch \
            file://CVE-2025-32053.patch \
            file://CVE-2025-32052.patch \
+           file://CVE-2025-32050.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.43.0


