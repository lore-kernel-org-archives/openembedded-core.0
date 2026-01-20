Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA07ACA5FDB
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 18:31:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13440.1768933883360649093
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 10:31:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=r1zLImCE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=548098e00b=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K5Y6kY3683153
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 10:31:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=OFFrZm01wqxVjPezwt63WNk14vc+a6cLbjRlFUrBU18=; b=
	r1zLImCE1DQPEXOkuj62Lgx4ZqDzfW6/m/PdID83W/nO7rAV5dkGwrJTGckodySX
	6rBKRLHueyz/+Tx23Ix72WPuY+cCJ2vWir4K+tw5lR3EE4g9eWUeYqhHO3TfYIoP
	IUPTOIIk4/M0Na+7L7fhM4JeqKSX/o+uisFp9kGnYOUacNkGFHwud97UISwRtuGh
	YK96jfhMK0u/UuwZVCbOg9iVxzkJl11BRA4gkeDUA/NTAydJjQLJe6NeT2NQU0OF
	dGD5TU0JW7G0nEpOQJf5Q2gRTBhqahb9VAALDKSumMXKGtytHJILxVDFqbTWPSP5
	knrAFJHL3Lnll2YJ+ZRhCg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012034.outbound.protection.outlook.com [52.101.53.34])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bratgu4hv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 10:31:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U67eUVCt2XGo5x7stTJEHCzPoU/Qww4txwKOOtbDUH6KE/mOpbEo4MVVZifS4X92l047nk90XAf7se4WitUNI4NPGZYQzLfdQmRLnJaMImskQXnZWAFlUJLfrMJCBKP2kvueUMb30S0tkfbplxzMiWL1aHVHDjb+4xeILB4ZgvxAqDBw6wA0myukg6wenrhJP/3clIYN3umnWp4ssA1tbM35CYnMNQmXWKghBupvEWjvMXSzFBre3XjRBkX3Xa2VXpSM6rVMv1cz8NEC2qN0cJFQGhYOi7w3Xy5QgLvqboVfYeeyaxYuQCOjwL8ZRLDn1VFcA2ciXnC8GUbNjSNiow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OFFrZm01wqxVjPezwt63WNk14vc+a6cLbjRlFUrBU18=;
 b=C2J+FYImiTnjP/ztXrnou14CS+S3ppe27LLGLkkeb+4dh91AfsLuWNeD0FHrI4+m5BVmH8YjjbrpgAom7R9ToA8DfpryWJlqgOxBMfpivYsXqqN77Vbp0V1BkhKM5LjUDmMHyCZWD2cBLVkrkzle9ydZ3izgX+LMP3vDW7sh21EPhzMbKd5Vf1PmkXhyUzwgERiDCgqCDOJHa0dLwaNlTI8BhpRAVhsnmZxEfAdC+M6HwRsRtSt5wT2+CTxSoVLgwV26d0DDJ2ornRwT2TBzY18AE/lQ3oNKHmw5BtDk8VgKA2G1Xca8K0J+MyWrkI5eZb+ZVNIXH51cMgBQ6hw/YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ2PR11MB7425.namprd11.prod.outlook.com (2603:10b6:a03:4c0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 18:31:18 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 18:31:18 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, alistair.francis@wdc.com,
        Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        richard.purdie@linuxfoundation.org, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v4 01/16] linux-yocto: conditionally add clang/rust/bindgen-cli-native to DEPENDS
Date: Tue, 20 Jan 2026 10:29:32 -0800
Message-ID: <20260120182947.857242-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260120182947.857242-1-Harish.Sadineni@windriver.com>
References: <20260120182947.857242-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0146.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::31) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ2PR11MB7425:EE_
X-MS-Office365-Filtering-Correlation-Id: 3488275f-8624-408c-b4dd-08de58521a47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PInuB4AC7arBn4VjKW4RyNn4jYxIVADr6HUjgKknyf9QVDGCfisHlI3BDzIc?=
 =?us-ascii?Q?NH0PFRqwNwssz53ggtQMl6IOJ6MGVZY4+ikDSM5Dg+KuWvfOzcq4LGyDj98o?=
 =?us-ascii?Q?bvDfDsxP8dWYMLM/GuYcdtSGwPHFnBGJ209b2nX22+rE524H+6/rP92FsUMj?=
 =?us-ascii?Q?lJehE4Q+215N/rGXNuGHoOXTazLRBIXQ2bqihbpfI5Wm6KdEHQACPERN2ouM?=
 =?us-ascii?Q?uFtW1C03IeMPTY/Xt4GYJUMWEFIBHypecvuENYtZdHC0tPmvL9oEwA6VI1wQ?=
 =?us-ascii?Q?3pUYabF4luru8T0jmTc6ZPhhZ34dErGW0spvwqV3KPXRoYloIN1Vq664fAtN?=
 =?us-ascii?Q?LjF528q145vT61OYBwU51dNKWaqWi1HyY+Nfv6dkZ7+mGRHf1TQi7N9HCWr9?=
 =?us-ascii?Q?RIs9O9CJAxtdDBhnlgpHDEV0wISUP48Av/SVt49PmreTOjObP8AKwZvyc616?=
 =?us-ascii?Q?EScepMA9QzFItJX2n1swpwdt+nwZpmp0IGH7r7ZDVibbcG4rA/Fk9XIfTCQj?=
 =?us-ascii?Q?nTb9wMlqv5gkLe4N9noDsNMATk3ip7CzCmbDcVxu5+OA4beP03Ar/Lbud/Yv?=
 =?us-ascii?Q?8zyt6ubfEC9VX/8mgrhNmu83QLg6EefuAjYK24tq+m8VnbqFlWffl9TSmwor?=
 =?us-ascii?Q?JmkOi/TtfFG/KaB48y+UE/i8vSJWOgzjzVzo1Tpfj1VnTxZPwkdnVrNWky1H?=
 =?us-ascii?Q?I86JK+BRf7pgctfm0PAtpHZczqlXd9MIdC7JrgUdtbrYPXbkl5s1MfnMcr0T?=
 =?us-ascii?Q?rMwN5nN5RszY58mCaAQVi7etTImXsO0qr9f6NgHdP6f0prP+zugNVrGkNOBY?=
 =?us-ascii?Q?AQMkw7/oYcEEEbfEf0g0gF4Lon43wXDxRJ8LgodKomjG8wAYmGDKuHnjrHpv?=
 =?us-ascii?Q?zQELXarLmFtDt6kuTxaFCV2LL1gpG0B8SWiQ0NHlCasZw8TLSO4Sge33YBd6?=
 =?us-ascii?Q?fA/cxWfjIUUyP5oFAwjb1QP8MaMfvkS5pPtgBWhfljkUJ1LLjtQXntHbR152?=
 =?us-ascii?Q?In6lXQQ3QV8yMwkWBGAbKt/anz0BEFXH3qpf8Z4H+vax49jxeeBl2myZjRNB?=
 =?us-ascii?Q?UqJlswMGYQXMcyBFdkvsCrVKm8katW4EpH0PeuabV0Nq+XmKAMX2J3NLnFPU?=
 =?us-ascii?Q?8w4dYY7ZmJCMBFRSz+Zm5YSIYdigng5jqqsud7dYT7fygA8n+Fz8WdTUqHxV?=
 =?us-ascii?Q?bTKf0yuCo5mAR6LTsXUcsGnq/qApKMLBjVD1hBbtM3boswFvZTUko0Ay9CjE?=
 =?us-ascii?Q?DQRqp6zSFmy334feigJmovKx6ynTkYKcgjBZQ9Ywzd7qV9Mr7U2vKLa1WPpO?=
 =?us-ascii?Q?upfa87UOqnI0gC3FY9X58RImPtJic0jYUTDEzT5vIKF8WPjDbXWr20YWMb8U?=
 =?us-ascii?Q?lPBrDqEAxckXHn4EgmQrmEmeR04250zpPRmDSW67Iwje2dbKXF2f9gk/jWgJ?=
 =?us-ascii?Q?iBdHUzyGPkonPqW7j4dn1jvrEWpVBcCavkWg9kE8Kpg6uD3XfwkB4MwP1XFO?=
 =?us-ascii?Q?IqC4CHXCEH6O8FkafNQBNwklXusa8NJhuRK6E4o2wBh6pqQ71NoF2HHzAA07?=
 =?us-ascii?Q?CDkRxxkamGpSSrieuMFXoyw/EMNNXpn2JZb7hkxo7GyHGRCOHXMuohK2pCM5?=
 =?us-ascii?Q?ngNzhZ3DUnQCFdStF43EBkk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ARQcrXTgGWvP3jgQLFJGObkHDoLWpBTpm/dP8nYpxKZKhTANh21iPt8UILD4?=
 =?us-ascii?Q?8dZeiGS9DUIkZKdeTAYfHaD+0b786UVw0clRvMsXamULYP1Oxk2Kjt7FhmWE?=
 =?us-ascii?Q?FxIOZFzg+n6od+/1GuFMkaVXQ0eJ71wXXS/maDZm8UV1R612lzscf2rC81Fq?=
 =?us-ascii?Q?4EA8Elcog90lNj7RZCzZ0+dUHu/LPv6JFMN/5JkmAFPrtozHplTFSm0LkgK7?=
 =?us-ascii?Q?71dQb0/PZrzucZZmuBEZ+fv3af7IaB3swTWJ0gAeXreHrncZdjNgRWcT+2mD?=
 =?us-ascii?Q?87qgDEBvdH3i3SNxOFF40lrpIlnPzly5sC08FiBWIpbCfmSmEnyoddgziBTA?=
 =?us-ascii?Q?jQuL4ZRD5ZiaI/ba8lCS7tcSBuizahrLwSmOZohlaLOlpZ/st239uhciIRES?=
 =?us-ascii?Q?HA8rh5uiPhuEbbIhygeUHLhEex1gwqfWaIxzlaZC9+R3h/Bq5WG8b6wqA22+?=
 =?us-ascii?Q?twO45IxXX2oy6FfdfBlN7EcRSpAKzwbYNi7hbLPzaVwN8fD8eWT0/y5cUKtD?=
 =?us-ascii?Q?gYeYDmDyIoBBln5eme4qc4pS9yN+lESWhOTW/ET8zHDEYEHaKgPMhgyCiWZS?=
 =?us-ascii?Q?6T93gLOZq1ZewROcXKY6irfeaRcHaNzUPi+Eft+0SOfKGJkz3R8eJB3RpInK?=
 =?us-ascii?Q?zJOClphTpONvLZ5pHSfrIK47WVHU09bKs1z1f9Cw9JPaMg2zwgxr/g17tXhx?=
 =?us-ascii?Q?6BZJ7H1e3RskP+HjYVtlKPewgUbNA7Ll5orhswW37X50FI5CXikor6CA7JU0?=
 =?us-ascii?Q?o9B1t/Iv+y/HgdJDXZfAkc/eOe33aPI9v5cEb1kHlU9zhVmfrKWSBxhMYFQ6?=
 =?us-ascii?Q?b0iDBKKiz6/3IkTvh2fRm6jWcelBAEZuI3XPfxa9MYIRDgkPiKIiRB9Vny9M?=
 =?us-ascii?Q?y+o3F1pC262ig+NPdVGMiVjVGW4BCNMAU96zRG+FdnZzuOc6MTC7Ro/SwhdA?=
 =?us-ascii?Q?rwHR80ke3RxMfXKrDg59li2M+Fx5V02hfR6v5STiU85uvV/pb7MF3Bsb1HVd?=
 =?us-ascii?Q?m3VhNzIryR9ZPDacls/fEpH9RCojmGW24nuGiggDffIIGjxZ96DfxnC9jEbu?=
 =?us-ascii?Q?Mo0ulqGvBxMdpDXYu0UkSEElr+/ympLK3fLzRTMAM94sTNrC5pqOpWX14LLZ?=
 =?us-ascii?Q?cIdMnfljai1pn9opudoq6nqawKKqL15/v4GqDRScWlbJcF5ur6ZYhkJfr3d9?=
 =?us-ascii?Q?8TH7my/ziJ5SmNdXDCPv9FM+b/SKCnx+wHSU/0dpI0x8a/M22CNTRMTkRuhZ?=
 =?us-ascii?Q?EQsBKGbibU6FdR4MG1m57+Qk7fAm81dKfo3L3AruMTcv6QIbFLTrvdc55hp/?=
 =?us-ascii?Q?1wsti8F0sI3AjpVEJL0c8/ZqQs2nqi3aE4Ya0DtGwsI2U/JM0iBI1GrnDOgI?=
 =?us-ascii?Q?d8Najo9cx3XSsbp6WJjn2rRJZicCwo7uA+YijvtDujB4ibrxEwNuxYE7vGNi?=
 =?us-ascii?Q?pfoFT6U9dffNPGD0xJy8ZfRJJYP6N6F2Am+ZBhlc8Icgc6+fmvL+Ydlcdulv?=
 =?us-ascii?Q?GsVMG7lo85ydgqR9pUVkDKJfUsQCpFqjviwhf+13BdpPTRaOpqffYL9K0P7Z?=
 =?us-ascii?Q?Yi5b1t4X0XLQxGsHXZsZXgnEH6oM0l5w5ZzZ/Fui6FoL8s26cZQl7TvXoui/?=
 =?us-ascii?Q?R4dMPmTZFT9YR11V7LuPCHKBzwg92SqUxR84sPeerAwi6sCtP3Fxaw5MDlZa?=
 =?us-ascii?Q?HJ1zqhxnyLXJ/Pf4g7Ynvgg15wGdPkFFKyO7HHugk2e8rkDTs6/ptW1DyvvQ?=
 =?us-ascii?Q?4BsYJcm4WyFXtXQYWRFBMH/C7ulJZOM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3488275f-8624-408c-b4dd-08de58521a47
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 18:31:18.6374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /AcApKGwvRwQf4x7uVw2aLSGBRHriBrxCRN0UbNEkPp7UzVY/6ISdO108GlSSCgu8EVJUZNacjVveN+CX5kYsjq08QXZ+irjy1gChBNKDnY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7425
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: JDs2Jy7_G6lsL2K_gujq63qQYpGUm1Pv
X-Proofpoint-ORIG-GUID: uSuwb1Ff11kECmj0UM0OSw7mF-COlzsS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE1NCBTYWx0ZWRfX5ERH245ydeoP
 Yn43UBXxCsA+Jb3vEHWCeoWSMeSugrvtDIFeDIlLqwf6/fV0EvMFyMYMEBRNlAm0m3uT0gKnwFS
 pLmMVGMizJB6kdRR0inD0/PIQ4qyzKHyHLpY/NzGLKHyCRI/jPKFRCmKqdriDvcUO5S+54O2f0O
 gXwfVsWKBcBHpzQK901R50ldM1O5RyyleUTgfG3l8/M567tqMS/i/81vymsymA4C5oBXSPYMtzp
 9p279q4IySeJ/H6+jWLp+OVbS69rEzgctyLWHWW+VkMfE+LJkbcDYoyMHyEGqgd1zCtgoOWGVvb
 eJCjcGp+V9C7sqILw9X3Z62Dc9Px4DMRGktr6Wq608gdQFuCIB6MZsJlFxIHM5xT3XEmpKuoER5
 EPj9bY4C5PKFrLZZdRf4XGdYacSwzKZEwrOWwFUG84TSjVXtffgvzWMa28BM4xPJodXkPGr1lLZ
 tcIrZkjKRrngPOQDvgg==
X-Authority-Analysis: v=2.4 cv=DY4aa/tW c=1 sm=1 tr=0 ts=696fc9fa cx=c_pps
 a=bMPlUhRHxnpMMWJsejB1Eg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=Rfw2oJpr3f21ZIbSA5sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_05,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200154
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 18:31:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229768

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Conditionally add 'clang-native', 'rust-native' and 'bindgen-cli-native' to 'DEPENDS'
when rust-kernel distro feature is enabled to support Rust-based kernel modules or
features that require generating Rust FFI bindings using bindgen during the kernel
build process.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 4d0a726bb6..41b12b6f14 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -81,6 +81,8 @@ KERNEL_DEBUG ?= ""
 DEPENDS += '${@bb.utils.contains_any("ARCH", [ "x86", "arm64", "powerpc" ], "elfutils-native", "", d)}'
 DEPENDS += "openssl-native util-linux-native"
 DEPENDS += "gmp-native libmpc-native"
+RUST_KERNEL_DEPENDS ?= "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'clang-native rust-native bindgen-cli-native', '', d)}"
+DEPENDS += "${RUST_KERNEL_DEPENDS}"
 
 # Some options depend on CONFIG_PAHOLE_VERSION, so need to make pahole-native available before do_kernel_configme
 do_kernel_configme[depends] += '${@bb.utils.contains("KERNEL_DEBUG", "True", "pahole-native:do_populate_sysroot", "", d)}'
-- 
2.49.0


