Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC2F5CFD364
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 08:40:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12844.1764060026423301165
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 00:40:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZeNX5wjS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3424b42751=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP5onLl2878977
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 00:40:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=rXCLB4tDk
	DDl9edCluQjCqKRGLv1oPUByz/NdfhjzKE=; b=ZeNX5wjSsbnf0OiGu20AMnNiW
	eQtRZ7WJ3Lydj/C9DrNmzdC8/CtwBlWe0N3BCD6liDKuQue+HSybAIOKJv8YgoPL
	fpgw9C3/MhDZyUWDrsnA8lAdQbfqmo72KTKRgJnXoL7QHPKNSREBO8nGahMY+DGA
	W03vcO8sahe95FAy9tgAZtlCG2AiRFoOiS4bvMyxcoDz9Wo1agzILQ22QKQPJZvm
	sdk0ZBgY/YuOTf9FV4zL+waqKmBZbcsglHaDMUjmbjJe+9/IXJgop5VDbwqvgz1F
	iATojwnuKV+lR7d8qkpJtvQTtlES2S96Kz/gUakmhEWHXucBb62yQkFNfEJXw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013033.outbound.protection.outlook.com [40.93.196.33])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4akdjjahtm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 00:40:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bTog9FkyOwWtIYVgxHU+8dvI7PjQ21tPmeQHM6WD+YNRbASCvTiKj9zEF+PMureak896FaOkNcKjhVj1VHUD8AnWMd2eYMLa7Cfww6s4HPktjxi1b1qfjU12AaJ+MJeNYQYZ41a7wXDs0EicjHXi1CPuDs/z05SRUvuK5EWx5BvInyitLBriR+9qq27D69NEuLUhzxjefFCmcSAVbXKbCrhgcLANETp+SPy0cqh8BitUrta24hohhAjFCINYmAqRBqoAyJrOd9VFHXOqaFT6FkF7sEmTfS1kVextRY0ZmTrj4aXlOaUlLz2770yLkZrssg2CYNJKxfhk4oJFO9vMRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXCLB4tDkDDl9edCluQjCqKRGLv1oPUByz/NdfhjzKE=;
 b=XpmdhrZPUiP9mg5kCf9FGZbhpc33uoPA+c1b91cMrkNWlgA42cgFrfWQ6LotemRvI9npWkNq3/L7/yFMuPLMk/PplzJtur+uOftWD/IZixjxGq+/Cr+CSHDg6sF3G8KZg8PDpD20lUPDyuREsz134bzb53rKETKJBuYVkFOrKsSg8ogMHaVKtbnLB361YrbQ6Qv3tw5ZuSNX87AXQ06IF0EHNckGwqkskUim2GYjsEsTjeMv5yYGec4Y6lJoE4Zi9aTXdc7NvxMlngIJohWaP+HV/NvhgReIExa/VrP31CiedDmA2UrPiRfhQ9uZMReFBAU9ARApD/Y3H58t9GnJ+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by IA4PR11MB9249.namprd11.prod.outlook.com (2603:10b6:208:55f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.16; Tue, 25 Nov
 2025 08:40:21 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 08:40:21 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH 1/2] glibc: Drop 0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch
Date: Tue, 25 Nov 2025 00:40:04 -0800
Message-ID: <20251125084005.3939139-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0072.prod.exchangelabs.com (2603:10b6:a03:94::49)
 To SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|IA4PR11MB9249:EE_
X-MS-Office365-Filtering-Correlation-Id: b9d792b6-d9bd-4ddd-62f0-08de2bfe44d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HhKhqcJk7XPyZ922BnTI4yEBCzWc24hJLRyrJI8+lTJX/FipULb92xrjwZVO?=
 =?us-ascii?Q?Ui270xyEm4Eh604nRL0lkrBwHK1+nKx9krVijSP0faLrZ9Ufs6sW0PrmRt79?=
 =?us-ascii?Q?IDjfV5FuIfNp7rP2LIpbCBxbYZTK98icSkWKm77uu/IPjqAUGIVUoPB5A1Oi?=
 =?us-ascii?Q?6pfar4V5KA1NZhdS/IXyemW/zcEd5q13UcFSio2EdPNnVe/WO3R9MODIBS9F?=
 =?us-ascii?Q?veCWgepy3smYNbawAFq9ccgXMqt4FFPYSjh3inaifdadS/pPkVVc027IX4V7?=
 =?us-ascii?Q?P/W37c7/Rriu7Ak5Xwf1sUaFSpWmYxdradijmsb6SDlsXinyC+3XChSkPC+M?=
 =?us-ascii?Q?JqD5qy9XdufUfJMNYEAnz2rIN1O4TQAvMHUc/ZuT/NULH2SQ0nQ8tztMV/my?=
 =?us-ascii?Q?yHIqeO4CpcgqQ03yhPsUwSXzytxEIr00YPz1j2X27/iNs/YrsIeTAISYxCke?=
 =?us-ascii?Q?2cMKet/sT8FNMZLyg3tLdFWyZGrYG2wy4FzMuM3St3YbFb2lRs81dy6rIEH8?=
 =?us-ascii?Q?FWLqo2Ro8HUQEq8NrCw9qfdr0hdneMhbOlRBUYk3HXcMv1u4A7Qc0xhCf8pm?=
 =?us-ascii?Q?DT8oKWuhR1iWo8B/I83xaPv9golWL4B7HtYkt8ul64YN8vu5YGUK7HbpkNB4?=
 =?us-ascii?Q?d0AyA/ryozO/YFhR/GuyR/5wRDYPQkLyZ1vGJI/CBXpbtsMA49oxfb5zwwAc?=
 =?us-ascii?Q?wWl3NUCGXgENkoaMdI5IT08ZXMtpwn3VfKprgQYSdbT4vdvxnrDBMOBMn3Ee?=
 =?us-ascii?Q?3zWl3fwJhoiOSDCGSZu4MV0u17KBRCZhD3NCyxXM5A23EdvLMtz3fYDB9Cem?=
 =?us-ascii?Q?hukYSTAQIyn3Y4JXv7f2+lB838yqzcv5BwZzYAmzr8mYt81eGzERLrJQEHzt?=
 =?us-ascii?Q?P0cPtLg3HsawsXPyJ18yimpPto56cPzKD8UxFiybF6DpylEFjYKb87RNKXho?=
 =?us-ascii?Q?ncrREOePGfd7U6TMGihnaoOxOhN4MffCCpCid10lEniIPR9pRVsrjEH1aUqt?=
 =?us-ascii?Q?itg99igHcHZBvHBsMXrrRPu1WR6GoVs65hi3W4BPAv66F+FEHBdiFXrnGIyT?=
 =?us-ascii?Q?1h0mwPyuBUB49TvEJz+qLwwfGgxlyNCnI3e6ZiLOqLHiQ9w47+Aw4lRY+wtc?=
 =?us-ascii?Q?4zgnhrT7/7aqKeqV31ovw+QNOqBJxl4n7KSLF0DUpadrVxW8OMM9gJyHIVtR?=
 =?us-ascii?Q?vYShiEFS/GS5HtJdZmbru8U7zbOV5IZL0ij7b7Qbm1DYK3de58IB/smp0a2I?=
 =?us-ascii?Q?TKTowlf4uy6+sMdrqClKRmLofM0ayAMRsvufdTU/wH8oPDDXFVvqgEkjD4+a?=
 =?us-ascii?Q?wSzrpIwU+ztd4ZGh249acW5FbfqKmrh2H1gOio3Tbq7kvJoZpI91cDlx1NRv?=
 =?us-ascii?Q?7smIc99H7LSx0iYP0i0wgDeLy16RpwVCI+SCHV2G1c8bUk66bWGsf9IT9r5M?=
 =?us-ascii?Q?jsDVpRe81z27Hwu5WkqpTZ+werKET273BlFdRbD4N3+vfmnftkMgzk65XSK2?=
 =?us-ascii?Q?HpPYj272LcpvGNHvmpPusLNwZpdJQh9wu9RD?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Vrut6aW00PJcDOSIRSI73z3iUtq/1SJYwMUu1TAfeQB604dTZVVDx9Rq7F1W?=
 =?us-ascii?Q?gya1J0dyYUthheVCF/MJLsvHQ2DG87d3UROhodUCr9HOp/jo49aatrAdMosf?=
 =?us-ascii?Q?1ctoQduUWPf64u5N3Dl95khfm6zAfEAGMyJc4PcUt1aAPzaaGtvPi8hLzZdW?=
 =?us-ascii?Q?jBlQcV3TBomLNYkOrppOh8FxC3JTmu4d+0xJ64QQMOE3eB+yUU/lNL3bcqxe?=
 =?us-ascii?Q?DrbwzpEjwHvSrGLWR3/R66V62MMmB6xyEijRQYGl9gYsYWOiJQM9scKDMB2S?=
 =?us-ascii?Q?cMxaSgDosS7I3bOIZio7nH2XPeyeD4yFhA1IbDhptRibm0HlwU4d5DOk/VEz?=
 =?us-ascii?Q?SdBTKqq0CIvQt80EgsQhuf89ghU+w8eY2TQaMuPQVTsDtDL8JOvS8R0Kou+T?=
 =?us-ascii?Q?0TpEG8lJ9xBYdTGnlNrO8W5Ktur/5feWMsgehtArmBmKDFv3o6Syt1cQw5EE?=
 =?us-ascii?Q?FHMR//7RBmsZiibxQK9S97JvoMYtFe9I/1vmJEEFNcvO/DaymvypmuOn1mRU?=
 =?us-ascii?Q?R62S98keigQVKtny7lVGqxJnkLZb2Gt+cW6bFxwyo5vJbEkObqQNe2hotroU?=
 =?us-ascii?Q?FvYGhO1uq1oGgkPW9iLePUKXsUH17Fe4BCeBLKidFEq4teuehsiITxISjzt/?=
 =?us-ascii?Q?eC43Pme2bWGekMfZUGngfSEiXzVz8hry2ktrotiHesWXHZA3j6ibHb6A7svK?=
 =?us-ascii?Q?2Sk+JfL/XXMf8vh51HTMWGrxCbGZ1usqmB2ZI3xnWUWivsJoWwEtZ/KejLXK?=
 =?us-ascii?Q?DzNKPzr3HAjfzb8zsGaRVDy3ovtWI+XhMOPuJpKnlrshPeK13aWMcf874/8o?=
 =?us-ascii?Q?ty50Rlpn9FrWxeyzy1BPg/dWRrDUikbW4EPQ95n+MRXWrGLYOGHU0DTk213Y?=
 =?us-ascii?Q?Ac7Qu5nd21w775Hyaxy4P0w47eBxqOwlI8tEzxzmihrnJMzsZ9qvUnbsavJd?=
 =?us-ascii?Q?oUxMMDb7LJpKd0FGN9JQ4+oI1B2TSz/YHD2CXKn0Pzi3xqFBoOh89AptVv35?=
 =?us-ascii?Q?XBwd4COCktIkOevdCDj+1YXJeZR66t4dySz+wananTueTlkCdTEPNcMuehnP?=
 =?us-ascii?Q?RXCRA9furYjojiG5m2aj4dy7xwLqbSl3qqfYvmTDxRiFPwwOTf7qWQm3XYH0?=
 =?us-ascii?Q?7pvbY3x+Tdd6yH5TbTmJWSnY1JWyTy706CboVm2zxk+SQsz0nNli6K70MaJ4?=
 =?us-ascii?Q?yWzrIYeX/P1a4Ey6THp17QR6Sa/3LFQ+ShN3Ee1pybPSwtcf3zFMeTwCWhDj?=
 =?us-ascii?Q?7U1RItHgUQaMkpfQFDRlEbKV6+zWtKFs36sN3OzNstgsBXOsr6HLjMz118Hc?=
 =?us-ascii?Q?efSehvgJoqnbc8Udk9bmFnLnZJ/nX4uJ6qA6r2QGezi3SrIwaXufDLiKHdkw?=
 =?us-ascii?Q?1719FenRP/W1i2hNFx0tQh19j/PYYsThdqKHVnU2iTcUjlYmAW0HJ+yt3RUS?=
 =?us-ascii?Q?R3xagYOOTHQCRi8c4PzFZILJYsGJ/mqjW77X3kBYYq806ljKQCAamrWep+j1?=
 =?us-ascii?Q?nV7LpM0VP3/+KVntpuTCNFFv0qNWXwZrpfd75A9w+3dduOIpSQTXrE8RhSUe?=
 =?us-ascii?Q?tsqFXVDS1+grFslBn0thcu8AhkERIGu83vbZMByru+tcGBemUvfA1eIvZYtF?=
 =?us-ascii?Q?bIKt/8up0lhQl1ieoKnOByc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9d792b6-d9bd-4ddd-62f0-08de2bfe44d0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 08:40:21.1011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 53wHVpgRij1kPrfdfYY1ENmq3lsT/1AoZ9RNf6EmTvLxXrN9EGz628JkWEoR3E1CIAoLantCBEnUzJtTTb81rn1mfflSKjD1QgTiAVL/E7J2p/qFpUy07IydMxKd1qCY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9249
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA2OSBTYWx0ZWRfX7wgvHOV3EBfp
 XUouelroIh9ozSpgdVOYne/oZGKzD3GStW5iDXQeMmshKZAIcURPYhE8UJ7+pmLZa29PWhFd8L/
 Ftt5toYdNFl9FJKu/w99NfFUw0XfyyAaLnNHfOOqtbrSkLfGnb54zEsHIK/qM80PPJIP4lNYkbE
 b03902SlkPfGbI0cAwaWITbXigvitisCwcyi46FttTzyiSAJ03X/cdsJW8GxV//T5P0Fn9OhY2r
 UqRzxy8WdX06FYFLeOnRR+xC43L4kYQC5k8oDKvXE6irjcHRIYlMTJZQqpAweBk+ad2ANEaWJVC
 6dF+h9XaEfQwdmsW32Ghh+44OqAhNoxUsgaG5vmyf0xnsGrCMOQHQYFTiRQyrMJH4SWwV75J1B0
 np7dzvQXXOE9FsSTfgwulDToaCJNkA==
X-Proofpoint-ORIG-GUID: _bQFXOXYghsFcF4t-6UxiGn08oCTohVP
X-Authority-Analysis: v=2.4 cv=Wq8m8Nfv c=1 sm=1 tr=0 ts=69256b78 cx=c_pps
 a=uZgmHucj+isDzLb5E5/Wlw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=ag1SF4gXAAAA:8 a=pGLkceISAAAA:8
 a=adCOz0Hf_mvQUfQZd30A:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: _bQFXOXYghsFcF4t-6UxiGn08oCTohVP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 08:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226754

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

This patch was originally added to replace pwd-derived paths in glibc test binaries with
fixed Yocto paths (e.g., $(oe_srcdir), $(libdir)/glibc-tests/ptest/tests/glibc-ptest) to
fix the repro issue with run-ptest script(no longer exists in master).

In the current master:
run-ptest script and the glibc-y2038-tests recipe were dropped via the following commit
https://git.openembedded.org/openembedded-core/commit/meta?id=fbe3679ba3c12c52a502511f5dde91fb4de7a6b6
Glibc tests now run via check-test-wrapper, which dynamically configures environment,
sysroot, and library paths. The hardcoded paths from this patch conflict with dynamic
path resolution, causing some tests to fail like

error: xdlmopen.c:28: error: dlmopen:/usr/lib/glibc-tests/ptest/tests/glibc-ptest/*:
cannot open shared object file:No such file or directory

Reproducibility is confirmed to remain intact without this patch. Since it no longer provides
benefits and interferes with correct test execution, the patch is being dropped.

Testing results:

            before   after   diff
PASS         6937     6943     +6
XPASS           4        4      0
FAIL           72       66     -6
XFAIL          16       16      0
UNSUPPORTED   108      108      0

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 ...build-time-paths-in-the-output-binar.patch | 32 -------------------
 meta/recipes-core/glibc/glibc_2.42.bb         |  1 -
 2 files changed, 33 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch

diff --git a/meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch b/meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch
deleted file mode 100644
index 9fa5d471ad..0000000000
--- a/meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 662d544fbed823b9bf917058762ddb54bcee5f07 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Sun, 24 Jul 2022 07:07:29 -0700
-Subject: [PATCH] Avoid hardcoded build time paths in the output binaries
-
-replace the compile definitions with the output locations.
-
-Upstream-Status: Inappropriate [would need reworking somehow to be acceptable upstream]
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- support/Makefile | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/support/Makefile b/support/Makefile
-index d41278eeab..657769418e 100644
---- a/support/Makefile
-+++ b/support/Makefile
-@@ -238,9 +238,9 @@ libsupport-inhibit-o += .o
- endif
- 
- CFLAGS-support_paths.c = \
--		-DSRCDIR_PATH=\"`cd .. ; pwd`\" \
--		-DOBJDIR_PATH=\"`cd $(objpfx)/..; pwd`\" \
--		-DOBJDIR_ELF_LDSO_PATH=\"`cd $(objpfx)/..; pwd`/elf/$(rtld-installed-name)\" \
-+		-DSRCDIR_PATH=\"$(oe_srcdir)\" \
-+		-DOBJDIR_PATH=\"$(libdir)/glibc-tests/ptest/tests/glibc-ptest\" \
-+		-DOBJDIR_ELF_LDSO_PATH=\"$(slibdir)/$(rtld-installed-name)\" \
- 		-DINSTDIR_PATH=\"$(prefix)\" \
- 		-DLIBDIR_PATH=\"$(libdir)\" \
- 		-DBINDIR_PATH=\"$(bindir)\" \
diff --git a/meta/recipes-core/glibc/glibc_2.42.bb b/meta/recipes-core/glibc/glibc_2.42.bb
index f9c1cdc2f1..b33d1b44ba 100644
--- a/meta/recipes-core/glibc/glibc_2.42.bb
+++ b/meta/recipes-core/glibc/glibc_2.42.bb
@@ -51,7 +51,6 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0019-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
            file://0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch \
            file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
-           file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
            file://0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch \
            file://0024-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch \
 "
-- 
2.49.0


