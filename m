Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6133DEE36BB
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 18:05:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51607.1770919526856517859
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 10:05:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NS9mXIUL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6503562417=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CDELdu920401
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 18:05:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=HUzEbdSMMter1Mez12VfRaLBrCG4OiYZpTzGOiTNuCg=; b=
	NS9mXIULH044FF7ZJrKMz59Q6518CVCrMOMpR6luTaSBKrUE8y20BTlFiXP4RVeL
	hXPi4pI059Wr+loRPLSXwWuEH8mvj7uaBTRW234m0TRUPdkCESM2HzHXNonGiphe
	kT0NLbEBtKMVBHqtzkJCgSi3y/L/mnfsSN9jiLQjryITCTf98rO7lisEf42pljXO
	rxtamk4cpTp/Nlhi18k9xKnS4h3DYOleWC4ZlY3jZxx+f8DXZ7mHGazW16eur4wQ
	ReR1TZRQF5EXcLLdpS0I328q7SgVDIsjiuVi9SmO+WHE3EmpVGgif8cgkxoN0euY
	nf1KGWWRp1JOHx1m1m1r5A==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013052.outbound.protection.outlook.com [40.93.196.52])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c5vc5eemy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 18:05:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dQXbvD0rdRhIXecM8Y9dyZO6Mb/n2Vd4LvlNHLJydL65wxHS3kHk2nTnuQW6oVCUBhHqVzbwgNQ5TKDonGNlkIaVL7bF2onposByCMPjC795mJCwZoP+QYlkTV1dNnL8O8xaWQG1WtNR8Pr6Mcfm+qI9V/j5OA5R8PqycxOfFJaDxFrGzTfogVE7e/cpSD9/VUdoy4+qot0db9KuvMQNUFqhdtkXffVdKsnzqAzC0iYeTn/JjId/R8EW4djpQUFaYZ9X+N5VH3ASNUMFh8d9gZfXjFTj7u1t+NSVfQmL4gKncB0yZ1T15WXSeNC534byPlOKlyggz9JBOG5d0JkhdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUzEbdSMMter1Mez12VfRaLBrCG4OiYZpTzGOiTNuCg=;
 b=pfE16ObRoVtRI1vfq5sKMswSJeVExC0kxS/PCUscYb9r7XYDYcBv9+l8oPnffWgkjCcpq6CoMVIlKsOuerI5f9Beh2CURXpG82oPGiAzxwptbaTxM3Yf3T7Jqvm53m0z1+KBtEm9GgL3IxuzR/pIHgEaZyo+9qPxYy+SCTIjQ2UKhs+ME1lSTM+OcktAf/+puGowooF/+EWHO4AmWlSqkaLDkovrGeFgjUQ+0oFONG+xZ1sRqn0pIdYlz707Es+t4Sb/beGqBVt1DEA+wq8nxcrX/dHYNuiRnAc9nj9m7sW9ZomfJ8XLJrvk0z4F/YU0VPlr2geJpOCECH4XqB7n7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CYYPR11MB8432.namprd11.prod.outlook.com (2603:10b6:930:be::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 18:05:23 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9587.013; Thu, 12 Feb 2026
 18:05:23 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, paul@pbarker.dev, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v6 01/14] linux-yocto: conditionally add clang/rust/bindgen-cli-native to DEPENDS
Date: Thu, 12 Feb 2026 10:04:20 -0800
Message-ID: <20260212180433.1825988-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260212180433.1825988-1-Harish.Sadineni@windriver.com>
References: <20260212180433.1825988-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0057.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::32) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CYYPR11MB8432:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f023683-8d35-4a36-0922-08de6a614b06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nU8lPOhBrcKlB2aB1kaOHf3lgWod1cO3KAO4FoLmMQLBWF5WHYSlu5NU74Vb?=
 =?us-ascii?Q?MxEU4AQflbxA4rn9JSG5mq5TwdxGqNYPOVv6hOCAaSzIxkMZngXXcbMjKjMW?=
 =?us-ascii?Q?OhItjBT4ztzgx9sTkXsdl1Eq4ctmIToIkoVW0qYW9yKryTz0ssPM9cr1w8hU?=
 =?us-ascii?Q?wngnWmHFo+jVliDjqR0Ev74yFHNrqqbA9/OCy7FSCThjmM+yEsvT5baiY4Hi?=
 =?us-ascii?Q?nWDU6aSxcWS+d7tu3OzNBzDjvhzVThzd+eydHIMTbmPui5vSCjW0EORH+SHA?=
 =?us-ascii?Q?1JbrWxt5hlEq/OormP1JzUDGhhJKYtmx3f6DaIoBC7r2D9Ub1uM44OLZl6vl?=
 =?us-ascii?Q?W338jPG4gAqjw/yjoZ+gUNvu817kVb+tvD+qwNG1ovZNtZSIHpGZXm7IRNNR?=
 =?us-ascii?Q?OGRF9KaGsbI7ZcGYspFtYH1zAcpiOE7jTaYTYWJR2O1B7OyM/i5wsyXL030N?=
 =?us-ascii?Q?qniDJ5QBdy7/t2ron+MZb+rDy8dUlxk6ZlzBfSLVblBk+/Lzq3H50wgIUD2W?=
 =?us-ascii?Q?EHiEsLzANDiGGEN9yWdTGKzLDIFDerwsru0+9+gBeqx1N/A+pGy5B8OyNKVz?=
 =?us-ascii?Q?rTy37fIZJFNdlySgTaikmtoLRHtHRigcaYvuYL/NDS5km05XReprW50X71/E?=
 =?us-ascii?Q?UGShXQqPOP9TvKgT3/ZUN5Dml+OibPhKBnJwHJlEn1NGCgotF18GeLPkL+MT?=
 =?us-ascii?Q?IZ9NwcbrOP7/gQOt/GIcsCrbB+EZBPEs7pMoob97XF5HqOsNMdb2SCgM3q3K?=
 =?us-ascii?Q?jAG7vJBHpvA4hPY1uV90icRMw6FxbwQcuN6EAzG0IVLC/LHt8kNLZAQkuXyo?=
 =?us-ascii?Q?uOa6PmSaAbvo5/sFnIbFJpE0gu9GJsMHj2n6MIZuCs914vjIfyzpQwuhcnIQ?=
 =?us-ascii?Q?QM2rzv9L4m+4WkaIUHA12HYwELgmcfjUP/L500T/waWm5XnEQ0S9bxl+7Fd+?=
 =?us-ascii?Q?kXXxHI3uF7bfXZlsVJvRLKl19++29kXJ/xojiAqzQg9HJ7Qu5w4PYa/U4mXs?=
 =?us-ascii?Q?tEYSsCut8AvDBmM7AOvQ/49kDiOC7GjevvLRHlqwPQiHHdSTV/zomLlyZOD1?=
 =?us-ascii?Q?AxldAlBOfl8c1obQfQkfyLZHkbeSh1VFS4qjtmdmKso1kT2baKsF3G1036N+?=
 =?us-ascii?Q?SeQ1XlcdO6sd8whuHZji0Nxh265sg1i8aWDk9l5oyRglJMoOIVuYOJCxLQC9?=
 =?us-ascii?Q?KCu6RQGa/OxSu6KOEBdM3MEl44I/ezQMOkI2/0Hx2k2OzzYhwWUzntXtDVkf?=
 =?us-ascii?Q?k6e8zYfj8dK1KSDB8FXDP7orSmfQwR415D4+kAjLVpyGniUUOaSCeEOAutT+?=
 =?us-ascii?Q?qga3GPcHUgM4R5IPUDvTw2Ki4nwof4medlKQHW7Bug8JaHfbrIV/tpJyWvxV?=
 =?us-ascii?Q?Le41/aA29R8T+4sQKkjbt+Ica0oYtKynwXmh6yzBRhfRDsimhlnOgoWEVXf6?=
 =?us-ascii?Q?YbH4sbnmUqVBGfxDtQTGEqT7E/eGyOG9GtwzwohQdYG8LBBmogH3Q089pqFr?=
 =?us-ascii?Q?oLt8Je8UzbLDZAc3pM7Q1sOeGRSNTR42XaLGNPxdyUDmbBQmBEjZK5nDzSfn?=
 =?us-ascii?Q?SoSA5vEZdPkY0EUUTGkWQx9QE2a/TTkj178gDDXL0Uw0WweEgsoEy/1OAhQB?=
 =?us-ascii?Q?FymJyb378CW3IkvAUx27JLg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OOhjIInSyePYZ9RkbjwVlV5IjETb5M8Pjl+IGkgJj+W6hPB5s9xv4I0EDiIb?=
 =?us-ascii?Q?zZqXs1XFUC5zHVL4OBn1zU4yybYZ0fRkd5YIpIXYvluFCSitrzg0vhVzPVGa?=
 =?us-ascii?Q?0bRPqLq3PsKty2zbEwCneEFtMOvTdr2WiPWyckG8iKObDIk6USZ0BORgUDzn?=
 =?us-ascii?Q?6dVZpNfnTF5P2rltoocIvpm0cw1QrvVDUTrqJ6GpE+betBR+m9FKj1ScOThp?=
 =?us-ascii?Q?IQ44YwfXCaBgn1Xn01eKJ3geMLQrIWEXMwJf6v101xhuEGWME7CHWcau5LGG?=
 =?us-ascii?Q?Snsvkx28MqKdMTSOCLgqUw3FTImjdMo3J+BoIAwnV/bxXMurtN/NFggmXh/A?=
 =?us-ascii?Q?1DattYP/GIkxbq7jI4xYdhbFTutusFHPoTw1SEjtSiuOtrThRl7Whd5w+4C3?=
 =?us-ascii?Q?QhhkSBtPJ4ZluEVnwFkNvmsv1YgEriqKRb6gw0qqkXnVR4AuQJDi/OghUVaW?=
 =?us-ascii?Q?C2iphvPN6Xp8RUCJywbJZfCe1gbHPGSBuoFxfeoaixI1oFTxUfQpyqDcQidA?=
 =?us-ascii?Q?cIagvf7NANzcnfbtyVxcDD6RUyTXmLpjJG6zpgk+vNgKtTAFoGG2ZqOjMkjB?=
 =?us-ascii?Q?2VzQ4d+ozNgB0LwRbTNJRLNl+IEPgYDqxQPDc7RJS2C5wJ2rSuzNogCna2He?=
 =?us-ascii?Q?rwAG+skGW0pu3jdsTPqXCdkaH5+L/zq1/xRSvAKlt2cSLtzCnYMHmpCuy8gL?=
 =?us-ascii?Q?unHcCK6fOaJPf/Pd212nk7lGG+9LT+BxbeXFUFhMuCYM9EdsP7nKjrVV/DcD?=
 =?us-ascii?Q?rk6eLXLSIcegRNwBscmaergt2mSvlQ0I7MKzcNUQYCbFA9cJ5OIxQjN1rNac?=
 =?us-ascii?Q?DZzx9pcl5ewZLRz+j/WqQtEI2X/kDatsmk4czUg1L4bRFvANoA2Qw+XTwzBt?=
 =?us-ascii?Q?xXMjZD4NNqB8aDr77ikYETZgviZKskj2Qo9SUJgOJjzhL1rk1JNaBTEX5SwE?=
 =?us-ascii?Q?fGRJmtlQNaAvxClgw53qkoAlqArDxrC3vWSp4WvOM2Zn+X207mNm/O9/USID?=
 =?us-ascii?Q?DFXJ2lC98iLOlhLB0I6CNReSFWpNtkQN8cLouag2g4azrl3pCsU3JOCrmZkf?=
 =?us-ascii?Q?ekZIBUolu0e4lcCTbKKLNGTZBHkDBImhF83AZTf8CuKMtjgkWrQD2PUvnZd4?=
 =?us-ascii?Q?egSaQNg9CNPvDKVj/QhrQxdDbj5C4JH9XepZ0rMJNLkVUBpwZjR9yqmOiVa3?=
 =?us-ascii?Q?7yoeN7P92l3Po2IYcXfoTke+NbXMDiAX5YlgzOZlAodwKrr/i0QBKDuQHpnS?=
 =?us-ascii?Q?u5nqpDpjluUoc46r+lW9fSP8ryht7lsU3LwsEMNFjOc4otviv7AFRQPNxeY/?=
 =?us-ascii?Q?bt7diVljSE/hQDChh7oZg9GjwI4pQ8T9DZXJTD7BFUP31Ynic3cD0D1XdXb8?=
 =?us-ascii?Q?/eJSr7ZKJqepY+dSlOEKdezrJHyfxFtO6xo8RGVgZZNrCBgmlpoS9DQ74RPY?=
 =?us-ascii?Q?g418rOCcQtP9ujp2kPeplQRI4qlkbWP6sHBmKaEFO+oGeyyCB69/sbnYBljY?=
 =?us-ascii?Q?PoUnQQxN5Rb6P8GJofi0kdNRfek5vXWF6bdvNvsK/iVFxU0jKl3pKN20N4EA?=
 =?us-ascii?Q?RmyCioo2QnLXbYh4TJJvTgyK43gER0nHPi4SOT42IE4k/hy8YJ4VsRII/igw?=
 =?us-ascii?Q?NvMHK4+WPg44gWiqLT+Z4agi1tnyvKl4PYgisGePzbBOjGtocEFH7wYcDZ9w?=
 =?us-ascii?Q?PDA6U3r5xcdq/B4HDBdcc85r9+0VhtwlcNKM3xZUIK3eCSjx9LpZaNPDelGh?=
 =?us-ascii?Q?dzxRbEHUV3Iuqsn75UQXX5NWASzmU6I=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f023683-8d35-4a36-0922-08de6a614b06
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 18:05:23.7215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /5k3te9/5GFlJOorHtKCp4t65Gw/YLrHMehcX0rn0+Vy3ewQuKZhkJx71BdMekeZW0iLitNwzp4VK/GRAbBgisQKjIWOxYc6n3rWWcq3RS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8432
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=dPyrWeZb c=1 sm=1 tr=0 ts=698e1665 cx=c_pps
 a=6cA/pxPA0XCUgbB+gUSklg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=t7CeM3EgAAAA:8
 a=xDSppc4gPdY848Tsl7cA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDEzOSBTYWx0ZWRfX9SCcx0q+H6c2
 o0OOOHHeOxXT/Bi9siVNc4aN2WD4VuHO0XELtEvfv7anjg14xf0Fp1diZ1JpP1wAstFWJaZnjmV
 dgGGD5r7wN3VDhJFIPQP/1KW6PXmIOVuEA9KmjCshz1LBUXsC4SyoU+kWs4RZSgz5cLgCPPFnH+
 h/113dC9egju8MQ++Lkue62lwwtAz5blQs7L865dQoo0COM9CsWxbBIDkSBmeVcd7UOamUVMBga
 M7UwbdYaEqyHe2Aplsi7MBHu+Q1s4lymI1gyGql12/OJuDnrMPPsvEfpJzNpVslAPSuywqTgqDn
 pm4Ij5VXwHhMF8rIXOnrLy7IK4gh5y3tW7yoHlFlL4twyTWstQ/LZ1pEBot8vjAVhoZk7GdY7HF
 FAOkENctOO73guYR/lRdupa9jvH/65img+QmAj2p1YSfuUYFBLR6aUSkN1E/GSeuPVqo6g6yiQ2
 an8+lPz+ggYwk5Rapxg==
X-Proofpoint-GUID: c2de2FMX2P_uoedvvb4d1Ni2KBNryPWW
X-Proofpoint-ORIG-GUID: JDHKc5GF1Q78CR18sf6Dew2ZrNY8z9bs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120139
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 18:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231056

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Conditionally add 'clang-native', 'rust-native' and 'bindgen-cli-native' to 'DEPENDS'
when Kernel Rust Support is enabled.

These tools are required for building Rust-enabled kernels and for
generating Rust FFI bindings via bindgen during the kernel build.

This ensures the additional dependencies are only pulled in when
Rust support is explicitly enabled, avoiding unnecessary native
dependencies for non-Rust kernel builds.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 4d0a726bb6..b7961bbcdf 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -76,11 +76,14 @@ do_install:append(){
 KERNEL_FEATURES:append:qemuall = " features/kernel-sample/kernel-sample.scc"
 
 KERNEL_DEBUG ?= ""
+KERNEL_RUST_SUPPORT ?= ""
 # These used to be version specific, but are now common dependencies.  New
 # tools / dependencies will continue to be added in version specific recipes.
 DEPENDS += '${@bb.utils.contains_any("ARCH", [ "x86", "arm64", "powerpc" ], "elfutils-native", "", d)}'
 DEPENDS += "openssl-native util-linux-native"
 DEPENDS += "gmp-native libmpc-native"
+RUST_KERNEL_DEPENDS ?= "${@bb.utils.contains('KERNEL_RUST_SUPPORT', 'True', 'clang-native rust-native bindgen-cli-native', '', d)}"
+DEPENDS += "${RUST_KERNEL_DEPENDS}"
 
 # Some options depend on CONFIG_PAHOLE_VERSION, so need to make pahole-native available before do_kernel_configme
 do_kernel_configme[depends] += '${@bb.utils.contains("KERNEL_DEBUG", "True", "pahole-native:do_populate_sysroot", "", d)}'
-- 
2.49.0


