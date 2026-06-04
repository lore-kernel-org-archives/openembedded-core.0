Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C94CD6E6E
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 11:06:02 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8732.1780571153200963334
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2026 04:05:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kxf9Kyzk;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45ef6565cfdso318802f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 04:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780571151; x=1781175951; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dIi7C9tLnl1f74WRAkxZLbWXkbA32oZRWHcvotO1R4=;
        b=kxf9KyzkXPX+8Pgnv/QfG1dggBI6zboYUURV1/gWPphgir2Sh+Co8cXOe/ru1f2PjY
         kTBmSlWDzoeuZd0T+bYEYCEE5od1/pZJ07lCNdioAZkU8RfZnrlc74DOhB3NMoDQibzf
         4lsFnpzr/tpBzEtDH3VnfvB0c+JlFCeTGOVBzWkFGfvn5OS/45fsE/JH4N70v2GzmBwh
         yMiKHZy1Zp6YapWrHEHj1orcUNFRSDSBYQ3ZgnfmVp0Vhyqt/pRGLrNW9LKvptfrYVFR
         DfPbs4Oc28cB0rILDy9BDO0nnvP8CYELhu78MJjd8fYMs9VrUzbSBrRMNkJxmC1nSweH
         cJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780571151; x=1781175951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4dIi7C9tLnl1f74WRAkxZLbWXkbA32oZRWHcvotO1R4=;
        b=d0qCQhjKQ+JcObYFrCsNV5kq699Y6Njt7SzW0mo5ZP+3SNsKUtYZFUbxDlfCz85Baf
         W8Ivuk8BnCpDP9K20vM2vKWbYMBFF9J5hfWZkw2kySCKaDAlOIiHbEOyIfqBmjc0xz6s
         DKadvS56Rmajd20KoZjdnj4i+uz6OpTA3A5U85azB+o5Ik70HeIyloVA0vLY0LGeo6MX
         sdmHWx8sJugrwRXDUfuQc8zTOSY159nZdJJ1M+ppNqfvaSyaHE8NXl4yATARqZckMw97
         HZuK/m9sDtOZ3+hxkTW6A0w90wiYgxbWoH60BCHgNYMNEazNKqlxArTNB8rlZWLpMvY3
         xVag==
X-Gm-Message-State: AOJu0Ywo+wxqfaEuENvOfmwOBFP9/KEVqo0WWcO2+iu1c9I5mAM6prb0
	ScJX6+hYZx12Wi6J8c35xlqcaQRc4OP+IeIDNlKRugBuvWC3n6fFLVstncQaeA==
X-Gm-Gg: Acq92OH3Ik+WPERtM4+GPNI92EDvyYbXNq65+Y9zv8ZN43j3Cmu1Yo8eeq8oh4oyWjG
	RO9lT8HRBWF/Yk8DU6cI1Fm3RPKecxC3isPCdbMix2bcrnVtRl9Q7ZcM8wJpq5/bSxneSIogWX4
	KiA3DNTZtYWfGn44i8dDd8z7/Q4f7ToOddLNUvfj5ATjDjGbwTNWyo1XEr8pfAMILSP/TrYgeBK
	9+Ps9s+05UBhuS/WJZ1VpNeyhYjiEHoz1hjcnMvbGf9zpXx3nWbAO86jzHlC5gsSkQYMr0LjtgK
	0wY163oQgqu0TVVJROiCyYshK25SVGUwhoorqNRE13U70/AojJnCqD4fA6o8lWe9yDCbq+WDwLN
	eJ/6FL8TirJvBO53DDcJ9wB0XvvfnTIeh0r/JP5CQIhaKXxWZgTgYb2bFtSiHCtsily8kEgqFx3
	7ZDTxWGq9ooK3yrA7KBshjIj0M1ToswRtSo7NFz4QoFOTbIDOlKEXvMXVSLdNhc0+bPmYmmA==
X-Received: by 2002:a05:6000:4188:b0:43d:6244:f8b with SMTP id ffacd0b85a97d-460217b976emr7607877f8f.13.1780571151551;
        Thu, 04 Jun 2026 04:05:51 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f368e9fsm14946005f8f.37.2026.06.04.04.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 04:05:51 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/4] templates/default: adjust instructions for qemu UI frontends
Date: Thu,  4 Jun 2026 13:05:35 +0200
Message-ID: <20260604110545.1860309-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260604110545.1860309-1-alex.kanavin@gmail.com>
References: <20260604110545.1860309-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 11:06:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238126

From: Alexander Kanavin <alex@linutronix.de>

Mention that SDL needs to be enabled separately.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/templates/default/local.conf.sample | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/conf/templates/default/local.conf.sample b/meta/conf/templates/default/local.conf.sample
index 2a0eea493c..8e7fb6c938 100644
--- a/meta/conf/templates/default/local.conf.sample
+++ b/meta/conf/templates/default/local.conf.sample
@@ -218,8 +218,12 @@ BB_DISKMON_DIRS ??= "\
 #
 # Qemu configuration
 #
-# By default native qemu will build with a builtin VNC server and a SDL UI frontend
-# where graphical output can be seen.
+# By default native qemu will build with a builtin VNC server providing a way
+# to see graphical output with a VNC client.
+
+# You can also enable the SDL UI frontend, which opens a graphical windows
+# directly into X11 display, if that is available on the build machine.
+#PACKAGECONFIG:append:pn-qemu-system-native = " sdl"
 # By default libsdl2-native will be built, if you want to use your host's libSDL instead of 
 # the minimal libsdl built by libsdl2-native then uncomment the ASSUME_PROVIDED line below.
 #ASSUME_PROVIDED += "libsdl2-native"
-- 
2.47.3


