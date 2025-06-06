Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E429C67861
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 16:00:33 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.37122.1749225625441571443
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 09:00:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=M+qzWfIs;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7482377b086so938583b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 09:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749225625; x=1749830425; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ca0unAOWx8xGfBB7MNiRO95NUg7tcM3iywEsk9r8mbc=;
        b=M+qzWfIsZb15s8G4hkN9rYnaIfFD+pVK49QCOYvKBO1N7Jrug//oPPnxFQswNvDcJZ
         uyn/it2LfrPobQhAVuXz9XrYPX6piCdH1RJO07/LdKB3VFsGDldpbltTHI0abg8D8QY+
         Dxm1Bp6nRbSkoB9yijeq+yL9XKBxCVjaXFUChswCPZ5+fxB68z0bi9z9AwUIUlwKG6B6
         ZMS90GOkgiEb98uvIbB/ptRXJeYb1c3xpyQvFSosb9wsSQpaX30ZxIBRYOSg9MDFtScB
         45yb1T1or0CExQjT0EG5ovP7FPc71Qj2N+Lp/kKQw9sCpsEmlouQ7FlWLXmTzO82DCCT
         mtQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749225625; x=1749830425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ca0unAOWx8xGfBB7MNiRO95NUg7tcM3iywEsk9r8mbc=;
        b=uTMDa7ZHXvz83oGPvTVQoYrhxWNZI1msW9DrMltWu6scs2S8wwu/7sr4bHT/pxLmmj
         9Vh9rJnmDciFgAcc0p/sDiAv2/p2qrIJlzjoLey4K/d5beA6Eunz0dduR+gnOMOcerVl
         lK8HccAz3D0lptABYlqzqDnFWLDMxJXj9oyaAYzE7DHD2VMARuhy1XJv8N/7IKh21tz7
         WjmdCG+qCd6jxYfq55y8g2vb+hxgfjXy5nWn9y0Bq6YiMqRSq3aoqO054hHuADWIdhp3
         RAWKsxGHf6Tk0IsDNgzxihvAIkSompMyV1QSvfEpynLqgz0lUxJlTfZPYgIek973sx0F
         3pzw==
X-Gm-Message-State: AOJu0Yw2nq7SXXZJsXsZDtC+z9bP2JWtHO1TSRCd9sxOgZzRklgtrPHA
	XVcTLGZ+QAtF74TyiPPyCGeqNyeFC35DxQzw+fHVJ01HbAvqEX43o1101jYEXvNS1mO8qrcSnpV
	gTll8
X-Gm-Gg: ASbGnctmIPZH1BmJMhzchuOh+EIHJutL2bnp3nLQ1zIIicIEJXkrOiJ9nvaj2lfF7tp
	ke2jbmod6dTGMGYYecQfPjX2iOVd98ZzcwoFlfN8kpQ95BC98L2r/jZu7GA7A38sS6IT/T/MBJy
	wVvSksSxc8QMMP34TIg0iEDjOY9mSQKflH83AA97waHXmj8pBmF4FY+YrhzbSaeaTLJxgV2RFD+
	yWZBvJxylnT9B68FrWd2wDXNQRMpRYI6BFUMqo0uVFxq5dN49sYWB+T1TvPkOvp3+ddluw2nSTA
	wiQZpr2IGdFWJRYIEfDqjgH4bkkhusrUNviP7MI/Iq5k4uFI4AIJkA==
X-Google-Smtp-Source: AGHT+IE+2EESbbuUahVbGd8LYUkdrZwVzfgPYbBu4HUsf99HFtdTBq4JiuSLnBsXKslmtRO6vLo+gQ==
X-Received: by 2002:a05:6a00:4b01:b0:740:6f69:f52a with SMTP id d2e1a72fcca58-74827cfcc92mr5909087b3a.0.1749225624430;
        Fri, 06 Jun 2025 09:00:24 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:742a:4153:2a1f:f028])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b083a9bsm1436489b3a.77.2025.06.06.09.00.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 09:00:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/12] libsoup-2.4: fix CVE-2025-32053
Date: Fri,  6 Jun 2025 08:59:58 -0700
Message-ID: <d6fba14b2e98928bbf2736494e571389892da6b4.1749225418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749225417.git.steve@sakoman.com>
References: <cover.1749225417.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 16:00:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218167

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/426

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-32053.patch  | 39 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch
new file mode 100644
index 0000000000..0d829d6200
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch
@@ -0,0 +1,39 @@
+From d9bcffd6cd5e8ec32889a594f7348d67a5101b3a Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 12 May 2025 13:58:42 +0800
+Subject: [PATCH] Fix heap buffer overflow in
+ soup-content-sniffer.c:sniff_feed_or_html()
+
+CVE: CVE-2025-32053
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/eaed42ca8d40cd9ab63764e3d63641180505f40a]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-content-sniffer.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libsoup/soup-content-sniffer.c b/libsoup/soup-content-sniffer.c
+index 967ec61..5f2896e 100644
+--- a/libsoup/soup-content-sniffer.c
++++ b/libsoup/soup-content-sniffer.c
+@@ -620,7 +620,7 @@ skip_insignificant_space (const char *resource, int *pos, int resource_length)
+ 	       (resource[*pos] == '\x0D')) {
+ 		*pos = *pos + 1;
+ 
+-		if (*pos > resource_length)
++		if (*pos >= resource_length)
+ 			return TRUE;
+ 	}
+ 
+@@ -682,7 +682,7 @@ sniff_feed_or_html (SoupContentSniffer *sniffer, SoupBuffer *buffer)
+ 		do {
+ 			pos++;
+ 
+-			if (pos > resource_length)
++			if ((pos + 1) > resource_length)
+ 				goto text_html;
+ 		} while (resource[pos] != '>');
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index c20069edef..9a2778bf92 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -33,6 +33,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32914.patch \
            file://CVE-2025-4969.patch \
            file://CVE-2025-32907.patch \
+           file://CVE-2025-32053.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.43.0


