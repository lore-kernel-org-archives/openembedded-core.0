Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A674C106FD9E
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 16:00:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19280.1773417600138031375
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 09:00:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=POw6lnhH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75322bb784=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DAudrp2320885
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 15:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=mwjScj2EK+/RakRhzOEpDwEq3zm8izOsaHcpxQ21qp0=; b=
	POw6lnhHbTe6wr52SxtXqD8i8X062hK6JBxFsplCFivhK7TpFDwWBLbJ1NYWNFkB
	lGS++icmHwzBNoPMQOcBOPXDVpB5K+D0yiGBOBIUI/VaAXHbmFer+PYlemWfjE7O
	OhyRRWgf54Q2jqKOdPJW3yVWe1f9PR8NlAIkfkLI7COEVDxIwB/EHA4tH4IOCTp9
	BIn3CbtdMl7i8mtz/ETdbfRZUvtHRg0bK8ZwMyl4WfZxYuf6q5h1KQwTJpF0Yym+
	d7/6Zcx17Kx5KZQYwFncIZZIhbyyJVqn/RB7p3UuLXa2cXUYq+/6z4sYWTkmcN7i
	dLQVaCmS6lFhUxpWLSBxgw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012065.outbound.protection.outlook.com [52.101.43.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh78jbbx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 15:59:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nisfuPvA9UypiCUWXsPRrbSxefF5uoxRSoDQDNiCsJUWplMsUgK/bmY4dZGe1spLWJR3EkCiMV5+UaW+8IhAC2gl0m8RSh5SsWsVcdWrTxzJhrWmgbQ+5CFpWwj6jR8sIgtSdpykidKycCaym6hwM1vYUvOMfQPoEJgrPc2c51PNATY9GN7lWXeXAykmwDTWAT1Z0vvNA44FHSMmdIHzF2XhsCg7dWKKRn4kllNlnxf2paQaGHB81YlEfbDsWl0hUmuGWUkqlcsfB7JpIVvLD/xmq0hUkU3uyKn2qhpVok+AbhWb1C0xYmPNSowvq42NfFhZ38PHsSkcItz9EBWfqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mwjScj2EK+/RakRhzOEpDwEq3zm8izOsaHcpxQ21qp0=;
 b=QX1qdq3ISmoD1dGDHAySwxqxz8ckotD+ODuaTTzLSTV4aqsWzSon7qT0MOpT6dELJlrcdSNWSjJUaPrRmkG2xXpDqLEk7/yAopLCeX8yxYRjszoWgeg4SsKizA8uquBeWeC1UdDwOPgy+NDge3mjZwTR7yfsYtxxICTV+1DqYFvUqmJO4Hes6VJVYlAJy2GekFTQb3PGBCJMNyvZtCC3U6DvAKuvrWlBkXJBK0hzBV6bdWTaDE68XHNJOOAG43qLfpyq24mtQGphfDG6it5BQiveksdf+nSsCbwK2uMvaUqQCd+uGA53PT1AY2vEq4vK0Z8UlECn42U70gLEW8x0pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH8PR11MB8062.namprd11.prod.outlook.com (2603:10b6:510:251::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Fri, 13 Mar
 2026 15:59:56 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9723.006; Fri, 13 Mar 2026
 15:59:56 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, richard.purdie@linuxfoundation.org,
        bruce.ashfield@gmail.com
Subject: [PATCH v9 06/14] make-mod-scripts: split `HOSTCC` flag to align with to linux-yocto
Date: Fri, 13 Mar 2026 08:59:12 -0700
Message-ID: <20260313155920.2347101-7-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260313155920.2347101-1-Harish.Sadineni@windriver.com>
References: <20260313155920.2347101-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0046.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::21) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH8PR11MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: f3ea110a-48ca-41e9-50a4-08de8119925e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	MA7nlitKkmx+/+rvjyzsDyiLRUf3yClbVcIKdnCxV8aEMJ6dPuodgRfs/60D/NlHy6oKrcnWYx1bfOBJvJBMFq6k29ujyyvLdQEg6wsQLe5spS3SnEehYSXOCMDNvziaAetLlFBVoym73P0cUMaJVda6UR+MEW9HwJ78hFjMXaRsb6uyBS2B2mn8uGssZuJ+S9XlNqCBDI0XKWyp9KOb4KJiJERKFtdG2pK//EIb8+fGJL2ofE+NheM17YI4PHshja4VdfFJhFt4f1/QNMU4kk8yBUW6zeWohB/lpprUU+EVJ6vzloCY2shsOPTLqmxTNkEQ3MQw7tgZK9HRaDeU/MLARMZuk3klOdwKK0cyXOtwIJgNcYzAm3P3PSDVUcgG2wnQKCljVT7UglkPysHhn/kDDSlG5xzI0GQG2g8ripupMVtowj52yUonrZk5GSSF/zWIMKGPxOpSUIlEh9XiauZwbzOGDrVeWwflCj2t/JEY4xOl8kM0Avd/j75B9EA9axJGLRUSIXCDlM2887t8rfrGJsI/t6YPS0YWPoebszkV7eXOt82wTSTM+yviM2BGKg5H8ACTAyVYd/OeUQRGePzj35DqTyEPPfum1oshdzGW0FvDkQ+lvvcOYY8BnG6i6tjVUqpeiJNxsocfEnWXX+iUAWdwm/uvIkrRYRM/ZdTQLLuW2WgaufXSHJK3+u9/N/jLHVvBMiV93lbYL7Vq5z/OUSqJnq/JyfFfdgmHBYiiG5anZcVrmh2/FfEsj9BJh4yalL6l/dqATlnZe+VdIvNou9ZEHzFKpNxpIlbu3dU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Yd8fNLuq0D1vs/9gS8vhl+H9l4KfjYcFfPUaSKR8TDF1FzTOuqQNOMXEJFDL?=
 =?us-ascii?Q?d5s6UStqyUBH1JxzFpBmzSAvSb4SrVfX4MuvewqPQZlt+MLx16fHApUlOgEW?=
 =?us-ascii?Q?79JPvBsUeT/B/DTwMH4XbdY6uIv9aIQkKxy3iL2SzrgmJfnMY2Wi3Mo8OF9p?=
 =?us-ascii?Q?dlNjY8lInfDnZ4cVFR+vrERmNPykTsP2VYL2lhc3xoCEeqeOUx/vMPXpN6Xj?=
 =?us-ascii?Q?J9XnGCR0QHuux17uZgOUum+mDQQNjeQZ103KqMNLwYwsNPZxPd0fw+EsI/Yw?=
 =?us-ascii?Q?3bxpBJ108dXZzgzxCHMaewDkfW30SJqZoFj8HQTaCSCK7M3QFekh8Byt+G2L?=
 =?us-ascii?Q?/IziShWXzQL6uYHTmQGusJ/ksXdT2k14nPRRUVAiIpmxlQTvV4my3Mk3TKgl?=
 =?us-ascii?Q?Xi3WWkkVIJbc1bjR3i6KEZj2WoeTq7cNSmwmAWVG3GEO4Xedg04p02kfgseT?=
 =?us-ascii?Q?UgaYryXhjTVRWHoR5kNG/UQrqDohdcN/CTsXxT5+jv7Z9C5xIoqQBHnJmFgp?=
 =?us-ascii?Q?44PxU++ibTMjy4ydtLRXfmrochfogIyRASQYKrbmPDWH+mKWLiQsStZvTezb?=
 =?us-ascii?Q?1Rdk7rIoU7Z3nE2CoNwzsydu+COe3AjCJlH4W0EpaxN2ZQAYqE0Q0/Wjy43I?=
 =?us-ascii?Q?T6MX+cJJYmFB0PBHPWxAsL64Qm1iWh89ra/v92MUlfWiSbEy5BtW3Yg05DU5?=
 =?us-ascii?Q?LMGNwbJV7ANxH5kLQQpFLmjFZT6cD+G8FFy19r96rmnxJl3l/+9wJnmHi+46?=
 =?us-ascii?Q?navHkragSGA2bRo0Ffj/1ZFBc/9aPKGo6QidVppPTbEgKm5vsylTlboDeUcR?=
 =?us-ascii?Q?ePFyOVKcIOSGe6qbNiZz7b+WNHgoZDcxyvu1CBoRo+zANlQRFpkJDvEUoaqE?=
 =?us-ascii?Q?FEHwDwvScVn50UbfvLMN68dWWEvipXPvKBGkQloKuMLyYHDTmijj3cRxF8Ow?=
 =?us-ascii?Q?TNg09vW0VYfudw2KzbKIIn6ELQKSO/XobSCrRg1auDyalblI0sKvKPEBxNnl?=
 =?us-ascii?Q?AKlG8QfXXgV22o5Mdz6S360mmZD/0ll/IAYsUZ/62oySjqpdNj4SXlSjmvYc?=
 =?us-ascii?Q?k/fs8n95nOxBt1xa9EwFcAbPhXBZFILkR0eGsFtoGxTck6bnuneo25FbEdqH?=
 =?us-ascii?Q?eP3WtSe9k5MykQu5BHUKhYk2piX6U7tBxzUTyL08jn69l2IJ9E39JnwORjGE?=
 =?us-ascii?Q?edj65D8I0eTYZUlzDggFWANzRoPvFV3Nhu9dkHCKyxfY7WI06UeJqBwqOTR5?=
 =?us-ascii?Q?xAO6GNQmCqlSF4AMuMPQh10Rvpi2UcJGaN8hep/bJ/mH4fRpXPeZKIxykg6E?=
 =?us-ascii?Q?YiKzDbeI4X4TM7jw06kNgttN7DyJAoN8bIFu35vcYOFBrL+vg/DPQqeaXQ/R?=
 =?us-ascii?Q?vKLXj3ATAJfZtpRqy3QDghNOc6TgjxqV9kBW05lBgvWvzDHHTBONm4kn1kvR?=
 =?us-ascii?Q?XxpjQEU09CgpntGS6JH8yHYneQhXgcf6AModItYZFyQqQy67elIM0O7yZA6Q?=
 =?us-ascii?Q?guP5uMSe8IVf1pz2kPLgzhzwUNBpWCVwJl+QyChO48R3vT+y7VwVY1ArCxpp?=
 =?us-ascii?Q?FPesxk9sjBnHqd77+Jbp17WvCfUy7170hWyZ3aximv9hIdos/QsP0fv1Ftr6?=
 =?us-ascii?Q?MU2O66fBIlPnh7FEXmdG+zkHPwJS/9k2NvqcHMo9Ik6AURReJgrfoOGyXRwD?=
 =?us-ascii?Q?mqK4wAGSx3/LCCiPcSBWmRwhekGP9abpBVboiOn5vnODuydo093DTHTo0/R7?=
 =?us-ascii?Q?8gpTTkwDMrIm2eJXfpBhAFKAVh7yUbE=3D?=
X-Exchange-RoutingPolicyChecked: 
	hZt7NhBBuMNR+Y4pPU4zX8bhx+Wt8eofiBq7gVyzPER1xGMtu95ZqU95wRxNQ/9T/KDBUsAc7Qui0/whNczKLaOWWN6lOyZiAtdvR8pmV3C61P6yVoqPh9AenWwiYjVX9jqAnBL9J9eD5upYmthszoxYebt3eO38/a55DDroMrq0z4WtVwRr8k6kYTuxzB22BpUJr6pf9DKJBGvUm87/xy885S5TN7UFBfrcanT9OtR/Ai17naHtkMP164tCGqx6MWZWnHlmyU9QI1IMNY1vJ+KRbBopgI3qWc0l3UD5VBU+DJ5lERXHYgGrLCq0ymEIngEvBEpeQaVuregp2ksOUw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ea110a-48ca-41e9-50a4-08de8119925e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 15:59:56.4169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZ3PrBrNpNdIkmb2gKIOMvgpsMwXlBZkdKT3fUY2ZW+eMKW2cP1rTlAQ65wvdBmUHD99VfJhsyR+roXDdnbl/YV3+pYubwN9oYPbpwNcKmY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8062
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=ALvEU0hV c=1 sm=1 tr=0 ts=69b4347f cx=c_pps
 a=nnEkt3JPOmPsbYuuSDyGUw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=KVLK08duqDOLNOE2CNUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyNyBTYWx0ZWRfXzMHVry8UusVy
 3BN3VIcpBKtBmNM1hg/RtuZgN82H3k1RiOJpewq3Q9IUpLeSUukYr6LRbdrwXR3bATRtwnd3LAJ
 aCoEmjdOxD3kodMvFSvfmgzMv0dshf8tTJtqMdB6IPA8NzPEpiOBNBFmT0N8J8IMZJ/5QY19izb
 B0D3qdEIatw+5Aa/1zi8kbOHFlKn1LJ96fgwMXCvMwOwG8mTmCA+3J45y5MKH5A7mMfI4NHCQBL
 tUjp19Vw2Vh59rcSwdr1RXMfpR+0V32hsbdX5ISAqEnzFv+JDSS9gsfVty5y85n0pJT78EwqnvA
 h/sCbWhHTe8LazxqUUg3/SN8VzH2tnY/KXfKO70YV0drj0vJxm4p39BNLwQWMqWGakHii8blCwu
 NDlax91GjQg6JY/UEeaey2BIzj6NLla4kIUvEBQlq5tzEJEsIHWhm8qSfSPJ6kkI7qW02aoXtTr
 yLo9vEL1CFtzQKgxG0A==
X-Proofpoint-ORIG-GUID: DZZBvv-U563U6ol_opuQ-uPhtdgVCoLW
X-Proofpoint-GUID: klPG62rscQ323u7YEJkWv6f-nmVc7TbZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603130127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 16:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233053

From: Harish Sadineni <Harish.Sadineni@windriver.com>

when compiling rust-out-of-tree module recipe 'make-mod-scripts' failing
with the following error:

HOSTRUSTC scripts/generate_rust_target
error: Unrecognized option: 'i'

This issue occurs because CFLAGS are being passed to HOSTRUSTC.
Updated the flags in the make-mod-scripts recipe to align with
the flags used by linux-yocto.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 8fcb5e6eb3..874e16e642 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -18,7 +18,7 @@ DEV_PKG_DEPENDENCY = ""
 DEPENDS += "bc-native bison-native"
 DEPENDS += "gmp-native"
 
-EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
+EXTRA_OEMAKE = " HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
 EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}" CROSS_COMPILE=${TARGET_PREFIX}"
 
 KERNEL_LOCALVERSION = "${@get_kernellocalversion_file("${STAGING_KERNEL_BUILDDIR}")}"
-- 
2.49.0


