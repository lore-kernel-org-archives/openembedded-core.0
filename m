Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E57BC61DB2
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 19:34:39 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.95765.1749584069926158612
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 12:34:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HWfKeTBh;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b2fa3957661so2292611a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749584069; x=1750188869; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ci55BRtrDMNbdTxKFWabgR1PoIodfHb3ua29TjA1yIc=;
        b=HWfKeTBhGwUBdLk4d5hJqKKdlnM3IPjEq287zzsRBaM/xgyc1bjUvDrtamb9nmn0eA
         kDLGF5y5zeJGfXGEwkVQ1BDQ+mqq3vYx65j1y0BFQoFbY7YXgIOOxuP1+lUdGpAib2xt
         +mwLse15E+eGmrd3O0IZUzOQzckQsPM2b5TDA0GHYUPc/Hn8F1aC1VqB0+KpeWp/bH9g
         IxxgRL1JlaUsyVMC1+1sKb4Ph2joNSSkNPKyBzJvX26gv92zE8D2l6wgTHKo6LHiSZdl
         7jewGHvi9d3LG07IOY0GayO/XHxXGXCkPsufbMR8z6xvsWYF7crV1ot557M4oM2VKVel
         3W4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584069; x=1750188869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ci55BRtrDMNbdTxKFWabgR1PoIodfHb3ua29TjA1yIc=;
        b=T+SfPrm2L2FQzYdIdOOqZiMYvTDt4VDVlYlfySaiAuNmmdOYNnP0jKRiY7UHUtMDOm
         v2dV0X/zdUdxWWXyh/obXK4LwIp9Hi6P51P6chy+xD/G8h/68dv8Al3cwrZcOdD0wZKa
         AGZykO/SXUXJMpGzCXVXb9kFfQ1hTeL5sKEfCfz+9vJLQARSKSr48x7x6oR1k/mQZyzZ
         yF3s5iT8lHP+qjzNc7c1NGdAJYskxmN6b+5EhP9oesRL7MwtBYlJEZGzx2FYvklOu8RZ
         Pi4HNHq+TPWrf+6KrAJfkappga49Wq7EYtZPd1w+RYBxiCPuyvoIU8KxVkGahlluFc9o
         9pOw==
X-Gm-Message-State: AOJu0YyMSY1FjTyHjOLpK8Rnmf6Qb0/m6e4llVWVf4RGnijWjn3URm63
	AWZkorME8WbQ+wAIR+OxAFYLCLNQ/GWsEzKIcY37uRavm3Wzl6R1c6KldJ78H1Mx84gi2s8WKTO
	XX4SI
X-Gm-Gg: ASbGncuxjuRAuOmbFP/Vp6cDLAozV6EBDxxjavv9BblqU14FNvM4R75hT29LPC6MvIB
	h6X1+epc7BiallrRE9KPJ2Zd2bqDZxIQdLrsf8VqXOWMfFP70/+fndIhs+gv0c8aUQ89f9YAWeq
	zfzz/NbONajtNqFgy/H2DdVVRcsxUZz1AV6kZBC20evAtLqin/yNRfgtyhi5ycoEo2RsAsDaV0n
	xarWkw2/X3woYg/y6GJaAxBTXK0aaABvipC0xLA2oM8xuvYam5FvfrCXvKTEwMcBa+OR5ghAQrM
	XBhCE/xChN/AsFj0DJju3MlfLd8g9mkpJq9d/nQNY4z4/nHOs3ea1g==
X-Google-Smtp-Source: AGHT+IGDwJkcwPc+k3ayVDlVAm3BfubPaMXadnWjsANHChuXTekhu0w42WeRAJh/k/N1dXwCwYYEGg==
X-Received: by 2002:a17:90b:3901:b0:311:ea13:2e6e with SMTP id 98e67ed59e1d1-313af1ddd5dmr965420a91.28.1749584069128;
        Tue, 10 Jun 2025 12:34:29 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313b10c7a88sm73897a91.33.2025.06.10.12.34.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:34:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/16] libsoup: fix CVE-2025-32052
Date: Tue, 10 Jun 2025 12:33:57 -0700
Message-ID: <9a8a5072969a326e296d840296cb475fb3c0e2ff.1749583904.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749583904.git.steve@sakoman.com>
References: <cover.1749583904.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:34:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218407

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/425

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup-3.4.4/CVE-2025-32052.patch        | 31 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32052.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32052.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32052.patch
new file mode 100644
index 0000000000..78b712070b
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32052.patch
@@ -0,0 +1,31 @@
+From 779bcb279b1dc4eb8bcb22c5e727b1174630c3fc Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Sat, 16 Nov 2024 12:07:30 -0600
+Subject: [PATCH] Fix heap buffer overflow in soup_content_sniffer_sniff
+
+Co-Author: Ar Jun <pkillarjun@protonmail.com>
+
+CVE: CVE-2025-32052
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/f182429e5b1fc034050510da20c93256c4fa9652]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/content-sniffer/soup-content-sniffer.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsoup/content-sniffer/soup-content-sniffer.c b/libsoup/content-sniffer/soup-content-sniffer.c
+index 23d5aaa..aeee2e2 100644
+--- a/libsoup/content-sniffer/soup-content-sniffer.c
++++ b/libsoup/content-sniffer/soup-content-sniffer.c
+@@ -529,7 +529,7 @@ sniff_unknown (SoupContentSniffer *sniffer, GBytes *buffer,
+ 			guint index_pattern = 0;
+ 			gboolean skip_row = FALSE;
+ 
+-			while ((index_stream < resource_length) &&
++			while ((index_stream < resource_length - 1) &&
+ 			       (index_pattern <= type_row->pattern_length)) {
+ 				/* Skip insignificant white space ("WS" in the spec) */
+ 				if (type_row->pattern[index_pattern] == ' ') {
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index ff0ae0afad..e7dccb6380 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -37,6 +37,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32907-1.patch \
            file://CVE-2025-32907-2.patch \
            file://CVE-2025-32053.patch \
+           file://CVE-2025-32052.patch \
 "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.43.0


