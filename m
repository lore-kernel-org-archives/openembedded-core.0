Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D9DCD98E1
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 05:47:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9224.1781675261782604119
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 22:47:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=p5Z1A22d;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0628f81a38=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H3xdjl786513
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 05:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=NSJHOxiMZ
	1yxzY65Klq2GbcpUjF6WEY3RcGGg+/Q3hQ=; b=p5Z1A22dwXdXlmC/K/GPydmuu
	y+e+7zqQ8BHyesTkXMYGZ6Oios/pDjpUONCI4oNYpsyUD9/KpylMNbpDKpOu+onl
	ZhCQNF3wfhUyhu7ayy1xKKrf0UaCqTsjtwXaTChw9vlc9o2q1KvtF8hgaO2Hb5zz
	aTkMeJ07T6na5YJws6nawTfRRQEjEiIcDbEnkB1cJAZsZIvNv/YVCkGqfEkhpVLZ
	KueWiB+jeegOw2QKo3j5gm/KhL98/seWL/PEoM5I8cXpnjFTPgG/KJHz20qTF1gc
	RI6N7Em1YLXETOKVcx85rjbMmAV/6oV1pttSNDLY8pgLHsfPVrp2DHmDOjrug==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013023.outbound.protection.outlook.com [40.107.201.23])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4euefc0gx3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 05:47:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LsfSdouZY+RKRVOf6+NdbM82LVK3r7YFGk95amw2NXhsw9GNRbP9cZz7JFgW2lBNMmzx8ovoNkG1jIys9Si9D8a8z4rhbfuF0j8mxRXkzxrgCrPV4A/eusDW8yGF9w/Jh2Zl2MDiKOaGA/lgWU+svlrOvvOq2RcRxlcp8fJIVA4C3KqEkdPS7x+aW8N9/vqiqQb8F3QLsjR+NMA0uMAP8jwWUMo59T6AG6jrvS3mJ9KdbixAq9r2nR2QJWxbVhqdwCCyAIKG6QrU1M4ZDp3O7JJYCeYN5K5NvFlqmMxIrqvn8eAwT1d5LgEGuQEref1xraq4DULq4kycinkXaNkGFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NSJHOxiMZ1yxzY65Klq2GbcpUjF6WEY3RcGGg+/Q3hQ=;
 b=GCeoK93DEz+Qo1npIpwUpGty46KSnN3UDwzWM5e/ztAdA6jKxmyMh6f6wCSYa1ZMVVKtrYvPM5HNStPhurjqyR+PlNb/xZ1m3Y6t9qmFhL7/jKGTVmBpG6brKfcj5vJN73YNgaeMLI/dELRAbaff9BxIJx1yufiznN01m6rMxBzStSrqk+t8Hvx5r7Keu04JLnioCEuTxV486uMJ7xz0TwnZk6LxFL7eVz/UucVPsww+05SXHRWe2ypKN4fDvG59ilf0a4zeipJUNjV3sjvPaKdknNVwlNR3sFuyYT+df63Lw5BBb23iUPNKBkrcjuTXvTHwDvhy6l0LsSGbrQSlpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 PH7PR11MB7596.namprd11.prod.outlook.com (2603:10b6:510:27e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 05:47:36 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 05:47:36 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH] gcc: Upgrade GCC to 15.3 release
Date: Tue, 16 Jun 2026 22:47:16 -0700
Message-ID: <20260617054716.1343535-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0016.namprd21.prod.outlook.com
 (2603:10b6:a03:114::26) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|PH7PR11MB7596:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ba98c51-13eb-46b7-62b2-08decc33ef41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|23010399003|56012099006|11063799006|6133799003|38350700014|18002099003;
X-Microsoft-Antispam-Message-Info: 
	sYxWDPYAZe2jYdTu0T47DHEg9/MZzMGKZFLAN4v0exbom4QUagHlEcJC/ih45dhvSXcUfL2x0WGjPxu85BrDgPYrcAsBSKRVoQO9Egr8R1NfmGW/vvzr0NU7dmSKQL+jSAMY9ehz9ItoE/AEyL9YxKRAdNSeNVsOoj0FgdYPhRwYyPIdOfOjGf0RahgTyaS/uboO7O1cd8ZW1xP3+GI2GCmEt+4kz/xg9PDL9Pyc7UJ7ZLqqUvwBnfXlPYkIHq/GR51daTFJXlhHe2VdbenT2J7BQxJqU1V4MK1cAQuxuPT+sDMuvzbcAd1ULGRRjX74y2Ioslvy7mXqqvnK/lTf/6qHlPf68S4TzPl1yuR87NQI3MPmAzzGKFmi2VEh/gPrNWmbCUWKp5jcQR87dui5O/knWIhSxX/FMLJ1u6iivcl1p18d9uooLyp+yWDD9PT49YjOxh3YWaxuoTU6T+gnBdzaTKReARALyb/NN/Ey7PIZAPt0kfBEQjsRxBYscHrm2cEz71CQq3O8SJfq+PorwLea3V6WpjoCbwE2Gl45AE888OYQpJ6OeNi4eVoJE3lqRX1YoYlwSw0xcZd0io+ktM5kuGZ8a9o/o/1SMK/K4RCCy4WaGb1NcI7ue3xE/pmefhA/f3cOjsyotHmXU8/ZSo8W3Pduw4DdIpOFKBD2tbJexeHuBx/KK/uXo9Y6KPPQ8rCkZAsQM2AZXSPs9hyx5YRM24xfiIkHEd5EypAt93YFBd/zbUR23tJQZAHfC8zy
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(6133799003)(38350700014)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MMADwJI/aRkxstRoD8gLuv2TAeb8n1Y8Ea8WG22m0usIQb0IZ8qHntquvx7S?=
 =?us-ascii?Q?HfzKNH/Ng1a49R4A48tMA1B+EBa5GerfNKLxn8aUUV/o42345fH81NwGeiU4?=
 =?us-ascii?Q?jkgZkGfzmmQGAn/ECqZxyve1+Wy/aFAE5lG3hfOVE/svuwM4gnIk42y5LiP+?=
 =?us-ascii?Q?MMJm8tpViwrc8RbjJDJS5tH3JS3WFAIKVpeC7dEbgJ8i4WAZjby64gpbU5FV?=
 =?us-ascii?Q?TsMCmEiGdhp6cMv+Yh0EoKJTdxumtEsNTDpASsF2UN62Q0Hoa3KbBeqohr87?=
 =?us-ascii?Q?k19DPjDZk8er6AeO0Q41je4SlcYQGfszRtjObVEVEjkQkqLKToqy7dGzVT9u?=
 =?us-ascii?Q?mNL38J/U8/wXfRfKlDSwlp7VeWowBTSp6M7E04u5ZfIX6PBYv3nZNk5KzpTI?=
 =?us-ascii?Q?/RCHCwgGGOpYDcmhf8oe7+xp+T9kkcIlJtm6tlgbhm5Ye1N2Nblsu7Qah7i9?=
 =?us-ascii?Q?ozPHNktPR6+1F8/ZXxWcjhcefytUGlDAOeWiXtFOjXabmARGMPbVbBVx7Djq?=
 =?us-ascii?Q?I64Jh6sbXsA07/OUBZzfvNmkimmBxVM28NMQb2ANqcN+/P3YXrZafX6JJCW+?=
 =?us-ascii?Q?mdjtbT7OIchqDDyAQb8KvRunKijt16udNnQ/9r3Py3/jsFF9urKblgD0vbeu?=
 =?us-ascii?Q?6I7rGqku+fQQxWM4JCW8O4aSbuhYbYyhsbY4Cv7cKPkgyWcGpIfGaOSu1tWI?=
 =?us-ascii?Q?I+hDDlfoSq6wJdsQTFW85Mcai093kC+//q9740ACZxj+7uk7Ce1lEiEPHMWl?=
 =?us-ascii?Q?i934v5SNYUoyWr6Vr52UHCpl8VjDil82BSes1cno1MGlEALQxn4F1mlGfv4K?=
 =?us-ascii?Q?GWhLr/J1aIB87hchXERybkUosQTsVGxPjtWT2BwsmJDJYTzGjgm/bQ2CjT92?=
 =?us-ascii?Q?jix7ETZYjR4G7Ek6JKQkCfuMDJnvZmo+QZW1C/9uNaYCBMjmWxECprejb3Yn?=
 =?us-ascii?Q?wbdMTgnMs8pkJ+HKV7ITd04XTiFMPsNZcRbVHU0AJq/0iO8ErmRwdF1Ys8om?=
 =?us-ascii?Q?CfYUmzIMRZwZEnLnlRniA3wr0I2W8UmqTcehERpzV+t1wxVsMDRh3V/NNOHO?=
 =?us-ascii?Q?J2R+9XIdEBRK1tMIJQIDysRPUKYhwd92rJJIFS61Qvpr3wKSN5FwC2gICQRQ?=
 =?us-ascii?Q?zdgGE76GvyBVkbue5t5I3rc2gFpcBf9p53FIyPW8K9o5m/a8dfHWe6mCj53L?=
 =?us-ascii?Q?MWNeIrY1J9DGkxc9sggpf5jS3Kx5eM9AWE6GSeR0aseHOVo238SnTC8k3YYU?=
 =?us-ascii?Q?bG7FRpQEOIbQdkFLlsETqSnElT0uTLCkHqSOVBgq3eai5xGNe47/CzxEpFJr?=
 =?us-ascii?Q?UF6YogoHmJvNSLU2CSgnOcH415sgIg2OWKZUVtmbZF6di09nFLELKqDcPWoM?=
 =?us-ascii?Q?Q2LNCho90s2GSLi0rHkhKfE972P+6HAuomaEO+RZv6BDicjZGX5Od6xI5fbd?=
 =?us-ascii?Q?O/dELdXz3QRAlVzy8G6BrQi06KozknRE1Gaods5vZ5O4h52enJyS44zjfBsI?=
 =?us-ascii?Q?8EfbWc8VAHYR1LIRxajpqDOuK2XjWUR3bTHnFmv5lplLJ5DYdhtg6mE6rB9D?=
 =?us-ascii?Q?QR+/buCqxg0wlmZK4FlJUIeQ7nNpHdbjBF0JOj3Ae1EYY7SUDRfOT7mdJN1Y?=
 =?us-ascii?Q?q5Wyx+82ZkCa5iWDjFyR0WkW1LCb1riQKPp/pgzS2bslz4Q9k8A/Yub1O8WN?=
 =?us-ascii?Q?LySwP5k2DcEI8Znajn6NA1q4WwRzyDCaO+Y7Xot6So0r2po33xicLUtxmHim?=
 =?us-ascii?Q?N8y4Y7YRUcj2KkW1XOP3ygll16JqVFM=3D?=
X-Exchange-RoutingPolicyChecked: 
	JL8q2HtGmReXJ/Z02iWZ5hUwnWupJQA4pe7RE2qqwAz3R7hSLs7tHBmM8b5u5blZyH4dz5CinaMtTpxWj1qj43v3vZJWh4RDtslpwdRQX7M9CcoXRJQPvGdP4lIfgvRWhqbj7sOAAwMjfWWb/4utcbMMLfePIx9lZtqVvXPEDRH5p+ixgS4nd19pOKURvtwMNxE/S9IibStub24LyVekkjnAXc7FmNvPQj52yrAL8MJt7vv/wNTijy7dDVaVWZjvXCKdrJ42ASjjwsKhxHP8ue7xuClc8Vy41s+cV0iQvQmPpbT6q09IL7Et6YEA1NXJB5hgG9Usk5grZq2PXoB/bA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba98c51-13eb-46b7-62b2-08decc33ef41
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 05:47:36.6071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ldy5gcuMk3IKf6ZvjKg6kWSsKXAbIXnkyZUOKSowJWH5vbDcgAuYRW6gu/wAOOV3jRJ+JfejJlRJkDlQ5CgLa39arBXuZ2P4kBRfBtfNGZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7596
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA1MSBTYWx0ZWRfX9LPEiFxbjsxD
 kzTQnZOZdyUrNO/FV2ITKNXCdm68bAaNgVU4QuseJlGHmyclooGJbFn9aR+7EZWlzf6KUDkwSvN
 iXBaFsUz1a0adHw7bLetrxA2X8mF1RG+TAeY/YHESvP2Gl/VxggT
X-Proofpoint-GUID: 8DXcmz0uHb_Qr3ZJEaiqkRvZDQE9QOzV
X-Proofpoint-ORIG-GUID: 8DXcmz0uHb_Qr3ZJEaiqkRvZDQE9QOzV
X-Authority-Analysis: v=2.4 cv=ObGoyBTY c=1 sm=1 tr=0 ts=6a3234fc cx=c_pps
 a=JigUrrSO7vm3KiUpdjzzBg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=mDV3o1hIAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=7CQSdrXTAAAA:8 a=iGHA9ds3AAAA:8
 a=ra-KeGRoOAgXHpiHVwoA:9 a=lQi56Kx33krzEgpJ:21 a=FdTzh2GWekK77mhwV6Dw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA1MSBTYWx0ZWRfX7XpqGpErnwoA
 ZM10iFfHlfUewxHFsBfFcYh0rSGpCTBdIr+oYwwFwc221gq8xLu1m12tb8fSr11QXX4t1QEjg92
 muFO4VR0NyZBqoY6YaAx+huXInoN9n7ZyuDVah70EdIU/Nn7BTjpGhu+nM4sf1Y+c3EDdJDvNvB
 U4ae1P5mRv3v/gJ4DRPqKVXRX34EFXTn92/ijgjWlyeMRsf8DAKuWp41xo3FlSZy5owBltYpypC
 BfWyTJIBSPu3W0AImHmwVbDOyXdlLUgebulqW/NbJgonpDLPN7GQm4CFevw1ZIfrCeQLqj8cxQH
 W3M+H5/ZKMHhyILRkcaiOQjYQEjLuc/7mKpnghukjObFhtMenIXwpy6gMdUJumjKq2WRVDikKb0
 1Kn9scBw0qiA7HGZMmvLPAoiWr9gX8Am7SQNeKBJsLZfat+uPB2jB5BG2y2RHoCx82axGFZythE
 vj3NI1ROZmZg9pYsSDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 05:47:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238976

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

- Added support for AVR32EB14/20/28/32, AVR16LA14/20/28/32, and
  AVR32LA14/20/28/32 devices
- Added IEEE double functions sincos and sincosl support

* Drop backports available in this release.

Release notes: https://gcc.gnu.org/gcc-15/changes.html
Docs: https://gcc.gnu.org/onlinedocs/15.3.0/
Bug fixes: https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&list_id=522382&resolution=FIXED&target_milestone=15.3

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/conf/distro/include/maintainers.inc              |  2 +-
 .../gcc/{gcc-15.2.inc => gcc-15.3.inc}                | 11 ++++-------
 ...ss-canadian_15.2.bb => gcc-cross-canadian_15.3.bb} |  0
 .../gcc/{gcc-cross_15.2.bb => gcc-cross_15.3.bb}      |  0
 .../{gcc-crosssdk_15.2.bb => gcc-crosssdk_15.3.bb}    |  0
 .../gcc/{gcc-runtime_15.2.bb => gcc-runtime_15.3.bb}  |  0
 ...{gcc-sanitizers_15.2.bb => gcc-sanitizers_15.3.bb} |  0
 .../gcc/{gcc-source_15.2.bb => gcc-source_15.3.bb}    |  0
 .../recipes-devtools/gcc/{gcc_15.2.bb => gcc_15.3.bb} |  0
 ...{libgcc-initial_15.2.bb => libgcc-initial_15.3.bb} |  0
 .../gcc/{libgcc_15.2.bb => libgcc_15.3.bb}            |  0
 .../gcc/{libgfortran_15.2.bb => libgfortran_15.3.bb}  |  0
 12 files changed, 5 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-15.2.inc => gcc-15.3.inc} (92%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_15.2.bb => gcc-cross-canadian_15.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_15.2.bb => gcc-cross_15.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_15.2.bb => gcc-crosssdk_15.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_15.2.bb => gcc-runtime_15.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_15.2.bb => gcc-sanitizers_15.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_15.2.bb => gcc-source_15.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_15.2.bb => gcc_15.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_15.2.bb => libgcc-initial_15.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_15.2.bb => libgcc_15.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_15.2.bb => libgfortran_15.3.bb} (100%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 07e840ac34..99242af484 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -200,7 +200,7 @@ RECIPE_MAINTAINER:pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <r
 RECIPE_MAINTAINER:pn-gcc-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-runtime = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-sanitizers = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-gcc-source-15.2.0 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-gcc-source-15.3.0 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcompat = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gconf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-gcr = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-devtools/gcc/gcc-15.2.inc b/meta/recipes-devtools/gcc/gcc-15.3.inc
similarity index 92%
rename from meta/recipes-devtools/gcc/gcc-15.2.inc
rename to meta/recipes-devtools/gcc/gcc-15.3.inc
index a96f2b8411..2f74351085 100644
--- a/meta/recipes-devtools/gcc/gcc-15.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-15.3.inc
@@ -2,11 +2,11 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "15.2.0"
+PV = "15.3.0"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "15.2.0"
+BINV = "15.3.0"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
 
@@ -44,7 +44,7 @@ LIC_FILES_CHKSUM = "\
 RELEASE ?= "${PV}"
 BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
 SOURCEDIR ?= "gcc-${PV}"
-SRC_URI[sha256sum] = "438fd996826b0c82485a29da03a72d71d6e3541a83ec702df4271f6fe025d24e"
+SRC_URI[sha256sum] = "fa59c1beef8995f27c4d71c1df227587189315d3e6faff1bb4306e61b0c530eb"
 
 SRC_URI = "${BASEURI} \
            file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
@@ -71,12 +71,9 @@ SRC_URI = "${BASEURI} \
            file://0022-libatomic-Do-not-enforce-march-on-aarch64.patch \
            file://0023-Fix-install-path-of-linux64.h.patch \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
-           file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
-           file://0026-fix-pr90579-testcases.patch \
-           file://0027-gcc15-pr122394.patch \
            file://0028-fix-gcc-libitm-false-postives-01.patch \
            file://0028-fix-gcc-libitm-false-postives-02.patch \
-           file://0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch \
+	    file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
            file://0001-mapper-localhost-might-not-be-known.patch \
 "
 
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_15.2.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_15.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_15.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_15.2.bb b/meta/recipes-devtools/gcc/gcc-cross_15.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross_15.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_15.2.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_15.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_15.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb b/meta/recipes-devtools/gcc/gcc-runtime_15.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_15.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_15.2.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_15.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_15.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_15.2.bb b/meta/recipes-devtools/gcc/gcc-source_15.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-source_15.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc_15.2.bb b/meta/recipes-devtools/gcc/gcc_15.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_15.2.bb
rename to meta/recipes-devtools/gcc/gcc_15.3.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb b/meta/recipes-devtools/gcc/libgcc-initial_15.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_15.2.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_15.3.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_15.2.bb b/meta/recipes-devtools/gcc/libgcc_15.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_15.2.bb
rename to meta/recipes-devtools/gcc/libgcc_15.3.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_15.2.bb b/meta/recipes-devtools/gcc/libgfortran_15.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_15.2.bb
rename to meta/recipes-devtools/gcc/libgfortran_15.3.bb
-- 
2.49.0


