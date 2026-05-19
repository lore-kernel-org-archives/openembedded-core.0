Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC31FCD4851
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 05:27:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14998.1779168454685608881
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 22:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GZ4QPqOk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=959934a5a1=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5F3mR3001337
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 05:27:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=xF3jw+eBjcXzvq9vyKC6
	Tkw0WMsIoEVFxcHYo9e/zag=; b=GZ4QPqOkVBYe5xQKVVcJPH9GjKyyrMyQF13s
	PM1cMpS6dZ9AqkFdOtKtCJNGMhH5BhsAKT0RRI9vjEdVTup5w6RpI5VeHJDh7gEr
	AXN49CkNNbTk8hZ5KvZb+S7Cu5tnYX16OXHlwS6LEp/PousS08HkQq3VPBEfiUYZ
	j+ZMyx8nztNtK1tYkyLLpvOhonLeITocVEDI8CwcCtV9/qCxWj/2jCkJCemXiBiR
	hJgw9heMOb6l3ySR7h/ovYyh2gsGdXr7ysLzsrAFMLQJduYvBIm8qlhDUOuJJdnj
	dLxhJiCT392Zwalu1BY0J8ZX7gejKWcofdTXgx5/uff2d6nbOg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012061.outbound.protection.outlook.com [40.107.200.61])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6fj3u2r2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 05:27:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=odOiIxouEAXqoMyU9ZoEmvGup7uHiq17dY3ziJMepfkAQyXpbil2SJ38wzu5uZ2GPPFlkG2mPpjIrpDx1KXzNPTDrsjDq8FjAcgNI/oX1uPuJDbo31j2HDkFAGreDTSbwFx1PBjj8UQ7xe2cLMsYjxQ/6BoxKQeqrlbufCdkxYd1FMYb/87iL7L0qoC+zn1G5VcoaR5TR4E4sBBWEkvBGZg/e3hs/N/dQX4tXNhuM/3Xq3+P+cmWox4miXLTPoL/vJWQ6mHJhDmlJsLLw8uSnLO/2StW+Hxe4Q6H1bLeBvBI45SyHcMw/MoSz1t/hAZA4FB/spivT/621ZrfLsgG9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xF3jw+eBjcXzvq9vyKC6Tkw0WMsIoEVFxcHYo9e/zag=;
 b=Z2IFdPAREiTo8BsPoqStiY/iBHH9uMQtfoL6RcxlM7nJc0o+MeebhvRG+Sbg8AOywpgBbpCt5PKOUDoILAzpLnQPiEveeblyQmRP1J9ZjjU8ATc1fcpl3vD3v2nhZgg96gzmI4wgRAQw96HSKY9hQbTNLUaT21Kv5vlQ6FtvyXIZByU91pzH1bV/eqHxobhn0N80ksoQV4KMCZAKo6OyaziIojJ2b1s3zOImQNO9TF1sAlRaQfsV1uP98aLa+ekv7Yjc23qIfqhm1dB30hrYckBwyfMadELqog+PKu1wKdXyD29DG9wyILA9Z0LaJOeOwc7EAU6N0m9OtP4EYHsvMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by DS7PR11MB6221.namprd11.prod.outlook.com (2603:10b6:8:9a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 05:27:29 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::ecf9:dbb:16bf:5b2d]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::ecf9:dbb:16bf:5b2d%4]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 05:27:29 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 1/2] busybox: patch CVE-2024-58251
Date: Tue, 19 May 2026 13:27:10 +0800
Message-Id: <20260519052711.3732145-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0148.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::28) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|DS7PR11MB6221:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ce3ab76-e7be-450b-8c9f-08deb56751d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|18002099003|12006099003|56012099003|38350700014|11063799003;
X-Microsoft-Antispam-Message-Info: 
	//1AMDJNxfwfI+rfC0SqfXZyVXyYz2dYSNKw7/BR1rLv+lJ7ILNWznxBs9wlD+AbMCkayQeOul3jFQ1jizcTmrHqvh9KrzRW8BfF3UaLVWMvXsyJQv/I4hzqy3XiSleZumk3uyPyQf+gfPeM7f2H4ZKCStz5y8jAM5r1dwr1zqeOvhbOvrQoWuP7vKUjM+1RpqJRZC4NlLRJaArujQp27H9QWhMGQh9fgAbwghKPlYyX6rsmuViLrTeSoB63llp/bc9eYvOVuTKyqeiyfCdUqw2wlO0gkTaXlRHklc/GlGWDY49LLn7Umhb1e+diwIc879whhe1g7pB2cdATg+irEWCAoxzqnPhFSO+C/B7rWWxngeui6E9XRnPvQ7iCrPCICXhkBWlVr92k8rxFdY81T9C9RWtw1P5Be+hgdrnzniN54n0mk0qyHzmjXuuMm4W5rRIcosejhDaEQgGxnZTa71eLONoKhDJ6ue1RH7lRhtgkOcqN2M7zMFRD+8k4jwH2mHgEDpO1dJqMWayWIhCpB5mmQcNDrWtk7lOyame0TALpXJ58wgMgLbj5kf8iakP+G2rsdCWRwOWRf+LeFn1LoJf7rc1gIAfYEYt6kHxWlELXTlHIaKdZUpLF623C5Sh25Mpp8RT/VdGAPL6WRtlg2cnSOCeP0+JDe+qRtevRiW/YK9Rgk4zCQ6J619FwuNPUv6z6YR9AYmr4g1Jl1DCpXw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(18002099003)(12006099003)(56012099003)(38350700014)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fNG356vLgoTcAfZVkotFPy2gmYPYW3QCO/U3iZmC79lyLS4Db81QNmPD2PnZ?=
 =?us-ascii?Q?ik4+bbYW539WhTLFEzDIMx2AJcq2lcCXexLusuvrIEuz3hNVySMI1+LU1mmf?=
 =?us-ascii?Q?XcWDPREyOK/TmGp8FqSqv+/wAEFz/Tzso1x5aFK5vbxPxVzh/qqxpemTgWaB?=
 =?us-ascii?Q?21MgHcey3jgBdPGOr8F8hX/VX2VKGHT7Q/xsfuwNKxyFKxHnWLvOqpYAhnQn?=
 =?us-ascii?Q?XdBnmvEmuFYsS8IzQ98pMQb36gH5lBEBaYTrtS/AuOULefLeFxfj4dZr1g4X?=
 =?us-ascii?Q?3Ezx3Q0qQd8IrA/ELODnjEutAyQP4BhcahvPWWabHY99ApY3ZK0T24BwghoD?=
 =?us-ascii?Q?zmrbqcODTgYxBPyqWvkjU5KD/ZTduq0m8eYxuYqNOuFQXTwmHI03lrM9EN+b?=
 =?us-ascii?Q?KFz9mILMzez6w8yb9JMG92F91xbB4oI15Hxlcrgs1dX0dyBO7gI22i5dgY7o?=
 =?us-ascii?Q?XS+6GtHPpPqI1o7mAKW/9Qos9t+O8aAMHGMbz0CJQrK6evXhRvy/pjG0tl/1?=
 =?us-ascii?Q?nrHDoSBy62P4aiEWjbfdNpo5sQtzUiYe8MvAc791T8dfyj0NIW36QFqX/uhe?=
 =?us-ascii?Q?iwGiJhYH6xMtGoaQciLqjhnBRzohVrKg5BhZWfENVT2cdq1BAH5KP0zI8SAW?=
 =?us-ascii?Q?/vCbQgRiTZDBDaqSTAhBu0yz+l+7CQ6NMQmZr9n93exxC1CXKJ4YDzBoHaJN?=
 =?us-ascii?Q?qkfzJXpjj3cTlXYqQzOodOm/xAbn/7S0WiuD5NcADdeWD2C1nfIfxskS35Eo?=
 =?us-ascii?Q?CFCFNlad2UzKIffj/ZGhJyB/BpY5P2pQ+x70AxRnbXUZ8cNft6YoswZct1lm?=
 =?us-ascii?Q?bNEs0lS2VX4mj7VKfLgBFQGcuNIM4iNMsXfml5DGvolzeoAs0f1IUczpYDut?=
 =?us-ascii?Q?XDD67NlJmLhNNdqNJk6DgxNMOAGm2E3GYz2h5ml+lrvvyJyCg8w1rgbcXSnq?=
 =?us-ascii?Q?AJQWFBiALbTln2VV68WJKM4UQrCoUdO7xrmRh+CdSrOHFWUt/y9uAE5Fa5JD?=
 =?us-ascii?Q?85/y3asSc9cz1xhVqo1KdISKIpVJ4tsOJsip2JzFTg+FOSv/ufSTd5SffgTm?=
 =?us-ascii?Q?tGQhQc0sn6rQFjSs5K6SxiG3g1xWCHhkGrThyfn79U8NyDfxa8R6241CwfKW?=
 =?us-ascii?Q?2pHjVV+JE9hiZYWXF4sFjT3sBML+S6A8XXHj5d90wy1SbngJJ3GjgTsDqePQ?=
 =?us-ascii?Q?Mnw+Gotm2IDWx0mTwmhB90QU0GBvRif+Js3yWPUCv1eDQr0BsGAHj3RuvrAj?=
 =?us-ascii?Q?Ro3qPmzgO5ZhTSyFSeelgpIzzHyItI3tIm3iY5L0PrrvUKd0B56dT6hNbk4d?=
 =?us-ascii?Q?wjDtDtUD9lUfr+uQzHbzvDp9T5oYfx56y8pkaEVt6gQkoybpNIYCp3ec6ECc?=
 =?us-ascii?Q?ApuHcn1GS5UvogS1UAb7ZAO2fOvWrbusv8fLlZ3RsoEX3PjmBhHzkFKnz8Zm?=
 =?us-ascii?Q?lnGKHRigehF0aZhLjXnMOQZBjYBAUOHaOMDc4ohYs4Xg0v98DXnaHR9KsJjI?=
 =?us-ascii?Q?eNYEZt9nm79IBrqBhAZ6mSWYBJ7NM9/rVnAszcAo7cKWakWje64ZYlLYj8OJ?=
 =?us-ascii?Q?KQ1AIJ6dJJg6FSTgk5842Zw6BHxe1afbb4rkcaDrYakfvnVpTUxJdf/Kb7DO?=
 =?us-ascii?Q?yrWg3g0DeHSBnsjPmK3EOZMKX0yBhUbo9Fzc1tiUCysYYgSALKtokGyriXsH?=
 =?us-ascii?Q?kVZtswG34204CODii2pOl0/wQSeyD3DDdAAPIsiafAItBCvOuWBB7WhXGCdz?=
 =?us-ascii?Q?ZQLqrVpdGQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	CKvo2bMBPeBrsKy3pR3TzSSyskfdvx2TKFvoRZoVochtxA49iv4dp11fSFtzyMpFxCr3rcVNF/4fFApbuyIbDaimlvbUg8S0zEfTzAKaXjfngvweKKqCott9DbCKGnMqCfn+Fct3Sx1oKP80NnIDJ6mld5yhAWqzMAbXO5sNrXCmCt0jmCIsRSrD82cEOakHO2/Di9TmXriV+axm9QRgYIbhK7rHzTQm5xiQkmqlfUKzuGx0BY3TBmEPCJgfck1KcLPB/uHFKdfRhKZ6hLz/v6l07REPxgzrcMIGKOh4fWO9NfAevZRjz8sSjYPBZje6SNHkbyWEM6WFjKSU590qjg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ce3ab76-e7be-450b-8c9f-08deb56751d6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 05:27:29.8103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vQ2ry3d1IqzM3r7egESJtrmKwelTfdZoYP68HRJHoCnIOclK6qZnlqdFrgJiiscCTfPz3uY1wRMmzGhSn7tRfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6221
X-Proofpoint-GUID: Rn4yu2EsBf8mbYpoPQmiYMRkpQNSS1j5
X-Proofpoint-ORIG-GUID: Rn4yu2EsBf8mbYpoPQmiYMRkpQNSS1j5
X-Authority-Analysis: v=2.4 cv=VssTxe2n c=1 sm=1 tr=0 ts=6a0bf4c5 cx=c_pps
 a=1c0oZQ8MA7sDNsoFSDv1iA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=xNf9USuDAAAA:8
 a=J0Tn2xNtAAAA:8 a=a_U1oVfrAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8
 a=t7CeM3EgAAAA:8 a=UtDZGfokAAAA:8 a=dKVQ0sCP9X7gk74gKzIA:9
 a=9ZcRxastL33iXWX1AWsW:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=shj_gVHNfNN_m5d21_1l:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA1MCBTYWx0ZWRfXwwoj9wJUxR3s
 n/fT45ZhHGacr0NqD81m6pI3ODNI/dTwT9TySsDghwTuVao/+mOvdsDWa9FBsY3HTDMO/so83bv
 Kdha17VZwEyWZc52+UZhikJs6cRDaMe8B01IJhUYSUy3etSDFkFdLObs1Yu7bgVc/AbqD8oByHK
 D4Y1iSTHKWm9p/+4zjSngIM7XhqWBWZENJugOggKVQx4klPGOUnWydCQByV+Z9W4JtP6NVtFx9A
 zhTO0b0aWF7hVwQqxmlohElA97GMFR1Xdr23N6xt984ZteI1lW6mPJVSzbUSFCHfMXB5YvLFMPq
 wejhLz7OJp9Ng7oG7i1qARf0f8qPSh3Bao9qKsffw5gxneO9+vELIulCW9IHSwRjR0jwtITdpXr
 nm3OJuo9LgWH8anhDPdCxlhZvWTWzkM1Q3iP63ikjbq+V4JQlzZ05wUMYQ01OKdig+MecI9IIdm
 LmFuEdoEDzTC4AiRvKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 05:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237267

From: Peter Marko <peter.marko@siemens.com>

Pick patch applied by Debian [1].

I did not find any reference on busybox mailing list that this patch was
submitted. Submitting patch for someone else would be inappropriate,
and busybox is currently known to be very inactive, hence the unwanted
Pending Upstream-Status status.
Also note that the related busybox bugreport [2] is currently not
public, so it is possible that it was submitted there.

[1] https://sources.debian.org/patches/busybox/1:1.37.0-10.1/netstat-sanitize-argv0-for-p-CVE-2024-58251.patch/
[2] https://bugs.busybox.net/show_bug.cgi?id=15922

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../busybox/busybox/CVE-2024-58251.patch      | 51 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.37.0.bb   |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2024-58251.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2024-58251.patch b/meta/recipes-core/busybox/busybox/CVE-2024-58251.patch
new file mode 100644
index 0000000000..713d345ca8
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2024-58251.patch
@@ -0,0 +1,51 @@
+From: Valery Ushakov <valery.ushakov@bell-sw.com>
+Date: Thu, 21 Aug 2025 12:31:53 +0000
+Subject: netstat: CVE-2024-58251 - sanitize argv0 for -p
+Bug-Debian: https://bugs.debian.org/1104009
+
+Signed-off-by: Valery Ushakov <valery.ushakov@bell-sw.com>
+
+CVE: CVE-2024-58251
+Upstream-Status: Pending
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ networking/netstat.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/networking/netstat.c b/networking/netstat.c
+index 807800a62..d979f6079 100644
+--- a/networking/netstat.c
++++ b/networking/netstat.c
+@@ -41,6 +41,7 @@
+ 
+ #include "libbb.h"
+ #include "inet_common.h"
++#include "unicode.h"
+ 
+ //usage:#define netstat_trivial_usage
+ //usage:       "[-"IF_ROUTE("r")"al] [-tuwx] [-en"IF_FEATURE_NETSTAT_WIDE("W")IF_FEATURE_NETSTAT_PRG("p")"]"
+@@ -314,9 +315,12 @@ static int FAST_FUNC dir_act(struct recursive_state *state,
+ 		return FALSE;
+ 	cmdline_buf[n] = '\0';
+ 
++	/* don't write process-controlled argv[0] to the user's terminal as-is */
++	const char *argv0base = printable_string(bb_basename(cmdline_buf));
++
+ 	/* go through all files in /proc/PID/fd and check whether they are sockets */
+ 	strcpy(proc_pid_fname + len - (sizeof("cmdline")-1), "fd");
+-	pid_slash_progname = concat_path_file(pid, bb_basename(cmdline_buf)); /* "PID/argv0" */
++	pid_slash_progname = concat_path_file(pid, argv0base); /* "PID/argv0" */
+ 	n = recursive_action(proc_pid_fname,
+ 			ACTION_RECURSE | ACTION_QUIET,
+ 			add_to_prg_cache_if_socket,
+@@ -686,6 +690,7 @@ int netstat_main(int argc UNUSED_PARAM, char **argv)
+ 	unsigned opt;
+ 
+ 	INIT_G();
++	init_unicode();
+ 
+ 	/* Option string must match NETSTAT_xxx constants */
+ 	opt = getopt32(argv, NETSTAT_OPTS);
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/busybox/busybox_1.37.0.bb b/meta/recipes-core/busybox/busybox_1.37.0.bb
index 61ff602be6..4790899684 100644
--- a/meta/recipes-core/busybox/busybox_1.37.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.37.0.bb
@@ -63,6 +63,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-busybox-fix-printf-ptest-failure-with-glibc-2.43.patch \
            file://0001-tar-strip-unsafe-hardlink-components-GNU-tar-does-th.patch \
            file://0002-tar-only-strip-unsafe-components-from-hardlinks-not-.patch \
+           file://CVE-2024-58251.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg"
 SRC_URI:append:x86-64 = " file://sha_accel.cfg"
-- 
2.34.1


