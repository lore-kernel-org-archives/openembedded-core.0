Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF75C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 18:05:17 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.92.74.80])
 by mx.groups.io with SMTP id smtpd.web12.881.1645553116355687732
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 10:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=O+Q1LaTN;
 spf=pass (domain: outlook.com, ip: 40.92.74.80,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jP5hki3hwSVYhBDg7zmISEP71q3pHIUm1fHeZTsyQFkz9UoIKEj4BpS7WGXslryPIlMtwt0DwAfbxT9uGyqwdvnkwdUD+FzWcC89K/VqZEKeQ360VQBJXQ55hfkGpEib5y4byNsR/2hJsRisF+Gc9Y8IKnN4MumMEETfa5Q0bY9315jmXqlmPkv+7MM1p95f/KVPd3iRxxvVt4i8z8LJxILvG4R9Dx+2q+2sCRiV8ID8TiElVA/3D0MB9/F/pP9SXSQi9HOUkMJzov/UfTlAhC91uAlvuoloj/ndn2cZNcVRUpjawSJ1RK89ZUW1i8vtDzOridz/wcAItZkJ/sCJRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7k7TAlASgRLo1HDTiwGWYtKdtKyPq6V0gGKX4qnmYw=;
 b=esgFBLAQAhTRSlgtQNbxaUnk6Q3fwpweg6u+SDf3E9PxPZv3Q5LO5WLmJ8ki3fE6gNIC4JPNC4pDN4+KwlRBeX+IRKC75EqTzDaZIYGbozQ5VNpcY/nMPlBInBMoZDWN0G50MIULyUtOhrbA9e5SRqj3OWhML+LR9D8IZ60i8mIyCf5skVsW43GhkqMe2/FCHlwCdWVCCh5FnrijTKAMJau0mBcMcS8pxUmD92ryANY97zUAjyCL3TRDOcXlwJgtCZlFI1Qk1zGjclenAdBqlnO1rd6VHy9A9EDC4Q4/E/iF1+FOi6P6ndpyYoMxNrtASBxhsTkRSXPMAwc+vieKVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7k7TAlASgRLo1HDTiwGWYtKdtKyPq6V0gGKX4qnmYw=;
 b=O+Q1LaTNdt25vQQeK9efoAYJY60JQgQIMfGqDn04jf0IbqgmqQynOLo4vDcX8RUy0p8y0Ga7xBCc3etoDfaePrWdtKbBJ4ruzJIxP1Bxa4Sev6iaZF9teg5qg4Y6HJGyxObsnYyYc516vkoEiWcMUUIQL3DlIkIzqvgziMkWYWK567waDra8ZeMq38QovbBg7U9x711k8T+zvGjlknoGphBpE6QCOczXTMwTDZD4UuhXzZo0MZNtrmLwwyW3ZR1gL+AGNjonhgr4m9TEDkUXNyi0fsbLHBS3QqEIa5Anz9eBebztym2LsLq+f0pt8CmNhZ3cjtric+y9st1E3LZTfA==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by PR2PR09MB3195.eurprd09.prod.outlook.com (2603:10a6:101:20::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.22; Tue, 22 Feb
 2022 18:05:12 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b%6]) with mapi id 15.20.5017.021; Tue, 22 Feb 2022
 18:05:12 +0000
Message-ID: 
 <AM9PR09MB4642A723872DB3B5FAA8653BA83B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Tue, 22 Feb 2022 19:05:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH][RFC] cve-check: add lockfile to task
Content-Language: en-US
To: Ross Burton <ross@burtonini.com>
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>,
 openembedded-core@lists.openembedded.org
References: <16C7F41596656732.11018@lists.openembedded.org>
 <AM9PR09MB464246FE3202004DD91EB054A84D9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CANp-EDbCpBLQ6t8SKwu9k50imsBM9oeOBBfuRXHdnKg3P=7SZQ@mail.gmail.com>
 <AM9PR09MB46422A261797175C38175112A83B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CAAnfSTvup472badm4syJMSu5z4VpkJVsMdVNHNouxyTR6iC3Fg@mail.gmail.com>
From: Konrad Weihmann <kweihmann@outlook.com>
In-Reply-To: 
 <CAAnfSTvup472badm4syJMSu5z4VpkJVsMdVNHNouxyTR6iC3Fg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [aXocxCNmt54Ps1L3n7tjn1GS66wMBXYgrorVrXu7IRyZwsitwVew5xAwqHOQxkWX]
X-ClientProxiedBy: FR0P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::22) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <9118d5af-ee1b-5b01-daec-291d1457a34c@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ed77d16-665f-4d72-0781-08d9f62ddefe
X-MS-TrafficTypeDiagnostic: PR2PR09MB3195:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	luwdDIhzUCnQjawC2lbGZPBVyVN4syeFVjCIvwrVHw78J+WK/wDrnut+vd0OVJNERZd0iR/y0IW0cLeQNy51sHNhbPeBrVLVUegIkJtKNH29cmSLG7q7JWdNVP2GhmL4bW4zJpsVwxKEmCl1Tns7L+3Xl5z8kLy3ofK1Lz05vvt3bR5iy7J57IJ6wEDDVpHsUm1V5iZGT4f0RiG2bfHEAqb+X+kuYyP5k0JmP1DXsEYjukTRjHxPoxdpQffmxrlDktmD6dTyKBJGeATzKXrH1jVucGILamFP7+1xYo5tpT9tsWRCy3cI2IRazIj45Ho+OqCnf5aHwtHrU2/fIESfHx9d92/ucW3znK6+d759VxozVGNu8C2Yu1ohJf9gqo1dePkWuCuiomX/MMILEkHy+T358WzhrmiHQJyQ/NdOalE/r+K4wuLbVg/oF6EmdvZn0xt+VTymYYcsgWhcjU56/P9NQS1Fxeg/MicmqEvp24sc7XhRDL+n3uTvCMlqYkMGmtWY2C3G81ftgjxD9NXHUcWUFSIjc4YU5rL/4AscYFEIDAuDA68jEzPRx+yqE4TZe6y0UUgj6uEZng+/gQ7p/g==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c1lLU3ZwMVdkd1NFWlZta2tZOS8ySW1aUXpuSEJyZ3JKZTZYaHVZNzRKU2V6?=
 =?utf-8?B?ZW9QdlZCNnF1bTFObC9yUTdQT3AyQU1UZHlPeThTZ0V1VnQzdm5jNEJPbiti?=
 =?utf-8?B?MCtueitjaFp2VXh3WXZ2eE5ESXQxL2VqL1BhOGJBcmdieUo0elpWSW1ORkVx?=
 =?utf-8?B?aVhkdnl2MVhUTTJlT0tzcUV2eC8wbjQ0eW45a1dIVS90aHJudTBsRHU0NkxN?=
 =?utf-8?B?Q1BTQ09GeEU4Y05wQ0IyckJpS0g2NDlDT0xhOWxTTjVQYWhoaDhhZ3J6VHdm?=
 =?utf-8?B?WkloNGQ0ejk0aEJZQTh0UEhnc3BQT3dVbWpodThLcEliSnpPaDhCb1ozM3JB?=
 =?utf-8?B?N2FwVTdxWjVxang3NVZrVzVScGFoSWlPRlhPNGhIeHdMVzU4VEZXVkVTR1Ix?=
 =?utf-8?B?L0orYXJzZ2ZFRUtqOWlUS3VwUkxJU1IvQXRTV1VsZzZaYVNUVHhpZ0IrOXZl?=
 =?utf-8?B?aGU2OWVESnhTSFEydFVrM0Z6Y2tqKzF3aHBHNnRoMkU0ZmljN1FhaCttdFVw?=
 =?utf-8?B?MlJwaTh6aklwWlY1NTVyR2FTNzFtcmhXYUZDcm11amRWRVJJT1hoUm94d2Jv?=
 =?utf-8?B?dFRhN3JhNlYrL2VmTGNVSVVkWWM1a2FVR3VQNlZ3ODd5NXZ1eWpQTkhjNmhC?=
 =?utf-8?B?SU03T1lDRFZjMGF4VU9EWGV2UTVzWDcyVVNZblFrUW9LUFNMc1p2V0FLSWFB?=
 =?utf-8?B?ZXZNelZzaWhnanQ1RVhJaTJYTGVBejdPbDMxZU1tdzBySWUycFhEdjNsd1kw?=
 =?utf-8?B?dzlJeUZzcSs2cU5rUnh5N0tkc1dDVS9NaWgrQnZnWE5MUUlOUFRlcTFnYWxZ?=
 =?utf-8?B?MnpGWGFrNFZDcWRJOHpwVXNCUnZjL25TVzY2cHdPL094SE45azAzR09oS1FQ?=
 =?utf-8?B?RGNQZ1NOQmZwaHVQLzNKdkdDTU9Za1dPRmV3VnZ4MmpjUXI1VENIeWVGY3JX?=
 =?utf-8?B?bkYzdTVzbHRPeW03RGpUNVdXbkZycHpPMjZnb2RZQ0FZbjRzTVkrSkhwMWdE?=
 =?utf-8?B?WllnczJoWGJxcCs2ZkY3RU5uRHF5YzNmQ2FqbUo0TE40aHVjbStMOHNDb2s0?=
 =?utf-8?B?ekhmazY3N3FoMjhJWDdvY2ZaTnZHUWZsQ2hIQ0syOEFKa0ZkSmRseVgxZmZD?=
 =?utf-8?B?bG1ZUXk5cTZPcGdaRmNVY1J5QXZ0aVVFRUxxdm9sdVQvbHV4THVOVS9EWU15?=
 =?utf-8?B?dzNXMUlvbmhmS3ZVbytpRWNxbm8yMzVFaGhEWnYwbE9iSmxRL3RjZjRUUCtk?=
 =?utf-8?B?UzdMT0V0c3Y2MENtR3AxNDBRZWxCSmluM211WkVSMFVkWjQxQ2ExMXpxN2RS?=
 =?utf-8?B?bnZyNkRtUVFpZ2NlSGlOaFR5ZDgvQzVIS1Faa2U4WXR4OXRxRk5UZm5CSnpD?=
 =?utf-8?B?NWNra0kwNHlnOHc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1ed77d16-665f-4d72-0781-08d9f62ddefe
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 18:05:12.6974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR09MB3195
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 18:05:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162183



On 22.02.22 18:50, Ross Burton wrote:
> On Tue, 22 Feb 2022 at 17:01, Konrad Weihmann <kweihmann@outlook.com> wrote:
>> This is somehow expected from my side tbh - as the lock file disables
>> any kind of parallelism - so just one instance of cve-check-task can run
>> at a time.
>> One thing that came to my mind is to move the created CVE_CHECK-sqlite
>> db into the recipe-sysroot before running the task (currently it resides
>> in DL_DIR), so each task would run on its own copy of the db - that
>> would avoid having multiple access call to the same file while enabling
>> us to remove the arbitrary task lock.
> 
> Hang on - surely the cve_check tasks are read-only, so why do we need
> to lock the database?
> 
> Ross

TBH I don't know - I (and Ralph confirmed that) see occasionally this 
error from the original patch.
As I mentioned I lack the experience with sqlite to get to the bottom of 
it - all I can say is that since the task lock had been merged I'm error 
free in all the pipelines I monitor

