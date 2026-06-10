Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF32CD98C7
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 10:06:43 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16739.1781085994313417864
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 03:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=bpv5gBRT;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=91921; q=dns/txt;
  s=iport01; t=1781085994; x=1782295594;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T8+P/YG/tOjs8/qKfDHBHVp9p08kyXRO/UXaLFTw+zs=;
  b=bpv5gBRTPOEOQSY9gWzAWLsI/9sL1rU2nKNiIK+oR+KHc6A2J4WzQs/E
   bd9X3MH1AXdhEHrpJiUnc3zdAtbiXKOBT0/bleMPrFqgRLODyZjlK27fI
   xxroAuwhb2PG/dzbys6z1C7NcqW7KuTjWNJersyz0zeSoz0ZUgdhWl40I
   IpN1/SjHSoanAstFoQA3C9u3WyloSC5AGi65VOhWvTFllUvi5MQwXvm/4
   cwgzsRPn6XmbNCd31+VdvkF/bOqDdnM3/kw7hi67MPv0l4xrq5pAn8t8G
   RgCMvqGwcenJZelsDvDr7pFszxVej1koEJgcMHIj4HHBt7W7tQai10Er8
   A==;
X-CSE-ConnectionGUID: mJxt2aT6Tj+0mDCTKGVt/A==
X-CSE-MsgGUID: KoPIF/ZKSSOgOOQEOUKokA==
X-IPAS-Result: =?us-ascii?q?A0AHAAAeNilq/4r/Ja1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBgX4DAQEBAQsBglZ0X0JJlksDgROQN4xRFIFqDwEBAQ9EDQQBA?=
 =?us-ascii?q?YUGAo06AiY2Bw4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4Thk8Nh?=
 =?us-ascii?q?loBAgEDGgEMCwEYARsSEBwDAQIvKyMIEAmDAgGCcwIBEbMGgXkzgQGCZkIBM?=
 =?us-ascii?q?QUJAgJAAVDbKwELFAEFgTMBhT6IHlsYAUSCBYIzJxsbgXKBFYE7gTd2gQWBX?=
 =?us-ascii?q?AEBAgGBIAoLEIZdBIINFYEMgV0eUoFOICeMDUiBHgNZLAFVEw0KCwcFgWYDN?=
 =?us-ascii?q?RIqFW4yHYEjPheBDBsHBYFKgTdogQKFECMfAzmBFYF6gShnaRUwNWwDCxgNS?=
 =?us-ascii?q?BEsNxQbBD5uB4w6Fw+BPAkBawcBDR8EDCQaEwEKBgsOAhQDPyUIAhMBAQYlB?=
 =?us-ascii?q?x0DEQgEKQEKERgCDwOSQx0HAQEBBwyQCoIhgTWJPpRegT4KKIN0jCGVOhozh?=
 =?us-ascii?q?ASBV5I/klGZB44KlWcZGDeEaIFvATSBWXAVO4JnCUoZD44qAwsLg2BWg3pDU?=
 =?us-ascii?q?WyDO75FJDUCCTIBAQcCBw4DC4FohGGLIAEmB4FOAQE?=
IronPort-Data: A9a23:w0O+Waz2fwImHxoRO496t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkUDn
 2JMXWHXP/yOMDD1c9Byb47g9k1Uu5fUn9FhQVNlpFhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4+aT/H3Ygf/hWYqazpMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJEQULZFC89opPWMNr
 fk0AwwuQS6fwMvjldpXSsE07igiBNPgMIVavjRryivUSK5/B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2bM3WjOX9PYH46tO6znnDldjRCgFmUvqEwpWPUyWSd1ZCxYYCIK4TQFZg9ckCwh
 WX+3kq+MDIhD/uQ7h2831WRpejMtHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBXy4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:5iPu+6m8b1aklIiOMaTBxcqQWZbpDfL03DAbv31ZSRFFG/FwWf
 rAoB19726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKIjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDTYNykdsS+D2njaL/8QhP+a7auvmeDSi11pTQ1sduVcyj0RMHfjLqWzLzM2fqbQ0/
 Gnl7J6mwY=
X-Talos-CUID: 9a23:P1JOA2BO/UNvI2/6EyxF5FJOE/x7Tn+elHL8CHObJlh1D5TAHA==
X-Talos-MUID: 9a23:7yhSxQtwyJ1yLKeB/s2npzZaFekv0YeVM2cCtrI/lu65FitzEmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,197,1774310400"; 
   d="scan'208";a="492590285"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Jun 2026 10:06:31 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 74A73180001C5;
	Wed, 10 Jun 2026 10:06:31 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 212FCCC1611; Wed, 10 Jun 2026 03:06:31 -0700 (PDT)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [OE-core] [scarthgap] [PATCH 3/5] bind: Fix CVE-2026-3592
Date: Wed, 10 Jun 2026 03:04:02 -0700
Message-Id: <20260610100404.2993940-3-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260610100404.2993940-1-asparmar@cisco.com>
References: <20260610100404.2993940-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 10:06:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238344

From: Ashishkumar Parmar <asparmar@cisco.com>

Pick the upstream 9.18 backport [1] for CVE-2026-3592. The public ISC
advisory [2] describes the vulnerability and identifies the fixed BIND
release.

The upstream fix is split across resolver limits, glue deduplication,
and system-test coverage. Apply the implementation patches before the
tests so the test changes exercise the same behavior as the upstream
fix set:

- CVE-2026-3592_p1.patch [3] limits the number of addresses returned
  per ADB find.
- CVE-2026-3592_p2.patch [4] removes duplicate addresses from the
  resolver SLIST.
- CVE-2026-3592_p3.patch [5] adds the self-pointed glue deduplication
  system test.
- CVE-2026-3592_p4.patch [6] syncs asyncserver.py from the development
  branch, with downstream backport adjustments for the 9.18.44 test
  tree.
- CVE-2026-3592_p5.patch [7] adds the SRTT-based server selection
  system test.
- CVE-2026-3592_p6.patch [8] fixes the resend_loop system test after
  the preceding test-support changes.

Keep the patches split to preserve the upstream commit structure and to
make the SRC_URI ordering explicit.

[1] https://gitlab.com/isc-projects/bind9/-/commit/5abfbc2663023e0c6f2a08ee6a7986f2a404f2f6
[2] https://kb.isc.org/docs/cve-2026-3592
[3] https://gitlab.com/isc-projects/bind9/-/commit/695362e3438c832ed0e39e144a77f233113d3431
[4] https://gitlab.com/isc-projects/bind9/-/commit/e25eaf9e6e09bbdd826252226144570222d542d8
[5] https://gitlab.com/isc-projects/bind9/-/commit/d2a67ba22246029192d8072d31b97e3bfd235f64
[6] https://gitlab.com/isc-projects/bind9/-/commit/b0e8966647e744482edc06e48bc9ff5079a1c541
[7] https://gitlab.com/isc-projects/bind9/-/commit/d5cd9b71ebadf7c0c76f09c5bbb65b6a7b944d0d
[8] https://gitlab.com/isc-projects/bind9/-/commit/cb13dcabdb64bdb5f8f7ed33980aaf470a90e877

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../bind/bind/CVE-2026-3592_p1.patch          | 115 +++
 .../bind/bind/CVE-2026-3592_p2.patch          | 334 +++++++
 .../bind/bind/CVE-2026-3592_p3.patch          | 629 +++++++++++++
 .../bind/bind/CVE-2026-3592_p4.patch          | 891 ++++++++++++++++++
 .../bind/bind/CVE-2026-3592_p5.patch          | 554 +++++++++++
 .../bind/bind/CVE-2026-3592_p6.patch          |  41 +
 .../recipes-connectivity/bind/bind_9.18.44.bb |   6 +
 7 files changed, 2570 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-3592_p1.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-3592_p2.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-3592_p3.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-3592_p4.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-3592_p5.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-3592_p6.patch

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-3592_p1.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-3592_p1.patch
new file mode 100644
index 0000000000..3955165a5f
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-3592_p1.patch
@@ -0,0 +1,115 @@
+From 2910d537ac86aa033023678c70ded227ebda1af3 Mon Sep 17 00:00:00 2001
+From: Colin Vidal <colin@isc.org>
+Date: Thu, 5 Feb 2026 09:46:01 +0100
+Subject: [PATCH] Limit the number of addresses returned per ADB find
+
+Add a hard limit on the number of addresses that ADB returns from a
+single NS lookup (dns_adbfind_t).  This mitigates a flood attack
+where an attacker controls a zone with many addresses for a
+nameserver, each returning an invalid response.  The global
+max-query count (default 50) also limits this, but significant harm
+can be done before that limit is reached.
+
+The default limit is now 6 (v4 and/or v6) addresses for an ADB find (so,
+ADB looking up for A/AAAA addresses of a name server name). It can be
+overridden for testing via 'named -T adbaddrslimit=N'.
+
+CVE: CVE-2026-3592
+Upstream-Status: Backport [https://gitlab.com/isc-projects/bind9/-/commit/695362e3438c832ed0e39e144a77f233113d3431]
+
+(cherry picked from commit 3ec37fc69356ee682bee7f67940613ac31d93d7b)
+(cherry picked from commit 695362e3438c832ed0e39e144a77f233113d3431)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ bin/named/main.c |  9 +++++++++
+ lib/dns/adb.c    | 26 ++++++++++++++++++++++++++
+ 2 files changed, 35 insertions(+)
+
+diff --git a/bin/named/main.c b/bin/named/main.c
+index df47e8d667..ddd43c9b2c 100644
+--- a/bin/named/main.c
++++ b/bin/named/main.c
+@@ -114,6 +114,8 @@ extern unsigned int dns_zone_mkey_hour;
+ extern unsigned int dns_zone_mkey_day;
+ extern unsigned int dns_zone_mkey_month;
+ 
++extern size_t dns_adb_addrslimit;
++
+ static bool want_stats = false;
+ static char program_name[NAME_MAX] = "named";
+ static char absolute_conffile[PATH_MAX];
+@@ -805,6 +807,13 @@ parse_T_opt(char *option) {
+ 		transferstuck = true;
+ 	} else if (!strncmp(option, "tat=", 4)) {
+ 		named_g_tat_interval = atoi(option + 4);
++	} else if (!strncmp(option, "adbaddrslimit=", 14)) {
++		size_t adb_addrslimit = atoi(option + 14);
++		if (adb_addrslimit < 1) {
++			named_main_earlyfatal("adbaddrslimit must be at "
++					      "least 1");
++		}
++		dns_adb_addrslimit = adb_addrslimit;
+ 	} else {
+ 		fprintf(stderr, "unknown -T flag '%s'\n", option);
+ 	}
+diff --git a/lib/dns/adb.c b/lib/dns/adb.c
+index 6ff9069a47..31b489e04a 100644
+--- a/lib/dns/adb.c
++++ b/lib/dns/adb.c
+@@ -86,6 +86,15 @@
+ 
+ #define DNS_ADB_MINADBSIZE (1024U * 1024U) /*%< 1 Megabyte */
+ 
++/*
++ * Default and override for the per-find address limit, the sum of the number of
++ * A and AAAA RR from an ADB NS name resolution.  When non-zero, this value is
++ * used instead of the default.  Can be set via 'named -T adbaddrslimit=N' for
++ * testing.
++ */
++#define DEFAULT_ADDRSLIMIT 6
++size_t dns_adb_addrslimit = 0;
++
+ typedef ISC_LIST(dns_adbname_t) dns_adbnamelist_t;
+ typedef struct dns_adbnamehook dns_adbnamehook_t;
+ typedef ISC_LIST(dns_adbnamehook_t) dns_adbnamehooklist_t;
+@@ -2200,6 +2209,9 @@ copy_namehook_lists(dns_adb_t *adb, dns_adbfind_t *find,
+ 	dns_adbaddrinfo_t *addrinfo;
+ 	dns_adbentry_t *entry;
+ 	int bucket;
++	size_t count = 0;
++	size_t limit = dns_adb_addrslimit != 0 ? dns_adb_addrslimit
++					       : DEFAULT_ADDRSLIMIT;
+ 
+ 	bucket = DNS_ADB_INVALIDBUCKET;
+ 
+@@ -2232,6 +2244,13 @@ copy_namehook_lists(dns_adb_t *adb, dns_adbfind_t *find,
+ 			inc_entry_refcnt(adb, entry, false);
+ 			ISC_LIST_APPEND(find->list, addrinfo, publink);
+ 			addrinfo = NULL;
++
++			if (++count >= limit) {
++				DP(ISC_LOG_DEBUG(3), "skipping addresses");
++				UNLOCK(&adb->entrylocks[bucket]);
++				return;
++			}
++
+ 		nextv4:
+ 			UNLOCK(&adb->entrylocks[bucket]);
+ 			bucket = DNS_ADB_INVALIDBUCKET;
+@@ -2267,6 +2286,13 @@ copy_namehook_lists(dns_adb_t *adb, dns_adbfind_t *find,
+ 			inc_entry_refcnt(adb, entry, false);
+ 			ISC_LIST_APPEND(find->list, addrinfo, publink);
+ 			addrinfo = NULL;
++
++			if (++count >= limit) {
++				DP(ISC_LOG_DEBUG(3), "skipping addresses");
++				UNLOCK(&adb->entrylocks[bucket]);
++				return;
++			}
++
+ 		nextv6:
+ 			UNLOCK(&adb->entrylocks[bucket]);
+ 			bucket = DNS_ADB_INVALIDBUCKET;
+-- 
+2.35.6
+
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-3592_p2.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-3592_p2.patch
new file mode 100644
index 0000000000..024158b13c
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-3592_p2.patch
@@ -0,0 +1,334 @@
+From d77197dd24af873e64a5511800a3ca5aa262eed6 Mon Sep 17 00:00:00 2001
+From: Colin Vidal <colin@isc.org>
+Date: Wed, 4 Feb 2026 10:18:42 +0100
+Subject: [PATCH] Remove duplicate addresses from the resolver SLIST
+
+The SLIST (essentially `fctx->finds`, forwarders and dual-stack
+alternatives aside) can have duplicate server addresses when multiple
+in-domain nameservers share the same IP addresses:
+
+  sub.example.          NS      ns1.sub.example.
+  sub.example.          NS      ns2.sub.example.
+  ns1.sub.example.      A       1.2.3.4
+  ns1.sub.example.      A       5.6.7.8
+  ns2.sub.example.      A       1.2.3.4
+  ns2.sub.example.      A       5.6.7.8
+
+If both 1.2.3.4 and 5.6.7.8 fail to return a valid answer, the resolver
+would query each address twice.
+
+The problem is fixed by replacing the two-phase server selection (sort
+each find list by SRTT, sort finds by head SRTT) with a single linear
+scan in nextaddress() that finds the lowest-SRTT unmarked, non-duplicate
+address across all find lists.
+
+The old approach had a correctness bug: after sorting, the resolver
+picked the next address from the "current" find list rather than
+globally.  For example, with find lists [1, 15, 26] and [3, 4, 5], the
+second pick would be SRTT 15 instead of the correct SRTT 3.
+
+The new approach is both simpler and correct: each call to nextaddress()
+walks all addresses, skips marked and duplicate entries, and returns the
+one with the lowest SRTT.  While this walk is repeated for each server
+attempt, it operates on a small bounded list and is negligible compared
+to the network I/O of querying the server.
+
+CVE: CVE-2026-3592
+Upstream-Status: Backport [https://gitlab.com/isc-projects/bind9/-/commit/e25eaf9e6e09bbdd826252226144570222d542d8]
+
+(cherry picked from commit b1c5856a3764b4025e93f8baf06c45c8fa029752)
+(cherry picked from commit e25eaf9e6e09bbdd826252226144570222d542d8)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ lib/dns/resolver.c | 226 +++++++++++++++++++--------------------------
+ 1 file changed, 93 insertions(+), 133 deletions(-)
+
+diff --git a/lib/dns/resolver.c b/lib/dns/resolver.c
+index cc40f862d1..c1584c3399 100644
+--- a/lib/dns/resolver.c
++++ b/lib/dns/resolver.c
+@@ -369,7 +369,16 @@ struct fetchctx {
+ 	dns_message_t *qmessage;
+ 	ISC_LIST(resquery_t) queries;
+ 	dns_adbfindlist_t finds;
+-	dns_adbfind_t *find;
++	/*
++	 * This is a state to keep track of the latest upstream server which is
++	 * being queried. See `nextaddress()`.
++	 *
++	 * `addrinfo` is basically a copy of `foundaddrinfo` but came from the
++	 * response of the query, so fields like the SRTT/timing might have been
++	 * altered. So it might be possible (?) to wrap those two in an union
++	 * for clarity (and memory saving).
++	 */
++	dns_adbaddrinfo_t *foundaddrinfo;
+ 	/*
+ 	 * altfinds are names and/or addresses of dual stack servers that
+ 	 * should be used when iterative resolution to a server is not
+@@ -1534,7 +1543,7 @@ fctx_cleanup(fetchctx_t *fctx) {
+ 		dns_adb_destroyfind(&find);
+ 		fctx_unref(fctx);
+ 	}
+-	fctx->find = NULL;
++	fctx->foundaddrinfo = NULL;
+ 
+ 	for (find = ISC_LIST_HEAD(fctx->altfinds); find != NULL;
+ 	     find = next_find)
+@@ -3355,91 +3364,10 @@ add_bad(fetchctx_t *fctx, dns_message_t *rmessage, dns_adbaddrinfo_t *addrinfo,
+ }
+ 
+ /*
+- * Sort addrinfo list by RTT.
+- */
+-static void
+-sort_adbfind(dns_adbfind_t *find, unsigned int bias) {
+-	dns_adbaddrinfo_t *best, *curr;
+-	dns_adbaddrinfolist_t sorted;
+-	unsigned int best_srtt, curr_srtt;
+-
+-	/* Lame N^2 bubble sort. */
+-	ISC_LIST_INIT(sorted);
+-	while (!ISC_LIST_EMPTY(find->list)) {
+-		best = ISC_LIST_HEAD(find->list);
+-		best_srtt = best->srtt;
+-		if (isc_sockaddr_pf(&best->sockaddr) != AF_INET6) {
+-			best_srtt += bias;
+-		}
+-		curr = ISC_LIST_NEXT(best, publink);
+-		while (curr != NULL) {
+-			curr_srtt = curr->srtt;
+-			if (isc_sockaddr_pf(&curr->sockaddr) != AF_INET6) {
+-				curr_srtt += bias;
+-			}
+-			if (curr_srtt < best_srtt) {
+-				best = curr;
+-				best_srtt = curr_srtt;
+-			}
+-			curr = ISC_LIST_NEXT(curr, publink);
+-		}
+-		ISC_LIST_UNLINK(find->list, best, publink);
+-		ISC_LIST_APPEND(sorted, best, publink);
+-	}
+-	find->list = sorted;
+-}
+-
+-/*
+- * Sort a list of finds by server RTT.
+- */
+-static void
+-sort_finds(dns_adbfindlist_t *findlist, unsigned int bias) {
+-	dns_adbfind_t *best, *curr;
+-	dns_adbfindlist_t sorted;
+-	dns_adbaddrinfo_t *addrinfo, *bestaddrinfo;
+-	unsigned int best_srtt, curr_srtt;
+-
+-	/* Sort each find's addrinfo list by SRTT. */
+-	for (curr = ISC_LIST_HEAD(*findlist); curr != NULL;
+-	     curr = ISC_LIST_NEXT(curr, publink))
+-	{
+-		sort_adbfind(curr, bias);
+-	}
+-
+-	/* Lame N^2 bubble sort. */
+-	ISC_LIST_INIT(sorted);
+-	while (!ISC_LIST_EMPTY(*findlist)) {
+-		best = ISC_LIST_HEAD(*findlist);
+-		bestaddrinfo = ISC_LIST_HEAD(best->list);
+-		INSIST(bestaddrinfo != NULL);
+-		best_srtt = bestaddrinfo->srtt;
+-		if (isc_sockaddr_pf(&bestaddrinfo->sockaddr) != AF_INET6) {
+-			best_srtt += bias;
+-		}
+-		curr = ISC_LIST_NEXT(best, publink);
+-		while (curr != NULL) {
+-			addrinfo = ISC_LIST_HEAD(curr->list);
+-			INSIST(addrinfo != NULL);
+-			curr_srtt = addrinfo->srtt;
+-			if (isc_sockaddr_pf(&addrinfo->sockaddr) != AF_INET6) {
+-				curr_srtt += bias;
+-			}
+-			if (curr_srtt < best_srtt) {
+-				best = curr;
+-				best_srtt = curr_srtt;
+-			}
+-			curr = ISC_LIST_NEXT(curr, publink);
+-		}
+-		ISC_LIST_UNLINK(*findlist, best, publink);
+-		ISC_LIST_APPEND(sorted, best, publink);
+-	}
+-	*findlist = sorted;
+-}
+-
+-/*
+- * Return true iff the ADB find has a pending fetch for 'type'.  This is
+- * used to find out whether we're in a loop, where a fetch is waiting for a
+- * find which is waiting for that same fetch.
++ * Return true iff the ADB find has an already pending fetch for 'type'.  This
++ * is used to find out whether we're in a loop, where a fetch is waiting for a
++ * find which is waiting for that same fetch. So if the current find actually
++ * started the fetch, we know it can't be a loop, so we returns false.
+  *
+  * Note: This could be done with either an equivalence check (e.g.,
+  * query_pending == DNS_ADBFIND_INET) or with a bit check, as below.  If
+@@ -3546,6 +3474,7 @@ findname(fetchctx_t *fctx, const dns_name_t *name, in_port_t port,
+ 				}
+ 			}
+ 		}
++
+ 		if ((flags & FCTX_ADDRINFO_DUALSTACK) != 0) {
+ 			ISC_LIST_APPEND(fctx->altfinds, find, publink);
+ 		} else {
+@@ -3961,8 +3890,6 @@ out:
+ 		 * We've found some addresses.  We might still be
+ 		 * looking for more addresses.
+ 		 */
+-		sort_finds(&fctx->finds, res->view->v6bias);
+-		sort_finds(&fctx->altfinds, 0);
+ 		result = ISC_R_SUCCESS;
+ 	}
+ 
+@@ -4037,6 +3964,80 @@ possibly_mark(fetchctx_t *fctx, dns_adbaddrinfo_t *addr) {
+ 	}
+ }
+ 
++static dns_adbaddrinfo_t *
++nextaddress(fetchctx_t *fctx) {
++	dns_adbaddrinfo_t *prevai = fctx->foundaddrinfo, *lowestsrttai = NULL;
++	unsigned int v6bias = fctx->res->view->v6bias, lowestsrtt = 0;
++
++	/*
++	 * Let's walk through the list of dns_adbaddrinfo_t to find the best
++	 * next server address to query. This is linear on the number of
++	 * dns_adbaddrinfo_t which are grouped in find list (for each ADB find).
++	 */
++	for (dns_adbfind_t *find = ISC_LIST_HEAD(fctx->finds); find != NULL;
++	     find = ISC_LIST_NEXT(find, publink))
++	{
++		for (dns_adbaddrinfo_t *ai = ISC_LIST_HEAD(find->list);
++		     ai != NULL; ai = ISC_LIST_NEXT(ai, publink))
++		{
++			/*
++			 * This address has been marked already, skip it.
++			 */
++			if (!UNMARKED(ai)) {
++				continue;
++			}
++
++			/*
++			 * This address is the same as the previously used
++			 * address, it's a duplicate, mark it and skip it!
++			 */
++			if (prevai != NULL) {
++				if (prevai->entry == ai->entry) {
++					ai->flags |= FCTX_ADDRINFO_MARK;
++					continue;
++				}
++			}
++
++			/*
++			 * Mark and skip this address if incompatible (i.e. IPv6
++			 * address on a v4 only server, or for ACL reason, etc.)
++			 */
++			possibly_mark(fctx, ai);
++			if (!UNMARKED(ai)) {
++				continue;
++			}
++
++			/*
++			 * This address hasn't been tried yet and is a
++			 * good candidate. Let's keep track of it if it
++			 * has the lowest SRTT so far (or if there is no
++			 * address with lowest SRTT found yet).
++			 */
++			unsigned int aisrtt = ai->srtt;
++
++			if (isc_sockaddr_pf(&ai->sockaddr) != AF_INET6) {
++				aisrtt += v6bias;
++			}
++
++			if (lowestsrttai == NULL || aisrtt < lowestsrtt) {
++				lowestsrttai = ai;
++				lowestsrtt = aisrtt;
++				continue;
++			}
++		}
++	}
++
++	/*
++	 * This is the next address to query. If this is NULL, we're done.
++	 */
++	if (lowestsrttai != NULL) {
++		lowestsrttai->flags |= FCTX_ADDRINFO_MARK;
++	}
++	fctx->foundaddrinfo = lowestsrttai;
++
++	return lowestsrttai;
++}
++
+ static dns_adbaddrinfo_t *
+ fctx_nextaddress(fetchctx_t *fctx) {
+ 	dns_adbfind_t *find, *start;
+@@ -4059,7 +4060,6 @@ fctx_nextaddress(fetchctx_t *fctx) {
+ 		possibly_mark(fctx, addrinfo);
+ 		if (UNMARKED(addrinfo)) {
+ 			addrinfo->flags |= FCTX_ADDRINFO_MARK;
+-			fctx->find = NULL;
+ 			fctx->forwarding = true;
+ 
+ 			/*
+@@ -4080,49 +4080,9 @@ fctx_nextaddress(fetchctx_t *fctx) {
+ 	fctx->forwarding = false;
+ 	FCTX_ATTR_SET(fctx, FCTX_ATTR_TRIEDFIND);
+ 
+-	find = fctx->find;
+-	if (find == NULL) {
+-		find = ISC_LIST_HEAD(fctx->finds);
+-	} else {
+-		find = ISC_LIST_NEXT(find, publink);
+-		if (find == NULL) {
+-			find = ISC_LIST_HEAD(fctx->finds);
+-		}
+-	}
+-
+-	/*
+-	 * Find the first unmarked addrinfo.
+-	 */
+-	addrinfo = NULL;
+-	if (find != NULL) {
+-		start = find;
+-		do {
+-			for (addrinfo = ISC_LIST_HEAD(find->list);
+-			     addrinfo != NULL;
+-			     addrinfo = ISC_LIST_NEXT(addrinfo, publink))
+-			{
+-				if (!UNMARKED(addrinfo)) {
+-					continue;
+-				}
+-				possibly_mark(fctx, addrinfo);
+-				if (UNMARKED(addrinfo)) {
+-					addrinfo->flags |= FCTX_ADDRINFO_MARK;
+-					break;
+-				}
+-			}
+-			if (addrinfo != NULL) {
+-				break;
+-			}
+-			find = ISC_LIST_NEXT(find, publink);
+-			if (find == NULL) {
+-				find = ISC_LIST_HEAD(fctx->finds);
+-			}
+-		} while (find != start);
+-	}
+-
+-	fctx->find = find;
+-	if (addrinfo != NULL) {
+-		return addrinfo;
++	faddrinfo = nextaddress(fctx);
++	if (faddrinfo != NULL) {
++		return faddrinfo;
+ 	}
+ 
+ 	/*
+-- 
+2.35.6
+
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-3592_p3.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-3592_p3.patch
new file mode 100644
index 0000000000..a14d0243a8
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-3592_p3.patch
@@ -0,0 +1,629 @@
+From 1d837ed1dfb8a25cb12cf18a3ce998745adcfbd9 Mon Sep 17 00:00:00 2001
+From: Colin Vidal <colin@isc.org>
+Date: Thu, 5 Feb 2026 11:20:11 +0100
+Subject: [PATCH] Add system test for self-pointed glue deduplication
+
+Test the resolver's behavior with self-pointed glue where each NS
+has the same set of addresses.  Verify that addresses are
+deduplicated and each unique IP is only queried once.
+
+Also test the ADB address limit knob (-T adbaddrslimit=).
+
+CVE: CVE-2026-3592
+Upstream-Status: Backport [https://gitlab.com/isc-projects/bind9/-/commit/d2a67ba22246029192d8072d31b97e3bfd235f64]
+
+(cherry picked from commit c21fc6cb95d77312d6fb891f17ce9df41a25af6d)
+(cherry picked from commit d2a67ba22246029192d8072d31b97e3bfd235f64)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ .../system/selfpointedglue/ns1/named.conf.j2  |  28 ++++
+ bin/tests/system/selfpointedglue/ns1/root.db  |  24 +++
+ .../system/selfpointedglue/ns2/named.conf.j2  |  28 ++++
+ bin/tests/system/selfpointedglue/ns2/tld.db   |  27 +++
+ .../system/selfpointedglue/ns3/example.tld.db | 155 ++++++++++++++++++
+ .../selfpointedglue/ns3/example2.tld.db       |  33 ++++
+ .../system/selfpointedglue/ns3/named.conf.j2  |  44 +++++
+ .../system/selfpointedglue/ns4/named.args.j2  |   3 +
+ .../system/selfpointedglue/ns4/named.conf.j2  |  59 +++++++
+ .../system/selfpointedglue/ns4/root.hint      |  14 ++
+ bin/tests/system/selfpointedglue/prereq.sh    |  20 +++
+ .../selfpointedglue/tests_selfpointedglue.py  |  75 +++++++++
+ 12 files changed, 510 insertions(+)
+ create mode 100644 bin/tests/system/selfpointedglue/ns1/named.conf.j2
+ create mode 100644 bin/tests/system/selfpointedglue/ns1/root.db
+ create mode 100644 bin/tests/system/selfpointedglue/ns2/named.conf.j2
+ create mode 100644 bin/tests/system/selfpointedglue/ns2/tld.db
+ create mode 100644 bin/tests/system/selfpointedglue/ns3/example.tld.db
+ create mode 100644 bin/tests/system/selfpointedglue/ns3/example2.tld.db
+ create mode 100644 bin/tests/system/selfpointedglue/ns3/named.conf.j2
+ create mode 100644 bin/tests/system/selfpointedglue/ns4/named.args.j2
+ create mode 100644 bin/tests/system/selfpointedglue/ns4/named.conf.j2
+ create mode 100644 bin/tests/system/selfpointedglue/ns4/root.hint
+ create mode 100644 bin/tests/system/selfpointedglue/prereq.sh
+ create mode 100644 bin/tests/system/selfpointedglue/tests_selfpointedglue.py
+
+diff --git a/bin/tests/system/selfpointedglue/ns1/named.conf.j2 b/bin/tests/system/selfpointedglue/ns1/named.conf.j2
+new file mode 100644
+index 0000000000..fd83fc3c19
+--- /dev/null
++++ b/bin/tests/system/selfpointedglue/ns1/named.conf.j2
+@@ -0,0 +1,28 @@
++/*
++ * Copyright (C) Internet Systems Consortium, Inc. ("ISC")
++ *
++ * SPDX-License-Identifier: MPL-2.0
++ *
++ * This Source Code Form is subject to the terms of the Mozilla Public
++ * License, v. 2.0.  If a copy of the MPL was not distributed with this
++ * file, you can obtain one at https://mozilla.org/MPL/2.0/.
++ *
++ * See the COPYRIGHT file distributed with this work for additional
++ * information regarding copyright ownership.
++ */
++
++options {
++	query-source address 10.53.0.1;
++	notify-source 10.53.0.1;
++	transfer-source 10.53.0.1;
++	port @PORT@;
++	pid-file "named.pid";
++	listen-on { 10.53.0.1; };
++	recursion no;
++	dnssec-validation no;
++};
++
++zone "." {
++	type primary;
++	file "root.db";
++};
+diff --git a/bin/tests/system/selfpointedglue/ns1/root.db b/bin/tests/system/selfpointedglue/ns1/root.db
+new file mode 100644
+index 0000000000..bfbf049b80
+--- /dev/null
++++ b/bin/tests/system/selfpointedglue/ns1/root.db
+@@ -0,0 +1,24 @@
++; Copyright (C) Internet Systems Consortium, Inc. ("ISC")
++;
++; SPDX-License-Identifier: MPL-2.0
++;
++; This Source Code Form is subject to the terms of the Mozilla Public
++; License, v. 2.0.  If a copy of the MPL was not distributed with this
++; file, you can obtain one at https://mozilla.org/MPL/2.0/.
++;
++; See the COPYRIGHT file distributed with this work for additional
++; information regarding copyright ownership.
++
++$TTL 300
++. 			IN SOA	owner.root-servers.nil. a.root.servers.nil. (
++				2010   	; serial
++				600         	; refresh
++				600         	; retry
++				1200    	; expire
++				600       	; minimum
++				)
++.			NS	a.root-servers.nil.
++a.root-servers.nil.	A	10.53.0.1
++
++tld.	 		NS	ns.tld.
++ns.tld. 		A 	10.53.0.2
+diff --git a/bin/tests/system/selfpointedglue/ns2/named.conf.j2 b/bin/tests/system/selfpointedglue/ns2/named.conf.j2
+new file mode 100644
+index 0000000000..2993832da2
+--- /dev/null
++++ b/bin/tests/system/selfpointedglue/ns2/named.conf.j2
+@@ -0,0 +1,28 @@
++/*
++ * Copyright (C) Internet Systems Consortium, Inc. ("ISC")
++ *
++ * SPDX-License-Identifier: MPL-2.0
++ *
++ * This Source Code Form is subject to the terms of the Mozilla Public
++ * License, v. 2.0.  If a copy of the MPL was not distributed with this
++ * file, you can obtain one at https://mozilla.org/MPL/2.0/.
++ *
++ * See the COPYRIGHT file distributed with this work for additional
++ * information regarding copyright ownership.
++ */
++
++options {
++	query-source address 10.53.0.2;
++	notify-source 10.53.0.2;
++	transfer-source 10.53.0.2;
++	port @PORT@;
++	pid-file "named.pid";
++	listen-on { 10.53.0.2; };
++	recursion no;
++	dnssec-validation no;
++};
++
++zone "tld." {
++	type primary;
++	file "tld.db";
++};
+diff --git a/bin/tests/system/selfpointedglue/ns2/tld.db b/bin/tests/system/selfpointedglue/ns2/tld.db
+new file mode 100644
+index 0000000000..5935fd841c
+--- /dev/null
++++ b/bin/tests/system/selfpointedglue/ns2/tld.db
+@@ -0,0 +1,27 @@
++; Copyright (C) Internet Systems Consortium, Inc. ("ISC")
++;
++; SPDX-License-Identifier: MPL-2.0
++;
++; This Source Code Form is subject to the terms of the Mozilla Public
++; License, v. 2.0.  If a copy of the MPL was not distributed with this
++; file, you can obtain one at https://mozilla.org/MPL/2.0/.
++;
++; See the COPYRIGHT file distributed with this work for additional
++; information regarding copyright ownership.
++
++$TTL 300
++tld. 			IN SOA	owner.tld. ns.tld. (
++				2010   	; serial
++				600         	; refresh
++				600         	; retry
++				1200    	; expire
++				600       	; minimum
++				)
++tld.			NS	ns.tld.
++ns.tld. 		A 	10.53.0.2
++
++example.tld.		NS	ns.example.tld.
++ns.example.tld.		A	10.53.0.3
++
++example2.tld.		NS	ns.example2.tld.
++ns.example2.tld.	A	10.53.0.3
+diff --git a/bin/tests/system/selfpointedglue/ns3/example.tld.db b/bin/tests/system/selfpointedglue/ns3/example.tld.db
+new file mode 100644
+index 0000000000..83ea4d37ec
+--- /dev/null
++++ b/bin/tests/system/selfpointedglue/ns3/example.tld.db
+@@ -0,0 +1,155 @@
++; Copyright (C) Internet Systems Consortium, Inc. ("ISC")
++;
++; SPDX-License-Identifier: MPL-2.0
++;
++; This Source Code Form is subject to the terms of the Mozilla Public
++; License, v. 2.0.  If a copy of the MPL was not distributed with this
++; file, you can obtain one at https://mozilla.org/MPL/2.0/.
++;
++; See the COPYRIGHT file distributed with this work for additional
++; information regarding copyright ownership.
++
++$TTL 300
++example.tld.		IN SOA	owner.dnshoster.tld. ns.dnshoster.tld. (
++				2010   	; serial
++				600         	; refresh
++				600         	; retry
++				1200    	; expire
++				600       	; minimum
++				)
++
++example.tld.			NS	ns.example.tld.
++ns.example.tld.			A	10.53.0.3
++
++sub.example.tld.		NS 	ns01.sub.example.tld.
++sub.example.tld.		NS 	ns02.sub.example.tld.
++sub.example.tld.		NS 	ns03.sub.example.tld.
++sub.example.tld.		NS 	ns04.sub.example.tld.
++sub.example.tld.		NS 	ns05.sub.example.tld.
++sub.example.tld.		NS 	ns06.sub.example.tld.
++sub.example.tld.		NS 	ns07.sub.example.tld.
++sub.example.tld.		NS 	ns08.sub.example.tld.
++sub.example.tld.		NS 	ns09.sub.example.tld.
++sub.example.tld.		NS 	ns10.sub.example.tld.
++
++ns01.sub.example.tld.		A	10.53.0.5
++ns01.sub.example.tld.		A	10.53.0.6
++ns01.sub.example.tld.		A	10.53.0.7
++ns01.sub.example.tld.		A	10.53.0.8
++ns01.sub.example.tld.		A	10.53.0.9
++ns01.sub.example.tld.		A	10.53.0.10
++ns01.sub.example.tld.		A	10.53.1.1
++ns01.sub.example.tld.		A	10.53.1.2
++ns01.sub.example.tld.		A	10.53.2.1
++ns01.sub.example.tld.		A	10.53.0.3
++; Those RR (same below) pointing to 127.0.0.1  won't ever be used as they
++; exceeded the ADB limit.
++ns01.sub.example.tld.		A	127.0.0.1
++
++ns02.sub.example.tld.		A	10.53.0.5
++ns02.sub.example.tld.		A	10.53.0.6
++ns02.sub.example.tld.		A	10.53.0.7
++ns02.sub.example.tld.		A	10.53.0.8
++ns02.sub.example.tld.		A	10.53.0.9
++ns02.sub.example.tld.		A	10.53.0.10
++ns02.sub.example.tld.		A	10.53.1.1
++ns02.sub.example.tld.		A	10.53.1.2
++ns02.sub.example.tld.		A	10.53.2.1
++ns02.sub.example.tld.		A	10.53.0.3
++ns02.sub.example.tld.		A	127.0.0.1
++
++ns03.sub.example.tld.		A	10.53.0.5
++ns03.sub.example.tld.		A	10.53.0.6
++ns03.sub.example.tld.		A	10.53.0.7
++ns03.sub.example.tld.		A	10.53.0.8
++ns03.sub.example.tld.		A	10.53.0.9
++ns03.sub.example.tld.		A	10.53.0.10
++ns03.sub.example.tld.		A	10.53.1.1
++ns03.sub.example.tld.		A	10.53.1.2
++ns03.sub.example.tld.		A	10.53.2.1
++ns03.sub.example.tld.		A	10.53.0.3
++ns03.sub.example.tld.		A	127.0.0.1
++
++ns04.sub.example.tld.		A	10.53.0.5
++ns04.sub.example.tld.		A	10.53.0.6
++ns04.sub.example.tld.		A	10.53.0.7
++ns04.sub.example.tld.		A	10.53.0.8
++ns04.sub.example.tld.		A	10.53.0.9
++ns04.sub.example.tld.		A	10.53.0.10
++ns04.sub.example.tld.		A	10.53.1.1
++ns04.sub.example.tld.		A	10.53.1.2
++ns04.sub.example.tld.		A	10.53.2.1
++ns04.sub.example.tld.		A	10.53.0.3
++ns04.sub.example.tld.		A	127.0.0.1
++
++ns05.sub.example.tld.		A	10.53.0.5
++ns05.sub.example.tld.		A	10.53.0.6
++ns05.sub.example.tld.		A	10.53.0.7
++ns05.sub.example.tld.		A	10.53.0.8
++ns05.sub.example.tld.		A	10.53.0.9
++ns05.sub.example.tld.		A	10.53.0.10
++ns05.sub.example.tld.		A	10.53.1.1
++ns05.sub.example.tld.		A	10.53.1.2
++ns05.sub.example.tld.		A	10.53.2.1
++ns05.sub.example.tld.		A	10.53.0.3
++ns05.sub.example.tld.		A	127.0.0.1
++
++ns06.sub.example.tld.		A	10.53.0.5
++ns06.sub.example.tld.		A	10.53.0.6
++ns06.sub.example.tld.		A	10.53.0.7
++ns06.sub.example.tld.		A	10.53.0.8
++ns06.sub.example.tld.		A	10.53.0.9
++ns06.sub.example.tld.		A	10.53.0.10
++ns06.sub.example.tld.		A	10.53.1.1
++ns06.sub.example.tld.		A	10.53.1.2
++ns06.sub.example.tld.		A	10.53.2.1
++ns06.sub.example.tld.		A	10.53.0.3
++ns06.sub.example.tld.		A	127.0.0.1
++
++ns07.sub.example.tld.		A	10.53.0.5
++ns07.sub.example.tld.		A	10.53.0.6
++ns07.sub.example.tld.		A	10.53.0.7
++ns07.sub.example.tld.		A	10.53.0.8
++ns07.sub.example.tld.		A	10.53.0.9
++ns07.sub.example.tld.		A	10.53.0.10
++ns07.sub.example.tld.		A	10.53.1.1
++ns07.sub.example.tld.		A	10.53.1.2
++ns07.sub.example.tld.		A	10.53.2.1
++ns07.sub.example.tld.		A	10.53.0.3
++ns07.sub.example.tld.		A	127.0.0.1
++
++ns08.sub.example.tld.		A	10.53.0.5
++ns08.sub.example.tld.		A	10.53.0.6
++ns08.sub.example.tld.		A	10.53.0.7
++ns08.sub.example.tld.		A	10.53.0.8
++ns08.sub.example.tld.		A	10.53.0.9
++ns08.sub.example.tld.		A	10.53.0.10
++ns08.sub.example.tld.		A	10.53.1.1
++ns08.sub.example.tld.		A	10.53.1.2
++ns08.sub.example.tld.		A	10.53.2.1
++ns08.sub.example.tld.		A	10.53.0.3
++ns08.sub.example.tld.		A	127.0.0.1
++
++ns09.sub.example.tld.		A	10.53.0.5
++ns09.sub.example.tld.		A	10.53.0.6
++ns09.sub.example.tld.		A	10.53.0.7
++ns09.sub.example.tld.		A	10.53.0.8
++ns09.sub.example.tld.		A	10.53.0.9
++ns09.sub.example.tld.		A	10.53.0.10
++ns09.sub.example.tld.		A	10.53.1.1
++ns09.sub.example.tld.		A	10.53.1.2
++ns09.sub.example.tld.		A	10.53.2.1
++ns09.sub.example.tld.		A	10.53.0.3
++ns09.sub.example.tld.		A	127.0.0.1
++
++ns10.sub.example.tld.		A	10.53.0.5
++ns10.sub.example.tld.		A	10.53.0.6
++ns10.sub.example.tld.		A	10.53.0.7
++ns10.sub.example.tld.		A	10.53.0.8
++ns10.sub.example.tld.		A	10.53.0.9
++ns10.sub.example.tld.		A	10.53.0.10
++ns10.sub.example.tld.		A	10.53.1.1
++ns10.sub.example.tld.		A	10.53.1.2
++ns10.sub.example.tld.		A	10.53.2.1
++ns10.sub.example.tld.		A	10.53.0.3
++ns10.sub.example.tld.		A	127.0.0.1
+diff --git a/bin/tests/system/selfpointedglue/ns3/example2.tld.db b/bin/tests/system/selfpointedglue/ns3/example2.tld.db
+new file mode 100644
+index 0000000000..bcab6e38c1
+--- /dev/null
++++ b/bin/tests/system/selfpointedglue/ns3/example2.tld.db
+@@ -0,0 +1,33 @@
++; Copyright (C) Internet Systems Consortium, Inc. ("ISC")
++;
++; SPDX-License-Identifier: MPL-2.0
++;
++; This Source Code Form is subject to the terms of the Mozilla Public
++; License, v. 2.0.  If a copy of the MPL was not distributed with this
++; file, you can obtain one at https://mozilla.org/MPL/2.0/.
++;
++; See the COPYRIGHT file distributed with this work for additional
++; information regarding copyright ownership.
++
++$TTL 300
++example2.tld.		IN SOA	owner.dnshoster.tld. ns.dnshoster.tld. (
++				2010   	; serial
++				600         	; refresh
++				600         	; retry
++				1200    	; expire
++				600       	; minimum
++				)
++
++example2.tld.			NS	ns.example2.tld.
++ns.example2.tld.		A	10.53.0.3
++
++sub.example2.tld.		NS 	ns01.sub.example2.tld.
++sub.example2.tld.		NS 	ns02.sub.example2.tld.
++sub.example2.tld.		NS 	ns03.sub.example2.tld.
++
++ns01.sub.example2.tld.		A	10.53.1.1
++ns01.sub.example2.tld.		A	10.53.0.5
++ns02.sub.example2.tld.		A	10.53.1.2
++ns02.sub.example2.tld.		A	10.53.0.6
++ns03.sub.example2.tld.		A	10.53.2.1
++ns03.sub.example2.tld.		A	10.53.0.7
+diff --git a/bin/tests/system/selfpointedglue/ns3/named.conf.j2 b/bin/tests/system/selfpointedglue/ns3/named.conf.j2
+new file mode 100644
+index 0000000000..b5c8bfcf33
+--- /dev/null
++++ b/bin/tests/system/selfpointedglue/ns3/named.conf.j2
+@@ -0,0 +1,44 @@
++/*
++ * Copyright (C) Internet Systems Consortium, Inc. ("ISC")
++ *
++ * SPDX-License-Identifier: MPL-2.0
++ *
++ * This Source Code Form is subject to the terms of the Mozilla Public
++ * License, v. 2.0.  If a copy of the MPL was not distributed with this
++ * file, you can obtain one at https://mozilla.org/MPL/2.0/.
++ *
++ * See the COPYRIGHT file distributed with this work for additional
++ * information regarding copyright ownership.
++ */
++
++options {
++	query-source address 10.53.0.3;
++	notify-source 10.53.0.3;
++	transfer-source 10.53.0.3;
++	port @PORT@;
++	pid-file "named.pid";
++	listen-on {
++		10.53.0.3;
++		10.53.0.5;
++		10.53.0.6;
++		10.53.0.7;
++		10.53.0.8;
++		10.53.0.9;
++		10.53.0.10;
++		10.53.1.1;
++		10.53.1.2;
++		10.53.2.1;
++	};
++	recursion no;
++	dnssec-validation no;
++};
++
++zone "example.tld." {
++	type primary;
++	file "example.tld.db";
++};
++
++zone "example2.tld." {
++	type primary;
++	file "example2.tld.db";
++};
+diff --git a/bin/tests/system/selfpointedglue/ns4/named.args.j2 b/bin/tests/system/selfpointedglue/ns4/named.args.j2
+new file mode 100644
+index 0000000000..071508fd70
+--- /dev/null
++++ b/bin/tests/system/selfpointedglue/ns4/named.args.j2
+@@ -0,0 +1,3 @@
++{% set adblimit = adblimit | default("") %}
++
++-D selfpointedglue-ns4 -m record -c named.conf -d 99 -g -T maxcachesize=2097152 -4 @adblimit@
+diff --git a/bin/tests/system/selfpointedglue/ns4/named.conf.j2 b/bin/tests/system/selfpointedglue/ns4/named.conf.j2
+new file mode 100644
+index 0000000000..09fbdd4e70
+--- /dev/null
++++ b/bin/tests/system/selfpointedglue/ns4/named.conf.j2
+@@ -0,0 +1,59 @@
++/*
++ * Copyright (C) Internet Systems Consortium, Inc. ("ISC")
++ *
++ * SPDX-License-Identifier: MPL-2.0
++ *
++ * This Source Code Form is subject to the terms of the Mozilla Public
++ * License, v. 2.0.  If a copy of the MPL was not distributed with this
++ * file, you can obtain one at https://mozilla.org/MPL/2.0/.
++ *
++ * See the COPYRIGHT file distributed with this work for additional
++ * information regarding copyright ownership.
++ */
++{% set maxdelegationservers = maxdelegationservers | default(None) %}
++
++options {
++	query-source address 10.53.0.4;
++	notify-source 10.53.0.4;
++	transfer-source 10.53.0.4;
++	port @PORT@;
++	pid-file "named.pid";
++	listen-on { 10.53.0.4; };
++	recursion yes;
++	dnssec-validation no;
++	dnstap { resolver query; };
++	dnstap-output file "dnstap.out";
++	{% if maxdelegationservers %}
++        @maxdelegationservers@
++	{% endif %}
++};
++
++/*
++ * Forcing TCP ensures that ADDITIONAL won't be truncated (responses won't have
++ * the TC flag, hence the resolver won't retry using TCP by itself, see
++ * https://datatracker.ietf.org/doc/html/rfc2181#section-9)
++ */
++server 10.53.0.3 { tcp-only true; };
++server 10.53.0.5 { tcp-only true; };
++server 10.53.0.6 { tcp-only true; };
++server 10.53.0.7 { tcp-only true; };
++server 10.53.0.8 { tcp-only true; };
++server 10.53.0.9 { tcp-only true; };
++server 10.53.0.10 { tcp-only true; };
++server 10.53.1.1 { tcp-only true; };
++server 10.53.1.2 { tcp-only true; };
++server 10.53.2.1 { tcp-only true; };
++
++zone "." {
++	type hint;
++	file "root.hint";
++};
++
++key rndc_key {
++	secret "1234abcd8765";
++	algorithm @DEFAULT_HMAC@;
++};
++
++controls {
++	inet 10.53.0.4 port @CONTROLPORT@ allow { any; } keys { rndc_key; };
++};
+diff --git a/bin/tests/system/selfpointedglue/ns4/root.hint b/bin/tests/system/selfpointedglue/ns4/root.hint
+new file mode 100644
+index 0000000000..d7d0e1faba
+--- /dev/null
++++ b/bin/tests/system/selfpointedglue/ns4/root.hint
+@@ -0,0 +1,14 @@
++; Copyright (C) Internet Systems Consortium, Inc. ("ISC")
++;
++; SPDX-License-Identifier: MPL-2.0
++;
++; This Source Code Form is subject to the terms of the Mozilla Public
++; License, v. 2.0.  If a copy of the MPL was not distributed with this
++; file, you can obtain one at https://mozilla.org/MPL/2.0/.
++;
++; See the COPYRIGHT file distributed with this work for additional
++; information regarding copyright ownership.
++
++$TTL 999999
++.			 IN NS		a.root-servers.nil.
++a.root-servers.nil.	 IN A		10.53.0.1
+diff --git a/bin/tests/system/selfpointedglue/prereq.sh b/bin/tests/system/selfpointedglue/prereq.sh
+new file mode 100644
+index 0000000000..747f448982
+--- /dev/null
++++ b/bin/tests/system/selfpointedglue/prereq.sh
+@@ -0,0 +1,20 @@
++#!/bin/sh
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
++. ../conf.sh
++
++$FEATURETEST --enable-dnstap || {
++  echo_i "This test requires dnstap support." >&2
++  exit 255
++}
++exit 0
+diff --git a/bin/tests/system/selfpointedglue/tests_selfpointedglue.py b/bin/tests/system/selfpointedglue/tests_selfpointedglue.py
+new file mode 100644
+index 0000000000..03a71cf545
+--- /dev/null
++++ b/bin/tests/system/selfpointedglue/tests_selfpointedglue.py
+@@ -0,0 +1,75 @@
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
++import os
++
++import isctest
++
++
++def line_to_ips_and_queries(line):
++    # dnstap-read output line example
++    # 05-Feb-2026 11:00:57.853 RQ 10.53.0.4:38507 -> 10.53.0.3:22047 TCP 56b sub.example.tld/IN/NS
++    _, _, _, _, _, dst, _, _, query = line.split(" ", 9)
++    ip, _ = dst.split(":", 1)
++    return (ip, query)
++
++
++def extract_dnstap(ns, nsid, expectedlen):
++    ns.rndc("dnstap -roll 1")
++    path = os.path.join(nsid, "dnstap.out.0")
++    dnstapread = isctest.run.cmd(
++        [os.getenv("DNSTAPREAD"), path],
++    )
++
++    lines = dnstapread.out.splitlines()
++    assert expectedlen == len(lines)
++    return list(map(line_to_ips_and_queries, lines))
++
++
++# Because DNSTAP doesn't have ordering guarantee, the order doesn't matter here.
++def expect_ip_and_query(expected_ips_and_queries, ips_and_queries):
++    found_count = 0
++    for expected_ip, expected_query in expected_ips_and_queries:
++        found = False
++        for ip, query in ips_and_queries:
++            if ip == expected_ip and query == expected_query:
++                found = True
++                found_count += 1
++                break
++        assert found
++    assert found_count == len(expected_ips_and_queries)
++
++
++def test_selfpointedglue(ns4):
++    msg = isctest.query.create("a.sub.example.tld.", "A")
++    res = isctest.query.tcp(msg, ns4.ip)
++    isctest.check.servfail(res)
++
++    ips_and_queries = extract_dnstap(ns4, "ns4", 10)
++
++    # Thanks to the de-duplication, only the first 6 NS IPs are
++    # queried (once sub.example.tld. NS is found) instead of 60
++    # (60 per NS, with 10 NS).
++    expect_ip_and_query(
++        [
++            ("10.53.0.1", "./IN/NS"),
++            ("10.53.0.1", "tld/IN/NS"),
++            ("10.53.0.2", "example.tld/IN/NS"),
++            ("10.53.0.3", "sub.example.tld/IN/NS"),
++            ("10.53.0.3", "a.sub.example.tld/IN/A"),
++            ("10.53.0.5", "a.sub.example.tld/IN/A"),
++            ("10.53.0.6", "a.sub.example.tld/IN/A"),
++            ("10.53.0.7", "a.sub.example.tld/IN/A"),
++            ("10.53.0.8", "a.sub.example.tld/IN/A"),
++            ("10.53.0.9", "a.sub.example.tld/IN/A"),
++        ],
++        ips_and_queries,
++    )
+-- 
+2.35.6
+
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-3592_p4.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-3592_p4.patch
new file mode 100644
index 0000000000..e399ff86fc
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-3592_p4.patch
@@ -0,0 +1,891 @@
+From 46fe5e321b6e4bf8a27df2f7659e6e4f233c94d9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <michal@isc.org>
+Date: Fri, 17 Apr 2026 17:57:05 +0200
+Subject: [PATCH] Sync asyncserver.py with the development branch
+
+Import bin/tests/system/isctest/asyncserver.py as present in commit
+ced002c4ab7b920c9528d315a611a477cb4a9409 on the "main" branch.  This
+enables using newer asyncserver.py infrastructure code in system tests
+that need to be backported to maintenance branches.
+
+CVE: CVE-2026-3592
+Upstream-Status: Backport [https://gitlab.com/isc-projects/bind9/-/commit/b0e8966647e744482edc06e48bc9ff5079a1c541]
+
+Backport Changes:
+- Regenerated against the BIND 9.18.44 system-test helper
+  context, which already carries dnspython compatibility code not
+  present in the upstream patch base.
+
+(cherry picked from commit b0e8966647e744482edc06e48bc9ff5079a1c541)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ bin/tests/system/isctest/asyncserver.py | 477 ++++++++++++++++++------
+ 1 file changed, 370 insertions(+), 107 deletions(-)
+
+diff --git a/bin/tests/system/isctest/asyncserver.py b/bin/tests/system/isctest/asyncserver.py
+index d2b22d7c12..e560ad10c0 100644
+--- a/bin/tests/system/isctest/asyncserver.py
++++ b/bin/tests/system/isctest/asyncserver.py
+@@ -11,20 +11,9 @@ See the COPYRIGHT file distributed with this work for additional
+ information regarding copyright ownership.
+ """
+ 
++from collections.abc import AsyncGenerator, Callable, Coroutine, Sequence
+ from dataclasses import dataclass, field
+-from typing import (
+-    Any,
+-    AsyncGenerator,
+-    Callable,
+-    Coroutine,
+-    Dict,
+-    List,
+-    Optional,
+-    Set,
+-    Tuple,
+-    Union,
+-    cast,
+-)
++from typing import Any, cast
+ 
+ import abc
+ import asyncio
+@@ -52,12 +41,11 @@ import dns.rdataset
+ import dns.rdatatype
+ import dns.rrset
+ import dns.tsig
+-import dns.version
+ import dns.zone
+ 
+ 
+ _UdpHandler = Callable[
+-    [bytes, Tuple[str, int], asyncio.DatagramTransport], Coroutine[Any, Any, None]
++    [bytes, tuple[str, int], asyncio.DatagramTransport], Coroutine[Any, Any, None]
+ ]
+ 
+ 
+@@ -75,7 +63,7 @@ class _AsyncUdpHandler(asyncio.DatagramProtocol):
+         self,
+         handler: _UdpHandler,
+     ) -> None:
+-        self._transport: Optional[asyncio.DatagramTransport] = None
++        self._transport: asyncio.DatagramTransport | None = None
+         self._handler: _UdpHandler = handler
+ 
+     def connection_made(self, transport: asyncio.BaseTransport) -> None:
+@@ -84,7 +72,7 @@ class _AsyncUdpHandler(asyncio.DatagramProtocol):
+         """
+         self._transport = cast(asyncio.DatagramTransport, transport)
+ 
+-    def datagram_received(self, data: bytes, addr: Tuple[str, int]) -> None:
++    def datagram_received(self, data: bytes, addr: tuple[str, int]) -> None:
+         """
+         Called by asyncio when a datagram is received.
+         """
+@@ -109,9 +97,9 @@ class AsyncServer:
+ 
+     def __init__(
+         self,
+-        udp_handler: Optional[_UdpHandler],
+-        tcp_handler: Optional[_TcpHandler],
+-        pidfile: Optional[str] = None,
++        udp_handler: _UdpHandler | None,
++        tcp_handler: _TcpHandler | None,
++        pidfile: str | None = None,
+     ) -> None:
+         self._abort_if_on_dnspython_version_less_than_2_0_0()
+         logging.basicConfig(
+@@ -134,12 +122,12 @@ class AsyncServer:
+         logging.info("Setting up IPv4 listener at %s:%d", ipv4_address, port)
+         logging.info("Setting up IPv6 listener at [%s]:%d", ipv6_address, port)
+ 
+-        self._ip_addresses: Tuple[str, str] = (ipv4_address, ipv6_address)
++        self._ip_addresses: tuple[str, str] = (ipv4_address, ipv6_address)
+         self._port: int = port
+-        self._udp_handler: Optional[_UdpHandler] = udp_handler
+-        self._tcp_handler: Optional[_TcpHandler] = tcp_handler
+-        self._pidfile: Optional[str] = pidfile
+-        self._work_done: Optional[asyncio.Future] = None
++        self._udp_handler: _UdpHandler | None = udp_handler
++        self._tcp_handler: _TcpHandler | None = tcp_handler
++        self._pidfile: str | None = pidfile
++        self._work_done: asyncio.Future | None = None
+ 
+     @classmethod
+     def _abort_if_on_dnspython_version_less_than_2_0_0(cls) -> None:
+@@ -195,7 +183,7 @@ class AsyncServer:
+         loop.set_exception_handler(self._handle_exception)
+ 
+     def _handle_exception(
+-        self, _: asyncio.AbstractEventLoop, context: Dict[str, Any]
++        self, _: asyncio.AbstractEventLoop, context: dict[str, Any]
+     ) -> None:
+         assert self._work_done
+         exception = context.get("exception", RuntimeError(context["message"]))
+@@ -275,17 +263,16 @@ class QueryContext:
+ 
+     query: dns.message.Message
+     response: dns.message.Message
++    socket: Peer
+     peer: Peer
+     protocol: DnsProtocol
+-    zone: Optional[dns.zone.Zone] = field(default=None, init=False)
+-    soa: Optional[dns.rrset.RRset] = field(default=None, init=False)
+-    node: Optional[dns.node.Node] = field(default=None, init=False)
+-    answer: Optional[dns.rdataset.Rdataset] = field(default=None, init=False)
+-    alias: Optional[dns.name.Name] = field(default=None, init=False)
+-    _initialized_response: Optional[dns.message.Message] = field(
+-        default=None, init=False
+-    )
+-    _initialized_response_with_zone_data: Optional[dns.message.Message] = field(
++    zone: dns.zone.Zone | None = field(default=None, init=False)
++    soa: dns.rrset.RRset | None = field(default=None, init=False)
++    node: dns.node.Node | None = field(default=None, init=False)
++    answer: dns.rdataset.Rdataset | None = field(default=None, init=False)
++    alias: dns.name.Name | None = field(default=None, init=False)
++    _initialized_response: dns.message.Message | None = field(default=None, init=False)
++    _initialized_response_with_zone_data: dns.message.Message | None = field(
+         default=None, init=False
+     )
+ 
+@@ -330,7 +317,7 @@ class ResponseAction(abc.ABC):
+     """
+ 
+     @abc.abstractmethod
+-    async def perform(self) -> Optional[Union[dns.message.Message, bytes]]:
++    async def perform(self) -> dns.message.Message | bytes | None:
+         """
+         This method is expected to carry out arbitrary actions (e.g. wait for a
+         specific amount of time, modify the answer, etc.) and then return the
+@@ -353,14 +340,30 @@ class DnsResponseSend(ResponseAction):
+     """
+ 
+     response: dns.message.Message
+-    authoritative: Optional[bool] = None
++    authoritative: bool | None = None
+     delay: float = 0.0
++    acknowledge_hand_rolled_response: bool = False
+ 
+-    async def perform(self) -> Optional[Union[dns.message.Message, bytes]]:
++    async def perform(self) -> dns.message.Message | bytes | None:
+         """
+         Yield a potentially delayed response that is a dns.message.Message.
+         """
+         assert isinstance(self.response, dns.message.Message)
++        if not (
++            _is_asyncserver_response(self.response)
++            or self.acknowledge_hand_rolled_response
++        ):
++            error = "The response you are trying to send was not created using "
++            error += "AsyncDnsServer's response preparation methods. "
++            error += "This will break features such as automatic AA flag "
++            error += "and RCODE handling. If you need a fresh copy of a "
++            error += "response, use `QueryContext.prepare_new_response` "
++            error += "instead of `dns.message.make_response`. "
++            error += "To acknowledge this and proceed anyway, set "
++            error += "`acknowledge_hand_rolled_response=True` in "
++            error += "DnsResponseSend's constructor."
++            raise RuntimeError(error)
++
+         if self.authoritative is not None:
+             if self.authoritative:
+                 self.response.flags |= dns.flags.AA
+@@ -387,7 +390,7 @@ class BytesResponseSend(ResponseAction):
+     response: bytes
+     delay: float = 0.0
+ 
+-    async def perform(self) -> Optional[Union[dns.message.Message, bytes]]:
++    async def perform(self) -> dns.message.Message | bytes | None:
+         """
+         Yield a potentially delayed response that is a sequence of bytes.
+         """
+@@ -404,7 +407,7 @@ class ResponseDrop(ResponseAction):
+     Action which does nothing - as if a packet was dropped.
+     """
+ 
+-    async def perform(self) -> Optional[Union[dns.message.Message, bytes]]:
++    async def perform(self) -> dns.message.Message | bytes | None:
+         return None
+ 
+ 
+@@ -413,17 +416,16 @@ class _ConnectionTeardownRequested(Exception):
+ 
+ 
+ @dataclass
+-class ResponseDropAndCloseConnection(ResponseAction):
++class CloseConnection(ResponseAction):
+     """
+-    Action which makes the server close the connection after the DNS query is
+-    received by the server (TCP only).
++    Action which makes the server close the connection (TCP only).
+ 
+     The connection may be closed with a delay if requested.
+     """
+ 
+     delay: float = 0.0
+ 
+-    async def perform(self) -> Optional[Union[dns.message.Message, bytes]]:
++    async def perform(self) -> dns.message.Message | bytes | None:
+         if self.delay > 0:
+             logging.info("Waiting %.1fs before closing TCP connection", self.delay)
+             await asyncio.sleep(self.delay)
+@@ -505,7 +507,7 @@ class IgnoreAllConnections(ConnectionHandler):
+     client socket, effectively ignoring all incoming connections.
+     """
+ 
+-    _connections: Set[asyncio.StreamWriter] = field(default_factory=set)
++    _connections: set[asyncio.StreamWriter] = field(default_factory=set)
+ 
+     async def handle(
+         self, reader: asyncio.StreamReader, writer: asyncio.StreamWriter, peer: Peer
+@@ -539,8 +541,8 @@ class ConnectionReset(ConnectionHandler):
+     make the server send an RST segment; this happens when the server closes a
+     client's socket while there is still unread data in that socket's buffer.
+     If closing the connection _after_ the query is read by the server is enough
+-    for a given use case, the ResponseDropAndCloseConnection response handler
+-    should be used instead.
++    for a given use case, the CloseConnection response handler should be used
++    instead.
+     """
+ 
+     delay: float = 0.0
+@@ -616,14 +618,14 @@ class QnameHandler(ResponseHandler):
+ 
+     @property
+     @abc.abstractmethod
+-    def qnames(self) -> List[str]:
++    def qnames(self) -> list[str]:
+         """
+         A list of QNAMEs handled by this class.
+         """
+         raise NotImplementedError
+ 
+     def __init__(self) -> None:
+-        self._qnames: List[dns.name.Name] = [dns.name.from_text(d) for d in self.qnames]
++        self._qnames: list[dns.name.Name] = [dns.name.from_text(d) for d in self.qnames]
+ 
+     def __str__(self) -> str:
+         return f"{self.__class__.__name__}(QNAMEs: {', '.join(self.qnames)})"
+@@ -636,6 +638,105 @@ class QnameHandler(ResponseHandler):
+         return qctx.qname in self._qnames
+ 
+ 
++class QnameQtypeHandler(QnameHandler):
++    """
++    Handle queries for which both of the following conditions are true:
++
++    - the query's QNAME is present in `self.qnames`,
++    - the query's QTYPE is present in `self.qtypes`.
++    """
++
++    @property
++    @abc.abstractmethod
++    def qtypes(self) -> list[dns.rdatatype.RdataType]:
++        """
++        A list of QTYPEs handled by this class.
++        """
++        raise NotImplementedError
++
++    def __init__(self) -> None:
++        super().__init__()
++        self._qtypes: list[dns.rdatatype.RdataType] = self.qtypes
++
++    def __str__(self) -> str:
++        return f"{self.__class__.__name__}(QNAMEs: {', '.join(self.qnames)}; QTYPEs: {', '.join(map(str, self.qtypes))})"
++
++    def match(self, qctx: QueryContext) -> bool:
++        """
++        Handle queries whose QNAME and QTYPE match any of the QNAMEs and
++        QTYPEs handled by this class.
++        """
++        return qctx.qtype in self._qtypes and super().match(qctx)
++
++
++class StaticResponseHandler(ResponseHandler):
++    """
++    Base class used for deriving custom static response handlers.
++
++    The derived class can specify the RRsets to be included in the answer,
++    authority, and additional sections of the response, whether to set the AA
++    bit in the response, and a delay before sending the response.
++
++    The default implementation of `get_responses()` uses these properties to
++    prepare and yield a single response.
++    """
++
++    @property
++    def rcode(self) -> dns.rcode.Rcode | None:
++        """
++        Optional RCODE to be set in the response.
++        """
++        return None
++
++    @property
++    def answer(self) -> Sequence[dns.rrset.RRset]:
++        """
++        RRsets to be included in the answer section of the response.
++        """
++        return []
++
++    @property
++    def authority(self) -> Sequence[dns.rrset.RRset]:
++        """
++        RRsets to be included in the authority section of the response.
++        """
++        return []
++
++    @property
++    def additional(self) -> Sequence[dns.rrset.RRset]:
++        """
++        RRsets to be included in the additional section of the response.
++        """
++        return []
++
++    @property
++    def authoritative(self) -> bool | None:
++        """
++        Whether to set the AA bit in the response.
++        """
++        return None
++
++    @property
++    def delay(self) -> float:
++        """
++        Delay before sending the response.
++        """
++        return 0.0
++
++    async def get_responses(
++        self, qctx: QueryContext
++    ) -> AsyncGenerator[DnsResponseSend, None]:
++        qctx.prepare_new_response(with_zone_data=False)
++        qctx.response.answer.extend(self.answer)
++        qctx.response.authority.extend(self.authority)
++        qctx.response.additional.extend(self.additional)
++        if self.rcode is not None:
++            qctx.response.set_rcode(self.rcode)
++        yield DnsResponseSend(
++            qctx.response, authoritative=self.authoritative, delay=self.delay
++        )
++
++
+ class DomainHandler(ResponseHandler):
+     """
+     Base class used for deriving custom domain handlers.
+@@ -643,20 +744,28 @@ class DomainHandler(ResponseHandler):
+     The derived class must specify a list of `domains` that it wants to handle.
+     Queries for any of these domains (and their subdomains) will then be passed
+     to the `get_response()` method in the derived class.
++
++    The most specific matching domain is stored in the `matched_domain` attribute.
+     """
+ 
+     @property
+     @abc.abstractmethod
+-    def domains(self) -> List[str]:
++    def domains(self) -> list[str]:
+         """
+         A list of domain names handled by this class.
+         """
+         raise NotImplementedError
+ 
+     def __init__(self) -> None:
+-        self._domains: List[dns.name.Name] = [
+-            dns.name.from_text(d) for d in self.domains
+-        ]
++        self._domains: list[dns.name.Name] = sorted(
++            [dns.name.from_text(d) for d in self.domains], reverse=True
++        )
++        self._matched_domain: dns.name.Name | None = None
++
++    @property
++    def matched_domain(self) -> dns.name.Name:
++        assert self._matched_domain is not None
++        return self._matched_domain
+ 
+     def __str__(self) -> str:
+         return f"{self.__class__.__name__}(domains: {', '.join(self.domains)})"
+@@ -666,20 +775,124 @@ class DomainHandler(ResponseHandler):
+         Handle queries whose QNAME matches any of the domains handled by this
+         class.
+         """
++        self._matched_domain = None
+         for domain in self._domains:
+             if qctx.qname.is_subdomain(domain):
++                self._matched_domain = domain
+                 return True
+         return False
+ 
+ 
++class ForwarderHandler(ResponseHandler):
++    """
++    A handler forwarding all received queries to another DNS server with an
++    optional delay and then relaying the responses back to the original client.
++
++    Queries are currently always forwarded via UDP.
++    """
++
++    @property
++    @abc.abstractmethod
++    def target(self) -> str:
++        """
++        The address of the DNS server to forward queries to.
++        """
++        raise NotImplementedError
++
++    @property
++    def port(self) -> int:
++        """
++        The port of the DNS server to forward queries to.
++
++        The default value of 0 causes the same port as the one used by this
++        server for listening to be used.
++        """
++        return 0
++
++    @property
++    def delay(self) -> float:
++        """
++        The number of seconds to wait before forwarding each query.
++        """
++        return 0.0
++
++    def __str__(self) -> str:
++        return f"{self.__class__.__name__}(target: {self.target}:{self.port})"
++
++    class ForwarderProtocol(asyncio.DatagramProtocol):
++        def __init__(self, query: bytes, response: asyncio.Future) -> None:
++            self._query = query
++            self._response = response
++
++        def connection_made(self, transport: asyncio.BaseTransport) -> None:
++            logging.debug("[OUT] %s", self._query.hex())
++            cast(asyncio.DatagramTransport, transport).sendto(self._query)
++
++        def datagram_received(self, data: bytes, _: tuple[str, int]) -> None:
++            logging.debug("[IN] %s", data.hex())
++            self._response.set_result(data)
++
++    async def get_responses(
++        self, qctx: QueryContext
++    ) -> AsyncGenerator[ResponseAction, None]:
++        loop = asyncio.get_running_loop()
++        response = loop.create_future()
++        forwarding_target = f"{self.target}:{self.port or qctx.socket.port}"
++
++        if self.delay > 0:
++            logging.info(
++                "Waiting %.1fs before forwarding %s query from %s to %s over UDP",
++                self.delay,
++                qctx.protocol.name,
++                qctx.peer,
++                forwarding_target,
++            )
++            await asyncio.sleep(self.delay)
++
++        logging.info(
++            "Forwarding %s query from %s to %s over UDP",
++            qctx.protocol.name,
++            qctx.peer,
++            forwarding_target,
++        )
++
++        transport, _ = await loop.create_datagram_endpoint(
++            lambda: self.ForwarderProtocol(qctx.query.to_wire(), response),
++            local_addr=(qctx.socket.host, 0),
++            remote_addr=(self.target, self.port or qctx.socket.port),
++        )
++
++        try:
++            await response
++        finally:
++            transport.close()
++
++        logging.info(
++            "Relaying UDP response from %s to %s over %s",
++            forwarding_target,
++            qctx.peer,
++            qctx.protocol.name,
++        )
++
++        try:
++            message = _DnsMessageWithTsigDisabled.from_wire(response.result())
++            yield DnsResponseSend(message, acknowledge_hand_rolled_response=True)
++        except dns.exception.DNSException:
++            logging.warning(
++                "Failed to parse response from %s as a DNS message, relaying it as raw bytes",
++                forwarding_target,
++            )
++            yield BytesResponseSend(response.result())
++
++
+ @dataclass
+ class _ZoneTreeNode:
+     """
+     A node representing a zone with one origin.
+     """
+ 
+-    zone: Optional[dns.zone.Zone]
+-    children: List["_ZoneTreeNode"] = field(default_factory=list)
++    zone: dns.zone.Zone | None
++    children: list["_ZoneTreeNode"] = field(default_factory=list)
+ 
+ 
+ class _ZoneTree:
+@@ -729,7 +942,7 @@ class _ZoneTree:
+             node_from.children.remove(child)
+             node_to.children.append(child)
+ 
+-    def find_best_zone(self, name: dns.name.Name) -> Optional[dns.zone.Zone]:
++    def find_best_zone(self, name: dns.name.Name) -> dns.zone.Zone | None:
+         """
+         Return the closest matching zone (if any) for the domain name.
+         """
+@@ -747,7 +960,7 @@ class _DnsMessageWithTsigDisabled(dns.message.Message):
+     """
+ 
+     class _DisableTsigHandling(contextlib.ContextDecorator):
+-        def __init__(self, message: Optional[dns.message.Message] = None) -> None:
++        def __init__(self, message: dns.message.Message | None = None) -> None:
+             self.original_tsig_sign = dns.tsig.sign
+             self.original_tsig_validate = dns.tsig.validate
+             if message:
+@@ -759,7 +972,7 @@ class _DnsMessageWithTsigDisabled(dns.message.Message):
+             from failing on messages initialized with `dns.message.from_wire(keyring=False)`.
+             """
+ 
+-            def sign(*_: Any, **__: Any) -> Tuple[dns.rdata.Rdata, None]:
++            def sign(*_: Any, **__: Any) -> tuple[dns.rdata.Rdata, None]:
+                 assert self.tsig
+                 return self.tsig[0], None
+ 
+@@ -802,6 +1015,19 @@ class _NoKeyringType:
+     pass
+ 
+ 
++_ASYNCSERVER_RESPONSE_MARKER = "__is_asyncserver_response__"
++
++
++def _make_asyncserver_response(query: dns.message.Message) -> dns.message.Message:
++    response = dns.message.make_response(query)
++    setattr(response, _ASYNCSERVER_RESPONSE_MARKER, True)
++    return response
++
++
++def _is_asyncserver_response(message: dns.message.Message) -> bool:
++    return getattr(message, _ASYNCSERVER_RESPONSE_MARKER, False)
++
++
+ class AsyncDnsServer(AsyncServer):
+     """
+     DNS server which responds to queries based on zone data and/or custom
+@@ -822,17 +1048,17 @@ class AsyncDnsServer(AsyncServer):
+         self,
+         /,
+         default_rcode: dns.rcode.Rcode = dns.rcode.REFUSED,
+-        default_aa: bool = True,
+-        keyring: Union[
+-            Dict[dns.name.Name, dns.tsig.Key], None, _NoKeyringType
+-        ] = _NoKeyringType(),
++        default_aa: bool = False,
++        keyring: (
++            dict[dns.name.Name, dns.tsig.Key] | None | _NoKeyringType
++        ) = _NoKeyringType(),
+         acknowledge_manual_dname_handling: bool = False,
+     ) -> None:
+         super().__init__(self._handle_udp, self._handle_tcp, "ans.pid")
+ 
+         self._zone_tree: _ZoneTree = _ZoneTree()
+-        self._connection_handler: Optional[ConnectionHandler] = None
+-        self._response_handlers: List[ResponseHandler] = []
++        self._connection_handler: ConnectionHandler | None = None
++        self._response_handlers: list[ResponseHandler] = []
+         self._default_rcode = default_rcode
+         self._default_aa = default_aa
+         self._keyring = keyring
+@@ -859,10 +1085,18 @@ class AsyncDnsServer(AsyncServer):
+         else:
+             self._response_handlers.append(handler)
+ 
+-    def install_response_handlers(self, handlers: List[ResponseHandler]) -> None:
++    def install_response_handlers(self, *handlers: ResponseHandler) -> None:
+         for handler in handlers:
+             self.install_response_handler(handler)
+ 
++    def replace_response_handlers(self, *new_handlers: ResponseHandler) -> None:
++        """
++        Uninstall all currently installed handlers and install the provided ones.
++        """
++        logging.info("Uninstalling response handlers: %s", str(self._response_handlers))
++        self._response_handlers.clear()
++        self.install_response_handlers(*new_handlers)
++
+     def uninstall_response_handler(self, handler: ResponseHandler) -> None:
+         """
+         Remove the specified handler from the list of response handlers.
+@@ -933,11 +1167,13 @@ class AsyncDnsServer(AsyncServer):
+                     raise ValueError(error)
+ 
+     async def _handle_udp(
+-        self, wire: bytes, addr: Tuple[str, int], transport: asyncio.DatagramTransport
++        self, wire: bytes, addr: tuple[str, int], transport: asyncio.DatagramTransport
+     ) -> None:
+         logging.debug("Received UDP message: %s", wire.hex())
++        socket_info = transport.get_extra_info("sockname")
++        socket = Peer(socket_info[0], socket_info[1])
+         peer = Peer(addr[0], addr[1])
+-        responses = self._handle_query(wire, peer, DnsProtocol.UDP)
++        responses = self._handle_query(wire, socket, peer, DnsProtocol.UDP)
+         async for response in responses:
+             logging.debug("Sending UDP message: %s", response.hex())
+             transport.sendto(response, addr)
+@@ -974,7 +1210,7 @@ class AsyncDnsServer(AsyncServer):
+ 
+     async def _read_tcp_query(
+         self, reader: asyncio.StreamReader, peer: Peer
+-    ) -> Optional[bytes]:
++    ) -> bytes | None:
+         wire_length = await self._read_tcp_query_wire_length(reader, peer)
+         if not wire_length:
+             return None
+@@ -983,7 +1219,7 @@ class AsyncDnsServer(AsyncServer):
+ 
+     async def _read_tcp_query_wire_length(
+         self, reader: asyncio.StreamReader, peer: Peer
+-    ) -> Optional[int]:
++    ) -> int | None:
+         logging.debug("Receiving TCP message length from %s...", peer)
+ 
+         wire_length_bytes = await self._read_tcp_octets(reader, peer, 2)
+@@ -996,7 +1232,7 @@ class AsyncDnsServer(AsyncServer):
+ 
+     async def _read_tcp_query_wire(
+         self, reader: asyncio.StreamReader, peer: Peer, wire_length: int
+-    ) -> Optional[bytes]:
++    ) -> bytes | None:
+         logging.debug("Receiving TCP message (%d octets) from %s...", wire_length, peer)
+ 
+         wire = await self._read_tcp_octets(reader, peer, wire_length)
+@@ -1009,7 +1245,7 @@ class AsyncDnsServer(AsyncServer):
+ 
+     async def _read_tcp_octets(
+         self, reader: asyncio.StreamReader, peer: Peer, expected: int
+-    ) -> Optional[bytes]:
++    ) -> bytes | None:
+         buffer = b""
+ 
+         while len(buffer) < expected:
+@@ -1034,39 +1270,39 @@ class AsyncDnsServer(AsyncServer):
+     async def _send_tcp_response(
+         self, writer: asyncio.StreamWriter, peer: Peer, wire: bytes
+     ) -> None:
+-        responses = self._handle_query(wire, peer, DnsProtocol.TCP)
++        socket_info = writer.get_extra_info("sockname")
++        socket = Peer(socket_info[0], socket_info[1])
++        responses = self._handle_query(wire, socket, peer, DnsProtocol.TCP)
+         async for response in responses:
+             logging.debug("Sending TCP response: %s", response.hex())
+             writer.write(response)
+             await writer.drain()
+ 
+-    def _log_query(self, qctx: QueryContext, peer: Peer, protocol: DnsProtocol) -> None:
++    def _log_query(self, qctx: QueryContext) -> None:
+         logging.info(
+-            "Received %s/%s/%s (ID=%d) query from %s (%s)",
++            "Received %s/%s/%s (ID=%d) query from %s on %s (%s)",
+             qctx.qname.to_text(omit_final_dot=True),
+             dns.rdataclass.to_text(qctx.qclass),
+             dns.rdatatype.to_text(qctx.qtype),
+             qctx.query.id,
+-            peer,
+-            protocol.name,
++            qctx.peer,
++            qctx.socket,
++            qctx.protocol.name,
+         )
+         logging.debug(
+             "\n".join([f"[IN] {l}" for l in [""] + str(qctx.query).splitlines()])
+         )
+ 
+     def _log_response(
+-        self,
+-        qctx: QueryContext,
+-        response: Optional[Union[dns.message.Message, bytes]],
+-        peer: Peer,
+-        protocol: DnsProtocol,
++        self, qctx: QueryContext, response: dns.message.Message | bytes | None
+     ) -> None:
+         if not response:
+             logging.info(
+-                "Not sending a response to query (ID=%d) from %s (%s)",
++                "Not sending a response to query (ID=%d) from %s on %s (%s)",
+                 qctx.query.id,
+-                peer,
+-                protocol.name,
++                qctx.peer,
++                qctx.socket,
++                qctx.protocol.name,
+             )
+             return
+ 
+@@ -1081,7 +1317,7 @@ class AsyncDnsServer(AsyncServer):
+                 qtype = "-"
+ 
+             logging.info(
+-                "Sending %s/%s/%s (ID=%d) response (%d/%d/%d/%d) to a query (ID=%d) from %s (%s)",
++                "Sending %s/%s/%s (ID=%d) response (%d/%d/%d/%d) to a query (ID=%d) from %s on %s (%s)",
+                 qname,
+                 qclass,
+                 qtype,
+@@ -1091,8 +1327,9 @@ class AsyncDnsServer(AsyncServer):
+                 len(response.authority),
+                 len(response.additional),
+                 qctx.query.id,
+-                peer,
+-                protocol.name,
++                qctx.peer,
++                qctx.socket,
++                qctx.protocol.name,
+             )
+             logging.debug(
+                 "\n".join([f"[OUT] {l}" for l in [""] + str(response).splitlines()])
+@@ -1100,16 +1337,17 @@ class AsyncDnsServer(AsyncServer):
+             return
+ 
+         logging.info(
+-            "Sending response (%d bytes) to a query (ID=%d) from %s (%s)",
++            "Sending response (%d bytes) to a query (ID=%d) from %s on %s (%s)",
+             len(response),
+             qctx.query.id,
+-            peer,
+-            protocol.name,
++            qctx.peer,
++            qctx.socket,
++            qctx.protocol.name,
+         )
+         logging.debug("[OUT] %s", response.hex())
+ 
+     async def _handle_query(
+-        self, wire: bytes, peer: Peer, protocol: DnsProtocol
++        self, wire: bytes, socket: Peer, peer: Peer, protocol: DnsProtocol
+     ) -> AsyncGenerator[bytes, None]:
+         """
+         Yield wire data to send as a response over the established transport.
+@@ -1119,12 +1357,12 @@ class AsyncDnsServer(AsyncServer):
+         except dns.exception.DNSException as exc:
+             logging.error("Invalid query from %s (%s): %s", peer, wire.hex(), exc)
+             return
+-        response_stub = dns.message.make_response(query)
+-        qctx = QueryContext(query, response_stub, peer, protocol)
+-        self._log_query(qctx, peer, protocol)
++        response_stub = _make_asyncserver_response(query)
++        qctx = QueryContext(query, response_stub, socket, peer, protocol)
++        self._log_query(qctx)
+         responses = self._prepare_responses(qctx)
+         async for response in responses:
+-            self._log_response(qctx, response, peer, protocol)
++            self._log_response(qctx, response)
+             if response:
+                 if isinstance(response, dns.message.Message):
+                     response = response.to_wire(max_size=65535)
+@@ -1156,7 +1394,7 @@ class AsyncDnsServer(AsyncServer):
+ 
+     async def _prepare_responses(
+         self, qctx: QueryContext
+-    ) -> AsyncGenerator[Optional[Union[dns.message.Message, bytes]], None]:
++    ) -> AsyncGenerator[dns.message.Message | bytes | None, None]:
+         """
+         Yield response(s) either from response handlers or zone data.
+         """
+@@ -1349,10 +1587,10 @@ class ControllableAsyncDnsServer(AsyncDnsServer):
+         return dns.name.from_text(self._CONTROL_DOMAIN)
+ 
+     @functools.cached_property
+-    def _commands(self) -> Dict[dns.name.Name, "ControlCommand"]:
++    def _commands(self) -> dict[dns.name.Name, "ControlCommand"]:
+         return {}
+ 
+-    def install_control_commands(self, commands: List["ControlCommand"]) -> None:
++    def install_control_commands(self, *commands: "ControlCommand") -> None:
+         for command in commands:
+             self.install_control_command(command)
+ 
+@@ -1370,7 +1608,7 @@ class ControllableAsyncDnsServer(AsyncDnsServer):
+ 
+     async def _prepare_responses(
+         self, qctx: QueryContext
+-    ) -> AsyncGenerator[Optional[Union[dns.message.Message, bytes]], None]:
++    ) -> AsyncGenerator[dns.message.Message | bytes | None, None]:
+         """
+         Detect and handle control queries, falling back to normal processing
+         for non-control queries.
+@@ -1383,9 +1621,7 @@ class ControllableAsyncDnsServer(AsyncDnsServer):
+         async for response in super()._prepare_responses(qctx):
+             yield response
+ 
+-    def _handle_control_command(
+-        self, qctx: QueryContext
+-    ) -> Optional[dns.message.Message]:
++    def _handle_control_command(self, qctx: QueryContext) -> dns.message.Message | None:
+         """
+         Detect and handle control queries.
+ 
+@@ -1460,8 +1696,8 @@ class ControlCommand(abc.ABC):
+ 
+     @abc.abstractmethod
+     def handle(
+-        self, args: List[str], server: ControllableAsyncDnsServer, qctx: QueryContext
+-    ) -> Optional[str]:
++        self, args: list[str], server: ControllableAsyncDnsServer, qctx: QueryContext
++    ) -> str | None:
+         """
+         This method is expected to carry out arbitrary actions in response to a
+         control query.  Note that it is invoked synchronously (it is not a
+@@ -1499,11 +1735,11 @@ class ToggleResponsesCommand(ControlCommand):
+     control_subdomain = "send-responses"
+ 
+     def __init__(self) -> None:
+-        self._current_handler: Optional[IgnoreAllQueries] = None
++        self._current_handler: IgnoreAllQueries | None = None
+ 
+     def handle(
+-        self, args: List[str], server: ControllableAsyncDnsServer, qctx: QueryContext
+-    ) -> Optional[str]:
++        self, args: list[str], server: ControllableAsyncDnsServer, qctx: QueryContext
++    ) -> str | None:
+         if len(args) != 1:
+             logging.error("Invalid %s query %s", self, qctx.qname)
+             qctx.response.set_rcode(dns.rcode.SERVFAIL)
+@@ -1528,3 +1764,30 @@ class ToggleResponsesCommand(ControlCommand):
+         logging.error("Unrecognized response sending mode '%s'", mode)
+         qctx.response.set_rcode(dns.rcode.SERVFAIL)
+         return f"unrecognized response sending mode '{mode}'"
++
++
++class SwitchControlCommand(ControlCommand):
++    """
++    Switch the server's response handlers based on the control query.
++
++    A sequence of response handlers is associated with each key.  When a
++    control query is received, the server's response handlers are replaced
++    with the sequence associated with the key extracted from the control
++    query.
++    """
++
++    control_subdomain = "switch"
++
++    def __init__(self, handler_mapping: dict[str, Sequence[ResponseHandler]]):
++        self._handler_mapping = handler_mapping
++
++    def handle(
++        self, args: list[str], server: ControllableAsyncDnsServer, qctx: QueryContext
++    ) -> str | None:
++        if len(args) != 1 or args[0] not in self._handler_mapping:
++            logging.error("Invalid %s query %s", self, qctx.qname)
++            qctx.response.set_rcode(dns.rcode.SERVFAIL)
++            return f"invalid query; exactly one of {list(self._handler_mapping.keys())} is expected in QNAME"
++
++        server.replace_response_handlers(*self._handler_mapping[args[0]])
++        return f"switched to handler set '{args[0]}'"
+-- 
+2.35.6
+
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-3592_p5.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-3592_p5.patch
new file mode 100644
index 0000000000..bfb870851a
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-3592_p5.patch
@@ -0,0 +1,554 @@
+From 1e0b72f5cee9fce3c4beb782fd5e4a17efa84223 Mon Sep 17 00:00:00 2001
+From: Colin Vidal <colin@isc.org>
+Date: Wed, 4 Mar 2026 18:25:32 +0100
+Subject: [PATCH] Add SRTT-based server selection system test
+
+Verify that the resolver selects authoritative servers in increasing
+SRTT order.  Four servers are configured with increasing response
+delays.  100 queries are sent, expecting most to go to the fastest
+server (ns2).  Then ns2 stops responding, another 100 queries are
+sent and should go to ns3 (the next fastest), and so on through
+ns4 and ns5.  Each query uses a unique name to avoid cache hits.
+
+CVE: CVE-2026-3592
+Upstream-Status: Backport [https://gitlab.com/isc-projects/bind9/-/commit/d5cd9b71ebadf7c0c76f09c5bbb65b6a7b944d0d]
+
+(cherry picked from commit a8d11e14f5b4e4d53219ba751d1b741162b0b84b)
+(cherry picked from commit d5cd9b71ebadf7c0c76f09c5bbb65b6a7b944d0d)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ bin/tests/system/srtt/README            | 18 ++++++
+ bin/tests/system/srtt/ans2/ans.py       | 36 +++++++++++
+ bin/tests/system/srtt/ans3/ans.py       | 36 +++++++++++
+ bin/tests/system/srtt/ans4/ans.py       | 36 +++++++++++
+ bin/tests/system/srtt/ans5/ans.py       | 36 +++++++++++
+ bin/tests/system/srtt/ns1/named.conf.j2 | 29 +++++++++
+ bin/tests/system/srtt/ns1/root.db       | 36 +++++++++++
+ bin/tests/system/srtt/ns6/named.args    |  1 +
+ bin/tests/system/srtt/ns6/named.conf.j2 | 41 ++++++++++++
+ bin/tests/system/srtt/prereq.sh         | 20 ++++++
+ bin/tests/system/srtt/srtt_ans.py       | 59 +++++++++++++++++
+ bin/tests/system/srtt/tests_srtt.py     | 86 +++++++++++++++++++++++++
+ 12 files changed, 434 insertions(+)
+ create mode 100644 bin/tests/system/srtt/README
+ create mode 100644 bin/tests/system/srtt/ans2/ans.py
+ create mode 100644 bin/tests/system/srtt/ans3/ans.py
+ create mode 100644 bin/tests/system/srtt/ans4/ans.py
+ create mode 100644 bin/tests/system/srtt/ans5/ans.py
+ create mode 100644 bin/tests/system/srtt/ns1/named.conf.j2
+ create mode 100644 bin/tests/system/srtt/ns1/root.db
+ create mode 100644 bin/tests/system/srtt/ns6/named.args
+ create mode 100644 bin/tests/system/srtt/ns6/named.conf.j2
+ create mode 100644 bin/tests/system/srtt/prereq.sh
+ create mode 100644 bin/tests/system/srtt/srtt_ans.py
+ create mode 100644 bin/tests/system/srtt/tests_srtt.py
+
+diff --git a/bin/tests/system/srtt/README b/bin/tests/system/srtt/README
+new file mode 100644
+index 0000000000..c86a697931
+--- /dev/null
++++ b/bin/tests/system/srtt/README
+@@ -0,0 +1,18 @@
++Copyright (C) Internet Systems Consortium, Inc. ("ISC")
++
++SPDX-License-Identifier: MPL-2.0
++
++This Source Code Form is subject to the terms of the Mozilla Public
++License, v. 2.0.  If a copy of the MPL was not distributed with this
++file, you can obtain one at https://mozilla.org/MPL/2.0/.
++
++See the COPYRIGHT file distributed with this work for additional
++information regarding copyright ownership.
++
++ns1 is root
++
++ans{2-5} simulates four NS servers making authority on the same domain
++`example.`. ans2 is the quickest to answer, followed by ans3, then ans4, with
++ans5 being the slowest.
++
++ns6 is a resolver
+diff --git a/bin/tests/system/srtt/ans2/ans.py b/bin/tests/system/srtt/ans2/ans.py
+new file mode 100644
+index 0000000000..f7c6f8e71b
+--- /dev/null
++++ b/bin/tests/system/srtt/ans2/ans.py
+@@ -0,0 +1,36 @@
++"""
++Copyright (C) Internet Systems Consortium, Inc. ("ISC")
++
++SPDX-License-Identifier: MPL-2.0
++
++This Source Code Form is subject to the terms of the Mozilla Public
++License, v. 2.0.  If a copy of the MPL was not distributed with this
++file, you can obtain one at https://mozilla.org/MPL/2.0/.
++
++See the COPYRIGHT file distributed with this work for additional
++information regarding copyright ownership.
++"""
++
++import dns.rcode
++
++from isctest.asyncserver import AsyncDnsServer, IgnoreAllQueries
++
++from srtt_ans import DelayedQnameRangeHandler
++
++
++class Foo1ToFoo99Handler(DelayedQnameRangeHandler):
++    max_qname = 99
++    delay = 0.0
++
++
++def main() -> None:
++    server = AsyncDnsServer(default_aa=True, default_rcode=dns.rcode.NOERROR)
++    server.install_response_handlers(
++        Foo1ToFoo99Handler(),
++        IgnoreAllQueries(),
++    )
++    server.run()
++
++
++if __name__ == "__main__":
++    main()
+diff --git a/bin/tests/system/srtt/ans3/ans.py b/bin/tests/system/srtt/ans3/ans.py
+new file mode 100644
+index 0000000000..5f61e19cd5
+--- /dev/null
++++ b/bin/tests/system/srtt/ans3/ans.py
+@@ -0,0 +1,36 @@
++"""
++Copyright (C) Internet Systems Consortium, Inc. ("ISC")
++
++SPDX-License-Identifier: MPL-2.0
++
++This Source Code Form is subject to the terms of the Mozilla Public
++License, v. 2.0.  If a copy of the MPL was not distributed with this
++file, you can obtain one at https://mozilla.org/MPL/2.0/.
++
++See the COPYRIGHT file distributed with this work for additional
++information regarding copyright ownership.
++"""
++
++import dns.rcode
++
++from isctest.asyncserver import AsyncDnsServer, IgnoreAllQueries
++
++from srtt_ans import DelayedQnameRangeHandler
++
++
++class Foo1ToFoo199Handler(DelayedQnameRangeHandler):
++    max_qname = 199
++    delay = 0.03
++
++
++def main() -> None:
++    server = AsyncDnsServer(default_aa=True, default_rcode=dns.rcode.NOERROR)
++    server.install_response_handlers(
++        Foo1ToFoo199Handler(),
++        IgnoreAllQueries(),
++    )
++    server.run()
++
++
++if __name__ == "__main__":
++    main()
+diff --git a/bin/tests/system/srtt/ans4/ans.py b/bin/tests/system/srtt/ans4/ans.py
+new file mode 100644
+index 0000000000..2e12b0ba7d
+--- /dev/null
++++ b/bin/tests/system/srtt/ans4/ans.py
+@@ -0,0 +1,36 @@
++"""
++Copyright (C) Internet Systems Consortium, Inc. ("ISC")
++
++SPDX-License-Identifier: MPL-2.0
++
++This Source Code Form is subject to the terms of the Mozilla Public
++License, v. 2.0.  If a copy of the MPL was not distributed with this
++file, you can obtain one at https://mozilla.org/MPL/2.0/.
++
++See the COPYRIGHT file distributed with this work for additional
++information regarding copyright ownership.
++"""
++
++import dns.rcode
++
++from isctest.asyncserver import AsyncDnsServer, IgnoreAllQueries
++
++from srtt_ans import DelayedQnameRangeHandler
++
++
++class Foo1ToFoo299Handler(DelayedQnameRangeHandler):
++    max_qname = 299
++    delay = 0.08
++
++
++def main() -> None:
++    server = AsyncDnsServer(default_aa=True, default_rcode=dns.rcode.NOERROR)
++    server.install_response_handlers(
++        Foo1ToFoo299Handler(),
++        IgnoreAllQueries(),
++    )
++    server.run()
++
++
++if __name__ == "__main__":
++    main()
+diff --git a/bin/tests/system/srtt/ans5/ans.py b/bin/tests/system/srtt/ans5/ans.py
+new file mode 100644
+index 0000000000..b40306908c
+--- /dev/null
++++ b/bin/tests/system/srtt/ans5/ans.py
+@@ -0,0 +1,36 @@
++"""
++Copyright (C) Internet Systems Consortium, Inc. ("ISC")
++
++SPDX-License-Identifier: MPL-2.0
++
++This Source Code Form is subject to the terms of the Mozilla Public
++License, v. 2.0.  If a copy of the MPL was not distributed with this
++file, you can obtain one at https://mozilla.org/MPL/2.0/.
++
++See the COPYRIGHT file distributed with this work for additional
++information regarding copyright ownership.
++"""
++
++import dns.rcode
++
++from isctest.asyncserver import AsyncDnsServer, IgnoreAllQueries
++
++from srtt_ans import DelayedQnameRangeHandler
++
++
++class Foo1ToFoo399Handler(DelayedQnameRangeHandler):
++    max_qname = 399
++    delay = 0.15
++
++
++def main() -> None:
++    server = AsyncDnsServer(default_aa=True, default_rcode=dns.rcode.NOERROR)
++    server.install_response_handlers(
++        Foo1ToFoo399Handler(),
++        IgnoreAllQueries(),
++    )
++    server.run()
++
++
++if __name__ == "__main__":
++    main()
+diff --git a/bin/tests/system/srtt/ns1/named.conf.j2 b/bin/tests/system/srtt/ns1/named.conf.j2
+new file mode 100644
+index 0000000000..eb079c95ab
+--- /dev/null
++++ b/bin/tests/system/srtt/ns1/named.conf.j2
+@@ -0,0 +1,29 @@
++/*
++ * Copyright (C) Internet Systems Consortium, Inc. ("ISC")
++ *
++ * SPDX-License-Identifier: MPL-2.0
++ *
++ * This Source Code Form is subject to the terms of the Mozilla Public
++ * License, v. 2.0.  If a copy of the MPL was not distributed with this
++ * file, you can obtain one at https://mozilla.org/MPL/2.0/.
++ *
++ * See the COPYRIGHT file distributed with this work for additional
++ * information regarding copyright ownership.
++ */
++
++options {
++	query-source address 10.53.0.1;
++	notify-source 10.53.0.1;
++	transfer-source 10.53.0.1;
++	port @PORT@;
++	pid-file "named.pid";
++	listen-on { 10.53.0.1; };
++	listen-on-v6 { none; };
++	recursion no;
++	notify yes;
++};
++
++zone "." {
++	type primary;
++	file "root.db";
++};
+diff --git a/bin/tests/system/srtt/ns1/root.db b/bin/tests/system/srtt/ns1/root.db
+new file mode 100644
+index 0000000000..29ecd1d89d
+--- /dev/null
++++ b/bin/tests/system/srtt/ns1/root.db
+@@ -0,0 +1,36 @@
++; Copyright (C) Internet Systems Consortium, Inc. ("ISC")
++;
++; SPDX-License-Identifier: MPL-2.0
++;
++; This Source Code Form is subject to the terms of the Mozilla Public
++; License, v. 2.0.  If a copy of the MPL was not distributed with this
++; file, you can obtain one at https://mozilla.org/MPL/2.0/.
++;
++; See the COPYRIGHT file distributed with this work for additional
++; information regarding copyright ownership.
++
++$TTL 300
++. 			IN SOA	owner.root-servers.nil. a.root-servers.nil. (
++				2000042100   	; serial
++				600         	; refresh
++				600         	; retry
++				1200    	; expire
++				600       	; minimum
++				)
++.			NS	a.root-servers.nil.
++a.root-servers.nil.	A	10.53.0.1
++
++; The idea is that the resolver would do 2 ADB lookups, so there would be 2
++; find list, both with 2 IPs in it. ns1 (which is actually ans2 and ans5) would
++; have both the slowest and fastest addresses. ns2 (which is actually ans3 and
++; ans4) would have two addresses in the middle.
++
++example.		NS	ns1.example.
++example.		NS	ns1.example.
++example.		NS	ns2.example.
++example.		NS	ns2.example.
++
++ns1.example.		A	10.53.0.2 ; delay is 0
++ns1.example.		A	10.53.0.5 ; delay is 0.15
++ns2.example.		A	10.53.0.4 ; delay is 0.08
++ns2.example.		A	10.53.0.3 ; delay is 0.03
+diff --git a/bin/tests/system/srtt/ns6/named.args b/bin/tests/system/srtt/ns6/named.args
+new file mode 100644
+index 0000000000..b5de5874ec
+--- /dev/null
++++ b/bin/tests/system/srtt/ns6/named.args
+@@ -0,0 +1 @@
++-D srtt-ns6 -m record -c named.conf -d 99 -g -T maxcachesize=2097152 -4
+diff --git a/bin/tests/system/srtt/ns6/named.conf.j2 b/bin/tests/system/srtt/ns6/named.conf.j2
+new file mode 100644
+index 0000000000..1d27505a8e
+--- /dev/null
++++ b/bin/tests/system/srtt/ns6/named.conf.j2
+@@ -0,0 +1,41 @@
++/*
++ * Copyright (C) Internet Systems Consortium, Inc. ("ISC")
++ *
++ * SPDX-License-Identifier: MPL-2.0
++ *
++ * This Source Code Form is subject to the terms of the Mozilla Public
++ * License, v. 2.0.  If a copy of the MPL was not distributed with this
++ * file, you can obtain one at https://mozilla.org/MPL/2.0/.
++ *
++ * See the COPYRIGHT file distributed with this work for additional
++ * information regarding copyright ownership.
++ */
++
++
++options {
++	query-source address 10.53.0.6;
++	notify-source 10.53.0.6;
++	transfer-source 10.53.0.6;
++	port @PORT@;
++	pid-file "named.pid";
++	listen-on { 10.53.0.6; };
++	listen-on-v6 { none; };
++	recursion yes;
++	dnssec-validation no;
++	dnstap { resolver query; };
++	dnstap-output file "dnstap.out";
++};
++
++key rndc_key {
++	secret "1234abcd8765";
++	algorithm @DEFAULT_HMAC@;
++};
++
++controls {
++	inet 10.53.0.6 port @CONTROLPORT@ allow { any; } keys { rndc_key; };
++};
++
++zone "." {
++	type hint;
++	file "../../_common/root.hint";
++};
+diff --git a/bin/tests/system/srtt/prereq.sh b/bin/tests/system/srtt/prereq.sh
+new file mode 100644
+index 0000000000..747f448982
+--- /dev/null
++++ b/bin/tests/system/srtt/prereq.sh
+@@ -0,0 +1,20 @@
++#!/bin/sh
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
++. ../conf.sh
++
++$FEATURETEST --enable-dnstap || {
++  echo_i "This test requires dnstap support." >&2
++  exit 255
++}
++exit 0
+diff --git a/bin/tests/system/srtt/srtt_ans.py b/bin/tests/system/srtt/srtt_ans.py
+new file mode 100644
+index 0000000000..9387486993
+--- /dev/null
++++ b/bin/tests/system/srtt/srtt_ans.py
+@@ -0,0 +1,59 @@
++"""
++Copyright (C) Internet Systems Consortium, Inc. ("ISC")
++
++SPDX-License-Identifier: MPL-2.0
++
++This Source Code Form is subject to the terms of the Mozilla Public
++License, v. 2.0.  If a copy of the MPL was not distributed with this
++file, you can obtain one at https://mozilla.org/MPL/2.0/.
++
++See the COPYRIGHT file distributed with this work for additional
++information regarding copyright ownership.
++"""
++
++from collections.abc import AsyncGenerator
++
++import abc
++
++import dns.rdataclass
++import dns.rdatatype
++import dns.rrset
++
++from isctest.asyncserver import DnsResponseSend, QnameQtypeHandler, QueryContext
++
++
++class DelayedQnameRangeHandler(QnameQtypeHandler):
++    """
++    Respond to queries for QNAMEs "foo1.example." through "foo<N>.example."
++    with QTYPE=A, where <N> must be defined by the subclass.  Every response is
++    delayed by a fixed amount of time, which must also be defined (in seconds)
++    by the subclass.
++    """
++
++    @property
++    def qnames(self) -> list[str]:
++        return [f"foo{x}.example." for x in range(1, self.max_qname + 1)]
++
++    qtypes = [dns.rdatatype.A]
++
++    @property
++    @abc.abstractmethod
++    def max_qname(self) -> int:
++        raise NotImplementedError
++
++    @property
++    @abc.abstractmethod
++    def delay(self) -> float:
++        raise NotImplementedError
++
++    def __str__(self) -> str:
++        return f"{self.__class__.__name__}(foo[1-{self.max_qname}].example/A)"
++
++    async def get_responses(
++        self, qctx: QueryContext
++    ) -> AsyncGenerator[DnsResponseSend, None]:
++        a_rrset = dns.rrset.from_text(
++            qctx.qname, 300, dns.rdataclass.IN, dns.rdatatype.A, "10.53.9.9"
++        )
++        qctx.response.answer.append(a_rrset)
++        yield DnsResponseSend(qctx.response, delay=self.delay)
+diff --git a/bin/tests/system/srtt/tests_srtt.py b/bin/tests/system/srtt/tests_srtt.py
+new file mode 100644
+index 0000000000..55611922a7
+--- /dev/null
++++ b/bin/tests/system/srtt/tests_srtt.py
+@@ -0,0 +1,86 @@
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
++import os
++
++import isctest
++
++
++def line_to_dst_ips(line):
++    # dnstap-read output line example
++    # 05-Feb-2026 11:00:57.853 RQ 10.53.0.6:38507 -> 10.53.0.3:22047 TCP 56b fooXXX.example./IN/NS
++    _, _, _, _, _, dst, _, _, _ = line.split(" ", 9)
++    ip, _ = dst.split(":", 1)
++    return ip
++
++
++def extract_dnstap(ns, nsid):
++    ns.rndc("dnstap -roll 1")
++    path = os.path.join(nsid, "dnstap.out.0")
++    dnstapread = isctest.run.cmd(
++        [os.getenv("DNSTAPREAD"), path],
++    )
++
++    lines = dnstapread.out.splitlines()
++    return map(line_to_dst_ips, lines)
++
++
++def assert_used_auth(ns, nsid, authip):
++    ips = extract_dnstap(ns, nsid)
++    queries = 0
++    matches = 0
++    for ip in ips:
++        queries += 1
++        if ip == authip:
++            matches += 1
++    assert matches > 85
++    assert queries <= 115
++
++
++def test_srtt(ns6):
++    for i in range(1, 100):
++        msg = isctest.query.create(f"foo{i}.example.", "A")
++        res = isctest.query.udp(msg, ns6.ip)
++        isctest.check.noerror(res)
++        assert len(res.answer[0]) == 1
++        res.answer[0].ttl = 300
++        assert str(res.answer[0]) == f"foo{i}.example. 300 IN A 10.53.9.9"
++
++    assert_used_auth(ns6, "ns6", "10.53.0.2")
++
++    for i in range(100, 200):
++        msg = isctest.query.create(f"foo{i}.example.", "A")
++        res = isctest.query.udp(msg, ns6.ip)
++        isctest.check.noerror(res)
++        assert len(res.answer[0]) == 1
++        res.answer[0].ttl = 300
++        assert str(res.answer[0]) == f"foo{i}.example. 300 IN A 10.53.9.9"
++
++    assert_used_auth(ns6, "ns6", "10.53.0.3")
++
++    for i in range(200, 300):
++        msg = isctest.query.create(f"foo{i}.example.", "A")
++        res = isctest.query.udp(msg, ns6.ip)
++        isctest.check.noerror(res)
++        assert len(res.answer[0]) == 1
++        res.answer[0].ttl = 300
++        assert str(res.answer[0]) == f"foo{i}.example. 300 IN A 10.53.9.9"
++
++    assert_used_auth(ns6, "ns6", "10.53.0.4")
++
++    for i in range(300, 400):
++        msg = isctest.query.create(f"foo{i}.example.", "A")
++        res = isctest.query.udp(msg, ns6.ip)
++        isctest.check.noerror(res)
++        assert len(res.answer[0]) == 1
++        res.answer[0].ttl = 300
++        assert str(res.answer[0]) == f"foo{i}.example. 300 IN A 10.53.9.9"
++    assert_used_auth(ns6, "ns6", "10.53.0.5")
+-- 
+2.35.6
+
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-3592_p6.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-3592_p6.patch
new file mode 100644
index 0000000000..449e1a1eee
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-3592_p6.patch
@@ -0,0 +1,41 @@
+From 4edafe63a0dfa9142e88ba66b429c35ee286d4dd Mon Sep 17 00:00:00 2001
+From: Colin Vidal <colin@isc.org>
+Date: Thu, 30 Apr 2026 19:02:47 +0100
+Subject: [PATCH] Fix `resend_loop` system test
+
+Commit `c78016ff91ed33221831b4723108d69639430913` backported asyncserver
+features to 9.18 branches, but the `resend_loop` test was still using
+the previous API to install handlers (passing a list of handlers rather
+than a varags). This is now fixed.
+
+CVE: CVE-2026-3592
+Upstream-Status: Backport [https://gitlab.com/isc-projects/bind9/-/commit/cb13dcabdb64bdb5f8f7ed33980aaf470a90e877]
+
+(cherry picked from commit cb13dcabdb64bdb5f8f7ed33980aaf470a90e877)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ bin/tests/system/resend_loop/ans3/ans.py | 8 +++-----
+ 1 file changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/bin/tests/system/resend_loop/ans3/ans.py b/bin/tests/system/resend_loop/ans3/ans.py
+index 90a3f2f9cc..217bae0301 100644
+--- a/bin/tests/system/resend_loop/ans3/ans.py
++++ b/bin/tests/system/resend_loop/ans3/ans.py
+@@ -111,11 +111,9 @@ class NoErrorHandler(ResponseHandler):
+ def resend_server() -> AsyncDnsServer:
+     server = AsyncDnsServer(default_aa=True, default_rcode=dns.rcode.NOERROR)
+     server.install_response_handlers(
+-        [
+-            PrimeHandler(),
+-            CookieHandler(),
+-            NoErrorHandler(),
+-        ]
++        PrimeHandler(),
++        CookieHandler(),
++        NoErrorHandler(),
+     )
+     return server
+ 
+-- 
+2.35.6
+
diff --git a/meta/recipes-connectivity/bind/bind_9.18.44.bb b/meta/recipes-connectivity/bind/bind_9.18.44.bb
index d55e0e0c4d..dd8923f185 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.44.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.44.bb
@@ -26,6 +26,12 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://CVE-2026-5950_p1.patch \
            file://CVE-2026-5950_p2.patch \
            file://CVE-2026-5950_p3.patch \
+           file://CVE-2026-3592_p1.patch \
+           file://CVE-2026-3592_p2.patch \
+           file://CVE-2026-3592_p3.patch \
+           file://CVE-2026-3592_p4.patch \
+           file://CVE-2026-3592_p5.patch \
+           file://CVE-2026-3592_p6.patch \
            "
 
 SRC_URI[sha256sum] = "81f5035a25c576af1a93f0061cf70bde6d00a0c7bd1274abf73f5b5389a6f82d"
-- 
2.35.6


