Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3880C677C4
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 19:34:29 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.96404.1749584067372398820
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 12:34:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OkaPUBrp;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b2c4476d381so194486a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749584066; x=1750188866; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6mYBC/Uk6DlYBTpt3YTyEg4Bgp6I1qLpEy4190Yp77M=;
        b=OkaPUBrp9VWxA8DDcZY/8IoJOc8wZ1n8dWjMwsKQb64arPexVVZA+mp60WGFsEbsjq
         S7A7hdHZhLSBAti+LvwENb2AVcyR8tnVeAUFQreiQVwE479FeJziFhAE2ziIngOYNiq5
         bBywX2+RWhP9+9/JpIA48weMoME2tohMBIxIDZb348XQhFPp3VqGZhxIZi8OyBSaXeWe
         kKFYf9RtVPpogIH2BSxzJrokykPqJBa/UClA2BOyNOsNv4owuOYbmHALrNchof9HchXV
         G0pK7arzeX/xRrQ7/gPUOascixhpFYto4/RJSu/CDNFt+edH/KdlXKzcDMTXz5HAGlFE
         xBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584066; x=1750188866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6mYBC/Uk6DlYBTpt3YTyEg4Bgp6I1qLpEy4190Yp77M=;
        b=FpsrC98wMwDshh0XkLdcAO/DAn8Yk7qgh4Tzs/1YTrvsFCvrk7w6ZBB9y0aJ2O9Y7X
         VVnTqhDHfzvLXJ03pdrk8e2wvmXeCSRUDlkLRVFqUrgmZlxvYU7UrXdppbD61GWc0GST
         +FfTq7qfMBlNZfSFWcGJo8QJN8tmumKiOTbTZBno+b6hstOhIyzgsRZ4ICo+iYV+rLBE
         wRiEY2Zu/onkTXiZUXDAFRFo89ZMEjjbNBIsmxIPJDhUBEGbqjHwclR8PS0Bfa43mJRt
         NGfZromt4SnxSYSnEpvfhRFBlM+b3A/igLTKOK0GuJgp455rh2kJL9I8qGDnHlZ69tzb
         iOAw==
X-Gm-Message-State: AOJu0Yx47QHYeMBl9Vor+kVuDUk3d96ByWEiHildXT1dca0dEYiW86TQ
	kWskmbilchFdKXHero9dup2FIJqvrXzpZYjkEHuY/oioi48ofneDSt7g6BQXLym+lJ5V2sLASaJ
	ZIVgU
X-Gm-Gg: ASbGnctN0lLQMhCBNzmL0HOQpO23DqUSMSuiCvhw51iObUQsM6KY/cUAtkbcMzILuO9
	vVsBSjo2JwaFY/h9HukTwjnlOr/psePVz4OgGZLCBXsxwSO65RbYFwXiRUBrv7+PgjLTA8Gc00j
	XxXtRGnNaJjk0wYpQ0DQRkAl0/c2G+PceRHfz7SGY0RTHf5dpSsSD7wIqWQqXo0h25HVRyLpBCE
	XiVv9vg+IdNe681K9wWdO9vYHxuONrOeVCOWQLGn1NZdKYnWh7tkBVJYkZVxD0SACVfRmAR/WYo
	kuhsbMAhMQLHo6pmBgRweS8/dSaRz2cOChnqwXY0ZTucPYXy63buig==
X-Google-Smtp-Source: AGHT+IFstF2hrAxSpKwccqb4oOo5Ay9QxtzOPkcmdCE8a4FWTqMMnjhVw3h8yKi8ggpICkuaU4MwNQ==
X-Received: by 2002:a17:90b:5103:b0:30e:e9f1:8447 with SMTP id 98e67ed59e1d1-313af812af2mr765827a91.4.1749584066322;
        Tue, 10 Jun 2025 12:34:26 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313b10c7a88sm73897a91.33.2025.06.10.12.34.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:34:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/16] libsoup-2.4: fix CVE-2025-32052
Date: Tue, 10 Jun 2025 12:33:56 -0700
Message-ID: <f3890f25cc036fd184578d7b85e6410ee97dc3ad.1749583904.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749583904.git.steve@sakoman.com>
References: <cover.1749583904.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:34:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218406

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/425

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-32052.patch  | 32 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052.patch
new file mode 100644
index 0000000000..34bc8113a4
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052.patch
@@ -0,0 +1,32 @@
+From f4a67a9a3033586edaee715d40d5992e02d32893 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Sat, 16 Nov 2024 12:07:30 -0600
+Subject: [PATCH] Fix heap buffer overflow in soup_content_sniffer_sniff
+
+Co-Author: Ar Jun <pkillarjun@protonmail.com>
+
+CVE: CVE-2025-32052
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/commit/f182429e5b1fc034050510da20c93256c4fa9652#500da7cfde649872c49169be34b03a1c42a53ddb]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-content-sniffer.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-content-sniffer.c b/libsoup/soup-content-sniffer.c
+index 9554636..eac9e7b 100644
+--- a/libsoup/soup-content-sniffer.c
++++ b/libsoup/soup-content-sniffer.c
+@@ -504,7 +504,7 @@ sniff_unknown (SoupContentSniffer *sniffer, SoupBuffer *buffer,
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
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 9a2778bf92..96bb53a033 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -34,6 +34,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-4969.patch \
            file://CVE-2025-32907.patch \
            file://CVE-2025-32053.patch \
+           file://CVE-2025-32052.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.43.0


