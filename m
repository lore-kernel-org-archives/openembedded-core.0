Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC60CA0FE1
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 07:12:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4030.1755846769823119274
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Aug 2025 00:12:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PnDyYfQB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=032937f5a3=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57M4bg8u4080128
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 07:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=MdWBjcpc9PVvcyfctLShqx/l5m6KgDPjfO5m6ZPgJ80=; b=
	PnDyYfQBe+J4kIwCWY4ItFho9rFF2vshLRV1ehB41n0iv9WFUyxtNvgqwOBidXjS
	OsbZ+65yUl8uMnjF+3hk5AMTzX8gWcPxqjfpYNrmM2AvyQF3GM9zhd8wYU5E0aL1
	bHqJI4PhZbPt9J+thW/6030vIzf9bb4zFqhgIZcj6n6o51UlVzb1atDn5Y3N7HiJ
	lMEeZYlN5nvORbQXCV16e+OKdT3xplKBLWXihFTNO43AyqX1hzQR3wGU8sn2dU1u
	uUdq2d+wGJVVTpEqZHDCByarTnkqbUMAeZ0mhEtI//D3/dbgE10P7fT9EK5N1WUG
	Sc64b7i7g1uMMo6NXMrsrg==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48mydq3f2w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 07:12:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZ+gcRWP7UhN3+ZzfOGCcxiocwzuDRlnyMlDeXvy3vPFMSYUyWJ6DCM/5/4DQfh0k3m52yPMHxHQ3L9M8a1giXTGMKD8MgHknD8si1mt4GIFBkRPwRhHqKvIcrgZPiRm95+FLMwZc+moeEXS1Xfz23u/1mANvSCshi4lxq8q7Dcnfui8b0bqz+GIpXg1CopdKoW5s9olj2LrBQtizB5EmcgcBPRZQhhQxF9mhbvmCFYGh4IR07uUnnolqE/PHUm+DHfD5Idu7AlfoNbF55xH5urE1swM8+BLJZbB8dbWfywsc3eWiEsIr3jEjt8N9rPkKXnB5JcrGV5U9Zv31nd6iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdWBjcpc9PVvcyfctLShqx/l5m6KgDPjfO5m6ZPgJ80=;
 b=h6pOFx3GNfUfH9Hi8oAzdZvY85gqQ+MntdjqwVGPv4vNNYOULY5lcNEYkGqhQmIuOkIJOp1D80Qw9ZIZGd7zhuEG6TN4O1Jg5c7mpMuUdxHdeM/WHVKlTA5EVPcQXlZD9l4Ab9HkBOSTlyY66dTRa18q8LsQMe1jHgKpwwl2t3VWwMreAlZ0by6F7kzWRtDah6fWlzAuoIQpaDU/LZJJeObTda1B+rzWtaYl3xYY1y+0DRcyDpKKs9sQ4Qo1Gdcr9oEo44L1gKsMr2bA2xfdKUbPB2EsNc+al5O2kS5SNSRbGk1nlBllSca5/oT1apZHIUrVAGz4HUPU8W8BmsNUVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CY5PR11MB6259.namprd11.prod.outlook.com (2603:10b6:930:24::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Fri, 22 Aug
 2025 07:12:46 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 07:12:46 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH v2 3/3] gcc-testsuite: Fix test failures with output pattern due to ssh warning.
Date: Fri, 22 Aug 2025 00:12:27 -0700
Message-ID: <20250822071227.3304731-3-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250822071227.3304731-1-Harish.Sadineni@windriver.com>
References: <20250822071227.3304731-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0047.namprd11.prod.outlook.com
 (2603:10b6:a03:80::24) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CY5PR11MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: d41335b8-271f-440f-7ca3-08dde14b4bdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DOvARmAxIZ4dqVdPKwMo9Q/1dc4y9uX1wgohSIdh7Lo1YK3KQOg6k4uGUK4u?=
 =?us-ascii?Q?qJ1LsrofvhYD0Jr9Oag/lC8tY5ptnZsJ37L9X1pQlC9Al7YLyCOWl/4Aoz8O?=
 =?us-ascii?Q?eBmSOCiCOkgeRAU+ZTgNDgzJq47JlXuW5vIioyDjuFiiQx+6ZxX1tv7stlFV?=
 =?us-ascii?Q?sDUUkZKxB9diqiIbMQtGgLPwk/u+EIV3qA4hsgxK3LgGnTonmOmdprIc7yh6?=
 =?us-ascii?Q?qhfikaycW1VfBAdLiAMWdvV/SEPmsbFjaUOC++X8ghNm+yWP8vhlR6lWK4r4?=
 =?us-ascii?Q?7ZG2Ys9crzB3Bgi7Mu8wYDWmMJPAr0nDRU0Oe0DQHpC71/INfpvPA75lT/LN?=
 =?us-ascii?Q?RqXGmhXHJx9Xmxh+FhJisTbr8ckCQ5aeUsSd0hBe5evDX1L+k1AhcIElSzci?=
 =?us-ascii?Q?tpjg/o/lcfv7xnroCaKhNMVKidgt8HzMxh/wZoTrRVw+GKB5RrOU2uJyw8pn?=
 =?us-ascii?Q?l/M7xha+CzayGHFhaWTj+eyBqhv9qib4xEeSTizRImpo6O4z3/Kdl2XBCT4X?=
 =?us-ascii?Q?SAAxbx7J7e+UyK/KSmdC2WaSRF9qgD9VU/1mN/a9i+/zYZj32jm0jqyxsrw/?=
 =?us-ascii?Q?kehMPx7y5lVGxBEWTDfiTiJJ42bsfPhY8bTd44Lp0MoQA4Twvt8zheR2hZxq?=
 =?us-ascii?Q?HIRko2J3EmXMMx7cx1yciG4qUnaEV0uzzopVNkabrS64sAggSKbv0u4hJDg8?=
 =?us-ascii?Q?SGpmy+Ri3aHyFBMYJLrPhiNjjluYIypDgjHzejjta/8DGhxgTkzPeN3vj7Bk?=
 =?us-ascii?Q?xBxSM9KzQLcwochY4QKAaA3VzO5fn+mGRrfYOW+Ox04xpLHysy5Cr8mhyi7d?=
 =?us-ascii?Q?cubELSejusbNoAvYGcz7lfRP+NufUvy7IyAw009w0+wYfOxsHDRRitaPYmhL?=
 =?us-ascii?Q?Mmt0EnSIWO+87eeOc+ohzRoYkqgL/eEN1ynPUfRtfxVbkhS7vzmyfGZnOilu?=
 =?us-ascii?Q?jtnCLk1AEVqf65k1sRxHBlWCR0Vja+YqPl3/G7+B25o8ly8Poy6IK+xmsT/j?=
 =?us-ascii?Q?1fStajK6KGKy8ZSB9wRmMa1lkz4IyVXN9axhjOAUwblU4vbpZ/0HQOI+j7zj?=
 =?us-ascii?Q?Z/VGeIHyBYlM0ANV74uKvnSLUHijsCupkBypiNt1pmIpRy8U9MYJGjJMJilR?=
 =?us-ascii?Q?feaRpQ9naon3Zo7jZ+BBJU89eGheH0nNQOKh/nFSsO91L8G4TnfJtC4hY3bV?=
 =?us-ascii?Q?7LfJnzYlvO/1/1B5Uxyhow4ujhqpm1qz8jSBglBGvqr02KXXxS3emtwlg/nw?=
 =?us-ascii?Q?kRUhSCqawsi9UGcpgjUrbuWCskE6/klXdgaBVcHbUAjjjfWxwz4Vm4rZZJRd?=
 =?us-ascii?Q?JG6tp00L3sFj6YOSpP1VBUZnCPYFe4Hu6ZJI6cESaInQijkbosTsXsk/A6jC?=
 =?us-ascii?Q?lj7CX3AgBAel6C6Ml8qpL2ztG/kzeyceoX6QBf86UsWHt6qB6niel6cjMu4l?=
 =?us-ascii?Q?rat6BTF+zinshq2MaWF7pKxY0jQLb7iWjDG8Tu5evq6h6nNyEnAZFg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6NIBSRMs+S1bokG4pTqRLMdfpY2u8UvF3TZ9OLZDGkWgKUiQRFF7I+CnxN7b?=
 =?us-ascii?Q?QUfxh0QeMtEn0Jr+HfuwBN6bFeAsRpuE/VVdQIMdYRLnGtMWCmCw5Zoup9No?=
 =?us-ascii?Q?Rqr4o0Ilxy2eHLVCtt32BbnCEG2yPbNG9bEnp4dzxq+2MoUCBv2tFxj+8wsz?=
 =?us-ascii?Q?M5F7THqMOTJdxflCJjbabmc1wcJg1cZybfgeMA230470azACnHJSaK++RdGU?=
 =?us-ascii?Q?P+3/ZhoUWAZFK07MpD5g/GFMUElrpOMTpT3UNkn07WuZtVsW/nyVqfWFeV5s?=
 =?us-ascii?Q?AZNN09ORdQI1bikWWYFDiex8foZEVwqNq4Nlx9kBDbTegugMmM5t3NOiN7/A?=
 =?us-ascii?Q?SMJ265jBZ/9rhiU/wuAA71LlhbHqOYbWOGyVWNg5uV4MMCKjuyie5DHaasKA?=
 =?us-ascii?Q?9i41wDbg/qELJaWB9DGx9Sgi9b9bMSyN9svUR1y0pZAu8ybu6leC3je3acKM?=
 =?us-ascii?Q?v9uVhQeDF1ce9BoZ6r5kUi6X/yoe3LDz7WvAZIHv4MAzaINbnBJHZpZfacPR?=
 =?us-ascii?Q?4lejZLs1LvXsSCNJy9i2gOqxfmAM2bgdazSMojpFL1YcopPupbs3n6T6sj2D?=
 =?us-ascii?Q?9WsJcBrGRpx2aAOJOpq/DXJrNLrCazCHx536c0Tczrod9lPgOrO0ejeXql5X?=
 =?us-ascii?Q?cA+LrCCiWbwJqXOmCyxba8La9Dn7sdOrYwt9u19m1KvFkqdU+wMOkydcdg8v?=
 =?us-ascii?Q?NnZ6xN0k+NDqKzZW/p31cME3FBo0JEh/57MXJ+FQEmwywItH3PsRhQ07glfa?=
 =?us-ascii?Q?mO1nEiGTrZu1pzc9mEWsxQc8Dkv+JcWzMGRbGlLBPSka3ySkWGftoj7jlhv+?=
 =?us-ascii?Q?Yu9pIBPx/4xDeLBMZG+cGSQJGK835QI+BfTk2xhe7Lnq6RtIRi1326CDVRn3?=
 =?us-ascii?Q?zcr2wAlh48jZKvoCgexNmJJWgQKGlj+uXh7whb3REMIn1hXY+ZdGU1s29b99?=
 =?us-ascii?Q?qKuu/eudKyV1zxwya4tQ4ArceQcguISXGTEFTT7xS3nMQD/tr+WSljvIAol/?=
 =?us-ascii?Q?rKDmiYKCNz2sFWTGcOkzI4KWZ/8TxoYBAgSKOHGuQaYeyZobdbCSPYyjs/6A?=
 =?us-ascii?Q?reiNb86SP/HgC8aw57buZBEhLcIA2ick8dO9SkSGFt4PeGjFYzT66sBcDWkV?=
 =?us-ascii?Q?MXR/ovgJwPjJ3eVsYHCBNk8gQdVheV0pr+SqYmLSh8UBiv2y1Hw+i9+3CLPi?=
 =?us-ascii?Q?ZShfkBX+FOIP1yL4I7drMzovlkJHj3cAZQmA/7QPLih1MsDULm8ayuUaxoJ0?=
 =?us-ascii?Q?yDNtb5db6jJe68HpxSY68kkyLXnPpfKlAX+bU4ZEAM7NBVKbf1V775cQF1R8?=
 =?us-ascii?Q?VfY5vqbOtD+JOVb5UyPw/9RXZHKedZPLkvqhqZ9Ek636LTs9D9A8iuxf4Bio?=
 =?us-ascii?Q?v+HUDSNxOfVEV8EmK7k6ozXboWShckaiPl6v2jKS2S7YD2TF74DioyKjEklF?=
 =?us-ascii?Q?VDIeVP8hIWUxFiD3SqiI3Wb6YKaYsiY2VyDsWAtaxJ1s0Pqo9+0/ZbJK+IYI?=
 =?us-ascii?Q?p1zHwOn7YwmBkoDLzPRcrctfPo+4nTzMpjLxV5p5UKRm1xKLM6xXBSQjAlYu?=
 =?us-ascii?Q?yWB4j3V5UIg96fjaq+4LnyL6KlGMOv+o/S/AIzPXJxvLBdQrborH5hpK3FFY?=
 =?us-ascii?Q?AQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d41335b8-271f-440f-7ca3-08dde14b4bdb
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 07:12:46.8778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EPMlR7EeVi9eA5734FWfUHEYJrx52YEo1rLuFFiQFKyMAmdsPDhyi03Ke1Ea8mbuUUcO8L13YICG6l+zkUdhtzaTKdnXoqta2J/VFMIdsAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6259
X-Proofpoint-ORIG-GUID: gYzm_6kEqbXQuVxFAxlPG9g5WhHFqa2m
X-Proofpoint-GUID: gYzm_6kEqbXQuVxFAxlPG9g5WhHFqa2m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDA2NiBTYWx0ZWRfX5sV6rO6G8TpU
 1YMO8ZhhXU3ljdaWKJ6YX2C8KimEnQzM7FGnLHeFH7O7XWG4Y0zYvUOJkIjdTrI3mxO0y9DBj3C
 /L9m930GAeyDOiEH4ooIVukrA14Ks8XqcUQ+eji0CCptS9rTLvutPy7FsI3Hir2Yoav1kTZrDj5
 soSdW1LC1ZJVTW544fIgb1FJZAwj1tTWL0n0U3WyzPk1ya4AagC7Vuym8xCmRovmAtNmDpQUqpE
 9tyRiOAGJ3J9KXGY/qPlIS4FudTD2OvBXB7SEp+CVYrHUT3PvRm6WmMLP7RoKTFRRDCE6uSK4Bf
 jRKXeH6KVy8EQ+2Od6gN55v9iwPC73DfU3uIsGr6DBACfrB9OD9ypW126R1tdmcEVw8v26gjTOU
 Y8sDPkFw26pIz78uTQ24LEiBZT+yDA==
X-Authority-Analysis: v=2.4 cv=SPoblOvH c=1 sm=1 tr=0 ts=68a81870 cx=c_pps
 a=TRH5P6HyeEnkyzWJPw2o8A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=t7CeM3EgAAAA:8 a=F4tIFueueO1QkZny2J8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2508110000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 07:12:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222309

From: Harish Sadineni <Harish.Sadineni@windriver.com>

when running oe-selftest for gcc some of the output pattern matchng test cases
were getting failed due to below issue.

Output line 1 was:
Warning: Permanently added '192.168.7
Should match (from /poky/poky/build-st/tmp/work-shared/gcc-15.1.0-r0/sources/
gcc-15.1.0/gcc/testsuite/gcc.dg/dg-output-file-1-lp64.txt):
This is a test output for lp64 target
Failed test for output line 1 This is a test output for lp64 target

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-testsuite.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-testsuite.inc b/meta/recipes-devtools/gcc/gcc-testsuite.inc
index 3257f86907..4859d6d84c 100644
--- a/meta/recipes-devtools/gcc/gcc-testsuite.inc
+++ b/meta/recipes-devtools/gcc/gcc-testsuite.inc
@@ -87,8 +87,8 @@ python check_prepare() {
         content.append("set_board_info username {0}".format(d.getVar("TOOLCHAIN_TEST_HOST_USER")))
 
         port = d.getVar("TOOLCHAIN_TEST_HOST_PORT")
-        content.append("set_board_info rsh_prog \"/usr/bin/ssh -p {0} -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no\"".format(port))
-        content.append("set_board_info rcp_prog \"/usr/bin/scp -P {0} -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no\"".format(port))
+        content.append("set_board_info rsh_prog \"/usr/bin/ssh -p {0} -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR \"".format(port))
+        content.append("set_board_info rcp_prog \"/usr/bin/scp -P {0} -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR \"".format(port))
 
         return "\n".join(content)
 
-- 
2.49.0


