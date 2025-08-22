Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F49CCA0EEB
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 07:12:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4028.1755846767294062329
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Aug 2025 00:12:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=H9jeD4i+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=032937f5a3=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57M5SiD64163098
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 07:12:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=H4VcXyKOQ
	mfYP4phzBr8zarweZq4LhIeLo0wEBsmCjQ=; b=H9jeD4i+YJDvbjrvoqpE9Nzif
	taqzsGtrlBNwxUR0vroaLpGQ2j1C3i5yj9CYLWJAUpRaLo8X15fZijG9X2Wdba6Q
	h75DyacDIAM8m5FyeZNVwCUrfsIH5a7SxSjJEsEbkl6g/+oEnniSwtBkeuA4Xvdo
	WpNoOH0ileJhJdBhPB2NYdON1ULlpiFboNYZRRJTPbyoyCo1uozrPCDyjXzgEdII
	fJ+o3n4LId1xwFpceFH3mPGNd8lOVhKhTfz6o9b62bL31CsYYFcGcftVg9EgOWhi
	YEE0cfGP42vpLVIYd9JBlYTFzqygKvBE5vJcKv5TciSGzI8ufJLF/VDKsvrPg==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2087.outbound.protection.outlook.com [40.107.220.87])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48mydq3f2t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 07:12:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQRwBGelpQgg/VSIQK74Yo2IeuKUJq0jVaEeBjSNvg8we+a+wSYPnq57gKKkQ55BzRWPzzEnZrNM1Bepcm4K2kFT2j7WUOb13Xx9kyZ6UiTlfcmyfEBQHTkeMYSPofrcHrLUsxh23A/gbTMlmWikCqzgU2NJJTbvbb+KNOYQNgVFPliftdtw2gJc0B/9G91IrEjZ7t45q02juvMH1sT84CS7/8ixsX6OLdQPahY0JP6R2sjCjlRl8lds5LFkbqxRrNNerC9dk0t1gQEdpOCeL9zIHmFRZXg62+/GTOsaNbBsKQ/7jVSiioOz19rzC2BUhjyaKCJAqHTa/Ir2W2ExtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4VcXyKOQmfYP4phzBr8zarweZq4LhIeLo0wEBsmCjQ=;
 b=NBtqA2tkQfzMuuxTslF7zH1ul+fJedi3kq0C6GNIy2lZhDID9//h5dL5wuG8u9rm2CmgY7028Yc25VjFUANgscT+nFTCIr/BZojc0SKTQ4hG0S4WPXSNjDXB05+6X1HBy/ZQ/+0AIxjnntj2U/nkRbVDVqtZuTr9CQlOThuf0o8ZSq9oZIu7YvMFQe6ZtM9VXyamNRm3zH863IcuJ6INsaShgJBNSoJTZxKUW/aBvxIuGmeEvfTo981Kq1eH0d5rwSjjaaZlS+Don3F4rAotlJrqrIbkpJjSfCNzTSESzuPZymn+R4m9ykEYE+QAziQZCb8C43qA7EzDLa5Vw/AJPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CY5PR11MB6259.namprd11.prod.outlook.com (2603:10b6:930:24::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Fri, 22 Aug
 2025 07:12:43 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 07:12:43 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH v2 1/3] gcc: Oe-selftest failure analysis - fix for pr90579.c test failures
Date: Fri, 22 Aug 2025 00:12:25 -0700
Message-ID: <20250822071227.3304731-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0047.namprd11.prod.outlook.com
 (2603:10b6:a03:80::24) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CY5PR11MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: cd349945-70a6-48ae-aead-08dde14b49d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZybtOj6H6cetLa8HcsDi509dxcJEO4N2/q1lARhUC5bxnbp8Gp8F234AiskA?=
 =?us-ascii?Q?nkBCMwG6+xujsufkExS0QwjkQ/C7bnKiqHtM36w8Z/ZImuqzU/nwTP4k3D4U?=
 =?us-ascii?Q?vct/ZP3FnRMdf6eQ8YufdoOK4U+lFo9F6rs4TdzGWD/GM7FaW2M+PGG12XQw?=
 =?us-ascii?Q?loadZUP7JlrTJyzib4w+qMxGAU7Xe+nyLnkbbR2dm0772rOCBMod5RbWRSQw?=
 =?us-ascii?Q?dKvEwZAiCOWK9KTLjxODRkBM+bCVyaKbMWBLCMxdMe1CtPg44kC5H0+7HAMn?=
 =?us-ascii?Q?UOcCxDLF9K3ZAuRmBhngokHxrwSBo5V2PNoN9Kfn89Y9O0IxAlyD0QesL3M+?=
 =?us-ascii?Q?7YuY58e0GrvgBusQTEHM0Npny9LnoveD8YJb6z7h6eKgH0dZK6FmyPFjqlAW?=
 =?us-ascii?Q?0rVfFF4/Et/zI5Zz2mdcmIIWcAooen8r7l+/1V3/UAT67OTaLWYh7deV4+Ik?=
 =?us-ascii?Q?hq98TPhshKG5vv9fvUXfVAQVVoRuxEABdfP1Ho56moNkxYyiQOII95qxzg/i?=
 =?us-ascii?Q?9/fNHYJfVzBtttGggdIfg1jM9DdHZVBUuTbztZDPibQFp4s4M1MlKnaVD4hY?=
 =?us-ascii?Q?IvY9qEg/CJP2QLEPTu02mi4EBY8qYJeM7TJTb/g1lscUQtdi13k9vNYCuo+Y?=
 =?us-ascii?Q?/MafrE0t2eEeQd5ffeRj+aPg9q4w6ASpfzImiHSrLMAr4ZIonlvWFavPG4/k?=
 =?us-ascii?Q?UxpeCYUp3944dPtU4QuYXahh/XGeXDLuatNTa57P7cbIdJQycGIOZf2qyv38?=
 =?us-ascii?Q?2oj+b+IlCjVULNgetLpFXbGN/hHzeWbcoqjXUwJgRYf/7Eef2QHAQMd2gNhc?=
 =?us-ascii?Q?E1Ta7d+XlbngnoPKWnzPBivCQPZwKQjBZbKGkk2qwiuTGxLku1Jma7J0fiXD?=
 =?us-ascii?Q?rjt172bOcyffMGONQ4ROuu8DJO9EhIjkGJfDAGjBTFNaVGn362kPFV+p3DOm?=
 =?us-ascii?Q?EZZbjSO7Ns3Vz7fQb+l3A7JwXHsp25qjHOosaPaoT9vRchvRwPoWrhpciN6p?=
 =?us-ascii?Q?9rZcz8G2t8yAw0MZgaJscd+zoHO8+OkMwZBkJBZl8DW5Fr492Pc4KMLIk/Tk?=
 =?us-ascii?Q?wPZu+JPd+AAYGyb+rQwNwPy2xnpuqB0MuotxOvp314mHT4YZpD35rwCUYFhT?=
 =?us-ascii?Q?GBYXLcArE8RseH3xFFKmNSReYSzTNHh+tpF8R+pOKF1fRz8fTxBNehQwJZxn?=
 =?us-ascii?Q?NcKDg42jKe4sQFVKIXEGSclTKraaODjE/c74MfdHySVxd/KXS/mRLq8BdFB6?=
 =?us-ascii?Q?SV4N16vU6/tIWMx7CPBU9lGalVfoOwKQoKR/zLDiDPs3LeIt7eTs81OFIqAO?=
 =?us-ascii?Q?UU86GE31M+Yz5eHOFEN+fNDb3mgidKJws5WDutr/P+Q65kdUaHxsuZdtEh9i?=
 =?us-ascii?Q?DoBXhDOK5EF4eMEbFezUWCdloIIUy6mOP6P5pIS9gFCzKBDyAGxloiaDq+RU?=
 =?us-ascii?Q?HP/dCAy71vkWs2S1Cwvcry79kDux+BhO?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FF3zdX367wZFKuLn20Vt/uAjTkdYwBrfVc7OyDG1W7vR5RmEKbqdrAUna7VG?=
 =?us-ascii?Q?UP9LHYLKpfNryp5kGsi5ryKwKEIQkcy0Vu1luZOJ+rWM5gUkL9vFOJN5lnFa?=
 =?us-ascii?Q?l2IuqE0/DEP5GgHUgx9jYZ080cSTJ11EQxtqi9fqmkX48d8MJ9wAA+lFMLNq?=
 =?us-ascii?Q?+vXQ3ClOwWeVcp2DhD+qixAuIN0R2f3Q3SxTYyIMW4NtxxCgdnr22RcFoY7S?=
 =?us-ascii?Q?iiZV97DrZhJpU6sxxz7LFYzOYFX67I53dD6XQGo/5d07PWZXpuFwKt6ykw8h?=
 =?us-ascii?Q?+5gUoVdgOWOesALZ4hsaQ1+pJ3yXJHtDST/JI+ynrBjd5EIHdnA560S1nvYo?=
 =?us-ascii?Q?fpFq1J0axu4ODCxAxKVAieDHthpjJXQZ3jhpP90hqFzN93bmRnHkObaKsgDB?=
 =?us-ascii?Q?2Fr0E4R0Ctw40A/De7iyp/CC4T+TmJBNfNh4OLRpx0G0qVt08hdkFtd40nrG?=
 =?us-ascii?Q?QbWqXFA7ruve5ekydQzgsZJD1wh7qMrUNsQDuio/nMErSi3U7SDNdDOWaDSW?=
 =?us-ascii?Q?7Rz1AjNVH0QM5K1IXg67xOV9nvEqp127QqaoshALvsivF7fZeZd7U3YGhHD8?=
 =?us-ascii?Q?0KyKK4Yw7NK5K4ETHdn8fb8d/5DkniPYuJe6vOxpGBWAaJpRCpGhKki8vcc7?=
 =?us-ascii?Q?kp2XEvhIyW6YqJYU4Tfdt3Sb7ws2r0X3L5tTxbzeUHBvTlxysH/H8j/cBnBW?=
 =?us-ascii?Q?TEOi8mmd+OS6o0bJ0lQJnBDHRRDvllNLhFJ39KwRCYQMaponGfOyVYtuLTpz?=
 =?us-ascii?Q?cUeu0mT29QI8Z7Pd5BnJTog4k8DzNxFC9WD29pNoxOTO5NZF74Paz1tjxOwE?=
 =?us-ascii?Q?iGbAelMeDnUh93AhQsaoSazyV2V30Cp1SXNq1neOJdXZOXoIBe0V0C2HhQA7?=
 =?us-ascii?Q?YazkbxmBHiockhqNNSNsT5t6tdr14rs2Q7uSlNiy97DvA2YRrujDnGRNpzvR?=
 =?us-ascii?Q?gJRaJSG47kExUHyY768jNIPhUgOKjM0doClTDDLV+FZkozpa9qEKzqx4NJmG?=
 =?us-ascii?Q?dTXmDHw2Ma+quEGdciYbEvicWx4qzC/BvzfuCKT9rUqIDQy2F3QxR+njtq4E?=
 =?us-ascii?Q?UdURljYlGVFkI49kBbtqA3/7VzB6Szb0PPUlRINAlJHi56+NQXYCNmoAHDWL?=
 =?us-ascii?Q?GiZh5+jKlW43AJCXTeDIxSu0uFHE3epBMd8s15HImXZ7TppPQ9uuBuKNZgs1?=
 =?us-ascii?Q?Xy4NhbQE6DbHEREh2f6gmRNO0v/IFMIj4iDBnxSPCdKZSObkOalLqaPlF1zh?=
 =?us-ascii?Q?zwqOMJEYqWSLp9Ip1Mklgs0uQSvVfybwlasKhC30jhiXzZ+x2uy3/AfNpfuZ?=
 =?us-ascii?Q?oBxuNY7bu3ZIrRrtgsZj/hu19v60kvbZtb44UlPT9rgpQIaCMcee1GID3nJk?=
 =?us-ascii?Q?GIYJkxSUKuGHPDAFbA+CuBXj2KzAB0LoElU3BJPtcN/ll98RTbnppa6xL4PQ?=
 =?us-ascii?Q?FkbvgQbME2MKjs+mEGFBcgejAdDxbaBFSMlquirw84n5jQPpdPUsUntEtZ28?=
 =?us-ascii?Q?xgte3jghlNhuLOUwUpPBh26M+qNQRgIF/lhvzz8XscpE9Knkt5j36w0I/6z8?=
 =?us-ascii?Q?PllvV6R2jCr4ywjTGgKRbVwdMpU4ODy7sSILV2zp4VhfNtOUi0MQj1Fks+zU?=
 =?us-ascii?Q?Sg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd349945-70a6-48ae-aead-08dde14b49d4
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 07:12:43.4674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WFefQSnsz/yVMZeGBb6APwmrbAvWtu1Q0MKILr0bi01M6nH7AZYITrl2fYxyvKSDNxG/c5wfki0cpQ+rwZDEeIASTxX6XRfc1WIGh7TJNpU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6259
X-Proofpoint-ORIG-GUID: -sZ9GPYQ05_AR39auEPloa41IpJHvt93
X-Proofpoint-GUID: -sZ9GPYQ05_AR39auEPloa41IpJHvt93
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDA2NiBTYWx0ZWRfX0UCTZ3inTcXd
 tuGr8C1hrv6wKD+hE4a9I3vFR8+BNJ4hr++/ipE+H7y1mJMn83FYjj+QfflEdRisUkzBIjPkhgm
 JsBFgZKyBvOPv5i699iboSTBq8fhsowjxyUCQr8jcNDR1RDfSIpjH7uu9WQDgXiGrFeeNl9bAeS
 UvTdCihYPrYzygS7CRlnrh+5Hy+Yi8zgUoSnrbxB4wMX15McjNCCFVESu4v4pVTxf6EA4sKI2Ik
 gnu9UZye7jbP7LGC7ipPYdQaD+TgBy9wQw3mxI5OKgJpYXrlvgfWOKAtN2R7zMeQEvsfxDyNXIv
 qdYaxMRkd0NJu7TMfIU4Sb8B7TXX28HpewUrN4XglanBlx6WA+qL0GJtS9GTzECKuam6D4SP0CE
 14KsVDHbBNoRToSr1VtH3O+5xGZvIQ==
X-Authority-Analysis: v=2.4 cv=SPoblOvH c=1 sm=1 tr=0 ts=68a8186e cx=c_pps
 a=RytzCX+8eATlvKXUbdY7Zw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8
 a=uNb49fXS4AQX4V-9WP0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2508110000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 07:12:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222308

From: Harish Sadineni <Harish.Sadineni@windriver.com>

When gcc build with PIE enabled the following tests
were getting failed:
 FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+40
 FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+32
 FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+24
 FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+16

Detailed bug info & upstream fix is here:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118885

Upstream Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=679e24f5a751663998ff7202149a749e0f7251f9]

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-15.2.inc        |  1 +
 .../gcc/gcc/0026-fix-pr90579-testcases.patch  | 20 +++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch

diff --git a/meta/recipes-devtools/gcc/gcc-15.2.inc b/meta/recipes-devtools/gcc/gcc-15.2.inc
index 41e4c004dd..3583e40f55 100644
--- a/meta/recipes-devtools/gcc/gcc-15.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-15.2.inc
@@ -71,6 +71,7 @@ SRC_URI = "${BASEURI} \
            file://0023-Fix-install-path-of-linux64.h.patch \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
+	   file://0026-fix-pr90579-testcases.patch \
 "
 
 UNPACKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
diff --git a/meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch b/meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch
new file mode 100644
index 0000000000..bee147abc1
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch
@@ -0,0 +1,20 @@
+Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=679e24f5a751663998ff7202149a749e0f7251f9]
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+---
+ gcc/testsuite/gcc.target/i386/pr90579.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gcc/testsuite/gcc.target/i386/pr90579.c b/gcc/testsuite/gcc.target/i386/pr90579.c
+index ab48a44063c..19081ec9fdf 100644
+--- a/gcc/testsuite/gcc.target/i386/pr90579.c
++++ b/gcc/testsuite/gcc.target/i386/pr90579.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O3 -mavx2 -mfpmath=sse" } */
++/* { dg-options "-O3 -mavx2 -mfpmath=sse -fno-pie" } */
+ 
+ extern double r[6];
+ extern double a[];
+-- 
+2.49.0
-- 
2.49.0


