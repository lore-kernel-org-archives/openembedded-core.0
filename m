Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2621BC5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 16:09:18 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.90697.1749571757717516495
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 09:09:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Kil/t8XS;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2363616a1a6so10797445ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749571757; x=1750176557; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lLWHkZaHATddijG9uFAmr7uoZK9u4i/XA0k1abwS1YM=;
        b=Kil/t8XSL/GzzBbGamVlFq4gTmP6Az1ayIZ8J7mV6q19JPg/dELlRcfLzbeFtRjVuA
         pP0GKkgdKSlgQO5F2ipdMNOmve3p+UQJRJUMuB5bbtJ3G/po6LuWf7ZkphZccB+bJBH3
         oRMwvqrSPElaCJzQdzAJxYBpcGE4HWnIfZ1ZQWegXISwIf8AO1B8/rwKKPFNhutsjrq8
         gxBA2zG1VwhkW/+bUQCdZyrdTxsqxFy+RMkEP0KCreYzhil8d2+CMNBqpBGPwXnUHcTc
         1DOEseqd9YtyKmYRpr/z62yg4M542TBODbCKyLlwBkOn3WgDS+6hFGKuSCUNvGFA3mj8
         1MSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571757; x=1750176557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lLWHkZaHATddijG9uFAmr7uoZK9u4i/XA0k1abwS1YM=;
        b=izThnNtD3uPWi5DalLzbrwnyf9deBDQB4aMPqtWmHHcq/0sy/ZO4BZo4w7AAXHZHfB
         c0c26rF3XXg+dbDrGmDbeW5dZAK/fVNxtvxRn6nyW3pkfzujqBQVze68HWS4ZpAjl7za
         s+Zrj/zedBjBNHN1ZDd0ngxjKM1RiZ2Fu1mebdsieDSjZmEW9MY1dmGlQhad/g1fet9K
         1ilbJZhCIMrbhw4IqJoHv6yPWg6FIztlD8JsxlfSxjlL003f+9KKFh3O+vSkeEzYD9FQ
         xHp3/7jFIp5eVDztu2CZ8Fa9ab66tM7UsAS9nnbxvDM13xe5o8YgqZnWWVLeDm6yqMgt
         L7Xw==
X-Gm-Message-State: AOJu0Yy3fg0Nhe9P+y+Q04JsVBy4jq02vfyw+0PI2mGeoHZ2k5DZ8ysc
	HXPuO7dtP3O1ydm3jxt4NNvu3ANhq0wLcoFsR5LVIUxM0q/r4eAQlSw1oEIV241BbcB4Rb+5fR+
	s+0Pb
X-Gm-Gg: ASbGnctRrH38TuWRP86XqULqiM5apvJtOc0OtEJLuFE28GWD+fSbDZM6je+PmzgR0r0
	rAYDtuBLExhMCRwOXT8FOtYHVDjpkulWsBAd1JYPsDnTovs6Z7gErZ5zyyeRTmzIeUTzNxqD5au
	Zo6QwbICGsmyL+7WijuO6R2KvgIMIcJH+OBXQWTq3YAY++wNUeLo2LqR6/B35T+Y9Rtp2a6aWyp
	lApbZLrx/QmSARAmPMq2++3vj0r2mKtriJ95V18ZTqCz363Z3nAB+1MNVBFzj0poxPJGyQJaDVP
	EWQBvCp081ESQmIUxeAueCdYGoIu8JjV9uP4kIs4bfpsuG53foIFSw==
X-Google-Smtp-Source: AGHT+IHQHkkI9SU2+6fqaQUpbU6jdHlUAsBlHlSGP9pP/zRY0TiTpjf8beC9p19Q2OqT/q/jD/Soxg==
X-Received: by 2002:a17:903:41c9:b0:235:6e7:8df2 with SMTP id d9443c01a7336-23601d975acmr247006965ad.41.1749571756871;
        Tue, 10 Jun 2025 09:09:16 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056e7sm72597295ad.166.2025.06.10.09.09.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:09:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 15/32] libsoup-2.4: fix CVE-2025-4476
Date: Tue, 10 Jun 2025 09:08:28 -0700
Message-ID: <d5fa3329cc58713c3476559b61b0797ace819fbd.1749571556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749571556.git.steve@sakoman.com>
References: <cover.1749571556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 16:09:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218384

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/440

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-4476.patch   | 38 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch
new file mode 100644
index 0000000000..874f62e7ad
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch
@@ -0,0 +1,38 @@
+From 52a0f9234d384b9dab368835b22e5a5a01542168 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 16 May 2025 14:16:10 +0800
+Subject: [PATCH] auth-digest: fix crash in
+ soup_auth_digest_get_protection_space()
+
+We need to validate the Domain parameter in the WWW-Authenticate header.
+
+Unfortunately this crash only occurs when listening on default ports 80
+and 443, so there's no good way to test for this. The test would require
+running as root.
+
+Fixes #440
+
+CVE: CVE-2025-4476
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/e64c221f9c7d09b48b610c5626b3b8c400f0907c?merge_request_iid=457]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-auth-digest.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
+index f1621ec..a2dc560 100644
+--- a/libsoup/soup-auth-digest.c
++++ b/libsoup/soup-auth-digest.c
+@@ -229,7 +229,7 @@ soup_auth_digest_get_protection_space (SoupAuth *auth, SoupURI *source_uri)
+ 			uri = soup_uri_new (d);
+ 			if (uri && uri->scheme == source_uri->scheme &&
+ 			    uri->port == source_uri->port &&
+-			    !strcmp (uri->host, source_uri->host))
++			    !g_strcmp0 (uri->host, source_uri->host))
+ 				dir = g_strdup (uri->path);
+ 			else
+ 				dir = NULL;
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 089a032a4f..45add2e3e0 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -33,6 +33,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32912.patch \
            file://CVE-2024-52531-1.patch \
            file://CVE-2024-52531-2.patch \
+           file://CVE-2025-4476.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.43.0


