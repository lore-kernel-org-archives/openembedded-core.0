Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F8AE92708
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 11:33:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6445.1766835232052087800
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Dec 2025 03:33:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=V1KECwCV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44567337af=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BRBUlFx3818684
	for <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 11:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=5mw1RiLlOTRlrtd3GtYDdQFC8v1kxpvLu9og8ig0+oo=; b=
	V1KECwCVQ+8EPny/ufG81/iTteEWM/VoIdRGozTwUf02ssbIaulRhMe+IsMAuw19
	0su+uMKuoE33oXh3I94R+sFbCMoiiv2iQ4GZzq2I9cGnMm5m6AaKXRuKgC13GRSn
	Zw7bmOpxbWVRDrWGeIVskmrz0DXQhoiiei7QaHKJJFNydrT2S1U2QNrllDRdft75
	7QkDqKMiPtCaX0hVI5PA55CQHvVjUbfqCpnIUOmoVsZt3UVWPI9oX3o+F+22Ig0i
	E0QhPEuWljMc8pEGeIwsBRmUNDrWa4rCaMuZNIYlgt9TuMrZuJCY0TMMqtsFcLKe
	asgywFgW16lRm8/1Ka8xtw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011005.outbound.protection.outlook.com [40.93.194.5])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba4nxr8mb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 27 Dec 2025 11:33:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=axRBzfBxIuDzjfzseXmII4w+QVNQQCHc66INXx+hVJukHLVfIqdrnbHRHZnTt37RIPsyGEdRPC7PXQRfjdPzWUlMDuvy12hQCdUoLsb5iMbNGDmBrO79+vyeMst4hYViO7298R2UVjHybY67huo114iA0ruqH0dSH4nRp+Z1qF0B8nykH59KOoohtNhhmJ0HMPseEuFoJzLKnnZKwUgg4v7VZ7ovYS1nYPYbv6tRXbrPYv7XCazolCFjo1rVqN3adehKYwX8GAAN3Vm15jA8un6chlrCqMwXIZyroa77Zn60GEDOfCGfNbDoRZAUXzcU73I57AnzlIXNxdpkB8UjzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mw1RiLlOTRlrtd3GtYDdQFC8v1kxpvLu9og8ig0+oo=;
 b=QS6mLm+fSOoPlCgqa8ct68Jczq+LevNWTXe3IF2nXpJDn6KLFIuy10BEEi9Ihx8b+Kyekq46I9TePpKw+7NisifITX5ZikJpX+tcri3Sq9TNQZQ/TJH2g4NCR9Isxw/DcutpbydJUk/Fkpa6FrnJxzG4wooh4nfcgK4AbzZ/I7KADSLh8wNL7FRZkt0zeIHwoHWoWYQaeFLlDIJoM0GJYZF3fOp2qodNB/T4pU/PY/29JZDYF2SvU3XTK6mZesGu+LDedzQ1zWq6yyaHUz8isVzCHE8d19hhToKkOAFnchfBLANAZ9MgroVfAmPsV1v27WVB/dMAqpns7H5jeZnYgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ0PR11MB5087.namprd11.prod.outlook.com (2603:10b6:a03:2ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.12; Sat, 27 Dec
 2025 11:33:49 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9456.013; Sat, 27 Dec 2025
 11:33:49 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH 10/16] kernel-devsrc: copying rust-kernel source to $kerneldir/build
Date: Sat, 27 Dec 2025 03:32:45 -0800
Message-ID: <20251227113251.773795-11-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251227113251.773795-1-Harish.Sadineni@windriver.com>
References: <20251227113251.773795-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0049.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::24) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ0PR11MB5087:EE_
X-MS-Office365-Filtering-Correlation-Id: c002e275-c489-4553-16a2-08de453bcde4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BxUTDbM6QIRfrnCsbRrhmrnWf2c4LEI62N7TX1T3MWC67hbZAW7lyf55ZUC8?=
 =?us-ascii?Q?8FgUS2MHZApVOnnnlDo38mAEq1VXQaSBqMfmjq3YXLL0r0D6GelDv2sbpkn0?=
 =?us-ascii?Q?3SgrOGiGKmPSTFWN6u8XL8oJJj28Fv6rfsfQUdn1UccG9U8VUsjXPfxf6FUP?=
 =?us-ascii?Q?A6+0+Zby6Mv3RVsdamTaZNN/RimiaW1/YDqUEbJhXGKMAQlLHKmL5NZG0FZz?=
 =?us-ascii?Q?JiZ5HpscSRWSwTxgnJ9vZwEZhAZQrHdC4LOltU7l4sx6sK0YkBC5EQmIycj+?=
 =?us-ascii?Q?mhjUzpoN97w6RNelWAjQobdiePl7dTIcmc6ckCsUawBZBF9nKAT9t4altPGT?=
 =?us-ascii?Q?fajMlPKU1oPgAQ1e+ZGGMhg6WlVofhCchqY1ep6F4VJdf0VG2Kf7loFIS2DU?=
 =?us-ascii?Q?0svXOVAyMljluX/IpuzDArpIu3yQEMCVPnTlJ0l5y/C7JeO9HAafG0Dt54/X?=
 =?us-ascii?Q?+bCwqXvyPyuW3DjtNeiGpwTsQcdUbRG3wBjJo7z2xBqA4Owj2rZmvgD+4Cqs?=
 =?us-ascii?Q?BuLueEjnzj4Pu3g6Jwqrw62dKyHCcNG9qQr1VsGlL0YbFTizrV3m9hSG5fYL?=
 =?us-ascii?Q?2LeA8HlRuaiKOFyyBWh3/5dkJJfiNWwUPVGnLMrr12/hql5mn6DiKcVgJD/M?=
 =?us-ascii?Q?VHM2IcnC7kf6dl5uwHsx8J5gYqupZ71Uc0qXxanTlsHvSeR/GeV+mNG8ZQe1?=
 =?us-ascii?Q?Tt2q220Fs1cfCPZHDEFPL2FoJM6ym2P2IOdj1qhT3bIVHRjkV/TnWK9ZQQD7?=
 =?us-ascii?Q?oa/Q/0iaZ69oBsRVttf5a77pQSTvbUtfuuPtIgLmnIoLZb9KMeH6Z3BCMFPI?=
 =?us-ascii?Q?fzBPkMBoaLg5/DB3iZOKuw+hrzSbnte2w3E6vLZ9H3wXszRdQili9t43D0vA?=
 =?us-ascii?Q?zpAxdi3XdcWYMHUpiGfrJxs2pO+jVQ8Y76EdEm3ujoAWDgN75eZ5raLa2jso?=
 =?us-ascii?Q?E6Gjn5zoABPczww3Ao5bhj/Xi0ixoaiFDCM2AievT5HI2YOGN6KF+KvJxIY2?=
 =?us-ascii?Q?USThgCHEN1c0WLCbTOgnEJ6B/IcbG+G1sIz7yu31dMRH/sMwCxn3d+ol/pXJ?=
 =?us-ascii?Q?GMhUy9LtZ7rtJGYvSnddSDnGWnMSDOKlwPmts6kM9kn+YmanC42z6QM/XRBr?=
 =?us-ascii?Q?5HeFJ9mBERfMg5A5RWBL2QFn1rVTp6uba6dkEtL+rvT+RYTs0w2X0vq71F6w?=
 =?us-ascii?Q?QBlzFpE+lg6HZTQHmyrs19K4+HMXsIWLCJWOpRjSMT5hcgv0cMdWjB58emWw?=
 =?us-ascii?Q?L8Pkc25NeJsOBncld9Z+ghWm1V0QPh9QXCwj+fOGdX9iR1+Hs/pyvIo5xqyp?=
 =?us-ascii?Q?xU28xuwhK7eAnfsU+CPCSD4eEBu2Qq8Ulo91wrYwvg9G/R5BKN+z0FRmsmbq?=
 =?us-ascii?Q?MDepu24fwnD6Qu9kF2ixLSSReY7g1UJzHXp/K1nagmhbzYEQaKbzO2He7ZPI?=
 =?us-ascii?Q?G+3S+Nzn5lvnE+imtiZGPy7LIT0GAZmeP3bBV6Z7maFoi4Z1NF6fUuqq5WaM?=
 =?us-ascii?Q?nZp18oGMg2k9Akrqo2uWa9LRzbkMwCxCTcIa?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xAr8h5piW8TEfLKhUyWASqqrscoNOOSh/xVt//ZGZvtx/tfgh02mpMljxfX4?=
 =?us-ascii?Q?56xJIW5BAbBdtEw7at7gY31FbBqcujzOtwMgE8ysXaxD+YZ6VVvLWK7c+lH5?=
 =?us-ascii?Q?BShg7qH30NEvmLxjw5/8ebmwU0kfXFq0PtkfLQ8tw/CW+QVnOJ/uMOzs5Q5u?=
 =?us-ascii?Q?YroG6v0N9gHBDjoydXo6Th80jaqLhQZib8tModVKjZyDsnMCIsuXrwpdJfxa?=
 =?us-ascii?Q?6xYugU+Gn3N5v1/Zp+NWSZppP3+vaIKqjGji/GlCgZ73tEe0o9XJe8nX1Ump?=
 =?us-ascii?Q?b4ULlZBlXdnRtUMto4WlEM4UE5y33l46PSV9YqUEal/qN+XXU7rCdp8TbZKl?=
 =?us-ascii?Q?HnItqxqfxi96MpZEO9t26SSxgxRsSA5O/fH+aTlNqQk8wg4/OQGqMACQsxun?=
 =?us-ascii?Q?24i4FaxvPS89y2BXXdnJtTxxRWJkG4OYiNGNa8amSzLJb6VqarfAdWamLcyZ?=
 =?us-ascii?Q?wHWvTw2TeIAVpIPTsyfAvBHVNr2eK1KMjC3HjgKt2ERwBsVZ1muD8ZBSeDVo?=
 =?us-ascii?Q?pAaogob6fjoYo93vrvMFJpeHL+Ue2xXzD/wzMPok210v2aE4b5LANR1s1Hw3?=
 =?us-ascii?Q?W3qC3vnThLFhUE9LD61hqJ09TBrBE/zrAOT8d44AU0AYnmG8apop52xZrbzV?=
 =?us-ascii?Q?19KHNZw43r//xrzoOS3PVCHfJQjVwNDd3vTI1dYx8wCWBngbIZ9sZotjxrFZ?=
 =?us-ascii?Q?BfwcD4Yl7rNFbTkeYKKHvOVhvLB/+lq7kM+dx1Bzlhebo+og6/2rYHFWw+SE?=
 =?us-ascii?Q?4zx8Uy5Y5gYpafldrQT6Gku9Auju3c+/eJuBfMTHIVHbLeoCLnnRzcSr+vkz?=
 =?us-ascii?Q?odGQAP/bmTdICNnP8MC9MUJMZqjmmltpDxp1udpJpdApS0sC6+7CARnZNt4v?=
 =?us-ascii?Q?6aoDKiNyTd5JWseIjbjB7aPI0pjJSviUNyfc1HKKpZqxdisjs0dCt9EyLh44?=
 =?us-ascii?Q?H28H13EWeU5qQF9Hgy0vNPGIGnrbwnuK8RAAeh8flpcFb9jB32/kIq0jetWh?=
 =?us-ascii?Q?vacm1ovl17bvUP3MhyAbyOqp08WfBb6SspIP7KHqvdPqWgCxHgc4UGQNM05N?=
 =?us-ascii?Q?BZLj0SMYddMwUPMYGuu1HLZEBqZ18JrtCdM79+UIYRdn8C+Xiq1HDunqejkT?=
 =?us-ascii?Q?tXVInt42L71l3BJT07WyqP8s6YpaboIzLRtB9u7uQFSjvur4SIseC9cbDDsE?=
 =?us-ascii?Q?wJ78EMJ50uyxvWxFvzUoemlJotmO8HAYuVZPi2MfPGLPZU3/nKa6ElFKocaq?=
 =?us-ascii?Q?PZakAIF+szRT8novlO0SHoEzUm+o+Z+XJSt+TQR1JuW5QGU7GvbX8obEuMlE?=
 =?us-ascii?Q?EoX5cazmqxmBrPQ5gHr/IxC19dYpO5+tfvSXk5vgLi+n68siheHJxGOMV0ES?=
 =?us-ascii?Q?xtJdfa+81twnM2gJ0o1jy93wjtqHwdfS3E/+h9Ywgw6AALRYbaUwhrK10gE+?=
 =?us-ascii?Q?QbGJnYlNUoOutKvamcmYrVbp9hTZCt6BT8ZQ+vS/2s7YeTIpsfmVGWUJOSoe?=
 =?us-ascii?Q?AhtPOJaGvq5jfCV0I9gJwZBjRMX3QX02z5+tPDXJnPf1Aa4/MsODYHwDSQE5?=
 =?us-ascii?Q?LLQtkRpl2C5lMRs8E+zJAJ+7CSM64H4OzBuvb9VG/yF+1ZcO4rsaw22cAHeR?=
 =?us-ascii?Q?ulMMCcwcZ8RlUlSXDVpMWqtpqV608EmCeVk7B2BIkGxUtVz2sqdhPioa3Jgq?=
 =?us-ascii?Q?Y1kP+XZG+3pc2m1poeBp0YXUIDqEKVZq/DSmWF5I9bns0mlFMLFFbS/Xh7oo?=
 =?us-ascii?Q?aHy67I+x8qfz7bfi6GW0KTjLKUF+ueM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c002e275-c489-4553-16a2-08de453bcde4
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2025 11:33:49.4109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2R+JTkgpo8qH7KLmbHucTCAzHEp/cFiEsrO02Wpex1KlyJnIKMsgAYXMmSg7IUJm1AOI+ELGGd6IFBhgZUnX9jnkif35V9VqGJxLZqTgnWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5087
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDEwNyBTYWx0ZWRfX8BsP5NwRIsd5
 rbN4RKj3ggvWMZobE4mNSQVWu4DmaFMh0rdwc6SmFRibuKxl/RGqBxvshVqXjf3krl5kIjhB6N7
 Ai9UEw8on2n5rXhcW5T6wcY4nJipI2+l5eba8PtbVeXA8G8pyiGaTjDnqykW8OoOXm89XxbqkgO
 lZktoXtSvARSFP5QDQVRinblLDJGkvRd4MG58KEHBbgxvCOsIE1NBhJEFHkuLLVezjTKVfwRZMs
 8n9Rd5c5eLtCNsa0/+5H6puOlHHDrtlvNSaFUo/DWU63/a/gsE0D+N5KKSGborjnJIh+hc+IJIk
 4TwfLjVsAX4xF7MZsn7imTp3fnTaLTe2r22NXlX4r2Gwfcq0EiiIA26yIDUSkOjhBPQYjMzJRBh
 Bq2EeNbuHb7lW4TyjjThzvt+lN2CYJBwKShD4AmOGA8pyaQ3Rg4kROldR4qbQ7V/ZgvCarx7Oi1
 S2ZOwNUE51jT1fp6zwA==
X-Proofpoint-GUID: 5Ilys2jN0pgGNZ24l6Xb3UgmhVxqsBKZ
X-Authority-Analysis: v=2.4 cv=OO0qHCaB c=1 sm=1 tr=0 ts=694fc41f cx=c_pps
 a=C68BMzITeltispUgf6+s6g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=VriWPxvw67vVHQydT3oA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 94wfbkyiFAFWi5HeDY-Uc30z7LBJpYQm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_03,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512270107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 11:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228564

From: Harish Sadineni <Harish.Sadineni@windriver.com>

In sdk while running: 'make prepare' in kernel-source directory after enabling rust config,
it will throw errors since only makefile is present in rust kernel sources.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 23a9093ede..1505a1d70c 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -139,6 +139,10 @@ do_install() {
         cd ${S}
 
         cp -a scripts $kerneldir/build
+        
+        if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
+            cp -a rust ${kerneldir}/build
+        fi
 
         # for v6.1+ (otherwise we are missing multiple default targets)
         cp -a --parents Kbuild $kerneldir/build 2>/dev/null || :
-- 
2.49.0


