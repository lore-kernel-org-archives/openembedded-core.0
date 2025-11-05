Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74F8FCCFA1B
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 13:10:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9077.1762348202861744746
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 05:10:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FuzHpkFm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34043e1a29=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A56DUxj2233317
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Nov 2025 13:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=JU6YoXB8UmnFQR9cXBnCfkhNU3heXN8+xwLx6nkSEfs=; b=
	FuzHpkFmO6hgKQ17ugiCJW9w6NvmyAPnHgOFeOvidTrE+2nONCtTWbv9HB3hR3Bs
	PdjM/Ekli2HChzbwnlc0m0qky7hICV49P/Yu+PcH57i/ghBgsukqaU1BTu7+o4Zc
	51oOvPii0Mmfmh7ZkeBtwAZyl7AfPdt6A8BCukNK24P8kefm5YZ2bjbo8gArZZpX
	WvpSvkSYXOWxBrcY/VoCwy76wa8U1dirDXotkRxH+eT9CKUESui6Ii62bO+Ks/sP
	twuJoIzQS7V1QVIU6ci3RVkAx9lN3a0/wPhvfr7qKbxnho6EoKVC4QJc5na+5Dx/
	VBhBuAN8MkqJw+ppJms6Uw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010008.outbound.protection.outlook.com [52.101.85.8])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a7war8gbp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 13:10:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XyTh7/vZOEdiDY9G4xvz+WxrYa3KoiXtxQU7ks8fwg+tj76GGSdrcvI4MOaTk+OOJ458/EU5AKbA5hvLdvrMSN3lVco+t8Ieog+HDGdhvYKCmuILNP3KpPKcdYCXAKX4gVcCBSaw5YzsimlxNnuAX8uNnqCf+/oDXyCq4TCH5fBBx9inUQHX7eurHEdu3937zaFzD88sB63M0+y08MblaK8qiiGAcKUz+TiNAjUoj2ri5pbVQddzO7fDP+Z9Q5ZZLrJszi9HbC8ExYWsfIlDlXLT/LFAdUI2ezpKF6Bk281DYwEslooHjU0gFn14upO8Ai2TVOpi2Ru1wO7ES7MoUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JU6YoXB8UmnFQR9cXBnCfkhNU3heXN8+xwLx6nkSEfs=;
 b=Tez9Q+UzPvru7Y5G11ebOIArjE9FMq6seUe65h9dXC00CFkY36Sjbbjf+g8qZ+48BSqjFFgt35tPoEuLHBJegAP5rQl58oHYUYOpae4WFSzEeZ2e3KSWiwO2YXp+rMmArgoWGNAXIXGBchWAhX0xybMvmlnDSd85fC7529V2KDFwtJFwLAInAremZhFBEmlqwZSadGN+sHXZ/RIMfKR8BF+IiOJ4Wa81yNHpzdMq3fm+BjoOoiqvkb1mDLO5Aa+zKp81n5i1uGHbZWXAFriamlBiMgfRO1hyFrXoC2oDkVdXokTnERkxZXrRtNTv36Ct3J+Jqxi/QmMpuxNPyiL0/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DM4PR11MB6528.namprd11.prod.outlook.com (2603:10b6:8:8f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 5 Nov
 2025 13:09:59 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 13:09:59 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, bruce.ashfield@gmail.com,
        sundeep.kokkonda@windriver.com, elmehdi.younes@smile.fr
Subject: [PATCH RFC v2 6/8] linux-yocto: enable Rust support in kernel configuration
Date: Wed,  5 Nov 2025 05:09:40 -0800
Message-ID: <20251105130942.833204-7-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251105130942.833204-1-Harish.Sadineni@windriver.com>
References: <20251105130942.833204-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0037.namprd08.prod.outlook.com
 (2603:10b6:a03:117::14) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DM4PR11MB6528:EE_
X-MS-Office365-Filtering-Correlation-Id: 36b9e6fe-7753-4104-f3c5-08de1c6c9f76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uaMRQx714lLuXe/om88hrlR3zsBF1txc9RLB7E4HiTjnUSuRJPlYpjkC2vdg?=
 =?us-ascii?Q?rPEEPt8jT0zM5CSrZsvxKSgavRty8ymaa+fBcJn0SZarkwcatAy+otpxCpWP?=
 =?us-ascii?Q?8WYEdg16FvRXgOnZS5apZdIrWegrBMeA4hnlezMjb530mxHgfck9cb4LsYQH?=
 =?us-ascii?Q?ng3MlmNmdB925P9lXE52j+b+wVgijedPpy08bjV+79CRzDs2T4UIrlmn/ZdU?=
 =?us-ascii?Q?9QnZ2PGLtbV3+L9/RSN7k1g1xq4YJ+3VswU6tHqc7VX/kOZuNXNeYeveUhKU?=
 =?us-ascii?Q?0PHJ18664MG0X7uxgtCRgTbD12Djud6CBcC0gyAMS6dL+PWD2UP/cWm/PWiD?=
 =?us-ascii?Q?Q64zAy1lMwPF0YL3ATP4+flX0o6Wjc7PNIYcO1uSe+p/7FdR5a83JmPVXwGL?=
 =?us-ascii?Q?puBbe0QfKKuRmqtgv43oUgywEsOtwpMI+f7b2WzjfeGGB3lXbxovTKFzQ1M1?=
 =?us-ascii?Q?l0SkrpIzvCtqOEKpwMivQqU6tz86IJwE6Prl4oHNpnhVV3wH7r1KRVBWAogo?=
 =?us-ascii?Q?eA8URUQKxE2lZISj8Mo2xmUKAt32PyhNcig2gTyE6AmKrnU9FlOrWmgJJ/bT?=
 =?us-ascii?Q?Nb38bFiEXlavJWZIWGFw3uxW3ql+bELStgfCF/enIbNcvhFnUhjamJoygwr5?=
 =?us-ascii?Q?T6IQ+Ycseoq89Lq3C6MdsppZLNYBfM9NyHgPaI70n8m9R2QDCTP9U2AzUaUR?=
 =?us-ascii?Q?zMYJULcewQC+Wok9d1YWWLlSF52eP11Fb+WzFa3sRydIURUM7za1/PrLvOej?=
 =?us-ascii?Q?CmKvbHBol7vCaXtU7ML4HJhUu9Axf39RZyni7iR5b281cugnf+Xuq+on3hT4?=
 =?us-ascii?Q?AEhmOEW90eUW9pIhe3GOaWwEqwGDHhrGKDLTmsD8uV/8w6fmE9rPn2FsUwtk?=
 =?us-ascii?Q?jSyL2et8qVv/XqlcT4g9wiaBwiWZuPgZ6u1y0iqI91I8uq3D9tEuMXGlAUS0?=
 =?us-ascii?Q?4LUIJMgd8jacxCQib9a/VOHUxM+aUmfYbvoR8tSYfxWrHTzec1gs3LQd8JM2?=
 =?us-ascii?Q?bEFDSlLYffC6WPNd6JrBMNKVSknP4V5tB2bSIMgttmc4OHTd6XRt5m4OVhrm?=
 =?us-ascii?Q?KSpe5KXp0DyNeX1MjG5BU2hMaXALioB2I5hGx3sQM1Cv+Qw9OQ6o5FhMKb6Q?=
 =?us-ascii?Q?l0NiMl44PgXqPV7m7audcFbYgaGUNJC5BUOHB/8koZ58OVhLBMaOLM0gedco?=
 =?us-ascii?Q?kNn2KK6Hg+bBkU0H3C1ZEVl78f5Z2LrqAvyNy8zXpwV3eTj61/SNTNPpdAms?=
 =?us-ascii?Q?Vij76xqvP950lQEiRKNdVpm1D1z90Vv6Y6t1EVVIx1j4txYv9T6ZliBak9vn?=
 =?us-ascii?Q?UZheh20ya6iSeNvjNniKcaKYaHFisioXrahFXsrP0PK5kxCFeGvwGpnEElkL?=
 =?us-ascii?Q?JN//a4qxZv1uAo0V91rCwPBkpMEszssqV726sAnbvKzg9zc4xzwC4nCVDqAc?=
 =?us-ascii?Q?FOripUaxXRcg/w4HAhKfds+lgYyauX36hiruudnz+BL/5w73i87gO2heM6N7?=
 =?us-ascii?Q?mzK3H5tdSekPWr7YKmstzWcH2D0zTr6SQFrW?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/OZA4aQBqtQTk4JPR87ZDiGS5ylNURpbPv82fg0JgH6MzOXJ6jMuAu/d1xr9?=
 =?us-ascii?Q?34R/0Nk3Q7Yir7j+pKRc+xbRr3YKjJiaZNi3aeMph10xKwWrgLVhYZXai/B0?=
 =?us-ascii?Q?jo1u2w8q1VDaW72Wd4SGAHB3ml+6qNWsnFNQMegWsmHxc+XVBNKxeFI/PuVT?=
 =?us-ascii?Q?dyTCQMCBcsag9FeRhkOR9w9fpMrpd8eP+c0NZYhW8P3V5KqAaAfm5yQePkx9?=
 =?us-ascii?Q?fPVvRG1ZtOtlfe+pyfK0UHtHaaX87OhzsUBGvNQmyK/Z1jM3PAzAMNXzfiMy?=
 =?us-ascii?Q?7OoMiwB8bszYSKNklv8bRGHqcnU3GEdbU1EeCTbBulooB7sd0bvhhDyX9cWX?=
 =?us-ascii?Q?Oyy6GquI5wqkDEqY/zD5prG48nBjcw8vwJ8yELpcvcOH/Jt8cc7I9+57/En8?=
 =?us-ascii?Q?Wjwu6yVUgYE1BI/Raz25+HhJH/sHYV5CvOJZ2lwRv+oKRIBTWj2lBvd96+E7?=
 =?us-ascii?Q?Z8AwL6YnKCnLLx7iK6UYuR146CW28IaKbNVfBTrbIuBB7vFeG+Wp13rlW/sx?=
 =?us-ascii?Q?AoXYxZMphDljOy4DZdU/UjyhcHTgBW3DWd6fEmU8aG6KswJFEfoqf72EBba3?=
 =?us-ascii?Q?MJWejbHB7zXHRJVAvsrul/yZnye8DyuYGhxS8jcWPtafi6/TGd5grHQ9Sbsw?=
 =?us-ascii?Q?+m6a6qQO3Bz4I1OOrEaFLW/8vN6BOzGakr+nvsmZD1YUVFr01V338OmerRJ9?=
 =?us-ascii?Q?1yzHdSHUgSgJhbpQd5tNpjjT2I/4BgaiDvWjKKHjdbMITsm8R3c28/jPmP2n?=
 =?us-ascii?Q?QmxKxcjrqQ7+XO5M1M02Iv9THp72rYIdeg1DTBmD2ug/Hsns1Hk9J9fjRqjo?=
 =?us-ascii?Q?4OtRlQ2GnRKa3M/y/WvyzeabMYANFhAZqJUxJa14w3zGaIQoVBWOWNdaKhJQ?=
 =?us-ascii?Q?gBACHDHS9TJG6mTHybNyHX3tWvPWps+juIBULO1u5BWT/sTMPshcxnukmrKl?=
 =?us-ascii?Q?oRdsEl7oA+ksfuwdi0nCVR5fN0bFRs9lVmIQ8RHYRh+8k6I6vcxf0kFej0rZ?=
 =?us-ascii?Q?g503SuU5tS0VKCZdQKMqI13ZwSEFqzjRtVi44PgUyYx2awosMUZqdZogGaFe?=
 =?us-ascii?Q?1eBRAGkKuXZ6X75YWB8+swaRzDFowoxX1r5REWd9Kvt4DENuTPLXQu56+sX5?=
 =?us-ascii?Q?mpIBnufS5RmGyzO9Gz7BnnY8HNr6zxd1trJewdLgFKrd6zWKRQCAIa+ticdx?=
 =?us-ascii?Q?V8FnFxu4mw0PVLYEhGYG/+SOhOfqJLPl3+FdsEybul+5LHE1BdjSHKeIZrA6?=
 =?us-ascii?Q?9uuERflPT5tH/Y/pWFWQU5pD12xxqdjrZA2mu8kcdUT5m18vi/6GW3owJRBg?=
 =?us-ascii?Q?jJyBMNhNQoFxzho5HoInolxkUgmwDc+SIt+lwXvENlBaKkye8ZLIOkF+4pzY?=
 =?us-ascii?Q?bGICCw2SQ3Xd0encStjRQus1/Ey/ISeLTuWVGOhoTePgFeG+4wTvkbvCH+Ud?=
 =?us-ascii?Q?rVY656MzYJTgzcdyCvHkmdR3sbb7VrPJIF2Zm9tHWO3SkPl3sbQAOc2JO84l?=
 =?us-ascii?Q?UWRupop6x2gjr1B2TPNGY73433/fua8xHn4c86Yuw8GRezVCU6wWidWewrj3?=
 =?us-ascii?Q?ptFW23dfZwY33yd/Mjb/BspXKmh2DIfqACtLh1QaNlDq7/1egOUFxBm2y2Gh?=
 =?us-ascii?Q?Vw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36b9e6fe-7753-4104-f3c5-08de1c6c9f76
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 13:09:59.1936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kut85E2swIjWYMIEiby4Uj4cBLkw28mqvICpzyP+Jb5fmMu1MbymHFJeFKlxHv500wwsT5CXpSqVcwUJl7PfcMbKd3WxoNkKtgq7cN/Byto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6528
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=UYJciaSN c=1 sm=1 tr=0 ts=690b4ca9 cx=c_pps
 a=WNBGq+kRZA72juK154DUDw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=wP6bpXLl58u4eWvnxQcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA5OSBTYWx0ZWRfX437mddIFQzjy
 BM07UX7Gv3r++qUkbjtcOrW65OlKnUNDSYBkq43sFL2EUiUZQrdbtsQlNKF8QpQh78Cb0HiTXhE
 tGc/2V5jogAx0vaJSw8b2eO8dezQyvnSx/9mbLJDrBFAb5vqNqh2Tze4PzBemORyWk4zVqV2CEP
 yMbIxWW7KYXPPqHSYfKAMQfpsVFRi61Mp83Mjgm+4ooQxn0cCOhaCfnlcE1tnlg55M8POUSHB7k
 5TXHt9yWkikufkO4gSww8OYyNw8SHVgQZGO0dDnruQAJagaMuUsmKBtiAFhjHrTAfF/mcjnkXi8
 4YiweTtT52jNpIkfpmIa5DTO2pAY9ArID6plSxUU750oQcgcKrSGgAtcM9xIkPOQVQM+bBj5w9w
 lwLvuaPWD7BaBXSyZEWyC4Ht7TW6Fg==
X-Proofpoint-GUID: DqnEASmRZdbl-jcoDaOwBJu1w70Elvti
X-Proofpoint-ORIG-GUID: gEGzsE_27wE3zJUYMOQsBd3ICCnLCvor
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_05,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 13:10:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225763

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Add initial support for building the Linux kernel with Rust enabled:

- Introduce `rust.cfg` to set Rust-related kernel config options, including:
  - `CONFIG_RUST`, `CONFIG_HAVE_RUST`, and `CONFIG_RUST_IS_AVAILABLE`
  - Rust sample modules and developer checks (overflow/debug assertions)
  - Disable BTF and module versioning for compatibility

- Add `rust.scc` to include `rust.cfg` via `kconf` in the kernel feature stack

- Update `linux-yocto_${PV}.bb` to:
  - Append `rust.scc` to `SRC_URI` and `KERNEL_FEATURES`

when sending non-RFC version, we will send kernel-config-fragment to the yocto-kenrel-cache

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/files/rust.cfg      | 9 +++++++++
 meta/recipes-kernel/linux/files/rust.scc      | 1 +
 meta/recipes-kernel/linux/linux-yocto_6.16.bb | 3 +++
 3 files changed, 13 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/files/rust.cfg
 create mode 100644 meta/recipes-kernel/linux/files/rust.scc

diff --git a/meta/recipes-kernel/linux/files/rust.cfg b/meta/recipes-kernel/linux/files/rust.cfg
new file mode 100644
index 0000000000..a884f3cf6b
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/rust.cfg
@@ -0,0 +1,9 @@
+CONFIG_RUST=y
+CONFIG_SAMPLES_RUST=y
+CONFIG_SAMPLE_RUST_MINIMAL=m
+CONFIG_SAMPLE_RUST_PRINT=y
+CONFIG_SAMPLE_RUST_HOSTPROGS=y
+CONFIG_RUST_DEBUG_ASSERTIONS=y
+CONFIG_RUST_OVERFLOW_CHECKS=y
+CONFIG_RUST_BUILD_ASSERT_ALLOW=y
+
diff --git a/meta/recipes-kernel/linux/files/rust.scc b/meta/recipes-kernel/linux/files/rust.scc
new file mode 100644
index 0000000000..4686d9ce5e
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/rust.scc
@@ -0,0 +1 @@
+kconf hardware rust.cfg
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
index 2188c7fed2..33bd8a92c3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
@@ -77,3 +77,6 @@ KERNEL_FEATURES:append:powerpc64le = " arch/powerpc/powerpc-debug.scc"
 # Check again during next major version upgrade
 KERNEL_FEATURES:remove:riscv32 = "features/debug/debug-kernel.scc"
 INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
+SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' file://rust.scc', '', d)}"
+KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "RUST", "rust.scc", "", d)}"
+
-- 
2.49.0


