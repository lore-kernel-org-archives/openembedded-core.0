Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9387D26289
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 18:31:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13363.1768933908261870309
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 10:31:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FXGFojgx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=548098e00b=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K5l4vV2987979
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 18:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=1hgkzVh45fB8yLND+Nro/r3sd+Y8J44QlEFsNoxIiSY=; b=
	FXGFojgxRZbHaMK5C8UG9d2gfo/Cx0fjonkdblDO5ZX61FdSGxoGxLkeePs//b5t
	t1tqvKJvKXZKtshKxIv9pCOuoJuauKFm16YgtRG56wNjd6A93pO90251x5xweZVQ
	iNlA7vsLIzhp+D4DxzAVjt1yShYDtBeznhcb6cbErMY0dCSIvRCtAJFCrkT3Cknx
	sxZ1RNJF3+pfy7KurfTCUtt+rHKikNkICzCj8NYd/spzVRIwnUgeY4rcsLJ2Ien4
	MsuRL9YHPsG9dEQyjh2Q0/p8H2g/091iePPkDwnFFjOKSfygG978/aYGd1AH8u0N
	QDVcHbwxcd9S8Y1LYHw1fQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010001.outbound.protection.outlook.com [52.101.56.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bqymukh0j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 18:31:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YrDKpDydBtnZZZaDX/XZ+HHfLmXPa3kI6NVSzEORnr4cY/pjBV9Dshx0WOSiH0zYxCYOBuDRlzyn0K5n0V0o+YfFrLg/+CQ+RLOZmi6gTRofhCPINIZQtkpqGvUN64PQMVENiZWpltHeL43UrIJ3axSvwH76MWdpxhXm8qG7Q4u3YUXoXK3gfTJ0uji2MDOHZ7QB0A/S1maMUjXzqKulKwFsSIARzSEBrildUoYdzSzikSSbDMGWgo5IGG8e1uLpvWWRfDZM926c9FL7oj0sUaDgo9qe6pSnB0vxNAbrlXTk6imbKX6XhqUVHo+FT4J8V311FIavo3WhynF/zLaOIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hgkzVh45fB8yLND+Nro/r3sd+Y8J44QlEFsNoxIiSY=;
 b=DPtXT2roEaZ9CJCSZRKD00YoR8M21HAPK0pQZOfCdb7oFBtZAbnBvco2QJdz2JV1SE9o52wToXLvqiEEOPVZBOQTJsfgyvVYAZOcJa5CHWPgpHb3i+eqNs3sFneLG6lxGeOvxtEdQBApfqHI4Nrzy0Y35rwQxI7xPRKxT2zOrjRPkp7+pMkjIw9rAwg33F3D0BY2z/Wb7qYiGpvNn37mel6ClJ3VbW9DhvZl4RUYFNwsguIyvEsgbqOy7RtHWO+Yr5wYi/VTn8cI5QYzajrqSyHY8pUqpX/8kYhO5MjuIVN9xhLDj5ExVvXFjus1XG+7dQe1RuUwoWwj2XsBKVKRQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA0PR11MB7861.namprd11.prod.outlook.com (2603:10b6:208:3de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.13; Tue, 20 Jan
 2026 18:31:43 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 18:31:43 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, alistair.francis@wdc.com,
        Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        richard.purdie@linuxfoundation.org, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v4 16/16] runtime_test: Add rust-out-of-tree selftest
Date: Tue, 20 Jan 2026 10:29:47 -0800
Message-ID: <20260120182947.857242-17-Harish.Sadineni@windriver.com>
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
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA0PR11MB7861:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fd96edf-ba6a-4f0f-70c0-08de5852290f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ouCuBMuL9QU0XFLCd3qXn3q93RAhoDtnug7pBqAat+DKIqW4J74f88hritxM?=
 =?us-ascii?Q?r3u5WMy/P2BgnNAsOO0Uqu1fhXs14W7bk++oRNv0WUCVaNVOFE63f1Ftlsgx?=
 =?us-ascii?Q?mGkef1vnret0Oxyuyb63v+ZcsJ6O0oVoZcNA6nf5Qiy2uigvJpS98sF0SRjK?=
 =?us-ascii?Q?TLoB8lDGjA8SV/yGOnchj6FkDRgZHXtZGgBZAmf43hyZpz4IHJbowDq178Q6?=
 =?us-ascii?Q?zZ+uY+QglJEXktxC8Xvdw3ztHnVlqrK2AlH7kWSjR3r2+s8KUPLz4VySWgiP?=
 =?us-ascii?Q?E2L8V5iur5AKZi/BFEU19z1VmCdSrZEVeculPtn4NnJ8bR9fjq5U3PKovU0h?=
 =?us-ascii?Q?INdsFFqqkV6+3e08m3FyYHd62pYsgMzJr1P1cs6Yw5ok7sf9BBNCGQ7D5eXH?=
 =?us-ascii?Q?h6/P9mIsbEEKbVcbVAP5egJZHlnJGIHpMrLYucTpBa9oLfCI0X4AAz5KQFrF?=
 =?us-ascii?Q?zmmogX44MHTc5yJ6ecTfTsxaQPgdNhlTQ5y5NuRMTZyYNq8sgP357v1rG4S0?=
 =?us-ascii?Q?6STDU0zHwJzY1vbbcDgrjYv6FUi1Lq5B48r/ecsZJUCIyJzLFKgbkcY1tE9E?=
 =?us-ascii?Q?JtBhU21LMitb2HWM5g7G8ayAPS4aG+V05ppSKVJCX9hrv5b7DvMta0ImqW3X?=
 =?us-ascii?Q?0aSxh3XAEgWXvKh/Qaq5kUCasEzawS+k10rG2AmehOsB03LumUkJe2vnhX35?=
 =?us-ascii?Q?PBkIzJMzVtIDa2P8SKy5YYH6zDqvXWM8rOqYCKrCIQmvt4e2E6EZ/Vsg/hpn?=
 =?us-ascii?Q?YE/BCkX8yCJfi7xwMqnB4w1uMuOOiqyR/HU9JSLvYR3uWjHaoFWZE5p9qZG5?=
 =?us-ascii?Q?RcJ7Lodo56jf9ZMCZdTlL3SPwHiw7x7lOkPLvAYAlhNJFRu+9GbRaeai5dBb?=
 =?us-ascii?Q?53cfBLNCgJmSWxubm14QVol1DsrpwzY0e5HNYu4k28etdcqyP6MRavvKwIfS?=
 =?us-ascii?Q?4ntvFBrkTPKWSDPAgo+85b1OU3vDX3CBWDSMQ/xw5zrGQz8PZitiNAOxCZ4O?=
 =?us-ascii?Q?sxKEvxXbpU0/NH8NeXaOTmd+Q00cc9ewxPOUXLEXtfblFx3PDTTnZ2eyytlG?=
 =?us-ascii?Q?UMXv/TY6cTyh0xk8vygJfs5JNY0aKpHw5qdrxdoAlSmk/K9IA3dTlnlpa58N?=
 =?us-ascii?Q?fpg6/ytpr/u7hfGoaW6ea3tZP3gjlaScQjLHrz1obXYlixt18DpPqW63g3LS?=
 =?us-ascii?Q?xdYnhtn6jyzL2Csq6TY0kPG3t57RUaUEYG6DVasHr8wmAL7oTtoct9YATyuG?=
 =?us-ascii?Q?nbNKd3zIQWwzoZK60DMMTxaFFTkMUbTZ5HPymWgi13T2h/JAawGnt9JJ+ili?=
 =?us-ascii?Q?UAeaJa9JNA+9qDmLNXffMReBwlRbhTftTnfrhfAohoYSHb08XBRcFwptKKAf?=
 =?us-ascii?Q?UMI1wNzuLLsAzk8meLqJW9w4mVO62Q8xCfKyXBBUOUaWRl5vqtgDYDiuN02O?=
 =?us-ascii?Q?RSXgo/18cnfhtEjPxWPOatY7R8jmRVP1TOibX/WzHq+PLrDjTg3J4QVIJ/a+?=
 =?us-ascii?Q?/VfGMXLLK95owDDBPH/DJ7UI2VVvtihdiQYxIMUwXMXhtMJi/Luoxd0ax8Zq?=
 =?us-ascii?Q?5LCumM0vDnJgbd1R17Saxc0TallKlXA2YyRB/NHwP7Emp8htqOIp+pfXySJO?=
 =?us-ascii?Q?rc58Vl9TbF04h/0UHclOzWE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ncCMiy2O4cG8meyYaDBXb5c5vtk1IkwUwCCx4ZlIC9+P6j2Y+amh1LT9Wjed?=
 =?us-ascii?Q?9w/0cA4FFPwXd7PbHufjJWDKhHLEIaG+b41qtesfSpLoy1XUoQan75t1vVFk?=
 =?us-ascii?Q?s6rJf1P63nX3vkLkN2Bj3eLZRzRyfEkb3j3hOMVzvfnHjVYFEuqmPN0p7ZK+?=
 =?us-ascii?Q?VuFgAA6PoACfVF39CU3VJrG5p2QuzjvAATG6QNN8Z2RrWSDopBMDGDveYvO5?=
 =?us-ascii?Q?Bou3EbhRhTP+wywBRRT+0OyzhA+99vzF6A/Hn10rc2Ou4d1X7qlDAReH5XP9?=
 =?us-ascii?Q?QkHnjzkecL5JvivkYR9xqffoy2ILs+qb/2VUmSIEfIKYMKAyADH7o8EuvJ81?=
 =?us-ascii?Q?3K+5tlZQi3NO4LvYSe//V5TySnrO256jfKDepxywJqU9ywRLx5S0TVLqw0YD?=
 =?us-ascii?Q?HtTQVninPUsjn22mNqGm8PS0WhLSNtVw+BDzUjJEnVKO1SE6wXn6owFTdhKm?=
 =?us-ascii?Q?UbMqcOPIzcpf2E3qpVwNqAxCRicZFQJNmnn0fvVr+AKVl7A6fooNznTVv+fm?=
 =?us-ascii?Q?ZppSgtWbzEKxfBfWmUDomLun+sCBV2ppluA0uDVK6CbTbTVmfRg85qROtw2j?=
 =?us-ascii?Q?YHTBp1pgu8bvMNUaaD+6v/2j2PiMnBTfYjoG7rkH8qDorZUTmVr+s7yi0lnm?=
 =?us-ascii?Q?ehc/iPDn8LHNYT4vpLhAP25jOy4AJAOD5vEbeuuycjVtb/guirpN/AkTTted?=
 =?us-ascii?Q?xm9qb9V1kr+pGJnlYJ6+bLBClOTD/DhX2h9VeEm92KgG2nMp2MpQ7JgbKiEB?=
 =?us-ascii?Q?9wBV5mxCbtjg4qVlQ+0mzaIrg4Oltq/NJyZDzAlhBFw0IxPGEWK+ttOBEqTP?=
 =?us-ascii?Q?lJbGF2GRDi4bxQd3/XwdJwTnhJ1Fw/3eM81WVDAXlaC4G752tmPAMxZ3sDGl?=
 =?us-ascii?Q?QXqPSxIuk+LIEmyNHqajzhiUyQX8UQztFCLOSuz6y1ZKgATku7cOzHTuxHz0?=
 =?us-ascii?Q?rP/9YVQ8Xzx07ldOFib6zv5++je+Cc96IK/j1wcDMk7lQJB9v6F7kTI7aV48?=
 =?us-ascii?Q?6fDTSE/8QVvv5OQYt0Tgi+e6lhFaSAXWR8YdKXhlWslL/iicYaUVr2uIwarw?=
 =?us-ascii?Q?IjCJxRtnvjWHyGSd2uwbB73tlF8AYwwZdfGYb9+87OviiZBIjPgMLRYJ98zT?=
 =?us-ascii?Q?levkRQJhNJfJk2+udlLYxqMo/uY5GwWr4HVFE35A6ZiHe7whACLFGy2KZroi?=
 =?us-ascii?Q?ybambPMc2JJt8CvLWa+CZp4Crl621Wf+K2Sqk8JUUf9JNhzYA0LDnwCce7Y6?=
 =?us-ascii?Q?A2MiZJk9E91vQoOpi/N2SW46Ud0oeKyT3GthkdBWMO7rE4d2+sAEwgKCOp6H?=
 =?us-ascii?Q?xM6vXu9ThTJq70XdYJRco6XK2zeWNKpLNwgq+x9ug51LG0a3HWaTTCX1fSdd?=
 =?us-ascii?Q?aDgMKEeU9hwmMwav6xJ8/oYVd117t0b/m+OOIrMvcCq/Y3xij63Z7lW9oqRH?=
 =?us-ascii?Q?7NVdmM0KZY8YSyrYthmdEhD0qkiTNJJ2CYWur5FuFOkO7UOfIAjT8iSC0rIH?=
 =?us-ascii?Q?FS4L+/0GjHW1VewwsULtSPOK4RPx6ucOohVg29KLv3HFagjknkdG+tH1uBfv?=
 =?us-ascii?Q?IE2cL3i2KLRSSsn+PGQmLWoX36KGgcNAuxFsxp/qXrIV3/MwE7xPPs9U2GkL?=
 =?us-ascii?Q?tVrpy8Fe5FA0kT6O4P5UrQxygUleWjfpC6rfAL21ZTqgS3/b8v9aXas5ORSF?=
 =?us-ascii?Q?WLpVUlBwcyom42EVAwnms71dHqKMSq5uJS6eu1K3AcCbhi/+prWK/ddB5p6L?=
 =?us-ascii?Q?lcFN3y1U+YS4MTXshnQLxcem1KNn9TM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fd96edf-ba6a-4f0f-70c0-08de5852290f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 18:31:43.4576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /P/n52Ng3Rhmi3sJS5UYSVlYmL2ONCD+wK9agJ3uERqYZF1PKZVcEy1p1GNYO1O1Xgb6cPALkrPzsceQTXaD7Z2bMRpvF4Ol9YRTWzruAoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7861
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=AqDjHe9P c=1 sm=1 tr=0 ts=696fca13 cx=c_pps
 a=qHW1pi9L+1RZ0SKNcL3CYw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=PMCPsi-Yzk6GkJUXyKcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: RYdSwmlDMbaV4CJ0V7Tu8Cbkoyu-BM-q
X-Proofpoint-ORIG-GUID: I8g7eUDFPrF6M5JeJOGlgvnMJaUlwOKH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE1NCBTYWx0ZWRfX6m97LTmiHO7f
 eou8dbiC1XV++AsyA4LRSYlyur2GS/xLl4ScaCBDgW67SVDBBvzoFczztvDN99/xPhsBfxVar4R
 7lTHR/2VIPfUub/8RQFCgZLWQs5ZUpxcbljUFsKzT3NARJOY09nyTbJQ3SaCN4bmXUid89lB+a+
 fBx7T1VfOfd9jjhhMX8zsCOMk/yKn5ApPpUlYMPMa/vklH38UKpe3uNl+20pEca1s/k1DWRX78v
 vz0KsiCMWEr4yjtmZC5fW1G1T49lV3gcLAxB+K0nqX/I3+cLczw74cdMRE4ItSoyJqwDlT0jSVs
 iqg0VBfKAryqe+seycZTQanVS8esmw0ueYKGw1QDK8ZaZEWyPTbxIya60tS6yRkj/pqY59SBJvN
 RvxaqsuBiyfUhKQAumgOnX7SzrGd7UIcSSErNcq1Bpu9k5vvCuo5hZUUQGpMTKB4xNDE266j5A+
 hI5QU4byB8oOT12tzDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_05,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200154
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 18:31:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229783

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


