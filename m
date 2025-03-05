Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 276BEC19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 16:14:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17170.1741191289274496212
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 08:14:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5159052c86=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525CQX99001938
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Mar 2025 16:14:48 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456cux0wg8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 16:14:48 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 5 Mar 2025 08:14:46 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 5 Mar 2025 08:14:45 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH 1/5] openssh: fix CVE-2025-26465
Date: Wed, 5 Mar 2025 16:14:39 +0000
Message-ID: <20250305161443.284930-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Omz_C-_OWRmhJTxz0YWXAwHvB_b40FDp
X-Authority-Analysis: v=2.4 cv=ddB63WXe c=1 sm=1 tr=0 ts=67c87878 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=3tcz3bTJAAAA:8 a=t7CeM3EgAAAA:8 a=WcxHNsqOAAAA:8 a=HU1OPnRnAAAA:8
 a=NNEh3HQJF7SAOJJU0M8A:9 a=4EbjBm0RLgFgoQzmu6QD:22 a=FdTzh2GWekK77mhwV6Dw:22 a=WXeDAsiyfwSRC1lbKA7R:22 a=vQ5cN67eHy2kcvnFvKcb:22
X-Proofpoint-ORIG-GUID: Omz_C-_OWRmhJTxz0YWXAwHvB_b40FDp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_06,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503050125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 16:14:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212339

From: Archana Polampalli <archana.polampalli@windriver.com>

A vulnerability was found in OpenSSH when the VerifyHostKeyDNS option is enabled.
A machine-in-the-middle attack can be performed by a malicious machine impersonating
a legit server. This issue occurs due to how OpenSSH mishandles error codes in specific
conditions when verifying the host key. For an attack to be considered successful,
the attacker needs to manage to exhaust the client's memory resource first, turning
the attack complexity high.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../openssh/openssh/CVE-2025-26465.patch      | 169 ++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |   1 +
 2 files changed, 170 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2025-26465.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2025-26465.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2025-26465.patch
new file mode 100644
index 0000000000..0a3cf1496b
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2025-26465.patch
@@ -0,0 +1,169 @@
+From 0832aac79517611dd4de93ad0a83577994d9c907 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Tue, 18 Feb 2025 08:02:48 +0000
+Subject: [PATCH] upstream: Fix cases where error codes were not correctly set
+
+Reported by the Qualys Security Advisory team. ok markus@
+
+OpenBSD-Commit-ID: 7bcd4ffe0fa1e27ff98d451fb9c22f5fae6e610d
+
+CVE: CVE-2025-26465
+
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/0832aac79517611dd4de93ad0a83577994d9c907]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ krl.c           | 4 +++-
+ ssh-agent.c     | 5 +++++
+ ssh-sk-client.c | 4 +++-
+ sshconnect2.c   | 5 ++++-
+ sshsig.c        | 1 +
+ 5 files changed, 16 insertions(+), 3 deletions(-)
+
+diff --git a/krl.c b/krl.c
+index e2efdf0..0d0f695 100644
+--- a/krl.c
++++ b/krl.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: krl.c,v 1.59 2023/07/17 05:22:30 djm Exp $ */
++/* $OpenBSD: krl.c,v 1.60 2025/02/18 08:02:48 djm Exp $ */
+ /*
+  * Copyright (c) 2012 Damien Miller <djm@mindrot.org>
+  *
+@@ -674,6 +674,7 @@ revoked_certs_generate(struct revoked_certs *rc, struct sshbuf *buf)
+			break;
+		case KRL_SECTION_CERT_SERIAL_BITMAP:
+			if (rs->lo - bitmap_start > INT_MAX) {
++				r = SSH_ERR_INVALID_FORMAT;
+				error_f("insane bitmap gap");
+				goto out;
+			}
+@@ -1059,6 +1060,7 @@ ssh_krl_from_blob(struct sshbuf *buf, struct ssh_krl **krlp)
+	}
+
+	if ((krl = ssh_krl_init()) == NULL) {
++		r = SSH_ERR_ALLOC_FAIL;
+		error_f("alloc failed");
+		goto out;
+	}
+diff --git a/ssh-agent.c b/ssh-agent.c
+index b6a3f48..2d2c6fc 100644
+--- a/ssh-agent.c
++++ b/ssh-agent.c
+@@ -1204,6 +1204,7 @@ parse_key_constraint_extension(struct sshbuf *m, char **sk_providerp,
+	    "restrict-destination-v00@openssh.com") == 0) {
+		if (*dcsp != NULL) {
+			error_f("%s already set", ext_name);
++			r = SSH_ERR_INVALID_FORMAT;
+			goto out;
+		}
+		if ((r = sshbuf_froms(m, &b)) != 0) {
+@@ -1213,6 +1214,7 @@ parse_key_constraint_extension(struct sshbuf *m, char **sk_providerp,
+		while (sshbuf_len(b) != 0) {
+			if (*ndcsp >= AGENT_MAX_DEST_CONSTRAINTS) {
+				error_f("too many %s constraints", ext_name);
++				r = SSH_ERR_INVALID_FORMAT;
+				goto out;
+			}
+			*dcsp = xrecallocarray(*dcsp, *ndcsp, *ndcsp + 1,
+@@ -1230,6 +1232,7 @@ parse_key_constraint_extension(struct sshbuf *m, char **sk_providerp,
+		}
+		if (*certs != NULL) {
+			error_f("%s already set", ext_name);
++			r = SSH_ERR_INVALID_FORMAT;
+			goto out;
+		}
+		if ((r = sshbuf_get_u8(m, &v)) != 0 ||
+@@ -1241,6 +1244,7 @@ parse_key_constraint_extension(struct sshbuf *m, char **sk_providerp,
+		while (sshbuf_len(b) != 0) {
+			if (*ncerts >= AGENT_MAX_EXT_CERTS) {
+				error_f("too many %s constraints", ext_name);
++				r = SSH_ERR_INVALID_FORMAT;
+				goto out;
+			}
+			*certs = xrecallocarray(*certs, *ncerts, *ncerts + 1,
+@@ -1737,6 +1741,7 @@ process_ext_session_bind(SocketEntry *e)
+	/* record new key/sid */
+	if (e->nsession_ids >= AGENT_MAX_SESSION_IDS) {
+		error_f("too many session IDs recorded");
++		r = -1;
+		goto out;
+	}
+	e->session_ids = xrecallocarray(e->session_ids, e->nsession_ids,
+diff --git a/ssh-sk-client.c b/ssh-sk-client.c
+index 321fe53..06fad22 100644
+--- a/ssh-sk-client.c
++++ b/ssh-sk-client.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: ssh-sk-client.c,v 1.12 2022/01/14 03:34:00 djm Exp $ */
++/* $OpenBSD: ssh-sk-client.c,v 1.13 2025/02/18 08:02:48 djm Exp $ */
+ /*
+  * Copyright (c) 2019 Google LLC
+  *
+@@ -439,6 +439,7 @@ sshsk_load_resident(const char *provider_path, const char *device,
+		}
+		if ((srk = calloc(1, sizeof(*srk))) == NULL) {
+			error_f("calloc failed");
++			r = SSH_ERR_ALLOC_FAIL;
+			goto out;
+		}
+		srk->key = key;
+@@ -450,6 +451,7 @@ sshsk_load_resident(const char *provider_path, const char *device,
+		if ((tmp = recallocarray(srks, nsrks, nsrks + 1,
+		    sizeof(*srks))) == NULL) {
+			error_f("recallocarray keys failed");
++			r = SSH_ERR_ALLOC_FAIL;
+			goto out;
+		}
+		debug_f("srks[%zu]: %s %s uidlen %zu", nsrks,
+diff --git a/sshconnect2.c b/sshconnect2.c
+index fab1e36..a5f92f0 100644
+--- a/sshconnect2.c
++++ b/sshconnect2.c
+@@ -101,7 +101,7 @@ verify_host_key_callback(struct sshkey *hostkey, struct ssh *ssh)
+	    options.required_rsa_size)) != 0)
+		fatal_r(r, "Bad server host key");
+	if (verify_host_key(xxx_host, xxx_hostaddr, hostkey,
+-	    xxx_conn_info) == -1)
++	    xxx_conn_info) != 0)
+		fatal("Host key verification failed.");
+	return 0;
+ }
+@@ -709,6 +709,7 @@ input_userauth_pk_ok(int type, u_int32_t seq, struct ssh *ssh)
+
+	if ((pktype = sshkey_type_from_name(pkalg)) == KEY_UNSPEC) {
+		debug_f("server sent unknown pkalg %s", pkalg);
++		r = SSH_ERR_INVALID_FORMAT;
+		goto done;
+	}
+	if ((r = sshkey_from_blob(pkblob, blen, &key)) != 0) {
+@@ -719,6 +720,7 @@ input_userauth_pk_ok(int type, u_int32_t seq, struct ssh *ssh)
+		error("input_userauth_pk_ok: type mismatch "
+		    "for decoded key (received %d, expected %d)",
+		    key->type, pktype);
++		r = SSH_ERR_INVALID_FORMAT;
+		goto done;
+	}
+
+@@ -738,6 +740,7 @@ input_userauth_pk_ok(int type, u_int32_t seq, struct ssh *ssh)
+		    SSH_FP_DEFAULT);
+		error_f("server replied with unknown key: %s %s",
+		    sshkey_type(key), fp == NULL ? "<ERROR>" : fp);
++		r = SSH_ERR_INVALID_FORMAT;
+		goto done;
+	}
+	ident = format_identity(id);
+diff --git a/sshsig.c b/sshsig.c
+index d50d65f..1b7f40d 100644
+--- a/sshsig.c
++++ b/sshsig.c
+@@ -874,6 +874,7 @@ cert_filter_principals(const char *path, u_long linenum,
+	}
+	if ((principals = sshbuf_dup_string(nprincipals)) == NULL) {
+		error_f("buffer error");
++		r = SSH_ERR_ALLOC_FAIL;
+		goto out;
+	}
+	/* success */
+--
+2.40.0
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index ea5face097..6ae4c81a42 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2024-39894.patch \
            file://0001-Fix-missing-header-for-systemd-notification.patch \
            file://CVE-2025-26466.patch \
+           file://CVE-2025-26465.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 
-- 
2.40.0


