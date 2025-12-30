Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C2BFEE01FF
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 14:17:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64852.1767104214563663067
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 06:16:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XY0X0FvJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=54595b53fe=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUDe1uL4048865
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 06:16:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=1hgkzVh45fB8yLND+Nro/r3sd+Y8J44QlEFsNoxIiSY=; b=
	XY0X0FvJ/XOralCGxu/lfZokwm3MT/t5D1V4CKKJxquDASe8hgVDTO+TjcMQTt87
	Zt5B5QyEnjRpaTad/42NKMowFuXoi+nRBAwvQ6Z5B4rP/yJzSl+LFx3DrRheWJAl
	fkfAKsX8zBClRk8S/FkT3hBkxDTDHeFXKqOwmf9tuomRTUQyS6Gfvk9ATao7UCr1
	Ytf0kwCqno6UyiXBeGxIqNtN/b8AyO/cAUiVGPVRheKgP3lQzFzscN+uuoDyzk7y
	IfwAxXTdIjWM32u8S6W8CPPLAAEFQKLyKvNLGpGmBU1DHEZTSCiERTdbQIaP5A35
	IQzUn1PjmA3ca3wpZa5x0g==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010066.outbound.protection.outlook.com [52.101.193.66])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4babm22rmt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Dec 2025 06:16:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GnDt9eExLQXmqnx1nO7is6W/QiV6WywIS4tdUBdN6hUK5PlTbpBJSzd1RMo/WlBg3ICAAqGKNyljNPo6qkkDRAx4ts92IK75T0IdTcl5uzJ9FTuNRzk7cJy+eXzApMEq1EnlRPKyhw7eKV7wW6XEDHz4X8zlKQdhdNlkHK1C1lcRJyCzeDclCVd2w54K5GiIsMoixppo+qS42zQQ+xWZa09Do/UrDgonyf+5/bI93oajYv6Gn7Kuq0zbAVXn3ISLCY+xt9q0xU34v/Mvxj6ISpjeE1b3TOF6KsjYv/8Pspw4KOBtoSiZEjO/xs4VS2iYpRg9TVdm7pTg7/Q1uJINew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hgkzVh45fB8yLND+Nro/r3sd+Y8J44QlEFsNoxIiSY=;
 b=FSoL+eGiLMLaaAcfnIl1B1USmp4HxG2orD+V5p8AQUaccjJQmvVVQlDirazXzCPSYYm/KchLugMMEriBJlOFKhaEWL8zs2Vq2A981fBeqgBa70B0FhZvrgUUPtjR+ZFWpYle68tl7wcDnA4XThySGKx/eIMTDaF2LNX5fOEhEsQDsLxW/ZeW4NYOrVvyQ/DLy2zkQY3JPt3ZF4oYQ96zH3214uSaotks1MDzXbUoWkID7Pz84KqAQH9iJB0R/p/vEZgZ49tekdVSD7sYnuiQwg6j+XgSFsVSYu+Ao3wPScjenWPdKo+KkrXUfNOkbzTAe1zUNC4r4lw2PM8KuP1J4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by SA1PR11MB8859.namprd11.prod.outlook.com (2603:10b6:806:469::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Tue, 30 Dec
 2025 14:16:51 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a%6]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 14:16:45 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v2 15/15] runtime_test: Add rust-out-of-tree selftest
Date: Tue, 30 Dec 2025 06:15:40 -0800
Message-ID: <20251230141540.1974380-16-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251230141540.1974380-1-Harish.Sadineni@windriver.com>
References: <20251230141540.1974380-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::9) To CO6PR11MB5651.namprd11.prod.outlook.com
 (2603:10b6:5:356::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5651:EE_|SA1PR11MB8859:EE_
X-MS-Office365-Filtering-Correlation-Id: 4102785c-128a-4ded-2a73-08de47ae1065
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rp5dCjx28khyiO2gari8KYo1yd5UluCzoGt0VSWxVDDT6ItvYSCB3tZGf0aj?=
 =?us-ascii?Q?bFl9sOPCmLMtLKY3Tg3LGv7vnrytIKd5DAfdI1XY++Z1DtZ2cWcVe+cG2Vdm?=
 =?us-ascii?Q?A9+oKr3ZPCE1NyTLwSftkZ8NgVPFLvIXpUVF9JiXcqszTOIFJPeE2oCdrzSP?=
 =?us-ascii?Q?Jctm1N3uBPmpIvmsmi1QR1zsBwL1V0J04atK55Eka+9XjLZuvoKFQjdVz7zf?=
 =?us-ascii?Q?x+ZqZFyJME5Mb0kkZ/0Sks+2vsHW7sOZXD7YvtB+CYmU6Zn29LNFmqhPG+B9?=
 =?us-ascii?Q?2au0etTOfng8y867fOUPujot6TctX4Q4GNYcCSCAEbZMryXScHWwf/TS4nCO?=
 =?us-ascii?Q?LRkFP3H4IliPHvk34xtaAWjibpOtr7QAzioceEYvAa1rlu86nNhtyR4VCTMl?=
 =?us-ascii?Q?7h93VFMByrfmUBfHI94bkrg9qd5qglUHSXXiXWWt9t7Ylh6z+UhleECUmntO?=
 =?us-ascii?Q?UEW4OLTXcu0OPXPXlx5SBH56I4RlHJuc/GGwSto8JHoRjD1E3tf/lYreDJz7?=
 =?us-ascii?Q?YHF0avfgxqkSmvusa5f6grvB0pMB6ro0yGMh7GuKro5pToAA2vlpEenoQC8e?=
 =?us-ascii?Q?J+yPZUMmp2BfoHYKES5rZc4j+8PTCFiaUvYaZBJZviscOcXxL2Uk6QWMYq6Q?=
 =?us-ascii?Q?YUWeCpSVpPxaQm0O3cv6RMmbsVCGv0AJMDRgWg2qdJL8UPNAKXURdu6KkkYO?=
 =?us-ascii?Q?1EsSjTi6F6uX1A9UxXYAJ8aCzd0BJL8lkqlkv1QqNp6ViyaKLuNhtBeEG3L7?=
 =?us-ascii?Q?eoKPlUjYnVviEJujhx2zggvS6UUiUStg1oR3Vq2AttAIM296WCY1H8a6Dv5c?=
 =?us-ascii?Q?8G3DToGXwJK/K+Jnp31NmaI/taaPdB+PKgOHOwxkErtXJGhqx/i/rnW2Xmj0?=
 =?us-ascii?Q?vSqIUzGxAOZvdRl6fNEfq5QBpANqQYwPLjAakIXXCJ6aE5QL/8Jqom1869d/?=
 =?us-ascii?Q?pJVSVFDSx62Ojf3POCuAdk6z1FYdkjiAiwWG/wnYCz76xUky0hJrNRrlGG+i?=
 =?us-ascii?Q?p1kVrJDKGgyVavqdQzCKBrsofcvfgfx9STn+QXPoTvDsYY0j3PS85oVq8U4s?=
 =?us-ascii?Q?NrVscOTdOLowlV9W6uSCmixGsIZUNcG3V4UAfKQ3JM502wVGwURWy0PauvIF?=
 =?us-ascii?Q?l3/JCbPTmgx8rB32Hv9xKO446mKIXVXzbMCSWBoqTZ+GhbqaBdbaRAm/jYoN?=
 =?us-ascii?Q?TBpnGtxVpWnakgyaHuQKLx+AGjcbH6avqDzUZ6/lenqobKMDmGCynGqNTNMr?=
 =?us-ascii?Q?/Op2Rzy8xpv9Au9RKiReAXoVsetgRgq13iqHGpbNw+y91e/2YVOzsHfuIj4Q?=
 =?us-ascii?Q?Ddj6VObqG8cAX/y1N31yhu3B1SxBDynslM4YuHmDxZWH5ahl2iUQav8axbMk?=
 =?us-ascii?Q?PRA5alXjLeqviADgOrlTEESW7cZDZWO3XzSpumPtlFors8ov8vSfd3A/aICo?=
 =?us-ascii?Q?g+zBV21lJ+TMwoD4U1lhAAQxHVGFs9uSJ6ZHCFA4EoDepY76tWhe5D5vsNtJ?=
 =?us-ascii?Q?4KRwIiZ8kygzCw8AEj95wamg5tXPOxQWtAux?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GKnA1kJhN148On/gqcWD03nWoi2ePT8gAHcLQm5ha5eOQWTiIeDnv9nFvRjG?=
 =?us-ascii?Q?AwzOsLWxiWHaqtpzDfcPxPQDwG0x+Un0o3WHk9BvCy7hC96OE6yKLrAkeBlx?=
 =?us-ascii?Q?vQfKnG7P+j9Qslcrm9P0KChXzByZruiOhTiMWrpuFFa7pBzIcVb2ru1LaPU6?=
 =?us-ascii?Q?jn2Cz4h6W1Ml/ekMahP1L+rQXCgXmvvhwsGnMYmTzJQrWY/t0a7qZ4HcZLXN?=
 =?us-ascii?Q?R45RiiZGBbgvn82RyUPfv56WNefpSJUiWSlGnqjG1gF6yQdsDvX1G9ebnPBA?=
 =?us-ascii?Q?YQzgAg94KqSFMVxVV5aphrkHJGdjKwagrMX8vGmpCK3go3KPNFXROvqZf9NF?=
 =?us-ascii?Q?D/ILqjTHwILAJw9JnYZiEBnmLOiVq0sLxIaaRoKHn2yVO2Yp6Ayrspyeb7bB?=
 =?us-ascii?Q?iVN7H7pj+5OlYTS1jT985Fak00zbt5RKUEn1+vwaqfsxqeZ4yV1XBvHaZ0iO?=
 =?us-ascii?Q?yU3UbVDOe1d+FCCcUiAUNhFedn93D5I/sdgX8OKMK+HWQ3it/4izD43aIxN7?=
 =?us-ascii?Q?XwP/Jka5RFRoguu5dKjuK7ER14/vS3vHQpZo6+nZ6dkDrCiVO9GF2o3J+f4T?=
 =?us-ascii?Q?NtYr/a70VY+w2N+bScBAwpSZ3IXmDUQbAtzYEWS3I58WxB1FavFGyP9LpyOZ?=
 =?us-ascii?Q?YzzSy34tHY0t50a4FmMJSIxEIrkW68Nr4XVRrkfjOafiXX+Mkm9sM97HUv55?=
 =?us-ascii?Q?poPYICNQ/G6rnQT+QKBIyjuEVjvCXNLd00EpBq35ktTVETL6bBEclov+904x?=
 =?us-ascii?Q?qhVeHsd+MzxZeEYLVVscKzLeW6G5NhkPzV4dULXdgWBwJnzQkCRT2aCwWlQo?=
 =?us-ascii?Q?kZFXsg3f5xz9joDUPF9iS1Abn2DVF87iq0rWHokYUPISsnCniE7P7DA8jL23?=
 =?us-ascii?Q?CB3KuK0OYUJNdRn0T39+OebMspx+NfXi/R+7GR4NVYt0WSMwBVY4oEtUHVQi?=
 =?us-ascii?Q?i/XOmiCP2AFKRm/Fhz7j6OARsPmkY6HbNA8P8QczxhVVP0KPYDrZYsAV/TbJ?=
 =?us-ascii?Q?fAe3iB7bMDs09lbyNUeCXf3p5YYcuoqZX9QdOKg05X4razXDVRF6nquGICkr?=
 =?us-ascii?Q?8/qQkI6B/Ker0tOkbBqoYjqdQPiYTV8pMguhJy+LuBdjdSQsxSMHmNiFOnkJ?=
 =?us-ascii?Q?alXanSYaFPQPVUE+/yGjNDg+iv9AgY+R6oTKsE7xJsO/cwPYGQFbIMEuSpU5?=
 =?us-ascii?Q?xst0Fv3jaKAjpkpL3ji5XSybFO0OuJCqvuCgnSaMuva0/ADjeimIvhMvYJ4u?=
 =?us-ascii?Q?DbtPq+Vcg02dHgEyQ+Nl144qBUQxA9BcSVQlNmB67mUDy0BXRXO1uf6InI5u?=
 =?us-ascii?Q?/P5KPPCcbyxLP/OyqUXT09CYVHGs8DU01hDqoqENiRrj+5q/M+UBUWR60Bk/?=
 =?us-ascii?Q?Uc1anDzOjgGFviYtj/FIQa7VVSp51irfOquSXm4/lJH/ogkYcpH9aTFgwm0Y?=
 =?us-ascii?Q?1ImJU50AZ7geexMGfvaWTtKvDJquddBwxnMezhH0DTKgoC3lFii/1eiBuFHe?=
 =?us-ascii?Q?EEWntRDw5V7yBiU+voguAHu2SbZUE2uKP65FxCui6jv8CU7OxqAfb+ipcGv1?=
 =?us-ascii?Q?KKeGvNTlz/kKMCHpxJMccux8MGPFT7q1gEZhxeAuZq9U1xu835oQht0lAghU?=
 =?us-ascii?Q?BCv1TN5V3djzO+fqL/CDMN6Yz4mbziAiTAheS4avLAY+ozd1ZYE9rC68tsOu?=
 =?us-ascii?Q?qy5JUw9v53Pblh+X1lrVoIW/smHDOt1kD+/Dei66PuNN8bnSFIyLIdWxqonV?=
 =?us-ascii?Q?ismKynIMJSSFAlMNMCHkXZ8thgghd4w=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4102785c-128a-4ded-2a73-08de47ae1065
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 14:16:45.9268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i7YioKFPbjckiFxmQNlQOrwtMWR/uXclZ9ZnfwTJ2ISPRmNAAjLylH2YalXOAZx97J8lgdsenAKsIxkhIpSmfQQ91vSie7MlZ11Os2Bft44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8859
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: AJAOsLybCPmtpfEa91PPAmWMfxLom3bg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEyOCBTYWx0ZWRfXwKULsGwrA0SH
 b3xKoEDFafWz6kC5Zcq2B0KhstSftbNZP/90punrbYpt1tT9ZYVn6PaWMcH6dQVfBgXbhm8KkN9
 taq9LuaP1yOtDFkgIzcJAeiTWmtqrC6KdWsa91CpO96Jd9FoSEVRn6KltHH4mHlwqA7yp8x/EeQ
 i3keBBNUvkATCm/zurvSqbkyV0txC+Zbfcqh2EwA57X1rFtO+2W+2vnOHl/VRWqX4QuI7GVl4pe
 DoVg4xc2AZYpXzzE4uStzobO8BF3s444bMen/nE5SYMXU2iBvTPhqppJdiZNOD6FZqj7OkIs5ko
 z/vmvIQLMgYeRo9DyVU8HGg5vrCNQWN8yN9umEFb1xka1lTEMXzIzrayTWOpNs20mMOYGm7gBIE
 3N3bgprrPpsYR0UzuymuXpujxu/TUkYY0s7ezQNst2gMj3Up26E603e7uK8WSwiOK5hAa/Om126
 b6wv9lUcWgoCMc3E//w==
X-Proofpoint-GUID: UCuCw213pWTmssx-q0AKFnSxNIDSDaPa
X-Authority-Analysis: v=2.4 cv=bN0b4f+Z c=1 sm=1 tr=0 ts=6953ded6 cx=c_pps
 a=bMdnqNz3r98bn56uXvEeDQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=PMCPsi-Yzk6GkJUXyKcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 14:17:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228681

From: Yoann Congal <yoann.congal@smile.fr>

This new case tests that the rust-out-of-tree-module recipe compiles and
run properly: check that the dmesg output is as expected.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index e8374606a4..461116601d 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -494,8 +494,11 @@ class RustKernel(OESelftestTestCase):
             self.write_config(textwrap.dedent("""
                 DISTRO_FEATURES:append = ' rust-kernel'
                 KERNEL_EXTRA_FEATURES:append = ' features/kernel-sample/kernel-rust-sample.scc'
-                CORE_IMAGE_EXTRA_INSTALL += "kernel-module-rust-minimal"
+                CORE_IMAGE_EXTRA_INSTALL += "kernel-module-rust-minimal kernel-module-rust-out-of-tree"
             """))
+
+            runCmd('bitbake-layers add-layer %s' % os.path.join(get_bb_var("COREBASE"), 'meta-skeleton'))
+            self.add_command_to_tearDown('bitbake-layers remove-layer */meta-skeleton')
             bitbake(self.image)
 
             with runqemu(self.image, runqemuparams = "nographic") as qemu:
@@ -506,3 +509,10 @@ class RustKernel(OESelftestTestCase):
                 self.logger.debug(f"rust_minimal dmesg output:\n" + textwrap.indent(output, "  "))
                 self.assertIn("Rust minimal sample", output, "Kernel Rust sample expected output not found in dmesg")
 
+                qemu.run_serial("dmesg -c > /dev/null")
+                status, _ = qemu.run_serial("modprobe rust_out_of_tree")
+                self.assertEqual(status, 1, "Loading rust_out_of_tree module failed!")
+                _, output = qemu.run_serial("dmesg")
+                self.logger.debug(f"rust_out_of_tree dmesg output:\n" + textwrap.indent(output, "  "))
+                self.assertIn("Rust out-of-tree sample", output, "Out-of-tree Rust sample expected output not found in dmesg")
+
-- 
2.49.0


