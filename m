Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF8BC5CFC1
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 11:15:27 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52227.1786446921670166351
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 04:15:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=uIoytfKH;
 spf=pass (domain: est.tech, ip: 40.107.162.38, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d8t0pHc5FRGIXgORjjNrovl3Zw38ei0+aHBwVTC3N6nkJxww5ntP6XD1AGVmjItOzyVPPvof6LsuGT0jujiqyQyvNp5DJK22MWUNqYj8Pq28I5tLiNQLyE4Oe94VnKSSB78Y2NYGHMD2+208dB75+mLfOAKCUDAEcpg4gUrgj43XpaT4WFUe0+aRCNVtHfGxJLX2nPSOZxKpGNoK8tcAHqokUEHeXkHqwf/0brshws4PNofAOjDUZGsCsZzewlAu5wm3IXy0u27kD19N4WFdoFpOTOXB1yeptht+Q6NnRitoQbknBrnuWAPH8O5Du+hWKQvZBSfK20d99Bq0UW+u3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMvX/uGki81OgyTcmJ9hZIXaeeXZuGOfeBngoXSfoE4=;
 b=rZf855tCfcDBnahMDVls24YXQHTk6b3Mb53sLjJknXqRLsmqYmS0+iI6nT4VWhGI0JahQ7KDdgxwfI5xiEOaDk9pwBNkEekhhTqvahYicUM9OIxk1nk6o8+vAWkpSyAIicxarIhJb236BmKpZFOSQz7MLyuSC8nd/Qxqe+1l31EdpyTUseFXW6+bVocqhV7gjW+7W9WwQJxattMIlLVOfIEnSF72XB8M72aDq61FfJrgoJ9wsr6KM0vya8z7pB0/VgxQVJ6yAOqLns6JTHszkC7O7QFscdtlDgr0xsI1uC2awicZxnjgCvuEhyzzAKPmth18HavDoQWoNayIkrmyIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMvX/uGki81OgyTcmJ9hZIXaeeXZuGOfeBngoXSfoE4=;
 b=uIoytfKH/dIYCEQQBE1+zJYsFQBclHrowDbBbSNBuJUpGVxb1SCgrW1+LWXA0Vd1h96dDrrIplWnomeqMma5xWF262j18UeMgVDVe+f5nN/6hRlBC3eSkqOo9/VdM+sJnsc10m1ZyZJSFLphY6dKBWOlIT9sWNDChXouDFxjxyFz1a3JJEXxj/lm0OsDDWkJ8TdCZDe5wHD2N5oIh7x1id8nLm46dxzQbn9qPbI8ABA1TcPhoOZeM/zcMneyI0eM5wfWAwpD4PfI6nK/6t7k3Rk39FiAnecAiWiaa0r7uYiLyoPiNb4DsrSvt1xfHIPF6UMfwGElIHbWZ9Njneyamw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PA1P189MB2695.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:449::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 11:15:15 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.008; Tue, 11 Aug 2026
 11:15:15 +0000
Content-Type: multipart/alternative;
 boundary="------------Pub8wFFaUpck99gM0nTAiowL"
Message-ID: <f012bd8b-154a-43db-84e4-37ebd361a4fe@est.tech>
Date: Tue, 11 Aug 2026 13:15:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 1/2] swig: upgrade 4.4.1 -> 4.5.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20260810154520.12466-1-jaipaul.cheernam@est.tech>
 <20260811061251.14757-1-jaipaul.cheernam@est.tech>
 <20260811061251.14757-2-jaipaul.cheernam@est.tech>
 <61f96793beba861118dc9502be1590176dfef6af.camel@linuxfoundation.org>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <61f96793beba861118dc9502be1590176dfef6af.camel@linuxfoundation.org>
X-ClientProxiedBy: DU2PR04CA0221.eurprd04.prod.outlook.com
 (2603:10a6:10:2b1::16) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PA1P189MB2695:EE_
X-MS-Office365-Filtering-Correlation-Id: b9bce5de-ff56-403b-4310-08def799d1a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|11063799006|56012099006|10067099003|6133799003|22082099003|18002099003|4143699003|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	LWmVgicZcj0pt+dvY8AcZtAVkKQwbSuKXKhS4zBkt7RDbh+Zx0ZmK0n7TcHRuih6mHEkgcdo2YdhCicoi7+7Qw0bK9anQv6juGDtGXbFwYtav7QWsOEWFSBmIAI+Yi1/ild7tTSLxrJdd9FlH+fewGEhQYzboVXke0d/RbF7bkBjmZ5DXfp6lYbtt8mvfyzLOWUTcE1+vfn/Xc1y2I9W5JGN6oO9d0r68np4FVeydvZ5UpmKXFOJDptcnRmP2JQv9Gj1octPvK85dnDBxaytQzDP4D0/zNcKoQpS5/okTkfSJISagjOin6NEGYM/AWRKkRtrslQHyxLHLHokuYpfC6BWVgOlPDP1pjFK50VLH7RMG7P3Oj8VBt5sYXlzO9qgVQZjAHTAanwW/D1COS8u8ru7rdmbKLU976WxZDFDVHVNC7Ar5CAxVPZ8HcpKcHR36ctevsyGJYQTDjddzpDu//+4Gm4WpTzZwqwmNUFnC1Il2S60Ana9Vlr072XTMsq1Uie1SYmFWmMfYf7SutmifB/fX/iBWxzfPdj4YjVwGteumL1/8pU1zTHeQsolY9OxTC1ADohDGqg9T8doVXdSLzCrrEhUMWdliB/cCWteyzg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(11063799006)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(4143699003)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dFNIeS9QMjZldDgwTjlqT2hSS1FBU2phTnZBSDRKQ0h0SDNxNjdnNmczYzN2?=
 =?utf-8?B?WC9zVHV5a1lKZ29UZlEwVmIwMi8wNTdtakxsUDVYNHV6SXBUajFMRDBBTjRM?=
 =?utf-8?B?c1huVVo5YUFBVm9QYXdpdm9WSXBHcW1YMDZ3VEJiS3dodnJkMGllNzFBM0Zp?=
 =?utf-8?B?dUxNZForMTBmSHpGNFBGenU4bEN1Vm8rRVo1M2p4SGVXbjlnZk42L256cTRH?=
 =?utf-8?B?anNuWDcwbnJMb3ZQMFZpaTdFak9tdGYxT0h6SlRkM05aNHhoUnBYUnJJVFVT?=
 =?utf-8?B?WXQ2OUhyNXFVam1sYy9sTEh5eXprOS9qVTU1ZEI5ZjM2TVNmaTd6b1VQbGlr?=
 =?utf-8?B?M2R2M0NDOHJneCtaRDBWM3ovV3d3ODN3WXJZK3BlV1ZTb2RJUzc0Um1pWFZ3?=
 =?utf-8?B?SjUwTlZ3dm1JVE53eWt0VzVvV0pGamNmOXBhRmVEUWYxQUxVemdaVnp2RFdl?=
 =?utf-8?B?TWt3dG9NYWhuQlUzUnhRa1orSG5FcXkvcXBZYmUvb2pLQ2ROSkRrc054TGlF?=
 =?utf-8?B?Nm5TMnRrK3l1WGdvWlQzVXl2Y255T2l2cFBrOG4xQi9sN2FyMTJmNzJ1eGxJ?=
 =?utf-8?B?WVE0Y01pKzNPb0NVZjQ0Tk4vT3FqMEpaQmVWenRLQVQ0L0dIdjZZaVhrVU1E?=
 =?utf-8?B?K3lZQ1VTeVhncVJWNGorZnVhNHpJYVY5UGVqbWFaUXF4OXkvbWJibVFIZWRp?=
 =?utf-8?B?NEhabUNMdGtmaUE4L0xOeXVEQk9PdFlOZ1FWNW8wblplQ1FTOVpVZHp6WmtT?=
 =?utf-8?B?WUFMbjdBc2xIRGd3TVNqQ0dwQUxybEZ0b0pIZjRUWHBkS09Wam44ZDFRdDZC?=
 =?utf-8?B?aVpzV2FtR1pvUktPdWJ0UjE5SStBT1JvSFpKd1U4Q1FPaTJKdXE4YWVrU01K?=
 =?utf-8?B?WXorNGs4cHZUV1BYYXI3Wm5pczhGSEhrTHB0NFlSalhmTWlFOGw3K0oxeE1E?=
 =?utf-8?B?YmNRd3kyd2pKZlJPN01PMlN5Yk1wZXQvNTFud0hLMWhtR0NoV3l0TjJCRlZp?=
 =?utf-8?B?UHY1cHpFRUcxK21Ecnc4ODIvbUtPeXQrSDlTWFNmQkpYd1FWQjM4b2c1MDhq?=
 =?utf-8?B?WmVWSnhseU96S0JuVjJlRTZHTGdTS1V6Q09jL1diTVN2dEVvVVZQb3NSdlVi?=
 =?utf-8?B?b1Ezdk5SWit6TGlVakNTdmcrS1JLT2ZzTTR6TkV4M0NvUHRDdDRQbm9sWTZm?=
 =?utf-8?B?TWpZK2FnTlpOYlM4dW9CQzFQeFo0QndqZm5lMkpzRmFpTlROa0owSUJPaWZE?=
 =?utf-8?B?NkN1U3BWa2dFa1JFeDkzRG9KbnYzZFlrK0RXZFl6Z250R3krbDUwM2Z0WDBy?=
 =?utf-8?B?c1h0eUgydi9pdjNZYjl0L2oxR3Znd1dRT0d4d25oQjJBQSsxcVFJMFhVRzJD?=
 =?utf-8?B?TW0wNy9qTmVlckVZeFZYRjcxdHRzNDk0djFhTjhtSW9Lc1luOUVKcnk2Wm4z?=
 =?utf-8?B?YUF3c0dkcEs3QVVNdEFsSXJoamxqTkh4UzJPOFIwRTRFT1lsM1ByOHk0eXE4?=
 =?utf-8?B?Kytlb1N1Yy9jVFoxTTRvVUQyWmYzYTQ0eGRSSHhmQmk5eEd6aktIUjdVOFVW?=
 =?utf-8?B?RE5WbHRTaUtaQ250VjVDcGw5ajVKc0dqNVh0UnVReE5mcnhFUmFYUXlGY1lw?=
 =?utf-8?B?R1dWNGFMWWhhZytzRGMwTGM4UDQ4a0cvakZYaHdnQkxpRGIyejMvb0pxbWpz?=
 =?utf-8?B?Zm1VOUtNaDRvUXNqTzhLQ1FpOW40V0xiTU5uRTBHU2ZzSDR0cTdWUmo2aS9G?=
 =?utf-8?B?SnJiNDlQT0tDdXdOS2VsTWhSK3dWN0FqL0t6ZjU5eFE0cUh5WkNlZXdTY2hW?=
 =?utf-8?B?ZWZSWXJDY2t0VTBaUUMwQXcvQXBsM1EyQzRBQW9JUG5YTTQ0TGwwN0tPZlNZ?=
 =?utf-8?B?cTJkOC9Fb1FzMEhRVlg0eWtqUnN3RHBzQnN4OUJVcHJndGRVZnowK2tXT0VL?=
 =?utf-8?B?ZW1scUwvYXdSUzhBbHBaRzc3TFl4U0tIK1ZRdkxnSFBtK0xMbDk0bllMTXlC?=
 =?utf-8?B?L0hvVW5FUE9pYVk1dlhvLzYxdk9HaFBDWXE2K3F3RERiRlFzVXY5a290Ulpn?=
 =?utf-8?B?MTA3TFFvVHdhYlhod1MzVEdMdHU2OWU4Y1NxVm1ETkF0U3pheTA2aWdwY0x3?=
 =?utf-8?B?Z0xBRW9ncjBrZ0YxeXpGOUExcSt1MzUxYU9vZmt0RUNHUEU0NmtQSzRxU3pN?=
 =?utf-8?B?K1dpL3VxSGJuKzAvMHQ3bDFRS3dHRmR0QXNhQ29nMHpTdXg2M3czTG1qRzdE?=
 =?utf-8?B?L3dyUDV2cFpPb1RLaTJad1daQ0xxMFAza1JZR2NjY0U3b1VVVDVjZXE2SG5H?=
 =?utf-8?B?NWhhUWlWVXFLVnYrTDFzVis5MlJMSko1MGNIOEwzS1pIVTcvSU05eFVFTVp0?=
 =?utf-8?Q?3onKvOjdZtapNEkQ=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b9bce5de-ff56-403b-4310-08def799d1a2
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 11:15:15.3442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZlpohaDwjhy19P4aCctzk04qz195TnW8W/6L80ity+JKA0wMSqpeVR6eaQ/vioOqXzH6y2Gk5bPNBEu1bOexO97kuhRE/rI55HtYBAO0cA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB2695
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 11:15:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243192

--------------Pub8wFFaUpck99gM0nTAiowL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Richard,

I will send v3 by fixing dtc and u-boot-tools.

Note: The following recipes in meta-openembedded may also be affected
if python/swig bindings are enabled:
- gensio (meta-oe): fix available upstream [1]
- unbound (meta-networking): fix available upstream [2]
- ldns (meta-oe): fix pending upstream [3]

[1]https://github.com/cminyard/gensio/commit/e024df7fc3d21896bd9d2e26964a0b59b7c2a91b
[2]https://github.com/NLnetLabs/unbound/commit/93a56205cfa6b9a6d34db7245aa71e5ca67d1fd7
[3]https://github.com/NLnetLabs/ldns/issues/314

As they are not enabled now, will not provide a fix.

Regards,

Jaipaul


On 2026-08-11 12:25, Richard Purdie wrote:
> On Tue, 2026-08-11 at 08:12 +0200, Jaipaul Cheernam via lists.openembedded.org wrote:
>> ChangeLog:https://www.swig.org/Release/CHANGES.current
>>
>> Release Notes:https://www.swig.org/Release/RELEASENOTES
>>
>> CompareLog:https://github.com/swig/swig/compare/v4.4.1...v4.5.0
>>
>> - Refresh determinism.patch
>>
>> Signed-off-by: Jaipaul Cheernam<jaipaul.cheernam@est.tech>
>> ---
>>   .../swig/swig/determinism.patch               | 20 +++++++++----------
>>   .../swig/{swig_4.4.1.bb => swig_4.5.0.bb}     |  4 ++--
>>   2 files changed, 12 insertions(+), 12 deletions(-)
>>   rename meta/recipes-devtools/swig/{swig_4.4.1.bb => swig_4.5.0.bb} (92%)
> I suspect this breaks u-boot-tools:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/4370
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/4214
>
> and maybe python3-dtc:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/builds/4188
>
> Cheers,
>
> Richard
--------------Pub8wFFaUpck99gM0nTAiowL
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><font face="monospace">Hi Richard,</font></p>
    <p><font face="monospace">I will send v3 by fixing dtc and
        u-boot-tools.&nbsp;</font></p>
    <p><font face="monospace"><span style="caret-color: rgb(33, 33, 33); color: rgb(33, 33, 33); font-size: 14.6667px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; display: inline !important; float: none;">Note:
          The following recipes in meta-openembedded may also be
          affected</span><br style="caret-color: rgb(33, 33, 33); color: rgb(33, 33, 33); font-size: 14.6667px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-line: none; text-decoration-thickness: auto; text-decoration-style: solid;">
        <span style="caret-color: rgb(33, 33, 33); color: rgb(33, 33, 33); font-size: 14.6667px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; display: inline !important; float: none;">if
          python/swig bindings are enabled:</span><br style="caret-color: rgb(33, 33, 33); color: rgb(33, 33, 33); font-size: 14.6667px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-line: none; text-decoration-thickness: auto; text-decoration-style: solid;">
        <span style="caret-color: rgb(33, 33, 33); color: rgb(33, 33, 33); font-size: 14.6667px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; display: inline !important; float: none;">-
          gensio (meta-oe): fix available upstream [1]</span><br style="caret-color: rgb(33, 33, 33); color: rgb(33, 33, 33); font-size: 14.6667px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-line: none; text-decoration-thickness: auto; text-decoration-style: solid;">
        <span style="caret-color: rgb(33, 33, 33); color: rgb(33, 33, 33); font-size: 14.6667px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; display: inline !important; float: none;">-
          unbound (meta-networking): fix available upstream [2]</span><br style="caret-color: rgb(33, 33, 33); color: rgb(33, 33, 33); font-size: 14.6667px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-line: none; text-decoration-thickness: auto; text-decoration-style: solid;">
        <span style="caret-color: rgb(33, 33, 33); color: rgb(33, 33, 33); font-size: 14.6667px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; display: inline !important; float: none;">-
          ldns (meta-oe): fix pending upstream [3]</span><br style="caret-color: rgb(33, 33, 33); color: rgb(33, 33, 33); font-size: 14.6667px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-line: none; text-decoration-thickness: auto; text-decoration-style: solid;">
        <br style="caret-color: rgb(33, 33, 33); color: rgb(33, 33, 33); font-size: 14.6667px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-line: none; text-decoration-thickness: auto; text-decoration-style: solid;">
        <span style="caret-color: rgb(33, 33, 33); color: rgb(33, 33, 33); font-size: 14.6667px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; display: inline !important; float: none;">[1]<span class="Apple-converted-space">&nbsp;</span></span><a href="https://github.com/cminyard/gensio/commit/e024df7fc3d21896bd9d2e26964a0b59b7c2a91b" title="https://github.com/cminyard/gensio/commit/e024df7fc3d21896bd9d2e26964a0b59b7c2a91b" style="color: rgb(0, 120, 212); font-size: 14.6667px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" class="moz-txt-link-freetext">https://github.com/cminyard/gensio/commit/e024df7fc3d21896bd9d2e26964a0b59b7c2a91b</a><br style="caret-color: rgb(33, 33, 33); color: rgb(33, 33, 33); font-size: 14.6667px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-line: none; text-decoration-thickness: auto; text-decoration-style: solid;">
        <span style="caret-color: rgb(33, 33, 33); color: rgb(33, 33, 33); font-size: 14.6667px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; display: inline !important; float: none;">[2]<span class="Apple-converted-space">&nbsp;</span></span><a href="https://github.com/NLnetLabs/unbound/commit/93a56205cfa6b9a6d34db7245aa71e5ca67d1fd7" title="https://github.com/NLnetLabs/unbound/commit/93a56205cfa6b9a6d34db7245aa71e5ca67d1fd7" style="color: rgb(0, 120, 212); font-size: 14.6667px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" class="moz-txt-link-freetext">https://github.com/NLnetLabs/unbound/commit/93a56205cfa6b9a6d34db7245aa71e5ca67d1fd7</a><br style="caret-color: rgb(33, 33, 33); color: rgb(33, 33, 33); font-size: 14.6667px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-line: none; text-decoration-thickness: auto; text-decoration-style: solid;">
        <span style="caret-color: rgb(33, 33, 33); color: rgb(33, 33, 33); font-size: 14.6667px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; display: inline !important; float: none;">[3]<span class="Apple-converted-space">&nbsp;</span></span><a href="https://github.com/NLnetLabs/ldns/issues/314" title="https://github.com/NLnetLabs/ldns/issues/314" style="color: rgb(0, 120, 212); font-size: 14.6667px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" class="moz-txt-link-freetext">https://github.com/NLnetLabs/ldns/issues/314</a></font></p>
    <p><font face="monospace">As they are not enabled now, will not
        provide a fix.&nbsp;</font></p>
    <p><font face="monospace">Regards,</font></p>
    <p><font face="monospace">Jaipaul</font></p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2026-08-11 12:25, Richard Purdie
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:61f96793beba861118dc9502be1590176dfef6af.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">On Tue, 2026-08-11 at 08:12 +0200, Jaipaul Cheernam via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">ChangeLog: <a class="moz-txt-link-freetext" href="https://www.swig.org/Release/CHANGES.current">https://www.swig.org/Release/CHANGES.current</a>

Release Notes: <a class="moz-txt-link-freetext" href="https://www.swig.org/Release/RELEASENOTES">https://www.swig.org/Release/RELEASENOTES</a>

CompareLog: <a class="moz-txt-link-freetext" href="https://github.com/swig/swig/compare/v4.4.1...v4.5.0">https://github.com/swig/swig/compare/v4.4.1...v4.5.0</a>

- Refresh determinism.patch

Signed-off-by: Jaipaul Cheernam <a class="moz-txt-link-rfc2396E" href="mailto:jaipaul.cheernam@est.tech">&lt;jaipaul.cheernam@est.tech&gt;</a>
---
&nbsp;.../swig/swig/determinism.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 20 +++++++++----------
&nbsp;.../swig/{swig_4.4.1.bb =&gt; swig_4.5.0.bb}&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 4 ++--
&nbsp;2 files changed, 12 insertions(+), 12 deletions(-)
&nbsp;rename meta/recipes-devtools/swig/{swig_4.4.1.bb =&gt; swig_4.5.0.bb} (92%)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I suspect this breaks u-boot-tools:

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/4370">https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/4370</a>
<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/4214">https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/4214</a>

and maybe python3-dtc:

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/builds/4188">https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/builds/4188</a>

Cheers,

Richard
</pre>
    </blockquote>
  </body>
</html>

--------------Pub8wFFaUpck99gM0nTAiowL--

