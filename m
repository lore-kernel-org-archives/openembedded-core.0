Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37BCFC021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 08:53:20 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.137])
 by mx.groups.io with SMTP id smtpd.web11.6828.1739436791639752588
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 00:53:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.com header.s=selector2 header.b=5HpkVtD7;
 spf=pass (domain: weidmueller.com, ip: 40.107.162.137, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dhmY+vzbutMLJc//Or1AEl7TXZfMBkaWkA5fv3yUaYZBM+pinPNAkniQT4in9o2v8SaWuLv1m746fqH3mqO9jXklvMy5l0qU+gFtauHFTWe779HpgGH1MmiQOx50rBKImMaCREwDWs1pCaUcl2452NUt4Jzzrygmm1LiV1lj8F7iBGVo8Te3d2mNc79DDRZz1Y/IXt/gHEuCRZUBNv1zOV35Yqt1BigJv/HF7SgBzxX0VZT6Ie2hIlc1WSdTVTi+8V7nguWiv4/E8HN9UNJDYq03Jcy7ZbGojK5Cak6h0g+GtqjgtNj9HKqv/pO4Yh8lzjYC1ED0hg5oIrKBS4HL0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m4WYnK/BcwuF2GBww+uaVn0Xvye2O+RJEn17eIlMB7Q=;
 b=cxxGBBv85bpv2Myin6tXbv7UQwNMaYROj2SPhVJuV457mf+ILfGYdse9aOCLOyK1B85BDNLBW9ZJiVLnpYQqGxfHyKNx1HjOLG4fQzJtufcdIb62TywohJ4Tos7TZukF2je/D2PKEQNjfqMHrYTOg7BIFXoCPKktmSlyEAGpcqY31OQeoJ6tZ8vJ5bHa5WC5e7ieLD2RiV7hg6DiE2cfUVVlxzZVDFzsc8Qw9vVbAOaN2CPvtTGgMM8YQ5MULPeHZKyuSvqOSDWqY3nQmKPvWO/GdH0X6ncUX7kNm29BuyPXhNIX3I4CH0TUdxaPuFvg0Gdi0m7WDtzlpKshbOMhHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m4WYnK/BcwuF2GBww+uaVn0Xvye2O+RJEn17eIlMB7Q=;
 b=5HpkVtD7mBFvPnN+IsVVlx9tLCczF7yaoZWhWsLX2KSBsBQWehsffLDYxoSTbVz7fe5BjHqTFpZu37WhSLs15AhxrypgN285vCbh4iEmLqeGRkpM8x6RTQ6nchSMwDD7oU+vFPVeAntHYFt3mmInBv+nzwI1GeXeaLHE8kkqKBJvMTlGX2MfkfVa8VoKud/I/ki7cxa4zZVaF75gy/B26NRDt6/KnOADWb//vkIJQRtMMOPJGvltzDAJbskCfKB+XMmeDc722Sq1DT3FGyhPQ8zt739mZEJRS9CFlX3/jD0UDSMS4xAiX1//+ZM7YvonVBcOlYgPWYDVUvKOFurKBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by VE1PR08MB5646.eurprd08.prod.outlook.com (2603:10a6:800:1a9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 08:53:06 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Thu, 13 Feb 2025
 08:53:06 +0000
Content-Type: multipart/alternative;
 boundary="------------GoDhWmXRXOzOMZd5s6ucLagr"
Message-ID: <d742a610-3a50-42e1-94a8-d8f4d7653a0f@weidmueller.com>
Date: Thu, 13 Feb 2025 09:53:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH 06/30] lib: oe: vendor: add cargo support
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20250211150034.18696-7-stefan.herbrechtsmeier-oss@weidmueller.com>
 <CA+cAkep+TSaFr5pqKDjxRh07ApMTwtnspTvYAMVOU_ax3kP3Ug@mail.gmail.com>
 <ed0bd088-529c-4e37-81b5-2749b0da3934@weidmueller.com>
 <CA+cAkercP7YUsVTXLWDEV+oya9NNf4Uj_ge4xg0KtYLcXERciQ@mail.gmail.com>
Content-Language: en-US
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <CA+cAkercP7YUsVTXLWDEV+oya9NNf4Uj_ge4xg0KtYLcXERciQ@mail.gmail.com>
X-ClientProxiedBy: FR3P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::16) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|VE1PR08MB5646:EE_
X-MS-Office365-Filtering-Correlation-Id: 86e18e72-66a7-4364-8723-08dd4c0bd500
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?b1NTRmhURkpaQjRrWGJiTTNMblJEYmIwVHNaS1pWa3UyOWRuTXlsOVh6OUcy?=
 =?utf-8?B?WTVBaC9mWWVKRGh6Zk96KzQ1a2JLcDBzRElwYmNkdmk4c3hqN09HdHVFWGp2?=
 =?utf-8?B?bi81L1BqUEdjRFlpakgvZWM5SnRRMjVXV3dqR1d4VElBcjg2bldqdHhGWGxi?=
 =?utf-8?B?MHdFZ1poOEI0M1NuLyt2cjdhTjhEcTZFNjlCT1p1TzlkQ2lWTE5GcGF6dVdF?=
 =?utf-8?B?OFVCSDZFVi9wN3hhNnhHTXJtYnVqMHR5Mnhla1dJemI1THZqSFhSKzVDclF4?=
 =?utf-8?B?YTE4K2hkYjFPTmp3VmpGOGI3U3N0b09sbjNYTHRxSGNsN1JYcjlzckJIYlJV?=
 =?utf-8?B?ekVRNEZDOVg0THc3Z3JFalZ0bWpVZk9ubHhES05Lck9NNHdYR2c0Q3dCU0tv?=
 =?utf-8?B?aEpjVTUwZS83ckI3cWhucGNOaysvb1l0TXpTQzJRK2F5WmRvUDdzQnN2bm9W?=
 =?utf-8?B?Ym9LY0MySDlGaU1NcjlJMmtmd0VNTm5KRzRaZndOQ01yUDhueHE0WTFMS1Zr?=
 =?utf-8?B?Z3lCaHNPdmkrelFtbjZvRDdQSlVRd09GVmlRMnlVSW9wOXpRd3JRODQwUDhK?=
 =?utf-8?B?NC91WE5vcndYY0FzUFlGZjErMzVWSGliQVZHZ1ZXQkdEQkJTQjVmQ3NvZEU5?=
 =?utf-8?B?Q01qNmJ2MGFLRWNIRGs1M2RJVjkvdTFnaDcva0VvVmREY3VhWnhvUFgzVkZm?=
 =?utf-8?B?bEdkeHJaTmFlZlgyWXJRZ3JMTFRlZVNZa21VbEFMT0FnbDZrZTVWYWp1SkZD?=
 =?utf-8?B?eWJBak5xdEVXd3ZSMmVBdkZwOHFIVkM2d3dwQS9sR2puRHRrZmdOSzduc1gw?=
 =?utf-8?B?UGlIU3BvZHkwcmRhVFpsaE91U3k5dnR6ZFBWTGhLNzlHcEpKeHQ5SUZobkhO?=
 =?utf-8?B?eG5nYThMWDU4dXc5ZmNaZXVYc3UxZm5xbEExcDBibnAwaVlOTnZzTmd4Rm1Q?=
 =?utf-8?B?VkJPcDZSdWVOczBPRVFwQmh4SHRDN3lMODBGTHFtOXYwMDNDWjMrTXAxWGxR?=
 =?utf-8?B?MUVuNWZpNVZOS2NMdmFtSVpPSW5PdnkvZHdhMjRnWTZYcHZ4alFWY044em1C?=
 =?utf-8?B?VDE3TkJPeE9yVjNFa0FTaGF3a3k2NGlKeVpNS0hIL294eXJnVnlMSldvMVFC?=
 =?utf-8?B?dmwvZFpEQm9iTWQ1dlJneElDUFlISEo4RTM1dEpwb20vUDkwNmJqVmcwbXM3?=
 =?utf-8?B?SzQrN29EeDJ5WlBIb05iL1I4NWhia3NRWEY4ZUdoUGZ0K2hsQ2c2WUVWREZx?=
 =?utf-8?B?SVl4eHYrNnZxRTY0Q3ZYd21pRm01UDFFR2RITTlYV244b3FCb2ZJcjI1ek1x?=
 =?utf-8?B?OEswS0xZWFIvbCtsaFFmL3dIS3ovcHFQbTRaT3IzRUN3Mmx0MkdOay9icUZI?=
 =?utf-8?B?RjhSeXB2YmpvanlvMzNqV1kwSmtJMnN5MHlmaUlleGdGOHEwWnFGL3Jsa0sw?=
 =?utf-8?B?U2hpVld6MFpWYUQyZU9MMDV5bXVOcmxEQllWR3ZsZktnQ0NHcTJwYm5pdEo1?=
 =?utf-8?B?YU5uRUI3bGx4Y0h3T0Z5a01NVnNSMEc2ZXRuOWwzSUFteUI5L2d0OEgyMW1L?=
 =?utf-8?B?b1FMMGM3Ri9md0V6YjFXbUtLbHFUN0x4SE90K2pPT21LbU01MCtMclhEYTJk?=
 =?utf-8?B?RzNxYTZVTkw5cGdaVmh4K0dxTUlodkNSNEw0ZW0xV0k0TlVSOGdqUm5TZHdG?=
 =?utf-8?B?ZnZ0bHl1ZlgreER6T0Z6TWJOanl0c1JSeUV1cnVWVzJqS1JqRlRJTzJCZ2Zl?=
 =?utf-8?Q?5Daw3Xi274+2Z3p8OF9mSo+sWotsipFPFkrSXzd?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?akZib2R2MlBOYThUR1oveE1RMkF6S25nWmRDM0plVHIxdGtCdUF2cHUyamVO?=
 =?utf-8?B?Tk00UXhjSDRtVFU2QUlJVy8rWHUwa3NiNi9haWxHNEprVHFIVGt1eGMyaWxG?=
 =?utf-8?B?ZGx1d3NGSWhVNTZ5bXFVdlNxd2p6TVVnV1BuODBickM4emw0RTlrRE1Bd01Q?=
 =?utf-8?B?Z1NVWEJ0OFZWK3ppRGxCMlcxNlZ3OHVYSjFHeDlLUWRBayt3MktwNjZDQUNs?=
 =?utf-8?B?eVlTZHFQdnpEdnpVdjdPMTdrdDl0Wm40em5NZy9GbEtvQ0Q0VHhlbUh5cnR0?=
 =?utf-8?B?cHR1SHdsblJBdlU0OWVXMzNJWkc2U0xaaE5GZUFTV1d5ZTJWeVl0RTB3cW5q?=
 =?utf-8?B?YjVqNkVVcTNiSDNudXUzUWhOaHdCVmxDQlVwN3hrNGdHS1F1UEZKaFlIMGFG?=
 =?utf-8?B?Mjg5SkdOUDM0Qkt4VEZra0VBdWlUK25XZzk1U0ZJY1NhNEhWNVBSQlpHREl2?=
 =?utf-8?B?djU4NStZNjdmNGxjYlc5MzUzOU50eW96OWp2ZWlyYmdwZm1sRVgvbk84M25k?=
 =?utf-8?B?d1FrU1k2TjNpY055eUdONTI1dVhCV0Q1YzVjUWJyVXFCMWozWE4zM081bWx3?=
 =?utf-8?B?VlAxeHVWK1BYVkF0bmR3WkJXaXZjbzdpV3VMdzQ3bWpsdVdlSHB0aHBLWkdL?=
 =?utf-8?B?SE1NOVFReHZKR0lCSlpJR3NaNFEwVXQzanNUWFFQMit2emtBN1dzc1hlbDVH?=
 =?utf-8?B?azVXay9TSzU5SS9JY01IdnE3SXBWTDZuVWtuV29hWmJCOG5FQnQ2clZhUnhB?=
 =?utf-8?B?OVgyam9sb2VaaEpnaXY2djBUa2ppM0M3dUFweEdJK3ZBWnpmVVIza2UzdGph?=
 =?utf-8?B?Q3FvMzBxZ0VSMldFU1liQTQwR3UvN3hTQWExUm9BWmNOMFArV3NwUmxwNjJm?=
 =?utf-8?B?dnVTQ1RXNHljc1lkRnE4VGs1bk9pSXF4aVlDWHdOMlBFeWU3MTk2VVVDRkZm?=
 =?utf-8?B?OFVxek11eEZkY2s4eGdDcmRtdzZPU0RJb1VxN1VkaGNLdWR0ODNpMnRxZ050?=
 =?utf-8?B?b09RbUtPNnU5OWpKbEY5MkJoUDM0MW9uR1pvTm01ZXpRaTNSR2MzVWYxYk9Y?=
 =?utf-8?B?S1dHam1UQVcvdUhaLzc0Y1J6c2NsK3p4Sit0MzVXNU0vTlMxeXRXbkluTzZF?=
 =?utf-8?B?ZkNUZ0ViWCtCRmtoampyazRmMzZ0RmM0aUhvVEpDeEpDQlNicWJFSnhZbXNl?=
 =?utf-8?B?d2FJMVJIVlNVQm5jMExNNnVaVkJNZGYyNlJiNHg0MExKNTFhZEhnMXBra2lz?=
 =?utf-8?B?aGo5S2llaEhFTW9DQ3lZVlhFc3VwY0xOZGZEWDVGWUErV290NVpOZnNsY3U2?=
 =?utf-8?B?clpHVW1mWk1rbGNkd1NBcWNsbnVDbm1TYjdRTCtkZVNjTG9GZUh3RzllcDJK?=
 =?utf-8?B?WnZCNmd0Q0RkMHN2enRaT3JoRjhDU0FQSHM3bjhLbGlkVFQzdlF1VmpJZS9N?=
 =?utf-8?B?OWJkN283OGhHOGNjMFNla0xIdUVFOVhIZ3NRN0RRa1RBcStNUDNRM1lsZFIr?=
 =?utf-8?B?M2VFeW5tS2lPRXVjd3llVzBCY3N0d2wrb0hBMVp1bXJHMVlqNW0yUEdTUkZ6?=
 =?utf-8?B?eUU4RWcwa1o3RFVValBDNFFYM1hhV0dqSExVd1VnaWg5ck9zY3Qwd2NCTFY4?=
 =?utf-8?B?cU4vYkpZcU84a0tzbUtEVEdzd3k0cFl6ckFDTEZaWFgxVWd3NitpQlNWRWwv?=
 =?utf-8?B?SUNpa3UzUVVyT2c3eXNWZFVRSWp6cklZRlV6dytoS0JxSC85VUVpb05EYkIz?=
 =?utf-8?B?Sk5yRDdFNVRleGNoYWRSVFJXSXVVVmdjaGhvV1pyTEV0NGl3VHdCbW13aTV0?=
 =?utf-8?B?WldjaDQ0K3o3ZWw3bDRrK3M4Q01MVVp5T3A2amNaeEIveUtFay9iVy9jSzF1?=
 =?utf-8?B?WEZ0cE9mOVRjTmFMelc4Q1ZITGJNV05nMS9BL0dOUnBmaWFMZDJqYmdjUmcx?=
 =?utf-8?B?anM1Nk9Ia2h0N0VlN0g3elVrc1RtRDdYaGg2YUZZejNqbC9BQkFrSVZ3bXlw?=
 =?utf-8?B?WFBGb3BrTDQ1ZWFtY1k1Q2x0aWNtWFFGcjFBYnlQRVI1WDQyZzY4eTRqbW1N?=
 =?utf-8?B?ZThjZmJLSmk3cElWZHI2cGlBbzExZmhlTGFucStyeGVyZjQvU0JmT3plOXZX?=
 =?utf-8?B?cEFsOFdOaUY2S0RFWU1UY1JPUDZXVkpLMTFuQk11SGVUdEdrQU14NTZZUUNv?=
 =?utf-8?B?QlE9PQ==?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86e18e72-66a7-4364-8723-08dd4c0bd500
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 08:53:05.9851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2xBLTEaWvPt7Rpq4LOw8dkHGCSQ9poYuOTWSCD7bOprBY1WDlhpweaAzESRI79K5M1L/WPXqa2YBIG+qaLfpRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5646
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 08:53:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211307

--------------GoDhWmXRXOzOMZd5s6ucLagr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 12.02.2025 um 18:48 schrieb Frédéric Martinsons:
>
>
> Le mer. 12 févr. 2025, 17:29, Stefan Herbrechtsmeier 
> <stefan.herbrechtsmeier-oss@weidmueller.com> a écrit :
>
>     Am 12.02.2025 um 13:45 schrieb Frédéric Martinsons:
>>
>>     On Tue, 11 Feb 2025 at 16:01, Stefan Herbrechtsmeier via
>>     lists.openembedded.org <http://lists.openembedded.org>
>>     <stefan.herbrechtsmeier-oss=weidmueller.com@lists.openembedded.org>
>>     wrote:
>>
>>         From: Stefan Herbrechtsmeier
>>         <stefan.herbrechtsmeier@weidmueller.com>
>>
>>         Add a vendor module for cargo to resolve dependencies and
>>         populate
>>         vendor directories from a Cargo.lock file.
>>
>>
>>
>>     Hello,
>>
>>     Have you looked at vendor subcommand of cargo :
>>     https://doc.rust-lang.org/cargo/commands/cargo-vendor.html ?
>>     I didn't read the series but the commit message makes me think
>>     that "cargo vendor" already exists for resolving dependencies
>>     and populating a vendor directory.
>>
>     The class uses the bitbake fetcher (wget / git) to create a vendor
>     directory and emulate the cargo vendor command.
>
>
> Yes, I understood that. Let me rephrase my question.
> Is it desirable/needed to mimick an existing (upstream and maintained) 
> command, considering that we already use native cargo to build rust 
> binaries?
We already mimick the cargo vendor command. But at the moment the code 
is hidden inside the crate fetcher.

We need to bypass the download of crates via cargo to support download 
mirrors and offline build. Therefore we download the files via wget and 
populate a local crate repository.

> Is the new flow you suggest can use the "cargo vendor" call?

It is useless because we already create a vendor folder manual 
(CARGO_VENDORING_DIRECTORY).

> Maybe there is room for less custom code here. Sorry if I missed 
> something obvious, I just react to some keywords in area that I 
> contributed 2 years ago.

I mainly extend existing code from crate fetcher and 
cargo-update-recipe-crate class. We need to extract download information 
from the lock file to create SRC_URIs.

--------------GoDhWmXRXOzOMZd5s6ucLagr
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Am 12.02.2025 um 18:48 schrieb Frédéric
      Martinsons:<br>
    </div>
    <blockquote type="cite" cite="mid:CA+cAkercP7YUsVTXLWDEV+oya9NNf4Uj_ge4xg0KtYLcXERciQ@mail.gmail.com">
      
      <div dir="auto">
        <div><br>
          <br>
          <div class="gmail_quote gmail_quote_container">
            <div dir="ltr" class="gmail_attr">Le mer. 12 févr. 2025,
              17:29, Stefan Herbrechtsmeier &lt;<a href="mailto:stefan.herbrechtsmeier-oss@weidmueller.com" moz-do-not-send="true" class="moz-txt-link-freetext">stefan.herbrechtsmeier-oss@weidmueller.com</a>&gt;
              a écrit&nbsp;:<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              <div>
                <div>Am 12.02.2025 um 13:45 schrieb Frédéric Martinsons:<br>
                </div>
                <blockquote type="cite">
                  <div dir="ltr">
                    <div dir="ltr"><br>
                    </div>
                    <div class="gmail_quote">
                      <div dir="ltr" class="gmail_attr">On Tue, 11 Feb
                        2025 at 16:01, Stefan Herbrechtsmeier via <a href="http://lists.openembedded.org" target="_blank" rel="noreferrer" moz-do-not-send="true">lists.openembedded.org</a>
                        &lt;stefan.herbrechtsmeier-oss=<a href="mailto:weidmueller.com@lists.openembedded.org" target="_blank" rel="noreferrer" moz-do-not-send="true" class="moz-txt-link-freetext">weidmueller.com@lists.openembedded.org</a>&gt;
                        wrote:<br>
                      </div>
                      <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:
                        Stefan Herbrechtsmeier &lt;<a href="mailto:stefan.herbrechtsmeier@weidmueller.com" target="_blank" rel="noreferrer" moz-do-not-send="true" class="moz-txt-link-freetext">stefan.herbrechtsmeier@weidmueller.com</a>&gt;<br>
                        <br>
                        Add a vendor module for cargo to resolve
                        dependencies and populate<br>
                        vendor directories from a Cargo.lock file.<br>
                        <br>
                        <br>
                      </blockquote>
                      <div><br>
                      </div>
                      <div>Hello,&nbsp;</div>
                      <div><br>
                      </div>
                      <div>Have you looked at vendor subcommand of cargo
                        :&nbsp;<a href="https://doc.rust-lang.org/cargo/commands/cargo-vendor.html" target="_blank" rel="noreferrer" moz-do-not-send="true" class="moz-txt-link-freetext">https://doc.rust-lang.org/cargo/commands/cargo-vendor.html</a>
                        ?</div>
                      <div>I didn't read the series but the commit
                        message makes me think that &quot;cargo vendor&quot;
                        already exists for resolving dependencies</div>
                      <div>and populating a vendor directory.<br>
                        <br>
                      </div>
                    </div>
                  </div>
                </blockquote>
                <p>The class uses the bitbake fetcher (wget / git) to
                  create a vendor directory and emulate the cargo vendor
                  command.<br>
                </p>
              </div>
            </blockquote>
          </div>
        </div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">Yes, I understood that. Let me rephrase my
          question.&nbsp;</div>
        <div dir="auto">Is it desirable/needed to mimick an existing
          (upstream and maintained) command, considering that we already
          use native cargo to build rust binaries?<br>
        </div>
      </div>
    </blockquote>
    We already mimick the cargo vendor command. But at the moment the
    code is hidden inside the crate fetcher.<br>
    <p>We need to bypass the download of crates via cargo to support
      download mirrors and offline build. Therefore we download the
      files via wget and populate a local crate repository.<br>
      <br>
    </p>
    <blockquote type="cite" cite="mid:CA+cAkercP7YUsVTXLWDEV+oya9NNf4Uj_ge4xg0KtYLcXERciQ@mail.gmail.com">
      <div dir="auto">
        <div dir="auto">Is the new flow you suggest can use the &quot;cargo
          vendor&quot; call?<br>
        </div>
      </div>
    </blockquote>
    <p>It is useless because we already create a vendor folder manual
      (CARGO_VENDORING_DIRECTORY).<br>
      <br>
    </p>
    <blockquote type="cite" cite="mid:CA+cAkercP7YUsVTXLWDEV+oya9NNf4Uj_ge4xg0KtYLcXERciQ@mail.gmail.com">
      <div dir="auto">
        <div dir="auto">Maybe there is room for less custom code here.
          Sorry if I missed something obvious, I just react to some
          keywords in area that I contributed 2 years ago.<br>
        </div>
      </div>
    </blockquote>
    <p>I mainly extend existing code from crate fetcher and
      cargo-update-recipe-crate class. We need to extract download
      information from the lock file to create SRC_URIs.<br>
      <br>
    </p>
  </body>
</html>

--------------GoDhWmXRXOzOMZd5s6ucLagr--

