Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.54])
 by mx.groups.io with SMTP id smtpd.web08.2355.1615856976997808816
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 18:09:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=PDSTSr0D;
 spf=pass (domain: windriver.com, ip: 40.107.94.54, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cvwkyXsypB1vfn00uE3/ndNnx0fLsIbWubn3+wxnUII6LQhz+rRh8iEzRU3Cscow9eC2ld/UKC7c+08sp59CMK/wPNRCXA5JpqExVoaAr8uRkSx36PDIuvZXpXqFaNWVSDwMRuWEkDaw1lhYW8fKFNug8Xzimh0zfBWw/Yk6zhsSDCriTkxkd3QmFVZT4MMhbWyZOqFxqR/kMLDCT5a/vrfQF4RH/RrhHaMaJfmJ4vrUrRaLOuLpDJNvC/6b2vDKvKNhD9BQZzgaU7KqUFRbMPR8UFWmhasAA4Y78mj1frTJXhcXayZ3XTvxb7LOhzSJL1WGMGyY0HIhs8DMEbIIIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HvW4APixv5lUEko1bBzGD716jmaHTsUAK74sMtem6c4=;
 b=irno09gqGy9l173OrH2IsGR9Bi3/SUjLdKDZFNtKjInwxDOFHRa47+lJ6adE2nNRueuPz7obpImSzJMxXzMrGRNoZcdLfitq5fWKxInMMIoMEKp140oG2ap8sQBId8NheV9k5egc7EyEeB2ekHxaeojpViCPFRAIQNO5OqubP4puKiPZR4Mz78M+R51970oKtdnmR5UA4yAK8ntNK1oECSZyYmj6+iHdQ0EWtyHYNfP1M7KOz/JpmZ12vVsZHg8327/kdEWXvCcA4Hzu849nLX2LUmMfTYucf5BQGa5F7ZPr0nRujINB+/+v+0etTVZ/O1QbMxA6062kyvumOCoReg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HvW4APixv5lUEko1bBzGD716jmaHTsUAK74sMtem6c4=;
 b=PDSTSr0DIh/jfZi+9b3OgbmHa2fZXWtFqEwgtML0hAiGsi9TuxykmeBNc7wr2IjLDw6CeC34ZBN8DpV2WEplU4fSeBrr68kIBu3NXP4SFoogecLtTs6q2QXDyAL03g1m6zS9LlfCiaLus0LOSmAqBXVfQ6xeXHQD9rK9fpzl+ac=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB1432.namprd11.prod.outlook.com (2603:10b6:910:5::22)
 by CY4PR11MB1703.namprd11.prod.outlook.com (2603:10b6:903:28::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Tue, 16 Mar
 2021 01:09:34 +0000
Received: from CY4PR11MB1432.namprd11.prod.outlook.com
 ([fe80::5575:11f2:7054:b484]) by CY4PR11MB1432.namprd11.prod.outlook.com
 ([fe80::5575:11f2:7054:b484%4]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 01:09:34 +0000
Subject: Re: [OE-core] [dunfell][PATCH] cups: use /run instead /var/run in systemd's unit file
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <166ADC759641893A.19014@lists.openembedded.org>
 <adcf7d11-13c4-f2ce-4616-eb4d961fe296@windriver.com>
 <CAOSpxdaJj9DnNL1uZHFzauXrHGRToWA-mfRpp9uhJ3c0c-T08A@mail.gmail.com>
From: "kai" <kai.kang@windriver.com>
Message-ID: <82d59c5f-4723-da9b-c22e-b8ee61965f65@windriver.com>
Date: Tue, 16 Mar 2021 09:09:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <CAOSpxdaJj9DnNL1uZHFzauXrHGRToWA-mfRpp9uhJ3c0c-T08A@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0168.apcprd02.prod.outlook.com
 (2603:1096:201:1f::28) To CY4PR11MB1432.namprd11.prod.outlook.com
 (2603:10b6:910:5::22)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by HK2PR02CA0168.apcprd02.prod.outlook.com (2603:1096:201:1f::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31 via Frontend Transport; Tue, 16 Mar 2021 01:09:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec90d821-4e79-4508-86fd-08d8e81828e9
X-MS-TrafficTypeDiagnostic: CY4PR11MB1703:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB1703B3F396156F10ABAB86E2956B9@CY4PR11MB1703.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:255;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RthmvXaAcys4lEfmdN4hPySlIgzBfle6BukdflfrYzfHk/7iVIZdm1o7i1yGZwwfYXHr3Dv06ifYLF/OiqkhVCpWfwCUVZW4SaF+mhbA1aiOJiH+q7KfHzqYKzf7WmUeIMkZqA4q+SDiCEBXqvBdp6GXYMlVV3l1zwHPgntVqZCPoyrqCr9otvoNKPlI3Gfqcmc5tLON38iURjm0euQsWzOYuHZ66oRn6EiSBQkInCNw9kdXjmHeqdHbRmKNjrqM3NrFqCaZyXJDcOwtl/ve7g1I9yvgE2DSeh5s4cbhorhlzAqxeHg/zOCR6m7Hi6U1Li3TbDl4XtCFYuJeAQRocVwLB102sJ7O2fUogv0DJTwkjviRcbO+plDRt0Bdc0eo3EjIi73Ua8FyAPRdul/i4vf38vnnuCpUr3IlPVPbivNuUziwuChf3gZgezFlGOv1jbqqswFvA0ILC3/k360XMszv1dvlqaqLn8mPczyQWWrH9iSE70CevINp8DS06oogCB8JLDuAWxg3Xh+ppY+41gdIc4TV+QqYTT126fnWR5rrESwqYZpDP9x6Vb5UmvfRAHbDy6UMezTDw5qTcZNy5ssuYn0z0rC5/hdpNTpkY+qp/LecFu0GeBKQh9+P/PJhBRGVOyOs99W/60QtLzyH6mgxu17OnXpvMEg89XRcqZ5qCjiM4+RwV0C04q2dIWoROTMWsQDbjGc/tJ9kRp50mVnKt617E+uMaD7eObtZTbVazTHgW93a20wClbE9vNiX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB1432.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(376002)(366004)(136003)(396003)(31696002)(16576012)(6486002)(478600001)(16526019)(956004)(316002)(31686004)(966005)(83380400001)(6666004)(2906002)(186003)(6916009)(66556008)(53546011)(66946007)(26005)(8676002)(36756003)(6706004)(8936002)(66476007)(5660300002)(4326008)(52116002)(86362001)(2616005)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?My9URjN2aTJwMVFuVDRYNmtXOUs0VFF1cUVaemJuRDhSekFDYnpZYWZCcWxV?=
 =?utf-8?B?WGtOYnVWQVAvcmRmS042QlluL0orZWRpSFJaMU0rSWcxL0Q1WkZjb3MraTJH?=
 =?utf-8?B?VWZuMUZqdEgrWHNtRURqRnhIOXlYNzJCZmdJV2loSjBVb2I1Q1pwVGxWZU85?=
 =?utf-8?B?WWMvRHpJbGlnMWZ4QTZ0RWJvemJxS2JtUm9HVHNTMFRRVE9XTWM1dU5ZaXBs?=
 =?utf-8?B?YXlsSmo4WGRJYUIrOUg3UGRjOWpOblR2b3M3c0MxUU5QTGNEMXY2NkVGSS9L?=
 =?utf-8?B?d1R3T256RS80NStNZWUzY0I0S3BuY2hNRWNJaXpxY2ZKNWdpbmJ3SHR4bkV6?=
 =?utf-8?B?U3c3WFBEUFBMQ1IwNElSdCtLK3NkTEt4djhROFpUR2RiNlhmeGprUTNwenlL?=
 =?utf-8?B?WEdxNGdRUWVqdkpsbXNnZWg1VWpKRHhZN2hDeGVZUGFXd2x3TG5BK0pYaW9Y?=
 =?utf-8?B?Z0ZWb3JKTzlGc3BRZHovbituZnJuRExRam9uUDZWQUJMS2NkYVpFb3h6ZE9j?=
 =?utf-8?B?djNueVFVZmVhY0t2NmVrL1dpeWFlTFNDdTBPbTFBLzlYdEx4dG1tOEpremNM?=
 =?utf-8?B?M1hDQWUzVVBuSlhUSDBPMk9SemRndWwzcDA4dXptZDRua3BoM2JBT1lKSW0r?=
 =?utf-8?B?SGltZjM5a0QxNjVyTDlMKzZyUmNpcXBpbWx2SXJmQWhYUlhPY1FjdUlBWHEv?=
 =?utf-8?B?bmtuVHNreldGOFprZlF2ZkdIU3Ivb1RWMmw3UzUwbEE5ZjZJdXdQS2pCSXZr?=
 =?utf-8?B?endHdHMxZ3dsMS83aHJWUUdFY3dSWVBDYUY5ZFliaFVENU4zMjk3TFRVOFdU?=
 =?utf-8?B?VnVMK2JxU3psenBwMC81RjA3dHl2aFdONHZyd3UzVHVlSi9XUjIyM3hNZ1hG?=
 =?utf-8?B?bGcrVTAzY0Fxa0ZRVEt1ZDhZTUdFSU1FbDBCeTVNVzNuNU11akpUN0JSZ0p3?=
 =?utf-8?B?d0loTDQzRmR6OG9IYTcrU00vVXY4RUc5T3JaRlowdndCVkZDU3lXdmthUXRB?=
 =?utf-8?B?SGdOQmg4dzJ5YTBGU2ZRZzIwQ21nSWZtamlqUUZ3SkZpcmlhYnBCVm1HQlZu?=
 =?utf-8?B?WHA3MmZGN1gvbXVxOVM1NmdsRm1KTVNNdnRVTC9FSXRpZVVHYzY2bGN5UUY0?=
 =?utf-8?B?dlVGOTlDYWVkWUVkUElnNlRaRXluMTlBeFEyRnVLSDRwYzhla21wTzU0VWkv?=
 =?utf-8?B?V1JhdXJORnUrRm1FdlRDRGZuRHhpL0hnK3ZaYTBFSE5ublBleWthTlA2SXAy?=
 =?utf-8?B?WUxKZjhjMHJ6TjM3bG45UWpiZytVdzlOYmFYeVBHeW9WT2FPVllkaEQ5U1hU?=
 =?utf-8?B?ajF0dHFCWEVYeDB3SWNkTDk5Q2I5NEFXaE9jMGpiODdNcGZrWWR1amJkbzE2?=
 =?utf-8?B?eTB4UU9Hb3BPSE04TmJsMXlwUkI4T0JSNm8xbHgxbXAxRmw3N1JBME16Vlla?=
 =?utf-8?B?WGt5cU51ZlJDUkZEWlV0OXdUUmpEVWM2Sk14MDNaZnI3MVhrKy9GNzRVRjlY?=
 =?utf-8?B?Wi9sWG1tbkdWMGlBc0JWYmNHUnlhSW5xeEZKTktKTStlNnZSbU5yNXpydm1M?=
 =?utf-8?B?SUJxUGVDV01QQjJtODRNb04wbmdHOTA5WHU0Q3EwSG53aFc3NXNCZTBQenJ2?=
 =?utf-8?B?Rk9uMjJFYVMxTjJHekZpaDR6MTEvOU83VXVhL0hFaWhMVkU2bDg1NzRXRENq?=
 =?utf-8?B?ZE5mdFNqODRiUUZoUUhNNS9hNDJjeHRaTm1HcllONUhtc2MwS0R3YTd3a1d5?=
 =?utf-8?Q?jrEFZmhlbpcNRA2XITX6YqmkpIx37NY/3U1XHao?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec90d821-4e79-4508-86fd-08d8e81828e9
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB1432.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 01:09:34.0455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MsSN0JRJHG7QMxDHxDqticgaYFXo+nN4Bn/ErqO/pt5K4kLsx1lwQf3i0oGUw32+hk4r7SifPVt1nGE7jEm3PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1703
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 3/15/21 10:31 PM, Steve Sakoman wrote:
> On Sun, Mar 14, 2021 at 3:10 PM kai <kai.kang@windriver.com> wrote:
>> On 3/10/21 11:09 AM, kai wrote:
>>
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> /var/run has been deprecated by systemd, so use /run instead,
>> as suggested by systemd.
>>
>> Ping.
> This is in the group of patches sent for review on 3/13:
>
> https://lists.openembedded.org/g/openembedded-core/message/149417

Hi Steve,

Thanks.

Kai

>
> Steve
>
>
>> [Yocto #14152]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> (cherry picked from commit 6c3f56020da7a26c2daea73e39c2f324f1f597db)
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/recipes-extended/cups/cups.inc | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
>> index 12780cf702..acad3c98c1 100644
>> --- a/meta/recipes-extended/cups/cups.inc
>> +++ b/meta/recipes-extended/cups/cups.inc
>> @@ -54,6 +54,7 @@ EXTRA_OECONF = " \
>>                  --enable-libusb \
>>                  --with-system-groups=lpadmin \
>>                  --with-cups-group=lp \
>> +               --with-domainsocket=/run/cups/cups.sock \
>>                  DSOFLAGS='${LDFLAGS}' \
>>                  "
>>
>>
>>
>>
>>
>>
>> --
>> Kai Kang
>> Wind River Linux
>>
>>
>> 
>>

-- 
Kai Kang
Wind River Linux

