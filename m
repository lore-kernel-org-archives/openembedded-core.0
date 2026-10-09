Return-Path: <Roopa.Kalmath@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF5ACA6019
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 12:02:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6333.1791547357139747932
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2026 05:02:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=f+D5VNQG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=474213cbfc=roopa.kalmath@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998Hga24035501
	for <openembedded-core@lists.openembedded.org>; Fri, 9 Oct 2026 05:02:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=HLg+klLocgUxElTD+0hO
	sFd9DJO+rOZCrozhX6RZgtg=; b=f+D5VNQGDQIrt2pESgI5jfTApVa5pd+Fba5F
	aJ81H31NmbtCLxnGBQBP2MgYExxyIUMYQTCd9/QMgOotXb9a9J6bnMBy2d4cWOr8
	UcD+V1EXAlUJu5SlLUZO5rxDTq6RkMZfCW6OAmEvyUC1iTSoxKrLqI0NXNMmpa0H
	eBbHQJ4VP/pzxywlRjLHHM+QOB+v6XJjkD1MJSlNd4nfwuKr6ELz57YLtNozK+PN
	ui7qP6BZ3yUchxNRpJeBbvTOz91Doh2lOcN8oLE4nMkgBRbpWXXZkhWWM1tY6oJS
	ZuCMQY0zyXKVkOjfNoR+1mCG1d4OUEjJUXR613YD1nqBXM0cFA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023077.outbound.protection.outlook.com [40.93.196.77])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4h5xen2c8c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2026 05:02:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EZVVFe1+dYJvdPMJeIwJThdVnP9IenzTFiexk2eFu8U3GvKWUpz+vCza3f+dFvGi/U8VdNI7iBcSUbMJ0wfvycPkyrr0hJAEWk4qUMksPzaHhps1Lx5HlJdVPSttzoBe37TcvkXe4waWyXArucanx3MttGZfmkIaBYJYe+euyLZV1cMPrfIlgBZGaY+TfsYczWkmbqDwiPR9kmk8gcwR/bdp7Umi7NXBFtl9X4K6PlRKWocgPLrJ/pG6F49Ppst4Tt7GG0UcGGAMan1G59KUTCeBQdK9zLicsmVh+/rZJm6qi6v8kSfz/vfyHFtx1WmCB3/xMCHHP1MAGYq96jCFHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLg+klLocgUxElTD+0hOsFd9DJO+rOZCrozhX6RZgtg=;
 b=PAHZzjos8SRQ8UahlyUQlaV/ehddj0/bADBSuMK5kQLn5xgy4BPnu5h0lo93+xEEalFIRxFwciGZzH5YUbJlZxdndOJbeB1mLYC1mUXWv7L6Yy1qoWBdi64IecOA4ZcxFs0WXJTVS46CDquaZ3FGbKmOVYcfLj/OMidJ979DZjM+W9UCQYGoKRY15aPBAr/3yOFGSu+8LUjEqL96BjLJRsSspFwWjH439sawUYp/cNGIO+mK9vHcu17agAyGBWQDfTLSAJHApY8G0SEklFiATYPSKM1TV7CJAqn4nZGQHB3XK8hFexzyMfL9VnwxO1KhJxDFYpnxvo7fwnv9r8VB5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA1PR11MB796993.namprd11.prod.outlook.com
 (2603:10b6:806:51a::24) by LV8PR11MB8485.namprd11.prod.outlook.com
 (2603:10b6:408:1e6::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 9 Oct
 2026 12:02:31 +0000
Received: from SA1PR11MB796993.namprd11.prod.outlook.com
 ([fe80::95f6:cbad:d705:67cb]) by SA1PR11MB796993.namprd11.prod.outlook.com
 ([fe80::95f6:cbad:d705:67cb%5]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 12:02:30 +0000
From: Roopa Kalmath <Roopa.Kalmath@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] u-boot: fix CVE-2026-29009
Date: Fri,  9 Oct 2026 17:32:00 +0530
Message-ID: <20261009120200.848470-1-Roopa.Kalmath@windriver.com>
X-Mailer: git-send-email 2.49.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0016.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::15) To SA1PR11MB796993.namprd11.prod.outlook.com
 (2603:10b6:806:51a::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB796993:EE_|LV8PR11MB8485:EE_
X-MS-Office365-Filtering-Correlation-Id: 99feead5-411a-4fe1-a4ab-08df25fd3217
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|23010399003|10067099003|260925021311599003|260925022911599003|260925021911599003|11063799006|56012099006|6133799003|13003099007|38350700014|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Ix7zOgF+j+giAPSI3KOkHf2ezhs4BXqlqmMx8APMW4nIVOKDjmun9jQcFJ0iEFi5rXyl8Ph+nHHIfC6N5gO/PNxSIZl2CMfBRrNMS5IP1gdEYwxHQZohMsDV9thkl8iZqsBhv7/mr1bympFIYkTLwxSNe4/CNC/DxA0zVF0pzfCF61fIJmcS0Xq6vBXYauVL7iauY+GV7YSaKmMxrauYLq2L0CVbr/tcvCWUOeK3HjQlzfugBuutgyEo+rcc0CXpFroAt/B0teNNguUuGhUALGcS2EaIZ7gCzoSPzci4i4e/R+qF9IcQ1+1i7Rh3wP45d2TWS2LfLH84KoXqWF5vM1RkMZOkDSUgnvN1wXcJseaS0s7m+54snb/h8okFKKhb22/XM1ZorlKUWWGNN88SqtIkTmDA6rJYXuPcdxd0ruoBpMv4iYucK9X4LDGQRPf5HgHMv21GUEgHeCNVYKOgsVMCC3H+XHVz24/UPDM/yJPRU1cP78JeeFQdylHjJY5lIEUAJBMBH2NONHPhbWbFSzegfibcImJwrSk8gvCPwkj5Pg1Dl6rzEoQd3gT7xa+8WULTdKJTMNUBcn1YwAkS9lor3bfXcVuaF77KsUcfalERpxMhYbhJUYobJy66wBUsE7e28K51WyMTzbDr3J5KEFqrH6ehYXrI63hZBV6HYNI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB796993.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(23010399003)(10067099003)(260925021311599003)(260925022911599003)(260925021911599003)(11063799006)(56012099006)(6133799003)(13003099007)(38350700014)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RcN6cOrn8RvXUYunnzRpghmqzNaAyzwZx0lYpM49JI+zNuZjGDK1OYU2nPFg?=
 =?us-ascii?Q?I6dVlFwmmTcNLdbpeX7b4Zp479ZXBVYepuadQKmIPLZwlhQg/WCQxbhkkdWd?=
 =?us-ascii?Q?DQqL0wPmANJ8SIL4mkFh5RWq9tH3qQNbMtvKMbsD/NxAZQrF7dXNXhnZDnC9?=
 =?us-ascii?Q?C5cUkc1Jv6vJDM6UzCOcWStzrNtVTXrPOsdT0IieAV9GSmFjuuxvx71N4NDo?=
 =?us-ascii?Q?sryOazlBfdvMXcPjIkwcmPKb9Zy0Nfoy0lzWXP8x/uMI6Anb4fz3doUd0BXM?=
 =?us-ascii?Q?rT/5u7awb24rq3on8rBlo572vGInqbdr7JMP3N4+vjk78Ixc9VNK8RBHjmDn?=
 =?us-ascii?Q?ZqtpfxD3bzd+nhMRm2Q1ZyPySnnOq3OMsA8hevEoOxfF7l+0iTR3diszs13g?=
 =?us-ascii?Q?aBKeeM0IuQlLtqNWqvE1ucl3l7fPpBVYOM2YErKMBto2fOMg/0+TWyvypEMO?=
 =?us-ascii?Q?cBfftDNX1dOvQVTcSAYtHQp83l2zFbNoJPAh4UntyivdmxRAM72fmSXYgqkg?=
 =?us-ascii?Q?gI7dJOt+t91ITHoKG6p3h9o51z+rEOqHl7ECCDWeQYQMJCHd1WdYXVEI2+kj?=
 =?us-ascii?Q?fSqzCnyn6UsqkLKLGmX7aAyGdEkGghrZC229KxIUJBzspn1NNGTltlBoXhHk?=
 =?us-ascii?Q?T/gSd9GGDdcDdAhk28RNC/UEy7X7s8yVm1Xjc/BAfmE6kYa/sGmYbiRdU94n?=
 =?us-ascii?Q?z+FAGFnebZyTBlJVFtOPkI6TaNzIiGlKDl6q/sWdTABWKFwCoiN6Jgy/oGI8?=
 =?us-ascii?Q?AzHslEFcBPGqOhrzjE/sT/PNz9MlBKvAWopbspRP7V/vJKtf+YX2p3n8KP0d?=
 =?us-ascii?Q?YBiNkpe7BC/gCswr+YUjY83Rt4W2wb5C+1O9rqCQ/ucGw30T5rHFqXpqJDm0?=
 =?us-ascii?Q?eQHpPQ2xikyvfrrWTRUwsyEbSh7ZH+fJP/zqzMfP8+Qiy2t8v57aoGhe7B3f?=
 =?us-ascii?Q?T8r7wOSOoIL7P5iZ6mKNd/clAUM36P3IwBUMSnQHNUa+kTeLb69jKxXaSIMI?=
 =?us-ascii?Q?X7wsXR+8krQsIH5yUPaA8L33zXsVe+B5/N9pLjbork7/6+6HxOKYwapQ9oGb?=
 =?us-ascii?Q?7xMB2+szBSAJs1s/IfKVh96Uln7vF0m2tDDZBLVOFCJWyTFRGH/uw6OB9rJ/?=
 =?us-ascii?Q?pBQKRuWJLPRo/0tQdc0LudBNbZJEN/qPozaR+EI0I0hCS08jlMcae8V+LvQ4?=
 =?us-ascii?Q?rlpQ/VELUz9FAxPBfJTpyW+urtSzgk125F2py2LAZHMpDfJi31bq5VNGXstW?=
 =?us-ascii?Q?NmmgQ9TbNGUfN9/GK6aZcNNvllEuE6FNIMpDU6Wd3ZbE0Q9G025bBIj5Jteh?=
 =?us-ascii?Q?qxQMs/0R43X72Z77J0pCrhmQmZPJ2lgFGE/t2lm66P5vKZnLTkQM5UGSjaF1?=
 =?us-ascii?Q?59xG52Ha+NdVS2ZtNfAEfGZVSmKlbfM6/zB73i0rnMDgj2Eay2/pFwme0gce?=
 =?us-ascii?Q?CYGcxg9qKpWXxQcvvEFn7iZCNswCuUMRGTvQigGcdlBjdMC2k0wnVVtsqZEA?=
 =?us-ascii?Q?KVYpRLKDJ++esfElFuJQxiRcX8jFG5EQX0TMh2z4IBRxV8wsBviw7p8Ju9ca?=
 =?us-ascii?Q?tZ+VZi3PoZPlZUvBok7CPxsOfQbKEAL4azAOYeU91wQ5jj/2+XMalpmFkpq3?=
 =?us-ascii?Q?SxF7EOzowzIEgBG3QGRrd2QSagE8FVPmHj3lHWhGRTsB27VPeHmUpLO0CnRm?=
 =?us-ascii?Q?vIAD30D1uXOrWLmToK2xAijI1Ur9ce3NzOVNI6uffHe3gJiZAKIPFaK5cwjx?=
 =?us-ascii?Q?6H8Z8kNlBP+sZ25lXptHrVXPpSn+xi8=3D?=
X-Exchange-RoutingPolicyChecked: 
	40EWw3cTg81eb2AMamQahi9y3qGWk3XM3u4pCvxuugVxuQFJQ1rQDkNK2o/Fgdh3sjw4eHmI7w6LN8x+Ithg+SBy3IsfKhm3pP6YBQyWCnY/1tn8GqICZ5EpYSY/CJtVj15nMhzu+P6ugyd1rFl3MOu3W2Gs03WQyyW5MtL0nEJZkLmvssaWh+eJNvzhJnifdVaXs5hsOqL7AMjI8q5RI+4KLYZSlHUAqKVL6muB/epiX4vM0H52Xkux0pZcIgbxXyfJgc5wTSXVS/Dwbug6vK2y71aZPaZydLYAcV13B2StpgfL7qBIJSweHEcMIJzRFk4cDL6D7B2fhIMmQ5nCbA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99feead5-411a-4fe1-a4ab-08df25fd3217
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB796993.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 12:02:30.9001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AUddXI2qAvOuifkQzm+y/kvXWFDnXEaINiqECyRDQusTGKprc6D0QwVEc6goYiMeGVLyiot3idscCYKu8jvWHaUHrih3EMiKAysoMWwKdgU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8485
X-Proofpoint-ORIG-GUID: aq-qOlo9TU8oERLLcroEcE0HFm6F_4tT
X-Proofpoint-GUID: aq-qOlo9TU8oERLLcroEcE0HFm6F_4tT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0NyBTYWx0ZWRfX4m+OchDp5PyC
 MVLWVODd0eRRF79V6kKfM5UzNIiJ006YpdxRoQluUwfBjf4KWgz/eREmggFmfpoAtXeTr/jotGn
 BirIdC7bxKOPLmXKMUEjdkBoUYVq0I64kCXRtd+ZaZnGIWKD0lnq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0NyBTYWx0ZWRfXyJkSXau078dA
 eM/IQG1IZDCOXIFYJJiZOvdSjiXSgFACQNhaFVS5ueE3q1GSQBHWjHvXwWjv8mdwMsnN6YTD5y9
 eHUoDUDhrt6qAT1PLIDI4nY+4j+JhpLZ6TQI1ADSYLBMbapCSFx21vB0Icd0mQwDoJFpxSXtQin
 LchFvgGJEPoG5G6hVO1d40jMUcje48fSYn5snliIcR1w7BvYzzT1xIMPlaMVpLpg9D3Io7F9E8m
 pfvklS75KAVg+8p5b3VwleK/AH7iXJGUZLlxocdpXP86QVk3zieyrQaeF+4w9yQp/sUou6kEiuN
 vsj2WX3o3CF1MpoG4EuxMdh/2QfWhg1b6PyoRkkOGOxfYTQMnkwVwP7GAFS/G3Z0kjpY3bVX1TP
 cckfAIyfi1Jz9VLHbtnfZYmy1CprMSBhkvZasWpjd1SbcNpVHn7QZjMeVYr8WmQwccGwi0FbVWx
 jPIGdk6lju0bNgoyAiA==
X-Authority-Analysis: v=2.4 cv=DbmCOftW c=1 sm=1 tr=0 ts=6ac8d7dc cx=c_pps
 a=I1rsLqJrwb5vkj+WUQplAA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=8r2qhXULAAAA:8
 a=1VxDqnHFAAAA:8 a=t7CeM3EgAAAA:8 a=UoAGwyrR9ao9U_zt4yoA:9
 a=8gvLZcY7Nlvl4CGD_6nf:22 a=aZ5uHUMKh6B-zo3GvD48:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=NLIdpY7OFUhHErZYHOup:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2026 12:02:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247472

U-Boot before 2026.07-rc2 contains a buffer overflow vulnerability in
nfs_readlink_reply() (net/nfs-common.c) when CONFIG_CMD_NFS is enabled,
allowing a malicious or compromised NFS server to overflow the 2048-byte
nfs_path_buff buffer by returning multiple relative symlink targets that
are appended without cumulative length validation. Attackers can send
two or more READLINK responses containing relative symlink targets of
approximately 1100 bytes each to corrupt adjacent BSS variables
including nfs_server_ip, nfs_server_mount_port, nfs_server_port,
nfs_our_port, nfs_state, and rpc_id, potentially achieving memory
corruption and control over the NFS client state machine.

Reference:
[https://www.cve.org/CVERecord?id=CVE-2026-29009]

Backport the patch to fix CVE-2026-29009:
[https://git.u-boot-project.org/u-boot/u-boot/-/commit/d6694018eaddefac6aae974f9cec72fd6e58f1bc]

Signed-off-by: Roopa Kalmath <Roopa.Kalmath@windriver.com>
---
 .../u-boot/files/CVE-2026-29009.patch         | 34 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2026.01.bb     |  4 ++-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch

diff --git a/meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch b/meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch
new file mode 100644
index 0000000000..1e04562ede
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch
@@ -0,0 +1,34 @@
+From 2b88f08722584cf235f7dacaa190af3d24deb40f Mon Sep 17 00:00:00 2001
+From: Roopa Kalmath <Roopa.Kalmath@windriver.com>
+Date: Fri, 9 Oct 2026 08:38:23 +0000
+Subject: [PATCH] u-boot:Fix CVE-2026-29009
+
+CVE: CVE-2026-29009
+
+Upstream-Status: Backport [https://git.u-boot-project.org/u-boot/u-boot/-/commit/d6694018eaddefac6aae974f9cec72fd6e58f1bc]
+
+Signed-off-by: Roopa Kalmath <Roopa.Kalmath@windriver.com>
+---
+ net/nfs.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/net/nfs.c b/net/nfs.c
+index 537d4c62..9b628ecf 100644
+--- a/net/nfs.c
++++ b/net/nfs.c
+@@ -698,11 +698,15 @@ static int nfs_readlink_reply(uchar *pkt, unsigned len)
+ 
+ 		strcat(nfs_path, "/");
+ 		pathlen = strlen(nfs_path);
++		if (pathlen + rlen >= sizeof(nfs_path_buff))
++			return -NFS_RPC_DROP;
+ 		memcpy(nfs_path + pathlen,
+ 		       (uchar *)&(rpc_pkt.u.reply.data[2 + nfsv3_data_offset]),
+ 		       rlen);
+ 		nfs_path[pathlen + rlen] = 0;
+ 	} else {
++		if (rlen >= sizeof(nfs_path_buff))
++			return -NFS_RPC_DROP;
+ 		memcpy(nfs_path,
+ 		       (uchar *)&(rpc_pkt.u.reply.data[2 + nfsv3_data_offset]),
+ 		       rlen);
diff --git a/meta/recipes-bsp/u-boot/u-boot_2026.01.bb b/meta/recipes-bsp/u-boot/u-boot_2026.01.bb
index 9610d9e8fe..8dd15cf9cd 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2026.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2026.01.bb
@@ -3,7 +3,9 @@ require u-boot.inc
 
 DEPENDS += "bc-native dtc-native gnutls-native python3-pyelftools-native"
 
-SRC_URI += "file://CVE-2026-46728.patch"
+SRC_URI += "file://CVE-2026-46728.patch \
+            file://CVE-2026-29009.patch \
+"
 
 CVE_STATUS[CVE-2026-33243] = "cpe-incorrect: NVD currently maps this CVE to denx:u-boot, but that mapping is incorrect for U-Boot; the U-Boot-side FIT issue is tracked separately as CVE-2026-46728 and is fixed by the included U-Boot backport."
 
-- 
2.49.1


