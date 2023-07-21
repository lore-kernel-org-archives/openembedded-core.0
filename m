Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E64AEB64DC
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 06:50:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1806.1689922227718473988
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 23:50:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UeTGc5WO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6566540bb0=yogita.urade@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36L4fNsn030825
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 23:50:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=ZQyLc
	34016/SKxlIfyCww9piHyOAmN+LcZGIiQrW1vg=; b=UeTGc5WO04kgCvALI34dN
	42785l7NUI74PEDlFlvAW64sNdmRhP4Mshh1KP9sh2i0xsxpTvBL6k0CZCIbcn+Q
	/KVa82qZSS6fp80zG1wAFuStWB0DBjLafWdfztqHOeGlaDcSmYiqDj3bTzZ8xW4W
	ih7UACw/rF33biKBbfbQ7hLF6x+7khfc3l3D4aCIPr5K4xM+a+N3D/Alr+TOSROi
	VMAKbAuuJ10HhkS2q20rEHvrZXkplpz6xRGkNJRi0bN3N6XU33sho1Lv7S0KtzNO
	uivvTX6MfiG7v1GXfTU56p81NeOGN63BXPX9tmm5aQcsauQ6nnXptUnRe20SDHvf
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rupqydfw0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 23:50:26 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 23:50:24 -0700
From: Yogita Urade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/1] bind: fix CVE-2023-2911
Date: Fri, 21 Jul 2023 06:50:04 +0000
Message-ID: <20230721065004.3400285-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: MRaCNp_CLiYPP7TDoK20lmlE8POToPfF
X-Proofpoint-ORIG-GUID: MRaCNp_CLiYPP7TDoK20lmlE8POToPfF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-21_03,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 clxscore=1015 mlxscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307210059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 06:50:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184671

If the `recursive-clients` quota is reached on a BIND 9 resolver
configured with both `stale-answer-enable yes;` and
`stale-answer-client-timeout 0;`, a sequence of serve-stale-related
lookups could cause `named` to loop and terminate unexpectedly due
to a stack overflow.
This issue affects BIND 9 versions 9.16.33 through 9.16.41, 9.18.7
through 9.18.15, 9.16.33-S1 through 9.16.41-S1, and 9.18.11-S1
through 9.18.15-S1.

References:
https://kb.isc.org/docs/cve-2023-2911
https://downloads.isc.org/isc/bind9/9.18.16/doc/arm/html/notes.html#notes-for-bind-9-18-16

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../bind/bind-9.18.11/CVE-2023-2911.patch     | 109 ++++++++++++++++++
 .../recipes-connectivity/bind/bind_9.18.11.bb |   1 +
 2 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind-9.18.11/CVE-2023-2911.patch

diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/CVE-2023-2911.patch b/meta/recipes-connectivity/bind/bind-9.18.11/CVE-2023-2911.patch
new file mode 100644
index 0000000000..729d13ee18
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind-9.18.11/CVE-2023-2911.patch
@@ -0,0 +1,109 @@
+From 2d6982985021ee354469a0fc380008d6c6fa8ae2 Mon Sep 17 00:00:00 2001
+From: Michal Nowak <mnowak@isc.org>
+Date: Thu, 20 Jul 2023 08:07:32 +0000
+Subject: [PATCH] Merge branch '4089-confidential-stale-query-loop-bind-9.18'
+ into 'security-bind-9.18'
+
+[9.18][CVE-2023-2911] Fix stale-answer-client-timeout 0 crash
+
+See merge request isc-private/bind9!523
+
+CVE-2023-2911
+
+Upstream-Status: Backport [https://gitlab.isc.org/isc-projects/bind9/-/commit/2d6982985021ee354469a0fc380008d6c6fa8ae2]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ CHANGES        |  7 +++++++
+ lib/ns/query.c | 29 +++++++++++++++++++++--------
+ 2 files changed, 28 insertions(+), 8 deletions(-)
+
+diff --git a/CHANGES b/CHANGES
+index ca2f3a3..0e18f27 100644
+--- a/CHANGES
++++ b/CHANGES
+@@ -1,3 +1,10 @@
++6192.	[security]	A query that prioritizes stale data over lookup
++			triggers a fetch to refresh the stale data in cache.
++			If the fetch is aborted for exceeding the recursion
++			quota, it was possible for 'named' to enter an infinite
++			callback loop and crash due to stack overflow. This has
++			been fixed. (CVE-2023-2911) [GL #4089]
++
+	--- 9.18.11 released ---
+
+ 6067.	[security]	Fix serve-stale crash when recursive clients soft quota
+diff --git a/lib/ns/query.c b/lib/ns/query.c
+index 0d2ba6b..7a812e6 100644
+--- a/lib/ns/query.c
++++ b/lib/ns/query.c
+@@ -5824,6 +5824,7 @@ query_refresh_rrset(query_ctx_t *orig_qctx) {
+	qctx.client->query.dboptions &= ~(DNS_DBFIND_STALETIMEOUT |
+					  DNS_DBFIND_STALEOK |
+					  DNS_DBFIND_STALEENABLED);
++	qctx.client->nodetach = false;
+
+	/*
+	 * We'll need some resources...
+@@ -6076,7 +6077,13 @@ query_lookup(query_ctx_t *qctx) {
+					"%s stale answer used, an attempt to "
+					"refresh the RRset will still be made",
+					namebuf);
++
+				qctx->refresh_rrset = STALE(qctx->rdataset);
++				/*
++				 * If we are refreshing the RRSet, we must not
++				 * detach from the client in query_send().
++				 */
++				qctx->client->nodetach = qctx->refresh_rrset;
+				ns_client_extendederror(
+					qctx->client, ede,
+					"stale data prioritized over lookup");
+@@ -6503,7 +6510,7 @@ ns_query_recurse(ns_client_t *client, dns_rdatatype_t qtype, dns_name_t *qname,
+	if (recparam_match(&client->query.recparam, qtype, qname, qdomain)) {
+		ns_client_log(client, NS_LOGCATEGORY_CLIENT, NS_LOGMODULE_QUERY,
+			      ISC_LOG_INFO, "recursion loop detected");
+-		return (ISC_R_FAILURE);
++		return (ISC_R_ALREADYRUNNING);
+	}
+
+	recparam_update(&client->query.recparam, qtype, qname, qdomain);
+@@ -7620,10 +7627,21 @@ query_usestale(query_ctx_t *qctx, isc_result_t result) {
+		return (false);
+	}
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
+		/*
+		 * Don't enable serve-stale if the result signals a duplicate
+-		 * query or query that is being dropped.
++		 * query or a query that is being dropped or can't proceed
++		 * because of a recursion loop.
+		 */
+		return (false);
+	}
+@@ -11927,12 +11945,7 @@ ns_query_done(query_ctx_t *qctx) {
+	/*
+	 * Client may have been detached after query_send(), so
+	 * we test and store the flag state here, for safety.
+-	 * If we are refreshing the RRSet, we must not detach from the client
+-	 * in the query_send(), so we need to override the flag.
+	 */
+-	if (qctx->refresh_rrset) {
+-		qctx->client->nodetach = true;
+-	}
+	nodetach = qctx->client->nodetach;
+	query_send(qctx->client);
+
+--
+2.40.0
diff --git a/meta/recipes-connectivity/bind/bind_9.18.11.bb b/meta/recipes-connectivity/bind/bind_9.18.11.bb
index 0618129318..4349b6441b 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.11.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.11.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
            file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
            file://0001-avoid-start-failure-with-bind-user.patch \
+           file://CVE-2023-2911.patch \
            "
 
 SRC_URI[sha256sum] = "8ff3352812230cbcbda42df87cad961f94163d3da457c5e4bef8057fd5df2158"
-- 
2.40.0


