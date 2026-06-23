Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B074CDB479
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 11:31:03 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18972.1782214253641104153
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 04:30:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=URZ5RImW;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3046; q=dns/txt;
  s=iport01; t=1782214254; x=1783423854;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AXj7EX2qxZ8lqVCqGHnB4nvkLr8jfhki2G/XjMreLX0=;
  b=URZ5RImWbsCF4Rn9gjIdYGOylQ/svNKh8qgkyCmTrhIP/mTovlUjk/Yu
   YJf54C599dV52joFmKpViphlvW82FKBKCHwecOuVxPx2Vy2lyzrYzDO8c
   K2pzAfJvOj7ZCn/jIktdkUI6iEEebyi+naOZ1NPOpF/V7fpXXv9oGD4uI
   KBof+3ScgncdUVQ+V+Od4UKnTxoclBi1/bfdjXqhaNxL3X5/K/TwsJcY9
   g4SKPGOP+JoqEZ/Lf5QtzgzcYhGXI3/Ur/sxX6jtHh3eI9fQv9FTJevBD
   JTtTKbcNMl/YQRGayW1+K+wcaNmMHrycwcdihIxRYut8RwF3UPSlj7bA+
   Q==;
X-CSE-ConnectionGUID: MFnLl5ypQj62kJ3R5DHd5w==
X-CSE-MsgGUID: RBAlZ8DDQhGWIH0ytffL8Q==
X-IPAS-Result: =?us-ascii?q?A0BIAgCDbTpq/5D/Ja1aH4I6gld0X0JJA5ZIA54bgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhQYCjUoCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWgECAQMyATQSEBwDAQIOCxYrIwgZgwIBgnMCARGzbRo3giyBA?=
 =?us-ascii?q?YNoAkNQ2ywBCxQBBYEzhT+IH1sYAYR8JxsbgXKBFYNpgQWBXAKCMIV1BIIig?=
 =?us-ascii?q?QyBWhgGTwWBUIEFghuJRUiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBD?=
 =?us-ascii?q?BsHBYEdgW6BBIUCIx8DOX+BP4EkZGYVMDWBAQERHwqBKwMLGA1IESw3FBsEP?=
 =?us-ascii?q?m4HjFoXD4I9AUkxEwErIIFdL5M4kj6hDwoog3WMIZU6GjOEBIFXpRELmH2CW?=
 =?us-ascii?q?YsxllCEaIFoPIFZcBU7gmcJShkPjjiDa4QHgQzEfiQ1CwMvAQEHAgcOAwuBa?=
 =?us-ascii?q?JAmd2ABAQ?=
IronPort-Data: A9a23:QYm/7qw6/XCfo0dlEAN6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkUDx
 mUeXWCCOKyJYmb2KYt+ad6x8kMFvcPTmoJlTVQ/rVhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4+aT/H3Ygf/hWYqaDlMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJGQYO6kcp/dvOGMQr
 /86cwpQQjCP2v3jldpXSsE07igiBNPgMIVavjRryivUSK55B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cP3WjOX9PYH46tO6kgX/weidVgFmUvqEwpWPUyWSd1ZCxYYqMJ4faG549ckCwn
 Ejv+1apLj0jNPOg6Brd426iiMufpHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBWS4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rHnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:uo4LV6FS8VopwR3RpLqEMMeALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHPxOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1/J
 0QFZSWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaEp2JK2xCe32m+oocfng/OaYE
X-Talos-CUID: 9a23:x7PBc2GfPydXy8rIqmJC2kgwHp00akTfki3TARSCVEpJROCKHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3ANH4aVQ592vEfkTGX88uCcYa9xoxSyY2qOhAhvaw?=
 =?us-ascii?q?GlPalFXRhJzmTqGSOF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,220,1774310400"; 
   d="scan'208";a="498153863"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Jun 2026 11:30:53 +0000
Received: from sjc-ads-4153.cisco.com (sjc-ads-4153.cisco.com [171.70.54.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id D61DF18000482;
	Tue, 23 Jun 2026 11:30:52 +0000 (GMT)
Received: by sjc-ads-4153.cisco.com (Postfix, from userid 1870532)
	id 39E70CC124C; Tue, 23 Jun 2026 04:30:52 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [scarthgap] [PATCH 7/8] cups: Fix CVE-2026-39316
Date: Tue, 23 Jun 2026 04:30:31 -0700
Message-ID: <20260623113037.28968-7-adongare@cisco.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20260623113037.28968-1-adongare@cisco.com>
References: <20260623113037.28968-1-adongare@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4153.cisco.com [171.70.54.174];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.174, sjc-ads-4153.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 11:31:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239353

From: Anil Dongare <adongare@cisco.com>

Pick the upstream patch [1] as mentioned in [2].

[1] https://github.com/OpenPrinting/cups/commit/0142eeb58e0d718b7d2e1f0d5dd214bd2192cc7f
[2] https://security-tracker.debian.org/tracker/CVE-2026-39316

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2026-39316.patch            | 51 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-39316.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 7bfa890b3d..c2bf572bf5 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -30,6 +30,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-34979.patch \
            file://CVE-2026-34990.patch \
            file://CVE-2026-39314.patch \
+           file://CVE-2026-39316.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-39316.patch b/meta/recipes-extended/cups/cups/CVE-2026-39316.patch
new file mode 100644
index 0000000000..4b43a7b41b
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-39316.patch
@@ -0,0 +1,51 @@
+From 7c4d7951d189e931563f21086196d5a55fb2fa15 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Sun, 5 Apr 2026 11:33:23 -0400
+Subject: [PATCH] Expire per-printer subscriptions before deleting.
+
+CVE: CVE-2026-39316
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/0142eeb58e0d718b7d2e1f0d5dd214bd2192cc7f]
+
+Backport Changes:
+- Rebase CHANGES.md placement and scheduler/printers.c delete-printer context
+  to the CUPS 2.4.11 source carried by this recipe.
+
+(cherry picked from commit 0142eeb58e0d718b7d2e1f0d5dd214bd2192cc7f)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ CHANGES.md           | 1 +
+ scheduler/printers.c | 6 ++++++
+ 2 files changed, 7 insertions(+)
+
+diff --git a/CHANGES.md b/CHANGES.md
+index 082b9f7..cde280d 100644
+--- a/CHANGES.md
++++ b/CHANGES.md
+@@ -16,6 +16,7 @@ Changes in CUPS v2.4.10 (2024-06-18)
+ - CVE-2026-34990: The scheduler incorrectly allowed local certificates over the
+   loopback interface.
+ - Fixed the range check for job password strings.
++- Fixed a printer subscription bug in the scheduler.
+ - Fixed error handling when reading a mixed `1setOf` attribute.
+ - Fixed scheduler start if there is only domain socket to listen on (Issue #985)
+ 
+diff --git a/scheduler/printers.c b/scheduler/printers.c
+index bf493a3..ca983f9 100644
+--- a/scheduler/printers.c
++++ b/scheduler/printers.c
+@@ -641,6 +641,12 @@ cupsdDeletePrinter(
+                      update ? "Job stopped due to printer being deleted." :
+ 		              "Job stopped.");
+ 
++ /*
++  * Expire subscriptions on the printer...
++  */
++
++  cupsdExpireSubscriptions(p, /*job*/NULL);
++
+  /*
+   * Remove the printer from the list...
+   */
+-- 
+2.43.7
+
-- 
2.44.4


