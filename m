Return-Path: <paul.barker@sancloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F28C433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 14:07:48 +0000 (UTC)
Received: from GBR01-LO2-obe.outbound.protection.outlook.com
 (GBR01-LO2-obe.outbound.protection.outlook.com [40.107.10.110])
 by mx.groups.io with SMTP id smtpd.web09.6044.1640095666978276922
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 06:07:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sancloud.onmicrosoft.com
 header.s=selector2-sancloud-onmicrosoft-com header.b=BW6OgI2a;
 spf=pass (domain: sancloud.com, ip: 40.107.10.110,
 mailfrom: paul.barker@sancloud.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ShShEXqC3gqu1/vSZPG1ZPn3d9ifmmeOYsUHBKt4SlYvvS/79WjKD744VdIOnoH2eDQhP4C+L0Q7D/fxPXMx6RpLzegiaPsMXxpmF9BWccgphzpXB/QR9d+puf7SDYB3mkFtCYET8qaJaDtResV3Iown8KijPxlyBU1XXr3uoeFKjoT6bRgbYClzxcDkNv0Jp6Q92O9htmBP+BOCzeOcwLXiHv2U8+iF6+Yif6drV5dh7N3b0LDE8rAzQ55T5lRpvUt+iIPMcqXDEJcL4ClmawXJcg9kR/P/QQOvd6/el+ipGBRSPswn1C6289leCvE6hAtHdNSIKSLum5dK9ZLLSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQqx4qhosvKGtG729pocg0sdH+5z9ihJ0NTke0z6nps=;
 b=i82rXFzwTPF0FqRjdpUW51Ip3uzVAJSbH1r2PFOORbhD8b9WMD74UPtp67KPejlGTI8N+b2ZILoo3VcOVQaewGAi7UzHnHsIDPfSc2bRDSS/RRoqZFi52X7k42JfOAgg7p0OQQnosfkj8/DtA0nD5l72qU01GH9W/YD0bWxvX776Lo0c1U6qycp4h5PS+SpMELEOztthWQ7bC+ilOy1WqUE1b2fNn6UBm5gNo9bBphL/4ifA7utEMi1IeNB9YHwJWOIMLjzTUVwMUES/C4wYz9QcTahs+pB61XesktZeEElmjWVSpMCOPhMr11B57/slZ7PYSDzdY+LotezAk0TkBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sancloud.onmicrosoft.com; s=selector2-sancloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQqx4qhosvKGtG729pocg0sdH+5z9ihJ0NTke0z6nps=;
 b=BW6OgI2a1DNIqt1NbwoloylAWDBAHa+1/lqIbyzAcHQT1Z0UxcTMB/apWaJaO5MIpus193/5nrHJFlBtVy8MwgWo3dQi0689ocKdOFaPMxA09JMtaSh5jtThVLy1B4N3J0pkM6vkjO+clK5K480Or+kHcsF4e1xAZBtywEnoZIc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sancloud.com;
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:61::19)
 by CWXP123MB4328.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:d9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Tue, 21 Dec
 2021 14:07:43 +0000
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::3c43:8733:6e6a:2c2]) by CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::3c43:8733:6e6a:2c2%5]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 14:07:43 +0000
Message-ID: <015ba052-f4ce-5eb3-4b91-5d7d9eac981b@sancloud.com>
Date: Tue, 21 Dec 2021 14:07:42 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [OE-core][PATCH 0/4] Move crate fetcher to OE_IMPORTS
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Paul Barker <paul.barker@sancloud.com>, Matt Madison <matt@madison.systems>,
 openembedded-core@lists.openembedded.org
Cc: Joshua Watt <jpewhacker@gmail.com>
References: <20211217153630.1746217-1-matt@madison.systems>
 <100ff0ce-72e1-b3b3-ff1e-2a56e0742624@sancloud.com>
 <7b0757495eff0e466dc84cb82f597e4c28256061.camel@linuxfoundation.org>
From: Paul Barker <paul.barker@sancloud.com>
In-Reply-To: 
 <7b0757495eff0e466dc84cb82f597e4c28256061.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P123CA0010.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::15) To CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:61::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d49ff7f-f86e-4e7b-c5ca-08d9c48b41ba
X-MS-TrafficTypeDiagnostic: CWXP123MB4328:EE_
X-Microsoft-Antispam-PRVS: 
	<CWXP123MB432869E23A4A98ECE6EC1DCD937C9@CWXP123MB4328.GBRP123.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	t2/UAOQbYi6xwpZvDO94/Gc7/tDk/6tpX5GTCD7K6E9d6MCgngtBS+7GYn/e+/WSyCYxDT6bhMHn6hI+O15Mu3Q2lzKcnymRL7XqQ056nMGu/WSlayjqhfFLs+Rflx3uHE2BtRA4Gw6jSvRbNfsr/Co1wjrpl1ywZkTJ+Zh/kX+wuNX85TBCj6YMWpE+iB43VVwcDSWQ42agAEzq6o1PBjZpGv2Br4KwfcplI8fAPcwbkFqKZrorbIXg16dmrE+KtKPr3HDfHifjLdjABIBBbcouQsu/IFOT4dpcJQ9PK47Iz3o7lQn887rcg5UDZfRgDBUmdptUZcYzQQxXEr7UTlBbJ2O0dXqEGctEAz8MfxIhXASCBSls1hpgpPRZvEHc4/2rtJE0nFkgVZRIIsvgxRm4GmMY9l9HduQN3slv5K69tnKGKImoTwrFcKkn7hpe4PahV9fMqm6Jem7MYhM0Aj1izjTiQ+99fSMloXWMwxc+vPGlAh+E0Rbt1LVX+/G7hNfqMWPkztSsypIYIEWDVmvdXaO02nx8wWJYS4F/7BZ+8cNQTbelx2OFaq+7GWx2akCMr/7C6oF+OlGWC/M5sEzFZ/IEN8ntURYNVFMubosm8nLkXqWjGIbERcdS/wefxkk93MkpaEVOpgtsWkaFn77qhGjIecDKuAoETigykZGUUhTVN1t9GbMBp3cIdTwK4THrjt8rv+cnwT1EKkXoDJ5R8qfRYCqnZljIblh/EstCkYVtI2vYVv3QYODlbJf0wVVWbrUWIFX1oAsIgRFlo8D+GK9qfHL/FRIhUKXMt4+qztwZC203MhVur4GY8C0U+U0vnbUXq0MxSBr/0GmnLQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(39830400003)(376002)(346002)(366004)(396003)(136003)(53546011)(8676002)(66556008)(6506007)(6486002)(66476007)(6512007)(508600001)(4001150100001)(186003)(4326008)(110136005)(316002)(66946007)(8936002)(26005)(38350700002)(36756003)(52116002)(31696002)(2616005)(44832011)(966005)(2906002)(5660300002)(83380400001)(31686004)(86362001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Ti9WZEp6TDBQRkxoRmF0RHA5NEJ1N1J2M3ZSckJrTmhJSXVsMUxwaC9rVWpi?=
 =?utf-8?B?bjRQK0JZdmxNdytBemNBWnlzSldQTDdmRzZ4MUhSeXhPdUFjdHVraW03bi90?=
 =?utf-8?B?WHVkK1Bud2xMVTBIMnZ3KyszcjN1UWJ0Skt5N1FHall1Y0U1cURRbS9iejNQ?=
 =?utf-8?B?TksvUWh4YXE4cHFDUmQzN1lyZmpEV2FtY0xFZTEvRHlXTmtZZUowcEtJLzZM?=
 =?utf-8?B?VGRHREtYeWkrU3BQTk16ZGJEM0N0ME5nbnQydzZYVlkzZlZEelVDWDU1UTVv?=
 =?utf-8?B?cWlTK1VMdkppYXVtMDZzQWhMc3JMdEd0d1FNZXR3MUk4WUN0TGJXMXNWaG9i?=
 =?utf-8?B?Sno4MmkzbzBJVUNKSkZYd04vMjU1WjdtcW5HWHovOG8wS3RTaVZEVSt3ekdS?=
 =?utf-8?B?d0MvN2s0TGJvWURhRUluUXZXZ1dhbDRtbEJ0eWdGeVZ2ZWtuL3pGVklzcm5q?=
 =?utf-8?B?dG1nbEtRLzNncnZoUlJqMjRSblVPbUtUU3VTa0RYTDdqZEtyMVcwUkpLZjVy?=
 =?utf-8?B?cTY2aUx5WmlqVGZ5ejI4b2JrVEJDNXpKaEpSMkNNVHBSNUhyZ29KbGN0RW9C?=
 =?utf-8?B?d2Y2Q1E3a08yVnN4SldvVjg3OEhacytnVmIwbjFHdDhDWk5hSk1PTXNQaUVM?=
 =?utf-8?B?bm95T3JCRGpiK09Cc1lvUVVmQ1FHUnlTK3VlWlJPZC9SYTNOZHZlVkRhcU5I?=
 =?utf-8?B?bXZ1Y2Vpa3N2Y3lNR3FpSXJUcUxrdGVWRU5oTVdPb3FaczJ1ajVBanBiSHdL?=
 =?utf-8?B?VnptUTdhNlJUcG83Q05yTXNJWDJVblBOMlNBUGVSYjRQYXhvR01RZ2cwZVN4?=
 =?utf-8?B?dWxKakxoaFZZenVRbzJrTjg4aUNwRysvVDN1SVhLVHoyemFuUVBheEkrcElj?=
 =?utf-8?B?bU5NSlozbVVCWmNuTzZzNDltS1NtZXFzcnh0QWptVUh5K2M3a3Y1cXc1cnpq?=
 =?utf-8?B?YWp4Q3VITTUyR2lGS05jQ3VVS1p1VDdlbjNvTS9PNUxXN2pjWGFTZEJFZU4y?=
 =?utf-8?B?UlA4YjVLb3JKcmxab3NsNnRia3RueEVieUg3RjE2RDNDeWNmQlAzWVpqTE5C?=
 =?utf-8?B?WHZEZ29hL3hReGkvWHZRakIvNEM5clJtQlV1S0RUSUVwOEZucURIUHhSTFU2?=
 =?utf-8?B?YUhJaWdZWXBwTUNRampxV2lNWkd4RVhBeEJuVlpBclJ4TkkvUFlkc3NpazZZ?=
 =?utf-8?B?a00raTBRRVBPR1hLZmlwcTVJd1d3cVloV0FIUFdBT21oeEhoTVV4ZzRkVEFH?=
 =?utf-8?B?VmFDaFZxMHVIWVl3dU96MnUvWHF5N3lLbzhINVhJNXRSMFY0dVZRQmhCVEpv?=
 =?utf-8?B?cEt6dnU0bktTQURUNzEzUnkxRjl0RmxndEJPei9wWUgzTENmcE5vakhENkVH?=
 =?utf-8?B?QVlWRm9IQjMreHJCVWpCYnBMekMvQTllb3dQQWR4bVlVRnBPcmdsMlB4SHJo?=
 =?utf-8?B?WWM4OXBHWWpnUlByWlE3WnZRSi9GREQ0UFJ5ZzBhSmtwNUNDdFovSUtkNVhl?=
 =?utf-8?B?S0JlOUJEdSszcGtFZE5BeFk5RjBsc013TE9NRzUzUzBudkFxNmFGZ1NDd3ZM?=
 =?utf-8?B?ZVYrQVg5YklNc3BqL3haUHhkV1VJYjZFSGEzcTJ0VlVWbVpwOHU5Nm1PWWlt?=
 =?utf-8?B?bUJQdDNzZ29yWlhFQUpXQ05MTHRLRi9Id1J6NitTb0l6V1JFMFcyTGRpRjZ6?=
 =?utf-8?B?d2Zyd0hWYzhJNWJpZUpZaTdOQzBLR0VPMDVwOXdMMVE4bk1vcFpBenBxa09K?=
 =?utf-8?B?amZucnJ4emNJbU1GRWI3aWJheXRYOEVoaFBEeU5VOWUzRkVRekIySjdHU3hz?=
 =?utf-8?B?VzV4ZDgvRjBYMGJUMUpYeTl3ME1EbHVleW1JSkxhM3k4RDJrRElPN3JTcVFk?=
 =?utf-8?B?ZmwrdGcrMUduTHRJS0p2enNmQUJnOFRpL1UveDRPSE1ZM01YczBrY3lvVXVs?=
 =?utf-8?B?NWpWb3NrUi9kTVE2Mkd3M0llK0NpNXJaK1UrWW5RUU5mQjkvY2I5NEZQUFRL?=
 =?utf-8?B?ZkwwUHEwRXhHaThHMmtCWms4b2xqcDdodHRhcDFFejRwTkxkaG1odGdrcmtj?=
 =?utf-8?B?QmZQbEZPc0JIaE5lMitaNlhmZ1RIM0J4QTh3QlpJeDNYVFZsUXo3a1p0bmNE?=
 =?utf-8?B?a0d3aWk1MHEwYXI1WEhhdUVpN05EcUgxRXNadTZ5RzhUWWRMRk1qZVliZWQ0?=
 =?utf-8?B?aCtraW9TU0xoUmhhZHNxZzV2WWttKzNwc0xyK0VMTEx4Q2NReE8ydk5JalpU?=
 =?utf-8?B?ZVVPckFJTTgvZ254K01qZmluWmh3PT0=?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4d49ff7f-f86e-4e7b-c5ca-08d9c48b41ba
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 14:07:43.2987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 840be37c-244a-450e-9bcc-2064862de1f4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 WIxVagRIxZNOobGiUgz/2dV4a/U/wCjzQ1JFL5yLHMuc04x9Frf6pk37e6CLvt7/zUDWJqsvF562SpiLKLr1BnFw/gC04JMWs8J1zHFw++I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB4328
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Dec 2021 14:07:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159920

On 20/12/2021 22:34, Richard Purdie wrote:
> On Mon, 2021-12-20 at 17:01 +0000, Paul Barker wrote:
>> On 17/12/2021 15:36, Matt Madison wrote:
>>> This patch series switches to using the OE_IMPORTS mechanism
>>> for installing the crate fetcher. This simplifies the addition
>>> and clears up issues with interactions between SRCPV and
>>> the shared-state fetching logic.
>>>
>>> Matt Madison (4):
>>>     lib/crate.py: install crate fetcher on import
>>>     base.bbclass: add crate to OE_IMPORTS
>>>     cargo_common.bbclass: remove inherit of crate-fetch
>>>     classes: remove crate-fetch.bbclass
>>>
>>>    meta/classes/base.bbclass         |  2 +-
>>>    meta/classes/cargo_common.bbclass |  2 --
>>>    meta/classes/crate-fetch.bbclass  | 28 ----------------------------
>>>    meta/lib/crate.py                 |  2 ++
>>>    4 files changed, 3 insertions(+), 31 deletions(-)
>>>    delete mode 100644 meta/classes/crate-fetch.bbclass
>>>
>>
>> Would a better solution here be to move the crate fetcher into
>> lib/bb/fetch2/ in bitbake?
> 
> I've been wondering about this too.
> 
> Does anyone remember how the fetcher lines up against the general fetcher
> requirements we have and is there a list of anything that remained to be done
> before it could be added to bitbake?

If I remember correctly, it just needed some test cases writing. The 
crate fetcher is a subclass of the wget fetcher with changes to how 
urldata is set up and how unpack is handled, so it should integrate well 
into bitbake.

Thanks,

-- 
Paul Barker
Principal Software Engineer
SanCloud Ltd

e: paul.barker@sancloud.com
w: https://sancloud.co.uk/

