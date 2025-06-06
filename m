Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31CFAC5B555
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 14:12:11 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.62])
 by mx.groups.io with SMTP id smtpd.web11.34488.1749219120318639009
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 07:12:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=FzVMbSmq;
 spf=pass (domain: siemens.com, ip: 52.101.69.62, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sm2SRurFoOBeJw2YCCgchQX2GnhnKygy1e/dfzvBVTt6ztFI0qkMl0I7Ch/mTgtA6zSfn4t99U3h/QJ+fLOIwRrx6eEvO82AjogZZZkDirl2a8cvtQHY/XkwkLdI6bBGJtE7InX3YhLvXUA11eDmhfWwzuDLnNSlARJEU0ykfYrqzpGTZTkSuB63YGZeBDlkGI3ZHoy2Kly+1jxYtfqydRIET/cjT633j0YtS6aIungo4SSjSBcdiJg7mLCqjoyMZFwYX1X6e6jTBvuF+vYy96WrDFOsffawGNQD/tzyVTxS6oyEQp6yOlKOFskWFKMIvuzfEA0cY2wdWXC3PbhWQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1qrUZKAsKAYZy5F5igdD0RTIS9+jd4gzvZNnWhW3fFo=;
 b=XyH/8TzBbf2+qJUmsovRMuU8mWHS7RakjS+kGYduCnsYQ7qq1FAa5MIqVTU9MRtOWjnd5tacUVelDy7ebArimWj4AHW1gtvrfMIRwdktO3zN6r6Idd4r5g2ri87mzlatrP7we2LVi8AUJstWnO5Wkv+XC8yqbA4WUs+f2LerkTIajOWK0AhJWaJEY9VDO1W5+QR+WkP9bk5JDwclJ65mo3+tVxLt6A2a0QXdYRyGF8t+S+H4M6C9rymJJGc7fYtQK9EQtj1DU83Otf01wHBvfqqiFkFfRHzblhk4nWcoLxfcnG8qtkmIla/1sCdSXBFytDDErYvETimqVl2tpKKP7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1qrUZKAsKAYZy5F5igdD0RTIS9+jd4gzvZNnWhW3fFo=;
 b=FzVMbSmq6XAbcIfcFZ5rKb6PgNMPMJVseePAoNQXV5oKaRGe+ba7301pheZfXNW9rYNaC7llzf3+/2oxUxE9sotuCNSbmSR95lVZYqYLfXoup9eJeskgh5gUSKr4kD9doJ0Tt2Z/U8xuMu0U4RJH5O1PcpAop4KuDNu18WjZzgtEAq2Do5KKwdSzB3pnx6T8c2meJBggebuHqck8ZC3FZqEUZAEMyyBo6FeTR95C3d9OYG/8OXz0XuxgR7dWaoVY9kreQe/yZlLbztUBx5wz1j6R/7HxD97w+e4DB5h86cZGit7Gr/hMZ13m942i5ibrO798l+X+r6npdgBhMBJoXg==
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13e::17)
 by AS8PR10MB7970.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:568::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Fri, 6 Jun
 2025 14:11:57 +0000
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda]) by DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda%6]) with mapi id 15.20.8813.021; Fri, 6 Jun 2025
 14:11:57 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: Francesco Dolcini <francesco@dolcini.it>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "meta-ti@lists.yoctoproject.org"
	<meta-ti@lists.yoctoproject.org>, "hiago.franco@toradex.com"
	<hiago.franco@toradex.com>
Subject: Re: [PATCH v7 00/20] FIT image improvements
Thread-Topic: [PATCH v7 00/20] FIT image improvements
Thread-Index: AQHb1GDs5szeaGrcPUqPWcSZpgkA3rP18woAgAA+HwA=
Date: Fri, 6 Jun 2025 14:11:57 +0000
Message-ID: <81913717cdad27b7ffb9c29a39fd5b6883190c22.camel@siemens.com>
References: <20250603082419.409564-1-adrian.freihofer@siemens.com>
	 <20250606102936.GA29790@francesco-nb>
In-Reply-To: <20250606102936.GA29790@francesco-nb>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3529:EE_|AS8PR10MB7970:EE_
x-ms-office365-filtering-correlation-id: 93e5340b-c43f-4797-36fb-08dda50418cd
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?TU5od1hGZTVZeTVJS3RBN0lzVXZQVVR1MDRUaGh2WGNnWEt0R1pqdGt2aGNj?=
 =?utf-8?B?Slh3UmtDQXVHaGFLY2JFNzQwaC8vUlVZRmN2MU9ZMVhkdzMrdHgzK2hRaTlQ?=
 =?utf-8?B?WjQwbUNDU0cyTzBBT2dDZ0VaMStVS082eHJJVXlsRTRsWitUcHRabUdzdmo0?=
 =?utf-8?B?eHhrbUx5U015VkYwV050T0p0UkVVYXIwMWQrbjAvSDlSTUVaRE1RSlJ5dmdw?=
 =?utf-8?B?WFlWWjVxS2lyZU5mL2xHZjZnVWhWY3poY3J2T1hJQWw0cmV5ZEFBcDk4Vjcz?=
 =?utf-8?B?L2hzZ0JtV09YejdraHNRMlZYaXAweXZwTXpFdVEySHBFSjBUY1FMaW9zK01P?=
 =?utf-8?B?RW85MUdaTlJEdVhZSmdSSVdFYUZTTG5xcHE0cGFlZmtsTzIxTDlzdUczSGI3?=
 =?utf-8?B?bWk5Vnpqcm5oRmFjZ0VXSXVzUFA2V1Y3c1FlcktuTmhBU3ZqRlBYYlZPcWFH?=
 =?utf-8?B?cFVscVJBdFM2Q0w4ODViV1JWK1ZBRWpoZ0FrSGd3b08rbzBkWVAvemJuNXlm?=
 =?utf-8?B?Tm80UmQ0Tk9xRWNZbVBpS2ptejN5UEg2andWeHpMSzV5U0ZuTW0xeE5rMTdy?=
 =?utf-8?B?U05xcUlwRG8rcWhneEVnZ2xmNWoyUDhMYlYzcDdhRks3WmdWektGZ3hheVpI?=
 =?utf-8?B?Rm9RditGZ0I4eXA4YXFLT20wWkZ2bTMvNmZzcGV1Sm05OTAyaWk4aHlXTVFi?=
 =?utf-8?B?YnRwYVc2SHJmQUpXeHBhTlVNZnJFNlVxR0JGVmdaQVBtWmUyM0NjWmRweXBF?=
 =?utf-8?B?RnZtNUJXZjgxMWZ0WHI5SHd6ZURYa3ZVeVJYdEtTUlZQNFdzdUhZYm5Ub2oz?=
 =?utf-8?B?SGM4L1BDbVNNT0lDVzRzNHJQa0dIY1hJZjBRbTVzMVUrb2tqZ29tTktQenNQ?=
 =?utf-8?B?L1IyTFVmdWg4TEJ4ai9wM1BkTDc3aGNFRFNsaDBCYk12K0VlaFlJaDFjSHRk?=
 =?utf-8?B?SDJ3VzliTVRWRHFwQ2hMM0NKdlAxVDBNakdKdEVvSGlQSzFSbWZZM3FZM2FK?=
 =?utf-8?B?WFR4QXJNQW9Jdk5jalliUGJFOEVSMzVnU2ExSW5naHVkRGZNZjZyaWpWMEVC?=
 =?utf-8?B?SlhFM3dzNnhEUXhWMjR0YThJL0tIU21JREZtQytXR01DRXVoZHlYK09BcnBB?=
 =?utf-8?B?bktNOEVTZFV3TmJyQVN3QStVbE9HaFR1K1Q1WWlQS0kvcWgvU0dMMEZld2Ri?=
 =?utf-8?B?T3F5NnZ5MEdzK0VCZ3lKMTNEWmZZRlFYdmtZZjZhMzhUbUEvb2pwKzYrZ3la?=
 =?utf-8?B?dVhhZE1ZUm5mTzNMMzduQnkwaldWYTczMEpCQVI3YUVJNjFtQm9lRE5nNWw3?=
 =?utf-8?B?ZVdLZzhzKzl5a1o2bUFrQ3B4clRPMGhHbkJBUkVvUW1LY013WVBJYVh3dklv?=
 =?utf-8?B?R25waWl2T00zMHB3dm5TaGZqaURQQ3I2bXZwRUtnT0pRZUg1SElSOVpEcUt2?=
 =?utf-8?B?RWF2MUlZckQyaGtWRkVXa3YrMDhoSGdUWk53UWZmMGJ1UmdDT280K1FQMjdD?=
 =?utf-8?B?dFV6MTZqdzFiaXFCSnBqaUhiT3pjb3k5YmR3Mk44dTl2cjA0R1p6alNrdEN2?=
 =?utf-8?B?RjJlVEFnck9uVHhrOXdTSk1WVEZGVkRsOFZTeXpGMk0rRm50VmRwWFZKeFcw?=
 =?utf-8?B?bUNMekg4WHZkZzc2cTF6N3dtR3ptK1NFTERIUllLKy9IZlcxKzNmQXRnNmpi?=
 =?utf-8?B?dUphVjdVam9UMDc5TXRjSVNFOVQ4ZXJsNHg5bGhGMXJ2WEpZQWNQS0tXVVhz?=
 =?utf-8?B?MzBNcXpaSE1iU3Y0cGlFbHJCckVRVVcvWG9RUjV4SnI1QnU3QnB0V2dKUm1C?=
 =?utf-8?B?ZkVYK250K25aL1NEN2M2QlV6R085dnlORWU2c2s0QkpPdVAyR054aWhuRDlJ?=
 =?utf-8?B?L3FQV2ZkZlU3MHR5RUptTlpXUisweGcrTHp5eUhuZjc2Rnp3M0NJWHMwZUJP?=
 =?utf-8?Q?bFd0OSCblE4=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cVFSRWNQMkJKSWpBMU5UYU1Oa3NiUy9uSmtrOGI2cy9reThLQ0JCcVQ1V29I?=
 =?utf-8?B?N2ZrNktnQlhmQjRjYnU3cDVuRk9qZ1JldUhCc0NOZE40dmxZQVVJQXhZdStz?=
 =?utf-8?B?MWJFOStMaXFRbkRsM2pCYmZyZFNiL2ZQWnVudW1yMm9WS0RFVlgzU1cvOVVP?=
 =?utf-8?B?dWVQeHdxZFRKb3pYNGQyYnpIRFBwYlFTTlV0Rk0wa3d6V3BrMis1bDRtbHQ5?=
 =?utf-8?B?WUtCUERlQzdyZkpXZHE0OU5ObUhhM0hYanVRalpyMlZEWDROeHBCZDd4ODNI?=
 =?utf-8?B?V2tMbXNUYWpCNzlaZlIzM2tTQzkrTUFyb1hrZlBjZytVcjVMZVJaVmRCUS9y?=
 =?utf-8?B?Y2puY210NHJNOEhEbWxFT0gyby8yMC9PblRGZ0RlS1Z0T05qY0d4cHZRT0N1?=
 =?utf-8?B?cDJxeEQ4VHhyYXZuZWgrOXNwejY2Q3ZodzFYSGx2dmh3UDZ1NitqbU5OM0Jh?=
 =?utf-8?B?NjJuTXZ5UkxDVXVwQmxxenk5YVlGREVQVWJlc0laRDFFcDJNRi9CUzFVeUtz?=
 =?utf-8?B?Uy96WCt3TUNnUllpMHJqK1RNalRYZXdEeFRkK3I2SHpxZE1Ya0UyY1ZydDIv?=
 =?utf-8?B?ZWdiWHFLMU5EQVRncFBoei9ML01td1QvTkdLa0VWMGlRVzZ2dXl5dnhDTk1Y?=
 =?utf-8?B?by91bDVSTnlMZUF1MG1LejVpTWswazlNNjAyRnI1ZnB5eHpYa3Y0SGhIM2Fo?=
 =?utf-8?B?NHVySmV2cXJ5NjZ4V0lOWTRXQ3ppbUt5aTY0UlJjSGxBeEEwUXJmR0kxKzBk?=
 =?utf-8?B?WGNTUktCTm5WMllRaFpzWkZHU0w4WUQ4U3A5bnFKUUg1bWRGbmJ6bG8xdVlQ?=
 =?utf-8?B?UnI0NE9PYjI1YU1lOHNqSnFjWkVEdXJKenI2K2lOWFk2ajh5ZEpwejJEZDZv?=
 =?utf-8?B?VWpnbFpUSzBPZ1Y2WXRZQ0c2NW5LRGx0TXYwQUkvK2lpK1hoNFdkek5MUHBy?=
 =?utf-8?B?eGlTUUlFYnNva3ZOQ0hEOEplS0hPUlUzZmFzVGM5cElTRlJCanVBTzE1V3cr?=
 =?utf-8?B?N2s4c0VaUllsMGd6YUVsb2VzdGlkN0E3cnJuV2gvTGN4bFcvVWNiTHdhS3k2?=
 =?utf-8?B?a2pCRE02US8zb3poQTdEajNxa09qRS9TVUpzYlhGeG54NG13bFJrN3ZoVjk5?=
 =?utf-8?B?WkJyWFBRb0NNL1VsamN0RVRWdFVlbTlWMXU1Z1Z1QjJkbHd3N1RYOXp1WGVh?=
 =?utf-8?B?ZXNwdmc0VDQ2ZXZKSVVLWHkwYmNQQTFicHJxdk5DcWhyb0dPRVZxT1RGeUN4?=
 =?utf-8?B?Y1VlZnF3OUZIR3lKSXd4cjFiWW1KYlZvVmI4STBrWFhreitXWW9sYXFlaXlq?=
 =?utf-8?B?STI2R3kwWmRSMDgvSmtzZDdXTGZwR0NpbVRHQ0x6d24rTVRiUk16Qm5zUlo4?=
 =?utf-8?B?UUIvbGVKRTEydW9WK1RhTmRLSFh0YUV6NG9XS09nSm0rbGVrNlh0SkxPL3Jh?=
 =?utf-8?B?MERrTXZUeWxPRGNwUzBJRU5ucjdNcisyK1J2RWJBRmUyMUlYa0NXTFFTeHpl?=
 =?utf-8?B?Kzc1N0p0S2VqSG9pSEo0TlIyVGZjSFVjaUtZMC9MME54L1dmMDZNY21HMi91?=
 =?utf-8?B?T2hjL2NiNXVvSVlFYkMzVTREbGVwOWF1a0E4U0VzVk5UUXNaWG9DRGhmS2FQ?=
 =?utf-8?B?SUZXbjA2Z05GMmg0TnNNbFY0aGRFMGtCMFRoQ0hJdEYydFM4Rk5xWGtwWk15?=
 =?utf-8?B?Z1F5VnVSRzFxand3ZWc0Y2hFNnBjRFo1SGMzRjVxVlE0emZPRnRnNkJDZnly?=
 =?utf-8?B?QnZqbGJ6UE5raWxmYW4raXRtRzF3RXQxOXVlOFI3QlU2Q1hsTzl5U21QU3ht?=
 =?utf-8?B?Y3paWDBqYmw1MWcveXRlUXJ6UVc0N0RuNmtsZEFWY09GeGJBd3NkM3ZocmEz?=
 =?utf-8?B?dW5DNVBhdkwvcWNwUC9EYjJjYitBeldjUml2UW5VWUpWTXhTMk5ESXVlRnY5?=
 =?utf-8?B?WCtSNzVCUWpWc3lzZlMvMXRQRXh2MkpVN1JoTzE4LzRSR0dJc2dWajM2TS8w?=
 =?utf-8?B?RGJmbVh5N3dkaGFLU0hORFJhdVB3aVEzR0Vsc08xSWFhcGIvelJjR3dCaUdq?=
 =?utf-8?B?Z2YwQUpvVVJvMkJRVVJWeXd4WWdReGp1b1UrZXB6UmtMdTFzV084WjdUditp?=
 =?utf-8?B?SUJPWGxZSko4MEIzUGEyakViMGxwdmdrbVdxRFhkRGZZODU4SmZKSnhMbW1z?=
 =?utf-8?B?WGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <74397115C37A1146A04C9FC1B73D85A4@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 93e5340b-c43f-4797-36fb-08dda50418cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2025 14:11:57.0937
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yXnJHNGOMFY5zVCtD35OeCgjqRLufmdysve1xjIINJfMhwj/gO6GG5FOxcRtqVPoRkKCRtVkunfOuhbuFkgLPefzAlb+9Ovxow14ZDN4Oqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7970
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 14:12:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218141

SGkgRnJhbmNlc2NvDQoNCkNvbmdyYXR1bGF0ZSwgeW91ciBDSSBpcyBmYXN0ZXIgdGhhbiBJIGFt
IHdpdGggdXBkYXRpbmcgdGhlDQpkb2N1bWVudGF0aW9uIDotKS4gQnV0IGluIHRoZSBtZWFuIHRp
bWUgcHVibGlzaGVkIHRoZSBjb3JyZXNwb25kaW5nDQpkb2N1bWVudGF0aW9uIHVwZGF0ZSB0b286
DQpodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9kb2NzL21lc3NhZ2UvNzAxNw0KDQpZ
ZXMsIHVuZm9ydHVuYXRlbHkgdGhlcmUgaXMgYSBicmVha2luZyBjaGFuZ2UuIFRoZSBtb2RpZmlj
YXRpb24gaGFzDQp1bmRlcmdvbmUgZXh0ZW5zaXZlIHJldmlldyB0aHJvdWdoIHNldmVyYWwgbW9u
dGhzIG9mIHRlY2huaWNhbCBtZWV0aW5ncw0KYW5kIHBhdGNoIHJldmlldyBzZXNzaW9ucy4gQSB2
ZXJ5IGJyaWVmIG1pZ3JhdGlvbiBndWlkZSBpcyBoZXJlLg0KDQpDb21pbmcgZnJvbSBhIGNvbmZp
Z3VyYXRpb24gbGlrZToNCiAgS0VSTkVMX0lNQUdFVFlQRSA9ICJmaXRJbWFnZSINCiAgS0VSTkVM
X0NMQVNTRVMgPSAia2VybmVsLWZpdGltYWdlIg0KYW5kIGJ1aWxkaW5nIGEga2VybmVsIGxpa2U6
DQogIGJpdGJha2UgbGludXgteW9jdG8NCg0KbmVlZHMgdG8gYmUgY2hhbmdlZCB0bzoNCiAgS0VS
TkVMX0NMQVNTRVMgPSAia2VybmVsLWZpdC1leHRyYS1hcnRpZmFjdHMiDQphbmQgYnVpbGRpbmcg
YSBrZXJuZWwgbGlrZToNCiAgYml0YmFrZSBsaW51eC15b2N0by1maXRpbWFnZQ0KDQoNCkkgaG9w
ZSB0aGF0IGhlbHBzLiBPdGhlcndpc2UsIHBsZWFzZSBsZXQgbWUga25vdy4NCkFkcmlhbg0KDQoN
Cg0KDQpPbiBGcmksIDIwMjUtMDYtMDYgYXQgMTI6MjkgKzAyMDAsIEZyYW5jZXNjbyBEb2xjaW5p
IHdyb3RlOg0KPiBIZWxsbyBBZHJpYW4sDQo+DQo+IE9uIFR1ZSwgSnVuIDAzLCAyMDI1IGF0IDEw
OjIzOjExQU0gKzAyMDAsIEFkcmlhbkYgd3JvdGU6DQo+ID4gRnJvbTogQWRyaWFuIEZyZWlob2Zl
ciA8YWRyaWFuLmZyZWlob2ZlckBzaWVtZW5zLmNvbT4NCj4gPg0KPiA+IFRoaXMgcGF0Y2ggc2Vy
aWVzIHJlLXdyaXRlcyB0aGUgRklUIGltYWdlIHJlbGF0ZWQgY29kZS4gVGhlIGdvYWwgaXMNCj4g
PiB0bw0KPiA+IGZpeCBbWU9DVE8gIzEyOTEyXSB3aGljaCBpcyBhIGxvbmcgc3RhbmRpbmcgaXNz
dWUuDQo+DQo+IEkgZGlkIG5vdCBoYXZlIHRpbWUgdG8gbG9vayBpbnRvIHRoZSBkZXRhaWxzIHll
dCwgYnV0IGl0IHNlZW1zIHRoYXQNCj4gdGhpcw0KPiBicmVha3MgYnVpbGQgd2l0aCBtZXRhLXRp
Lg0KPg0KPiA+IDA2LTA1OjE4OjA2OjMzICBFUlJPUjogUGFyc2VFcnJvciBhdA0KPiA+IC93b3Jr
ZGlyL29lL2J1aWxkLy4uL2xheWVycy9vcGVuZW1iZWRkZWQtY29yZS9tZXRhL2NsYXNzZXMtDQo+
ID4gcmVjaXBlL2tlcm5lbC5iYmNsYXNzOjE4MzogQ291bGQgbm90IGluaGVyaXQgZmlsZSBjbGFz
c2VzL2tlcm5lbC0NCj4gPiBmaXRpbWFnZS5iYmNsYXNzDQo+ID4gMDYtMDU6MTg6MDY6MzMgIEVS
Uk9SOiBQYXJzaW5nIGhhbHRlZCBkdWUgdG8gZXJyb3JzLCBzZWUgZXJyb3INCj4gPiBtZXNzYWdl
cyBhYm92ZQ0KPg0KPiBodHRwczovL2dpc3QuZ2l0aHViLmNvbS9kb2xjaW5pLzgyNDBhMjI5NTE2
ZTdhOTMzNTZlYmJhNTY2MzFkM2MwDQo+DQo+IEZyYW5jZXNjbw0KPg0KDQo=

