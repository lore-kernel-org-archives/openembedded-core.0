Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7ABCC28B30
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 12:37:09 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.89])
 by mx.groups.io with SMTP id smtpd.web10.51185.1742215025256699123
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 05:37:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=J0Hf7kAL;
 spf=pass (domain: cherry.de, ip: 40.107.20.89, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PB87J+Z8zZn+WoRZJEXB2JLL89NFpNAJj3twXkIyz0aJ+YrlF53ZiUESPFLAeX9grUEZv7DX1Bbc0+2/lcJ1ce4JXaPApDbpmAOR+zenn56oT9y2NUR9MSNIoyRAhb+FG7hKFp/oONVK8gBjGC6CJWeS6a1Wl2N4NFmIgyIW10v+0O2/bub+7woQXER3oan6OnFJvoHV2f55tEUP5sL+8ZPNb9ekoIaR+ItdrunONpPyqviYJHYqvI7qWfHFzUqsfpr2YVE6RyUWwfqAE3BEdxlTTT8KtPVXrM8RqdgIxNLoRn8k3VzgHw8d4ofnOY87YHPsnZunQFtPP2W7pQ50nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRgqjbNEpKzThsjs08eKjVYN/MDfdi7DfNu9+nxPwRg=;
 b=jY4Ey2J3Kj+bc9M6ApYOG4jbmkZhnv09Dmn1LFCNcUDlhv/Ina+jl9hq5CKY27YSL9cyYHgbOelTz68tnYIBJlbXikKIj1b1BNcg97zy9q/Zb9PhHobxTT7NwbMEvmJhqXc4XZuUbtBr5rIgHpkR9edmnWgHxg1yZVCoxmEmuiuOOPZXbKaVtkOOsT7Ef2fqpAwq3/YLS/2xK+DeaFyWoqZ41yEezDxsuqhMdfbOaNN6XJzg6IXi41Ghkp72kVcQzfHprSpVsXid5Pi/uDYkpXAwWQMZvqiKNeEi1WI924zLdSpBNFi6Vo6vKxmgPbO/B+Byk53M4qjTv85kHQEe9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qRgqjbNEpKzThsjs08eKjVYN/MDfdi7DfNu9+nxPwRg=;
 b=J0Hf7kALxyRszTu1l7FzNGO8oxObGtZ8Wd4sOwfaPajQuik3oLxQAnyph7hsKTOyRcUN1NzYHrfehM2l2f53EV31M9tIExoiNAToeMn8eiRNEEc7pPlGPPbodf0IaX52uf/cXaih2EOAc0B6ZbgchHOkqNwUhHVksc0TxGJmnoU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB8PR04MB7132.eurprd04.prod.outlook.com (2603:10a6:10:12e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 12:37:01 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 12:37:01 +0000
Message-ID: <8493f82f-abfc-4b6b-85b3-e82b1d38e11e@cherry.de>
Date: Mon, 17 Mar 2025 13:37:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 1/2] oe-selftest: fitimage improve bb_vars
 access
To: adrian.freihofer@gmail.com, openembedded-core@lists.openembedded.org
Cc: marex@denx.de, Adrian Freihofer <adrian.freihofer@siemens.com>
References: <20250317121120.130476-1-adrian.freihofer@siemens.com>
 <20250317121120.130476-2-adrian.freihofer@siemens.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250317121120.130476-2-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::16) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB8PR04MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f4f8cbf-1808-4230-efb5-08dd65506a81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NXp0UFpQeUlrQXhGKzBMYjJjcjZBa3BvZGlkVUlEc1BTcW9kZmYyNTVCaUM2?=
 =?utf-8?B?dW1HMG1YWkg1Ri9mQ2I4Zk1IZ2dxQVpTY0xzUWlkKzQxTW5mV2VvZzFQVith?=
 =?utf-8?B?dTJ0dTE3cjl6ajgrSkhQUVIrdDdjaHZ0V09vaC9TQWhEajF5TUFCbG00Vzl1?=
 =?utf-8?B?Q3g3VExEemkrQmxzUzBybm1EcXBXeDJkbzIwRm5wem11ekFmR0VCODNzN1E1?=
 =?utf-8?B?WWFWRVZrcElmcEsvZUVRUDVIYUNRSisycTNkWDE3MFREeklnS3BTQWd6dFFX?=
 =?utf-8?B?QUxzUjBoY1d4RTFpSThzaE16Q3RYZ0V1cWdGSnMzcTJHb0tKNHd6OStIWnRD?=
 =?utf-8?B?Y2ZIeFAyQ05OdVJrQmU4WFR0QUFFdU5LVWE2MkJJWkhjMVFKcWw2dFYybXI2?=
 =?utf-8?B?eUdwczNyY0hyM1dqV2l1Tjd3emFIQmMxd1hQQTNKQjhmUDF6RUpRRFdvbTZR?=
 =?utf-8?B?MWdydXp6WDhTNlp2dFkyQURzaVNYVXZhZ00vUnZxcGF4T3BBckFoZWROMy9V?=
 =?utf-8?B?QWROUGpHeFRaei9rb3NjWE5YMUZGbHlyUnNWeXRkYnFNRkVaSHJLdnlnMmkz?=
 =?utf-8?B?anY3MXpTZWFJbkJHTDFpVEN4RnRjK2JlU3N3MnhLTGNpUFlrSVR1ZkR4YlFr?=
 =?utf-8?B?dkF0TXEwRFEvVjdNMUZTSjFMeS9HQ0s0TmpzOHZrSDF2TWdYbExLbXVXYXhh?=
 =?utf-8?B?UGJRK0pzajRmc0tOUElWOC9GY0FvOFdBRDhuRmJMWmVpUXZxekpGMjNrR3NY?=
 =?utf-8?B?MlFsVU5sU01WRTh5WGZudVBCcUFwOEtmYkplaE92NGU3OXh2eXF0L2JSNzFO?=
 =?utf-8?B?NDJaYzZuN2RMd09wQzZYYWQ2Y2pPMW5UZmQyWDJyS3dmUG9JVnJuKzNjOEwz?=
 =?utf-8?B?Y2dQNG8zQ2tDYmtpb1lRWFcrZ3RaQ3pmTHVGTm5UM08rZVBUU2RtY05PaC9x?=
 =?utf-8?B?QnEwcXFXTlZqUTlsTDdiZFE0bEJHdXAxOFVmc0FTS1BaVkJRWXhZbjMwcEpE?=
 =?utf-8?B?ZzNTcmlRU2FNMmFjUlhRQmhGTFVqMDlsaVZRdlpvVUVVaHNJZ2lwQURyNGZa?=
 =?utf-8?B?ejZOSGtlbklwRU1aTllyeDhYd1Jhb1NkSGwyeEhhRlY5VlRJT29Cc1QreCto?=
 =?utf-8?B?ZUxvSjJ1Q3lhYVo3aFhtbmphY2FORTlXRFNHRytBTVNRK3RJUzhwWVMrb0V4?=
 =?utf-8?B?TWNZckRyNEIxK2t1a3owY3hKdUV5Wk9ERmxRNWczY0I4Mnk0SDRCRjdCdGlK?=
 =?utf-8?B?UEdnQVdqUGdncC9iOStCUi9mWlByN2czUVRvM2ZUNENhUWgzRTFWbEZlNlpq?=
 =?utf-8?B?T2FLbTQ1MjVIWVlIV1VHbEZyWDNQdVRlYU1vaEtzejhsTmR0R1pQVEs4clEr?=
 =?utf-8?B?RFUxa0JiZmwzVFhjTG5vVXBqRUpITm1nYktwdU1vamd1WHdZTnpSUG1oY0R2?=
 =?utf-8?B?dDA1RURxUk9PQ2UySXdqM3ZBWDF1MzdSWTltTXBKeVVhd2Z5ZEtmMk5pZEww?=
 =?utf-8?B?NWFTcmMxbjVXVEMySHRLbmZvV0RHM2RMdWpGclROTk1Xa0VWTlZNT1Q2RGVJ?=
 =?utf-8?B?eHFaQlg4Qk1BRTdNTC85bkxyYmM3Lzg5d0RMenIzTjNRUzRaWm9tRk9iWUtP?=
 =?utf-8?B?Y0p3eGEvR0lpR2V5a3Q2OW04a0w2YjhEZ21sTXVuT2cxQ2VBV09vSGlHWGVT?=
 =?utf-8?B?Q0UyMjNoODNYY0Fwd2I1bi8xNGtpZmpqWk8rRzllcTlrTjlDUGRnRGtkOGNl?=
 =?utf-8?B?R2JabWtDSHJMdFU0VzRGT1J1RFFwWjh1SGVvczloRUtvd1Q5YkM0ckt1WGVP?=
 =?utf-8?B?MHFNK3N3MFhkTTZvNHZpSnUwOGhMWUJMQ24rYW4vaTVKQUxMcE5tclRhNDJK?=
 =?utf-8?Q?1P0pUjhDNT8Qu?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VHZrVmQzOWhkb2pMWUthdm1EMUZWWDN2SnkyakUyY04xT1VsRXRpQlJLQVN0?=
 =?utf-8?B?cnhDbHg3T2NUSk1hdkdZOHpUNmcvbG9JQTU4bXRpOHRzZGNYWXhLR3lBYUsz?=
 =?utf-8?B?OExrQTdQM0lST29pRGw2L3gyWTRUenBlQ3U3MHNUSnJkWk5WcnVIOXZJell0?=
 =?utf-8?B?bmhSdmQzbXdMNTdpMXhWUzNBTVZmdytrVzhvTUZnbVRyU0FWUWFzaklNUHpK?=
 =?utf-8?B?TTlhMDJadCs4NE1lVk9tc1FKWTN3U0FtYzJ2RjdZU0JlK1M3WFZiMkpHZlZL?=
 =?utf-8?B?R0VqK2FraUhkZUVSSkxkaGJwdEpneUI0a2ZLellJczZWTGw4aTFxbFN3ajY2?=
 =?utf-8?B?ZW0zTTF1UHRLbjhIM1VBVWJQOXkvQVQrRWMyR08rY1dzbHBtT1JEYVJvM3pY?=
 =?utf-8?B?V0ZBZlBVdUNIQlgvd0ZxS2YzS1RBb2FGeHFEdWMzdzBRay9iL2tyR1RpVStH?=
 =?utf-8?B?dDd3QTBWaUxwV2dyU0xqTm5heWNjeUptdEhIUlRRbzJzVlptU1NJZWltcCsw?=
 =?utf-8?B?aVNhRElMZXlQVlZBMHFQN2hvTzYwTm5CK3lSN3AwQXczSVd1SGRZQzY5bmdR?=
 =?utf-8?B?T2FrRGNqR0c5d2JML2hIanl5WGFuWHZoOE9iT1I2Tk91R2I4dEFZNldHQSs0?=
 =?utf-8?B?NXg4VjRmS0VDYVRiWTdQWlAybnJJNXF5ZFlhbXk3VXVMLzB2R1NWZkJHaHpm?=
 =?utf-8?B?NHZYYnpvTU52VU9oZEFlbE1JRXplTzA1eFRONzludXM1Z2hHNTBpMncxM1h5?=
 =?utf-8?B?NmhYL05UeXV2TDIzL1FzZm91Zld5V2JQdm5MdDJCaGNnemdSamxwSUV5SVBK?=
 =?utf-8?B?dWVQdW04VFlCR2dCVkhSWjFEeFRHamgyTmJib3htbXFlY1d0dUhMbW9iakRT?=
 =?utf-8?B?Zmw5ZDBDdjNGbE9wTzF0Z285ZjZuRXkrMklQT3lVaVBTcU5pUUVzNXNNeEt4?=
 =?utf-8?B?a0NUd1luaVpDeTJXT1lMY0pYNktCM01hbDJSYUliMDFMTXJjRWV3NWlLeStK?=
 =?utf-8?B?dEw0NnAzUmw3VjU3VkczeWZQdm5tdTlkTklTNE1VUHp3SGIveVZGYVZCdUw5?=
 =?utf-8?B?R21lM1BwTWVQN3hOZFBMVnIwemtnUHFQSlBiVUpMOTBZOCtIbTV6d2o3ZHd3?=
 =?utf-8?B?RHA5Z0RVSVEvRzZDQmNZUlU2SDVuU2xqaW1qWVdIN1Y5TTRZNGllWk1PWE9G?=
 =?utf-8?B?QXVORjI5NW1MemVQaURUYWFkV2Q1QmVaWlgwejJ3elg0OUFvNWdEUEU1YlpB?=
 =?utf-8?B?R3pwVDluT1liMWp3Yzh0aDJZNGZqWVAvNy9FTm5LejN5RjgrYmh2NXhXOGxu?=
 =?utf-8?B?Ry8za0xldGpiMEJUM3BDZ3BIVVk1WFNUeWd2WnRCa1FmMlZpQi9mU2d4VFBO?=
 =?utf-8?B?eGhWZkdybC9zOEZQWVZ0eEpWdG1oQ3A5dkc5dDIxZ0VTNlNzanp5VjlqMUt6?=
 =?utf-8?B?RTFLNTFuWUpqb1dzN0lLVVoxaWdycndFd3d5YzhYQ05mQktHQXBtd3p4QjUy?=
 =?utf-8?B?R1hOaDFlUzBNQUFSZUR6UkxIN0U5TGtCazBiTWxQTFYyTlRaeFR5cGx1Z0dC?=
 =?utf-8?B?RU5nTWxHSmRrektYM3FnUDRrSXlLaEZwdS85ckhZMW1IMUhuOFkyUFlhWStN?=
 =?utf-8?B?QzVPUXVVNkdjVG1YblU4aXk5K25DVzgvNXhuL0YvQ2t2clVkbWkrSlBPT2Vp?=
 =?utf-8?B?S0F4S05GSXlTTk5KY1VNWThVaEJ1eWlwS0xKMzBSaE9XWm5XS2dqbW01S1N2?=
 =?utf-8?B?M0JXWlRKNnJnd2dvdktuaUNrU2xxQmJVNkpDQXFhQ2EvL2JpNHUzQThhTVht?=
 =?utf-8?B?YklVeWlQZHQxMjBTaGNSRkRzaGlOeXViWmhURjJ5UlRXajFLMy9pYkI5Vmsz?=
 =?utf-8?B?TzhnRXlCamZ3VGUvVVVDTGo2cmw4aGlkT2tpZnFKWjNGL0wrQW9PQjhNR0xi?=
 =?utf-8?B?OCtwbGVwRDdvVHp6NXZHY3BHUlJiQW9HblRnc3daRWRsdzZuZWhuR0pTWXFK?=
 =?utf-8?B?RWNQNkJ5MWxXRGl0OXVkczcrZHlMMmxCQy8xRUJ2NUZaTHZraEJKcVAxMVBq?=
 =?utf-8?B?QkpYNktiYmRza3ZGMHBtZkR0NGJocGpPNURGNjRCRk80dHhFTWRjSEpiQXFr?=
 =?utf-8?B?a0FtaGl0UG00QWpUcXJsbGlJc1lOVUhCaUUzeDNvMlBjNjIzYnE3MHdYczky?=
 =?utf-8?B?VEE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f4f8cbf-1808-4230-efb5-08dd65506a81
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 12:37:01.6251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9T1AYrVnjqGWjXK+prwEH3MoY/E8F6Kbo1vyzZKROUhXaR94im7Vbp6UcTr4AuajP+P2Tt3K8YIdMee1hLfQRtgeqon4hJiMO6n2sGiTkj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7132
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 12:37:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213085

Hi Adrian,

On 3/17/25 1:10 PM, Adrian Freihofer via lists.openembedded.org wrote:
> Make the code slightly more robust by using e.g.
> bb_vars.get('UBOOT_SIGN_ENABLE') instead of bb_vars['UBOOT_SIGN_ENABLE']
> for variables which are potentially undefined.
> This is a general cleanup but also a preparation for additional test
> cases.
> Log bb_vars in verbose mode.
> Drop one no longer used log message.
> 
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>   meta/lib/oeqa/selftest/cases/fitimage.py | 21 ++++++++++++---------
>   1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
> index 721628d8e73..60c9406489e 100644
> --- a/meta/lib/oeqa/selftest/cases/fitimage.py
> +++ b/meta/lib/oeqa/selftest/cases/fitimage.py
> @@ -56,10 +56,10 @@ class FitImageTestCase(OESelftestTestCase):
>           # Define some variables which are usually defined by the kernel-fitimage.bbclass.
>           # But for testing purpose check if the uboot-sign.bbclass is independent from
>           # the kernel-fitimage.bbclass
> -        fit_sign_numbits = bb_vars['FIT_SIGN_NUMBITS'] or "2048"
> -        fit_key_genrsa_args = bb_vars['FIT_KEY_GENRSA_ARGS'] or "-F4"
> -        fit_key_req_args =  bb_vars['FIT_KEY_REQ_ARGS'] or "-batch -new"
> -        fit_key_sign_pkcs = bb_vars['FIT_KEY_SIGN_PKCS'] or "-x509"
> +        fit_sign_numbits = bb_vars.get('FIT_SIGN_NUMBITS') or "2048"
> +        fit_key_genrsa_args = bb_vars.get('FIT_KEY_GENRSA_ARGS') or "-F4"
> +        fit_key_req_args =  bb_vars.get('FIT_KEY_REQ_ARGS') or "-batch -new"
> +        fit_key_sign_pkcs = bb_vars.get('FIT_KEY_SIGN_PKCS') or "-x509"

I believe bb_vars is a Python dict? Therefore, we should be able to make 
the above

<var> = bb_vars.get('<VAR>', '<OR>')

e.g.

fit_key_sign_pkcs = bb_vars.get('FIT_KEY_SIGN_PKCS', '-x509')

c.f. https://docs.python.org/3/library/stdtypes.html#dict.get

EXCEPT if you want to handle the empty string and not just 
"FIT_KEY_SIGN_PKCS is not defined".

>   
>           uboot_sign_keydir = bb_vars['UBOOT_SIGN_KEYDIR']
>           sign_keys = [bb_vars['UBOOT_SIGN_KEYNAME']]
> @@ -145,7 +145,7 @@ class FitImageTestCase(OESelftestTestCase):
>   
>       @staticmethod
>       def _get_dtb_files(bb_vars):
> -        kernel_devicetree = bb_vars['KERNEL_DEVICETREE'] or ""
> +        kernel_devicetree = bb_vars.get('KERNEL_DEVICETREE') or ""

bb_vars.get('KERNEL_DEVICETREE', '')

?

etc.. with the rest of the diff.

>           if kernel_devicetree:
>               return [os.path.basename(dtb) for dtb in kernel_devicetree.split()]
>           return []
> @@ -281,7 +281,6 @@ class FitImageTestCase(OESelftestTestCase):
>                       key = key.strip()
>                       value = value.strip()
>                   except ValueError as val_err:
> -                    self.logger.debug("dumpimage debug: %s = %s" % (key, line))
>                       # Handle multiple entries as e.g. for Loadables as a list
>                       if key and line.startswith("   "):
>                           value = sections[in_section][key] + "," + line.strip()
> @@ -377,6 +376,7 @@ class KernelFitImageTests(FitImageTestCase):
>               'UBOOT_SIGN_KEYNAME',
>           }
>           bb_vars = get_bb_vars(list(internal_used | set(additional_vars)), "virtual/kernel")
> +        self.logger.debug("bb_vars: %s" % pprint.pformat(bb_vars, indent=4))
>           return bb_vars
>   
>       def _config_add_uboot_env(self, config):
> @@ -441,7 +441,7 @@ class KernelFitImageTests(FitImageTestCase):
>           fit_uboot_env = bb_vars['FIT_UBOOT_ENV']
>           initramfs_image = bb_vars['INITRAMFS_IMAGE']
>           initramfs_image_bundle = bb_vars['INITRAMFS_IMAGE_BUNDLE']
> -        uboot_sign_enable = bb_vars['UBOOT_SIGN_ENABLE']
> +        uboot_sign_enable = bb_vars.get('UBOOT_SIGN_ENABLE')
>   
>           # image nodes
>           images = [ 'kernel-1' ]
> @@ -475,8 +475,8 @@ class KernelFitImageTests(FitImageTestCase):
>       def _get_req_its_fields(self, bb_vars):
>           initramfs_image = bb_vars['INITRAMFS_IMAGE']
>           initramfs_image_bundle = bb_vars['INITRAMFS_IMAGE_BUNDLE']
> -        uboot_rd_loadaddress = bb_vars['UBOOT_RD_LOADADDRESS']
> -        uboot_rd_entrypoint = bb_vars['UBOOT_RD_ENTRYPOINT']
> +        uboot_rd_loadaddress = bb_vars.get('UBOOT_RD_LOADADDRESS')
> +        uboot_rd_entrypoint = bb_vars.get('UBOOT_RD_ENTRYPOINT')
>   
>           its_field_check = [
>               'description = "%s";' % bb_vars['FIT_DESC'],
> @@ -506,6 +506,8 @@ class KernelFitImageTests(FitImageTestCase):
>   
>       def _get_req_sigvalues_config(self, bb_vars):
>           """Generate a dictionary of expected configuration signature nodes"""
> +        if bb_vars.get('UBOOT_SIGN_ENABLE') != "1":
> +            return {}

I would recommend to split this into a separate patch to explain why 
that is needed.

Cheers,
Quentin

