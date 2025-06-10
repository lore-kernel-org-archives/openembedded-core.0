Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9503BC71134
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 19:34:39 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.96408.1749584076031076360
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 12:34:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gR5ISuZY;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b2c40a7ca6eso5587273a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749584075; x=1750188875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JDsKIW/cAncb0JwZrMr7hhol3tL/V41WLjp0/lcONL0=;
        b=gR5ISuZYQBzXPFMar4O+tYQnxGuHG1wToK/JJtYJDKDf4K8/VwNERf87IhFiuQN4Rn
         4tJuTDIUJ7jRFKiTNzCZa+4MDW21b+GLkLGxdI9Q2SwNmlJ4YESdAGRf1+kGRhd8smsx
         yBzf0LiDEuMoIkyNuBClG3WZnHFXBfGSjkJIrplnDA6UOPU2mouqHXezZAgJXWpD+TGS
         BWvY+Lnwd0+AGKdum9fgnTtNpR/SOlhrRSR6xQ5hsADSqKSUqZ3RSgUn1V/HP4FiUgKR
         gzazUkO56AOUkdbyaIPk82eYOqy57Jr9DQHTmvc7CYTIc9INeJ1bNlETNswLVQF5tX9R
         3X/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584075; x=1750188875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JDsKIW/cAncb0JwZrMr7hhol3tL/V41WLjp0/lcONL0=;
        b=UsDzgplKv52+GKBfl08YfyfrSnYRcKfBDScXJIfkLvNO2mYSn6QCcpjZ4qT881IAw3
         69wsQmURKwynttx3nIP+BVLx2Ogj8vCDYRlTwFGnctiwYq1HC1pIpJb9xjkzi0tdX2yh
         a6i3cqVn4aMUwGONwcss9tNH9acgV8+nNvVOHW0mFBHXBCUwyz67i55cyKuDJcgBSQDl
         XyemgNC6Pw1xhYXNcLg8WkMNFecO8HpAR3vyBhsgz6/MHU7w9mns/NBIyXN2BeKedlzf
         WdJnU3ICREhuIE6YsJHY7QtL+Mf7f4jiA2ifh17oygsAa2pu12kSFjKiVaiqA/fmgcvT
         /9Rw==
X-Gm-Message-State: AOJu0YxfSuMeoVgE/XbCbOCdFOPI1A5iSfxC2PWZ8oFO9igUtia1ygXm
	VGy4oxYPm2eFb+a7qM22U9HOL2plHN1h8GlQCUIAq/v39ss6oEW1jIKj7qfKbVPQFKZov+grIYN
	hvNEn
X-Gm-Gg: ASbGnctxnUohmxeYh/VVWOkpaHhQp/UrWEQjd+tFJF2cBk7QDVeddboxRs+T0Etd59u
	FudTp3iVWbppm2O5gd7DEdqyPbhOPRxbCjpjVcz2A21wmZNqD38yxn2xHsG+nCHn6/wyCaM51+d
	KRgCBiKMe0QtlhNYvwjJ8gOVedXHKVFpR7ZWMbtNw/OzzJ9KN8pLiMoosB3S9TQgypuX07ZbPW+
	dD9sFB5XuHf28G7Oi+imja+DK4UmE92waEJORSDvsoLZsyXyNyu9mvWHrSS1HMVD/VGyoJt7gDB
	qIKSUZ6zxIDF8N9qOwVbi2dwI0C25JU8MyQG2ZUmDS6O4EI+F8cJJA==
X-Google-Smtp-Source: AGHT+IEfXCzN5WlSG4/0f9eCEhqzXOp/OrSDlS1/YuU6dupkv9upT9sixoiX69hrJvoV/kRlxheTog==
X-Received: by 2002:a17:90b:1f8f:b0:311:9c1f:8516 with SMTP id 98e67ed59e1d1-313af13d310mr969678a91.15.1749584075173;
        Tue, 10 Jun 2025 12:34:35 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313b10c7a88sm73897a91.33.2025.06.10.12.34.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:34:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/16] libsoup-2.4: fix CVE-2025-46421
Date: Tue, 10 Jun 2025 12:34:01 -0700
Message-ID: <9e32f4fd761b591ea2f5ce26381135e9a8db94ce.1749583904.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749583904.git.steve@sakoman.com>
References: <cover.1749583904.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:34:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218411

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
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index a4a8a03152..4a00dafe47 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -36,6 +36,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32053.patch \
            file://CVE-2025-32052.patch \
            file://CVE-2025-32050.patch \
+           file://CVE-2025-46421.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.43.0


