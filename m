Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E441073C85
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 09:44:03 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.102326.1775641442687079669
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 02:44:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=n6zsKBVb;
 spf=pass (domain: siemens.com, ip: 40.107.162.57, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S77XGOi/gT063hg4uGaktYZwGGFZ3yzBcQa6U3Pz5aq40a4eGN2MkZW/kJfCzTiZUg+3Jl4cOpmcHODD7yA9qne9jDMpc12jCsYRvmE8MTeCRehYrKrLKNhCPm4+pOBNScGCaDyRWLGHcnYrfny1zyYwlBI1wsA9LcrysKeNe1cW4Zl/pniZgExfd9d8ofZ0psjM1MWkBYeiwuZYszR7yqttJbMuNbtx1OpMeXN1Mytm9XZWet+AlekW7HbUKOPnpZ5KqcEYE7ZfINtRCNl5oP6/iVHWriDnsrH060efyyO8wAgNX3IIwQzDOnqm70gthayIYKj7oDCRdweqgnDjBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RC2hBQxD3k+Rb3whzrioaAOqImmBNLmd0/61Iv9pcro=;
 b=cucXfCghuxjHG5KEnnATmqmB18Z6+tQfoA/1/8s0ZOrlXIQ9mhGGOtZOCogjrzR6BI+aPNlTRdlnEjMsivpb8JeNZRU/he9v+XC0s0BNZVZtLt+q+cKZqbiFCclc7bv/E5fr3i8Lf4p3SBoCrhnqtmidekHS7hSAsADeUa/rV5h+/PQGr6uWef7jSWLQYhBCLUm9DqcgUkC0RHgH/ceWaDn/jqna9qZj+CDIuHeweizAEaFG+OwbkmSw5qnD4kvB2LlQV98mRMhaWRMMqOd80nomNkQqp+R+8JzCX5cTUdReXZrwC7LmlpXM4/x21GxdvpOZYPM5pztqbxp1LhIRMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RC2hBQxD3k+Rb3whzrioaAOqImmBNLmd0/61Iv9pcro=;
 b=n6zsKBVbfC206x944MaowbW/0og9/YZBlt+st9jt4/fgc987794p9yXyjIntzOwXoM3+hKhuWYdmBba9fchkMGrDQTSmvi5fCzmyDrSfVj45wtoiyzmlJDKu9HYKhGgyZmdon4c+dfrFbNUKVPB0IyvgBOXMlPybv1WP8HVWibN9sD3wO34ufTOX1CP8pRe9+e2MPBup2FUHca182LjRUCnPQpdJriB7Rgo5fXrZ95eT/nmCJka5DxLVIQh9/I/kzc9YmyI6xIhuUrbDFxRxic+J7kPulw+j7n0u+v8u+PjjcaE3sz3QBXFC47wt2gG93FCusYXKHPtTWFiO2EZxWA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB3PR10MB6787.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:437::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 09:43:57 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9769.014; Wed, 8 Apr 2026
 09:43:57 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "Hemanth.KumarMD@windriver.com" <Hemanth.KumarMD@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Sundeep.Kokkonda@windriver.com" <Sundeep.Kokkonda@windriver.com>
Subject: RE: [OE-core] [PATCH] glibc: stable 2.43 branch updates
Thread-Topic: [OE-core] [PATCH] glibc: stable 2.43 branch updates
Thread-Index: AQHcxziI8xa8a4SUIESX7s31dwtSGrXU6HaA
Date: Wed, 8 Apr 2026 09:43:57 +0000
Message-ID: 
 <AS1PR10MB569768761FDC2B42687AA6ABFD5BA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260408091626.3423299-1-Hemanth.KumarMD@windriver.com>
In-Reply-To: <20260408091626.3423299-1-Hemanth.KumarMD@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=d720fcaa-a73a-47cf-8da6-d275b21d79d2;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-04-08T09:38:27Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB3PR10MB6787:EE_
x-ms-office365-filtering-correlation-id: 269edf40-83f0-48e2-9aa7-08de95535aca
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|55112099003|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: 
 b9U0Q+lqWSCiTVxOz+dAHtZaPTG+OVJS3JM9bZYITEaR8rPLqyh3X8KEoO08t4LhtQZLKHzYmBpnJ6EU0wIusUV/l7DX6hON2v/GouaHBywQXc5y2cE4eb1liXXAHtuDq7rudMzB3zpIZP8E321x4nB4fc0dYGYevdtB/NxcUpEY51a5im71qTf9trd8vi/+l1aqWrmCq+iSA0AqUJmcXgsSCHlxe1wMyAFyCmN8NSvWb96YpGbtF7fVwl0qjvkiTdwclgRMrtEEt1IYSqBaArJuNW54IWNCqznYFDLWSy8pRvK+VDmMgHaAZE0c25blQUQ4uvISrP1KOLF7xOWLQWdAZUXuEGC4JK7BUwppvc0HEREkiAb96ePCnL00e0vceBP45ql4HLMpdtPV0baS2J1SvnhRFdOan70VKbjubdNVbYxMQ1iymErrN4FMOGIP8OrNY05Xf9AR1azWpJgtw3HIctzEP5X6NsykAhtJiIjL3tc2zhFcbsZsoJ63EX6LBC29e21dEJ14GAHOT5TzyZmMHdC7kA60jtGn73a4GLxdK1+T8PP8artmeHOlyAcOtCbJ2nYhoKTzyg+FV2FL8cUhg/FKuSuvQ4zglJiaDFtcWA1xvCUVYQHMf6MfCsC6LpseJLGRSeq7v6PY3y5Xb5BKnbk51wortlzlDvEjBUYOnn4WOa8ix31qZwkgz2KCho49+AqWSMLiEBHrvt9L2voOl2Iqe8pGzxGnPFuGoai8PJjR+z6HQGgNE5spq3VcZQXJG1n2p6UOi5C2wWnIgFBJvlRKis83UmfhnwzFleU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(55112099003)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?eMCHb+HvNseXRWZu40GwAnWt46FGgSu4ZK/t8+4QXnEmp0Jlg49Us30CGf2R?=
 =?us-ascii?Q?FCzjUCPuxVSznUFRrAXWQK4YDouZsDyTq7eEi/0Ij10PUJ8ksV6SLTlPawb/?=
 =?us-ascii?Q?T12YS4ETv86zuPXKX3a+5f702chE6kjP58mkzpkeXH0p3mNy2CTtY2lgowqs?=
 =?us-ascii?Q?Ae9kxy3fAG+1Zn0iEsnzjqAc6t+/9bRKl5QPRqOSakpGAI2c4KfD0hAZJfm3?=
 =?us-ascii?Q?f/nAiGhSeEz6rZw7SM3vDPWKKNbqJ5VdSIJ+2oZc9an4E1F10ZoxrRlM2Awe?=
 =?us-ascii?Q?hnFPQNjrBQd+ZZiRDaM/TmfkPTHgCX4zex79KrfrZRAHA6MJ04OPxWTpLv5F?=
 =?us-ascii?Q?rdA9H4+vdDvrNERzF4BbSqYAYOMR9Z7OVPRAKUU0oynNsZCHm5jLhKs7yuTS?=
 =?us-ascii?Q?JCERmsFxDKEacuBMm4BA1RNWZqrDTEAwmJjTgDPe1T/5bNLR+w3RxrrUR4Ll?=
 =?us-ascii?Q?AxDlppIXbJfDuWE9vLYbXoZCVt0YS+msrMnyUW/6WBsRbc+R6uaTpXR91uEo?=
 =?us-ascii?Q?lyf9wGmpRCZlb3uxDSRnpV5BXWKefMODQauakc8cNB9hJEkMQ0dx8dyRRbZo?=
 =?us-ascii?Q?Y65mLGLcH+m+ZPWv2sY57HVUR1TY63fvrpJ9b1h/mbJVCZE4kSVSW6fKOP5w?=
 =?us-ascii?Q?ajQWvXSY5VZgNmmcy1qht7TCVD+LeoiRKcmDAUdFcIr2nVV2yOlCneciFn1T?=
 =?us-ascii?Q?WJ6EGZXBV2lkxE3JksPNiKPq/pTCiCmebwgTLzf4eAKH379SeePDZ6GJFCc+?=
 =?us-ascii?Q?UXzqcVRMGcVb7t2T0wcLPzBnuUN+3VVXzsE+I3+wd77ikOK856nztnk9kkOc?=
 =?us-ascii?Q?A4Ogm07BY/9qTWcTwBTravv/ik3YubCcparpTRKVGZZaPTSSZfOzD8+f81vJ?=
 =?us-ascii?Q?t7ALohD5Xo5aqlRdeKq8CDyiWq4CcBVNCaHkvyGtyuoRRKlK49nlBIokkIQE?=
 =?us-ascii?Q?9oU09fl9Ywq4luSgIg0dF5IL+BU4DT9cVvDMOXYo8DZSws4q6a4nUPBkGuaS?=
 =?us-ascii?Q?ANFmD8P3cb78ZGsfV+uFF5GyOA3AU0VYy0qWbAS6ytCWYp82iCjMipGo/Pui?=
 =?us-ascii?Q?wXT56OmJ2AsToSu9rbVxOZ8xEAJVMnUWAl5eQVDhqc2B0wV63RdzrcyLf4Qq?=
 =?us-ascii?Q?y4rg2PeEhaMERSXmzHeDuNrB+9VPS9ZbPuBNdinVnHCoVZiircT/ucBynmEl?=
 =?us-ascii?Q?1apnvJGcWOIij6T04p1euqk4LSf5ttEg0UaXZzcPnyPg974VO2xJiEp9Ofsm?=
 =?us-ascii?Q?bcAkGTkQMz4gb0JXIpDZMya6e0CnEYir+DE2/0/14r6tjJlnNaVCPqPlX42R?=
 =?us-ascii?Q?cZxF83u7bkGFRnbTRS4MGZNK1m9qb0ayoe1u/9leD4AYy8NR3Yauo5TFUEZi?=
 =?us-ascii?Q?XWHp++E5JOfV5NHiP/nG/6/4iIKPWL72/ZI9DlMitCdt0k3FOdhUaG+qBLI/?=
 =?us-ascii?Q?eEeAnkzGH0r9uNOYZx3Np8L4Cf5RLJzl+CZM4o8RGGNYHXEzfUHIttwE08xU?=
 =?us-ascii?Q?TGEv/Ize4V5I9I6Q8mlGU0rvBkghLAKHVNSz2ffnTi0ocbrs2XAutS2NLO1w?=
 =?us-ascii?Q?V/IdaS5pU4Mpq4VKNB/cx5QoD0qiTWXv5uqceokRb3yrBvQmKF2Et+yoSX4P?=
 =?us-ascii?Q?edh4G2pCqK0AGSHzi1JDtkzORsCrH4midVmOu1uvDyfhM9oCPYj9FAIcqgXG?=
 =?us-ascii?Q?+xh6QWZkSLgI1RJ3KOXW6HSxCpu2sVJWGokEaS7tScJU0CTwHkomQVgiMS6v?=
 =?us-ascii?Q?tBC7TjbRng=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 269edf40-83f0-48e2-9aa7-08de95535aca
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2026 09:43:57.0923
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w8rvtr8YLNEjqjCy99LLystudCeW6+p+UnkWSJTs9gRIuWD/r2/o9hiOeB7a+erVz2bXrwD4umwf7rAowYPdvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR10MB6787
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 09:44:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234823

Please set status for fixed CVEs via CVE_STATUS_STABLE_BACKPORTS, otherwise=
 they will be still present in CVE reports.
Peter

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Hemanth Kumar M D via lists.openembedded.org
Sent: Wednesday, April 8, 2026 11:16 AM
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com; Hemanth.KumarMD@windriver.com
Subject: [OE-core] [PATCH] glibc: stable 2.43 branch updates

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

$ git log --oneline 856c426a753450b8c6861a5b994a564f4fc16d4b..ce1013a197eb4=
a3b8ff2b07e0672f4d0b976ce7c

ce1013a197 tests: fix tst-rseq with Linux 7.0
60cabd0464 riscv: Resolve calls to memcpy using memcpy-generic in early sta=
rtup
02ffd413cf elf: Use dl-symbol-redir-ifunc.h instead _dl_strlen
2695314378 elf: parse /proc/self/maps as the last resort to find the gap fo=
r tst-link-map-contiguous-ldso
dd9945c0ba resolv: Check hostname for validity (CVE-2026-4438)
5c6fca0c62 resolv: Count records correctly (CVE-2026-4437)
2be6cf2e75 posix: Run tst-wordexp-reuse-mem test
305ce0b588 aarch64: Tests for locking GCS
2ee41ba6ec aarch64: Lock GCS status at startup
fa4a40c7d4 tests: aarch64: fix makefile dependencies for dlopen tests for B=
TI
9898ea58b5 malloc: Avoid accessing /sys/kernel/mm files
c3ceb93dc4 Add BZ 33904 entry to NEWS
911bd469f8 debug: Fix build with --enable-fortify-source=3D1 (BZ 33904)
48f5a05a7a nss: Missing checks in __nss_configure_lookup, __nss_database_ge=
t (bug 28940)
d6cb7ce0e9 Linux: In getlogin_r, use utmp fallback only for specific errors
140c760d71 nss: Introduce dedicated struct nss_database_for_fork type

Testing Results:
+--------------+--------+--------+------+
| Result       | Before | After  | Diff |
+--------------+--------+--------+------+
| PASS         | 6770   | 6774   | +4   |
| XPASS        | 4      | 4      |  0   |
| FAIL         | 29     | 28     | -1   |
| XFAIL        | 16     | 16     |  0   |
| UNSUPPORTED  | 489    | 490    | +1   |
+--------------+--------+--------+------+

Changes in testcases:
+------------------------------------------------------+--------+----------=
---+
| Testcase                                             | Before | After    =
   |
+------------------------------------------------------+--------+----------=
---+
| elf/tst-tls20                                        | FAIL   | PASS     =
   |
| posix/tst-wordexp-reuse-mem                          | N/A    | PASS     =
   |
| resolv/tst-resolv-invalid-ptr                        | N/A    | PASS     =
   |
| resolv/tst-resolv-dns-section                        | N/A    | PASS     =
   |
| nss/tst-nss-malloc-failure-getlogin_r                | N/A    | UNSUPPORT=
ED |
+------------------------------------------------------+--------+----------=
---+

Justification:

commit - 2be6cf2e75 posix: Run tst-wordexp-reuse-mem test
Fixes Makefile dependency to ensure the testcase is executed.
Passing new testcase:
+PASS: posix/tst-wordexp-reuse-mem

commit - dd9945c0ba resolv: Check hostname for validity (CVE-2026-4438)
Adds validation for hostname parsing and introduces a regression test.
Passing new testcase:
+PASS: resolv/tst-resolv-invalid-ptr

commit - 5c6fca0c62 resolv: Count records correctly (CVE-2026-4437)
Fixes DNS answer section parsing and adds a regression test.
Passing new testcase:
+PASS: resolv/tst-resolv-dns-section

commit - 48f5a05a7a nss: Missing checks in __nss_configure_lookup, __nss_da=
tabase_get (bug 28940)
Fixes null pointer dereference and improves NSS handling.
Added testcase:
UNSUPPORTED: nss/tst-nss-malloc-failure-getlogin_r

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/=
glibc/glibc-version.inc
index 89be8fcb88..015e7943c5 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?=3D "release/2.43/master"
 PV =3D "2.43+git"
-SRCREV_glibc ?=3D "856c426a753450b8c6861a5b994a564f4fc16d4b"
+SRCREV_glibc ?=3D "ce1013a197eb4a3b8ff2b07e0672f4d0b976ce7c"
 SRCREV_localedef ?=3D "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
=20
 GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dhttps"
--=20
2.49.0


