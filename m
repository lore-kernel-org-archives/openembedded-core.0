Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E7AC4345F
	for <webhook@archiver.kernel.org>; Thu, 25 Apr 2024 16:34:11 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.88])
 by mx.groups.io with SMTP id smtpd.web11.21805.1714062841710275824
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Apr 2024 09:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=q8kxwMp8;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=q8kxwMp8;
 spf=pass (domain: arm.com, ip: 40.107.7.88, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Yq7OJSE+xYUUUZc8wykLEQOsEjqAgpcf2Faj4Czg7t98JpdQazl0pcXLqAcVJK8qhmQaYxtfl4/vWzbJ8jFMf9QVvQ3tx72vc/BVfmun6IRuDKHwZcDuJLZ1Nb6hHgbdavK+kW1bJW6W59x3lLuA4cEyCZujBT4xFYMRGssvt6V9qE2Ffb5A3DLA1miio71uoFNj1Qun8v1GuMno65oIeIcrNK1Qmj+t+XvkcEM2B+p74Z/kb+JH6e6y+Gf1fkdAj458pls/+bNvi+lB3Hm2ol0awaoab4IxPiUhPEs5/gBqVMs/K17iK0KRW8M5TaybFp0uNjL6cuVq8p6oPZbqXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDzCQfjU7t82zhr17UpjLVpTHCotEjaYySTiXn9+Xm0=;
 b=RswwQUi70tekdglfL9BCk9+T7KjmOqX5euyKWybMyuCIMVUXZepIe/uLV4axtLS5uWcvDW3Bj/SqNu6TD17GIW1aNIgtYopD44fz/TUX+M398FQoeewhgk8Z5FG5+ZF4NXTqmE9mEJ2MgScDYAF1+ZrY91O7lCwPSHB7c0+SGg4Wgo1R4tjGnXIuhMxI6m0reum4+9LRxb7GXq31oK4nGmnMdZkRZrV93v/Tw2mq9E86EEG5aWNrlIuBoVBo58QYDQnkvvTq9UJFkeFRl84uETZb7WWG/invIWuP7bXKgf3Le+rVGXj8b/1c/c1hfpC82dVQmaTlwrfxuwVM7o5tdg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDzCQfjU7t82zhr17UpjLVpTHCotEjaYySTiXn9+Xm0=;
 b=q8kxwMp84+sSZo80kow7N9z+usOok/UtzHk/PkeIaFZ+wfjAs+BmmMLzwlwv637HUKudnExGZsa42R2jDPlyOU73bJ8nvnGI5JF0Nkj3JXm6oUq7YoGA6rZzOVkWmJLksNlrV2yWrQVU53VkpzIU0IRlalgouTi83+EJLvyUWjE=
Received: from DU2PR04CA0300.eurprd04.prod.outlook.com (2603:10a6:10:28c::35)
 by AM8PR08MB6372.eurprd08.prod.outlook.com (2603:10a6:20b:369::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Thu, 25 Apr
 2024 16:33:58 +0000
Received: from DB5PEPF00014B9E.eurprd02.prod.outlook.com
 (2603:10a6:10:28c:cafe::90) by DU2PR04CA0300.outlook.office365.com
 (2603:10a6:10:28c::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.25 via Frontend
 Transport; Thu, 25 Apr 2024 16:33:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B9E.mail.protection.outlook.com (10.167.8.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7519.19
 via Frontend Transport; Thu, 25 Apr 2024 16:33:57 +0000
Received: ("Tessian outbound 082664cc04c1:v315"); Thu, 25 Apr 2024 16:33:57 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9b7346e02daa775a
X-CR-MTA-TID: 64aa7808
Received: from 38deb06b3e78.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 01B02E89-ECF5-4516-9727-4243964C4FF9.1;
	Thu, 25 Apr 2024 16:33:51 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 38deb06b3e78.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 25 Apr 2024 16:33:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QBmOVt5oqy4apdGT8mOVpSah0QpaqR5/LOEhySX5tAgwG8LHVByoiXjMo9UhGvW6vqulT+LSgvhRlWxW9zDQFTvRhT8lCWd/xPR4e3tm3uiv1T6LomkG7nbT7U9iT4as6SxSRQzrHb4hibjkrcuXoGObVxTrOqxExaxA9mAkUfG2FMonSA0MgdvcNWBdl120XJ50EkV6WgfN0vwJVOIIPJsEsfDG5FN9qApF/geUes53iUBkgGH2R40D93CeKgKYsFfCkcA+DaiHJ4StXARuXCvROKnzpPsUsZtpECu3DGs13eYem6o+vKfyiyYh/cYXtO7JZKd6BbwUYDZisD9MLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDzCQfjU7t82zhr17UpjLVpTHCotEjaYySTiXn9+Xm0=;
 b=Gt6A+EeuBGVXVFIWihaVOf2VkALwEvEk3MUkVr8sIX9TYfZRqjUNC+2H94+81kKJfVZLS+FZleZZy1WqU8yt6cQDyvNWrdMYPyC6m2D0FLlc253P6II8MSl7hURo5t4V7JST8Islq5kLGdnlqas4I9CWinl0KlYIi13ABIOkyOaeFseJ0eLrg9Z+dg720nWkquCEsfBzQPGg9BVBXjUf/NjDLun2CDWvwhe1WVO+jmidb5QyufUaElTjCDXIzdUtZvpQmy20F+PM7Gs4TdXkOk3VbHp0GS5VLfwG/evpXjciuGyfahS/+kjAlNdM3xWiwgFPyzcIzzdyyaB59k2MIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDzCQfjU7t82zhr17UpjLVpTHCotEjaYySTiXn9+Xm0=;
 b=q8kxwMp84+sSZo80kow7N9z+usOok/UtzHk/PkeIaFZ+wfjAs+BmmMLzwlwv637HUKudnExGZsa42R2jDPlyOU73bJ8nvnGI5JF0Nkj3JXm6oUq7YoGA6rZzOVkWmJLksNlrV2yWrQVU53VkpzIU0IRlalgouTi83+EJLvyUWjE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB8838.eurprd08.prod.outlook.com (2603:10a6:102:337::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Thu, 25 Apr
 2024 16:33:46 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7472.044; Thu, 25 Apr 2024
 16:33:46 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "sheng.tan@9elements.com" <sheng.tan@9elements.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Hansen, Alexander"
	<alexander.hansen@9elements.com>, John Chung <John.Chung@arm.com>
Subject: Re: [OE-core] btrfs-tools-native build python error
Thread-Topic: [OE-core] btrfs-tools-native build python error
Thread-Index: AQHalwxbJW1AfnQElUq4taP8ol1rvrF5LomA
Date: Thu, 25 Apr 2024 16:33:46 +0000
Message-ID: <5684983E-FC35-4766-BA02-4D5BCBCB6796@arm.com>
References: 
 <CAMWxwJ0znPDyQAKAwv8PL9GwyCCEpW9+2SDmXsygNyK26_xF-A@mail.gmail.com>
 <CAMWxwJ1aad-ggrC+Bug=RGx1yQcFADOSWiZMDZv8S2AnJ7ntnw@mail.gmail.com>
In-Reply-To: 
 <CAMWxwJ1aad-ggrC+Bug=RGx1yQcFADOSWiZMDZv8S2AnJ7ntnw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB8838:EE_|DB5PEPF00014B9E:EE_|AM8PR08MB6372:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bb1f882-80ed-48bb-4252-08dc65458157
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?MVUyRTNqRFozYVBYbGV1T005MjZVUWFPZ2U3S09vN2dwY3lEMkRITi9ZcXFt?=
 =?utf-8?B?WEFaUVQ0eWowdjdVWlV2UnMxWDNUSnNjcndvWXRhRlU2MWpXTFA0ZE9Kc09V?=
 =?utf-8?B?ZVVDcy9GaU1RZVg4aDdvWitUMC9kQStQMEg5UUxMRWhHYmdhMWFwMUx3a1VF?=
 =?utf-8?B?M2N2cWVjeVU1bjhYQjZ4WFpDSzhuUUFQZjZtbWJvbEVtU0FuUTdPU0xSbGpQ?=
 =?utf-8?B?eFZ0OVJQOFRCdTd1bmFrU2ZjR2tBVXFibjZ1alZGSlpSU1V3SWppeTJxWkdF?=
 =?utf-8?B?ZlNhUWx6WEtGRUJoQ2Z4SGlwem9kV3YrZCtwdDk5VGNwVGRDeTFyMkxja1Qw?=
 =?utf-8?B?aXdSOUdkSGkwUTZaM1JGNU9ERVovK2pwTlNtVjdhblpFNk9RTEdXS3JDbkRm?=
 =?utf-8?B?aWEvUXZSY000QkpxUzZMNU5kS0Mvc1JaZ21yOXZDajlTVDRVdWtPS29PMDRq?=
 =?utf-8?B?bEJRT1pmTnBNeXE1ZXdQbVVtbXZMZS9salVSc3RMbjlsRkFqQ0dGR1FwRW9I?=
 =?utf-8?B?RjJ3YUFYRkF4VDlKZjUrb0ZDRU1mNzZ6UE9BOHE0SldvT2xKanp0RE5tWkQr?=
 =?utf-8?B?MW16czJLVDVxb0hVL0tMaktDdERvMFRrTjY3ckRHRnFMS1g2dGNPakpTekJO?=
 =?utf-8?B?RXdQWGFUZDhXcTZ1YytSWDgrN1hLMElnTTBMckpPRUkrU1JPeW0rWkxIbmhK?=
 =?utf-8?B?TmMyeHZ3MkwxZHpCM1hsMzQ1RndONStxaHcyWjZuTkZCRmpOakRORlJWeWpP?=
 =?utf-8?B?Ri9FYkx3UE5jV3g3WDJFVEZOaGFVSGRxTXVvZFp1bzA3MXVTT1Z1Mzc1cElv?=
 =?utf-8?B?SkhXZE1KUnN2WURrYTE4U2ViZEdjZ0g4UWM2dkM2QXlQZlA0NFR1QzE3VzVi?=
 =?utf-8?B?ZjB6NWN0dE5malhEZVF6eEc2QVlHVlV3MTVQazlmNGdMSUtXSjVOVnlicUgw?=
 =?utf-8?B?L1FNTmQ3ODA3WHhNcDhPRzZuSE5tUGFxK1Q2aUdZYTRsbklCYlJDVTd4dmJ6?=
 =?utf-8?B?Q3NDaU1lSU4rQlN4THdveFVKT3Byak1yVXNnSG5iNFFQek95WlNUQUpjV3Uw?=
 =?utf-8?B?dzNmRzVNTWkvT29CUHNQQ1k0OVVaUjFGMUlXS1dXcEtBSDRKQ1piZWQvY3hJ?=
 =?utf-8?B?aVVMRVFna2pIWVlnU3hybFhlQnBVcGgyOTJ0MjdJN1JPb0U3MFFQUUtxQzZv?=
 =?utf-8?B?eEhUYi9qb3kvY0pESFB2eVlXYmdxdWFZZGRaYmFIRkdJWUxweTROTGRqQklH?=
 =?utf-8?B?TGNGNlNRSXhIbE1LNkdNTmM3M2cxNk1zV0RwVkZBVUdKNXJCdnVMeDlBTERQ?=
 =?utf-8?B?VEhNeUNpaDZCWjdvQk9IczRTckNBNHhmQTFaMFozeWpvTXlWZUF5Zk9tWFJ5?=
 =?utf-8?B?QTJuK3ltR2gyNjFYYW9HaC9PSTJkV2M2ZzZ4MVI4OUlRTTdkczlMTlE2Wmpa?=
 =?utf-8?B?V0o4STdpVGpkaEZ0NGYvZEsxRWFNcFk1S25PSjUxN1p0Y2lMcGluWEozdUFn?=
 =?utf-8?B?YVJTdk8yY0E3T05Fd3RaL0t6aGdLUmNJUTh5ZDN6MUlyTmhkVjNIaXBKNzR4?=
 =?utf-8?B?QXF6NGF0QkpDSXNzQ1lQSithYnR3VlFPZkpkd2xYYlBBWWVPQ1o3RE9zb2Ns?=
 =?utf-8?B?SUpPd1JCQjhVaDRNWWVtblV4Z2dFeDI4OFJtVHp4RUpZKzJKVnJhUDFjcW5G?=
 =?utf-8?B?ZU80MlU5M2h5QW92QmdzRlZSWkM5NVVMRlhjd01temE4QjlPU09tNlNRPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B179EC2EB8650649A3D98F3DBD0F9042@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8838
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B9E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4d61d545-0a24-4e3f-05b5-08dc65457aca
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?a1FDMUcxVjlxMVppQ2w4L3BsT2RyQ3lubXpJNGZJaEpBYUk5dnR1NEZudTgv?=
 =?utf-8?B?MzRDdWVTOHhaZ2ZEOVVGcEpTTS9zSjZXbDJKQjVSQUR6SlF3Qk1CWGp2T3BB?=
 =?utf-8?B?QnhwbDR4VFluYWd6Z3VxUFk3TGxWM1AvWUdsbk1JWDVmZHM0MzIxb3FEVFYv?=
 =?utf-8?B?VFBQTGtZbk84MlNSLzZnTmQzSXFkUG9ncnErTDFRMWlxRmhtaVB1bzFVV1g5?=
 =?utf-8?B?dHJoY29WS1hjWkluV1Z6UkZKbHB4R2x5aXpQYStlYWtqRzJwbjkvTnlLaHhO?=
 =?utf-8?B?NmxXVUI2N3BFd0NJSC9yek5yajJqbWxLaTQrTGhEaldZa2hic1I5bHBzQ05R?=
 =?utf-8?B?N2l0RjNsUFNnNXI5d0FFQzIxdlp4M3pwWEJIVUhhUGpkVXp3OHR4eHBGSFJq?=
 =?utf-8?B?c2tVZmVZWm1NT1RzR0pVa0VLWHA2SWxPS0JnSnNvYjErS3lNYnFpZ0dKdkRS?=
 =?utf-8?B?OXRKY0NTV2lleFJsSlBMd1l0SEV2VkZhRXJZOHJVNDh1VSthZ0VaZWtlODBu?=
 =?utf-8?B?QWdqMmQwVUFnU0d5SnB5blNZekhmeGttbTlGZDdmWmViSVBEc0p2ZkVSTTY0?=
 =?utf-8?B?SFh5M1hoUFdieVRpL0hwY3kvZnBaMVhnMitFWVhLRUNDWStPdnZDdnZiU0Zh?=
 =?utf-8?B?Si91c1QvYm5qckJUZks5WC9hRmFwV05ld2RRUFlFc0RFdlRJRi9xb0Vaa09R?=
 =?utf-8?B?MEpKY3lMZmlncW9ibEtkR2EvQUNSRDZpZU15VGliREc5aFd5TEwrRUY2Kzl5?=
 =?utf-8?B?RXZQbUZqQmVOa3FVQlNlV0M0cHZMWVVzWGczSmx6c2VicDBScFBYUHQ3c2Fu?=
 =?utf-8?B?NEJjOFdwRnFKUHM2Y2trT0dmN0wvRXFDZnBwd1RUMFRHR1JidHpmcFpqcGp5?=
 =?utf-8?B?K3AwMzljdTlneGtod2dTOTJNRGVFSHpENkp5aEN2ck1YSFZBSlBpMUpVU0sy?=
 =?utf-8?B?UGRVZ1pwYldZWmZrUGZiMUY3RE5jRXlHK2FMS0dLUGhDRy9PY3B5RXR3NzFz?=
 =?utf-8?B?NlpFcFVoRE9OQXBOVTFXVWhISThSQnVuNnhJd3I2eVNqVnVkVjlya1Z5Mmli?=
 =?utf-8?B?Um14NmxCQ3RKOXFWSUNrbGhFSTJjNDYzYkI3Z0pnM1ltMVRIU2R6R3dXODNp?=
 =?utf-8?B?NHhRbzBaclV2VkFIelU0em9aSWloZk9EbmpiRGs1YTcwenpGQjcxd3BhdlB5?=
 =?utf-8?B?V1lSajlxWktDTFJoNXhndjdHdDMybk56UVUzT3ZhSi9oUjFNN1FPblZrYUlP?=
 =?utf-8?B?bGF2VXA2TEgwb0gzL29mdFNrMkJaNU9uOHRiU3FmVi9oNlJ4d0dIZVJGVjFP?=
 =?utf-8?B?NEpvMEhNcm51YndJRktUVkdUS1g1T1JBTFhCaHU4eC93c3ZPbTB3OWREdzll?=
 =?utf-8?B?OUY5MTJkTm9ZdXNhVlpvdVdlM04yUWpVTWgvMFdWNW1XNFFia0h6ZDVzcytG?=
 =?utf-8?B?L0ZTRk52UEhPdWdlRW16ZGdtWkZ5dmpzQVdNaUxHNjFrMnJtR294S2prUEFM?=
 =?utf-8?B?cVlXQXJYbTJrQlVlUUF5VmNEd1hxLzdSeGJUNUgvY0srL2JjdUJTQW1MT1ly?=
 =?utf-8?B?WHhPZTNZL0N4K3MyUUY1bC9NVjA1M2lUS2FoaXBOZXI4c2swaW1BTWYrU2Y3?=
 =?utf-8?B?MGJ5K3VNcG5YdExYSlFEN095RWYzWExycllOQ3I4bE43L2trN1J0OTBBclBr?=
 =?utf-8?B?N2trWjhFeWpuaCtmdWZyUGd5RkVPeENrMW1rZU5aNnZDcC93c2hhQkFTM2tB?=
 =?utf-8?Q?9D6M5OlSaeVO/rjj6WcWSobZlfYq1eEDFIESZHH?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 16:33:57.6896
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb1f882-80ed-48bb-4252-08dc65458157
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6372
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Apr 2024 16:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198705

T24gMjUgQXByIDIwMjQsIGF0IDEzOjI5LCBTaGVuZyBMZWFuIFRhbiB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8c2hlbmcudGFuPTllbGVtZW50cy5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gd3JvdGU6DQo+IA0KPiBIaSwNCj4gR29vZCBkYXkgdG8gb3BlbmVtYmVkZGVkIGNvbW11bml0
eSENCj4gDQo+IFRoaXMgaXMgbXkgZmlyc3QgcG9zdCAtIGhvcGUgdGhpcyBpcyB0aGUgcmlnaHQg
cGxhY2UgdG8gYXNrIGZvciBoZWxwIHJlZ2FyZGluZyBhIGJ1aWxkIGlzc3VlLCBhcyByZWZlciBm
cm9tIGhlcmU6DQo+IGh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMub3JnL2Mvb3BlbmJtYy9vcGVuYm1j
LysvNzEwMTcvY29tbWVudC8xOTViNzQyZl82Y2Y4ZGEwOS8NCj4gDQo+IEN1cnJlbnRseSwgd2Ug
c2F3IHRoaXMgaXNzdWUgd2hlbiBidWlsZGluZyB0aGlzIG9uIG9wZW5CTUMgd2hpY2ggaXMgYmFz
ZWQgb24gWW9jdG86LQ0KPiBUaGUgZXJyb3IgZm91bmQgd2hlbiBtYW51YWxseSBydW4gYml0YmFr
ZSBidHJmcy10b29scy1uYXRpdmUgaXMgYXMgZm9sbG93czoNCj4gIGNoZWNraW5nIGZvciBhIFB5
dGhvbiBpbnRlcnByZXRlciB3aXRoIHZlcnNpb24gPj0gMy40Li4uIHB5dGhvbjMNCj4gIGNoZWNr
aW5nIGZvciBweXRob24zLi4uIC9ob21lL2Fwd2lsbGlhL2xvY2FsL2J1aWxkcy9sZi1idWlsZC15
b3NlbWl0ZTQvdG1wL2hvc3R0b29scy9weXRob24zDQo+ICBjaGVja2luZyBmb3IgcHl0aG9uMyB2
ZXJzaW9uLi4uIDMuMTENCj4gIGNoZWNraW5nIGZvciBweXRob24zIHBsYXRmb3JtLi4uIGxpbnV4
DQo+ICBjaGVja2luZyBmb3IgR05VIGRlZmF1bHQgcHl0aG9uMyBwcmVmaXguLi4gJHtwcmVmaXh9
DQo+ICBjaGVja2luZyBmb3IgR05VIGRlZmF1bHQgcHl0aG9uMyBleGVjX3ByZWZpeC4uLiAke2V4
ZWNfcHJlZml4fQ0KPiAgY2hlY2tpbmcgZm9yIHB5dGhvbjMgc2NyaXB0IGRpcmVjdG9yeSAocHl0
aG9uZGlyKS4uLiAke2xpYmRpcn0vcHl0aG9uMy4xMS9zaXRlLXBhY2thZ2VzDQo+ICBjaGVja2lu
ZyBmb3IgcHl0aG9uMyBleHRlbnNpb24gbW9kdWxlIGRpcmVjdG9yeSAocHlleGVjZGlyKS4uLiAk
e2xpYmRpcn0vcHl0aG9uMy4xMS9zaXRlLXBhY2thZ2VzDQo+ICBjaGVja2luZyBmb3IgcHl0aG9u
LTMuMTEuLi4gbm8NCj4gIGNvbmZpZ3VyZTogZXJyb3I6IFBhY2thZ2UgcmVxdWlyZW1lbnRzIChw
eXRob24tMy4xMSkgd2VyZSBub3QgbWV0Og0KPiANCj4gIE5vIHBhY2thZ2UgJ3B5dGhvbi0zLjEx
JyBmb3VuZA0KPiANCj4gVG8gYnlwYXNzIHRoaXMsIHdlIGhhdmUgdG8gbWFudWFsbHkgcmVtb3Zl
IGluIE9wZW5CTUMgd2l0aCB0aGlzIHR3ZWFrOg0KPiBQQUNLQUdFQ09ORklHOnJlbW92ZTpwbi1i
dHJmcy10b29scy1uYXRpdmUgPSAicHl0aG9uIg0KPiANCj4gTWF5IEkga25vdyBpZiB0aGlzIGlz
IGEgcmVhbCBidWcsIG9yIGlmIHdlIGRpZCBtaXNzIHNvbWV0aGluZyBmcm9tIG91ciBjb25maWd1
cmF0aW9uPw0KDQpJdCBsb29rcyBsaWtlIHRoZSBuYXRpdmUgYnRyZnMtdG9vbHMgaXMgdHJ5aW5n
IHRvIGJ1aWxkIGFnYWluc3QgdGhlIGhvc3QgcHl0aG9uOg0KDQo+ICBjaGVja2luZyBmb3IgcHl0
aG9uMy4uLiAvaG9tZS9hcHdpbGxpYS9sb2NhbC9idWlsZHMvbGYtYnVpbGQteW9zZW1pdGU0L3Rt
cC9ob3N0dG9vbHMvcHl0aG9uMw0KDQpTbyB0aGUgcHJvYmxlbSBpcyB0aGF0IHlvdXIgYnVpbGQg
aG9zdCBkb2VzbuKAmXQgaGF2ZSBweXRob24zLWRldiBvciBzaW1pbGFyIGluc3RhbGxlZC4NCg0K
VGhhdCBkZXBlbmRlbmN5IGluIGJ0cmZzLXRvb2xzIG1pZ2h0IGJlIGFjdHVhbGx5IG5vdCByZXF1
aXJlZCwgb3IgeW91IG1pZ2h0IHdhbnQgdG8gbWFrZSB0aGUgcmVjaXBlIGRlcGVuZCBvbiBweXRo
b24zLW5hdGl2ZS4gDQoNClJvc3M=

