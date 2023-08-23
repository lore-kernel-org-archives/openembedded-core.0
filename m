Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B801EE49B5
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:36:37 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.13055.1692801392157859337
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:36:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=P//kTgGj;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1bf0b24d925so37363995ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692801391; x=1693406191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ftxAknFzvoZb0wpDz4KkbK2gCVH26aen1hbB63jvILI=;
        b=P//kTgGjndOmM9wMWQ0kv2Hwi+ntcEDX99JIyacMzI57ioZp3dBxMMPi5hx02rNGXD
         JmmjMd8fGlGWb7aYhkgx+RfglyjRsbPi6Q5OGYdtBbRLinnf9tT4eGGt81iEtF3uTG+S
         PofbfwXwFAbySiZlOcIeoxZa6fokMIahi0k8H4BML/kWDDZx8bv0+OpclDa/DCl5tWTQ
         M4DrmB2VSRhvSEOm/lYtwiybnOpSkaR44pgofbWSTUF6VSFyfLZXqRxAnGMD/rcQu+kQ
         xvCCAggpcg34LX+P7X3ZRXbfJ52vd/n6lJCJGHxIaLkPJV3yXnFdqcloeVGsPK3UTDY3
         9Rew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801391; x=1693406191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ftxAknFzvoZb0wpDz4KkbK2gCVH26aen1hbB63jvILI=;
        b=QKBVK+aR9axrDjXwNb96YjMLs4KX6EJXO9ZQ/wuuulynQCNHyVSqvFl8skJF+usOv0
         Tpx8XXd2pqXU1J9WNY9zZ6gS7IDGfK4eQM64iJDdKbg9mZTHoQ5Guiw7xsaqmWCQz4D7
         9C3WZofphvN8M8DTSKVRhIyAOWmHncGJSyrUz1/mzl7ZR0UqawZyN+AVFqpTvyhH7NRf
         r+B8lz988dzAP657/UGDbcOqE6OY+3HMYxMIB4epOym0T+ZqOd3loKaWrCcMhCCFH6pS
         idZTDVj1eSt7zoDddkPKE1ZE9YQDGIpKIptvhzLCz+YrAnwuSqnjuc6EPkwjp32tfKFE
         R8Ng==
X-Gm-Message-State: AOJu0YwpBjGWe/GwHlC3xqHp3DY9poVxnFsU2h+GeXgfDwA+Qgl6c0TY
	JRIgqYK86HWCMiRLF7VM7ewyUWVqBWMLIPvD/zA=
X-Google-Smtp-Source: AGHT+IGkY3SRGSzYpFYr3INDejnW02JUwKT2lqOFJAeNhTJZFYLk9TIgfb7VTFuL27iLZuym0fWKyA==
X-Received: by 2002:a17:902:ab5a:b0:1b6:649b:92cc with SMTP id ij26-20020a170902ab5a00b001b6649b92ccmr9471007plb.69.1692801390730;
        Wed, 23 Aug 2023 07:36:30 -0700 (PDT)
Received: from xps13.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b001bb750189desm11062478plk.255.2023.08.23.07.36.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:36:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/36] bind: 9.18.11 -> 9.18.17
Date: Wed, 23 Aug 2023 04:35:36 -1000
Message-Id: <f240a373266bd778f380a0611ccf0183d24f76b6.1692799745.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692799745.git.steve@sakoman.com>
References: <cover.1692799745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 14:36:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186587

From: Chee Yang Lee <chee.yang.lee@intel.com>

upgrade also include fix for CVE-2023-2829.

License-Update: removed trailing whitespace from COPYRIGHT

also remove obsolete configuration option epoll and devpoll:
https://github.com/isc-projects/bind9/commit/6b6076c882a00028197b04a827f6cf8e7a5369de

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../bind/bind-9.18.11/CVE-2023-2828.patch     | 197 ------------------
 .../bind/bind-9.18.11/CVE-2023-2911.patch     |  97 ---------
 ...1-avoid-start-failure-with-bind-user.patch |   0
 ...d-V-and-start-log-hide-build-options.patch |   0
 ...ching-for-json-headers-searches-sysr.patch |   0
 .../bind/{bind-9.18.11 => bind-9.18.17}/bind9 |   0
 .../{bind-9.18.11 => bind-9.18.17}/conf.patch |   0
 .../generate-rndc-key.sh                      |   0
 ...t.d-add-support-for-read-only-rootfs.patch |   0
 .../make-etc-initd-bind-stop-work.patch       |   0
 .../named.service                             |   0
 .../bind/{bind_9.18.11.bb => bind_9.18.17.bb} |   8 +-
 12 files changed, 3 insertions(+), 299 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bind/bind-9.18.11/CVE-2023-2828.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind-9.18.11/CVE-2023-2911.patch
 rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.18.17}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.18.17}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.18.17}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.18.17}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.18.17}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.18.17}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.18.17}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.18.17}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.18.17}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.11.bb => bind_9.18.17.bb} (92%)

diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/CVE-2023-2828.patch b/meta/recipes-connectivity/bind/bind-9.18.11/CVE-2023-2828.patch
deleted file mode 100644
index ef2d64b16c..0000000000
--- a/meta/recipes-connectivity/bind/bind-9.18.11/CVE-2023-2828.patch
+++ /dev/null
@@ -1,197 +0,0 @@
-From e9d5219fca9f6b819d953990b369d6acfb4e952b Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Ond=C5=99ej=20Sur=C3=BD?= <ondrej@isc.org>
-Date: Tue, 30 May 2023 08:46:17 +0200
-Subject: [PATCH] Improve RBT overmem cache cleaning
-
-When cache memory usage is over the configured cache size (overmem) and
-we are cleaning unused entries, it might not be enough to clean just two
-entries if the entries to be expired are smaller than the newly added
-rdata.  This could be abused by an attacker to cause a remote Denial of
-Service by possibly running out of the operating system memory.
-
-Currently, the addrdataset() tries to do a single TTL-based cleaning
-considering the serve-stale TTL and then optionally moves to overmem
-cleaning if we are in that condition.  Then the overmem_purge() tries to
-do another single TTL based cleaning from the TTL heap and then continue
-with LRU-based cleaning up to 2 entries cleaned.
-
-Squash the TTL-cleaning mechanism into single call from addrdataset(),
-but ignore the serve-stale TTL if we are currently overmem.
-
-Then instead of having a fixed number of entries to clean, pass the size
-of newly added rdatasetheader to the overmem_purge() function and
-cleanup at least the size of the newly added data.  This prevents the
-cache going over the configured memory limit (`max-cache-size`).
-
-Additionally, refactor the overmem_purge() function to reduce for-loop
-nesting for readability.
-
-Patch taken from : https://downloads.isc.org/isc/bind9/9.18.16/patches/0001-CVE-2023-2828.patch
-
-Upstream-Status: Backport [https://gitlab.isc.org/isc-projects/bind9/-/commit/e9d5219fca9f6b819d953990b369d6acfb4e952b]
-CVE: CVE-2023-2828
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- lib/dns/rbtdb.c | 106 +++++++++++++++++++++++++++++-------------------
- 1 file changed, 65 insertions(+), 41 deletions(-)
-
-diff --git a/lib/dns/rbtdb.c b/lib/dns/rbtdb.c
-index d1aee54..ba60a49 100644
---- a/lib/dns/rbtdb.c
-+++ b/lib/dns/rbtdb.c
-@@ -561,7 +561,7 @@ static void
- expire_header(dns_rbtdb_t *rbtdb, rdatasetheader_t *header, bool tree_locked,
- 	      expire_t reason);
- static void
--overmem_purge(dns_rbtdb_t *rbtdb, unsigned int locknum_start, isc_stdtime_t now,
-+overmem_purge(dns_rbtdb_t *rbtdb, unsigned int locknum_start, size_t purgesize,
- 	      bool tree_locked);
- static void
- resign_insert(dns_rbtdb_t *rbtdb, int idx, rdatasetheader_t *newheader);
-@@ -6787,6 +6787,16 @@ cleanup:
- 
- static dns_dbmethods_t zone_methods;
- 
-+static size_t
-+rdataset_size(rdatasetheader_t *header) {
-+	if (!NONEXISTENT(header)) {
-+		return (dns_rdataslab_size((unsigned char *)header,
-+					   sizeof(*header)));
-+	}
-+
-+	return (sizeof(*header));
-+}
-+
- static isc_result_t
- addrdataset(dns_db_t *db, dns_dbnode_t *node, dns_dbversion_t *version,
- 	    isc_stdtime_t now, dns_rdataset_t *rdataset, unsigned int options,
-@@ -6951,7 +6961,8 @@ addrdataset(dns_db_t *db, dns_dbnode_t *node, dns_dbversion_t *version,
- 	}
- 
- 	if (cache_is_overmem) {
--		overmem_purge(rbtdb, rbtnode->locknum, now, tree_locked);
-+		overmem_purge(rbtdb, rbtnode->locknum, rdataset_size(newheader),
-+			      tree_locked);
- 	}
- 
- 	NODE_LOCK(&rbtdb->node_locks[rbtnode->locknum].lock,
-@@ -6970,11 +6981,18 @@ addrdataset(dns_db_t *db, dns_dbnode_t *node, dns_dbversion_t *version,
- 		}
- 
- 		header = isc_heap_element(rbtdb->heaps[rbtnode->locknum], 1);
--		if (header != NULL &&
--		    header->rdh_ttl + STALE_TTL(header, rbtdb) <
--			    now - RBTDB_VIRTUAL)
--		{
--			expire_header(rbtdb, header, tree_locked, expire_ttl);
-+		if (header != NULL) {
-+			dns_ttl_t rdh_ttl = header->rdh_ttl;
-+
-+			/* Only account for stale TTL if cache is not overmem */
-+			if (!cache_is_overmem) {
-+				rdh_ttl += STALE_TTL(header, rbtdb);
-+			}
-+
-+			if (rdh_ttl < now - RBTDB_VIRTUAL) {
-+				expire_header(rbtdb, header, tree_locked,
-+					      expire_ttl);
-+			}
- 		}
- 
- 		/*
-@@ -10114,52 +10132,58 @@ update_header(dns_rbtdb_t *rbtdb, rdatasetheader_t *header, isc_stdtime_t now) {
- 	ISC_LIST_PREPEND(rbtdb->rdatasets[header->node->locknum], header, link);
- }
- 
-+static size_t
-+expire_lru_headers(dns_rbtdb_t *rbtdb, unsigned int locknum, size_t purgesize,
-+		   bool tree_locked) {
-+	rdatasetheader_t *header, *header_prev;
-+	size_t purged = 0;
-+
-+	for (header = ISC_LIST_TAIL(rbtdb->rdatasets[locknum]);
-+	     header != NULL && purged <= purgesize; header = header_prev)
-+	{
-+		header_prev = ISC_LIST_PREV(header, link);
-+		/*
-+		 * Unlink the entry at this point to avoid checking it
-+		 * again even if it's currently used someone else and
-+		 * cannot be purged at this moment.  This entry won't be
-+		 * referenced any more (so unlinking is safe) since the
-+		 * TTL was reset to 0.
-+		 */
-+		ISC_LIST_UNLINK(rbtdb->rdatasets[locknum], header, link);
-+		size_t header_size = rdataset_size(header);
-+		expire_header(rbtdb, header, tree_locked, expire_lru);
-+		purged += header_size;
-+	}
-+
-+	return (purged);
-+}
-+
- /*%
-- * Purge some expired and/or stale (i.e. unused for some period) cache entries
-- * under an overmem condition.  To recover from this condition quickly, up to
-- * 2 entries will be purged.  This process is triggered while adding a new
-- * entry, and we specifically avoid purging entries in the same LRU bucket as
-- * the one to which the new entry will belong.  Otherwise, we might purge
-- * entries of the same name of different RR types while adding RRsets from a
-- * single response (consider the case where we're adding A and AAAA glue records
-- * of the same NS name).
-+ * Purge some stale (i.e. unused for some period - LRU based cleaning) cache
-+ * entries under the overmem condition.  To recover from this condition quickly,
-+ * we cleanup entries up to the size of newly added rdata (passed as purgesize).
-+ *
-+ * This process is triggered while adding a new entry, and we specifically avoid
-+ * purging entries in the same LRU bucket as the one to which the new entry will
-+ * belong.  Otherwise, we might purge entries of the same name of different RR
-+ * types while adding RRsets from a single response (consider the case where
-+ * we're adding A and AAAA glue records of the same NS name).
-  */
- static void
--overmem_purge(dns_rbtdb_t *rbtdb, unsigned int locknum_start, isc_stdtime_t now,
-+overmem_purge(dns_rbtdb_t *rbtdb, unsigned int locknum_start, size_t purgesize,
- 	      bool tree_locked) {
--	rdatasetheader_t *header, *header_prev;
- 	unsigned int locknum;
--	int purgecount = 2;
-+	size_t purged = 0;
- 
- 	for (locknum = (locknum_start + 1) % rbtdb->node_lock_count;
--	     locknum != locknum_start && purgecount > 0;
-+	     locknum != locknum_start && purged <= purgesize;
- 	     locknum = (locknum + 1) % rbtdb->node_lock_count)
- 	{
- 		NODE_LOCK(&rbtdb->node_locks[locknum].lock,
- 			  isc_rwlocktype_write);
- 
--		header = isc_heap_element(rbtdb->heaps[locknum], 1);
--		if (header && header->rdh_ttl < now - RBTDB_VIRTUAL) {
--			expire_header(rbtdb, header, tree_locked, expire_ttl);
--			purgecount--;
--		}
--
--		for (header = ISC_LIST_TAIL(rbtdb->rdatasets[locknum]);
--		     header != NULL && purgecount > 0; header = header_prev)
--		{
--			header_prev = ISC_LIST_PREV(header, link);
--			/*
--			 * Unlink the entry at this point to avoid checking it
--			 * again even if it's currently used someone else and
--			 * cannot be purged at this moment.  This entry won't be
--			 * referenced any more (so unlinking is safe) since the
--			 * TTL was reset to 0.
--			 */
--			ISC_LIST_UNLINK(rbtdb->rdatasets[locknum], header,
--					link);
--			expire_header(rbtdb, header, tree_locked, expire_lru);
--			purgecount--;
--		}
-+		purged += expire_lru_headers(rbtdb, locknum, purgesize - purged,
-+					     tree_locked);
- 
- 		NODE_UNLOCK(&rbtdb->node_locks[locknum].lock,
- 			    isc_rwlocktype_write);
--- 
-2.25.1
-
diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/CVE-2023-2911.patch b/meta/recipes-connectivity/bind/bind-9.18.11/CVE-2023-2911.patch
deleted file mode 100644
index 8e9a358dee..0000000000
--- a/meta/recipes-connectivity/bind/bind-9.18.11/CVE-2023-2911.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From ff5bacf17c2451e9d48c78a5ef96ec0c376ff33d Mon Sep 17 00:00:00 2001
-From: Matthijs Mekking <matthijs@isc.org>
-Date: Thu, 1 Jun 2023 10:03:48 +0200
-Subject: [PATCH] Fix serve-stale hang at shutdown
-
-The 'refresh_rrset' variable is used to determine if we can detach from
-the client. This can cause a hang on shutdown. To fix this, move setting
-of the 'nodetach' variable up to where 'refresh_rrset' is set (in
-query_lookup(), and thus not in ns_query_done()), and set it to false
-when actually refreshing the RRset, so that when this lookup is
-completed, the client will be detached.
-
-Patch taken from :https://downloads.isc.org/isc/bind9/9.18.16/patches/0003-CVE-2023-2911.patch
-
-Upstream-Status: Backport [https://gitlab.isc.org/isc-projects/bind9/-/commit/240caa32b9cab90a38ab863fd64e6becf5d1393c && https://gitlab.isc.org/isc-projects/bind9/-/commit/ff5bacf17c2451e9d48c78a5ef96ec0c376ff33d]
-CVE: CVE-2023-2911
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- lib/ns/query.c | 30 ++++++++++++++++++++++--------
- 1 file changed, 22 insertions(+), 8 deletions(-)
-
-diff --git a/lib/ns/query.c b/lib/ns/query.c
-index 0d2ba6b..8945dd4 100644
---- a/lib/ns/query.c
-+++ b/lib/ns/query.c
-@@ -5824,6 +5824,7 @@ query_refresh_rrset(query_ctx_t *orig_qctx) {
- 	qctx.client->query.dboptions &= ~(DNS_DBFIND_STALETIMEOUT |
- 					  DNS_DBFIND_STALEOK |
- 					  DNS_DBFIND_STALEENABLED);
-+	qctx.client->nodetach = false;
- 
- 	/*
- 	 * We'll need some resources...
-@@ -6076,7 +6077,14 @@ query_lookup(query_ctx_t *qctx) {
- 					"%s stale answer used, an attempt to "
- 					"refresh the RRset will still be made",
- 					namebuf);
-+
- 				qctx->refresh_rrset = STALE(qctx->rdataset);
-+				/*
-+				 * If we are refreshing the RRSet, we must not
-+				 * detach from the client in query_send().
-+				 */
-+				qctx->client->nodetach = qctx->refresh_rrset;
-+
- 				ns_client_extendederror(
- 					qctx->client, ede,
- 					"stale data prioritized over lookup");
-@@ -6503,7 +6511,7 @@ ns_query_recurse(ns_client_t *client, dns_rdatatype_t qtype, dns_name_t *qname,
- 	if (recparam_match(&client->query.recparam, qtype, qname, qdomain)) {
- 		ns_client_log(client, NS_LOGCATEGORY_CLIENT, NS_LOGMODULE_QUERY,
- 			      ISC_LOG_INFO, "recursion loop detected");
--		return (ISC_R_FAILURE);
-+		return (ISC_R_ALREADYRUNNING);
- 	}
- 
- 	recparam_update(&client->query.recparam, qtype, qname, qdomain);
-@@ -7620,10 +7628,21 @@ query_usestale(query_ctx_t *qctx, isc_result_t result) {
- 		return (false);
- 	}
- 
--	if (result == DNS_R_DUPLICATE || result == DNS_R_DROP) {
-+	if (qctx->refresh_rrset) {
-+		/*
-+		 * This is a refreshing query, we have already prioritized
-+		 * stale data, so don't enable serve-stale again.
-+		 */
-+		return (false);
-+	}
-+
-+	if (result == DNS_R_DUPLICATE || result == DNS_R_DROP ||
-+	    result == ISC_R_ALREADYRUNNING)
-+	{
- 		/*
- 		 * Don't enable serve-stale if the result signals a duplicate
--		 * query or query that is being dropped.
-+		 * query or a query that is being dropped or can't proceed
-+		 * because of a recursion loop.
- 		 */
- 		return (false);
- 	}
-@@ -11927,12 +11946,7 @@ ns_query_done(query_ctx_t *qctx) {
- 	/*
- 	 * Client may have been detached after query_send(), so
- 	 * we test and store the flag state here, for safety.
--	 * If we are refreshing the RRSet, we must not detach from the client
--	 * in the query_send(), so we need to override the flag.
- 	 */
--	if (qctx->refresh_rrset) {
--		qctx->client->nodetach = true;
--	}
- 	nodetach = qctx->client->nodetach;
- 	query_send(qctx->client);
- 
--- 
-2.25.1
-
diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.17/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.11/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.18.17/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.17/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.11/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.18.17/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.17/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.11/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.18.17/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/bind9 b/meta/recipes-connectivity/bind/bind-9.18.17/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.11/bind9
rename to meta/recipes-connectivity/bind/bind-9.18.17/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.17/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.11/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.18.17/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.17/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.11/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.18.17/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.17/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.11/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.18.17/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.17/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.11/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.18.17/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/named.service b/meta/recipes-connectivity/bind/bind-9.18.17/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.11/named.service
rename to meta/recipes-connectivity/bind/bind-9.18.17/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.18.11.bb b/meta/recipes-connectivity/bind/bind_9.18.17.bb
similarity index 92%
rename from meta/recipes-connectivity/bind/bind_9.18.11.bb
rename to meta/recipes-connectivity/bind/bind_9.18.17.bb
index b3e3b8bef0..b6fa279360 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.11.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.17.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "BIND 9 provides a full-featured Domain Name Server system"
 SECTION = "console/network"
 
 LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d8cf7bd9c4fd5471a588e7e66e672408"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=c7a0b6d9a1b692a5da9af9d503671f43"
 
 DEPENDS = "openssl libcap zlib libuv"
 
@@ -18,11 +18,9 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
            file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
            file://0001-avoid-start-failure-with-bind-user.patch \
-           file://CVE-2023-2828.patch \
-           file://CVE-2023-2911.patch \
            "
 
-SRC_URI[sha256sum] = "8ff3352812230cbcbda42df87cad961f94163d3da457c5e4bef8057fd5df2158"
+SRC_URI[sha256sum] = "bde1c5017b81d1d79c69eb8f537f2e5032fd3623acdd5ee830d4f74bc2483458"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
@@ -41,7 +39,7 @@ PACKAGECONFIG[readline] = "--with-readline=readline,,readline"
 PACKAGECONFIG[libedit] = "--with-readline=libedit,,libedit"
 PACKAGECONFIG[dns-over-http] = "--enable-doh,--disable-doh,nghttp2"
 
-EXTRA_OECONF = " --disable-devpoll --disable-auto-validation --enable-epoll \
+EXTRA_OECONF = "  --disable-auto-validation  \
                  --with-gssapi=no --with-lmdb=no --with-zlib \
                  --sysconfdir=${sysconfdir}/bind \
                  --with-openssl=${STAGING_DIR_HOST}${prefix} \
-- 
2.34.1


