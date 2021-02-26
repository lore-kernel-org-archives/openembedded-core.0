Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.60])
 by mx.groups.io with SMTP id smtpd.web11.7837.1614337963008566936
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 03:12:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Quwevlrb;
 spf=pass (domain: windriver.com, ip: 40.107.237.60, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J++1ysj+9ktGWc986kPswG0fdYLg4sjr0yw2u3bn0Y0tlsSid0AjEIN9ZSTOFGNnu1oS3YcKBdwZ58KzN1M5y09e37+hK9F5mzRhXgbO2L5WWS5gUS0ix0pn+caYHTTKNGIFAh7NJBSMnI8uigdU9MCCiihZ4dICEMMbtDjZf+8pcW6kOQDcTVLuSl1w3NrINjVzk/gYj2Yn1qWpmw3DSzUO+YUYQFNAGDl9jVgRuTpjS7N9Nz11FVhNws0en8wDAkS6mFuLJCFViM+utdiyBakicPQ65gSz0ZgeixEuNjLwgCPnrB1L2kVzX7ZNOV50BLtdycdWRoBf+0FXuD4C/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nm8kZU+uIvS0vUnNwtjCFg7EhRsTPgzSPc+SfkZRfto=;
 b=DbuiUELAbhybjYGj9d4eZ76lqKCOFDe/K/dgwpnWRduJ5ltUZs265iFjBpNaWLaR7bdvfyf+ELCVo11+ZE77e7ZX7jA2uQCEMd4qZp8tPkFp11b6L1v+iF5lw2adNwZRlyQKH4rNMkh76FX0Eo7Vuhn3/IUgseaEciOvRilJTQdWGBbcK6VizLJC9lnqU3oXIK1wAgQDZl1qanihcSmquiNMEqyrqupgMtvooeBJ17HzNZ2s3RT6X5OQB3dwt/4kk9OBXz4wJkUqw+yvmH6QuQxEOxjYwyoaECG7pppj7FLm3EhuKrr5O97ROkI/NPbD/Q/zbekHMt+DSGHKZtfkHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nm8kZU+uIvS0vUnNwtjCFg7EhRsTPgzSPc+SfkZRfto=;
 b=QuwevlrbeElA82O6u0ybXGqd0YnRaUE8DpOd6Ql/yw54XABiVyAvk69+F4PlYuvCPaIdl0li6DNnJEdWuH64D4H/Jr23CEdRTn649/5OFXm3kB8CFyy8WlN8B/Ze72NNFLl+UUxr97z953UlxtuV/b3YYIqQD+8mA9oM5YXhFAA=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BYAPR11MB3736.namprd11.prod.outlook.com (2603:10b6:a03:f6::10)
 by BYAPR11MB3318.namprd11.prod.outlook.com (2603:10b6:a03:7d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Fri, 26 Feb
 2021 11:12:40 +0000
Received: from BYAPR11MB3736.namprd11.prod.outlook.com
 ([fe80::dcc7:5da3:6cfe:b3d9]) by BYAPR11MB3736.namprd11.prod.outlook.com
 ([fe80::dcc7:5da3:6cfe:b3d9%7]) with mapi id 15.20.3890.021; Fri, 26 Feb 2021
 11:12:40 +0000
Subject: Re: [OE-core] [PATCH 1/1] socat: Exit when the file associated with an FD is destroyed
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
CC: Mark Asselstine <asselsm@gmail.com>
References: <cover.1614252295.git.liezhi.yang@windriver.com>
 <2fc3ec398db0998427e1d0cc351dfcc91d59a3f0.1614252295.git.liezhi.yang@windriver.com>
 <0d9f649d5afb3ae1a930de5ed90ca5001b2d20ae.camel@linuxfoundation.org>
From: "Robert Yang" <liezhi.yang@windriver.com>
Message-ID: <9ee9b712-5dd4-f201-5405-c99ca64e870c@windriver.com>
Date: Fri, 26 Feb 2021 19:11:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <0d9f649d5afb3ae1a930de5ed90ca5001b2d20ae.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0221.apcprd02.prod.outlook.com
 (2603:1096:201:20::33) To BYAPR11MB3736.namprd11.prod.outlook.com
 (2603:10b6:a03:f6::10)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.198] (60.247.85.82) by HK2PR02CA0221.apcprd02.prod.outlook.com (2603:1096:201:20::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20 via Frontend Transport; Fri, 26 Feb 2021 11:12:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d3a0f68-fde7-4bd4-f5dd-08d8da476e37
X-MS-TrafficTypeDiagnostic: BYAPR11MB3318:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3318FCB0839073E63CDB45E3FF9D9@BYAPR11MB3318.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DdZz4hX0mS5jfTmYtGNqDfDDRe5IYla+lK7AObR4mDBZc03ayAiuzFeErPWBd/NHx6VFG15Y4YUzubF/hOFSMcGE7cntlqL+Lj+LEKR5DlhL/cWADS3iJZmiejkXBzM722vYzRF1YCMjdD7u0y5Eo9Bc95BzJ6wQ19enpVZZJCRMEQUi5rhcvJ+TzRG5QRqAeE/cWB8WIWpkTJz2/57c9oR7GGtpPqCwb0r5t89JShaBPk119JfeIbQH/llw0pQZfKQR9o62PxjotnvmnRq3RyhBbHGXQR318hD/Qa/DxI/Ri0q254d09Cg46ZxXFCmbFWCXvdyZR/TyP/oCESUWCkTsWkvnG5PJKIerKvxTi79vB98MwPGzfbmXUNmAQm65pl6KOzWmQWUER3be+1As4hxFSLqgpN1yHBFzHqdx4smLGvwZv0yI/5/7pKjMNUMwnYUmSQrtHsv7hEhu/mx0eaRrq3jMYsQzV3wmSrPCMFbitMYu4fEqSHpzy8qju4qQPJmTfRk9Re5T/bySK5mi1q5rkGA1oBjU4PnSkpuDrNhpbL0BvC6paAdf1Rhbc4RFXi4vpk0QAwlI85wcxQdI3z4Zrpf1Z0bh74gtQoU8wwPvh3FxYsPqAw6owRg6z5h/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3736.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39850400004)(396003)(366004)(376002)(956004)(83380400001)(2616005)(2906002)(31686004)(186003)(5660300002)(6486002)(4326008)(6666004)(8936002)(52116002)(16526019)(6706004)(26005)(16576012)(316002)(36756003)(8676002)(478600001)(53546011)(66556008)(66476007)(66946007)(86362001)(31696002)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?cGoRjNfNrwPF0thi6Sc1dD253Pmd18zjiMrYBRd4VPxYFljzab8siT4FNSao?=
 =?us-ascii?Q?t1vVUieCVkKcyHnSLG6QoQ0cR3ZKzZEX2tq0jofFbSFJ7n8Qi7pfTRqOxI2E?=
 =?us-ascii?Q?ZzINIS8LQhhaSz15EQ96SFRG9oKsu8kOWsXWWKkBujpDn+c5Y6nSXtb9hASx?=
 =?us-ascii?Q?o66BPjrC0WZ0wQzK0g6j8rTzoDCT26HmD8JuGc15SWy1Dkab2X3VmJn0VCiM?=
 =?us-ascii?Q?v2ryFTNUdhvMGbXujgxVf3JwYhWMPkmc2MXRp3BTudnx2+uRvG/iJPoHEgUr?=
 =?us-ascii?Q?bom5wJYNp0ucNbuUBkJOeLlEbzDjLoTcF55mUTr9NYJDCaz6JtPz+HGlZ2Ck?=
 =?us-ascii?Q?iCMlwDrB0Rg1glG1V/CFvKaR3BilVeDY5zx2GiNHGDdnVdHsDEznML+SCp37?=
 =?us-ascii?Q?pLSfg5TJa9NhePc8b+CSGXTEXoXIT4qTrPgyl8NQRcd3tx9gYIxRBVQ+N/fJ?=
 =?us-ascii?Q?6jVRy9qgUL7O6DwHgrFbK6I/ICmz1JHGOPxwS4+R8KV6gUUse9w/CUZkSleJ?=
 =?us-ascii?Q?TRdJu59KqheRb3nQx+ks0ZI1wTxnuJ00SNty5jX40YwKfqk2PbWubr67Tr4p?=
 =?us-ascii?Q?Tu/rEXvMxL9zgkjHEWs7YIo37F/NiEGFN9qY4y3AuBFKCnR5MzV08xVlHpGf?=
 =?us-ascii?Q?uKHTdiV6tE4dfpmGK2hRSlYR1BTkOVn+WjmDslQrIaFs/smbCRevAK10p5lh?=
 =?us-ascii?Q?he7RJpmbsgZX1hXX1aY7bZEbicGQTBgxwAgMhExHvmStdEpskQ/wHVcn1ikW?=
 =?us-ascii?Q?nUC+mZzQRAGCpHloTV1hhFbuejlL2cW3ln1UNlGb/nWy5bErLvHG0c1kc7+b?=
 =?us-ascii?Q?8o3DKOpgE9OwjhPsyEKWdFgUNFx5iGBHxWJgAl6h9pUd1LHrWxvsFzx/uHzZ?=
 =?us-ascii?Q?R3H5v8YYc1FmnUi5sxc+GNWRoFwClbj/K9nJh1lj20XwjItYnG+Oh8mvffOs?=
 =?us-ascii?Q?fglRPu11zy0EYd4cnBg/Kig4VEi9eSSfizQJcNOg3+JEt/TYhqx36hPovkDX?=
 =?us-ascii?Q?fZ+6BvcE1N7XfUsH37aFbpHS7LhX43DaD2CyEuiVtHXIJrhaAco0jF+Dtj1P?=
 =?us-ascii?Q?y9DQ7cvl8in1VoUnssZQnNgNjgliUaF1fnVuFQSGxJcFv3MhxVYCEtGknhZW?=
 =?us-ascii?Q?It6gIE5+L/hW9oLSVkWxwo3V06/bItDSl2VSoFyuZlzqUXzDwMlUbV0oxOZy?=
 =?us-ascii?Q?25A+ZJMaxxfnVhC9lYniqDpnfkbqjpsC3h1dt0pODIf17yJ6XH91+KJI0YKO?=
 =?us-ascii?Q?wWM66TEjJCm13xWugp//L7ANHurw6703BIdsiSrK31ZSMAKtfuAuo2TBNDdm?=
 =?us-ascii?Q?lDKLeOv7oenukRwC+K5u28PA?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d3a0f68-fde7-4bd4-f5dd-08d8da476e37
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3736.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 11:12:40.1638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VvcBn3JxQmpzzT3LyOJb4x2TE0yDvqEzFWqDfb+JE39iJyQIMJPlNALDTIgDFyK1bHWhHy9q3pew35uKSviQl/HmogsIqFg3dSraGaQFY78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3318
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi RP,

On 2/26/21 5:51 AM, Richard Purdie wrote:
> On Thu, 2021-02-25 at 03:25 -0800, Robert Yang wrote:
>> In many scenarios the receipt of an EOF will coincide with the
>> teardown of the file which the FD is associated with by the
>> application on the other side of the file pipe. If a timeout (-t) is
>> used socat continues to poll for new data (read) and send any new data
>> (write) until the timeout. This can lead to input/output errors as the
>> FD exists still but the file it was openned on is gone, and no check
>> is done on writes.
>>
>> To get around this a check is added after the EOF is received that the
>> file still exists, and if not we proceed to exit immediately. This
>> will avoid i/o errors and will also cause a quicker return as we don't
>> have to wait for the timeout.
>>
>> The original author is Mark Asselstine <asselsm@gmail.com>.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>  =C2=A0...le-associated-with-an-FD-is-destroye.patch | 62 ++++++++++++++=
+++++
>>  =C2=A0.../socat/socat_1.7.4.1.bb                    |  1 +
>>  =C2=A02 files changed, 63 insertions(+)
>>  =C2=A0create mode 100644 meta/recipes-connectivity/socat/files/Exit-whe=
n-the-file-associated-with-an-FD-is-destroye.patch
>>
>> diff --git a/meta/recipes-connectivity/socat/files/Exit-when-the-file-as=
sociated-with-an-FD-is-destroye.patch b/meta/recipes-connectivity/socat/fil=
es/Exit-when-the-file-associated-with-an-FD-is-destroye.patch
>> new file mode 100644
>> index 00000000000..b5ac62f6169
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/socat/files/Exit-when-the-file-associate=
d-with-an-FD-is-destroye.patch
>> @@ -0,0 +1,62 @@
>> +From 956d4b00a101f61b4cfaafa0856b646646536492 Mon Sep 17 00:00:00 2001
>> +From: Mark Asselstine <asselsm@gmail.com>
>> +Date: Mon, 7 Dec 2015 21:27:35 -0500
>> +Subject: [PATCH] Exit when the file associated with an FD is destroyed
>> +
>> +In many scenarios the receipt of an EOF will coincide with the
>> +teardown of the file which the FD is associated with by the
>> +application on the other side of the file pipe. If a timeout (-t) is
>> +used socat continues to poll for new data (read) and send any new data
>> +(write) until the timeout. This can lead to input/output errors as the
>> +FD exists still but the file it was openned on is gone, and no check
>> +is done on writes.
>> +
>> +To get around this a check is added after the EOF is received that the
>> +file still exists, and if not we proceed to exit immediately. This
>> +will avoid i/o errors and will also cause a quicker return as we don't
>> +have to wait for the timeout.
>> +
>> +Signed-off-by: Mark Asselstine <asselsm@gmail.com>
>> +
>> +Upstream-Status: Submitted [socat@dest-unreach.org]
>> +
>> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>=20
> This was written in 2015, when was it submitted? What was the response?
> An idea of the current status would be good for a patch of this age.

I sent it to upstream yesterday, I got a reply from upstream today which as=
ked
for a testcase, let's hold on this patch and wait for upstream to merge it.

// Robert

>=20
> Cheers,
>=20
> Richard
>=20
>=20
