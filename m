Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C3AC677C4
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 16:09:07 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.91281.1749571743773958446
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 09:09:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZEr8WNqC;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-23602481460so37373515ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749571743; x=1750176543; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ehUE4zES2H6KeY1due9kFl6WzJI4aaiift041WdG4j8=;
        b=ZEr8WNqCoLPiQfJdqUueq8ndhtI040vSYPnlJOehILRROMIkUjD1mCXnynhyat9OXW
         6gKv99otIyHxaxoyQf/I2x4pWCfDmC6uZ/D/eTlpOgoDysPVzC1pkMWKwrImlax7cYWT
         4k1u87LiMuKYTVXzlPXc35d9Ng2ru2l6eyPKmHRhzRt5Z2V2yXxzR25aAVr0ac5OFm/0
         8DGzQDnAij/9+hUuzsHxyymWPj0pRIGMeqAdeO3qKVKLmhZEavPZQE7rR3Icw0NfzPi8
         YZBf5xo9y0xeidHgE4oWSK1WRzsbdE0cNxgJ+NQZFgaLgXhX2nWroedmr+4bMksJl91N
         HgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571743; x=1750176543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ehUE4zES2H6KeY1due9kFl6WzJI4aaiift041WdG4j8=;
        b=GEiGoHULC8s8XKjZ+e/Qme49itSnNpNeDNfo2Lb6vd5BxAXeLCfLQvbZl3Rs4Ie+VY
         BHAay15gfHf6IJbjoHD3FQkwl6j7GCDoDr/LQH9yZAscPQZb60eWidW6egmCgnegzfOT
         +dHpLIAFvZeKtfUKe17q33e141S9CzLIWtlB7cFyqvsQZTI+7EjkucixEP+RVERwST//
         Sh1Slpyj6dH2uGIfYZgL3BxuTPKtkMy5NJWle3xni7Sb0B7CFDevWCE0C9AkFp2h6Xcx
         11EfLF9g4J6T7Bsw/d6dtQ7jpLM9S4omaIKvE5ynqDSgifoUXkpIVZQJJ6sQ0RyesZ1o
         35Bw==
X-Gm-Message-State: AOJu0Yz+vOWboY+8d/yUQUcWkZoDZ86aDGfzWZTC75IA3D0tnrdoGusM
	Yrov4W5pPDCIVvW/VCKtpS5xwev3ioJ5B0WML/5pZjTkdS2xEWyq6ZpiNuhtxlz72KfbsQmZuIt
	/UyrG
X-Gm-Gg: ASbGncuB4XWTWbf8NRM1XY9SWxwnsBJKcsxgHz0btifSDfcJXFZYrFxhI1qUvN2x0xY
	v0ccsIHU/QHqHy8TcKbCHo6Bfk/YEN5c2LmL8T4ifaUlnei1dasIrdSwA2yuanwK2SpPP/bmv+/
	yKZAgbbE9kjxkdV5EzebRD4dU4qahUvOsQWmSRBA6LSRplBd1nQ0Irm/VA5PIdQmTM4mSZX8gCJ
	TS4HvLWjp63Rs3US2Png2uO5mJT48p8u1qmRPodDFCwTgemapjGdsb7idXzLc0f0GdvKeZm7BUm
	MOjrlrW7DImBvgLlUrevkkIRHa4LgRhgZzw8/ZVeTLDz/eYA8RhpiA==
X-Google-Smtp-Source: AGHT+IHqcAvCZ9Uk/2wUim6qVrE3YfmxUcAJ2DrD1SOsP4IQ8bnrDpUUOdWO+8TdnrBybE3F9mZM1w==
X-Received: by 2002:a17:902:fac5:b0:234:9052:2be6 with SMTP id d9443c01a7336-23640cf082fmr4487045ad.41.1749571742960;
        Tue, 10 Jun 2025 09:09:02 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056e7sm72597295ad.166.2025.06.10.09.09.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:09:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 08/32] libsoup-2.4: fix CVE-2025-46421
Date: Tue, 10 Jun 2025 09:08:21 -0700
Message-ID: <1012345aa97804da17867e7569a19259f37c2e25.1749571556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749571556.git.steve@sakoman.com>
References: <cover.1749571556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 16:09:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218377

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/439

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-46421.patch  | 47 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
new file mode 100644
index 0000000000..3318093400
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
@@ -0,0 +1,47 @@
+From 5eb225f02bb35de56cfeedd87bde716bf1cb750b Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Wed, 5 Feb 2025 16:18:10 -0600
+Subject: [PATCH] session: Strip authentication credentails on
+ cross-origin redirect
+
+This should match the behavior of Firefox and Safari but not of Chromium.
+
+CVE: CVE-2025-46421
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/436/diffs?commit_id=3e5c26415811f19e7737238bb23305ffaf96f66b]
+
+Test code not added since it included some headers not in version 2.74.3
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-session.c |  8 ++++-
+ 2 files changed, 85 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-session.c b/libsoup/soup-session.c
+index 83421ef..8d6ac61 100644
+--- a/libsoup/soup-session.c
++++ b/libsoup/soup-session.c
+@@ -1189,12 +1189,18 @@ soup_session_redirect_message (SoupSession *session, SoupMessage *msg)
+ 						   SOUP_ENCODING_NONE);
+ 	}
+ 
++	/* Strip all credentials on cross-origin redirect. */
++	if (!soup_uri_host_equal (soup_message_get_uri (msg), new_uri)) {
++		soup_message_headers_remove (msg->request_headers, "Authorization");
++		soup_message_set_auth (msg, NULL);
++	}
++
+ 	soup_message_set_uri (msg, new_uri);
+ 	soup_uri_free (new_uri);
+ 
+ 	soup_session_requeue_message (session, msg);
+ 	return TRUE;
+-}
++}
+ 
+ static void
+ redirect_handler (SoupMessage *msg, gpointer user_data)
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 1ef9303fb8..3b460852f3 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -23,6 +23,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32906.patch \
            file://CVE-2025-32914.patch \
            file://CVE-2025-46420.patch \
+           file://CVE-2025-46421.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.43.0


