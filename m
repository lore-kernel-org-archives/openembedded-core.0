Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E55EEC2B7
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 01:43:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10994.1771897419743527161
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 17:43:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Bd59hJkd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6515bcc28d=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O0b8xv2493463
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 01:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=eUZ1kOiabDHSP8c2aA0P
	B12WiRhJW4QLsXx20BNiMNE=; b=Bd59hJkdLjqk4LpA78sZD0/Mt6byvpmCkOVM
	T49k6j0oNZZ0H/npjBJ6ZKEpruTLh5hNSVgoSITE2vhyDUMQ+S267el/Y+6PuQ6i
	E5FURPlXijCEV/g9JrTbbqKJw0HjVcJcI6T43Ay/5phs6I9EnzMwP3hJKzj6+WP7
	mQ8sEpyV6C7BDktD5nYyd3nWoNHi2FkZhbAeNtmrvWmQNFPV3jXVkr6XkynTqXE+
	YHXQt3zn1T97rNHu8cEU3x+Bb/mq5RrRgIWsoWqQyd/MjZTwKw11hxifevsFMyR+
	k++SngXftv4agKpKixHF1wsEQYpuN8MWT9hbjSURNJRqP7eoLQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013007.outbound.protection.outlook.com [40.93.201.7])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cf1wvanv7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 01:43:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wkjc/iRQ3BAZR9PQsL5kbqMoO00go7v5eR07sL24By3ykQur2MSclmggl/W9oNeipHDEv/BASbkbnkL1J06dC/HgBs2Sb6mmAOV445vAQElsO41Ic3Nn7LK9kW2x+XfkvtIGDFXaNtXp5c8kj4yifi7+BHOgSHGutgq2usbyH5sjEIfHZYrb8SPXYzHSraPQ/Y/afVHzB+glZqlbG0VQmoAObVKKY/zH86ng2uD213ixZwImk8njeekswHH5rwKpa50eMUttRB32SBZ6jZVgAKFiX/l3Op82fIo/rVyIe9vjVdwk+xb5nElB0ro6kNAIfKIwcN3uyCzruo14yWwatg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUZ1kOiabDHSP8c2aA0PB12WiRhJW4QLsXx20BNiMNE=;
 b=IetkDEVFrTZbavy7lQv48XgpZivsTIFZ00XCjH1tPc5gJ376ozt9y4kH1Wi6TSN3CMEaVL93AmqkBPAiIBbjO8E8mwvSenWfV72pk0S12cz96/6n7z5bfRssPhZkdz5faPaWeh2ZNhrs51GeHg+2vAxbTDQ3SbJJGxZFs09WOetCYaD5c39F2/gfRpsYIxKhwVJ8iQUOjKya6DDn44JqkcMtX8hCMKhsbxmAoHfLOUvNiz6QqxUJsM8EDyCN9uS1nO8HRvK9tek8AhqP1yjKeygtCUTgJ4O8HHuZYyML+oFudGWPvw1+h2SGLitSG3ZldXpf+TCzXYwOgQfX7RGLlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH0PR11MB7616.namprd11.prod.outlook.com (2603:10b6:510:26d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 01:43:36 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 01:43:36 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lua: upgrade from 5.4.8 to 5.5.0
Date: Tue, 24 Feb 2026 09:43:23 +0800
Message-Id: <20260224014323.3329431-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0154.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::19) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH0PR11MB7616:EE_
X-MS-Office365-Filtering-Correlation-Id: 41579f2b-d18e-4171-9e26-08de73462076
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zaQ+PX/F0RmLQsZaDafKV4iAPLnfjBsyNvGpvvRTEifif//FyamBIEMK6Jt7?=
 =?us-ascii?Q?DdL9IcZjXAX0D34BDeB6rsK8zM4JHQMhpWek0LehOpjxWui7dezptJ5jLG2d?=
 =?us-ascii?Q?JCy0Nq5M6Xiurqoo/mF866UoJVXJyr4SO0hYkyW9xwrhTV9DnOU/gDPWlbD/?=
 =?us-ascii?Q?pexhLgFyJbNTncui6BgNOk1FnVdKivHMKYV/+8JSXlWRuUTFVUgmfXybcHKw?=
 =?us-ascii?Q?mwiGxxSug7iqe6pj/1q//id1SzWUE5QEWNS6aItFtrJM/7AAUmPb+W+DZiQr?=
 =?us-ascii?Q?ot9cTGvUdTVhsyCaGzgGqQ5VL6V6/lCogLtdD+cQD7yTlDQ9ITjob3kVch7o?=
 =?us-ascii?Q?rQQdMxsReDfp6+sAR48tEkB6M0LKG6pnmCcixKSY7vt5QOyZ92PsXkkIVKlH?=
 =?us-ascii?Q?d24XYBMEjShDVf0RdKfyB+KK6njcI05pC6hjB3PoxfydkxKGfHAI43L5xPVm?=
 =?us-ascii?Q?VrfIVUUGUVM5/ds5MacMLvqGrG7hdDvhyMYzeVaWk5on3GvZ/pj/zU0siLyb?=
 =?us-ascii?Q?2ck0x+KRZpY3OEvrd3ksf7mLZ519OpnROeLTPGsVtGX9dbd+AE9xXIXT4ZMN?=
 =?us-ascii?Q?KzGDT/u7y+0dNif8yaO5rhaBciu2cKnkqzWpMrl89tjybhJo1+6jCij4rhxM?=
 =?us-ascii?Q?PkNrOYakvJHT9sQyGkeyGRYRvXYG8LoLnhLUTAE6Wqx/KxqQudnaQJp50yCz?=
 =?us-ascii?Q?3TZpA2Av0PmCmnZzy6K2Mt/CytQh0DefMMvbznKzeNk2dQNO11PLM+437+OJ?=
 =?us-ascii?Q?s6pMHE6ievlavLVA0ngLaOm17tHeNr3V2c6ejElE5tR9rbttgjw1y/d+t0AO?=
 =?us-ascii?Q?nZL5o0Bj9AmSjdVT+o9Jva+esAvti5nDHfzAeJRUOEqhS4YH83WGyYMdzJG+?=
 =?us-ascii?Q?MXD0bx0A69raM1j6n6k5FVid0GTciZtWNOHnxwvFtRNcVR+aF3SLwMYzjGJ9?=
 =?us-ascii?Q?364Um1CcOwXCJmoEfg0wKZe1hszAusXJ9iCvFUsPhuJmfuMMSUmnWlad8d0s?=
 =?us-ascii?Q?fyqVZqo0aBYwZEDTIrirAPXVpqeIjGpDoh17dR7+2m43mUjoSwRoXbFeKxlf?=
 =?us-ascii?Q?hlG9QK5fvoiMLs14lam7lpz2exU1OrQHjE1pm6f7L7a4tB0pE2A9YOd3tU+G?=
 =?us-ascii?Q?0sfX6kgLjYBvV2Xlj1KRx4OfhtWopxYbNGil4Ag9MS4R6mkWIfU+JS3Vmq2p?=
 =?us-ascii?Q?ABDUPbw2bjbzQvbP1zVCIfZMCzC4+UODk3sEBP9pcMuyRRS9kgV8y3u8PC/c?=
 =?us-ascii?Q?xJRErTyoNpC+c2zYe2+bOdaGSCVZ0hd4+UKEEGqYmf6gtwgWuxo7TN0M7mPu?=
 =?us-ascii?Q?gEvSyV3ScfdSFATcLOhRxXNkn2NwT7Pj4tjoSYhwAsKTJ6Dd6eF5fmc+ZPiG?=
 =?us-ascii?Q?ETctmMCfq7y4atws5qoOPsuA44hMa/M2n0Nj/yaVvuW52Uw6JXIozusff/xC?=
 =?us-ascii?Q?8hzqLsFIdeBAVuMFceKXj1/zGq4on75MsEHjj3E4uRHWn+v8fBT7fRd/xbqi?=
 =?us-ascii?Q?NEckT8k/8wcioJCitcdu8r/UX0GHZWz1j1XKnr86V7DP4maWe1/5gUpoKjmC?=
 =?us-ascii?Q?46ZjmZzI/Vo4kKm9pzI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?l9LWrEY0GPQpvmf5OeSVCzgrNRTf0urhvCtxVvUQTeupEKUipQ8Sse+08NW7?=
 =?us-ascii?Q?1T+WHfqOT/fiMqz0TSdvhcOVHJj3KRdr9eQQpsmX9ASGGz+WhZzLV7PJwVCp?=
 =?us-ascii?Q?KAN8qPVevG8ONlpKvGGFKaHXHyCVuMrHj7Bzu+6hLc36X5O4KKHQtoDlRsFe?=
 =?us-ascii?Q?PndnE5qttUxELEHnafrP/IsjUFV8Hfvi1Muwl883LotSPGWYwi7GrPtdwkJT?=
 =?us-ascii?Q?zO18VjLbazCJkp95m5Mf7ftKfJOMdCdcESsjt4FUtZR/EV3LDsoxMsf7eZfB?=
 =?us-ascii?Q?jbYKPHvXcYRBh64BbsmVMwfX7gxwDCqFAsMtOxzxbjpIQLjxUxXo1n/5ojoc?=
 =?us-ascii?Q?fm3kScvCITv7S3SHlOAHltUzqggFRXqgj/rb58trvY5a9hepD7d7TTNNYQSY?=
 =?us-ascii?Q?jjBEvyA8VlCyo9F2Nxu4afFPjhkfR/ZVU2eoUWvzOXRQR2TWAK7nbiMmvat7?=
 =?us-ascii?Q?CRuZVQ2mlv6oidtH3BBZb8CTQuKn8Z6LdYa8Brg939Fzm0ocaDgijNflZZi5?=
 =?us-ascii?Q?vzCmQHqJGSPi8sfa6dSteeu5HvFIgw52jewaubz7A7krI6TMFnhsLkRD+RBJ?=
 =?us-ascii?Q?ZW4BoD2X0WnRcUDSD9BrvGscM2M3QUb867+n8jJmOANevp4CXewtAa6652nY?=
 =?us-ascii?Q?OTBMZH/Q3g88wU1fXEJSpx20EZxVy7q8oW9NBBXj7Isnwxb2IrmAVv7SvLRd?=
 =?us-ascii?Q?3Eg0beMyGBwyDs4wwbQxN0MYQPZPagoI/A011lazSekExMZwZ0Y/K4DQZLUh?=
 =?us-ascii?Q?CH6Yt44veqnb9pgqxmjiG19qLffb3elva0aq+7WVuVtKcSwcgGHU2NmoSkn5?=
 =?us-ascii?Q?rLbseCPbJSQfGE/FZJpGmgsHMa2UYf0ZvRLvMolA7xDXLRmqowCBr5fGSb5X?=
 =?us-ascii?Q?nkRDoHWGTjx0/t8ZYSMzajSpNlXnvj78etWkIbGqiATrify5P3BASf2q2m3a?=
 =?us-ascii?Q?ofKFpueY2459VakUbDXwcUoBTzfAFwz3tfzUpF4Wtd29n0tSfeOK8XBD7nyu?=
 =?us-ascii?Q?0sb4dNIKUhlXuvdHTAnM+WC90u3wKjgr9vZRBdur0DdTp0PviUwHhMZHNEea?=
 =?us-ascii?Q?oSmF5/7AxeUdeWmg3TjpbngjOxecVA41oWVgbjwFhqKHMXZ8XM4f2sU0z2AE?=
 =?us-ascii?Q?XtDBjA4kFowJ9BIwp7qt3kbSzYLzA0m8gma74aXr++TNCigdfiPR48cBy+8F?=
 =?us-ascii?Q?8cQvVt8H9/aSJhRamVOtcipC2GA6oEHPgzLiHRXIq+NMCAFx6Vwfyy3HA+vy?=
 =?us-ascii?Q?z5WhkXmtVizGv0KcQW7Czj/MBQylep3ub4kVPMhwrLIvra5Vsq8WBl7HDxZU?=
 =?us-ascii?Q?ABG/HYuMrbnaTHOf2/mE+aGRPy9VRj3/GNdijZVvw/DhFt4s91xfz+fTzSVj?=
 =?us-ascii?Q?VOioEXbZSq6PLqleYauQJihoO3Pcpnd/1qlksOGjX1Sj6rwvVIOJsaqrB8e2?=
 =?us-ascii?Q?GgOp4Ps82+GeZN95Vhq812Ub1yPZzInYDAmZFW55oCBPoCZ+Zpd7EdQ5z4o/?=
 =?us-ascii?Q?z9gCerPPCyAwW00gRTAAAmaNzXubiVpgje4+qNEFG0I+Az4kIidRqS7wTXSX?=
 =?us-ascii?Q?ebC4hBkzcaCrhTgxKcAVm+uFoH+xBgsBbcI5vQYD5b4CAANuBOSfNv16WQqt?=
 =?us-ascii?Q?fcQ0ys1NpZhfkuOg0o1j49Rh6xobefTTq9TFdN+e8ELJdqbS1Z3xxb6WtGAB?=
 =?us-ascii?Q?i1YaZCMFRyvRcwJbnzCI1xxed7nYW4aE9hCajcsUPWJ0cLjlbGT+j+MwEO5N?=
 =?us-ascii?Q?lABDGJIbldlG8A/R6mcg1X9CH0dy31c=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41579f2b-d18e-4171-9e26-08de73462076
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 01:43:36.4314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uJd1EQIHt6Xw1ULJ/HO+UdIpf5ks2HaPlaHvwOoA5wgMmeHC9+R0/cXxLUow1gNtY2TPFBsHsq5qZL/zInN9qH+0J0MFZTvniPg/U/U16Ik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7616
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAxMyBTYWx0ZWRfXwyBNZ41wb34S
 KvUVx2DeMl6D2IgKpFoLGfUwpMv3PLiryVeeSzAx0TpoXxlR6Oi/6kxaJSiRrfaG4kgpeUGsYJi
 ot37Lm3nSVWjr0M/5pXpNPEs/KfLqNEt+JyT1fGx+KDWTviM0SG9p/2BXb/laHs5VzSMakkF2W4
 HDi68Hs6ozmJR9EY/H3Nn8ggf7RjDBTfv81NP1uFgeyQOPEg2PWhiK5RPL9lLo6PH75brD0E9FB
 FMCH4xdBHD7GsnWAY4bXj4IDD/dnGJfzHDCvF5KmpE2ivW18uCL5yTv3Z2S1JDBX5/EJQ7oV1w6
 Nx5v1D7227qCdfxK/KH4wHbWnZX9mhxoHRZxZwFfiXzQ2plNN4b/dz6upbjKMlhRmjxPHq9+Q6G
 cCLzSdAKlwl+gAFFBRDwXTkDSlHNm4bQDm7P9eC9Ehs/3VCipWpBJcwQjnAUjmTzxz0T+potj0y
 rb4Wt2BqGhHAXAbB46Q==
X-Proofpoint-GUID: cjAUOdM17fmG-5RFJlopkaX9zTeK_Oj9
X-Proofpoint-ORIG-GUID: cjAUOdM17fmG-5RFJlopkaX9zTeK_Oj9
X-Authority-Analysis: v=2.4 cv=F+hat6hN c=1 sm=1 tr=0 ts=699d024a cx=c_pps
 a=PxTiP5NnQLoflLcDylFrfg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=z_5uEx5cAAAA:8
 a=t7CeM3EgAAAA:8 a=iG99krfCKTvf1Ipm-4gA:9 a=JtrFjcrP6MhGCbC1Nd-z:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 01:43:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231722

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../lua/{lua_5.4.8.bb => lua_5.5.0.bb}            | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/lua/{lua_5.4.8.bb => lua_5.5.0.bb} (78%)

diff --git a/meta/recipes-devtools/lua/lua_5.4.8.bb b/meta/recipes-devtools/lua/lua_5.5.0.bb
similarity index 78%
rename from meta/recipes-devtools/lua/lua_5.4.8.bb
rename to meta/recipes-devtools/lua/lua_5.5.0.bb
index 1d37cddeb8..cbca0dc63c 100644
--- a/meta/recipes-devtools/lua/lua_5.4.8.bb
+++ b/meta/recipes-devtools/lua/lua_5.5.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Lua is a powerful light-weight programming language designed \
 for extending applications."
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=305;endline=326;md5=0e573c143cb6491b41cf02cfbcb8c267"
+LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=299;endline=320;md5=0e573c143cb6491b41cf02cfbcb8c267"
 HOMEPAGE = "http://www.lua.org/"
 
 SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
@@ -12,13 +12,12 @@ SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
 # if no test suite matches PV release of Lua exactly, download the suite for the closest Lua release.
 PV_testsuites = "${PV}"
 
-SRC_URI[tarballsrc.sha256sum] = "4f18ddae154e793e46eeab727c59ef1c0c0c2b744e7b94219710d76f530629ae"
-SRC_URI[tarballtest.sha256sum] = "9581d5a7c39ffbf29b8ccde2709083c380f7bbddbd968dcb15712d2f2e33f4e5"
+SRC_URI[tarballsrc.sha256sum] = "57ccc32bbbd005cab75bcc52444052535af691789dba2b9016d5c50640d68b3d"
+SRC_URI[tarballtest.sha256sum] = "5e47bbfad7db2965d69580e918ee64edeb8d8d32de404b8dae9ce5c6d76a1472"
 
 inherit pkgconfig binconfig ptest
 
-PACKAGECONFIG ??= "readline"
-PACKAGECONFIG[readline] = ",,readline"
+DEPENDS = "readline"
 
 TARGET_CC_ARCH += " -fPIC ${LDFLAGS}"
 EXTRA_OEMAKE = "'CC=${CC} -fPIC' 'MYCFLAGS=${CFLAGS} -fPIC' MYLDFLAGS='${LDFLAGS}' 'AR=ar rcD' 'RANLIB=ranlib -D'"
@@ -29,7 +28,7 @@ do_configure:prepend() {
 }
 
 do_compile () {
-    oe_runmake ${@bb.utils.contains('PACKAGECONFIG', 'readline', 'linux-readline', 'linux', d)}
+    oe_runmake linux
 }
 
 do_install () {
@@ -40,13 +39,13 @@ do_install () {
         'INSTALL_MAN=${D}${mandir}/man1' \
         'INSTALL_SHARE=${D}${datadir}/lua' \
         'INSTALL_LIB=${D}${libdir}' \
-        'INSTALL_CMOD=${D}${libdir}/lua/5.4' \
+        'INSTALL_CMOD=${D}${libdir}/lua/5.5' \
         install
     install -d ${D}${libdir}/pkgconfig
 
     sed -e s/@VERSION@/${PV}/ -e s#@LIBDIR@#${libdir}# -e s#@INCLUDEDIR@#${includedir}# ${UNPACKDIR}/lua.pc.in > ${S}/lua.pc
     install -m 0644 ${S}/lua.pc ${D}${libdir}/pkgconfig/
-    rmdir ${D}${datadir}/lua/5.4
+    rmdir ${D}${datadir}/lua/5.5
     rmdir ${D}${datadir}/lua
 }
 
-- 
2.34.1


