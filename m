Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0756AD4A609
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 09:01:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2164.1768554101324632411
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 01:01:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hvx2X+hx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=54765a9f88=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G5t2a72336847
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:01:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Z8LwVRYORFJqsTWxyKljWwCHMEz1OWOW2utRN9AHe/s=; b=
	hvx2X+hxJ+XIr6OOsljkHvXj0d29LiKPh2AQBoWq1JGD7U3nCW0i316NoEhe4+2L
	KDmrK8iH4qPmqnJbnafqrDtHwo6UZ9+aAdmh5MzP85DZTnZYkI+avxcwA2kiodc0
	bE1acoKAaZOZ8QiHGmWMu7k7Tv80jEncZ/Lvgnqgg1UdXu6Nwag/knN607b07Cg3
	ttcgtJTcjw9U6NC3IY+1bfu475U4XfApVX4pUG84cfiAnAfwO0op+z8mEs9gTaOc
	wUS0GaDFnQM91IakxkZ05cKM++r3ORAImhkDtZpmroFmRrleFSHjy4tNwP5nbe3F
	OxpoOO4i8x0+6KKaJLjPmw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012055.outbound.protection.outlook.com [40.107.209.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bqde487v0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 01:01:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GB3O95Wd2a30EIN3Hyhx9gkTuown2L3AIZJ5ATUQrCQu6W/7uqOiIK7UFcAFyaBVs0JmEoYnf0xgcTVnhpfM1UXeubiBaeU+Rhd4a09puCFDKZ6CwkZ1q82DpEyFblKNRQSzp7desUfEVY7FojmWLjHEqAXFMZxzVf42iLJWj0OOX5qlIJRu+QvkFposOl5JcKvzy2GKN6TPDT56YZX6eRN92wW6WZRacWHuabBzIGkhDtf4D50nHWDk5HkYxOONsGVv4NGBxRfCKfugnmDpPDp6MlWUPVqLPm+JOH2pH6RolBHio/tR+fcFGUEPkT1Lyff+aVo4wIu7RuG/cInThQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8LwVRYORFJqsTWxyKljWwCHMEz1OWOW2utRN9AHe/s=;
 b=x/YA/nO6ap8SRGTv460FPLH38+daGyWbw1gP2JJciWpS9AHLju3vin7rHX4p9FzgrLxC/0UOyS4o6+GQsfnKgadH5W6BgM6pHlU98O84EM2FLxA92Scax3rKtvZwwnT4NE1l5VRF1wRbcF/GfQQbDqz9DPKV8BWyWfk0dEK+6rfDR2HG6hnbLwSE2wLt1LHUJAwt+kERZpJ3xK//Oc8TzWw7sXcBMj5yoSR2seTplWihc7oIxhtecda+rfiTfh6j8nkYuaCM0Gp3VTz9heLkDe4tSzV1YofXSgUIA8Kzv1KI4cy1eB9AG/FWjNDCVi2SqpHF85agWGGQI0jXtrINAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ2PR11MB7619.namprd11.prod.outlook.com (2603:10b6:a03:4d1::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.6; Fri, 16 Jan 2026 09:01:38 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9520.003; Fri, 16 Jan 2026
 09:01:38 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: liuyd.fnst@fujitsu.com
Subject: [PATCH 2/2 v2] epiphany: upgrade 48.5 -> 49.2
Date: Fri, 16 Jan 2026 17:01:21 +0800
Message-Id: <20260116090121.2432867-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116090121.2432867-1-yi.zhao@windriver.com>
References: <20260116090121.2432867-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::13) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ2PR11MB7619:EE_
X-MS-Office365-Filtering-Correlation-Id: 381732b5-bcce-43f9-a8fa-08de54dddbdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|18082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/WQUuQKXmbcBBXvwzXtJhWAgLbXBi04YOnGFe//WJqeoL4OxVLS8+Hq/GLKL?=
 =?us-ascii?Q?mXdhyQQRw7ChZ9s+cGq2zyZDW8R4c9lUTN8WXW2KGmLfQ/gkKt7dxGCigh00?=
 =?us-ascii?Q?yPioD+T0H9ZM+GLr64ztweIzBCYRWr5sBRyq5cdCyF9aczxK8E+v5lQbdher?=
 =?us-ascii?Q?2eGpjyLZFdgNndZle/YM5AHcRRsDU6086IW7npX/kMoGABWSzMElX4eqBbiv?=
 =?us-ascii?Q?OQ2eS6O5D4zbtjWwBzgzeRsEuBZlGP6ArzLO+2T/vjPA+Q0EtuddoLpcqj6r?=
 =?us-ascii?Q?dNtdkgaeQXpMq5HqcHCIrvt1tqeitTW26Aec8bmXdpF3DZwjp0yxrbPFsZTx?=
 =?us-ascii?Q?6trRpFirxhpHqkC30+RNNmkBIj/DPGkA9eNt21ze8YD1nd2m7K4BN31heNtH?=
 =?us-ascii?Q?1UUP6aodGWvwDUr/FUJX9iA0ruk4fKXrXL+tZNds8PPsId0y+z1Ue/8Uexp3?=
 =?us-ascii?Q?ucP2r+sREXt9k33bjMThte+EpYd5sDs88fxkNTPNhPKwEgjEN5AJKd9xGT50?=
 =?us-ascii?Q?cL03Z6fUZ0+aQzxwQRhQMfIcCvNeQ7IgQdS9Wkvm0M7Vy66rpwjOFOhGN1P4?=
 =?us-ascii?Q?065oHYUwffZW1UNSEPDtz035o6lW4eyxdhKiz4Np15QLkXd5txId1XCzNpRx?=
 =?us-ascii?Q?Ynb/ccH4omm5OOIRyaVveQdKInSCbRiHazdFcuE7WKTlLAqohm0cnu8StWP/?=
 =?us-ascii?Q?RiCRVJ1cgVmUA7DJrB7BjVfrsvjjoJAsnbwWsci0ek6OKs3kTOSp/hD6DmHA?=
 =?us-ascii?Q?yG/9eFQW/7FyXfojnfoSEn+OVwfIyar0AZFqeGh3h5gQ/RqsB5bsiwxq/ozR?=
 =?us-ascii?Q?5vMgwxdYRyBAa3Wwjjweiury4VpaCnGA6VuDRUC8pkr4XLn+z4p0wqfgKdZh?=
 =?us-ascii?Q?kTg2ERhqFvqy2xpMhBKN7jGBlOgKmWpxq6ixl4UVugQk1y8BvKLaKYABRfO6?=
 =?us-ascii?Q?OQ9i0u1S19X2rAO+TKjJb54fXiG84XWsBXMvWEjDb+2qfMumjNNCKy6PtF3P?=
 =?us-ascii?Q?4IVUV8fleigH/azO+fb4kmofaFQn0MiqysUJTbwQbnoCFRo8NYeYWMnAgkiI?=
 =?us-ascii?Q?xQ+weKG/wdY2fgGkC5MdkroxwI5gvb7cBY//H+CoEBhyR2tqazv+IYBjLP3U?=
 =?us-ascii?Q?PGwAKl6B8R6IOEe3gaHVqmXNWr5awXM4Syu4Rn2bRTlYML8GJYrAQpUi4RNm?=
 =?us-ascii?Q?6xt+tv7z3JlxEOI5d6Ni/j6tmO+VvIOfwQCuXrnftKmER/n9pKUMbSVquUgA?=
 =?us-ascii?Q?NaPLlC5SlZ2ztIZtV80dIy+z2SSdRJqlvIieiFz43+QPR+qXBC3n1ketaN6n?=
 =?us-ascii?Q?lRlJIvORNFU8D5X+k7X0fTM5Ic+dJEjFmLJj96IODLth3GEIN0IrQBg8x7oc?=
 =?us-ascii?Q?7U6tHl80Ry/E9OkWy48ZX6WvW1WbFkw4aphjcCl3Y3YZwnjJ+Uq9MqHlS7c8?=
 =?us-ascii?Q?Rnbi3suQsfO7Vo16Ltyv0JWno1TkQuSrAucMVUXfJ2zK+ds48cxw7AAVRJJb?=
 =?us-ascii?Q?fl9yW3p2lLlvJoDdwxW4Ojh1eBdNIcESH15kUyG+dHP54N/stzLcl2bvDiCq?=
 =?us-ascii?Q?3Jllu/AFRq8inReOYDL6YFbh6jrI2NV6dOURNHn6gLeCmsWiQMIXKQfSCorS?=
 =?us-ascii?Q?evaZjbQw9DF2yDbt+mIaKwQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(18082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+sIcrTvksLKw/3x+8QPuYzqL1uW9mJYx6ES2vXnSTnHJWFXUfgbAKCcwb4+O?=
 =?us-ascii?Q?YhBqdB0tTYRxUmcS5usshDve3W0qi2vzcaOX1auFuEzNSaUHGcU3u99eM14i?=
 =?us-ascii?Q?WcnLpZZx9UsPvJz4g9pA0EjJfHqweYso97Usvil7NuSOkNxT2rY0gno2pCqW?=
 =?us-ascii?Q?/3+eKvKX0FKb5tgBFwbyIP/ELV+SOF2QIejELCJmN8dezcb9N362SX1gAZ2F?=
 =?us-ascii?Q?HzARrSwuj7/XhG9kOgb6BlOddKNWoVhXtCztlPeg4fCUQbjuK//ZL5o01D+S?=
 =?us-ascii?Q?05TNLiA5CFJA/gpbG0DB5jjJg0Q+89SwmCzAVIhI+UChrXA7PGPeJAsYg8sG?=
 =?us-ascii?Q?oJvAX4xHFMMiEq12eUIZEyeo7HdKUdXAODqfKoqtNYjl3vCElk3+teGDPfkR?=
 =?us-ascii?Q?z+BrjoWsa5Ww7xeum/3k/EfuB6WXtPqkAAGihiviZv2HtJV3r7k4mhxdjTSe?=
 =?us-ascii?Q?n+Waf86fVb8xlZT283pXN0yHO90ZsFh06ZMpYMY3keWGR1I+3KF7FO0J9Q7F?=
 =?us-ascii?Q?DZO0za4IHKaUFy7WMlW04jZ5FyjUYfXkjSRJfREUI+yEH/JclpfkP3DrvJo3?=
 =?us-ascii?Q?fcez8yGsZbwWf/u0lE2i7JRRM9Qjb4AWSMmKIqK/nVjUwMzd6dAswGAuJFyO?=
 =?us-ascii?Q?q5axm+vIEiI8t0jAFr7nMxl+Blos8jlWmOkf4d4WS1RwQl4Hf9B9GCI4LLaW?=
 =?us-ascii?Q?+01exHekACI5J9ipmQHQG3RLB3pf1lmIf0qaqLxAHtXmyO7h1uZDJZ3q/AVY?=
 =?us-ascii?Q?V8mR3nxrtPkxfXv2s+He1fbrLjfYRv3cq4VLXcdWV/bX4GqPmNVV8TBHgfpH?=
 =?us-ascii?Q?diu0j9gqHmgk9yPuLOgO4h9uqFFk3gg1Pyz/EmLTEi+gB9tD6Q2z/mxbPqP7?=
 =?us-ascii?Q?hZbff+SLk9oqN1Sp44rKsKnJsOIEabmbEzuRo2c7YilAD5BbYLRoHp4Sgn9I?=
 =?us-ascii?Q?0JfOG0W4OuoqrUVNlTPbReDfIrh/u7qvLyWQGOMdUMqjHfDFN9dr2hTtO5hD?=
 =?us-ascii?Q?VenYm/wlKQwiIUuM6ZUoKTHRfDdb/dXfnE945s3/iUm1lUX6xJWZ01uE4G9U?=
 =?us-ascii?Q?AO8SyYIhif45njjEEskwUBuJd1iHLj4bEzcN0lnB2bQMODSMqymJ2RpGZ9IR?=
 =?us-ascii?Q?bO2aHrFMG1ZJnhr3pmtQPUOB4ttdkrHMM5HiMQcnJC0ZmCXhJxy6Zijd0YgZ?=
 =?us-ascii?Q?8h5JqAWLXwYEnrimbvumzS0X0iJeymydOrt5w7SLIcmBvNj8Z1g4bZmyG8NB?=
 =?us-ascii?Q?OMGqz3N5/VMrqiYxZifIAo0sL2NW6h1SPesxX3CxKYo1Sd3swRIjFurVfyYb?=
 =?us-ascii?Q?8CSZVelO+YsAYcYdu6o0jaSITsl+8UNjYSXrtlf5Zh2L8aJeo7xEgZCF+ss1?=
 =?us-ascii?Q?UuJhzsYAKnI0GRxze/NUAinhknMDF7DINE/6MlhktHTpUaT7wCiNoaTphYO8?=
 =?us-ascii?Q?cZpsu1VWRrjafH378N9Q/3tldm63pokMCnt1DO5SD0kVWjus5erfNS1SGte0?=
 =?us-ascii?Q?7y0p4x6x3y7tyjyedyPFUS0vfFrLucCQ+Y2Tqe5GrpqLcuuCxFDHccdOS5rf?=
 =?us-ascii?Q?wpz7Xvn9i+3B9h/xBxQJRbG6BLa5cvAbm2ENjXYMBPjjKQshaHSJGQL7+C/y?=
 =?us-ascii?Q?tZX5VNT6wb0V4d4qxUhZ8SgkqB4OnHQuIYzzzcRG3tgMBosyuRUNdqAVzBkk?=
 =?us-ascii?Q?EvBhNpSgHaakoA6p6qtT/eIxRTsgN9it0rcpf/5LpIxEz6a3WxAGB/+YHBT4?=
 =?us-ascii?Q?lrrYU1UBmg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 381732b5-bcce-43f9-a8fa-08de54dddbdd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 09:01:38.7841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Y9ijwM3tEBcB0nS4zAdHbCHPJLfHwc6yk7WHDdEESzLn8iEy80az/03aVfOZ4p9xXO7bFuNlayVl6Qk48IdtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7619
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=XoP3+FF9 c=1 sm=1 tr=0 ts=6969fe74 cx=c_pps
 a=E7iPWXAsOYqR18yzHj3E3w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=ACvvd1FpC_yVDdpOqSUA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: VpIC8Rrcry-xmxT6xpmfQBvwK6KMFVnh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA2MyBTYWx0ZWRfX9RItwwyBuaB+
 HCg+Jcb+PrTtTlHzNAdPq8hdTNe+BqQa53yTBzISNk4yVkjpi74e/mUVstMy9w4Yavbq/CFeXz1
 n7ausM8FWOeX4zjSxI97fgqXLAONgY/5GjI9HYmRuiO3TSaNymmekMXXRSZWdYq6r9HuhGvRrW0
 2xwgeJRbqmWQTc8gnmFEZZMR77z41GXUTuv4frsCI4NByW6WZJBh0t7zuF68iypyVj+gX/x6Wwe
 mmuS/oZnp+kh95rZPpGPl1bk+JCzftlS60C8/tubQKwoqjFzU28zpR+9DIgVYOdPSsjeirZocjs
 4y0q32GsCBO6ry2sqrsN6qfmIfUKUGevmz6epB9gZldZmnRFasURRV64OOVanAeuU1pv7weg841
 8HxIQdP2ECC8iPoyUfPLwShmAAlTI2wUGitCXHdPTF3mEkrD9oE+ZGvxzjKOYo7J1oI/MrNF1PK
 J5RjzIWxmaAVLD8p77g==
X-Proofpoint-ORIG-GUID: u-oZii7xu9vXeGFmRncP-b1-9sXaYKsT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 09:01:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229525

ChangeLog:
https://gitlab.gnome.org/GNOME/epiphany/-/blob/49.2/NEWS

Add a dependency on blueprint-compiler-native.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../epiphany/{epiphany_48.5.bb => epiphany_49.2.bb}          | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_48.5.bb => epiphany_49.2.bb} (88%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_48.5.bb b/meta/recipes-gnome/epiphany/epiphany_49.2.bb
similarity index 88%
rename from meta/recipes-gnome/epiphany/epiphany_48.5.bb
rename to meta/recipes-gnome/epiphany/epiphany_49.2.bb
index 6a1abdc553..4c27a6b6c7 100644
--- a/meta/recipes-gnome/epiphany/epiphany_48.5.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_49.2.bb
@@ -21,6 +21,7 @@ DEPENDS = " \
           glib-2.0-native \
           coreutils-native \
           desktop-file-utils-native \
+          blueprint-compiler-native \
           "
 
 inherit gnomebase gsettings features_check gettext mime-xdg gtk-icon-cache
@@ -31,7 +32,9 @@ SRC_URI += "\
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "0f66552ad6593c7952a3ddee5bf515656c8c434871076d9f1a91a7af9346b1b4"
+SRC_URI[archive.sha256sum] = "b3ba3d68213e87f81f1733e85500c37b82b5938f9009e4fe89994963d5fb2b8e"
+
+export GI_TYPELIB_PATH = "${STAGING_LIBDIR}/girepository-1.0/"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
-- 
2.34.1


