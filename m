Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D1DE8FDDE
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 11:33:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6438.1766835224454680526
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Dec 2025 03:33:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jx90rsiQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=44567337af=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BRBK2TB1071996
	for <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 03:33:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=SzpJLlJs7HVTWmKmcPq65nq4JyUeWCDRN+XpPHfSm3M=; b=
	jx90rsiQdof58KqUO6izVLih+LJupaU26O5ussfD+eDGowOxX4uNbW5l2xU//dVy
	Ejtk+ofh60hxPdEkjGKRGYFj4f7vjCvGhOyhgXl63YK+wexZpzkAMw4JWMyYnUn2
	hXsNZdH6J/+VZmPZENBxdc3HDHadrVVW7IX1oou4+1Smvww3SGX0K/Vmpg0ol0FF
	hOS/b3LeWyElq3rN58SICwJrqL8box9WVmCPgA13dJr8sMz9NadVT4UShKW4vPMi
	nkoRzMFOw9g3vYE1UpoTDTLY7YWiJHyhHzgg3V+j0Q59DUAhXMrFVu3a/0OnXFQT
	s86QhOolvLi3JMQoKUEkkQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010060.outbound.protection.outlook.com [52.101.201.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4babm202ms-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 27 Dec 2025 03:33:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=caQiqkzJ+AlHfHp3IJxeubyDi5sz9lIPdplOIGiXFlL6wYJ7iS7ojJHA9oZZCeFLaQTOE8ylRWHtrJPbohg3SGCMMYcCWUe9ZHGJhWsrcDqbUyCwidaLV/MS1uF/eRzruSWssjEGLRwzl+gC7NYyyude1wKrNQl+rxVpHQ1ul+Ui6ILhEsg8CRAMoVxmeqJKRECbrfIogxbtAvUbHXdCWgbykBGBUc41tjcBMjV08XcmYwwqNcPkBCYcl+BgesO35PQfuIVSGo2SiAxRpD60IvWVQnkPZrjZyIyKXbMNPBn6MLORduuJkLiUPd1+CfdbjQsIS10qgm/wbRilgJP9Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SzpJLlJs7HVTWmKmcPq65nq4JyUeWCDRN+XpPHfSm3M=;
 b=tkAg2y0SpoayWiVC1/8DDO+7f+TorLqVmVV6f/DbR8POu4kLL+M21SA/A0BUxgj0nMXH4E1rmy/hJTe1R270/BOzWYhuzUutdo4BiLbaGpgcurZdYFlYMiLixEHqUF13rG69iHm+zvDTVXrtWBDaEII7XeSinQkEemi8gqBTKET0tOP0WnYYv207t2dvzFUrXGAcXu+ojDlEGSN1QFRDjBwbiTeM+Jg5O5W6WgFUMvsIm5kybJyrSWT9U4LvqWdLq2lPboxvsnPz9LEC+lN/FJJ8WCU1fD5fRZNoS9tV9wubMrnMhClLwRwUdaR+mQga6ztlmcBoTrq/jKdfmoyMZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ0PR11MB5087.namprd11.prod.outlook.com (2603:10b6:a03:2ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.12; Sat, 27 Dec
 2025 11:33:42 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9456.013; Sat, 27 Dec 2025
 11:33:42 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH 06/16] kernel-yocto: add rust support via "make rustavailable" in do_kernel_configme
Date: Sat, 27 Dec 2025 03:32:41 -0800
Message-ID: <20251227113251.773795-7-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251227113251.773795-1-Harish.Sadineni@windriver.com>
References: <20251227113251.773795-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0049.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::24) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ0PR11MB5087:EE_
X-MS-Office365-Filtering-Correlation-Id: 2477ab54-bc5e-4985-0186-08de453bc9c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8vql6HESxpXKcRaTYTBwBnbgsWgk1G6afmRSMsUfrEQ69p7TY5x90H6Kxglz?=
 =?us-ascii?Q?yEbn/z/8bPMZwRpPAhOnijISsVxCCJzrMVzXeRMRa1s1op1JlZL303NGp0Yh?=
 =?us-ascii?Q?vsQvtNdDDnzR2Jp7hk/LHfratmeWej7W4pDypbJcdvzHv1Y/15fVM4mJgUr3?=
 =?us-ascii?Q?2jt6N5e1L9Y0TAHTOdoMWrv1RtJsIp0QrwBPoIGEeHHzw9BveCPEguMnkSqc?=
 =?us-ascii?Q?rchGoTNq0zqVvd8CvhRwgojE4OOk6zkHu/Yq19R/CX0Q8Mjgg9Kqo2owXwdo?=
 =?us-ascii?Q?bnkRFulQJlPMDTHGAuE/q3XyPvORB4LcL3QXt2XHtIqZEE0NMXsorugpPomm?=
 =?us-ascii?Q?ISUPdDUW5VsBs/haLExqB+9ldAlzPNUMuu2EY3PGtg9jM2wAq0zXbl/BYukZ?=
 =?us-ascii?Q?LPOAIiccBspup8yX7yZBxbYZ6Ylpc+c5eTaHgemwMvRpFJ1J+JGNPE0Xd2uU?=
 =?us-ascii?Q?AGb1autfVqkOGeyw+JHp6RTCRqHIYs//FxU819uhk13QI8+p4mZjV9OCGHfF?=
 =?us-ascii?Q?nycidEowAP+YiQqjDNwENcrrkgKphb1x3mrkVzmBuXwm4BO5oPBEWGV0AEe2?=
 =?us-ascii?Q?YDlhIC+3VAHfUvecRbdy0RqoC++NKrXfXYf52OIAEaRc8irRcDzEdshD1D4Y?=
 =?us-ascii?Q?/tlpRhoGiiHUA5fcYC+U2IwOQVo8s/tXggEvnGM6DuWkVHmrX4cfTnAzuju4?=
 =?us-ascii?Q?e9QXlV97rR2iR6u8a7gHnXlW6yE6hz2cFD/dZyR+V4KUm+XIgBhWh6QbMiNv?=
 =?us-ascii?Q?YgGKzxQBKvI+WxsuXd4zmp0NtfsFJLSkGzSy7V7G7cRXNVBjLs4xcm+qM7oL?=
 =?us-ascii?Q?gKcwEB8aorH0wxDCcQGAMMIZbj7NmJQQxN8vtLI+bdD9PHcsHVnM5b33PtA2?=
 =?us-ascii?Q?gprtqNxZdKJEMGWK7qMAmqkJXs1D1G4OeqslJnxLQrbSxuZvD+Qbq9GOebQY?=
 =?us-ascii?Q?LH7RdgLYFlMnZnAc8PQW4+52ybhGereCo/CwUnTT4yqhOze8LTyKCmBaGn3/?=
 =?us-ascii?Q?LXWKwInXtggtbiNb7hFo2pS05laqxyhfgMSMlSPRzl6utKTea3PudVztjEgj?=
 =?us-ascii?Q?hUv/w+Noq8d2nSPeAFGf9+gGKhIA1lFbbFNafLiBKC3OEK04iGZA9r2/ZnSA?=
 =?us-ascii?Q?AkDXFLtcCsTq7/ZC0K9x6Xnzb6xZ581tw9r2yVl2uph65GZEUxOANPhuK/IV?=
 =?us-ascii?Q?VMB+f5TvpRcyaDb6/PNmCO5y/+zBrkrWCJ/ECp50sLeFWk9OBReFQfYMdig9?=
 =?us-ascii?Q?Pai2KKrhhys18I7Yij5wq6Fx3FhLswygguud1knPYqpE4zJoGOsFznFhMfc1?=
 =?us-ascii?Q?sZ6qI5qezwY2AtsRNeUtIQa0QdzZt9Cc3bgJELlBDqgNBlkXIZhJo96eNeop?=
 =?us-ascii?Q?U7v+OPTUt6gxp5201++eyiOabNKrn5j4uePyjNicfr7OxcCOWgvzBAPKTRJ6?=
 =?us-ascii?Q?ew93T5jYu7dmE5iykXF/7I7tmls+L1AwXRZjyAPuXDPPtljxMgjGpE98VT1a?=
 =?us-ascii?Q?M6XwH/8rSGaBYvKp5j9tpLCe1FA92E3R1hwN?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GfbUu4MkwnE/jrknl7VfyAMkIXH8BM/y/i8Yd9Cdi6RfpKoD0KLNpF6A0stX?=
 =?us-ascii?Q?wclujwTs/vaS3I7016czAuD0UO1a5b61qzn6gIKz/MV+ygB/7mBaFmKEE+PG?=
 =?us-ascii?Q?PRaaqLSVSgD6tkpEmT8dkZfCsJbBAoPqdO3zgwZRcMCxiHb6FvB/4Q+9iBcy?=
 =?us-ascii?Q?ad63rbt5+I1h1Typ2G9rzGQ0xeYNNCVDtaTf5qLj4dDOpMFmTed6J0H7KGGY?=
 =?us-ascii?Q?RWXaqSHKLydz7LZQGcF+Y98eZZqYYVALfRKeAQxTG0fqQFk0+BSE/aMWRTpl?=
 =?us-ascii?Q?YqpGr9BcKA2ak0/D7uN+aSBBh4HkTNm4MIMYZZFMlxE4tfpk7TXng042GpSN?=
 =?us-ascii?Q?ecn2hPjiLY4L9qfPr3/sqkFHWGP54cSdfl6T78QhvzxoUAV95tQRd1DFCuWQ?=
 =?us-ascii?Q?F8kK3CnYKccizzcv2zpFf2sm3nyRapg/F/xBV/ZOMhrc6EhCqH9Qmu38nYC4?=
 =?us-ascii?Q?sVQYiIOXDCLcM9b++sEakp+HXQhIze8F+eT/CksMzAAeq3/grQLfPkug/+wb?=
 =?us-ascii?Q?HJFpchhR4RGinkgMaKyFCpbfEFqhy24KB5LTvtRBc2gLeNH0ZGFbNz7ayH//?=
 =?us-ascii?Q?gwSI0vlBsW/PcLdslFyT5ljA0enZHljPAxksT0ZfYBI/5WmRGQNHR3sqTYjM?=
 =?us-ascii?Q?0VJFzxWw7pQ9ZWrNyRLESMCtIVt0f1Rajz9nPbn6w4vRGUySi1o4qIXfrr+a?=
 =?us-ascii?Q?JTsKWJxvim8VMjDhvvo6t+A2ooWec2PJIX6VbhzmmjruIVBTO0q6KANcVKAF?=
 =?us-ascii?Q?BGzGtCuR/utj4CLgSs0Gk6cxNMlJbOsv4vRuStmauDHUBJxlRHSzlSBjikfa?=
 =?us-ascii?Q?HDuZYu6J4XCL+s+Ok32klCc15qyEbRuxk7/ERBQWoeue++LP3Iq1EWmBUHXS?=
 =?us-ascii?Q?iF9ScVLe7T9DN3gPcgybrUTIub8WAY+G5yZSnccxR2I/ytzryuKKj161AQqP?=
 =?us-ascii?Q?GM56YZ1kE6s3Xv7T91aBMBJ5MvjBtLINJ7DEsY1M7XenfF9mjfDT6NG/RhXI?=
 =?us-ascii?Q?+pOV5u1h7WGIu4bAvfMK1anndb8FRWQNw+5K0brNB7oLLfLyArpDo+eDLhuz?=
 =?us-ascii?Q?D7XM/THmYSKhROvp1doIyefYt0yFaL0Vr8v1LUUyZ4jDpIH3c6nKTsrfrhgL?=
 =?us-ascii?Q?wX3FTC0RJ35srCkKM+4CNdvDAVCgnnrqF7zNDTATL6lTLJTN7VuiMtbCAnLI?=
 =?us-ascii?Q?CNS1U3pvKwfH0Vf3vvbYwZVUF8J0hcyTF57NUYd5mBXT2cXcSYNE2q6qqM6J?=
 =?us-ascii?Q?CW2MHLAqOYQnrGvyqXIIYwtYL96LvC3LMrXN8AmkXCZccnnQH339JSgowZ/t?=
 =?us-ascii?Q?OyAAPLT9VxnsSqE7pgrk2tXdcW5PKRczGt9gt3jpC7eLstfNsFenItF2U5av?=
 =?us-ascii?Q?qu77429SCuKqEyeHe7eRzVX/4DaqfnlBQ+BAfMZbsu87CQOz7Mpes9zILCMK?=
 =?us-ascii?Q?sQmZ5FmxYewquzsHfAoBpNe1QLS+dDDH+2YmPGk862jEcFR/5/fJGFxdjg74?=
 =?us-ascii?Q?StU1QJrLQmG2tYQQ5BV90ptjUHcwb38WNxzqwguuc8BdAKvo7eUPhRqXE+ia?=
 =?us-ascii?Q?5k8LkA89RJkXQVAsFaVAUILO26VQw8/Y5wSfGnL6zjYJW1Md0Ct2J1wFiZN1?=
 =?us-ascii?Q?lDHao6JSdMxroq/X2yBqibK9C5+b+1D4MbXBW9L2QbbvV0IPkWBOGYBBPiZM?=
 =?us-ascii?Q?POHtYrVXHu9bPBQR65+VszLV8huwMrJgfu2NLg8saqICznj5z63VcUD8ylqy?=
 =?us-ascii?Q?lCpV4vVx6JunJ7NNu6jmLTRhk4HGecM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2477ab54-bc5e-4985-0186-08de453bc9c5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2025 11:33:42.4836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bhXbup0ednM/IayysqJRB5jQmVeVtezhSBeDc0IuO/4m47aX6F2htvpePKrcPZoQT/mKdvMYBTtim6n0uAFmCpkQuf7A6gWY3/NGpG2BU+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5087
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: ll5HF6If79T-cnR32xqgQ4V6NO6toXhc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDEwNyBTYWx0ZWRfXwcAM6cR01dL7
 qdXfsEWUtVNrdQjXjikkv+W3SwHYNj6urWC/rZrgxkiOTGyLJjiacLbXY1arwn4ZzbzWCzmWtE0
 YtMQPzFYU+s4TKNpWOZnhdloEXV/8LY2QKM3OhAa7Gt8MphKzfY4MQkTIlq5MxqklgQSqZe6sFO
 U+x1EFNLF7eOCXOGzmxKD8dLWp0G/3uqNocI3yKAe+xmU7Y0EF+xAXwRtGz78sNxmDecTr6LtU7
 1CHyoYLUi42q53xmDuifkquxXYWl1lIlV7Zo03K0poZ3LalPdktwIU2UGnJdKX6+kGhwBCFGJk5
 g+vQu1scs1+HlnudTPDYdh7fLQsN1Xjs+QCb3dA/bk60RWAQjszJ9gLjVdIXifsUGf/ZMQOwzYY
 OUfsI9+HqcSTVoNwbgCIL0lEBwloKnM4bQ6tAcRUV1U6Pq1Eue19mehOKWZ2HX6NBW2XiDFoCz+
 mf68lqyhbfaOoC5nZ7A==
X-Proofpoint-GUID: vTCFj13Uk6uavPh_6jM051d7ggb23Toe
X-Authority-Analysis: v=2.4 cv=bN0b4f+Z c=1 sm=1 tr=0 ts=694fc418 cx=c_pps
 a=I+0LS1SYtwz2bRPArqNViQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=jcMc0Nsmbg0OvNgs5mYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_03,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512270107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 11:33:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228560

From: Harish Sadineni <Harish.Sadineni@windriver.com>

To enable Rust integration in the Linux kernel build, this patch:

- Adds `rust-native`, `clang-native` and `bindgen-cli-native` to `do_kernel_configme[depends]`
  to ensure required tools are available for Rust support.
- Invokes `make rustavailable` inside `do_kernel_configme()` to prepare
  the kernel for building Rust-based modules or core components.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index 2584cadf0d..dda235d4d0 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -463,6 +463,11 @@ do_kernel_configme[depends] += "virtual/cross-binutils:do_populate_sysroot"
 do_kernel_configme[depends] += "virtual/cross-cc:do_populate_sysroot"
 do_kernel_configme[depends] += "bc-native:do_populate_sysroot bison-native:do_populate_sysroot"
 do_kernel_configme[depends] += "kern-tools-native:do_populate_sysroot"
+RUST_KERNEL_TASK_DEPENDS ?=  "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' \
+                                  rust-native:do_populate_sysroot \
+                                  clang-native:do_populate_sysroot \
+                                  bindgen-cli-native:do_populate_sysroot', '', d)}"
+do_kernel_configme[depends] += "${RUST_KERNEL_TASK_DEPENDS}"
 do_kernel_configme[dirs] += "${S} ${B}"
 do_kernel_configme() {
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
@@ -513,6 +518,10 @@ do_kernel_configme() {
 		echo "# Global settings from linux recipe" >> ${B}/.config
 		echo "CONFIG_LOCALVERSION="\"${LINUX_VERSION_EXTENSION}\" >> ${B}/.config
 	fi
+        
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
+		oe_runmake -C ${S} O=${B} rustavailable
+	fi
 }
 
 addtask kernel_configme before do_configure after do_patch
-- 
2.49.0


