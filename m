Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12CF3E81BB1
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 12:43:09 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46579.1770640982787149866
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 04:43:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=xLcGfb0b;
 spf=pass (domain: est.tech, ip: 52.101.69.60, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g+6erxPoHvwKwkaG09LLpLNvjvcnJcnm9dp4cY3zyU1kzHP89GjfLYLLk0/RfdEkpkUuHwdp2wBX6oIM2EcmpdXGkZTGM6gviTy6L+P6TnJp0daEcE7J7iBFOF7B9seCVc7zWGvSbYzX8+O9+qxBb3AH1KA/d2O63nZUz/gagUjZmK19/Y5pCM/prCCODxZBsKaaXgzvwoaLPtuYAVeAdn3kv+ELiud2wW7IGoR5XzQyvwnTZx9MmtAZj5wZAUq0ft+wd5pVUBqSRI7OFBSfRVBZ8BKWJJ3+hwfKH9l7r4y4OQhEYp1imcu65CnNnjjEku57tApwEgTDCxfMg9ieyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzKUZ5AJ860j+EqwEj+G4McwHSBU3kxt5sr38GQOTjo=;
 b=f/XaVQVyH3eQGseyLlxcDzF4Ll0xnduDTT/7LmFI73UPQ405x4L3vDYM6+HVv6tPLMkDa6Ae71ioV1ARYpqF227j8Wo1DR0COsRpoIBEt0IgEiWZHFsKAx3NX+u1pMLTLRSvCvrwuRVzVWlfv75a/9Y4MJt9gzF5okW4d8cPYE9FZJwJP1JOlqMVOa/30p2hMGTCklMZtGptjHrZ5gvdQYECV7Kro2kifelETZ/ss7g3QohwNk01xugm97PyeKfXwjWL7vvkUQ+OBX8kW77T8fZnSS5fdz8pMavuNVWquPkKBS7jRp0oBpo8U6ZLHbTkCfsPMCRXCF3rfBLEf8VVfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzKUZ5AJ860j+EqwEj+G4McwHSBU3kxt5sr38GQOTjo=;
 b=xLcGfb0bGrM/spLm9Nvaa8HsUBesG7c+xMb1oF5iSl+Q+oxbz3+u2hAVjyrUgTI0sy0PDtcXkQ2anWabkk8kgM8a3gMFlrgceCfn+egooyD7UXLT+h3yfdOdvT766/RcfD+Ei5leDvw1gYBChtrP1/+JQFH8UrvlwIWYeq18DlwPvfaDiluw8pD63xUtrAK2UtfpsnAt5HgMAUntAemTMr17DLDHhritCLMzTHZcd5wyJ617876pwR3RTQCJiOFkHh6Rxc7r5zrKnzFnMsyWMy5tdHS60omGTWRID81ZkkwS8V5xAEtuADZUIC3N0cPd3WZvgoFfMhhNwyfjX+HLuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by GV1P189MB2241.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:9e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 12:42:57 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 12:42:57 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][scarthgap][PATCH v1] libevent: merge duplicate inherit statements
Date: Mon,  9 Feb 2026 13:42:53 +0100
Message-ID: <20260209124253.55440-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0143.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::22) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|GV1P189MB2241:EE_
X-MS-Office365-Filtering-Correlation-Id: b5b0d315-1a93-4e3f-d123-08de67d8c045
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WIFV5f7GRG9TzQvtpt4gShD0KNkMIaoF6PnC9In7ac4YjP2hWXbXS2cZe0Hi?=
 =?us-ascii?Q?+0xAWlnUZoY5AAngH4t8YuzmCZyRJuWHy6umr0r2GeINm6NaJWZI1QWlTxLG?=
 =?us-ascii?Q?1cgqI9KPh4XO6LUEZ6hv6mxWUivG4ux+JiMUMITZVpf2oYoI2wk4bwo4p7uG?=
 =?us-ascii?Q?76kaRD6oh09anNQOd2OUfbM+0tzqOdduWfBs1fL3Baj0j5XJ+PNFCaXpJUw4?=
 =?us-ascii?Q?Btuk7na9ron733GUpFzsQTXqGkurquF6sBl4ro2kLAO57dgErr3q4B87oNvW?=
 =?us-ascii?Q?X6s3KXsI9ueyThf0MdYYVzzvRV4p9FhuED6+Aul+CtQGfTYF+DKipE9PMB5f?=
 =?us-ascii?Q?VYdWoueC9rjz5Dsxo0QezbYUpDagVEBuogsPZXCD5TMKKaVTnjvVRsmmZB3Q?=
 =?us-ascii?Q?mY+FQO3ELSUY8tKwPjtPtcg5dbSs+tNLq1GY8WS/FMSpO1gKXh7jC7qjOby6?=
 =?us-ascii?Q?aPfHKxbbYp4MpTKrYNkG2d3/mehijAGRn1lL01vz7flWe0ZvW9I7jMftrgUj?=
 =?us-ascii?Q?wEXFOCP5ufYQhRhqrWYTSrycQh75yqcJj+UBsY3UNTBtcaOb/zzRoa/5RB/o?=
 =?us-ascii?Q?Rx2EG1Yc3u3GExPfm3E9At6j+My4iRAk/xYSzzOZYo5WZ9GoGHo+3ehDCNya?=
 =?us-ascii?Q?jyLvQCIDve6gxISQmicJqggvsF0dDZyAsvugPi9Rz44v/paSbMf1k3TOGDnc?=
 =?us-ascii?Q?QD1vITzk8lLDQAyGtctKNlv1or3d2MFjX9CRwP3ly9T0qiomEB5Ea1qSI3fy?=
 =?us-ascii?Q?RWw4IjUw2CHCumyOJRSQE2sFuHIKEEoo//QMqiWgVbIpZk43iO4mZxJ628A7?=
 =?us-ascii?Q?jxFvp7omVgvQHIChbJpjHO077KfYG42G4Zdf+WDJ2rs9Ni81ZItXckFw1nJg?=
 =?us-ascii?Q?w2YmmqGvpsHqB8yMdQhtJYi3hTcB3MdjfRnaYfQK1lO14jOVUQCvaLk0MD0a?=
 =?us-ascii?Q?pYSMe10ROLp8Y7EvJichsuIfDNKOMOZ3Hx+5VLPqWQSCDg+1k1fhIQ9dHzai?=
 =?us-ascii?Q?yrfm/4oH1zTvVLIEYfboZcdluN7VKRM+9MLrY6egcK1QMq1G2JODxzH2Gv2s?=
 =?us-ascii?Q?gWZu2QcM9IVpp8vioX6YRIpenlTu0JUU7CwKFLkYxMJLhBOCRUQjVwEKWHLr?=
 =?us-ascii?Q?DlUncAlleUCvmeuvyboN2Hp1TMP/Ai7HkxZSY3evy8uyoJJl7y4V+3swbKsV?=
 =?us-ascii?Q?0dtO+abxhXvHzTSZr5zF+NF2xYRyYj598hBHJPNmTjpLf7ksHq5H59t9aSA7?=
 =?us-ascii?Q?26V0Hr+Ida61Hkl3pGDbKORC3N9cDImkKkPSqGxhpo7KKruUN7U5oCtSgXCM?=
 =?us-ascii?Q?v5Sqm5+/yERsBoy6JQwNoOeIpJxCo6SJ5h6O8XMU8hwkyfbxZimztR3I5z+x?=
 =?us-ascii?Q?nrB/p5IdVfspu1qWRw63hqLbcGXWPOeyGBNBXU85a8cFi3SYUwSsYThfKoUb?=
 =?us-ascii?Q?R/cycnJsTzwFqAejaTJLb/MRAn+Gm1ZzHqqA7BwM0lJWeNYYFhgnghYXvCtf?=
 =?us-ascii?Q?ia/U1amSApyWCwtBVB8uiePW5hF1ohrkVmjCFnldf62ZTmVLBNuYZHYbwAuf?=
 =?us-ascii?Q?AYSp4GiM7+TSFKiE9J4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5okttTLVM06dsfmmbHURpnkgLAGQampPCfXFvPwktKFgarCbZxskMVUSEkiX?=
 =?us-ascii?Q?hDxIf4CtVL2LyDlc8yAGW/8ZqxRWeEr28LrA2fZ6YYdF5ZlneH7+grboaBca?=
 =?us-ascii?Q?CZBkuIYyLSLajMs0mVWO7fUW9TGPQvsCc77RdaweKLstGyd0pMWUWOPGCdmP?=
 =?us-ascii?Q?p3FkIF/HOPKpaAHPb+rFTi49taikfqR/M5cTm/86fFoFqlV2Ca2yKiefj2q9?=
 =?us-ascii?Q?xkeixTn1f7gl5kKe9VW6tj1WGkKcUg/Q393TYEEeGbafd4izVIz9KefguAgq?=
 =?us-ascii?Q?AHDUFxUPGGSNyvHFiYavg2/iEOI1whXwdRbgGYIpHjtGeA0MJpJc6xL1Plns?=
 =?us-ascii?Q?mQojKAbWHnV7CjpbduDhKdQvtrTVRdRgYxhwRiMSYZE5JFSvF9hIgYn6V49q?=
 =?us-ascii?Q?LXOYvF1WsIDiqAG+4ji+Mb1Gpn7+vkCIenrLpMz2K78HgIW6a4pblc/DL+A8?=
 =?us-ascii?Q?HUWvAZOWpvdpHhE3xEV54QI8CI39qpFpW9Y9yTH8MRrz0fWTuC7g/EzghQz5?=
 =?us-ascii?Q?+I+kGnHCH3D8cFIFGiRJHUluuImkRa4Hn1GINGJIGGdCFLNMOYmNRWSTrI4i?=
 =?us-ascii?Q?QwVpPFeJxS0G4tdb8ZuAYEsBC9SPr5mDzVUP0ro03j+Ib51n5vUfZ29Sf5US?=
 =?us-ascii?Q?tDTOkfaVNBtFU6ZG7V3Z6BtpBroTMypiv1omOBCEDI1VKEpcD46+SorRljlm?=
 =?us-ascii?Q?OTqMagQJ4dMkwh+gzB7R+CKsW9bixBKJ2lIvI4mV6/mUnv3dIfzXdfi/kEbX?=
 =?us-ascii?Q?ZyGH+/778K/l10mKiLKhBM21LF/AGPZe9esLk3RsABvDpXh8csAtSH/xYSKH?=
 =?us-ascii?Q?0LWj0RRRdgfnlkaJunsRkzP8JJSvltbiDKtf4xpInxCPfSsobIj4fv8+rDEi?=
 =?us-ascii?Q?zmkZldMYbwt4n9to0f5xRRZJpsnPeSxK4a/0T8S8AXgqyBA7jRGrY5m8f+22?=
 =?us-ascii?Q?r8Z1VVBIHsfX6KifpOJg+9GiPTsPUaghJe0tK4yAcddC2Pyd+eF9lrxypcs9?=
 =?us-ascii?Q?EsphUb1eyuNLD+qagf8TEZzpUab7Mgv13kpTR3koBMP9Sy6FC8WkuisDoeUs?=
 =?us-ascii?Q?b2UGcU9E06kBdfc4kEyYmlCEXPAh+Hyuw3sEBzH+rNluLBuTCIex988ESHUa?=
 =?us-ascii?Q?i/A9R2Op3Etve2CBPhvRAjfYTDxVVzMsbRHc7JpuQROOGXBY95ecS8wAB5k2?=
 =?us-ascii?Q?xPODIqbRkdSb+3WCPILSkONj1H2fKgt48t3DGcZ2w9MqNI5oGYEjprMWMxhk?=
 =?us-ascii?Q?z3Yb2o4yUjrREO8o7mYDj+p1vocSkLJ/vxGCtYkYRwIuXltmJxDzXjDjmOIf?=
 =?us-ascii?Q?/hs3SXQDXeHzGY3TMFIPt0cZjSMqDPPk3tEDgfk0v9u/q7nCdt1SuT1TEJgU?=
 =?us-ascii?Q?z9Q99M3UugPZY5n08w1F1xl6JePS6VjbWZPExwAa0NsEkkraR5Cp1k2KBR9z?=
 =?us-ascii?Q?Ed+9y/JScaBAmtCMSmwLx8GIDrqdvUPGUq5zHC3ndF/eES7KRmm2fsGXNmiG?=
 =?us-ascii?Q?fICEfCJpoXhWOLwweA8Mib6cmnRPYI1l3t+qjvnWtXFWVeuwZ6ndykpwgBqf?=
 =?us-ascii?Q?wakvfrO3cDF4DpSXtAhJ5MiTJ9r25Kq8EbcHAZPBTE9COJLffgeBZU6IyAO6?=
 =?us-ascii?Q?4vhbQRghOGW753v7ONJHqcjEgPPuP6xtfT4hC6FATlnMAxoNrjpG+QMJiXsQ?=
 =?us-ascii?Q?CptCN6wLxLjZa/F/jyxDVq/LKXINnpecPH8DkztlDAMzwGFnUrkEsqoAtB1n?=
 =?us-ascii?Q?CHEeUSjCNA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b0d315-1a93-4e3f-d123-08de67d8c045
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 12:42:57.0802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lLtcq/JqsbeXC0UbOOukNtKB76Xul618IwqES03uxeVWG5JCZe7PiGLQsSUcc4aG13nXQgNp/CRExLc6+VmzeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2241
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 12:43:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230786

Merge the separate inherit statements into a single one for
improved readability and consistency with OE style.

No functional change intended.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 meta/recipes-support/libevent/libevent_2.1.12.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-support/libevent/libevent_2.1.12.bb b/meta/recipe=
s-support/libevent/libevent_2.1.12.bb
index 25388fb4d7..58502edc32 100644
--- a/meta/recipes-support/libevent/libevent_2.1.12.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.12.bb
@@ -28,13 +28,11 @@ S =3D "${WORKDIR}/${BPN}-${PV}-stable"
 PACKAGECONFIG ??=3D ""
 PACKAGECONFIG[openssl] =3D "--enable-openssl,--disable-openssl,openssl"
=20
-inherit autotools github-releases
+inherit autotools github-releases ptest multilib_header
=20
 # Needed for Debian packaging
 LEAD_SONAME =3D "libevent-2.1.so"
=20
-inherit ptest multilib_header
-
 DEPENDS =3D "zlib"
=20
 PACKAGES_DYNAMIC =3D "^${PN}-.*$"
--=20
2.43.0


