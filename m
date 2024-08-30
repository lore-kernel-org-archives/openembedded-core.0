Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A6B1CA0FE4
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 11:41:08 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.126])
 by mx.groups.io with SMTP id smtpd.web10.11461.1725018065847746008
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Aug 2024 04:41:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=UcF5vOF9;
 spf=pass (domain: navimatix.de, ip: 40.107.104.126, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W9GSyxllHodp8phfxrGptcFTmTmdkgq5vG4b8NZmENQNR/6TLh5gj7aS9Qi2ZA8BorUkJBATyJG1CtVLiUrB8DfKP4jZnvEL+oJ+vNQLeml5PifKQGmQ3+MDUA+VARchk3WnWGj70pECfsQMzxkF/9PUlKvFhVZf/JeB6/eqOeTQmxeV4rtFvS3cihy6C/kJFVwxZavn1NDeI/XfZo32hwbuiEA3c1Sh6bNPGHkkBb0u8U/orghItlwt/dQPvoSg4yKYKTBeGqXVDkXVzrzq7m2IP221ZG3ZQ5m3UCptgxX1S1RiNSeO73ZYx4581Z9crozMpj7qVu6kabCB1GaZpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+EZaatxdNkysz4pctOKOdMDwy3O9fCfjZ09+stU3p4c=;
 b=fZRD0a060GH0TrEwQrUYGovPhOyxwuDKJ9H6xgTlm9cqRkTVbri65+1L7OxutdmYoeJ/cgbcfwvfwHyim5F4yXePgqYvEpOZtif9VvnY4+wQtrbCl3VG1Mxhh+4gReRFX6SuStmo1zPpY/bX4pmk4VgMbh/Jpng8Jy6yCqZ5IXUNtsEJjbEjsGYd762nfzFO+VVRMn6Db+khvY7s9KXeq1dsQyLCpRz1cwfaq9vFN0aIJZ+rxm7oerQ6YZgty51UAtJ0USLHc8/rSThp/R9ylaUjoxQm+pcD4SehXukSBKYqV828Hf9YnZjB7xU2j1C/9iKcmaO1gb5r7j63OB6lZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+EZaatxdNkysz4pctOKOdMDwy3O9fCfjZ09+stU3p4c=;
 b=UcF5vOF9lAAVxUVifS2h8QGPWOKEqlPwctbg8hMF4YW2xH5uOkXaPyBFYi8zAw6iLyELA8cM5NlSMnkVt7o3A7Zn2h4oos/NivJHllMXR8/PKc8hzDt+gUdD0+NXoB3yjDD1gG3YPOteJpcO0X5V3FL4Cr+J+9idgvctDv3H4i0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by AS8PR01MB7591.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:2a4::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Fri, 30 Aug
 2024 11:41:02 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%2]) with mapi id 15.20.7897.027; Fri, 30 Aug 2024
 11:41:02 +0000
Date: Fri, 30 Aug 2024 13:41:00 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] buildcfg.py: add dirty status to get_metadata_git_describe
Message-ID: <e167d13f366079c3e87ff26a34741c8dace0cd34.1725018060.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE0P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::16) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|AS8PR01MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: db0b15fc-9895-4d44-db7c-08dcc8e8a02e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OPCpS6hWvtna2y08dK2Spf3hbS+iKmu3re/4XKsZJX4j1dZ9Alt0QvPI4gf9?=
 =?us-ascii?Q?4D0T4FMV2rgXmIf32Xzs1nHd+5ETo0tZjpS5oLVfpWSokpAfwu+N8NS/IaSg?=
 =?us-ascii?Q?U6bo4Gd6aN+sxtOdhfzhHhMvaKRlSjUBujarmzt3yu01mH3x6iCLnJW6nQYd?=
 =?us-ascii?Q?8/vqEjVp9V6EOEuKb4EB9TJwvRfPY7TtU7pk8Ae3F1dPAeaplHhaY+sJkZuP?=
 =?us-ascii?Q?/G18p1lDiX1Tdu0lPD8XerigAwuxBcKo/xJ5nDpgjcEDH0rI1N4NKPv9r5xg?=
 =?us-ascii?Q?n/iLuy3JVReY/bPqeK+0v8V7GVnlF9V189aEUVZlSqsqT2LRBtiGGtPhk+R4?=
 =?us-ascii?Q?MyR2w7BGA5GuyFFURVMEswq36YpOgpSX2r0rav0T+Qu2rVhupHS+PKjjL7cJ?=
 =?us-ascii?Q?hLj5Wx7Mper0Ma+y+I7CdO0qRAdwx5J+YCpMhrNNSRhBctNW0utqi4ZK8Msc?=
 =?us-ascii?Q?AzyvyD95NnHUgS+5xdWC1rFPTlCUOwqYYV5wYTHQZRoXyHcWIErZNlt5AYGQ?=
 =?us-ascii?Q?qlufxK441fw7W1VSwwe1baeWT2lPSYG+ENUZvxniF4D4pFKtRONembAlGnfn?=
 =?us-ascii?Q?cp0g+DqEZUMB5swaX0a64H7nf+wMqCdcfQ9KSKM/fxINJt3QAQgkq41+5HDP?=
 =?us-ascii?Q?zVkW6zB4Lbz5ULC/4hTE9hr/plK01U9PESbtFTDjzsAGXHKK5kI6VwNHjuVp?=
 =?us-ascii?Q?v2vn0pq7AfllwtLyTExwuvAW6Oj26qd05SYOP9+1X4aMnjmolsFt2iiMexDH?=
 =?us-ascii?Q?n76ajnD3eaKONdgW8+Ug4rAlJ5wgB9lw4hHM+xttta7TFS7XL/x0pNBk5k2U?=
 =?us-ascii?Q?p+f6IVNFjYJPfZe01+AdUMNdSOcRDfI/cIvDkgBDAyMidgY2m89kUaDX1bVC?=
 =?us-ascii?Q?e5Mpb3+XiSmAeZQGXN+/Z9e4ZMwgopz+tcmg95IVq6Gg9i6IqNS+R8Q0Gq7P?=
 =?us-ascii?Q?RuMoorksE6mj3gya9iVsbYf9ofa8uW+JPeznnM4VERCbmgAqiDDZ/DbaVM3y?=
 =?us-ascii?Q?EoDFX349LckKv0sjDn+HYmr2FLVCRmyT66xoWzaAB9iH6nXaBGg/xMAXGeRU?=
 =?us-ascii?Q?fCtZfPiamgH5vvQyiOfVueAxOuyvG0FFKFONyOo2STPRd/8MQJOzBMA9RulS?=
 =?us-ascii?Q?w4q8YKehKUaUTN8Iar15EHjYlEeWAuEzanncNV/n9ScOywjiCcKyKjiPyJnd?=
 =?us-ascii?Q?pSKdj7JWMpHodBXpC+1bc1XHG9cpd/NM3eW5rYDUZjCWnKHTJ/1XRF+0mUgf?=
 =?us-ascii?Q?gb6GuE9vNtzDKm9fxijcQwzKrjxIW/jVcPvo4xDccS9PX609CdYniqAQNbwh?=
 =?us-ascii?Q?EaO5RT2fACdXhkZ3d3rQC2wPWw99VfaHZeJbm92iA4ccJw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Xc1ZvgAA3+u8h2j9NZO5ZnZN3sCs6YcOn8NIUdPLcSQFKLtpIVNA4zRD/XS9?=
 =?us-ascii?Q?PhMyZiLauhG0gEo1haPI3uEYJfNvMufHjkxVy/OfL6YDGwi0m0At8p+smI7c?=
 =?us-ascii?Q?2eve9Mo61m60ZEpk2Jn9NkfYQkG+doNkpOrTYE1RTdkFirySHL7czI9tTGor?=
 =?us-ascii?Q?Hu1D68pVB2553tcSDXxFXxK80uRCfSAmOL/EuFvhcPYE5YO0PDqsaPD3JYgg?=
 =?us-ascii?Q?EVuljgjHCi/cZYSNydfQXYKJqPmaloxRfSd88rrE/LEHfICAFL+ysF/ko+Q8?=
 =?us-ascii?Q?76ShH2+RXlciZ6i97RqhClyACjEYC4g+ZYknZOuCg0HJ8mfktbEOIBPjeMML?=
 =?us-ascii?Q?XG4KKYiOtVIpnQLbZ58nFSEseG8S/vkf35mpNdt7n6/NC5U+VB18iHurr9d6?=
 =?us-ascii?Q?9RBglkyPRUKr9u05qq8mxyTwwLvnaQ5UwEbUeSYdDF5wgp4+EiZgp780N1+e?=
 =?us-ascii?Q?GIkaR0BbHO5aYrh7ZWwld6yoIAEuzE5eaWeNnivEagtxKizED+/XD4n8G0sU?=
 =?us-ascii?Q?1u7SoUtCi3sNCB8ECscammBCRbrevGDRPL7MwJmdgxH1aIxuRHRnBybGZlMD?=
 =?us-ascii?Q?oZTYjMryL0HSZtdn2skPJQPiu5I8J5rfSOTqHyJ9p+OmBJsiBRcKOJg8nh9m?=
 =?us-ascii?Q?oUH+kLcbpdJhC20UEmJ0Ayb+fxH/nJV4t1UOlkKjAovXniFuTEraBHv7WsD0?=
 =?us-ascii?Q?Aqd++ysPpeNq0n7h1w8oy6VCC7ynZOwRIqG8rT4M7g2P0wE7t10BiLQ7Ikkj?=
 =?us-ascii?Q?TKrkPVEDvnu3CW6ZTuCfAmoefGelL9VRTx+pjwWL7xSF8irh5HjHZwJtJb3j?=
 =?us-ascii?Q?9q5xoRj/J9dnnfZbEK7Rs0L5V8oKDxfrXqvO4Wt5f6BMuH/DQdQn3WydajYF?=
 =?us-ascii?Q?BR/TEWouwHsIu7K6vL5xHG/nINrAEewh6QfYmBzoFQSUZ+7ul8hhy/z3auf2?=
 =?us-ascii?Q?m34FxQ4M6Ad3c3D2WkWzY30dGsL1VJafTGfbRHMZlKFWOgabELtxDVNKEQTB?=
 =?us-ascii?Q?0KCWInFj+k2cNHYerWSR3msl8Egmyas/N5FDeHsdGR72GIh6QDAJZ+RX6qIg?=
 =?us-ascii?Q?T/kdf1ptz6XHGKlCMd4sTrNQWfeE54KBiMBHFPpsihEAOrqpqE9AOYBUQM77?=
 =?us-ascii?Q?fhLjJ8o1+403N9ajuwWIO/VyuOPY+R0FT0Tbp58kUZxCwj2LnRK9LyRkKxYs?=
 =?us-ascii?Q?FvwXZoPpir/iOWmlw52WBXpG19ZLUlHgKKGGNpMRSbhcKT/ZjfB5XJcTyMNJ?=
 =?us-ascii?Q?LmUX1INC+HpgWyaqtCLUb40syluXAlghnY2JKYfI146yASi974Igd3Ut2HVP?=
 =?us-ascii?Q?yZJsLz0B5GE0BZQ/xvhBzwNAUH0F9CHrQifHYmDDqfJ5zv3vXiC06Lq1z+IS?=
 =?us-ascii?Q?l8N+PDfs2dXgYLI5Tjx0jv2zaDwtv61a7+HEvzWzq6IizIEn54ejwYglFKtw?=
 =?us-ascii?Q?Xmf02rTAFI00jq8sjTqmJK6cYn6VSONG88dt8NcJbAGayJedHYH4Ap7P4lbf?=
 =?us-ascii?Q?ors8h76M7UTwD9Wt7vYMMDKK3WRydpqsykjwii8NuTe4lkP+kTSyKpCxWlb0?=
 =?us-ascii?Q?tQGnKApJWOHw0UUpsSi24eyxjpI9Nz/yoMtY9x1T+G0Eemr+y/de8RbHI36L?=
 =?us-ascii?Q?3w=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: db0b15fc-9895-4d44-db7c-08dcc8e8a02e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 11:41:02.5779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ycKqb8QmQjzsrzZI1cJpy4XOY+1a2GPebJeRvDxr2nq2FNvC/a7MH4r4MFDXtz2u/q2IJnIztV31HWGfsONBJL4NqCk4R0Z6Xc+MYuJRcE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB7591
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2024 11:41:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203958

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

For postmortem analysis it's helpful to know if the build environment was
clean or contained any modifications.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/lib/oe/buildcfg.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/buildcfg.py b/meta/lib/oe/buildcfg.py
index 27b059b834..4b22f18f36 100644
--- a/meta/lib/oe/buildcfg.py
+++ b/meta/lib/oe/buildcfg.py
@@ -52,7 +52,7 @@ def get_metadata_git_remote_url(path, remote):
=20
 def get_metadata_git_describe(path):
     try:
-        describe, _ =3D bb.process.run('git describe --tags', cwd=3Dpath)
+        describe, _ =3D bb.process.run('git describe --tags --dirty', cwd=
=3Dpath)
     except bb.process.ExecutionError:
         return ""
     return describe.strip()
--=20
2.34.1


