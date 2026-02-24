Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61AB8EFB7EE
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 03:07:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12311.1771902437433132245
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 19:07:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=A/W1IIFQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6515bcc28d=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NNK21l2697509
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 19:07:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=O+dcASw+ehl4G3WzBTOH
	lTj7/4M/2sphlptSTCQThpc=; b=A/W1IIFQw5bWUdaIBWMjFubXm2/BVm/ZM/hb
	y4HNqfWli27XMyyNtqunBwezxqkynqqdOvRHU3gEdGzRCFeU42Vj4ovJZ8h5//8j
	l84rqWxzumXpeflzqootfiV3n3N9QOukv/EKreKTQ1ELftl1KHYyR88Vu3hVp3FE
	Uy8/qRA9L243TbNDhyLEr2AtLEMnEWSGBr9nW2QgyrPPYMOPmIWVW30CbQAWOrgc
	oVMrRxM5gPZn4rm6TzaYKT8LJnVISUYsOKg9zP57EiCouXm5xUkHLUjEPiEB3Pk+
	JCcWVFXd9O2XfztYL8TNXCgMlT91vaI+3r2IzO7QL5OP3Ne6+g==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010030.outbound.protection.outlook.com [52.101.46.30])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cfd3k2bkm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 19:07:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HXw+kerqYN02JKmuP3wnBuOvTJ3hdJOT2e4zTsFMpmaEXZVut8t23A5r1gvUkyKtqqwczNv+x8fjfIvf4Kg2VdGOms372eXoa5aXR6VDVYIdykYYTyB9NMZryF/jw3kbpS+sQ6CCl0/p/NWJbyiGkm60OsKESMoOTR1gx/p6GuVjQODNVTXKQAbgq9EL7oCCBG2DewavG52DCiWJTor55nTsCOcP/LbbZQ+/Yh3wBMOPHlnnkAiWevbfoStQElXqTaMRy0YJSYca9IBDf6LDWevqXA/XrIq3M7CKve6grI7u0TuwDxscv7Fs3G3B25JxYghinKl7nFiAvTp+0WRIIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+dcASw+ehl4G3WzBTOHlTj7/4M/2sphlptSTCQThpc=;
 b=U+EGTM1OlMbfKbyD1PBS1LIHQ6M+n1kTL5S211Xtr0ALVnlhyZRuE0xTysht213ENRlBtigpWYRF0lTqcP62XFUKr7kYXfi490WLqWmjGcEZVbAdt/xMXtX/KVDUQEz6NcyAqQtYvKYLX+7PyK9ZMhddTrQ1QP1ZfNVVMuzl0CXbvs+3vxE7wkIeQo12k6YcsDV65fIONT1CKWDUFoPsxFsgKw93N2UjEnHSOhcXuZFD28ZCt7OS8rkXa8tp2bje8EsG0WlSMuL4Wo3jSAOyeq5vMu1hSb49cYVYJqdxik8g5Rl3kSzrtrU/BVMPrlEdeB0JTV4nbKJH0kd+yYQm0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by LV3PR11MB8508.namprd11.prod.outlook.com (2603:10b6:408:1b4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 03:07:14 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 03:07:13 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mesa: upgrade from 25.3.3 to 25.3.6
Date: Tue, 24 Feb 2026 11:06:57 +0800
Message-Id: <20260224030657.123463-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KL1PR0401CA0024.apcprd04.prod.outlook.com
 (2603:1096:820:e::11) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|LV3PR11MB8508:EE_
X-MS-Office365-Filtering-Correlation-Id: 28343569-f414-4fa6-e35a-08de7351cecd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pWtBYpq5RmpU7H64/uD5q/JqWqpYhrYhtE6Q2EqhpHnYePtq1kEHZAfJgYcD?=
 =?us-ascii?Q?K5kJB0YP93Xso2q+gGOaHB8eANfVIW4QmR5H8gT15bVi5S2PBBKN7rehNeSp?=
 =?us-ascii?Q?kDIkz7t7oUm9jeYXeQlouEE7gNG4b05Xx21iZLu3uf7ZECpI/P6P3YLIE1kX?=
 =?us-ascii?Q?dbMqUaL2KuzjTz9G8Ojx74we9siu6vxcoPB7+3IbP5EKXYe9SmoC9eQcUO+Z?=
 =?us-ascii?Q?KKqLi/74HhCcaqLg2OZk9gpeOM9a3QkSbZj55nzGe2QOGC2I+ix/CFkZ50SN?=
 =?us-ascii?Q?39jhL7Fq6HjBqc4GUF+KTK5TtHE2xT2MVvTaWU2ZN2bv/oFZn4mc1g2Ptzer?=
 =?us-ascii?Q?vWjrNZmS1fHA9PrzW7YXuk67dV+V0igo75W1OxjqfXXg7TTNZGfJBkJyKybN?=
 =?us-ascii?Q?iyarMUwO1TXLjdI/B/v+fzU4NKzarzw1Jfc/kfGHmkTgcnu7AXZB6cukoOu0?=
 =?us-ascii?Q?tpq7C01Xk2WaLk6VAQvy0BxY0ilXqMErl37OOuHdUs/s4IcxKmPkg9uJ6kNY?=
 =?us-ascii?Q?0RQZFs/56dPOSutQE7miFFWePV6UNI0Uld+S4xesYkrCJk+NcR2G1f6a2pnP?=
 =?us-ascii?Q?TgjiC3K4TY9KeoMF25rsoaPRyibpKl8gjvG3j2pZ0EJCwKXJqHJ9X8mpm4be?=
 =?us-ascii?Q?48lQAr3nmu5btrU1FeHIBU9MPMTZKCMjr2sToYqti0HUSJu1X+P1QNIXo52o?=
 =?us-ascii?Q?QrMuTlbUy9oF+BnbocfcICAqnE6CPslrP7pS52NIDDtd33KXI9ll4pWtGgaM?=
 =?us-ascii?Q?pBEXxhfaBCMr0sWOtOzFBx7VMQnkqQq22JRGY97LzZU00qvyzzD35s34zlRd?=
 =?us-ascii?Q?WrGkEd4XB2XLytgqsI5dsQhmFW1OK67hiFqRkSlQJENke23jg7QzhWs2XUIa?=
 =?us-ascii?Q?KTYEQqh7moK7oVnLXkR8aNtphU2Vtwot5spsNXqY+EK6NmU5H8IKCLUmjplm?=
 =?us-ascii?Q?7oZCFneDIu8d2D/n2Qb7Z8kclTI2APXlbaYuq8XZoPIDK5EfY05bwSlhtkHQ?=
 =?us-ascii?Q?o/O1M4kpmwhqgyF9GnE04lSmfeSfaeoMlNFylfVGG0VBVCm7KZPV7lViX+qV?=
 =?us-ascii?Q?lHHlXWi+nWNoWE1LiyVpMoWn7kbuu6WjrfepK1Mw9U9rm2Gw+TWPmWLTSxwT?=
 =?us-ascii?Q?1MgJuQMztpcuT/pX7MvRksgjxeGwoYzWI3Ttbeks6GOxGEUbx2cXiTgG2p1u?=
 =?us-ascii?Q?R2j1ANsbjSMU9bqnw2vwngOXsCsUBxlomFKgguD0v9ZXJBAeqxMEBGQe7ENq?=
 =?us-ascii?Q?k7vDBEnA0jqVmJ8A5bFO8v48+d8nyd0fpY/A2UqnOVt8ptAp5hhoVo75VZEs?=
 =?us-ascii?Q?MNHnz9qhZdKYWfDGk6JYhHI5Z6nTtXd2EWtUbUvlOeFhRTyhwo+kc+afL1Eg?=
 =?us-ascii?Q?wBcWSdQaYuIE5EZbUsG+p+nBPwNEjtnAHQg8BwPNPLFiaTWKCUHZc01lbZRO?=
 =?us-ascii?Q?F+mWYzmp+bg1QtTVdueCE+SyN5SeE73SBCVJGFX092BqK6eBUyNXZNMnrlMz?=
 =?us-ascii?Q?NPxfSb6QvrQjFlEgMV95iymWiENIGeCUcm3tpmEIcWw9N4ABJCCB8DeJt2BY?=
 =?us-ascii?Q?mgxw1rtY4W0H6P6ryBzOW35Q7qxA610HVQ5lX2Om?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WrA03msNJHivOublLoebH30wfeGANGJoZc4zkgsLni+xPqQ5l6gsDUOakNJg?=
 =?us-ascii?Q?FCgEjplZ9MKJ8w0ynBCnn4FKfGiUtavposfc4N1cFnyfyZajL3KkEfhAvhVx?=
 =?us-ascii?Q?4Ov8QSOM39HBl8Fb/37GAitCa+dKIs4UHwjeb1VTU+7NA6nVVlZmUJZUQDzQ?=
 =?us-ascii?Q?bxFVU7JmLEUABhUY1uYuG1LBLaIaOInAj4mV2uV+NfdKtVkWnlkCev2srnmf?=
 =?us-ascii?Q?iZkxmrIopaMMzsF3VpMlkkBp0Af1/6ecYcbVCvBwJe7nSndJrTNcQSpmJdPu?=
 =?us-ascii?Q?7gAEvStTYzQI4eJUaPtpmU7tZZcYyGQTy8b9NBzbzZUzce99KcNH9hRF2dtu?=
 =?us-ascii?Q?4+OxjNoEg6RSZy8nFiDzDXtZbNAjbZlizwoVpIkEPsjC6LWKZsGg2PExh20Q?=
 =?us-ascii?Q?rdwgmCk8RM+pKbkYkmrcHutPABwNqSWC5Kw1FomiqR2HSwhhdPgoBuBSv/uo?=
 =?us-ascii?Q?atvECMFMxY5f2ma2Y4/o4GjangpnVN2OiMhFNHXDwl83X1ADYNK/RcHNkRL9?=
 =?us-ascii?Q?3/n9fXiXA6B3UYvEFT//Au1pk7ovsW4D2W1g9QDocUQKn5ZFwBu5f5fyt72C?=
 =?us-ascii?Q?z490UkLwznUPhSGFFVvk/BG+bgJbD5c5TWf0TIlo+JYu94yKI7F2Zv3Gles7?=
 =?us-ascii?Q?27IAAoJZLV7SRp8YlxOpEvrxXIoXKUJelAm9Jb22RJPgPCSN+a680ERq1Gzp?=
 =?us-ascii?Q?DGWmWrDqJuXpYtLFi6++W1YO6yjd4D8Z0Bz3b1shgH6X6VYw5ygWoSUGYQsk?=
 =?us-ascii?Q?SSp+WW4bCF6fdlvL8psKnQGO0fgSKo1FiYdM1G/n4I1+9aw1w+ajU2jUZhJG?=
 =?us-ascii?Q?9mvyLjzYQ+eJVa7SnpMwgR+J2xEdHrQCpy5oxRbQ4uggtu77SZWi5JThX5/o?=
 =?us-ascii?Q?mWI0OuWjqq2GU/WUPahjb7nSV3yrV3LDT5ex5R/T9lxoi0RoqmU2CeslaAqH?=
 =?us-ascii?Q?9hXIPIq3BwMhGJa1Gp9V/u6u7nw+KYHPYxELxUW3QIGabIyPGdPE6bwrGUWM?=
 =?us-ascii?Q?t8HlKZWUC+vCPkWeu91dd2k+l4DKtxGezQ61lc0tVQIrXbuyVlB2ISBwbP81?=
 =?us-ascii?Q?Ymjq2Z8prvIyF8k0auGlzy2jVJRnht/odtyDKYkmDLRBbUGc9GtZto+wsnvq?=
 =?us-ascii?Q?p/l9vAa2F+BtpUssuo6iZYRjYje2AX6JTR751pT7URNmjpJhvQ9R35iMuYFW?=
 =?us-ascii?Q?sOyu5eb2SwJASr91rKjj7Ki9yZWDOqgk6AzeW8/72Y0IjQL1nljO1u5899Vf?=
 =?us-ascii?Q?cWsHJWSSgnMU0YZalA5N5xJ7QRwcYBQC2mUGx/k4NRoZb1gGBEosZUdUkEmi?=
 =?us-ascii?Q?/1ZWpc3pP4OQm5qywWreqQ6/GqSt5ZalIs/HceCvAo2+mWYgwFF6ojZxDI7P?=
 =?us-ascii?Q?eINrOs2+nS5a/8zGBYrnCvisX35R/sn+jyyNS3hpx6LZOiyoTL+coozDBHCR?=
 =?us-ascii?Q?YypIDZU6kdutQ981tl0xNrltIy/CkuONI9la9BexRJFaY2vqjyS4S7SBnrK3?=
 =?us-ascii?Q?WeIbTXHHNLMMfxvWYOAGqay0CkuShb35EMT7/UyofLqFPnfwr4RjvbLC2Khw?=
 =?us-ascii?Q?+RBr2q+L+URtiPqQf1EkX42xq2nqhOWaIBk3veds752UyvmkSogiPtAQYWMe?=
 =?us-ascii?Q?kTzO9uPWCM2OCpJMijA/8VMbIWuAYQ3h06PrakkcReZM3Pam51oqzlIkBicu?=
 =?us-ascii?Q?0bEPeGOGP6pVDJPRGGCOA1HrTMbAviJo54rtB51qBs3/0loW+9lObs2F45W6?=
 =?us-ascii?Q?Q5cimVl9fDdLTMlYD8ARxqGx/lfPZjc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28343569-f414-4fa6-e35a-08de7351cecd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 03:07:13.5384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m6BaFY+/cfY2vSzFUcrETJymVxoBnzg9w4OcSi2FmfvXYGKm0MfH4RwDckuOOQrx6XAf386uQBMLHeR+t3HdaRuUyxIKgq1KglAJ0CDW7/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8508
X-Proofpoint-GUID: Jbnr-82kcADvMhviqRuO69v2SnYYrFay
X-Authority-Analysis: v=2.4 cv=Bo2QAIX5 c=1 sm=1 tr=0 ts=699d15e4 cx=c_pps
 a=7sXfYZKWL/+VDStniiEWIQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=ZpVaWaFtAAAA:8
 a=t7CeM3EgAAAA:8 a=RroQsQTsBbO9FLATM3QA:9 a=5tn4MO8azEBWFjlAA-rn:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Jbnr-82kcADvMhviqRuO69v2SnYYrFay
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAyNCBTYWx0ZWRfX1ohdqeJHRQ1w
 BcfxZswc+okOYMW7oq3UnWfqzolHawzpoUBGFg4HdMIi+JQ1WDtWRgY3N0RF2uFwE2nZqZlvCbD
 BpwBAfPzVZB1WIxF/wzb28r/RriQ+PhCyZd4zpdlOjPvzym79GwAMikoU8iO4SLNVpLehC84ukU
 +lMRYqkJ1QYHBWMedW6NxJF3Uh9TvHiYc4B/QvOietI4Qjc0/EJ1FkDoMbDVc1o1etm9vLUfUcZ
 +W4BF/rwo9KsLrMTI/qbgat/pT7X1Bzp98x9AWzpG3iPaLGXtLOYwZqKbkPmHx5ClY3tfEIs1yi
 8Ou3UeLB97TvlH8v1BvfUQoyVw3pe7z5KCRLhaB0hCtNchw6keHrxlSVbdy4nWNXBZNI54iBjej
 QmH3pHOgBFmagnjgg56tLDDep4UebHuEdy4+Dyg/W2nDktbdmQa+EPBJWUVProhguLsQuAI4x4q
 wQA45sbD+zPpY+5zITw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 03:07:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231738

Release Note:
https://docs.mesa3d.org/relnotes/25.3.6.html

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 1607fddd4b..dff1a66f7c 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,8 +22,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0002-rocket-drop-file-names-from-the-generated-file.patch \
 "
 
-SRC_URI[sha256sum] = "05328b3891c000e6a110a3e7321d8bfbb21631d132bf86bd3d4a8f45c535ef6b"
-PV = "25.3.3"
+SRC_URI[sha256sum] = "59217efeac3b64e7ced958324b9db7494f1e0741aeb22d780276514cc1b8f206"
+PV = "25.3.6"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.34.1


