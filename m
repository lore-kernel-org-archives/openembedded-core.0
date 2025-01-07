Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4967DE7719B
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 13:31:38 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.20203.1736256693403205170
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 05:31:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=S/Ptha/v;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2166022c5caso201112935ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 05:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736256693; x=1736861493; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66XfwDJcWjfTZ2e1e4Znn6ZZ63vU79SlJRoY1h3FkOY=;
        b=S/Ptha/v0F+BsUiYZf40MdRt7lTBtNrBj2J+F8YKmuiTu7vhqX3QBLX2W8IvNWKnVn
         t5LzyvArtjSOdZWtUrYrP0KhGkKJ+5rDdgbM4/EA3izlmb/zk5CE0SjgjrIg3GRsnmAv
         VYWeKc4vby3k+BuVKL5jR7EEubHvN3YrNGewJUL3pJqn9RyJn+ZvGBscKWhM5zkuCrkb
         EzzmpPPPz5nMPwerOKDZ7W8jE8TcvAxuvVdLHfP9HilHIK8+sjEUnbxGVTnsGO4EUVCD
         pZ2MMlPmEj4We7WydPMXo0aWSaxpg9m97+BpAdz/G7yubn7N880kVwxL96+kJ33ThZfI
         jZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736256693; x=1736861493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=66XfwDJcWjfTZ2e1e4Znn6ZZ63vU79SlJRoY1h3FkOY=;
        b=QLGdJBQexnM+oDcqFJIk2JUnhNKTbKDGuNMsfC2pSPfy2fN+XRBwAojksCUgTPjBcW
         BgNOdsCHd0SSndb09dhkaNEYzLpaCLwTCvXlnYfJL2to9n4uzVN1HfPPeB7nDh2667qi
         p52F+q5MdFWWbrbllJNOAerYFaEfMPImza9KbGqH15/88oGjNEQXJa+wzr298+Rw90zF
         a5k//JcsocH69JonY7eCCH0XkOyrja3juZSZRgY4Gsy5MPtiYfbMzfsMb5vbKNx+bF/N
         zyZ3FidrDHhQ3MaQlqU3ZAnO8QGFMARzYCT5/8vw5iCff5QyEUnTHh9Ho0n8skQmxJ1Q
         3QZQ==
X-Gm-Message-State: AOJu0YyLON1I/iSzq5QCAl/YFy0e9CPUOjNxU+gXARmxGy+/gbzzbniW
	1c/6ZkdSc45YO70/gntAZVX3fabFO4ftjCrCNg3qBhAayztuxLjpttYxAGOFg214Y+rQxGlmVPb
	C
X-Gm-Gg: ASbGncsABM6f92XHJ7OK7dLSRbWs1Nm0S8F101mYt+o6n7ftAeLE/8Ef6w2T4o53mP0
	4YBX35oarmWUDtZltRMFyz774blWy17brLk1IH5u3d+dfgqK8hcdO249l2u3afp02JowIfDytQS
	OvnHHBCqZ3MLeYOefJdTPYBj0f/Wf9NajIwPSPJYwWIaaZb7xRAglHedKMN6+Q+WQP+WStDZ769
	Kvf8GviLmkGMb49QIrKsfYQvRRwurb65aEr8NqEb2x77A==
X-Google-Smtp-Source: AGHT+IEmjtiKO5j/gCemjXW8P0uuA4L1Y5k5OUaBPGoSBNhtzeARc7Plm3AJgHjk60MiZEO+L1fVPw==
X-Received: by 2002:a05:6a20:e68b:b0:1d9:2b51:3ccd with SMTP id adf61e73a8af0-1e5e044536fmr98386053637.7.1736256692746;
        Tue, 07 Jan 2025 05:31:32 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbae4sm33340197b3a.96.2025.01.07.05.31.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 05:31:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/13] gstreame1.0: ignore CVEs from gstreamer1.0-plugins-bad
Date: Tue,  7 Jan 2025 05:31:09 -0800
Message-ID: <a2339d124c2561bf157f3e14af0b3152d257d937.1736256495.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736256495.git.steve@sakoman.com>
References: <cover.1736256495.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 13:31:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209458

From: Peter Marko <peter.marko@siemens.com>

These CVEs are patched in gstreamer1.0-plugins-bad.
CPE for gstreamer-plugins-bad mostly hits original gstreamer recipe.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
index 2c9c6944b0..cf81620833 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
@@ -69,7 +69,7 @@ FILES:${PN}-dbg += "${datadir}/gdb ${datadir}/gstreamer-1.0/gdb"
 
 CVE_PRODUCT = "gstreamer"
 
-# this CVE is patched in gstreamer1.0-plugins-bad
-CVE_CHECK_IGNORE += "CVE-2024-0444"
+# these CVEs are patched in gstreamer1.0-plugins-bad
+CVE_CHECK_IGNORE += "CVE-2023-40474 CVE-2023-40475 CVE-2023-40476 CVE-2023-44429 CVE-2023-44446 CVE-2023-50186 CVE-2024-0444"
 
 PTEST_BUILD_HOST_FILES = ""
-- 
2.43.0


