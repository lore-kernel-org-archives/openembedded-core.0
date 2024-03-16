Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5685DC48BF6
	for <webhook@archiver.kernel.org>; Sat, 16 Mar 2024 17:36:52 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.86])
 by mx.groups.io with SMTP id smtpd.web11.1974.1710610606813235036
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Mar 2024 10:36:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@nxp.com header.s=selector2 header.b=mBympVdA;
 spf=pass (domain: nxp.com, ip: 40.107.22.86, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQEsHCx1r2NIq5P55AUN8KLTtpsvVOb4zoKOpPfaxZQJMyBjw1fUamdTm1/QL+96hL1YiTrWlu1mer8k+rTpqvzXYxzA0+V3Uj/vRR6OHmq1sBDAWYBimnhU8wzlTlxN+QHzXMtBjr4XJZPymDFGc5935PbFgSqOfaIRrvxbpjgzL6kEYaShPYH1e6yLnfQa9tKZIK+oXHsDLYooS+9jxCSgfo1XAa73ipvhXELXCCKZCDK302ClgpyTtvuTDmoirHRfgM9OR0VMzg88fGs+FButww0byeUFW9zQS9muiQEr0aqA3nZ2vuaul8OIDvkH70OXxizAQ3yLunspSGb0jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXkJLG3pHyTs/hICymmJvVMjZUSCcyFOtrKFDiqGe6M=;
 b=cT1ElPRKacFsDQQIIF7wHvDORTxXdaIx+oeTG7pkivGHafAnUEsb015B7YNiT6jEJQXIAC9U1JBjzxy042HHWDuDyv4UWSaoe80aEp9ctm4sTCsfPuLDtvqSVrro4dl46MsXjSKhkk6n5o0c/V9QA3Ok8UmMVaWD/AY04S1thJ///Yzkw1L/FjJNgw1fv+1PtHCQnqs15Wp6fHL0n13H2iLFDehwsBc2o/Wxm2eepCLSe+eV2Zd6ph6jaeBJP/sV7eQaOclWi9AahQMlfZyLB6t8SyMmGmtQZQdt35n6l1BCnNnL0g1aRtJ//ccrFq/aGZMe1p9lcpgDoCM+QrooxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXkJLG3pHyTs/hICymmJvVMjZUSCcyFOtrKFDiqGe6M=;
 b=mBympVdAPbM5GWbcY6bOq+JzaGGFmnaJnqNKsVDqSoEH295VmrRRduKPwpjunrzf9JcvlvLF9+7WliUg3EPVm2UUV4YRc+WwFvb4Dqj/kZRrshpsRo5pR41BpeHF5OTXdm4FYguPTQGXnO3IuIbXP/QyaqqVvBtdHEVHxRCrDnw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9444.eurprd04.prod.outlook.com (2603:10a6:10:35c::5)
 by AM9PR04MB8162.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.25; Sat, 16 Mar
 2024 17:36:44 +0000
Received: from DU0PR04MB9444.eurprd04.prod.outlook.com
 ([fe80::5a98:6e84:b9ce:1e26]) by DU0PR04MB9444.eurprd04.prod.outlook.com
 ([fe80::5a98:6e84:b9ce:1e26%4]) with mapi id 15.20.7362.035; Sat, 16 Mar 2024
 17:36:43 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [PATCH] toolchain-shar-relocate.sh: Add check for missing command 'file'
Date: Sat, 16 Mar 2024 12:35:58 -0500
Message-ID: <20240316173558.468284-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0136.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::21) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9444:EE_|AM9PR04MB8162:EE_
X-MS-Office365-Filtering-Correlation-Id: d1898146-85eb-49f2-6ee3-08dc45df9e20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RV5NQTFjU+0yvNTedeQrSVB6YkieEzE0Q2MzLt14IQVVqO+aWv6et9spiOCb0v94G4Db7lCT6GLFCzJLNpd4Zqp1Z0C4KdR31MiAFPt/bepBK5pPRCXJidPplrmr9nRKtKvY9jFkzFqOg4RcR3lXjZnZV/YZ4e89BIfj+W8DFoMEPpUZDZUBlIYVXq8HK1cbg7SyQcqAqu2gXAhg2WC+KHS1jkWFdl2Lf0a7JFwrrqPSAxDoOYQfcDh7KF2LiYRs1JbHQVY162ZwaDQN9/0H1JwR/peH5e0bPtBvLdS3lNwur3KaMzJzAM7fOTwdM6dN/CXGgKWMWWwpO/Bv6zfSyZor8UrDjydRHbSB/FcFaNyfO02Mpa+FggoIE5wS3sUOP3wlxsI0g4or4R6hQUxbP/SN1nFItuvKutaLTI9DRizCtdmqLIwlVa5fO3FO1fjj57tmV4JdE7KOW5NOySfuuh2CD6LOkDnx9Enzc4+jb+sdFjTdeAA0oQeZRJNiVWnsJu7zqVhhgh4Pc4OpsS70QXdx+knigZWQ9qOwx9TtV2V3WBRPiAoNnQZvzt1yVidAv12zYXThOEC8HNBXqT+OgnSyfDNYZ7xkSZZ3XngpDhlTc8vE7PSJi8JaBBJ+4uYn2qScQdFW9R2oNrMAOvJK5cnv4umcKJjtHE5Okko8Zl2+ZFV/KfhB5QQssVDg1XTgwCuNC6CLcwcHFYCItoKO7WuZ0cGh6R7GblyvFhOKH8I=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9444.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(52116005)(376005)(366007)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gVzGSyfAMv1da1mXmrOwd5ZTxL+51af/qXowTHvsgxtyOZpM/qXX/NwyrwVt?=
 =?us-ascii?Q?k/PGRkPpCnjDLwA08B88DSveBzxbBeHXn8Ut4Gb7AMDY5XafsjZgU7Zj00X7?=
 =?us-ascii?Q?2BQjvyrRPRlOZ1FhiQakNRGBvDTefmO+k92anphRS897jmtpN6e33Rfy7Paf?=
 =?us-ascii?Q?fI1ipyn90EM5pTRL/1yX05tClGEb/CyWCVFOVWufNqyhHF99RUYd92dre7sn?=
 =?us-ascii?Q?z4r2w5TZAPWGk9QTUhIqJQXbXr4x4ax05aozTJ6hAKtnzoojSRW5NiUMnqev?=
 =?us-ascii?Q?lmc4LYjzL4qmePPBZwQ4h4i7384IBLXbGrAO61ijpN0yMNV4xjCS+nXmv96v?=
 =?us-ascii?Q?WFUd1m13khKZVEJAAKbcs79RmSwaDs/ZhpmXoRDjwYswrRXw7i7AQ3tJM6Hg?=
 =?us-ascii?Q?blvvgHt2q5tEBVuMAztwuOdCJUFwwhmmkoaTjovhZuCgFUnV1Uu5zcmz1VXI?=
 =?us-ascii?Q?Zan2RFlUJzeul3i/ly5AvwD2rSiqiI1W2Vux2Bqm7L10oAkBm2IVvOgsrNHR?=
 =?us-ascii?Q?CU3H4T2ej20RCENEOwGsf34dZmSNIbeFw7gKP+JbGcOC2kYBP5IFnLmZkPIg?=
 =?us-ascii?Q?eUSSM46HEnC5VZ6qI7s/phDqrc4jnaZI1WcXXpjxNSk5uAlKmwLV75YfNuPE?=
 =?us-ascii?Q?ry8i6dJVdo4Mx4Vb3FXCoQUg4Xkq/E1VVgHhvrpCbJZKc41bih4vCycM4P/y?=
 =?us-ascii?Q?T3MeLLgCYXPO2RjLAGv2rpKbeGOe+KpNx40Y93rYjadYmJckoYab/Rhzx/Mh?=
 =?us-ascii?Q?NoOeb8FTNVZmYCBGDJjCvIrzn/wyqRu39qTnJKNoraX9Px7SZ6ntyPMRfhVS?=
 =?us-ascii?Q?QRYJ9vnaCeSOcTC5s/8hvB1sEaCY08pWwP5BwpTnJJPMRZfoUlabmT2m5BCA?=
 =?us-ascii?Q?tjlmoywEbhTUd+t32Tr2ejM/oHnzqts/fxzGM8V9w6OuLnQ88FaseX2P6IDW?=
 =?us-ascii?Q?VWaqvdi+Q2AQto4sAmGQxwDYPJyKZ3ja6p1/Z1C7tePu2hnOPdA/RjdExAM5?=
 =?us-ascii?Q?U+ifOsfxJNJqoJeHYkaockuXnTeZlVQRF/9XE+KdYGl5TQYS/RXDu/C5/GJS?=
 =?us-ascii?Q?zJAGbgq+FLP/tQZJvuOC8NRY/1BILbwr7HpyI5AP39S35qNA0cjROCgF+4nK?=
 =?us-ascii?Q?aLnnL4TeHJODvcstp06qBktG8y+3uUQPK5R4ePsXbUUwlwtaZ1k3Xbf8K3y3?=
 =?us-ascii?Q?QtUSQQQ/TJoy2WhP22y8IMJruk9ijd0rAQ3h+COUNsr0tlER9kgWe9+eo4LM?=
 =?us-ascii?Q?V61pKQhSjf2AgydBIE4sj5o5MxMc7JWHGEqNE30cu+pIIFY880SwqSefk4eX?=
 =?us-ascii?Q?HHBHDHLbwuzdvSgfo4oY0XZewPcQsXqJa8tZ4mNBdnmyqmUrbZDlNVDettBI?=
 =?us-ascii?Q?Kn6yOE2cIGHqkhw8K+Giepw/9eCba+g97y+P3Fmmv+cvAZ88/3/1zD3vJLKZ?=
 =?us-ascii?Q?bqXZYIhjUL08CZs2QVLk31LG0JlBVAQZkP4L8Tc7vBL2tzdPBNeq9RqISXSl?=
 =?us-ascii?Q?V8+Y1dfRzkyn6Hdnjra0rpU5qw32dDfmVQwv9Vqvx8dcBdTYiPlWPiLQI31T?=
 =?us-ascii?Q?sr5Pr7omA2x0WBDy2PoxMX3hKGMQS5kRKDQddY24?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1898146-85eb-49f2-6ee3-08dc45df9e20
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2024 17:36:43.6159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /hb0y9dakb3gcPhAzDfNxC+U/kRB0qGsi2IoHHfqhm80P2b31rGpAFGZU5KxdFWTX0+KXf6Lmt0ttnW0Qwbfdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8162
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Mar 2024 17:36:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197256

On a machine without the file command, the SDK install fails with a
cryptic error message.

```
xargs: file: No such file or directory
sed: no input files
Failed to replace perl. Relocate script failed. Abort!
```

Add a test for 'file' to print a clear error message.

```
The command 'file' is required by the relocation script, please install it =
first. Abort!
```

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/files/toolchain-shar-relocate.sh | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-s=
har-relocate.sh
index e8ab357717..3d55e38102 100644
--- a/meta/files/toolchain-shar-relocate.sh
+++ b/meta/files/toolchain-shar-relocate.sh
@@ -1,7 +1,9 @@
-if ! xargs --version > /dev/null 2>&1; then
-	echo "xargs is required by the relocation script, please install it first=
. Abort!"
-	exit 1
-fi
+for cmd in xargs file; do
+	if ! command -v $cmd &> /dev/null; then
+		echo "The command '$cmd' is required by the relocation script, please in=
stall it first. Abort!"
+		exit 1
+	fi
+done
=20
 # fix dynamic loader paths in all ELF SDK binaries
 # allow symlinks to be accessed via the find command too
--=20
2.25.1


