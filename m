Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56333CD98E2
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 06:53:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9769.1781679218235636069
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 23:53:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EHD4L8xH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0628f81a38=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H51Re7451846
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 06:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=NSJHOxiMZ
	1yxzY65Klq2GbcpUjF6WEY3RcGGg+/Q3hQ=; b=EHD4L8xHKtlurtEGcWW/ttz7v
	uel0ujXCdj/NElajtlRAeQKZTYcFcBqluZ26mAMoK/aLucXd1Nl4BhLB6A3FPfBn
	d/dS46j/sieKeYhZupkZlZgY4JBiUQtqH6ewWdlcCrj7dY4noAKR6bI6wb6USOL3
	w1TRMbxbzgoSXtIUBSBkG+FeV0b0MxP3g34BaUn5mrdqJMuBjZnq9wAbZMsBGpJ5
	bIrYdp6Yp4IobWI5qoEjwDrZx1+9FO/WT9xwO9yMJ58U6hlFhfAIOmDNC1Z40KSb
	FILNoSotaD9KUQU/cHKE3sghgptFss3V2KXmICm1ltj8IUn8AqK6yw9SuddSg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011044.outbound.protection.outlook.com [40.93.194.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4euef80k1k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 06:53:36 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dwx4ayL2IEioA/f9+zXP1BWAfFh7VZlzJlU8E+MQ7a7f5kYYF3oUomGreTvN1nQ+UFmmuPgUlsmxOBWyc7X2NB4geiL4BSR+AxZjJOF0KU5mK+t4aoh4/da80351Mct72AWApkfOTe1aUMSa0gQ4K9lhqoskZtxBcga2SuGR1upQVc/oXHP6+8ivvIT3k7HPaPvJYc37ybQyAuv7gDdKKfGcz3sqhhOcrJ1MNFzY9mLyNEC8VXDx6az1dUXhytF5g/cDOD8qvj1OdSG3NMfXiUHi3podz9bNY4kGuxShRmN7NKSXa6gbXSjbti7Qa75GFX1Z/ZsWkCoP2it9Big8EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NSJHOxiMZ1yxzY65Klq2GbcpUjF6WEY3RcGGg+/Q3hQ=;
 b=sa4nLzs88qdonfasM45LDJT8KtbKYqvbUsZd1sEAO5fxPgXoL0oxJm1In4ck6BeKyf3f030CiwRMRsNNvM9XeIW7C5LLuTpKG1InaEXdVkfnAHNiLDzZPQu4ERQupypeY7yMYs6xaeD12RUeR0lpP8Ok/D07GXnx3ZIg2lftII3YxcKqNLxEqJKTUxXMPUkZYKNlro/DHtm0Y2AsPcfPLwlfiBe8Slocb1nZMbbXO/DJF7eA9WNZIoVSuBRp6/rC+ZwtAj9Ue7zBa5/o0zB7+K+mc0B9IpkprJHHPxJ2cy8U3d63L+pvYF8jHsB3YaoX5kSYVn9k0U7JmCbYNI7+EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 SJ1PR11MB6130.namprd11.prod.outlook.com (2603:10b6:a03:45f::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.18; Wed, 17 Jun 2026 06:53:28 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 06:53:27 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [wrynose][PATCH] gcc: Upgrade GCC to 15.3 release
Date: Tue, 16 Jun 2026 23:52:55 -0700
Message-ID: <20260617065255.2098405-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:a03:217::24) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|SJ1PR11MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: cf498f92-b1e2-403d-2468-08decc3d2287
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|56012099006|6133799003|38350700014|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Sh3ZYhijHCy2g6BWj84xQCbmkJhmDEgOSOXO/K8DRJN5RoUiEaeV/nL+GlHWzIjeY3yEcuKUQcYY+VwUJzCHnRaugByxxYP2ueC+bt6A8Xy0LZ6aXn3DzC2hWnIKhWTK5Pmk/gUplJHpykCVKUH/l5ARiQThhPTnWu+Zek1v93+XNj5pIvK2MmeEn+ugMlkyOqkOTqbRDdf5c35HkZ5HugYAsgMTWhLxz/GIzYdZAPQ55HbsWe2E28p1ApCO7ImO4FUZhDK59Z2cIajtNsM/EYbN1gMk8mijRF6nCg+LuLELGJ5OkMIIN09h2RRz1lc9X9A+WAsWxU5rlXOl0c8us67b/VHdNw0EhkjlrerjMKR3sdBnh9J9TMaB5/ggvV1nT3m0wlKo2BqQPQ0foK5NaAbDpx79d3i6jPkZ80tBb6bjRpQVZMvLr/l2Gn+mRVU4/aLYK9HAgXE1W7FcnWeOJo12DL507+bscteJaSF0ocMF2QYfYY1kQwWLexmxeEZZHKXC50iCcEmtDrd7eeCwdce2PvjK0hF2NCTkcz8qc+BptzFTlY59g89P9K/BIsPVqOL4lMSkiLCSCDgDkGMmXefdMot87uu8LnkGUoNbESpnU7ObCr8XhtobHdAffauAHFC1+4s3eBNqZ9B9YLXCUeM3XqX+syvdYV4RFWjTko6SjGNIQHQwlp1jcSfopaVSSpd3NBrcSjUWUH9BPifUnfqC1gPtJup2PThzt+uQmPwzgEJnFCKRQm6uBbUAjQSG
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(56012099006)(6133799003)(38350700014)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?on4UH1O+1yTh/bHsaJEE7dcp7/l/DZAu4JfNujCZgh4PtLVTlNXz13y7SogC?=
 =?us-ascii?Q?B6y44oW5oNqnv3jtyUCj1JTIL4pnmGEqZDuyyCPsOUFERhlE7eiPmU1hXI8g?=
 =?us-ascii?Q?5DyFwiX4Rgj2Oa4lm0N87Cs6P9PQ4uEIYfLN+SkHtBLEaSfRvGLmn6z1Xtjw?=
 =?us-ascii?Q?MI6hpJTRjWiIilympwAkQMYYB1ZryWCkwgn6gEXgw7JCC/svni0mLZof3mvc?=
 =?us-ascii?Q?e28h/L8QXu4uVDK3BhsRgQmL2b9T+OMgELtp4EW8h9kyeq9a31JvBQDg3AF7?=
 =?us-ascii?Q?b4kaRC/810yVoKeWxtdLilb1fGFKExxq3b1lo/toKTrS3le0vYR9gbp1IKXs?=
 =?us-ascii?Q?4D+Fu4BWpx9jmASIWWapT8XDRIrU5at8o3CnW8GDJjtp1ePi6+52OKUMS7IR?=
 =?us-ascii?Q?+8/uHy+FTA3d21OQgVLMk9vaE4kmGgTcDvKnSAEoozCkte69NLELbpITvNV3?=
 =?us-ascii?Q?tGEDI+g3JpIw+6gGIpnP6+GsFw3syLDeKAQl6fDDjLfOlh6i4ludTuuyGAaX?=
 =?us-ascii?Q?NiUg1sqiFOCkXbVLP6zdQFzRhSdxL74lQ6QyQMFWTJvp2eH/MiNihihY+Ivd?=
 =?us-ascii?Q?pXw2aw0DVgtMavzrc4xuHCzo5MTYcrMePSELuD5lrajQRDMnkc6vcB//Dnh1?=
 =?us-ascii?Q?6mc24mOJKaz2rXLYCB4VfFU3RdXczSVNcaGm7jPVL27vr8kfD5Qh4RmBryVb?=
 =?us-ascii?Q?4i2JiosCYj7tO/Qh5Xu0ejUcrt9eo+ZghdK4qb2E/S66lsC5Ffkp2Cjq8l0w?=
 =?us-ascii?Q?SudmvkenfXaZBLu9ZkAnkb3bNlo8cNR7atFBmScOC3vnpqCryifBi77n3uWY?=
 =?us-ascii?Q?S7kJuJC4b8XaHMXFGbJXc1bmVUnVkRJb8tWlo3QX/bCPLSlHPn6AO2/KKLIK?=
 =?us-ascii?Q?Ybt0a168XyHlQ7+kg/euHqcPY++bzdzDbUHZnAkQSVS8LclJmAUtD4vR1TcM?=
 =?us-ascii?Q?tUHzZ8xY+uwdzJpgp1e32OGwy5OdRHIryhVKAU5CSLaZWwo4IfpNhyOEYpiz?=
 =?us-ascii?Q?qmzNPqGcnU1NI92Yk/rUYUOyjoWReNaojrC9GbfI1DZYv/EHkvfDL+X9qGXJ?=
 =?us-ascii?Q?2Jgzff2YaQCD4joEtGWnZFbVCrXLDNgDYobgBndqKabqPYe1UyR8jZeIYrWU?=
 =?us-ascii?Q?N462gJ/0XVLpuDDkXSs68iEEIZ8eEYKmcejtc5h7/OgkuaK1RkxZIjXrb9lv?=
 =?us-ascii?Q?o75yLzTaGshGLSXSWmL7Vbt2FMVRvKArF+WCE57M+N8NBKzLgrPmbaDuU4Ae?=
 =?us-ascii?Q?Ih5ve32TlbXYsxDcL/uR6/JEuKemTawMgzEzKVTbe4jCpN7f4yunCm9p3Opz?=
 =?us-ascii?Q?CUu+YmsH8QKv5iWEpwJdwFP/dNcl8ccSxPMSiCE7Ta03pVWDyLgpa2Y4n997?=
 =?us-ascii?Q?pTs1SqBaiTKHJrqXQNYyp3uh0FZ2b/9FvpjTsp12az5/icwTMAyzQcvOHPVs?=
 =?us-ascii?Q?ZrdkbpFkQ+NubcBfwPfV/gXHnhFgUWd+Kms8E7ZDKuHff/z8Xz40eG2zefb2?=
 =?us-ascii?Q?ItUtrRwWxphAo7yI4Bprbh4ONsV6vWwyTmIM98PjDwZRH+O0Fluzi52CqG8w?=
 =?us-ascii?Q?MVCRqgG4C3a3oYW174QTAcZ89gjJeppKsksp9GlP/uw5x49mU6M0oYB1FS93?=
 =?us-ascii?Q?fx/Rx08vufvshnIAPYaTLpRGfPs9MOjiceDfTlIuRciS6XLuYzZ+wHM9ayZl?=
 =?us-ascii?Q?YBgQ6TFUCAfI8aV+fmV6BBRNOwNGMw+xhscNYEoPOOn5b6D383WoiOG7ZZHE?=
 =?us-ascii?Q?tnilwnzIYq7xIOS94bMmNmgvF2uir1Q=3D?=
X-Exchange-RoutingPolicyChecked: 
	jVAMThKyXf+o2C+zTq3uf2bKlNJhltb7BGn543ix3PKvMcTl9OFvMZZdDM+hrvqHWUILi0n61cPNjK+twg23vPI2dMIMtKKEEP97Z7xrLhaS1bXZdql5kWOZH9+WReVakbDSnZ6l5Ejm1E10fKWU7lSMZheqynbDQWUwVrHf/2gbsv3ItnwYSp2pQz0AVeMtTzP4hpsRjyhF/FD22DmSycXBjdnMjnixD9QwR/WuXSwFUCPRXZ49mxj/My/KT2JuT9QDHM8x3z2788QlGi6Pn1tMMMlfdUriHTe0uVhlKxblAF54z7GaZg7mFC2ZYeHznagfQ4aeihdOsqXJ++e6kA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf498f92-b1e2-403d-2468-08decc3d2287
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 06:53:27.8591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rRuNKHbKwstGB27UZqU9yvi59gO2MLEtT17pz96mJ1Df2y7O8V67UjXZIFyqvOtXekY1rTXrF7XxrXZ9Tn4XOb4nNbuAEIh2LwR7O3uyqNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6130
X-Proofpoint-ORIG-GUID: peKBCsT3w8HTcWM7b-ZnWks-JZMbysTb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA2MSBTYWx0ZWRfX49PNo2kESvWK
 HZvmqrcU/9N1MUmhLyeEbHXnImd7W7lNcX3IPvy5k1+6Q2PrDZsdPQoFDFYltyzt3Aaz6Sze+uf
 f5S14d53ZhpZkoarOIzPWbUkwRUi2cl0zXF2OswSqkKTB1zPpml9
X-Authority-Analysis: v=2.4 cv=auCCzyZV c=1 sm=1 tr=0 ts=6a324470 cx=c_pps
 a=IGlUesXJXvI2YQKUC5af4g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=mDV3o1hIAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=7CQSdrXTAAAA:8 a=iGHA9ds3AAAA:8
 a=ra-KeGRoOAgXHpiHVwoA:9 a=lQi56Kx33krzEgpJ:21 a=FdTzh2GWekK77mhwV6Dw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: peKBCsT3w8HTcWM7b-ZnWks-JZMbysTb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA2MSBTYWx0ZWRfX+GKIvOgS/tm/
 QZHiX6shw1ehoqg++LRiKHR7//XZw6TdJrkHo8VlurXSJyEMZ0NDmdraKQeETLQ+D1YdYAl30om
 R/nSaZINWM45HXZ/FsuW+R9tHHZtEn/u3ackD/bZB8fuw+JWNBQDMQwIgZqkNQyTdgL7mom9pLg
 ONEfN5Izu39HzhCR0JmpU11fW8lm93Cf1BlKrpUZ+RITFSJG6FznagjehTwtpoHAwCXXj4N4RTv
 ZvwoxB2JvHpBVMB/wJxyoij7xswDpFXAfQXpFHwiRxpCpOsHpmpuB7z0Cu64oWyCL8cDTZQSPl1
 JOehOICrLScZ9KzPTQci0ZD/I1B2t95NP5dVfRdCSEv/uAEmCKVVHoqDr3PdhBXq7x9qsi1y7Mo
 +kzwFl6l1jb8urAKAhsjdl+MFqDSeOJel43pLU9SYyWtHwxKOqe+VFgH80gAHWwhMyUyz+Mwvll
 F1HEsrA/20YCPaNTZzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 06:53:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238979

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


