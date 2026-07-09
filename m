Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A4CC44506
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 10:07:06 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5887.1783591625491994515
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 03:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0PChoY3E;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493b779003fso3740245e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 03:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783591624; x=1784196424; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IwwOKB9XZ4JgSEv5BBpdj/BBwhiLMbssTeYU5oD/+nE=;
        b=0PChoY3E3pDs9EmrjY2D782C1nv3gmuQf9b4xbag/c1BJi32wDU02hwMeOj0vYPbvC
         ABDNR6BJV4HkAhWlERavcH5LBSjszSTSBgeXOll7JkZ15YpoIZ4lxTOpQUqafNacraIW
         GNBg/T1J5QR1kA/LCHjxnQvLqbgEFuHuPMFIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591624; x=1784196424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IwwOKB9XZ4JgSEv5BBpdj/BBwhiLMbssTeYU5oD/+nE=;
        b=ZvmHrTbJz34JGDE3Ko+5l9LGJr3S5Co/GPGJBhcWzoio63IuqSkiliYxmQOX/Xp6Bq
         7/THvM7rk606XaKBvfZ8AyASH6UtC1Bgy5US0X9+8zw0wCYbGS4L3BDVvM78Uh0EznKZ
         TGEk3+R2b9ubHQD/u6/FpO/l3ljS7s+CGHHe2koMCwc7x3NPBgZ2o2tVLL/8QnxK2QoJ
         B51uwfTKu74U42D1B3iwvjnpI3jvnA4e7QE0IQoq2YtYKs7osyRn72p7LyG6ouwhqqcL
         uDJRxEsjvJk4r38byUVfSKO/nOKnI5a34wvLkbcvBza+AKm4ylBybLeYIvml1BLby2eA
         0Y1w==
X-Gm-Message-State: AOJu0YyfM+hRGuxHnQHlnUg9DUf9tCNxmcKyghER76+EQ/INe4j4Wncw
	B7EcD8zXKm2wkE99Bk26404Nl5bJGQ9t4DvYw/FMsggd1IIMEsrIzD70vhEQCfTvOnqKUtv7R5I
	3384lgTA=
X-Gm-Gg: AfdE7cnMCePZVyg/GLfFBQkxA6uVRdrHw3LAsLWvaFyzqOlnyQ60K71bx1gfhoorKaz
	ZunYHRm9t/sBVkLgNFbgcONnV1gv7SZBZ0JlU931D0x/APPgtcfmSbc0ALhZLKlv8OcGr1EdxeQ
	h0B5My6q4gkULhKaELfE5/4iY01FLXSfVl6dl+WLryw1GVenJAF/2q9JPKDACn1liFXX6Ex9++2
	nK4l+PMwihlGdNMVp3eFJ7lQ5zytmnmAjZo1RdrB7KTOwzFnt4ZyBCWXOWit8E0Dg+AUNnLMvox
	z2cW8P3dOnVIFIgDkZSWrqbE7rsM7HaIUmTqrCrmA9tZ20hOQ/K61YwXWRR+AA7wZTA2wO6IzRP
	EraIw/NBiTjhtmVh8F+N3oLXjKYRdkqtGaeotjlerqFxZtyL0J5aB1CfvWkv0LgxMTpSdm5hFLm
	d74uW4wSTzBZYpajyeQ8HC8XNAS/gz/QgREycebuMMet/lhcRiFZzOnjb87INmIG1b9c/0bCKzo
	RfM8dZCT06QiO5qSw==
X-Received: by 2002:a05:600c:820b:b0:493:c194:4e7a with SMTP id 5b1f17b1804b1-493e68aef5emr57001905e9.3.1783591623526;
        Thu, 09 Jul 2026 03:07:03 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fd88810a86c49142.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fd88:810a:86c4:9142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a5d174sm149687135e9.2.2026.07.09.03.07.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:07:03 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/25] dhcpcd: patch CVE-2026-56113
Date: Thu,  9 Jul 2026 12:06:23 +0200
Message-ID: <13da45b004b8abd4cbbcb424791bc19e6b9cac90.1783590688.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783590688.git.yoann.congal@smile.fr>
References: <cover.1783590688.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 10:07:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240554

From: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>

Backport patch [1] mentionned in [2]

[1] https://github.com/NetworkConfiguration/dhcpcd/commit/5733d3c59a5651f64357ac11c98b4f39895c8d25

[2] https://security-tracker.debian.org/tracker/CVE-2026-56113

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../dhcpcd/dhcpcd_10.0.6.bb                   |  1 +
 .../dhcpcd/files/CVE-2026-56113.patch         | 92 +++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
index 6bde9b1f515..65dcbe52ec9 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://dhcpcd.service \
            file://dhcpcd@.service \
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
+           file://CVE-2026-56113.patch \
            "
 
 SRCREV = "1c8ae59836fa87b4c63c598087f0460ec20ed862"
diff --git a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.patch b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.patch
new file mode 100644
index 00000000000..6727bc1a69f
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.patch
@@ -0,0 +1,92 @@
+From 9f953ada0df6e7a568f006f3ae0ff10a77a95924 Mon Sep 17 00:00:00 2001
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
+index bdc3664e..5154bf41 100644
+--- a/src/dhcp6.c
++++ b/src/dhcp6.c
+@@ -2480,12 +2480,13 @@ dhcp6_findia(struct interface *ifp, struct dhcp6_message *m, size_t l,
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
+@@ -2511,11 +2512,14 @@ dhcp6_deprecatedele(struct ipv6_addr *ia)
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
+@@ -2523,7 +2527,11 @@ static void
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
+@@ -2545,7 +2553,9 @@ dhcp6_deprecateaddrs(struct ipv6_addrhead *addrs)
+ 		/* If we delegated from this prefix, deprecate or remove
+ 		 * the delegations. */
+ 		if (ia->flags & IPV6_AF_DELEGATEDPFX)
+-			dhcp6_deprecatedele(ia);
++			again = dhcp6_deprecatedele(ia);
++		else
++			again = false;
+ #endif
+ 
+ 		if (ia->flags & IPV6_AF_REQUEST) {
+@@ -2558,6 +2568,11 @@ dhcp6_deprecateaddrs(struct ipv6_addrhead *addrs)
+ 		if (ia->flags & IPV6_AF_EXTENDED)
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

