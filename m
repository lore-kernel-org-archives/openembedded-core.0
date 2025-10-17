Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BBB8CCD199
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 16:54:42 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.6])
 by mx.groups.io with SMTP id smtpd.web10.21600.1760720077798751028
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 09:54:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=AAwhOift;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=AAwhOift;
 spf=pass (domain: arm.com, ip: 40.107.162.6, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=A/QJZWEqckTxLQI4IUpO53SEDhx2eeed9rJxBKS1Mx8LkBOKQDmGYQi2ex3BL5gRk86CHqU5jhvR59nCogLfwewyrINhDOHJiMld096BFmIur0gtPhsuOeF/LjPTN9AtaD+xrUhx36wDhlyL9CDNo058P3Y1R45PKoeq5CIxEWTKqYRUv6y/q9uHOw7UOpwAi2/SnvNlIPFxS/UX5ksDTaC1zB+Q1nX71VKoj+x9F+ors+KV50cWSZIPq4k/aozU+vKHeBiqptPn+pnIWx7oALHyVI/bnBeV+ICr1BDtaP9zaCwmBe+yBpR7ENIO9BbuKeMiBScGjmXQkOLKsDUxEA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0XhjPFyM1H79UfFyZWPfr0+Wz5oWOs+bveH33EPVXQ=;
 b=HN+4mcS7BCA6EpNNJ8CL650UXwqoOYgCbXXX0+9t3ksPCKxuFRhsmHW320cmnmagEFyGhHLprDls7yTKqJH6kkOTp4FdBG5+gunHMbLQ5x8xhrFe8PJGjeO4qljutEZjUoZLAhhSQ8J9PJMGcvccIwqdh0aH9ynikgwnQGh31nJaKG0Cyz9cDSwHzl/AwpmVHc2/sXth6M3BNUWYmWEzvavvBsJqcjLNoiY3w7gQuBMvZLXfobh8QbvZYtJnCNj/+GfqvuYHr9vcvWNPZu9pyBHhX54fiuLj0LZzGchYi/dXfuum80OBM87PoesQZnRYtPcCPd/6ypGMwBw0RpsyHA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0XhjPFyM1H79UfFyZWPfr0+Wz5oWOs+bveH33EPVXQ=;
 b=AAwhOiftMXNAZIbwJ+w34DUpQKz/CV7EsbdNzCIDYKYwVC9SR3tjicu3e6U8e+92Hg8n5vFcuermWTXELDBc3C4OG0MxThpYBvLscuWCSnYCBzAFEWcf1uJqxiceDE345Q6rl6yCBQ8ZjbxyUsG55mWAjsbd2MLqoXLnIB+CrTQ=
Received: from AM0PR04CA0067.eurprd04.prod.outlook.com (2603:10a6:208:1::44)
 by GV2PR08MB9325.eurprd08.prod.outlook.com (2603:10a6:150:d5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Fri, 17 Oct
 2025 16:54:29 +0000
Received: from AM3PEPF0000A78F.eurprd04.prod.outlook.com
 (2603:10a6:208:1:cafe::cc) by AM0PR04CA0067.outlook.office365.com
 (2603:10a6:208:1::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.13 via Frontend Transport; Fri,
 17 Oct 2025 16:54:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A78F.mail.protection.outlook.com (10.167.16.118) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.7
 via Frontend Transport; Fri, 17 Oct 2025 16:54:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=okLnDfzBD47QBaxU4yE3nMGfiDSOeAL4Ro8jfZG0iesqQnet1bfFl20rJZ9+OuwqytF5xuCfVrQWze14nmmbiypDjE52M0WjDVWjVdq9E1WghNMDfGUy6T+d9i1WPgqDbUqnyiY0fXIeuNdC7yZgEym5uq3hirRrXNkHjCzmTgSEOYtkdoCGD9zxSr83Z+imyviKo2RzmKf44nQvGRl5Jr9FqKhBSEU69rIVF3REaS8a5u+WJRwwy32si4LM2LnzLTov4bUo6xeL4vK/pvoGD6Wx8fnObIVyfumwIO8MnvSnDpNHUYcvEFAxuZ1KpXnaANo86lPPrid9gT5YU65l+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0XhjPFyM1H79UfFyZWPfr0+Wz5oWOs+bveH33EPVXQ=;
 b=IotyLWMz8+kub2gIjs8JcXvjrgjUx33wjXsGFTwDWcL/po0Uufhv+tDO8BDPvTFS2lDIE2W0YL9BZITMKAoPMpI6TaQgatRLOrVI9ICxdZSUeJEC8+4Ua2PGovS1pI/CfA5QthfL8S6cMH7Oogi5RpDYiLOqfs7TVVnQx7yjb1wcCRGR2Ay83fdz4FGKnQ7Xz80VT9hYia5T/KrzQPyNUNJAmtj9NBxyTCg3XLxIgG0zvPrEryOFMfg9LEF1uThYyWaPCe5+sIdppV9ALdaoziQGw6x9hqEMZoljphTt4x6Uv7BHeQLPGvH60Fpp/hX0oDmY8chO3uunbdtBRfAj7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0XhjPFyM1H79UfFyZWPfr0+Wz5oWOs+bveH33EPVXQ=;
 b=AAwhOiftMXNAZIbwJ+w34DUpQKz/CV7EsbdNzCIDYKYwVC9SR3tjicu3e6U8e+92Hg8n5vFcuermWTXELDBc3C4OG0MxThpYBvLscuWCSnYCBzAFEWcf1uJqxiceDE345Q6rl6yCBQ8ZjbxyUsG55mWAjsbd2MLqoXLnIB+CrTQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9767.eurprd08.prod.outlook.com (2603:10a6:20b:614::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Fri, 17 Oct
 2025 16:53:54 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9228.012; Fri, 17 Oct 2025
 16:53:53 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
CC: "hongxu.jia@eng.windriver.com" <hongxu.jia@eng.windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] xcb-util-errors: fix racing on out of source
 tree build
Thread-Topic: [OE-core] [PATCH] xcb-util-errors: fix racing on out of source
 tree build
Thread-Index: AQHcLfIUzKD9rraIwUyBc1ye2+rfybSqY8gAgBCUUoCAC7kxAA==
Date: Fri, 17 Oct 2025 16:53:53 +0000
Message-ID: <15E4C68D-5818-4F8C-857E-4B08D98A2AA0@arm.com>
References: <20250925075646.1146511-1-hongxu.jia@windriver.com>
 <A5A09505-7119-485C-A0C6-C88DE980263C@arm.com>
 <566d1cf5-7390-4817-aa19-edb28cca82f4@windriver.com>
In-Reply-To: <566d1cf5-7390-4817-aa19-edb28cca82f4@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9767:EE_|AM3PEPF0000A78F:EE_|GV2PR08MB9325:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f25c532-4212-42e7-6f91-08de0d9dd580
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?biUROqjwe5IqEWVx0vt4ArBTK4i1Ewn1/2TSX4VZDBlJzWsO1lgD1hemm1VF?=
 =?us-ascii?Q?3tzc1S0OVUx+uz3a20jMEPwMFZWu4QQlslxsaHHuArV3wrFPGFAOf53OpauP?=
 =?us-ascii?Q?3WbqR+ZQuHq5PFQFiX6xGevebx7Iv7qCwur1BmU5DGqR8Fmgn75CuDSVIliM?=
 =?us-ascii?Q?n2CNGkyx838nRAs7e9LMre72t7qM3nx24O0nM8zHzcfNLXQI0jYRQRkWLP/P?=
 =?us-ascii?Q?Ck5RxSEmE6T3lXIGyP8t1Y7HuTWJzgkIaqnyU2A1ZiJZiGfhh4iJqfhgrVJ/?=
 =?us-ascii?Q?+MD/grK6yTuwxQH1daRst6x7vxJVYgBOdVC+t2lHF1Vu+vrl2NdZL0a2DHgE?=
 =?us-ascii?Q?DHpdsKz5Scn+FbrQw+C3Im6KObO3kJGh2fpZ1LckEJTQn5+npTcTh/Fcqk0X?=
 =?us-ascii?Q?A+vf1LLLr3ettXOtxgYlGjAg0900S4xtQopyT+ULeRLJY4RiOeGNuhkAkpCA?=
 =?us-ascii?Q?ZWGRZlLebyIPwqUZcHbtodOPrlHzxbvmvLAIJpVQ3r7Apzqy4Vo4DgIEF7jp?=
 =?us-ascii?Q?aF1Tz36rzDxMJNLL8qshDeiOPsR7ywxzg8ILl8z2os0qB+sc3DvfLjLAHnBl?=
 =?us-ascii?Q?VhnUyaFYguXAjl76MiP7s0xw6VY9OI+m9nkkC2yKbY7PqzgWvXoov4cEeBja?=
 =?us-ascii?Q?zM6+Uv+GpvpZDscNd9DJCvYQD4ebMDJRnEjd4THOH6gAy0pM+AmZGPgp91d5?=
 =?us-ascii?Q?udZ/bCdCJY8lRcNd2U4O5m4bRDCmFq0EB+Ql6OvBir1JcjJQwLYYn1xKPppT?=
 =?us-ascii?Q?SfqRrsYvJxioqQ5F0ocP2uXSUWNbDwmUampKkRJPB7ztQyhrFjz9b2SZDOpQ?=
 =?us-ascii?Q?TZgcno0o8BaOk+sJuDoVd/IRovqHatXA9g9IuR9ZKxsCpi00unqbeOun2YPk?=
 =?us-ascii?Q?xoJA6YnjdBOtauG/XA5DrxOcQb4LUZfDWI0E1aCVJRB2UHWhfzpdK4qjelU4?=
 =?us-ascii?Q?AavdGFSyyNFnpprn86pAiR9API5rP7KUQ6ERHAhWGeLm139liuw4cQKUGrIL?=
 =?us-ascii?Q?ifA7lHy08cjJ0jSDlwaWs6Pdm0L6qWod4L2CvypFU6WsDWEDODKYt0HZmP7b?=
 =?us-ascii?Q?LwllkkU0L9+B1TIfAscl+isxQIq7IhtSTQzAEwPFb2MdF6q7oZuOzgcboJRD?=
 =?us-ascii?Q?O66/8+XtqWXdziQLN6bUPbASvnJp7fQnqWP00mJ4oGhMfvJX4u8+hOlloD2M?=
 =?us-ascii?Q?4eF15fpHxsT2lFEvPfm4LvKxRDcfbrXxLWIAJiHSJYQRN6j7QvLsoV46rMZW?=
 =?us-ascii?Q?CrhAXvIEDI71BZcaHeFDrXW0YpiF1NY7KuyujYlV3yakrd1t2OYl9Vzuqlfh?=
 =?us-ascii?Q?/pakbxaB18fCmVjhnZUzOxsF6fG1/q9ME5exRMnchimX2LKODxCDcpj7hfLq?=
 =?us-ascii?Q?oW2D5Het526NO28As1KI8CB4IpBeDQ1Yy8Y2d4+xOKbDHmxPDJGYJb7Yxr6e?=
 =?us-ascii?Q?3JkPX3e7kGFwAisUsfJz3rzoYvWzOtrjNFkk3DntcGu1DyGKfwIMfg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <65E974882AB14A43BF9FEC75DD0A5A11@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9767
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bd7a8f08-8fb2-4b95-7981-08de0d9dc145
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|14060799003|36860700013|35042699022|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+NHeqlj+yUdNWpKQFST1b1Ew4zn5c3kiKtXgm7rQhsKouAmX7HGW9WMRZUfF?=
 =?us-ascii?Q?q2nTxMYlmWJyt8LrL9kVeN26xUibApHLiKnDYeZcESTHf6lJMFheiBg+y4H/?=
 =?us-ascii?Q?+9/FTcRCe2uNlApx+dxWKcsyejkCRXf0TbuwoosshqoaWg1I0aexPidZECXp?=
 =?us-ascii?Q?NJ/15vaKUmw99eA4uFeTK58ol0yefaSumrYUdN/ldIPy+EcYD6jd4YT+X5ZL?=
 =?us-ascii?Q?lqST/i3riqtQH5ve0zXQF1KZTVSrbBi6pegZwucoJVDBao/1EPI6BoLge1/0?=
 =?us-ascii?Q?wS4RyupcoKVPC+hYHY7AWYkZp1bsQmT7BePeEWcfBtnT8G8qmShWNwRbNmLu?=
 =?us-ascii?Q?n6F4MSbSY9udH+v3q42Is5XmLAtoo9SShZ76Xxc+TJP+vNAMr3sBCTQK7mOW?=
 =?us-ascii?Q?Q3zAkaEFjUuE6bdPmSMd29mZyJIdsLDTNcDRXp4IOz92c1Ipr0pUA346M7Kl?=
 =?us-ascii?Q?YILAJut40RxJzVK6F54hZDqNuW8HHiNI9nfBRNA2rmRmgQeT7y3+BPfxY43N?=
 =?us-ascii?Q?j64kN3wXy0wI6X6Rl3C0Uc5cmbPXYdYDtc5yDhgq6KChwLeCctM6PIL+jkVz?=
 =?us-ascii?Q?Cnl+dduJWJm1Op4/BISFNeMgj2/zoxwGVXrzX8Ah1M5ju8OYu9Ljgxg1yfNq?=
 =?us-ascii?Q?AATb4XmYoZzYDYU/aDw/3No3zmhvULK6oe1w2fyCuh14bpEtkKbHCMAlNSTb?=
 =?us-ascii?Q?MFXucovbGlkQFCbc8oqkPYM9Wk9ZTjQNfu7AHjSl2irdXENIFBu0gNdhKdPu?=
 =?us-ascii?Q?RDsoXVNlwTFYyoO5tuDcm1LpOHyvaUtuM19aturG/20o8zghi9kUPzUyxNJr?=
 =?us-ascii?Q?eFMVH40R3orcWFlOZ2D1Bp/Y+NCo0vmKY1DNJ8kiSDeI3XE4sGtGlEh4rW4I?=
 =?us-ascii?Q?xsSeW++7k3neslg7bQMLR8LzflN/W8C4WKIjvLSnLLqC14J2Fst7s+CCqgAt?=
 =?us-ascii?Q?gXN7O+hVW+Qnl73kQb83AU1Lvb4Ps1Fy1YABUfn7hvfWC8Sz/st2Web0wmfi?=
 =?us-ascii?Q?RE+2WI7p5TNycQZQIIzJiHgOI0qZpz8+QsjHMV4N3J47VmrHEjKrwUIFzElH?=
 =?us-ascii?Q?JD0/GxSbWL21yB2IoiMG8VoVPvM0fI9fGAfoKZlp+QPXfHLK3wBszeujDrSR?=
 =?us-ascii?Q?Ui9qlid/IUbq1q77ZcTtycRpqpdmmChRMX/jETKxkDEsCXg+tmmYQU4UijJO?=
 =?us-ascii?Q?nUwTn4rBcKiZQGqdPHwzEtZlJiBnzzrGaPb3ZrQ+A1Cm14PgkanftUMfxAB4?=
 =?us-ascii?Q?hf4uTpxr8aILZGX5U/d9mh7tA0aLVdCLOffai/AFV16HGymDKSIfX0kKNEjt?=
 =?us-ascii?Q?eQUtX68p8siwpBBjyPcuvE0H9zQ53mYtA2oHr2/ShD4cIT+rhJYz8Y7dTGNm?=
 =?us-ascii?Q?QX2Ewk2VqW4dGl1YP6PeO9ZSdKgjt5w1qH2FEFi7WW76r6MhASHfFxHC77Eh?=
 =?us-ascii?Q?ltWMJhVor9RfWx3gRK4xH0VmQEHzgw6yuVrDow8R21iJFwHCToUgkhvxH9R3?=
 =?us-ascii?Q?zeu1aJiYRBCttiA=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(14060799003)(36860700013)(35042699022)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 16:54:27.5207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f25c532-4212-42e7-6f91-08de0d9dd580
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9325
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 16:54:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225027

On 10 Oct 2025, at 06:52, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>=20
> I do not have permission (no new accounts) to submit a pull request, the =
message from https://gitlab.freedesktop.org/xorg/lib/libxcb-errors
> ...
> Due to an influx of spam, we have had to impose restrictions on new accou=
nts. Please see this wiki page for instructions on how to get full permissi=
ons. Sorry for the inconvenience.

The wiki page has instructions to get full permissions, did you do that so =
you can file a pull request?

Ross


