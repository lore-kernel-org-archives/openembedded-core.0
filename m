Return-Path: <john.ripple@keysight.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51904CDB471
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 22:57:43 +0000 (UTC)
Received: from mx0a-003cac01.pphosted.com (mx0a-003cac01.pphosted.com [205.220.161.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9330.1782169061839167702
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 15:57:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@keysight.com header.s=ppfeb2020 header.b=B6HjUQJv;
 dkim=pass header.i=@keysight.com header.s=selector1 header.b=dbg4vMWP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: keysight.com, ip: 205.220.161.93, mailfrom: john.ripple@keysight.com)
Received: from pps.filterd (m0187211.ppops.net [127.0.0.1])
	by mx0b-003cac01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MMTZvi3063553
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 15:57:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=ppfeb2020; bh=Onhi2fgLG0rVuEmfHS3fJz
	WVE8wI8nR5d2IvVLx8EcM=; b=B6HjUQJvOtAhF8DGfmMSmcsCBPS4S3wo9XYw61
	UUJ8V6GZ1z8lmmLEZ/i8gpreru80UGQpd3DJ6+7u+fn3HENZIHB6tn2OcnOHaFTY
	XDGpXnU2yU4sZ4V96Y0MiOLjfBasXnm9NtZqE7CF0Oez4m/DHLvM0yxNPQy8Td8V
	dg1GhQj4pjazjnyC8OOEypJjIINOK2mt1p1kYIklNvSAh6zcf2heGPT+vWZ96KyW
	pAqHiQ+zYFp/T58Iv8Zx8nGLnV1tyXnJIsg7Rv8uwMOhcXkPa32ueK1H1kgmaAf3
	yi9awiacsDzQXHzdf6iMPqFMuyRJ/5AqPZoSCUfY+SxJ6fsQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013020.outbound.protection.outlook.com [40.93.201.20])
	by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 4ewrbt7hj3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 15:57:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q4FL4LdpuzFJijXo3+J+NqOEWJyC5S5A5EMSdCwlI7vfuQP9ooaPlkUPTEiWzB7InsI4V7KsmpPI58CwUPmX1MWgAO2abSYvuW45LdnjLvhJBXMmv0GXmon1B5dovtXL3OSC9n8gB2gWMAp0oS3ath8x8AKYXIpoLNqxGj4ESl9aosmBRmk69jzuDz0fyWs/jWEkZDuBpEVvNM6LfzDEjG6nQDoeO6sKEtZnk0ViaIsWH2mo1txN3Bbt1LhjLp/WlgAyhXAwJviq68EgcOvkOdvrwE7zEfNqS5A217AEGAj561XjmQQSPNT+RHfUHMhEAbtBJ1xiVj1zWR7UMUvD0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Onhi2fgLG0rVuEmfHS3fJzWVE8wI8nR5d2IvVLx8EcM=;
 b=HlPoJHVUnYB+bn4OCdg4YNrV2AuBKe7ID3j0q7YQlQGhAc5s2to0LB374SLcwv8WhiSV2cLMaMh392yT4KXtGJchxEJOCCJmD8QOHDagu/PawwgylMXI7872gdvCX3DoWY+2GXFlNWD9OUafg4vKhRPnDsDeo+svPaI60lKwGLi4d4zDnBL+mG6Jp1z1AD3SzAXD4vncaSTRo15JievRyam2Go8t6yEXddsq/pxCsIt4ZyAZ85DM5iAyy/OCMJ5NwS3YqRjMjc2nv794trqBSXnZV70Ane1ESs9iGz1ITRm46fkGoZk3MX2Jl63ZRe80NAkjtwCaV2vyW05UDHEIpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Onhi2fgLG0rVuEmfHS3fJzWVE8wI8nR5d2IvVLx8EcM=;
 b=dbg4vMWPAI/dDl69Vb0DDWzYmm8Qs5BjSgzlfazgJxp6bJ6t9wYs512z2SaEcEl+aGa0oynPsFwaWtSOKjgs62WpHVO53V7w9/e5wZ/2URS/JEZrt8LrAu5Zzb1X3WeKqwRSC7aFd7L6jvM7LtQChnIbQcwO1UI2lsJZrkL4VsI=
Received: from PH7PR17MB6130.namprd17.prod.outlook.com (2603:10b6:510:1f5::17)
 by CH3PR17MB6241.namprd17.prod.outlook.com (2603:10b6:610:143::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Mon, 22 Jun
 2026 22:57:36 +0000
Received: from PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2]) by PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2%3]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 22:57:36 +0000
From: John Ripple <john.ripple@keysight.com>
To: openembedded-core@lists.openembedded.org
Cc: John Ripple <john.ripple@keysight.com>
Subject: [meta][PATCH v2 1/2] go-vendor.bbclass: Unpack into BP for destsuffix
Date: Mon, 22 Jun 2026 16:57:22 -0600
Message-ID: <20260622225723.3746582-1-john.ripple@keysight.com>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CYXPR03CA0063.namprd03.prod.outlook.com
 (2603:10b6:930:d1::25) To PH7PR17MB6130.namprd17.prod.outlook.com
 (2603:10b6:510:1f5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR17MB6130:EE_|CH3PR17MB6241:EE_
X-MS-Office365-Filtering-Correlation-Id: 7867f014-1e0b-4452-88ec-08ded0b1a6c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	YTbPIm85sfMPwLCySbvOHWIAcMTt1bSobm3pHxHfWPPA8sdJrEpOIqaMHhn2sUzItDENawwB8Q0FyBdZ8yxsgkmBK4SQiHk1Tx9gcjqS02yp4HwZkvVFNlY8YR6tR3TYwKZrRNK2QhoOBQqOWzsJjRdISiCzJrIibm+ep4AfuhhhANlbK9tTnm9GAFK+FVfTRUL5U3CxpZr9wbYvUaNJZBxAzgxaJNT7tnTfeWqsi1FjgE0vPZVIwdw59IsGoUXWtSe3XB3qV/ajoGgXGF5QzC6qE6eK/GT7nr+ioUhauFsrMboXsTDVz9lyP3MVr6Y7ZoSaCXf8E8SnbwGYPmePAnSNFPZ5zcGwHjIZp7Cf7brvIdTVi0y14G4v2BW1EQ6F1JsroJWQWIPRp9GZddVkINQ++iyjF4DRnbC5VrB/UCdlbvgJmPRhi0wlaEXG6rADhDrSbPdXvIwz/pFCzseLiK2h50R3Fd9Mx/oa7hX2F3POyuLbiTFAfj6GzyqmlL/flUQZ/CjPhTDZHg/HkzfZuRj+701hA/7VwoRIGqUF66Wx0MtZdK0paDgCQ/AOGRP4bF+Ggz8N+rfgswP3wxW69rvFH6yxKQM5c8LwmM7o6uPGYDQDQpBo/ZnJMQVpTheTZCaEIWhu+aNiFzdG0y9tI/PeH9Cd7SPN0q1VwtvsH9k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR17MB6130.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xTfo3ozSDhqVNTS3jbMwAtDtRREfeGlq8W9b7494lsUVUnOGeI5/tV15zcT/?=
 =?us-ascii?Q?H0hy6BITHzoqptQzBVPeG62cFOVqYM+Gs5D9B0BTnw/IWCoorZ6yiVoOpquu?=
 =?us-ascii?Q?/KlqQyVb1BGFhqsLSxKAYYQsXCMHXH6/scWh7l7Nhj/LoP6uNsSG8oebPHxg?=
 =?us-ascii?Q?6Sg3rZ3AsCrUsXXheL+jv0rNMVHJOgZM+L/FFAVJmqEkw1XPJaLLrvoNaflp?=
 =?us-ascii?Q?R52XzGjRByG5wyBixMUn1iMrsIdkaqTrtswtOUSRUEbs6Akvks78Q7lkreQc?=
 =?us-ascii?Q?zNllABLftTze4ZTT63XeOWOd4YKFPEozaCe4c4YMu4eGyB5kWZhaRBU7tVhn?=
 =?us-ascii?Q?Wuh0ZNZLsh7v3Hy5nEEVWHClRiG9K/RAfY9YR1mgbRgVKIS/wQW/O0qyl57N?=
 =?us-ascii?Q?+msoWlE7UEiUFHfGh3gq0IGIWgterBiZs89IvMzCSrDUcecpcYDrPdEGxz/q?=
 =?us-ascii?Q?0hH+KR+B1VoExlel5rGjk6FWyNmdTT52Vr1oB/8DvL+tcriaJOd80S0J0Mpn?=
 =?us-ascii?Q?hHxkXkYmRHkd1tMPRu5QtKv8mp3+DoWyDeSwVBh4tlPIFVeIQjYj11e9o+HU?=
 =?us-ascii?Q?PzvIIEDJDAdjocrsHcuZJh8O2mC2LidXiFysRWaa2viWskMIDm7/7LrUJm7x?=
 =?us-ascii?Q?tNaSrX/EyDGrNMXamHN3Y4mMcWEfcAe/sPlxvo1jV8MVUrzQfYz9u6ZX4ciN?=
 =?us-ascii?Q?UpBk86XI6fki6MCahagAOIcnSgFFVnseABrZfNTIQeJzDpDiKIipPMhsjwBV?=
 =?us-ascii?Q?7XYRSYqcLMXn+FVVsK3lrlPylSKUlotOfNpXyLb/QaJGHbINDLpD16NKt6gu?=
 =?us-ascii?Q?S8eHzvrxAiB1XI1cd/u46IwxdWsYZ1elH3RX0IgIeh3WaY174I2VuwUMug+Z?=
 =?us-ascii?Q?4sX32pO8ldRebAoO2KRnJldFylh1qc50q/LuRmm8jRH6714Q2wwTliKKejnd?=
 =?us-ascii?Q?UuaAaGI4XFvvv7yvK/Bo5ItuPCT+hHZIrTBXDeDQPwMp1o2XTvNXfYwaFahi?=
 =?us-ascii?Q?uW+xUM8fKbdzZfwUaZD+Il5L6+oPbuZfkR0c/2W6cZQxfiImwIWFB/Plj0ZG?=
 =?us-ascii?Q?RRdY92Qdfhg+qr5OOiz0nDiI7I33XM9i4tom7FDN3IxjHPANfZKw9LWnRg/t?=
 =?us-ascii?Q?kGKCEDaTptj9FgiWWZCl6n3Zxf5By8xWtnNly3LOlwvOnKzEgM9uoqlnCS7R?=
 =?us-ascii?Q?C1VuSLjyTcgNI2wGzg+SHakS/UHrIXcudG9/Yy2M5bB/+NCFm6GcN+PmvHV6?=
 =?us-ascii?Q?TMvMn0f/W0XNTQbN2UcyzQnfhYfQKPA9Oak5YIuPRFFZgJB92uXnusV+QEzz?=
 =?us-ascii?Q?vH4aniz4YbaNfDBUyLdg27o2HQTeRWX/v9aQ2MGXxirfjcir4aPFZaJVftnv?=
 =?us-ascii?Q?NtrvwWJqz/ZUwMb7ScwDH5uyXqEbVvBLm/ZP37fcmoXMLU6+Ft6vcuCokpJN?=
 =?us-ascii?Q?qUVKHlEfVPIBUSDNKabbBUzAp8Nbx7+1tmtdaYcmDPNBCZeKOdpBksiQbuh4?=
 =?us-ascii?Q?nkmL+JhuUAvuGgLjwvqO8PiYlWkmrYUWG2iNuaDL7fZh1FWGaze+2RmbJ2Tz?=
 =?us-ascii?Q?HPsLoB1By3/fzaei+Bng0VzfQWK5prBTHxvlH1Ce5XWkuznCcFca9DTDCjfr?=
 =?us-ascii?Q?ycwcpRMX4hKVWGs219ydKsqs3dzoyl65aep5uzXIfjk3R679+gedly0oAklP?=
 =?us-ascii?Q?jLQBf+JQZboqo+NKH+DUq3cFblZY1oeJGdaj5tAgIfXlnvA0VeBDp6k6BxGN?=
 =?us-ascii?Q?qakThd81Yg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	CgKY5UzjLvcmxgoj6iUbE+nwMVkSM6BvXotmRu7yvL9eA+6iTkEAxoDKpCNpGfWAHVD17ZYroBNNnzDlqg4Rln0yp3WEkma7FJ/N/zn7GBtunIEYW/1ycsgCx2P92JjYWuhjDQaVrfDzLQvFTGdGNanLlMrseRkkyFxjhbZIjXKr3JkkMgEZVJk3IsHFAw5Oee7FHH9HIyeUtnb471WXXj+6k7Gy8atLa9mwU5VjPWpBNIpRH2iG1yDfyp5HlaDFhSeDS/igsT45ZjB5ir1r0pQDOYnkMyIpgrk2wAjJRqRbkbhLsQNNpTTXxIr7FVL9wxRA1Fctnu3PA3w5pX8Rww==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	wlIT/90z9C2xb6Er2cbRm8U8FUoIP8i64XkJW58PE/fZuXJpZ4F2bEpoimcLNTDCGfbLlqp0OrPjuCJAvZL22u/b1x/ylkhBxvrhEZDPfOnMUCXsX2sp/sUaeElc4ZV81wS7pA2tyW7l4JH/DfX/dx5bbghJi43pdmieY+qUBOyxp7Vvbo0X/tOMG9bIBLlFRGLFgDrswPfX2d/JZ5DZPG/V097g2zQux7xC9H4BWJc0NrIU8Wq0Wu6ujFjtyl7COzbA8+4bGmsfUAyTswctGAziKQy3INITrID6tH6JJ2YDr1rK9t3h7ulPReq1Sp7ig4nt32+UbajNlVN7MKpmzAvP+mWR3kYtN4NbZPbZetWkjTFOVFQSLsWBD83kflWky9oTvNmFL+9+Dr9FNz4kIc+RCB0i94FDzhsYKIcXxkKSsae+2cqBio6MdZCQz5hahlvMjx3rRV1tcMpMIAA95fXpmTlOzceaYFlJi9QVwA+CDZRHyZcNQxwEC7qKf6Kb1Zm4XBtSfTGxmAPTXcpxKvujrkkcHUrIbl20DMWc7DYwWCrpNmLCbs1+Hcq1hl/D25Jdw+qsF2XMzNZBBBs1nsfF43kxUFj8jRCJwzhgLnlRhRVRogiP03Y68NiJlVbB
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7867f014-1e0b-4452-88ec-08ded0b1a6c9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 22:57:36.0840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZNXL+TyYEgMq1GPeJl0Yl3BFWkU3tOo46t7dxoJOGrQ19A6RSz0UiHFIaU/T8lTnzJi8KkDFTWUVLRSLM0OKITpaR1Q72UprTMgBTTvMbqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR17MB6241
X-Authority-Analysis: v=2.4 cv=dfywG3Xe c=1 sm=1 tr=0 ts=6a39bde5 cx=c_pps
 a=H6CWIJr9C+/oc5/J52O/6Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=vu2TTH8h0NUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=FLoIbiw2ZNY34kqd41oa:22 a=Z6MDKn_O4FAsc8hf148Z:22
 a=F6MVbVVLAAAA:8 a=RHezoNOrqTe-SeoOf3QA:9 a=6mxfPxaA-CAxv1z-Kq-J:22
X-Proofpoint-GUID: v9xUZESu1qowgPTQn-jk3UGa5CiNGWSt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDIyMSBTYWx0ZWRfX+iynQfG2FILj
 YIIe3AnS/jre8b9nC2kyLTpPKzYydxA+yd9UNrNgcDne/vIN46xz9AA0TCpLVWCjpnD+CozadYM
 L5tIuteUFDfohg/pm5nJ0LY6Jb4YlvGLbtN3KxSe4DzM4qZYX0Rq
X-Proofpoint-ORIG-GUID: v9xUZESu1qowgPTQn-jk3UGa5CiNGWSt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDIyMSBTYWx0ZWRfXwa5tJkPNFFAX
 a4pQMfmQkBK4BEl1iAiw1WhMX76oiybLjaETrWd6Baw68QW1GKwUNNTB8lvofr0lsM8Lp1Ih/mI
 j1efqIosbbgxpJU2LHEh35eQ80WNOZE4HO7WLruOsXCXHJsBJYTF7zkqDt7AiPTaI4aIqCZxsxl
 SX4GtvuZeyLZRa/gGPlu177Nl60WW4dW4BKzLGEwnRGBOH5+9URXv1MAkAzC27r28uYV0bSFo+V
 5Il+NuUgllrPHSaFdaP0MDlCZixmhQwi5nq4GVLisFfWRcKx09XGFkVs8uC8M0uNYSBmFss3G2R
 1pReyDeRrmXLWuu99kNTOgjxOmuyGjPIo2yjHl+Y6kFUKfvG7mBJ4DyhoFpy5I7Yfjm9dMUpaLx
 x3jS/rJCCOichidp+iVa3TCWqwV3q0GR77b6Jqlc4E8EZaZzzJmyXrIIOWgneau5zDn6q5flgQ4
 EaPkwEgcUb9k04mOBNg==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11825
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220221
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 22:57:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239320

The go-vendor class has a hardcoded destsuffix variable used to unpack
sources fetched with the go_src_uri function. This was causing a conflict
with insane.bbclass which prohibts setting S = "${UNPACKDIR}/git" which
was needed to find the vendored sources in the hardcoded location.
Changing this unpack location to use the standard base package name (BP)
fixes the previous issue and no longer requires manually setting S in the
recipes that use go-vendor.

Signed-off-by: John Ripple <john.ripple@keysight.com>
---
 meta/classes/go-vendor.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/go-vendor.bbclass b/meta/classes/go-vendor.bbclass
index 6ec6178add..f854d14bdf 100644
--- a/meta/classes/go-vendor.bbclass
+++ b/meta/classes/go-vendor.bbclass
@@ -19,7 +19,7 @@ inherit go-mod
 def go_src_uri(repo, version, path=None, subdir=None, \
                 vcs='git', replaces=None, pathmajor=None):
 
-    destsuffix = "git/src/import/vendor.fetch"
+    destsuffix = "${BP}/src/import/vendor.fetch"
     module_path = repo if not path else path
 
     src_uri = "{}://{};name={}".format(vcs, repo, module_path.replace('/', '.'))
@@ -58,7 +58,8 @@ python do_go_vendor() {
     if not src_uri:
         bb.fatal("SRC_URI is empty")
 
-    default_destsuffix = "git/src/import/vendor.fetch"
+    base_package = d.getVar('BP')
+    default_destsuffix = "{}/src/import/vendor.fetch".format(base_package)
     fetcher = bb.fetch2.Fetch(src_uri, d)
     go_import = d.getVar('GO_IMPORT')
     source_dir = d.getVar('S')

