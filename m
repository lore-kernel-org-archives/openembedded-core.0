Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E13C7115A
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 21:20:54 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.31262.1750195245024283719
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 14:20:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DRTMrzt0;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-748a42f718aso2796988b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 14:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750195244; x=1750800044; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=htTGQvFlU7jGn9ZNY9siIe54thRdRRlsHHZAK7LJOBk=;
        b=DRTMrzt03e0s2NExXLNj45F+U/UE5QYYS3hVyJKCFXtOc5QlFHoGpkgjbwbwDOeacW
         uoA191g1wEJCxY07hrJrYlPYLHXTRVF5aYAUc3dhc/oWNsb2+UgZieU39fUi57MOfUdo
         Ef7Zan4jmMfPIv+OmlMoaORvlfdYJEYf54+qca//o/yMnkks8aq3jMHIZcG3pRRLwo6v
         7E0VqrVknf8WzZfGBwwLHXKLTu+Mos08U4RO9+fXzD+5X0jWrZKqDjjaNP3YebOvB3ei
         VqdYmhai+rNr645CRb64Zrz04SvGgjVXhziN6YCipUw4XrX4DshkGBr+5lHxvV0mQ/ui
         HivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195244; x=1750800044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=htTGQvFlU7jGn9ZNY9siIe54thRdRRlsHHZAK7LJOBk=;
        b=X088Cki5x/73rOTWFmh3lvQfWf5TAiabdjmqP46BK3c9RkLVwcGgmTZZdK6ajf09cT
         Y5Pr2wqSeEQAdHl1CcyPig8U8RNsjp4KdGVTLwo0jq6VEIJ/XkNxGm4DPgh+dpnoLxH5
         MwHbftVApX3Reg/TOd9Jw8qMVtqKKduZGXhmge7stSfSURv0Wnz3ASLmy/UYWZI37dRJ
         o+OhbZ5Cfo+USBI8XcoZEFgfVpuM16DyOCNAndnBOwgeVITojSXfm4sjL5b4B1yZDrKB
         S6pzJtvWSsNGpWAJ8ZwWqK3TvZQgJWe9SVaq+Yp2XsAG7cInYpsNzkl5peJjS3mp+fpE
         1UPw==
X-Gm-Message-State: AOJu0YzyTlu12WI/uqWicBCjV8igNrKD3mIbXT6/wacS+FgN2tGs7/UM
	TIZJnfiWoLEZ/+NDlNo/BNOKkc6j+kwIxIndJFMHg/q+s36HBcaHXm1n0Blrr3bZTG16mXDFVGt
	9KiDw
X-Gm-Gg: ASbGncugIkYQMMvaG5NBbhvIYpn4myeiQvZFsEfuRQBENn94JGviqEdHJau2sFQ8n+6
	8/AOuFT7wKl6ssbRZI0CxqAC5HoVwBVhjXGzmrXZNdykUGzIIQkJG5aZKMqPq5h24lmy0jTsrGw
	K1gp8sNxm3LcvqYHqklo7Fa4PJwp/BnhdiL8ktMjUI6bDofagSxInUBqnywe15jcuBzCG6+c+A7
	qVJAOqeZ8LEqKFV1yjr8GLJUMA+aejEbBxmHwkRbVl+JTp8CDGS8nRO0pG0Q0tUvlQ2PV+aQYDY
	X+mPmt7gh43Ps+5XAe9xiXn96N4hBl6G5JC8XhQp57SarRNEh0hLZvTn/nMWdpPc
X-Google-Smtp-Source: AGHT+IGMgZ1B1SKy89VcPBscvA5uEXkBCCu+vMdSTh5zfil+6f1WefZZk14W5cqFpXKqO1OoZY3zNg==
X-Received: by 2002:a05:6a00:3990:b0:746:26fe:8cdf with SMTP id d2e1a72fcca58-7489cf72666mr20806273b3a.7.1750195244137;
        Tue, 17 Jun 2025 14:20:44 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffeccf1sm9720728b3a.18.2025.06.17.14.20.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 14:20:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/27] libsoup: Fix CVE-2025-32050
Date: Tue, 17 Jun 2025 14:20:04 -0700
Message-ID: <f4866635b88b24d5891f83e23c9cc3fc21876b52.1750195103.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750195103.git.steve@sakoman.com>
References: <cover.1750195103.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 21:20:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218924

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.gnome.org/GNOME/libsoup/-/commit/9bb0a55de55c6940ced811a64fbca82fe93a9323]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup/CVE-2025-32050.patch      | 28 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32050.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32050.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-32050.patch
new file mode 100644
index 0000000000..474eb465a6
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-32050.patch
@@ -0,0 +1,28 @@
+From 9bb0a55de55c6940ced811a64fbca82fe93a9323 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Mon, 28 Oct 2024 12:29:48 -0500
+Subject: [PATCH] Fix using int instead of size_t for strcspn return
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/9bb0a55de55c6940ced811a64fbca82fe93a9323]
+CVE: CVE-2025-32050
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/soup-headers.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
+index 613e1905..a5f7a7f6 100644
+--- a/libsoup/soup-headers.c
++++ b/libsoup/soup-headers.c
+@@ -907,7 +907,7 @@ append_param_quoted (GString    *string,
+ 		     const char *name,
+ 		     const char *value)
+ {
+-	int len;
++	gsize len;
+ 
+ 	g_string_append (string, name);
+ 	g_string_append (string, "=\"");
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
index 74110b21c3..27aab1468f 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -32,6 +32,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32914.patch \
            file://CVE-2025-2784-1.patch \
            file://CVE-2025-2784-2.patch \
+           file://CVE-2025-32050.patch \
           "
 SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
-- 
2.43.0


