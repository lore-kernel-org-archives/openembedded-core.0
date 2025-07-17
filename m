Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30798C83F37
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 02:55:51 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.40200.1752720946884003087
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 19:55:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OeRR6ke7;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3135f3511bcso488693a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 19:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752720946; x=1753325746; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bmHsHa6It2V1Lp3EkkI0zkiQkbyCtpAdbrM6Hobb/R4=;
        b=OeRR6ke7krhLUyw3OsIwRIpqkU080Ba7EgKrH1W4inSdimUDVyC3zUJz2mMaHV9ueF
         88M8HagYKGqxUI1UAryFZDxhIGKkembn01uRz7tB+3R99OpxPuHt6QfjdtdbsKrJNYSV
         gMHvvk+5X57EBBrQVX3a/OrVYI1s4MfUjo3ifnWH1wd6vGnurk6Taxcfen8ZwCi+/dQF
         HO+3D/kia3DRd40/gyB61JDktCnFVzt3Cm8MVp5rgd6Ct8jvDpgM10O6VZTq1U7Y0TNm
         v+U1TFWT46qEhrickaYQ1Bi237LPTbUzW0vVCGmG6je15rzXMknl3jp/JrD5lq0a1i+A
         z9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752720946; x=1753325746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bmHsHa6It2V1Lp3EkkI0zkiQkbyCtpAdbrM6Hobb/R4=;
        b=Cnmscs++zGv6NbuktCAxRVfkvuadr+x0KKtww+bCzJZtgKN4LKUeVPwjixZkBTcyq5
         4Sv2uiCwCET1nP0TEcaXZxc3HyDEU+Th36ZJYid3BFXHuaZn2KZ7EhmyVZt3c+TNXG/D
         B3FQ3GYjtF/8fawQxs2P8IFOtCxiwQWgTGDZUIFEEtWr/mPtViZK3OcUSEB3yz4H0/7z
         q7KWoKgYoE4qykq+Gq3vVbvjG6GvgsISBQnvBeJg8bJGSSVD+1I5/R3AubBkRkiI7q3N
         mKtCdwrrLGz/GJcdUvwLSu3PFMqMT7JrRW9uifrSTJTVQaBR0PbIsTQK5AV5UzXYPmGW
         c4CQ==
X-Gm-Message-State: AOJu0YwwUqJf9WB//Y/OBNdNjg8kvClsvsBmYQM8Wg6GKzVVsOMK0rtN
	7KU/9/OwJ+XzA2Szl4Y/oBqOxEdLQQtMH+vuWwMGzICDthPcxHyxBdFwvKQcGcYBgGdscoNemBz
	Cop4o
X-Gm-Gg: ASbGncuND39crpAqlXt73W8o4vIWZG1gsVzzqjM7voWhFZN2XTyIhImwJIFaO6QohrC
	JnLThdVrbX1MtbFhxlDpff8aVg0gz89twdcvQerj8Q88+6cujjMjZ4GhkQWnvNpaU4FJKj/guXe
	tHeAUebO5CqQRRwa4N8T2Wm6k6hlaRCZdMVvCE1g9G2OLtz8GQQWGRlohHmyHJGgp4grBjnK7Ge
	R1KWlE+ccFuG+LLDKOvqcSLEURvCcL0XxQSmCn/ATauwvBYV+Y0ta9kRSiSPkNxn1qxkV4vif0x
	AgSEpapoq8p64s6mYa29fcHfQ3/VS4ZjT2AVUS7lfryG4iiwkND0U4bzambEZnDYDqZELdFvGxh
	NBPFiHefHNSRZHg==
X-Google-Smtp-Source: AGHT+IGWldpfjKKH+mxAfThFmjiKzIwFTqNGCC1cBigo1KT1e7dHF9kVKWXAwaGm8QdiCy1wiIe0bg==
X-Received: by 2002:a17:90b:2650:b0:311:baa0:89ce with SMTP id 98e67ed59e1d1-31c9f3fc33bmr7391038a91.12.1752720946020;
        Wed, 16 Jul 2025 19:55:46 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3bfc:8fec:7e35:e96a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f288173sm2333256a91.25.2025.07.16.19.55.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 19:55:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 03/13] iputils: patch CVE-2025-48964
Date: Wed, 16 Jul 2025 19:55:26 -0700
Message-ID: <aec02926ecaeb792ca987e540820c9da5fbdc49a.1752720827.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752720827.git.steve@sakoman.com>
References: <cover.1752720827.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 02:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220489

From: Peter Marko <peter.marko@siemens.com>

Pick commit referencing this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../iputils/iputils/CVE-2025-48964.patch      | 99 +++++++++++++++++++
 .../iputils/iputils_20240905.bb               |  1 +
 2 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-extended/iputils/iputils/CVE-2025-48964.patch

diff --git a/meta/recipes-extended/iputils/iputils/CVE-2025-48964.patch b/meta/recipes-extended/iputils/iputils/CVE-2025-48964.patch
new file mode 100644
index 0000000000..1144ce4e4a
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
+@@ -194,7 +194,7 @@ struct ping_rts {
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
+@@ -281,7 +281,7 @@ int __schedule_exit(int next)
+ 
+ static inline void update_interval(struct ping_rts *rts)
+ {
+-	int est = rts->rtt ? rts->rtt / 8 : rts->interval * 1000;
++	int est = rts->rtt ? (int)(rts->rtt / 8) : rts->interval * 1000;
+ 
+ 	rts->interval = (est + rts->rtt_addend + 500) / 1000;
+ 	if (rts->uid && rts->interval < MIN_USER_INTERVAL_MS)
+@@ -788,7 +788,7 @@ restamp:
+ 			if (triptime > rts->tmax)
+ 				rts->tmax = triptime;
+ 			if (!rts->rtt)
+-				rts->rtt = triptime * 8;
++				rts->rtt = ((uint64_t)triptime) * 8;
+ 			else
+ 				rts->rtt += triptime - rts->rtt / 8;
+ 			if (rts->opt_adaptive)
+@@ -960,7 +960,7 @@ int finish(struct ping_rts *rts)
+ 		int ipg = (1000000 * (long long)tv.tv_sec + tv.tv_nsec / 1000) / (rts->ntransmitted - 1);
+ 
+ 		printf(_("%sipg/ewma %d.%03d/%d.%03d ms"),
+-		       comma, ipg / 1000, ipg % 1000, rts->rtt / 8000, (rts->rtt / 8) % 1000);
++		       comma, ipg / 1000, ipg % 1000, (int)(rts->rtt / 8000), (int)((rts->rtt / 8) % 1000));
+ 	}
+ 	putchar('\n');
+ 	return (!rts->nreceived || (rts->deadline && rts->nreceived < rts->npackets));
+@@ -985,7 +985,7 @@ void status(struct ping_rts *rts)
+ 		fprintf(stderr, _(", min/avg/ewma/max = %ld.%03ld/%lu.%03ld/%d.%03d/%ld.%03ld ms"),
+ 			(long)rts->tmin / 1000, (long)rts->tmin % 1000,
+ 			tavg / 1000, tavg % 1000,
+-			rts->rtt / 8000, (rts->rtt / 8) % 1000, (long)rts->tmax / 1000, (long)rts->tmax % 1000);
++			(int)(rts->rtt / 8000), (int)((rts->rtt / 8) % 1000), (long)rts->tmax / 1000, (long)rts->tmax % 1000);
+ 	}
+ 	fprintf(stderr, "\n");
+ }
diff --git a/meta/recipes-extended/iputils/iputils_20240905.bb b/meta/recipes-extended/iputils/iputils_20240905.bb
index 64d58a91c2..96b9671dbd 100644
--- a/meta/recipes-extended/iputils/iputils_20240905.bb
+++ b/meta/recipes-extended/iputils/iputils_20240905.bb
@@ -12,6 +12,7 @@ DEPENDS = "gnutls"
 
 SRC_URI = "git://github.com/iputils/iputils;branch=master;protocol=https \
            file://CVE-2025-47268.patch \
+           file://CVE-2025-48964.patch \
           "
 SRCREV = "10b50784aae3fb75c96cdf9b1668916b49557dd5"
 
-- 
2.43.0


