Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E10EAF4BB95
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 21:43:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32010.1771969397926240595
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 13:43:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=heidX55n;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=65157b7930=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OCZLkK3704552
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 21:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=DKAyaeKjC13IfVuZAl8H
	1ypKxNLE5bZ6HEbSSrt2p9k=; b=heidX55nwtv9JMT0RwinEZdvOpe0eK2fBgkt
	AMMesupaqUMtrVEKosQl2KQ/Yqk9QYKBzGdV4NYNG7Jpn3qCBPmoXyg2t5TW1dDn
	duRD/CfrhyPcuxCPAlUQqX8V8zpSDXhPV1JSUOuOHoOlVs6ldgZcH1uxWK9QE04x
	qXPLQ+LE/5brWx6w2yKjam1smHo5WBqNNakAa8qD+dhd2lUN88g0Qyzi0fkVVA4s
	9rBxone+S8G+5DacINpunACF+J4uswoIj3eEl+Y3+1lLb3pM21jbbXbg68nYCT36
	VW8GX1gJIvtsZrJNyGrO/bG0HxRgRTUVx5v4kemziy3fkMuH0g==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012060.outbound.protection.outlook.com [40.107.200.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cf1wvc1cy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 21:43:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DM9DB1iRNdfBJLG5e4HA9lwoqDB3+0LsvlOuGpDK9EbpcTytAjtkeblE/fwHvw8QgQ3nQrm1IzNGOXlzW8XOMwTresew5G4nt0Jil5m1ndSzeU39+JH4afnuGKPCw9OIGpwu27zuX6+FWnOODZG7sR4YJp99qjw3QzLZ/WqJ4wkmKNuJJ5tQizb1VGRe10lk6J3aadWM1R6guSZ8aJ8ArViqi9uIdsY0iZRGBOJzWsvSeKLJ2XstmrNJSelROdWNDQkltUOO/5hfpDUkEHgWEAyLC5cR3PPHp1K50RTp15waDsytX/2ljrrAklQqsA1Jn8bpL3Enwk5RPlK1Op5spQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKAyaeKjC13IfVuZAl8H1ypKxNLE5bZ6HEbSSrt2p9k=;
 b=o2yKt8rGAvog+Lx0JvvxyhIbjbhQlQCFEr2Hfpyr8H9XVMLDvTq34EYqyNBkn72y619BjsP6ed0t6DyVIGwBVtsKXTaDuSQxX+w97d3OvIj9BEx5FSwE8c46Lt9MyEHDI9VhGhWmbAUnJJM15WjM84+MHbgq2Ydx6smT2fRgvImAgsMACcsEjkdvwRTT8nfUlkEiWE/MfbxCsOvLeskLvBwojIuRXci1Jmgq2O1hVh3ZsWJXFkH0kQpoyZnTqrgc7Q14Vs/FYjEEjOGs8vvCLTJdhNxn9xmJqXS9NFZ8vO/K+I2iIeaorTECAmJfiOKOZxuUN4NpZ8pXpDM+7SOUYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by PH8PR11MB6660.namprd11.prod.outlook.com (2603:10b6:510:1c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 21:43:14 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 21:43:14 +0000
From: Randy.MacLeod@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] nfs-utils: upgrade 2.8.4 -> 2.8.5
Date: Tue, 24 Feb 2026 16:42:57 -0500
Message-Id: <20260224214259.2236671-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0076.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:65::15) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|PH8PR11MB6660:EE_
X-MS-Office365-Filtering-Correlation-Id: 08ec2f62-e745-433b-4d35-08de73edb67f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PFr2Cie4aUWdyThxykq9zXWUiWsjnYWam0Fd0ZtsXDDzi4MyWg9F6+Fnk8dM?=
 =?us-ascii?Q?Y1lJh2bFZDXPX/wSi+0NaMvjV+crt3f1Hxv9m7e6DS4fgOj+30u/398tbCS4?=
 =?us-ascii?Q?/reXGaMU/oj4X7UpYgkZ3FKxcZw/1RK0aTxC4QzQGuhv2Eg2yy/eJmRsRikN?=
 =?us-ascii?Q?oj9DKPlBYa5DL4w6ZNDqm9a4uqIUqNuvCTunzeKRP6z/u0xChKBHy2vNnLQj?=
 =?us-ascii?Q?BQzI6dlVfZxr8gsa+81oRT8gEh/h3ZPKkaRQb9YX7amfKtoTmwoTGGTOUwPY?=
 =?us-ascii?Q?eGx5Vx69bZ9u12e/zw7zk/PBYNWWG6PQOrXBLdkof6iCqLo9BplGhKrCF7Gb?=
 =?us-ascii?Q?ugpb0ShFFKHkz6Mvh18mzbolILZUtEsgVo3CQPMR+AoWI3O5zHK3pOTwnE9h?=
 =?us-ascii?Q?656wyjImQF708yr+JK7TRKVn0XGa9Dzxvze2nfDt2ayC/9JoBgpDHWAyZUSw?=
 =?us-ascii?Q?QO+cGb8zACcPpJzLAz6FqsPXL6wuUKTt2OJ0ygbMR8XAHP82su2cByY8y+QB?=
 =?us-ascii?Q?v3lrzhRN9NDeSMaLxJ/Wa9+zybyu0o22pOajhZ+fMCh4dS0d6nm9QmPgHeoQ?=
 =?us-ascii?Q?LGrKEQbVA0Xqwer7hI6ChlqxaGVnxSbcpxNLVMcp3eqA47XiJuaQV9CBWA3z?=
 =?us-ascii?Q?X6yk+DCsGuMv91EL25oc+DkK6wwfvKYVPtEta6Yv8XjVBzT6T6GbfCNfsTIM?=
 =?us-ascii?Q?Bi2+uFkwoWvkef5+LQRpxd2aDBK7eqJ0jBTNJAR7SfnfENG1sxgX/ud5wLya?=
 =?us-ascii?Q?sphdGeZrb63bYdQpPRK6fcSS4xbYhGUqMN6VtDYUIEwWHE9g7aNx0LqYy86R?=
 =?us-ascii?Q?f7NwkS6nJL7uUz4nB43MeJ5JfCJyr8Cv+Etyg/S1ym5nLzLWuYrwCgJSMacT?=
 =?us-ascii?Q?KeQqx6KiXs5MJQWirZcE2mqzJ28Smm1Jpkm3wy9LCWsj1Cty/a25/3Nqs6Rx?=
 =?us-ascii?Q?7Rw77mher3s3/uTDnOmwwD77H91uLo2t2I1CPulgof+bhQOHlWYjRcTnRXd+?=
 =?us-ascii?Q?hKjFEN97W2SnNj8vglr2KW62tpxhJuIMWvkLjcSwE0H/jxy4gYY57P9c8E/j?=
 =?us-ascii?Q?t5fbgbuiUers4Y/c4q98Nn5QvABmdLop1Il4C41tzDPWGd1S+02AbFEYl1nJ?=
 =?us-ascii?Q?WmiNbAX08x3LF0XVLQwcC0FvWHPEK5aWepoWtR1P62uDFCrnwQ8q0eFmzwYJ?=
 =?us-ascii?Q?lSirBtUn8Oq7GJAaWyfCNYkLAXfKia/WZU5Yp60EGk6xTLy8Ub4Jbg1Vguz/?=
 =?us-ascii?Q?xnLrwkUo3BTHXM6uM/Th+kl8Fz+0O6zhVKr9LZb9XFOQ5qm2lMIhq0E6hrCl?=
 =?us-ascii?Q?6szZ9WYA7d2wtxVm8dHV0I7lfcAcFuBGpPSLh7xz2Mpx4ORbHCEMOtcH3+/a?=
 =?us-ascii?Q?zxIkfmLihsPE25OKbK8VGpMGhVER9i6/jYviRoUYR/ILT59dMeiXyod0UZoQ?=
 =?us-ascii?Q?YU1KPun0sy6VerckFpqcWoWB+eTrDEiOEiJbFym9wP2QIADnA6XATeSwXwQp?=
 =?us-ascii?Q?ltd+70DNUZIFINRzL7D61Fa6+VaaBCg0bV5Yj0jlaPou5KSAMhqz4O2KzdpV?=
 =?us-ascii?Q?ytf7gKvQCfYqJKj/+Yw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ju45dnvM5U6dXHxLyb92vKRwklD7mSajbvli66VE0x+s/6w1qJP52u0O3Ntq?=
 =?us-ascii?Q?0LhnIeggDoN2ycaGwCyAOJ9hUEWuE/kztpphWJhGVNuIbnit/qC0Cv7VT8Y9?=
 =?us-ascii?Q?awtrZdOrudmHHGrWbiR+5gaomL1EvnjhvBTTxPsmRoHYepVrfGmt8b5jcChM?=
 =?us-ascii?Q?ffOE1Y60li0F7/pScENYYiBbawm7Lmo9uaxlcDysA2tM4koPwQS6CK5GkAFm?=
 =?us-ascii?Q?bay/atL00zLxR9XqaPyIKO28JzacrcqGoXLAoPsjuwAhA4vo8VN3/bg9K439?=
 =?us-ascii?Q?EQJezmZt9YVhkRdHLflkk+yEzzVShTNeZzKCdDBxbaW3Qmdy4Im0p/q8tiDv?=
 =?us-ascii?Q?P37vWtFOnQDHjgBzT2WK9mQHxqGgGDg7ioLFuMerwXi0glaMZlSEGHk/q7MF?=
 =?us-ascii?Q?1Y19WY5mWutk1tQo6QMFwcdRREN6E/1boyL8eum8K8pENw+wZBMA0EnoYvX4?=
 =?us-ascii?Q?7hFrQFP9VvClPFDFCjBOHeO4vzRS1a/3j0Bpyc8ZGbVM0as7xTpFMFLIqOtC?=
 =?us-ascii?Q?k1FmR69Y4r943t+JiT1g5KMk6Q9YZ+tTbi6t7SPdbGtafwIL2c1MbMqe4mz6?=
 =?us-ascii?Q?dbP/TMu2kQUiW0WyjINnoRz5NSB4rIZGznm0V47Qu7plswEIEDP+MW1b5MSK?=
 =?us-ascii?Q?cccdCzKxPQuyB2PKfg68iNWa27h4mZDGQodzd+Nrh7t65x/bfDtKCOk88Wtx?=
 =?us-ascii?Q?cir7ZJPIduSvuMniDcBhfcC87fLNySmZ5w6DOYeqT5RD4sdWfv0y1gRq50Gt?=
 =?us-ascii?Q?2iAvNO+7x/PsL35XtUIUNkClDX0POEDX0AJtseOBpW+XJLjcLIp6Xg6SwJ6o?=
 =?us-ascii?Q?/w+1leIaGbC9LrdLh+axfV+iGqP5s556pzIkxPyiDHSKzK/Udof/lKCeHJe6?=
 =?us-ascii?Q?LGPpX85IFCGFwOjANBYj9vHF9it8i3LFg9rPgk/974Vgt7fT1qIB4AKhWyqU?=
 =?us-ascii?Q?4B2flq1kzDrVLyI+M6H6/ln1vvkzENxWpuV6ekIO/DrZ9ZwkPL9ncDKfnfiu?=
 =?us-ascii?Q?wNyqtab0cvKL77ph7qRX3RyWyfXNiGqguGOpR9UPhuujf1/3GyN76YENQEhT?=
 =?us-ascii?Q?xedUeg7nx4xBe+92dGBoXULJtHxfjJRD+UiYz4aFUUB/E6hbPwWA6IXvrrZA?=
 =?us-ascii?Q?JvMmtdE45xDs1ZCxTLZz5CWITDxAxOdCDwEBe+kkdwfdYrPtvb1Np4XKDIFX?=
 =?us-ascii?Q?z7bqrx7drGReXJVVEmGpBlsDPYsBZDWozvyc9yHia5LWiKN6F/jpG57SdO5d?=
 =?us-ascii?Q?pIu/WxxO3b1oZM9s1PK5jIVLZQIhrkXv43rTV0rsUcHAkmUZ/GZNqHdPbOT5?=
 =?us-ascii?Q?j9KHSn8oqfEv9sWyu0bIeWiB5fSKmiR59zDC/TFOQLg9/ryAIxvvh9bJdXip?=
 =?us-ascii?Q?ELq592eeISSfU+aeJGRHJUkMV2HQNxDmLLPK8FQnN4XeZuJ5btcGVptpWoY5?=
 =?us-ascii?Q?ppogxyoEUCvOGW5s5P15Mvss6iwJrPCt8G1ka45wYcyEmOKl+m7S1ar6QPJH?=
 =?us-ascii?Q?nWtV7d4E/acJTaDmdYDzrRyeDTwvnM5dKfsxdpKL9sE2MotucsZYoIE1yDFT?=
 =?us-ascii?Q?/mnFFBRsGAlc9Ez2LItMAycD1llqoOThW18ASFwDp6IedqWALdulCry3nsLL?=
 =?us-ascii?Q?jNZy6Rnk4nDuMSyzMqOORJTdkPcOTxucBEML7PzzjFi+P1LkD8C+cIrVd8mK?=
 =?us-ascii?Q?lc/hFNCbXX4ptQl+WvSL0eSOWBeh46mX9X+t5y2QWjXl4p5lX4Vstf60Yhyz?=
 =?us-ascii?Q?xufnaNx1v1ZO4f9MD6wAidl5mEn9iY4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ec2f62-e745-433b-4d35-08de73edb67f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 21:43:14.1623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zBTtD77uGBXUXpr07Nr6igA3NIlcJnNF+uqW/BdUjXisXsaEwRpC4zPBMCt6kf1wIVjZF+/U51G7mFazzZneCKMqNxCajLDUIz3p9iqHLPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6660
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDE4OSBTYWx0ZWRfXyqiXGEP8u5pD
 BhzDkV4EV/AORN2+9F5SkqpM2iE7yICDYs9Q8AlNou/MlCfUXnh/vkCc0pkYiw7LNi1HJ5zP7uK
 px64kV1HvomK7s/0hAYhiLD3IcDYNWe+mGmR3L6lwXPPh7Rq/6XeEG1ZbubmMKujvzx6somhDwa
 L70D603aNPhiNpWX40sWzHGD99RYuVR/s4//CTHJLZk+3Fjl6lHZOEOO8zC0gLEA7tk3Eesk5vy
 5fpdEXFAQm8vJLd0e2xUrYPTG86VEqx2W5+P84jbWuZDZaORdLNdLhhUb3NFyME8r9fWiCy9yQb
 KLN6zAO18CrHEUHVVHgsAj0vLpk7RCs8YV5gbPRZT+jWDYRoHS+e6yCLtQ9qQt7V9I+XfuAxSIA
 iJNfvj5edJdW557I5ZjTI2N4Ev4VJRWub0yF5TlekUzu3wuoPYjTPGMb6ylrGxiCNWRTvijAGZe
 87G1O1icgmVQ3H4TDdw==
X-Proofpoint-GUID: 8FCNs9AGL6Nv4fYjzc1p-j_HBNvl8RQH
X-Proofpoint-ORIG-GUID: 8FCNs9AGL6Nv4fYjzc1p-j_HBNvl8RQH
X-Authority-Analysis: v=2.4 cv=F+hat6hN c=1 sm=1 tr=0 ts=699e1b74 cx=c_pps
 a=P3LZRqt57NYhn536gl30yA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=gu6fZOg2AAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=xOgrWvA5NdKfEbMdZuoA:9
 a=2RSlZUUhi9gRBrsHwhhZ:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240189
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 21:43:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231908

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Commits (aside from typo fixes):

4e9b31fe Release: 2.8.5
00e2e62b nfsdctl: add support for min-threads parameter
4c275442 systemd: drop Wants=network-online.target for rpc-statd-notify
03b9c540 nfsiostat: normalize the mountpoints passed in from the command line
59e85671 Rename CONFIG_NFSV41 to CONFIG_BLKMAPD and disable by default
3b7de50f nfsdctl: ignore ipv6 listener creation error
0e71be58 locktest: use correct build flags
077b70fe sm-notify: Do not drop privileges if running as non-root user
8600bbb7 gssd: protect kerberos ticket cache access

CONFIG_NFSV41 was renamed to CONFIG_BLKMAPD so update the associated PACKAGEONFIG option.

Drop: 0001-locktest-Makefile.am-Do-not-use-build-flags.patch which as merged in:
   0e71be58 locktest: use correct build flags

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 ...t-Makefile.am-Do-not-use-build-flags.patch | 36 -------------------
 ...{nfs-utils_2.8.4.bb => nfs-utils_2.8.5.bb} |  7 ++--
 2 files changed, 3 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-locktest-Makefile.am-Do-not-use-build-flags.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.8.4.bb => nfs-utils_2.8.5.bb} (95%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-locktest-Makefile.am-Do-not-use-build-flags.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-locktest-Makefile.am-Do-not-use-build-flags.patch
deleted file mode 100644
index 351407ddcd..0000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-locktest-Makefile.am-Do-not-use-build-flags.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 9efa7a0d37665d9bb0f46d2407883a5ab42c2b84 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 24 Jul 2023 20:39:16 -0700
-Subject: [PATCH] locktest: Makefile.am: Do not use build flags
-
-Using CFLAGS_FOR_BUILD etc. here means it is using wrong flags
-when thse flags are speficied different than target flags which
-is common when cross-building. It can pass wrong paths to linker
-and it would find incompatible libraries during link since they
-are from host system and target maybe not same as build host.
-
-Fixes subtle errors like
-| aarch64-yoe-linux-ld.lld: error: /mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/nfs-utils/2.6.3-r0/recipe-sysroot-native/usr/lib/libsqlite3.so is incompatible with elf64-littleaarch64
-
-Upstream-Status: Submitted [https://marc.info/?l=linux-nfs&m=169025681008001&w=2]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tools/locktest/Makefile.am | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/tools/locktest/Makefile.am b/tools/locktest/Makefile.am
-index e8914655..2fd36971 100644
---- a/tools/locktest/Makefile.am
-+++ b/tools/locktest/Makefile.am
-@@ -2,8 +2,5 @@
- 
- noinst_PROGRAMS = testlk
- testlk_SOURCES = testlk.c
--testlk_CFLAGS=$(CFLAGS_FOR_BUILD)
--testlk_CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
--testlk_LDFLAGS=$(LDFLAGS_FOR_BUILD)
- 
- MAINTAINERCLEANFILES = Makefile.in
--- 
-2.41.0
-
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.5.bb
similarity index 95%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.5.bb
index 65970f58e8..119e49e2a2 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.5.bb
@@ -21,12 +21,11 @@ USERADD_PARAM:${PN}-client = "--system  --home-dir /var/lib/nfs \
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.xz \
            file://nfsserver \
            file://nfscommon \
-           file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch \
            file://0004-Use-nogroup-for-nobody-group.patch \
            file://0005-find-OE-provided-Kerberos.patch \
            "
 
-SRC_URI[sha256sum] = "11c4cc598a434d7d340bad3e072a373ba1dcc2c49f855d44b202222b78ecdbf5"
+SRC_URI[sha256sum] = "b13ca4a9df44186bdbe107514b22732d4243f785f95daf2fb86afc1edba15bbb"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
@@ -61,8 +60,8 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd', d)} \
 #krb5 is available in meta-oe
 PACKAGECONFIG[gssapi] = "--with-krb5=${STAGING_EXECPREFIXDIR} --enable-gss --enable-svcgss,--disable-gss --disable-svcgss,krb5"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-# libdevmapper is available in meta-oe
-PACKAGECONFIG[nfsv41] = "--enable-nfsv41,--disable-nfsv41,libdevmapper,libdevmapper"
+# libdevmapper is available in meta-oe (PC name was nfsv41)
+PACKAGECONFIG[blkmapd] = "--enable-blkmapd,--disable-blkmapd,libdevmapper,libdevmapper"
 # keyutils is available in meta-oe
 PACKAGECONFIG[nfsv4] = "--enable-nfsv4 --enable-nfsdcltrack,--disable-nfsv4 --disable-nfsdcltrack,keyutils,python3-core"
 PACKAGECONFIG[nfsdctl] = "--enable-nfsdctl,--disable-nfsdctl,libnl readline,"
-- 
2.34.1


