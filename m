Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34E51C71133
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 16:09:18 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.90693.1749571751867906419
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 09:09:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Y4bRK9qV;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-234bfe37cccso69386795ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749571751; x=1750176551; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ulyPRkqJFmH/+0nwf2xZL8tBX+nGqX6zrsIY6xCf+JE=;
        b=Y4bRK9qVtKJjcjdNPu4W9JtyUsJKbP1sj4yO6aEu/V/7BQVBvRxgKuj9JzxGDWp+dm
         G1HURnnO/mvaP6g52oJvcsQOHrlv7wIyyoHA4juzP+CxvJkIgHk7ESqakuk/TWlBPEor
         CfdrgI1cJh9WOJazk3TJH4jwtsRCGJ18PSDzccgBKnGErd4lOlVm9rnyBLxFc7R9b9OV
         KfQQEp61tNsDxXHNZi1ip91+X+VM6hHpwHxzOucQpUbUWRM/b8vp5FrEBI+bt2G7cm85
         sHN+TTkD1D/AMUzkyYFl8oNuFAgF06Z3IntT6uEIpCqwZ1HnKSg2G/hvUs4JJBeDpqoM
         rc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571751; x=1750176551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ulyPRkqJFmH/+0nwf2xZL8tBX+nGqX6zrsIY6xCf+JE=;
        b=AQxtW9HGpePX3T51jgaDEY57Mlf/3CymzXFdwz3LQ+ecieqbg5FDXpkCD6+vKSpaJj
         e8n5XoKzHghqr/+G7PFDlSZXcLQadBkFdkuAAe4vjqjMS5hd1K/V1sHsAAkmeBUwvN3i
         VRPd+Od7QIGIXwD1E4yV0x9kDTrPQ0YuvwKEaBP/nla9H8gteT6JVYeccgObl2/yUPPj
         bmlRvWvQCOahCEo4f6Q+a2bSLhjTdRYxU9rprNr7MiEA7Xrvw1B7q2b0GIsMbX42P0FZ
         rkzBB2QEMCJ7mMSonIWEr5xDTuU1/uWrltXrdv+4LZwD8TY0xiokhjlViiXKj4f3jnWf
         G6ZQ==
X-Gm-Message-State: AOJu0Yz9liOSJQoHeb4dcNMmoov0JhyrPX64yYyKGnl/pMv5uG+opjwd
	mF2NH+pDP8bDPkcx73CySo26kDNA2y+GFSVvREvGbwYtKJvTivDyrAoaQcMGBQAT1hTMz2WL7ro
	eubJl
X-Gm-Gg: ASbGncsw9KzBu3nKWkZ0DxWM+JXVNoOCfSssiSxo/XdEuUYFQykCaFsMSaibDj1f3j9
	Iz1dIIO+EeKnOFLDjMn6Got6KAAG0aTZNf7UtpmbovXxOCFeJ1a0N/VOa0ZW8ksamxeXa98zEI3
	oX7QzBqlPmS746moCy45dt7bHAuL7LIOxPx6JhEDGbDydhC11z+rWuARPsTpCeJuDxdoATqIFgM
	aK33okDb4hPiGCaqfvaEjugoDvkSDNvf0Iyk5i5ORytdB0k8cbfUKW/3KkoT6raYy7YXGuMP+o5
	iRnG8tUGHzy4vzGYGvxSAF6PP3fhyMEFJBGOuQaXYee1/VNhPppgZA==
X-Google-Smtp-Source: AGHT+IFYQUv84UGPitLAdv0da5khbTts2TSlI4zdOa3I77xK3hTjh5NNcXlYlLEYHCixkoCwRYlbMA==
X-Received: by 2002:a17:902:e890:b0:234:e7bb:963b with SMTP id d9443c01a7336-23601d24722mr237017105ad.16.1749571751046;
        Tue, 10 Jun 2025 09:09:11 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056e7sm72597295ad.166.2025.06.10.09.09.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:09:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 13/32] libsoup-2.4: fix CVE-2025-32912
Date: Tue, 10 Jun 2025 09:08:26 -0700
Message-ID: <d1f3c8a62388133acd5df33ec857e06cc23ab9d0.1749571556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749571556.git.steve@sakoman.com>
References: <cover.1749571556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 16:09:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218382

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/434

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-32912.patch  | 32 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912.patch
new file mode 100644
index 0000000000..b3ce9d8bc3
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912.patch
@@ -0,0 +1,32 @@
+From 0984dddb11daf14fdf5ca24077cd0ebda796439a Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 16 May 2025 13:25:32 +0800
+Subject: [PATCH] auth-digest: Handle missing nonce
+
+CVE: CVE-2025-32912
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/commit/cd077513f267e43ce4b659eb18a1734d8a369992?merge_request_iid=434
+https://gitlab.gnome.org/GNOME/libsoup/-/commit/910ebdcd3dd82386717a201c13c834f3a63eed7f]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-auth-digest.c | 2 +-
+ 1 files changed, 1 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
+index 6d965d2..f1621ec 100644
+--- a/libsoup/soup-auth-digest.c
++++ b/libsoup/soup-auth-digest.c
+@@ -156,7 +156,7 @@ soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
+ 	guint qop_options;
+ 	gboolean ok = TRUE;
+ 
+-	 if (!soup_auth_get_realm (auth))
++	if (!soup_auth_get_realm (auth) || !g_hash_table_lookup (auth_params, "nonce"))
+ 		return FALSE;
+ 
+ 	g_free (priv->domain);
+
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index b8b7bc1df7..ed36d7c12b 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -30,6 +30,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32910-1.patch \
            file://CVE-2025-32910-2.patch \
            file://CVE-2025-32910-3.patch \
+           file://CVE-2025-32912.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.43.0


