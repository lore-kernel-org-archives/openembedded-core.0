Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFC88CA9ED5
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 04:38:46 +0000 (UTC)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6731.1791779919120000372
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 21:38:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=XHreTnfu;
 spf=pass (domain: mvista.com, ip: 74.125.82.171, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-354ba08cfd1so2691089eec.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 21:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1791779918; x=1792384718; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=74JM1KYIZSfT+53B5/4DgJHlRGOCK3QJ8OZ0LsXU7Eg=;
        b=XHreTnfuNAPydxPtxIkY/K5zDRxA5rdqsSN8G3UpZjyXdZmpgVwqe5wrFxeau0t+YM
         517ap5mTPCeih6DeRDbWAFIEQQZvibNO9Zny0iSFWRdpgGmUR/LVwfLiCArNudVEfQvQ
         83Se+lkrpLefAIFtrThna9jyvvqfoE8TCkLRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791779918; x=1792384718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=74JM1KYIZSfT+53B5/4DgJHlRGOCK3QJ8OZ0LsXU7Eg=;
        b=BldBJ0VJOJoFiR8lKwkU132CZIMIu/cTqoDeblILtt2uY8VeCfXrlZEKmV2AqwKSF1
         3J1FrMlfkKgwbZmDgtSx6pStFZBFDusstRnbLrhk+H5T/bIjaqJQ332DsxnLB9TSwcPS
         PW9okE5yZbjuRerj7d6DY7YFVNDnu9nzeC0f524bKKsR3VV2syc/Dxh4VhoG1TLnWnBQ
         0kyJEyxxbem4aHM+s5cc1ogViUwk8Zj4nJmwxPL5c3AwXASVku7VhYLnR6xErmV7LECQ
         yWGcw2wHojB4mhp2lBFRJOBgX0X8A4vdWFT8W5cuVg+7OtqMel72/KVtpB2taVjqGl0w
         hdBA==
X-Gm-Message-State: AFq9FYJaPAweupsK5ZqKYjCD0A68/ADkYPmYoMseTC/7tPBIqCm4P+jJ
	zJ3964rJYho9Aaw2Sg4b2VCnsmD+Osyx3eNgzKikT8jkp0y9u5MMspr/ZCwllBENl5DY32lNICK
	wSyQ5
X-Gm-Gg: AYBFou2HOryGOYSDq0U1E2ymhCnnCNtCpjTRPqwbbz/av1zUSb8tjyVMArtGM6jZqCo
	e/nZZqQaFZlvqnaGpcyIgE0hS6/nlSoLRrMsyQ6sbuS8E4Ryqgu19d3EEwKBMoZ+lggeiHFUaAN
	IQ+nY6/CqhSy1s5SJqwW6JtQVzgEzKIySaYyke68MRP8H8eCw3cl3z0Fda7A3p6twZHght9qmuK
	pUlkGYhBSegvJ1HZlXnB4H9EbVmp+Z4GTvihwA6g8Ku1Hb0lJlpkmrdb3uE7U3tua1Ac9KnrH8A
	S/0AGZXFrwaqjl/tsH4e4c/12Njz0ii+1HG4+szNGhSjYaet6BCOk7cYwRGjlYh/888iquZoiLA
	v+GNpaL/OH9Vu8BUukvRaV2LKN1E3JC7UjM8C7T0WIr5ysZQpMxGVAY6zNANifN+BNdrKs6y/+c
	l/kxSUKtbRoSwa6BLTTXoXO22dTLDjv19nt6MF6pw8Q9IWm6DT01n3ixHv8uhvjh74Tb4lQClla
	MVy9s/aYug=
X-Received: by 2002:a05:7301:6e98:b0:33c:e74:4624 with SMTP id 5a478bee46e88-3537e112919mr12859131eec.27.1791779918102;
        Sun, 11 Oct 2026 21:38:38 -0700 (PDT)
Received: from MVIN00013.mvista.com ([150.129.170.200])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm32823983eec.17.2026.10.11.21.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 21:38:37 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCHv2 4/6] bind: fix for CVE-2026-11622, CVE-2026-11721
Date: Mon, 12 Oct 2026 10:08:19 +0530
Message-ID: <20261012043822.12852-4-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261012043822.12852-1-hprajapati@mvista.com>
References: <20261012043822.12852-1-hprajapati@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 04:38:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247601

Pick patch from [1], [2], [3] & [4] also mentioned at Debian report in [5] & [6]

[1] https://github.com/isc-projects/bind9/commit/231b1ca3edfb26389e1af39181aa6b4413e87ec4
[2] https://github.com/isc-projects/bind9/commit/1a4986e2533f87e80eb21da3f06708d335aff1e2
[3] https://github.com/isc-projects/bind9/commit/15089066b15f826d7487c3d160b5872820f84b83
[4] https://github.com/isc-projects/bind9/commit/19e496ca260b6a756ae1378e8ebcbdb666b7d9ed
[5] https://security-tracker.debian.org/tracker/CVE-2026-11721
[6] https://security-tracker.debian.org/tracker/CVE-2026-11622

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../bind/bind/CVE-2026-11622.patch            | 283 ++++++++++++++++++
 .../bind/bind/CVE-2026-11721-01.patch         |  43 +++
 .../bind/bind/CVE-2026-11721-02.patch         | 238 +++++++++++++++
 .../bind/bind/CVE-2026-11721-03.patch         | 147 +++++++++
 .../recipes-connectivity/bind/bind_9.18.49.bb |   4 +
 5 files changed, 715 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-11622.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-11721-01.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-11721-02.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-11721-03.patch

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-11622.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-11622.patch
new file mode 100644
index 0000000000..1168e67192
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-11622.patch
@@ -0,0 +1,283 @@
+From: =?utf-8?b?T25kxZllaiBTdXLDvQ==?= <ondrej@sury.org>
+Date: Tue, 23 Jun 2026 10:59:38 +0200
+Subject: Make the dns_slabheaders in the cache reference counted
+
+Instead of only reference counting the enclosing qpcnode, add the
+reference counting directly to the slabheaders.  The reference is
+incremented when an rdataset is bound to the header and decremented when
+the rdataset is disassociated, so a stale slabheader can be removed from
+the node's down chain as soon as its own reference count reaches zero,
+instead of waiting for the whole qpcnode to become unreferenced.
+
+Building on that, clean up the ancient headers eagerly: mark_ancient()
+is made idempotent, releases the header's own (container) reference and
+reaps the stale headers from the node's down chain as soon as their
+references reach zero.  A header evicted over the per-name type limit is
+expired only after the new rdataset has been bound, so the bind's
+increment always precedes mark_ancient()'s decrement.
+
+Because a header can now be reclaimed independently of its node, the
+rdataset iterators must keep the header they are positioned on alive:
+each iterator takes a reference on its current header and releases it
+when it advances or is destroyed.  Iteration otherwise stays lazy and
+re-reads the node on every step, so it still observes records added to
+the node while the iterator is live, as zone signing requires.
+
+The slab headers are shared with the zone databases, so the matching
+increment is added to every bind path.  The noqname/closest proofs hand
+out rdatasets backed by bare slabs that have no header, so they are
+given a separate dns_rdataproof_rdatasetmethods that leaves the
+reference count untouched.
+
+(cherry picked from commit 2dabf117e1264fd13fb33096f87e78a039fd1c6c)
+
+Origin: https://github.com/isc-projects/bind9/commit/231b1ca3edfb26389e1af39181aa6b4413e87ec4
+Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2026-11622
+Bug-Freexian-Security: https://deb.freexian.com/extended-lts/tracker/CVE-2026-11622
+
+CVE: CVE-2026-11622
+Upstream-Status: Backport [https://github.com/isc-projects/bind9/commit/231b1ca3edfb26389e1af39181aa6b4413e87ec4]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ bin/tests/system/reclimit/tests.sh |  4 +-
+ lib/dns/include/dns/rdataslab.h    |  1 +
+ lib/dns/rbtdb.c                    | 77 ++++++++++++++++++++++++++++++++------
+ 3 files changed, 69 insertions(+), 13 deletions(-)
+
+diff --git a/bin/tests/system/reclimit/tests.sh b/bin/tests/system/reclimit/tests.sh
+index 76889ec..efa7316 100644
+--- a/bin/tests/system/reclimit/tests.sh
++++ b/bin/tests/system/reclimit/tests.sh
+@@ -337,13 +337,13 @@ echo_i "checking that NXDOMAIN names over the max-types-per-name limit don't get
+ 
+ # Query for 10 NXDOMAIN types
+ for ntype in $(seq 65270 65279); do
+-  check_manytypes 1 manytypes.big "TYPE${ntype}" NOERROR big SOA 0 || ret=1
++  check_manytypes 1 manytypes.big "TYPE${ntype}" NOERROR big SOA 120 || ret=1
+ done
+ # Wait at least 1 second
+ sleep 1
+ # Query for 10 NXDOMAIN types again - these should not be cached
+ for ntype in $(seq 65270 65279); do
+-  check_manytypes 2 manytypes.big "TYPE${ntype}" NOERROR big SOA 0 || ret=1
++  check_manytypes 2 manytypes.big "TYPE${ntype}" NOERROR big SOA 120 || ret=1
+ done
+ 
+ if [ $ret -ne 0 ]; then echo_i "failed"; fi
+diff --git a/lib/dns/include/dns/rdataslab.h b/lib/dns/include/dns/rdataslab.h
+index 5729c00..6bd3b59 100644
+--- a/lib/dns/include/dns/rdataslab.h
++++ b/lib/dns/include/dns/rdataslab.h
+@@ -44,6 +44,7 @@
+ #include <stdbool.h>
+ 
+ #include <isc/lang.h>
++#include <isc/refcount.h>
+ 
+ #include <dns/types.h>
+ 
+diff --git a/lib/dns/rbtdb.c b/lib/dns/rbtdb.c
+index 62bc97d..0b85479 100644
+--- a/lib/dns/rbtdb.c
++++ b/lib/dns/rbtdb.c
+@@ -158,6 +158,7 @@ struct noqname {
+ };
+ 
+ typedef struct rdatasetheader {
++	isc_refcount_t references;
+ 	/*%
+ 	 * Locked by the owning node's lock.
+ 	 */
+@@ -1447,6 +1448,7 @@ init_rdataset(dns_rbtdb_t *rbtdb, rdatasetheader_t *h) {
+ 	h->heap_index = 0;
+ 	atomic_init(&h->attributes, 0);
+ 	atomic_init(&h->last_refresh_fail_ts, 0);
++	isc_refcount_init(&h->references, 1);
+ 
+ 	STATIC_ASSERT(sizeof(h->attributes) == 2,
+ 		      "The .attributes field of rdatasetheader_t needs to be "
+@@ -1559,6 +1561,9 @@ rollback_node(dns_rbtnode_t *node, rbtdb_serial_t serial) {
+ 	}
+ }
+ 
++static void
++clean_stale_headers(dns_rbtdb_t *rbtdb, isc_mem_t *mctx, rdatasetheader_t *top);
++
+ static void
+ mark_header_ancient(dns_rbtdb_t *rbtdb, rdatasetheader_t *header) {
+ 	uint_least16_t attributes = atomic_load_acquire(&header->attributes);
+@@ -1584,8 +1589,12 @@ mark_header_ancient(dns_rbtdb_t *rbtdb, rdatasetheader_t *header) {
+ 	update_rrsetstats(rbtdb, header->type, attributes, false);
+ 	header->node->dirty = 1;
+ 
++	isc_refcount_decrement(&header->references);
++
+ 	/* Increment the stats counter for the ancient RRtype. */
+ 	update_rrsetstats(rbtdb, header->type, newattributes, true);
++
++	clean_stale_headers(rbtdb, rbtdb->common.mctx, header);
+ }
+ 
+ static void
+@@ -1621,12 +1630,19 @@ static void
+ clean_stale_headers(dns_rbtdb_t *rbtdb, isc_mem_t *mctx,
+ 		    rdatasetheader_t *top) {
+ 	rdatasetheader_t *d, *down_next;
++	rdatasetheader_t *down_parent = top;
+ 
+ 	for (d = top->down; d != NULL; d = down_next) {
+ 		down_next = d->down;
+-		free_rdataset(rbtdb, mctx, d);
++		d->next = down_parent;
++
++		if (isc_refcount_current(&d->references) == 0) {
++			free_rdataset(rbtdb, mctx, d);
++			down_parent->down = down_next;
++		} else {
++			down_parent = d;
++		}
+ 	}
+-	top->down = NULL;
+ }
+ 
+ static void
+@@ -1642,6 +1658,7 @@ clean_cache_node(dns_rbtdb_t *rbtdb, dns_rbtnode_t *node) {
+ 	for (current = node->data; current != NULL; current = top_next) {
+ 		top_next = current->next;
+ 		clean_stale_headers(rbtdb, mctx, current);
++		INSIST(current->down == NULL);
+ 		/*
+ 		 * If current is nonexistent, ancient, or stale and
+ 		 * we are not keeping stale, we can clean it up.
+@@ -3114,6 +3131,8 @@ bind_rdataset(dns_rbtdb_t *rbtdb, dns_rbtnode_t *node, rdatasetheader_t *header,
+ 		return;
+ 	}
+ 
++	isc_refcount_increment(&header->references);
++
+ 	dns__rbtnode_acquire(rbtdb, node, locktype);
+ 
+ 	INSIST(rdataset->methods == NULL); /* We must be disassociated. */
+@@ -6307,6 +6326,7 @@ add32(dns_rbtdb_t *rbtdb, dns_rbtnode_t *rbtnode, const dns_name_t *nodename,
+ 	bool header_nx;
+ 	bool newheader_nx;
+ 	bool merge;
++	bool do_expireheader = false;
+ 	dns_rdatatype_t rdtype, covers;
+ 	rbtdb_rdatatype_t negtype, sigtype;
+ 	dns_trust_t trust;
+@@ -6856,6 +6876,7 @@ find_header:
+ 			}
+ 
+ 			if (IS_CACHE(rbtdb) && overmaxtype(rbtdb, ntypes)) {
++				do_expireheader = true;
+ 				if (expireheader == NULL) {
+ 					expireheader = newheader;
+ 				}
+@@ -6869,15 +6890,6 @@ find_header:
+ 					 */
+ 					expireheader = newheader;
+ 				}
+-
+-				set_ttl(rbtdb, expireheader, 0);
+-				mark_header_ancient(rbtdb, expireheader);
+-				/*
+-				 * FIXME: In theory, we should mark the RRSIG
+-				 * and the header at the same time, but there is
+-				 * no direct link between those two header, so
+-				 * we would have to check the whole list again.
+-				 */
+ 			}
+ 		}
+ 	}
+@@ -6901,6 +6913,15 @@ find_header:
+ 			      isc_rwlocktype_write, addedrdataset);
+ 	}
+ 
++	/*
++	 * We need to delay the expiration of the header until we are bound to
++	 * it to prevent decrement-then-increment on the header references.
++	 */
++	if (do_expireheader) {
++		set_ttl(rbtdb, expireheader, 0);
++		mark_header_ancient(rbtdb, expireheader);
++	}
++
+ 	return ISC_R_SUCCESS;
+ }
+ 
+@@ -8692,6 +8713,12 @@ rdataset_disassociate(dns_rdataset_t *rdataset) {
+ 	dns_db_t *db = rdataset->private1;
+ 	dns_dbnode_t *node = rdataset->private2;
+ 
++	if (rdataset->methods == &rdataset_methods) {
++		rdatasetheader_t *header = rdataset->private3;
++		header--;
++		isc_refcount_decrement(&header->references);
++	}
++
+ 	detachnode(db, &node);
+ }
+ 
+@@ -8806,6 +8833,11 @@ rdataset_clone(dns_rdataset_t *source, dns_rdataset_t *target) {
+ 	dns_dbnode_t *cloned_node = NULL;
+ 
+ 	attachnode(db, node, &cloned_node);
++	if (source->methods == &rdataset_methods) {
++		rdatasetheader_t *header = source->private3;
++		header--;
++		isc_refcount_increment(&header->references);
++	}
+ 	INSIST(!ISC_LINK_LINKED(target, link));
+ 	*target = *source;
+ 	ISC_LINK_INIT(target, link);
+@@ -8969,6 +9001,11 @@ rdatasetiter_destroy(dns_rdatasetiter_t **iteratorp) {
+ 
+ 	rbtiterator = (rbtdb_rdatasetiter_t *)(*iteratorp);
+ 
++	if (rbtiterator->current != NULL) {
++		isc_refcount_decrement(&rbtiterator->current->references);
++		rbtiterator->current = NULL;
++	}
++
+ 	if (rbtiterator->common.version != NULL) {
+ 		closeversion(rbtiterator->common.db,
+ 			     &rbtiterator->common.version, false);
+@@ -9046,9 +9083,18 @@ rdatasetiter_first(dns_rdatasetiter_t *iterator) {
+ 		}
+ 	}
+ 
++	if (header != NULL) {
++		isc_refcount_increment0(&header->references);
++	}
++
+ 	NODE_UNLOCK(&rbtdb->node_locks[rbtnode->locknum].lock,
+ 		    isc_rwlocktype_read);
+ 
++	if (rbtiterator->current != NULL) {
++		isc_refcount_decrement(&rbtiterator->current->references);
++		rbtiterator->current = NULL;
++	}
++
+ 	rbtiterator->current = header;
+ 
+ 	if (header == NULL) {
+@@ -9140,9 +9186,18 @@ rdatasetiter_next(dns_rdatasetiter_t *iterator) {
+ 		}
+ 	}
+ 
++	if (header != NULL) {
++		isc_refcount_increment0(&header->references);
++	}
++
+ 	NODE_UNLOCK(&rbtdb->node_locks[rbtnode->locknum].lock,
+ 		    isc_rwlocktype_read);
+ 
++	if (rbtiterator->current != NULL) {
++		isc_refcount_decrement(&rbtiterator->current->references);
++		rbtiterator->current = NULL;
++	}
++
+ 	rbtiterator->current = header;
+ 
+ 	if (header == NULL) {
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-11721-01.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-11721-01.patch
new file mode 100644
index 0000000000..bdb7ff0d9a
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-11721-01.patch
@@ -0,0 +1,43 @@
+From: Mark Andrews <marka@isc.org>
+Date: Tue, 14 Apr 2026 15:14:06 +1000
+Subject: Don't sign out of zone records in dnssec-signzone
+
+dnssec-signzone was signing extraneous records that were not within
+the namespace of the zone.  This no longer occurs.
+
+(cherry picked from commit e45c9af7051421fd370f20ba8325199c606223fd)
+
+Don't sign out of zone records in dnssec-signzone
+
+dnssec-signzone was signing extraneous records that were not within
+the namespace of the zone.  This no longer occurs.
+
+(cherry picked from commit e45c9af7051421fd370f20ba8325199c606223fd)
+
+Origin: https://github.com/isc-projects/bind9/commit/1a4986e2533f87e80eb21da3f06708d335aff1e2
+Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2026-11721
+Bug-Freexian-Security: https://deb.freexian.com/extended-lts/tracker/CVE-2026-11721
+
+CVE: CVE-2026-11721
+Upstream-Status: Backport [https://github.com/isc-projects/bind9/commit/1a4986e2533f87e80eb21da3f06708d335aff1e2]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ bin/dnssec/dnssec-signzone.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/bin/dnssec/dnssec-signzone.c b/bin/dnssec/dnssec-signzone.c
+index 73855e6..9e3a48a 100644
+--- a/bin/dnssec/dnssec-signzone.c
++++ b/bin/dnssec/dnssec-signzone.c
+@@ -1643,6 +1643,11 @@ assignwork(isc_task_t *task, isc_task_t *worker) {
+ 			dns_db_detachnode(gdb, &node);
+ 			goto next;
+ 		}
++		if (!dns_name_issubdomain(name, gorigin)) {
++			dumpnode(name, node);
++			dns_db_detachnode(gdb, &node);
++			goto next;
++		}
+ 		/*
+ 		 * Sort the zone data from the glue and out-of-zone data.
+ 		 * For NSEC zones nodes with zone data have NSEC records.
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-11721-02.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-11721-02.patch
new file mode 100644
index 0000000000..b76ef17b96
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-11721-02.patch
@@ -0,0 +1,238 @@
+From: Mark Andrews <marka@isc.org>
+Date: Tue, 14 Apr 2026 12:24:33 +1000
+Subject: Invalid signed wildcard records were being accepted
+
+An RRSIG whose Labels field indicates fewer labels than its signer
+name requires was being accepted.  When such a record covers a
+wildcard, the validator reconstructs a wildcard owner name above the
+signer's zone and caches it as secure.  RFC 8198 cache synthesis
+(synth-from-dnssec) then serves that forged wildcard for unrelated
+names, poisoning the cache.
+
+These records are now rejected, both when an RRSIG is parsed and when
+its signature is verified.
+
+(cherry picked from commit 084ca5ee10515e461d46b63df9660b8394bc7de9)
+
+Origin: https://github.com/isc-projects/bind9/commit/15089066b15f826d7487c3d160b5872820f84b83
+Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2026-11721
+Bug-Freexian-Security: https://deb.freexian.com/extended-lts/tracker/CVE-2026-11721
+
+CVE: CVE-2026-11721
+Upstream-Status: Backport [https://github.com/isc-projects/bind9/commit/15089066b15f826d7487c3d160b5872820f84b83]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ lib/dns/dnssec.c                 | 43 +++++++++++++++++++++++++++++-----------
+ lib/dns/rdata/generic/rrsig_46.c | 37 +++++++++++++++++++++++++---------
+ 2 files changed, 59 insertions(+), 21 deletions(-)
+
+diff --git a/lib/dns/dnssec.c b/lib/dns/dnssec.c
+index 1725de3..9b9b1f2 100644
+--- a/lib/dns/dnssec.c
++++ b/lib/dns/dnssec.c
+@@ -130,11 +130,11 @@ dns_dnssec_keyfromrdata(const dns_name_t *name, const dns_rdata_t *rdata,
+ 	isc_buffer_t b;
+ 	isc_region_t r;
+ 
+-	INSIST(name != NULL);
+-	INSIST(rdata != NULL);
+-	INSIST(mctx != NULL);
+-	INSIST(key != NULL);
+-	INSIST(*key == NULL);
++	REQUIRE(name != NULL);
++	REQUIRE(rdata != NULL);
++	REQUIRE(mctx != NULL);
++	REQUIRE(key != NULL);
++	REQUIRE(*key == NULL);
+ 	REQUIRE(rdata->type == dns_rdatatype_key ||
+ 		rdata->type == dns_rdatatype_dnskey);
+ 
+@@ -187,12 +187,14 @@ dns_dnssec_sign(const dns_name_t *name, dns_rdataset_t *set, dst_key_t *key,
+ 	isc_result_t ret;
+ 	isc_buffer_t *databuf = NULL;
+ 	char data[256 + 8];
++	unsigned int labels;
+ 	unsigned int sigsize;
+ 	dns_fixedname_t fnewname;
+ 	dns_fixedname_t fsigner;
+ 
+ 	REQUIRE(name != NULL);
+-	REQUIRE(dns_name_countlabels(name) <= 255);
++	labels = dns_name_countlabels(name);
++	REQUIRE(labels <= 255 && labels > 0);
+ 	REQUIRE(set != NULL);
+ 	REQUIRE(key != NULL);
+ 	REQUIRE(inception != NULL);
+@@ -221,7 +223,7 @@ dns_dnssec_sign(const dns_name_t *name, dns_rdataset_t *set, dst_key_t *key,
+ 
+ 	sig.covered = set->type;
+ 	sig.algorithm = dst_key_alg(key);
+-	sig.labels = dns_name_countlabels(name) - 1;
++	sig.labels = labels - 1;
+ 	if (dns_name_iswildcard(name)) {
+ 		sig.labels--;
+ 	}
+@@ -365,10 +367,13 @@ dns_dnssec_verify(const dns_name_t *name, dns_rdataset_t *set, dst_key_t *key,
+ 	isc_result_t ret;
+ 	unsigned char data[300];
+ 	dst_context_t *ctx = NULL;
+-	int labels = 0;
++	unsigned int labels;
++	unsigned int siglabels;
+ 	bool downcase = false;
+ 
+ 	REQUIRE(name != NULL);
++	labels = dns_name_countlabels(name);
++	REQUIRE(labels > 0);
+ 	REQUIRE(set != NULL);
+ 	REQUIRE(key != NULL);
+ 	REQUIRE(mctx != NULL);
+@@ -383,6 +388,21 @@ dns_dnssec_verify(const dns_name_t *name, dns_rdataset_t *set, dst_key_t *key,
+ 		return DNS_R_SIGINVALID;
+ 	}
+ 
++	/*
++	 * The RRSIG labels field can't indicate fewer labels than the
++	 * signer.  Also the labels shouldn't be greater than that of
++	 * the owner name.
++	 *
++	 * sig.labels doesn't include the root label, so add 1 to account
++	 * for it.
++	 */
++	siglabels = sig.labels + 1;
++	if (siglabels < dns_name_countlabels(&sig.signer) || siglabels > labels)
++	{
++		inc_stat(dns_dnssecstats_fail);
++		return DNS_R_SIGINVALID;
++	}
++
+ 	if (isc_serial_lt(sig.timeexpire, sig.timesigned)) {
+ 		inc_stat(dns_dnssecstats_fail);
+ 		return DNS_R_SIGINVALID;
+@@ -464,10 +484,9 @@ again:
+ 	 * If the name is an expanded wildcard, use the wildcard name.
+ 	 */
+ 	dns_fixedname_init(&fnewname);
+-	labels = dns_name_countlabels(name) - 1;
+ 	RUNTIME_CHECK(dns_name_downcase(name, dns_fixedname_name(&fnewname),
+ 					NULL) == ISC_R_SUCCESS);
+-	if (labels - sig.labels > 0) {
++	if (labels > siglabels) {
+ 		dns_name_split(dns_fixedname_name(&fnewname), sig.labels + 1,
+ 			       NULL, dns_fixedname_name(&fnewname));
+ 	}
+@@ -478,7 +497,7 @@ again:
+ 	 * Create an envelope for each rdata: <name|type|class|ttl>.
+ 	 */
+ 	isc_buffer_init(&envbuf, data, sizeof(data));
+-	if (labels - sig.labels > 0) {
++	if (labels > siglabels) {
+ 		isc_buffer_putuint8(&envbuf, 1);
+ 		isc_buffer_putuint8(&envbuf, '*');
+ 		memmove(data + 2, r.base, r.length);
+@@ -574,7 +593,7 @@ cleanup_struct:
+ 		inc_stat(dns_dnssecstats_fail);
+ 	}
+ 
+-	if (ret == ISC_R_SUCCESS && labels - sig.labels > 0) {
++	if (ret == ISC_R_SUCCESS && labels > siglabels) {
+ 		if (wild != NULL) {
+ 			RUNTIME_CHECK(dns_name_concatenate(
+ 					      dns_wildcardname,
+diff --git a/lib/dns/rdata/generic/rrsig_46.c b/lib/dns/rdata/generic/rrsig_46.c
+index 10bc039..4cf4259 100644
+--- a/lib/dns/rdata/generic/rrsig_46.c
++++ b/lib/dns/rdata/generic/rrsig_46.c
+@@ -23,12 +23,12 @@
+ static isc_result_t
+ fromtext_rrsig(ARGS_FROMTEXT) {
+ 	isc_token_t token;
+-	unsigned char c;
++	unsigned char alg, labels;
+ 	long i;
+ 	dns_rdatatype_t covered;
+-	char *e;
++	char *e = NULL;
+ 	isc_result_t result;
+-	dns_name_t name;
++	dns_name_t signer;
+ 	isc_buffer_t buffer;
+ 	uint32_t time_signed, time_expire;
+ 
+@@ -61,8 +61,8 @@ fromtext_rrsig(ARGS_FROMTEXT) {
+ 	 */
+ 	RETERR(isc_lex_getmastertoken(lexer, &token, isc_tokentype_string,
+ 				      false));
+-	RETTOK(dns_secalg_fromtext(&c, &token.value.as_textregion));
+-	RETERR(mem_tobuffer(target, &c, 1));
++	RETTOK(dns_secalg_fromtext(&alg, &token.value.as_textregion));
++	RETERR(mem_tobuffer(target, &alg, 1));
+ 
+ 	/*
+ 	 * Labels.
+@@ -72,8 +72,8 @@ fromtext_rrsig(ARGS_FROMTEXT) {
+ 	if (token.value.as_ulong > 0xffU) {
+ 		RETTOK(ISC_R_RANGE);
+ 	}
+-	c = (unsigned char)token.value.as_ulong;
+-	RETERR(mem_tobuffer(target, &c, 1));
++	labels = (unsigned char)token.value.as_ulong;
++	RETERR(mem_tobuffer(target, &labels, 1));
+ 
+ 	/*
+ 	 * Original ttl.
+@@ -144,12 +144,20 @@ fromtext_rrsig(ARGS_FROMTEXT) {
+ 	 */
+ 	RETERR(isc_lex_getmastertoken(lexer, &token, isc_tokentype_string,
+ 				      false));
+-	dns_name_init(&name, NULL);
++	dns_name_init(&signer, NULL);
+ 	buffer_fromregion(&buffer, &token.value.as_region);
+ 	if (origin == NULL) {
+ 		origin = dns_rootname;
+ 	}
+-	RETTOK(dns_name_fromtext(&name, &buffer, origin, options, target));
++	RETTOK(dns_name_fromtext(&signer, &buffer, origin, options, target));
++
++	/*
++	 * (RRSIG labels doesn't include the root label, so add one
++	 * to normalize it before checking against the signer.)
++	 */
++	if ((unsigned int)(labels + 1) < dns_name_countlabels(&signer)) {
++		RETTOK(ISC_R_RANGE);
++	}
+ 
+ 	/*
+ 	 * Sig.
+@@ -278,6 +286,7 @@ static isc_result_t
+ fromwire_rrsig(ARGS_FROMWIRE) {
+ 	isc_region_t sr;
+ 	dns_name_t name;
++	unsigned char labels;
+ 
+ 	REQUIRE(type == dns_rdatatype_rrsig);
+ 
+@@ -300,6 +309,8 @@ fromwire_rrsig(ARGS_FROMWIRE) {
+ 		return ISC_R_UNEXPECTEDEND;
+ 	}
+ 
++	labels = sr.base[3];
++
+ 	isc_buffer_forward(source, 18);
+ 	RETERR(mem_tobuffer(target, sr.base, 18));
+ 
+@@ -309,6 +320,14 @@ fromwire_rrsig(ARGS_FROMWIRE) {
+ 	dns_name_init(&name, NULL);
+ 	RETERR(dns_name_fromwire(&name, source, dctx, options, target));
+ 
++	/*
++	 * (RRSIG labels doesn't include the root label, so add one
++	 * to normalize it before checking against the signer.)
++	 */
++	if ((unsigned int)(labels + 1) < dns_name_countlabels(&name)) {
++		RETERR(DNS_R_FORMERR);
++	}
++
+ 	/*
+ 	 * Sig.
+ 	 */
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-11721-03.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-11721-03.patch
new file mode 100644
index 0000000000..659951fb4d
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-11721-03.patch
@@ -0,0 +1,147 @@
+From: Mark Andrews <marka@isc.org>
+Date: Tue, 14 Apr 2026 13:46:22 +1000
+Subject: Test RRSIG record parsing
+
+In particular test that labels and signer fields are consistent.
+
+(cherry picked from commit 5a95e64731afe63d348d272cc4d3b2f9847150c2)
+
+Origin: https://github.com/isc-projects/bind9/commit/19e496ca260b6a756ae1378e8ebcbdb666b7d9ed
+Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2026-11721
+Bug-Freexian-Security: https://deb.freexian.com/extended-lts/tracker/CVE-2026-11721
+
+CVE: CVE-2026-11721
+Upstream-Status: Backport [https://github.com/isc-projects/bind9/commit/19e496ca260b6a756ae1378e8ebcbdb666b7d9ed]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ tests/dns/rdata_test.c | 110 +++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 110 insertions(+)
+
+diff --git a/tests/dns/rdata_test.c b/tests/dns/rdata_test.c
+index 7f0df6e..c704d98 100644
+--- a/tests/dns/rdata_test.c
++++ b/tests/dns/rdata_test.c
+@@ -2504,6 +2504,115 @@ ISC_RUN_TEST_IMPL(rkey) {
+ 		    dns_rdatatype_rkey, sizeof(dns_rdata_rkey_t));
+ }
+ 
++ISC_RUN_TEST_IMPL(rrsig) {
++	text_ok_t text_ok[] = {
++		TEXT_VALID("SOA 8 0 86400 20260426170000 20260413160000 54393 "
++			   ". "
++			   "tFbcoVP8MnpecUquJ/aj+XeNgV7ts9GSHVkXaXRJrJ/"
++			   "TEkOZApVG0F6E "
++			   "9sYpxGk2ItweLL43ujioGj0HWwZDRR+vbur+O/"
++			   "dIdheiig1VvU+9HXLi "
++			   "QOViY9Kc64ixdyJhYCC5K+bO1qsHxd+"
++			   "KJXOaxyHbqchYkDFy4PL6qftE "
++			   "VaLkueRgjXgOsq/"
++			   "NxvCXDgAa5xy0+3Sl0myxIs8rJ5KeXfJQFe7qxgaw "
++			   "VjJsJTKw8neOTw2rQfLaigWu2LIWw+"
++			   "IyVrLjZJdLqGkiLBGd1w4X3U12 "
++			   "fFxoY3eqzNgBEtduoGKPZ/"
++			   "NpP9cuKJORJ18283aV8hR4WO91VR0q1zcM jLwqUg=="),
++		/* labels too short for signer */
++		TEXT_INVALID("SOA 8 0 86400 20260426170000 20260413160000 "
++			     "54393 example. "
++			     "tFbcoVP8MnpecUquJ/aj+XeNgV7ts9GSHVkXaXRJrJ/"
++			     "TEkOZApVG0F6E "
++			     "9sYpxGk2ItweLL43ujioGj0HWwZDRR+vbur+O/"
++			     "dIdheiig1VvU+9HXLi "
++			     "QOViY9Kc64ixdyJhYCC5K+bO1qsHxd+"
++			     "KJXOaxyHbqchYkDFy4PL6qftE "
++			     "VaLkueRgjXgOsq/"
++			     "NxvCXDgAa5xy0+3Sl0myxIs8rJ5KeXfJQFe7qxgaw "
++			     "VjJsJTKw8neOTw2rQfLaigWu2LIWw+"
++			     "IyVrLjZJdLqGkiLBGd1w4X3U12 "
++			     "fFxoY3eqzNgBEtduoGKPZ/"
++			     "NpP9cuKJORJ18283aV8hR4WO91VR0q1zcM jLwqUg=="),
++		/*
++		 * Sentinel.
++		 */
++		TEXT_SENTINEL()
++	};
++	wire_ok_t wire_ok[] = {
++		WIRE_VALID(0x00, 0x06, 0x08, 0x00, 0x00, 0x01, 0x51, 0x80, 0x69,
++			   0xee, 0x44, 0x90, 0x69, 0xdd, 0x13, 0x00, 0xd4, 0x79,
++			   0x00, 0xb4, 0x56, 0xdc, 0xa1, 0x53, 0xfc, 0x32, 0x7a,
++			   0x5e, 0x71, 0x4a, 0xae, 0x27, 0xf6, 0xa3, 0xf9, 0x77,
++			   0x8d, 0x81, 0x5e, 0xed, 0xb3, 0xd1, 0x92, 0x1d, 0x59,
++			   0x17, 0x69, 0x74, 0x49, 0xac, 0x9f, 0xd3, 0x12, 0x43,
++			   0x99, 0x02, 0x95, 0x46, 0xd0, 0x5e, 0x84, 0xf6, 0xc6,
++			   0x29, 0xc4, 0x69, 0x36, 0x22, 0xdc, 0x1e, 0x2c, 0xbe,
++			   0x37, 0xba, 0x38, 0xa8, 0x1a, 0x3d, 0x07, 0x5b, 0x06,
++			   0x43, 0x45, 0x1f, 0xaf, 0x6e, 0xea, 0xfe, 0x3b, 0xf7,
++			   0x48, 0x76, 0x17, 0xa2, 0x8a, 0x0d, 0x55, 0xbd, 0x4f,
++			   0xbd, 0x1d, 0x72, 0xe2, 0x40, 0xe5, 0x62, 0x63, 0xd2,
++			   0x9c, 0xeb, 0x88, 0xb1, 0x77, 0x22, 0x61, 0x60, 0x20,
++			   0xb9, 0x2b, 0xe6, 0xce, 0xd6, 0xab, 0x07, 0xc5, 0xdf,
++			   0x8a, 0x25, 0x73, 0x9a, 0xc7, 0x21, 0xdb, 0xa9, 0xc8,
++			   0x58, 0x90, 0x31, 0x72, 0xe0, 0xf2, 0xfa, 0xa9, 0xfb,
++			   0x44, 0x55, 0xa2, 0xe4, 0xb9, 0xe4, 0x60, 0x8d, 0x78,
++			   0x0e, 0xb2, 0xaf, 0xcd, 0xc6, 0xf0, 0x97, 0x0e, 0x00,
++			   0x1a, 0xe7, 0x1c, 0xb4, 0xfb, 0x74, 0xa5, 0xd2, 0x6c,
++			   0xb1, 0x22, 0xcf, 0x2b, 0x27, 0x92, 0x9e, 0x5d, 0xf2,
++			   0x50, 0x15, 0xee, 0xea, 0xc6, 0x06, 0xb0, 0x56, 0x32,
++			   0x6c, 0x25, 0x32, 0xb0, 0xf2, 0x77, 0x8e, 0x4f, 0x0d,
++			   0xab, 0x41, 0xf2, 0xda, 0x8a, 0x05, 0xae, 0xd8, 0xb2,
++			   0x16, 0xc3, 0xe2, 0x32, 0x56, 0xb2, 0xe3, 0x64, 0x97,
++			   0x4b, 0xa8, 0x69, 0x22, 0x2c, 0x11, 0x9d, 0xd7, 0x0e,
++			   0x17, 0xdd, 0x4d, 0x76, 0x7c, 0x5c, 0x68, 0x63, 0x77,
++			   0xaa, 0xcc, 0xd8, 0x01, 0x12, 0xd7, 0x6e, 0xa0, 0x62,
++			   0x8f, 0x67, 0xf3, 0x69, 0x3f, 0xd7, 0x2e, 0x28, 0x93,
++			   0x91, 0x27, 0x5f, 0x36, 0xf3, 0x76, 0x95, 0xf2, 0x14,
++			   0x78, 0x58, 0xef, 0x75, 0x55, 0x1d, 0x2a, 0xd7, 0x37,
++			   0x0c, 0x8c, 0xbc, 0x2a, 0x52),
++		/* labels too short for signer */
++		WIRE_INVALID(
++			0x00, 0x06, 0x08, 0x00, 0x00, 0x01, 0x51, 0x80, 0x69,
++			0xee, 0x44, 0x90, 0x69, 0xdd, 0x13, 0x00, 0xd4, 0x79,
++			0x07, 0x65, 0x78, 0x61, 0x6d, 0x70, 0x6c, 0x65, 0x00,
++			0xb4, 0x56, 0xdc, 0xa1, 0x53, 0xfc, 0x32, 0x7a, 0x5e,
++			0x71, 0x4a, 0xae, 0x27, 0xf6, 0xa3, 0xf9, 0x77, 0x8d,
++			0x81, 0x5e, 0xed, 0xb3, 0xd1, 0x92, 0x1d, 0x59, 0x17,
++			0x69, 0x74, 0x49, 0xac, 0x9f, 0xd3, 0x12, 0x43, 0x99,
++			0x02, 0x95, 0x46, 0xd0, 0x5e, 0x84, 0xf6, 0xc6, 0x29,
++			0xc4, 0x69, 0x36, 0x22, 0xdc, 0x1e, 0x2c, 0xbe, 0x37,
++			0xba, 0x38, 0xa8, 0x1a, 0x3d, 0x07, 0x5b, 0x06, 0x43,
++			0x45, 0x1f, 0xaf, 0x6e, 0xea, 0xfe, 0x3b, 0xf7, 0x48,
++			0x76, 0x17, 0xa2, 0x8a, 0x0d, 0x55, 0xbd, 0x4f, 0xbd,
++			0x1d, 0x72, 0xe2, 0x40, 0xe5, 0x62, 0x63, 0xd2, 0x9c,
++			0xeb, 0x88, 0xb1, 0x77, 0x22, 0x61, 0x60, 0x20, 0xb9,
++			0x2b, 0xe6, 0xce, 0xd6, 0xab, 0x07, 0xc5, 0xdf, 0x8a,
++			0x25, 0x73, 0x9a, 0xc7, 0x21, 0xdb, 0xa9, 0xc8, 0x58,
++			0x90, 0x31, 0x72, 0xe0, 0xf2, 0xfa, 0xa9, 0xfb, 0x44,
++			0x55, 0xa2, 0xe4, 0xb9, 0xe4, 0x60, 0x8d, 0x78, 0x0e,
++			0xb2, 0xaf, 0xcd, 0xc6, 0xf0, 0x97, 0x0e, 0x00, 0x1a,
++			0xe7, 0x1c, 0xb4, 0xfb, 0x74, 0xa5, 0xd2, 0x6c, 0xb1,
++			0x22, 0xcf, 0x2b, 0x27, 0x92, 0x9e, 0x5d, 0xf2, 0x50,
++			0x15, 0xee, 0xea, 0xc6, 0x06, 0xb0, 0x56, 0x32, 0x6c,
++			0x25, 0x32, 0xb0, 0xf2, 0x77, 0x8e, 0x4f, 0x0d, 0xab,
++			0x41, 0xf2, 0xda, 0x8a, 0x05, 0xae, 0xd8, 0xb2, 0x16,
++			0xc3, 0xe2, 0x32, 0x56, 0xb2, 0xe3, 0x64, 0x97, 0x4b,
++			0xa8, 0x69, 0x22, 0x2c, 0x11, 0x9d, 0xd7, 0x0e, 0x17,
++			0xdd, 0x4d, 0x76, 0x7c, 0x5c, 0x68, 0x63, 0x77, 0xaa,
++			0xcc, 0xd8, 0x01, 0x12, 0xd7, 0x6e, 0xa0, 0x62, 0x8f,
++			0x67, 0xf3, 0x69, 0x3f, 0xd7, 0x2e, 0x28, 0x93, 0x91,
++			0x27, 0x5f, 0x36, 0xf3, 0x76, 0x95, 0xf2, 0x14, 0x78,
++			0x58, 0xef, 0x75, 0x55, 0x1d, 0x2a, 0xd7, 0x37, 0x0c,
++			0x8c, 0xbc, 0x2a, 0x52),
++
++		WIRE_SENTINEL()
++	};
++	check_rdata(text_ok, wire_ok, NULL, false, dns_rdataclass_in,
++		    dns_rdatatype_rrsig, sizeof(dns_rdata_rrsig_t));
++}
++
+ ISC_RUN_TEST_IMPL(resinfo) {
+ 	text_ok_t text_ok[] = {
+ 		TEXT_VALID_CHANGED("qnamemin exterr=15,16,17 "
+@@ -3357,6 +3466,7 @@ ISC_TEST_ENTRY(nsec3)
+ ISC_TEST_ENTRY(nxt)
+ ISC_TEST_ENTRY(resinfo)
+ ISC_TEST_ENTRY(rkey)
++ISC_TEST_ENTRY(rrsig)
+ ISC_TEST_ENTRY(sshfp)
+ ISC_TEST_ENTRY(wallet)
+ ISC_TEST_ENTRY(wks)
diff --git a/meta/recipes-connectivity/bind/bind_9.18.49.bb b/meta/recipes-connectivity/bind/bind_9.18.49.bb
index dc274f6076..8218772531 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.49.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.49.bb
@@ -29,6 +29,10 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://CVE-2026-11331-01.patch \
            file://CVE-2026-11331-02.patch \
            file://CVE-2026-11331-03.patch \
+           file://CVE-2026-11622.patch \
+           file://CVE-2026-11721-01.patch \
+           file://CVE-2026-11721-02.patch \
+           file://CVE-2026-11721-03.patch \
            "
 
 SRC_URI[sha256sum] = "c43ce4548ebed788cd9df63658a7de105ceafba43fcd63fa352b1093e525cd24"
-- 
2.50.1


