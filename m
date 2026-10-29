Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17044.1793293869501862070
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 10:11:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Jb+2kGy5;
 spf=pass (domain: est.tech, ip: 52.101.69.68, mailfrom: benhur.tessele@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KfWbV6fDcQ/eXiRce2lDKhkMMHAWEg96m80jLZOOvop6Xhj6y0EjEvnYHz+v9oKs+TvnXJr923UAuiHarXC4FRqBnDBlcmORb47XykaUI7KQEVr0DDLjOfdWy7I7CeXJ3mLhwJrADLpL6oNsPkCuEQFT7ID+V9g1FxRBwYkTWDJcKQLpemGv2ckBfLfXeYsmCEASNKpRppJzM7MccMrvlyI9pViQBHCpQrLB7LFWoFCqNs0KLIDP1YDFTniyudWlXGR9NH+WEoYxflozTi0x/R2WuuNS1NJh0Y1Un8FbsnpfnKRM8aZyLT5b0QHXTbjQRkY89R8lOa7IfZx0Lrp6VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKlX5tX2HE0nKzIT17GWcmSU5GQgUGRMfIYwDizgoPI=;
 b=St1MwCFrSAJSJydbsX4K15KmrwtqaRXk3COyijB7cYvfL8wmkSEXWf54gd/uNy7lZnzq6I0K6pSxCsUS1Fsk4EKNU3XoBZfRoytRpTQ3Jpc3mkRbKjmeZKXvj1AOsjblgbHX1iHGGa5C6Q85EcgrP+bsf+QT48NE804fyjdc+PHxDEEww7Z4q2pJ+fpWx4e6VTmNGs3VDd+2KgxBJQFwIomytAu1qb1RVetc9LfBDO/Ee9yqnMuEWWHyiUmX/fWCEv/O0OWrgmqapgO+vzuY3ddZB9LdX8cIpdTRYny29jMd36QzGom0UcY0TSd/KPVoznC1OyObws5FywWxb3g8Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKlX5tX2HE0nKzIT17GWcmSU5GQgUGRMfIYwDizgoPI=;
 b=Jb+2kGy5SqLlA2QweXWXnkx5l5D/4vgQLUHYngfuYESCABIOXUE+FseSepWhshkplJIPJmLGFvPceFROMqTinnYzM7sZ85I5DX0E8g72nD6q/Fi+NvXIEP75s/I1nbL63uVYlkucxJ9kJniArY3XUhY9oJtLC2o/t98F+ME9FySz719j0SMVm1yNh/eMLnQ6qCcXtwTxJ4CPsuqvinGOxiIjo3Dbe6V5DVgKT51Lsg/v3OVzG2+m3604OvvxZraLutBZAEMXoitXo8esVLFm8UlhypN3WimDy0SwRTDKBfzDXz4juR5s3iGFr9NnLlTRjwj90lMBHDLhhr9fmbtSeg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU0P189MB2250.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3e2::15)
 by DB9P189MB3717.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5fb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 17:11:06 +0000
Received: from DU0P189MB2250.EURP189.PROD.OUTLOOK.COM
 ([fe80::9be2:1092:4622:e248]) by DU0P189MB2250.EURP189.PROD.OUTLOOK.COM
 ([fe80::9be2:1092:4622:e248%5]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 17:11:06 +0000
From: Benhur Tessele <benhur.tessele@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Benhur Tessele <benhur.tessele@est.tech>
Subject: [scarthgap][PATCH 1/2] openssh: fix CVE-2026-106555
Date: Thu, 29 Oct 2026 18:10:56 +0100
Message-ID: <20261029171057.15032-2-benhur.tessele@est.tech>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029171057.15032-1-benhur.tessele@est.tech>
References: <20261029171057.15032-1-benhur.tessele@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MA2P292CA0001.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:1::17) To DU0P189MB2250.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:3e2::15)
Return-Path: benhur.tessele@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0P189MB2250:EE_|DB9P189MB3717:EE_
X-MS-Office365-Filtering-Correlation-Id: bf8da179-21dd-4a6f-1deb-08df35df9e4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|6133799003|12006099003|3023799007|29003799003|22082099003|18002099003|25016099003|13003099007|56012099006|11063799006|10067099003|261028144727099003|261021121427099003|261021123027099003|261022113327099003|261022105027099003|261009223027099003|261026121527099003|261026140227099003|260925021911599003|260925022911599003|260925021311599003;
X-Microsoft-Antispam-Message-Info: kuxRGY3/vMbw5Mj4eBkQBfsRJFTGMToDQz8DJ2lJOWWk3wFDWYxQ4yYzZ8MuUf/fXm1K6nDP9aZWs44IrAUOztAj/ac7Roydd42/ZXQPw/5617sBvNMBrGN4i9ZiQ+M1wr+UmmajOva+GUmyBpcn5oaXtrP3CdvDqIIsUyesKv3foO8d6TEu+sS3KO/i/K+ruOdLla6z8EHy1c0zQJem7jQ96pS48eP8UpT6ojb7EG+d0twUJ3Lqp+DbQV0e+zJ5UKp8+Hq3NUnq+SAveSJn/iHFy/NKTBIw3Gp43gAv8YMnw6AXPw6FCmUdVGq1ejqd6HvtVISYm4Z30fn7D3XOVzVneYcAf1p6f5fnUdAGlPZx64gh6M7Pd5Sq+Yi/gDSRqJdCeKHE/1P5Ubp3AlBi/veJTaiy01zUu6G90T/ydmZBO9xIqrKq05Cexapdmv9wn7mETesD/O0cmx+iBDwlplWHJxYFLn/kpPv03E8bjJdx3BKPagqbfzyfNFAOv1PHgCVW/9Ao1yk0Y+bGbH/LJsyoNrbJF4VxKJ56liTUjnZV0bi213bWlBBMywFa+XQeamSHNDxGg2ed2lx1RMyssMt2UsRs9psJWtb/Ol+Db7l4UOD8G7/m12Mz0ELSendz
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0P189MB2250.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(6133799003)(12006099003)(3023799007)(29003799003)(22082099003)(18002099003)(25016099003)(13003099007)(56012099006)(11063799006)(10067099003)(261028144727099003)(261021121427099003)(261021123027099003)(261022113327099003)(261022105027099003)(261009223027099003)(261026121527099003)(261026140227099003)(260925021911599003)(260925022911599003)(260925021311599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vcdzIxdzpowzvO0Xl/mytGUdQqoGozf2WCBxgdJ7xvtSU5hRWmFa0g7yfpq2?=
 =?us-ascii?Q?Ycn8gS798v3MTJURjhfny81Pu17HLbTyqWyQoQV2FLThDF9DvmMrHpnId8Pc?=
 =?us-ascii?Q?6IPtW8/Lq3A2iEFZKs5pt4CLJ5qm10CvSDr7+MMsv5jLnFquUcRemmCyrN7m?=
 =?us-ascii?Q?Ssj6mCRjcZ1K3vF2YCq9tTgXaIMp2NoPg990vwzu1UUjbFqmZVofltqluzr5?=
 =?us-ascii?Q?hcob4SZJhvD+Fh/CdTe3SFXExg/DAZ8jTs+9UGWrGHwMd/hZcW+VJZn//wTh?=
 =?us-ascii?Q?PhXcUejiApETVLXN5mKCXXqjzvDJ6c6bZ9xm8MjPB7rnHUGUO0WDwkPSJ8zf?=
 =?us-ascii?Q?BvWk9TjcWxfdluIOSnNKQvQAZL0Int3m3yq02MItII5se4swAYhbODNWDE5E?=
 =?us-ascii?Q?MQkdd72kaHdbpZZbmRS4JLbPwWq9FlRDy4b7F5apmukdGsOKrPiHEAoKR/yH?=
 =?us-ascii?Q?g4oImz+UA1uIyM/r1fkBA6MYSRlp8SyM4x/qcBkfKifJWkCrDujZIuMi0F4i?=
 =?us-ascii?Q?615O+Th9j9Yh2FkrXgexCqZw0i8YjloI+E33YMO0wtmwhSiUe9aY3W7dwNcj?=
 =?us-ascii?Q?Cl9DIsW614pjhYWjKI/NWnbxAd/CXKWA0GryFOe/n9znpuaQUTD423z6QDaJ?=
 =?us-ascii?Q?Sf6ZmTEJWIMENO7kklUFR8gohwl7oFuWt3CREblE/refH4eczYJmropycJly?=
 =?us-ascii?Q?EpF4g7V3CdMQpF5KgwWN8+543gkwkN2t1KwlNAUDsH55oSFMCaVc9fvHX1dZ?=
 =?us-ascii?Q?XgtecKT5YtFreRif89esmhR4szl+wyhj2kHy1DKgGoMPBWIMexrTHSdaO7wO?=
 =?us-ascii?Q?WPOezsH9/L671bSnMoosYYaC0brZE4eOkuKkNC/wW4gcJ/R6xI8g8dA0bj+p?=
 =?us-ascii?Q?FmDBMylSQnwJ1SzHhaagUHuJ2A3AXDvLOY0HvBy9SZDrJTMG7q597D8A/7ti?=
 =?us-ascii?Q?iP9x9C/5U4L33NwlzeZHtlpg1rBmQCWn+VcJYGBnIVlFzBVy07/EGq9GVyS+?=
 =?us-ascii?Q?/OuRtVnh5VxqkiEz4tMxYuSjUJVPvpbu07ZK/pCYDjN3p7FbYKIya//Q/jE8?=
 =?us-ascii?Q?fuopsLOvFPl3bhEKDRoSf673Ig/UORb2HsmCnJ6BOrmyRvsHVp4TKsNpogh7?=
 =?us-ascii?Q?gfeSRGXF9p/6nD8IcFdghXReybWJt+o/VA6sKlOURAUGimaIn4Wuw1lVVEqn?=
 =?us-ascii?Q?IUhvV0QgPXQ0k/YeC9xKIginlRFdm4E2vXnSdv5M7G1ApjY/l7CgYl0lImFR?=
 =?us-ascii?Q?CU32SMZztMDSMDiRcU6S/AWK7etYhT8XNIv+xDV1COjN9LD87DlqKcwEQd9j?=
 =?us-ascii?Q?2ci87GhQm6DtP6wYixl81nuLg+V0Sm/dD66LMI4TSNjhOnH0eKioZr1TTRVH?=
 =?us-ascii?Q?7xtOzI8ciujwcDm6HTE+041zLMtuNyzGxYQf3oLJBmkDCdKy5iYuagN8hjjq?=
 =?us-ascii?Q?8qsUZnOuw10SpKrlbsU498FiRDC7f3ewfgu+czHXD0b3J8hXuqe8jNwqNaaI?=
 =?us-ascii?Q?0mVzb0dfoSbSH6infoOu7OxpT8It+1PEgGSSpI6Iw6nAbR08Qq8IHLWnhyZq?=
 =?us-ascii?Q?ZCquXHyc1V+rr7Liktq67Osa5E4gPgaIaEbdzvrWvwWDg/qI2NABfx/9O1+m?=
 =?us-ascii?Q?xVcq1zkuVwkvIIZEHIfiNGTqkW70gLVzNi0k9v2ma+lUqmsyLAqAwmdZgivf?=
 =?us-ascii?Q?oLMtZ7YHaIdTm1oxffXRe8gWuZ0fNPRiR8NA5RldoNARnIQGkDs9Mzkef82O?=
 =?us-ascii?Q?bHa38SWm8Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: bf8da179-21dd-4a6f-1deb-08df35df9e4b
X-MS-Exchange-CrossTenant-AuthSource: DU0P189MB2250.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 17:11:06.0338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZHmrvfGMjelK9MCituBUtJln10k0nKJd6HLP9y6lQGX+sfKxLsx07xNQ+Dmg0m7mY77C+qn0JfFxaVOjdDLyjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB3717
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 17:11:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248955
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix that makes sshd reset the GSSAPI
client state before each authentication attempt, so state from a
partially-completed GSSAPIAuthentication attempt cannot be used by a
later attempt. The upstream fix commit is referenced
in [1], and the public CVE advisory is referenced in [2].

The vulnerable code is only built when PACKAGECONFIG contains kerberos.

[1] https://github.com/openssh/openssh-portable/commit/670510d1e190b0f4e470=
66f24498c04ada1da0f0
[2] https://www.cve.org/CVERecord?id=3DCVE-2026-106555

Signed-off-by: Benhur Tessele <benhur.tessele@est.tech>
---
 .../openssh/openssh/CVE-2026-106555.patch     | 109 ++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |   1 +
 2 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-1065=
55.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106555.patc=
h b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106555.patch
new file mode 100644
index 0000000000..f310525a79
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106555.patch
@@ -0,0 +1,109 @@
+From 670510d1e190b0f4e47066f24498c04ada1da0f0 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Wed, 16 Sep 2026 00:37:07 +0000
+Subject: [PATCH] upstream: Reset GSSAPI client state before authentication
+
+Avoids situation where a partially-completed GSSAPI authentication attempt
+can retain state that is subsequently used by a later attempt.
+
+Report and feedback Moritz Theile, also reported by several others.
+
+ok markus, deraadt
+
+OpenBSD-Commit-ID: 95758f23e358b7c19e6205ac1c979193a9145556
+
+CVE: CVE-2026-106555
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/com=
mit/670510d1e190b0f4e47066f24498c04ada1da0f0]
+
+Backport Changes:
+- Omitted the upstream OpenBSD RCS revision header updates in auth2.c,
+  gss-serv.c, monitor.c and ssh-gss.h because they do not apply to the
+  OpenSSH 9.6p1 source revision.
+
+(cherry picked from commit 670510d1e190b0f4e47066f24498c04ada1da0f0)
+Signed-off-by: Benhur Tessele <benhur.tessele@est.tech>
+---
+ auth2.c    |  1 +
+ gss-serv.c | 19 ++++++++++++-------
+ monitor.c  |  2 ++
+ ssh-gss.h  |  1 +
+ 4 files changed, 16 insertions(+), 7 deletions(-)
+
+diff --git a/auth2.c b/auth2.c
+index 271789a7..ba5d9a78 100644
+--- a/auth2.c
++++ b/auth2.c
+@@ -332,6 +332,7 @@ input_userauth_request(int type, u_int32_t seq, struct=
 ssh *ssh)
+ 	auth2_challenge_stop(ssh);
+=20
+ #ifdef GSSAPI
++	ssh_gssapi_cleanup_global_client();
+ 	/* XXX move to auth2_gssapi_stop() */
+ 	ssh_dispatch_set(ssh, SSH2_MSG_USERAUTH_GSSAPI_TOKEN, NULL);
+ 	ssh_dispatch_set(ssh, SSH2_MSG_USERAUTH_GSSAPI_EXCHANGE_COMPLETE, NULL);
+diff --git a/gss-serv.c b/gss-serv.c
+index 00e3d118..dc6d0d8e 100644
+--- a/gss-serv.c
++++ b/gss-serv.c
+@@ -354,12 +354,21 @@ ssh_gssapi_do_child(char ***envp, u_int *envsizep)
+ 	}
+ }
+=20
++void
++ssh_gssapi_cleanup_global_client()
++{
++	OM_uint32 lmin;
++
++	gss_release_buffer(&lmin, &gssapi_client.displayname);
++	gss_release_buffer(&lmin, &gssapi_client.exportedname);
++	gss_release_cred(&lmin, &gssapi_client.creds);
++	explicit_bzero(&gssapi_client, sizeof(ssh_gssapi_client));
++}
++
+ /* Privileged */
+ int
+ ssh_gssapi_userok(char *user)
+ {
+-	OM_uint32 lmin;
+-
+ 	if (gssapi_client.exportedname.length =3D=3D 0 ||
+ 	    gssapi_client.exportedname.value =3D=3D NULL) {
+ 		debug("No suitable client data");
+@@ -370,11 +379,7 @@ ssh_gssapi_userok(char *user)
+ 			return 1;
+ 		else {
+ 			/* Destroy delegated credentials if userok fails */
+-			gss_release_buffer(&lmin, &gssapi_client.displayname);
+-			gss_release_buffer(&lmin, &gssapi_client.exportedname);
+-			gss_release_cred(&lmin, &gssapi_client.creds);
+-			explicit_bzero(&gssapi_client,
+-			    sizeof(ssh_gssapi_client));
++			ssh_gssapi_cleanup_global_client();
+ 			return 0;
+ 		}
+ 	else
+diff --git a/monitor.c b/monitor.c
+index b3ed515e..2d563197 100644
+--- a/monitor.c
++++ b/monitor.c
+@@ -1840,6 +1840,8 @@ mm_answer_gss_setup_ctx(struct ssh *ssh, int sock, s=
truct sshbuf *m)
+ 	if (!options.gss_authentication)
+ 		fatal_f("GSSAPI authentication not enabled");
+=20
++	ssh_gssapi_cleanup_global_client();
++
+ 	if ((r =3D sshbuf_get_string(m, &p, &len)) !=3D 0)
+ 		fatal_fr(r, "parse");
+ 	goid.elements =3D p;
+diff --git a/ssh-gss.h b/ssh-gss.h
+index a8af117d..082c77bc 100644
+--- a/ssh-gss.h
++++ b/ssh-gss.h
+@@ -133,6 +133,7 @@ void ssh_gssapi_do_child(char ***, u_int *);
+ void ssh_gssapi_cleanup_creds(void);
+ void ssh_gssapi_storecreds(void);
+ const char *ssh_gssapi_displayname(void);
++void ssh_gssapi_cleanup_global_client();
+=20
+ #endif /* GSSAPI */
+=20
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/reci=
pes-connectivity/openssh/openssh_9.6p1.bb
index 6c8138ddd8..c2089f37dc 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -47,6 +47,7 @@ SRC_URI =3D "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/p=
ortable/openssh-${PV}.tar
            file://CVE-2026-73283.patch \
            file://CVE-2026-73282.patch \
            file://CVE-2026-73281.patch \
+           file://CVE-2026-106555.patch \
            "
 SRC_URI[sha256sum] =3D "910211c07255a8c5ad654391b40ee59800710dd8119dd5362d=
e09385aa7a777c"
=20
