Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D8FAC433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 16:53:04 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.88])
 by mx.groups.io with SMTP id smtpd.web11.621.1637772781853902770
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 08:53:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=PGFx3KaR;
 spf=pass (domain: weidmueller.com, ip: 40.107.1.88,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kdXdXMt0dIEtGDaqBkFpQhagDiaitYca6ljn04b4ImK3XtT+vvVV6RD4ZPzBCmYOzWW5/0PVhlEte5ECWeVipzRnjoNLJ7tkPQoxAqV9oz6lZPvmozqn0rn2O1iE9hP0EdoRYQXuoN3BBVnkz6TkDgY9wL3cI3020frFLoA2CYC23nMAGhQ2Oxdhpim7NFUI+s2JFb8jjyWriw8fbPEbbQNYzI5BKX1jWugALJ/0uv1sYx5+ynTq1520JWuSogNeoaRW4tilEwPw8k9v9H5TapwNmKaSNkAtGC+Rf77nlKELHAZhA4Wrm/2h6PowGEikourNM//laITmllfP561Ctw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZ1J6VvgKW48aENpRZSBpuQQQrlDQ/oIcgmoxrK4iOs=;
 b=UQzBqNmfmm4TWF1WnzMhZfYT6KEcC4VBzREnk2k+LXSiNF4yGVW9cwvc0I0xlKdMJHT8u82lzaq3Chezq7kMHV+Cfs8Pnupv4J8iGeYvH5Em20qVDwfUqeYvqYQPqCzUWCF7/gEvcPUhFZ1ufi1pCmoCHJqUyBtH/4J7xv9aw8re3xxD42Vsxv0M/SNlbbuz28ecNxX84k/mFT0qzxPWJUtabRXWK+M44R7r1FwG9rIFzep03L+xQTvX6vLqzLahf19oAJBik6Ss5CJkemgHuw0rcopcZQhBsoV6Z3HqDxjCen07T000w1/r1k/oHw2lSJITGO9NG8xZXLwTnBF1Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZ1J6VvgKW48aENpRZSBpuQQQrlDQ/oIcgmoxrK4iOs=;
 b=PGFx3KaR7uXiK9/UxKpuHXXo8UmytrZ/+jUftUsa8H6rkkdL5Mp8UexImw6kZUqltkp5or4zvdRpuFyuVWtjcU0wWzMwfiamvOVxUALbIoQj8skE0cFHHBHfDqGZNnafXLFnPANJiuMEBhpGVZAAOVnl0/vfpU3sOpOStKZWSLg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PAXPR08MB6814.eurprd08.prod.outlook.com (2603:10a6:102:137::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Wed, 24 Nov
 2021 16:52:58 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%7]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 16:52:58 +0000
Message-ID: <673658e8-0b06-ffad-eadf-c1b2352ce5a8@weidmueller.com>
Date: Wed, 24 Nov 2021 17:52:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [RFC PATCH 14/15] node-red: Add version 2.1.3
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>,
 Konrad Weihmann <kweihmann@outlook.com>, Martin Koppehel <martin@mko.dev>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20211124144739.2250-15-stefan.herbrechtsmeier-oss@weidmueller.com>
 <CANNYZj8YGPDu6W-HC58i_BqonXbQa4S21TrLieAdUKX8qWbWaA@mail.gmail.com>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <CANNYZj8YGPDu6W-HC58i_BqonXbQa4S21TrLieAdUKX8qWbWaA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0007.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::20) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from [192.168.178.36] (94.134.181.208) by
 AM6P194CA0007.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::20) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Wed, 24 Nov 2021 16:52:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fdcbec7-e7c8-4c42-4346-08d9af6adea2
X-MS-TrafficTypeDiagnostic: PAXPR08MB6814:
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB6814D1F829D01302119B685DD7619@PAXPR08MB6814.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nGex0kE4iArMnhTySr0qaQuds6GR4vbB8td+GxpclKLXV0wYZZ03h7XrIX/aJ8HRv6yDg9xcLxwPCcYQrQ7x7fQQKtfoQhqOa4Bw0OsqEocLQo5xYyKzlGyZIJoM6lA0XIZvRYlb2HSk6Dl79ZgiI+EWnLYVyhADb5c8CrOkn3d1n6ddnmvfksBuKEPHXV4oGy2BWlxdKnDMA5zIeK1Aqhep+08uKHNSsuv9V3PRhEukLlNZdPbu6r7QSntdaVDsR3zAZ4PqSot8iVldRK/rp1thLJKZqEKHcvi6EKQC+EMINL5EwtsrJIE/1DP4QlXDtsPfX0fuMZTDxLpgVv/pKAv4fEa0XncaF9w2wzmBtAniUmnByjbFSUFvtN5mT+00THXJoOBGopM8BB9rTqiTJL6G5m/C/Mr0qpE1sXDo+MfVMeNxocMdwmkaTPAi6Mtvx8KbYQAcx+4MltaZJ5BT4d1du+fmWAuo77x0GdQd+QG8itrSr7HfnVrSSSPxmQMsxAgFjxxsf4yqQ81qv04PFdAIa6S8xpPnOyT8ellzTdmgEvuU9vsdZVWfbpOw96xZIwCmPra0uhWtwUALmf/e1bYIL/yNRBbNEKD3xH8Ss0ktUnmmvXLmHbV3Z4Pu4H5JgWlL0WAngimOHBG9M/Ut2BMhEZ+nCp39CYpitG29g5hyJSRwqQPdIbsFtJqJlg0HDLijXIe0n7hVhwT0jGY/IGeAf1Oy4C9F+vXTYm9gyJ24a9qDDBx2UXXF6dnGKLHM1t2yseES5OkonJPeGIwIbg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(54906003)(86362001)(4326008)(66476007)(2906002)(2616005)(31686004)(6916009)(36756003)(26005)(66946007)(956004)(66556008)(508600001)(186003)(38100700002)(316002)(6486002)(5660300002)(8676002)(38350700002)(8936002)(16576012)(31696002)(107886003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TzNXNXRFbGRqSWY5aERaaTZjT0JzMFRxaUdDNHAzMlFocHhJL3p6T1YyY0VQ?=
 =?utf-8?B?eTJOQURJR2lZVm9xYzRaeFJQTjNEZlgvb1RPWmt3ZkVES3IvRXFOTklja0JD?=
 =?utf-8?B?L2NJblpJSU9sOEZydW9zS2ZjcCtKc0ZJZzk3T2Q4WktNU28xQkxnQkhxOTE3?=
 =?utf-8?B?MHhHSFJSeWhaQmZNZ0ZkVlY5ZnQxcEpDdEEzYUV6QndaMUROU3lrM0ZhRDZQ?=
 =?utf-8?B?bTlFeWkzWkUyaXpvTFA4L245ZDBSQ3M0d210KzBMOGM3Y1YzME5rNmFOQUNU?=
 =?utf-8?B?WHY4THBHWVd0OTkrMHhrTDI0ZGFNSW1ZQXRWVDc5ekdOdXgzZk91VFpjaGR6?=
 =?utf-8?B?MUdOOE4xS2huOEl1VytYWDlxczlIY3V4aGdsaFR6WlRpRWkzT0Nva093Q25i?=
 =?utf-8?B?bTV2NUhwTDZPRlRXZEVWbzN5WjVFRzFVWnZ4b01KdjBoRm1oK05ZQWlFYjgz?=
 =?utf-8?B?M2xNbzIyb281UzJONmlycHNDb3M5cS9PSzlWNTNuUkNCS1BzZk81YlVNTGFO?=
 =?utf-8?B?TCt5VEVqeStuaitIeGpXQWYrZVBBTmg3cVFDajVpaXd6eFMvdHRvd3pPeG15?=
 =?utf-8?B?R2pDaElURlUxWGIvaDdDaG5PZVBaSHNKOG53eVBYN1NJaU0rT3dtR3owaFhS?=
 =?utf-8?B?anNWdUdySTZFN0E1VVJXUWE2Q3VlSEhQSFhlZTl1QXQvQ3NNL0xHdE53bklx?=
 =?utf-8?B?dHZqc0RieCszZkVPNUowYkprc0hYenA2cXBmeTZLNGFOdmR5Q09nOHhpT2Ji?=
 =?utf-8?B?NXFwRmVnK2JkWUwwNWdSTkpVczUwTlRrVkJLL1JxYVdZUGY4dEdRUlFwUWJ3?=
 =?utf-8?B?L2pYMHZVczdIRUpFeVNUZWZ2a2FjdVlXL2ZnVmk0U2I4bzBIOG83QkpnK25s?=
 =?utf-8?B?SjM5LytjT3FkVGowRDRFaTZqKzZQZ3hDSkU2SHM1KytqR3MvYytGWXlDZkRE?=
 =?utf-8?B?VWlkQzVqS243NGE2bmRpMFN4Vm9Yd25pOTdSd3Y1NmhYbnZuSlBvTVhpRDdF?=
 =?utf-8?B?dUUxeCthN0pBTjFTamRtdHlxa1NVVDVuazRkVlF6RmRwNkFFOUJkQXdBeU9H?=
 =?utf-8?B?dkZNOWIwS0RQejVuU29WeFZEZmszaU5UYjZZYjNEN1dGVm43SS93dW1CNmtx?=
 =?utf-8?B?WUxCaE01SjVOL3pPc1gvWmRZbGgzVExNeWR1VXA5YzdzMzJSZzY3MUJYSVk4?=
 =?utf-8?B?M2dIdVI2d0oxR2hpY1BFZHp0N0x5a2V2K09lMFNISTVCMWw2dUZ1WDhrK210?=
 =?utf-8?B?SDhmWGR6emxFWkpXU0lncDNzVWhPWjhUZitBbXBiVVAwRHhTa2p0RnlFS204?=
 =?utf-8?B?Qk5pWkRmL1RwNElFdlpVTng0QlppUnpXaXBiRXl1aklPZGkrT2o3am8zNER3?=
 =?utf-8?B?SGIyYlBIb2tENlNtK3Q5dmpsUCtXcUdNYXNQQnNKUUFDbjZVcUg2bmViOUtn?=
 =?utf-8?B?NzFuZ1lLN0g4Wk4wTllJRWNJRkN5aFZTclFJSDg4cjROTE05T3RMV1hrcEtx?=
 =?utf-8?B?cHBuNjRIelFYSVB2UHc4VDBrTDVLTUZoN2lpQzdiMHJvcS9nT1lWMy9YSlJ1?=
 =?utf-8?B?L21oTUtEVHRVMXNHRUFuU0gzZU9OdHNCVTZzUkFKMnpYNm1QWWNGWXlSNGtm?=
 =?utf-8?B?bTduUjh4TnBGaXUvUjNUdDBiOGJLVExxbjhuamkwdlY3Uks2Ynl2eWpyS21v?=
 =?utf-8?B?VmNPWVhma0pSOU40SHlkN3RnMTFRTEhCNjhqZUxmWU00anh1bW9GT1g0VFRv?=
 =?utf-8?B?WGZtOWFQQkZYUmlJVU5WVEhhM1BCdG56RlQ4bmVsaHJ0QVMrZUh0WUtadlVF?=
 =?utf-8?B?RXNnb2ZSZlFaSEsyRVBDQ3MyVncvOFNBak94SHFvejBnVDZLNHZLU21PV29i?=
 =?utf-8?B?bnYrR0VMM0poWi91Tm5KTHZVTVJGbWc4WG9oYUQ5RTZ1dUJTMXR2UU5BRmM1?=
 =?utf-8?B?eVJrbzJuaVRRcTFVMEhoRWpOa2d4OWZScXNIMjUyTklmZ2dBTndQNEpsQWJn?=
 =?utf-8?B?N0xIb2F3bnJpN1dpNWZLRnVRdC9NQXhTcHJQRnVyK1NWNlhzR2tSTnQ1bzVI?=
 =?utf-8?B?MHY1R1VwM0twdzBQUjRRNzBXdXlqTXN1UVRPd0t2azVtaXhLeFBHTG5SL3Rn?=
 =?utf-8?B?WEhjY3ZXK0xVNlBoOHJ6dUV2N0JTL0phR0lmNUhiTThYZlpUSTdlK3VPS3ps?=
 =?utf-8?Q?bLBwfOWiXijLkVZT07EhgNc=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8fdcbec7-e7c8-4c42-4346-08d9af6adea2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 16:52:58.7062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 UFdHZRpv719f9RPh7DikQ22ox20xQaVq4x1zXqKGWPwF5f7UjGCkkDQeZQq6kw6dUxkcpRBdAw7j4ZzUUx9j4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6814
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 16:53:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158725

Am 24.11.2021 um 16:36 schrieb Alexander Kanavin:
> I do not think adding the recipe to oe-core like this is quite right, 
> and the same holds for patch 15. It's not buildable (as oe-core lacks 
> nodejs), it doesn't seem to meet the criteria for core inclusion, and 
> generally before we add generated recipes to core, we need to add tests 
> that ensure that generation works correctly (e.g. via oe-selftest, where 
> a generated recipe would be compared against a reference, and then 
> built). So the options are:

This are example recipes to discuess the output of the create_npm.py and 
the structure of a npm recipe.

> - move nodejs to oe-core, add the tests
> - move all npm/angular/etc classes to meta-oe where nodejs recipe is, 
> but add the tests there too - we can figure out when and how to execute 
> them, perhaps via meta-oe job on the AB, but first they have to exist.

I will add tests after we agree on the fetcher and the structure of the 
npm classes. At the moment there are too much possible solution and too 
little feedback.

