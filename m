Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B7AAC71130
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 16:09:08 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.90690.1749571746885517210
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 09:09:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UpoW815V;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-234d366e5f2so64113085ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749571746; x=1750176546; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZhGpOEANpZY7FaxtTRGhC2TJyjo5+qLnETjwYG9Sxu4=;
        b=UpoW815VZgCNbnrgLByGZo0hNQqRz0/Pus446tdrFF7/AoPyaKfcPw+j0uMmNf+il6
         3fAcuvTihkrHZOYFFAQJNx13ukI2Ze5+w+mlfNWwFKAeJ7iQEWY0FR8YhI7jdQritkzJ
         YbgvgL1htyHw1t34pXL2N8loeke0CeBO7m4BvHqILvszZEMRaWeXYBZI53WZP2JtadeI
         Ctf5efBb3n6cXWQI/xiwN3GZTULoUzsVq6kTmXl/5d1jca7OJzl7vnkT9Z9N8USHkG+A
         6PjQhtZX/j4dFxpZKEvgubnohmKqcKhFRNHYQ3hzsz5+LWW42qslonY7R+GIxhsAfjLd
         cZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571746; x=1750176546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZhGpOEANpZY7FaxtTRGhC2TJyjo5+qLnETjwYG9Sxu4=;
        b=SxtIIsW1SRWfj3r3lgjCclAVAIf7KymgjEz8VeKlBc2YCndYhq7phf2JbhG6Osenu5
         VRleIjat7O30Y/C0i+JDFkbwSNfOeygko3jciV7/lZsopoMK3YXcTF69cWELC1f0us0A
         3UjO8bXkpLbvIKwxp03Ahqq7DCjZK09DP6v3efncrQEn+yAWYr9V5PRSfJ1MkojQuyyw
         Z2pjPMAWgSMNJecJs2iqutqvIl7eIAheekHTCbQ0Cv9F9Ko3EcRbggZhmKOGaFFdfQQ1
         0JSQPyjyhEs9t8P/PboKMIrwThPBsvVQ55rUt0wF4H3MFl7OGNyNUjws5D758ISFPNzo
         rNVA==
X-Gm-Message-State: AOJu0YwtUBbqZumGsg8PfY/VpuRm493SdzT+/Q9eAZxXErTubY2a3/Rs
	65BuTA8J4U+2uf7UiLjgVl6JTQbN/jfrTCQEzxUaXRLvbH63mK8RdmoIThBg55IMsU08iSyHijr
	zLBqn
X-Gm-Gg: ASbGnctYGOTDMi5QXhM67NwcmCUiAqu+CU9u8yZu0RqN1shpOqIZSlXxbmIBejej4lD
	c7QtC4tkIfTKJ4PwrlY1mvTD4WFykX3cUZRpk6hXtCeM6iPtxf0/kW1wzmqfnK63vjIAaUVSB1l
	KgjNyfTg4RoftUHlh0V5EgUDAmYytxh59IhfZFQ032BK0O9t8jEINmp5CqVOvpNVdz+b6zvn1rI
	4ddA+TEA7n2D1ssV0vlgx9xDdMZoqEnfkUD7myB7L0Ndk1CAgej6HZibrqkJ8d9tAXBbTWjyDhZ
	KN28JjuS1NMS4Ne8PFeJSWcJjQapNbaNXip6bGoEzLjC4F7Vj0/gfA==
X-Google-Smtp-Source: AGHT+IEq83qteaTIq0RlXG8JI7BPUmbQ0uXoKweQagFWgkXl66ERW3XcreQmY0gzL50BfrxrlEdYnA==
X-Received: by 2002:a17:902:dace:b0:234:8ec1:4aea with SMTP id d9443c01a7336-23601deb4bemr251013855ad.52.1749571746105;
        Tue, 10 Jun 2025 09:09:06 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056e7sm72597295ad.166.2025.06.10.09.09.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:09:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 10/32] libsoup-2.4: fix CVE-2025-32052
Date: Tue, 10 Jun 2025 09:08:23 -0700
Message-ID: <ea01c691da88233ae8c767b59b9a7196351489fc.1749571556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749571556.git.steve@sakoman.com>
References: <cover.1749571556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 16:09:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218379

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
index 4ddcd1734d..01ca9f8966 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -25,6 +25,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-46420.patch \
            file://CVE-2025-46421.patch \
            file://CVE-2025-32050.patch \
+           file://CVE-2025-32052.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.43.0


