Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 912A0D41D7F
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 18:13:34 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16424.1765476805886144335
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 10:13:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=clpO2Dx5;
 spf=pass (domain: axis.com, ip: 40.107.159.18, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=an+U0PJqA1wufacWAEWgLcd2AI1ZI8AiyDuKGgYXSJ9+MQpJp67fYEPm57iVTj9sY8qqZ/nNyap9J4QbcPsXPgTW60ZXQGTTh1Is3WXkJqCE1TnhgWNeuil0CeTxK0n+VVm+fHH7wK0afCeZnv//yuicj614A/D5wgiXbPS9VBzARYI8pgNUOqpW+iEpEa1ZZGim7B3CtqV3EFEuvIXLUzSnCPAfgzcLHrrrJ5lNCDilaoMRLo7vdS4bUgyheAFxO/GnqkMz0mdbYzh8ITD2ypFOjVLdsboAZqoOewZnRsf+ShsDafbi/GuM56jFJlLaasAU9rgumiojB/s3/st0vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oszUE0wzKpTXT2qEzrkjL8EKfvxbAVHPSPX/tXA7zaE=;
 b=elXoXK+QLIKeMbBBP3nftUBHJ8V7kMo9483uGBh8xj8YaY5hvbx1fGyHZO2jjIhxRAgVRB/AEurPaYVnjxnYQY/i3G1P9ipPYs3bZt2jDz1kM3qz4FvKGx4Oys6DK3u4/NFsdW5qRYRC+hJMGgJdj0mP0Qj6JZyZrH7Vy48/ARTYp66H+26XoT67HfVT3R13OZwud9ehs8xg/pCj2/K94rctpBZnc/GPv6ZFMNiZ6hNkNiLfWHISjR1Q74X0X+ru2sIBKoDbtWVRjJltnpinsOA/jOfP6q0qAq0ecvp0oe+lBh8EGWPE76l2roCIjQOxTNm6UzGIyLM5tdOX4P8NeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oszUE0wzKpTXT2qEzrkjL8EKfvxbAVHPSPX/tXA7zaE=;
 b=clpO2Dx50zqJzG3lvxZFU9i79NmTsTAI6lbu+KHmWspJYyofoW+3HdspeNwvPfxjEscoHgaTsCTetckDT2SEXSprq5VRut2BACbjvPNWmxpTF3i6gaWlbzc51kQCaH1aUkcCFnnamqj7FcIB05uc0iAq8dr+HY0VFmng2SxxJVE=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by VI1PR02MB6352.eurprd02.prod.outlook.com (2603:10a6:800:17c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Thu, 11 Dec
 2025 18:13:20 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9388.013; Thu, 11 Dec 2025
 18:13:20 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
	"Pascal.Weisser.ext@karlstorz.com" <Pascal.Weisser.ext@karlstorz.com>,
	Quentin Schulz <quentin.schulz@cherry.de>, Ross Burton <ross.burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 0/3] Add HOMEPAGE variable to several recipes.
Thread-Topic: [OE-core] [PATCH 0/3] Add HOMEPAGE variable to several recipes.
Thread-Index: AQHcaQ7f/8k2m//MlEeQZqcL1TfixrUcP+aAgAAKKgCAADjRgIAADiqAgAAttsA=
Date: Thu, 11 Dec 2025 18:13:20 +0000
Message-ID: 
 <DB5PR02MB102132DE944287CE3B46CEECAEFA1A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20251209132208.402718-1-pascal.weisser.ext@karlstorz.com>
 <9bc6fecf-3234-4b46-8bad-84d93a5e030f@cherry.de>
 <952C109B-6A6C-4388-B937-6200BFE718E1@arm.com>
 <120671.1765463343248308488@lists.openembedded.org>
 <CANNYZj8eLa=GtnkdxmriVmzRt-kh832c2sx_FsJgSef-HcrOLg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8eLa=GtnkdxmriVmzRt-kh832c2sx_FsJgSef-HcrOLg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|VI1PR02MB6352:EE_
x-ms-office365-filtering-correlation-id: 90b87eee-1bc9-4537-6797-08de38e0f714
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?WWhQQW0wc0MzZG5SQmFVL1NHOGwwNzJZMmdvR1Q5cy9LNS9ibXhyQ0VXTHBj?=
 =?utf-8?B?d20zekI1M25yaGl6WEFzcWU5OHozVmVkOTNuOFByaVFxVDRsNy9JZHk2Nmh3?=
 =?utf-8?B?M2hVRUVzd0pGMW1jYnZ5Wk5NMHU5eFBadWZkQkhTMElxc0FLWU8yZVBRejdK?=
 =?utf-8?B?aEJwQXY3VnB5Y2ZpZUdKT01PQ0FPTldCa0hGbFozbDlwTllNcWFNN3h1YXRQ?=
 =?utf-8?B?bFJraFJQRTVyU3VydHhnWk1abXp2d2VLODh4WktOeXIyMlNFNlYyTlBuNklj?=
 =?utf-8?B?M2MwampZeDhjenJ3cEdmZEkrcmhadUZjR2EzVE9tWTFGL00rTGpJRCs4MVl1?=
 =?utf-8?B?TGlsMyt6R1UzdjRITys5MTFDQW4zNDBQbFZCRkFzaE82THpOYmI5RU9KaEtW?=
 =?utf-8?B?NUpIWkU0eTY3dkZoYjV3a1VhN0N1MU5xSWRQRkFEemhtTkZBWFo4dVpGcDRP?=
 =?utf-8?B?NnZ0cTlFRHFjMDNxempHdnkyeEVOOS8xTEZOd1lIN3ZOQ2JFR2FJMDZQU2pM?=
 =?utf-8?B?V3I2emsvR3lJZnBNUWtFVThLVWJkT1NmZGh5ajhUK0RBbU1FeDNzZDBqelA5?=
 =?utf-8?B?VW10UjB6bjFzKzQxWkdRYmo3ak1BVjNrU2tMTi9NQVBjQWRtZkdRT1cxdHpJ?=
 =?utf-8?B?ODNpdmU0eG85MURYQVhURmc1MXNnOUNlb2ZTbW9DOGllUm9CcG5lODNSZDEv?=
 =?utf-8?B?aGdWdWVXTXk3WFNscVB0UUJwamIxUUZVcTA2ait1clRzcUhvK0s0LzRBZ1Nt?=
 =?utf-8?B?UW8wcWJpTG9mWlA0Qyt2ZjBud29xNUVBYVp0eHhvZGlWWmlMdTlpeGppUi9W?=
 =?utf-8?B?UERzdWlSNjdqZnFnVWxqN3ozWGFObEs0ZEFFR0hrWHQ3cTZZZ2RPK2dWRGlp?=
 =?utf-8?B?SHN0VFZ4UFZpZUl1dXp1Vmt3OWdIYnBqYk53QU85OU9IcTBFMWxCeHVmOUJL?=
 =?utf-8?B?V05xa09lTXNMK29BMnRRczdhWnhaTGIwN2x2TitSekUyL0RWM2VEa0l6RWJ2?=
 =?utf-8?B?c1BTcWZES1cvWHAwckJKUXJpM3czUlJIU3RzM1p0Z0ZpOXE5OG04c013eW9m?=
 =?utf-8?B?Z2ZCQXhXaDRDWno4SnpLdmdyclVsaVFFdy8vMUhLZGFyYW90MHBqZTdrcUxU?=
 =?utf-8?B?Zk9Da21zM0ZBS2xnLzRNZW5xb0tNVExPc0lBOVNsVFE3dGtBWkI5K3dlSmpX?=
 =?utf-8?B?S1BqOXBjaS94WEZ2SVJhTHpxVjJVdHhzZlNqTXNVZkYvYkpMajl6WFJGaWgy?=
 =?utf-8?B?UzdUcGlKY01OR0Y1R2FMSTVreDF1L2x2anZIelJ5SGNPNkZ6VHdNOW9QN2ph?=
 =?utf-8?B?RzU3VzVzTlFaK2tDQUsrY0d6bmdFcHI3bVJqa2dhK25TK0g4UVRMWkpYQ0xQ?=
 =?utf-8?B?dU05ZU8wNmFwVm1UZUNUcnB2UGZOcDdXcUJhTHJMckxlWjU4L1JsbVk3aUgz?=
 =?utf-8?B?eFh0RE1zVDdOaG5uSkIrU1hTUnpXU2Z4T3ZWYUJnREc5MGYrcmdJek1aTVh1?=
 =?utf-8?B?MmRMRU5rNFEzNFF6c0JPa0Q1anYwVXFLRjdxNCtXWERuT0o4UHB2R3lrWFBa?=
 =?utf-8?B?MW1qQTlkVHFRMjg5MUxmeWd0Q0xXUUtmbHdqRzdRcy9wUno1U0xnY1ZnNm0x?=
 =?utf-8?B?S2laMHdteldSQkFXMUNBM25waE5WZS8vZzRWTkR6QmpXS212V2phS0Rzbnk3?=
 =?utf-8?B?VkFPMm41ZHcrU1QxRVhpYmVYNmdvMHR1Zyt3UnpiSVBkVWs4Rm5EQ0dJQ21L?=
 =?utf-8?B?MUxTOC94NlpKeDgzSU41THNmaFE2UWl6R1UvNFBLZ0QzaFhFNmx1Zk5hS2FU?=
 =?utf-8?B?U0xYdllVZHpZd2ZYTzk5V2hiNVZDMlVIK0lLdDVwS0xkeEo0aHRVWUpTaXZl?=
 =?utf-8?B?UjN5YUEra1pxd2k2cU5ZQVVwVXZBRGdiUWlUZHNCc0EzeHh6alhKWTczd1JV?=
 =?utf-8?B?UE10MjY3Q0dlaktWOGRocFprQWI2SDJ2TnpKSHNCUmVlYklNRHFEMW1rTXJw?=
 =?utf-8?B?UndjY2hQN0ZBPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OTZiV0N0czE4a0svaHh0Wm91N2szeFNmY3poYUMrZjkrNTVZM2JSWmppdFJy?=
 =?utf-8?B?MjJGdks0emsySlZveW9oTXN3Q0dnakVqWm5nR2dzN21Sc2kvZ2dNQzZwSWI3?=
 =?utf-8?B?cmpCUE9UdS83SElIaWJheWFaUEdFK1hoTmEzUGVoL0lNa3Q1bEJvTDdoNXc4?=
 =?utf-8?B?TzQvb3R6SHB3SldLUWhJSzkxak13Rzl6M1dpanN0ZTQ5UVYrN0dDZXZQOHJH?=
 =?utf-8?B?TTR0QUI4ZTJKcWVza0NGaUo2eVUxNjRWUjZIZDlZZUpCS0JXM21kVDFGNG43?=
 =?utf-8?B?ZG9iemY5bEsrQnRNWm9va05POGtmck05Sit4a3FZaHV0MU9pMkhzSWhTK0hq?=
 =?utf-8?B?MzlLdFZRdnE5MHIvSmEyRmcrbEhlYWRUZVZHeWdpRnhiTHBldEs4NXp0Q3Bl?=
 =?utf-8?B?c2pxUFh0SWJsQW9wNWRqeFB3UzRrM3djbExhZ2IxcjhtbWEycWp1YjNzWUQ2?=
 =?utf-8?B?bXVzOFRUWDFzay9BSnpCbTdQMzFQdDMzaHRyMWh6S3hpSHM0eS9LSE9Na3BE?=
 =?utf-8?B?enN3YnRpR3ZTNk5yL01hbVVoMmkvR1J4aVBicHBnUDFlWmsvVlVHRXdlbzgw?=
 =?utf-8?B?SjNvUkR6RFE0c3ZhbXFvMFo2ODN4dm9wM2RsT3dJNUptYmNIWTdtRWlpSW9Z?=
 =?utf-8?B?NXY3UE4rZEVlWklmQnJBbk1jVWViOVJMQ25Vbm80MGpLRVF5UkpUcHJKbnJG?=
 =?utf-8?B?OFJDN1pOVnFEWkdOTEdVQU1HUk50NmIvV3EzbG9vZjNXNHE0MHlibFVwRHQx?=
 =?utf-8?B?L0NvckZ4R0ZXK09ZbjhhVldPd0xoMm5LUVV5eU9yUUxqMERIaFd4MGxVYTFj?=
 =?utf-8?B?TXdYRVlRdDMyNnphVGVVNDlnRWNIWmNtNDVOT0toMEVQcXVzelpiMWRHOEdO?=
 =?utf-8?B?Y0x4K0VETDRvQ0N3aEdZNlBucEtFUUNiWVB1OHRobm9tMFpibXBYcjRpUU1N?=
 =?utf-8?B?SUsvaDFLU2JuRld1dUprUTFyRlVGTnlRbGJaSlhoVVcwWDNPcFJRUWdVK0dI?=
 =?utf-8?B?VGZId3ZsTy90Q00rRXpqeVZVYkwxK0RmOThmdlZ4K21OVkxRenNuMzBoaXpx?=
 =?utf-8?B?cDZaL1JCU3B1ZlU1Wm82ejNvenVsM2RTNFRnZFQyUTVDd3RLZHFBQmVWVGNl?=
 =?utf-8?B?aC9QRk9KRis0ajU4RW1CeE1SSWNaMXdhZHpNWllvT21DWDVTRGlDYWczN29k?=
 =?utf-8?B?Z0dYQjlMSHRIT01PRXdpcUVKZnhLbXlqZHIrdExwdkUwWWNiUzJXSmxTenp4?=
 =?utf-8?B?b3Frd1djdGdRNUNodnBoLzhTNHVORWhkejRvT2UvanRYclFRYkpZbmZhN1ha?=
 =?utf-8?B?N1VQM2Z3VXJreTZsdWwycGJyb1JvOGt4ZE1hWmhkbktQVlFCQmduK2w3aEtQ?=
 =?utf-8?B?Q1dqQVZCL0gwTDFnYVdqMHJaRzkyeWZHUHJON09ZSmZIaFZsL3lJYU1UMEk5?=
 =?utf-8?B?OXEyN3N2ZnRQU2hFem4rL0R5Q1pmOGRuYTRxMlJDTGhFN1NsNEFZZzFLVkM5?=
 =?utf-8?B?V0pIekFyZUFHT1R4aGxXR2ZMWVFndHc3UytjTk9BS2h0SXI4VUVLclZRUEEz?=
 =?utf-8?B?aUtpb2diRlV0ZjlHbG1iZjExUGo5alBPeHNNUEM5TENzNGQ3bUFLZmh0bWVE?=
 =?utf-8?B?YlgxdkowTG9QOGZxMHFnUzRIQkFWQlpqc3hObnBkZHlwU2tUeEppcWRyM0NG?=
 =?utf-8?B?K1V1ZW5QblU2L2t6KzZYZ3pvdldPbkxLdzFJc0E1VkswT2FCY2JHSmRVdW1X?=
 =?utf-8?B?VWJJWEE2aU93YXpoN3hqZ2xyY014RzBIYWlMMWt3WkFXZFZ6YkFTM3RJb213?=
 =?utf-8?B?UkE2M2pOTis1NmFQb1BlcG1EM1pqdTBuRHBUMXpzMXpZS1ZOOGIrMkRyVFdX?=
 =?utf-8?B?Vlc5c0oxL2xvNGxJQ0xxeTZCZUdaMWFVTWU4d1lLL1AybU84T0EwdHRTMmFu?=
 =?utf-8?B?aDh1aEJtZFg5NkVJY3AxenBMTGlITklOWnR2UXZ5VDhqZ1AyTVd1WEN2cDVH?=
 =?utf-8?B?Q0UySy80eTdzVGEvclJnY2h4REMwOHJRMnlhUnh4WUF0YmFqWTIwSkVJQkFG?=
 =?utf-8?B?UHE1bDVEYkVFTElXbmErTTZPZVJOOEFMYXJiUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b87eee-1bc9-4537-6797-08de38e0f714
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2025 18:13:20.2267
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5ambj+AD6zQh7QYkRmglCHpUSWEJRLoCg9eQmyXdFsea08F1X8fF2mDW8v+QXztR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6352
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 18:13:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227564

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgQWxleGFuZGVyIEthbmF2aW4gdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj4gU2VudDogZGVuIDExIGRlY2VtYmVyIDIwMjUgMTY6MjANCj4gVG86IFBhc2Nh
bC5XZWlzc2VyLmV4dEBrYXJsc3RvcnouY29tOyBRdWVudGluIFNjaHVseiA8cXVlbnRpbi5zY2h1
bHpAY2hlcnJ5LmRlPjsgUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+DQo+IENjOiBv
cGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBb
T0UtY29yZV0gW1BBVENIIDAvM10gQWRkIEhPTUVQQUdFIHZhcmlhYmxlIHRvIHNldmVyYWwgcmVj
aXBlcy4NCj4gDQo+IE9uIFRodSwgMTEgRGVjIDIwMjUgYXQgMTU6MjksIFdlaXNzZXIsIFBhc2Nh
bC5leHQgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPFBhc2NhbC5XZWlzc2VyLmV4dD1r
YXJsc3RvcnouY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiA+DQo+ID4gVGhl
cmUgYXJlIHNldmVyYWwgcmVhc29ucyBmb3IgdGhpcyBjaGFuZ2U6DQo+ID4NCj4gPiBGaXJzdCwg
YWNjb3JkaW5nIHRvIHRoZSByZWNpcGUgc3R5bGUgZ3VpZGUsIEhPTUVQQUdFIGlzIGEgcmVxdWly
ZWQNCj4gPiB2YXJpYWJsZSBhbmQgc2hvdWxkIGJlIGNvbnRhaW5lZCBpbiBhbGwgcmVjaXBlczoN
Cj4gPg0KPiA+IGh0dHBzOi8vZG9jcy55b2N0b3Byb2plY3Qub3JnL2Rldi9jb250cmlidXRvci1n
dWlkZS9yZWNpcGUtc3R5bGUtZ3VpZGUuaHRtbCNyZXF1aXJlZC12YXJpYWJsZXMNCj4gPg0KPiA+
IFNlY29uZCwgdGhlIHJlY2lwZSBsaW50ZXIgb2VsaW50LWFkdiBhbHNvIHdhbnRzIEhPTUVQQUdF
IHRvIGJlIHNldC4NCj4gDQo+IFNhZGx5IHRoZSBkb2NzIGFyZSBzb21ld2hhdCBpbmNvbnNpc3Rl
bnQgdGhlcmUuIFRoZSBzZWN0aW9uIHNheXMNCj4gJ3JlcXVpcmVkJywgYnV0IG9uIHRoZSBvdGhl
ciBoYW5kICdzaG91bGQnIGlzIHVzdWFsbHkgaW50ZXJwcmV0ZWQgYXMgYQ0KPiByZWNvbW1lbmRh
dGlvbiwgYnV0IG5vdCBhIHN0cmljdCByZXF1aXJlbWVudC4NCj4gDQo+IFRoZSBhY3R1YWwgZW5m
b3JjZWQgcmVxdWlyZW1lbnRzIGFyZSBpbiB0aGUgcmVjaXBlX3FhIHRhc2ssIGFuZCBmcm9tDQo+
IHdoYXQgSSBqdXN0IGNoZWNrZWQsIG9ubHkgU1VNTUFSWSBtdXN0IGJlIGFsd2F5cyBwcmVzZW50
LCB3aGlsZQ0KPiBIT01FUEFHRSBpcyByZXF1aXJlZCBvbmx5IHdoZW4gU1JDX1VSSSBpcyBmZXRj
aGluZyBmcm9tIGV4dGVybmFsDQo+IHNvdXJjZXMgb24gdGhlIG5ldHdvcmsuDQo+IA0KPiBvZWxp
bnQtYWR2IGlzIGEgM3JkIHBhcnR5IGxpbnRlciwgYW5kIHRoaW5ncyBpdCBzdWdnZXN0cyB3aGVu
IHVzaW5nDQo+IGl0cyBkZWZhdWx0IGNvbmZpZ3VyYXRpb24gc2hvdWxkIG5vdCBiZSB0YWtlbiBh
cyBndWlkZWxpbmVzIGZvcg0KPiBvZS1jb3JlIGNvbnRyaWJ1dGlvbnMuDQo+IA0KPiA+IFRoaXJk
LCB0aGUgSE9NRVBBR0UgaXMgaW5jbHVkZWQgaW4gdGhlIFNCT00gaWYgaXQgaXMgc2V0LiBJdCB3
b3VsZCBiZQ0KPiA+IGdyZWF0LCBpZiBldmVyeSBjb21wb25lbnQgd291bGQgY29udGFpbiB0aGUg
SE9NRVBBR0UgdG8gYmUgY29uc2lzdGVudC4NCj4gDQo+IFRoZSBpc3N1ZSBpcyB0aGF0IGZvbGxv
d2luZyB0aGlzIHByaW5jaXBsZSBtZWNoYW5pY2FsbHkgY2x1dHRlcnMNCj4gcmVjaXBlcywgcGFj
a2FnZXMsIGFuZCB2YXJpb3VzIG90aGVyIGRlcml2ZWQgaXRlbXMgKHN1Y2ggYXMgc2JvbXMpDQo+
IHdpdGggZW50cmllcyB0aGF0IGFyZW4ndCBhY3R1YWxseSB1c2VmdWwgb3IgaGVscGZ1bCB0byBo
dW1hbnMuIFNvIEknZA0KPiByYXRoZXIgbm90IGRvIGl0Lg0KDQpHaXZlbiB0aGF0IGl0IHNlZW1z
IGxpa2UgZXZlcnlvbmUgYW5kIHRoZWlyIG1vdGhlciBhcmUgdHJ5aW5nIHRvIA0KY29tZSB1cCB3
aXRoIG5ldyBmaWVsZHMgb2YgaW5mb3JtYXRpb24gYW5kIG1ha2luZyB0aGVtIG1hbmRhdG9yeSAN
CmluIHRoZSBTQk9NcyAodHJ5IGNvdW50cnkgb2Ygb3JpZ2luIGZvciBlYWNoIGNvbXBvbmVudCwg
d2hpY2ggSSANCmhhdmUgbm8gaWRlYSBob3cgdGhleSBleHBlY3QgYW55b25lIHRvIGJlIGFibGUg
dG8gY29tcGx5IHdpdGgpLCANCkkgaGF2ZSBhIGZlZWxpbmcgdGhhdCB3ZSB3aWxsIGhhdmUgdG8g
Z2V0IHVzZWQgdG8gdGhpcyBhbmQgYSBsb3QgDQptb3JlIGNsdXR0ZXIgdG8gYmUgYWJsZSB0byBj
b21wbHkgd2l0aCBhbGwgd2hpbXMgb2YgZGlmZmVyZW50IA0KbGVnaXNsYXR1cmVzLiA6KA0KDQo+
IA0KPiA+IEkgY2hlY2tlZCB3aGF0IG90aGVyIHJlY2lwZXMgYXJlIGRvaW5nIHdoZW4gdGhleSBq
dXN0IHByb3ZpZGUgbG9jYWwNCj4gPiBmaWxlcy4gVGhlIHJlY2lwZXMgbWluaS14LXNlc3Npb24g
b3IgcHl0aG9uMy1kdHNjaGVtYS13cmFwcGVyIGFsc28gc2V0DQo+ID4gSE9NRVBBR0UgdG8gImh0
dHBzOi8veW9jdG9wcm9qZWN0Lm9yZyIsIHNvIEkgdGhvdWdodCB0aGF0IHdvdWxkIGJlIHRoZQ0K
PiA+IGFjY2VwdGVkIHdheSB0byBoYXZlIGEgSE9NRVBBR0UgZm9yIHJlY2lwZXMgdGhhdCBvbmx5
IHByb3ZpZGUgbG9jYWwgZmlsZXMuDQo+ID4NCj4gDQo+IFRoaXMgcGF0Y2hzZXQgaGFzIG5vdyBt
ZXJnZWQgKG5vIG9uZSBtYWRlIG9iamVjdGlvbnMgaW4gdGhlIHBhdGNoDQo+IHJldmlldywgYW5k
IFJQIHRvb2sgaXQpLCBzbyBpZiBhbnkgaW50ZXJlc3RlZCBwYXJ0aWVzIGZlZWwgc3Ryb25nbHkN
Cj4gYWJvdXQgZnVydGhlciB0d2Vha3MsIHRoZXkgc2hvdWxkIG1ha2UgdGhlbSBvbiB0b3Agb2Yg
bWFzdGVyLg0KPiANCj4gQWxleA0KDQovL1BldGVyDQoNCg==

