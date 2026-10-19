Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7637ACCF2E3
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 12:25:52 +0000 (UTC)
Received: from PNZPR01CU001.outbound.protection.outlook.com (PNZPR01CU001.outbound.protection.outlook.com [40.107.51.2])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31962.1792408556773799438
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 04:15:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=EySYoVxN;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.51.2, mailfrom: upstream_ip-dr@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RrgIhTalueTGhaKmFNzJOaL34Va1VkEo3QE0AeaBZZkYVvo3y0IMESnteQDnijmhalSw9sCrAkLUNZh2hmH0LybfzwuuSaw9HSyUNmqZBJ1kVLx1Tg3qt9bCNkcTgTxTQ9k0bjsFSeBh1oi+qcmfn1hVOF0YaZnx7cG2xGZMjEv86iIc2kJEUSiq69lX9xIX0anbhy8turPtphpjtz9cucZ+bK+LgdiP+ptEpL0d9YTGyRVMWjA9aFO9gymuVC7vTKgOvA3T/hZjObObdyQQ1j9KyFmn+85Q1V1MHBM4lYopbwUr3O1AeT3Idjym08mBfVJclBv0GxP/pNhVJluQ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GV94vxRyxMEDyWiHrt9LoVq059dNENN4Qt2rl+wwTWg=;
 b=Vk5lRr+lTurnl3zCc4qQ6T9BL4mgu6e1qLyq1z+E77B9OHIbbysYfnMRcbMCXW295fs8TilTjaeyTAB/OWGSbrefPV2zgA0nTjRsobB5WJqHlfpi418qn2qLOn1H7nZswVHpOEFaB0RjT7LQb3gr2JsiL+nWKyl4asP3f0VtFY8qDXZ+MfdLIrbaTzQK6iPJV/YPeJD9821iBFsBoRBx4/xjb1/ACOCRNJ/76ed4MUc4YXdirmp/ZIb88hoQfFjiS6G2CGIqbafmoq1lDAmKD66xYKdaXg9c1cKvxmmhoAgq3jtMcSzY7k143RLo/Vyd+dpxXzhHYRuhtagWOPCgkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GV94vxRyxMEDyWiHrt9LoVq059dNENN4Qt2rl+wwTWg=;
 b=EySYoVxNjiKC8D5E1RQIGF5wUnhMNN0wGokIaYmRMebaL/8rNEWAfg7z32Tq8prCvhACElC2Hclf4KsWKtZph44GXEhmrD+Gw+iQemzUQop9usln45HNR/zCDhCKtkmwNhaH3XlWUfk8+VMSFTRggzg/4sckYbT84XYKRG5Q9nC2UvERWmN5/uHQNuqyqTC66RftKB2hoRd3OsAi63I9bor7FsTpj/CleJN+3f58bNgFp51KaRFZ0n/Tl5xbisNmpC+snIiAPknZeGugAN2Xvsc0wmWfiaMQrf6orG/X04i6MthmYJ98vyclSyjnQlOcYaAJbRsbPUibDbbLA0blUA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN3P287MB0942.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:174::11)
 by MAUP287MB4508.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1a4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 11:00:39 +0000
Received: from PN3P287MB0942.INDP287.PROD.OUTLOOK.COM
 ([fe80::eeb1:7dda:69f9:40b9]) by PN3P287MB0942.INDP287.PROD.OUTLOOK.COM
 ([fe80::eeb1:7dda:69f9:40b9%3]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 11:00:39 +0000
From: Divyanshu Rathore <UpStream_IP-DR@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org
CC: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
Subject: [OE-core][wrynose][PATCH] boost: add lzma and zstd PACKAGECONFIG options
Date: Mon, 19 Oct 2026 16:30:29 +0530
Message-ID: <20261019110029.142510-1-UpStream_IP-DR@bmwtechworks.in>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: PN5PR01CA0045.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:264::13) To PN3P287MB0942.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:174::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB0942:EE_|MAUP287MB4508:EE_
X-MS-Office365-Filtering-Correlation-Id: 9642bb13-eabe-4f51-4f1b-08df2dd035ec
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|38350700014|56012099006|11063799006|261009223027099003|10067099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info: 
	W1WDiHwwDJlo28r6tMgIKBFQ1+O/12TiBYo4wOoO9655lVI+CLKI/3AZaTorWJtUAjEe0iKv9hbVYHF5Xipqhyow9UhBSWIK1gH0Mi5TJ9DX55bHJkGfQcJ1QSRdqlngmCKa/wmQSAVs9ZxoWMvGdlJkfheeWacWjk/Y6MHcmFW36rA3CPtVRXeWgnsip2CNnyD1qwSBSr8cyEF024dcce/jCAIHBWXOiQGyu1dvhtaJV9lv8mhld7NPJrezN5+7dUaZasEEB2VK+rruFEsHg4htOkDX+SVe4w258Xlv1FBY+HSl5Y9esQHvKV1zMZ78bZhrMqzZF4p3ND3dsy4Y13bdHl/njH3GEk/P0S0VO1icPwUUSYYDp5MggS59ZlZzFIaJJjm77ZrUvZzN5wTXR38U1xo5etZGoRGkY+qrziW7o1OgeLY4YADkXknEfjZT9gixphyxL8XqkKcSolz0VOVMHh8NOYOcjt7bT4yB7EgnNPzfH1hOG4H811iyEubKed8nVMXkCDrm+VsKDmgcc+CMX1rsqnIbsxLhgsDwgbpszzM1CrUUgIgNwmTlc8eQFYah8QC6wWhUnj1/YEMih6fWYg4AIuKdNsggNBR224ajSVBvkvWD7xGxagU9m+Rw2nQfp/afUe344QSCkXl7qG51Mmpy6M/VFsR+4wEQGUmASkNiyr2sFT4Jk4nE1eVDXgyLDobahNYaTXPI4PLEv4g43heT+8QPKxBNu1hTevM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB0942.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(38350700014)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wUpMqxzDT8HjnNfllQbs9oFVgqYjSzV8xPCvS9YlvL+lkHRi0aH47n8sLJRZ?=
 =?us-ascii?Q?ekKmxRlo8A1i8ifqTHzsZZ4S1xgKJr0mdQc5Cku/sPDoeg2hm2kZwkBC3eJH?=
 =?us-ascii?Q?jDFhgCjUE+upWb9XVvedwXYELDmVSTBLq5i9IHfMzGV/WVyTJYXKQZwLAp52?=
 =?us-ascii?Q?ZpRM/TadSFXCbyslEQ022J3LfGiDNlRcrR2GqCxoLuDH0XhdRkcZejG79gxW?=
 =?us-ascii?Q?K864vjps0hw99fwK+2JrfdCZ4SOMc7+ln7UA1lrX2wXM8vmRqRdjZAMoqdvE?=
 =?us-ascii?Q?BjBoe2iBM+tHkAHEbp6YthR5Odyq5BTQSxJbwVo7VoQmiaIwjrbDVHPW5Btc?=
 =?us-ascii?Q?zNFQvldYXX7lgjUqP5lOkFmMdhzfTxEAM2kKdhXzlZXJeK2Gne1I4CJoyGab?=
 =?us-ascii?Q?O3b3m01S4iSDPyqMtVM26eibQ5WMp51HXyJIKHP+XCkjSyOlajJ+q++x/owM?=
 =?us-ascii?Q?CLrQ8XMUEbInZk13hORwNRTGGSRxtNbQz8iTXnP2ilavQ85wmvvAg0mOMitb?=
 =?us-ascii?Q?nJ+yWSkRV0LO1X9R6eJme4QyXC/6+CfETri7xR8NFNa/yEBUAkxW4ce+1aP8?=
 =?us-ascii?Q?28l2bd2KH+1Pere6GkOy/Cb7xrxzknXlGxwUQTQzLcQ2EkpPZOxqx2+pUd86?=
 =?us-ascii?Q?nPWtEHcKplHVmQ9XjsIFxk53IKbUG7Fr1uTGpoJe/o3fxXRSxhoLMZID9ryF?=
 =?us-ascii?Q?R0VlEC7vbmQm9W6/hLMYfJXzBQ608vDrq/MsfzujG8hF1yui/fgy4g22UrBW?=
 =?us-ascii?Q?kAOoSoCn1nN+4dF1RlMZSMz1KN3h1m7x8kXsZY0yONsZPkzAgq7xm+Ibz002?=
 =?us-ascii?Q?59JsnwrQRkV90b05V/JmZLalcLODggzR+N8X1Ia5bH5jruipZ7oDrbn5oEWq?=
 =?us-ascii?Q?RbEqmOTTmfC34c5OTchz14WW/gCLwmn05bvWfp6LA5DzvYzultwkTXUVb5tM?=
 =?us-ascii?Q?KJei9GKhnY/ARXiQ4cAaFMVimeE21ToqJvUVhi6nhYY/otA3L4v12SMl6427?=
 =?us-ascii?Q?+DGwOD0Lor/heYTYclNSPA26ZJ9CCBgiTGzt7ctXbYD6R9kHm+5nr4Es2nE7?=
 =?us-ascii?Q?/M5DsUL4+0QGpyJAWQqKb4V96q6XQS8RcfGHIv2OZuxfy+jC/sax06Piufw2?=
 =?us-ascii?Q?RIOGuctm4AF2dT7au+ieJqoLJaoCajrUHmAfCp2vGXeLnJRmRN/yigWoJd7f?=
 =?us-ascii?Q?vqfZ1h6TcvPj4GPMieqPWkUY3KAhUqIEvRdB0ESmEBoUSjvWFubUzXKy0LWt?=
 =?us-ascii?Q?atG8MVKGHUriAYOPBTR6HXmiF61ZbcJxovURXe1CPHMYY6VMyspxynkkKgcm?=
 =?us-ascii?Q?LgK/RsZbfma/bwokKrK2mlNg4HjUusmzdXlZXz4nDyM0CJ+9g9ohUzcPMGNw?=
 =?us-ascii?Q?uUtJ5LUAyyIMZAp9eLKoUy8XaH+mJr1H4mjmtLtUQGgoM4BfLNGEewjRiglw?=
 =?us-ascii?Q?CHzv7QXfplYi5uuNcpMmDcXWRVmgFRAfbkI/p2dzrGOQSP8wqNyXDpy8vm3c?=
 =?us-ascii?Q?NSHHqnZvNF9lWXULVhEaw7sXE2OV8SXmV74uhPkPSCtEHvCkwvgMWrpZWd8G?=
 =?us-ascii?Q?axe0JOubBb5pxBP63yktGD46lURB0kfojxlmsr3/ad0X9w43Y0nd4ULykKgu?=
 =?us-ascii?Q?Sgu1vmUQ58D4JUWHBnSFRdb7ia0kaDCquSH2jj5FnaXnHJRI7iWlWLZf3kkr?=
 =?us-ascii?Q?/LP1QUoukDadnweiYfstKS8QEX3dX7NuuDAM5jqnBIoOFzVgPNxFJ1qkiRZs?=
 =?us-ascii?Q?FAhJ97Amjdf+NzgAQ+Wmdjtdo1YvsVg=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 9642bb13-eabe-4f51-4f1b-08df2dd035ec
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB0942.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 11:00:39.1949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +B7w6getfoPMqPWn5qjpqfOxPXRsP4Sp+gTsibUpwsUKC+FS2+v/1qoQR58/H6Z8ui2z9GFme8Xg6a4SRscUYbhVunBRFOjB4FxppiThbcc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB4508
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 12:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248161

From: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>

Add optional LZMA and Zstandard support to Boost.Iostreams for
applications to read and write .xz and .zst compressed data.
Keeping them optional lets distributions enable interoperability with those=
 widely used
compression formats without adding the dependencies to all Boost builds.

Add optional PACKAGECONFIG entries for xz and zstd so Boost.Iostreams
can be built with support for LZMA and Zstandard compressed streams.

Signed-off-by: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
---
 meta/recipes-support/boost/boost.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/bo=
ost/boost.inc
index 64a57ddfb2..711cae1685 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -55,6 +55,8 @@ PACKAGECONFIG[locale] =3D ",,icu"
 PACKAGECONFIG[graph_parallel] =3D ",,,boost-mpi mpich"
 PACKAGECONFIG[mpi] =3D ",,mpich"
 PACKAGECONFIG[python] =3D ",,python3"
+PACKAGECONFIG[lzma] =3D ",,xz"
+PACKAGECONFIG[zstd] =3D ",,zstd"
=20
 inherit python3-dir
 PYTHON_ROOT =3D "${STAGING_DIR_HOST}/${prefix}"
--=20
2.43.0


