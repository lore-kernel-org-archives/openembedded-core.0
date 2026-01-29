Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E72D6B09C
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 16:39:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19182.1769704775598475591
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 08:39:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=h+GDnzgK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=64894db884=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TAR4Gl3180227
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 16:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ZvKo+6P9iOAPrSYXpXs5GsvzZCQrrJY5130rRZo5kgc=; b=
	h+GDnzgKASC6ovYALOYcSYmlVgxf4IwylOlqrBKzRf5iskxTWojVWjuwkB4fiJfi
	QzdgSWyjKahqJ0spXtGutWuNm0iwk1HvhEogmwxgvbOAAWyO7h6FTFJSvQWpbYqH
	T7WZiek32XlzC/6QafUK7ZuVoS8fuNYnsKMyhgwkdGfP7lVOF3tRena9XfQvPmDO
	M3Js2/eaJj1neHMV216rDiX4x2fOPWsxAWc+dETaOjHeNQix0o0uSYV1hUzYM6wi
	gkE22xtGTWYSZJujBTt4Fs47uk4d9OOIGFivyXPmxXMntqdlVWMYSw8m7bvpg/k+
	MMoOyMF6X6SL8uAdyf4AkQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010028.outbound.protection.outlook.com [52.101.46.28])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bywwjgsvt-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Jan 2026 16:39:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TPh+6hWi5QaGpbIn8ecdOZUsGtEHNCir9x9YIwYfPA4QzeX6NzCcArtz9KKZlRb9UtYrndv1NI4k156i7nqtyVct9cLc2UG1Nuq3b8SKVEM6YlGsN7uEpwLX2NFL5wtQZSYpWjAav8rRoUSOF8zjidbXA3mERc8+6Ev2OE37PCixAg6lbk3nMfHqCfu4Or6NlA1LR2dfuHo0iRBKOWqzBVAa8sVlSKd66C4FRrmosacNCkiWaKFJH0aqdF0APV0h/S/XTB5DD9C/Om+T5Cwnqc+zuF1WTgYG8eF23QhY8xRg/2jJ1bXetqPHzkIRXb1N3jgLfynlB8gh0SRxETCv+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZvKo+6P9iOAPrSYXpXs5GsvzZCQrrJY5130rRZo5kgc=;
 b=iUhwNqnpd+2FXgVBEshNcxpY2BB9yjv1VjqaS7jhYWVOHuJoz0iZlaS1D4utoulvo5aPSiQP/JSlobp+FI4Uw3e0HgZHvu6m+Lk2bFVb1ejQeWmzdmNzGDemcjys5+vLd7kd/9zfI7cRfA2KUqFBIrO0Y+cg5cThwsOXkV/208ts2MkZkzHwwLEwdZ3uRXDx3mrP0qrZcKMLZb0eizFjZsumQ2PL6sP5KxRg6ENd6fScxQ7AZeJQaML93h1p8v15Z9TZvZi1Fwno4TENPwv5KN/C2/o5U0MkSMVEH8ghHJpXA+OfxGCUu0KyMcGZBI1M2Z2vpjmEQGJzu3E06wp9hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MW4PR11MB5869.namprd11.prod.outlook.com (2603:10b6:303:168::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 16:39:31 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 16:39:31 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        alistair.francis@wdc.com, bruce.ashfield@gmail.com,
        yoann.congal@smile.fr, elmehdi.younes@smile.fr,
        richard.purdie@linuxfoundation.org
Subject: [PATCH v5 04/15] linux-yocto: enable Rust support in kernel configuration
Date: Thu, 29 Jan 2026 08:38:59 -0800
Message-ID: <20260129163910.2612040-5-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
References: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0100.namprd05.prod.outlook.com
 (2603:10b6:a03:334::15) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MW4PR11MB5869:EE_
X-MS-Office365-Filtering-Correlation-Id: 1221f407-efa8-4964-a8b8-08de5f54fa61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LzjhAtM8qYbkWafeV4nzSpcKzTqP9oufCi4dZlE4EYNeIKqZ0e71lcawXB6A?=
 =?us-ascii?Q?J1ZHQuxptxO8QgeO3QZOF7ZrLJ1+Gc8cfxACDmCe5J//ViEQSvR4RTPU2FST?=
 =?us-ascii?Q?moW+c3ntNPh/Xh2iBCts7MOPvS9L1+FWPMlwBLv16HDEkZlGf4GAzzuTOtSU?=
 =?us-ascii?Q?nuWUDJQM/PCLk0V0n2LDtNfp+xQ2OEx2x3UdQv0mNNo4TOnDbxZsUuOWJ7MQ?=
 =?us-ascii?Q?l7bYNoN2ujvX71UNaQJe7VMbwrdrVgKBu0YwQnBoV+GxU3Y/tskpfD7i3bq1?=
 =?us-ascii?Q?eIAu6PUUDb6/x/FBvKEY1cMn2K+Z8geqLykiOvCxiBwmU9/4E9W+7w36/2WI?=
 =?us-ascii?Q?ededYgKgVkVivIOFXeOYAxq3nIblwgShH+EaQujBTwqvDgo1WjfcE+xJovmb?=
 =?us-ascii?Q?/x4bJldI2PQQeovoWRJc9Wh3WGNNsd7alWtC2199bznYcMIaB2gjNUOnANt7?=
 =?us-ascii?Q?yHLbyX/wVBQ7LyfrpF2tH94w3vfVnKy6n36sNvMKNhPv0PPVfOApNMk7yl9Q?=
 =?us-ascii?Q?MFv0Nd/sKEQ9GxEQTgirNmqGknm/u6vJiAzKaDybr+MnMa1TiUOy4u+v2pLc?=
 =?us-ascii?Q?xzLLR4uzEBbw/HClTTIL0ZCo766YRYPgwVyVRUpB8qz6XBJB6OXDpc3EWkiu?=
 =?us-ascii?Q?yrHYmjdp/NyYftunsjPUdd5KLtWImq1SS7QkAM8NWQd1r8l8R7tYop9g90+e?=
 =?us-ascii?Q?TXD1Wyth+onfFMxfAb5VUkM0b6Mye3c2cWQ0TdMDVZlUL1CVTUdctRoM00Za?=
 =?us-ascii?Q?pZvPyYoM0picGgsbEi6Pv0qoTWEc2SPxY1O1Usb0lH46Pn5iKmsPw0bIpjn9?=
 =?us-ascii?Q?UUGIGUmjMjvQasi1Iz+RSv8fr/H+lwTIdFu4dsuMDhDGPv45YiwVSs8PGV8Y?=
 =?us-ascii?Q?2GBGV8C0dbun6BTf61PZDBywAtnnEqJENNnkFYKacJTdqk7HvoQwNS4yRvFW?=
 =?us-ascii?Q?T+5sj0Ql6nqQQBnuPRpiUTu7/1rUY+EF4zZVVl0+5LrA0VtID2xukTPwa1Ya?=
 =?us-ascii?Q?SImFMp5coMRCVxNZRNjYG1Tw7brJPmkfhbtpYvaLl7BfV6Da0TlqT8MNN12H?=
 =?us-ascii?Q?4s+pjSyj81zc2akgE7SfhRIdp3zUd+1+8uJvPyH4rvLDVT+ti+hP6mGpuc8s?=
 =?us-ascii?Q?uXOUbdJO0Y+TooG4nuD+GopbLOo+rNSWrE3RRnPIzF0YkL+oUFNkRSrrnuFx?=
 =?us-ascii?Q?SnNUd99EtSzUV+JyM9FznIItYnjpFA+z3Y9Gbre0V9mgaFbFaxo7Yq+xFBLx?=
 =?us-ascii?Q?yNyPH1MnVVGQtiw6psA8UyEibOhc0j5uoQjxadyVsiejfZtSaxjO+UCyaVIs?=
 =?us-ascii?Q?LT+jBDh6klZL4DDkcRmncsLQW4PTpnBCmW60F/ear9mBhCGQPz7EQJfmUT8J?=
 =?us-ascii?Q?/HlTUSjQHYQm3+MAnsdP3QhLdhWLoY0eS9eLSQS9QJyez/DGdbXgIfRqhaD6?=
 =?us-ascii?Q?mx11z0ZKigujfsWjVxYqxiL4hSref+JK6TVByExW8NB65Fphh7vpEUEPLgHC?=
 =?us-ascii?Q?FCUBazGZ4avd2skKB2Z9cGAyKBLMdgIldi0kLVXl9CgSJN48rEDcTKKSH83+?=
 =?us-ascii?Q?3Zc2pjEwkI7YVkGSwF+aI9U1YNbZSPqrf2ypC80rGsDVi95oVgL5PzIH6l3C?=
 =?us-ascii?Q?FtSzLmBTP62JwShKCcrPMm0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YJE/E/LysiTYnSM3Ez9PQvX7HgXa6R1Y7Sy+qePNnZgWYUT/tjTvu3Tg+sLI?=
 =?us-ascii?Q?Tnt+fGAMc0Bsznh89hyHN/LSVeuvYIlRp01UkhrTaW5yQUZNK2F9/FBPGOOs?=
 =?us-ascii?Q?txmf4Qw6s30xHJKsGdPYo59t+v5v6KinynlCuPKf/KoO7H5Vjtzt3jQmm1Vb?=
 =?us-ascii?Q?RIZ9T6rhqIjaKIsg13PlfMu3xozg51BESoGjZKJ/iJsSL9i6T5Mpbexc5/qm?=
 =?us-ascii?Q?uezvGKRmf8P/TBE1Ekkn7MP1p/TCq8P1p0yUByp+BtMSWvh5AUvcOR5XMsfJ?=
 =?us-ascii?Q?YDABZFZLNv9kE3Zdnerc4JA/DLm5gDMLiZaX1WfdNga5RfGz2BKgv0bmirTn?=
 =?us-ascii?Q?HLoa8/LAisyymWw1dNv0qTNK6UlzC1G4Pzb3BqVbA3pXbBSHogNL6xEDqYLS?=
 =?us-ascii?Q?mqbtw8zjVqMaW39JwFxFSbGf2U4IwvUc2T0fgpfy6z4i6aLaySl3DV+Fnl0T?=
 =?us-ascii?Q?ZAZQX0Lc3HJDSSxxUlsKxXvcCRIUBjTmcJIZEPIxYw2BYBsZppqTDWM0c0gF?=
 =?us-ascii?Q?WTDjqt4/qs1UVzlm2QHij3YonpX0vzy5FwpoPU7n2GPkFlHfu+TySH1mb4+E?=
 =?us-ascii?Q?w4KvDRbz4ldkbMOThsP9wdcTLL4UTmt8/pMS1qMM+zHbuvRBf+eFSYcGWftY?=
 =?us-ascii?Q?yXEVlUMJEtd37qIZ+K/42Jy5v1V+fL7CyYA0xzSxVsr0kONgBD1DmNx+KJmr?=
 =?us-ascii?Q?CA0OOakIg3Oq7V1UItsjimETow8RX8NTWD9/E7NQpzyAYa3Lb+r/qSZY0ddm?=
 =?us-ascii?Q?ECfr2xTyijMgUB8j4j9O/wZRkAg4KqO55RpJ4Ez1v65xqsv4K8set+2zZGiu?=
 =?us-ascii?Q?qgfsRROC2n0evjvoKT103P0yABjHPVkUbH0WxwEBk9QRsq0YgnAFYetdDBhF?=
 =?us-ascii?Q?ER1piJLojHm7YmimWJFOgnQM4wtCjlxfBTtgyE8865QN9eEYO7WoGfZSYNn4?=
 =?us-ascii?Q?aUqNLjU7aT8D9tSNpTkeNSa9oBuJBeP8B4DkpS/Kk1QC06vYZRCt96TgRKwi?=
 =?us-ascii?Q?Dia8onGwcxWzrKazdV+HVOmbK28m3OI7xVG1fd2aM+9UGVaHklUZaaWhPoaW?=
 =?us-ascii?Q?eE3fTx69KqJKDSttbYV/yvMmNQkJj9z8CpV2W40KQRy/1L9YjPVdnVpQ4Zpt?=
 =?us-ascii?Q?4iwbxaDyhdjky+tdVD/LLOwmv6qJxxIqe+saNaY2p1rHw0V7ObJ2XOAPYTws?=
 =?us-ascii?Q?zlvmPVMHuYnbIxR3VcGX2W8M75slfmog3rbGraOlexEVNyzICBS1jnJT1hZZ?=
 =?us-ascii?Q?MGWP1Rn6YjNA8hod5Y/0frC+D8dhfRoMgL7SRJMa/2zmJGjigN5F+1Qo5e7/?=
 =?us-ascii?Q?fQD2lPYY9q7Qw3I9kWueEnGwbp+LDO/GwU5z1zgjNEazjeImrE2+jUNMscGm?=
 =?us-ascii?Q?kugl+MZ42atokoG+LJkH9KCQwEX8jy1Zn1g2Kw2NHP4VW0dI4ZotdSQVa09p?=
 =?us-ascii?Q?ConDf5NbukoSTel75yLfxdIIv5ewEUPdd5mYSMy56eKnzpR4DZBB241B5VSJ?=
 =?us-ascii?Q?WWREWVUDn4x0jzGnby8xxI+NHYyB6IsY3QSRZ4eh+/zfVgwQ2sPJpgw75jew?=
 =?us-ascii?Q?kr3ZVDiCZTQ545WMj1cIcLZpFRMkqUfCr5TwLMfkY7MTjFrXtf47YxK8Wnrp?=
 =?us-ascii?Q?2EJR7a351zQAqAXlOp5FaHQZApBjdPdnAVidi62DgpBYgwo2Vj0vXwKPdU7p?=
 =?us-ascii?Q?Gv5+YijRUHeuv9HRWUBNHmWZfCkYHIKcU1dd2Ktdn/hiMS4hH4FWzjlGycOU?=
 =?us-ascii?Q?iQ+WLFPOvZmCnk2a157rh9bX6yEPad0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1221f407-efa8-4964-a8b8-08de5f54fa61
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 16:39:31.6581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dSgq/cto81oSnbmgdjPNnZtRZH7ntgrxdklN0y8f2iLD9eiCWISAUnBElYcYg0kQqKt8uBbXN57/7myw+EhiOU2mjx6QLkTqgwlOAgLNWqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5869
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDExNSBTYWx0ZWRfX044CiT7ZMXIR
 4czf041oAuNMdr6/rWbKXOObW6+Tue2Jktd7RMr9WpXPDqY9au8bkzb8brs4lq2yTXfbV5O4k1m
 b20PmPAe4y5UlS64aiJDnzgdsvMK28g+fjcfkxziwyeRi0JmpJJy6vdXfdEmMzSGq2OHBlfXCOD
 QrPP6D9EAyCk4A2onulhV1Ji3fbiCbbLfwGVaBAFBMzsy++WBbkki6DMSC/wFW1ezmUKVdsfz03
 FlgKRw5/MgqqihNRgprg7pZ6Og7ekrBrd5ctN4nMLGZiKZsKxsSrYMDFCh/vpgdIlw2kVckuMsh
 /pBMUUdwRzxUrXsfZ4oyX1OznU6rTjL4LiW/9oDcEdy+uQ8thtn3U7R3Ky1KEk9ZN5beSZbPW7/
 Fgm/h1jxnpSg2ckA+O3WAtpHV8yMX7bwp6ARIyZ7BGwxqS+dRFhDTIJm0+vcwUl8G9x2PZy82Km
 gnhHQPhq8zBQmszE/mQ==
X-Authority-Analysis: v=2.4 cv=I7hohdgg c=1 sm=1 tr=0 ts=697b8d46 cx=c_pps
 a=5NePcLBJi4TpPzNSyn8y/w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=jmWgeBySreYrfzyKUjkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: mU8ynpOVXT8aJpO7cVeOheP8xTPB87Jp
X-Proofpoint-ORIG-GUID: -qj3j0fDXfFSc_rsvQ7Teq1SGyEc5i9w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 16:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230145

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Add initial support for building the Linux kernel with Rust enabled:

- Update `linux-yocto_${PV}.bb` to:
  - Append `features/kernel-rust/kernel-rust.scc` to `KERNEL_FEATURES`.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_6.16.bb | 1 +
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
index 408f14b451..e468fdc0d7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
@@ -77,3 +77,4 @@ KERNEL_FEATURES:append:powerpc64le = " arch/powerpc/powerpc-debug.scc"
 # Check again during next major version upgrade
 KERNEL_FEATURES:remove:riscv32 = "features/debug/debug-kernel.scc"
 INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
+KERNEL_FEATURES:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' features/kernel-rust/kernel-rust.scc', '', d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 599a3d13b8..3c2bf02221 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -77,3 +77,4 @@ KERNEL_FEATURES:append:powerpc64le = " arch/powerpc/powerpc-debug.scc"
 # Check again during next major version upgrade
 KERNEL_FEATURES:remove:riscv32 = "features/debug/debug-kernel.scc"
 INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
+KERNEL_FEATURES:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' features/kernel-rust/kernel-rust.scc', '', d)}"
-- 
2.49.0


