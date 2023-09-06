Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D959EB8FAF
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 04:55:59 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.1738.1693976151770229511
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 21:55:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=B6uwLNvk;
 spf=pass (domain: mvista.com, ip: 209.85.214.178, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1bf7a6509deso17332185ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 21:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1693976150; x=1694580950; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GY8wrW+F05/zG/Uz57kDD2w/f5doUiNIBHenHF/96qQ=;
        b=B6uwLNvkvUOptqPv5P27KUnsOoq473ydqCwq9bpm5D9ZqTxok7lEwrNBFO1u1nTTDx
         N2fb/s6/P3wpsrVYxBc38cccrAOoxvJZMXIU3xP4dtQBf328riXM/1/LlteAsHaSM35B
         UIDzpUsDkfXYCLnP/4f6JRRA4a6R0McqHJ7H0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693976150; x=1694580950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GY8wrW+F05/zG/Uz57kDD2w/f5doUiNIBHenHF/96qQ=;
        b=QIeyo0U/c0yi1HE6s7qCKx0ZrzDgs72+bbk++6rrR2WpaTzrarP02XpIBnm+DMrfvI
         44/9p+uAD0BqxWIpRNseWiWWpdVd5bY/XxplM3OglAUw/UkzKtlwiw6Uw+HDPmtcRQ3z
         YcSK9pJLADjJdytEfbzROAOglGGFpSUApG36k9QS8dNW4KygYwdaqAAVyaj+EVaAhpzA
         GQZPwocYoeLn+vtSiaKkxhsTNHqSFVvc/4jLxv9oBlUphxiGIp0GH6Lk4spiTBouOXcA
         XvxkvM15g252I3najYe14uId3CUQjojHEgu1N7zAwUnoFioGj5JSPOIiXNvcch0bb8Sx
         L8XQ==
X-Gm-Message-State: AOJu0YwhcI9Klw8G3GAqAL+DMjo0qDPDBl/F/s/yqM5i0uQs04xzdC8B
	5OuI2zTIbDkrjdVZDr80rclOFmBsMMKVH96oH0U=
X-Google-Smtp-Source: AGHT+IEGrnZDy4xLTg5zn/YKZbuFYs1pJME/WmT2zC7V5YWSP/gbzEJYJEezEoGTGs+jYemKRgraHw==
X-Received: by 2002:a17:902:e88b:b0:1bc:506a:58f2 with SMTP id w11-20020a170902e88b00b001bc506a58f2mr14694913plg.46.1693976150502;
        Tue, 05 Sep 2023 21:55:50 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c01c:7c68:6a24:8510:5a33:4b9a])
        by smtp.gmail.com with ESMTPSA id d13-20020a170902c18d00b001b9ecee459csm10160628pld.34.2023.09.05.21.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 21:55:50 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] bind: Backport fix for CVE-2023-2828
Date: Wed,  6 Sep 2023 10:25:38 +0530
Message-Id: <20230906045538.147276-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 04:55:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187274

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream Patch: https://downloads.isc.org/isc/bind9/9.16.42/patches/0001-CVE-2023-2828.patch

LINK: https://security-tracker.debian.org/tracker/CVE-2023-2828

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../bind/bind/CVE-2023-2828.patch             | 166 ++++++++++++++++++
 .../recipes-connectivity/bind/bind_9.11.37.bb |   1 +
 2 files changed, 167 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2023-2828.patch

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2023-2828.patch b/meta/recipes-connectivity/bind/bind/CVE-2023-2828.patch
new file mode 100644
index 0000000000..6f6c104530
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2023-2828.patch
@@ -0,0 +1,166 @@
+
+Upstream-Status: Backport [import from debian security.debian.org/debian-security/pool/updates/main/b/bind9/bind9_9.11.5.P4+dfsg-5.1+deb10u9.debian.tar.xz
+Upstream patch https://downloads.isc.org/isc/bind9/9.16.42/patches/0001-CVE-2023-2828.patch]
+Upstream Commit: https://github.com/isc-projects/bind9/commit/da0eafcdee52147e72d407cc3b9f179378ee1d3a
+CVE: CVE-2023-2828
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+
+---
+ lib/dns/rbtdb.c | 106 +++++++++++++++++++++++++++++++++-----------------------
+ 1 file changed, 63 insertions(+), 43 deletions(-)
+
+diff --git a/lib/dns/rbtdb.c b/lib/dns/rbtdb.c
+index b1b928c..3165e26 100644
+--- a/lib/dns/rbtdb.c
++++ b/lib/dns/rbtdb.c
+@@ -792,7 +792,7 @@ static void update_header(dns_rbtdb_t *rbtdb, rdatasetheader_t *header,
+ static void expire_header(dns_rbtdb_t *rbtdb, rdatasetheader_t *header,
+ 			  bool tree_locked, expire_t reason);
+ static void overmem_purge(dns_rbtdb_t *rbtdb, unsigned int locknum_start,
+-			  isc_stdtime_t now, bool tree_locked);
++			  size_t purgesize, bool tree_locked);
+ static isc_result_t resign_insert(dns_rbtdb_t *rbtdb, int idx,
+ 				  rdatasetheader_t *newheader);
+ static void resign_delete(dns_rbtdb_t *rbtdb, rbtdb_version_t *version,
+@@ -6784,6 +6784,16 @@ addclosest(dns_rbtdb_t *rbtdb, rdatasetheader_t *newheader,
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
+@@ -6932,7 +6942,8 @@ addrdataset(dns_db_t *db, dns_dbnode_t *node, dns_dbversion_t *version,
+ 	}
+ 
+ 	if (cache_is_overmem)
+-		overmem_purge(rbtdb, rbtnode->locknum, now, tree_locked);
++		overmem_purge(rbtdb, rbtnode->locknum, rdataset_size(newheader),
++		              tree_locked);
+ 
+ 	NODE_LOCK(&rbtdb->node_locks[rbtnode->locknum].lock,
+ 		  isc_rwlocktype_write);
+@@ -6947,9 +6958,14 @@ addrdataset(dns_db_t *db, dns_dbnode_t *node, dns_dbversion_t *version,
+ 			cleanup_dead_nodes(rbtdb, rbtnode->locknum);
+ 
+ 		header = isc_heap_element(rbtdb->heaps[rbtnode->locknum], 1);
+-		if (header && header->rdh_ttl < now - RBTDB_VIRTUAL)
+-			expire_header(rbtdb, header, tree_locked,
+-				      expire_ttl);
++		if (header != NULL) {
++			dns_ttl_t rdh_ttl = header->rdh_ttl;
++
++			if (rdh_ttl < now - RBTDB_VIRTUAL) {
++				expire_header(rbtdb, header, tree_locked,
++					      expire_ttl);
++			}
++		}
+ 
+ 		/*
+ 		 * If we've been holding a write lock on the tree just for
+@@ -10388,54 +10404,58 @@ update_header(dns_rbtdb_t *rbtdb, rdatasetheader_t *header,
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
+- */
++ * Purge some stale (i.e. unused for some period - LRU based cleaning) cache
++ * entries under the overmem condition.  To recover from this condition quickly,
++ * we cleanup entries up to the size of newly added rdata (passed as purgesize).
++ *
++ * This process is triggered while adding a new entry, and we specifically avoid
++ * purging entries in the same LRU bucket as the one to which the new entry will
++ * belong.  Otherwise, we might purge entries of the same name of different RR
++ * types while adding RRsets from a single response (consider the case where
++ * we're adding A and AAAA glue records of the same NS name).
++*/
+ static void
+-overmem_purge(dns_rbtdb_t *rbtdb, unsigned int locknum_start,
+-	      isc_stdtime_t now, bool tree_locked)
++overmem_purge(dns_rbtdb_t *rbtdb, unsigned int locknum_start, size_t purgesize,
++	      bool tree_locked)
+ {
+-	rdatasetheader_t *header, *header_prev;
+ 	unsigned int locknum;
+-	int purgecount = 2;
++	size_t purged = 0;
+ 
+ 	for (locknum = (locknum_start + 1) % rbtdb->node_lock_count;
+-	     locknum != locknum_start && purgecount > 0;
++	     locknum != locknum_start && purged <= purgesize;
+ 	     locknum = (locknum + 1) % rbtdb->node_lock_count) {
+ 		NODE_LOCK(&rbtdb->node_locks[locknum].lock,
+ 			  isc_rwlocktype_write);
+ 
+-		header = isc_heap_element(rbtdb->heaps[locknum], 1);
+-		if (header && header->rdh_ttl < now - RBTDB_VIRTUAL) {
+-			expire_header(rbtdb, header, tree_locked,
+-				      expire_ttl);
+-			purgecount--;
+-		}
+-
+-		for (header = ISC_LIST_TAIL(rbtdb->rdatasets[locknum]);
+-		     header != NULL && purgecount > 0;
+-		     header = header_prev) {
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
+-			expire_header(rbtdb, header, tree_locked,
+-				      expire_lru);
+-			purgecount--;
+-		}
++		purged += expire_lru_headers(rbtdb, locknum, purgesize - purged,
++					     tree_locked);
+ 
+ 		NODE_UNLOCK(&rbtdb->node_locks[locknum].lock,
+ 				    isc_rwlocktype_write);
diff --git a/meta/recipes-connectivity/bind/bind_9.11.37.bb b/meta/recipes-connectivity/bind/bind_9.11.37.bb
index 2fca28e684..80fbcbfa36 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.37.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.37.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://CVE-2022-2795.patch \
            file://CVE-2022-38177.patch \
            file://CVE-2022-38178.patch \
+           file://CVE-2023-2828.patch \
            "
 
 SRC_URI[sha256sum] = "0d8efbe7ec166ada90e46add4267b7e7c934790cba9bd5af6b8380a4fbfb5aff"
-- 
2.25.1


