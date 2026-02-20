Return-Path: <daniel.dragomir@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D8BC55184
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 10:03:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35506.1771581830809495062
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 02:03:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=RbPHXtMu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6511fbdeb3=daniel.dragomir@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K9pGeX2445370
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 02:03:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=c+bnumOrKWsCFE6NWZxLZhfCGBZGvWEd3rnt1154id0=; b=RbPHXtMu7avb
	HyZOErzuLPYt5VhGhmnQ9v6+YG/7PKvGZgMsBf+qO7KPh5fNDiuNHmVEPOrlxUMD
	15BF4/bV/UNfyiOFYbhyLHOhNsoW91e3ijD3qHahTW7X2mn/XpdMULIH+TNJBRI9
	PdvVgvYvWhAYzD0kHY7RvKAvHPqkiNyDZlgzycHDlzeXj4Mre4O25u5mvqqchaKq
	JahSOANauYB0ofCwt8xEiSApO8Yp9GJ2RKKbHvhQKqsr28/BG9lNkT/X8nYme1wb
	mj8EDlTOe18QCGvtfOXkVisD0b85sXAzLfQbI83Vny08vSkx866GE2pJQpj2VyQf
	4VXQWSZFGQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011027.outbound.protection.outlook.com [52.101.52.27])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cdtuahjsc-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 02:03:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kXMMrURoZ1KJG1xILJqOavqqR5D3zNSQfNBLY9hVVkLOQeDbaE8VIMulkxNBvEaOT0GLDt5K/ayRLDhWGIAaSS/eqcitf6DBWra64GOxVoyvTwdGqoihev7NU7tP7WSceznMd16doib24AW2UY7VyAL45IbZLX3J4IPlC80Vl8qQHtYNoEKokDUQTES2PV9dW/ncMPbTU/4lEZ/dpYpIkDBjwUA7Mrihz5XLT5T2gSW2S12aUE/zm0FFIKM/BYxzjSxgmIdu3Gg1Pu39dyUXmcp+59D/S3IZ5znGBQA/WFoNOU7s8RPJ/3/eh0B9mzMgPcZOB6j0xkK/T/6v90iJ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+bnumOrKWsCFE6NWZxLZhfCGBZGvWEd3rnt1154id0=;
 b=N1PVSpFUq/PlIjSWa5sXx/LI9X7kOpbIIBr8kfRbAfF+CYVuX52jfXO4Yu/iGkVFkUiKc78YIg8woirpZG1Zje57ZxBSUcvf2JRPNhOhtuD72RR+P7oQHzZZXX6ZOOdJxA6lo0xVJ3LarHG04pdjHmuiTpACynBb6N/zTg1BnseC/RSfVe4xoSmvbou+dOFu8OtJQmdcigaU+5SXiwatt+Xkd526s0UbArAvcg7nCavs0ZaqLtwXySdgeKQEgdCKllkL4w9IMkFlSIADUfFBHtWw53UMo8yqTry2d+Q8SXDZ170eZLPSDybRA+E/QB/fZTDFI9nl6o+GZUxqe4b4sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY1PR11MB7981.namprd11.prod.outlook.com (2603:10b6:a03:52f::12)
 by SA2PR11MB5098.namprd11.prod.outlook.com (2603:10b6:806:11c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Fri, 20 Feb
 2026 10:03:48 +0000
Received: from BY1PR11MB7981.namprd11.prod.outlook.com
 ([fe80::f002:6d1e:9df4:52b1]) by BY1PR11MB7981.namprd11.prod.outlook.com
 ([fe80::f002:6d1e:9df4:52b1%4]) with mapi id 15.20.9632.010; Fri, 20 Feb 2026
 10:03:48 +0000
From: Daniel Dragomir <daniel.dragomir@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter][PATCH] wic/engine: error on old host debugfs for standalone directory copy
Date: Fri, 20 Feb 2026 12:03:31 +0200
Message-Id: <20260220100331.211130-2-daniel.dragomir@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260220100331.211130-1-daniel.dragomir@windriver.com>
References: <20260220100331.211130-1-daniel.dragomir@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR02CA0070.eurprd02.prod.outlook.com
 (2603:10a6:802:14::41) To BY1PR11MB7981.namprd11.prod.outlook.com
 (2603:10b6:a03:52f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR11MB7981:EE_|SA2PR11MB5098:EE_
X-MS-Office365-Filtering-Correlation-Id: 14860608-2f08-4df9-2f32-08de7067576c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0ur4/DzuMAEesi4HTy/5PJkUbz7fS3BS8Xc/7eziqmNd/+I1YIHGSWJ1jLpO?=
 =?us-ascii?Q?77jC3u7jBbVP7N8C+wC37fXfHiVGlM+AnDLnbpT/3zJCXf5BRD/ARJiDWntQ?=
 =?us-ascii?Q?3M8deZxVqjvbpocUSR5M9K8lhyZ3sNf6qTjE4MMmmzChs6sbrrTwvZvkm79t?=
 =?us-ascii?Q?lEJc0Oi27Oj9n5Tsi4KaEWVq2sBk/zV9S4hwznznEQP6xetm+vgt4bfhPy0y?=
 =?us-ascii?Q?lXZkcRDjou9KOqdTtf8uRAt6OVtADKfr1OzQUgY16X7nZ3VHNI33M0LH7CTs?=
 =?us-ascii?Q?BvSnKAtxfphdHbGTly4BjYBA8e8h6SlEYQtkYTetU3TqnurOecFHU5eSwzlO?=
 =?us-ascii?Q?AAkUOMqMmny7/VFc942ffu6mCWr3yjne0e+oRxoG0km7vKh+i6Mud+bzwtD4?=
 =?us-ascii?Q?717pzkYo9CZjNqgzXRpYOU6Lbt//vGcjCdC2FBelxUeXP4VVJrcosWmvzNZk?=
 =?us-ascii?Q?GZ2o9KCjTiJxFpQtU1cLn5C+VmreaHNnHwQM5TOV1njafQ9dBMFMwPQkb1+8?=
 =?us-ascii?Q?ThwehNlSS/XiW3MJ1gjVB7BF/F2TDrS7mdBZjjNsQpR0Eo6WEFsAb9PY7R13?=
 =?us-ascii?Q?VnkFBZckr2yImpjMhVjXzJn2xNe1BLZkyrbsV1acjy48o9DyTbSdLi0t3Raj?=
 =?us-ascii?Q?onhll1V5CaHJIsTiPrdxFzJAP17cA2WBr7h/r1o3jkS9dw41XeF6Zeh/bFuT?=
 =?us-ascii?Q?b+CoWC9+Q2wIhKpXRRVJaNYAscEQFw3Qnb1O8iXn5gX5TbjvghQCDbicQ2XD?=
 =?us-ascii?Q?T6WwFJfATLcadYoyaWFs9AzbbDdCDggmNPsgmhmkdOGIJxyhI38/heCm3iYv?=
 =?us-ascii?Q?5w/dbbvsbngnp2T2DcRrvfSnOJKy7IaOw56c60j63GCuR0wmlAPNlOfcDGqc?=
 =?us-ascii?Q?i4AIug91Dq3nRB6bZ55ifbcBJOgtlxUqkoy7nrVucXzYIIIMDGwrX/wNfIZU?=
 =?us-ascii?Q?jE5BXSLWUbRmH0Iuq/l5MtLrJiltGkJP2mnvR3lq70yG+rzUhbxlYxuXa8+4?=
 =?us-ascii?Q?xyaMae5Kbqb9fs0khgVzHNrJrH7N7WSUApykFJqpwVJehZlcLFKo7F+pNKX3?=
 =?us-ascii?Q?7CVf3ohxfS18w+x9bOMvY2WOINoehXbx3tsFhTBWFOex8CMAr6M7P2oUVhJE?=
 =?us-ascii?Q?Ubf4OhaV3+bo9alwRzF9XDP5vRag5R3NHG2cbzB7476ojMzfx4ND1qPBpdB2?=
 =?us-ascii?Q?rG/UTDh3RYe9nRyr1wDvkXDeUJr0GB6up3enAzJ9F2YBm6favqyxpl2b5/VJ?=
 =?us-ascii?Q?986Dz1OMrYS3TSyOSFZhZZh4fQCV9F4FhtjRvSOie948zPttct2LQHPINMJz?=
 =?us-ascii?Q?jsrUGM5eyzLkdfwz3w7Cg7HjGTJyIUolpJJv7lQ5LL+9kgEARFkCcWvcVG4v?=
 =?us-ascii?Q?1vckz4v3khjcK1wewuLOFQqybhRcGasxnhnhWAxHOoXhiVUWOtukptFg6FgG?=
 =?us-ascii?Q?Ag9pif3ysfET/E79y3I3iwpXy+zNG06sW6LQbXk0uE4pW9NkHnmaWp5zvdQo?=
 =?us-ascii?Q?jONnJcbvENMFYx04+DKTCvmxj3F/3SXZFpxeLSPZKN+hA+qSpPHRpnE6hvSo?=
 =?us-ascii?Q?uPDiFYHAgZvf5iLFnj1PJYidgzkKPovOt10+5dLbvxj9yX44/aj7hl5jWiYi?=
 =?us-ascii?Q?C5Lsf8gcXzlm50VAhUcJ9Gc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR11MB7981.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Or110rUEvDmkwvs/RnE+UIZVpudj4KvKGtE4AT8Xg48qGbxMgn0oRBUtyaWn?=
 =?us-ascii?Q?rDQnLX8dY/zAdwtoWquNvxuauFFOEQ1OssbC6+PhPqWf5WGB/kklZ2oQXIGa?=
 =?us-ascii?Q?/hVWomVaTMWUWoXqijHVVStdvqW7wGmtkAKhAlXGQKozMymdKNQCrs6JEqnp?=
 =?us-ascii?Q?jFd889eDFAcWrBo/68oauX5NmQqzn2MjHLH2YWGWzDWlHfhibIvju47Bq4Kz?=
 =?us-ascii?Q?HYx8B9vQMZACmmSfGLsiIbMfg94p6R6OJF6vrSuuGDjsSrqdqsVS0snTSfM0?=
 =?us-ascii?Q?FnrKI2sGX7GtRYOCQllfBMq91TWr0N6Uj6YBeRWiPKduXh2l2scaO97vDpLT?=
 =?us-ascii?Q?BJT666cQ3hGGbH4il0fnm20wqH61VGu9nZAQkOpvtyqvjVpGYDs4ru4E81FZ?=
 =?us-ascii?Q?0+H9iZWRzSVw0u4BM7HzcXBfeYEcu5HrLRo8IP6ucAnu/2qrv48XwwIhMiPK?=
 =?us-ascii?Q?iNpNLdduPeJjNff4ht1o2rxcUCgrmPNn7FWFWi9j9kmiVgM9ImHKzlhq03Zv?=
 =?us-ascii?Q?I3tA/SMA+lnT8AHapXcVvWvKbGFKwHDPAWOuIWvmZrG8CCzceLUKUUj0+kj6?=
 =?us-ascii?Q?dW8DADmca3G6kD/nbW5WML6/w2M6E7wtt2lVnSaKodT8VJFZAQB9KzrfbkVx?=
 =?us-ascii?Q?dFSRkCOdSDMDqN1v+84AXb/SgEMXUjK+C7CfM0Ne0HPsck62SoBN7RR/mERx?=
 =?us-ascii?Q?QM2bM7gWKHq32Vc9HPPxMI9HT6GtYFNhzWh7EVfJlupUJt4jHx9VBAK+cLgn?=
 =?us-ascii?Q?yAFbUqu6xlvhkwjHjqfoYOUwsjsJPAJcPjewv7P3tW3rn8gZRj91mKUdfwfZ?=
 =?us-ascii?Q?qO+PJ/1bKeBJnCKZV6i7PQcO2Iov6JkOaLr6pUt7q/rAjnfz8FAgsl7LCUBx?=
 =?us-ascii?Q?DNmotEKlL2p4iMEEYimoEtDFR+t9KON6tp3ekfdIPfG6MeQ+Swqp9AJdh+SJ?=
 =?us-ascii?Q?g1hs8biK45Iynwrv7gn3bnoHpjmlYBq0AMvQ7cpbOHau73UDnFjQ7HZ13E3D?=
 =?us-ascii?Q?ca7Cihu2RkcNlhfRXRcbwtqnkHnRIujMNA032IX52jxoy245AduEHOxn3BsU?=
 =?us-ascii?Q?7MFvjIHBvO9a2V9H7YP/4dC/UqYyd+SX2f2HzwaZ3p61FO9LS6K+bbgATezH?=
 =?us-ascii?Q?2JVtTJ95VER1Ykn7ixC6DkD8u1P/5wbkqZ3CcSL4pP5y36cxrF8wZ/9Z6Cyd?=
 =?us-ascii?Q?048pn3Gpf8ACnd7S5FNMn8XCzRFqmYY3X8rdCEaqkoNHLy+obSyn3VWYZqBF?=
 =?us-ascii?Q?RqrMura81Gj4sYTPAZ/WZICNmRumKtW6gd3bhAspL1F1TRlTVyg5cVwVxbnT?=
 =?us-ascii?Q?fXmBspOqfkPuSukCWWsxJG60yzGug087xL+tI7E6dTAkBlgPRgafUxCHC+ic?=
 =?us-ascii?Q?tIVSWAJLa4JK+i+MDMM7Nb+bqTGSDVYamAQY5068HAAaQxF/wg7c5izlYkkV?=
 =?us-ascii?Q?tbkIcan6pu9q4ctBA5I5dRQ+mCcz0Lr+X6PXoaM2r224saCHo8agdaE70UDC?=
 =?us-ascii?Q?/EWtEJ4Rnww157jyrYBvv7kArFfttk7m58wSN7LOTCcuDhP+oTNam4f+Dxri?=
 =?us-ascii?Q?AoFE2Zqq3exr4cFfazxjGccE1jSOIyCLs0I0cFQzhjpitllVa1dhcqIwcfSY?=
 =?us-ascii?Q?YJ0x8aWA5ASjF0X43titQMOn2ylGwWYIefRbL60qxHRXUU8v3FCtr1YdlwyF?=
 =?us-ascii?Q?40hjmJhEV/tsvIdjajiWQb1NuMCJ1JAbStSJm2PuLaohB2a+Wsn4SQeqZa+j?=
 =?us-ascii?Q?6orVBeq74JczuVngUVxpAxGbBEdEqMI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14860608-2f08-4df9-2f32-08de7067576c
X-MS-Exchange-CrossTenant-AuthSource: BY1PR11MB7981.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 10:03:48.5507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8sq4le1Nf9ltwg/DHQnF9FAJ8EzysqBc30N0A9XTjuNh1ZPLJwnjY7yz2oyfcOGim57kNVsfK3qdAmI+xTUP96/O+W72gV3v5T1FfG0O89c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5098
X-Authority-Analysis: v=2.4 cv=OqxCCi/t c=1 sm=1 tr=0 ts=69983186 cx=c_pps
 a=uKk6FyUS+xKIvFCPM6xM7A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=eUBKwln-REtu_DbdvHUA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: vya-sF3Eqy8Q9Yn1VVBB0a2jW_rWIZ3_
X-Proofpoint-ORIG-GUID: vya-sF3Eqy8Q9Yn1VVBB0a2jW_rWIZ3_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA4NyBTYWx0ZWRfX+AeXxfNuDjG4
 ACK45XWu8HOeUkqgXN+S1ovrlsWAlOmGEgC+7p/zE2nyUi8L1dpBNffo7i+G0cmil5FPR5xC3cR
 6hl5gDCa0YkFCPy9oVUAAZEJGUi9DqnoAwlHo6n7PFPQW9cK9xRRfvCw7BU4ofEOGHnt0AyRg7x
 xP3VP4q4Znoc4n9xDzbWF6lcporzZQGM709keGMF+ECJZWhw4nLkOFaJUoYBbnsn8drbWvcAeIb
 YefgsYxCvBbSSMwdMOyYnD4sMYpCY9k9lTB8jGjZSJWLg51v9APUzP9OHtHw6CaWMRGridtAMPt
 n7DOrA3NaeuaTKBpq+Rr82n9x/N7c4Rb9AmTwRY1bM+exSDK90MUrkQITYmJG4dZnZ4QKaQT7m8
 El/U48GRq+5VgOum30U9fCPjBPIUm+o2Z4xrWlvbW8HoI56Lmor1Af7qUjZqwPP2+00EKQ9ixvT
 SdYrqHOjxxRcj17mi6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_01,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602200087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 10:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231505

When wic is used in standalone mode, it relies on host tools such as
debugfs. For directory host->image copies into ext* partitions, wic
uses scripted debugfs "-f" input with multiple mkdir/write commands.

Older host debugfs versions (< 1.46.5) may behave unreliably in this
mode and can silently miss files. This does not affect builds using
debugfs from OE where the version is known to be sufficiently new.

Add a debugfs version check and emit an error when an older host
debugfs is detected. The error is shown once per run and halts execution.

Changes in v2:
- adjust the last working debugfs version to 1.46.5

Changes in v3:
- switch debugfs check from warning to error

Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/wic/engine.py | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 9d596be3a7..8682ca3176 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -222,6 +222,34 @@ def wic_list(args, scripts_path):
 
     return False
 
+_DEBUGFS_VERSION = None
+
+def debugfs_version_check(debugfs_path, min_ver=(1, 46, 5)):
+    global _DEBUGFS_VERSION
+
+    if _DEBUGFS_VERSION is None:
+        out = ""
+        for flag in ("-V", "-v"):
+            try:
+                out = exec_cmd(f"{debugfs_path} {flag}")
+                break
+            except Exception:
+                continue
+
+        import re
+        m = re.search(r"(\d+)\.(\d+)\.(\d+)", out or "")
+        _DEBUGFS_VERSION = tuple(map(int, m.groups())) if m else None
+
+    ver = _DEBUGFS_VERSION
+
+    if ver is not None and ver < min_ver:
+        raise WicError(
+            "Sorry, debugfs 1.46.5 or later is required for this script. "
+            "Older versions of debugfs can make directory copies into ext* partitions "
+            "via scripted debugfs (-f) unreliable or broken. Detected version: %s"
+            % (".".join(map(str, ver)) if ver else "unknown")
+        )
+
 
 class Disk:
     def __init__(self, imagepath, native_sysroot, fstypes=('fat', 'ext')):
@@ -352,6 +380,7 @@ class Disk:
         if self.partitions[pnum].fstype.startswith('ext'):
             if isinstance(src, str): # host to image case
                 if os.path.isdir(src):
+                    debugfs_version_check(self.debugfs)
                     base = os.path.abspath(src)
                     base_parent = os.path.dirname(base)
                     cmds = []
-- 
2.25.1


