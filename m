Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7279E7FDFA
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 06:32:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14237.1770186768530817767
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 22:32:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=p8t2xQZr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6495392723=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6145Xl8x3055307
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Feb 2026 06:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=qS07FsJ6el1S1clGY4cW
	46FpIPFGrr9MqzIf8eilEpg=; b=p8t2xQZrt48nPqg/pov4JTxF2HlUmNg6sM6F
	Gn6lmjVmOWfo+Of3zp5Ut8pQiiwLzvmP8BjpUcXFTQnzTwxZZ/0zhEBK/8l2D3ot
	Zj/7lsY8PuCX1rfSA7OVEbxBbMNYQHMX3EMlXHkQXm4uUGdVK1jAhFRBR68aqD6P
	vMWfWX6EMvGPqkCTecdU0DB/eLFp4WlhTnmTBZ5eNzpEl6+40koFpbxh3eDuvF/L
	qnShcXfHI5zIR4OKLzA81l81npYDzTc4fKI0nAkwudT8scHm8Y/Gb1h58JuAlDoq
	Hfcdc4KOvodcXaseOgrNAndg+cKV64693/zsUfKwhkGwMPOQvw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013040.outbound.protection.outlook.com [40.107.201.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c3vcj06fh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 06:32:47 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wxZB/xdM4zCtEKRjq4/qxe/6hVmwbGQDJ6kcROlMJFT21ed69g9cHHP7DYyxi78q3rl/HlhJ24cjomqC9Uql4HngdxZ5TJj+Apj8qq/M/KzAm+Q3+jjQiFrPDkewyw04j5pjJnMS9R3tm3BpZUCz97CD8J/9dsExfWi126tp6tVo5LNu8AoaRt0AC7MGlChOijzwKNT7jY6GRS8ArfQED48gMtecb6m2eHMPnR1VzAkkmSz2fQeN3J0ezLY7V0N7AnmW3+ZOaZyreHjvH/Y8/wtWkcYlGKK4jRZgI3yOhfc0U+qzKOjwAXNGWcUJMSyu50FxJZCxuyG8wKRKXBgDVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qS07FsJ6el1S1clGY4cW46FpIPFGrr9MqzIf8eilEpg=;
 b=np4F4Aq87PF85Y5efqXr0FfPVps2BbAohQBrPVRugi2KIdkjipxFa5bKyR/lx+Aj6bur+1KL9G6j7cU0fM0HcvEwocKRT17afQ+M9nSAIiYcIgKuhosvzhUPti7aNePsA2YqVGq4ppd7gIm4up3M6qLH6XtBqFA0asVHqGUrDydpMYpseUHas27pcQTJftA2ug5aqdOO9hxZF8U/aoH0qJf8HBWYToDP10NRGCJEP7Vhz/YKyRZG3oXRt2wrG4/XMLO1kipMIo/l1ebSC2lOUxHNPTaNRXgi2MCh+lMTCWQfTc8r74xrqvOwn+82pVUIiRLhiUhcCE1KzOyLymvWGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by DS7PR11MB7887.namprd11.prod.outlook.com (2603:10b6:8:e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 06:32:45 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::ecf9:dbb:16bf:5b2d]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::ecf9:dbb:16bf:5b2d%6]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 06:32:45 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] nerdctl: add -buildmode=pie to avoid textrel QA error
Date: Wed,  4 Feb 2026 14:32:26 +0800
Message-Id: <20260204063226.4066285-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0092.apcprd02.prod.outlook.com
 (2603:1096:4:90::32) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|DS7PR11MB7887:EE_
X-MS-Office365-Filtering-Correlation-Id: 696345fd-5ba5-4cdc-a812-08de63b734c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?coaJs+iN4+sYAaxD2xGVi6bOwDDCjGJZ+1Ctp9uk5k5OWVny0GPb7vbt8oEL?=
 =?us-ascii?Q?ZCGQkMfLKAOwOYxHY/57VASkPW/dA8OEwGBzuHCu8RpF2nml0CeEWSLhHXI1?=
 =?us-ascii?Q?tlgMwbq+dPrz/KHsxo4Ydvr2u+tGyHT6PTIxG9ao3WIFIlWGxBzFYVXU8Eq1?=
 =?us-ascii?Q?ueSCMTfO+MsK0bFd4Nvu9z+mZNr+MIAmtNsSncZkA/BVpb9xchHrb7umNo6e?=
 =?us-ascii?Q?Aq/OinVW7pLmBt1GqUP6DYPbKDpV6Cvxu8bKbgWvIr/qnqubUFQGMMp/TTH8?=
 =?us-ascii?Q?/6iKuftLixH46urf6VQ/i0Y/wcUNHfThgeVckMqKpe6X3rV+0T4KwQyM7Qag?=
 =?us-ascii?Q?xq+xzU8gNYtFT7KXNSeuF0KZYmSwl8qjJyHR4cJgS4YNmajPUf2bwpKKPGvC?=
 =?us-ascii?Q?CVnBXF/VFti967s/LluMSKUe94KcH3w/LUnIwNGJhTVE9hAaeYd9WOb+fdje?=
 =?us-ascii?Q?KtnmgsVaOugfFpeV/sJyZl6WQg1NillYZFGT7QsY5l0oOfp4fbKqg/8Tj8ed?=
 =?us-ascii?Q?zFSgZKcdd5I1lKnnJP+Z6c2LWg0m01Bkxa8Y9VxMyXeJbdF4eoa+NWVaYYdD?=
 =?us-ascii?Q?ggg90WAQ9ETjBnAxkZuNu3kkmuITyiGHKHlY2xDPnaUykRVZ9Wc8Si6/I9eq?=
 =?us-ascii?Q?6D5UKolOFxDuZiK+55UX7PrHQFmUa1olEIDiIBUG1mTiWnFxCHLzuvR0PR47?=
 =?us-ascii?Q?jO9oPdjjpGKS9g24akFiHCisg0AERqy29Ja6Eip1qQ4TnWrfS90Ql9pWAxQW?=
 =?us-ascii?Q?qbzBj6ZMAB3uThtUCXEZrkz6fhwGQZ8gCuSQ4qhYZstRlCLX7zIc0v4JlsIy?=
 =?us-ascii?Q?E3FlwceTMdD/boaXK6cr7EvEetmegQygVb6sfkUH6Z7HbINHX0ljncV2Hd/9?=
 =?us-ascii?Q?ttU2ri90f9tONxoTVQ4A2O4JNsVoMt0r495gQNfwVe3SJZxgN8xpU9F8L5fR?=
 =?us-ascii?Q?x3+hPKgVjlF8WP0OSKfmsJendbWk4g8lVoXvi3Cv0WUwYYeb6YFOm5M8AU1m?=
 =?us-ascii?Q?tzQ4k+5AnWGue01tyvlnuXnBDt8Bd6H/keY2EzVIEDngGAdAnN4kDEkbAmxP?=
 =?us-ascii?Q?Y97eJIpo1Y7N2cDX0+J/d+R/N857vKn9XciI2bZFEWigLnOfkSEdnRCPaVOv?=
 =?us-ascii?Q?AGAbVuxRUz1JL8uJ1VlZMH8elrYf2KkWmVcof+ifzse7/sh5lusqmmNhp7Qw?=
 =?us-ascii?Q?Sa+Du0dgiBMT+sXa3hj1bRoIi7rRemhVutkcNGPD1vU+eoDvWKkqhUPOIYig?=
 =?us-ascii?Q?hnayY7EvNOlaxkHQtPx1ILxmP7vhIPtv1ZUR4qtcz+LsujV0Ll0aclGDGlWx?=
 =?us-ascii?Q?v2LSgHdAO00SB1ZmNwPQT4An6WU+5faB0g4m2dnq7z4/8Lbf7wHYfqStey38?=
 =?us-ascii?Q?Mz+t42c93nECySE0t+5aEI9JHDSirSMloKzg/izNxDk337/Nd1l2kaF2sjpE?=
 =?us-ascii?Q?d+47Yssdh1YkKSFn2vSga1IcmXiQnw0ENAyNIFsr5WAsdrRwU/I4wNssLTXU?=
 =?us-ascii?Q?NVU6nqc8c8zIOwQKlexPeVTP5koUKG7RZrZEV0Y9w3KQNQWxW8AlQqR/5+rd?=
 =?us-ascii?Q?UKFsYDrqnEpcB4taKQBB5q1uDAv5kao+ZvTLIHEhDfZMM0FH8se8Odv79Dy/?=
 =?us-ascii?Q?kVkhfGhUKaidM5oNP0gntAk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?etfqXWtOx0xYSCb5kFkgVet2YvP8lvjlzy6tJ94Mbbc8Nerp1g7aYX+EXcHf?=
 =?us-ascii?Q?S22XNbUkaxTBTyjiQc+99pw9GcM0XRDW7mHZebootNNKZcA6POiReHN6Map8?=
 =?us-ascii?Q?sZ1NZwWIolzpKu02QXxheyBYarAYUt3IyFcOA7x2pX/h9JOWwHt8bWNuuRs0?=
 =?us-ascii?Q?U7dIoOsyW2AM0RaGRfotuz1XU5ZhxqwSl23gXN+/qnm8IRHqHk5j37zHWqgV?=
 =?us-ascii?Q?FBFPs6UkLKbharanZ0GBCHrXEsXS+g0M35mwkL912nlLKnZEidcR7e7CtbEM?=
 =?us-ascii?Q?sU6FWP3WUe7NbroxT0NpqOj37D91vXXBdxftFPhDuALiIGjNTMEaheM8cl/h?=
 =?us-ascii?Q?wPutgOi0/IkpB8zPU5oNfEqYugprX60lvBO1FWN3BeSh9UhSIZRMUnT5Uxd/?=
 =?us-ascii?Q?6oyTwvImVBPykMLwRIXBGARyDUxYEafg2kLVDPIBNNcpAUkh44u2tGYyxhiX?=
 =?us-ascii?Q?PbpPaMM3sVeZc0Eqz/hxuvJEVwyrcQ+gpeNo5pf8wHZmO/JzEqCV///fK1fl?=
 =?us-ascii?Q?Bda+LYfys4Vix/A/rP0DTGGqctLsWD8HxgfDBrk6IE8PKJqbbt8EIg3XZhCv?=
 =?us-ascii?Q?TR2hXtg9Q80gMNIYE6BmkGxINkbrgMpPxsIcl7p/DkJv8bvkWTheQoky9Y6K?=
 =?us-ascii?Q?l0uynZMV/IqJrjYHEsuTO4Ts0ykoH97sqlDzFVSiNud4ZvrIfjzKpwUfXX8C?=
 =?us-ascii?Q?CMWDBNjHjIys+2W7TkTlDWby1OqFeuFUaA4BX12F3apBHM0Yc8qMB66KMASc?=
 =?us-ascii?Q?QJckyrHNUMcQFCldfE49d9jtE788NmYhQkREJ1vkElTHgR8ge8tuP2ush152?=
 =?us-ascii?Q?r+EBcBBwEThFdXR1nT+QATHNlvvI/T3pM52GshX4whlnSyRiKKQGbwmxB0eL?=
 =?us-ascii?Q?I+aBxne1V3uCEjUsF+mb1r9p3FG8JC7tvJmvwOqU7En8Mb9DsVjkpkKKwn2O?=
 =?us-ascii?Q?nELg2XVGjRbg1ubcinc+uooT/OoiukE5IWEuxRUw0U4ER7XtOsHqMWkecj/i?=
 =?us-ascii?Q?MRzILEJo085QAN8sDtCXem25DXFrWATEeodnu9tybDkFO0pk5WXhZmxgUwGX?=
 =?us-ascii?Q?cdRvEevNxlSdmny5tQQKytjxB2Hiq5fo76hLRo3jWjns28tK2aeD5sjFd1C3?=
 =?us-ascii?Q?/Eqx2MojmyLdfAyo/QBEtZJC3gk0gIkX15R3HzUteUuM3fntshMjodQAG0Sp?=
 =?us-ascii?Q?xjwX3Cgwr3duI7YAaKinAV2Iusz6S9oe6qV5gRMH7sfZzB0EyvAod1O7hdPn?=
 =?us-ascii?Q?RNnmJzL7TpP+QwnzFBAmXOkCG/UMv5is0gn3B33twd5s9sePZBRLgY4fECe2?=
 =?us-ascii?Q?Vk69dduDrXcva+SR9l6+ONM9NZsy6cVlZWOfNj5ByMYAjc0U3vxwk/uiAAys?=
 =?us-ascii?Q?VTB3+d+XObARQWit8VZEJjU6D4EMD/wDxjr2MpvSt69rs2X2P5AioFrz46+X?=
 =?us-ascii?Q?8jK3IaCD5klA/8EirZh4Kvl0pkjQB6u6uDxix7OZXw2OtGsu830lzIHgON72?=
 =?us-ascii?Q?5Ck83a+IiMospSMbegAxA0QZv24KaOC24il7YaQSL79czT03sWboUISXKrmw?=
 =?us-ascii?Q?QytJ/YPVTEf1cZYBhNU2YMrTAWertmhpIMGS6MuatHG3NHxTdy9HHV0zoFur?=
 =?us-ascii?Q?ZTK+QZRb7qsDEe/Mc9JllmtjoKNu5uHFfGqDfjOJWrKXZau0KPVc9WznqOuV?=
 =?us-ascii?Q?ycjiXX5Cp3OhX/JJYCV+F4vXP+B/2ZKkyopuRoKZvNM957cSiuBdgdvGC927?=
 =?us-ascii?Q?pXDHc8Uagw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 696345fd-5ba5-4cdc-a812-08de63b734c9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 06:32:45.2691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1/d2q5gRlkJr0QQTh4XtE/70KkCimgHGsARIr7+00w5k7Cp8IW0xwWbWcyAU6p7+ZyaqT76giuSX4X8maXyCQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7887
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDA0NyBTYWx0ZWRfX4sCT9JUxhEtT
 bEq8o1E8G5MCDIuNBg3G5y43ezdC6dEhrkNOh4wkugcm4EdVt75eTQcp/jFRE+W83gRqrzBiTaI
 gl8+tiimwbVkHbI0521DDWQiuB5vsxSUVUS8vGPvs9cud3t8xI+KKyba3rJND3btUhe27eKcQOI
 WLuOcQSib5kAMt0dK/OSb4n3t34/GNNeVXGCVsWhnkUMOeykRvA4VARdPUr4fsdlCqd63YzmB1L
 xnZLpXa5gB8j9D8XTJtjhDDQ6dKTRa4ezEIpIeKMH6iY/+49lmHpLZZ8NCDc5FZpWz4+Hbyj9hQ
 u9FRbXXQwmV9P7OTProyCoVunbOEo4VeUoQQ0M4LdwPulTOIWWhtC2DCuKhnm4bWDIqSJYTlUEd
 g2Of7z7T+lwwOnQIxg6K1drCQQ20rg/TgeM5wZp94wq6OLWjiKGBmF5zsuQXjgFeitXJswKs5jJ
 OMnHZu9aDwaae0d9ojw==
X-Authority-Analysis: v=2.4 cv=VaH6/Vp9 c=1 sm=1 tr=0 ts=6982e80f cx=c_pps
 a=dJs83p8YoJtII+u9Eez95A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=IjdlmtEjJxZ--4mNFGUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: bVSXQT3ZKfeks6kLooRbuQMrXmhuqymd
X-Proofpoint-ORIG-GUID: bVSXQT3ZKfeks6kLooRbuQMrXmhuqymd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 06:32:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230496

From: Chen Qi <Qi.Chen@windriver.com>

On qemuarm, building nerdctl fails with QA error about textrel.
Add '-buildmode=pie' to fix this issue.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/nerdctl/nerdctl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/nerdctl/nerdctl_git.bb b/recipes-containers/nerdctl/nerdctl_git.bb
index 1c37bcf8..5429e6e6 100644
--- a/recipes-containers/nerdctl/nerdctl_git.bb
+++ b/recipes-containers/nerdctl/nerdctl_git.bb
@@ -78,7 +78,7 @@ do_compile() {
         export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 
         # -trimpath removes build paths from the binary (required for reproducible builds)
-        oe_runmake GO=${GO} BUILDTAGS="${BUILDTAGS}" GO_BUILD_FLAGS="-trimpath -modcacherw" binaries
+        oe_runmake GO=${GO} BUILDTAGS="${BUILDTAGS}" GO_BUILD_FLAGS="-trimpath -modcacherw -buildmode=pie" binaries
 }
 
 do_install() {
-- 
2.34.1


