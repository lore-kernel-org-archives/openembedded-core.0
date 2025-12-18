Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C32DD68BD8
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 03:39:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33367.1766029145431863898
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 19:39:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=s6VMry/l;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=44473d6ac5=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1Gv1V3177379
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 19:39:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=/U8XME6j6FfDzEsvMTa7t3VOTTkaia5q62XycmVIlVw=; b=s6VMry/lDr/+
	cPgXuSK6DghycfV76KzklLNYLorvzuYJlQV0s4GElrSmh/Eh9RIP5bGURIIhgHdF
	1Wcz8L87+S8CL9GnZdKqx8GYcKwvc3GFVLLQNyIffq9eXNA5Jw3x62Jog0nLRZWW
	lc6iK03rC3J0yUpBkwwt8OhQrI6/2fpdCQ/wzFexpqz1W/2Zy58aeH27/2r7y5kx
	SMfXbWWg39IV70SebIkkXZZObYukV8iSm55iRSR+hpIV7jV4tfvixsHk7rNEYQDz
	LaH2O4U0YXKY8P8rQtVgNaaomXFej6RAxfxZJF/MbBnvvNUXrrmqjbaXJwoHoqVz
	qvDIDyQpww==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012008.outbound.protection.outlook.com [40.93.195.8])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k6j1euv-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 19:39:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CFvF22XiODrOPqNOf7SMcn4BMGBeZDWXtSNrqEXlomCcPBEQrQHpAPZ4mNLr5XH3NYu1K8iTCdV4rNXnqg+DElw3t8830Wru/okaX9xAvI6ZZ9emBQo50nXsbeOksbGBG/eQWPK0Pw4UR6EFIq6euMsB8a5oucxFspji1pLdcr6hu1mpiSXfPGxfjbr3euvj2zxCxaQs5vCP2Q531yAsxsXSPvwFPpTj2bAefpnqCV7aVzT6WJcXCgR9ap27ZZuk3QilV6tySEid1Kihi88P/vY04mg7VPe2zroDiBHi0T1iDYkQ070ul5caqI/I1cp8a4Xk8uS+BiA/orYMlwiktQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/U8XME6j6FfDzEsvMTa7t3VOTTkaia5q62XycmVIlVw=;
 b=K8kGMKrZhKaklAongkgNNeKXjR6+7EIWwnmsJzqy0NscQuTWEN4hytEWRzS56Wr1lSlpyMHpiyW3wezdckqWns7Xgtogdg/qBG0CD3k7pWpuf6DCCc/twccIj8s7yzVH6i/4yCNi5auJw/H9u5UvztNVRljM1ZDlCI12h/kfweNj/cocYRllRRNV728gd8kyvo4M4gfzEti1sQYsb5Gd/7J43EckOdzImYT9e94a9408rKCME2Z5GZS8IhbfqlZwr1T9j3sbj5pqzhj2eH/jA/XDg9+Wb5Iq0FYmd4nEIjN1gr+vnYLaExoGSCTBPyVrq9MXUePY822hVe8FzWPwtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MW3PR11MB4652.namprd11.prod.outlook.com (2603:10b6:303:5a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.7; Thu, 18 Dec 2025 03:39:03 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 03:39:03 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] kea: remove keactrl from package
Date: Thu, 18 Dec 2025 11:38:46 +0800
Message-Id: <20251218033846.107161-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251218033846.107161-1-yi.zhao@windriver.com>
References: <20251218033846.107161-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0219.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::15) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MW3PR11MB4652:EE_
X-MS-Office365-Filtering-Correlation-Id: 3becef97-a836-468b-8b45-08de3de6fd30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Zw0SWOfkQrdHDwjziATuQPgGAmzgBhRrfdEBxGKUsgqGy4zHMGezu872hBTe?=
 =?us-ascii?Q?rJYZK9NHmyWEwFI993Ifo53E9gNJSbYoao0ijc3YGV1QowpuAcJ1Gqo86pGR?=
 =?us-ascii?Q?wkEIn/3Vsv+nTiLLgiW//NyWK7IB8zFET2A5688BWEAcTZ03jYuUgy4Tll6H?=
 =?us-ascii?Q?P0v2iYUkhGvajpUeJ5cpeNBeb4o6FFBD6Gge6k4H82FkGoQkSZna4SF2eopC?=
 =?us-ascii?Q?rQsQ8t850IXZXLWRbny2P5Jz42ciLxFNpiP4RH7Qq1RLpXaVE2DIEIe3k8pX?=
 =?us-ascii?Q?wkNyGkU5geEfrw5JH3FQ+qZAEm5k/PLwXH7QTmGfg99/oA5k+JOLLHg0+DGi?=
 =?us-ascii?Q?8yHO6L75FZSYWSR2dd97eaFQUd0UJc1mXg2Edn9Vjvcw9Xkd2Z4ClXBFozmM?=
 =?us-ascii?Q?2eJSriA4aXvA/beyZ1a//TsK6MLu0Zwi5G5TIrPRLwjpY9u+b15nFsFGA5Ri?=
 =?us-ascii?Q?GOJQzl8zsU5CKLKKvck2NxuRWhXuyofzbZSjCvFv+k+jQeSab/qL5/p6Q3MZ?=
 =?us-ascii?Q?g9YxWYwQoLTuSlTVKzfES7jhXcMnUdQ6eoarWbFqWGPlC8GMWbBAB0NYwkDV?=
 =?us-ascii?Q?jzeXHLgS96hG1Wqd1Ypy8gxtULdKrm5G2p/GpPRjFR/hkFlTR59YSNU9t9lU?=
 =?us-ascii?Q?tWo24vM1nEvx80KYjPxseGPClxahQfyexVP27uUQXOckKaXHRI5DE31wDLiV?=
 =?us-ascii?Q?A4p60gbq6ZQzJe3y0VLETtEwE+lgzeKE8Jbku0mgCU3CICcgEvy08wSix9zi?=
 =?us-ascii?Q?ZjBHiAk6GxJ2tPImT1RyZGMG5j5vJfhnw477P85tov5YcspOFW9BLjMExLYI?=
 =?us-ascii?Q?f4/N6UzOKvfFk+E9M8hYE3MRQb4WEWbEkykvq7Dw/76virY9yCqSv6S4a4IU?=
 =?us-ascii?Q?5sjC3hfGcgkzO+ZEWOFtdmirpFj7IoPisN4TxuLry/yPkALcfN0BF7BsRgml?=
 =?us-ascii?Q?A0eJAueUI+Qx6Q1Hs+QcdmfRVzPcKJcu0TUusV74v4sqaLhqsaoxYuw52DH/?=
 =?us-ascii?Q?H7ae+bJzct64FbhVh2fOh6nNGGEsbvR9qciP4jiMuSRuFeDS8p1Ws5HFJCcY?=
 =?us-ascii?Q?acfaeVHKo1KeoIFBIhvXuRcpQf6D/jH9b/4RdWPxbgr3X+x+v8G8qMdipQTT?=
 =?us-ascii?Q?Du6LDeLxAq1K0jjzARXjsaerWbeH/WSXKXpdghiJT6Wpsm+xMUD+22gx6Mow?=
 =?us-ascii?Q?nTbn5OTIIg+02lh76kXSHjk564gnsZLC3K8aAudnsmjI+vki6EUGs+Lhgv09?=
 =?us-ascii?Q?ihg/2fnwJZQAo9yg3uGcD3B7Dswgw66MW35irXPebUVdYOhzX+cjmQvuQPed?=
 =?us-ascii?Q?E4PcUxbdg83ZkJ9cAk9kQbZwA0Xc9kdkC9wSTk3PQycc7ZQikpa/B0z61w15?=
 =?us-ascii?Q?L8h8cHAdov6qnLmPFsmNTIotXDvlXp8TQfordWlhxl8jgh4zUIeIsy/9cB8D?=
 =?us-ascii?Q?4BKyxfcZPpxMAzpXrMN8+RxtBsyhfcNR/wBwEeBWgayk4lQOCYE02Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2g7oCx2eHLGZ8cSJldTFki7olE/kZCKpTb8SRrgj8ILC9vvV0smr7TOGzxJf?=
 =?us-ascii?Q?FXAsPfwmo8V0nkXDgtljuu9FR4ZjvmoPq0zyzrRx6+eEZioc/zQB9np4vy23?=
 =?us-ascii?Q?Yl0iE4BcoaJaoGSGENCWklSr52avBvPzIdZcsSujFLtuk7obUnPWswjYyi4t?=
 =?us-ascii?Q?mN1W/nGcWrk3tFTF1jfW4MDVxL4j/4Ti6KRnE6JbY6kjs8JQGeOm4oNTzkVs?=
 =?us-ascii?Q?wasWdFwQvEfJRk9VKLeLqFp3RzfjJLeJ4IFVy9SDnrsu5mdszB+BHlR+os4O?=
 =?us-ascii?Q?atU4prrpQcQ1kErdi9/RHYGjuk8kSwbz+LX7Tn/slOD0pJYRLGNvFVLdmSgf?=
 =?us-ascii?Q?HdtUHVnBfRRtfGgrCPhooVSy5DZyJAHpymZ9EssOV53NWCvnTGjjaQ/fFOBM?=
 =?us-ascii?Q?T6MWR96NrFvBpJyTPpr53vkDtI2GNb+RVvmr0x6BcBQl6HLh3fNEdDDDMSOQ?=
 =?us-ascii?Q?TUVDHDwbxbhTMGpqmTvX7IS7OtEUDLHNvU5Rbr2d2VDOpL1QKSC33e3iQVKK?=
 =?us-ascii?Q?4g6EQjQfj/sPoiL3qxfXAS0P38ETVIVERlvSdVoNSIFuQoGw3rZTJwVeYs1B?=
 =?us-ascii?Q?APfiy70Eu8bjQ5Dz2Qu/Wit5ZrluUohGADQF/z8AnmA5QKlK+vFr5o5xD/wf?=
 =?us-ascii?Q?pFiYVdcJto9YPSV10SAtwXiA4kC44TXpjrGZrmAzYBZMELho04kIgWZ9Zsmh?=
 =?us-ascii?Q?WORqHb+PbTsFYT43Bz0in/Bd6qO5BIdTgZkhLRPNHZchNIifiOr7TeHWi2b0?=
 =?us-ascii?Q?AE4RSN1diiKAmo1vqYUjBR55wKyXW7Mxm1y/wYqrhTMfO9lXWhmta5PnXVC2?=
 =?us-ascii?Q?1gk2kyvzcFqvWAw9dJ0fCCyrm9ziNPKa5xf9GLIrcAPGximLVGArCBhOQFsd?=
 =?us-ascii?Q?H4A+9vbj9nJBeUruYwZMA81EgUSfdkVTGCE0BajhHp6V0sCcLgv8e5y888C+?=
 =?us-ascii?Q?adQxWWNoe20B8yYwmxrsuhnHGxUTQqAxT8+FuMHAYGUykKZ8OpyY4aQkQg+l?=
 =?us-ascii?Q?PvBCIyaWwLDca6qqjghKupp/qcUS3NyfGlTkOs5thCzBlFsYZaVE82jNI4Bf?=
 =?us-ascii?Q?+MXjz/JNSZhxwrwTtTcWkQizwYX6+Vic2z3SUsQTOSQSqhqkXw10CbRg1CDp?=
 =?us-ascii?Q?I6/mdz5ojYblrQ1DH/z9MUB67JCTDvgk/zy2QCuxXt0b2/M6P0mb9JAVnBMe?=
 =?us-ascii?Q?pkHFwi4Kx6H/1Qly1nqcp/qcB9haJ4uhyjrqQLqkxJ2E5I/0evx7n0VL/pcC?=
 =?us-ascii?Q?rS1Fi/YSyBXp/ccECoJRst9WJbFs0vCCLab8/6qBVRbLwT2mP+hMX267KXgY?=
 =?us-ascii?Q?0difzcRtH1YDGXCaN324IsFfwMglTsOTAWr8gRGyZIFP1yLBrt5AL3uAnkj5?=
 =?us-ascii?Q?rD8ItXP05WOLTTF1j/6z/oL8nMtmXIUeCSuc9wPzQhcmSd7MuTe6CXDR2E7E?=
 =?us-ascii?Q?ByOsp6m+tFftBPTd35DMEeyC+/Ur5lhyFjlC0fnYlYv1bivGFTwPjC3tWFFH?=
 =?us-ascii?Q?cIfLKPbgxKfWS2HsisqaOr1fgRLmFXZt0sBIzDPsBzcFAF3mUuC44cff0q0y?=
 =?us-ascii?Q?PJXGLxkQeM4ULBPHotQvN9DaJtwMo9A3AkOS5bG2?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3becef97-a836-468b-8b45-08de3de6fd30
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 03:39:03.4123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0TPqnGUO/ZtVQMkESm7QIbOo7vSRw+1fJM3N1zOJMyjMWKzt9zCM+XP95o08HHeWyC/ZLlVH+QA+4GoEzD7Ebw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4652
X-Authority-Analysis: v=2.4 cv=ErvfbCcA c=1 sm=1 tr=0 ts=69437758 cx=c_pps
 a=5ppPJOB7bB2hO4guNQQ//Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=SCo1hh1FAAAA:8 a=UXIAUNObAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=7CQSdrXTAAAA:8 a=IpJZQVW2AAAA:8 a=zBe4X2LmVUuRWWPHscMA:9 a=Hti1SrPgC-EA:10
 a=nwb-CePKZZm3gL-ai9HY:22 a=a1s67YnXd6TbAZZNj1wK:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-GUID: tjNBCPaZ_wPTrOjjZl2VWV3vnGXs1I0x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAyOCBTYWx0ZWRfX/q61cWIC2I6o
 V1fV105tjac9/HMXp1n/0vUQ48pJKtNOnTmK7HpDJlcnG8avqYPf3qYfQzcuOJNvs1P9uO+mjwo
 oD1eKpokk0UKWYyVi3B8Mi7SVRdLfSGLzQNHqpKj5OG8In9+fa4biIL5ExgYSxsgG9+WubNyAo8
 VVfWcyRfg66ySDqw4rtoXNn6DH1tF4PrkrsUqAk4WN8qOJS9lN6T0O10LFLIjCARjNhKskusHUY
 zaldwuShHjSW16gEsUaIYcf3yqZrvgLmeyNVKBujkvwofwEPKI5mPY99IkVs17ZDeZpOuHZPhb9
 3/JQ95QFRkrIP/QobRnIn/qHA4ZRBC6XRA62/zl6eqkoMY2YpLonYwNYF2gKAKMpbvOXY6K9n3x
 Qct2C87hyqqhHwkEBt8BFQHUkZgF3A==
X-Proofpoint-ORIG-GUID: tjNBCPaZ_wPTrOjjZl2VWV3vnGXs1I0x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 03:39:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228087

The keactrl script is used to run Kea from installation directory and is
primarily intended for developers[1][2]. It should not be shipped to kea
package. Remove it before packaging. A related patch is also removed.

[1] https://gitlab.isc.org/isc-projects/kea/-/blob/master/src/bin/keactrl/keactrl.in?ref_type=heads#L10
[2] https://kea.readthedocs.io/en/latest/arm/keactrl.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../kea/files/fix_pid_keactrl.patch           | 30 -------------------
 meta/recipes-connectivity/kea/kea_3.0.1.bb    |  7 +++--
 2 files changed, 4 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch

diff --git a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
deleted file mode 100644
index 9cc91bdddf..0000000000
--- a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From f5125725e4e2e250ccc78a17a8b77431100e7c15 Mon Sep 17 00:00:00 2001
-From: Armin kuster <akuster808@gmail.com>
-Date: Wed, 14 Oct 2020 22:48:31 -0700
-Subject: [PATCH] Busybox does not support ps -p so use pgrep
-
-Upstream-Status: Inappropriate [embedded specific]
-Based on changes from Diego Sueiro <Diego.Sueiro@arm.com>
-
-Signed-off-by: Armin kuster <akuster808@gmail.com>
-
-Refresh to apply on top of 2.6.1.
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- src/bin/keactrl/keactrl.in | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
---- a/src/bin/keactrl/keactrl.in
-+++ b/src/bin/keactrl/keactrl.in
-@@ -157,8 +157,8 @@ check_running() {
-     # Get the PID from the PID file (if it exists)
-     get_pid_from_file "${proc_name}"
-     if [ "${_pid}" -gt 0 ]; then
--        # Use ps to check if PID is alive
--        if ps -p "${_pid}" 1>/dev/null; then
-+        # Use pgrep and grep to check if PID is alive
-+        if pgrep -v 1 | grep ${_pid} 1>/dev/null; then
-             # No error, so PID IS ALIVE
-             _running=1
-         fi
diff --git a/meta/recipes-connectivity/kea/kea_3.0.1.bb b/meta/recipes-connectivity/kea/kea_3.0.1.bb
index 5c46498d5b..2b4677af51 100644
--- a/meta/recipes-connectivity/kea/kea_3.0.1.bb
+++ b/meta/recipes-connectivity/kea/kea_3.0.1.bb
@@ -17,7 +17,6 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.xz \
            file://kea.volatiles \
            file://kea.tmpfiles \
            file://fix-multilib-conflict.patch \
-           file://fix_pid_keactrl.patch \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
            file://0001-build-boost-1.89.0-fixes.patch \
            file://0001-meson-use-a-runtime-safe-interpreter-string.patch \
@@ -90,10 +89,12 @@ do_install:append() {
     rm -rf ${D}${datadir}/${BPN}/meson-info
     rm -rf ${D}${runtimedir}
     rm -rf ${D}${localstatedir}
+
+    # Remove keactrl
+    rm -f ${D}${sbindir}/keactrl ${D}${sysconfdir}/kea/keactrl.conf
 }
 
-CONFFILES:${PN} = "${sysconfdir}/kea/keactrl.conf \
-                   ${sysconfdir}/kea/kea-ctrl-agent.conf \
+CONFFILES:${PN} = "${sysconfdir}/kea/kea-ctrl-agent.conf \
                    ${sysconfdir}/kea/kea-dhcp-ddns.conf \
                    ${sysconfdir}/kea/kea-dhcp4.conf \
                    ${sysconfdir}/kea/kea-dhcp6.conf \
-- 
2.34.1


