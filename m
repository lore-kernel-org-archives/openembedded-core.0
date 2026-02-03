Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A8CE87836
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 14:04:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17169.1770127450999907992
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 06:04:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=auImR/Rx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6494b3a7c5=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613B02kh1683699
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Feb 2026 06:04:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ZDUry1xaT79htUpE1+LhAYPaEBjyFZgKOqSEEY1jVtk=; b=
	auImR/Rx4ly1naodnXEJZhABi9CSFIRhdM/8dpL3dmlrG3plc1rWtN9isZqNM6mv
	3Z63ShShOpa4/bykkq0FfgyDR/hqXbKObaeaRxrl49UA/rnBXq9ot6s3ERoKNK4B
	buzzRpKznTxencudrVq7VAoIgyqX4JEycuI6V1gpfya3qbA2UYwJqSqofJ1O0SLo
	TtCI5Jp7NgMim+vU7DgCrPXG9b3GJlPIOTkiSHlyrITptyYj4mbKvU0UgUi1Qy9K
	R+XvPU6hyxAl/DuL1addy8TLCTAfEfoDb9bV7rttUbhn3GPSWqACqmYgyXDXv9Q6
	CwT9UkzKjUj/vsKPMh02FA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010013.outbound.protection.outlook.com [52.101.193.13])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c1dw0u6e1-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 06:04:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cXObGYI3ImOapAt6x6p4jelHQ4SmxDR7XViaDc96FMMUuIqDFd/qsJ+yTaWW+EnzJarham39QXjDHEKM0BFVu82SmfV2rTYCdEkvM1ubojwwC80tvoAeuQDCl3rEV2D1zVFnRU1pBtvp8IeM0+HyTGg9OyJREV2YvaWPVJHGCT6hIE67IXpUQUtXj6BdzdHwFMK3a279AbHXm1J61ZwAnjBFZqZqQ8AEH/PePrO+aOqhTNPDrS7fq54zOtarfH0058i4NU4+xoCF92g8/5tdJ9nrqo7bY+hPSpm/2i6e5tQzf7iUml0cVnt+kykDUZpmhNkTXO1esDd64DHJRAP2YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDUry1xaT79htUpE1+LhAYPaEBjyFZgKOqSEEY1jVtk=;
 b=V7AyOaphAoMo5HvtjFKieND9OiNnGUsUtjp8848fCZNFE0Pq+jjSobReR/YKZBc0RSpPIIDP6Nh/a5OytH8Gd15se+evuosW3YHZ/Scu3U3kgVTnlk+ACfQraMDHBbGBsPSJGgzcOBxmaHwzc12w87PieHvAR1TEJAE/UHc9fqxi0jalqwSlnizLjkC/lGbGagAw6/UhDgaJw2t14SYCXlB6wKLESplvaXsz3ellx4SxEjSHaZGg7qUbfKPpyOi1UWAe2J18LoPqynFSrpcTQkkzVLpXvdtbd2GTczVUPgAnqmvLYIOUecVisFytHr8DKDvB5t/b7ZT4x3RfGh5frw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by PH3PPF1618AF7BB.namprd11.prod.outlook.com (2603:10b6:518:1::d0a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 14:04:05 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%3]) with mapi id 15.20.9564.010; Tue, 3 Feb 2026
 14:04:05 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [RFC 4/4] rust: Fix rust build failure
Date: Tue,  3 Feb 2026 06:03:28 -0800
Message-ID: <20260203140337.1971735-5-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260203140337.1971735-1-Deepesh.Varatharajan@windriver.com>
References: <20260203140337.1971735-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:217::19) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|PH3PPF1618AF7BB:EE_
X-MS-Office365-Filtering-Correlation-Id: 05219f49-a35d-4028-29a4-08de632d179a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GsHu839voAMzQULUQdtGRYKJ742Jbx03keazELZN2dkoJBBlaeJA7WXRLK71?=
 =?us-ascii?Q?tMede/N8D6/H2VKEJFJMj1xuSwRSV1lnZI9uLm9nIkU5tK/m/KxcxqfygYLE?=
 =?us-ascii?Q?V3oaTC2bBxWG45OZ4S131ZVPAgNJgHhkcdsJ3uY//JbNNaBxbknnUf8e0hlT?=
 =?us-ascii?Q?S5ByoPqZMLmX8nFP0CXJ8qCJxr+B+zpPMBKwnTgqut3J51DAxXF25lB8HNr6?=
 =?us-ascii?Q?PLoLJq/5w+loZS+9O+sNNWCpWLth7UuUmmpMCYULDjqQcaMvrrrXyE/zvA0F?=
 =?us-ascii?Q?c8clQ6c9AQ2JlixurSpbsG2rshyH//REliqUFPvmlQDcCaAiNYlNkHOoomx8?=
 =?us-ascii?Q?KYvSNz5dtDo4E9vQdJARspopMcMWO25mbC2kXCNiFSrowHrhllBShHt7tmpc?=
 =?us-ascii?Q?4oZ8gJ6pWHMeWwcIKOhIpZWFCyHHWt71nn4JZPvav/IYFWXgyNgWskKZkWMw?=
 =?us-ascii?Q?rQ9pOKtvi3hF7hgcDEUuTxb3e7/VhIXN3GAqHt7lMIHcwBCH4N2vJSN2clFr?=
 =?us-ascii?Q?sa28CHB9oh1MW0jqlFs8YobsFIynObNUg3fuMX7xcpCif6PdNUtpbkc3UPsa?=
 =?us-ascii?Q?MhE9uKUFUYOKxvIDu4Q9TMxhgmCon9DKF32iv14PdGSrjTpXf9IhvZv6dtL+?=
 =?us-ascii?Q?PcWmpULt0hLJXbymFe3IvTx4BIrvMYJUfgg7COKb7/mJXPgZpEaK9uBz4h05?=
 =?us-ascii?Q?Of89/XaKh/69hFtq7Xq2bg9pKw+TVb8WzwDqgIyWke5HMzLtEpW6vM9y7yq6?=
 =?us-ascii?Q?DpV0GeWrgd8zGBznmbWNqqHNiKbb/TjZ2Rp7G8bak+9GvJ9WpuNNbnDb35Dy?=
 =?us-ascii?Q?0hPi+LYjiwfpXfL4sjOaSgjas7ukOP4k6MZpKoEC6HtaOHhaQrr/nyHYPRwN?=
 =?us-ascii?Q?fSvIDrcguhaDji8UP9ixNMtCCvQ4HHee3okygRE1hucrF+2Vb7gUOAFdBjeG?=
 =?us-ascii?Q?DKhKSC+sTVwuwEcndX6efJKgmmJzQbVYv1baxRLuQ1oAdRzWjACdxFNX18YK?=
 =?us-ascii?Q?N2aATxuhIpY//lZvzYsD39N3ng3hP4qyncs91wvdxeVz9Xq1E+xtJCg1I//P?=
 =?us-ascii?Q?+9rc0IHbTIHCOW0UsMnXkWYMV+4k/Kz9H+YTZWwLV1bvsdOSVeulwmcM3vg5?=
 =?us-ascii?Q?+u0FMp+WdekPu7v/+iW1Zx7MmctYYrd3HUno84HCUjh8t02WYdg7m7kpLkNH?=
 =?us-ascii?Q?bjMigJzZUkZsWVvz/uS28z5JXKUu4cB3Tft1mXB+f1PC2GIRYiLWqvsBpkVI?=
 =?us-ascii?Q?4NWkhqIgj8N1Efm3Y+BPA4PAWxO/jJul/5uAtyHdbathZUvJbQTMdAv/f+oj?=
 =?us-ascii?Q?H67dBXlRrd28mWH5Ncdew+R1wdXYdNyi7n7d2OuBEKl0/MvohDMnit5VpMl0?=
 =?us-ascii?Q?8pbvMnYZmYGRVLcNwxVloP16TE9HvNxGuZGRsQbnK/2OcqBHkTDsqnFR/J3m?=
 =?us-ascii?Q?qOX5P9PAC8D/6UZKcGcdujd4QWNvxSW2ZPU1AUQbe7vY/sBSyBlPdc3W3QHc?=
 =?us-ascii?Q?3haY826FbEwrTJ/s0+ao2VwaVnQa1s2eBuez9bFvOf4PutLCfKjOlrjgvO3v?=
 =?us-ascii?Q?IxJFuTLEKC2CAQEsoq/8YwE0BJ51bwAKb0uecgp3J05kwu8l2oPZcF8I6rdj?=
 =?us-ascii?Q?7oaZNuvVAdZNFWArUM8t61U=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zMHCGGChrNCC+c4xvgoCKme+wEqjnhTvbc0OpNX1eGZemraFkH3ntndbOwFo?=
 =?us-ascii?Q?36ABhd4wq7yryd2nVEpNRvDJA1zqQ3S6KtNjnQzjo7M0YckJeWs5RTwCyUoi?=
 =?us-ascii?Q?sxxyLt3pnj060NpDVhmM6By+r8bc/icOSbUmfVoZLWIKO2RPSchUOvwZt1nr?=
 =?us-ascii?Q?2dXzBdfJGfwwdWwyM0qryMod5TVWLbV2dqcGaCGaGFSNai+65sFUQhPtdrjN?=
 =?us-ascii?Q?XUlydAPHUXAabRaZDhiSLieErjT0BgSPJJrbD04drs08BkzoUOpEk9fbR9uC?=
 =?us-ascii?Q?7H0oXY3XDOLCIU5l1E/LQD8gupb9nqJxd9s2GiCteBfiNR79f9ehPZ/igZgF?=
 =?us-ascii?Q?YsalF53DvrmI/VxFr/1lWiU0FtIND9D1e7/gpRXvtVF0NSpNLpo2HrgVsA7f?=
 =?us-ascii?Q?i1ktb25uR/fRJxOn/umfAS2bs+MgizWxZaosB7Mcs+YQ9c5xvGRCOW9lV73u?=
 =?us-ascii?Q?yktwRcrS+9DgcMcxT5sbG38tH42mSmuxN1irRwpppl+dv7KCjJS4dvu1kFOX?=
 =?us-ascii?Q?1CCtSWliasOSMF5MPhzBX8lwlMt/tN7OF3G+y9aETEM0A0wmSXilylHHS3ih?=
 =?us-ascii?Q?q8/t3q6N9NrAIxuZRSIV18dW2YhBTAdzAd9Y4llFTLT+iwoyNdOae5ObBBrk?=
 =?us-ascii?Q?y4hrQ+vrD8jApr2IrXBH1W+1BRct9Gh2CSR8ySBvP1LaDSME2XcRegISiCrj?=
 =?us-ascii?Q?TueT2TwQXAiNn6vOYlOyb46UNyu90ffr/LbYQPJ7Be/UQSbQErSOntYFuFnP?=
 =?us-ascii?Q?hFUpcPES6SzCLHEsxYye6QgnArxu4HPHe4zlDwZHu8WGLufGcFqUDdb16R/Q?=
 =?us-ascii?Q?bAi3uTq+uGjOtb5aAbtLpWJvmbdk8ZMIGir+KjJvEQUCVyG4Wf6pX5x3E0IK?=
 =?us-ascii?Q?87ZggmVXOinVtkVAnPtkV/n8XksVgQqvfBGlZAkvg0MTKYIKxaBdXqzA50xX?=
 =?us-ascii?Q?/bZm+9VqmwX3/q1XCRKlrbsZsuG1Wi2yOofxszfK2GM8yMDA4vRTul10fSM6?=
 =?us-ascii?Q?XFBGQdSiiKaf5ctzFzi2kwUsxTVlD8zdms2UhQ1JrDYLL7bah5surEfdM/j6?=
 =?us-ascii?Q?ckT7lLsJWiS7WRT/pabdHFxeBYOTR4jjR5RFbZVnY9MKYJg9BH9UzRiqMVLk?=
 =?us-ascii?Q?Zgdv61F3c/2Z48ssn8gUUhoIu5oZ/5FLWSh7bHEYTCA2hFdR40Tyg8mjlH06?=
 =?us-ascii?Q?oPtU8zX3+BkMsUGw6yAA5doi/jHc7aS07tVBBy2l2+VCVfAoqyLZ6aZSHTbA?=
 =?us-ascii?Q?9VhPR3AtSV+nIk68hju0VS1PM4kEYdGpOmovtBUiCtq22Usx2rvztnbK4E5B?=
 =?us-ascii?Q?o9rj5olfi872DfTDhSFJ6ajcj6D92fIKsXinIHSscDyg8rDH92u6ytSTAcdG?=
 =?us-ascii?Q?cFHkouv1lYBelB1yzdyL6AFMBA1zHHWFul6Lyvquq1e8UQ+bZJBL/nVmffyb?=
 =?us-ascii?Q?A7NQNgKZ8apFAgHYcRv1jFjTP0blzyS6KhkVYa+t/goa5MD8p12rkCtunDzo?=
 =?us-ascii?Q?TgSXwf5LCQo+xVQ4zXoanwg/tkPGfCOPQ2n0gUOD3Zumnf//NoCY6zrN5s3F?=
 =?us-ascii?Q?Krqei9+W4gDR+1EfZZ+LSUhidVroQREC+nthwInEggT3KNxjpQFpZxCpKgxE?=
 =?us-ascii?Q?tkaRwfYdsKq1ksL7x7eoDd0z7iu0pQTOrVrz4bAzA60dVtaCF84DnIfaGAdA?=
 =?us-ascii?Q?p6uNsRHQ5NMG1CpPPPXu3mbjl3RKMh/I00U98mzVq9PcsSGGsm+oIj2Ku1vI?=
 =?us-ascii?Q?OsRGOTDRl+lN2Djr/f53WrT0W/oounP/eaMCs3pvbktGE7K1yB38?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05219f49-a35d-4028-29a4-08de632d179a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 14:04:05.4880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6PFeRh68e4IxsjqnULnZEL4iHdJUn54i+CiCVNrf/m/dMUvATIq45nziz6IVTd73GmgTdRg2JDfZ1W7PVx9YtXYKbJUGs79eRLD9SvylLC/3D1vETvy+lY1UhhiswEUa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF1618AF7BB
X-Proofpoint-GUID: 6muD62MCoC2zYJopFSyTYjOwbD3zYTuB
X-Proofpoint-ORIG-GUID: 6muD62MCoC2zYJopFSyTYjOwbD3zYTuB
X-Authority-Analysis: v=2.4 cv=Htd72kTS c=1 sm=1 tr=0 ts=6982005a cx=c_pps
 a=N2Bp1sGBA0q5hqNMPvyVyQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=DfpbHnMvOTcI7OWzoXcA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDExMiBTYWx0ZWRfXwJ0boIcd0eTy
 9au4iaQENK5jVjPXJhxjlmh+mjtpZWb9FpTmXXax6UMh6bvk+puQSsTHLgX7j30pOOaya1Da+U0
 s9PS9029vH6wdjFaiVvUNerVmkRrr8fleJyE9s2Ty7pHxl8L6JFC/S2xl0vkGVr64xGTHBdmMmO
 LTP4n09/KGF3Q4GcmbvE2CiyOkXUOjXE7jLZA8YCZFdHshhra0QVSYX840O2saARxC1eYDTgXMx
 rhpXEaKFC+PJDyHUlWn0L/XHagC9647qxSHT7phSUEdkU7Rh4a2csSb58GdulST7QFqR1yZC1GQ
 YBioznk1RacbDrWuLd9ZO7uAmUxh7ubYzKY/OkgpKvvuElsYlacv6jK22cjy+BoFDxli74Sb44c
 29leaBhW76PCOS1JhjBM02ZIFlNx4UU/mzGNO2oxnpCLIGngqpDb1pnNipQ3gw7zZs0AH1vB+8C
 4K6duwFNRPQKeBEgtSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_04,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030112
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 14:04:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230457

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Target LLVM tools are installed in the sysroot for llvm-lit, which causes
Rust to pick up a target llvm-config that cannot run on the host. Overwrite
it with the native llvm-config so Rust can execute it correctly.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.92.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust_1.92.0.bb b/meta/recipes-devtools/rust/rust_1.92.0.bb
index a25f65f674..b1d8597056 100644
--- a/meta/recipes-devtools/rust/rust_1.92.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.92.0.bb
@@ -234,9 +234,10 @@ rust_runx () {
 
     # Copy the natively built llvm-config into the target so we can run it. Horrible,
     # but works!
-    if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} != ${RUST_ALTERNATE_EXE_PATH} -a ! -f ${RUST_ALTERNATE_EXE_PATH} ]; then
+    if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} != ${RUST_ALTERNATE_EXE_PATH} ]; then
         mkdir -p `dirname ${RUST_ALTERNATE_EXE_PATH}`
-        cp ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PATH}
+        rm -f ${RUST_ALTERNATE_EXE_PATH}
+        cp -f ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PATH}
         patchelf --remove-rpath ${RUST_ALTERNATE_EXE_PATH}
     fi
 
-- 
2.49.0


