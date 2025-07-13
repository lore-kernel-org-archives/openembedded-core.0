Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9164C83F1D
	for <webhook@archiver.kernel.org>; Sun, 13 Jul 2025 22:02:35 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.65640.1752444149142388308
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Jul 2025 15:02:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=QDigK4aA;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2025071322022602e0b074b78768bc7f-miz_1s@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2025071322022602e0b074b78768bc7f
        for <openembedded-core@lists.openembedded.org>;
        Mon, 14 Jul 2025 00:02:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=zxwyCXlnm/fVLKUtUMdh8ZoCvVtKuk+NPhAltx50Hsc=;
 b=QDigK4aAFesfckO5MPdWmudTC2gSNiDOpqkpXCX2JvA5skZuVnOu+okNw5KIC21RS+TG6S
 mLy9DkftuwHghoEqtrj7aPp8pQbsDMQx6HQg6mEBTNToP1NUkXE66/R1CymLu53KNt+ygYNi
 ZKrhcD19YskXgbrV8JELAZeJhJ31zdze5jTy+pj6sNPqLV+85vL24W6fuOe/K8FqgWqjTNYe
 theYAnH78Z7wCT27FUuh9aU+iS3JRFFBzQfmFXAt9biP/y2kK/5ePSGbDrKtyX4Yh8RUiC5p
 MF5T3T8onwQ4nfzdPHraCvTIa4tusmKhEIPEUZcjdAXiYwXMJ7BCvJiA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] iputils: patch CVE-2025-48964
Date: Mon, 14 Jul 2025 00:01:39 +0200
Message-Id: <20250713220139.541145-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Jul 2025 22:02:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220208

From: Peter Marko <peter.marko@siemens.com>

Pick commit referencing this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
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
 

