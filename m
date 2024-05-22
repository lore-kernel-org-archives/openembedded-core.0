Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 924A5C25B77
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 06:43:18 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.120])
 by mx.groups.io with SMTP id smtpd.web10.3645.1716360192974690848
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 23:43:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=vDua/EOa;
 dkim=fail reason="dkim: body hash did not verify" header.i=@topic.nl header.s=selector2 header.b=JYS2zMGd;
 spf=pass (domain: topic.nl, ip: 40.107.21.120, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=fail;
 b=VlsS5TxZuC0ENvGFQdi4700KVdiwGicehSyr7uySrCRPT8HeGYUHNdkdTtNssphOUTezZ0L8Oj/ddKi7GbAeu2T2nyfTPDNsM+ihz5DuwNDgpyW41FYlfGTuygPlwORwSbou5jy16y61mZpY6tstpJ5qVll3+IKJAxdLKIIihiTUae6byyyw5iWdvFGvuG6NvUVZ/Xi4wB3J7LVpVedmsgqzjAqLCezcISSNS9Ex0w1XQ1lu+X9mF1cmlNfBiPVT36ZcNGyBS7UrCn/d2jfqoV0ODpjeMuDykjc12DLkrjQMcoKNEyJor6ANz+QpBiTL3ERotWgvqvOQaU6k9qF3uQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+cDKM1Dmfzy6APQPFY3E3MTjRWURdTYngjsEgIf5vA=;
 b=Q0n6EFq0MEXxWv0LPTDUJGvF+ief5xTSe0wqZosz2m3mGRWu+SjHZnaEUYZvVGDl8JCxN3LWDeREpmkZMlt8dQyuOzeCV+cDY6KTDoHvZlD5NjA5Klq5tToEvLxaJ9P9Fi0IFvsskfDzrF0KneKvfjfzXAYXbQ33COJ3RuV+lgPz2k882Z95JXRA+SRPMSlIHWxXMxJLIOyibq8MuWYPKd+DPsEm7alN/O+OU+4gDgERWTGroIV7Tq3+LLX0fx9qR157ONprbYDiMgOvFkPG39E52X76uW5JBGb4qdKeSNe/rEcBd58iDal8U4OYxTndC5npjGG1ZiS14dIIIf6sUw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=topic.nl;
 dkim=fail (signature did not verify) header.d=topic.nl; arc=fail (47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+cDKM1Dmfzy6APQPFY3E3MTjRWURdTYngjsEgIf5vA=;
 b=vDua/EOaPD+WKaXqgazIKwFW7GAUHXyi0po6ykpnrngQFsayJXV2SZx4NK4anuU+8F3zQfDWYm7iZvZLMFK2EIWdWe8s3mSzgT8iswoyxzMvJhlL2egxHOvwho6p7lVEadYxtrpH1R3xwX22GdlVXpSRDbyOAgC+8USInEkt0vxTPNOqG4htb9zKMHg13kGtrqUuD8N0qaPVzpEtdxFfOw4VWi03P0dxTkqy+xxjVaH2zmWI1KCgPZIhW/cAMy/7Dpbvq1/xVGt/CecQq6MN9LGVbakpLivrDwXmjBKkU4++afX/t/poRuPgvR9oOWbMCXGXCWpE0NVSlKaU9mTuJA==
Received: from DB8PR06CA0010.eurprd06.prod.outlook.com (2603:10a6:10:100::23)
 by AM8PR04MB7441.eurprd04.prod.outlook.com (2603:10a6:20b:1c4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 06:43:09 +0000
Received: from DB1PEPF000509F8.eurprd02.prod.outlook.com
 (2603:10a6:10:100:cafe::e3) by DB8PR06CA0010.outlook.office365.com
 (2603:10a6:10:100::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19 via Frontend
 Transport; Wed, 22 May 2024 06:43:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=fail (signature did not verify)
 header.d=topic.nl;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 DB1PEPF000509F8.mail.protection.outlook.com (10.167.242.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.14 via Frontend Transport; Wed, 22 May 2024 06:43:08 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (104.47.18.104) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Wed, 22 May 2024 06:43:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cw1VACWXbA9sfNTibsz7iA416v9+AFKaa+Qqi8p5iqfzUgsFZ4eCWfd+w4rS9y4ZCMVN9s8karUZtEgxx/qQiWymVg6nKmetG5mVi5hURwsWkZM7tq0SPTxTvhKn0B9iafGy9DJc+iEDzAjap6m7ltArATHmIeSm5JS+nOSakhWdVw4L0Y350SkWAqvCvzzVicvlWB6gu1H/+jKkIOu0CIyq++895zJ6vYyl/Sv0VcRorSPZiZZLhTbUKkQcO3619eAvt9xTGkGAPDZ3pguBSdsRCzxfRIA8XxuazH8KDyczdkze2qI6dvG28j95GWYXnt6vL3/ux739jz28nG5Pew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hc8j5u/hx6ZQltSRCZ/dBQa5/hL4409erqDbj949Zo8=;
 b=UcY81+N0JTogHkKaT/wWLJ6jye87VVMVckPLLsgxrnSWEx3/0t8S8cF1JCsjGVwVvuzyF+WFvj4iwVjzQ7A/2Jvr3xJg2ZWRqIoM770hFWQssU8p2GHD7JxfZLbof0rLvLCJUkMNdUd1lTvB9fyFFr9TDlWBjxT+mVeWm0hZbzSh38m5Bww7rXEVDNrzlU5JOaWQaSI3Ix2URJzlXrmt5I3AbQNloVs7yoqJP0FgvkVOJYxTRLxvvxDG4ErNYSoZvhLFypa2ZiQuC3cbByqk/5Ro6ENz3CDVAIOU2ogMCQpCUJZTnXof7+/znw1Or2kPiheOIFuaMARIsFp+L1N1bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topic.nl; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hc8j5u/hx6ZQltSRCZ/dBQa5/hL4409erqDbj949Zo8=;
 b=JYS2zMGdQyrRVGdHAQCxY7aT90lg0yKMB6aIqXKh8A0GXw30je9iy3bP5un5HfylWyGsmWzRyo010CbauhH5L8XbWR2YRltzDADHthK0UorVB7V/+bin0mg1AK69Z0W7Mdfu4zOXNrgR+oz2YmO/YQH1BStwxVDhgWNXWB9VaNXDAL0Pesq8UnBIAsRHb2qKkqit10TFzItrKpB+MAiKz65Ab6piJCXPwwVEAgjWv4ril4fbUZI70P4tKcxYY+mHFXiYBrZ5tF5ObDFNuph32z/C6xRLIxBdu8YguN8b14l8UZjTkpaBWRB0m+IhJD9P3CarIFoQHxPgn9zKO3JcNA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by AS8PR04MB8994.eurprd04.prod.outlook.com (2603:10a6:20b:42d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 22 May
 2024 06:43:05 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%4]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 06:43:05 +0000
Message-ID: <802ee008-2325-42a0-be6d-a2d0ebbea050@topic.nl>
Date: Wed, 22 May 2024 08:43:03 +0200
User-Agent: Mozilla Thunderbird
From: <mike.looijmans@topic.nl>
Subject: Re: [OE-core] [PATCH] meta: uboot-config: Fix broken menuconfig for
 "fitImage" kernel
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.cc544a93-e646-4932-8496-82717a21cde8@emailsignatures365.codetwo.com>
 <20240521135705.444470-1-mike.looijmans@topic.nl>
 <5340825db3c98197e448c58b88381562edbed66f.camel@linuxfoundation.org>
 <023cbca2-b5e4-420c-b109-445d7d8480a4@topic.nl>
 <5354eeca5b37a4fd3de0f9afec23ccc834f993a8.camel@linuxfoundation.org>
Content-Language: nl
Organization: TOPIC
In-Reply-To: <5354eeca5b37a4fd3de0f9afec23ccc834f993a8.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P195CA0051.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:65a::17) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	AS8PR04MB8644:EE_|AS8PR04MB8994:EE_|DB1PEPF000509F8:EE_|AM8PR04MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ea4a663-3ab1-456c-05ab-08dc7a2a7159
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?TExKODVHNFBSSXZDbUY3dFIwTFp2UnhGRmdWVllrSHpQZ2VmMTE1c0RFTUw1?=
 =?utf-8?B?ZzIraElFazZtN1U5dFNoVFc0MXBieHlVM1VOZ1h4OENWNTRxUDVHZnJzdHRD?=
 =?utf-8?B?L3pENnFwaFBnWXluZkhMOUUxRW5jVjRxaHcvVnBYVFZaUEZLTFVNWU1JWkJm?=
 =?utf-8?B?WnlsY0lDLzRkZ0ZBSlB5RVVBUzBpeWVwdDRmUmlOOG9OQ015SnZkTitUMVlL?=
 =?utf-8?B?YVZtSTl6SlFyQjNLcGZZZWFNMzltZE5LZ3BxS2F5QXhDbnVWTStxYnhMSnRq?=
 =?utf-8?B?WDFwVTh4OW1mdWxid3NHaFJ4ZXBZVjVDZDNyTEpKd1B3N2xaVTRkKzZmMy8x?=
 =?utf-8?B?TnV5Um9zTERWeXpPYXpuQVBHelJGSG52NVNBdnBRV2VHZDNkU0dPNDdOYVNN?=
 =?utf-8?B?Mkt4MmNHUWFTWENudUVncEw3QXUzTXg4Q1lFa0FFU2hlT1Z0QVJVWFdtblNZ?=
 =?utf-8?B?Wk5JUTBpYWREbHpqT0x4MVRaWnpzcU5MNytWMDVvRTJsd1BKekY5Y253clNO?=
 =?utf-8?B?cThQazg4blV2WTZOZWFxbzQ3VUc1RFRvWFFCQkVIeHU5S1c4ZUUveDNOSy9i?=
 =?utf-8?B?b0pVbXFnckgxbloyZy82SU85M08vY21TUG84WTJuRWhjUTlFQTk5RkRjckxU?=
 =?utf-8?B?ZURlazIyVFhqZllyNnlUYUR1ZlI2TEIrNjdIQ2t1SG81SDFhanV2ODVyKzZB?=
 =?utf-8?B?NzMvdElMUmVNNGo3TUtDWnZIRjhQcGZJRmIwZExMNmNJSEcvUGFXa2p3Vk4r?=
 =?utf-8?B?Y2swaFVkMmxZSzBHb2dpQkp6aE1hd3hiYjRLdE9YYkoxd2krSzZlekZrYVN4?=
 =?utf-8?B?Zjc4UExMaHRPVTlyQTFtWTZta2FzVUk2YlI4MjZIbTJNZFNnc2tzRUlFNHNs?=
 =?utf-8?B?a3hEVzlwR3pvK1l5Z1IwcytHUVVjTFpzTS9XVlczUFFqOFhUdUZ3T2NVZFo2?=
 =?utf-8?B?VHRyUExFZUtRZi84cSs4b2dqbEZ3cWdDZktMWHRSZ1Z3RlJNbEFNRHFNd1NQ?=
 =?utf-8?B?NTUvWUZFNlN2c2RXOXkxZ0YwNzgzRzAvVDRtcXV0aE85clZTSkZoaXZyN0tv?=
 =?utf-8?B?MS9JdzZYa050aXZSempCZjZmQmg3Zk9scVJtdTVVanhRcUdKVHI3TTFWTndP?=
 =?utf-8?B?OFdZOHpzVkFlRzlaelBscTlKMDlTZHBxUjdSb2hlU0ZjWTRGemgxekhXWDha?=
 =?utf-8?B?ZHRvOUxIbWR1dnRCL2tUQXg2Y3lWTDVheWRYaXRNeVk4R2NXOUxEVitISWlC?=
 =?utf-8?B?Qk41ZlRKWTQwNkg0cTErUWNNUWhuR0hLTGNsS1FIVGtlVm16d0YwLzBZWFNv?=
 =?utf-8?B?NEV4bm5WY1Y3ZUdSaGRRbGE4QW5FMkRETU9WaWFac05MWUNURFoxK0FKOU1o?=
 =?utf-8?B?Q2o0b0hscHQzWVZUMXIyME53L0pYbFROZUo4cHdpWmNrWnY0M255RE5ZQ1RI?=
 =?utf-8?B?c0RIeVg2YVdqa2plMXVGZ3RKcVhCVDFyZnpWNjRseWh4REZMNFh3VVAxZm1y?=
 =?utf-8?B?QzlvcEdpeXBNOFA5Um0rNWFSVTRnT3daakJxQ1VhYVNabnRKeW5NTTcydGlw?=
 =?utf-8?B?a2tyZStPM09leCsrTWJvZmxWTXo0ZTJ2ZFM5Y0w3dCtDOFhSQ0tSZzQydUUx?=
 =?utf-8?B?bk1kQlVzTWV0bmk3NWFRUzBKWkp5azZHYTZWdDhZVkFqeTl6M09CdmhPS2Ns?=
 =?utf-8?B?eFNRUUgvUWxMdm1zTEdMdnF2dW9NbE1HMy9KeGxaWGs4clBzNHJ2bGdBPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8994
X-CodeTwo-MessageID: 99fe27c9-6e39-4630-b215-5fd57865741a.20240522064307@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509F8.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	32985704-3632-46ad-96a3-08dc7a2a6ef3
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|1800799015|35042699013|82310400017|376005|36860700004;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RUN6bkIzL2J6ekZ0VjFlQko2NzlmaFp3Z1BOK29teTVmOEIxMmY4MmxpczBw?=
 =?utf-8?B?L2dyWExYbDlYei9WWHZPNjM1VnBMVFpNOTd6ci9KRG5TN2w0c0xrNGNFQUtL?=
 =?utf-8?B?UUY3TkttdmZRK3JDcS9palVtdzc0bjRTekM2bXZCMmtaa3BvYVJScTg4dGlJ?=
 =?utf-8?B?NUM1VjdTeFNHRzNmMWkwVDE2ZzBaK2pqbmV6Z0J1VGxyTHozaUJHWldVMDg3?=
 =?utf-8?B?REZVbEk2T2pmc285bG9RWW8xeUZkVVFDLzJ0RmNPYjdDMDUrSEhYaDB4cmtY?=
 =?utf-8?B?RlU4SEdGQk1UMHpKZXV5dWwvUlFMRjNMaVpCVHViQ3BuUTA1cW5Oa0RSYWp3?=
 =?utf-8?B?WktqalRXVzVYdXlBVHBnaCtXQ05rSEFyVjRvYk9SRlVLY3FsV3BDZ2JwVDAr?=
 =?utf-8?B?WktPVnNxQzV3UmJwVThwWHYya013bnYrbEdKMGZZVVREdzRwSUpWQ0FuZzlR?=
 =?utf-8?B?OUZlTnVnNlJvcDZKNktXL29UMXJsOG1lTnc3OTlVTmh0UEFwQTJ6T05XZWQ3?=
 =?utf-8?B?NlZjUEo5cDc4TzVmTTh4VS9IT3hwSkordHJrMUxsYzZDMHVWbFMweUNnTEts?=
 =?utf-8?B?NWpTQnFkckNTK2tKYUU0dGtVcVVvaWNVcmFXblpoM1VSSzEzSjB3NmJ3dUZK?=
 =?utf-8?B?d3dSbjNsUlpmcnBuQWh5MDNVbDRCbVpEbWpYekluVWZzWXVUMk0wWlRGTnVm?=
 =?utf-8?B?VE9QMi84QUVPcDN5bFplZ09QalpCclBuTjM3WWlUWmNzN3NJQTIwRlpTbVpw?=
 =?utf-8?B?T2FjOTJDbldWamUxUmlvZzBUVDlUVHErckgvMklZVy90TXQ3Mml5L09XaThM?=
 =?utf-8?B?amxTbFd5ZmYrdmdSQ0JwOHBSVmF5eGloNmJmMVhVM2h5dmg1SXA4RzlKM2RC?=
 =?utf-8?B?M2dlTWp2bmhMb2lRaTYweHFPTU1EeEZjWGxBY2trcWR0WkVwdXRnMTFXamxK?=
 =?utf-8?B?KytMdGZVTFlFOFFZNjFVMnpTUGFDS0tVNm9nMXljOWova3NJYzdzdWpHU3hp?=
 =?utf-8?B?OTMwMGxyM08ySmQxaUU2UWx5ZjZMWElvTVBXcHd5L0FEYm0xSTByd1MxTVRP?=
 =?utf-8?B?b3BoRGd0ZGhuNDZ3K0xncDFNa2NaS1dPRDZKYWk3cG0wQjJsSWNzdXZrNEs4?=
 =?utf-8?B?aHNwdU1DWUF6Yklrak9kVWZIc01JaWhNTVc5N2tvY250eC9CcWNxdHV6UXFD?=
 =?utf-8?B?SFM1WWRGQW5yVjZtQXMyMVBOMllUSmxOMTVROUpYRTBWYlhpSC9seVB2S0FK?=
 =?utf-8?B?VDV2ZkRvajFhOWRPbmllVzdXck5FeVRKVGwvZWw3QnRIS3lOR1I1SXZ3dzdQ?=
 =?utf-8?B?MkR1Rm1YSUVIWCs4cElrcVd3SFJsanpqOWJ0dnRkbDRheW5jRlVCM3JQdFJy?=
 =?utf-8?B?bXZHMThGOGJ5WGpSSGg5K0tCQ0Y0ZjhSWnRjYnhMVEhsUnFndDk1alRUL1pp?=
 =?utf-8?B?NisvZE1rQnVQTXUvUGZ6a3czdEJYTVY5enhIdzJCSklXUm1TcWswS0RVTTNq?=
 =?utf-8?B?NnFPOVEvbXJmWU1vTUpPZ0VIeUdyVzR0UkFOcS9xYWJmd2taSnNLQThoNi83?=
 =?utf-8?B?MHppN3k3a2dLck9DaGJrbzVzS1dpTkFJOXhLOTNXSUphK2lEejVXdXpWdzVE?=
 =?utf-8?B?bFJPZUlwSmhwdUJ3MlFjbjB0SE4rNHdPcjIzVktGVVdFRlp2bVExZE9yZTdz?=
 =?utf-8?B?QjZMK1hqR3F6dTdoanBUOGxyZGhMRWZFdUpONlB1TzF4UlJRbGhpUW5PMmho?=
 =?utf-8?B?VElQaTNxdnh4ZXl1N0xUelBYVDhvakc3Wis5cjl2V2tFc25NOG83clkrdlh1?=
 =?utf-8?B?WjBYUlNpVE5zWnFqbStuaW54dFZrNHF3Lzl4ei84VVBHZXRZSnNoSFd1Wmh2?=
 =?utf-8?Q?CPrvTl8hCCWTL?=
X-Forefront-Antispam-Report: 
	CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230031)(1800799015)(35042699013)(82310400017)(376005)(36860700004);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 06:43:08.8017
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea4a663-3ab1-456c-05ab-08dc7a2a7159
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F8.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7441
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 06:43:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199688

On 22-05-2024 07:39, Richard Purdie wrote:
> On Wed, 2024-05-22 at 07:28 +0200, mike.looijmans@topic.nl wrote:
>> On 21-05-2024 16:51, Richard Purdie wrote:
>>> On Tue, 2024-05-21 at 15:57 +0200, Mike Looijmans via
>>> lists.openembedded.org wrote:
>>>> kernel-fitimage inherited uboot-config, which resulted in failure
>>>> to
>>>> run "menuconfig" on a system that has both multiple u-boot
>>>> configs and
>>>> wants a fitImage kernel.
>>>>
>>>> Fix the issue by splitting up uboot-config into uboot-config-vars
>>>> that
>>>> only contains the "harmless" variable settings, and inherit that
>>>> in a
>>>> new uboot-config class which contains the Python code to do the
>>>> U-boot
>>>> specific settings. Inherit only uboot-config-vars in kernel-
>>>> fitimage
>>>> so that it has what it needs but doesn't break.
>>>>
>>>> Fixes: f9e834e31788 "meta: introduce
>>>> KCONFIG_CONFIG_ENABLE_MENUCONFIG"
>>>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>>>> ---
>>>>  =C2=A0=C2=A0meta/classes-recipe/kernel-fitimage.bbclass=C2=A0=C2=A0 |=
=C2=A0 2 +-
>>>>  =C2=A0=C2=A0meta/classes-recipe/uboot-config-vars.bbclass | 95
>>>> +++++++++++++++++++
>>>>  =C2=A0=C2=A0meta/classes-recipe/uboot-config.bbclass=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 80 +-----------
>>>> ----
>>>>  =C2=A0=C2=A03 files changed, 97 insertions(+), 80 deletions(-)
>>>>  =C2=A0=C2=A0create mode 100644 meta/classes-recipe/uboot-config-
>>>> vars.bbclass
>>>
>>> This looks like it might be a good candidate to move to a file in
>>> meta/conf rather than a new class file?
>>
>> What does "this" refer to exactly?
>=20
> The variable definitions you're placing into a separate class file. I'm
> saying they look more suited to a shared conf file, which is a
> direction I think the project needs to move in generally.

a "uboot.conf" then, okay.

>=20
>> Note that this patch just moves code, it doesn't introduce anything
>> new.
>>
>>> We could add any functions needed to lib/oe/ if they can be made
>>> suitably generic.
>>
>> What "functions" would that be?
>=20
> removesuffix is the one I saw that was needed in the new class file and
> wouldn't work in a conf file.

Interestingly, "removesuffix" is a built-in Python function since 3.8:

 >>> 'hello.all'.removesuffix('.all')
'hello'

And 3.8 is the minimum required version for Yocto anyway.


--=20
Mike Looijmans



