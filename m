Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17044.1793293869501862070
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 10:11:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=xWwq+h4l;
 spf=pass (domain: est.tech, ip: 52.101.69.68, mailfrom: benhur.tessele@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=moJ6TrBkYhPKaGxYOxmzSQRFWNboyswdFqXmqGWUMb7XD1erzaLScVRAIjJVg5qLiOueeidTmnqurb/YNXLMjrZF8svtG9PqZ/zeJfs8/4hr0BAJnSISzEEVYWeDLRWtAQoVUQpMU+WofddMonaXhoRgIGNixqFWsxVWmtwVhMOMKLp1hQe+Bkhz6XzEs07e2ZCKmeqKB18Rh+QLd7XJFTnl4Wwb6rOT6VfokZdYAnIw82Yhm/4sxZ88AYC0QRuFWzYymo5ypfTladSDhOhnWt83+UiWxIc5vHuQsDrj35THdycQN6Ws2OUw2chHAOvQ8h59+xLPZ4/MKFLK6ozR+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTPC96WEdNrYRB2dwrz9iKbAARsCTsB5LczcjZRIGZI=;
 b=AO8znZupUQ6ZDbJMMXtHVOQ3pZ/R4fu7xTfaCzGUDH3DRQhnHCVGsJ9ZpaQwVXxp1QAPtwXqFNNp7LCX5ILHmXC7li/REnOg/s+xF28C8RjBQkqbLAf4gBPOgNrw0/eMvHs6FkCQEnSQuChcaVAz/UywbTUcYUnI3C69znJc6DbFUiUjXwBGK75Rq7Tv5ZTJTfJqM6Y4q6yTUjIZ14uJiRoAXVUc/Y2xOsNYz37x46sUGoRVcykFHRDmkyrfTKxoCVV0ICI+934UyQzbEsiwne0d66rbuQGe/ogZAzGKx/haCyKNto4C8t4wFxRWi5ba+bqQP/v92SDmXWGgvZEZXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTPC96WEdNrYRB2dwrz9iKbAARsCTsB5LczcjZRIGZI=;
 b=xWwq+h4lM9kwQsU05bV/wcO5HX+cAoOhNlmCsk1r03rS6kUJEelpzAQglcVNO4IPgQIO+zQGXyY0Y4sPPX/M/RPT0F+xhifZlGeMr39oL57zh8OBZdcZ8kD7SYrCI76B5/LQptXV2zESXKVgOzCNhy5O6iToRwa08eslvwq09vSKvdhphonUgG1FiYukkw/dBpryO2nioq5pnZmDLj5TiA1ai9Au6PlRwzuOuhboifOH7Yjlg2mOPeJrnKcJ/3A4MJKTKAfv+HNi5X9TT5fXH8QQ2nMgm9ZJl2SlzefCM0ojwQqZ/1snoz87zmzyTkFriAhgWpRmPOzu/oFerLnyeg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU0P189MB2250.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3e2::15)
 by DB9P189MB3717.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5fb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 17:11:09 +0000
Received: from DU0P189MB2250.EURP189.PROD.OUTLOOK.COM
 ([fe80::9be2:1092:4622:e248]) by DU0P189MB2250.EURP189.PROD.OUTLOOK.COM
 ([fe80::9be2:1092:4622:e248%5]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 17:11:08 +0000
From: Benhur Tessele <benhur.tessele@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Benhur Tessele <benhur.tessele@est.tech>
Subject: [scarthgap][PATCH 2/2] openssh: fix CVE-2026-106553
Date: Thu, 29 Oct 2026 18:10:57 +0100
Message-ID: <20261029171057.15032-3-benhur.tessele@est.tech>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029171057.15032-1-benhur.tessele@est.tech>
References: <20261029171057.15032-1-benhur.tessele@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MA3P292CA0005.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::18) To DU0P189MB2250.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:3e2::15)
Return-Path: benhur.tessele@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0P189MB2250:EE_|DB9P189MB3717:EE_
X-MS-Office365-Filtering-Correlation-Id: 74e3f12c-1818-44b4-0f47-08df35df9fbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|6133799003|12006099003|29003799003|22082099003|18002099003|25016099003|13003099007|56012099006|11063799006|5023799004|10067099003|261028144727099003|261021121427099003|261021123027099003|261022105027099003|261009223027099003|261026121527099003|261026140227099003|260925021911599003|260925022911599003|260925021311599003;
X-Microsoft-Antispam-Message-Info: VS9CLMMtnD5zAsduuiWYowl/bC/nI+JwXwsQGoNbJyRaCbqa1FG5z9JH+ljNJQkW4bgUkSaW4pJT3Rac4LjuPwuE5aa/Id4NnsFJNVPVC1/w2Fb5bp0Ya+dtW4RTX7K5bhfdw+LbwHDvtWSrfPw4akId84u1GWd6jO7dbz29of/hKFbD6gu4DKumuy6GC8hX22/kxtlu2EQgpUEK9jTdqQUbxOFzDkNlLqu9kLhFq4yW7Uy0MqzEQBLp7J0KGNsw1SgYezgJmAhKn4+Uz1DyIftatdKNmgyKK+KDKAtPOIIY0+vLv3PfTOAKS+FNsBkW7Z+RxQg/HWgoFa5VpG+omgCpdzfpy1M0/6KEKKUVxbOIbZIkDyXyJN3B1+7rkazPWDYxrpjLVb5zpeyZeMXbkXL2Adr7Tw9tSp+r9p7gHbh5x8vNd+PY5wa/PEMm5l87/l0OWumG75HcWaW3/Qa+ug+GkMZtCZOnF5IF8ts1fV7uROZ5U+GHBIri/5vlSBcUw4YthkeXoccMnzMoSJw5xcmGJpjIjDRuo4KeRaIhnhCIB304W7DYEKLZizMJ0g1FakszdnfiQzYDFkjrXyx8rfd8+1gjXHG4LfLkvBQrjlFKk/04Pa9JU+w5xJN/NjVP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0P189MB2250.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(6133799003)(12006099003)(29003799003)(22082099003)(18002099003)(25016099003)(13003099007)(56012099006)(11063799006)(5023799004)(10067099003)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261009223027099003)(261026121527099003)(261026140227099003)(260925021911599003)(260925022911599003)(260925021311599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y6MzgYCQym72j1EWo8iBE+P/qqyQeYQxz2Vj3NHAocl9EoPLKfXxuj1zYTOw?=
 =?us-ascii?Q?ZXPpyRAKT/O7MdEHdDPopxUKh1T3Cfpr7+sD2/pVQo+u1vb0SoWhbI9rNk9o?=
 =?us-ascii?Q?UI/DE51NYX6hJFnEV7eTIZaTagtYp6CKUbWB4fRKo1PY62aSW58jHyDZN1dP?=
 =?us-ascii?Q?DGn8iCnlBEmILtU4sBoV+JaCnAzv0X+BBPivaI5zg5hWkfQk8mr/UHkTVXQu?=
 =?us-ascii?Q?iFdCZkIquRZf01163qqc+aFlHQsiMbBMD3Ru+YQsnoNg8XyIXp3CsQgDuVcL?=
 =?us-ascii?Q?d1o1upgpHxZ3Gw7eg+sH/CgvpzQvPXt3LoE0aDJqz3dPksaK1DN749A78kuO?=
 =?us-ascii?Q?w1Flb8FCoJFwI1+F4NnwTO/kZZM2QASuC2uLHhf4BFQ0bOARroOPhZoOt7X9?=
 =?us-ascii?Q?e6nurolDQVN0qJ+KWHVywC9a0lytbyXaxyO4JNsGIjo1SUEI6KHw/LkP+/Q9?=
 =?us-ascii?Q?FbWZhoeVW4ulw9iUm4m3JGtFm9pMFcwFjdSmxBkTc49soqW0Y3kEK3GzCeeD?=
 =?us-ascii?Q?9AJHwfmxc/yS8d7pfoc9x+sU13MHUoXG84V/qD/WOJsjzOqnR4cMmSocFMb5?=
 =?us-ascii?Q?edCmTTrWjfgn5s1ebJp9cJdw8ghThgI/gQ6f7eLRBO2DwzS7iyuAeCz63CN+?=
 =?us-ascii?Q?yMl5jq3z997EFZdgiJYo+5vzZ+U5f1WLu17hb5Hybwq9i9Z8x8oyQ9ns5wXh?=
 =?us-ascii?Q?eLQJt/haAaxwfVphM5sQkb8ryDihTurZFtc0vVOoyTz6d+P9nItOskcO9lC/?=
 =?us-ascii?Q?GEU4AQVaBPrz57pDGsLDOVdiZbzevI70+vaKloSX7BwsSNZb1OdCMz7dMJAG?=
 =?us-ascii?Q?WUNAyTveVXLTqen9ZMwIPd9yd0RC3UUHBzdMQ2PgjvzAZyQae3Kzb2gT+3BM?=
 =?us-ascii?Q?yyx5YUfxRqHm71hf7ppiLFfd95s8Vo7VQycLQRJ1jYJVAbzgsqVtf692y+Il?=
 =?us-ascii?Q?JLJ/bC6A030MUSm2rViV+t8M+KOf9Rpl4LiIQx+e5LPWRB1Nz3Imk0yzra7S?=
 =?us-ascii?Q?/zPJoWpAOmN4ZjLKWMFnkrnPNnsxvwOzQQHWS5LhSVgvzEJiv6bMrQTLVqtk?=
 =?us-ascii?Q?DsPROj5RjtzGT5nqr/lEgxnQ2moY/y8mWFqNsqbe3ueQ8V1uRZLp4siBAM27?=
 =?us-ascii?Q?pXI1y3NSFjvjVR7W0otHzex6paEIKF+m8cODktmGEDEAVSF7E0Gq83oxuNEK?=
 =?us-ascii?Q?Kkq/DFqTZFnmExUfqXh8SQb4naz+2NGhPUyaecXKZVkWQ7KpO6BctnUwTIFD?=
 =?us-ascii?Q?3Nuw0LojxkOYmbXa2zz1Q3BEbyBoq13J2bS8RTS7y1NBTWgzr9c7YLDaWKmP?=
 =?us-ascii?Q?zVxXdroqeop7MUmpi38ywux6Oy2F8AHvh7zY4QX1q0vGUXzlL95sGpLOpLPf?=
 =?us-ascii?Q?eEX3aFhjrpJ/Um6wEeGiBgV/VmF2UcdTfrJb1UdWqtJoAU+1j7RHEaBgOBhN?=
 =?us-ascii?Q?pUyW2D/yKdnMjnq8exwqPQGu028lziCzD1B1V8ZF7tkLsMOcmtw+PA/OHbKt?=
 =?us-ascii?Q?jvD3sS40vmY98E/SKXDNK8IaqNeNLd6g5i2me3OLsoKraFvRkaGqvc5pCNnt?=
 =?us-ascii?Q?5oYjTISNnqLItWEpVxcqjpmfWSGmJKVrAPVwKypEDVrGZUPdjqAHUuJdJBe9?=
 =?us-ascii?Q?KLmQ16n2WZOIj9ycAr7e2+wuF5m0HN8jKabN4b8x03ptMillhayzsBHE9IMy?=
 =?us-ascii?Q?AM1GPWzUAnTAZYoaXW/yXT1ii1ki83IE7s4PRwcg1cxi4Z8cY3Z44XZlXmHR?=
 =?us-ascii?Q?kiEMZOwsXQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 74e3f12c-1818-44b4-0f47-08df35df9fbd
X-MS-Exchange-CrossTenant-AuthSource: DU0P189MB2250.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 17:11:08.4642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Gxo3DGeI/YjGPpQ/K9kwqj1MnWZeMt7nfu/1RLujKjvHy+nMZB1gKC8iRGgMVik/a+M5HPMwlfTlp2akZfzxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB3717
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 17:11:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248956
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix that makes sshd only store GSSAPI
credentials when authentication has succeeded, so credentials from a
failed GSSAPIAuthentication attempt cannot persist and be used after a
later authentication succeeds. The upstream fix commit is referenced
in [1], and the public CVE advisory is referenced in [2].

The vulnerable code is only built when PACKAGECONFIG contains kerberos.

[1] https://github.com/openssh/openssh-portable/commit/6f9cd19af05aa828d777=
8cfb047faaed1679e8b7
[2] https://www.cve.org/CVERecord?id=3DCVE-2026-106553

Signed-off-by: Benhur Tessele <benhur.tessele@est.tech>
---
 .../openssh/openssh/CVE-2026-106553.patch     | 88 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-1065=
53.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106553.patc=
h b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106553.patch
new file mode 100644
index 0000000000..02aea5b04a
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106553.patch
@@ -0,0 +1,88 @@
+From 6f9cd19af05aa828d7778cfb047faaed1679e8b7 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Wed, 16 Sep 2026 00:37:52 +0000
+Subject: [PATCH] upstream: Only store GSSAPI creds when authn succeeds
+
+Issue report and patch from Moritz Theile
+
+ok markus, deraadt
+
+OpenBSD-Commit-ID: 812bbd22b8dd5a1583094ab2b6ff0045e4088467
+
+CVE: CVE-2026-106553
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/com=
mit/6f9cd19af05aa828d7778cfb047faaed1679e8b7]
+
+Backport Changes:
+- Omitted the upstream OpenBSD RCS revision header updates in gss-serv.c
+  and ssh-gss.h because they do not apply to the OpenSSH 9.6p1 source
+  revision.
+- OpenSSH 9.6p1 does not have the server-side GSSAPIDelegateCredentials
+  check in ssh_gssapi_storecreds() (added upstream in 94bf1154), so the
+  new userok check is added at the start of the function without that
+  surrounding context.
+
+(cherry picked from commit 6f9cd19af05aa828d7778cfb047faaed1679e8b7)
+Signed-off-by: Benhur Tessele <benhur.tessele@est.tech>
+---
+ gss-serv.c | 13 ++++++++++---
+ ssh-gss.h  |  1 +
+ 2 files changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/gss-serv.c b/gss-serv.c
+index dc6d0d8e..817b8fe5 100644
+--- a/gss-serv.c
++++ b/gss-serv.c
+@@ -51,7 +51,7 @@ extern ServerOptions options;
+=20
+ static ssh_gssapi_client gssapi_client =3D
+     { GSS_C_EMPTY_BUFFER, GSS_C_EMPTY_BUFFER,
+-    GSS_C_NO_CREDENTIAL, NULL, {NULL, NULL, NULL, NULL}};
++    GSS_C_NO_CREDENTIAL, NULL, {NULL, NULL, NULL, NULL}, 0};
+=20
+ ssh_gssapi_mech gssapi_null_mech =3D
+     { NULL, NULL, {0, NULL}, NULL, NULL, NULL, NULL};
+@@ -279,6 +279,7 @@ ssh_gssapi_getclient(Gssctxt *ctx, ssh_gssapi_client *=
client)
+=20
+ 	gss_buffer_desc ename;
+=20
++	client->userok =3D 0;
+ 	client->mech =3D NULL;
+=20
+ 	while (supported_mechs[i]->name !=3D NULL) {
+@@ -331,6 +332,11 @@ ssh_gssapi_cleanup_creds(void)
+ void
+ ssh_gssapi_storecreds(void)
+ {
++	if (!gssapi_client.userok) {
++		debug_f("GSSAPI client was not authorized, doing nothing");
++		return;
++	}
++
+ 	if (gssapi_client.mech && gssapi_client.mech->storecreds) {
+ 		(*gssapi_client.mech->storecreds)(&gssapi_client);
+ 	} else
+@@ -375,9 +381,10 @@ ssh_gssapi_userok(char *user)
+ 		return 0;
+ 	}
+ 	if (gssapi_client.mech && gssapi_client.mech->userok)
+-		if ((*gssapi_client.mech->userok)(&gssapi_client, user))
++		if ((*gssapi_client.mech->userok)(&gssapi_client, user)) {
++			gssapi_client.userok =3D 1;
+ 			return 1;
+-		else {
++		} else {
+ 			/* Destroy delegated credentials if userok fails */
+ 			ssh_gssapi_cleanup_global_client();
+ 			return 0;
+diff --git a/ssh-gss.h b/ssh-gss.h
+index 082c77bc..9d90fe45 100644
+--- a/ssh-gss.h
++++ b/ssh-gss.h
+@@ -74,6 +74,7 @@ typedef struct {
+ 	gss_cred_id_t creds;
+ 	struct ssh_gssapi_mech_struct *mech;
+ 	ssh_gssapi_ccache store;
++	int userok;
+ } ssh_gssapi_client;
+=20
+ typedef struct ssh_gssapi_mech_struct {
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/reci=
pes-connectivity/openssh/openssh_9.6p1.bb
index c2089f37dc..ac5294c29f 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -48,6 +48,7 @@ SRC_URI =3D "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/p=
ortable/openssh-${PV}.tar
            file://CVE-2026-73282.patch \
            file://CVE-2026-73281.patch \
            file://CVE-2026-106555.patch \
+           file://CVE-2026-106553.patch \
            "
 SRC_URI[sha256sum] =3D "910211c07255a8c5ad654391b40ee59800710dd8119dd5362d=
e09385aa7a777c"
=20
