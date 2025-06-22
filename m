Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C956C7EE31
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 15:02:42 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.27815.1750604557172937513
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jun 2025 08:02:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=AHjAUfp+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-747fba9f962so2480468b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 08:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750604556; x=1751209356; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tA9ks3hAHFM/aXMpNKCnV9CMuGIv2hBF2OZ6HjdW7dI=;
        b=AHjAUfp+MwhJQQxAXHCHOS76Eu9iTBRy7MDAM1uYHCi2K1/+QdeDaSrRUi+OWcqo+S
         9ItGdjmvWL1yy8Y48dj7qh44U5EpvDtWTXA+F8TEL4M60JoWCOY0wTWqgmGuo4gMWTBQ
         1PoiuZ7uevAqXLNrIq9J8oeLgh7px/PAfHXojBwqhJIgT/2+e0gNTnG1ln2Qc1BUP4VV
         QSn7rhiHSk2SWNfPpFQxzYHf71ea7ET9ZK+aL1nnYJfABOWzoTsjLtcNb2UcKJL2PPCp
         azCghWsdBnp291XHgtgiejZwRhnjjdlpBBX8iM9N71IfhEYDOPOMqRBJPs9GQhpeIoY0
         g5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750604556; x=1751209356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tA9ks3hAHFM/aXMpNKCnV9CMuGIv2hBF2OZ6HjdW7dI=;
        b=CCD10V5MuvUfdlFnZZOi8BQwBO2l7q0lkbvBmk+BT158vCvaByVqu5KCQYxmNg2nrn
         gbHNd8eFWEeFz7j4jnEONU/J4forKHRbCl+69RCK1mRuDwHkTUc/XBGSCrdc0k9hxsfy
         ENPsK9e129WMauOSEoLBTl6rqoXq5mFc01p6sP9T7urfS8mv6vW0w0NWMNCPmKA4nCZu
         0z/o6Lz/AY2D77qY3z/YEi9SeaK9ST3P7pAeONtuK/iyMS1tE1Wpv6sShA+ksJgyoTRk
         ixzL7izwg0dtMWP0GlnrtmGKqxWEpIuG+ULIPI58OF2rtBdK+5Jv1+QjDrBYHdhhy+d/
         9RuA==
X-Gm-Message-State: AOJu0YxIC7PWWfviMicqkPnV7nD3Jj5acR9NY8g5uCmoSnWhA0zXhP+8
	ni6Q7spPz3Dpkz0t48sQGi77DoNqzUX1/P6SbVwJdIGrhy2Lc3ZtjBJwiWaWT2W3gYIsYxKEDrp
	UHmGSjvY=
X-Gm-Gg: ASbGncshtFVk7o8Ind+epVCGmmBW1gGhaED447AwZnfuiu3SOqR1IkZxAt2BR0dQFOu
	55P+jmdS0VV+xULCJUeIb6JZXdgerjnq1HxGpXAWO58dIGtle0VxL519GstwhTcSTm1Flq6l7JH
	9uEBfmDeazL5E+EuJB0W/guMq+caDcdXhjRwJeFAXluK0QbaQfo8Nc7lrI5uYbcZAiOOaWlYkZA
	4ZohunCZ8uVDY4sIcSfIvYSmmkpTrzlZoAhh/qTnhEfCAkWJbFcqmNSpkJPIw3kmcfNZ0ekX0dR
	iWZiQYZ5aclz6bq6Ta2yaPZygfplnt6kDvrsF4KWbMA1E8yizIYjWpS5vhjDkLJa
X-Google-Smtp-Source: AGHT+IHNmxKA2yGNjPmZYdcOp0nRUgWheFVU4qHhwBxPgWiBwTFdgM/NnbQpkoWOhwYOEL539m16gQ==
X-Received: by 2002:a05:6a00:2e03:b0:748:a0b9:f873 with SMTP id d2e1a72fcca58-7490f548544mr11978380b3a.9.1750604556288;
        Sun, 22 Jun 2025 08:02:36 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a75:9ad8:d661:8bd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a46eb71sm6222521b3a.22.2025.06.22.08.02.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 08:02:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/14] libsoup-2.4: fix CVE-2025-46421
Date: Sun, 22 Jun 2025 08:00:04 -0700
Message-ID: <33bf900bcb563c5769b75e69059751f969a8771f.1750604257.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750604257.git.steve@sakoman.com>
References: <cover.1750604257.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 15:02:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219187

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/439

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-46421.patch  | 47 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.2.bb             |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
new file mode 100644
index 0000000000..26067c4bb8
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
+ libsoup/soup-session.c |  8 +++++++-
+ 1 files changed, 7 insertions(+), 1 deletion(-)
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
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
index 38307fa3d5..347fe1aa21 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
@@ -39,6 +39,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32053.patch \
            file://CVE-2025-4969.patch \
            file://CVE-2025-32907.patch \
+           file://CVE-2025-46421.patch \
           "
 SRC_URI[sha256sum] = "f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b7823b6018b40d01159"
 
-- 
2.43.0


