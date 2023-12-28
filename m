Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC92EC46CD3
	for <webhook@archiver.kernel.org>; Thu, 28 Dec 2023 06:41:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.118893.1703745659488173629
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 22:40:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DxTKOyQs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0726f05314=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BS5pRoZ004636
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 06:40:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=ZBmTq
	Y0DJjx8gR6G8J/F58mj8+QmnovX8B11RHZIIQk=; b=DxTKOyQskFuhvVVTahbPg
	QS3Zf7AgpBw9cGjRq1p+g9GLPWpF2GVfvtCKbHdtibnYheLt/Zw4+d2bgqgoz5tQ
	HECYkRPhDx4LKzdvvUvugdwXuMDiqXZA8URe4dFtO17fiyOID8gP1x6gvUbnCIjV
	bMnddEzKhnWRJK/zaw0PNWPTlzxCxdV5niGKLu9zfuvxRU9nZjknzfUIDaaPFGb0
	mAMklSgZLfHozu1rY/eWK+5r89TfdHTLbiDlxu5g3xV2LI5t3MYBCzmmcIa6ctll
	yvZL9GwNQOPTu3Os2NBySjN2dl14wEgLgK7vc4kaxSdOTaxFq25w3B9CvO3kv+hc
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v5mrxv02s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 06:40:58 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 22:41:00 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/2] openssh: fix CVE-2023-51384
Date: Thu, 28 Dec 2023 06:40:38 +0000
Message-ID: <20231228064039.965852-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: JuSwM6nxxTTtV-qwckr3a__4n7UaBfW-
X-Proofpoint-GUID: JuSwM6nxxTTtV-qwckr3a__4n7UaBfW-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1011 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312280052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 06:41:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192974

From: Archana Polampalli <archana.polampalli@windriver.com>

In ssh-agent in OpenSSH before 9.6, certain destination constraints can be
incompletely applied. When destination constraints are specified during
addition of PKCS#11-hosted private keys, these constraints are only applied
to the first key, even if a PKCS#11 token returns multiple keys.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-51384

Upstream patches:
https://github.com/openssh/openssh-portable/commit/881d9c6af9da4257c69c327c4e2f1508b2fa754b

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../openssh/openssh/CVE-2023-51384.patch      | 171 ++++++++++++++++++
 .../openssh/openssh_8.9p1.bb                  |   1 +
 2 files changed, 172 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-51384.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2023-51384.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2023-51384.patch
new file mode 100644
index 0000000000..ead3256915
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2023-51384.patch
@@ -0,0 +1,171 @@
+From 881d9c6af9da4257c69c327c4e2f1508b2fa754b Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Mon, 18 Dec 2023 14:46:12 +0000
+Subject: [PATCH] upstream: apply destination constraints to all p11 keys
+
+Previously applied only to the first key returned from each token.
+
+ok markus@
+
+OpenBSD-Commit-ID: 36df3afb8eb94eec6b2541f063d0d164ef8b488d
+
+CVE: CVE-2023-51384
+
+Upstream-Status: Backport
+https://github.com/openssh/openssh-portable/commit/881d9c6af9da4257c69c327c4e2f1508b2fa754b
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ ssh-agent.c | 102 +++++++++++++++++++++++++++++++++++++++++++++++++---
+ 1 file changed, 98 insertions(+), 4 deletions(-)
+
+diff --git a/ssh-agent.c b/ssh-agent.c
+index 19eeaae..4dbb4f3 100644
+--- a/ssh-agent.c
++++ b/ssh-agent.c
+@@ -249,6 +249,90 @@ free_dest_constraints(struct dest_constraint *dcs, size_t ndcs)
+	free(dcs);
+ }
+
++static void
++dup_dest_constraint_hop(const struct dest_constraint_hop *dch,
++    struct dest_constraint_hop *out)
++{
++	u_int i;
++	int r;
++
++	out->user = dch->user == NULL ? NULL : xstrdup(dch->user);
++	out->hostname = dch->hostname == NULL ? NULL : xstrdup(dch->hostname);
++	out->is_ca = dch->is_ca;
++	out->nkeys = dch->nkeys;
++	out->keys = out->nkeys == 0 ? NULL :
++	    xcalloc(out->nkeys, sizeof(*out->keys));
++	out->key_is_ca = out->nkeys == 0 ? NULL :
++	    xcalloc(out->nkeys, sizeof(*out->key_is_ca));
++	for (i = 0; i < dch->nkeys; i++) {
++		if (dch->keys[i] != NULL &&
++		    (r = sshkey_from_private(dch->keys[i],
++		    &(out->keys[i]))) != 0)
++			fatal_fr(r, "copy key");
++		out->key_is_ca[i] = dch->key_is_ca[i];
++	}
++}
++
++static struct dest_constraint *
++dup_dest_constraints(const struct dest_constraint *dcs, size_t ndcs)
++{
++	size_t i;
++	struct dest_constraint *ret;
++
++	if (ndcs == 0)
++		return NULL;
++	ret = xcalloc(ndcs, sizeof(*ret));
++	for (i = 0; i < ndcs; i++) {
++		dup_dest_constraint_hop(&dcs[i].from, &ret[i].from);
++		dup_dest_constraint_hop(&dcs[i].to, &ret[i].to);
++	}
++	return ret;
++}
++
++#ifdef DEBUG_CONSTRAINTS
++static void
++dump_dest_constraint_hop(const struct dest_constraint_hop *dch)
++{
++	u_int i;
++	char *fp;
++
++	debug_f("user %s hostname %s is_ca %d nkeys %u",
++	    dch->user == NULL ? "(null)" : dch->user,
++	    dch->hostname == NULL ? "(null)" : dch->hostname,
++	    dch->is_ca, dch->nkeys);
++	for (i = 0; i < dch->nkeys; i++) {
++		fp = NULL;
++		if (dch->keys[i] != NULL &&
++		    (fp = sshkey_fingerprint(dch->keys[i],
++		    SSH_FP_HASH_DEFAULT, SSH_FP_DEFAULT)) == NULL)
++			fatal_f("fingerprint failed");
++		debug_f("key %u/%u: %s%s%s key_is_ca %d", i, dch->nkeys,
++		    dch->keys[i] == NULL ? "" : sshkey_ssh_name(dch->keys[i]),
++		    dch->keys[i] == NULL ? "" : " ",
++		    dch->keys[i] == NULL ? "none" : fp,
++		    dch->key_is_ca[i]);
++		free(fp);
++	}
++}
++#endif /* DEBUG_CONSTRAINTS */
++
++static void
++dump_dest_constraints(const char *context,
++    const struct dest_constraint *dcs, size_t ndcs)
++{
++#ifdef DEBUG_CONSTRAINTS
++	size_t i;
++
++	debug_f("%s: %zu constraints", context, ndcs);
++	for (i = 0; i < ndcs; i++) {
++		debug_f("constraint %zu / %zu: from: ", i, ndcs);
++		dump_dest_constraint_hop(&dcs[i].from);
++		debug_f("constraint %zu / %zu: to: ", i, ndcs);
++		dump_dest_constraint_hop(&dcs[i].to);
++	}
++	debug_f("done for %s", context);
++#endif /* DEBUG_CONSTRAINTS */
++}
+ static void
+ free_identity(Identity *id)
+ {
+@@ -520,13 +604,22 @@ process_request_identities(SocketEntry *e)
+	Identity *id;
+	struct sshbuf *msg, *keys;
+	int r;
+-	u_int nentries = 0;
++	u_int i = 0, nentries = 0;
++	char *fp;
+
+	debug2_f("entering");
+
+	if ((msg = sshbuf_new()) == NULL || (keys = sshbuf_new()) == NULL)
+		fatal_f("sshbuf_new failed");
+	TAILQ_FOREACH(id, &idtab->idlist, next) {
++		if ((fp = sshkey_fingerprint(id->key, SSH_FP_HASH_DEFAULT,
++		    SSH_FP_DEFAULT)) == NULL)
++			fatal_f("fingerprint failed");
++		debug_f("key %u / %u: %s %s", i++, idtab->nentries,
++		    sshkey_ssh_name(id->key), fp);
++		dump_dest_constraints(__func__,
++		    id->dest_constraints, id->ndest_constraints);
++		free(fp);
+		/* identity not visible, don't include in response */
+		if (identity_permitted(id, e, NULL, NULL, NULL) != 0)
+			continue;
+@@ -1235,6 +1328,7 @@ process_add_identity(SocketEntry *e)
+		sshbuf_reset(e->request);
+		goto out;
+	}
++	dump_dest_constraints(__func__, dest_constraints, ndest_constraints);
+
+	if (sk_provider != NULL) {
+		if (!sshkey_is_sk(k)) {
+@@ -1414,6 +1508,7 @@ process_add_smartcard_key(SocketEntry *e)
+		error_f("failed to parse constraints");
+		goto send;
+	}
++	dump_dest_constraints(__func__, dest_constraints, ndest_constraints);
+	if (e->nsession_ids != 0 && !remote_add_provider) {
+		verbose("failed PKCS#11 add of \"%.100s\": remote addition of "
+		    "providers is disabled", provider);
+@@ -1449,10 +1544,9 @@ process_add_smartcard_key(SocketEntry *e)
+			}
+			id->death = death;
+			id->confirm = confirm;
+-			id->dest_constraints = dest_constraints;
++			id->dest_constraints = dup_dest_constraints(
++			    dest_constraints, ndest_constraints);
+			id->ndest_constraints = ndest_constraints;
+-			dest_constraints = NULL; /* transferred */
+-			ndest_constraints = 0;
+			TAILQ_INSERT_TAIL(&idtab->idlist, id, next);
+			idtab->nentries++;
+			success = 1;
+--
+2.40.0
diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
index 7ad9bced1b..3860899540 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2023-38408-0004.patch \
            file://fix-authorized-principals-command.patch \
            file://CVE-2023-48795.patch \
+           file://CVE-2023-51384.patch \
            "
 SRC_URI[sha256sum] = "fd497654b7ab1686dac672fb83dfb4ba4096e8b5ffcdaccd262380ae58bec5e7"
 
-- 
2.40.0


