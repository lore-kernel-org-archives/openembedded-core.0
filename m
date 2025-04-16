Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A1EC369B1
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 05:13:41 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.12370.1744780412503236089
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 22:13:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=XXvnjfNr;
 spf=pass (domain: mvista.com, ip: 209.85.215.180, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-af908bb32fdso300819a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 22:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1744780411; x=1745385211; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JgZzUlbfjgXZ1QwLW7Puql2/KzFt/e7maHjYeDDsSWI=;
        b=XXvnjfNr2SScTvDQDskzl0AnPEATgakOIvYaX+u6p6SSsX1//NuazzOCzW2sYmsb66
         arBK226AkSwJ2QxBTzcZ4qsFSanG1ZmWSZKssQogWMwaDQlTnxyBnFnMQ0MfG8LR/nQV
         9+TjCOK02wRE+bKfNjyKZMnGwWbh+FKIZGT+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744780411; x=1745385211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JgZzUlbfjgXZ1QwLW7Puql2/KzFt/e7maHjYeDDsSWI=;
        b=eawBMqBN4ItjNlSxov0+/muE+PfSxjF8VE8o8X+TW02g1wi9nrqTSGENLA2Nluy0eQ
         Gj7xNjUG0xbq6LwhjjJA/NQOrx1Mc2g+SUJu3F7k7edpsqkN0ENrRJYlX/C+TrAb+2qo
         jn/iIAk1ErWsjhorgTQdiN3eIbyBsq5er02Oj4Fsnd1Sf9zeeV5ZVLtMVa2Zos0MWtzA
         SiefSTSPyoXgh6UyV2XEcP6plqXhh3P3j/9850yUYu9Uuu1J/koK0xyR60TSXOUmvXw+
         3Yv3DBz1ZbLsN1bG6FcfUy/KfcbpwWVazI2aqOvPDsfM1JEeC0UWyTdWo5IPsncGI6Y/
         zDiw==
X-Gm-Message-State: AOJu0YwEsmkxMbSsSmsK4Msw3EThOkBMFa8XQsvMrlUpaBCq3Aaz/z/m
	AK3ApI1FPKZeCirvGR1enQjS0IFyAMHIKR+aK0oYbOFJkXlN0ZUyvDqSbU1NHFZJkYnqK2qSt6Q
	DUHo=
X-Gm-Gg: ASbGnctP0I7ADU46c+4le9MvrU+8jlpDkKT18occpvMyZaMpMxOd/w5ryR8gtfaeg9g
	8riSq/tNQzR7/g/23fMHOnhNpMuLOQ5hLwjQbQSRQXvRbuCC6SfZMvYtsFX4zBiaWIOMgiq6r5I
	XMO7lVwMHz5xd7350SlwtNHfx6G8HbiOqw/LrhwvKEfz8RqkMXj39E/GaiLSOTYA9MPsYSfPzXM
	sqV2+kv91S6Uu2ouY6DpTx9t7zUFFQm5Oakb9GjoPYUW3HFjaEu5dCNzSIQ0mrK9V7l8UtdjvOm
	3p3SOsKnsufqkDzZrlFAzQLsS9u5P06zCYefHHnNRuC5HslpsvA=
X-Google-Smtp-Source: AGHT+IFGQPgdCGJ4WTpgB4luklSIr48zAeR90HzO0tGsW/KklDDkIzgUFfYuar+QhQ05iTOELX6cmQ==
X-Received: by 2002:a17:90b:2247:b0:2e2:c2b0:d03e with SMTP id 98e67ed59e1d1-30864293690mr486157a91.5.1744780411391;
        Tue, 15 Apr 2025 22:13:31 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.229.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3086122a8absm582419a91.35.2025.04.15.22.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 22:13:30 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH 2/5] libsoup: Fix CVE-2025-32909
Date: Wed, 16 Apr 2025 10:43:11 +0530
Message-Id: <20250416051314.96105-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250416051314.96105-1-vanusuri@mvista.com>
References: <20250416051314.96105-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 05:13:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214975

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libsoup/-/commit/ba4c3a6f988beff59e45801ab36067293d24ce92

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libsoup-3.4.4/CVE-2025-32909.patch        | 36 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32909.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32909.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32909.patch
new file mode 100644
index 0000000000..8982da58f1
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32909.patch
@@ -0,0 +1,36 @@
+From ba4c3a6f988beff59e45801ab36067293d24ce92 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Wed, 8 Jan 2025 16:30:17 -0600
+Subject: [PATCH] content-sniffer: Handle sniffing resource shorter than 4
+ bytes
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/ba4c3a6f988beff59e45801ab36067293d24ce92]
+CVE: CVE-2025-32909
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/content-sniffer/soup-content-sniffer.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/content-sniffer/soup-content-sniffer.c b/libsoup/content-sniffer/soup-content-sniffer.c
+index 5a181ff1..aeee2e25 100644
+--- a/libsoup/content-sniffer/soup-content-sniffer.c
++++ b/libsoup/content-sniffer/soup-content-sniffer.c
+@@ -243,9 +243,14 @@ sniff_mp4 (SoupContentSniffer *sniffer, GBytes *buffer)
+ 	gsize resource_length;
+ 	const char *resource = g_bytes_get_data (buffer, &resource_length);
+ 	resource_length = MIN (512, resource_length);
+-	guint32 box_size = *((guint32*)resource);
++	guint32 box_size;
+ 	guint i;
+ 
++        if (resource_length < sizeof (guint32))
++                return FALSE;
++
++	box_size = *((guint32*)resource);
++
+ #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
+ 	box_size = ((box_size >> 24) |
+ 		    ((box_size << 8) & 0x00FF0000) |
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index 757e6432f7..ec3305aed7 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2024-52531-2.patch \
            file://CVE-2024-52531-3.patch \
            file://CVE-2025-32910.patch \
+           file://CVE-2025-32909.patch \
           "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.25.1


