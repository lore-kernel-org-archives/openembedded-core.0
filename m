Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8282CD98CC
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 10:06:43 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16977.1781085994835865472
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 03:06:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=XDRLr4+W;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=65021; q=dns/txt;
  s=iport01; t=1781085997; x=1782295597;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h2f5vXXVwOYSxH0EuHiFdrtxcEq7T0fK2XvgJTOIDGQ=;
  b=XDRLr4+W3Axa9m/2MInCpuAO5z7JBsI6qpUub1aJDN0CXCy+PgJmyIpB
   L2XWLfEy69FOzP5ctXPnX1AR2bdcoftr15h1ElZeMEgN0lNSJQAeGm/cK
   mXlhZG3ICovreSycgJy2/M12XToRVOelxSm6sGvg3mE9IbvA2v7/k+r7n
   N5QPXL4eNM9YFVN+lDXRurLA1ReBjzDm1XxrAZdvnbmq0k390pb0MN+4H
   Enn2dUCWxoz3G5ztEJjMvDxwaBlsfP1H/xrmpt5qOSyo9mgyS17rBcYIE
   dlnCA9+txzft/95LrlxCBa/J1M4U/LgkRlR5fDogenpi3g4cIhMXpJAlk
   w==;
X-CSE-ConnectionGUID: WFmq1OVKTqWTp6bksUGUbw==
X-CSE-MsgGUID: PiCpMIwbSwy3xLB18qSw/Q==
X-IPAS-Result: =?us-ascii?q?A0ADAABpNilq/5T/Ja1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBgXwFAQEBAQsBghc/dF9CSYxziVgDgROCCo4tjFEUgWcDDwEBA?=
 =?us-ascii?q?Q9EDQQBAYUGAo06AiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhloBAgEDGgEMCwEYAS0QHAIBAQIvJAcjCBAJgipYAYJzAgERslZDg?=
 =?us-ascii?q?XkzgQGDCR8BMQUJAgJAAVDbKwELFAEFgTMBgjaDCIgeWxgBhHwnGxuBcoEVg?=
 =?us-ascii?q?TuBN3aBBX5eBYEgBCGGXQSCIoEMgV0egkAngX2KEEiBHgNZLAFVEw0KCwcFg?=
 =?us-ascii?q?WYDNRIqFW4yHYEjPheBDBsHBYFKgTdogQKFECMfAzmBFYF6gShnaRUwNWwDC?=
 =?us-ascii?q?xgNSBEsNxQbBD5uB4w6Fw+BRQEvPAcBJgoMHAEHEwcTAQoREBQDCSY9FwY3B?=
 =?us-ascii?q?w0BFwECLAEKDQYYD5JjBwEBAQeQFoIhgTWfWgoog3SMIZU6GjOEBIFXkj+SU?=
 =?us-ascii?q?ZkHglmLMZVfCBgBGDeEaIFoPEaBE3AVO4JnCUoZD44qAwsLgVk3gVCCVoI9L?=
 =?us-ascii?q?iNswgAkNQIBAQcyAQEHAgcOAwuBaJAAAiYHgU4BAQ?=
IronPort-Data: A9a23:xf4RjK1UPswoVHzI9vbD5YJwkn2cJEfYwER7XKvMYLTBsI5bpzxWz
 2oZWW6EM6zcMWegfNonYI2x/EgC6sTXzYI1Gwpu3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 bsen+WFYAX7g2AtajpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGM28zJNQ/xMVLGF5y7
 aISKyswQS2JmLfjqF67YrEEasULNsLnOsYb/3pn1zycVK9gSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUiQC/FMEg9/5JYWlfywj2P6eidwo1OOrq1x6G/WpOB0+OS8aYWNKoXRHK25mG6gp
 0ne2kXmCCoFJYeP7RDcomuXmaj2yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl/AQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSj1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:4YzhkKz1qgTslYqUJd6cKrPw9L1zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICPcqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIWpIObuEYdWIK7vrS0U2fD8sqxsWB/eSDgOfTyGoocCRRApsQljuQzm2gYzZLrM4sP+tAKK
 ah
X-Talos-CUID: 9a23:yHo/6GM/R3LX3e5DZwdi7RczJOMZa0Lh1CnaIFSFJltjV+jA
X-Talos-MUID: =?us-ascii?q?9a23=3AZrAGTQ6vGgNx9KS+bLdr1pw7xoxQ4o+2LWESm64?=
 =?us-ascii?q?ZqpKUEQYpay6mk3OOF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,197,1774310400"; 
   d="scan'208";a="491708131"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Jun 2026 10:06:35 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 989DA18000257;
	Wed, 10 Jun 2026 10:06:35 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 45D98CC1611; Wed, 10 Jun 2026 03:06:35 -0700 (PDT)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [OE-core] [scarthgap] [PATCH 5/5] bind: Fix CVE-2026-5946
Date: Wed, 10 Jun 2026 03:04:04 -0700
Message-Id: <20260610100404.2993940-5-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260610100404.2993940-1-asparmar@cisco.com>
References: <20260610100404.2993940-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 10:06:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238346

From: Ashishkumar Parmar <asparmar@cisco.com>

Pick the upstream 9.18 backport [1] for CVE-2026-5946. The public ISC
advisory [2] describes the vulnerability and identifies the fixed BIND
release.

The upstream fix is split across prerequisite ownership/update helpers,
non-IN class handling changes, and system-test coverage. Apply the
dependent patches first because later patches use MOVE_OWNERSHIP() and
the updated DNS UPDATE ownership flow:

- CVE-2026-5946-dependent_p1.patch [3] adds the MOVE_OWNERSHIP() helper
  used by the following update-path prerequisite.
- CVE-2026-5946-dependent_p2.patch [4] fixes DNS UPDATE SSU table
  ownership handling and depends on MOVE_OWNERSHIP().
- CVE-2026-5946_p1.patch [5] disables recursion for non-IN classes.
- CVE-2026-5946_p2.patch [6] disables UPDATE and NOTIFY for non-IN
  classes.
- CVE-2026-5946_p3.patch [7] validates DNS message CLASS early in
  request processing.
- CVE-2026-5946_p4.patch [8] rejects meta-classes in UPDATE and NOTIFY
  messages.
- CVE-2026-5946_p5.patch [9] skips deny-answer-address handling for
  non-IN addresses.
- CVE-2026-5946_p6.patch [10] tests CHAOS view recursion behavior.
- CVE-2026-5946_p7.patch [11] tests UPDATE behavior in CHAOS and other
  non-IN classes.
- CVE-2026-5946_p8.patch [12] tests server behavior for different UPDATE
  requests.
- CVE-2026-5946_p9.patch [13] makes the RD flag optional in
  isctest.query() for the test coverage above.

Keep the patches split to preserve the upstream commit structure and to
make the SRC_URI ordering explicit.

[1] https://gitlab.com/isc-projects/bind9/-/commit/7ce6ce37b1b04af0953ed2d3211587465085600e
[2] https://kb.isc.org/docs/cve-2026-5946
[3] https://gitlab.com/isc-projects/bind9/-/commit/8a0a0b01ff00d51509cf7e9ee8ca7bd076ba7b28
[4] https://gitlab.com/isc-projects/bind9/-/commit/f6fdc77c4699db4e54165e1759e7bf3d639b30cb
[5] https://gitlab.com/isc-projects/bind9/-/commit/401a6374b026afb76a7b22acc4a1402d21a7e77b
[6] https://gitlab.com/isc-projects/bind9/-/commit/04092ed136c8a6db2b1059dcd32693d57a7bdc24
[7] https://gitlab.com/isc-projects/bind9/-/commit/b247dbb3506ef628a683d184fbc6a99fad45ed94
[8] https://gitlab.com/isc-projects/bind9/-/commit/185c10981b941bfa5b753b3624b6e11ccca8737f
[9] https://gitlab.com/isc-projects/bind9/-/commit/772d1d5f905c819d7155e76a08c33218bfcc973e
[10] https://gitlab.com/isc-projects/bind9/-/commit/ba6b159d880e803decb85fdc88280b23d6f3a652
[11] https://gitlab.com/isc-projects/bind9/-/commit/e5b3149b70ed24f7590b6bc08aad4492a00c2022
[12] https://gitlab.com/isc-projects/bind9/-/commit/7e3d49815c3b8243b009c29955cef018fe87b7f0
[13] https://gitlab.com/isc-projects/bind9/-/commit/d79f2d3f35887ea4525e283d389d9078fa1ef439

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../bind/CVE-2026-5946-dependent_p1.patch     |  39 ++
 .../bind/CVE-2026-5946-dependent_p2.patch     |  78 ++++
 .../bind/bind/CVE-2026-5946_p1.patch          | 216 +++++++++++
 .../bind/bind/CVE-2026-5946_p2.patch          | 244 +++++++++++++
 .../bind/bind/CVE-2026-5946_p3.patch          | 169 +++++++++
 .../bind/bind/CVE-2026-5946_p4.patch          |  56 +++
 .../bind/bind/CVE-2026-5946_p5.patch          |  40 +++
 .../bind/bind/CVE-2026-5946_p6.patch          | 336 ++++++++++++++++++
 .../bind/bind/CVE-2026-5946_p7.patch          | 153 ++++++++
 .../bind/bind/CVE-2026-5946_p8.patch          | 225 ++++++++++++
 .../bind/bind/CVE-2026-5946_p9.patch          |  44 +++
 .../recipes-connectivity/bind/bind_9.18.44.bb |  11 +
 12 files changed, 1611 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-5946-dependent_p1.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-5946-dependent_p2.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-5946_p1.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-5946_p2.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-5946_p3.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-5946_p4.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-5946_p5.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-5946_p6.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-5946_p7.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-5946_p8.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-5946_p9.patch

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-5946-dependent_p1.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-5946-dependent_p1.patch
new file mode 100644
index 0000000000..68ad96da85
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-5946-dependent_p1.patch
@@ -0,0 +1,39 @@
+From 8a0a0b01ff00d51509cf7e9ee8ca7bd076ba7b28 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ond=C5=99ej=20Sur=C3=BD?= <ondrej@isc.org>
+Date: Fri, 20 Mar 2026 02:15:17 +0100
+Subject: [PATCH] Add MOVE_OWNERSHIP() macro for transferring pointer ownership
+
+A helper macro that returns the current value of a pointer and sets
+it to NULL in one expression, useful for transferring ownership in
+designated initializers.
+
+CVE: CVE-2026-5946
+Upstream-Status: Backport [https://gitlab.com/isc-projects/bind9/-/commit/8a0a0b01ff00d51509cf7e9ee8ca7bd076ba7b28]
+
+(cherry picked from commit 8a0a0b01ff00d51509cf7e9ee8ca7bd076ba7b28)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ lib/isc/include/isc/util.h | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/lib/isc/include/isc/util.h b/lib/isc/include/isc/util.h
+index 2d507c3f7e..222dac56bc 100644
+--- a/lib/isc/include/isc/util.h
++++ b/lib/isc/include/isc/util.h
+@@ -47,6 +47,13 @@
+  *** General Macros.
+  ***/
+ 
++#define MOVE_OWNERSHIP(source)                             \
++	({                                                 \
++		__typeof__(source) __ownership = (source); \
++		(source) = NULL;                           \
++		__ownership;                               \
++	})
++
+ /*%
+  * Use this to hide unused function arguments.
+  * \code
+-- 
+GitLab
+
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-5946-dependent_p2.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-5946-dependent_p2.patch
new file mode 100644
index 0000000000..d7b5e167d7
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-5946-dependent_p2.patch
@@ -0,0 +1,78 @@
+From f6fdc77c4699db4e54165e1759e7bf3d639b30cb Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ond=C5=99ej=20Sur=C3=BD?= <ondrej@sury.org>
+Date: Wed, 18 Mar 2026 03:55:51 +0100
+Subject: [PATCH] Fix TOCTOU race in DNS UPDATE SSU table handling
+
+Pass the SSU table through the update event struct from
+send_update() to update_action() instead of reading it from the
+zone twice.  If rndc reconfig changed the zone's update policy
+between the two reads (e.g., from allow-update to update-policy),
+send_update() would skip the maxbytype allocation but
+update_action() would see a non-NULL ssutable, triggering
+INSIST(ssutable == NULL || maxbytype != NULL) and crashing named.
+
+The ssutable reference is now taken once in send_update() and
+transferred to update_action() via the event struct, ensuring
+both functions see the same value.
+
+CVE: CVE-2026-5946
+Upstream-Status: Backport [https://gitlab.com/isc-projects/bind9/-/commit/f6fdc77c4699db4e54165e1759e7bf3d639b30cb]
+
+(cherry picked from commit c172416559e62a31de27061648db7ffe3b1b7f63)
+(cherry picked from commit f6fdc77c4699db4e54165e1759e7bf3d639b30cb)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ lib/ns/update.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/lib/ns/update.c b/lib/ns/update.c
+index c3e4eb115d..c02535130f 100644
+--- a/lib/ns/update.c
++++ b/lib/ns/update.c
+@@ -203,6 +203,7 @@ struct update_event {
+ 	dns_zone_t *zone;
+ 	isc_result_t result;
+ 	dns_message_t *answer;
++	dns_ssutable_t *ssutable;
+ 	unsigned int *maxbytype;
+ 	size_t maxbytypelen;
+ };
+@@ -1850,9 +1851,9 @@ send_update_event(ns_client_t *client, dns_zone_t *zone) {
+ 		sizeof(*event));
+ 	event->zone = zone;
+ 	event->result = ISC_R_SUCCESS;
+-	event->maxbytype = maxbytype;
++	event->ssutable = MOVE_OWNERSHIP(ssutable);
++	event->maxbytype = MOVE_OWNERSHIP(maxbytype);
+ 	event->maxbytypelen = maxbytypelen;
+-	maxbytype = NULL;
+ 
+ 	INSIST(client->nupdates == 0);
+ 	client->nupdates++;
+@@ -2840,6 +2841,7 @@ update_action(isc_task_t *task, isc_event_t *event) {
+ 	update_event_t *uev = (update_event_t *)event;
+ 	dns_zone_t *zone = uev->zone;
+ 	ns_client_t *client = (ns_client_t *)event->ev_arg;
++	dns_ssutable_t *ssutable = uev->ssutable;
+ 	unsigned int *maxbytype = uev->maxbytype;
+ 	size_t update = 0, maxbytypelen = uev->maxbytypelen;
+ 	isc_result_t result;
+@@ -2854,7 +2856,6 @@ update_action(isc_task_t *task, isc_event_t *event) {
+ 	dns_message_t *request = client->message;
+ 	dns_rdataclass_t zoneclass;
+ 	dns_name_t *zonename = NULL;
+-	dns_ssutable_t *ssutable = NULL;
+ 	dns_fixedname_t tmpnamefixed;
+ 	dns_name_t *tmpname = NULL;
+ 	dns_zoneopt_t options;
+@@ -2874,7 +2875,6 @@ update_action(isc_task_t *task, isc_event_t *event) {
+ 	CHECK(dns_zone_getdb(zone, &db));
+ 	zonename = dns_db_origin(db);
+ 	zoneclass = dns_db_class(db);
+-	dns_zone_getssutable(zone, &ssutable);
+ 	options = dns_zone_getoptions(zone);
+ 
+ 	/*
+-- 
+2.35.6
+
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-5946_p1.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-5946_p1.patch
new file mode 100644
index 0000000000..0238e2df8e
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-5946_p1.patch
@@ -0,0 +1,216 @@
+From e1a09175d8bb35900dfb8b356717b53ef0cc2cf9 Mon Sep 17 00:00:00 2001
+From: Evan Hunt <each@isc.org>
+Date: Tue, 3 Mar 2026 14:00:38 -0800
+Subject: [PATCH] Disable recursion for non-IN classes
+
+Force recursion off, and set allow-recursion/allow-recursion-on ACLs
+to none, for views with a class other than IN. Log a configuration
+warning if recursion is explicitly enabled for a non-IN view.
+
+This addresses YWH-PGM40640-74 and YWH-PGM40640-75 by preventing any
+attempt at recursive processing in a class-CHAOS view, ensuring that
+server addresses used for recursive queries and received in recursive
+responses are of the expected format.
+
+Fixes: isc-projects/bind9#5780
+Fixes: isc-projects/bind9#5781
+
+CVE: CVE-2026-5946
+Upstream-Status: Backport [https://gitlab.com/isc-projects/bind9/-/commit/401a6374b026afb76a7b22acc4a1402d21a7e77b]
+
+Backport Changes:
+- Adjusted the system-test path from allow_query to allow-query
+  to match the BIND 9.18.44 source tree layout.
+
+(cherry picked from commit 7becff1a14684a68208c92b3b0315c045c05ad75)
+(cherry picked from commit 401a6374b026afb76a7b22acc4a1402d21a7e77b)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ bin/named/server.c                    | 41 ++++++++-------------------
+ bin/tests/system/allow-query/tests.sh |  2 +-
+ bin/tests/system/checkconf/tests.sh   |  1 +
+ bin/tests/system/resolver/tests.sh    |  8 ++++--
+ lib/bind9/check.c                     | 22 ++++++++++++--
+ 5 files changed, 38 insertions(+), 36 deletions(-)
+
+diff --git a/bin/named/server.c b/bin/named/server.c
+index 125bfa8f94..7aa0f8b140 100644
+--- a/bin/named/server.c
++++ b/bin/named/server.c
+@@ -4515,6 +4515,7 @@ configure_view(dns_view_t *view, dns_viewlist_t *viewlist, cfg_obj_t *config,
+ 	obj = NULL;
+ 	result = named_config_get(maps, "max-cache-size", &obj);
+ 	INSIST(result == ISC_R_SUCCESS);
++
+ 	/*
+ 	 * If "-T maxcachesize=..." is in effect, it overrides any other
+ 	 * "max-cache-size" setting found in configuration, either implicit or
+@@ -5224,34 +5225,15 @@ configure_view(dns_view_t *view, dns_viewlist_t *viewlist, cfg_obj_t *config,
+ 	}
+ 
+ 	/*
+-	 * We have default hints for class IN if we need them.
++	 * We have default root hints for class IN if we need them.
++	 * Each view gets its own rootdb so a priming response only
++	 * writes into that view's copy.  Other classes don't support
++	 * recursion and don't need hints.
+ 	 */
+ 	if (view->rdclass == dns_rdataclass_in && view->hints == NULL) {
+ 		dns_view_sethints(view, named_g_server->in_roothints);
+ 	}
+ 
+-	/*
+-	 * If we still have no hints, this is a non-IN view with no
+-	 * "hints zone" configured.  Issue a warning, except if this
+-	 * is a root server.  Root servers never need to consult
+-	 * their hints, so it's no point requiring users to configure
+-	 * them.
+-	 */
+-	if (view->hints == NULL) {
+-		dns_zone_t *rootzone = NULL;
+-		(void)dns_view_findzone(view, dns_rootname, &rootzone);
+-		if (rootzone != NULL) {
+-			dns_zone_detach(&rootzone);
+-			need_hints = false;
+-		}
+-		if (need_hints) {
+-			isc_log_write(named_g_lctx, NAMED_LOGCATEGORY_GENERAL,
+-				      NAMED_LOGMODULE_SERVER, ISC_LOG_WARNING,
+-				      "no root hints for view '%s'",
+-				      view->name);
+-		}
+-	}
+-
+ 	/*
+ 	 * Configure the view's transports (DoT/DoH)
+ 	 */
+@@ -5379,7 +5361,8 @@ configure_view(dns_view_t *view, dns_viewlist_t *viewlist, cfg_obj_t *config,
+ 	obj = NULL;
+ 	result = named_config_get(maps, "recursion", &obj);
+ 	INSIST(result == ISC_R_SUCCESS);
+-	view->recursion = cfg_obj_asboolean(obj);
++	view->recursion = (view->rdclass == dns_rdataclass_in &&
++			   cfg_obj_asboolean(obj));
+ 
+ 	obj = NULL;
+ 	result = named_config_get(maps, "qname-minimization", &obj);
+@@ -5479,14 +5462,14 @@ configure_view(dns_view_t *view, dns_viewlist_t *viewlist, cfg_obj_t *config,
+ 	CHECK(configure_view_acl(vconfig, config, NULL, "allow-query-cache-on",
+ 				 NULL, actx, named_g_mctx, &view->cacheonacl));
+ 
+-	if (strcmp(view->name, "_bind") != 0 &&
+-	    view->rdclass != dns_rdataclass_chaos)
+-	{
+-		/* named.conf only */
++	if (view->rdclass != dns_rdataclass_in) {
++		view->recursion = false;
++		dns_acl_none(named_g_mctx, &view->recursionacl);
++		dns_acl_none(named_g_mctx, &view->recursiononacl);
++	} else {
+ 		CHECK(configure_view_acl(vconfig, config, NULL,
+ 					 "allow-recursion", NULL, actx,
+ 					 named_g_mctx, &view->recursionacl));
+-		/* named.conf only */
+ 		CHECK(configure_view_acl(vconfig, config, NULL,
+ 					 "allow-recursion-on", NULL, actx,
+ 					 named_g_mctx, &view->recursiononacl));
+diff --git a/bin/tests/system/allow-query/tests.sh b/bin/tests/system/allow-query/tests.sh
+index e59a1abe6b..46d2a78077 100644
+--- a/bin/tests/system/allow-query/tests.sh
++++ b/bin/tests/system/allow-query/tests.sh
+@@ -703,7 +703,7 @@ $DIG -p ${PORT} @10.53.1.2 d.normal.example a >dig.out.ns3.4.$n || ret=1
+ grep 'recursion requested but not available' dig.out.ns3.4.$n >/dev/null || ret=1
+ grep 'status: REFUSED' dig.out.ns3.4.$n >/dev/null || ret=1
+ grep 'EDE: 18 (Prohibited)' dig.out.ns3.4.$n >/dev/null || ret=1
+-nextpart ns3/named.run | grep 'allow-recursion-on did not match' >/dev/null || ret=1
++nextpart ns3/named.run | grep 'allow-query-cache-on did not match' >/dev/null || ret=1
+ if [ $ret != 0 ]; then echo_i "failed"; fi
+ status=$((status + ret))
+ 
+diff --git a/bin/tests/system/checkconf/tests.sh b/bin/tests/system/checkconf/tests.sh
+index 3bb772e4d5..5da8a20ee1 100644
+--- a/bin/tests/system/checkconf/tests.sh
++++ b/bin/tests/system/checkconf/tests.sh
+@@ -543,6 +543,7 @@ $CHECKCONF -l good.conf \
+   | grep -v "is not implemented" \
+   | grep -v "is not recommended" \
+   | grep -v "no longer exists" \
++  | grep -v "recursion will be disabled" \
+   | grep -v "is obsolete" >checkconf.out$n || ret=1
+ diff good.zonelist checkconf.out$n >diff.out$n || ret=1
+ if [ $ret -ne 0 ]; then
+diff --git a/bin/tests/system/resolver/tests.sh b/bin/tests/system/resolver/tests.sh
+index 2864aae950..db5a18680d 100755
+--- a/bin/tests/system/resolver/tests.sh
++++ b/bin/tests/system/resolver/tests.sh
+@@ -979,10 +979,12 @@ if [ $ret != 0 ]; then echo_i "failed"; fi
+ status=$((status + ret))
+ 
+ n=$((n + 1))
+-echo_i "checking NXDOMAIN is returned when querying non existing domain in CH class ($n)"
++echo_i "checking REFUSED is returned when querying non existing domain in CH class ($n)"
+ ret=0
+-dig_with_opts @10.53.0.1 id.hostname txt ch >dig.ns1.out.${n} || ret=1
+-grep "status: NXDOMAIN" dig.ns1.out.${n} >/dev/null || ret=1
++dig_with_opts @10.53.0.1 hostname.chaostest txt ch >dig.ns1.out.1.${n} || ret=1
++grep "status: NOERROR" dig.ns1.out.1.${n} >/dev/null || ret=1
++dig_with_opts @10.53.0.1 id.hostname txt ch >dig.ns1.out.2.${n} || ret=1
++grep "status: REFUSED" dig.ns1.out.2.${n} >/dev/null || ret=1
+ if [ $ret != 0 ]; then echo_i "failed"; fi
+ status=$((status + ret))
+ 
+diff --git a/lib/bind9/check.c b/lib/bind9/check.c
+index cefc3eb3ac..13f3212d08 100644
+--- a/lib/bind9/check.c
++++ b/lib/bind9/check.c
+@@ -2789,13 +2789,17 @@ check_mirror_zone_notify(const cfg_obj_t *zoptions, const char *znamestr,
+  */
+ static bool
+ check_recursion(const cfg_obj_t *config, const cfg_obj_t *voptions,
+-		const cfg_obj_t *goptions, isc_log_t *logctx,
+-		cfg_aclconfctx_t *actx, isc_mem_t *mctx) {
++		dns_rdataclass_t vclass, const cfg_obj_t *goptions,
++		isc_log_t *logctx, cfg_aclconfctx_t *actx, isc_mem_t *mctx) {
+ 	dns_acl_t *acl = NULL;
+ 	const cfg_obj_t *obj;
+ 	isc_result_t result;
+ 	bool retval = true;
+ 
++	if (vclass != dns_rdataclass_in) {
++		return false;
++	}
++
+ 	/*
+ 	 * Check the "recursion" option first.
+ 	 */
+@@ -3380,7 +3384,8 @@ check_zoneconf(const cfg_obj_t *zconfig, const cfg_obj_t *voptions,
+ 	 * contradicts the purpose of the former.
+ 	 */
+ 	if (ztype == CFG_ZONE_MIRROR &&
+-	    !check_recursion(config, voptions, goptions, logctx, actx, mctx))
++	    !check_recursion(config, voptions, zclass, goptions, logctx, actx,
++			     mctx))
+ 	{
+ 		cfg_obj_log(zoptions, logctx, ISC_LOG_ERROR,
+ 			    "zone '%s': mirror zones cannot be used if "
+@@ -5215,6 +5220,17 @@ check_viewconf(const cfg_obj_t *config, const cfg_obj_t *voptions,
+ 
+ 	cfg_aclconfctx_create(mctx, &actx);
+ 
++	if (vclass != dns_rdataclass_in) {
++		if (check_recursion(config, voptions, dns_rdataclass_in,
++				    options, logctx, actx, mctx))
++		{
++			cfg_obj_log(opts, logctx, ISC_LOG_WARNING,
++				    "recursion will be disabled for "
++				    "non-IN view '%s'",
++				    viewname);
++		}
++	}
++
+ 	if (voptions != NULL) {
+ 		(void)cfg_map_get(voptions, "zone", &zones);
+ 	} else {
+-- 
+2.35.6
+
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-5946_p2.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-5946_p2.patch
new file mode 100644
index 0000000000..4ed15d72f1
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-5946_p2.patch
@@ -0,0 +1,244 @@
+From 04092ed136c8a6db2b1059dcd32693d57a7bdc24 Mon Sep 17 00:00:00 2001
+From: Evan Hunt <each@isc.org>
+Date: Wed, 4 Mar 2026 13:24:52 -0800
+Subject: [PATCH] Disable UPDATE and NOTIFY for non-IN classes
+
+Return NOTIMP for UPDATE and NOTIFY requests received for views with a
+class other than IN.  Only QUERY is now supported for non-IN views such
+as CHAOS.
+
+When running dns dns_rdata_tostruct() with types that are only defined
+for class IN, ensure that the class is correct before proceeding.
+
+Add an assertion that any zone being updated is of class IN. (Note
+that previously, a DLZ zone could have its class value set incorrectly
+to NONE; this has been fixed.)
+
+This addresses YWH-PGM40640-70 and YWH-PGM40640-73 (as well as any
+similar problems that might have occurred in the future) by minimizing
+the code paths that can be reached by rdata classes other than IN, so it
+is safe for the implementation to assume that rdatatypes that are only
+defined for class IN, such as SVCB or WKS, have been parsed and
+validated, and not accepted as unknown/opaque data.
+
+Fixes: isc-projects/bind9#5777
+Fixes: isc-projects/bind9#5779
+
+CVE: CVE-2026-5946
+Upstream-Status: Backport [https://gitlab.com/isc-projects/bind9/-/commit/04092ed136c8a6db2b1059dcd32693d57a7bdc24]
+
+(cherry picked from commit a6d8e330ed6cf0021bff3f00aa1dc7a296f5aec0)
+(cherry picked from commit 04092ed136c8a6db2b1059dcd32693d57a7bdc24)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ bin/named/server.c |  2 ++
+ lib/dns/adb.c      |  2 +-
+ lib/ns/client.c    |  8 ++++++++
+ lib/ns/update.c    | 41 ++++++++++++++++++++++-------------------
+ 4 files changed, 33 insertions(+), 20 deletions(-)
+
+diff --git a/bin/named/server.c b/bin/named/server.c
+index 307f10cee3..43c4023fb7 100644
+--- a/bin/named/server.c
++++ b/bin/named/server.c
+@@ -1987,10 +1987,12 @@ dlzconfigure_callback(dns_view_t *view, dns_dlzdb_t *dlzdb, dns_zone_t *zone) {
+ 	dns_rdataclass_t zclass = view->rdclass;
+ 	isc_result_t result;
+ 
++	dns_zone_setclass(zone, zclass);
+ 	result = dns_zonemgr_managezone(named_g_server->zonemgr, zone);
+ 	if (result != ISC_R_SUCCESS) {
+ 		return result;
+ 	}
++
+ 	dns_zone_setstats(zone, named_g_server->zonestats);
+ 
+ 	return named_zone_configure_writeable_dlz(dlzdb, zone, zclass, origin);
+diff --git a/lib/dns/adb.c b/lib/dns/adb.c
+index 87fc357cd8..21ae217a38 100644
+--- a/lib/dns/adb.c
++++ b/lib/dns/adb.c
+@@ -949,7 +949,7 @@ import_rdataset(dns_adbname_t *adbname, dns_rdataset_t *rdataset,
+ 	INSIST(DNS_ADB_VALID(adb));
+ 
+ 	rdtype = rdataset->type;
+-	INSIST((rdtype == dns_rdatatype_a) || (rdtype == dns_rdatatype_aaaa));
++	REQUIRE(rdtype == dns_rdatatype_a || rdtype == dns_rdatatype_aaaa);
+ 
+ 	addr_bucket = DNS_ADB_INVALIDBUCKET;
+ 	new_addresses_added = false;
+diff --git a/lib/ns/client.c b/lib/ns/client.c
+index 97e99019a4..4c538f5f9f 100644
+--- a/lib/ns/client.c
++++ b/lib/ns/client.c
+@@ -2337,6 +2337,10 @@ ns__client_request(isc_nmhandle_t *handle, isc_result_t eresult,
+ 		break;
+ 	case dns_opcode_update:
+ 		CTRACE("update");
++		if (client->view->rdclass != dns_rdataclass_in) {
++			ns_client_error(client, DNS_R_NOTIMP);
++			break;
++		}
+ #ifdef HAVE_DNSTAP
+ 		dns_dt_send(client->view, DNS_DTTYPE_UQ, &client->peeraddr,
+ 			    &client->destsockaddr, TCP_CLIENT(client), NULL,
+@@ -2347,6 +2351,10 @@ ns__client_request(isc_nmhandle_t *handle, isc_result_t eresult,
+ 		break;
+ 	case dns_opcode_notify:
+ 		CTRACE("notify");
++		if (client->view->rdclass != dns_rdataclass_in) {
++			ns_client_error(client, DNS_R_NOTIMP);
++			break;
++		}
+ 		ns_client_settimeout(client, 60);
+ 		ns_notify_start(client, handle);
+ 		break;
+diff --git a/lib/ns/update.c b/lib/ns/update.c
+index 415836fd13..d002019fdf 100644
+--- a/lib/ns/update.c
++++ b/lib/ns/update.c
+@@ -999,7 +999,9 @@ ssu_checkrr(void *data, rr_t *rr) {
+ 		RUNTIME_CHECK(result == ISC_R_SUCCESS);
+ 		target = &ptr.ptr;
+ 	}
+-	if (rr->rdata.type == dns_rdatatype_srv) {
++	if (rr->rdata.rdclass == dns_rdataclass_in &&
++	    rr->rdata.type == dns_rdatatype_srv)
++	{
+ 		result = dns_rdata_tostruct(&rr->rdata, &srv, NULL);
+ 		RUNTIME_CHECK(result == ISC_R_SUCCESS);
+ 		target = &srv.target;
+@@ -1354,7 +1356,10 @@ replaces_p(dns_rdata_t *update_rr, dns_rdata_t *db_rr) {
+ 			return true;
+ 		}
+ 	}
+-	if (db_rr->type == dns_rdatatype_wks) {
++
++	if (db_rr->rdclass == dns_rdataclass_in &&
++	    db_rr->type == dns_rdatatype_wks)
++	{
+ 		/*
+ 		 * Compare the address and protocol fields only.  These
+ 		 * form the first five bytes of the RR data.  Do a
+@@ -1497,8 +1502,7 @@ cleanup:
+  * 'rdata', and 'ttl', respectively.
+  */
+ static void
+-get_current_rr(dns_message_t *msg, dns_section_t section,
+-	       dns_rdataclass_t zoneclass, dns_name_t **name,
++get_current_rr(dns_message_t *msg, dns_section_t section, dns_name_t **name,
+ 	       dns_rdata_t *rdata, dns_rdatatype_t *covers, dns_ttl_t *ttl,
+ 	       dns_rdataclass_t *update_class) {
+ 	dns_rdataset_t *rdataset;
+@@ -1514,7 +1518,7 @@ get_current_rr(dns_message_t *msg, dns_section_t section,
+ 	dns_rdataset_current(rdataset, rdata);
+ 	INSIST(dns_rdataset_next(rdataset) == ISC_R_NOMORE);
+ 	*update_class = rdata->rdclass;
+-	rdata->rdclass = zoneclass;
++	rdata->rdclass = dns_rdataclass_in;
+ }
+ 
+ /*%
+@@ -1616,7 +1620,6 @@ send_update_event(ns_client_t *client, dns_zone_t *zone) {
+ 	dns_message_t *request = client->message;
+ 	isc_mem_t *mctx = client->manager->mctx;
+ 	dns_aclenv_t *env = client->manager->aclenv;
+-	dns_rdataclass_t zoneclass;
+ 	dns_rdatatype_t covers;
+ 	dns_name_t *zonename = NULL;
+ 	unsigned int *maxbytype = NULL;
+@@ -1626,10 +1629,12 @@ send_update_event(ns_client_t *client, dns_zone_t *zone) {
+ 
+ 	CHECK(dns_zone_getdb(zone, &db));
+ 	zonename = dns_db_origin(db);
+-	zoneclass = dns_db_class(db);
+ 	dns_zone_getssutable(zone, &ssutable);
+ 	dns_db_currentversion(db, &ver);
+ 
++	/* Updates are only supported for class IN. */
++	INSIST(dns_zone_getclass(zone) == dns_rdataclass_in);
++
+ 	/*
+ 	 * Update message processing can leak record existence information
+ 	 * so check that we are allowed to query this zone.  Additionally,
+@@ -1680,13 +1685,13 @@ send_update_event(ns_client_t *client, dns_zone_t *zone) {
+ 
+ 		INSIST(ssutable == NULL || update < maxbytypelen);
+ 
+-		get_current_rr(request, DNS_SECTION_UPDATE, zoneclass, &name,
+-			       &rdata, &covers, &ttl, &update_class);
++		get_current_rr(request, DNS_SECTION_UPDATE, &name, &rdata,
++			       &covers, &ttl, &update_class);
+ 
+ 		if (!dns_name_issubdomain(name, zonename)) {
+ 			FAILC(DNS_R_NOTZONE, "update RR is outside zone");
+ 		}
+-		if (update_class == zoneclass) {
++		if (update_class == dns_rdataclass_in) {
+ 			/*
+ 			 * Check for meta-RRs.  The RFC2136 pseudocode says
+ 			 * check for ANY|AXFR|MAILA|MAILB, but the text adds
+@@ -1776,7 +1781,6 @@ send_update_event(ns_client_t *client, dns_zone_t *zone) {
+ 			}
+ 
+ 			if (update_class == dns_rdataclass_any &&
+-			    zoneclass == dns_rdataclass_in &&
+ 			    (rdata.type == dns_rdatatype_ptr ||
+ 			     rdata.type == dns_rdatatype_srv))
+ 			{
+@@ -2860,7 +2864,6 @@ update_action(isc_task_t *task, isc_event_t *event) {
+ 	isc_mem_t *mctx = client->mctx;
+ 	dns_rdatatype_t covers;
+ 	dns_message_t *request = client->message;
+-	dns_rdataclass_t zoneclass;
+ 	dns_name_t *zonename = NULL;
+ 	dns_fixedname_t tmpnamefixed;
+ 	dns_name_t *tmpname = NULL;
+@@ -2880,9 +2883,9 @@ update_action(isc_task_t *task, isc_event_t *event) {
+ 
+ 	CHECK(dns_zone_getdb(zone, &db));
+ 	zonename = dns_db_origin(db);
+-	zoneclass = dns_db_class(db);
+ 	options = dns_zone_getoptions(zone);
+ 
++	INSIST(dns_zone_getclass(zone) == dns_rdataclass_in);
+ 	/*
+ 	 * Get old and new versions now that queryacl has been checked.
+ 	 */
+@@ -2903,8 +2906,8 @@ update_action(isc_task_t *task, isc_event_t *event) {
+ 		dns_rdataclass_t update_class;
+ 		bool flag;
+ 
+-		get_current_rr(request, DNS_SECTION_PREREQUISITE, zoneclass,
+-			       &name, &rdata, &covers, &ttl, &update_class);
++		get_current_rr(request, DNS_SECTION_PREREQUISITE, &name, &rdata,
++			       &covers, &ttl, &update_class);
+ 
+ 		if (ttl != 0) {
+ 			PREREQFAILC(DNS_R_FORMERR,
+@@ -2967,7 +2970,7 @@ update_action(isc_task_t *task, isc_event_t *event) {
+ 						"prerequisite not satisfied");
+ 				}
+ 			}
+-		} else if (update_class == zoneclass) {
++		} else if (update_class == dns_rdataclass_in) {
+ 			/* "temp<rr.name, rr.type> += rr;" */
+ 			result = temp_append(&temp, name, &rdata);
+ 			if (result != ISC_R_SUCCESS) {
+@@ -3029,10 +3032,10 @@ update_action(isc_task_t *task, isc_event_t *event) {
+ 
+ 		INSIST(ssutable == NULL || update < maxbytypelen);
+ 
+-		get_current_rr(request, DNS_SECTION_UPDATE, zoneclass, &name,
+-			       &rdata, &covers, &ttl, &update_class);
++		get_current_rr(request, DNS_SECTION_UPDATE, &name, &rdata,
++			       &covers, &ttl, &update_class);
+ 
+-		if (update_class == zoneclass) {
++		if (update_class == dns_rdataclass_in) {
+ 			/*
+ 			 * RFC1123 doesn't allow MF and MD in master files.
+ 			 */
+-- 
+2.35.6
+
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-5946_p3.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-5946_p3.patch
new file mode 100644
index 0000000000..9e102015c3
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-5946_p3.patch
@@ -0,0 +1,169 @@
+From 5c6833d72e2720701e687fd6364ffdc6640e8329 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ond=C5=99ej=20Sur=C3=BD?= <ondrej@isc.org>
+Date: Wed, 4 Mar 2026 10:46:58 +0100
+Subject: [PATCH] Validate DNS message CLASS early in request processing
+
+Reject requests with unsupported or misused CLASS values before
+further processing.  Only IN, CH, HS, RESERVED0 (for DNS Cookies),
+ANY (for TKEY negotiation), and NONE (for DNS UPDATE) are accepted;
+all other classes return NOTIMP.  Misuse of NONE or ANY outside
+their allowed contexts returns FORMERR.
+
+This adds further protection against bugs of the same general class
+as YWH-PGM40640-70 and YWH-PGM40640-73.
+
+CVE: CVE-2026-5946
+Upstream-Status: Backport [https://gitlab.com/isc-projects/bind9/-/commit/b247dbb3506ef628a683d184fbc6a99fad45ed94]
+
+(cherry picked from commit 0a687451505037e9f9a850c9cb113aed4995b03f)
+(cherry picked from commit b247dbb3506ef628a683d184fbc6a99fad45ed94)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ bin/tests/system/unknown/tests.sh | 17 +++++++----
+ lib/ns/client.c                   | 51 ++++++++++++++++++++++++++-----
+ 2 files changed, 55 insertions(+), 13 deletions(-)
+
+diff --git a/bin/tests/system/unknown/tests.sh b/bin/tests/system/unknown/tests.sh
+index eb61f21f28..cbc2943f17 100644
+--- a/bin/tests/system/unknown/tests.sh
++++ b/bin/tests/system/unknown/tests.sh
+@@ -25,6 +25,11 @@ dig_cmd() {
+   "$DIG" $DIGOPTS "$@" | grep -v '^;'
+ }
+ 
++dig_full() {
++  # shellcheck disable=SC2086
++  "$DIG" $DIGOPTS "$@"
++}
++
+ n=$((n + 1))
+ echo_i "querying for various representations of an IN A record ($n)"
+ for i in 1 2 3 4 5 6 7 8 9 10 11 12; do
+@@ -81,8 +86,8 @@ n=$((n + 1))
+ echo_i "querying for various representations of a CLASS10 TYPE1 record ($n)"
+ for i in 1 2; do
+   ret=0
+-  dig_cmd +short @10.53.0.1 a$i.example a class10 >dig.out.$i.test$n
+-  echo '\# 4 0A000001' | diff - dig.out.$i.test$n || ret=1
++  dig_full @10.53.0.1 a$i.example a class10 >dig.out.$i.test$n
++  grep -q "NOTIMP" dig.out.$i.test$n || ret=1
+   if [ $ret != 0 ]; then
+     echo_i "#$i failed"
+   fi
+@@ -93,8 +98,8 @@ n=$((n + 1))
+ echo_i "querying for various representations of a CLASS10 TXT record ($n)"
+ for i in 1 2 3 4; do
+   ret=0
+-  dig_cmd +short @10.53.0.1 txt$i.example txt class10 >dig.out.$i.test$n
+-  echo '"hello"' | diff - dig.out.$i.test$n || ret=1
++  dig_full @10.53.0.1 txt$i.example txt class10 >dig.out.$i.test$n
++  grep -q "NOTIMP" dig.out.$i.test$n || ret=1
+   if [ $ret != 0 ]; then
+     echo_i "#$i failed"
+   fi
+@@ -105,8 +110,8 @@ n=$((n + 1))
+ echo_i "querying for various representations of a CLASS10 TYPE123 record ($n)"
+ for i in 1 2; do
+   ret=0
+-  dig_cmd +short @10.53.0.1 unk$i.example type123 class10 >dig.out.$i.test$n
+-  echo '\# 1 00' | diff - dig.out.$i.test$n || ret=1
++  dig_full @10.53.0.1 unk$i.example type123 class10 >dig.out.$i.test$n
++  grep -q "NOTIMP" dig.out.$i.test$n || ret=1
+   if [ $ret != 0 ]; then
+     echo_i "#$i failed"
+   fi
+diff --git a/lib/ns/client.c b/lib/ns/client.c
+index 4c538f5f9f..8680cd6c47 100644
+--- a/lib/ns/client.c
++++ b/lib/ns/client.c
+@@ -44,6 +44,7 @@
+ #include <dns/dispatch.h>
+ #include <dns/dnstap.h>
+ #include <dns/edns.h>
++#include <dns/enumclass.h>
+ #include <dns/events.h>
+ #include <dns/message.h>
+ #include <dns/peer.h>
+@@ -2083,7 +2084,9 @@ ns__client_request(isc_nmhandle_t *handle, isc_result_t eresult,
+ 		}
+ 	}
+ 
+-	if (client->message->rdclass == 0) {
++	char classbuf[DNS_RDATACLASS_FORMATSIZE];
++	switch (client->message->rdclass) {
++	case dns_rdataclass_reserved0:
+ 		if ((client->attributes & NS_CLIENTATTR_WANTCOOKIE) != 0 &&
+ 		    client->message->opcode == dns_opcode_query &&
+ 		    client->message->counts[DNS_SECTION_QUESTION] == 0U)
+@@ -2102,12 +2105,46 @@ ns__client_request(isc_nmhandle_t *handle, isc_result_t eresult,
+ 			return;
+ 		}
+ 
++		ns_client_dumpmessage(client,
++				      "message class could not be determined");
++		ns_client_error(client, notimp ? DNS_R_NOTIMP : DNS_R_FORMERR);
++		return;
++	case dns_rdataclass_in:
++		break;
++	case dns_rdataclass_chaos:
++		break;
++	case dns_rdataclass_hs:
++		break;
++	case dns_rdataclass_none:
++		if (client->message->opcode != dns_opcode_update) {
++			ns_client_dumpmessage(client,
++					      "message class NONE can be only "
++					      "used in DNS updates");
++			ns_client_error(client, DNS_R_FORMERR);
++			return;
++		}
++		break;
++	case dns_rdataclass_any:
++		/*
++		 * Required for TKEY negotiation.
++		 */
++		if (client->message->tkey == 0) {
++			ns_client_dumpmessage(client,
++					      "message class ANY can be only "
++					      "used for TKEY negotiation");
++			ns_client_error(client, DNS_R_FORMERR);
++			return;
++		}
++		break;
++	default:
++		dns_rdataclass_format(client->message->rdclass, classbuf,
++				      sizeof(classbuf));
++		ns_client_dumpmessage(client, NULL);
+ 		ns_client_log(client, NS_LOGCATEGORY_CLIENT,
+ 			      NS_LOGMODULE_CLIENT, ISC_LOG_DEBUG(1),
+-			      "message class could not be determined");
+-		ns_client_dumpmessage(client, "message class could not be "
+-					      "determined");
+-		ns_client_error(client, notimp ? DNS_R_NOTIMP : DNS_R_FORMERR);
++			      "invalid message class: %s", classbuf);
++
++		ns_client_error(client, DNS_R_NOTIMP);
+ 		return;
+ 	}
+ 
+@@ -2140,7 +2177,7 @@ ns__client_request(isc_nmhandle_t *handle, isc_result_t eresult,
+ 		ns_client_log(client, NS_LOGCATEGORY_CLIENT,
+ 			      NS_LOGMODULE_CLIENT, ISC_LOG_DEBUG(1),
+ 			      "no matching view in class '%s'", classname);
+-		ns_client_dumpmessage(client, "no matching view in class");
++		ns_client_dumpmessage(client, NULL);
+ 		ns_client_extendederror(client, DNS_EDE_PROHIBITED, NULL);
+ 		ns_client_error(client, notimp ? DNS_R_NOTIMP : DNS_R_REFUSED);
+ 		return;
+@@ -2781,7 +2818,7 @@ ns_client_dumpmessage(ns_client_t *client, const char *reason) {
+ 	int len = 1024;
+ 	isc_result_t result;
+ 
+-	if (!isc_log_wouldlog(ns_lctx, ISC_LOG_DEBUG(1))) {
++	if (!isc_log_wouldlog(ns_lctx, ISC_LOG_DEBUG(1)) || reason == NULL) {
+ 		return;
+ 	}
+ 
+-- 
+2.35.6
+
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-5946_p4.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-5946_p4.patch
new file mode 100644
index 0000000000..c552168f81
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-5946_p4.patch
@@ -0,0 +1,56 @@
+From d34a7e777747cfe1a3f9a133b031577921653dbf Mon Sep 17 00:00:00 2001
+From: Mark Andrews <marka@isc.org>
+Date: Wed, 4 Mar 2026 10:00:56 +1100
+Subject: [PATCH] Reject meta-classes in UPDATE and NOTIFY messages
+
+NOTIFY and UPDATE messages must specify a data class in the
+QUESTION/ZONE section.  NONE and ANY are meta-classes and not
+appropriate here.  Return FORMERR if either is used.
+
+Rejecting messages with a query class of NONE addresses YWH-PGM40640-72,
+YWH-PGM40640-82, and YWH-PGM40640-83.  Rejecting messages with a query
+class of ANY addresses YWH-PGM40640-87, YWH-PGM40640-88, and
+YWH-PGM40640-117.
+
+Fixes: isc-projects/bind9#5778
+Fixes: isc-projects/bind9#5782
+Fixes: isc-projects/bind9#5783
+Fixes: isc-projects/bind9#5797
+Fixes: isc-projects/bind9#5798
+Fixes: isc-projects/bind9#5853
+
+CVE: CVE-2026-5946
+Upstream-Status: Backport [https://gitlab.com/isc-projects/bind9/-/commit/185c10981b941bfa5b753b3624b6e11ccca8737f]
+
+(cherry picked from commit c66a1b1e1bfd6c79d7b9bc8d4a59e69f4faa1563)
+(cherry picked from commit 185c10981b941bfa5b753b3624b6e11ccca8737f)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ lib/dns/message.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/lib/dns/message.c b/lib/dns/message.c
+index 541a854db0..38f5640500 100644
+--- a/lib/dns/message.c
++++ b/lib/dns/message.c
+@@ -1080,6 +1080,17 @@ getquestions(isc_buffer_t *source, dns_message_t *msg, dns_decompress_t *dctx,
+ 		rdtype = isc_buffer_getuint16(source);
+ 		rdclass = isc_buffer_getuint16(source);
+ 
++		/*
++		 * Notify and update messages need to specify the data class.
++		 */
++		if ((msg->opcode == dns_opcode_update ||
++		     msg->opcode == dns_opcode_notify) &&
++		    (rdclass == dns_rdataclass_none ||
++		     rdclass == dns_rdataclass_any))
++		{
++			DO_ERROR(DNS_R_FORMERR);
++		}
++
+ 		/*
+ 		 * If this class is different than the one we already read,
+ 		 * this is an error.
+-- 
+2.35.6
+
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-5946_p5.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-5946_p5.patch
new file mode 100644
index 0000000000..59bd66d345
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-5946_p5.patch
@@ -0,0 +1,40 @@
+From 544f128439772cd710e541df1e1081c308642533 Mon Sep 17 00:00:00 2001
+From: Evan Hunt <each@isc.org>
+Date: Tue, 17 Mar 2026 13:24:43 -0700
+Subject: [PATCH] Skip "deny-answer-address" for non-IN addresses
+
+Ensure that we don't attempt an ACL match for answer addresses
+when handling a class-CHAOS zone. This is an additional line of
+defense for YWH-PGM40640-74.
+
+CVE: CVE-2026-5946
+Upstream-Status: Backport [https://gitlab.com/isc-projects/bind9/-/commit/772d1d5f905c819d7155e76a08c33218bfcc973e]
+
+(cherry picked from commit e62673c765b52307c800e86f0185fe52b573c145)
+(cherry picked from commit 772d1d5f905c819d7155e76a08c33218bfcc973e)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ lib/dns/resolver.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/lib/dns/resolver.c b/lib/dns/resolver.c
+index c1584c3399..7788171bf2 100644
+--- a/lib/dns/resolver.c
++++ b/lib/dns/resolver.c
+@@ -7333,6 +7333,13 @@ is_answeraddress_allowed(dns_view_t *view, dns_name_t *name,
+ 		}
+ 	}
+ 
++	/*
++	 * deny-answer-address doesn't apply to non-IN classes.
++	 */
++	if (rdataset->rdclass != dns_rdataclass_in) {
++		return true;
++	}
++
+ 	/*
+ 	 * Otherwise, search the filter list for a match for each
+ 	 * address record.  If a match is found, the address should be
+-- 
+2.35.6
+
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-5946_p6.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-5946_p6.patch
new file mode 100644
index 0000000000..66d8dbd268
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-5946_p6.patch
@@ -0,0 +1,336 @@
+From 760a2e15e3f022a4dcdf9f8f2da3163c2480713f Mon Sep 17 00:00:00 2001
+From: Evan Hunt <each@isc.org>
+Date: Tue, 17 Mar 2026 13:45:11 -0700
+Subject: [PATCH] Test CHAOS view recursion behavior
+
+Check that recursive and forward queries to views of type CHAOS
+are REFUSED, but that authoritative queries are answered correctly.
+
+CVE: CVE-2026-5946
+Upstream-Status: Backport [https://gitlab.com/isc-projects/bind9/-/commit/ba6b159d880e803decb85fdc88280b23d6f3a652]
+
+Backport Changes:
+- Adjusted the added isctest.check.formerr helper to match the
+  BIND 9.18.44 check.py dns_rcode import style.
+
+(cherry picked from commit f33927cd3dd1195f3e70f5798ff7c384f265867e)
+(cherry picked from commit ba6b159d880e803decb85fdc88280b23d6f3a652)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ bin/tests/system/checkconf/tests.sh           | 11 ++++
+ .../checkconf/warn-chaos-recursion.conf       | 12 +++++
+ bin/tests/system/class/ns1/chaos.db.in        |  4 ++
+ bin/tests/system/class/ns1/named.conf.j2      | 31 +++++++++++
+ bin/tests/system/class/ns2/example.db.in      |  6 +++
+ bin/tests/system/class/ns2/localhost.db.in    |  6 +++
+ bin/tests/system/class/ns2/named.conf.j2      | 42 +++++++++++++++
+ bin/tests/system/class/ns3/named.conf.j2      | 28 ++++++++++
+ bin/tests/system/class/setup.sh               | 19 +++++++
+ bin/tests/system/class/tests_class_chaos.py   | 54 +++++++++++++++++++
+ bin/tests/system/isctest/check.py             |  4 ++
+ 11 files changed, 217 insertions(+)
+ create mode 100644 bin/tests/system/checkconf/warn-chaos-recursion.conf
+ create mode 100644 bin/tests/system/class/ns1/chaos.db.in
+ create mode 100644 bin/tests/system/class/ns1/named.conf.j2
+ create mode 100644 bin/tests/system/class/ns2/example.db.in
+ create mode 100644 bin/tests/system/class/ns2/localhost.db.in
+ create mode 100644 bin/tests/system/class/ns2/named.conf.j2
+ create mode 100644 bin/tests/system/class/ns3/named.conf.j2
+ create mode 100644 bin/tests/system/class/setup.sh
+ create mode 100644 bin/tests/system/class/tests_class_chaos.py
+
+diff --git a/bin/tests/system/checkconf/tests.sh b/bin/tests/system/checkconf/tests.sh
+index 5da8a20ee1..f29949535a 100644
+--- a/bin/tests/system/checkconf/tests.sh
++++ b/bin/tests/system/checkconf/tests.sh
+@@ -820,5 +820,16 @@ if [ $ret != 0 ]; then
+ fi
+ status=$((status + ret))
+ 
++n=$((n + 1))
++echo_i "check 'recursion yes;' is warned and disabled in a non-IN view ($n)"
++ret=0
++$CHECKCONF warn-chaos-recursion.conf >checkconf.out$n 2>&1 || ret=1
++grep -F "recursion will be disabled" checkconf.out$n >/dev/null || ret=1
++if [ $ret != 0 ]; then
++  echo_i "failed"
++  ret=1
++fi
++status=$((status + ret))
++
+ echo_i "exit status: $status"
+ [ $status -eq 0 ] || exit 1
+diff --git a/bin/tests/system/checkconf/warn-chaos-recursion.conf b/bin/tests/system/checkconf/warn-chaos-recursion.conf
+new file mode 100644
+index 0000000000..01965102a4
+--- /dev/null
++++ b/bin/tests/system/checkconf/warn-chaos-recursion.conf
+@@ -0,0 +1,12 @@
++options {
++	directory ".";
++};
++
++view chaos ch {
++        match-clients { any; };
++        recursion yes;
++        zone "." {
++                type hint;
++                file "chaos.hints";
++        };
++};
+diff --git a/bin/tests/system/class/ns1/chaos.db.in b/bin/tests/system/class/ns1/chaos.db.in
+new file mode 100644
+index 0000000000..43ca58ffa8
+--- /dev/null
++++ b/bin/tests/system/class/ns1/chaos.db.in
+@@ -0,0 +1,4 @@
++.                  CH NS ns.root.
++ns.root.           CH A ns.root. 1
++ns.root.           CH AAAA \# 1 00
++
+diff --git a/bin/tests/system/class/ns1/named.conf.j2 b/bin/tests/system/class/ns1/named.conf.j2
+new file mode 100644
+index 0000000000..76f85fc6c9
+--- /dev/null
++++ b/bin/tests/system/class/ns1/named.conf.j2
+@@ -0,0 +1,31 @@
++options {
++	query-source address 10.53.0.1;
++	notify-source 10.53.0.1;
++	transfer-source 10.53.0.1;
++	port @PORT@;
++	pid-file "named.pid";
++	listen-on { 10.53.0.1; };
++	listen-on-v6 { none; };
++};
++
++key rndc_key {
++	secret "1234abcd8765";
++	algorithm @DEFAULT_HMAC@;
++};
++
++controls {
++	inet 10.53.0.1 port @CONTROLPORT@ allow { any; } keys { rndc_key; };
++};
++
++view chaos ch {
++	match-clients { any; };
++	recursion yes;
++	zone "." {
++		type hint;
++		file "chaos.db";
++	};
++	zone "version.bind" {
++		type primary;
++		database "_builtin version";
++	};
++};
+diff --git a/bin/tests/system/class/ns2/example.db.in b/bin/tests/system/class/ns2/example.db.in
+new file mode 100644
+index 0000000000..a658ddbd89
+--- /dev/null
++++ b/bin/tests/system/class/ns2/example.db.in
+@@ -0,0 +1,6 @@
++$TTL 300
++@ CH SOA ns.example. hostmaster.example. 1 3600 1200 604800 300
++@ CH NS ns.example.
++ns CH TXT "ns"
++a CH A target.example. 1
++target CH TXT "target"
+diff --git a/bin/tests/system/class/ns2/localhost.db.in b/bin/tests/system/class/ns2/localhost.db.in
+new file mode 100644
+index 0000000000..baa5f74862
+--- /dev/null
++++ b/bin/tests/system/class/ns2/localhost.db.in
+@@ -0,0 +1,6 @@
++$ORIGIN 1.0.0.127.in-addr.arpa.
++$TTL 300
++@ IN SOA ns hostmaster 1 3600 900 604800 300
++@ IN NS ns
++ns IN A 127.0.0.1
++@ IN KX 10 target.example.
+diff --git a/bin/tests/system/class/ns2/named.conf.j2 b/bin/tests/system/class/ns2/named.conf.j2
+new file mode 100644
+index 0000000000..5618c15216
+--- /dev/null
++++ b/bin/tests/system/class/ns2/named.conf.j2
+@@ -0,0 +1,42 @@
++options {
++	directory ".";
++	query-source address 10.53.0.2;
++	notify-source 10.53.0.2;
++	transfer-source 10.53.0.2;
++	port @PORT@;
++	pid-file "named.pid";
++	listen-on { 10.53.0.2; };
++	listen-on-v6 { none; };
++};
++
++key rndc_key {
++	secret "1234abcd8765";
++	algorithm @DEFAULT_HMAC@;
++};
++
++controls {
++	inet 10.53.0.2 port @CONTROLPORT@ allow { any; } keys { rndc_key; };
++};
++
++view default {
++	match-clients { any; };
++	recursion no;
++        dnssec-validation no;
++	zone "1.0.0.127.in-addr.arpa." {
++		type primary;
++		file "localhost.db";
++		update-policy {
++			grant * tcp-self . ANY;
++		};
++	};
++};
++
++view chaos ch {
++	match-clients { any; };
++	recursion no;
++	zone example {
++		type primary;
++		file "example.db";
++		allow-update { any; };
++	};
++};
+diff --git a/bin/tests/system/class/ns3/named.conf.j2 b/bin/tests/system/class/ns3/named.conf.j2
+new file mode 100644
+index 0000000000..3016333aad
+--- /dev/null
++++ b/bin/tests/system/class/ns3/named.conf.j2
+@@ -0,0 +1,28 @@
++options {
++	directory ".";
++	query-source address 10.53.0.3;
++	notify-source 10.53.0.3;
++	transfer-source 10.53.0.3;
++	port @PORT@;
++	pid-file "named.pid";
++	listen-on { 10.53.0.3; };
++	listen-on-v6 { none; };
++};
++
++key rndc_key {
++	secret "1234abcd8765";
++	algorithm @DEFAULT_HMAC@;
++};
++
++controls {
++	inet 10.53.0.3 port @CONTROLPORT@ allow { any; } keys { rndc_key; };
++};
++
++view chaos ch {
++	match-clients { any; };
++	recursion yes;
++        dnssec-validation no;
++        forward only;
++        forwarders port @PORT@ { 10.53.0.2; };
++        deny-answer-addresses { 0.0.0.0/0; ::/0; };
++};
+diff --git a/bin/tests/system/class/setup.sh b/bin/tests/system/class/setup.sh
+new file mode 100644
+index 0000000000..c70a2f8290
+--- /dev/null
++++ b/bin/tests/system/class/setup.sh
+@@ -0,0 +1,19 @@
++#!/bin/sh -e
++
++# Copyright (C) Internet Systems Consortium, Inc. ("ISC")
++#
++# SPDX-License-Identifier: MPL-2.0
++#
++# This Source Code Form is subject to the terms of the Mozilla Public
++# License, v. 2.0.  If a copy of the MPL was not distributed with this
++# file, you can obtain one at https://mozilla.org/MPL/2.0/.
++#
++# See the COPYRIGHT file distributed with this work for additional
++# information regarding copyright ownership.
++
++# shellcheck source=conf.sh
++. ../conf.sh
++
++cp ns1/chaos.db.in ns1/chaos.db
++cp ns2/example.db.in ns2/example.db
++cp ns2/localhost.db.in ns2/localhost.db
+diff --git a/bin/tests/system/class/tests_class_chaos.py b/bin/tests/system/class/tests_class_chaos.py
+new file mode 100644
+index 0000000000..5b4fef9ae4
+--- /dev/null
++++ b/bin/tests/system/class/tests_class_chaos.py
+@@ -0,0 +1,54 @@
++# Copyright (C) Internet Systems Consortium, Inc. ("ISC")
++#
++# SPDX-License-Identifier: MPL-2.0
++#
++# This Source Code Form is subject to the terms of the Mozilla Public
++# License, v. 2.0.  If a copy of the MPL was not distributed with this
++# file, you can obtain one at https://mozilla.org/MPL/2.0/.
++#
++# See the COPYRIGHT file distributed with this work for additional
++# information regarding copyright ownership.
++
++
++import dns.opcode
++import pytest
++
++import isctest
++
++pytestmark = pytest.mark.extra_artifacts(
++    [
++        "*/*.db",
++    ]
++)
++
++
++def test_chaos_recursion():
++    msg = isctest.query.create("foo.example.", "TXT", qclass="CH")
++    res = isctest.query.udp(msg, "10.53.0.1")
++    isctest.check.refused(res)
++
++
++def test_chaos_auth():
++    msg = isctest.query.create("a.example.", "A", qclass="CH")
++    res = isctest.query.udp(msg, "10.53.0.2")
++    isctest.check.noerror(res)
++
++
++def test_chaos_forward():
++    msg = isctest.query.create("a.example.", "A", qclass="CH")
++    res = isctest.query.udp(msg, "10.53.0.3")
++    isctest.check.refused(res)
++
++
++def test_chaos_notify():
++    msg = isctest.query.create("example.", "SOA", qclass="CH", rd=False, dnssec=False)
++    msg.set_opcode(dns.opcode.NOTIFY)
++    msg.flags = dns.opcode.to_flags(dns.opcode.NOTIFY)
++    res = isctest.query.udp(msg, "10.53.0.2")
++    isctest.check.notimp(res)
++
++
++def test_query_class_none():
++    msg = isctest.query.create("example.", "A", qclass="NONE")
++    res = isctest.query.udp(msg, "10.53.0.2")
++    isctest.check.formerr(res)
+diff --git a/bin/tests/system/isctest/check.py b/bin/tests/system/isctest/check.py
+index e7187b8853..597f3aaa7f 100644
+--- a/bin/tests/system/isctest/check.py
++++ b/bin/tests/system/isctest/check.py
+@@ -42,6 +42,10 @@ def servfail(message: dns.message.Message) -> None:
+     rcode(message, dns_rcode.SERVFAIL)
+ 
+ 
++def formerr(message: dns.message.Message) -> None:
++    rcode(message, dns.rcode.FORMERR)
++
++
+ def adflag(message: dns.message.Message) -> None:
+     assert (message.flags & dns.flags.AD) != 0, str(message)
+ 
+-- 
+2.35.6
+
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-5946_p7.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-5946_p7.patch
new file mode 100644
index 0000000000..8e8ae87b58
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-5946_p7.patch
@@ -0,0 +1,153 @@
+From b33de089c7955453f07345ada5386e289c6cc74c Mon Sep 17 00:00:00 2001
+From: Evan Hunt <each@isc.org>
+Date: Tue, 17 Mar 2026 13:45:11 -0700
+Subject: [PATCH] Test UPDATE behavior in CHAOS and other non-IN classes
+
+Send various UPDATE requests that are known to have caused
+crashes previously with deliberately misconfigured non-IN
+zones; confirm that UPDATE is not processed.
+
+CVE: CVE-2026-5946
+Upstream-Status: Backport [https://gitlab.com/isc-projects/bind9/-/commit/e5b3149b70ed24f7590b6bc08aad4492a00c2022]
+
+(cherry picked from commit e2f7ba2a4b6e7e5dba2fb1a2c9b2f0323e9a88be)
+(cherry picked from commit e5b3149b70ed24f7590b6bc08aad4492a00c2022)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ bin/named/server.c                           |  1 -
+ bin/tests/system/class/ns2/localhost.db.in   |  5 +
+ bin/tests/system/class/tests_class_update.py | 96 ++++++++++++++++++++
+ 3 files changed, 101 insertions(+), 1 deletion(-)
+ create mode 100644 bin/tests/system/class/tests_class_update.py
+
+diff --git a/bin/named/server.c b/bin/named/server.c
+index 59e2aa3313..577efbb299 100644
+--- a/bin/named/server.c
++++ b/bin/named/server.c
+@@ -5465,7 +5465,6 @@ configure_view(dns_view_t *view, dns_viewlist_t *viewlist, cfg_obj_t *config,
+ 				 NULL, actx, named_g_mctx, &view->cacheonacl));
+ 
+ 	if (view->rdclass != dns_rdataclass_in) {
+-		view->recursion = false;
+ 		dns_acl_none(named_g_mctx, &view->recursionacl);
+ 		dns_acl_none(named_g_mctx, &view->recursiononacl);
+ 	} else {
+diff --git a/bin/tests/system/class/ns2/localhost.db.in b/bin/tests/system/class/ns2/localhost.db.in
+index baa5f74862..a50e5167a9 100644
+--- a/bin/tests/system/class/ns2/localhost.db.in
++++ b/bin/tests/system/class/ns2/localhost.db.in
+@@ -3,4 +3,9 @@ $TTL 300
+ @ IN SOA ns hostmaster 1 3600 900 604800 300
+ @ IN NS ns
+ ns IN A 127.0.0.1
++
+ @ IN KX 10 target.example.
++@ IN PX 10 map822.example. mapx400.example.
++@ IN NSAP 0x47000580ffff0000000001e133ffffff00016200
++@ IN NSAP-PTR target.example.
++@ in EID \# 01 aa
+diff --git a/bin/tests/system/class/tests_class_update.py b/bin/tests/system/class/tests_class_update.py
+new file mode 100644
+index 0000000000..e53bbc77ea
+--- /dev/null
++++ b/bin/tests/system/class/tests_class_update.py
+@@ -0,0 +1,96 @@
++# Copyright (C) Internet Systems Consortium, Inc. ("ISC")
++#
++# SPDX-License-Identifier: MPL-2.0
++#
++# This Source Code Form is subject to the terms of the Mozilla Public
++# License, v. 2.0.  If a copy of the MPL was not distributed with this
++# file, you can obtain one at https://mozilla.org/MPL/2.0/.
++#
++# See the COPYRIGHT file distributed with this work for additional
++# information regarding copyright ownership.
++
++import socket
++import struct
++
++from dns import rdataclass, rdatatype, update
++
++import pytest
++
++import isctest
++
++pytestmark = pytest.mark.extra_artifacts(
++    [
++        "*/*.db",
++    ]
++)
++
++
++def encode_name(name: str) -> bytes:
++    out = b""
++    for label in name.rstrip(".").split("."):
++        out += bytes([len(label)]) + label.encode("ascii")
++    return out + b"\x00"
++
++
++@pytest.mark.parametrize(
++    "rdtype,rdclass,ttl,rdata",
++    [
++        (rdatatype.SRV, rdataclass.NONE, 0, b"\x00"),
++        (rdatatype.KX, rdataclass.NONE, 0, b""),
++        (rdatatype.PX, rdataclass.NONE, 0, b""),
++        (rdatatype.NSAP, rdataclass.NONE, 0, b""),
++        (rdatatype.NSAP_PTR, rdataclass.NONE, 0, b""),
++        (31, rdataclass.NONE, 0, b""),  # dnspython doesn't define type EID
++    ],
++)
++def test_class_invalid(rdtype, rdclass, ttl, rdata, named_port):
++    # these update messages are badly formatted, so we construct
++    # them manually instead of using dnspython.
++
++    # opcode=UPDATE, 1 RRset in ZONE, 1 RRset in UPDATE
++    header = struct.pack("!HHHHHH", 0, 0x2800, 1, 0, 1, 0)
++
++    # ZONE section: QNAME=<zone>, QTYPE=SOA, QCLASS=ANY
++    zone_q = encode_name("1.0.0.127.in-addr.arpa") + struct.pack("!HH", 6, 255)
++
++    # UPDATE section RR:
++    update_rr = (
++        encode_name("1.0.0.127.in-addr.arpa")
++        + struct.pack("!HHIH", rdtype, rdclass, ttl, len(rdata))
++        + rdata
++    )
++
++    m = header + zone_q + update_rr
++    packet = struct.pack("!H", len(m)) + m
++
++    with socket.create_connection(
++        ("10.53.0.2", named_port), source_address=("127.0.0.1", 0), timeout=2.0
++    ) as s:
++        s.sendall(packet)
++        try:
++            rwire = s.recv(4096)
++            res = dns.message.from_wire(rwire)
++            isctest.check.formerr(res)
++        except Exception:  # pylint: disable=broad-except
++            pass
++
++    # check the server is answering
++    msg = isctest.query.create("1.0.0.127.in-addr.arpa", "SRV")
++    res = isctest.query.udp(msg, "10.53.0.2")
++    isctest.check.noerror(res)
++    isctest.check.rr_count_eq(res.answer, 0)
++
++
++@pytest.mark.parametrize(
++    "rdtype,rdata",
++    [
++        (rdatatype.SVCB, "\\# 02 0000"),
++        (rdatatype.WKS, "\\# 02 4142"),
++        (rdatatype.WKS, "\\# 02 4344"),
++    ],
++)
++def test_class_chaosupdate(rdtype, rdata):
++    up = update.UpdateMessage("example.", rdclass=rdataclass.CHAOS)
++    up.add("foo.example.", 300, rdtype, rdata)
++    res = isctest.query.tcp(up, "10.53.0.2")
++    isctest.check.notimp(res)
+-- 
+2.35.6
+
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-5946_p8.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-5946_p8.patch
new file mode 100644
index 0000000000..216d115f80
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-5946_p8.patch
@@ -0,0 +1,225 @@
+From 992e238e6ed8e4a43948d8a103a219d2512b31f4 Mon Sep 17 00:00:00 2001
+From: Evan Hunt <each@isc.org>
+Date: Mon, 9 Mar 2026 15:50:04 +1100
+Subject: [PATCH] Test server behavior when sending various UPDATE requests
+
+Send update messages for zones with CLASS0, ANY and NONE.  The class
+ANY UPDATE also attempts to delete a KX record in an existing IN
+class zone to trigger a REQUIRE.
+
+Test that the server is still running.
+
+CVE: CVE-2026-5946
+Upstream-Status: Backport [https://gitlab.com/isc-projects/bind9/-/commit/7e3d49815c3b8243b009c29955cef018fe87b7f0]
+
+(cherry picked from commit 1fa1e84d286d5a6d9d3b72ed1c2c29142f40c81d)
+(cherry picked from commit 7e3d49815c3b8243b009c29955cef018fe87b7f0)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ bin/tests/system/class/tests_class_update.py | 45 +++++++++++++++++++-
+ bin/tests/system/nsupdate/setup.sh           |  1 +
+ bin/tests/system/nsupdate/tests.sh           | 20 +++------
+ bin/tests/system/packet.pl                   | 25 +++++++++--
+ 4 files changed, 71 insertions(+), 20 deletions(-)
+
+diff --git a/bin/tests/system/class/tests_class_update.py b/bin/tests/system/class/tests_class_update.py
+index e53bbc77ea..30e3ba6d2a 100644
+--- a/bin/tests/system/class/tests_class_update.py
++++ b/bin/tests/system/class/tests_class_update.py
+@@ -12,7 +12,7 @@
+ import socket
+ import struct
+ 
+-from dns import rdataclass, rdatatype, update
++from dns import message, rdataclass, rdatatype, update
+ 
+ import pytest
+ 
+@@ -35,6 +35,7 @@ def encode_name(name: str) -> bytes:
+ @pytest.mark.parametrize(
+     "rdtype,rdclass,ttl,rdata",
+     [
++        (rdatatype.SRV, rdataclass.NONE, 0, b"\x00\x00\x00\x00\x00\x00\x01"),
+         (rdatatype.SRV, rdataclass.NONE, 0, b"\x00"),
+         (rdatatype.KX, rdataclass.NONE, 0, b""),
+         (rdatatype.PX, rdataclass.NONE, 0, b""),
+@@ -69,7 +70,7 @@ def test_class_invalid(rdtype, rdclass, ttl, rdata, named_port):
+         s.sendall(packet)
+         try:
+             rwire = s.recv(4096)
+-            res = dns.message.from_wire(rwire)
++            res = message.from_wire(rwire)
+             isctest.check.formerr(res)
+         except Exception:  # pylint: disable=broad-except
+             pass
+@@ -94,3 +95,43 @@ def test_class_chaosupdate(rdtype, rdata):
+     up.add("foo.example.", 300, rdtype, rdata)
+     res = isctest.query.tcp(up, "10.53.0.2")
+     isctest.check.notimp(res)
++
++
++def test_class_undefined(ns2):
++    up = update.UpdateMessage(".", rdclass=257)
++    up.present(".", 0)
++    up.answer[0].rdclass = rdataclass.NONE
++    with ns2.watch_log_from_here() as watcher:
++        res = isctest.query.tcp(up, "10.53.0.2")
++        isctest.check.notimp(res)
++        watcher.wait_for_line("invalid message class: CLASS257")
++
++
++def test_class_zero(ns2):
++    up = update.UpdateMessage(".", rdclass=0)
++    up.present(".", 0)
++    up.answer[0].rdclass = rdataclass.NONE
++    with ns2.watch_log_from_here() as watcher:
++        res = isctest.query.tcp(up, "10.53.0.2")
++        isctest.check.formerr(res)
++        watcher.wait_for_line("message class could not be determined")
++
++
++def test_class_any(ns2):
++    up = update.UpdateMessage(".", rdclass=rdataclass.ANY)
++    up.present(".", 0)
++    up.answer[0].rdclass = rdataclass.NONE
++    with ns2.watch_log_from_here() as watcher:
++        res = isctest.query.tcp(up, "10.53.0.2")
++        isctest.check.formerr(res)
++        watcher.wait_for_line("message parsing failed: FORMERR")
++
++
++def test_class_none(ns2):
++    up = update.UpdateMessage(".", rdclass=rdataclass.NONE)
++    up.present(".", 0)
++    up.answer[0].rdclass = rdataclass.NONE
++    with ns2.watch_log_from_here() as watcher:
++        res = isctest.query.tcp(up, "10.53.0.2")
++        isctest.check.formerr(res)
++        watcher.wait_for_line("message parsing failed: FORMERR")
+diff --git a/bin/tests/system/nsupdate/setup.sh b/bin/tests/system/nsupdate/setup.sh
+index 4ee045facc..4402329e3b 100644
+--- a/bin/tests/system/nsupdate/setup.sh
++++ b/bin/tests/system/nsupdate/setup.sh
+@@ -61,6 +61,7 @@ update.nil              IN SOA  ns1.example.nil. hostmaster.example.nil. (
+                                 3600       ; minimum (1 hour)
+                                 )
+ update.nil.             NS      ns1.update.nil.
++update.nil.             KX      0 .
+ ns1.update.nil.         A       10.53.0.2
+ ns2.update.nil.		AAAA	::1
+ EOF
+diff --git a/bin/tests/system/nsupdate/tests.sh b/bin/tests/system/nsupdate/tests.sh
+index be0df8aaad..521ba46eff 100755
+--- a/bin/tests/system/nsupdate/tests.sh
++++ b/bin/tests/system/nsupdate/tests.sh
+@@ -340,8 +340,10 @@ grep "status: NOERROR" dig.out.ns1.$n >/dev/null || ret=1
+ n=$((n + 1))
+ ret=0
+ echo_i "check that TYPE=0 update is handled ($n)"
++nextpart ns1/named.run >/dev/null
+ echo "a0e4280000010000000100000000060001c00c000000fe000000000000" \
+-  | $PERL ../packet.pl -a 10.53.0.1 -p ${PORT} -t tcp >/dev/null || ret=1
++  | $PERL ../packet.pl -a 10.53.0.1 -p ${PORT} -t tcp -b >/dev/null || ret=1
++wait_for_log 2 "message parsing failed: FORMERR" ns1/named.run || ret=1
+ $DIG $DIGOPTS +tcp version.bind txt ch @10.53.0.1 >dig.out.ns1.$n || ret=1
+ grep "status: NOERROR" dig.out.ns1.$n >/dev/null || ret=1
+ [ $ret = 0 ] || {
+@@ -352,20 +354,10 @@ grep "status: NOERROR" dig.out.ns1.$n >/dev/null || ret=1
+ n=$((n + 1))
+ ret=0
+ echo_i "check that TYPE=0 additional data is handled ($n)"
++nextpart ns1/named.run >/dev/null
+ echo "a0e4280000010000000000010000060001c00c000000fe000000000000" \
+-  | $PERL ../packet.pl -a 10.53.0.1 -p ${PORT} -t tcp >/dev/null || ret=1
+-$DIG $DIGOPTS +tcp version.bind txt ch @10.53.0.1 >dig.out.ns1.$n || ret=1
+-grep "status: NOERROR" dig.out.ns1.$n >/dev/null || ret=1
+-[ $ret = 0 ] || {
+-  echo_i "failed"
+-  status=1
+-}
+-
+-n=$((n + 1))
+-ret=0
+-echo_i "check that update to undefined class is handled ($n)"
+-echo "a0e4280000010001000000000000060101c00c000000fe000000000000" \
+-  | $PERL ../packet.pl -a 10.53.0.1 -p ${PORT} -t tcp >/dev/null || ret=1
++  | $PERL ../packet.pl -a 10.53.0.1 -p ${PORT} -t tcp -b >/dev/null || ret=1
++wait_for_log 2 "message parsing failed: FORMERR" ns1/named.run || ret=1
+ $DIG $DIGOPTS +tcp version.bind txt ch @10.53.0.1 >dig.out.ns1.$n || ret=1
+ grep "status: NOERROR" dig.out.ns1.$n >/dev/null || ret=1
+ [ $ret = 0 ] || {
+diff --git a/bin/tests/system/packet.pl b/bin/tests/system/packet.pl
+index 900a0c071e..afb9f4784d 100644
+--- a/bin/tests/system/packet.pl
++++ b/bin/tests/system/packet.pl
+@@ -40,6 +40,7 @@
+ # -p <port>:     specify port
+ # -t <protocol>: specify UDP or TCP
+ # -r <num>:      send packet <num> times
++# -b:		 blocking io
+ # -d:            dump response packets
+ #
+ # If not specified, address defaults to 127.0.0.1, port to 53, protocol
+@@ -51,6 +52,8 @@ use strict;
+ use Getopt::Std;
+ use IO::File;
+ use IO::Socket;
++use Net::DNS;
++use Net::DNS::Packet;
+ 
+ sub usage {
+     print ("Usage: packet.pl [-a address] [-d] [-p port] [-t (tcp|udp)] [-r <repeats>] [file]\n");
+@@ -61,8 +64,6 @@ my $sock;
+ my $proto;
+ 
+ sub dumppacket {
+-    use Net::DNS;
+-    use Net::DNS::Packet;
+ 
+     my $rin;
+     my $rout;
+@@ -96,7 +97,7 @@ sub dumppacket {
+ }
+ 
+ my %options={};
+-getopts("a:dp:t:r:", \%options);
++getopts("a:bdp:t:r:", \%options);
+ 
+ my $addr = "127.0.0.1";
+ $addr = $options{a} if defined $options{a};
+@@ -111,6 +112,8 @@ usage if ($proto !~ /^(udp|tcp)$/);
+ my $repeats = 1;
+ $repeats = $options{r} if defined $options{r};
+ 
++my $blocking = defined $options{b} ? 1 : 0;
++
+ my $file = "STDIN";
+ if (@ARGV >= 1) {
+     my $filename = shift @ARGV;
+@@ -132,8 +135,22 @@ my $len = length $data;
+ my $output = unpack("H*", $data);
+ print ("sending $repeats time(s): $output\n");
+ 
++
++if (defined $options{d}) {
++    my $request;
++    if ($Net::DNS::VERSION > 0.68) {
++        $request = new Net::DNS::Packet(\$data, 0);
++        $@ and die $@;
++    } else {
++        my $err;
++        ($request, $err) = new Net::DNS::Packet(\$data, 0);
++        $err and die $err;
++    }
++    $request->print;
++}
++
+ $sock = IO::Socket::INET->new(PeerAddr => $addr, PeerPort => $port,
+-				 Blocking => 0,
++				 Blocking => $blocking,
+ 				 Proto => $proto,) or die "$!";
+ 
+ STDOUT->autoflush(1);
+-- 
+2.35.6
+
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-5946_p9.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-5946_p9.patch
new file mode 100644
index 0000000000..c15ee394f3
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-5946_p9.patch
@@ -0,0 +1,44 @@
+From 42b3fcf5285b29f2b885eec67a10cd3de6f11805 Mon Sep 17 00:00:00 2001
+From: Evan Hunt <each@isc.org>
+Date: Mon, 23 Feb 2026 16:27:52 -0800
+Subject: [PATCH] Make the RD flag optional in isctest.query()
+
+Add an 'rd' parameter (default True) to isctest.query.create() so
+that non-recursive queries can be sent with rd=False.
+
+CVE: CVE-2026-5946
+Upstream-Status: Backport [https://gitlab.com/isc-projects/bind9/-/commit/d79f2d3f35887ea4525e283d389d9078fa1ef439]
+
+(cherry picked from commit 12e511310024aac38ce223ee47b5108f06caf8f9)
+(cherry picked from commit d79f2d3f35887ea4525e283d389d9078fa1ef439)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ bin/tests/system/isctest/query.py | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/bin/tests/system/isctest/query.py b/bin/tests/system/isctest/query.py
+index b11b165f85..861a002220 100644
+--- a/bin/tests/system/isctest/query.py
++++ b/bin/tests/system/isctest/query.py
+@@ -81,6 +81,7 @@ def create(
+     qtype,
+     qclass=dns.rdataclass.IN,
+     dnssec: bool = True,
++    rd: bool = True,
+     cd: bool = False,
+     ad: bool = True,
+ ) -> dns.message.Message:
+@@ -88,7 +89,9 @@ def create(
+     msg = dns.message.make_query(
+         qname, qtype, qclass, use_edns=True, want_dnssec=dnssec
+     )
+-    msg.flags = dns.flags.RD
++    msg.flags = 0
++    if rd:
++        msg.flags = dns.flags.RD
+     if ad:
+         msg.flags |= dns.flags.AD
+     if cd:
+-- 
+2.35.6
+
diff --git a/meta/recipes-connectivity/bind/bind_9.18.44.bb b/meta/recipes-connectivity/bind/bind_9.18.44.bb
index 7b5baf5338..42651fca4e 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.44.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.44.bb
@@ -32,6 +32,17 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://CVE-2026-3592_p4.patch \
            file://CVE-2026-3592_p5.patch \
            file://CVE-2026-3592_p6.patch \
+           file://CVE-2026-5946-dependent_p1.patch \
+           file://CVE-2026-5946-dependent_p2.patch \
+           file://CVE-2026-5946_p1.patch \
+           file://CVE-2026-5946_p2.patch \
+           file://CVE-2026-5946_p3.patch \
+           file://CVE-2026-5946_p4.patch \
+           file://CVE-2026-5946_p5.patch \
+           file://CVE-2026-5946_p6.patch \
+           file://CVE-2026-5946_p7.patch \
+           file://CVE-2026-5946_p8.patch \
+           file://CVE-2026-5946_p9.patch \
            "
 
 SRC_URI[sha256sum] = "81f5035a25c576af1a93f0061cf70bde6d00a0c7bd1274abf73f5b5389a6f82d"
-- 
2.35.6


