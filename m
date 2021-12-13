Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F69BC433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 13:00:27 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.84])
 by mx.groups.io with SMTP id smtpd.web10.10725.1639400424634984731
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 05:00:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=C9Q1TdoQ;
 spf=pass (domain: weidmueller.com, ip: 40.107.4.84,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cn+zvguItglJgX0MocxnzztEt3uH9xHgb2ve7Tyh+rYEs9QnQYsDCxig1Gv+czllTRkzlEBOjJVOengeux5+1OZCTj8qtYwJR53nBtkmdUG+qTKhF23mfI2MbAYYctScH1iQaWQEoeNBelXh7I50K7OCLt1MtnpUFsRCvSOpWqDIJusazPtuvQFcJZoXw/R5bJ30zTgUWmxPlkWiVbEL+LROlA7iwdJvQYOeaB/lfDcyryMk4/Hhvj5Tclv/gIQKWSGAnDzhujr3e2OEkob51e3nqwsRXSuG+4kUFaubulXBPzDn+PEuM2I+KcbMZ/gakTG0PvwqS8nzS3PuB34gog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lwtgSovvlX2Og9cTNDFUB8jsX2rg8QSGRF+1daWXGm8=;
 b=g9Y+TokGq2KepFXG80a9qcOf2bZUzFZwLs+V88YVAEAj335D1Aa7qoZBOP0xcZsN0sD67i8m3gEGBBemkVkvRNoIwD542rZYolet9yV08YjgxixCXmv+hk409ntivHNTnUP6bk9Q/L3JlyBGPi8JBhFwTrvyLb1dByt0jF70nYp5dzQ1M9ZjF2hF1BPDlOpdGmPc7oCnneX7fIz//ESt5AtFh7lw+Eq2tQ7P2IEI2HXA6zmmp1QX4kA7p8WjwM4Ez1ja3Pc7DNa+XqTZCPmmmvPaGCbgqG33jtr/r2YU91Bojhjo8YmR/F247xQPcbWAIq5zZVDzdOLWRowEkAi5PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lwtgSovvlX2Og9cTNDFUB8jsX2rg8QSGRF+1daWXGm8=;
 b=C9Q1TdoQkNaASUzG2lMr5lnrhWmDmO9kUibqIA/XJtAv1TsNN8V4pJD58JT3Yih7+mtZRSYLGTSxiJcnyZFg8c2qEBR5wgok3jFNORythwQDzqgSBKJgrx35jtrtajwKGQ/Uob27mcl8bxOI8zAxArHMMblIfe/x9mzxEVhOrZg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR3PR08MB5641.eurprd08.prod.outlook.com (2603:10a6:102:91::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Mon, 13 Dec
 2021 13:00:21 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%8]) with mapi id 15.20.4734.032; Mon, 13 Dec 2021
 13:00:21 +0000
Message-ID: <de0aab1f-deb6-818b-517b-0396a45e6a2d@weidmueller.com>
Date: Mon, 13 Dec 2021 14:00:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [OE-core] [RFC PATCH 1/3] recipetool: Separate licenses with &
 operator
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: 
 <20211213123826.31605-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <CANNYZj_Kr9ziC4TLcgTZ_cGzaFy1-6uDD_V0geAEJnt1p7cEWg@mail.gmail.com>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <CANNYZj_Kr9ziC4TLcgTZ_cGzaFy1-6uDD_V0geAEJnt1p7cEWg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0201CA0001.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::11) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from [192.168.178.36] (89.247.126.92) by
 AM5PR0201CA0001.eurprd02.prod.outlook.com (2603:10a6:203:3d::11) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Mon, 13 Dec 2021 13:00:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5a646d2-9e0b-4760-027f-08d9be388511
X-MS-TrafficTypeDiagnostic: PR3PR08MB5641:EE_
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB56415254F19A9B8EFE88C72DD7749@PR3PR08MB5641.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1pTpO0gyxdaoAfdZO3kJ4otjFJgcOqjiS30RypN2Va9NKhNsmrB5QVk7VzlDe37e1jgvZ8hy03np2J+imFxsKV8sHUjpAPFJjV+0r55jUX+PZWXm+zrVeoh6Ig0Fhpkwk4kn/DshN9a43Y1FsWPwni3frdTZP7Ty+qtHTe1SNBHNKPMACPbua2qPYrNCfwrQic3Z7BoOc0wpfpru+vtuhY9Q1GDTjx4QdHRAqCRw+tlB7sGVUjPpq07t5ywxQEwfN3mNcX6lTDgAltih/IutnP+56X3P5zeNrbi4qVaP1xDdbRZbRdAXUyq2RajBGoTmODVIHKn77jQl4a4slA5ic19xeJtMBJb/WBung1gnBTejvTCJCRLK3+pB9WT0WDuMyp9LmK+vR9qt+NDdLiuX42Oe2i4qiyVaiZgoxlMjukzstXU9x381vh7G9woBLVCXbZ+YIwnpkELRoDoU4fUStohSeAcAutTOy4uyZ4Jz29mGAk3q4cnTFG26xFYyD1TOtEvFsRHArkqe/dTwX2cdN98txJpPHUO83w0Fhq9qNSz96ZqC0PsgkwaXFnTzCJb91mLAfESM6hxV+hEeAKZR25kVHJ7bgbBuOpqrRfhmgp4L+swc8/CpQGgUN3JwAK1/epaiCw8hVnFjA4GSe30exN1GMQiU/iHgqDaa1Pn+7jQcz3ht6YtaGJ/KpI8Dn2j6GmT1CyhMYWeQgUcZBnKmn/I05pnEcYOiu7fron+0I08kkYqMW2F/sKbIthSaPDMprG8DLXXszay/m9zR2KXBQw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(107886003)(36756003)(508600001)(6916009)(31686004)(316002)(4744005)(66476007)(66946007)(4326008)(52116002)(54906003)(2906002)(66556008)(8676002)(16576012)(26005)(8936002)(38100700002)(956004)(38350700002)(6486002)(186003)(2616005)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cWc1UlpjN0k1aXYxT2EwNE1rYldhMU5IMUFXVkJkUDF6UUtBYXg4VGRZVWty?=
 =?utf-8?B?ZFpENjNCWG9mTU0zaWppOUFkemFvb2ljTlFVRXREZC9ycU5NNDBMM2RZdTJG?=
 =?utf-8?B?TWN6Mm5HdllyNWtTZ0I4SmRqelowRGhHRTBUUW9abWh4RjZ0UFJMWGdaUlRB?=
 =?utf-8?B?U09nVDYzT29Ndk1BZkFEbzdkWHJjdWxQTFI3N0VGazIzbmc4YUU4bVhjUHRV?=
 =?utf-8?B?UGQrMG13M1dpOUpOQW5oano4VlZoYzNDdy9oUE5BMnBuZlhOd3VDdTFjVkhU?=
 =?utf-8?B?dVNSZTBPTHVxNi9UcHZPQ2JEM21QL0ttNS8zV3lIS3FTL2t3OTFOSGxtcDJy?=
 =?utf-8?B?dHM5Myt3UnMySEdaeDlBcTg1YUhNbEwrSEo4SEpLSVA4aUk2YjZja2dCYnZH?=
 =?utf-8?B?b091SjNtb1h5N0pFMVZtMmtZeE1wdE5hVGlXV3o1VmZaVFFET2xLYWxSbzlO?=
 =?utf-8?B?SG5ta2QrWCtCRDNqSmdkQ0VhSG9qME11bUVabXRIUkRuYUxIVDM1Y2x5Y3JR?=
 =?utf-8?B?cm5aQk9yTzRKeER0cDlWaGh3MmRRVnYwMzFJbG5uL3YzVi9FQ1dvNUdBWkFi?=
 =?utf-8?B?dEx4cEFYT3pDSm5MVUtoOUtaQldlZ29QNEUyR1oxZGhPWFIzaFFmRk9NSFp0?=
 =?utf-8?B?aXRYbE0wd3ZZQkRjbzRDMFhsR3Y2T3U2R2NTV2g3NEdzMlNWZ3dIbkQwaDc3?=
 =?utf-8?B?MVc5Q25XQXZwWkp2aUdnd2ovdjZ2enR6V2pMV29IWG43UWRRSlRiZ2FnVnQx?=
 =?utf-8?B?ell1V3QwYU4rdVVkTFF0cTBPQUx2MDZLVXpIUmhUang0aGJnazRnSENJZHMv?=
 =?utf-8?B?bTRkYUwwNTREYXhqbTBZQ3JiK3I5K0tqLzM1Q0FEOGlrQ0JCN0NVaXpscVdK?=
 =?utf-8?B?TitJL09rWThmblVtZm5jOUxiVzZOVDh5cGp5SlNvNDRya1ZLVUtnTk5wcS94?=
 =?utf-8?B?UmdvcVpCUldwODY0Y2UzNkRHSThndlIrUmNBVytlMXkrSnYyUUw3V1g4a3Uv?=
 =?utf-8?B?UDM4UzgwSnhoTTlqVFdkakdsSDU3ZkJueVpFU3Vub2VBZXU4TmRWUmNFWmt4?=
 =?utf-8?B?UUFYdHhLdVlZMkhCejJ1YkJVVHcyN2NKRlBqTWd0eUxyM1ltKzA4VCtqTHYx?=
 =?utf-8?B?T0x6bmdxMTJUL0NlT05IdXIyRFRQRnE1U2JWMGdtOGp2Z1NQQ1dqQVRDVmtI?=
 =?utf-8?B?VmNUYW4vSUZoUFczMjJ2Q2Vtbk5YczNIb1BsTVVDZy95a202MmxLMUM4NXhy?=
 =?utf-8?B?bCtaa0NyRWhOKzQ0Y1c4Z2d6YWxxaFFxTzQ2SStHODM3YVhoVllvRE0zcDI1?=
 =?utf-8?B?eFQvVWcvb3JEOHdZeVVqUVphMitvVGZhcDRoTWhzZnVaVno0Nzh4ZmxsMGFm?=
 =?utf-8?B?VW4rVmUrMmRkczUzSjlzaDRZR0FZV1ozRkcxdnRKS1M4Q3FQSUZIdy93NXYz?=
 =?utf-8?B?MXNhVkRVR0JjTC9CdEJrRkx0bFMxYkdTdnl6bTZEZnRjMVh3UUo0blMwTjRW?=
 =?utf-8?B?bWtpbks2N2VVMkI0UU1GenV0MXJLZFpTSzNVZWIrQnhQL1JUbjRYQjA3QmQz?=
 =?utf-8?B?YlRXUVFFMFhvbUhPenY2ZHdtOERmcUh0bVlDa2lveU9RcUtKbnhUQW96N1ZQ?=
 =?utf-8?B?U01RdEJtR2NBWk81SStZeXRGUjlzS0RNTTZjazc4OVVXa3ZnUnhUZU15NGdV?=
 =?utf-8?B?Q05sY09rdDh5NXN4ckxvVklXNHlkYmMvUUd4NkU5THlRMVZacmZlcHZFTDl4?=
 =?utf-8?B?eGhBOTdLdjBYQ0tYOHhxY21tbmhwUEU3TVJGV1FYdC9aVDI1aXlyTnZFeERp?=
 =?utf-8?B?QjZaeWd6TmxUUVlQajdiZWZvVGZ0eUlqT0tkOGxPWXFRblBCWTBySUtMMndh?=
 =?utf-8?B?RmlhR2pIcmo2ejRpK3Q4S1lkVENsQllyRGw5OWJQa3pYa3V6VzZINDN3cDJ2?=
 =?utf-8?B?Sk9FbjB0bjhqd0xXbHBIRkxVNzVLQ1ljMStub2xhT2pzTXV4b2ttK29hbklC?=
 =?utf-8?B?WjhmK2pkQWV6anZHRmJxczAvMldSVFViL3ZnM2FMRU91SXdCNlBuN2VZeXlT?=
 =?utf-8?B?Ri8vZEQrNVFnZ0UyR1l4WEZtZlJzRHZmaEtScnc1a3ZPbkFsZ2RiYm40NytQ?=
 =?utf-8?B?d3Q5RHNOQjFkZlU1dFBZVmRiUlBWWDhuR1RTWkJYdWtoVWI2cEw2dWF6ZXQx?=
 =?utf-8?Q?u7BdGNvkuHBlR5UADCsQAtk=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c5a646d2-9e0b-4760-027f-08d9be388511
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 13:00:21.0840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ElPTx7fTYgDau8kykGWQm3boACMhpRgP7yb0Aa6D6Pbeeqz8ePqKXOsgltav7A7KDBDf4+h0tIc+aDoJBGw+tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5641
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 13:00:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159623



Am 13.12.2021 um 13:57 schrieb Alexander Kanavin:
> On Mon, 13 Dec 2021 at 13:38, Stefan Herbrechtsmeier 
> <stefan.herbrechtsmeier-oss@weidmueller.com 
> <mailto:stefan.herbrechtsmeier-oss@weidmueller.com>> wrote:
> 
>     From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com
>     <mailto:stefan.herbrechtsmeier@weidmueller.com>>
> 
>     Separate licenses with & operator since it should be satisfied most use
>     cases and it is a reasonable assumption that all the licenses apply.
>     Furthermore flat, split and sort the licenses to minimize license string
>     changes.
> 
> 
> I think this is better explained with an example. What did not work 
> before, and what works with this change?

Do you mean something like:

-LICENSE = "MIT ISC Unknown"
+LICENSE = "BSD-3-Clause & ISC & MIT & Unknown"


