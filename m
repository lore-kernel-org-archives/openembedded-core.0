Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17044.1793293869501862070
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 10:11:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=H6E/UQKD;
 spf=pass (domain: est.tech, ip: 52.101.69.68, mailfrom: benhur.tessele@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f+EhcAnzkYGAz/aI8B5Y7RbzCj2sBzk+/nk9WQEbvQv+unSqHSWTdH3c64kDrCO++MN4ZmxiXx2/6jZ+smfpK/vHw+EweNxPWCNxUx4MPPG56HxmtPAmeorViv5m1R4UAp1QkkxAKjdq4OSOaXJacYyLfob8uIzpx8g90a2VLni7xGIptsfSzc8pVPvSvRvqGRHXBSz0sQDggZqNz0EOOpN19JkI/HigJLiQhFZcqFn33jpZDhHI3+tS0mJTJXdYqTKzCgBiFoaQ/U3z30e920UnadE2XiIDvpk4Hc05MJ/8S+2U7PNCUhhi+FBTKErgM3OWP8vsdplfQMZlaU8pMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THix7FRm4WOQyxi516EhZZoJYOnRR5aeIqloCO9ee/U=;
 b=oZAuN/pudBwI0A8tAgIzAEANEMhKPql7O2F6Y9XkRHj3YsJ9U1FnzYZGc0jEyelOpLvbsbng8+L98cMGtTOG/LXX2xSHiEee8Ti7n9hoKq/G50GwnmnSEwqewlO+XuuOc0Mb2SFbbqqFd9FO/iyuRDJPRZTBMwOhUw0hsbHyrVsVMplUg1xaJGq46MiJvpsRpNYlsZUw4LEr4z3O5qg1IWHfGluFmofLEbkxfWZZodCd9GdMA7PV6aeU5Vp/Vz0kWDlu2B4eVdXIZdanWVch/FGk70L2ZlCzxkVqin8HYST4qfhXR8asf6wCshj6Bf6j8Gljz5koTFjnHaBXcRs2NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THix7FRm4WOQyxi516EhZZoJYOnRR5aeIqloCO9ee/U=;
 b=H6E/UQKDsXNoDztGrMdyFS5cuEsdN929QCtCxd4iQMOIXH3YnkBBOIbEWIx4uJDZGgsrXKjp8yvyv+e3XB1oKgNj/lYM5p0ATZmfTh8oseQFEqDP8XQgyS6upsRS3V01XfF26vzCVuHhRGT2JAyl9/zCGxwe6GX0CEwv0jjFugksyzlez4C6FfrQoanzJZMOl0rSQQsaR6lMUHHs2x5N6cEUYm2U6wkANXfs80Da+4XgG73MdREc1ye8gT8+dB2j9yTeOqvgQfwCddF6vV0VC1CFmRBJdSzHAzUu74K6IGBzAtxPMyGAM/eDZLbP47szl24Fgsipflas5jyzEByEMQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU0P189MB2250.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3e2::15)
 by DB9P189MB3717.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5fb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 17:11:03 +0000
Received: from DU0P189MB2250.EURP189.PROD.OUTLOOK.COM
 ([fe80::9be2:1092:4622:e248]) by DU0P189MB2250.EURP189.PROD.OUTLOOK.COM
 ([fe80::9be2:1092:4622:e248%5]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 17:11:03 +0000
From: Benhur Tessele <benhur.tessele@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Benhur Tessele <benhur.tessele@est.tech>
Subject: [scarthgap][PATCH 0/2] openssh: fix GSSAPI CVE-2026-106555 and CVE-2026-106553
Date: Thu, 29 Oct 2026 18:10:55 +0100
Message-ID: <20261029171057.15032-1-benhur.tessele@est.tech>
X-Mailer: git-send-email 2.56.0
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MA3P292CA0066.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::11) To DU0P189MB2250.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:3e2::15)
Return-Path: benhur.tessele@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0P189MB2250:EE_|DB9P189MB3717:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fc74257-5ad6-41cb-322a-08df35df9cdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|6133799003|18002099003|56012099006|11063799006|10067099003|261028144727099003|261021121427099003|261022115727099003|261022075727099003|261022105027099003|261009223027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: vMDcuMGSZXJxE+hA4RGo8NdhqKsZ/vB+gCMD95MPlpW1izXV1NeuSfxIV6igsIRK0+VSeXmyhHwn87+aZMslBoMPoqq8dgBaVbsUWXQ4A0WAB60/5kQ0mVH7sFHh6N3NqUFS4hIRN9F4o9d+VAQI0x3oebL6CBdJEukAZZcGX74yY+FPyFegnC5lRzpicW02Ju5zvDKG2NaSYpXyMp5hgfXuEL2HcSDE6Yl6GYxuWqV6mGi4AxEymROjOx8wgp8q2zQ5GWnriF2uvnzsAt5/L1uHFLs0HprgqwMdmbnoLGc13SjojxyxRVmx2tDw/OSXaX7Wo1m32Nnm2xPrPYx1F8bbx9zqdiIryc486IdL2yZ5A9GbTMUOJy1Xcla3Hz5jpfs8PNHwOztR85CI70d8+m64lub5EOobJ0PPpUNh3164ACq8xgig+ckRS2H3VDQ+2ugcU5vAiv0bMKe88akYT7RQOPQAtPhX8xSF0B+4wfpmN8jHD1l7zQKoA5PEAdHbtcmq7Ki+JesJBFFys8Qyfj7yWMWuAJwvMh+V67qkh7OecnGBTKUJHAaNK/ZCFGz4m4qEXzGrc8OjXpwcAgblkgPbNVAyrkqxsFUKSNDynxo1BA3X+97wgEGHFdbIFdDsWk4EEqJpVhJdfCP8Rpi70Cea9m8Y3yDFfl7WtEWCdm0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0P189MB2250.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(6133799003)(18002099003)(56012099006)(11063799006)(10067099003)(261028144727099003)(261021121427099003)(261022115727099003)(261022075727099003)(261022105027099003)(261009223027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pkCZC4O7BQIWshDphmd/PhF4C3eMZ9l6nF/fyBJ40umg7WqgEy2QbzBtX6Ui?=
 =?us-ascii?Q?wh1hDd1wlayA8zQDaCgUTDOpM3s/RoBWEyQ4cA0JLKy2c38/+dGeS91Oeb1e?=
 =?us-ascii?Q?pXuirwQxtaN2e8+pHRGTlimRvWugLhCde3Fa0+TNAF3tjcwQ3kW2u3rK5y/u?=
 =?us-ascii?Q?f3M6gRsrsgQUbybenoX0K950G8m5EkMUrXA53Gg0snrpjmL1ZrQriczlXIrH?=
 =?us-ascii?Q?oF4E+uEwitmmul/zuFCo6gz/X42sNy9zaMo83wW56p1lTcNSC8BoL68A0h+g?=
 =?us-ascii?Q?dwnRBOHnuCy9WmXz+dWmMM2fUqEFDImI/HJAjXk1F3rYZo89a/483So8E1Hr?=
 =?us-ascii?Q?TUCV6HetDJMq7ECxcumdbenBhlpoVwCXEBuR16/ni6wQVFf44tkjTHQs5Emp?=
 =?us-ascii?Q?rjlRyF1UK/ZolkYOJLoffwMf0WcXhzQXMhTuOwzfgmkLb3Y5gs1TGGIoQa90?=
 =?us-ascii?Q?o+ov2fmABX3NgIRirGe/Z0XzWBgPWlcxGReBg7bAI+hEYpDh5I++HbvgV221?=
 =?us-ascii?Q?PQuMX5JS7vzqzjHYi4cJ27K8yB4h8Ax5YqaKLlKJ47JpAiKqXNNBLrDDkPoF?=
 =?us-ascii?Q?Qkyl54mZnolIuD8MeqQjnmA86K1mGhOkJw6OeIwhl4S324bni3HQcXEL3bkb?=
 =?us-ascii?Q?neTzCFJiaTjU+7EZHtt1NpoMxIUMAY2dw2+X0oZc1HPpC9njGdLbkWrW7b5D?=
 =?us-ascii?Q?1mLTc8I1QjnjanRPkHiNscnCT0NwK+NqiufulUtSKktW9IyHjnSjv/xoDp7f?=
 =?us-ascii?Q?TKPvGin6ibrNi7Yhqmfx8lBU1uZHgeqqHUeUyTsTwr8zEObjg+1JuP07cULs?=
 =?us-ascii?Q?9Deoaj4QrnqZs7zD71hUIlj4uqbE0Uj2giMR9hCo0YWTUiWnpbAikohDbG3m?=
 =?us-ascii?Q?R4S1dI40q+7ddCngJROIVavEi30EYdfsEsvYcEYMKxPEGXNv5meUxYBO7aXv?=
 =?us-ascii?Q?+tz/VmLVjaJ1e9fT2ZowO+Wck0gHlLEJYEx2V2PjZdITxg8yCIW7Na4CnbVk?=
 =?us-ascii?Q?zN0pbzq9vDY282I0tQvfT54N6fYHjh0fC+9QQf4iLBiFfbvx6WawCphAEb17?=
 =?us-ascii?Q?VgJvj2f2taqSS4jO31nG9xV5KIdIQoB9wUzyfvcm8/3DwJuliIgfhfTVBNIh?=
 =?us-ascii?Q?Yymodv2oJmfSuo/msZDedpuhVrzF0ktPvT8iI/d93vJe9UrJ1+owFPZGT3oB?=
 =?us-ascii?Q?tQBJUOHnFdul8Az/ihk31yAbbzCgiILpXI1StR/q4UvZDl8X1kcST18AJbXm?=
 =?us-ascii?Q?7AnEDO7A+LkbWMt08Zj5mDM3e9JnEkwg/ppKqCGo0ryjmo+D4vazCvUNUcpT?=
 =?us-ascii?Q?hxsaVtXydc2/2b2z5BdZsrom+GK3CQBmKRwsxRzosbG816hfaw7gCYW0WQYX?=
 =?us-ascii?Q?oX8pBPrWcsSBqQ1JpEe4IbFFeD0JXPLgW30x48xPUqLRFqQYysaYh4gAnRYE?=
 =?us-ascii?Q?kaC+0qOxnhIHzkMOpUHsNjlzCYWMhz/qSRswNKP/9wM4ATJyIh3ZumC1B/Ar?=
 =?us-ascii?Q?BU/GZSt9kLElHGXRmgBFoyXJ9MNOvpCFG70XmH4NGs/tMGDCo5grg8iHeulM?=
 =?us-ascii?Q?e5yTri17BJ1BoX0KS+zceIFLoFCtgrKSksHJLep07Q3GEtbF8ubNnD0mzHg4?=
 =?us-ascii?Q?YP29IYrbcI5ycSNgTEWrsicbOty8v0m2pZMCb1UhVEwE2g15GIDoyrLprknM?=
 =?us-ascii?Q?CjNYBjk4YRNqmFp5LP0VTfZSSzNtH82FU1SmqKeyHZfRPgF8aYhXfJZUAAjR?=
 =?us-ascii?Q?Ztw3cQNLng=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fc74257-5ad6-41cb-322a-08df35df9cdb
X-MS-Exchange-CrossTenant-AuthSource: DU0P189MB2250.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 17:11:03.6595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zh05W+lfQBMfAGHGr/bk9vKr1gMyF6WSGxqCg42RcX3T8pT9V+PzjdGo8x8CvIiZ5qGX1GaHd2nVKAIMNNoVaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB3717
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 17:11:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248954
Content-Type: text/plain; charset="utf-8"

Backport two related upstream GSSAPIAuthentication fixes from OpenSSH
10.6p1 to openssh 9.6p1:

- CVE-2026-106555: reset GSSAPI client state before each authentication
  attempt (upstream 670510d1).
- CVE-2026-106553: only store GSSAPI credentials when authentication has
  succeeded (upstream 6f9cd19a).

The patches are ordered as upstream, as the second one applies on top of
the helper function introduced by the first. The vulnerable code is only
built when PACKAGECONFIG contains kerberos.

Tested by building openssh (bitbake openssh -c compile) for qemux86-64
with the default PACKAGECONFIG and with kerberos enabled (krb5 from
meta-oe), confirming that GSSAPI support was compiled in.

Also ran the openssh ptest on qemux86-64 (core-image-ptest-openssh with
PACKAGECONFIG kerberos, bitbake ... -c testimage): 82 PASS, 0 FAIL,
1 SKIP (agent-ptrace, gdb not installed). Note that the openssh
regression suite has no GSSAPI tests, so this checks for general
regressions only.

Benhur Tessele (2):
  openssh: fix CVE-2026-106555
  openssh: fix CVE-2026-106553

 .../openssh/openssh/CVE-2026-106553.patch     |  88 ++++++++++++++
 .../openssh/openssh/CVE-2026-106555.patch     | 109 ++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |   2 +
 3 files changed, 199 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-1065=
53.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-1065=
55.patch

