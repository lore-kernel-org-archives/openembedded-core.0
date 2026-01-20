Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41651CA5FCC
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 17:54:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12559.1768931667606378967
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 09:54:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=B/wvTWq4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=548098e00b=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K81xHj4162049
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 09:54:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=fXT/I6Dfxn9DiLPrD+J+U6LQvETCL5/Ok2ih/g05DQ4=; b=
	B/wvTWq44hmEtO5QzM93XfflJ594l8gD5BxYwn4c+mVd4XmzP89wxT8l2/SES337
	+3WAjed1o0ZFPw0l8mTz/NZZ9ZkQOQXEALC+w+dfcrSSEObgS/aL22i9qo4aGM10
	orPwQX7mtjiEyKn22kmNvCw73AZHrDgmVLsdh/ReBqnxgrC5zQS83JGuWtLofKpM
	moNH/6navqWtIvxGG+RpltEB4qZI88ACzfeHyEnb93ImlgNLmN9kigu/lvc4/BYE
	hDjauRw+Fbv7yXLlOo38M8n/ceXDxQrRD1xIvdxlYQ6zRoku3Dlg6Z89aYmq3B1W
	drLk4pDiRfEec22WUXfw+A==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012051.outbound.protection.outlook.com [52.101.43.51])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4br6k1k659-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 09:54:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XH+xhAF4NfvstziZlADQHLqXPHA7NNf2eVKb+cpkYYTszRIRFuoehjrUSMcVjvoL0DhzZL+/n3QrnP3tFstvEJXsBFOnQbQPpsy0cE2o/SCYCuQ07EzIiC0mhNyxZ0Fej0GhYEs4DXAQ2IgTlIm9u3S+okZc049KQm2XF7y/6rTPKH4sMIsDsyFke7QzyrOqa1NzuWZWyMQ65PEsNC3Ka8HausVl1KSRrngZsu1QCtVosS2N4tTLja52PZtkY5upXSMiBxS8An6DFevh13GJUOEM3H4Fz1r4VNTQgg8ChnKpQcbce9UtJ2ODube3mjTtomOd+Fr+KDbQbSjC5GNJLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fXT/I6Dfxn9DiLPrD+J+U6LQvETCL5/Ok2ih/g05DQ4=;
 b=wt0bB5+XqgE1NAjEnK2nuM2ai9kiDT6RboBxMWHKh/NVAPN11c7cq/erLEG+n3sjrXHa4RFhcoqcInbUUMM/AvXFFVBYuo7PkGL7FZwBxVTCzwec8P9+mLJtu8gv+rqnDym/VMMvxZqWyJUTs6VBrWDIZMdSZuje/yrMCY1pR3J2hFSOZxLIGGmZpqNa5L66aixCNUJ2bhoIPwZNkW/ke2lIPu1KZue3J0DmBoSWed++C+KXMKMtr25hAaNOsrBRocKmnMgqg1E7KGNxmsOI7rs1Cir+uBDUBrHib9mDJMaFI1Oh54wk0grpvujGeNa2U6XXfr9+V1USLAOJM4RJSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by BL1PR11MB6027.namprd11.prod.outlook.com (2603:10b6:208:392::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 17:54:25 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 17:54:25 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, alistair.francis@wdc.com,
        Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        richard.purdie@linuxfoundation.org, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v3 09/16] kernel-devsrc: copying rust-kernel source to $kerneldir/build
Date: Tue, 20 Jan 2026 09:52:39 -0800
Message-ID: <20260120175246.2052341-10-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260120175246.2052341-1-Harish.Sadineni@windriver.com>
References: <20260120175246.2052341-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0289.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::24) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|BL1PR11MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: 72c6447e-b8e2-4a26-299c-08de584cf2e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QlVVBTM+KVoGJ7eLBSYYVvyDCsI8ni328cFklv+43VUtqSSpPxs6A4ER5wbh?=
 =?us-ascii?Q?DVvUvAo3OV8+1QWdRfTw/lEpZHyWRuNlBjKp8Y0BpVur+q9glj2mrlsBUlDa?=
 =?us-ascii?Q?sbWygkxlpoh7wjWqhqv6LpxaO4+3RIXYjmn7TCCoUuVYrywJm0wFVJfIiLMo?=
 =?us-ascii?Q?iAT7B4Ja8QvSl6nLMkL6dt9cQ4ZMxhkv8KWhYxkPbIwSKFOhsvRV94wzLYzl?=
 =?us-ascii?Q?/V0I/OQsW4XoTpv3q6g9/fMUu45MwPZVRoawmKMncT61FX764hfYiHRPr3vT?=
 =?us-ascii?Q?gTRBbO1rZ6R/B+PGr1zmuw2YCVPvVSsMkmZ7z4/D4b1VpcYoDn/Ojkw2mOi/?=
 =?us-ascii?Q?XPmQuoRmJYLg1Znf1klA/ww/a6MfkM2eP6/MoyiG6hynQM6su3EP3UhYbe0Y?=
 =?us-ascii?Q?rRBP75+9hqlw/VAWERcXlCa7Ii3U2IWeB2gOVuO0yaM7vT3/i/4lzxd7+jsT?=
 =?us-ascii?Q?b4e4Ctu84LnDhJeqECvpaPg3aIWMtZUx9LI4jUprQZDofP0FPvMn9gHytQIJ?=
 =?us-ascii?Q?qMlpRYfipTP+PhJh0PaSJbV0n3GgYKoHAC+QYTlvTVCdF4sqO74NqRmnnaYK?=
 =?us-ascii?Q?/0w2LQOjR2IPP9JRyVaO6eXuqAxeTNyXJs8cKOJCufThu8Zb9E1jNFdSzJBp?=
 =?us-ascii?Q?a78APnvF0qEGDPX9aej4s9mHKeusKMlW9U9SWhNOiE+5+aqMUqc2I3Ticgo/?=
 =?us-ascii?Q?SF79PfvzbvkMsKMqLXnAzNvZay4hX5fq3lhpuSCznHp+FVO3pYcHyuPodiol?=
 =?us-ascii?Q?MHndWicHuiwn6d4wukEvdkT7WdSA7InuNnb7nF7HvEl+YCa2YQiO/o4KWiED?=
 =?us-ascii?Q?ZqLyde8JSNHdKCbosY2WQK13U5wK9QG8UPXR+51QgLFAgKAs581jnKcDZ2af?=
 =?us-ascii?Q?SYw6i+qFn7hrrHv9X1eTxD0Am51+5jb6VKtYhZb3oyKGlm520lqKwPVOUg9N?=
 =?us-ascii?Q?vP8U7qvxYTT/uvQniNUa1mcZcCmbYEhNRP4n+3zqtonpD+MagKv60FiBiyNE?=
 =?us-ascii?Q?8g87dp+15KvWFcxFT6Wpi4b01k6bkfbkefMClyOxXnJIbY1qBoYum1KwBW0Y?=
 =?us-ascii?Q?eOimMm3OX3DGcLO31lunmMd1W9ytDgIvbAOt/t+pa+MLbJmfBr9VPc5rFcUp?=
 =?us-ascii?Q?wF/ntmn/JdAj8jdbT/A2wY3z98VMuEMNf+r5GbBOJ+IcAsU1fyoK0K9S0Ebm?=
 =?us-ascii?Q?PJI2IhDpjOEkpG5KA8dSSI0KxPb3NsIP76nDOPKx9kNdo84UaAEsSFpdGQcW?=
 =?us-ascii?Q?y0/TlpLfFjvYqrO3JcWGSQuf+W44Um8f0jEoRJeJErkRQkzW0xFIK7jFhaDY?=
 =?us-ascii?Q?nk1WEuAzkQQ9/zlYeZg9pi9g6rOYIk8JS3rFkCbGCG2dpV0VO16q4mZOn6wV?=
 =?us-ascii?Q?zs/R9kiNEwGMqQsD004rIKsiv3AeS7ch2hHvo8ENaicrq0gKnlgJg1OnrdIj?=
 =?us-ascii?Q?vmevV88zBNOHiHtM5m9ZLEqFOOKzfNzl5XCxk43Ro+j0bDkoeb7dcc5ucO5K?=
 =?us-ascii?Q?IX5Y0aJbV3+XyEH8cHurtfmfnI8lhKP8BtZcII66QGDReB2KdC6+lrM2r1dl?=
 =?us-ascii?Q?1XIfPxBPLeT8kc1zHbeopYt4RgQ4Sil2bsQR+4WiVLFUaqGNaijEdUKiGRJi?=
 =?us-ascii?Q?HFb4Lj5eK4RAOJzQrpWI+SY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SDK/uVntwvYNAL8l02p8N/TaCEj8c8mQ1XFaD1vxU/bLXAavbKgtv2M6B0dX?=
 =?us-ascii?Q?cwhJUd/mmNhp716vBEoyp9sYOHEXj2oKr/tBHCag1gpQasYMAk9u+uXYSzN6?=
 =?us-ascii?Q?1fpuEf6fgiIb62VU8kW8LYjgfIQTeXf6s5OWof30enHmz+5Ay18gWJK7OLUC?=
 =?us-ascii?Q?KZ4rlUYHYRP2MZ+3jvrTHgdNxyMu8Wx+ykZL/iQ4ki0Dhx2yaw6FU/ULJTrw?=
 =?us-ascii?Q?MZ3fZXWDpqvVrxLXZH7gCZ7fSTWFr9SB6uIHfW6alP+lSBMgvCLneSJZD9q6?=
 =?us-ascii?Q?SHyph1FNjzzyw+9FxB63ioGu6eq10SK4EA4/+5GRearEmyrkXXPc6UyfLawJ?=
 =?us-ascii?Q?E4UyvJ8sJrFbFLuDKkhSd5kKvUFVPki5v6a58aS6IYV/TLI+eK+DxsRUhdJo?=
 =?us-ascii?Q?8Ds3Gw3K8ILsFP8j5eyZMbNOfQliZinYdPzvGAZ+Vb7GwNK+Ziap++ObwuMr?=
 =?us-ascii?Q?NeCfFQJQSDtJcbRj1F6FGMHTqWh3d1Zpx/MSwzPssAxaJeWdgS5NGU7fQ9jf?=
 =?us-ascii?Q?ZCwdAyBvOqpGECtqsQ8qNQE8gLb8qj5nIUY41Gbkv/OCxSgEb5/RfBzxitC8?=
 =?us-ascii?Q?N5C7mXtwt5HQdpCKZY9R+jlZ/YlDdyWO/sN+1LMrc2iosQullWHTrksv5hFB?=
 =?us-ascii?Q?5mk08aJ9fthMZbbkfvLevbWk74W5wnK6fi0ufYWv7drGIjWLNF5wcF4i/vSf?=
 =?us-ascii?Q?duQxBh4q1y+0p1hDOzfiY/sVka5yI+6yn5JCeJBz47GxQK+Bklpo5TA0YuPD?=
 =?us-ascii?Q?R4n62HkoJyUY3uCJa76eKMND6B9WhscGsDibCfUqp366IG3TQ8Fdx32/i1+y?=
 =?us-ascii?Q?U0lFjPa1oy2AdihGpGpbzmkmWZk8ZXc7jU5zYW/MeBtcvy8XktKJtMbtB4u1?=
 =?us-ascii?Q?dRsbveSjdySkT5yAclb+ReiTdcQFTP2wC8XerNzuZEr4tua0/yTrNHqgSPUk?=
 =?us-ascii?Q?Cl0kPKlzWGsI+6d5X0AhHMqOhFLby3ZyWu3w/88qZ+YYP6JbCKpR9stwZd5c?=
 =?us-ascii?Q?I5hqXb/PF0yAa4+1ZAZW5MPzgihZVQ9frwdXU+Csi5M66wX9LDeyYrr0X3Pm?=
 =?us-ascii?Q?LWH0WCN9tHZtU5mCkxNc7wfome3FeCmo5HX5roHgW0HBcNoqn0xWpDYZY7ER?=
 =?us-ascii?Q?G8YB88jRR0kcFWEdo+toV/BlCsAOj9ogsJgrG9WakHrzN/ppspUv2NPQZTjZ?=
 =?us-ascii?Q?wO7nDYy2huPrWCyWl4q/odf9GYnkaPMNtS8MGqQd7y/ABjhToXf/6n2/yQl0?=
 =?us-ascii?Q?mgl066FD12UmVtD7nwKO0tHSvCGr60+cMrsRFL86Xj/DXRWRpvQuhq/0WiRX?=
 =?us-ascii?Q?oJtruiR3hojzPLY0rvgECwXPX5FllLXJqG6oUrD6LMlMkbk8Unngz+G5wzt2?=
 =?us-ascii?Q?H7oXNq9YI0l9Xg99OUUQEG4zI7hoJC2jBgUxSJ6winw6z05dHMWgSTXTjKsc?=
 =?us-ascii?Q?AfeCZGIMoEEFsXvan5fPu+KUv29X2KSGT8tNz8Z0EheodfvE8W38JGRofrZO?=
 =?us-ascii?Q?pBxea3xZeh1MimT8yTsIsH7rkRk98AdkQTtYeRwROB48yfkK1xGLuBFf7Z32?=
 =?us-ascii?Q?z1ZnkDQ9kkux+fd8yLWapHhYgm0NZBOjodf6sje1s0/HtOsQ2dRed4sonWNm?=
 =?us-ascii?Q?rnJxGR4AQPWfCNUIdOzk9ynGoYihPbFqwC4DkFNjU0I3IQCcNLVFequgXgXs?=
 =?us-ascii?Q?AknU6o97mdCoazGOco61CTPK+2t6lDuQFvBZqnrVWKAFoIZPKpKmgpek5Ly3?=
 =?us-ascii?Q?OHSrvTm6cvYbnwc1EhSonJt157NEkSc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72c6447e-b8e2-4a26-299c-08de584cf2e4
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 17:54:24.9751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M2sR2noX0eG4NaTrWMTUttwvvSYbtoaz5g0ol6+QZFUo6ZUhQH2xED/qKH6S2CjOR/7kYTWuhFGnLftmyCRMdiHZhi2mIx6Z42DVjCxELAY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6027
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 2UNazsXSJ6AqNP5rge79t8wRPsmnYFYx
X-Proofpoint-ORIG-GUID: 0L_Bk0hl5qVgowueJE1JP1OvnBMIx-Bs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE0OSBTYWx0ZWRfX4mPQaZ6wzl8T
 TBuGHycVWhbCf3jSMA8LvmLMv5dKETahnsGRPeol+XkfCtQMAk3Mh0yUEyRScJUIKOtxbkgHUSt
 IAfSwFeWatOUv/gdhwqxYED/Q2DxgX4NNUR/0RUn4l4Z40rtPrav2xHLck/OJez9exC7uJ4UX+w
 c//Y4lLDs9/nDP97sbtkyd9/KuT1pTKzbLyY/aulE/mkATtrM6GqU0cicVrCmFEEZy7IhKCX3XZ
 IdKBe2ICrw89ViRQ4pk1+qonGdRg7ZK/mDjKQTZxCHi3jxjb+ILbopt2MtD5Blgn71eHLP1D8ab
 AdqPOQvu6c1QZzr8bYxNb9JvbeWM0mWh7stZIOHZE/npbnp9GCaxZ0RAZ+d0zRT7fsiosSCu5Tb
 1lHs35IgHCl2MgYz+oQV86GkjzdYqBS2TpA9/qhYiUOw4XH58vTUsLMWcLU7mBLptZZ3gotQLsz
 rsMC0M24Vnul/FCnqlQ==
X-Authority-Analysis: v=2.4 cv=ApHjHe9P c=1 sm=1 tr=0 ts=696fc153 cx=c_pps
 a=scPzG5pGSpQ412Sx4Fqw/g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=jGeDP5ryJtbC-vnzprAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_05,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200149
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 17:54:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229756

From: Harish Sadineni <Harish.Sadineni@windriver.com>

When CONFIG_RUST is enabled, running 'make prepare' in the  target & SDK
fails because the Rust kernel infrastructure is incomplete in the staged
kernel sources.

The Rust build system requires a wider set of interdependent sources
during make prepare, including bindgen inputs, C helper sources,
generated headers, and other support files. These are all located under
the kernel rust/ directory.

To ensure make prepare succeeds and to support building Rust-based
kernel modules from the  target & SDK, copy the full rust/ directory
(of size 2.5MB) into $kerneldir/build when the rust-kernel distro feature
is enabled.

Additionally, when Rust support is enabled, 'make prepare' generates
.rmeta files (crate metadata in a custom binary format) and shared
objects (.so) that are required for compiling Rust kernel modules.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 23a9093ede..07f082132b 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -139,6 +139,15 @@ do_install() {
         cd ${S}
 
         cp -a scripts $kerneldir/build
+        
+        # In sdk, when CONFIG_RUST is enabled, `make prepare` requires the full Rust
+        # kernel infrastructure. The Rust build system pulls in bindgen inputs, C helpers,
+        # generated headers, and generate crate metadata (.rmeta), and shared objects 
+        # needed for building Rust kernel modules. Copy the entire rust/ directory (of size 2.5MB)
+        # to avoid failures with 'make prepare'.
+        if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
+            cp -a rust ${kerneldir}/build
+        fi
 
         # for v6.1+ (otherwise we are missing multiple default targets)
         cp -a --parents Kbuild $kerneldir/build 2>/dev/null || :
-- 
2.49.0


