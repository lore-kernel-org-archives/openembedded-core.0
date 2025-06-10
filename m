Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F30E3C5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 16:09:07 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.91283.1749571745186831764
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 09:09:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vL2TVUgr;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2350fc2591dso46557605ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749571744; x=1750176544; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pcGQiQH+J5SFjte67z7JugQlHPNk2LsujYWOA54ELVE=;
        b=vL2TVUgr0TxakoVn+3M1db4/8JIJ6eYIuCa5AOCAM1KNyWNiHmAXWAWUHS+rHYl7qL
         eFHjbtTvpeBfIl1r8vCv3lUodRKFOCLv3JmIIOXyxAFgeG1XRFesv/pHuXPCnITNbOdR
         y7ulLmts/9G+GBaDYCkWMYSaPTqC4r+2F78/OAAWeptcSdD313xlGhvZGUaNazRtIEXe
         q3xRww8nmM5ny0cEi3BUOJ6xy2brJaaA2j833r/yyPhb55uH+xWo+Vq//4xTYic+fh2z
         FodjkdLZ9L8J4RUkSCrc2lcD5/3BgMBiWh/R1piOxOHkOm1/UKq5WvyGEgdhv6O4nuWD
         EtTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571744; x=1750176544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pcGQiQH+J5SFjte67z7JugQlHPNk2LsujYWOA54ELVE=;
        b=lW8inNQ1T1JczSHkoAn50ifManVa5PVXOr4qAjatcveMqo4DBThf6J4CwY2IWS9EWt
         lZpfUZYkNSUe4WIWI8mGoVdeLFvwg23dDr3LlqKOgb+ILw+aq25YJ2IYpd7jYxtGYcRl
         UUYtsuwNQ89n7pwRFnhqMmgIXIJDoWpgOezOOb8muVfa57klQ6Db/MwZlEgE9rpNPRCU
         eZL21TZ9vbMhGQOePjTeiMN2PaP5yXExIF7+HP3F2DtPouE1i1Mkuw7c3Ef4LIMB0sH0
         vn4xDnXFy0italBUD6blCOQiF+bnsZXVDaALT6SlcT2Xy2ILjymaPny273Ih+rIAyWwN
         6vCQ==
X-Gm-Message-State: AOJu0YxFJga6iO4KDG9rFP/XanPYIBoe0RVXhhehL8PpkrRc1UO7Wvp7
	kosxRnaqyR033AXqyJEhKy02PvK7jAxzMlPKYvvNJZ3kIDm6E7Mwihh7so00p/yHZZd9FGSchRQ
	rg2Lc
X-Gm-Gg: ASbGnctDUxGI/TV2JPkfQ1RHIq80s8naXWQ6HuU4XXMGl2GcdQwo8zouNh/HhQvEr37
	b8cVdjqz4B9X2z0VqDZJAYHsIfz/tfTlHu7Zop/sIhTsI35RI2s7G8xDlPcqPkuMjWSI4FALcxv
	49waL6frb6W1pXyD8cUUYtMFn0Qiwsbru3UBLYpFRBkhV5Tu2S0KJGT9zRc9p2i7foG8SocQqMD
	zLNLgpmzSFEAuAuncaMlwJMdLDV2zEs4/2BgIoaP3VHrwMoUUNdsYpm8LXfxQLmpaScc8/jeZg1
	W/OuiW+sOjmuXwGqKsmZFLt4HysWcEGbvge0MLAF89h5MBqTIevFwg==
X-Google-Smtp-Source: AGHT+IFCREXFuurhww1njh7gQ7mqcot0JomUUm1FRHzQ4su7WdDvhlVKXdW5Xp9WjbcyvNFqi6kFAw==
X-Received: by 2002:a17:902:c949:b0:234:1e11:95a3 with SMTP id d9443c01a7336-23635c5af8dmr63015365ad.13.1749571744317;
        Tue, 10 Jun 2025 09:09:04 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056e7sm72597295ad.166.2025.06.10.09.09.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:09:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 09/32] libsoup-2.4: fix CVE-2025-32050
Date: Tue, 10 Jun 2025 09:08:22 -0700
Message-ID: <8de43e4c2d202a0bbb242cbc0dc096d07b78f0c1.1749571556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749571556.git.steve@sakoman.com>
References: <cover.1749571556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 16:09:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218378

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
index 3b460852f3..4ddcd1734d 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -24,6 +24,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32914.patch \
            file://CVE-2025-46420.patch \
            file://CVE-2025-46421.patch \
+           file://CVE-2025-32050.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.43.0


