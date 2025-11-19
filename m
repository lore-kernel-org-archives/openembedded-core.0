Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90AD9CF396B
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 16:48:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11808.1763570912086058706
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 08:48:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WSUQlPql;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34186f8fde=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJAUPu93123452
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 16:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=9BDXHt2bsA4L6nYWybTJZnV4CIB571q9JgJaGZpfFnE=; b=
	WSUQlPqlyEzf0EG0LJbktOaMRBiMQDTi9IZS0xh43kvw6YrLftYXbtEsjZcd5JRJ
	OSN8bBEnxSJ0bXTxw3UiPBG2xdGZRxWjQUlmAEpkKPIcOTb8Nx596IP46TaFHFuY
	0aVFD4Qul8i0cyVCDvBmroVV9Nf/zxLO8i1zHuWGHIpGGb9Vx+CcjLQpcpEqBLpy
	oEXJSJ4/4kkK89+6G23a7O8DCZWhPm9NzJczF8vECiyj9Kof9CvnsLoLVX1PUCp2
	mKBM7zrCCbL3DQy6dKSgSM9QarfJMyTxWso9ECGWARBQmiCFuSD9N7W582vmeteY
	rxrjFQ340dzADnKQcIGnEQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011054.outbound.protection.outlook.com [52.101.62.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ahayrrh8b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 16:48:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mbS5KyJWSf5ltzq5PJGL0UxEIz6FDeWFbYcrvDTwcm6AZOomNWh+NZYnW7yCO+5cXXSFmPU6pHBJs755jMLG4g+wkPO3wybX3LgCGgOb86lxfqUHNQ1aQ76qUYEJVRPrZHOfxZNMXw7RHVc9FXmETcgk2UvmwglHGwcfU00ZrlrdQzwWWIUegClBelFJy8YSz53eFCBWmitVgw3J2argXDyxQjEsJkp4nI+TwtVIz2Tl76WeH+X7e3+veRpKbmJGZCZOB3qU/r7Xl7/wDUwb8bu+Y/gI81fKXNOPiB1uWNUuQ4hHEUhFQITMAVpKzOyGEKkpkhPujK2lsJJA082Ggg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9BDXHt2bsA4L6nYWybTJZnV4CIB571q9JgJaGZpfFnE=;
 b=RZI48S7ONXgiV8UJCKgVHIS5TNLBkLz17AbY85lu5o8VAYHD58TB7lJkmRg2LH1Oqmlr9kMr+bJHUcHj2GjeZc0eAbHJl/iD4uDmC0SHUyB81M2FVOYAECb0s1BFnBUgkTrZg5KfpBSt+GitPyBxnD8FMfx66CPEjlL/+lLcswx+VYW/As+FNCLR8AC5eEp8R+mPZX4B6lvqXggoxCd6siK1t2yywUjwXuuFdmiytJVLh7HIOjJd4ZFTktzE5dguTvTdE6eD+L936gMIhMqLkJtMOOVjdD/ld4wzVwlxMy62iY0U7nJZy7zxsQrchuAU20f3bUTx4WunqxmWoXNScQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA1PR11MB6122.namprd11.prod.outlook.com (2603:10b6:208:3ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 16:48:28 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 16:48:28 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, bruce.ashfield@gmail.com,
        Sundeep.Kokkonda@windriver.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH RFC v3 09/11] kernel-yocto.bbclass: Disable ccache when rust-kernel is enabled
Date: Wed, 19 Nov 2025 08:48:01 -0800
Message-ID: <20251119164804.256364-10-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251119164804.256364-1-Harish.Sadineni@windriver.com>
References: <20251119164804.256364-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0203.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::28) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA1PR11MB6122:EE_
X-MS-Office365-Filtering-Correlation-Id: 15097fe5-95ad-48fa-1225-08de278b75bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YZXeramUJEtUkRfXQcz8CaniLG15fpfkgOKSCM+6dJdhqA1mMopo90sbdaYn?=
 =?us-ascii?Q?bRnKSR00D8Olxsz+XkcgudSv7Nurig533CMTOr/7t/pS4TZ/b6G4vxpYjM3i?=
 =?us-ascii?Q?LG5QPfetCHVqG7rZ2X6sG/4SZYZpsA7Js0Hw7G4oTKcdIWrIEy6L+W7TUW3+?=
 =?us-ascii?Q?j4PsTUNQZsQfLEIhSgwk/wn6g4hwL0ODRANcI+HXYk94CoG6dVDiOLuWxNpz?=
 =?us-ascii?Q?BQhLAcr9v0NsfMilFudmtLz2bDh3LQ+mLxXrI9IoEDtcoDhfIZ2gQv7Q3mZY?=
 =?us-ascii?Q?0EA/ekuFkP86tTygRnMZwMxuSAMLrqkMnc6/0Fg0Z0t6Hk3NMpHJpsEpqXif?=
 =?us-ascii?Q?e3iU83RkYYBYC3XGfGv5Vkr4HuiQ71DZxfGl+DXHNffgWOJUplc4yU8b7eS5?=
 =?us-ascii?Q?lQAcXvkNnMqwMMU2cogKOfM9aa9ePNFLaPGS7qjkUhH6gq7/qUSYaXbtUvb6?=
 =?us-ascii?Q?L6HF3fZTBIqXgPD00YFHVcSEE8G03GB446Mbhpxv5Oamd925Qv5xvv9cru35?=
 =?us-ascii?Q?kSagFTca0pFRpOcabfqYwhIU+l04sD5roGC2SBSNJEvKabPe4O/zt4ZBf4sv?=
 =?us-ascii?Q?QrZMz5aheJkO9rdFz8BrgHayuesgEPxxNVu8tq+R2U18xo0K8emV1QWalJ0C?=
 =?us-ascii?Q?qlLrQFr5d4fk6ySiX/aUOWLv/ymwpdQgqQZghxtGBy7CE7/mqlfJ578GBRP5?=
 =?us-ascii?Q?areP5ilNXzAlu81+PZOse+vsF4pc2Z9A5guu6Cw/xR6Ys4picdvW385mKK9k?=
 =?us-ascii?Q?zf87zadq94zNLclaaUxaqYM9xf4pIgKkoUgBqPKRjcjpTEyRyf/36bkmF7PB?=
 =?us-ascii?Q?JKPG3xJhWANAcd/I83LssMacLkDYDQKAcbc4iW9/WhjgH0mGuMembv3s9PWh?=
 =?us-ascii?Q?N1KDmNSEAW/Ai73X9iBoBrwRDXXf9CgRD8ABtrPRO8mk/W4XrAq1ghV1fObk?=
 =?us-ascii?Q?L/dz7ra6u6/vUU04V1lgaG9FtsykXY+GIsZlMCCfK019ySFLN0MIrjFNi0F2?=
 =?us-ascii?Q?K6uHr3Bnmku103laGVxOBvndMns9R8dx/OJCJVIk3EP0zvSlbbOVYChxKOZs?=
 =?us-ascii?Q?3QcFTNElAZDAj+aWsJKGUm861XLbraiONP52RYJWJiXXe9PAtQmTGk85vtEG?=
 =?us-ascii?Q?BHQjo3RBTPfSNDjooMq1arjkkB/nAHlwPyK1rdw1Mi7nflHemzwxgpUteaPY?=
 =?us-ascii?Q?CzS5aLjTNp3J1cA54H33Nvlkvl1YAylugMEH0vR6e7HSQrWxVcRoiRm9+RVs?=
 =?us-ascii?Q?l3oFgqZOWFv9yh9ov0B4VlK6aHgMbYu3Om/DjE9T5r+eXW/A4CeWdaARM2Bd?=
 =?us-ascii?Q?D6ZeoxKjWZoSI+9QsPKJqmQw0mRi39Y60L2GWse9gr6QmOQ0gl85xGKHZWo1?=
 =?us-ascii?Q?aWol/I2a9jAZBVkz4kMshPT5M5AAdYvW0cz/KVY4wxic5UvvmA3F1tVx5ZHx?=
 =?us-ascii?Q?GnVCSgWfRjb4NDqVKYMR74IotvPdmHmbXMOOxqrAc+cMYfh5zojViiF362zd?=
 =?us-ascii?Q?2Udcd/xEwHmqS4W6EcsoPFCmGAf7LVuxxxHe?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rCEDa6/1pCTyKGmaecMCspt4fGeJFoKoHMbYunnrBZi3yyq+j8wPpdhFHFq/?=
 =?us-ascii?Q?z+sYeCeEnH96yI0AyuJVvNzx6ARP15abB9lWGS4nDzXQbnS1PgZ47GOeHziT?=
 =?us-ascii?Q?u5zn7epP2Qjiu7O2yFK4RJNNhVkuK5dGaMdNMKwmYFU2SljpDGdST/eQPMsA?=
 =?us-ascii?Q?SgNTKEXnzAVw2TcbNCkHgDcKVaIFCBn9FklqEQVukRRQ08gFjJLTudz69H/L?=
 =?us-ascii?Q?DWd2Z7xBW7xeiuTmVigb/Gs+h52+APzB/VCGAQlHqpV2YpXZxoFg44KLKEVw?=
 =?us-ascii?Q?gt8o0iUtqjq+nKG7FM3FvsHDTWIQN/yeXJXPppvGYP63dDGwS1x23/AEjhW+?=
 =?us-ascii?Q?IVxWb0mFtSx5dCBwlUBbeNjwz0OPvqlOnQHpJHSECbUAD+1IG3GXwYnM1v3n?=
 =?us-ascii?Q?QGJWPK+fZzVOa7rTkGOdwGyY1CDcMIfvwGabEgRX4MBrCJ5WhosOgP7QGlfv?=
 =?us-ascii?Q?32PuZUW7+dUzm3qfbAYEIu62Dd+bTWhZhUHpiDXa1F1J09yQwuDiMZ91H5b1?=
 =?us-ascii?Q?GMFk3bhtfq1Bt7FRubDETAiwxNrMZGSDvckvyi0OLokagMuqrCoYf+O5bAAg?=
 =?us-ascii?Q?66B22Ozfm17bi62K4le6XaV2WFpTIz6lIAPuPD4M16LWLw62V+b+s38ZeVbU?=
 =?us-ascii?Q?mVMkr6XtPZrVp1MHT9NYC94Wt827ReF5RDS1tG65g4P/MGzpe3xZuMEUOops?=
 =?us-ascii?Q?YpZOCbDofUoo4QWKmwm3lwlG0CrYzZIMIynxg/mmjlq56MGAXXK1L34q85IU?=
 =?us-ascii?Q?bdtVX3PRtJVU+62T1ZpY5w1S21ZUd1VuQm9A1k7eVYxwuF/4UYEV+TejVe9D?=
 =?us-ascii?Q?b0KMVXCp7w8+Wjj8WN0tqPR25Yv/V9QevovJlRv5KR0AczadPMSRM1Uf+wRe?=
 =?us-ascii?Q?C7wA5g0TDUyNzr0Ho7q6qnYs08SImg9DKGxM5ereB+dgJVUTwqeYaYt3/MGB?=
 =?us-ascii?Q?/ij58/8bfOEqAPUxScqx4sRzV+6hVukxXHgKLbBUpDlihk5LHod/AqNeNvs6?=
 =?us-ascii?Q?dRzenUUiiAHJ8pUdZf7cUWFaQH6opsejTlvED9OWre3kOSnvu3IozHRQsaOI?=
 =?us-ascii?Q?hSWfqSZv+ouEft88azWRPO4ZMelrdOpr/tom054KRheTObNjSoPJjlPjTjSf?=
 =?us-ascii?Q?mvLVPzGNHjuwdNbdTzG6/opRuZsrffjPNTv1kcMkU4ksraySCU3XG0LgH11D?=
 =?us-ascii?Q?KzralqgGOHiBI9vymOkfDxOPSDX+OhpkP9xGM1UwT+kxQXF+e5uu3xQE+Qgc?=
 =?us-ascii?Q?KD8+4f0a/XyykjZaEywbUFFX1Cv1iQYrrQA1tciINowMAbMmtSuE+PYkWfpa?=
 =?us-ascii?Q?n+tkBOVE2VyonKrVmJT/7nCdadgCddIAsDCZE/qJos0JJvpBgVKCrMqxKTNA?=
 =?us-ascii?Q?1t5nrUFpKOtJycRKZvQ2zUoEb1IOfck2MYDMz52XMOTFNzJlBRUUJr0BSwYB?=
 =?us-ascii?Q?qkeu2vYfdUzSUIoj/v1zOiS25gcl8XUVA0TbrILj1x30pQSLajoIp9FSkNDP?=
 =?us-ascii?Q?qBYQbwDiEmiqviR+hIoyvK5tTnY6AuanF/lmaIffFsytoUxytvYvvWcFc9JI?=
 =?us-ascii?Q?1Ht/yWhAiuQ0SftlqTmHEKr3IZ+ev7AfxJlgjrxBUzO/sR/wD0+yoq7s/UgM?=
 =?us-ascii?Q?anqe2QZcC1O3U5VVv7zibWg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15097fe5-95ad-48fa-1225-08de278b75bb
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 16:48:26.3777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AYEEAD25xwPmSk0E1gYh5LthY1zOzsOPKcvK+gealaE0V4jnbotAfrn6QH36IqfqSD9HYucEZiimvDzfQ0cqMDfith94Zbq4NS1ujRqwcng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6122
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: -ZeQDAETHAm2g7ei6kI9KVb5mlwMgdx2
X-Authority-Analysis: v=2.4 cv=EdXFgfmC c=1 sm=1 tr=0 ts=691df4df cx=c_pps
 a=7v6vjeP3yXOm/Y6ajRpg3w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=1kRfWWIhwYc51yMvilMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: jPm9U3N9ws7XAbkyhr72WdW-vDPF7cOb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEzMSBTYWx0ZWRfX1NiXFnkhP4qr
 7/36FGF6icJfh64pyUpoRRXfl5pvUFtorvJRW0V9qERjXhZGC4Yt3Hj7MLuhAR7hV8z/CP5kaku
 StkgnbdtwPGnhVinfJ6tYN0HNSnDSK+OSDpM2IihgG7UMCtBVOxj6EX+4uT8jgQtTadlX2EScRK
 bIbdE52P53NXY8b654aw7r4JQ+cmNauJGLxFGbeWb7Z2VkVhYQs2oQR5Olbm0ySMthupx5nFHGU
 4SIeYEa1n0948duQu53iK5gP31sgK3PaOYqtXjHsfyRk03XBQF4/fp5n7CbtUEECYyachJduX+b
 ujKFY5C8+xw8yrHMYcvbqeobqQMlKpJheYAZVDGAuR19e7ujrO7KO5KAoLx/03Hgkht8QWsETDY
 Yvk0OKxpT52epY8PoBpWKyXB+FLO/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_05,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190131
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 16:48:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226569

From: Yoann Congal <yoann.congal@smile.fr>

Currently, a ccache enabled build fails with:
  |   HOSTRUSTC scripts/generate_rust_target
  |   HOSTCC  scripts/kallsyms
  |   HOSTCC  scripts/sorttable
  |   HOSTCC  scripts/asn1_compiler
  |   TOUCH   include/generated/gcc-plugins.h
  |   DESCEND objtool
  | error: multiple input filenames provided (first two filenames are gcc and
.../tmp/work-shared/qemux86-64/kernel-source/scripts/generate_rust_target.rs)

when using ccache, value of "HOSTCC=cache gcc" when this value is passing
to rustc, It is thinking gcc is a input file. when ccache is not used "HOSTCC=gcc" is passed.

Disable ccache for kernel build if rust-kernel is enabled to workaround
this.

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index c3e1137200..43b440e721 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -34,6 +34,11 @@ RUST_DEBUG_REMAP = "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', '--re
 KRUSTFLAGS:append = " ${RUST_DEBUG_REMAP}"
 EXTRA_OEMAKE:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' KRUSTFLAGS="${KRUSTFLAGS}"', '',d)}"
 
+# TODO: rust-kernel enabled kernel fails to build with:
+#  | error: multiple input filenames provided (first two filenames are gcc and .../tmp/work-shared/qemux86-64/kernel-source/scripts/generate_rust_target.rs)
+# Disable ccache for kernel build if rust-kernel is enabled to workaround this.
+CCACHE_DISABLE ?= "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', '1', '0', d)}"
+
 # returns local (absolute) path names for all valid patches in the
 # src_uri
 def find_patches(d,subdir):
-- 
2.49.0


