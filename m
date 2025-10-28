Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86858CCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 08:09:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3464.1761638994931031043
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 01:09:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rKiVGL/c;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=23965b7a17=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S5m3qd3831569
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 08:09:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Yj+x9fERZ
	1cgeTR1shTvln2uKGdLV4jp+RvdKciNJD4=; b=rKiVGL/cD0X4NiDdkej10LbIR
	jBEwMkXE4EaRMJQAvAJNcrFrlJkN3K2f4NEOeS3RJuDGHGdQXVx9KKh8sYZXKjmK
	90cKa47RsB4B9JSBSQDuYBkwynE/UvLzd2VYpaSgsNpNaFnukTGMt5CZWPGPpS3j
	yXDAfmKqy/AWjTexmWFMdmxXRoq25au17HOYrGZxo4x7CYfKuZ0l0qH9yVIidXbo
	HaDJShGdT/X5LYiPcw0yEf7FGLDBYmTp55Oi2N8xYcb0nMOPw2Z2i7HzRZMT1IKV
	ujZ01yJAEPr8BYbO7WAoBKlLq25F7heQ2HjGIOgK2DTdzh/eGBqaGJbbVk7Iw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010029.outbound.protection.outlook.com [52.101.193.29])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a0nh5twcj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 08:09:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lb/0hFnYqBuHyQhsc7lXHdYP/xkD5NHQ1hbD14g3cHJ4gtdmrN0FvSTxdchmE2EYQ40+SshRJHq8x7vMjEEsoHvnRuWjQ93dRaCi3dcEvqs2I4yVElHhkqBRnF/KP+f/VIrxckEjGIcb2p3XnMzTaO1++d9hZdDVXAgOu5UfMNm1gnJPvMvf+CHZX99bZbG0BkQhGEZ1SmF4vVKfpMVeMD4z1OVRQplwJKP40NCZ5z7ULW7NtAMZPDGpn8xC3z/FHQiiXY3YhvjSvX7jQhg6jus+tcLtk5eoxKfObuPJ09g6tQVxky+QjiQi9BVdea/hQhSNyL65kxyCzolkRVx0iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yj+x9fERZ1cgeTR1shTvln2uKGdLV4jp+RvdKciNJD4=;
 b=T6yw5kIfQCURiMvbbLqRqiBqnqHpbMzou7J8nVUGVfPGRe1JY6/Qpffejanv1gwy+S10pSich8e8esGpW9JcfXHRmq/ILpxA+jg2rDVi5QoiJ7EJ82dHvAS8i1x78Ixc6p6ehIo/iSb8CId6zQLHEHiXdmtl5ogDIgdm/XhRNk8KBdWOCnG1pR+HdiQXjgWJF8Hb3ZyFqAw4juPa/9kbjL8BE+zbRpn0Cy8hdV4QE4PH2h9zCEZCqaYCXYlso2F8poBxm7TeJXqM5pJpsrcxGTHxSnAEqI1+WMQupxWRzhCYfuScBwPnzdcPkcmNA1rKPchVd/gr+te0XWMxDlbhVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by DS0PR11MB8740.namprd11.prod.outlook.com (2603:10b6:8:1b4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 08:09:51 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.9228.016; Tue, 28 Oct 2025
 08:09:51 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Yash.Shinde@windriver.com
Subject: [scarthgap][PATCH] binutils: fix CVE-2025-11081
Date: Tue, 28 Oct 2025 01:09:25 -0700
Message-ID: <20251028080925.661201-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0018.namprd07.prod.outlook.com
 (2603:10b6:a03:505::22) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|DS0PR11MB8740:EE_
X-MS-Office365-Filtering-Correlation-Id: 04a27b96-4258-48c5-7105-08de15f95e8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VTvC/YIWArWX3xprV+JpC6QaU/0AoZXDNqoQUJvExli+HUyqLzkfN+D2L+Vq?=
 =?us-ascii?Q?zO1sNjZyta5ciL2E953EtzqObZzKzLIfhBFv9ZE3bh3FJ29b2O0zNwDrNhwE?=
 =?us-ascii?Q?MQRrisVLeH0HOLqxEXcWW9ubzWoUqv+WjkXQqwQdYD6LW+is44THxN/ZQwSu?=
 =?us-ascii?Q?Wv36CwuxsVMgLn9mrRXzkhrAcrVS6Q14HLdIgb8U7Y9Duhrqg4XGkqUl+Hiv?=
 =?us-ascii?Q?5AkPAvY2ggPZphxtiW0iuMUmi0/cHqYwy5RJuHxjmEui8m4kRvpXtT9Z/FC+?=
 =?us-ascii?Q?znD1yO7S+T8U2LrLVLboCzSnFvF7bsuO55AeFB/yjQNYdjiucmqkFVUOU8ma?=
 =?us-ascii?Q?Ehc3CxzUy85WR8XNnf5vi1yU647/Lb+U3SwnElJPejAGaejVEeMdeon5zHLe?=
 =?us-ascii?Q?xPnWUiMNQHD3BKHC6poAW8qpaqaYFOUiooMW5455IFPFM96GA/uZNCiyOs8f?=
 =?us-ascii?Q?mWEZRKJ4LSSmyiHP9dnlO2/Rz8r8gSprGSz6htaUKTfglwTmOeCIAVoVc+Z3?=
 =?us-ascii?Q?836DirJBSOwJOkgSFnGgWztuuoEXSAzCttWRLENENWIUR4KzTjN2/XSvAhV2?=
 =?us-ascii?Q?LsKrWbYhO4556u9xaoId0dKA+qSzX7P5pAjeU2KdLgjJ+xdy3qUuQla6WKpt?=
 =?us-ascii?Q?rp/iU1OswkGjRH2kpY1FEE3eWHGD5q6MmYN74jYJekoMLNtI836sNK3f1CGX?=
 =?us-ascii?Q?4kbDv1YlcnFqLTRnX0lnOBMVCdHbCuktWUGyOYleZfuAz7zvsbo52UnGGjB6?=
 =?us-ascii?Q?TbKRJvG8wrANMmkae/qvhL5/HI0y47GB0tugyzjJjfHEJRDtJ8VdT4ptbQcu?=
 =?us-ascii?Q?Bul0BCCza4d2bzjI9Yy7uOac68K9Q5TCFCIsxPn8Q8fqCbWmo1rxTtdpN1jN?=
 =?us-ascii?Q?bDlAq6PwIhBBsaUwbDKHIX8gl9/18T6zLj83rCGzduvKS0qbAf04k5Dr/9eT?=
 =?us-ascii?Q?/Ssuv32JQUDEgYkgjC+5g0Q1BVAxvBpNayFXZFjG7bdFyIc04PD2u/4xMZ38?=
 =?us-ascii?Q?zsDFDMMf8bl9uOw4Cz6tr2ZqfRUTurasS9i0KcUj8cJDx7nHqSnTFQadDxQl?=
 =?us-ascii?Q?NZBKUb3J+C0wHHEJG5yEsMzLrYVk/fyjCGbp/zFm+ueD4C021M0EHi9lvPNk?=
 =?us-ascii?Q?0nk0TjJhWCy1dJSBSzJApTwaRSiF0BpK+hbQGMhcoQql9Io7+GvN7eAxEysd?=
 =?us-ascii?Q?aQB4QPMT2AzEhAimkMPz6xjCtGgi8Ob5h/SCs4T8etPDTyFuo3qDvWwgQoHA?=
 =?us-ascii?Q?uyDnVJ+NGefH9saWFCIR4HU8wbQRc7yQMxeWEYjTgYh6COujjVHTJ3ET9ooM?=
 =?us-ascii?Q?RjzYqUiw77eA+jK36oxgnEtGXRaGquYbmx1o1GdwqQQYK/HmWWGSQPapRME4?=
 =?us-ascii?Q?OgfSrJ2NTHXIWdsaAO0VApFuRryoJA7Kz9b0O966/jBR26psD0DF+ygYGa+o?=
 =?us-ascii?Q?BAw8yh8VDv8XF8Mp51pamGeN6e7jdCY6kf3JmhPM6TuXhfD0lSt//A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YxnrX/QABPGsnsE635JpZhMYvBt9y+PyMR3m1D7GbHH+kBtSuklBz7UxtmAz?=
 =?us-ascii?Q?WmLXGoWBRETKhgJJlhesHH9VQpsu4iaez5o+HeetnELt4322Eg14qhwVBYlN?=
 =?us-ascii?Q?Hy+yDPYatSWPEuF1uyPvEkY/SoOZM5OSwaw7LBO3RQyAe9C+r125cm+VwUVd?=
 =?us-ascii?Q?Y+4L/mr0bnC/L1CSRduQfZzsnkNvJOlplJPHMKlGZrO4gP8ZeI5Ow0Pi/lLW?=
 =?us-ascii?Q?jTVqcarA16Ko04aMCp1LF/K++6WOPt0GEhtq0gHbF1ITrDwI9xnS2eIXWCi/?=
 =?us-ascii?Q?9NnFb6pJ2jUZUhsV1Fuv9NU15F49PV88nTwhbFjLhxi9FnsQqrroitvn5OlL?=
 =?us-ascii?Q?YlWKNGeCS6MVlE+FMozBwQTiqkSxAj12HAc9jo3VMIcvQXpNinNdmBeKqzHv?=
 =?us-ascii?Q?9PPsVE1YSMcfcmu55/FBU2bmh7Zmpc8y7X8JryykJ3jpEy0sD2/iuw/Z5RxV?=
 =?us-ascii?Q?cdnPCok3yU7f9VpkCgNwhFQ4gGWOC18Y3PT70gU5+ZoLHnRKXQAyZSfqeFII?=
 =?us-ascii?Q?SEyGF9D3D342ilfXRC/9WomDkkMs/OPpBW3kg15RshHaERyfhmEpDFZjYxb2?=
 =?us-ascii?Q?Utk/hnxpG+2AAcOOf4g5DyQ4zBQL26lsdJkIlh3VvfiIDE4NV4gmRKVYL6LZ?=
 =?us-ascii?Q?gSuByyW9ql5zYRzxQ+nLoLvG0vvbperH32f2B8j1aHGFcNTSRAm/yX/XC9kn?=
 =?us-ascii?Q?DuLmc+e6R8BooWMslwNJZ7JHaINRaqoW4zfZd9YuAL70eGkvjT3nqMjZ+gmh?=
 =?us-ascii?Q?Z/FnQ3deMT3lubM6e/0aNz7/4e+7AiGhIMSQ9mk5ZfuwQUN6RNlsx5sF6hy/?=
 =?us-ascii?Q?LEyRadQvIHNq6SSFV2QIZ9s63wSZVkedaWyDCGt7NTTjufmihZDjd2aItWpO?=
 =?us-ascii?Q?UNjj2PI9VN99Stjhr89bBKG/gIp5etwRj0Qdoj3LoG6pmGjhBT7H0Y1B7Ys+?=
 =?us-ascii?Q?t3KsKWnohcN/P/qQgeQCVUNTqBYQ/BjvXZitI7NoMX5aaxgFpg71j5XZeiAF?=
 =?us-ascii?Q?wQP1fFhIrPP0Lb1V4VlEHwOpGqnEy9jgEDdjvOHqEDuaNJwRTOfAxKAECTx4?=
 =?us-ascii?Q?dL0J9l8iNJt8ebs52s0E4jLqU/Ij4jKm8Rdcj0oAgVZJYUJosSutIK2HXXzd?=
 =?us-ascii?Q?bw6KzLY3lKdOikW1hcG4SdtMDo/+RAJPu9g9bom6RCA9aomhgcrF47P4hf2V?=
 =?us-ascii?Q?bYUKrIsUKdeUXmmYfKJ64koUwzQZLiN9Ul/QBFLik72vhTyRvP6Z1ODLjH1Y?=
 =?us-ascii?Q?f5Tm39W4OATv9EMbl27Y4UJ4hKZBCKbYDc91Jlwqm1hNjvZvWgjoxLPjzyDv?=
 =?us-ascii?Q?TrgXCYPXabtr5a9ef4f1d1377KkZYUskfB131B2r9icIutnF0SLpqGFhPogO?=
 =?us-ascii?Q?UsDHrO1zOZKp3e6oV9XSW7JlYU8Xgow8oDqS4KZxdysnemTOvTo6C1O9J2yH?=
 =?us-ascii?Q?GWGzMUrEqXDqjXvNDLXSGkltpaXNfyiD6NNtdecBGVm5bmcOCCH1E7svP+nO?=
 =?us-ascii?Q?GcoFplkc9/Nx4i/mhGP8/kq6JDVYTZdnGC8z9MGyw2yZgJsjIg7OlXAOAZfR?=
 =?us-ascii?Q?61dVkUcGTL9wUbiCsyJQr6oCtP83FXQpuJzyByHH9i7Ub4pe2WwlzhuRWDZt?=
 =?us-ascii?Q?yg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04a27b96-4258-48c5-7105-08de15f95e8f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 08:09:51.1749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c8TmE9gsY+1Amp09CP3Drksi6x0/6o1Da9FoZV7PztP5Zdso021p+F1r8WVj2TYR2L6eR/hIfZJpfue5CUOirdvoZi1fyk/neKriwqzMTOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8740
X-Proofpoint-GUID: fAbtzbicaRnJ6cCLd90_ITx6ctTYf0zM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA2OCBTYWx0ZWRfX0qtv+QEmvxN2
 eUVzlw8IRs8jSN2oQZ116aNxQCOo96+h9iw8mX0bjuIHg+nw1/C4iCT2u/bIMQt/BzzxYvHjmjO
 4NnYdETSLjEFyw0EdNxuTWkutG1Xmwhs+T7FcgqDhwgpbbIHgLlpxgtFxHUsypNLdgkHQ/uIKl8
 7e419nunjQCkBHEcdZTxqIH/U8oOGXYTQea10uAH/7YybnIMTxYBnBVupkx6/MZYeXARRPh+6e/
 r8y74CxYor0tEjopiGKDH1elsIDl1QH+vKOLiwTJQAECN5EWusADYCGl6o9kTxe7tZMCZmcbTMl
 idvDkxt+Dxc5mBBZP2jh9+NNgjgQt4Y8ebq3F7zXLPhkYxG4sZPag5C9O72g5tjyY332IMTj6vx
 Dn8wtVGEgWODfSlZ/qydoPJPPHICOQ==
X-Authority-Analysis: v=2.4 cv=FOoWBuos c=1 sm=1 tr=0 ts=69007a51 cx=c_pps
 a=sujALEMa9QlLHAoAbbwPUw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=G8xoJTEVNainHG8ybTEA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: fAbtzbicaRnJ6cCLd90_ITx6ctTYf0zM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 08:09:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225382

From: Yash Shinde <Yash.Shinde@windriver.com>

CVE: CVE-2025-11081

Trying to dump .sframe in a PE file results in a segfault accessing
elf_section_data.

	* objdump (dump_sframe_section, dump_dwarf_section): Don't access
	elf_section_type without first checking the file is ELF.

PR 33406 SEGV in dump_dwarf_section
[https://sourceware.org/bugzilla/show_bug.cgi?id=33406]

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=f87a66db645caf8cc0e6fc87b0c28c78a38af59b]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/0026-CVE-2025-11081.patch        | 84 +++++++++++++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0026-CVE-2025-11081.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 3e180b6018..5447ab0da4 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -61,5 +61,6 @@ SRC_URI = "\
      file://0023-CVE-2025-7545.patch \
      file://0024-CVE-2025-11082.patch \
      file://0025-CVE-2025-11083.patch \
+     file://0026-CVE-2025-11081.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0026-CVE-2025-11081.patch b/meta/recipes-devtools/binutils/binutils/0026-CVE-2025-11081.patch
new file mode 100644
index 0000000000..31dbef52fa
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0026-CVE-2025-11081.patch
@@ -0,0 +1,84 @@
+From f87a66db645caf8cc0e6fc87b0c28c78a38af59b Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 9 Sep 2025 18:32:09 +0930
+Subject: [PATCH] PR 33406 SEGV in dump_dwarf_section
+
+Trying to dump .sframe in a PE file results in a segfault accessing
+elf_section_data.
+
+	* objdump (dump_sframe_section, dump_dwarf_section): Don't access
+	elf_section_type without first checking the file is ELF.
+---
+ binutils/objdump.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=f87a66db645caf8cc0e6fc87b0c28c78a38af59b]
+CVE: CVE-2025-11081
+
+Signed-off-by: Alan Modra <amodra@gmail.com>
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+
+diff --git a/binutils/objdump.c b/binutils/objdump.c
+index 290f7e51f66..ee8823da05a 100644
+--- a/binutils/objdump.c
++++ b/binutils/objdump.c
+@@ -4418,6 +4418,10 @@
+   else
+     match = name;
+ 
++  if (bfd_get_flavour (abfd) == bfd_target_elf_flavour
++      && elf_section_type (section) == SHT_GNU_SFRAME)
++    match = ".sframe";
++
+   for (i = 0; i < max; i++)
+     if ((strcmp (debug_displays [i].section.uncompressed_name, match) == 0
+	 || strcmp (debug_displays [i].section.compressed_name, match) == 0
+@@ -4923,6 +4927,36 @@
+ }
+ 
++static void
++dump_sframe_section (bfd *abfd, const char *sect_name, bool is_mainfile)
++
++{
++  /* Error checking for user provided SFrame section name, if any.  */
++  if (sect_name)
++    {
++      asection *sec = bfd_get_section_by_name (abfd, sect_name);
++      if (sec == NULL)
++       {
++         printf (_("No %s section present\n\n"), sanitize_string (sect_name));
++         return;
++       }
++      /* Starting with Binutils 2.45, SFrame sections have section type
++        SHT_GNU_SFRAME.  For SFrame sections from Binutils 2.44 or earlier,
++        check explcitly for SFrame sections of type SHT_PROGBITS and name
++        ".sframe" to allow them.  */
++      else if (bfd_get_flavour (abfd) != bfd_target_elf_flavour
++              || (elf_section_type (sec) != SHT_GNU_SFRAME
++                  && !(elf_section_type (sec) == SHT_PROGBITS
++                       && strcmp (sect_name, ".sframe") == 0)))
++       {
++         printf (_("Section %s does not contain SFrame data\n\n"),
++                 sanitize_string (sect_name));
++         return;
++       }
++    }
++  dump_dwarf (abfd, is_mainfile);
++}
++
+ static void
+ dump_target_specific (bfd *abfd)
+ {
+   const struct objdump_private_desc * const *desc;
+diff --git a/include/elf/common.h b/include/elf/common.h
+--- a/include/elf/common.h
++++ b/include/elf/common.h 
+@@ -528,6 +528,8 @@
+ #define SHT_LOOS	0x60000000	/* First of OS specific semantics */
+ #define SHT_HIOS	0x6fffffff	/* Last of OS specific semantics */
+ 
++#define SHT_GNU_SFRAME	0x6ffffff4	/* SFrame stack trace information.  */
++
+ #define SHT_GNU_INCREMENTAL_INPUTS 0x6fff4700   /* incremental build data */
+ #define SHT_GNU_ATTRIBUTES 0x6ffffff5	/* Object attributes */
+ #define SHT_GNU_HASH	0x6ffffff6	/* GNU style symbol hash table */
-- 
2.49.0


