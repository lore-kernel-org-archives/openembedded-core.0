Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3D74C3DA59
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 10:54:59 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.92.57.107])
 by mx.groups.io with SMTP id smtpd.web10.8051.1721127293028072061
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 03:54:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=Gom4YjMi;
 spf=pass (domain: outlook.com, ip: 40.92.57.107, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bkXY7yFLsD2HxNe5wMRfrsWCARKf5CnJKKDQ7fUXra3VpkgeJY+IeGafoz0MqvayP4jWfE+96aTBNj49J+lmcD6JFzfxauvYHRwoCpZXVdTbc/NlX1jAjt13v/J4xsCYFUlt9B7eOAb3/cgyfJdN8mnPXmfhwtP9dQyDjIczJ7cY+xdt17vbR+WwvfrfatODWc9diTxeRrb1/ow2KrfCcsgGkj+1i41OhQaf0RCYUj6JKx53Ol7rAhuQeQUBd7GsU5ftpSF8myyaqRd0xlJR4/aDYeU2ZkFBl0bTwXNOVom3EOPqzvTS6h4gefsraAgZxP5qEGVb8BklxD51et11Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9eL48J5ULF1zYaSA3sqIujY3UpiEZfJ7cd2IMUCdxw=;
 b=JbQjg4PmGvBd5uIW4I/A743hsTs0TH3hdC8DN8Bz1ktbeN5Y8DI5oKIY6y0AdgVFs8pfxOrfDB0knPtsnxy1MqQRmNDeASQyzuG/q6vmXv0flXrdGZslYVhJaPeVZe7qrd44SACQqeCFDcs6CjjerNhVKWGBwEke9Ss3ZkXeaOYdsLLbhHnBXfaFDgUEo13aEPaqH0J+KxxGKVUhzsK3ewGNP474GKzOAGNtGZge2H6gkj7bvSQ+gGpIq1EHs2ZpZC88Rb5IaJoFhCeGIQ/smRkcY1I6cRcDu0hihK1/MFhLp+JAwt7hCjI2sEEZmV8/yeahhaDgdCSRLs+vlvTxdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9eL48J5ULF1zYaSA3sqIujY3UpiEZfJ7cd2IMUCdxw=;
 b=Gom4YjMiFrCSYDBCerEi2VHQkwGMnNaS8I0Y2Zthds8qjkVKOSvW34N+ofZGKkiHrt+sAWP5gPr/P7f6Vfb7OnNDj88mkTB/ZPMC16TOPaGHev5bZ8hFIMsVw4txyuii//ISY+qkZxGRyJplOFnpfXY5edZjDtqyPRtYrGNgZiBkM3Tzr8AcYWbllTrnKKwphcnZXPDB0SxG5ahybgFcZqFfv97Po4txshGkneMPUH3ZBs94dfMy4fhDgpesbjvyi6WDVFDg3oGXK9Zv7ln0JSR2NIohmB8Aj6SenJQppEmFNhxCoS6aEZlGBJBRzQ3KvTke0/ajNrchDli2mf4JGA==
Received: from DU0PR07MB9116.eurprd07.prod.outlook.com (2603:10a6:10:404::12)
 by DB9PR07MB9269.eurprd07.prod.outlook.com (2603:10a6:10:459::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.13; Tue, 16 Jul
 2024 10:54:50 +0000
Received: from DU0PR07MB9116.eurprd07.prod.outlook.com
 ([fe80::e22b:b199:c63c:e253]) by DU0PR07MB9116.eurprd07.prod.outlook.com
 ([fe80::e22b:b199:c63c:e253%4]) with mapi id 15.20.7784.013; Tue, 16 Jul 2024
 10:54:50 +0000
Message-ID: 
 <DU0PR07MB91168F2965C2D50B5AEE9E72A8A22@DU0PR07MB9116.eurprd07.prod.outlook.com>
Date: Tue, 16 Jul 2024 12:54:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] classes/flit-core: fix dependency loop
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <GV1PR07MB91206A63390D43C3F32D7118A8A12@GV1PR07MB9120.eurprd07.prod.outlook.com>
 <3D92F9FB-177D-4E13-B21E-2CC9BF2BEC9A@arm.com>
Content-Language: en-US
From: Konrad Weihmann <kweihmann@outlook.com>
In-Reply-To: <3D92F9FB-177D-4E13-B21E-2CC9BF2BEC9A@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [iX+9bQo8/wvyRVk5i3mmTXnzLC8bOihfzYicZldYlvXGYv2kAmMdRUxH4eaO/kM/]
X-ClientProxiedBy: FR5P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::8) To DU0PR07MB9116.eurprd07.prod.outlook.com
 (2603:10a6:10:404::12)
X-Microsoft-Original-Message-ID: 
 <aa1a368e-175d-4fff-830b-b94b1ef78142@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR07MB9116:EE_|DB9PR07MB9269:EE_
X-MS-Office365-Filtering-Correlation-Id: 4108e0a1-d77d-4f63-3ea7-08dca585b606
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|461199028|8060799006|19110799003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: 
	ag4nXJ1PrehH+nyYVLvmq8nDWWqbVWN3gnFrmifhTtDYS9lmv4ZmKAr1KqjkNa/AcuXEZ6eceqpma+/hsAy36Pl51yIJBVaPx9EpeOGZfT2hj5+fRUjzyPUT8R52lGH1PmcC2PKvr4WzO4r04XxYG749P8dRlO6KtB+AC2NLf+GAfDEKRVR7Vm3WAKbEjR3pKQH4SGhnNSDvMkwZ0iA7GFKTXGyvT5LvQRSRtJp4xsqX535vCeRpGjxpigGwO3cssL9KZe8NsWbZB/ioYj+Dt+Y+b+A5eEkRc74gSXcQQk734h6J+ID8oqtSQZNKxB1/MDnNW+uYoPSaZtqdPN3AIsTb3n7hJ+1qX1Nxu6998tLh3YqHHGogTeb1WqYQnUAsJFzHQWNkyJDOI1lnqPTdS5VVRvpMnKcnPwMVtOnXSZ9V9YZyp7s83G4ToAdICX1W7HVjahctVpjsQNbkVOwfCcpTt7ynZFzLpr1x8tsWnFx8wsSVF3yqUg4tD306kwOasCoxXI2vozhvPjbMpgPl40YbwfXViECbIybrAEfY0AED7aRnx6kaREbzjc7ZloEqRFELfQ4mNNdvDuetqJZugy11bawRvGfRbi5LPFSi6LMJLAPQLjcfvEfMjl4KWUC5TAJqpSSAUYViw8m7rPc/Rw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UkVWd3dqOXNRMTdkL1lLUW9Ca3NBVngrRnVBMzFtSysyUTVUcHVyUDJ3Y01L?=
 =?utf-8?B?Q013MkQ0dUczMGZvMVFjaDVwcWdXOVpHUjRwN1hrSTFqSml0Z0s5bDMxMjZG?=
 =?utf-8?B?UWRnUklnbnVLNCs4MytRWnptREJLTG9iTzJnT0xRbXdtT0djckJRdjNoMlAw?=
 =?utf-8?B?MXRrOGxWTi9wcnFjTTI1VEx0aEtFWEtLckp2MW9ZNlAzNnNvTHhSOGUvSkdE?=
 =?utf-8?B?Q28weTNVbzVIZmJ6cTdSWW05L3E2OUsxM25hbm4rdmtjSkY5YmRCaWJHaTNl?=
 =?utf-8?B?SWZ0Wnk2TU0rbEFjUGRBcE5lSDhOeFV2ZWp4dHVNejY4d256MW1HQU9Zb2sw?=
 =?utf-8?B?VjMvZkQ3b0c2QVNXU0gyUld1bEh1N0xZVXBOS2RFV2JZVUNhRTBIc21jMVR6?=
 =?utf-8?B?ekpCOW9YUkhrVGF3NVg0N1BJZTNnSHR6ektlL0VLS1FFTlNFWHM4Rk5EOVNJ?=
 =?utf-8?B?emphaHlOckFESWd1ZE1EOWQ3cEZLWGUxZ1BwaWJJdVQ4bkhVQ3VVZmdBaEVQ?=
 =?utf-8?B?dXY2YU16eWNDNEJWL3p3V2ZOS0FSSzNJL2tGQXNQZEdkSnA0MGJQVS96Z2w5?=
 =?utf-8?B?SFVBYXZBK2xmK2hKUDJCSnR0RTZCL3pnWmFiU1RJSW1abW5NUUFmblVMV3Za?=
 =?utf-8?B?dXJNWGM1bVN3RXhIdEoxU2wrRVlqbFpiZ1k2SnA3aDErbkxCQ1FZVGJrNDNU?=
 =?utf-8?B?QmRsNnliWDNZOUQzY1BZS2w2bzlsZzQwN3Eyb3cvOWxySk9CcytnbzNKZnVI?=
 =?utf-8?B?cG9rSFJrT2VlU1BEdmQycXkyaVFqV2pwVHFkR0hDUkVIaHpEbERUS1hhYTk1?=
 =?utf-8?B?WWN3OTFQQzR4bGswSURUc2lRY1dvYWhSRkJnWktHYWJ6TnZQam16OERRaE16?=
 =?utf-8?B?M1FTZHNLRU9IdU1ucHUyQTZ2ZVNzK0N3L3pIUU5WTFVzNVNJSE54SXA4eDdY?=
 =?utf-8?B?OU8ydXp4dkZuVkM1QVB3cERndmpNTGlTZitSNCt3YUtaS1oxcHBqeU5QN2E1?=
 =?utf-8?B?U0dQL013SHZ2M09NTUxjVWVib3NHdzhGKzRJRWJiMThwbHNYUWtNTlhHUExX?=
 =?utf-8?B?Ym9GdWUrR1NibzFHQkhhMnhaZ041NmtGc3ZlR1RoN2VIVEJ3NVkxTjdqemE5?=
 =?utf-8?B?Umk2aFRiR2hHS3R3cnQzNzdaUGZyTFVjbXBBLytVSHpzYlNhK2VqMXdjTG1k?=
 =?utf-8?B?Z3Z6SkgrTytONFBTL2Rrb2MyaWJqOURDVktlV1Y3YkRuRVhERU1adDFGNk4x?=
 =?utf-8?B?c2VMQ1c5OGU4RC9CNk5Cc0RhU2E5VitJcDA0OGVJTVVCa29BQXVDNi9LL3ZB?=
 =?utf-8?B?NC85eFlVNkFNUmNpN21wQkdlU255bnRsSEFXTlRSSE5mQ01sKythSVkzT2pw?=
 =?utf-8?B?NjdFOHR2OWtlOVRYNmVEUTlMWVZuZHNGb0dFdE8yVkVLeE0zL0tkai85MitD?=
 =?utf-8?B?TThJYXRJN3dsZ09MbU1OVnZHeGtScDkvTnFjYzkxSUNsS3BlNlRCdE9IaVNK?=
 =?utf-8?B?VFk3bE5zVGdjNUp5VWljdlYrZyt4c0lIUGRIbEN4YjlKUm56Yy9jVXNRSkk4?=
 =?utf-8?B?WXBkL21JSHpWSStkWkVORWhBa0srcG9XRXVBOGNDbWpEcGNiNlFwK2NreWth?=
 =?utf-8?B?MFFObU9SaGxacHh4RGdmNEkvWXlVUS9tUGdCN0VMWUhVR3dCQzNMd21TWlVJ?=
 =?utf-8?B?czVBcGorcUJFQUtwTkJ6dTFjN0pxMnB1L1Z6WWdJVzc1QWVFeDNLeEtFMDdk?=
 =?utf-8?Q?RBlPTgql56yWrI9xQ4=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4108e0a1-d77d-4f63-3ea7-08dca585b606
X-MS-Exchange-CrossTenant-AuthSource: DU0PR07MB9116.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 10:54:49.9973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB9269
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 10:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202105

It isn't that obvious, for the loop to show up you would need a global 
class that DEPENDS on a native only python-flit-core built recipe.

Test to reproduce

python3-test-native.bb

LICENSE = "CLOSED"

inherit pypi
inherit python_flit_core
inherit_defer native

PYPI_PACKAGE = "test"

test.bbclass

DEPENDS:append:class-target = " python3-test-native"

local.conf

INHERIT += "test"

now run

bitbake busybox

e voila a dependency loop.
With the applied patch it's gone.

Fun fact if the python3-test-native.bb recipe would use BBCLASSEXTEND = 
"native" everything works well, it just affects recipes that use 
inherit[_defer] native/nativesdk explicitly.

Nonetheless the target python3 dependency should be fixed regardless.


Konrad



On 16.07.24 12:12, Ross Burton wrote:
> On 15 Jul 2024, at 13:18, Konrad Weihmann via lists.openembedded.org <kweihmann=outlook.com@lists.openembedded.org> wrote:
>>
>> when using python_flit_core on a native recipe
>> it was creating a dependency loop, as tasks for
>> python3 requires tasks for python3-native,
>> which is essential for building any native python recipes.
> 
> We build native recipes in oe-core with flit, can you give an example of how this breaks?
> 
> Ross

