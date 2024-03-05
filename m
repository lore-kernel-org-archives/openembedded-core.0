Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9029C54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 20:36:40 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.80])
 by mx.groups.io with SMTP id smtpd.web10.3682.1709670993598183962
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Mar 2024 12:36:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@nxp.com header.s=selector2 header.b=bPXZ25F/;
 spf=pass (domain: nxp.com, ip: 40.107.21.80, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LBFW/v0O2Xw878D3TUurNHl8lAGJyPMLD07L+NiRl3mEQyTiA8JEFkfHD9/1gqBoI/5tIXX+g5IKw9GjruSQYl+CUJbVkilM4JW3RYotcfzR0HPUmDmf/WiH2RkEYOa3H805/lziLOeH3hLvbWfp77p32/HwrF2bjX3ZlVvz6LIJUJSCBrQqr477x290TGdDAxB19PB6YKb8uhOXGZvFj7sKVlOYKU0NuzVOkDCzBp1wFg13SwEnoJnBh92VRnw0wGb7+ZDNgx6YsjEaCj7WbNp7LIPED9brdzRhr9Pl1CmeAVxPTpCHK7gI8+CdYAQbjLLnEjQ+I8RixrBPPvd8+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mU3HHlpXQK4LJ9nmCUFCM6o7RaBUpxg/ZH5tOS5cBzU=;
 b=n3nl42Fs2HC6/oyF7+MfSOC5Unjn6l2aBU6pzlXmpvhMj4eDbHWw1IWrYLiZf+1N9U8hrSViogkw8ohqaqtDrgF7fHK5m1JbUTFSez+yPUVL9a5eeLJFDlQkhmHKwur67UZdQCL890FORsyvlI5a6SmB2oQ0/rqlG5qFixe5lJS2g6EWFIocVwf4h2kujex8yKBtJl1VOesaGyL5q0OFFwkovBpYXOi8nUGdaNh+Vgay60gQbQaSsjUqE4+zXoxnHLZfdQFDS44k+nkl72kOClWy6661bL1Myh6u2Wqh3VF55Z9Nup8Fo3rTlGy7v0ad/jPnL5DeLFceDbIJTPTeog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mU3HHlpXQK4LJ9nmCUFCM6o7RaBUpxg/ZH5tOS5cBzU=;
 b=bPXZ25F/Wqxvep9thO/k9GbLOyJO8lg6U++zfkX8PyvbCbxyZ0fQAvrHJb0iItaiYHQExsJqajIyewsKDZLg0JzrRc8GO5ldyB6JYLABJ78hxTqizcDuCDLW46W5/B3ZLM+4GuAtNzxc5HSq917lrUQWfsHxJURzZADPmPTDZn0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by VE1PR04MB7263.eurprd04.prod.outlook.com (2603:10a6:800:1af::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Tue, 5 Mar
 2024 20:36:30 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::98a:d1cf:4bb2:7f52]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::98a:d1cf:4bb2:7f52%4]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 20:36:30 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@nxp.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] bmaptool: Add bmap-tools alias for compatibility
Date: Tue,  5 Mar 2024 14:36:08 -0600
Message-ID: <20240305203608.3039688-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0107.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::22) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|VE1PR04MB7263:EE_
X-MS-Office365-Filtering-Correlation-Id: c02f3c68-0eb6-4caa-8352-08dc3d53efff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cmHMZBFG0l8f2k2YlAGyRYggi/xfOncskoaKpGU8J5NMtE+ZxvRtNjTyEXnuXnyeABg2+xs/5IS1AMl3Dzmv47lMxFMQK9mCr8rx9WMZIjpUHeYXPGQLOJkKmU/BzpWxCPZ2HQiNiiWGVt8Uc9pmsjUmnC0d8aM6XcFhwZOQFwObEfxYuCfJjqrsBLCpTPfzkDzVLiAXcF51h53Ch+bliOiUR/wxD/QlYkPZFIcAAiL2Ho1OHanJjv2GRe4CabG0o8DauqY/kWtM68AOXBmSlX5KVb0AgTQ4YhpPlew9/PZwbKZ2kbXfjcerAHGsC3ZIamBS2G2pukAoDwtPJ7KNLqZavKa7D0AVp4Jba4Gip12R5gTplXc9slNKIONMo4YcyXVlmplXGyRtpsCacWBNMsKKXU5cl3bVT27tu1v/j5LlKmnq3gnNVMHvrVTmYmm0kT2QW5U8ym5ErHWoJICc305tNRYMkzizwKynMXJ6Qu/3E6BV9cVYtnEvco/tRxXS4OVp/k2L8YWYhCpDKTRKz5bfhChisZW4LjE/r6EymPm/nOfDpOXHb9nuQpJO4WhYyBI6KaUf83KNZz1Jeo+i2LC4xcq9KXuovd9qHIsmeYm7JoUxUZhCTzOUq593LV9pI27g4HSQ9XJCvSAFQCM3mj1vlNbxbvL2WZz2lVUVGwVQ5OPj1FA+IU0CMA60VmCB83V/9ZxSJ1D9hUTrUAKomdfep7zWE1ecGmfmj/Evo6I=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?L+ZEoxGyKk9A8RThBZK7Y1vwj14bqArbx36FCb1PHkLOij6MNk8+bbx8B1IL?=
 =?us-ascii?Q?dfT6xwfcN0bGb0lCkTJM4LudwLevQEf0+g58NwZyu6nHL8QwavGUB3bZ0J61?=
 =?us-ascii?Q?xv5J5oTlCVnfpNg830oaPpYaW7EP0Pp1g/5hJYDCTEmM9BunokQUlkpjQ+TJ?=
 =?us-ascii?Q?04l5pI6jS7EAFV7NKi9EmfStUdW0HLmunONBRcfBjzhY19gi1cse/E/lfJ3x?=
 =?us-ascii?Q?1i3I7obUEZ23vk8ftybyvW+S9OpR+RKwog8z/+rQE8fBK9ETzRtyi2aoBkmH?=
 =?us-ascii?Q?P+i356qgFN/rIC0v70gpDTxozGiD4zb6rjM8VmSAY+5G/qpO6veTbk8xMtxs?=
 =?us-ascii?Q?j5ynknuRgO6lblIus9fMxKP4pXZw180adwfINhzFQ0Arqc8JkEv69wFFMYAf?=
 =?us-ascii?Q?XzkihBNAGDmxgpf/tQG9TSbHDC/rVUsbpuKKS7nmCsy2EcNhm3DQa356OdCw?=
 =?us-ascii?Q?zN4r0JEOrWeF2BwYCNWyCF4S4J3ps3idIb+WNWXGznqSB8vS01+IAfK6Yd5P?=
 =?us-ascii?Q?bKc+iG7SycQbYJJE91HMOaYspit+mTp31t0Q3IfFfcAiCEBCX03gdtcBzBnZ?=
 =?us-ascii?Q?Z5EY+ZMtSkUVUjvTW19IDYC7HKIytx6baH5L4fveYfa8atp8NFKOYZ1DMSdV?=
 =?us-ascii?Q?aAMK/f78P4tUWepSHag8X4iKbLkOQiso6DhLx7f0FkA2X0aElVDlOMi5+Hjx?=
 =?us-ascii?Q?Ll8b9Oc8XlKfZgxc29uTmA5mdYTLX2l9nU29i85dFN8nwst/epfLmYK05Wk3?=
 =?us-ascii?Q?ajUiaBEDavxUZb6NxupimyUd7KuY2Y6dYS63wDTtHR25LMVWPXRjFijcMSC3?=
 =?us-ascii?Q?F/vBWcOONV/fsnLzf6DDOK9+esoR919HX8aV8HVs3Bgn1saDHkuIJBz224vw?=
 =?us-ascii?Q?c/Dvu3DVeiIY3UFocagZRqt7VAOOhvBslko8zPUz5Uw+jlxp1wYgLhqyVgl2?=
 =?us-ascii?Q?RGsSOYgxoy53WOyttELFJMX0zscWugY1aRlrB3SCnhyQci6os5rPds31c6DT?=
 =?us-ascii?Q?YRlnfTyoXoxZSIx0ufTik3ewwv7FTfvGiVplqAbuXXyKPB3HEY+Af5B9UjXv?=
 =?us-ascii?Q?mwkFendJs82Bfn4cDpcglEQ6D9X47M/7/k+nW42gA7AuTB3l7oFktpGp/bSZ?=
 =?us-ascii?Q?KqqAorb8BRujgG0xTLM7sfd/FydCnCwmEwsHMuSecM0TeHD40Ypaq1wBEt29?=
 =?us-ascii?Q?1WtDCd+6hLEdfwtPaOIyIv81Sa+C3ap3Cvkc3tn3+8WUuAjG24DoBFYvh7j+?=
 =?us-ascii?Q?tlXyiEbA8eF/WVZcnPOwqEIRUxUWqWaKnc7v/B52nh8ZM+hCmhzbXuDZgWjD?=
 =?us-ascii?Q?S8JL9PbqAtptzNpVRps8pWLzbuMbHTetNRnRRTKQIGv3elkBz1MoFVrY0HAs?=
 =?us-ascii?Q?z359q+vTH5A+liwNCe2Ko1LD04ozGxvPDZjjo2+pPUNsIkEFoFJdQXn0JbbC?=
 =?us-ascii?Q?RE2++3I3o1VN1DiF0p6It25tKnzRPzldBKslk2D9uRCTLM3KYpOJfMI7WF1l?=
 =?us-ascii?Q?XD//WqMZu1kXsM/GUuHRaLDhKI9FU73Eszt29qJKQJeWa+IInPHMijBRwcvW?=
 =?us-ascii?Q?MrubhMvp4obUAQEc6iWmhke+4ILHN0BIOrIR9Vqs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c02f3c68-0eb6-4caa-8352-08dc3d53efff
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 20:36:30.1204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zc03jUkd9sZka9+qwAjec7YTJksMVNiM6WJblBs24KUr/hJo+aa/3L0QAlYzQwJpF8X1lbzYLFAXt3z+I2wFCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7263
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 20:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196650

The rename of bmap-tools to bmaptool creates an incompatibility for
pre-scarthgap layers. Restore compatibility by adding bmap-tools as an
alias.

Acked-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/recipes-support/bmaptool/bmaptool_git.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-support/bmaptool/bmaptool_git.bb b/meta/recipes-s=
upport/bmaptool/bmaptool_git.bb
index 87328af8c6..33f46d7070 100644
--- a/meta/recipes-support/bmaptool/bmaptool_git.bb
+++ b/meta/recipes-support/bmaptool/bmaptool_git.bb
@@ -9,6 +9,9 @@ SECTION =3D "console/utils"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3"
=20
+# For compatibility with layers before scarthgap
+PROVIDES +=3D "bmap-tools"
+
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
 SRC_URI =3D "git://github.com/yoctoproject/${BPN};branch=3Dmain;protocol=
=3Dhttps \
 	file://0001-BmapCopy.py-fix-error-message.patch \
@@ -28,4 +31,9 @@ RDEPENDS:${PN} =3D "python3-core python3-compression pyth=
on3-misc python3-mmap pyt
=20
 inherit setuptools3
=20
+# For compatibility with layers before scarthgap
+RPROVIDES:${PN} =3D "bmap-tools"
+RREPLACES:${PN} =3D "bmap-tools"
+RCONFLICTS:${PN} =3D "bmap-tools"
+
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


