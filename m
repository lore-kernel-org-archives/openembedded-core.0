Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 321DBFCEE8F
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 11:44:32 +0000 (UTC)
Received: from PNZPR01CU001.outbound.protection.outlook.com (PNZPR01CU001.outbound.protection.outlook.com [40.107.51.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43383.1772019658862405225
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 03:40:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=Hlc8ClaY;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.51.50, mailfrom: git-patches@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wqExHMxt6v2i4FxFrONAZiPkNUV+9u0x2VfHVBxgWnp4MMblCkN0ZPmtYG0jxziEZFdurXiwG2mF3Aaf585cZV3Bbcp1KJcdhjfimXAyPbs77PNcar/nV2BAVGLOyl1wvbwdV9TuX8in5QsxYKuRFLn6O7zi72Ceho3aFtIwYPxIzcqkY9mZpAeabRb//oADtEUOzIpPorJ4cJ4RkEEus2ERuy8GNh6QH1ssuf/AQ4Of5IVQxy8ZDKlSYeW2W4r082Ga16MKLdczkI7vU27dQNXbJGcexnGsmAmiIri6H7s0aJMXnK7Nej8H/Uhn7gYzNeWxBoEsQHIxEwIXiwv4tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VviGmwGo5izbbOXGqgyWSAfG6MWDs5OVGlKFfWETjr0=;
 b=KhPF08nv53+l3cirC55bqiKLjSqJ8SNGlT5mDaCSqi7xWWct9/2nAWAHTfun+YH3RGVvxWoKTlnsjeMwtSkg+KNCZB+uUdfH+IVKTMpQvstVHehim1wiInY3kLOfGSQVql3Blao37v6WGxcFZeUOH9eYnKmD+FisRKMI671XaNrVBBvIVo0YlxsJ1IGeTIbASCxBFBWEmTAzBsLwnmBNfGs3bfLMaPLTWRi4B0tFsdOs1u3+P+DFlxz6U7/1110YCsgoN/zF+I6fsZ2urX0ticCeOKqTwr7DWUgzFxzzl+1wEe9pG91hXVIAGQpgRBgavtZ12qUJJzwQ+YEvnL5NoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VviGmwGo5izbbOXGqgyWSAfG6MWDs5OVGlKFfWETjr0=;
 b=Hlc8ClaY0LSX6Qwliv+Jt0SDmHhj+L78NdHZQZlBryhkr5ClStTdnMZis2QNASciAz2nOfdr8gqx5gJXeaSN7r/55c/PuDafpY2pxhCWybeQwYJmcphpxnhwPoOnA43BZUQFEFqqpwp1nHAx2rRLNn3gwXNd1blNIjiag3ot93DLjEPxWmoBAYeyEbYkfad95yZl7JI0dGhonwqqzxISzQolL5gOj/cuT1f8/KriqPc+l3hDw5XyPJ0q5V2/j48w95zWWuK+wdYjTv1u8w4O5fIawOQoBXEV34c7cqu4EQwfrBw+tQHIExDj4U2/ZT/PiX+M2G6eXsEKLeEaAxDXwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN0P287MB1970.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1be::5)
 by MAYP287MB3868.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:149::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Wed, 25 Feb
 2026 11:40:50 +0000
Received: from PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9ca:1b54:1c36:f7f2]) by PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9ca:1b54:1c36:f7f2%5]) with mapi id 15.20.9654.007; Wed, 25 Feb 2026
 11:40:50 +0000
From: Nikhil R <git-patches@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org,
	nikhil.r@bmwtechworks.in
Subject: [OE-core][scarthgap][PATCH] libseccomp: add diffutils to ptest RDEPENDS
Date: Wed, 25 Feb 2026 17:10:32 +0530
Message-ID: <20260225114032.44274-1-git-patches@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: PN4PR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ac::7) To PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB1970:EE_|MAYP287MB3868:EE_
X-MS-Office365-Filtering-Correlation-Id: b24127a4-0168-4e0a-e962-08de7462b9ba
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	xKDJBwqDuyNH9ca6T7cRChKv2xuSeMhlumDit/Bkf+hISo6iK1cexQdC1mfAL5s0UrJrE8SYsqwJ0WrMxZzItt/RzsQuCbXjX/UqOng/JOhdrg4fvu2ubHn1Nho5/vQRc35ZtaIJ2J0Br2e3/6uHO9BF/glDG3iSLXOncrWB7N6/uz5Ile2sJKyk1CuXf79WgNwmBD9m6YC9Ef80md+oC5SES1lKx/POKnNK+Hp3hQZ3fkD+AuVSwnxeYlwxA4kO7Q9mrrpLtcZeu10VvDR49Wej87ayw47gtHqnbG0mU/HtXdLfRRLy8o5z4vR+v63tLSLxjfGe8o22Qvl1sPyRXhuAtl0MdyEpOcC0qfu3BMj421iMAoroEs91hsIJmGY9QUoJg1TXpSFSGfWtqcGs264SZ3swogh8VB9FI9J7Quk83ydJnVF9O0Cf9ng3xa6I80Ti/rc+Phqgmw89GwiOVe83RKG9YRtDKPFhapVy7iqe2I21Jx0ZEu3JfPq8mfoSq/MHbiK72h1qOAziVQBRTFzHkE/zEYD2YrbB3/090zrzBx39ekgmG83RIpT0UiNSVmy5GPLtwsNfebcmAzQmOb6oTJvYAHH/s0toxdiNYzCcFFQfnsMuT7c1jGGIMEd5+1k88p4VZFqcLjNLhplvEV0X9oByim22us0LrGWTR7qMm7QxpVQkie6hoNqUJSbwdsdCo+1mkwZzlqN6xWL4QOhUtT3cJHXSYq061gsDqMwkq2tCbwvXAVby5ZGvD5ixPUDFwR9dlXzH23aWmJZ74rYg/AkytnvteKynlLxa+yo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB1970.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?d8ABdy5RI08jsVlqHZnA78CUSTd2/RGuPOXcPbpJPQR2kYaZBQWt1lGZ2JJV?=
 =?us-ascii?Q?BQD3Op6ZVRM2idnpMM8l+qiARTmyviMwziANgmkdAqJ3Yf0E9GGwGdGYaRvj?=
 =?us-ascii?Q?wvhwqHgEaJ7QoCziD4KaTnZGYolPfdziv1E5ywkmBM/GfkybgIe5YmZXS6fc?=
 =?us-ascii?Q?qRD3ZI8cml2iUS0/fr3RSd0uZEjfmtzDCPbtR9dgQpPoy6eMuma9VU64PlkR?=
 =?us-ascii?Q?PkakiqKPagNKiCWK7vcq6tW/x3396iITBBfc0YvBawCx3j7bbVrRUaf3otxg?=
 =?us-ascii?Q?t7F9aJZoiv6og1UMCxb9Tp48zeWqu+grSFtwi6GfEefdv9YKqDjYuy6AlSYc?=
 =?us-ascii?Q?M76HK+dYfe2hiuoj2WuwmnH7dw1ngdgYJfbnMWcNBE5uCat/mn63XO2OON7b?=
 =?us-ascii?Q?2e6FWrdNn5+r3h6OaU5Hh/bRU6YGShjvw7lV1jYfkU1453J+GXddfH/boXeO?=
 =?us-ascii?Q?2+wmIGCjNysPz9pMl73+xTlL+l/Mxtz0A8eDg3o31hLeO05lYl/vOaa2MbH5?=
 =?us-ascii?Q?g8soOJXeqmw0jcM5j1uj/GA9hQKsAhyjFBK6E7KQrM9iTqQPaelXbZnvNgJh?=
 =?us-ascii?Q?HzEZxlC0ZmEMb/KZFZEy5P9bgMdrSwu7yuNeIR4l8sFlgdrAEW+7Xki6gY1G?=
 =?us-ascii?Q?bayaler64Q16NDyupzbGm7LzBydRVq2A8tj/8HmL3TK51zrnHVcXxQ8W6j2G?=
 =?us-ascii?Q?KaLbcB0j1cztKpv0azAbVd4gobvzYGEQ9yMOtKAZJpujX2y5yZzAwr31VFWG?=
 =?us-ascii?Q?K2GvX0heApyw9HVU+If5xVf6nmYeydPvBmevsGFDtuo2TTJbo6h4UJ4qSV0g?=
 =?us-ascii?Q?LOwlRt0qmmU2NP79jW3pilmpBTkxIun9D/1AX8xfHYs8Lcc4c2txzYLMpffZ?=
 =?us-ascii?Q?ZCtb7/WN//w2SkIvYRRF+UDCA711c/GbA51kcbJXxz6RERb8c5l0UqTnmJ01?=
 =?us-ascii?Q?d9Gz9wDJPtLRTmDz9I2qEa43tGeEXX4NAu+xPyFTZhuqqVjaN8ACoJT37ol0?=
 =?us-ascii?Q?k3xGsEgURjDSbJqZ7yu/fakl9Tz4qycM98OJeXOQ0jat2Ujc16iqiPJaRXnX?=
 =?us-ascii?Q?j3x5q1A97E0XXtmi8kiqitXzGBHhkWgDIPXxa2TIvUBvgxpWPlCzAuCzeR3C?=
 =?us-ascii?Q?bA1eYQzHOcj4nVvJMh17QTgOjvCjLGMX3KjrZ8+CfXIYRvQ6HwunxD0nCJoc?=
 =?us-ascii?Q?dmI/TF5uAKkJ/MT+EcZtzrSivjoxzTAunHTP1tTcMeTTqYmIGKwSzTQ66DpN?=
 =?us-ascii?Q?zTLCDQ3WFzplqhofiDxU52gaWVyItAiRi9oNPjEpd5mR8CrczFO+6pEcheSv?=
 =?us-ascii?Q?MqXwKDBE9NWT68P3S4hcsVwRV2kILpH90Y7KtF9gRG9MuGuXh8RCg70Y3Etl?=
 =?us-ascii?Q?e9RuR04MCq11hZ602+lPsxh9p+KBOJQWbe5iDuadYlg3iZ2Ml6QZx/GSmE5u?=
 =?us-ascii?Q?qWfbNHBAFCPDri6MRzmcUd9eqVp2sI2RP63B4jBUCuS3A0N7vC8R4gfDQB2Q?=
 =?us-ascii?Q?6sr0Id9FdPBJR9JgVW9AZzA4ppgencAsngZM0iTmj4YiEkVV+EnMMLvHcsax?=
 =?us-ascii?Q?BxLL7bAsIelhVuvogw3JdBykyFN3NgXwhYL9BWlXMljqpLyla4VnTRWPJfzU?=
 =?us-ascii?Q?kmN3J/rYbJ5FHZWc/AQH3zhAq8vG43V7Y9xZLh7iaf58V3fgEmuHaTXPpV0U?=
 =?us-ascii?Q?47NMMNTc++Q5FXPLARvzvOzqF1e7vdxhQAd8ip7TkWpV6K0sOVRq1p4KSvJK?=
 =?us-ascii?Q?4YrOeFpLSLoGd23SZT4uZD+fMzHwTRU=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: b24127a4-0168-4e0a-e962-08de7462b9ba
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 11:40:50.6313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /UurGXDCT3Xps4Lfn1FNCSIj9+RdvPM7dGgBY0UUi6Ow6scehFyfwEgQgrPsXGgR+Ux2TpOsUZHeSYSUyMvRbcZDhgMquWSW4GB1qNLT4GU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYP287MB3868
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 11:44:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231953

From: Nikhil R <nikhil.r@bmwtechworks.in>

libseccomp ptest needs diff during test execution,
add diffutils to the runtime ptest deps.

Signed-off-by: Nikhil R <nikhil.r@bmwtechworks.in>
---
 meta/recipes-support/libseccomp/libseccomp_2.5.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb b/meta/rec=
ipes-support/libseccomp/libseccomp_2.5.5.bb
index 478e5f4289..dd253a7826 100644
--- a/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb
+++ b/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb
@@ -59,4 +59,4 @@ FILES:${PN} =3D "${bindir} ${libdir}/${BPN}.so* ${PYTHON_=
SITEPACKAGES_DIR}/"
 FILES:${PN}-dbg +=3D "${libdir}/${PN}/tests/.debug/* ${libdir}/${PN}/tools=
/.debug"
=20
 RDEPENDS:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'python', 'pyth=
on3', '', d)}"
-RDEPENDS:${PN}-ptest =3D "coreutils bash"
+RDEPENDS:${PN}-ptest =3D "coreutils bash diffutils"
--=20
2.34.1


