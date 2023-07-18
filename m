Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3832EB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 14:26:29 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.9092.1689690381519490113
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 07:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=MXIj5qfv;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-666edfc50deso3575561b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 07:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689690380; x=1692282380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nc+E6eX/285fpAG+zgKxr1yDgXXhCxrEV+imB1sYVnY=;
        b=MXIj5qfvNeNxCz32pXzl+d5MEd1IXGxraKGOuudY7WCXRdqLE02zaD1CchriAdPiVr
         Z08EOMlqhkzVlOQzYr1ef2wRKZNiyydXai2PjEb7E0mGS5A0hab7kbuW3J1fxatTjlDA
         G0UB5xS0+6C0loMwUTp4HWR79AREN8I4WvSK2V3/Hun4zoPZx4D/qzZp+nOGkqDFH1R4
         ICdoCaLTw2m3wfzC+vnsqeyThcP2sktbbqf3eBXgt5b1NsHUWWPbOr4OXQMvtnJfcptU
         v7+EcQfPOxjIyE4XtGSKnuCDrXqWp1YaoQ/0qBTJNgPt30H4TK87hINO2CA7JcgpDxA+
         sBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689690380; x=1692282380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nc+E6eX/285fpAG+zgKxr1yDgXXhCxrEV+imB1sYVnY=;
        b=M7LA3I4CIChwjjfx+28bGUiiAIsKp+aCr6IMLzIiy8L6y28iM05GWy2ku0cAdF7/AX
         pDZa51Vuq87tZuF4aGZy6GqHqcWK0+JMM3zKDq0QHVKmYf+qjwYHp9u7xep888NxPPnz
         atMt6oBlUmLlRc8cFh4oeweRu0g0vAHq1V9oG2RtVvJ8Knp9JljAHSUr82VxX5qIa4ra
         C/Q9a6v+Fk7y3MsiSqn1FhODlvSI0Bg7AU90a2VHek3isLz4W78VQs31jTn/gEAF+oq6
         zFCZw9voLyFWIexkAa6h0FA7zMydCJCY8sWebnd+uRqe3nKBUljUkeBLqF4HxCiyUtPN
         c2Tw==
X-Gm-Message-State: ABy/qLaO3i+3bsLNkgLasevxbLMJe0G8dGY+q1LEcEDGBRzRN8dClphP
	LBPpKiAVQGXzJOHNNOebxMRlWl68ABS7AoBKfoo=
X-Google-Smtp-Source: APBJJlEB+nQSgmZSIdsYFeEzbjfb0oxumjikGRWmN21k8g+wh09cTlwBouRGgAXfVk/K2prrssFhCA==
X-Received: by 2002:a05:6a20:430a:b0:f0:50c4:4c43 with SMTP id h10-20020a056a20430a00b000f050c44c43mr16291474pzk.5.1689690380390;
        Tue, 18 Jul 2023 07:26:20 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020aa78d18000000b006732786b5f1sm1581732pfe.213.2023.07.18.07.26.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 07:26:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/27] bind : fix CVE-2023-2828 & CVE-2023-2911
Date: Tue, 18 Jul 2023 04:25:37 -1000
Message-Id: <08810d3fe6988ea821805eca16105b4632335654.1689689618.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689689618.git.steve@sakoman.com>
References: <cover.1689689618.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 14:26:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184507

From: Hitendra Prajapati <hprajapati@mvista.com>

Backport fixes for:
* CVE-2023-2828 - Upstream-Status: Backport from https://gitlab.isc.org/isc-projects/bind9/-/commit/e9d5219fca9f6b819d953990b369d6acfb4e952b
* CVE-2023-2911 - Upstream-Status: Backport from https://gitlab.isc.org/isc-projects/bind9/-/commit/240caa32b9cab90a38ab863fd64e6becf5d1393c && https://gitlab.isc.org/isc-projects/bind9/-/commit/ff5bacf17c2451e9d48c78a5ef96ec0c376ff33d

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


