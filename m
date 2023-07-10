Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69CF1EB64D9
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 05:42:48 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.33645.1688967758572291380
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jul 2023 22:42:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=VL4zryiP;
 spf=pass (domain: mvista.com, ip: 209.85.222.172, mailfrom: hprajapati@mvista.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-76571dae5feso391182885a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Jul 2023 22:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1688967757; x=1691559757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ajX6bgh1HvQVCr0R+3r/IkLmB55W9vLE7xTy7tW0qBs=;
        b=VL4zryiPsVdi5EiWc8gwyPM6TNwc4LCPY12ZvrOD0XJ74/GyDkBqMXtaUWcM+yetlj
         AHTjp2agIZt5+m1Pmi1PZ8tpI3PPFRCmpTwzpqgfC7UTRVGbq2GovpZtiu20gQHzdei7
         uren8NJwMaMyHSKzi3d+lYX753brpZzAF4QI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688967757; x=1691559757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ajX6bgh1HvQVCr0R+3r/IkLmB55W9vLE7xTy7tW0qBs=;
        b=OXkBX0uq2c/NdR7ZoE9HkS74i1l+6f2j0QbnHvVwEwz2MOQdwakPVppavpxx8Pp9hp
         F55j85RJp32whPYLb8KhCioacYmPYl/QWMOc+J6X06Rvg1BAm0CUAbDxSB4x+qprP/u6
         DaNVU/5pHWH9sYxPdL7Wo+4GfgSFtxhVZdG86yvj7pjZPtBqHwuaoqfiRNPqgLM46DCv
         +VugHvHRkCEWdKkEIYIa1zDPYDH+6nRFJzaqhOFdz17DXwHHzcjga0ZsAFfOZeVg+SZL
         IES29Z2qEjeChW8S4D8VRl8RZ9+ZZ5IIOGZcvD4oo5uXNAPfWqIrRKtqZ3Yg1sqg4Uae
         7WAg==
X-Gm-Message-State: ABy/qLYvFKnC1qP4Yoxm4vD1RTAKY1kc7vmqvc3uhLX3bkRqNbqbZ8nQ
	TbY7o0e5hv8EEUCxahl4mplRdo8Kxqd2J/22wYe+Dg==
X-Google-Smtp-Source: APBJJlFJvfWZeTjRZMSbK4ZMRDLfc7IfZmEN6O3xTXbxooJ4Q48hTF/L/HN6huJvgF6UM89x5zfBLw==
X-Received: by 2002:a05:620a:4514:b0:767:3799:fa98 with SMTP id t20-20020a05620a451400b007673799fa98mr15600520qkp.25.1688967757415;
        Sun, 09 Jul 2023 22:42:37 -0700 (PDT)
Received: from MVIN00024 ([150.129.170.194])
        by smtp.gmail.com with ESMTPSA id c10-20020a170902724a00b001b3bf8001a9sm7292970pll.48.2023.07.09.22.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 22:42:37 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Mon, 10 Jul 2023 11:12:32 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] bind : fix CVE-2023-2828 & CVE-2023-2911
Date: Mon, 10 Jul 2023 11:12:31 +0530
Message-Id: <20230710054231.41538-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 05:42:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184059

Backport fixes for:
* CVE-2023-2828 - Upstream-Status: Backport from https://gitlab.isc.org/isc-projects/bind9/-/commit/e9d5219fca9f6b819d953990b369d6acfb4e952b
* CVE-2023-2911 - Upstream-Status: Backport from https://gitlab.isc.org/isc-projects/bind9/-/commit/240caa32b9cab90a38ab863fd64e6becf5d1393c && https://gitlab.isc.org/isc-projects/bind9/-/commit/ff5bacf17c2451e9d48c78a5ef96ec0c376ff33d

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../bind/bind-9.18.11/CVE-2023-2828.patch     | 197 ++++++++++++++++++
 .../bind/bind-9.18.11/CVE-2023-2911.patch     |  97 +++++++++
 .../recipes-connectivity/bind/bind_9.18.11.bb |   2 +
 3 files changed, 296 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind-9.18.11/CVE-2023-2828.patch
 create mode 100644 meta/recipes-connectivity/bind/bind-9.18.11/CVE-2023-2911.patch

diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/CVE-2023-2828.patch b/meta/recipes-connectivity/bind/bind-9.18.11/CVE-2023-2828.patch
new file mode 100644
index 0000000000..ef2d64b16c
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind-9.18.11/CVE-2023-2828.patch
@@ -0,0 +1,197 @@
+From e9d5219fca9f6b819d953990b369d6acfb4e952b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ond=C5=99ej=20Sur=C3=BD?= <ondrej@isc.org>
+Date: Tue, 30 May 2023 08:46:17 +0200
+Subject: [PATCH] Improve RBT overmem cache cleaning
+
+When cache memory usage is over the configured cache size (overmem) and
+we are cleaning unused entries, it might not be enough to clean just two
+entries if the entries to be expired are smaller than the newly added
+rdata.  This could be abused by an attacker to cause a remote Denial of
+Service by possibly running out of the operating system memory.
+
+Currently, the addrdataset() tries to do a single TTL-based cleaning
+considering the serve-stale TTL and then optionally moves to overmem
+cleaning if we are in that condition.  Then the overmem_purge() tries to
+do another single TTL based cleaning from the TTL heap and then continue
+with LRU-based cleaning up to 2 entries cleaned.
+
+Squash the TTL-cleaning mechanism into single call from addrdataset(),
+but ignore the serve-stale TTL if we are currently overmem.
+
+Then instead of having a fixed number of entries to clean, pass the size
+of newly added rdatasetheader to the overmem_purge() function and
+cleanup at least the size of the newly added data.  This prevents the
+cache going over the configured memory limit (`max-cache-size`).
+
+Additionally, refactor the overmem_purge() function to reduce for-loop
+nesting for readability.
+
+Patch taken from : https://downloads.isc.org/isc/bind9/9.18.16/patches/0001-CVE-2023-2828.patch
+
+Upstream-Status: Backport [https://gitlab.isc.org/isc-projects/bind9/-/commit/e9d5219fca9f6b819d953990b369d6acfb4e952b]
+CVE: CVE-2023-2828
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ lib/dns/rbtdb.c | 106 +++++++++++++++++++++++++++++-------------------
+ 1 file changed, 65 insertions(+), 41 deletions(-)
+
+diff --git a/lib/dns/rbtdb.c b/lib/dns/rbtdb.c
+index d1aee54..ba60a49 100644
+--- a/lib/dns/rbtdb.c
++++ b/lib/dns/rbtdb.c
+@@ -561,7 +561,7 @@ static void
+ expire_header(dns_rbtdb_t *rbtdb, rdatasetheader_t *header, bool tree_locked,
+ 	      expire_t reason);
+ static void
+-overmem_purge(dns_rbtdb_t *rbtdb, unsigned int locknum_start, isc_stdtime_t now,
++overmem_purge(dns_rbtdb_t *rbtdb, unsigned int locknum_start, size_t purgesize,
+ 	      bool tree_locked);
+ static void
+ resign_insert(dns_rbtdb_t *rbtdb, int idx, rdatasetheader_t *newheader);
+@@ -6787,6 +6787,16 @@ cleanup:
+ 
+ static dns_dbmethods_t zone_methods;
+ 
++static size_t
++rdataset_size(rdatasetheader_t *header) {
++	if (!NONEXISTENT(header)) {
++		return (dns_rdataslab_size((unsigned char *)header,
++					   sizeof(*header)));
++	}
++
++	return (sizeof(*header));
++}
++
+ static isc_result_t
+ addrdataset(dns_db_t *db, dns_dbnode_t *node, dns_dbversion_t *version,
+ 	    isc_stdtime_t now, dns_rdataset_t *rdataset, unsigned int options,
+@@ -6951,7 +6961,8 @@ addrdataset(dns_db_t *db, dns_dbnode_t *node, dns_dbversion_t *version,
+ 	}
+ 
+ 	if (cache_is_overmem) {
+-		overmem_purge(rbtdb, rbtnode->locknum, now, tree_locked);
++		overmem_purge(rbtdb, rbtnode->locknum, rdataset_size(newheader),
++			      tree_locked);
+ 	}
+ 
+ 	NODE_LOCK(&rbtdb->node_locks[rbtnode->locknum].lock,
+@@ -6970,11 +6981,18 @@ addrdataset(dns_db_t *db, dns_dbnode_t *node, dns_dbversion_t *version,
+ 		}
+ 
+ 		header = isc_heap_element(rbtdb->heaps[rbtnode->locknum], 1);
+-		if (header != NULL &&
+-		    header->rdh_ttl + STALE_TTL(header, rbtdb) <
+-			    now - RBTDB_VIRTUAL)
+-		{
+-			expire_header(rbtdb, header, tree_locked, expire_ttl);
++		if (header != NULL) {
++			dns_ttl_t rdh_ttl = header->rdh_ttl;
++
++			/* Only account for stale TTL if cache is not overmem */
++			if (!cache_is_overmem) {
++				rdh_ttl += STALE_TTL(header, rbtdb);
++			}
++
++			if (rdh_ttl < now - RBTDB_VIRTUAL) {
++				expire_header(rbtdb, header, tree_locked,
++					      expire_ttl);
++			}
+ 		}
+ 
+ 		/*
+@@ -10114,52 +10132,58 @@ update_header(dns_rbtdb_t *rbtdb, rdatasetheader_t *header, isc_stdtime_t now) {
+ 	ISC_LIST_PREPEND(rbtdb->rdatasets[header->node->locknum], header, link);
+ }
+ 
++static size_t
++expire_lru_headers(dns_rbtdb_t *rbtdb, unsigned int locknum, size_t purgesize,
++		   bool tree_locked) {
++	rdatasetheader_t *header, *header_prev;
++	size_t purged = 0;
++
++	for (header = ISC_LIST_TAIL(rbtdb->rdatasets[locknum]);
++	     header != NULL && purged <= purgesize; header = header_prev)
++	{
++		header_prev = ISC_LIST_PREV(header, link);
++		/*
++		 * Unlink the entry at this point to avoid checking it
++		 * again even if it's currently used someone else and
++		 * cannot be purged at this moment.  This entry won't be
++		 * referenced any more (so unlinking is safe) since the
++		 * TTL was reset to 0.
++		 */
++		ISC_LIST_UNLINK(rbtdb->rdatasets[locknum], header, link);
++		size_t header_size = rdataset_size(header);
++		expire_header(rbtdb, header, tree_locked, expire_lru);
++		purged += header_size;
++	}
++
++	return (purged);
++}
++
+ /*%
+- * Purge some expired and/or stale (i.e. unused for some period) cache entries
+- * under an overmem condition.  To recover from this condition quickly, up to
+- * 2 entries will be purged.  This process is triggered while adding a new
+- * entry, and we specifically avoid purging entries in the same LRU bucket as
+- * the one to which the new entry will belong.  Otherwise, we might purge
+- * entries of the same name of different RR types while adding RRsets from a
+- * single response (consider the case where we're adding A and AAAA glue records
+- * of the same NS name).
++ * Purge some stale (i.e. unused for some period - LRU based cleaning) cache
++ * entries under the overmem condition.  To recover from this condition quickly,
++ * we cleanup entries up to the size of newly added rdata (passed as purgesize).
++ *
++ * This process is triggered while adding a new entry, and we specifically avoid
++ * purging entries in the same LRU bucket as the one to which the new entry will
++ * belong.  Otherwise, we might purge entries of the same name of different RR
++ * types while adding RRsets from a single response (consider the case where
++ * we're adding A and AAAA glue records of the same NS name).
+  */
+ static void
+-overmem_purge(dns_rbtdb_t *rbtdb, unsigned int locknum_start, isc_stdtime_t now,
++overmem_purge(dns_rbtdb_t *rbtdb, unsigned int locknum_start, size_t purgesize,
+ 	      bool tree_locked) {
+-	rdatasetheader_t *header, *header_prev;
+ 	unsigned int locknum;
+-	int purgecount = 2;
++	size_t purged = 0;
+ 
+ 	for (locknum = (locknum_start + 1) % rbtdb->node_lock_count;
+-	     locknum != locknum_start && purgecount > 0;
++	     locknum != locknum_start && purged <= purgesize;
+ 	     locknum = (locknum + 1) % rbtdb->node_lock_count)
+ 	{
+ 		NODE_LOCK(&rbtdb->node_locks[locknum].lock,
+ 			  isc_rwlocktype_write);
+ 
+-		header = isc_heap_element(rbtdb->heaps[locknum], 1);
+-		if (header && header->rdh_ttl < now - RBTDB_VIRTUAL) {
+-			expire_header(rbtdb, header, tree_locked, expire_ttl);
+-			purgecount--;
+-		}
+-
+-		for (header = ISC_LIST_TAIL(rbtdb->rdatasets[locknum]);
+-		     header != NULL && purgecount > 0; header = header_prev)
+-		{
+-			header_prev = ISC_LIST_PREV(header, link);
+-			/*
+-			 * Unlink the entry at this point to avoid checking it
+-			 * again even if it's currently used someone else and
+-			 * cannot be purged at this moment.  This entry won't be
+-			 * referenced any more (so unlinking is safe) since the
+-			 * TTL was reset to 0.
+-			 */
+-			ISC_LIST_UNLINK(rbtdb->rdatasets[locknum], header,
+-					link);
+-			expire_header(rbtdb, header, tree_locked, expire_lru);
+-			purgecount--;
+-		}
++		purged += expire_lru_headers(rbtdb, locknum, purgesize - purged,
++					     tree_locked);
+ 
+ 		NODE_UNLOCK(&rbtdb->node_locks[locknum].lock,
+ 			    isc_rwlocktype_write);
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/CVE-2023-2911.patch b/meta/recipes-connectivity/bind/bind-9.18.11/CVE-2023-2911.patch
new file mode 100644
index 0000000000..8e9a358dee
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind-9.18.11/CVE-2023-2911.patch
@@ -0,0 +1,97 @@
+From ff5bacf17c2451e9d48c78a5ef96ec0c376ff33d Mon Sep 17 00:00:00 2001
+From: Matthijs Mekking <matthijs@isc.org>
+Date: Thu, 1 Jun 2023 10:03:48 +0200
+Subject: [PATCH] Fix serve-stale hang at shutdown
+
+The 'refresh_rrset' variable is used to determine if we can detach from
+the client. This can cause a hang on shutdown. To fix this, move setting
+of the 'nodetach' variable up to where 'refresh_rrset' is set (in
+query_lookup(), and thus not in ns_query_done()), and set it to false
+when actually refreshing the RRset, so that when this lookup is
+completed, the client will be detached.
+
+Patch taken from :https://downloads.isc.org/isc/bind9/9.18.16/patches/0003-CVE-2023-2911.patch
+
+Upstream-Status: Backport [https://gitlab.isc.org/isc-projects/bind9/-/commit/240caa32b9cab90a38ab863fd64e6becf5d1393c && https://gitlab.isc.org/isc-projects/bind9/-/commit/ff5bacf17c2451e9d48c78a5ef96ec0c376ff33d]
+CVE: CVE-2023-2911
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ lib/ns/query.c | 30 ++++++++++++++++++++++--------
+ 1 file changed, 22 insertions(+), 8 deletions(-)
+
+diff --git a/lib/ns/query.c b/lib/ns/query.c
+index 0d2ba6b..8945dd4 100644
+--- a/lib/ns/query.c
++++ b/lib/ns/query.c
+@@ -5824,6 +5824,7 @@ query_refresh_rrset(query_ctx_t *orig_qctx) {
+ 	qctx.client->query.dboptions &= ~(DNS_DBFIND_STALETIMEOUT |
+ 					  DNS_DBFIND_STALEOK |
+ 					  DNS_DBFIND_STALEENABLED);
++	qctx.client->nodetach = false;
+ 
+ 	/*
+ 	 * We'll need some resources...
+@@ -6076,7 +6077,14 @@ query_lookup(query_ctx_t *qctx) {
+ 					"%s stale answer used, an attempt to "
+ 					"refresh the RRset will still be made",
+ 					namebuf);
++
+ 				qctx->refresh_rrset = STALE(qctx->rdataset);
++				/*
++				 * If we are refreshing the RRSet, we must not
++				 * detach from the client in query_send().
++				 */
++				qctx->client->nodetach = qctx->refresh_rrset;
++
+ 				ns_client_extendederror(
+ 					qctx->client, ede,
+ 					"stale data prioritized over lookup");
+@@ -6503,7 +6511,7 @@ ns_query_recurse(ns_client_t *client, dns_rdatatype_t qtype, dns_name_t *qname,
+ 	if (recparam_match(&client->query.recparam, qtype, qname, qdomain)) {
+ 		ns_client_log(client, NS_LOGCATEGORY_CLIENT, NS_LOGMODULE_QUERY,
+ 			      ISC_LOG_INFO, "recursion loop detected");
+-		return (ISC_R_FAILURE);
++		return (ISC_R_ALREADYRUNNING);
+ 	}
+ 
+ 	recparam_update(&client->query.recparam, qtype, qname, qdomain);
+@@ -7620,10 +7628,21 @@ query_usestale(query_ctx_t *qctx, isc_result_t result) {
+ 		return (false);
+ 	}
+ 
+-	if (result == DNS_R_DUPLICATE || result == DNS_R_DROP) {
++	if (qctx->refresh_rrset) {
++		/*
++		 * This is a refreshing query, we have already prioritized
++		 * stale data, so don't enable serve-stale again.
++		 */
++		return (false);
++	}
++
++	if (result == DNS_R_DUPLICATE || result == DNS_R_DROP ||
++	    result == ISC_R_ALREADYRUNNING)
++	{
+ 		/*
+ 		 * Don't enable serve-stale if the result signals a duplicate
+-		 * query or query that is being dropped.
++		 * query or a query that is being dropped or can't proceed
++		 * because of a recursion loop.
+ 		 */
+ 		return (false);
+ 	}
+@@ -11927,12 +11946,7 @@ ns_query_done(query_ctx_t *qctx) {
+ 	/*
+ 	 * Client may have been detached after query_send(), so
+ 	 * we test and store the flag state here, for safety.
+-	 * If we are refreshing the RRSet, we must not detach from the client
+-	 * in the query_send(), so we need to override the flag.
+ 	 */
+-	if (qctx->refresh_rrset) {
+-		qctx->client->nodetach = true;
+-	}
+ 	nodetach = qctx->client->nodetach;
+ 	query_send(qctx->client);
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/bind/bind_9.18.11.bb b/meta/recipes-connectivity/bind/bind_9.18.11.bb
index 0618129318..b3e3b8bef0 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.11.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.11.bb
@@ -18,6 +18,8 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
            file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
            file://0001-avoid-start-failure-with-bind-user.patch \
+           file://CVE-2023-2828.patch \
+           file://CVE-2023-2911.patch \
            "
 
 SRC_URI[sha256sum] = "8ff3352812230cbcbda42df87cad961f94163d3da457c5e4bef8057fd5df2158"
-- 
2.25.1


