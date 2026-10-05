Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A405CA5FE2
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 06:51:42 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.10])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14364.1791183092692515034
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Oct 2026 23:51:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=ubStgFbn;
 spf=pass (domain: est.tech, ip: 40.107.130.10, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OdDm9VcKpMtuuXeD7Y5suOMk9e+2BqFAAQBP7XoLZ1Yu+8iibNYk5EAq9Qp/CdbPPudw4x3iqz0tlRZ23S/Lm4Wq61uooN2hGKuigkCDiApqCRSiq5ZgJm1TTkfh6d4DUlp+46O9i9YxRJZ60Z6NOMfcV6yEZr6m8KycGUakl4ghH0JgB7nzaMHXnpzDj/n5SsIG+JJeKgk+O06CefMCL2XvlmpsDwGpAwOjKvrEg+hguwzkxUjWUWNi0C412HnYqWyNF2UW13P3rMZlhjAvLBt0JWtyL7DXgTkCrGMUJK1B3kNQWGxbNfgIImoTLLU8nlO9TRt4Paxfyi0BopZHPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i7f3VMpU44dEQJEk+2pogktjrjQdRC51kyKphGLbk8Q=;
 b=iSHh8cuRcL7qoCALyqRgJ453GRazYn0DZ9imDOM/311VNuM8PT7jL2VdqhR/Vzcupg0m3OisHMXhOGs0Pqp3OYiQjEsPzOzKFY/5w3GaF0VyWgWmjbM87Q+5Vao+9De79U2l4WpwBAv5/pW+Vrf59KpUYE6/ZxQpyHn84yV+XEbC+izekXDNrBqIsykhK/wRoMfzRy9NjhDcOK3AtO1t64TQDfLLyJi+/HhfwpGEgEEILT9o/oL6v0KdliluaXMSLb+T5vrJcStpz0pqaiJVEuB7S/T+zVRpq6suG92bEN1AHuosWcYU0JVoQbObDZrT76Ya2hrKrRW4znmybd8oWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7f3VMpU44dEQJEk+2pogktjrjQdRC51kyKphGLbk8Q=;
 b=ubStgFbnByyfGkoBO+AirAVQZhhUb5ul88mceI64syOZRofDVNmf4GByU/g3Zke/l0crMj3aMX272TaYZHCWFCaOTgg64WkrClQ0HmQ/f58PRlqzDqgHVRlfujysnOA8TiSzN3F75fKJFUgsoGbXjhdfDkzr9cvsawxM/d1fF4VHnVTKHBKeyutcqOjuUYbTdECA7EYAU0PtJBnr1+QxHanwFVeFx4ZNWxXUIY95gkwgKIVRjte6EvWE1ExCL7zq2pA3FXAEIRmfSEPndWMKZkfK/YiYyDfH57LjxvuqYGDXxwzT2usTpfSPsz/u6hQeGNqbyDbdz0kmycmzBz5o/g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI0P189MB2685.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:215::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 06:51:26 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 06:51:26 +0000
Message-ID: <3a1b32b8-1ecf-4cb0-b178-432a56d95e84@est.tech>
Date: Mon, 5 Oct 2026 08:51:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/4] libjitterentropy: upgrade 3.6.3 -> 3.7.0
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 mathieu.dubois-briand@bootlin.com
Cc: openembedded-core@lists.openembedded.org
References: <20261002071557.74249-1-jaipaul.cheernam@est.tech>
 <20261002071557.74249-2-jaipaul.cheernam@est.tech>
 <DLU83IUWHFP0.2IU6H1IY0JSAW@bootlin.com>
 <CANNYZj-gd90Ls3UOXrQsSmfmNqiJXRunO2xC1btwpDSAUxCHrw@mail.gmail.com>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <CANNYZj-gd90Ls3UOXrQsSmfmNqiJXRunO2xC1btwpDSAUxCHrw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: OS6P279CA0014.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:e10:30::20) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI0P189MB2685:EE_
X-MS-Office365-Filtering-Correlation-Id: bd525395-9b44-4de2-dd35-08df22ad1386
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|22082099003|18002099003|10067099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	DcinL+GidHROep9oGv7oTYuao53GHC+FF3TuC36M4P76NGLEMY6fLgDLoG0hEudILDnNlG/TXhlP5yfRVPidPFVZvT+Tzssiv+Dwpme0E8c/meTpw3Rhg8LpgFdRz+lLMmo/xbORJvgkvj/dR9H+762aRBY9Q6VJ8iUpE6CmPj/Zh4m4uCO57HLuIvgS1S+/Eq6zdgYGbmx9uJ5kv5shAqZCzkrNvTKh/7Q0ij3vQJfB2CxqeO2RbfsJsm5vbd7vK8oh0M+SRqMjaJR9s+AhM9BG5wnrxyQ1IfVOapZRmWxTV75afyHsuYBL1Ik4tL/mypbwFsP84kfK5fHryCg5KM69QjPT9d4cV+gVyn2y9D50c/cWqSsrzJTrnMmCM7z2Hs0IgelbDxBSsWESw5872wPT2gtUSwIQsQ+tPFDos9jwyL4HNQSQp/05V+NxaQCFUuAsXQlLaTs2UJ1sxYZaRDbapchof5MHcURlXEpyJ/0EOaJKZMrrWwlatdkgP41lhBD5HQJvSG0ztSeAE7dsWEJfFoZAHj0zzSoDkcH1Vt8X5+zG+OIC5XvXyCnerAlPTxxDj2qhZ9pKTod0C7CkXGHjpevoc7PYiqhSwVFe0TwknUct+9hUBqVF7pKyFh4y+Tx52/J+OcychbQSl7VuY+XIlwALDKKOo0HCUws+WrY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(22082099003)(18002099003)(10067099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TEdaQmY5VXkza2VocjMxbVh1MTRMQ2pOWU11UDJpVCtmWERGQkpWNndzTEFQ?=
 =?utf-8?B?SEM5NDBmb1RxejNILzQvQmRNelVKSk82MkxmRXNWZzlCUmJqU2dqc29Ebnpq?=
 =?utf-8?B?eGNyUUJhZE9YSXVLSU5xUW1pZHgzejc3VFZJT0ZrK20zZkJtcExuaXhNdkxo?=
 =?utf-8?B?cndCdXBaaU1NMG1LaXByUnVDaVczYk50aE1mV3FTMUFXdXBxZUFWTEFkeGky?=
 =?utf-8?B?UEFWTSswWHh4aHd0SFhrU0w4MTFHb0N3c0VNZlh3eWljZHBibml0TWc0MGZP?=
 =?utf-8?B?WDNha0Z4OVM3Znk4QjVLNWNlZVVJSjVxQkV5WlZubndpMGNubThvMHhZNlFm?=
 =?utf-8?B?T29jZ3U1MnlXdkxVMHk0T24xUWZOMzRnbU9NekNJMVhHYm9aTHd4SmxobVd2?=
 =?utf-8?B?UVQ2YzFrN05kNUd1NUZ5T0NwNkxJYVQyQXZCRm0zZlFQNk5Ja3c5MStQRVRa?=
 =?utf-8?B?alRxRkRmK2c5aVdoNkJnY2dQamNZWno2Y0Uxa3c5RFZLVUd0YlBHZ0lvS1Rm?=
 =?utf-8?B?RFVuY0hscWxaYktodmRpNjhmU0I5eWU1OWtHUmF2cmgwZGhCR1dENnVSOFll?=
 =?utf-8?B?SjljTTNNR0JDcCt2VmdnN3VBdEJzTWVSbGlaN3VzSFJtOFJ2dnc5RkZmMVhj?=
 =?utf-8?B?ck13cVlFaE8rd3czM01HZjk0NmpvVlhjeW9EMHVSVDE1Nm9IOFBMb2M4aHlN?=
 =?utf-8?B?KzRQRC9LOGhSdFR1OExQaWN4ZlJmVTg0dXlPY3pQQUZxdXNTQVl2NFdIS0VQ?=
 =?utf-8?B?dTNheG1GQ1puK05wdzA3UjZVNlpwaElUdkdqTXBQNElwUHZMSzhRRVB1TjFF?=
 =?utf-8?B?V1JTYy91WWJtM3lyNUdod0pSbWk5QTJPd3lMdmxSZUIwOVVudkMzSjRsOEp5?=
 =?utf-8?B?SHpZbnRQcmErR3ZJMERtaHhnUjBtdFFSTmxpbDF5clVabWVZNmNodlJCYWIz?=
 =?utf-8?B?bTFhSHg0RmM0aXdrcVJxb2lFNkhwYzRkVGhVYkk2eC8rNys5Q0RLSFB2MURj?=
 =?utf-8?B?R3h3bHhJRHNUTnBzYUlEMFNmblk0NUs0NTZVbWFrcnBNdVJqTEExWkRWdDdG?=
 =?utf-8?B?a1p2UnF2OGJWM0hJTmNDdHhzUWRkU1R4UnRIdm16Q3E2N3lxVXpmZnE5aXpO?=
 =?utf-8?B?UlhkRmMxYm5JNU5qc1d2cnFtOUxlN1lOa2tpdzNOYmZIc2YzK2lkWDVzSkJt?=
 =?utf-8?B?NFVRV1ZicTBCYkFUb1h1N3BXemNYYjZXUTh6czJ0UkZHZnBqZXBCdGVpaVpQ?=
 =?utf-8?B?UVlIUlhJL042RnRSVEp1TWRmODM5Tk43cW5uRnJCcWNyN2RtNlZIZkhQL3BE?=
 =?utf-8?B?V2ZwZ0FwcnJmU0RIZmtIZWlqTTZDRklwYjZYRDZFVW9NZmNsQ3dmT1l1eVFi?=
 =?utf-8?B?UFpxYlJScTJaMktHcm5tZDU0ZytNeHYvaGJJKzVRWkRvQ29VZFExWmU2NnhC?=
 =?utf-8?B?TjZVQW9VdHd3S0NJVEJYMFVSWnBHSngrRjM5SksvRGRiUW1SMGxZZCtQbUJo?=
 =?utf-8?B?cStDbGMxK1MwZ1dSU2NNaVA2akF5OXVnbTg1SThkZ2hiM3dJOXlVaDlqTUlO?=
 =?utf-8?B?VVBiM3BnRjZnNklkZWR2TFVmbGI4Z1prZWdDZGM1cTcvaGdLN2xWM3pNOFVO?=
 =?utf-8?B?K2czWERnTHhBanEzYmp0UmN5K2tMYTF1aUVNZVlVQ0FySzNzOG51aFJvRFJI?=
 =?utf-8?B?SWRnaXlxa2QySGQzaTV3N0t3blBuREtFTGI5Z3FQNHpLYWdtOXhGK3FmZEdy?=
 =?utf-8?B?S0Z0VldqZmt4RmNzQVNsRms1YmlvUDcvRTNMYjBPdkt6Z2FvdnpCWGJmQjFK?=
 =?utf-8?B?dG1hTXB4MCtIYTJ2VG91SUU0czNka1JSN1M5YlhkN1VNcHlPbWdzYVJzUGFV?=
 =?utf-8?B?SE9KbTJrRU1qZHdTTXBpTUcrZ0RkR2dhVE9yOG9lZzB5eXBlMDRXcTYzMGhZ?=
 =?utf-8?B?WnBvdUp3cHN2T0lPZmw0L2NRcDY5MTIzZlVycXUySkkxQmxWUEZQMFEzNUdj?=
 =?utf-8?B?MlAvUm0vTUo5ZHBLeFNtMVJuT040YmdMSXZUZUhUaVl0TG1kV2k5NEVjenJM?=
 =?utf-8?B?WHIrNWJva25nWlZsYkFhOFBZcG5nTnZRSnBSNkZxVVlYaFYvVmMrZVFzYUZE?=
 =?utf-8?B?cUsrcWVQZlNOY2R6RFNuMWgyQ2o4Y0lDMHVFd1RyTnorQ0REQWN6ZlI2UnRI?=
 =?utf-8?B?WEtkS3ZieGVNWDVOYWFxZDhhSndKWGV2bmpydHVJcE5tSlJJU1lxVzhiWnhH?=
 =?utf-8?B?ZFVsVGwwVmw4ZFU4VjJ1VE1VdlAyamdUcDMvY3lnM2pqM3gwY2RyU1lFZnBj?=
 =?utf-8?B?V3ZLTjZHS1dtOU1mWTRycVpRQmVQVUh5THZNZTJEa3k3dHJ5aEl6Zz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: bd525395-9b44-4de2-dd35-08df22ad1386
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 06:51:26.3589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MrLSw7GyivWb4l3nr3Oi1ZGzpe9inAnr6te8cOo+LfrizwUck2aW4jB1ZMSVIeg1G1pBpwRHgQqpV+nd8GhFQH/Fdj7zYyorYNbS1xz1iSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB2685
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 06:51:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247216


On 2026-10-02 11:35, Alexander Kanavin wrote:
> I think
> https://github.com/smuellerDD/jitterentropy-library/commit/a038d0c372f83aba10f3850c5b122dc5ff8cdc8c
> needs to be backported.

Hi Alex,

Thanks for pointer and I will do backport but backport needs more work 
as code differ a lot.

Regards,

Jaipaul


