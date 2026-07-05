Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D99C4450B
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:43:08 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.139221.1783291382510178369
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:43:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FKD3b1qa;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-46ed4f66256so2139434f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291381; x=1783896181; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kh+lCJnaTHkmekXZIjetrzV+YfAe37Nl83UFR4OxoDM=;
        b=FKD3b1qaDmQvlyeUACPyCfMZ2DN/iY9tnREvZlxGc/wn2z4yBQ+0aMtP/6qBqvEcFs
         Cb0Yzj22GHisXn0go3BmgPv6syD5WVVqQbeJLX8iAOwL1IsQxi3AuMLAWrtY33+B09FW
         dTz2wS1qHWiVeZAbjIfxnRYpvSSBpZUeFWtR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291381; x=1783896181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kh+lCJnaTHkmekXZIjetrzV+YfAe37Nl83UFR4OxoDM=;
        b=Zm92uxEIGsqqMXMw31l+B19R3X3i2D50pNqB+qay9gJnmQfgqDdw9QjCx/4JBu4KkG
         F6eE6DZYWDQc0+R3TPMiItK4KRvMFrPAbBQzQN/tG8FqyJWeMKp0wYVBhYDk5FvQxHwK
         3x5wx7anUB1AuD3/Dae+c6kmMKoRDD8DMaJyf9WOCg6TXj0VMh3W1Xh+eF1u6S3yrsgo
         65xi3WUfs25DM2PXiXDGOJ9EsXCjABbmmyDOLIg2hg4WFL8Aw42oSX7arqNGI3y2X2m0
         J84pbM8KQzVva29eaKBdS3GV7IlBLWImaNpot7PI8hLnR9fBvov4FEKELbySFvXY4GD4
         Y1pg==
X-Gm-Message-State: AOJu0YyGoYmOXnCyfM7iDz6MjTv8HMZaYuTRHwuuukMpTb48Czo9V/8j
	aPtEYBVC8KW+NrN41PRcO8EN0W/71PSB3EKaE2/BmSx3Jn7Qe5ej7d7lfDBdEmukprZSWldPEn5
	npXhMQYk=
X-Gm-Gg: AfdE7cnOpT55tx8AW4xj+QBry+7DQfSEWDeaJRsgM/Rpuht2ByTik23EoquGn2lE9e7
	zpMrrh4N4dAB6+7hncI7BjzAilJ+RMrirscwnbXOSNwmFjpYQ9J9JVgQp0uD09yjddrpqfKHNH5
	5GhXnz4lUdp7694RnnprROBkDPhzPBQSk/kofPtUtukf2nYzkLjdxVM7otxoIMXcRSnRKGj8ZRh
	ds0xGL2gOE1WBRWEB+33y8YPr7lqyWkHs50t2th1WRgUq6y4iXP4zvEOpnRKcOzuR97qGdprux8
	J7gZ4tpwgb+TxPusfyLnv+c/8Y8bQ3bQPVtSptZSWFUM5Pb9g+fx78Y1m5l4poIczxC93lyVscT
	bmhzGEhHChmvP5ZMQg8F9ErVCXcvslxqTyIFdgin0akujzuWw9CeCLwU79ZoB2Q/ToncWd1Y9E8
	HwhHeMfwddvtK8i5AxNEt20yDBmg==
X-Received: by 2002:a5d:6a92:0:b0:475:f0d1:eb65 with SMTP id ffacd0b85a97d-47aae69cf8dmr6942926f8f.50.1783291380740;
        Sun, 05 Jul 2026 15:43:00 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.43.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:43:00 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 30/55] dhcpcd: patch CVE-2026-56113
Date: Mon,  6 Jul 2026 00:41:20 +0200
Message-ID: <548999694bedd7d3927ce572e5bd86ded9b3b007.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240183

From: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>

Backport patch [1] mentionned in [2]

[1] https://github.com/NetworkConfiguration/dhcpcd/commit/5733d3c59a5651f64357ac11c98b4f39895c8d25

[2] https://security-tracker.debian.org/tracker/CVE-2026-56113

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../dhcpcd/dhcpcd_10.3.1.bb                   |  1 +
 .../dhcpcd/files/CVE-2026-56113.patch         | 92 +++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
index c940d6806a6..b348c895e8b 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://dhcpcd.service \
            file://dhcpcd@.service \
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
+           file://CVE-2026-56113.patch \
            "
 
 SRCREV = "42ff6d2548209af3185473e6cb6f9d235c48bbf4"
diff --git a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.patch b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.patch
new file mode 100644
index 00000000000..602fb7979e2
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.patch
@@ -0,0 +1,92 @@
+From 7c4a5dbae8ff99f8d3c2d8c1d3be95b60ffb4485 Mon Sep 17 00:00:00 2001
+From: Roy Marples <roy@marples.name>
+Date: Tue, 23 Jun 2026 02:17:10 +0100
+Subject: [PATCH] DHCPv6: When deprecating addresses, restart on prefix
+ deletions
+
+As that might invalidate the next address to iterate on.
+
+Reported-by: CuB3y0nd <root@cubeyond.net>
+
+(cherry picked from commit 5733d3c59a5651f64357ac11c98b4f39895c8d25)
+
+CVE: CVE-2026-56113
+Upstream-Status: Backport [https://github.com/NetworkConfiguration/dhcpcd/commit/5733d3c59a5651f64357ac11c98b4f39895c8d25]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/dhcp6.c | 21 ++++++++++++++++++---
+ 1 file changed, 18 insertions(+), 3 deletions(-)
+
+diff --git a/src/dhcp6.c b/src/dhcp6.c
+index 91341994..8a8a20a0 100644
+--- a/src/dhcp6.c
++++ b/src/dhcp6.c
+@@ -2593,12 +2593,13 @@ dhcp6_findia(struct interface *ifp, struct dhcp6_message *m, size_t l,
+ }
+ 
+ #ifndef SMALL
+-static void
++static bool
+ dhcp6_deprecatedele(struct ipv6_addr *ia)
+ {
+ 	struct ipv6_addr *da, *dan, *dda;
+ 	struct timespec now;
+ 	struct dhcp6_state *state;
++	bool freed = false;
+ 
+ 	timespecclear(&now);
+ 	TAILQ_FOREACH_SAFE(da, &ia->pd_pfxs, pd_next, dan) {
+@@ -2624,11 +2625,14 @@ dhcp6_deprecatedele(struct ipv6_addr *ia)
+ 			if (IN6_ARE_ADDR_EQUAL(&dda->addr, &da->addr))
+ 				break;
+ 		}
+-		if (dda != NULL) {
++		if (dda != ia && dda != NULL) {
+ 			TAILQ_REMOVE(&state->addrs, dda, next);
+ 			ipv6_freeaddr(dda);
++			freed = true;
+ 		}
+ 	}
++
++	return freed;
+ }
+ #endif
+ 
+@@ -2636,7 +2640,11 @@ static void
+ dhcp6_deprecateaddrs(struct ipv6_addrhead *addrs)
+ {
+ 	struct ipv6_addr *ia, *ian;
++#ifndef SMALL
++	bool again;
++#endif
+ 
++again:
+ 	TAILQ_FOREACH_SAFE(ia, addrs, next, ian) {
+ 		if (ia->flags & IPV6_AF_EXTENDED)
+ 			;
+@@ -2658,7 +2666,9 @@ dhcp6_deprecateaddrs(struct ipv6_addrhead *addrs)
+ 		/* If we delegated from this prefix, deprecate or remove
+ 		 * the delegations. */
+ 		if (ia->flags & IPV6_AF_PFXDELEGATION)
+-			dhcp6_deprecatedele(ia);
++			again = dhcp6_deprecatedele(ia);
++		else
++			again = false;
+ #endif
+ 
+ 		if (ia->flags & IPV6_AF_REQUEST) {
+@@ -2671,6 +2681,11 @@ dhcp6_deprecateaddrs(struct ipv6_addrhead *addrs)
+ 		if (!(ia->flags & IPV6_AF_EXTENDED))
+ 			ipv6_deleteaddr(ia);
+ 		ipv6_freeaddr(ia);
++#ifndef SMALL
++		/* Deletion may invalidate the next pointer so restart */
++		if (again)
++			goto again;
++#endif
+ 	}
+ }
+ 
+-- 
+2.43.0
+

