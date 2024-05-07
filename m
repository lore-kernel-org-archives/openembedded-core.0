Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E4B2C10F1A
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 15:52:47 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.78])
 by mx.groups.io with SMTP id smtpd.web10.15397.1715097163357314523
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 May 2024 08:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=K5Ju6w8s;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=K5Ju6w8s;
 spf=pass (domain: arm.com, ip: 40.107.15.78, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Qno7wSij0Ed4tc/ZYUzQ5ROgsaFQarhuz6kNJX0LctvSBvWABECDKV+ZZ+eOdbLX3T60SzZS4Xf5l5agXxzomTIzsC/GV7qh/D181j6q4QEuyOpboFqGaJHafsqNsXliwzNwj7p+391P5pLgX6rRKJ3K26kpYOkykYvrPgthgaMv0zIqx6JlDriOytDw6FG6R0XUX5aMQcySh8ZtDWulIpASD6wbjD1Fv9UCn4R1kK2qAcUjg6VD0IxQ0h8efCBWjKGv/rzB+9vVL0X6oM5w3SMwZkz48IkAbwmwqXfECIKn8a1n00kC1ssY25aO8WDCwWd4hx6Xwty01zlXUywGig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyOI7baTglciNyv3Skqxl1ZgIirVsfnlfumPan0LTrw=;
 b=AD/W6RPgJGZm7YQdu9lQMvGgG6qPm5yoE2o6isvLcwrjHX0cthaa1w53rLZq2GeG7HOfIs7/RjM8sDcLKDJEmMCn+vrMPYbZCyz1LYRbYi9O1pF/Pr58JI6DP1m7idhiSkLpkXyjsHJBBcIZIaGiDrkFb9W8s2MRTC0QcxE7roTbV323KOZkAJtkK8BtsCnDJc61vPhvBFcpTG4QhiKxWOpUJsIYPWqaoPcu8ltbTwmNWBu5VuJHy97dYgbZ5BOeWqa7P8ejFPMhzrd7NUm0HcXVZFQlQXtFsmKNeAd1u3UzZkl7lzlJs1rpmOXHSmy7RExqTKTwkIEN6JdM39sMRg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyOI7baTglciNyv3Skqxl1ZgIirVsfnlfumPan0LTrw=;
 b=K5Ju6w8sNrFkX/eZtyyQJK8TtjrWNvoOxawoILCiJS4/9cjxRWKUrMpWez12UO2pQlrFC4n8W70bwL+eUsmkOpI31wBpHfNhoIj9h3oPDWjx6pWt7ecLlQHCSvqmNExmA95T4GKTUZS8tWLNw7NLyx/KgqA9ZGasLwayUZa+lUk=
Received: from AM6PR04CA0016.eurprd04.prod.outlook.com (2603:10a6:20b:92::29)
 by PA4PR08MB6048.eurprd08.prod.outlook.com (2603:10a6:102:e6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 15:52:37 +0000
Received: from AM2PEPF0001C713.eurprd05.prod.outlook.com
 (2603:10a6:20b:92:cafe::3) by AM6PR04CA0016.outlook.office365.com
 (2603:10a6:20b:92::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42 via Frontend
 Transport; Tue, 7 May 2024 15:52:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C713.mail.protection.outlook.com (10.167.16.183) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7544.18
 via Frontend Transport; Tue, 7 May 2024 15:52:37 +0000
Received: ("Tessian outbound daa456608199:v315"); Tue, 07 May 2024 15:52:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: adb44294f32f237a
X-CR-MTA-TID: 64aa7808
Received: from dcb2864eb0cd.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C0C9DED4-C3D7-4141-8520-D7A730E1A342.1;
	Tue, 07 May 2024 15:52:30 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dcb2864eb0cd.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 07 May 2024 15:52:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PUtK8EJUa9XEW9Ze3F6PvMu4rhwvAYGYkB2LXoU4xNsqcTIU4rxGXyl0eAA7PeuaJ2YIQrO+8EcS6v7WBHPH2a+ckw+lQYmM8J4zjBd4M/d0h9C2z4HXNwinS3jGaBbKZ03c7q6GiYSfAA0tfw/CCA/6qCCQujBAYZQODN3xYJgkjzBNQqdY1EOYwDVCdjAguygDILdLIrG57RP8ygUoRgapVItUGaZLsiZNGlWH97I/tpQqGIXr+uhJs0jChSw1tlmzh+7t+MmjVoMHHoilgQtSVyYDifmrruiYLE2JXX9NU415+SzYqgagO/eD4jE83rwmISH8ttZighOBOWqRTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyOI7baTglciNyv3Skqxl1ZgIirVsfnlfumPan0LTrw=;
 b=UqmiICoQccYdpTN3dc86BgH1ywZRXFIWeIkzE4xglqBQUKtSreyBBRs7b83rqPY7iuz0RYU7AfU/XkyJuTg9KbdvuyUn8bmktY41LZm7AETqabCdNXpWPedqIGfyUx2kstYlORlhVATDarQxBngw6GSOMpFlLUFYlfyE8Kly+FfHGWhhvxg2VlPPm0u1IX7tSTeo2HsgQpIE77iNSdxFVIhdPK+jvBRwbm+8TvSWia36xdySenHbgm/6Q7g6pjwsIuP/qAUprGda8Ugj9Hw8O792h5Ge8uL3FFEJbyAdP/Z1YTQ/YXKjUOx6dKAuEYavN6SlJH3L2pTiQSX37YysWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyOI7baTglciNyv3Skqxl1ZgIirVsfnlfumPan0LTrw=;
 b=K5Ju6w8sNrFkX/eZtyyQJK8TtjrWNvoOxawoILCiJS4/9cjxRWKUrMpWez12UO2pQlrFC4n8W70bwL+eUsmkOpI31wBpHfNhoIj9h3oPDWjx6pWt7ecLlQHCSvqmNExmA95T4GKTUZS8tWLNw7NLyx/KgqA9ZGasLwayUZa+lUk=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by DU2PR08MB7328.eurprd08.prod.outlook.com (2603:10a6:10:2e7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 15:52:26 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::bbc3:7fff:f224:c584]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::bbc3:7fff:f224:c584%3]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 15:52:26 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex@linutronix.de>
Subject: Re: [OE-core] [PATCH v2] glib/gobject-introspection: update 2.78.4 ->
 2.80.0, 1.78.1 -> 1.80.0
Thread-Topic: [OE-core] [PATCH v2] glib/gobject-introspection: update 2.78.4
 -> 2.80.0, 1.78.1 -> 1.80.0
Thread-Index: AQHanHwq3o9YIJa6xkieUqjnpyfnG7GL9BeA
Date: Tue, 7 May 2024 15:52:26 +0000
Message-ID: <8272EB4D-B779-468B-9A14-1F7415301046@arm.com>
References: <20240502103252.1102710-1-alex.kanavin@gmail.com>
In-Reply-To: <20240502103252.1102710-1-alex.kanavin@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|DU2PR08MB7328:EE_|AM2PEPF0001C713:EE_|PA4PR08MB6048:EE_
X-MS-Office365-Filtering-Correlation-Id: 760b5401-bcb3-419e-3c26-08dc6eadb81e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?REs5NzRqemRGZ3N2b1diT3Q3c0liU1AwclZ0ZDRiZ3BNM0ZjcmJuVUVzNXdn?=
 =?utf-8?B?ZGo1eE13eVphYit1cDYvUWZUMmlNZ0tyRjVxUUM3TjJGc3JvMXBjaUJVS3VO?=
 =?utf-8?B?U1hwZ2ovaERqbWMvVVRSQTBOaDM4Wng0Z1ZSVjRhNytpcUp5WTBvazI5L2Vv?=
 =?utf-8?B?UEZFQmI2RGp0OUg1OWZCSlIvbkxQN1BpSlNGWmxYWUFwOWsvZDZOdk5tS1Ra?=
 =?utf-8?B?SDQ2TWRNeDJhT00wTHNEb21KR1RuTG1wbG9aYUJDNk9KYkxaU09HSHYzcjdE?=
 =?utf-8?B?MHNHbWtua1JMVnUvUDU4NEFWWWFHemdJVEowdm9Rb2c1cFA1bnVYSFJScy9U?=
 =?utf-8?B?d3BLOUJhem5uSVRLRy9LL3dlT2w5VHNSZDFIRlBKbkIxM1dCd2VobHRpY0FP?=
 =?utf-8?B?SlRuNjk3dGFpb0x4VEEzNXJ6Z3hyWUNXRHRIeU9nYjVaUlRBazRBMUYrNUkv?=
 =?utf-8?B?NVR1cHBvOTdKSHdBMDlRaEhvV0NYYzZwbE9RZXd6THhUZUdxR3BKU0NwRDlC?=
 =?utf-8?B?cUMyVmExN1JZbjFTMHI4ZzhnWjRPaWxGZXR3RWNNcVJUWVo0ZzZMSUQ1VmNo?=
 =?utf-8?B?K0V2SUVOK3JneFJhTTM0anZpWW85WCtpbTFzT1hiWkFQQkxJVExWa2NrWEtH?=
 =?utf-8?B?S3hIVjZTanN3azNrSTJWeGx1S21HM1JUUExqN2pYS25CZWhmVWpYMGxVTjFM?=
 =?utf-8?B?cGwycUorZTN6NWl0a3Q3ZE9ZN3hEZkF3RWZEcVdCeHI5Nm9YQUJxVkF2K1g1?=
 =?utf-8?B?cllOYnRweFBKV09RVmk5SVFsSGRnMGlYcUx3RWc2L2VPQ0VCanFucThQUEZ0?=
 =?utf-8?B?MEhKZWZLNy9sbFVRenFEV0I3a0JSU0VtKzlQRXlUREZBVkh5QmFYTG5Oa0JK?=
 =?utf-8?B?WkdnejZYYy9jWldxVVh4alF4VUN5Q2ROUHlYTnlQa2FxY2g3WFRBT1dTRVZq?=
 =?utf-8?B?ZVNCcHlyb1lNcHhwd090Q0RQRVk0QllZbkMrcUlES0ZaVWFwQ2ZiclBKN09j?=
 =?utf-8?B?Rlo4T0hpdERLTm9xSmxGdWwzSUExanhRanhyQ2VpS3lSb1JWamhFUFhrUkZl?=
 =?utf-8?B?djFwc3ZqaHNHZ2JmVGZkRVdqVHBLaE9Tb29FUnNub2RqWUxJaUVkamZuREFj?=
 =?utf-8?B?UG9NTW9XdUtxZGtOVW16VUVrTEtyVGxDWjRmQnlpOW1TQmhZeWpqTFFKaGkz?=
 =?utf-8?B?cTYzTVZHVTV2d2VSV2NMWUkrblUwOHRocDc4UmFGU1hoZStuZE5EdElRckd2?=
 =?utf-8?B?Y3FpejZYOHRocS90NE1EdTVuZEhoVnNjNUJhNiswU2xyN25hclNkdUtKZ2xl?=
 =?utf-8?B?WXZUcXlkRmlxNXgrQ3pVdytzVjRtMGlVU3pEYkxFbTlQMWlSUFpMcXV0U2o0?=
 =?utf-8?B?WFllMDV1YkdzRVpwQTU1VkUzOWUydG45dHZBM2laS0prR0N6a0paWktCV0RW?=
 =?utf-8?B?cFNZbjBTUGtJZXVaS1NJMW83enFqV3QwRktRUFNhem9CalBvVUoyaTJYK2R3?=
 =?utf-8?B?MG11dTJ0eTkzMzlYZ24zcklDOHY3aVI1NWIrMDQza2VZZW1ycm9kd0IvNkxE?=
 =?utf-8?B?NVVaQnhpcmhncSs3cDJ0MWIvd3puOXFDYnRYV1o4NWdzMXExY2FsY1BwT3Rl?=
 =?utf-8?B?UEZRN2VHVnRMMU5tQUJHb2JvQzBLR0NBdEJxNmRhM2JTSXJVQk5PaEhNSDM2?=
 =?utf-8?B?eGZELzl5VUFEUXdNTTVEMUpocUthV2hOaXJMTVZVZTE3dVJHeDhsZFRBPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <36B0015AA554FE41A96C3B3E8F4C85C0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7328
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C713.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a7dad094-88bb-4b4f-6dc6-08dc6eadb15a
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|36860700004|82310400017|376005|1800799015|35042699013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Wko1c2ZaWktQTHdWM2Nvck83ci9RY2dXWmljWXBodkJrbTJtYUg0SFJMWlVL?=
 =?utf-8?B?ejhUVThqclZTTTM1Y0UzckhIbUVnZWw1U3RCS0JuNUVOb0dZSUdMU29VellR?=
 =?utf-8?B?SUR1czIyUTUrY1M2V2VGclBDcVgyYmFxT3p5WXpOTTFrQzNET3c1OHRHMlN1?=
 =?utf-8?B?NjN6NjAvVm9XazlPV1dqYVJmNGVtVC85ckpXdzZ5elczWWFmemNSTFN4SkpQ?=
 =?utf-8?B?VjU3bE9TVmxrZ2VhaGQvNnBSSEtlbTh2OWxRWkVqc2lsdG5OdUg1VEpvUXFL?=
 =?utf-8?B?YXBRdHBKajBuS2xhUFVTdFdLb3VuSkZyVHNLeGJ5SXVzaFpRNGFKV0NGRC9u?=
 =?utf-8?B?WGlqVEQ4UTh6Rmp4Q0hTUnZ0ZzZaVk1xSHlsaWowNEEzem81V08wVGpweUhC?=
 =?utf-8?B?dGtGRlNVYTRHNHVld3h4T2UxUVZUSHFSVENQWkwzSmFoWjdCZktsQ1BPRm96?=
 =?utf-8?B?ZTdPaDJZdnFGeXpQMzg3QW9DZ2pudko3ZGdKbTk0b1VvRW9lOU9vMHFNRkxs?=
 =?utf-8?B?ZCszc0NDUStkd0xickdpRk9WZTBXa05EWEQ0bnR6VnE5STIvKzZZVnRJcyty?=
 =?utf-8?B?blp3OXVxSEtNN2dBNStwUFFDem9IZzQ2ZHY1b2VrY3RvVVE0ZzZHcnkwSmx1?=
 =?utf-8?B?THlSWkszb1F4UWkydUZDWXJPK2wwanp5N2NBQjNxNUc0MjdSMTZFNmhGcXZ2?=
 =?utf-8?B?Sk9lek9UK3Z4N1E1LysxUnBwSjdWVGkyKzBRU1VacTVadU9oUHdSaFN4Wmlm?=
 =?utf-8?B?QmRMRFdXT0FTMVhRMmNEZEFOaGtaZVlPb01SK3p0dmt0WlRoandmcncyOWtQ?=
 =?utf-8?B?OWhHb1F4R1NWN3FCamlTdkw4cGo4KzgwS0xsMzQ4YU92YXU5dGNNS2dFd1py?=
 =?utf-8?B?QUpwbGM4dlI2VVo1MSt3N3BuSHpuSGU1QXJhNW1TaThRUFQ3SHQ5VW9YdUxB?=
 =?utf-8?B?Q2lzdElZVnpTcjNhM1c4SURibDhocTdJLzRNb0h6b2tsdkdWanFzVVprTTM3?=
 =?utf-8?B?VmRaT3JSazZpNWxBNXRvUWxNa3QrbnN0ektCNWtWSjRaa00zV3lRTFA2cy9l?=
 =?utf-8?B?dXR3Nk5vZ1ZqZkZtSEhQRjhXRzFLRjJJQ2hIeHJlVFFHcW1Jc0NLUTJNdEcy?=
 =?utf-8?B?R2RBYndJRmQvTjZTZ0ZkbVpybmlyb2NnUzNzc2NPTFpzQVd6aWxZbmx4aHlN?=
 =?utf-8?B?L1grWXZFUGhkZ0xXWmZjTGxqMkxVdUt0RjVoSW9XbFZ6Rzg0U0E2aFR1bnhn?=
 =?utf-8?B?c01XQjFlUEhkd3dMLy9WazVMck5FbnMzdG04aWIybS84VE16QWdJbmFsQ1Jy?=
 =?utf-8?B?MnpqYUlyZzRqYytGRlFEd01ITzBuR2k5MXBid0tsWTQwZERaZkFDLzcycGhU?=
 =?utf-8?B?MCsySzFZZlpYYlFPeVQ0VjZFR2JCemxFTXRqWmNuemttYTNHM3NQTFllTUJY?=
 =?utf-8?B?ZS9QejQwcUJPQ1NVSWZROUpkL3c0T24wRlBmR0UzamlXQTZ2NklSS3Ztckpp?=
 =?utf-8?B?c28yQ0NKajNncEVzTUFHVnl6M1pqV2ptdHJQVG9ZSVJwZXBYUWdhRmk2ckRa?=
 =?utf-8?B?M2J5VVdqY0VHK3FqdnlPYmJ4dXlyWmpORWpXeWJtNnhMQjdtdHNEaXJXRTVp?=
 =?utf-8?B?UjRta2wrTCs5MXBJRlJ6ZzM3THd4MFE1SzN5aVhBVlN1azZMa2dNZlVSTGcz?=
 =?utf-8?B?c0d0VUF2UVcwUmthZ1NzdCt1Qzl0ZGVJWWNNaEpKN2l2ckJZT0x1eC85a3ZB?=
 =?utf-8?Q?35P6xc22DaeQ3LvE5ZaRWqHF3IQA5d6PiHbRGiG?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(82310400017)(376005)(1800799015)(35042699013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 15:52:37.6685
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 760b5401-bcb3-419e-3c26-08dc6eadb81e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C713.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 15:52:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199099

DQoNCj4gT24gMiBNYXkgMjAyNCwgYXQgMTE6MzIsIEFsZXhhbmRlciBLYW5hdmluIHZpYSBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnIDxhbGV4LmthbmF2aW49Z21haWwuY29tQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc+IHdyb3RlOg0KPiArKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxl
cy8wMDAxLWdpcmVwb3NpdG9yeS1pbnRyb3NwZWN0aW9uLWNvcnJlY3RseS1pbnN0YWxsLS5naXIt
ZmkucGF0Y2gNCj4gQEAgLTAsMCArMSw4OCBAQA0KPiArRnJvbSA0ZTZiZTVkMTVlNWQyZjhlNDk0
ZDIyYTNkNDliNjIzMDY0ZjljMWE1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0KPiArRnJvbTog
QWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4NCj4gK0RhdGU6IFR1ZSwgMjMg
QXByIDIwMjQgMTE6MjQ6MzQgKzAyMDANCj4gK1N1YmplY3Q6IFtQQVRDSF0gZ2lyZXBvc2l0b3J5
L2ludHJvc3BlY3Rpb246IGNvcnJlY3RseSBpbnN0YWxsIC5naXIgZmlsZXMgaW50bw0KPiArIGN1
c3RvbSBsb2NhdGlvbnMgcHJvdmlkZWQgdmlhIG1lc29uIG9wdGlvbg0KPiArDQo+ICtVcHN0cmVh
bS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL2dsaWIv
LS9tZXJnZV9yZXF1ZXN0cy80MDIwXQ0KDQpJZiB5b3Ugc2VuZCBhIHYzLCB0aGlzIGNhbiBiZSBC
YWNrcG9ydC4gOikNCg0KPiArRVhUUkFfT0VNRVNPTjphcHBlbmQ6Y2xhc3MtdGFyZ2V0ID0gIiAk
e0AnLURnaXJfZGlyX3ByZWZpeD0ke2xpYmRpcn0nIGlmIGQuZ2V0VmFyKCdNVUxUSUxJQlMnKSBl
bHNlICcnfSINCg0KV2h5IGRvZXMgdGhpcyBuZWVkIHRvIGJlIGNvbmRpdGlvbmFsPw0KDQo+ICMg
c2V0dXB0b29scyBjYW4gYmUgcmVtb3ZlZCB3aGVuIHVwc3RyZWFtIHJlbW92ZXMgYWxsIHVzZXMg
b2YgZGlzdHV0aWxzDQo+IC1SREVQRU5EUzoke1BOfSA9ICJweXRob24zLXBpY2tsZSBweXRob24z
LXhtbCBweXRob24zLXNldHVwdG9vbHMiDQo+ICtSREVQRU5EUzoke1BOfSA9ICJweXRob24zLXBp
Y2tsZSBweXRob24zLXhtbCBweXRob24zLXNldHVwdG9vbHMgZ2xpYi0yLjDigJ0NCg0KSXMgc2V0
dXB0b29scyBzdGlsbCBuZWVkZWQ/ICBJZiBzbywgbWlnaHQgYmUgd29ydGggY2FsbGluZyBvdXQg
d2hhdCB0aGUgZXhhY3QgdXNlciBpcyBiZWNhdXNlIGEgc2ltcGxlIGdyZXAgZG9lc27igJl0IGZp
bmQgYW55IHVzZXJzLg0KDQpSb3Nz

