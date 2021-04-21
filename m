Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.87])
 by mx.groups.io with SMTP id smtpd.web10.12423.1619012654140046259
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Apr 2021 06:44:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=SWpHOOi0;
 spf=pass (domain: windriver.com, ip: 40.107.93.87, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MmplZ3n3bVLIOXDaY35L2f/coddwo7Hrc1n6CgRlW1+guUNv/eN4o5kD5JuCfGh2v0ECgsckLbGFOUOZTUL6/56T2hkCA4CRmLAilX/DIql1tK3VuIRtNHrBMkFmSWpDayXodKnUYTpkXI4KTYwidIIkym+yQAEYjdVTODVTPgc2ILW2KLJ7LQRfPv9FbD44wyj11BWQMQW61PF+iETxswZijSkInQ80PPk6X+E8zyNPSdLOee5aqgPx3vrLbTtQrRHsuqO+//msFGcuBFJ757wqaSfMaQ/Mz0DYl6eB1bLX7tHAwkE/PLArsqxvx8NqoGf9o/Dd6ONzLTzNZjI4wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eobrGYQlNklH6ZJJIfhJYDFUvp8g8YXqWDYeXc4UBxA=;
 b=h9Xmz4Wmm00TYKAr789jIbiOmuOvE8GU3jHD5Nxbc7MiwERjUXgVbVEnzARR+nc6xcVdNWjJ94LjaqWqDkZG6aVQycgIUlc7+EM2NB+fcaezyaYzNI24e9iemHYbPQOyTs0cpQNnCEveTkovyglKRnbzuYUowLyG6JfkMki1r3zh/g8gG77KJJx6ideRQlmlK+2wYvYDsD4r5skOXlQa3h1KrlBYbvPV1Of3kDjjT0kOw//1fIZj8OxT5TyhpgOqi+utVe3HszJ5WTZAjIzMxC3KfpGZddNyo6CYc7TTxHw+xu8NZPurKNKHwzSCSPQKaMsVc6VmafjD51ahP7TJPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eobrGYQlNklH6ZJJIfhJYDFUvp8g8YXqWDYeXc4UBxA=;
 b=SWpHOOi0dtykB9aYvbPh9dQvCz7s91D07dHmWoIy/2gRMVnACGucv+Q15ss8FXi4BLYpwG5g/WiZ11gyPdiI1jgcpaug3JwaZR+ICpinron90wcdT/9d/qWoeRN6sC4dk+TMpjyxmivtkohnQoGHeYttf1qy+Wzz4cjexa/nZKc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3814.namprd11.prod.outlook.com (2603:10b6:a03:fb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Wed, 21 Apr
 2021 13:44:12 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76%5]) with mapi id 15.20.4042.024; Wed, 21 Apr 2021
 13:44:12 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][hardknott][PATCH] nettle: fix CVE-2021-20305
Date: Wed, 21 Apr 2021 09:44:03 -0400
Message-ID: <20210421134403.2389496-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.30.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: SJ0PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::31) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-fedora2.wrs.com (128.224.252.2) by SJ0PR03CA0026.namprd03.prod.outlook.com (2603:10b6:a03:33a::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend Transport; Wed, 21 Apr 2021 13:44:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 668b4ff4-66d5-4d52-0a0b-08d904cb8b5b
X-MS-TrafficTypeDiagnostic: BYAPR11MB3814:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB381462B74DED52C1E8991B579F479@BYAPR11MB3814.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:151;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tzxnBhORrBCpCqlx2CM6Pg8WgVGqiAVp/hkAoJgTSI8FRLg4KPL0fTx3chPaCjrr0Dtxc1EUf4+T34tEbzLxXMZ/cIxCzFAiwIBmYlZW/v9A49z95KaGEyTQdP1UImeDoZ2T/sorBjeb4oV6C0iwHuNSibXdyooPvi5YuqI47q7sXcsAgegb0rTwKUz9X9yvvRVXZROnr5/qZGcaBrc9keDnm6AqhR0nCBE5e8E7YLBzJwnilRSzcSWUtB1BvHksJ9E3u0nUWQa96Z/aDiw7tmnrEM340Wopm9oZmxDTMBmj/Ujs4nMj3G+f+nXpGVjJiQ6mLMR7wceTxzwOOsYYJbD8/rKznsPD5TTa2VhW4WotaL4lDB3y2CjvDFIoOO9fkRk/UuwXU1cGRIxQiruLxVLMOx/KwyTkRaIM773zxWASD5lblyC9F1JOEP/RX54CQ3u4F41bByCxJyOy4/lfTj/pP0ZS2tWd+qegyXrkwnhbYCCU1cIrksBDdrXTYwXZIEWnD8dZ5z/YolV8pnQb5zQkjuUxdtbfhCtYczjvUb1tFyFDl8y2cvTuP8U3tTYyxpR3M8/Gr67C1Zbvm9w5w8l7oaQ8JsFSRO0e3lZzquOPAPPv0rU6m0zsFGvxjpjU5CmX6jDNDn6Vgyjvte3k6xrCmbMPtGUwnqgWltO000+GTv0xbCtPIStA0y7zjT+PPkLwqsclKhjCxQneuqo/Fpm208D7g6Cq5qpq+iVigns=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(396003)(136003)(366004)(376002)(346002)(956004)(30864003)(83380400001)(66476007)(5660300002)(186003)(66574015)(38350700002)(2906002)(38100700002)(86362001)(6512007)(36756003)(2616005)(1076003)(44832011)(6506007)(26005)(8676002)(66556008)(6916009)(6666004)(8936002)(478600001)(316002)(52116002)(6486002)(16526019)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?lsc4rQE9Bd4aOhJKM82WNZvDXPutfNKZS8HghkgE6aYiH1JMmlCQpW6xa2yL?=
 =?us-ascii?Q?9C4w8Y+qYuPYddf0Wvf1HgG/JHFxObm7Hz8CX/ZGF9d5c3rGotnl+upVnq7K?=
 =?us-ascii?Q?/2VCYDZkFAVkYoCpnTUQDLPE3J25p4aqp/4hHstiubNIAU6PL2kv3zhKFHwL?=
 =?us-ascii?Q?tZvmwb5ts4euhyRT/6nqNdp9zgSw7t3Ud1sm2j2fd1jhGhytrKXpp5jDvtSr?=
 =?us-ascii?Q?3mVzHYKgK1uy1cdBhv0/K/Ibyd5ixNHKz97nKHxMbvaX6ZfL/t/P5qD30jM6?=
 =?us-ascii?Q?Sm4AUeC02C2Cf+hXUayyuRRzx8cM1H1Zj86jE7g4TGp3LmkTR2Cv88/mhwAw?=
 =?us-ascii?Q?qc7S8lMOkdIhoRm60ALUa99xX4qHsDfq6nxCydcZqbM92tdi1O0+2WcS8DR3?=
 =?us-ascii?Q?Gk/WKqsXr2LG2IURwu/dL8PlxvHl432QHGeYZFBgU55/rjZP8f0/FrP5U04S?=
 =?us-ascii?Q?Cu1mraUECT4C2NWXCw9Tq+iM8kpr8tF0Y0qhSDs38LMY0g+eNQ33fD2DGOW6?=
 =?us-ascii?Q?Qlg6Qqs0pueTOEzER8MWRkD2I6LadFeB7GynidgmreX760wENGig6c6jsg/I?=
 =?us-ascii?Q?fOLKHEkQ5tvQvlDuJBq3bbOgM4b7abodt+i08pb0IkmEkE9M24/MaPHB4Awd?=
 =?us-ascii?Q?ndnGZjurAAvQLJzChDpA8oTAHEWQ/hgmC1bhZgoPKGdn8QOMCdTMuxFh7zLV?=
 =?us-ascii?Q?e/5L79LtmI84SAcQJ7GMpuvzaX45kbQs51tm9TWC5IZ9maeFZYQYttBHOnMR?=
 =?us-ascii?Q?BrC1wTFMTqTv6Pl2w/76xkCcG9ttE4tYtPCzoBf5q+vDdHDHgCXjNzycJsy8?=
 =?us-ascii?Q?BjGW6BXNhp6QB3Fe5/ZLMAVvA5hsAZSq8UpNXUkftzfoQTJ7bS52fz9g+7x7?=
 =?us-ascii?Q?xa+vWCQn+QqScAOkie7ZOttI4m167+pnPdzXs8dUjFRqrcSSorzxIwG3mT9l?=
 =?us-ascii?Q?Q4lVwH2/V3GvJrP8wp3tT88PV9QmU9omNyvANNVIBi8JV6XDFjytGhkS0YBB?=
 =?us-ascii?Q?LncKAkyEpx6Vpr+yx2bbcSD86ZZyFLwdpaqrVSEI9KAHw6sNug7IX7rlrDbI?=
 =?us-ascii?Q?XHNaT0peeVMCV9SwIO+iBN2+NljjnqkBjJXRluhGQBWAxUEeWOfATfscU71+?=
 =?us-ascii?Q?yol3gUybk5BT5RD1pHdCFWIYAv0y7WkfX8uLtDqVXGGhC0N2uKtd8yI7FYBz?=
 =?us-ascii?Q?m7A5mz0r/P+mKNcksTO4sboDmX6DaUzX1sHRKCMKSaHSxiA8mU+/tzD9llKi?=
 =?us-ascii?Q?cV2TMc5B1KDO7WEzCcB3fKII3BSKzkNRs71LWKTon2UXVK6PcVz7wN7YNYiQ?=
 =?us-ascii?Q?jtCLenLb8CqkBja9klk+sG9x?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 668b4ff4-66d5-4d52-0a0b-08d904cb8b5b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 13:44:11.8054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IHbVv9uv1ZHsYKXf1N6moMZvRMbUBDXDHKUb3KrV/wnPHR/nwWjUDnnICijq7xu+Y+OK395cKWDpVK4v/3VqWVZU/+HFzXJSKogOm8ajmrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3814
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Backport and combine multiple commits from 3.7.2 to address this CVE.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../nettle/nettle/CVE-2021-20305.patch        | 516 ++++++++++++++++++
 meta/recipes-support/nettle/nettle_3.7.1.bb   |   1 +
 2 files changed, 517 insertions(+)
 create mode 100644 meta/recipes-support/nettle/nettle/CVE-2021-20305.patch

diff --git a/meta/recipes-support/nettle/nettle/CVE-2021-20305.patch b/meta=
/recipes-support/nettle/nettle/CVE-2021-20305.patch
new file mode 100644
index 0000000000..b1065c705a
--- /dev/null
+++ b/meta/recipes-support/nettle/nettle/CVE-2021-20305.patch
@@ -0,0 +1,516 @@
+From 80e3d99afb5820d9b4ed807136ba32d57c4229a6 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <trevor.gamblin@windriver.com>
+Date: Wed, 21 Apr 2021 09:15:34 -0400
+Subject: [PATCH] CVE-2021-20305
+
+Backport the following fixes from nettle 3.7.2:
+
+https://git.lysator.liu.se/nettle/nettle/-/commit/a63893791280d441c7132934=
91da97c79c0950fe
+https://git.lysator.liu.se/nettle/nettle/-/commit/971bed6ab4b27014eb23085e=
8176917e1a096fd5
+https://git.lysator.liu.se/nettle/nettle/-/commit/74ee0e82b6891e090f207237=
50faeb19064e31b2
+https://git.lysator.liu.se/nettle/nettle/-/commit/51f643eee00e2caa65c8a2f5=
857f49acdf3ef1ce
+https://git.lysator.liu.se/nettle/nettle/-/commit/401c8d53d8a8cf1e79980e62=
bda3f946f8e07c14
+https://git.lysator.liu.se/nettle/nettle/-/commit/ae3801a0e5cce276c2709732=
14385c86048d5f7b
+https://git.lysator.liu.se/nettle/nettle/-/commit/63f222c60b03470c0005aa9b=
c4296fbf585f68b9
+
+CVE: CVE-2021-20305
+Upstream-Status: Backport
+
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+---
+ ChangeLog                     | 40 ++++++++++++++++++++++++++++++++++-
+ curve25519-eh-to-x.c          |  6 +-----
+ curve448-eh-to-x.c            |  5 +----
+ ecc-ecdsa-sign.c              |  3 +--
+ ecc-ecdsa-verify.c            |  4 ++--
+ ecc-eh-to-a.c                 | 12 ++---------
+ ecc-gostdsa-verify.c          |  6 +++---
+ ecc-internal.h                | 15 +++++++++++++
+ ecc-j-to-a.c                  | 15 +++----------
+ ecc-mod-arith.c               | 24 +++++++++++++++++++++
+ ecc-mul-m.c                   |  6 ++----
+ eddsa-hash.c                  | 10 ++++++---
+ eddsa-verify.c                |  9 ++------
+ gostdsa-vko.c                 |  2 +-
+ testsuite/ecdsa-sign-test.c   | 26 +++++++++++++++++++++++
+ testsuite/ecdsa-verify-test.c | 40 +++++++++++++++++++++++++++++++++++
+ 16 files changed, 169 insertions(+), 54 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index fd138d82..9ab52fab 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,18 @@
++2021-03-13  Niels M=C3=B6ller  <nisse@lysator.liu.se>
++
++	* eddsa-verify.c (equal_h): Use ecc_mod_mul_canonical.
++
++2021-03-11  Niels M=C3=B6ller  <nisse@lysator.liu.se>
++
++	* ecc-mod-arith.c (ecc_mod_mul_canonical, ecc_mod_sqr_canonical):
++	New functions.
++	* ecc-internal.h: Declare and document new functions.
++	* curve448-eh-to-x.c (curve448_eh_to_x): Use ecc_mod_sqr_canonical.
++	* curve25519-eh-to-x.c (curve25519_eh_to_x): Use ecc_mod_mul_canonical.
++	* ecc-eh-to-a.c (ecc_eh_to_a): Likewise.
++	* ecc-j-to-a.c (ecc_j_to_a): Likewise.
++	* ecc-mul-m.c (ecc_mul_m): Likewise.
++
+ 2021-02-17  Niels M=C3=B6ller  <nisse@lysator.liu.se>
+=20
+ 	* Released Nettle-3.7.1.
+@@ -316,11 +331,34 @@
+=20
+ 2020-11-02  Niels M=C3=B6ller  <nisse@lysator.liu.se>
+=20
++	* gostdsa-vko.c (gostdsa_vko): Use ecc_mod_mul_canonical to
++	compute the scalar used for ecc multiplication.
++
++	* eddsa-hash.c (_eddsa_hash): Ensure result is canonically
++	reduced. Two of the three call sites need that.
++
++	* ecc-gostdsa-verify.c (ecc_gostdsa_verify): Use ecc_mod_mul_canonical
++	to compute the scalars used for ecc multiplication.
++
++	* ecc-ecdsa-sign.c (ecc_ecdsa_sign): Ensure s output is reduced to
++	canonical range.
++
++	* ecc-ecdsa-verify.c (ecc_ecdsa_verify): Use ecc_mod_mul_canonical
++	to compute the scalars used for ecc multiplication.
++	* testsuite/ecdsa-verify-test.c (test_main): Add test case that
++	triggers an assert on 64-bit platforms, without above fix.
++	* testsuite/ecdsa-sign-test.c (test_main): Test case generating
++	the same signature.
++
++2021-03-13  Niels M=C3=B6ller  <nisse@lysator.liu.se>
++
+ 	* ecc-curve25519.c (ecc_mod_pow_252m3): Reduce scratch need.
+ 	(ecc_curve25519_inv): Likewise.
+ 	(ecc_curve25519_sqrt): Likewise.
+=20
+-2020-11-01  Niels M=C3=B6ller  <nisse@lysator.liu.se>
++	* eddsa-verify.c (equal_h): Use ecc_mod_mul_canonical.
++
++2021-03-11  Niels M=C3=B6ller  <nisse@lysator.liu.se>
+=20
+ 	* ecc-mod-arith.c (ecc_mod_mul, ecc_mod_sqr): Separate argument
+ 	for scratch area, reducing required size of result area. Update
+diff --git a/curve25519-eh-to-x.c b/curve25519-eh-to-x.c
+index f0f1920d..d90defda 100644
+--- a/curve25519-eh-to-x.c
++++ b/curve25519-eh-to-x.c
+@@ -53,7 +53,6 @@ curve25519_eh_to_x (mp_limb_t *xp, const mp_limb_t *p,
+ #define tp (scratch + 2*ecc->p.size)
+=20
+   const struct ecc_curve *ecc =3D &_nettle_curve25519;
+-  mp_limb_t cy;
+=20
+   /* If u =3D U/W and v =3D V/W are the coordinates of the point on the
+      Edwards curve we get the curve25519 x coordinate as
+@@ -69,10 +68,7 @@ curve25519_eh_to_x (mp_limb_t *xp, const mp_limb_t *p,
+   ecc->p.invert (&ecc->p, t1, t0, tp);
+  =20
+   ecc_mod_add (&ecc->p, t0, wp, vp);
+-  ecc_mod_mul (&ecc->p, t0, t0, t1, tp);
+-
+-  cy =3D mpn_sub_n (xp, t0, ecc->p.m, ecc->p.size);
+-  cnd_copy (cy, xp, t0, ecc->p.size);
++  ecc_mod_mul_canonical (&ecc->p, xp, t0, t1, tp);
+ #undef vp
+ #undef wp
+ #undef t0
+diff --git a/curve448-eh-to-x.c b/curve448-eh-to-x.c
+index 8f3f8c45..3b9bf3ec 100644
+--- a/curve448-eh-to-x.c
++++ b/curve448-eh-to-x.c
+@@ -52,7 +52,6 @@ curve448_eh_to_x (mp_limb_t *xp, const mp_limb_t *p, mp_=
limb_t *scratch)
+ #define tp (scratch + ecc->p.size)
+=20
+   const struct ecc_curve *ecc =3D &_nettle_curve448;
+-  mp_limb_t cy;
+=20
+   /* If u =3D U/W and v =3D V/W are the coordinates of the point on
+      edwards448 we get the curve448 x coordinate as
+@@ -62,10 +61,8 @@ curve448_eh_to_x (mp_limb_t *xp, const mp_limb_t *p, mp=
_limb_t *scratch)
+   /* Needs a total of 5*size storage. */
+   ecc->p.invert (&ecc->p, t0, up, tp);
+   ecc_mod_mul (&ecc->p, t0, t0, vp, tp);
+-  ecc_mod_sqr (&ecc->p, t0, t0, tp);
++  ecc_mod_sqr_canonical (&ecc->p, xp, t0, tp);
+=20
+-  cy =3D mpn_sub_n (xp, t0, ecc->p.m, ecc->p.size);
+-  cnd_copy (cy, xp, t0, ecc->p.size);
+ #undef up
+ #undef vp
+ #undef t0
+diff --git a/ecc-ecdsa-sign.c b/ecc-ecdsa-sign.c
+index f323196e..4adee1d1 100644
+--- a/ecc-ecdsa-sign.c
++++ b/ecc-ecdsa-sign.c
+@@ -91,9 +91,8 @@ ecc_ecdsa_sign (const struct ecc_curve *ecc,
+=20
+   ecc_mod_mul (&ecc->q, tp, zp, rp, tp);
+   ecc_mod_add (&ecc->q, hp, hp, tp);
+-  ecc_mod_mul (&ecc->q, tp, hp, kinv, tp);
++  ecc_mod_mul_canonical (&ecc->q, sp, hp, kinv, tp);
+=20
+-  mpn_copyi (sp, tp, ecc->p.size);
+ #undef P
+ #undef hp
+ #undef kinv
+diff --git a/ecc-ecdsa-verify.c b/ecc-ecdsa-verify.c
+index 1b2dcca7..f3b112b0 100644
+--- a/ecc-ecdsa-verify.c
++++ b/ecc-ecdsa-verify.c
+@@ -102,10 +102,10 @@ ecc_ecdsa_verify (const struct ecc_curve *ecc,
+=20
+   /* u1 =3D h / s, P1 =3D u1 * G */
+   ecc_hash (&ecc->q, hp, length, digest);
+-  ecc_mod_mul (&ecc->q, u1, hp, sinv, u1);
++  ecc_mod_mul_canonical (&ecc->q, u1, hp, sinv, u1);
+=20
+   /* u2 =3D r / s, P2 =3D u2 * Y */
+-  ecc_mod_mul (&ecc->q, u2, rp, sinv, u2);
++  ecc_mod_mul_canonical (&ecc->q, u2, rp, sinv, u2);
+=20
+    /* Total storage: 5*ecc->p.size + ecc->mul_itch */
+   ecc->mul (ecc, P2, u2, pp, u2 + ecc->p.size);
+diff --git a/ecc-eh-to-a.c b/ecc-eh-to-a.c
+index 24f6d0c0..5e3571c1 100644
+--- a/ecc-eh-to-a.c
++++ b/ecc-eh-to-a.c
+@@ -49,23 +49,15 @@ ecc_eh_to_a (const struct ecc_curve *ecc,
+ #define izp scratch
+ #define tp (scratch + ecc->p.size)
+=20
+-
+ #define xp p
+ #define yp (p + ecc->p.size)
+ #define zp (p + 2*ecc->p.size)
+=20
+-  mp_limb_t cy;
+-
+   assert(op =3D=3D 0);
+=20
+   /* Needs size + scratch for the invert call. */
+   ecc->p.invert (&ecc->p, izp, zp, tp);
+=20
+-  ecc_mod_mul (&ecc->p, tp, xp, izp, tp);
+-  cy =3D mpn_sub_n (r, tp, ecc->p.m, ecc->p.size);
+-  cnd_copy (cy, r, tp, ecc->p.size);
+-
+-  ecc_mod_mul (&ecc->p, tp, yp, izp, tp);
+-  cy =3D mpn_sub_n (r + ecc->p.size, tp, ecc->p.m, ecc->p.size);
+-  cnd_copy (cy, r + ecc->p.size, tp, ecc->p.size);
++  ecc_mod_mul_canonical (&ecc->p, r, xp, izp, tp);
++  ecc_mod_mul_canonical (&ecc->p, r + ecc->p.size, yp, izp, tp);
+ }
+diff --git a/ecc-gostdsa-verify.c b/ecc-gostdsa-verify.c
+index c0613f4f..fcdd4644 100644
+--- a/ecc-gostdsa-verify.c
++++ b/ecc-gostdsa-verify.c
+@@ -102,11 +102,11 @@ ecc_gostdsa_verify (const struct ecc_curve *ecc,
+   ecc->q.invert (&ecc->q, vp, hp, vp + ecc->p.size);
+=20
+   /* z1 =3D s / h, P1 =3D z1 * G */
+-  ecc_mod_mul (&ecc->q, z1, sp, vp, z1);
++  ecc_mod_mul_canonical (&ecc->q, z1, sp, vp, z1);
+=20
+   /* z2 =3D - r / h, P2 =3D z2 * Y */
+-  ecc_mod_mul (&ecc->q, z2, rp, vp, z2);
+-  mpn_sub_n (z2, ecc->q.m, z2, ecc->p.size);
++  mpn_sub_n (hp, ecc->q.m, rp, ecc->p.size);
++  ecc_mod_mul_canonical (&ecc->q, z2, hp, vp, z2);
+=20
+    /* Total storage: 5*ecc->p.size + ecc->mul_itch */
+   ecc->mul (ecc, P2, z2, pp, z2 + ecc->p.size);
+diff --git a/ecc-internal.h b/ecc-internal.h
+index 55c9be27..acfcb4d7 100644
+--- a/ecc-internal.h
++++ b/ecc-internal.h
+@@ -49,6 +49,8 @@
+ #define ecc_mod_submul_1 _nettle_ecc_mod_submul_1
+ #define ecc_mod_mul _nettle_ecc_mod_mul
+ #define ecc_mod_sqr _nettle_ecc_mod_sqr
++#define ecc_mod_mul_canonical _nettle_ecc_mod_mul_canonical
++#define ecc_mod_sqr_canonical _nettle_ecc_mod_sqr_canonical
+ #define ecc_mod_pow_2k _nettle_ecc_mod_pow_2k
+ #define ecc_mod_pow_2k_mul _nettle_ecc_mod_pow_2k_mul
+ #define ecc_mod_random _nettle_ecc_mod_random
+@@ -264,6 +266,19 @@ void
+ ecc_mod_sqr (const struct ecc_modulo *m, mp_limb_t *rp,
+ 	     const mp_limb_t *ap, mp_limb_t *tp);
+=20
++/* These mul and sqr functions produce a canonical result, 0 <=3D R < M.
++   Requirements on input and output areas are similar to the above
++   functions, except that it is *not* allowed to pass rp =3D rp +
++   m->size.
++ */
++void
++ecc_mod_mul_canonical (const struct ecc_modulo *m, mp_limb_t *rp,
++		       const mp_limb_t *ap, const mp_limb_t *bp, mp_limb_t *tp);
++
++void
++ecc_mod_sqr_canonical (const struct ecc_modulo *m, mp_limb_t *rp,
++		       const mp_limb_t *ap, mp_limb_t *tp);
++
+ /* R <-- X^{2^k} mod M. Needs 2*ecc->size limbs of scratch space, same
+    overlap requirements as mul and sqr above. */
+ void
+diff --git a/ecc-j-to-a.c b/ecc-j-to-a.c
+index 2d55b3a5..ac134b51 100644
+--- a/ecc-j-to-a.c
++++ b/ecc-j-to-a.c
+@@ -49,8 +49,6 @@ ecc_j_to_a (const struct ecc_curve *ecc,
+ #define iz3p (scratch + 2*ecc->p.size)
+ #define tp    scratch
+=20
+-  mp_limb_t cy;
+-
+   ecc->p.invert (&ecc->p, izp, p+2*ecc->p.size, izp + ecc->p.size);
+   ecc_mod_sqr (&ecc->p, iz2p, izp, iz2p);
+=20
+@@ -63,17 +61,13 @@ ecc_j_to_a (const struct ecc_curve *ecc,
+     }
+=20
+   /* r_x <-- x / z^2 */
+-  ecc_mod_mul (&ecc->p, iz3p, iz2p, p, iz3p);
+-  /* ecc_mod (and ecc_mod_mul) may return a value up to 2p - 1, so
+-     do a conditional subtraction. */
+-  cy =3D mpn_sub_n (r, iz3p, ecc->p.m, ecc->p.size);
+-  cnd_copy (cy, r, iz3p, ecc->p.size);
+-
++  ecc_mod_mul_canonical (&ecc->p, r, iz2p, p, iz3p);
+   if (op)
+     {
+       /* Skip y coordinate */
+       if (op > 1)
+ 	{
++	  mp_limb_t cy;
+ 	  /* Also reduce the x coordinate mod ecc->q. It should
+ 	     already be < 2*ecc->q, so one subtraction should
+ 	     suffice. */
+@@ -83,10 +77,7 @@ ecc_j_to_a (const struct ecc_curve *ecc,
+       return;
+     }
+   ecc_mod_mul (&ecc->p, iz3p, iz2p, izp, iz3p);
+-  ecc_mod_mul (&ecc->p, tp, iz3p, p + ecc->p.size, tp);
+-  /* And a similar subtraction. */
+-  cy =3D mpn_sub_n (r + ecc->p.size, tp, ecc->p.m, ecc->p.size);
+-  cnd_copy (cy, r + ecc->p.size, tp, ecc->p.size);
++  ecc_mod_mul_canonical (&ecc->p, r + ecc->p.size, iz3p, p + ecc->p.size,=
 tp);
+=20
+ #undef izp
+ #undef iz2p
+diff --git a/ecc-mod-arith.c b/ecc-mod-arith.c
+index 551f2c14..b3021d94 100644
+--- a/ecc-mod-arith.c
++++ b/ecc-mod-arith.c
+@@ -125,6 +125,30 @@ ecc_mod_sqr (const struct ecc_modulo *m, mp_limb_t *r=
p,
+   m->reduce (m, rp, tp);
+ }
+=20
++void
++ecc_mod_mul_canonical (const struct ecc_modulo *m, mp_limb_t *rp,
++		       const mp_limb_t *ap, const mp_limb_t *bp, mp_limb_t *tp)
++{
++  mp_limb_t cy;
++  mpn_mul_n (tp, ap, bp, m->size);
++  m->reduce (m, tp + m->size, tp);
++
++  cy =3D mpn_sub_n (rp, tp + m->size, m->m, m->size);
++  cnd_copy (cy, rp, tp + m->size, m->size);
++}
++
++void
++ecc_mod_sqr_canonical (const struct ecc_modulo *m, mp_limb_t *rp,
++		       const mp_limb_t *ap, mp_limb_t *tp)
++{
++  mp_limb_t cy;
++  mpn_sqr (tp, ap, m->size);
++  m->reduce (m, tp + m->size, tp);
++
++  cy =3D mpn_sub_n (rp, tp + m->size, m->m, m->size);
++  cnd_copy (cy, rp, tp + m->size, m->size);
++}
++
+ void
+ ecc_mod_pow_2k (const struct ecc_modulo *m,
+ 		mp_limb_t *rp, const mp_limb_t *xp,
+diff --git a/ecc-mul-m.c b/ecc-mul-m.c
+index a3355751..f0ceb924 100644
+--- a/ecc-mul-m.c
++++ b/ecc-mul-m.c
+@@ -48,7 +48,7 @@ ecc_mul_m (const struct ecc_modulo *m,
+ 	   mp_limb_t *scratch)
+ {
+   unsigned i;
+-  mp_limb_t cy, swap;
++  mp_limb_t swap;
+=20
+ #define x2 (scratch)
+ #define z2 (scratch + m->size)
+@@ -162,7 +162,5 @@ ecc_mul_m (const struct ecc_modulo *m,
+     }
+   assert (m->invert_itch <=3D 7 * m->size);
+   m->invert (m, x3, z2, z3 + m->size);
+-  ecc_mod_mul (m, z3, x2, x3, z3);
+-  cy =3D mpn_sub_n (qx, z3, m->m, m->size);
+-  cnd_copy (cy, qx, z3, m->size);
++  ecc_mod_mul_canonical (m, qx, x2, x3, z3);
+ }
+diff --git a/eddsa-hash.c b/eddsa-hash.c
+index 95e0dd70..6ebbe977 100644
+--- a/eddsa-hash.c
++++ b/eddsa-hash.c
+@@ -44,13 +44,14 @@
+ #include "ecc-internal.h"
+ #include "nettle-internal.h"
+=20
+-/* Convert hash digest to integer, and reduce modulo q, to m->size
+-   limbs. Needs space for 2*m->size + 1 at rp. */
++/* Convert hash digest to integer, and reduce canonically modulo q.
++   Needs space for 2*m->size + 1 at rp. */
+ void
+ _eddsa_hash (const struct ecc_modulo *m,
+ 	     mp_limb_t *rp, size_t digest_size, const uint8_t *digest)
+ {
+   mp_size_t nlimbs =3D (8*digest_size + GMP_NUMB_BITS - 1) / GMP_NUMB_BIT=
S;
++  mp_limb_t cy;
+=20
+   mpn_set_base256_le (rp, nlimbs, digest, digest_size);
+=20
+@@ -74,5 +75,8 @@ _eddsa_hash (const struct ecc_modulo *m,
+       hi =3D mpn_cnd_add_n (hi, rp + m->size, rp + m->size, m->B, m->size=
);
+       assert (hi =3D=3D 0);
+     }
+-  m->mod (m, rp, rp);
++  m->mod (m, rp + m->size , rp);
++  /* Ensure canonical reduction. */
++  cy =3D mpn_sub_n (rp, rp + m->size, m->m, m->size);
++  cnd_copy (cy, rp, rp + m->size, m->size);
+ }
+diff --git a/eddsa-verify.c b/eddsa-verify.c
+index de68f240..10d075ee 100644
+--- a/eddsa-verify.c
++++ b/eddsa-verify.c
+@@ -53,13 +53,8 @@ equal_h (const struct ecc_modulo *p,
+ #define t0 scratch
+ #define t1 (scratch + p->size)
+=20
+-  ecc_mod_mul (p, t0, x1, z2, t0);
+-  if (mpn_cmp (t0, p->m, p->size) >=3D 0)
+-    mpn_sub_n (t0, t0, p->m, p->size);
+-
+-  ecc_mod_mul (p, t1, x2, z1, t1);
+-  if (mpn_cmp (t1, p->m, p->size) >=3D 0)
+-    mpn_sub_n (t1, t1, p->m, p->size);
++  ecc_mod_mul_canonical (p, t0, x1, z2, t0);
++  ecc_mod_mul_canonical (p, t1, x2, z1, t1);
+=20
+   return mpn_cmp (t0, t1, p->size) =3D=3D 0;
+=20
+diff --git a/gostdsa-vko.c b/gostdsa-vko.c
+index a02d59a9..3dc42a1e 100644
+--- a/gostdsa-vko.c
++++ b/gostdsa-vko.c
+@@ -87,7 +87,7 @@ gostdsa_vko (const struct ecc_scalar *priv,
+   if (mpn_zero_p (UKM, size))
+     UKM[0] =3D 1;
+=20
+-  ecc_mod_mul (&ecc->q, TEMP, priv->p, UKM, TEMP); /* TEMP =3D UKM * priv=
 */
++  ecc_mod_mul_canonical (&ecc->q, TEMP, priv->p, UKM, TEMP); /* TEMP =3D =
UKM * priv */
+   ecc->mul (ecc, XYZ, TEMP, pub->p, scratch + 4*size); /* XYZ =3D UKM * p=
riv * pub */
+   ecc->h_to_a (ecc, 0, TEMP, XYZ, scratch + 5*size); /* TEMP =3D XYZ */
+   mpn_get_base256_le (out, bsize, TEMP, size);
+diff --git a/testsuite/ecdsa-sign-test.c b/testsuite/ecdsa-sign-test.c
+index b240a31b..ed7e22bc 100644
+--- a/testsuite/ecdsa-sign-test.c
++++ b/testsuite/ecdsa-sign-test.c
+@@ -58,6 +58,32 @@ test_ecdsa (const struct ecc_curve *ecc,
+ void
+ test_main (void)
+ {
++  /* Producing the signature for corresponding test in
++     ecdsa-verify-test.c, with special u1 and u2. */
++  test_ecdsa (&_nettle_secp_224r1,
++	      "99b5b787484def12894ca507058b3bf5"
++	      "43d72d82fa7721d2e805e5e6",
++	      "2",
++	      SHEX("cdb887ac805a3b42e22d224c85482053"
++		   "16c755d4a736bb2032c92553"),
++	      "706a46dc76dcb76798e60e6d89474788"
++	      "d16dc18032d268fd1a704fa6", /* r */
++	      "3a41e1423b1853e8aa89747b1f987364"
++	      "44705d6d6d8371ea1f578f2e"); /* s */
++
++  /* Producing the signature for corresponding test in
++     ecdsa-verify-test.c, with special u1 and u2. */
++  test_ecdsa (&_nettle_secp_224r1,
++	      "99b5b787484def12894ca507058b3bf5"
++	      "43d72d82fa7721d2e805e5e6",
++	      "2",
++	      SHEX("cdb887ac805a3b42e22d224c85482053"
++		   "16c755d4a736bb2032c92553"),
++	      "706a46dc76dcb76798e60e6d89474788"
++	      "d16dc18032d268fd1a704fa6", /* r */
++	      "3a41e1423b1853e8aa89747b1f987364"
++	      "44705d6d6d8371ea1f578f2e"); /* s */
++
+   /* Test cases for the smaller groups, verified with a
+      proof-of-concept implementation done for Yubico AB. */
+   test_ecdsa (&_nettle_secp_192r1,
+diff --git a/testsuite/ecdsa-verify-test.c b/testsuite/ecdsa-verify-test.c
+index 3ceac0eb..edcd32ea 100644
+--- a/testsuite/ecdsa-verify-test.c
++++ b/testsuite/ecdsa-verify-test.c
+@@ -81,6 +81,46 @@ test_ecdsa (const struct ecc_curve *ecc,
+ void
+ test_main (void)
+ {
++  /* Corresponds to nonce k =3D 2 and private key z =3D
++     0x99b5b787484def12894ca507058b3bf543d72d82fa7721d2e805e5e6. z and
++     hash are chosen so that intermediate scalars in the verify
++     equations are u1 =3D 0x6b245680e700, u2 =3D
++     259da6542d4ba7d21ad916c3bd57f811. These values require canonical
++     reduction of the scalars. Bug caused by missing canonical
++     reduction reported by Guido Vranken. */
++  test_ecdsa (&_nettle_secp_224r1,
++	      "9e7e6cc6b1bdfa8ee039b66ad85e5490"
++	      "7be706a900a3cba1c8fdd014", /* x */
++	      "74855db3f7c1b4097ae095745fc915e3"
++	      "8a79d2a1de28f282eafb22ba", /* y */
++
++	      SHEX("cdb887ac805a3b42e22d224c85482053"
++		   "16c755d4a736bb2032c92553"),
++	      "706a46dc76dcb76798e60e6d89474788"
++	      "d16dc18032d268fd1a704fa6", /* r */
++	      "3a41e1423b1853e8aa89747b1f987364"
++	      "44705d6d6d8371ea1f578f2e"); /* s */
++
++  /* Corresponds to nonce k =3D 2 and private key z =3D
++     0x99b5b787484def12894ca507058b3bf543d72d82fa7721d2e805e5e6. z and
++     hash are chosen so that intermediate scalars in the verify
++     equations are u1 =3D 0x6b245680e700, u2 =3D
++     259da6542d4ba7d21ad916c3bd57f811. These values require canonical
++     reduction of the scalars. Bug caused by missing canonical
++     reduction reported by Guido Vranken. */
++  test_ecdsa (&_nettle_secp_224r1,
++	      "9e7e6cc6b1bdfa8ee039b66ad85e5490"
++	      "7be706a900a3cba1c8fdd014", /* x */
++	      "74855db3f7c1b4097ae095745fc915e3"
++	      "8a79d2a1de28f282eafb22ba", /* y */
++
++	      SHEX("cdb887ac805a3b42e22d224c85482053"
++		   "16c755d4a736bb2032c92553"),
++	      "706a46dc76dcb76798e60e6d89474788"
++	      "d16dc18032d268fd1a704fa6", /* r */
++	      "3a41e1423b1853e8aa89747b1f987364"
++	      "44705d6d6d8371ea1f578f2e"); /* s */
++
+   /* Test case provided by Guido Vranken, from oss-fuzz */
+   test_ecdsa (&_nettle_secp_192r1,
+ 	      "14683086 f1734c6d e68743a6 48181b54 a74d4c5b 383eb6a8", /* x */
+--=20
+2.30.2
+
diff --git a/meta/recipes-support/nettle/nettle_3.7.1.bb b/meta/recipes-sup=
port/nettle/nettle_3.7.1.bb
index 3bbcf17c7a..0e2bd2a7e1 100644
--- a/meta/recipes-support/nettle/nettle_3.7.1.bb
+++ b/meta/recipes-support/nettle/nettle_3.7.1.bb
@@ -18,6 +18,7 @@ SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://Add-target-to-only-build-tests-not-run-them.patch \
            file://run-ptest \
            file://check-header-files-of-openssl-only-if-enable_.patch \
+           file://CVE-2021-20305.patch \
            "
=20
 SRC_URI_append_class-target =3D "\
--=20
2.30.2

