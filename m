Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33AD2C61DD2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 21:46:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23520.1787780769345564692
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 14:46:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HVgRlRzt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2698f24599=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QKeOA9155154
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 21:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=XdMqEUZTMTUVZfQmnzmYhqouDJTd7RYT1b0MFw8peJg=; b=
	HVgRlRztOg0HOov4SvPz0amQ5/M8H1DzY/ObhVk0AGjrBqJDiJV/7vsDuZexwos5
	TFcKfg7ta7tnIeSdsowWRQF60jh6OOrXOikKoKm4/NmTxTnW6muBwDbFp1X1Oly6
	rXO5r3lMaYZdISMYCPUiq9DPWSjuXmcsqmZT8lVqk9e7zDJ25eKncABNA6cQeG66
	zlHLP2ZRoW2S4dy6tKfqqNH+wru4jC58hq3Mlm9CSie046aGd9IMUVo/gpawcZvQ
	4o3ixzkEWDSvR9XbERSB2ut5GDl30eKFkTEYT/7/7M30++11+ylTb73bhF6p/w5+
	Oxt/BYoiuDiYX6tEaktJog==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021122.outbound.protection.outlook.com [52.101.52.122])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g72r6yfhw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2026 21:46:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y07FqNqxqAKj9691YvykmWzNs+j/n3NA3Ro4JDwPsZPvcKvlqvSR8Agd673ax/5XHpvO4Y2gJ9l3O8SIF2AOZBRG/nxRUDeCHnFhGRBSap6HVnY2xZsyBA5SC86btv4H/gwPR6cckNRSY4KRKH+d1WIgzyMwBVrpat9AgaM1451PRtMb6tAr4GG+Ta7g881EKJI1n3IB5mcG/8KH6IYqtez7Oz0ZN6pwJTbGbjvdwBzJTjbl2bN/wuUHtQPE+8uayIDq+RSRCD4MItxkxXWJVBI1KBMETAwmuZQlA0/kahg6zXYVRQlzIfh18WMMVlL/EhEN/b6pE3aQAZXm2eKCiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdMqEUZTMTUVZfQmnzmYhqouDJTd7RYT1b0MFw8peJg=;
 b=u89ljTXzSN5Kny/+7jL1ZcVw7es21B9jrE1l49qdwFnfHwovDgJ31A+QSFlMVTBSANn4Gpsm7VopA5J7nphuzV8pbucTy+jnDtnkvpSI6LjTvumIgutCp8joIZ62FQWfrv29Ua+xdO+bANCgnpzGIVsUbW+ypRQ3C+26HrIjPMuiQFNziNHra2NlkrFoGGfaGR0ymEb+RavY8SIZH+LIALdS8Ch1bF2yDwpF0gOTOva+y3WwKZYnZOai8YREE7TtkMaujij8ASM1IECCmvPDlSXR26Z4IpzEC1jRrefa86BmCJ9j2t9eVGb7qnTEVYEycUEv38OaAPXKWrAg85ItkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM3PPF5EA507B64.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f25) by CO1PR11MB5028.namprd11.prod.outlook.com
 (2603:10b6:303:9a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Wed, 26 Aug
 2026 21:46:05 +0000
Received: from DM3PPF5EA507B64.namprd11.prod.outlook.com
 ([fe80::4f8:91a7:e7b9:874b]) by DM3PPF5EA507B64.namprd11.prod.outlook.com
 ([fe80::4f8:91a7:e7b9:874b%7]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 21:46:05 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v18 07/16] libarchive: Make it work with rpm 6.0.2
Date: Wed, 26 Aug 2026 14:45:39 -0700
Message-ID: <20260826214548.3002838-8-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260826214548.3002838-1-sumanth.gavini@windriver.com>
References: <20260826214548.3002838-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0188.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::13) To DM3PPF5EA507B64.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PPF5EA507B64:EE_|CO1PR11MB5028:EE_
X-MS-Office365-Filtering-Correlation-Id: f72cf411-ac36-482a-9573-08df03bb6e2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|13003099007|38350700014|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003|12006099003;
X-Microsoft-Antispam-Message-Info: 
	sepICI1MbQ7Rr069mVEOnaNWhDAhtJ5deEb+Fq1QtGw8NZUJtWv2d6D02PKBKrtUU+KlcktEj45Qs+Hishh2AX0IP2trZkhXvTN5K01LS1zuvotqeBN/YOG5Zt1fM//CV431UD/UTyy27pknakjum4mPDaHDusemI6XXfAm1pCmNtXIZvJWMHVs0GwfjQxTd+S2FPTrB3F7ZVhZ7Mj8Ph6VgtGCnoRqwEa/fvvLIZqinCScF4J1bjkJFHoyhCY24vyaIRkiG8KOYAwtCTkWeH+wDzTTrEv5SWcKZN7VwUnO6Cp8xIt8r9R6/LeGOEOYqUUqxdcc2gnoH91A2b1ABxA1s0DFaCzLn5KjJTTHMo8EGxvxI+GK61lMIOfPntLab7hnv50CJmVQwtHJE2Xrsx1INmtR8FA9Bwhb9vU9KbXkoxjnZ2DXHAojRE9OMPX3oPt79+C+haDygQy7IRecGELBsKKlVfr8dIj6UG9U8Co37QN72IJptt+xKhx2tX4wlq8FRfHwajoPpYnpJiG6QGxRrAH0s01Ziw/FgZkzlGf06tlUK+S4LMg3wQ2EFPFwa5HCq3uY3hiYfzE4mFQJ2FyjLGFAfvRF+SXM1EaqViT5qSpQrGs74zsLDK+0aFsd76290B6XsIK4FN2pMJWeX3IkgaxKdg4zgUoUm3hoz3wo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF5EA507B64.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(13003099007)(38350700014)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(12006099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Jf53ZW5srigqtFi4xx5+DgwFOyjLEc7KhS4uk3urP9uS/s8IumHplf4Nwcre?=
 =?us-ascii?Q?Pz0iqBucb5UtZzZMHMvKfic4CjaaWjDwXGAl7PW5CTUt5AwU7ItVhiG14xxZ?=
 =?us-ascii?Q?dOZOJzAZwkcpVvLmEEsvUzmfgjgNYn+LRGzAQp8rnh7neA+gGrl+5cWeLnrw?=
 =?us-ascii?Q?HKGymX7QBNOhhJXjgM1uD3h1X+iDQRAJP1rXSoYok93RLtjKDsJW6GOIe1MZ?=
 =?us-ascii?Q?zDTHwnRq0ze49xUBOqcxzuxOe7SISCi+dDM6bniobwxSlveN5pfYoixxJjdQ?=
 =?us-ascii?Q?Ymwv+/DFBfejyWFPf5QGJJW4CYmKyPS6PaMkhSL04YcxiOeJ0gxFd4luAN02?=
 =?us-ascii?Q?8ojNor8QJFd5IGvywM1SLwSjs/pwSY+YF9oXkUvymtQg++kta44t9rmYke2B?=
 =?us-ascii?Q?DU7a47I2uiOx7O3NnXZ5B7wBgghyDcwO30hvsqr6HK62TeZKHFkaRoHMXrm2?=
 =?us-ascii?Q?DdFeS6Mm2hw8sQq2UoOYHjEvJca9rB4aw1YvogKjzLHOaUDmsv7OSn1FKkHQ?=
 =?us-ascii?Q?f7ZsdZx+DZJJFzb6uXqAYk6AKgCgw/OyerJXs+S4LNS+jXNnj0YpqzP4zPFH?=
 =?us-ascii?Q?10p3G1UHgww61fPlL3B0jOtkVnsftGa3oQ2xTr9RjY1e0gWQlLmfuJ8R5FMj?=
 =?us-ascii?Q?NmUZgwkoL+5OyWH+3Pep27Fur1VkCGbnDn6zSwoHkYUhKyyy5nEu1i6/4jh6?=
 =?us-ascii?Q?pXinH0uFA/lomp9Ur6X6c7+JKWkDDaRCTF3p2R9ZdSPnOelAZZ0KS1PbDwIu?=
 =?us-ascii?Q?eQzbIJG+BYB6c1Yny7lWzwQUxOZ5MgM5CfGooYH/xpXfpQExabzaVK/jZfum?=
 =?us-ascii?Q?esfxxkXbWcWfCSykZyAg5dvEi7hM45FhffcBfFkSn3r2LY7lCFagvrUpNZ2p?=
 =?us-ascii?Q?uVLkgKcrKWQFHpLtyazEy4S6pnTNa2sXIa6Z0H4nt+ECPBX8Vid/7Zd8eY3u?=
 =?us-ascii?Q?pAliknCx451rdxAcaW9jldDZ0zC2BoLDlXEsey3fdq+HaYyTtJAGNK/tlgSs?=
 =?us-ascii?Q?hBh7t/QaSus0AIr/Rlet6mRSWk9WpDVm/9mo5/tur5uIJmCISpbCoyavVP9w?=
 =?us-ascii?Q?gTsIEI/Nk4W2qA0v8cZmYhs076fZ6fr8UMLNLQKrqwZ6BkcAMc7NunBYQ9HN?=
 =?us-ascii?Q?qye5m6lo9oY7dSeUEChjdEJ/6MFLoi5JkAq3b8qJQ/0CDWL0ZAEHOmtz9ht7?=
 =?us-ascii?Q?SGrAjZ6iWe2vNNy0ZbVh2P9aFUpseGjQaAqSBH8N2VBnyDg9/xeThpohON6B?=
 =?us-ascii?Q?bKrWjETzokKV28SpP32uUqT/ZSgoMcsbn0RFP4NXl4o/9gGk4DaEpIZ+ga8O?=
 =?us-ascii?Q?3rsJ0EzVNfcdLJa5rU9qcTD0iQ+1m6ren4BpQ6njfpp5t1MOoS1oGGES95Gf?=
 =?us-ascii?Q?fbkNoNZAEXvCe3R37o5wB9B7/12uZkZqMBvEoIh6j3VsphP3MI//+3d5znvl?=
 =?us-ascii?Q?fEbSVTB3hnnIEn9zypGIXlw/z5ciISnxZFtFKF+qAnFZvRA2CGIEI/tAdPPe?=
 =?us-ascii?Q?1Nprk3oH5029htHDqBszBDoQ19gP+yGLei7kps6luYCoM0enNYeEc+VwCCex?=
 =?us-ascii?Q?cAl6PxmJ1RYQRFF05V99nbtTBOagjPHABDApOzFa0CKCvVDfXwpav2ReRmLM?=
 =?us-ascii?Q?P16hVj3RyPdsjKxPTkmKhSMAY9UJIfab1V+iXrFhPNJoJLpy37hMdYib+qfk?=
 =?us-ascii?Q?zkpgFCy2AMGiT3x1VaQMwDG6L8e6jYZUk9ee7RwFpjeeg1lwq3IHL5DJRIe2?=
 =?us-ascii?Q?bgkSjNDFhbD1Mgc5Vd0Gx9458b8dBJc=3D?=
X-Exchange-RoutingPolicyChecked: 
	26nOo9euppM0P1j3jzr5u7rEviUmBQcozYM6tLofk4KCsU9vWzIHQIafwzWA7tbRa0FoSUZ2jvseO3SA25XaO+DABQ3K6vsBA6q+CJUXpmCu8NgQLubtjHuJIvyGDFsM8Jj5OZDBeIcydjt+FuGcmAWMv+OOGWYZZlR2Ud7PyEiqr0QpRTPZQESPzhveYD+ZoaQ4IwkM1p42kWn3vGDMsM03ojz2mY3U8IvaEG6za1Byav/bGfMht/EL61pYUbRTOEivOfxtGE+qFc7hlSHxUrF8QPj7+A0E8KdHD7DnfMrsYMpcPQXa7LoeocbXUlN9ghC51EDv81Zo7jhEoJFbOA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f72cf411-ac36-482a-9573-08df03bb6e2d
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF5EA507B64.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 21:46:05.3484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aK+zXglePDXRO/8N6iIk05h+DRHZuAQpAOhbO+660Vrw/Xzre9iF2H+Ya/uq2bRirxzyd9WOBjMWlHOvXMof2bPiiXkgwRdNpEfEMGZYO5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5028
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE4MiBTYWx0ZWRfX35v4Ihj1DZax
 6tQNKWwxZA19qKJoubJAwRr6BxrYP8xYrEqstXIufXS7f396kJPswdtwtRyZGUmGqiaLhLXBUc0
 q3Oodko8WmxP7ubbdMOMgQaFwgrvP4d23tM6frv+b8tnKic6a8mR
X-Proofpoint-ORIG-GUID: DjmAFZll1xI5iFAsbjjq6JaQgLapHln2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE4MiBTYWx0ZWRfX8xqQsLY2JcML
 E/RgD4aw6vlNUrejDGBYPI94HTG20V/SUmA20rKgN6xKHD7y71W1FOmm2YVtGqna4zoY1ijNKBA
 0+buIoRsglH9Cps8Z1+ciSOF3emd8obNiwh2UD8clogcG+Yz1dOPSUlvxwGaQNmlYoZLiM85arl
 ghneWxWDPZ1evKAVg9oMQgH/1WJLsi0nDua3PWXeaB/sjAyetleJakpGD59/HX0e9tXHVk3nfWP
 iuQqm6pvjU1zOBJ6VwfWGqPEK8mdHZW6/lIGsOr8q+WPprYSXUbJg3MnnEbUW0uafgmrLfeNsJz
 VLzLmoHzCdP6C9tKT9HCNp9YpayyWQnh0O/jbAPZoMHqnApBgN0Ro5Z1MfkRzw96Ztjm5YKQIzg
 tzvWK+5CEJITgGVjc9RamgafBoshFrlsP4xFurhHiy3h1ch5dkbT/n5+S/CBaqM7GkvqG7rjAQS
 WpTubjsx7221Qnv2B6Q==
X-Proofpoint-GUID: X0lIgtp2MmjLwKkW_NnMeedD3kev6qgO
X-Authority-Analysis: v=2.4 cv=RLiD2Yi+ c=1 sm=1 tr=0 ts=6a8f5ea0 cx=c_pps
 a=83jsKCSeZiZisq1MDa3xoA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=3uWsZ661AAAA:8 a=t7CeM3EgAAAA:8 a=tyuvAb6jAAAA:8 a=yC51jOswJ7eKArgWbMgA:9
 a=fYNom5PXsM5enKJDCoVv:22 a=FdTzh2GWekK77mhwV6Dw:22 a=vMd6T1JfvD_20K6YSfI9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_06,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260182
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 21:46:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244423

The patch is from:
https://github.com/libarchive/libarchive/pull/3346/

Fixed:
$ oe-selftest -r debuginfod.Debuginfod.test_debuginfod_native

cannot open archive from pipe
/path/to/tmp-debuginfod/work/x86-64-v3-poky-linux/xz/5.8.2/localpkgfeed/x86_64_v3/bash-locale-vi-5.3-r0.x86_64_v3.rpm
libarchive error: cannot open archive from pipe: Unrecognized archive format
exceptions encountered during archive scan

Note: 0001-append_filter-Use-last-bidder-for-filter.patch was already
present from upstream, so only the remaining two PR #3346 patches are
added here.

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 ...-Verify-that-bidder-and-filter-match.patch | 103 +++++++
 .../libarchive/0003-Remove-bidder-name.patch  | 258 ++++++++++++++++++
 .../libarchive/libarchive_3.8.9.bb            |   2 +
 3 files changed, 363 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch b/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch
new file mode 100644
index 0000000000..a91f518207
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch
@@ -0,0 +1,103 @@
+From db4fb440792278cd01e0829c93f6b62f567b704b Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <tobias@stoeckmann.org>
+Date: Sun, 2 Aug 2026 14:26:22 +0200
+Subject: [PATCH 1/3] append_filter: Verify that bidder and filter match
+
+Make sure that appending a filter always matches its supposed bidder.
+
+Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/3346]
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
+---
+ Makefile.am                                   |  1 +
+ libarchive/test/CMakeLists.txt                |  1 +
+ .../test/test_archive_read_append_filter.c    | 54 +++++++++++++++++++
+ 3 files changed, 56 insertions(+)
+ create mode 100644 libarchive/test/test_archive_read_append_filter.c
+
+diff --git a/Makefile.am b/Makefile.am
+index 2fb4fdf4..c96b3bc6 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -404,6 +404,7 @@ libarchive_test_SOURCES= \
+ 	libarchive/test/test_archive_pathmatch_oob.c \
+ 	libarchive/test/test_archive_read.c \
+ 	libarchive/test/test_archive_read_add_passphrase.c \
++	libarchive/test/test_archive_read_append_filter.c \
+ 	libarchive/test/test_archive_read_close_twice.c \
+ 	libarchive/test/test_archive_read_multiple_data_objects.c \
+ 	libarchive/test/test_archive_read_next_header_empty.c \
+diff --git a/libarchive/test/CMakeLists.txt b/libarchive/test/CMakeLists.txt
+index 44f839f8..c4102c3d 100644
+--- a/libarchive/test/CMakeLists.txt
++++ b/libarchive/test/CMakeLists.txt
+@@ -33,6 +33,7 @@ IF(ENABLE_TEST)
+     test_archive_pathmatch_oob.c
+     test_archive_read.c
+     test_archive_read_add_passphrase.c
++    test_archive_read_append_filter.c
+     test_archive_read_close_twice.c
+     test_archive_read_multiple_data_objects.c
+     test_archive_read_next_header_empty.c
+diff --git a/libarchive/test/test_archive_read_append_filter.c b/libarchive/test/test_archive_read_append_filter.c
+new file mode 100644
+index 00000000..5c301d52
+--- /dev/null
++++ b/libarchive/test/test_archive_read_append_filter.c
+@@ -0,0 +1,54 @@
++/*-
++ * Copyright (c) 2026 Tobias Stoeckmann
++ * All rights reserved.
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ * 1. Redistributions of source code must retain the above copyright
++ *    notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *    notice, this list of conditions and the following disclaimer in the
++ *    documentation and/or other materials provided with the distribution.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR(S) ``AS IS'' AND ANY EXPRESS OR
++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
++ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
++ * IN NO EVENT SHALL THE AUTHOR(S) BE LIABLE FOR ANY DIRECT, INDIRECT,
++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
++ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
++ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ */
++
++#include "archive.h"
++#include "test.h"
++
++DEFINE_TEST(test_archive_read_append_filter)
++{
++	struct archive *a;
++	int r;
++
++	a = archive_read_new();
++	assert(a != NULL);
++
++	/* Append a program bidder (without filter). */
++	assertEqualIntA(a, ARCHIVE_OK,
++	    archive_read_support_filter_program(a, "prog1"));
++
++	/* Append a filter program which comes with its own bidder. */
++	r = archive_read_append_filter_program(a, "prog2");
++
++	/* Verify that filter uses its own bidder. */
++	if (r == ARCHIVE_FATAL) {
++		assertEqualStringA(a, "Can't initialize filter; unable to run program \"prog2\"",
++			archive_error_string(a));
++	} else {
++		assertEqualIntA(a, ARCHIVE_OK, r);
++		assertEqualStringA(a, "Program: prog2", archive_filter_name(a, 0));
++	}
++
++	archive_read_free(a);
++}
+-- 
+2.49.0
diff --git a/meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch b/meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch
new file mode 100644
index 0000000000..bbd2478577
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch
@@ -0,0 +1,258 @@
+From 76c7142bd2595184826722063598fddf62031cca Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <tobias@stoeckmann.org>
+Date: Sun, 2 Aug 2026 14:31:33 +0200
+Subject: [PATCH 3/3] Remove bidder name
+
+The name was only needed to find the appropriate bidder for a filter.
+Since this has been resolved by accessing the last bidder, since in these
+situations the bidder is added first, then the filter, the name is not
+needed anymore.
+
+Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/3346]
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
+---
+ libarchive/archive_read.c                         | 2 --
+ libarchive/archive_read_append_filter.c           | 1 -
+ libarchive/archive_read_private.h                 | 3 ---
+ libarchive/archive_read_support_filter_bzip2.c    | 2 +-
+ libarchive/archive_read_support_filter_compress.c | 2 +-
+ libarchive/archive_read_support_filter_grzip.c    | 2 +-
+ libarchive/archive_read_support_filter_gzip.c     | 2 +-
+ libarchive/archive_read_support_filter_lrzip.c    | 2 +-
+ libarchive/archive_read_support_filter_lz4.c      | 2 +-
+ libarchive/archive_read_support_filter_lzop.c     | 2 +-
+ libarchive/archive_read_support_filter_program.c  | 2 +-
+ libarchive/archive_read_support_filter_rpm.c      | 2 +-
+ libarchive/archive_read_support_filter_uu.c       | 2 +-
+ libarchive/archive_read_support_filter_xz.c       | 6 +++---
+ libarchive/archive_read_support_filter_zstd.c     | 2 +-
+ 15 files changed, 14 insertions(+), 20 deletions(-)
+
+diff --git a/libarchive/archive_read.c b/libarchive/archive_read.c
+index e844e42d..406d84de 100644
+--- a/libarchive/archive_read.c
++++ b/libarchive/archive_read.c
+@@ -1290,7 +1290,6 @@ __archive_read_register_format(struct archive_read *a,
+ int
+ __archive_read_register_bidder(struct archive_read *a,
+ 	void *bidder_data,
+-	const char *name,
+ 	const struct archive_read_filter_bidder_vtable *vtable)
+ {
+ 	struct archive_read_filter_bidder *bidder;
+@@ -1307,7 +1306,6 @@ __archive_read_register_bidder(struct archive_read *a,
+ 		memset(a->bidders + i, 0, sizeof(a->bidders[0]));
+ 		bidder = (a->bidders + i);
+ 		bidder->data = bidder_data;
+-		bidder->name = name;
+ 		bidder->vtable = vtable;
+ 		if (bidder->vtable->bid == NULL || bidder->vtable->init == NULL) {
+ 			archive_set_error(&a->archive, ARCHIVE_ERRNO_PROGRAMMER,
+diff --git a/libarchive/archive_read_append_filter.c b/libarchive/archive_read_append_filter.c
+index 9dd9f536..5cc8ff55 100644
+--- a/libarchive/archive_read_append_filter.c
++++ b/libarchive/archive_read_append_filter.c
+@@ -174,7 +174,6 @@ archive_read_append_filter_program_signature(struct archive *_a,
+     __archive_read_free_filters(a);
+     return (ARCHIVE_FATAL);
+   }
+-  b->name = a->filter->name;
+ 
+   a->bypass_filter_bidding = 1;
+   return r;
+diff --git a/libarchive/archive_read_private.h b/libarchive/archive_read_private.h
+index 3bd8de2d..e30b6c2b 100644
+--- a/libarchive/archive_read_private.h
++++ b/libarchive/archive_read_private.h
+@@ -68,8 +68,6 @@ struct archive_read_filter_bidder_vtable {
+ struct archive_read_filter_bidder {
+ 	/* Configuration data for the bidder. */
+ 	void *data;
+-	/* Name of the filter */
+-	const char *name;
+ 	const struct archive_read_filter_bidder_vtable *vtable;
+ };
+ 
+@@ -250,7 +248,6 @@ int	__archive_read_register_format(struct archive_read *a,
+ 
+ int __archive_read_register_bidder(struct archive_read *a,
+ 		void *bidder_data,
+-		const char *name,
+ 		const struct archive_read_filter_bidder_vtable *vtable);
+ 
+ const void *__archive_read_ahead(struct archive_read *, size_t, ssize_t *);
+diff --git a/libarchive/archive_read_support_filter_bzip2.c b/libarchive/archive_read_support_filter_bzip2.c
+index 588953f2..1cfc55dc 100644
+--- a/libarchive/archive_read_support_filter_bzip2.c
++++ b/libarchive/archive_read_support_filter_bzip2.c
+@@ -91,7 +91,7 @@ archive_read_support_filter_bzip2(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "bzip2",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&bzip2_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_compress.c b/libarchive/archive_read_support_filter_compress.c
+index 4e1f1dc5..4763995e 100644
+--- a/libarchive/archive_read_support_filter_compress.c
++++ b/libarchive/archive_read_support_filter_compress.c
+@@ -160,7 +160,7 @@ archive_read_support_filter_compress(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	return __archive_read_register_bidder(a, NULL, "compress (.Z)",
++	return __archive_read_register_bidder(a, NULL,
+ 			&compress_bidder_vtable);
+ }
+ 
+diff --git a/libarchive/archive_read_support_filter_grzip.c b/libarchive/archive_read_support_filter_grzip.c
+index 9d9ad46e..8457ec7c 100644
+--- a/libarchive/archive_read_support_filter_grzip.c
++++ b/libarchive/archive_read_support_filter_grzip.c
+@@ -62,7 +62,7 @@ archive_read_support_filter_grzip(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "grzip",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&grzip_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_gzip.c b/libarchive/archive_read_support_filter_gzip.c
+index 89ae0f37..34b174b7 100644
+--- a/libarchive/archive_read_support_filter_gzip.c
++++ b/libarchive/archive_read_support_filter_gzip.c
+@@ -96,7 +96,7 @@ archive_read_support_filter_gzip(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "gzip",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&gzip_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_lrzip.c b/libarchive/archive_read_support_filter_lrzip.c
+index 33910fe1..a1d45d77 100644
+--- a/libarchive/archive_read_support_filter_lrzip.c
++++ b/libarchive/archive_read_support_filter_lrzip.c
+@@ -61,7 +61,7 @@ archive_read_support_filter_lrzip(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "lrzip",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&lrzip_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_lz4.c b/libarchive/archive_read_support_filter_lz4.c
+index 19086a1f..28189a07 100644
+--- a/libarchive/archive_read_support_filter_lz4.c
++++ b/libarchive/archive_read_support_filter_lz4.c
+@@ -118,7 +118,7 @@ archive_read_support_filter_lz4(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "lz4",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&lz4_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_lzop.c b/libarchive/archive_read_support_filter_lzop.c
+index ebfaf01e..5a552fce 100644
+--- a/libarchive/archive_read_support_filter_lzop.c
++++ b/libarchive/archive_read_support_filter_lzop.c
+@@ -109,7 +109,7 @@ archive_read_support_filter_lzop(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "lzop",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&lzop_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_program.c b/libarchive/archive_read_support_filter_program.c
+index cf7c3613..a9e02a32 100644
+--- a/libarchive/archive_read_support_filter_program.c
++++ b/libarchive/archive_read_support_filter_program.c
+@@ -156,7 +156,7 @@ archive_read_support_filter_program_signature(struct archive *_a,
+ 		memcpy(state->signature, signature, signature_len);
+ 	}
+ 
+-	if (__archive_read_register_bidder(a, state, NULL,
++	if (__archive_read_register_bidder(a, state,
+ 				&program_bidder_vtable) != ARCHIVE_OK) {
+ 		free_state(state);
+ 		return (ARCHIVE_FATAL);
+diff --git a/libarchive/archive_read_support_filter_rpm.c b/libarchive/archive_read_support_filter_rpm.c
+index 01bd1bf7..1cfddf75 100644
+--- a/libarchive/archive_read_support_filter_rpm.c
++++ b/libarchive/archive_read_support_filter_rpm.c
+@@ -71,7 +71,7 @@ archive_read_support_filter_rpm(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	return __archive_read_register_bidder(a, NULL, "rpm",
++	return __archive_read_register_bidder(a, NULL,
+ 			&rpm_bidder_vtable);
+ }
+ 
+diff --git a/libarchive/archive_read_support_filter_uu.c b/libarchive/archive_read_support_filter_uu.c
+index c0f6f48e..10d49648 100644
+--- a/libarchive/archive_read_support_filter_uu.c
++++ b/libarchive/archive_read_support_filter_uu.c
+@@ -92,7 +92,7 @@ archive_read_support_filter_uu(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	return __archive_read_register_bidder(a, NULL, "uu",
++	return __archive_read_register_bidder(a, NULL,
+ 			&uudecode_bidder_vtable);
+ }
+ 
+diff --git a/libarchive/archive_read_support_filter_xz.c b/libarchive/archive_read_support_filter_xz.c
+index 7c8e0cb5..b00ba543 100644
+--- a/libarchive/archive_read_support_filter_xz.c
++++ b/libarchive/archive_read_support_filter_xz.c
+@@ -115,7 +115,7 @@ archive_read_support_filter_xz(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "xz",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&xz_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+@@ -147,7 +147,7 @@ archive_read_support_filter_lzma(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "lzma",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&lzma_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+@@ -180,7 +180,7 @@ archive_read_support_filter_lzip(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "lzip",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&lzip_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_zstd.c b/libarchive/archive_read_support_filter_zstd.c
+index 12eac04c..163f54b5 100644
+--- a/libarchive/archive_read_support_filter_zstd.c
++++ b/libarchive/archive_read_support_filter_zstd.c
+@@ -87,7 +87,7 @@ archive_read_support_filter_zstd(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "zstd",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&zstd_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb b/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
index 868086e319..01a5249a88 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
@@ -33,6 +33,8 @@ SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://run-ptest \
            file://0001-append_filter-Use-last-bidder-for-filter.patch \
            file://0001-test-skip-ppmd8-aes256-streaming-test-when-no-crypto.patch \
+           file://0001-append_filter-Verify-that-bidder-and-filter-match.patch \
+           file://0003-Remove-bidder-name.patch \
           "
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 

