Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF065CA0EDD
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 13:53:38 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.25660.1694526817764706723
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 06:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mCQQGcrX;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1c397ed8681so24389255ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 06:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694526817; x=1695131617; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/iMdmN7tDUkyyh1Fab4fkWtTOMOLADJ6kmLtdtXVteY=;
        b=mCQQGcrXk09xMOUMOqmAKrxv01Mjdt3MGOyJNFtAD+xLHALIJC2+/NlA02CDrXPuo2
         l8lBP0ISpX9dWt04Tw9d44wY7EIH4l/9jZ4zHDO7ur+1BYF8GNJWhG0zhu9KFYlHxU/T
         nE7u1MNpO/59epu8sL+qQy5Hu3GpwQQl0cWYN6IvYT7Ff3aI3jvDjDKJM3zpIyuBZMg3
         LB9XDwAnVedVo3OrM/0EbhVGh657rDWrbWHx0Jb0UEKHVloD8D/d5BKUX+c/EMPXjLIq
         UP8zbmlUrWd+dPLXgw2WZPZ2GteBlvFH+U/PoD96g1S2g50iD40pH2pZuIQn4PWvEA7l
         7DGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694526817; x=1695131617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/iMdmN7tDUkyyh1Fab4fkWtTOMOLADJ6kmLtdtXVteY=;
        b=dO3nO2LSeypCKPSyNG3ve8jfW56GgGk89YrlHxYhHD6rCFXVpiDMdQ57FqSL2v6vZe
         ilQkK8AwAaF1owpLrfmh0Jv+ZORSlPBFmL6M6CAsMWq7F0zQ7a9QVT84QiANExl2whBv
         xSxJ5/u3BNQWDhS2rGJBOxLu34+cvWh/OtR6wIg4+R3abzcmeDVvym6qkY4sjGVJcp0/
         dSKlWWtWcRLAWTNeHeJo2dTQcn8Y5qBJM6ZTWJjjieLh57FARMoFjy4aX4advrqpFWht
         DjA4ru5iJkGUVmWcNxCQM4omAmK4uUP2Pl5KM+zr/bjOOdPuBK1ydSkfibuMmDWW7Rao
         QIYg==
X-Gm-Message-State: AOJu0YyQ1t50tQH/UJVwDtHSGZzyqn3nTdiohoR6kqFBkMv6/g0v/ctG
	mUHwWy1l6CFS5mSlqGZ8VNl/nsBV8o0Oy9Oe3x8=
X-Google-Smtp-Source: AGHT+IFDsUGV/QT7dDaOvJrMaMq13200rkR0HQp0yaPFKowgD9sRFocCcfoIc8ranSPDLpRWJ5n/GQ==
X-Received: by 2002:a17:902:eb46:b0:1bf:7d3b:4405 with SMTP id i6-20020a170902eb4600b001bf7d3b4405mr10404936pli.14.1694526816584;
        Tue, 12 Sep 2023 06:53:36 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j7-20020a170902da8700b001bdeedd8579sm7635246plx.252.2023.09.12.06.53.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 06:53:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/14] bind: Backport fix for CVE-2023-2828
Date: Tue, 12 Sep 2023 03:53:10 -1000
Message-Id: <1b9d661a82211d6ffdd56e366cfbc3f3c247fd1c.1694526588.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694526588.git.steve@sakoman.com>
References: <cover.1694526588.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 13:53:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187516

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream Patch: https://downloads.isc.org/isc/bind9/9.16.42/patches/0001-CVE-2023-2828.patch

LINK: https://security-tracker.debian.org/tracker/CVE-2023-2828

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


