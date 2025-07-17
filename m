Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C8F9C83F39
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 02:59:21 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.40513.1752721155843879029
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 19:59:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aucJ+quN;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b3220c39cffso450039a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 19:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752721155; x=1753325955; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8JUkgvItye3faZ49AHOKR+SHLwNH2lnxtRvO4U8kVZM=;
        b=aucJ+quNX49xtocAC8rp53IWnCqvsPgzaD2hMtyNv7gHw2ZoQ8/F5zv0m/hiW29DTt
         QRapcQDQbs4FwAwCPJh216pFft1JVfbi4lWV3FTOppGDZ4on3lU2SYOVnwpx/8LlpFQM
         FFNckeUwJbBLsGj4XsY3r0r+6M5HDhtUJh3R4ou4yRUPRsiELogbWfbvuxLbWpl1dfL5
         vn727FvJl+2heEbSLH96uYgtAW7eOmkxjuhu8hxhr79mqG9aO7UvD8UVTS/kn7xP8Jqw
         eSQTXn+Xl4at+dTZBSo8THH33iLRTew7h69jO2gvocsK0zE4x5buy1swkU00JRsJwQ+K
         g7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752721155; x=1753325955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8JUkgvItye3faZ49AHOKR+SHLwNH2lnxtRvO4U8kVZM=;
        b=l0z/Ge+KOODuK2gogrY1C6QJUii+X7qrBYoJK+07uwzV0QtFE5+0m81quPYdyiCWOT
         VgNzE544KyOi8Y09KZ3ugWHwhgFEJPrVehuKwFtwN1cp2Xtc/+gE6YACujxZTLUbSczv
         yb6oayJtLmN1stwcfRXX1CQLNm5UTk1G2JSeNOdEO8COgHPHMx+CvhiQOPRfltVLIJbI
         GQITBOoSr4cXvr5vrQy2KdHCOhj2rHy4c5eQiHlrRf8Ugo24heUqBIzcFvHsVopAayGK
         tUW9aWP0ZjL8lA/4mlxNaGuvMNvXCzho0cK/zJUJxYfYwQAuMrXsOl3Y99J2QELIuyeF
         pQNw==
X-Gm-Message-State: AOJu0Ywvd1nB2tij49ELGzZXKAa0hwIhCO+vP8MQl94b0aoVMmRrVULM
	tTYx/NeWAmb5uWhAPR4pP69QbT4XcRWEhVsNaYP16Nb37nl2q8oDYQ87BOYTjUutjCQWXPHOEe2
	S9I27
X-Gm-Gg: ASbGncsFaxfHb53XBs7i5DPBg4To/YftmfXsBuN7sxTEG/gQ+Sg6cjh9qZDqJubta2t
	Hp9tjCmkFE1L93IqF5zhYq+7OkxiyObHy+Ray6cUx4ALmX0jROBAOC6siaS7zTVsRMBKYBKgRpH
	zGbYCcTloOx+EbfdIpuusGranccCsVYXvRRXIzpP9p0ELZM8UMwmJ7QSODNHDRFBu9LQqbbZEXN
	mks/CzszuhymeWET91fXPPPQBIjrXBbCKSU7KWr4BO3EXEMx1RLZP5TCdIIGi3ZX0BWw4xCZN1M
	59OEAza/PvtBAj+HIcTaoKidemETwhsCydPsRazxGuugLYj1/tyRnmP760JrWt7DrW4rd6MgJDj
	U8Qke4LMFkwzxwA==
X-Google-Smtp-Source: AGHT+IEyqIWgeRqWP7YgWnNRxa5Mtb6hP72ftxB2g3Sss6fskvJcR6j7/NWA/QYexxYgB7FuAishmA==
X-Received: by 2002:a17:90a:ec8b:b0:312:1ac5:c7c7 with SMTP id 98e67ed59e1d1-31c9f3993d8mr7291312a91.2.1752721155064;
        Wed, 16 Jul 2025 19:59:15 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3bfc:8fec:7e35:e96a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f29e313sm2204547a91.35.2025.07.16.19.59.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 19:59:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/12] iputils: patch CVE-2025-48964
Date: Wed, 16 Jul 2025 19:58:52 -0700
Message-ID: <a8193571c8cdba55f568d831a4546e0fed892be0.1752721028.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752721028.git.steve@sakoman.com>
References: <cover.1752721028.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 02:59:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220504

From: Peter Marko <peter.marko@siemens.com>

Pick commit referencing this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../iputils/iputils/CVE-2025-48964.patch      | 99 +++++++++++++++++++
 .../iputils/iputils_20240117.bb               |  1 +
 2 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-extended/iputils/iputils/CVE-2025-48964.patch

diff --git a/meta/recipes-extended/iputils/iputils/CVE-2025-48964.patch b/meta/recipes-extended/iputils/iputils/CVE-2025-48964.patch
new file mode 100644
index 0000000000..fc2352c99c
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
+@@ -191,7 +191,7 @@ struct ping_rts {
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
+@@ -282,7 +282,7 @@ int __schedule_exit(int next)
+ 
+ static inline void update_interval(struct ping_rts *rts)
+ {
+-	int est = rts->rtt ? rts->rtt / 8 : rts->interval * 1000;
++	int est = rts->rtt ? (int)(rts->rtt / 8) : rts->interval * 1000;
+ 
+ 	rts->interval = (est + rts->rtt_addend + 500) / 1000;
+ 	if (rts->uid && rts->interval < MIN_USER_INTERVAL_MS)
+@@ -778,7 +778,7 @@ restamp:
+ 			if (triptime > rts->tmax)
+ 				rts->tmax = triptime;
+ 			if (!rts->rtt)
+-				rts->rtt = triptime * 8;
++				rts->rtt = ((uint64_t)triptime) * 8;
+ 			else
+ 				rts->rtt += triptime - rts->rtt / 8;
+ 			if (rts->opt_adaptive)
+@@ -948,7 +948,7 @@ int finish(struct ping_rts *rts)
+ 		int ipg = (1000000 * (long long)tv.tv_sec + tv.tv_nsec / 1000) / (rts->ntransmitted - 1);
+ 
+ 		printf(_("%sipg/ewma %d.%03d/%d.%03d ms"),
+-		       comma, ipg / 1000, ipg % 1000, rts->rtt / 8000, (rts->rtt / 8) % 1000);
++		       comma, ipg / 1000, ipg % 1000, (int)(rts->rtt / 8000), (int)((rts->rtt / 8) % 1000));
+ 	}
+ 	putchar('\n');
+ 	return (!rts->nreceived || (rts->deadline && rts->nreceived < rts->npackets));
+@@ -973,7 +973,7 @@ void status(struct ping_rts *rts)
+ 		fprintf(stderr, _(", min/avg/ewma/max = %ld.%03ld/%lu.%03ld/%d.%03d/%ld.%03ld ms"),
+ 			(long)rts->tmin / 1000, (long)rts->tmin % 1000,
+ 			tavg / 1000, tavg % 1000,
+-			rts->rtt / 8000, (rts->rtt / 8) % 1000, (long)rts->tmax / 1000, (long)rts->tmax % 1000);
++			(int)(rts->rtt / 8000), (int)((rts->rtt / 8) % 1000), (long)rts->tmax / 1000, (long)rts->tmax % 1000);
+ 	}
+ 	fprintf(stderr, "\n");
+ }
diff --git a/meta/recipes-extended/iputils/iputils_20240117.bb b/meta/recipes-extended/iputils/iputils_20240117.bb
index 5ff5af8847..21494cae2b 100644
--- a/meta/recipes-extended/iputils/iputils_20240117.bb
+++ b/meta/recipes-extended/iputils/iputils_20240117.bb
@@ -12,6 +12,7 @@ DEPENDS = "gnutls"
 
 SRC_URI = "git://github.com/iputils/iputils;branch=master;protocol=https \
            file://CVE-2025-47268.patch \
+           file://CVE-2025-48964.patch \
           "
 SRCREV = "8372f355bdf7a9b0c79338dd8ef8464c00a5c4e2"
 
-- 
2.43.0


