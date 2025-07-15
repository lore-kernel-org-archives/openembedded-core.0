Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D102C83F17
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 20:36:40 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.5350.1752611799860761301
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 13:36:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0bmnlQIn;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2353a2bc210so59690575ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 13:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752611799; x=1753216599; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QuTCIPuwEjoOy/O8RU9MCwN6D60LMo/PXpBACgjBMkY=;
        b=0bmnlQIndUz8uPP3xU9hue4nJ/fT6C+K5xSI/p/as+s9X0DzgVkuZzAd6xzbJd7riz
         XqiMzoqvdPLQ+q45lzG+Q8bjxdD/q5V5GLnJ1AF7TvrRcMq0WICwywX7o4gRZISDBzdr
         KoGpXC97Ixdzopusdx2V4EhAnp9u2fLmxsq+Z/mCXz5sQ6SCbrRzRHo/WhVXCLj+nSps
         hfFjgBElZTx6NC6LfFZftByNthvuFcXSx7BpO/iRyu7MvLvdmVp4fGMCzCRKL5raFA8Q
         oTnWmK8w7chNZbhrdC3HLJWsMoe77vYAYUu9bUDE9Md5dhFKObLY007ddx+6eUx5DdCp
         1VaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752611799; x=1753216599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QuTCIPuwEjoOy/O8RU9MCwN6D60LMo/PXpBACgjBMkY=;
        b=rH/OGzbkULMFJdU4eSJiixAPw8kQ1sufZaPe5djWyNLMvmqgI4WePDp1G+gzdoMWRe
         MpzITx9F05mIrTotw+FuVDqEYd3yE81SCLfQTZzu84O6W3JTFJWeB5BNm7lz5RCD5cSa
         Jrc1CZ/1ytTrJ2j8HufwwyizsSagPyU5b/+aWIpC7B27QkZeJEHaOEYQUBgGzf4qQSnQ
         6IcGh3gqF1qUcvsRfp7ktdzLvmBwhGvGPfg8UddH0nwQ+7FfDIH6J1uDN6qG8rELxk7F
         aIOXEbrlMyFS/TrNUD5h8T62RboslNU/QrH3o8ejR8tZbD6XmzlVcj8JlgzB9Nn3Dfz+
         nDbA==
X-Gm-Message-State: AOJu0YyW0/CJCosa05xeJg2zWOBFLuqomwT4Ect/25Mtoazd6vFDQVTi
	9HzuJxlYMHGyFVhbyEgYwx2cB6Ig3y+kV8Xq5l+x0ZLO0To+XMAn2xbprl1lnHSrszVgf1NucYd
	Sp9cO
X-Gm-Gg: ASbGncug1rWVHFeYZ05V06+fwQGv54tu9YUOCDxNyhINOF13E/Zd1UMpc16L/BgLYKc
	6yFvZ4A6IY95L+DUr7V/0PhQSOJ2oTwTZpfcykAntaNTsaMYZX6BSfWlPLjZuUYzhJulOoWNiOu
	bV4yHwpHbvf24qCMTYZPA+drC2R6WGiRx0A9sfdNnzgKng441SP7zK1rNR6EegA1lTMFVt9Tm/A
	iOusZCFCrQf5BK8PllWOhIA51IZSQgBnhZ+34Q0q1aDQcEMgbM2+AvTEXZhNk5t003RGPdBsNUW
	tzJyEHSdZI0g+v8MKzue5g8MnBuzVrZEblNdi1vCYDluJjqlOcQlNAi+M4pSPX2IXqJPdCfOqEL
	xS+mSqBpXsrMY+g==
X-Google-Smtp-Source: AGHT+IHt/a5MzzvMJyQxunbU/Re2sQCU07iV+GBzwOH9kBbp3rhetJSqs04I8G0Ly/o8gLD112U4Yg==
X-Received: by 2002:a17:903:2446:b0:234:aa9a:9e0f with SMTP id d9443c01a7336-23e256d1bb6mr1795165ad.23.1752611798940;
        Tue, 15 Jul 2025 13:36:38 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5c42:3781:50b6:b9d7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de43637f2sm115585595ad.241.2025.07.15.13.36.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 13:36:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/16] iputils: patch CVE-2025-48964
Date: Tue, 15 Jul 2025 13:36:11 -0700
Message-ID: <49ccf7b56a0598f84dcac2532c462aa2c285f66c.1752611671.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752611671.git.steve@sakoman.com>
References: <cover.1752611671.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 20:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220419

From: Peter Marko <peter.marko@siemens.com>

Pick commit referencing this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../iputils/iputils/CVE-2025-48964.patch      | 99 +++++++++++++++++++
 .../iputils/iputils_20211215.bb               |  1 +
 2 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-extended/iputils/iputils/CVE-2025-48964.patch

diff --git a/meta/recipes-extended/iputils/iputils/CVE-2025-48964.patch b/meta/recipes-extended/iputils/iputils/CVE-2025-48964.patch
new file mode 100644
index 0000000000..e6fc67bce0
--- /dev/null
+++ b/meta/recipes-extended/iputils/iputils/CVE-2025-48964.patch
@@ -0,0 +1,99 @@
+From afa36390394a6e0cceba03b52b59b6d41710608c Mon Sep 17 00:00:00 2001
+From: Cyril Hrubis <metan@ucw.cz>
+Date: Fri, 16 May 2025 17:57:10 +0200
+Subject: [PATCH] ping: Fix moving average rtt calculation
+
+The rts->rtt counts an exponential weight moving average in a fixed
+point, that means that even if we limit the triptime to fit into a 32bit
+number the average will overflow because because fixed point needs eight
+more bits.
+
+We also have to limit the triptime to 32bit number because otherwise the
+moving average may stil overflow if we manage to produce a large enough
+triptime.
+
+Fixes: CVE-2025-48964
+Fixes: https://bugzilla.suse.com/show_bug.cgi?id=1243772
+Closes: https://github.com/iputils/iputils-ghsa-25fr-jw29-74f9/pull/1
+Reported-by: Mohamed Maatallah <hotelsmaatallahrecemail@gmail.com>
+Reviewed-by: Petr Vorel <pvorel@suse.cz>
+Tested-by: Petr Vorel <pvorel@suse.cz>
+Reviewed-by: Michal Kubecek <mkubecek@suse.cz>
+Reviewed-by: Mohamed Maatallah <hotelsmaatallahrecemail@gmail.com>
+Signed-off-by: Cyril Hrubis <metan@ucw.cz>
+
+CVE: CVE-2025-48964
+Upstream-Status: Backport [https://github.com/iputils/iputils/commit/afa36390394a6e0cceba03b52b59b6d41710608c]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ iputils_common.h   | 2 +-
+ ping/ping.h        | 2 +-
+ ping/ping_common.c | 8 ++++----
+ 3 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/iputils_common.h b/iputils_common.h
+index 829a749..1296905 100644
+--- a/iputils_common.h
++++ b/iputils_common.h
+@@ -11,7 +11,7 @@
+ 					 __typeof__(&arr[0]))])) * 0)
+ 
+ /* 1000001 = 1000000 tv_sec + 1 tv_usec */
+-#define TV_SEC_MAX_VAL (LONG_MAX/1000001)
++#define TV_SEC_MAX_VAL (INT32_MAX/1000001)
+ 
+ #ifdef __GNUC__
+ # define iputils_attribute_format(t, n, m) __attribute__((__format__ (t, n, m)))
+diff --git a/ping/ping.h b/ping/ping.h
+index 4dce538..bc1fab2 100644
+--- a/ping/ping.h
++++ b/ping/ping.h
+@@ -180,7 +180,7 @@ struct ping_rts {
+ 	long tmax;			/* maximum round trip time */
+ 	double tsum;			/* sum of all times, for doing average */
+ 	double tsum2;
+-	int rtt;
++	uint64_t rtt;                   /* Exponential weight moving average calculated in fixed point */
+ 	int rtt_addend;
+ 	uint16_t acked;
+ 	int pipesize;
+diff --git a/ping/ping_common.c b/ping/ping_common.c
+index 2a3e556..fad5228 100644
+--- a/ping/ping_common.c
++++ b/ping/ping_common.c
+@@ -273,7 +273,7 @@ int __schedule_exit(int next)
+ 
+ static inline void update_interval(struct ping_rts *rts)
+ {
+-	int est = rts->rtt ? rts->rtt / 8 : rts->interval * 1000;
++	int est = rts->rtt ? (int)(rts->rtt / 8) : rts->interval * 1000;
+ 
+ 	rts->interval = (est + rts->rtt_addend + 500) / 1000;
+ 	if (rts->uid && rts->interval < MINUSERINTERVAL)
+@@ -768,7 +768,7 @@ restamp:
+ 			if (triptime > rts->tmax)
+ 				rts->tmax = triptime;
+ 			if (!rts->rtt)
+-				rts->rtt = triptime * 8;
++				rts->rtt = ((uint64_t)triptime) * 8;
+ 			else
+ 				rts->rtt += triptime - rts->rtt / 8;
+ 			if (rts->opt_adaptive)
+@@ -935,7 +935,7 @@ int finish(struct ping_rts *rts)
+ 		int ipg = (1000000 * (long long)tv.tv_sec + tv.tv_nsec / 1000) / (rts->ntransmitted - 1);
+ 
+ 		printf(_("%sipg/ewma %d.%03d/%d.%03d ms"),
+-		       comma, ipg / 1000, ipg % 1000, rts->rtt / 8000, (rts->rtt / 8) % 1000);
++		       comma, ipg / 1000, ipg % 1000, (int)(rts->rtt / 8000), (int)((rts->rtt / 8) % 1000));
+ 	}
+ 	putchar('\n');
+ 	return (!rts->nreceived || (rts->deadline && rts->nreceived < rts->npackets));
+@@ -960,7 +960,7 @@ void status(struct ping_rts *rts)
+ 		fprintf(stderr, _(", min/avg/ewma/max = %ld.%03ld/%lu.%03ld/%d.%03d/%ld.%03ld ms"),
+ 			(long)rts->tmin / 1000, (long)rts->tmin % 1000,
+ 			tavg / 1000, tavg % 1000,
+-			rts->rtt / 8000, (rts->rtt / 8) % 1000, (long)rts->tmax / 1000, (long)rts->tmax % 1000);
++			(int)(rts->rtt / 8000), (int)((rts->rtt / 8) % 1000), (long)rts->tmax / 1000, (long)rts->tmax % 1000);
+ 	}
+ 	fprintf(stderr, "\n");
+ }
diff --git a/meta/recipes-extended/iputils/iputils_20211215.bb b/meta/recipes-extended/iputils/iputils_20211215.bb
index 03dc97dcc8..97fff6fe3a 100644
--- a/meta/recipes-extended/iputils/iputils_20211215.bb
+++ b/meta/recipes-extended/iputils/iputils_20211215.bb
@@ -13,6 +13,7 @@ DEPENDS = "gnutls"
 SRC_URI = "git://github.com/iputils/iputils;branch=master;protocol=https \
            file://0001-rarpd-rdisc-Drop-PrivateUsers.patch \
            file://CVE-2025-47268.patch \
+           file://CVE-2025-48964.patch \
            "
 SRCREV = "1d1e7c43210d8af316a41cb2c53d612a4c16f34d"
 
-- 
2.43.0


