Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6ADDC433F5
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 07:45:32 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.46])
 by mx.groups.io with SMTP id smtpd.web12.9230.1638949524056106201
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 23:45:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=B0Cp/6+N;
 spf=pass (domain: weidmueller.com, ip: 40.107.21.46,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bpDxnlSHpaf00BiZkEGjOK1x1zpJqIfu1wRFKrL0VaXWkDbPRQHe+3zy8B5rP1xjLLX9xCB5ssEa5M2FLbNI0rK+n6NI8H72XYVBdn1SZwZSdF0ESc0M1m9ZkVrSTOh3Anit+1Z2z4i9C6otoQPdlPD/O7icRBXtZSDlBZpb3C2NKoG4N9AGxMmfgIzcyTy5CeX2d06sVLZhem5iNbAYD98boD1kTS0DR065qxUqZNAky1v0OGbUY/CX8QIpOkxeNte3BbCIh+B1FRd6V5ap5w9ramw/j2WBk3IGXmKvqmFeG8lVQENw8tlmon/T6UtFuX4DeneUpqJFQiQMUca78Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3xITnsCU1753SaS6Vt7YXPblDwolc7AQuHIFVkFB17U=;
 b=BOyjSS9/WY4NuA1/Ptwrk7m9uDENhlr6mgc/e4qirFTPsHhVWX46hiUi26SGNPwdnMDnqwO8SCaWWqjnKi670MtDfSihsQTIl3MMqyykQmV6WYgi+zCOWrIUquZXecW+a1ImL/OEE0jSD0cqqPNd+ihn0te92s83AXKGOXVIrl1W6Zg4tP5JfqtLJVZvg412tkt7KpIMxbuB7RPRQf5E+SRsRb3fEpcxK8w7vjRufs3sg+8FpVQwX4U06CPIttRbkdKSqWgPMoZbkKuvIFuTTgrM9UB4ol9RXOWCGnyIllj7ylpkB6i4hbh+UWXoGRglxYu+1iXvmHIU4HcxvaYLsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xITnsCU1753SaS6Vt7YXPblDwolc7AQuHIFVkFB17U=;
 b=B0Cp/6+N0cO4hjRMLr+790nmfi6wK6Y+n0mYiadATPGSDd6tXqfGR2IAyX6hDYKsX8qJkPIpfF452ecjxjVbLCv+5r9TKaG2jartMtFNa5hKWgMiEfp438n0dTx0exJ/VhPikrBj6vrE8fx2kyvb/vXKbBMxc+ln0D5+H63RFcU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PAXPR08MB6606.eurprd08.prod.outlook.com (2603:10a6:102:157::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.25; Wed, 8 Dec
 2021 07:45:20 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%8]) with mapi id 15.20.4734.024; Wed, 8 Dec 2021
 07:45:20 +0000
Message-ID: <3cda9bd5-1c75-7269-921c-97c1ac6c4fb5@weidmueller.com>
Date: Wed, 8 Dec 2021 08:45:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [OE-core] [PATCH 1/4] recipetool: Set master branch only as
 fallback
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20211206080406.3249-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <9dd70fe87463e8d9cfa9cb0c612ecbc7bd150b7d.camel@linuxfoundation.org>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <9dd70fe87463e8d9cfa9cb0c612ecbc7bd150b7d.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0139.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::24) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from [192.168.178.36] (94.134.181.94) by
 AS8PR04CA0139.eurprd04.prod.outlook.com (2603:10a6:20b:127::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Wed, 8 Dec 2021 07:45:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb4b2039-36ef-4721-acaa-08d9ba1eaf7d
X-MS-TrafficTypeDiagnostic: PAXPR08MB6606:EE_
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB66063A315CE850C1418A6834D76F9@PAXPR08MB6606.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ne2KMrpLmClNtYlNqvTV+TdmY4cIUWmw9Xh23xpNOF32DeNkqnXI6hMnMRea8YUyIdV2szXZqVZtqjPV4GuEYY2Sbw9TuvqP6vbUoNRKxipEe/f6emTcgIHIaRX+xh8WB5QAvts79/Pfq6Y74Y9QVw0lT8+uVf33gFtRcjJDcqvQIni2Yordtl4yiDCrX8DKo/s1e1q4GzbzDHStyaE7ZkY0MdpQmGy0dZNZQF6whesV8CcBSqOZhDutqamOZPt2unKbFinI5p3bfHXCr1GIBZINCp7U3fk4PopunU1cCxaZwS0awe/aOhRb1QXqpcNdvKxAxub9xwmfIlMbJEjUy/DRZMjO0rH+ZR6gGcg0pjOwCTEbi4ELXml47C1DpS3oMORRlnZx6KzAWUL2/Mz8VtuARfHI9xAzTlfGHCURGaFcI5kWc/jidRBjrUrRHz/LKoueCpOj4JseONHiZ9FTKPS8D38WKMHCDiP7mCA5LtOoHatUcCTCPoxYjmuamKBKWgVK1h8/d7N2qmNW2L3wM0tH/S+CP95mGzH3k/Y5U1TyJBrmc51qbvRGG4H95xjxREXiH0vg9ekbvwC6t+fzL9lBhoPBT9MFKS8OiHk5e5P/Zh6rwmYafKBqnG7NMhF/Hj1tTx25z0sRzMgRFf7FoWajAjOuVVIOvx53UUNegnxXaRKq3yGTPPaNETw75pQXEmJC7vLw68sF0zzWcGRKIsnMhz0rzxB7hPoS8xe/zUafAH2pIvFtRMi9c6a1/bLPVFm9S7bpFA0Tb7tC76/91+nw4/9n7cfHAQZKmGWLNRRRLqeKeH1PtklPAt1R1YjY52dEFWyFMSSCZWZGPNrITw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(966005)(107886003)(38100700002)(16576012)(38350700002)(66946007)(8936002)(316002)(4326008)(5660300002)(2616005)(66476007)(2906002)(86362001)(8676002)(26005)(31696002)(36756003)(186003)(83380400001)(66556008)(508600001)(956004)(31686004)(6486002)(52116002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dVliQ2VhYVpVb0l0cUpHdER2bDdrMEJLT1JWNFJobUJ4cmxnRWg0aktEb2tE?=
 =?utf-8?B?eXNQd3NPdUlBMWlZMFNrNDNXTi8rZGVEL0NNNDVvc2Y2VXlrTTcxVUYzQWZY?=
 =?utf-8?B?Zm9VTitLajJ4bHN2TFhnQmVDTjZIWkZ4OS9UOFBCWWFmSXM2T25TNEg4d2hz?=
 =?utf-8?B?U0F0cCtsV0FJVHBJM2ZxdEFDTTQzMWFESHIxY05Hd28xTDF4M0d6R0pocWdL?=
 =?utf-8?B?eGpXLzA3YStQMVh5TFQ1ZjlPZU9TU1ZGOG9FTlBGYXlnTE1weng1T3ArdkJ0?=
 =?utf-8?B?UTFJdVlJM0FXY0RQc2xjTjFSalVzWFE1RXJWZzFpNFdKMmZ5VGFINmFCK1l0?=
 =?utf-8?B?OUJqcnhQRUUyUTVZa09xMjk2RTByMkY0bEoyM245WENOVlMrQWFBcC9uL1la?=
 =?utf-8?B?amtnZkMwMi9SbklTMnI2Vmc3VTdpaUw0N1VlMkM1OVZpRW84VVdaMWQzclBK?=
 =?utf-8?B?aDdNTHdNcGpIemJKdW5DNEh6S0FJeGttY29LSENaSU9ZREIxTGRPUXVoUWlu?=
 =?utf-8?B?MXJjUDhFZlJXRkdZK3dlbW1UZ3JxanJxS1hzdUZqdmI3d1o5R3ZiQS82SmtB?=
 =?utf-8?B?VHY5TWhZUHVFSzZiMFBPRFUxYnplNDV4cmxzSE8vbU1Qd2hDcitRVE8ySkhS?=
 =?utf-8?B?QUIwLzBhYS9oSXpOZGZOWDY4ZkJvSG9WSEZmNDJkdGcwMTVlR3l2bmQ4NHo1?=
 =?utf-8?B?c1BERUcwb0FnTFNlMmhoUUZZN08wZTZRRU5SQ2ZRTldWVTIvQjM1RjdVQXlN?=
 =?utf-8?B?dlZpc2xQSFV0TjVBazdNVG81Vm50a0dFVFdyVGJuTDlUaXVuVExaZzVCaE0y?=
 =?utf-8?B?WlA0eFNSYXdnRG1yYnJMdndsRklNV0Nka2I5WFRCVlc5dmZJa24yZStYUk5I?=
 =?utf-8?B?MUxXYW1qR0JDYVE4OGpCeTFFOHFBQmtFM2JhVkJ6M3ozNzY0QjAybytwakJN?=
 =?utf-8?B?cEE2ZGc2empZVTRPck1pUzJNaElseWtZbHUxeGJOR0VZVkd4NlpjaWE5RG5H?=
 =?utf-8?B?Qm1VS09aZEV1b2IxaWs5dnA4QVhKUTRoWUtkOFJKbWxZcE5kMllRN04rL2tq?=
 =?utf-8?B?OVoxOC9xRHRFVFhkZlZJcG5CZ3JSeWJocy9DeDhnNy9OZkhTcUhoS2xUcEdk?=
 =?utf-8?B?OU1WVGJlV1BCV2lsZXl5L0tuWEg2bDhlc0NWZjA0a1VnQWZpZWx1S0tQZ0NV?=
 =?utf-8?B?Nm1TZ095TXJvU0FoYTFTcGlpL0ZwcUdFMmcrWWMrQjRKK0JRcVNZZElyOFgv?=
 =?utf-8?B?WTlocnhzS2g5ZmpGN3EwOUJkTFN4Yk55d2NDMkNCQkpjQi9QNVZyYi95ZXBM?=
 =?utf-8?B?YTFqdTlWY01BanQxQmZ1V0VlakNiUFhxeHh2TTg4ZW0zTzFxaldkQ2N0amtW?=
 =?utf-8?B?ZWovWE8vMUsvSG93QWNGSHVoSE1HU09kQUdBS0Z4YlU4YWEvSzZ0Sk5uU1Zi?=
 =?utf-8?B?S1I2di9xNk1Ld05CRVhZMktSOW1OcWdYM3NQQ2dVWXQzb3FvREYxWEk5VStm?=
 =?utf-8?B?N0Y2K1lWclRjS0dNbkFJMVJEclJMYi9qL0xBNzVYWHo2UWRlYWk2bkNacnY2?=
 =?utf-8?B?NHppQWpQWHBpSU1oUlBNTW5GdjJjL2RNOTdrNGJTcmJjNS9IMGIyb3hkM1o5?=
 =?utf-8?B?TjdTWHNqei9SK2lJc2RubGNMYTl5U0RicnN1YzhFOUVCdDhOUWZ2K1NIOFVU?=
 =?utf-8?B?bi9Pek9DT2JXd1A1OWVrUHFzZi9yVU5DUm1iNUR3Y2dIeFA2S29TYURSZHVo?=
 =?utf-8?B?VTFhSXRwdGIyRkttN0ZpQnZuWUk3V1VUMkcvQmQ0MnJ5bkkza0pKaVpZR2ZV?=
 =?utf-8?B?WWQ1YkhIMG1jSHNsMnBrUVZVQXVuOFIxWElvc0hTeDR1L1VlVkQwd3JMZWZz?=
 =?utf-8?B?OGRvaWhoSnNUQjNDajNtbHA3NTE5U25VM0syVjlmb2oxSzczaVl1a3R6dHgr?=
 =?utf-8?B?U3dhMXpsZHdvaU8wamMzWitpQStOblhhaXhiaUNIQTdWbWNwSExhQmROSmVo?=
 =?utf-8?B?K2VLVzdyWElVS2ZBNTBhTkRYM0lNbE9JUTVUMXVHWWIvR25URFFwQWNBVnEr?=
 =?utf-8?B?UmRKR09pSFdFR2pTR1VIbE83dkQ2S1grbjE5OXd4a1lUNU8wUWJ3VHBlWmU2?=
 =?utf-8?B?TkZicDF5Wi9zZk1vb3NWeDl0SXBWLzg3OFF3WHdmZEJWTS9GdGZmWUxpQmRU?=
 =?utf-8?Q?vYFsWLUG55GK1UmXbGVDZQY=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fb4b2039-36ef-4721-acaa-08d9ba1eaf7d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 07:45:20.6864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 X1Qf97Vf7bqpaAXqOa/4cDTeuCeRrVrkfrFn5YhWo20W8woklvbV0a4L1a+Yhp0zNAMTy2H+b73/bcqoBMHzTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6606
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 07:45:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159341

Hi Richard,

Am 07.12.2021 um 16:45 schrieb Richard Purdie:
> On Mon, 2021-12-06 at 09:04 +0100, Stefan Herbrechtsmeier wrote:
>> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>>
>> The commit 'meta/scripts: Manual git url branch additions (dc53fe75cc)'
>> sets the branch= parameter too early to master and thereby breaks the
>> -B/--srcbranch option.
>>
>> ERROR: branch= parameter and -B/--srcbranch option cannot both be specified - use one or the other
>>
>> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>> ---
>>
>>   scripts/lib/recipetool/create.py | 15 +++++++--------
>>   1 file changed, 7 insertions(+), 8 deletions(-)
> 
> I think something in this series is causing:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/2926/steps/14/logs/stdio

Sorry I missed the adaption of the test test_devtool_add_fetch_git. It 
doesn't expect a "branch=master" which is wrong.

- gitsm://git.yoctoproject.org/mraa;branch=master
?                                  --------------
+ gitsm://git.yoctoproject.org/mraa

I will update my patch series but need some time to test it locally. The 
devtool test build a lot of recipe on every run because it use a private 
sstate cache. How does the autobuilder overcome this problem?

> 
> (the other selftest builds also failed)
What do you mean by this?

Regards
   Stefan

