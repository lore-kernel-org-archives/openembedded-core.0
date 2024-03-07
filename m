Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E86C54E4A
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 18:54:01 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.65])
 by mx.groups.io with SMTP id smtpd.web10.1522.1709837632043229205
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 10:53:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@nxp.com header.s=selector2 header.b=MTATF9rB;
 spf=pass (domain: nxp.com, ip: 40.107.247.65, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hygbZbtzfVRy+DPSBzQMPmXZ4OlcuJlPvX2j/XBavStA7x6RvQFOfSRZ6jbcRIiWqPpFo8dYc8FR4+34wP8BbqJB4M9fCogQ+kewAlF1y08qfBBaMCdzLrWmpHol2GJWyR0waUOTdlJZpN93CC9M+KcbODhJVwW16y3oF3wKmkpeecWc9xI3QnRg98V2aelvWgJC/f3S2UaS32SZ1eRQz5raygPQobN3ZTaeuFbV0ciuRsmsBiWuMcR6iO8WoBVVn8I3uVjCHmpCLcIexsuOysuBMH6ZBLzDVCecwFycB6b//Ko7nvu987PJqtRDY8q81EXfM9bQZGpwhkc73ARloA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9aiip4jv6OKsUxdq7SMTYodGk5JovVk7xsblzaE65us=;
 b=BfoFmkq42C3ULTmZaB2/l8LZr2g/skdijVCiVCSmb+2JxVEaRzdyf1hT3GZGXWI+Xk2x3NRStJok/mHo2bfP8gIZ515Sg/BqD3HJVGfZ7/yy0/JD86l0XwN8+0aSHjrk1A+dw78FzyOlXWGmIMNN90Oxi1YEyR7r0G1/PlJ8gKAQuphF14QfsLoKw0tGSmbS14wSXpBzJyuxA3JwcYt6VMwAlngsYqb876uk/EotTMZBdaDHOWq2I+ZBkHdZ2I4kX80CgDMBQhbjvK1jy1X6TQ0VVIN26nAlSF7y5IYQMPiiNz7s0EOf9b+mycBLL3ekoPrMCru9QLZHbpgF8BmUiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9aiip4jv6OKsUxdq7SMTYodGk5JovVk7xsblzaE65us=;
 b=MTATF9rBWZ8Hm/PhFvc+tDpJy2yKOMjeBLM+kcPVx4jo4+MQTkOPj49YpP18a/WuoH9Bcbsc74as7FOq4K3+C5f8fwNMtcbYAw9pHn8z3Z2GoMJx6Q61YQqX+tA8q6VVDttus4rxNrytKyGF+296jMHgDLyGo0qmj85BZFdINuo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AS4PR04MB9622.eurprd04.prod.outlook.com (2603:10a6:20b:4cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27; Thu, 7 Mar
 2024 18:53:49 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::98a:d1cf:4bb2:7f52]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::98a:d1cf:4bb2:7f52%4]) with mapi id 15.20.7339.035; Thu, 7 Mar 2024
 18:53:48 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@nxp.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v3] bmaptool: Add bmap-tools runtime alias for compatibility
Date: Thu,  7 Mar 2024 12:53:26 -0600
Message-ID: <20240307185326.3048309-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:a03:254::16) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AS4PR04MB9622:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aee061c-8fa9-487d-e167-08dc3ed7ec77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uSsGkIpOCy3RPHBx4IG8OL40N5TYDmHyozVeCv1ZODxm6HExoEE1UAUcFi+BNYP1huDpyWuQoZea9895utbBVKPLlsTFACTikf35wXaZyrvuRkjOJTldR8OLo3q8gPYWXiIMkzUc52l9ttNJynSbdtSZIrCXY4zsuifErU09E6oKOTpVpOD4tTvIqi3/fPSgjjvRN38noyK+F1831HrhgjaKLda4ACfpM+V9gqlbFJc46Un7jvHCv38h3vLY92YFnl0hYMYd5B++1L0r3Hr0yecSk6Jx8aBWC4AB4RvD8UJRx9htm9UtvFDVD9+Va5VQBOkCut9EBeExFkQdvuEM3Bpe+HQUpDxSz4zzHfA0idX5bzRt4oj0aLacQ/53Rhm7jBZoMqZT0jCsCij7rPl7j7upigbB7VzqOQcA2IfU/G19BP9Dh/HLMLYqwQblIOPwVOlXBpu5BAXPcY0BVIc1tVRWErmIWw6bZrN1olPJYFlN1cercBYL1YriN+I0LmMAML2i5a0y2RZXi2+HN9dtMXtJwxJ+n/ldrgJ5oq+y1VxZSl5pMlskPPzxyQ2ai+iQUuUS2yitixC714KkGGIs5mUNRkiMoU0n4n2jTs/qW8912/g5ktLdwr5VNc+823R32ASQS3x65/walA5JrBDSBF11PyDPORhxCBT7szAj3WmaTgcG0DiMKsD+4blgW9D0W7lhsYWcE5IiVK35sOZceUI47n4xgoprXmPGbUhRX8U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cZgS97yvQxPpJbq4Wu4I+jrlf6pcatTnC/4RsEvevsvFHJupg5+hz6ec9O0d?=
 =?us-ascii?Q?ZHWIjgT2ylv3HrN2OXk0YG/6hmOkH1g3RIJ3la5rsgOSvdcKbJm6YNaGEfh6?=
 =?us-ascii?Q?g3Qu7IEr1ldND2DmSitgbhfKD2VFnGJTQ4XmvHHP6bT6aZO43MQF16foTvPc?=
 =?us-ascii?Q?E68KyIGKsOCG/UA8OFKVyg/uqlIbqd4ur8tJmFNGAM6Y8Kl1mG2R0Z8965sZ?=
 =?us-ascii?Q?IKcW1wEwVwbfWfqy5Vr7YauON4el62+wMI93AmjBbII0HTGO2vp2KWgkWsnG?=
 =?us-ascii?Q?L45KcpxpdA6xUDU/hm6thR1i5SjE41J6T4EQR/77ETCef55x1dNBYX26mNt+?=
 =?us-ascii?Q?ALvYDzdlB8Ie8q8CD11J6eDlA96R/MfwNIU30eHL5XdxtE9jo8JNPy2n4W1J?=
 =?us-ascii?Q?jrnZMzIJLAtGhhAcYVmfepJiiS0L+RCB1tSRmPpIQhzArJbkbL7U5ST4t85H?=
 =?us-ascii?Q?Qiu8YNNQWGgmn6aYVO1Is5lMLUNfpm56Ugg55FrQ/NMpBwf3JRklbXUp2Eo3?=
 =?us-ascii?Q?EWumQKHo5nD9t7ARsFL7aF0uikBggs2Jzz4b6dNmtXntqqwzO7oCdGPNBOAR?=
 =?us-ascii?Q?jRm10nZY7XawO8aJ4LvigN948KBtpry0Sm/LkLnN8YBKjueFtM09IyOlKGXJ?=
 =?us-ascii?Q?gx2YMrqySnXumirEYfBTv/dDk9aaYRw4wRW2+32ip/uZAmpxV5LtPuJFv05J?=
 =?us-ascii?Q?1dQ5Ygl3Dx3N6JDiK7g5OjlMokgXyFCtdh5OjMu+ozIzvWL7P+Mxt60z/n7d?=
 =?us-ascii?Q?R+Y36LNnt99DRYdrX5DECRCrQN6BOaVQHZLXqencCHbj3aKmoBV2S+JfD9ZE?=
 =?us-ascii?Q?tac3mwrGler6R7Eo2w8AWnXuYSiPWwnKV+83k4vb1q1sW55K3vpN9HIOCTJf?=
 =?us-ascii?Q?T4d9gMO8rhyYWUiRPiVDYIbI7yUuH1i+PKF7SQ3soQkVziCuTe5jun3C+wm8?=
 =?us-ascii?Q?bi8L75w3Z9qOhh7Yq6TmBSTiOvvP38a9Y03teJxLqq5znwuyYqLHiYdn4F7v?=
 =?us-ascii?Q?7edj8xTH4KX2JPB1oihMXo2zTGxogr9AwtNGPhK2j19dSZ5DklD9/m3rm+NZ?=
 =?us-ascii?Q?iVF/cX13EBJ4uMbJ4yrBf5oUxLsCG/lQWSmdQuUB9ZcQ2Jd0z+j16OcfvxOv?=
 =?us-ascii?Q?Jk/x+jHquLeS/q44k84OMoL2bn9qUBovEuFgy0AwYUeZCLdsb0Qyaq+K30Xw?=
 =?us-ascii?Q?RcbxrL2fEjcH72P7ueu0j+gzguI+pv7UccQU+4/tPjrLRZ59mh0jZQRPWcw1?=
 =?us-ascii?Q?9xkDjBYmWEXr+11R8Vbuv8TqHIgfBNsA5S2FbNwV9CScGtNlme4wVHlB+jQW?=
 =?us-ascii?Q?nmkf5XfG0Gv+q9LkJF2Z/VeWCTl0FOi66K02+u9Uv4zzSqYaVHWKX3V2wuyy?=
 =?us-ascii?Q?HaV+HvvstxfJxId968lD9qny6DosINa/X7yykrbBM9guJ4hcfzIo1KRejHbc?=
 =?us-ascii?Q?4ONfKMkSBMviOUTLELAWo1iIClzpcjGGAgjJn1ZvTamTBp7MEWfoPcootJJl?=
 =?us-ascii?Q?y2XjxVaGlXLsrvf2vns5dnovppldhDJbs9TUnpkhue1iZjWNgAHt1bTcCiPb?=
 =?us-ascii?Q?cNOyMj2zxXUfjEa1tV8h2UiBWYuKEYbxgeG1DQV4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aee061c-8fa9-487d-e167-08dc3ed7ec77
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 18:53:48.8810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KXXc1QDgU2TLwI89uG6eBYmLysPmDvcekoCaOPfqa7uI9r8gmjwGD/dJJAUJa6aupED9/hhYJ2+QnmVjtFP0gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9622
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 18:54:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196817

The rename of bmap-tools to bmaptool creates an incompatibility that
will break package feeds. Restore package feed compatibility by adding
a bmap-tools runtime alias.

Acked-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/recipes-support/bmaptool/bmaptool_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/bmaptool/bmaptool_git.bb b/meta/recipes-s=
upport/bmaptool/bmaptool_git.bb
index 87328af8c6..f706477323 100644
--- a/meta/recipes-support/bmaptool/bmaptool_git.bb
+++ b/meta/recipes-support/bmaptool/bmaptool_git.bb
@@ -28,4 +28,8 @@ RDEPENDS:${PN} =3D "python3-core python3-compression pyth=
on3-misc python3-mmap pyt
=20
 inherit setuptools3
=20
+# For compatibility with layers before scarthgap
+RREPLACES:${PN} =3D "bmap-tools"
+RCONFLICTS:${PN} =3D "bmap-tools"
+
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


