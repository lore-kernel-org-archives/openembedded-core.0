Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DBD0C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 15:57:21 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.92.73.77])
 by mx.groups.io with SMTP id smtpd.web08.1868.1646841440245928532
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 07:57:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=FsPFcDz/;
 spf=pass (domain: outlook.com, ip: 40.92.73.77,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lRa+TRVvLnNaSS/pBu3p66/3bg5XRFbBIYmBdWp5oQ36Gm646kgnxFpYsssMKCHQSvOd+sR0y7VI6ndfXQPCWkTlI3rPlmyuQyZC+hyE+lqON4t1P/gAJjTiqbf9gOF1C1e/K6SP65ugGY/RjB6IJPwjt9eoug7qeiNDaOv/aBAfFKLl+iQs6zZabOStboeMRDI9VLLrAx4+YbOoroP65tlkaCAGeCQNiv9VyK8reeOJjGFsNkIhR4/V1N2S4J1Dvg7N/pl5nIZLQwNgDWUJDPx21y9G4sUrVLUpvhFuuYG3GTMtARPPIQmrJwaggpbRlCSD0Egg7UfKskIMx2jhog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kx6iEHOmc1+AcJQc2twDyh0thVIy/RMbgc7sXiXQ0vw=;
 b=iUukpKjbIpT0PyzAIYDVwT23ibhRVQklCnnlUkt/dx7NYFl4vKPmWRmwEcFC5LtVnV6/yvED0x1NgSVcEA1Ksd3EWI/Cy9jpV9bObMzC4rPdTax3WBexUwTk7ViUtK/lf1j44r3bIL2C+KJAp/q86Ab0vHp/ptYfL07KHeHczYw4CJZBkAxuMmllTYSnBOiegSWG0in/f2MYIlpyiMcdEafwV/JA+JVFJUguW4S0+CxXEn6e9w3SVBJP6oosisEndnsCnTtr0t6vXnLIQBlz4rfMWBjlRkc9ilEk/J+FGj6nF88aTBYkBXmh5Ghnaxb1KoHMCZvfgRjRKDLFAOy/xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kx6iEHOmc1+AcJQc2twDyh0thVIy/RMbgc7sXiXQ0vw=;
 b=FsPFcDz/QvvbXlUUrT0ilWU/7A8DiwoOktM9fQ9nJ51+Ces5C39JSPCp0n+myd02tQZt5o75fys4Y4EVl6Ob44QmHX1LzgBBEUC1Xl4VFFxHJsAVT4xRVS+DKMsHB1WqKc5qYZyaktgIBWOqLet6IV9ISzRtEs7Q2O3yuyJQb2V20G38RFlergrGbMyUr60TIBdgcUU47HJiezkye4KB0/H+/8WRAqVox0NAnr++/HALszhgObjaCpt5cTiZokJV42Ly365RPu3wBZPMGLidW+MCJk/w8DglUnaQaXAtF/GXatk48VJ1m1OUkTk7mxLeUSXu3hyr4OQK0xIutdEyJQ==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM6PR09MB2263.eurprd09.prod.outlook.com (2603:10a6:20b:45::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.21; Wed, 9 Mar
 2022 15:57:17 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b%8]) with mapi id 15.20.5038.029; Wed, 9 Mar 2022
 15:57:17 +0000
Message-ID: 
 <AM9PR09MB4642BB663E7CF8E1324DE136A80A9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Wed, 9 Mar 2022 16:57:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH] pip_install_wheel: install wheel with a glob
Content-Language: en-US
To: Ross Burton <ross@burtonini.com>
Cc: openembedded-core@lists.openembedded.org
References: <20220309150224.2661618-1-ross.burton@arm.com>
 <AM9PR09MB4642C97B03C03260CDB40D66A80A9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CAAnfSTspNY6Davnnh1A+E3awnz4q4_=E2OdCZx_VbVZeLMtQLg@mail.gmail.com>
From: Konrad Weihmann <kweihmann@outlook.com>
In-Reply-To: 
 <CAAnfSTspNY6Davnnh1A+E3awnz4q4_=E2OdCZx_VbVZeLMtQLg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [XKTeVAE8MYweYlivczFZ9wO9Hg+XeC0EV0Mp4wv+TTOcKBYSg0bGq0oyKgycaEU2]
X-ClientProxiedBy: AM6PR05CA0005.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::18) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <4a7393d3-585e-dda6-35ae-2acf108056bc@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a1e85f3-7015-4c24-2d95-08da01e57c2b
X-MS-TrafficTypeDiagnostic: AM6PR09MB2263:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UT0xhxCpmnXJa5Xky+mMVRCyATzSio5NK4H+XsM9/RkHDwVMvReNpMy7TdFSx20t0smgJPZ25v+NfTsNyZt6AFpezqd8bGhLsGqb4I1OmPVRTUdoFgy/PAM1bEioGSmytHL/N7ELxSOsJzaNAYlSa+FXfBujN0ayp85sT39pwk6usaVx0yQt8219xhbidfckxUU/MsxZnJWyYPIZ9530G7tN4pXPPsqEOsbGEldS7K42f2ydRjqtyRr08bYjlHnhLw7wb7iilmL/NbW7K4LJNgjgBC5Et4Pnhhn58ntCoIBs8rOrTdHDBcASuwalSM2X99gWjjN/CCseFT+LvRvoWuH8w/xfVcJflLhM/IGPMTXgvX1fpj9KowmLgArTZkDkQ3TplQkDQbY2w9ZiTnU4JnDmBrRSOXrY1sELKv/biNbE3gRxQo4j9Mba8fo6hB/L4hL8aFmQhGePygexzeY2XvPV1MT2EIPGaCNExLau8QamhKE4Hogw3K35Kvh82IFgjC2NnXJYOoPI5TfArXjpJvixeBeCfhhM8aVpY2ixiQPpafdE0a2KLB8whHsPyvbz4G1Pc48TrBbw2EMkT/MO7g==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MDJRZjdBQ0hhUkdsK3liOC9IdWlsVTcwVFI0OXhVaEhNS1JLOEUrVnoraUtR?=
 =?utf-8?B?WEZLeFFWWUdoMlNSZFJycnVmUTNrb3hUbFlZdERNLy9adHJwc05BVmM1Z3Zw?=
 =?utf-8?B?NzB6aDVmSDQzeUJLSlNldkU0Y09GZTVSTVd4RXlyQlY1RVB0K2JZMTJNc3p4?=
 =?utf-8?B?TU5UMGZ6eThYVmFWU2Z1dk5XVzdHbmpvNWVrM2dFQUtnK21rS2FUWnRKSTNG?=
 =?utf-8?B?TXhJZlVJVTA5UTNLSFozWU1Lc1psYS8zWDg1ZVFLQVF2TzR1cXF1bnZJSm1P?=
 =?utf-8?B?WmpWUnlES3FvTGp2eU5iRlo5Mlg4b1NiWGZ5dHlWYlVJUVk3NW0yL1RzREFz?=
 =?utf-8?B?NGg5OHpyK3BDT2xBdVpLOXpPT3dHbjBicTlaU3p3MnYwQTZLakt3Y0w1Y3Aw?=
 =?utf-8?B?Wit4RkhPUXlFUVhMSjNBL1lLdnU4emVBZTVXRFlzaWg0T1F3K0xmM2gzSk9y?=
 =?utf-8?B?ZS9tclk3aWkyek5EeVoxZjVYVStXcWxvSzZEQ0JSNEMzcCtreEZidytFTjlx?=
 =?utf-8?B?S3hCU29NS044RTZ4UTAvQ2dRRWhzSDVOcERFcytuVFg5dFI4b3RROU51S3A2?=
 =?utf-8?B?RmRlcUdxd2luSXl2d0pZUi85WTUzTi9rRFpqeDliN3FaRlE5N1JCQVFQRGdZ?=
 =?utf-8?B?bG90YkVLd25YL1FEdE0yM1hMdE9QUWZLVU5rWEFkeGVDbzNKZzBIOWY2TnlC?=
 =?utf-8?B?enQ0T2RLczlObXpEMjNwVllPbmQ3cFZRckZqSnpILzJXMmtSUjl1dXpRTWRL?=
 =?utf-8?B?Nm9BZ0VVTVFuUXpIdlJvbDJLVUp2ZUU1YTlZRmRzaFpKVlNlS0g0OUVGU2Nm?=
 =?utf-8?B?azN4Y01zZFY3Y2wzT2tzWVBmaWx3YTFMcTUvQTdmTFZKN2VBRThHSHBPR3FW?=
 =?utf-8?B?enhlZmYwalBLaXhSZFRzZHlhMlhsQTJtRWlmUXZvZmJWaERPQ3RvK1ErVnVK?=
 =?utf-8?B?blpYa0IzTEI5RnJ6MVFtTWphYkZzVHFEanQxRXZ3WnFHZlVhd3NYNFJ1SlI2?=
 =?utf-8?B?VzFZYnlHemVJdG5oWk1NQzh4dXJvcEl4d1FtcGxMdGluTEh6QmVZTkhqc2Rp?=
 =?utf-8?B?QUx5TGdUbkpzek8wKzllM3BzWUdMMVlwamhncWgxNUdsRnF0NDJFRG51Q2cz?=
 =?utf-8?B?WHB2dytya3JPK3h3MmFvdktSbXNaYm9QYkF6YXNjZUVITEZLQTZtNkVBNE9Z?=
 =?utf-8?B?RVNDUFpRNEVjOW5DeVlCNVczZ0RGV1JlOWtxWUR4SWR2OUxJcEc0RnIwWnBa?=
 =?utf-8?B?WFR1dGN1Qzd1ZXBpWERXU3lOUmM0TWgwMjhXNTB2dmtvMTZVZXY3TC83d2Va?=
 =?utf-8?B?OUtVSWpoMGhyQUV3SmxhaTdMR25zTlNTK3FJS3JLN3F1Uk5CUFFyV1pXYmZ2?=
 =?utf-8?B?RThpMkc3VUtlTkE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1a1e85f3-7015-4c24-2d95-08da01e57c2b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 15:57:17.0877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR09MB2263
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 15:57:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162968



On 09.03.22 16:53, Ross Burton wrote:
> On Wed, 9 Mar 2022 at 15:47, Konrad Weihmann <kweihmann@outlook.com> wrote:
>> Can we, for the very unlikely case that do have more than one wheel in
>> this dir, bbfatal out here as well - otherwise I'm worried that this
>> will never get noticed
> 
> I'm undecided on this.  In the unlikely case (impossible, by design)
> that a number of wheels are built for a single package, wouldn't we
> want to install all of them as we're building the package?

Classic assertion case IMO - as you said there shouldn't more than one, 
but in the event of having more than one, I would just terminate the 
build, as likely something is very wrong (like people playing around if 
task appends or custom tasks in between compile and install).

I'm just concerned that this here would create a blind spot, where there 
none needed

> 
> Ross

