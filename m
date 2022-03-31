Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD223C433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 07:16:05 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.77])
 by mx.groups.io with SMTP id smtpd.web08.4298.1648710960739410118
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 00:16:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=AxXQnGf/;
 spf=pass (domain: weidmueller.com, ip: 40.107.21.77,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N933w4+7f28rycoOz247BlOoYZ6HusLcDUKIpQIEJ2qD0mcEpQ5OuMFCtKASGa3j4J4v6cHKPh6k35M1Xt7F4Vddf/x15+6sOSWwC5kEKg/ymBJpToXHslZ3DW91Uj1YMTLtuqyur76xOfDGuTHJh+j8MdbfzHcY0fU/7RmrvyahPcgMqltLGyKJJ8rr4bhoBpDSl34/6tnCb7OaGD2cWQevwPAhEo4vxd4LWmTDueQVSWOQwGzH8ExoOiTTU98oaOl6mjFjA7yvcJysfzapKrlBsgEzpoG/NEhEAeA4vIXZE/PTiY5L5QjPLnjrmmvmZXAbTFQM+VPe3cH9TW9GoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjbaP1gKvRRddMCT+i37ROTG5LQjMj9KAUzlDkKddQA=;
 b=jv+U2LxqS8QsHdD4RfhZGSFJe5PjPBP7rNr4b2Twi3eMlWf2ZHKlF384/d83HSUXTv7yTpWBzbCnSsegB3Ob3kA8TJivTHJ4UWJHDz/D/sKpSW94vPUXcrTydBNmzd273Q/+QyQCj2lPv9BBfavFFHVcuu9BkIpGcelirYtD73swj/jcpGNZFPka5Egj+gH06ENa9C9oyTJz1XxKQ8nrzSGF/NUhJn2iR2mVSUfyLM7On0sCV6cJ4s7OS/xT7dI7/zK5u2hYa493i9o9JFyb8kAjKwHqUJWDj57Tfwke+fZqpLQ8KXZGV8xDt6tDf9Ko4qriB7FC9XqULwt4l4/Dyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjbaP1gKvRRddMCT+i37ROTG5LQjMj9KAUzlDkKddQA=;
 b=AxXQnGf/a1nV4cruxI18DAwhxyTwuyzk4u4CuHDroZrF36omWOFnkvoIfSCKoqsNS2Rte9XSaZorHjCmNurt++183LZtX/b8fHhZdbHf0UQ6FsLp3oju6p+kHuOOBKm7dEVZY3c6AHsgk5n+nc5tKiPx+0/hJJcBNDrSSzQtiTA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by AM6PR08MB3077.eurprd08.prod.outlook.com (2603:10a6:209:48::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Thu, 31 Mar
 2022 07:15:57 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::21c3:3ec0:a144:68ba]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::21c3:3ec0:a144:68ba%9]) with mapi id 15.20.5123.019; Thu, 31 Mar 2022
 07:15:57 +0000
Message-ID: <ecb92f84-a4fa-31d6-de14-a48f5eff91dd@weidmueller.com>
Date: Thu, 31 Mar 2022 09:15:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [OE-core] [RFC PATCH] bitbake.conf: Add base package version
 (BPV) variable
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: 
 <20220330081614.12772-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <CAMKF1soT09dWVxf0idTF5O-u5wWMuVGAxcrC+Z1wJYkoJ1NtDQ@mail.gmail.com>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <CAMKF1soT09dWVxf0idTF5O-u5wWMuVGAxcrC+Z1wJYkoJ1NtDQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0019.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::32) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 404566e4-f2d3-43ec-b335-08da12e64d07
X-MS-TrafficTypeDiagnostic: AM6PR08MB3077:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB3077F4587D4EA73A7923F7C5D7E19@AM6PR08MB3077.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rjP+QRsLZbKwzlseBczR6DCMiBPlzkEchJjsqdPJMyIZAEu8ce4MZTcxqa6wqxUvYds0oUUzFVKxW/g9QzsvZ0yDvJjdA8vVHm18C49MygbWHfYFs/XPVSMapMZhHpk/r5bqJElGqDCG3MtHqt5xC1GK8RHWtLL/Yt9LXKOkVLkXocjLvrHbA93jtJwQbzBktisinLjjpCSrjQuxa983UtWrpHlqPRhRlnX12vxY4NvqnJVAFz0/xaxA4lnSZbrxTfmhBx0MlQk6Fw2ypC2r+g26TQj1LK5QMl1lcQDhuEu/IWk2vcgaCcm63vMCgu5UL9sY1xRFgPyYQL03p6GEVJlXtgr73/sIT/HtqDfJ5fScpyo6n2FdFFPkhYmfut0c/ggVl3e5+H8SdU335byiUhaaBu0INN31iWUvelbX7Xk9Nyr7CFj0xYdPzohOpjXugFdkfyiihpoZFQAXuGOWq82rgLJKqnHAdsjMN228TkPDZJqdxqFIIArPZ/c5sP9Agfx+DUjup+1/zqObKZMXkIp3BjeWrxHh0Y6mnhUvGrVV5EoNNY8wJqvp0CspPgopV33+DV+5axv/fjneh0ot7zMHVg1EWpeKqNiOYo1iFIKe0wuJDrSUJn073+lmYsXEx310BfTZmhSjTmVM4usX4L5MfXecXXTViSrPseHNT3nJlc01kCVXK7oL0JWPTtDTAZ2YI1UIQvbk6JzYUCEBey3/jEa/LhZXHVQIGp60PdoW2OIHJgnzMQv9T2tdhl9W
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(107886003)(186003)(6506007)(6512007)(2616005)(8676002)(66556008)(66476007)(4326008)(26005)(38100700002)(53546011)(52116002)(38350700002)(66946007)(316002)(5660300002)(6916009)(54906003)(31696002)(8936002)(31686004)(36756003)(6486002)(508600001)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?KzFSa3JvRmJqS25ybmV0dUV1LzVERENtVkdCU2VBalBuY3NPMW9zcElqRmMz?=
 =?utf-8?B?elMyR2liWXpMV3EreWdDS2tGZ1JtWnh0NXA5bmFEbzBjcjl2VGlvcGVQWkN0?=
 =?utf-8?B?U2Y2M3gxR3gvZnZ5L1RYcEhBdy94emlCMU5DYVRBc20yMERYRXlKbWpyLy90?=
 =?utf-8?B?ZUkwTE03RWNCWDdycWtsb3IzcFRYaDR6S2J2TUUyYXRoWllsdUN3TExaQzFS?=
 =?utf-8?B?VjY1UVNhcmNTYllYUGtiUjkwUWM2MVFJTE1wMi9ZL1dYQUN2Snlha01qMnpp?=
 =?utf-8?B?YytSV01RMWVJZi8yY0xqZkZ4R2tMbTJiMUtORzczYVFScHd1c3d0OG1aYXdR?=
 =?utf-8?B?cHA0ZXYvYThQUVF2M3YyZ3BVUzRnUFpvODFOaEVjRzRqbnZ0cnhGOEhCSEJT?=
 =?utf-8?B?b3hzVkVTL1d0b2tXVzdPWGNyQ1oyVnVuRGRGMlh2anRVcXErQjFTVHVsUFA0?=
 =?utf-8?B?UEJCT1lvVTZ3K1pSem5MNUc1YUxiVGRHWHhlZjlvaHJjTUlpNFBxOThUcDZ3?=
 =?utf-8?B?QmVvR0swRjB4WEcwdXhCWC9ySERwaDM2bENtb3JMcjliOFpnNWxyeWFxYndD?=
 =?utf-8?B?Zkh4YVJlMGRudXFSOUI1Z1QwM21rbFgvM1E4Uzc4MDkvNW9IWFNkT0t0M0c2?=
 =?utf-8?B?eS9jb0hPeitXRjJTbGRIellVaE43UnVqTUxwUmdDZkwxL3l1em5TUS9iaE1p?=
 =?utf-8?B?Wlh5VlJ2d2kwMnVlazZ2QjE1K3hxaUxpSGY5Vm5ncnE0Qk5BaDRETVdEWjdo?=
 =?utf-8?B?bmYzYmowM2Z3OXVhWG9KSk02cVFVZTdYbTJpb292VmY2dWMwOWdQT2NDQncx?=
 =?utf-8?B?TmNWZkNjMHJtWXVHS3pyK0hIRUtmblJnaGtZazY4WExITWRzTmt6Q1JzamFN?=
 =?utf-8?B?R0NseGROd1RMTTloTktpeW4rY3NQRVRWeUZBYktUV21mN0RMbE5zbHB5MmVp?=
 =?utf-8?B?dTdhZ0JFSUJEMktGdjFWVlZ5RXQwWlNjZ1JyTzlmUjd0TEE1UnlCNzFkaVJM?=
 =?utf-8?B?OG5WOWxYVDJZS25RV3pEWExralV6R01RRlVDeklJVTc1VHNnTXFrdTRFTHJF?=
 =?utf-8?B?cnZSOVcwK0dxOTNma09iVGxuSXlpdzZ0Rnc5R2doZVh3S2dtSk5adlFCSmxF?=
 =?utf-8?B?RXdIMUdDWFB1eE5id1dZZ3A3K1plcm8vMExXMTFXN1lZd3NPS0F6a2xjNEFG?=
 =?utf-8?B?M1IxRXdydDZLakVFNjVPNDZQT0p3NW5XYkcrWFRPdjlwN1VkUHFEaThlODBm?=
 =?utf-8?B?MTYzZjRud1JDZHc2d0tWWWEyYXMxVWZVdEhmNWphenFDdTYrMHRLRWpKRlJB?=
 =?utf-8?B?MGsrOHI3STk4c3BpZzBQWmd5MjV5WkRmaEhiNVhiZ1grZXc4ZytOa2F4cVJa?=
 =?utf-8?B?MnlFanIzSDlSUGF3L1VrMHJYU0VzM1hOQkZNNFljK3FEZENYb055a0s5ZmZk?=
 =?utf-8?B?QUN1ajU0MlduYmhZblpkYzllZWpreFZScWUrN3JzbGlZRy84dlVaVGF0UmZI?=
 =?utf-8?B?a244Qi9vZ2x4eVNNTVNSdWMzQXlFdWhVYXRSNytKYXpzNUduMk1lYk5DdGNB?=
 =?utf-8?B?VmN0MVAwSzRJZlpGMFFLQ2JyMkRwODFBYkFhbDYvOCtKWHU3aGx3ajJScm9m?=
 =?utf-8?B?WWRlM05WUG04U3RlLzRvSDB3Z2VhalFzK3h1SkZLN3A5UHZ6VnRZMmZiOGVl?=
 =?utf-8?B?RlM0NXJhUi9YTzFsN2NXQXczNXl0MmowTGdPd0lSSHJaWnBXT1dJYmI1L2RQ?=
 =?utf-8?B?RCtSNGZ4dVMrcjJNdXE1c2xoK08yZGNBVDduN1I1am80V1g5OFd4Y1dlMXpR?=
 =?utf-8?B?NUhnQ2pvS2UycDM4SzVvdVl2b3RlWGJGVG4vZ3N6Q2NaVXF1eWhIT1hMYUZU?=
 =?utf-8?B?TnVCZmh0Z3F5elJBc012cGdUYnlPaG4rNk5UbVc0bjZQclRkMWdwQWcwRnBD?=
 =?utf-8?B?WDl6YlFZeXJJRzVGRVAvQjNxaVNOWDIvTHV4UW9YdDYwU29GM0h3NUZ6d1I2?=
 =?utf-8?B?akNJZ0RkSytHMGNnL0NpdzJrRGZSbXZMa0pYeUk0Vmx0eEdITkJja3RwRVJR?=
 =?utf-8?B?a1VkWXJOSnQvakJPUWlteE9YcnVSOTZ4MzVWd21yOElZdTNUL0JXcjZsTjhw?=
 =?utf-8?B?ckxOTmsraWdiWVJuQ2ZNTC9MZ1RzRjRVSlhqUmlYZTdiVUROZUlIU2lmc1NI?=
 =?utf-8?B?cHZSTXVmT3VhdlZGOGg5S0NTYnp6c3pGVmE3bCtBRmNzUDJiKzVTMGVDL3JV?=
 =?utf-8?B?NmlNV3BFcXpPdVZVRDRiV293OXNVRmszUlFRMmVlNUlqZUxNOGZYdUYyQXNv?=
 =?utf-8?B?Y1NUM0owVy9FRGl5b2VuUXhtSTRrbkg1SGc3K0JSR2pWNmtCSTh1LzVsL1NQ?=
 =?utf-8?Q?4Zg/ktEU4AjFflb8=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 404566e4-f2d3-43ec-b335-08da12e64d07
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 07:15:57.1724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 /L7EMYYQwLPjqeWXlcfzzX3AwXHL73uBYIDzbsd/MCtepa3EQD1rowoLqlBL8CRLSctlStJ3Okaf4qq2/RP/vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 07:16:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163804

Am 30.03.2022 um 19:32 schrieb Khem Raj:
> On Wed, Mar 30, 2022 at 1:16 AM Stefan Herbrechtsmeier
> <stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
>>
>> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>>
>> Add a base package version (BPV) variable and use it as default for the
>> package version (PV) variable. The BPV variable contains the base
>> package version of the recipe read from the recipe filename.
>>
>> The base package version variable supports an expansion of the version
>> from the recipe filename without the need of an immediate variable
>> expansion:
>>      PV = "${BPV}+git${SRCPV}"
>>
>> It allows the inclusion of include files inside a recipe file with the
>> same version in the recipe and include filename even if the package
>> version is different to the base package version in the filename:
>>      require linux-yocto-${BPV}.inc
>>
> 
> how many such usecase do we have ?

4x require binutils-${PV}.inc
9x require recipes-devtools/gcc/gcc-${PV}.inc
6x require go-${PV}.inc
4x require libtool-${PV}.inc
2x require m4-${PV}.inc
1x require boost-${PV}.inc

Thereby binutils and gcc set the real PV inside the .inc file.

> seems to be quite errorprone too.

The current use cases in oe core is much more error-prone because they 
use ${PV} and set the PV inside the .inc file. This means a second .inc 
file must use the new PV. Furthermore, if somebody in oe-core add a `PV 
.= "+git${SRCPV}"` it breaks includes in other layers.

A MAIN_VERSION (MAJOR.MINOR) and a BPV (MAJOR.MINOR.PATCH) would make 
the use case explicit:

require binutils-${MAIN_VERSION}.inc
require recipes-devtools/gcc/gcc-${MAIN_VERSION}.inc
require go-${BPV}.inc
require libtool-${BPV}.inc
require m4-${BPV}.inc
require boost-${BPV}.inc


At the moment oe-core have recipe specific names and code for the same 
value:

MAJOR.MINOR.PATCH:
MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"

MAJOR.MINOR:
WESTON_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:1])}"
SHRT_VER = 
"${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
VIMDIR = 
"vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"
SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
NAMEVER = "${@oe.utils.trim_version("${PV}", 2)}"
SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"

MAJOR:
MAJ_VER = "${@oe.utils.trim_version("${PV}", 2).split('.')[0]}"
ICU_MAJOR_VER = "${@d.getVar('PV').split('.')[0]}"

MINOR:
MIN_VER = "${@oe.utils.trim_version("${PV}", 2).split('.')[1]}"


Sometimes the same name is used for different values:

MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
WESTON_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:1])}"
MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"

Maybe the bitbake.conf isn't the ride place but I think a common name 
for the base / short version (MAJOR.MINOR), base package version 
(MAJOR.MINOR.PATCH) and major, minor and patch would be helpful.


