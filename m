Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2CBBD4A5F6
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 05:08:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.232.1768540131523567556
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 21:08:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=j6bnwI93;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54765a9f88=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G4daxn1502591
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 05:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Z8LwVRYORFJqsTWxyKljWwCHMEz1OWOW2utRN9AHe/s=; b=
	j6bnwI93+47HiN6Rs77XVJF6BV7bdoXDDEt23wVkXAAyXu+pW7Fqx+IGI53k607U
	6daFwjUW4Vsuc3kyCa1rV2PQ8F5dsfZu3A09kk9M1yTlOEzuLw4vJgmG/4rp7R79
	M8mZLm8zw7lM3kBIICMqjufPct6bLln7yLt4DoyYyvBqM1m6qAA6pleJ9T6esIU7
	jf9rMr7p2onLcXXeyfLWxlGStfMZ5ZaWTvtS3FLr+lhuxoJXz8Y7KgMuJOgxptvG
	M7L/F6oOWCiwMv13hwsCSS1IRaxCkCtIWOCUS1x+vW2XCC1wUNi3zgo+jLc4bPfZ
	DXnRXZquk0eb+ydyCgoUdg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010034.outbound.protection.outlook.com [52.101.61.34])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bqddvr268-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 05:08:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NQAHd61qvC0tQ6rCmlfD2lYxf49JUnLErwU4LAAH+xj6ODUhEee+Dd19O8Sb5bRhNN0lYauYskU2GiKm0+r3GrRpUC8BUHpcehOFmNleJZCaZb5md9VKNOLG4kMI/LGXdPqp5mxq9lL+W75WMXYqt9hE7mQEoQlS8XeP+VwD+P5LsSV61pcSyXKc4so8tZzODAw+t6BpYV5pc/EgLvL9Lpd+GRo7BHL+ZCFMKhR5HLKcx2E/GIdnmkOSNR6cKas5AdDveXRZENlZxwWej8sI8sXiIVFVfAh1GajPDu4+hrJ6pZ1T9JAdCbi0UPgVGbixcQloH6naVLonFjqtOwifVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8LwVRYORFJqsTWxyKljWwCHMEz1OWOW2utRN9AHe/s=;
 b=lzMgQFr64lFr53ZVyotipOqFPFCy8pqb4sviC9DZo7H8CVEgqLDmOyjiHFdhFp8b249qtswnxS0YLFTfxkepYjsb8WuYYVuRfnYoVuwF5kaTxpo6NDyWypsvVZBrjFG8yS4dMH2ZOS4nq43BdJaqGSQjV6gVWzJf+hPaLVfa4w0fItCyygMuIpyf04d3Nvxk/0jvIR+adYA3l6sPexLarKcZICSI+1c2puwkDEcKjRd50HqZ3tSw3ISc0MjysTEW5lfi0iDyNBiO5Q/0kY9h6hZi1ij0ZVeb/aJAQBHds5XDJ2ZQgOz1tvgWO+9DQNaMdW6+D1Vt7386QzR6aD8pSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ5PPFF9DAC6756.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::863) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 05:08:48 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9520.003; Fri, 16 Jan 2026
 05:08:48 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: liuyd.fnst@fujitsu.com
Subject: [PATCH 2/2] epiphany: upgrade 48.5 -> 49.2
Date: Fri, 16 Jan 2026 13:08:31 +0800
Message-Id: <20260116050831.2356718-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116050831.2356718-1-yi.zhao@windriver.com>
References: <20260116050831.2356718-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::31)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ5PPFF9DAC6756:EE_
X-MS-Office365-Filtering-Correlation-Id: a41d8122-a071-438d-7bde-08de54bd54d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|18082099003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zGzUzlqmjN13RsYb2BybZwZG/7lWJc2gr0X2goo1LBepTZiTEmF8/sZzZJTw?=
 =?us-ascii?Q?Ci6tqMOyfDPtRff1jxHmcOh30lMpktV21J4FmtluF7md5Umzk7PPaRVO9Mgp?=
 =?us-ascii?Q?92EhY5+bxP+mLPB41UCyVA3EjBKnUSj6MEDXD92iz4C629k7c0yg2pnL1aaF?=
 =?us-ascii?Q?bYAKUaZO4k03QNOBcq4uyDtQU05H5njAeivarWYEaTwtA+Pj+MYBVtBZoWoX?=
 =?us-ascii?Q?mr4jVr9l0DV9BA8aFRjRp7mOE1Li2reDIiQnMiHq4msLFbOroL/0xD5aukE+?=
 =?us-ascii?Q?fPdS/Gpd9f+NPZVO9XtyJ7FmIn3+QsFvJP6U/jb+LJiamPjerAVZTUqFR0G+?=
 =?us-ascii?Q?xr9OssDNJiXAvwWKaoPp6QhITbmkK2waXbCZH6YDjyF7/MDOQZUyNsm3jzm+?=
 =?us-ascii?Q?pWHxk9a7GJXLT+cV37lXCa+F6lx8XMfx24POqfbrT6ODEVnIXYU0V6YwRjIE?=
 =?us-ascii?Q?1mfo8y1/xuWIkagYK/LplRzwWDWyB2tC0nr17tX9Ie2CZKh3A76j0tztgMrW?=
 =?us-ascii?Q?kz8joprVg0e43OuSggvRmi+3xVZCrFy8P6T3LvIcJEHQxEHIXZLGdMaVCyZO?=
 =?us-ascii?Q?JxndGMWIPOb5PqnBzHwiBR22quapXdmSYNBQx7SPq6by4nd0qEmCwT4FkOGo?=
 =?us-ascii?Q?8y7mD5o5YjsTEhQmsCBSvaWk1Sw89Ir5MDRqv7MFJg/8YfBftD538op6PQR1?=
 =?us-ascii?Q?Gl4UQixO7eYvRp1YQuUHcreGPi63O4RSMJIiOdDN4fz2KKn/11btIWE+lV1x?=
 =?us-ascii?Q?MKPCcwQw4DQEbwQCDB7f0f8H2d9UpB+v9UTqBiREUfRY1FMeFpMfqGf7bX8E?=
 =?us-ascii?Q?5pWVrG6Vau3K3BOTfTFSMR3YAV6xoerpEpvCM9ud+ZvaoNz3gsViFSt2ltvX?=
 =?us-ascii?Q?NDHs8zkyxFsG8yJ8ZYjWBzugSGOgLbVv4xUmSO+GV8dCKbTjd7vcXXLpj0uO?=
 =?us-ascii?Q?xht26uRuQnQ6csBgi3T0NteNxy2xY0u/6JL+80ns375pqr29KJZnhuYLPlUi?=
 =?us-ascii?Q?AE6thfh2REcsLuBxXKgZ0WbjFudeSDysa5lYBulGOxitlHmnW+vIiDbARQdt?=
 =?us-ascii?Q?X5+cI1Afn2VN+aYcLyhPSVZP8O41VuiVh6s9NyO+VHaf6jY53Vs8h4IRaHsE?=
 =?us-ascii?Q?2j4ram6Y4WG2FAZxY/robpe52TYBeZJ7AL0xSwgHDsVo6YHkL6a6z/i1I4MT?=
 =?us-ascii?Q?5KFHQPJk7oYxvLeb2d0NIu1eDH2/Q2nEheROv1wBr7omdgpGV/TMBOPt2w6T?=
 =?us-ascii?Q?ZGK2ZESNItov2uvRsRWrrIPuo4frKr4r+JEFriVd0l+gq/o3BonWbJygmp55?=
 =?us-ascii?Q?/uBGn4fAq1kXucS4izTPCTZ0zZH0OpK5tuGVJXF/GSIn6M8XpChgmQmJ/ge8?=
 =?us-ascii?Q?irOxu5COufQYkMl0R3RnwUTkAqDSuV4qxDoBvEI1U/VKmbrnJRL04BxQjq9W?=
 =?us-ascii?Q?YO0zWaPUSYyrDSdh+gyIhQMjOcZkyqtefPVn5p8N7D15U5vlPdFVuoNFkOpU?=
 =?us-ascii?Q?lVSJXCBZ7B1WkY/HaQsOLVxNEOsioK5opOngXeXH1Pc1LbH1SpJ+qt684BGn?=
 =?us-ascii?Q?k7FjKpFjZTSA9nqrzmCL/zAuiDqQVpqM97X3Ur8mSrAyHXS6036K2TIltIMU?=
 =?us-ascii?Q?SS0smO13kAQb0HusPQFJTxU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(18082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dIIxBDgu2h8pTmLX03bIqIQSlBA39cOPbdZZkvNDpyFBqwpRLZHCFQcypT99?=
 =?us-ascii?Q?EulqfA8Upa+IzGSszX45xxJ6/Kfdqe47EFkJ6QcWpPKjXyr8u017QkpXGHQE?=
 =?us-ascii?Q?i/ldRHh/M7VVFLl/OVWZsR+cWJEdaxZM0QI8p9TpdG2RZCHLxAjYdJVXnfCb?=
 =?us-ascii?Q?xhI/n+oU4PukaRZqic86DnX8jUYbme8xpUelveIJFmsN+VSR2wZh1TtZT5L9?=
 =?us-ascii?Q?z15yOsAJpT74pbk9EfBRpH5QLVFfu+u7BiE8f/olzl561OXz2zDuceL44XaK?=
 =?us-ascii?Q?WCLT4Vgl99H5uiRvFraWi4BaV+son8HR2RccPrZF5e5P7VxZ8eEMlyEL9t+t?=
 =?us-ascii?Q?tc+cCER7t4u+/isFNAzdl3agvJ+m2NNC4ZdNLpHd3fsFH1PBhIq3gfwLJUIZ?=
 =?us-ascii?Q?zQIA08ZWl5L8wImlgMMcuAmJRRpUp/ccimPSGKcUDbE3Tal2IGEm3N7t7JWl?=
 =?us-ascii?Q?fdBePKgJayiIBF1CUQ3zUSjneT+f6c5OUOHaDqJ9MsFHXgHjxzCsnOa7D27/?=
 =?us-ascii?Q?4ejrxv/L5kCWtxr2R8AP21fTCKoQiH96tmF+GNg1cBa0TAMlQssKa9yvTbmL?=
 =?us-ascii?Q?AXkV/xNBqV2KsZfL2OKOxDQTlCkcLBKIOEiD3x8eq0DNdQcM3WNP7Sv5D4pH?=
 =?us-ascii?Q?Rlzc5gKeWB5bCuKOtCoTCursPCvQcsVsjRHA3oZ9WpHqxs7rrraUSrG72Tln?=
 =?us-ascii?Q?F5dlrwY76EqOcot51ASurlQixFUAU1ZNvY/J5RRzUcFwKIy6p10sa++YUqs+?=
 =?us-ascii?Q?9RWreh7AFYTpkI6RyGKOBGP44CXo/Q0omSb6CBIzfQAECj5O+OLz6/T6UZwF?=
 =?us-ascii?Q?h1FrVVtl+asoSXXC889GhGtxNxNmSWgTk+VNhcfdlEmv1Y8S5H8mUukE66wg?=
 =?us-ascii?Q?6UUNcOmhvQ1nEilqZOe6TsFs1a+ic4BAhwVQSzFkDSjVyy9RkqL+nWr4FTFo?=
 =?us-ascii?Q?RzBWTKDdpBn80maWmx/BgszOHbF2U11uuraPIUHwDpdgKuyzp2z2HcRAaE4r?=
 =?us-ascii?Q?wIchwqMIHTskcjsMr0p948I09sWDkTTstWU1CCNKiCHsqaBNMGDh0nC8+q/m?=
 =?us-ascii?Q?ItXXm98TXrlT21mSmnetMmZffurxe3rF6Kj5QGAK8K8JUzxetdubXnU52t5t?=
 =?us-ascii?Q?APXBu9HcksHHU2Y298RRo9p83U7dwev/ZB5yE++P3avZdWxUDswGcwOh1M/7?=
 =?us-ascii?Q?ftSKaVZJUFoiAhw58qZlRgGRf/Kn0uVZBYQ6S8ntXsdbJehIxgU7FcaJxo3a?=
 =?us-ascii?Q?i9tF2+G4fo5qgwGxNP4ao9/KsD1QLVSSE11lQzkKC7qNwMVip4NTVwsiJMjo?=
 =?us-ascii?Q?PnWvYKjA3egzQw2mVBGJ+wOaNHQFMyD2LZkr6acDEOobuWtP/blil2maY/Ga?=
 =?us-ascii?Q?drUFs4RXR6Txqn5WKNWZoB/9nzeaILcMo11bfJk+4FVEP6ewW8lTaMPR4O45?=
 =?us-ascii?Q?Wc7DKNjra1Zx+W6FL4QtcqGcUd0ymqv6BiOHKR6qTcw2nK+oN1+ZXWPXBUaH?=
 =?us-ascii?Q?wD/eEpgl1tO0SEK2FWqJs0nonaCFXWSrtG/wGUbGNjVQWS0G+DBdE29nz7oY?=
 =?us-ascii?Q?6aGKQm9QGTah2FVL3209hQSKJGhT2lgDZTeN1cltRVpIJcZg2pp06E8hZlUa?=
 =?us-ascii?Q?yQz434Lji2/LbY/OYfxhznL22vWUt9Slmdde8Rgv8E6AMY60TNtCvuRpuP2d?=
 =?us-ascii?Q?V1e1VYb0ppGhd1k3HfNLJ/4AOQpk+yjIAbGDHckNj+1QystLAFmwRY8/E7Kv?=
 =?us-ascii?Q?1A1n1nrxPg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a41d8122-a071-438d-7bde-08de54bd54d1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 05:08:48.3251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Z3PwJ3CUhycOSMhf9xbcUC1B0LvhLeN3lIf+OpQ1W0anwG8Wnk7htn5Ly8aoO6l9VbGAhAFZqGs/9rrlRC8ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF9DAC6756
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDAzOSBTYWx0ZWRfX9B3mPc3cUWKa
 HBbsLBwka3EIzj+7Wa/1Mi32YUVQc4SR8tMqFrIlgYMhPRAURfNaQrFlbGR2ZMqD9ZjT96VaxVS
 YEYg+rRqe12gZ46FKwOYb4VC3C2vpF3htifJoHDw4vARRjI0Ym78Va6GIczzpAN0QnH3V451Hkf
 mHFo/Qf9eSRsRr0jqr6DC8y7m8I/l9XmSAcdHdwgYMMlzbUmxwh4Qu40a7Ezb/+xfkHV54wGUXF
 zFmVM9rvNLl4QmE5SLWiDuqKUQKZJuzZydOlAW8sWke0WVhnJizME9D6RS+SM/5eTQsC/h46fqg
 loYJeyWgPDRlwWFt5FigyOX3bt+QwV0DP/ooULiWFwo5ASVKPCHBHlCt2pMHRhZhnJRSrYoGR2I
 ZyfwmV/kg8LCACIPc6lAllKZXoRL/z5VTBRN58dl+WKwSAsJJJL7DOiBvjnDOOOjjCrwEEbB4pa
 YSa4jvjo71sxYBI9KTQ==
X-Proofpoint-GUID: i_19WUSMHNvzMd4D528Tro64Fr7NE1c4
X-Proofpoint-ORIG-GUID: cr_eLwZET9DyXgmxGVFE_FECPLe0bid7
X-Authority-Analysis: v=2.4 cv=NqvcssdJ c=1 sm=1 tr=0 ts=6969c7e2 cx=c_pps
 a=IMbvhL78Fdh+aiPumIwVPQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=ACvvd1FpC_yVDdpOqSUA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_01,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 05:08:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229522

ChangeLog:
https://gitlab.gnome.org/GNOME/epiphany/-/blob/49.2/NEWS

Add a dependency on blueprint-compiler-native.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../epiphany/{epiphany_48.5.bb => epiphany_49.2.bb}          | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_48.5.bb => epiphany_49.2.bb} (88%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_48.5.bb b/meta/recipes-gnome/epiphany/epiphany_49.2.bb
similarity index 88%
rename from meta/recipes-gnome/epiphany/epiphany_48.5.bb
rename to meta/recipes-gnome/epiphany/epiphany_49.2.bb
index 6a1abdc553..4c27a6b6c7 100644
--- a/meta/recipes-gnome/epiphany/epiphany_48.5.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_49.2.bb
@@ -21,6 +21,7 @@ DEPENDS = " \
           glib-2.0-native \
           coreutils-native \
           desktop-file-utils-native \
+          blueprint-compiler-native \
           "
 
 inherit gnomebase gsettings features_check gettext mime-xdg gtk-icon-cache
@@ -31,7 +32,9 @@ SRC_URI += "\
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "0f66552ad6593c7952a3ddee5bf515656c8c434871076d9f1a91a7af9346b1b4"
+SRC_URI[archive.sha256sum] = "b3ba3d68213e87f81f1733e85500c37b82b5938f9009e4fe89994963d5fb2b8e"
+
+export GI_TYPELIB_PATH = "${STAGING_LIBDIR}/girepository-1.0/"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
-- 
2.34.1


