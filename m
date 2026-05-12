Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 813CDCD4855
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 08:30:53 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71029.1778574648030979332
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 01:30:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=im/EHjiY;
 spf=pass (domain: est.tech, ip: 52.101.72.18, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MKJBoLbHr4gzEm7H1BEAq79GAFFViNme+9uvvIssjKLRrYR78Pl28ZRMFRKIpSWR/J4JZLftnJB4xPIHur2R0XDvRdoqx1K5lT0w8hUifY5gXlfXB6khjR9dZ1XCnZaWI7Ok6z+3L8eoKZsgeKrgXykbT9mdgnRz2BrvVqmplFkL037HmLvHdSsjMdVnAsht63OWpPW8WEkqL2wgGhdjzbrkW0n7iiy4mFbgz/ocN0eUMOFrxMApXDHUMezoQwxWJat0NjQCq9P8DG3Hthjb7hRYyoZpEhPvsP0JBy1N7o36Kv6on7s/EogDWxcg1TZY/GKfr+8yQ193Kq0jrrSZ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMupjY+9D4Slacpa6ASj029FpI0P8f5CYDRwpcExEos=;
 b=p050wbah/kEu88iliNoeVvxfhBWfrz2BdBy8GW/8+5xVOqAqlASOw7BHmMoMMp8z98fCyqeY2mXHsDOWRnq1Css3i0Af1TBOcrNEBwN+M1xuI74K2AcCA3+g5q9V7+uB7F/NGunfbCdNWZ6g766i5T1fFtK2+h22/Ep9z5wFq23vhfFQf6KYANTmHTyQE4SRj2cHAyFVoMwLkWaH3nyDdd5iTpPeq1x8VLeml7XqDTLHL6MAUO9k7M9NcFMvbhtC6J1ieFSUaNQqZ4TWe+g9MDhMARBrExvRB8FARMH4534Yghw1Vbid1j/XIrYa962xigMk26XOvPoAYpW0Lh5ZFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMupjY+9D4Slacpa6ASj029FpI0P8f5CYDRwpcExEos=;
 b=im/EHjiYPmzyN7WL626EEVni00ioDW41fR93e3Ontvd9INGg0Ap9aF9VHY4k5MS6g+cVFHOPHTyoVazXLPhL3omd/FUpHPt3HF9LRThsjZCwTLboGw0OBdXVNC9s2/6Teg7azdwD1+BiePHjesaiJVf6MreQuiL8aP2LpOcdjOovApa5K2sNyIhBT4Y9aoZAmpIvWtb4j1Tfkh7EiRAmcNIqDOhstAqtAPpcP2LBoWd+Vg6WV/3drDPAPNeQ3PnXqaVAxgcVz2GFUlLpXEzDMSeei/c6HQ3QpPfs5y0P8diL0w8lBRnwFJ+nljQpAmA3NQVK1UEI7rL+Fh+E0dazvA==
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by GV4P189MB3703.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2bb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.15; Tue, 12 May
 2026 08:30:40 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 08:30:39 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "pratik.farkase@ericsson.com" <pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v3] libffi: add ptest support
Thread-Topic: [OE-core][PATCH v3] libffi: add ptest support
Thread-Index: AQHc3t79HFJRIyPmnEaLI9NoW4xm/7YIW9SAgAAvgyCAADlegIABUG3k
Date: Tue, 12 May 2026 08:30:39 +0000
Message-ID: 
 <GV2P189MB3005EFC4E16B3BD9CA42F3C6FE392@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
References: <20260508102405.16791-1-pratik.farkase@est.tech>
 <20260508113653.21478-1-pratik.farkase@est.tech>
 <DIFMGYW1190K.3MKM3KN0DWQMB@bootlin.com>
 <GV2P189MB3005B33FD42B8B07EF9ECC76FE382@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
 <DIFUGDKJKE7Y.SDTF3FXFC43W@bootlin.com>
In-Reply-To: <DIFUGDKJKE7Y.SDTF3FXFC43W@bootlin.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2P189MB3005:EE_|GV4P189MB3703:EE_
x-ms-office365-filtering-correlation-id: 6df786d4-3eba-4cef-481d-08deb000bfb0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|22082099003|56012099003|11063799003|18002099003;
x-microsoft-antispam-message-info: 
 fVJUrrXfIX/QjF+D0oeG3KXjscFqoS8rTkohP61npuNN2EefUBIzTLJcZ+QP6H6Nmvb0Q8x50bn6xWp3evOEUgZONZpl+kI2IE/UNKzisKNidbXvnRjFJdtgxCXqqcR1VxKpO3SNoVq3kJO9553VCi5MtAfvId9km/nGeZNKkWZJzMwtpRBlfjpYkkSy0S7gW5WwAJp4K4aR+OvurhH+Ue+tCy9VWS8mAQfkc0cCV3ni3E8p+kZRKLIwaUEF+K7OQJhZ/gyTSirqrLXZdlF6Gv7tUdnag9TMrNmBZXMJI14+LNH3YAnSOgElhpZKTwdxXlKEkfOgLxpffGKe5uPBKN2qUszM0hO/A/2AQxH4R87xVqpkoPkktg1bDYz0LmqoGhW9Lr0t5S9peWMRhDbRwxjddJttzilVq6Tx2ATGzT3i1oT0RUKEL8Nbe3+VTG1JI5/zG9BA3ytwWlOcGe2a2m/HlPbNJ90ZLz1DF6baOX70ktO330Tf0xDu6uDNzCb6ovokgMs2Mht3L2n3MTKrpREAyYVgKG/S7NJYw9ZrPAFOeTeRV94rs5YVEPyUCqOoPpFpUBDcE0zGznljn1Pln76lhmT2qurei8c9cVWX4PdBv+3a1Eaz6vUo6n6SzFUEAQqzzDzhmxkX9dQWdP1kIb4OZeXpzk9OH+krB4jjp85vD/nvGzi4W7/sQNYTkP0r
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(56012099003)(11063799003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?UqZmVOmyVQCeaGm67BJIX37srMe5bRoCeRrkZHHXJ/j3SVinHGmnGsdt?=
 =?Windows-1252?Q?BfcEjC30XYr2BCFvIEfEKx3ZhwbwcWpQXBWccmMI47FJ58hjnSUEz8+2?=
 =?Windows-1252?Q?ddGoo8QxEm1I3CiDZJJauvixeuw8eRxAmOJ3bRRfD4oeJd9ZjY1V9j78?=
 =?Windows-1252?Q?lIRPJFnWVfxrxaXPbDNMOSKiw+RnzfFFK2EpHHBNPVaCFI/MI/pTsUEW?=
 =?Windows-1252?Q?JiBr7FirKx50wXUI5PIcQiAGrzh9Gl/e5IakI9a4jrBAkzZtHF5cion6?=
 =?Windows-1252?Q?7Yi5V/fE5C7ZYIUOYhLJFjUARqTBuOt4or6k0HCehxjuChAGxsR0MATD?=
 =?Windows-1252?Q?ToKi39SkNYmuyLKr6ZKXeqEWjexttOShnjYGNXYr025xCt9mpDWmIOhV?=
 =?Windows-1252?Q?FeTrnOly5tUkzTscOcpgVUedju5dLU7cR+tJjlIeWB5VAf58Q4SdTxIy?=
 =?Windows-1252?Q?sZD3ZhFcKsj++7y16xVGZudjyCzOmowrvF4PZL5d8xVSBqXdx5rYOoB0?=
 =?Windows-1252?Q?z5DE4ih+ipudl63Y9dYowIMZJlVEpEPuvXnsFyH5exXVdwt9pDAmOlFM?=
 =?Windows-1252?Q?L12YBUET5NXp7qSNJByRboTPn3snTD2GYXF5ksb8KimLrl1xB5cK71ZZ?=
 =?Windows-1252?Q?fOmCtl64t+xP9PTlpzY3PlAKRnDt78vWA/FMj1ErcXYxj0dZMXtvT+6t?=
 =?Windows-1252?Q?TYNAke9S22DyAicR5pasw+OhVC5G4wwZP3rYSGBvUkGzDaM2eFSFznSQ?=
 =?Windows-1252?Q?wtjwsxiGT/DXzztM+Lk5XN4reQqho0WPz+Gk/zd1Ulv3Xp6lwIVz7yMU?=
 =?Windows-1252?Q?UxMweWbc9y56AlS9V0eOpWK2ntlfbqXvD+Wzs+uqMKTSnqLxhzKQrDKA?=
 =?Windows-1252?Q?AVmPvt8BLorY+iasObCr1g73BTQWCQZZKD/Wif8/X3ut7vBTHq1O6tVI?=
 =?Windows-1252?Q?MbWFuhYXtTdYRnE9O7vYzt0F4bNiuRVgwXegGxOdoytHjwLLhpqMMLRG?=
 =?Windows-1252?Q?Pjmd3F0H1YRHVY+CwoAKS2ePBrmdxWsIETZZn7/N97InpgGpHlfW0Qze?=
 =?Windows-1252?Q?d94TxEOB6O6U9WAUB7UKAkFWKqO1hVL7odnK21RjscW8nLyTDLHSnrL8?=
 =?Windows-1252?Q?AEGKqMPm4f9AAQoCZxM/ngwMzEevxR+u61wthsHR+PCBTDfJ4yOm/vdp?=
 =?Windows-1252?Q?57rqmTnSOF0BeoV4zO9C7IZ+2fKQI12ewN8TOszbttmhZ4XMDOew4aJi?=
 =?Windows-1252?Q?RIj3YB2A7pYoATVhoz6titAl6OGb2AUQwRJYB8U82q09zpPHt3QYPDcY?=
 =?Windows-1252?Q?xSiVnG2iXWLIgfM+jFlWedvez++yxdFRAQYhV5NFu5aJZXx8WnJRRl/N?=
 =?Windows-1252?Q?UJ92XJ/m6ZiS+PyXEYGVjWU2ZgPxRoWykmuxtIshWA6gd2P0/Gwzt3Q6?=
 =?Windows-1252?Q?MmVtCyGfCoPIdm9iygcUm4vbQg1/2n116FRQHhAJCylem6p+eOS4jnXg?=
 =?Windows-1252?Q?K9YJLxUQvCuPx4UwbOdcJLXw1IwX2AKJ9wtKov2q73FkL3UB6Qv5Nzmk?=
 =?Windows-1252?Q?nYBb4EBBFqKzPc3JSPpsW1u8SUemxTdvy2thdmLQMuKaZ8k5onWVsw2O?=
 =?Windows-1252?Q?Ryghoxay53Bsfb029LV7JDVEzAjswYLOH/VZJfEovyVt9wFCCyq3mDol?=
 =?Windows-1252?Q?R4t6BSmOj6qhVovXiFHXIxWrxROdiFTQpbqWF+xOQsMj4LKlhlEufT96?=
 =?Windows-1252?Q?Y725QVK7i0uRkYMiG34MrE6ItZi4bIdUYtRXxV8zH/UfCmF4Her+pSU1?=
 =?Windows-1252?Q?vJoCmb+2bPZBM4VfEPgSZXDQZq4DsIFnDB3TUfts3J5vDC6j?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6df786d4-3eba-4cef-481d-08deb000bfb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2026 08:30:39.5461
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aGhJi8oPnKvPAPp+cJeZLRwoMqIT618ycriJ99m2OswunRqHZqTmhIdUQZPUhmXI56bCPkM5x2S56FcNDnt3Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P189MB3703
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 08:30:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236860

Hi Mathieu,

I tested v3 on qemux86-64 against current master and was unable to
reproduce the glib-2.0 locale or multilib symlinks failures.

Could you share the steps or configuration you used to reproduce the
these two issues? That would help me investigate further.

Best Regards,
Pratik

________________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: Monday, May 11, 2026 2:25 PM
To: Pratik Farkase; openembedded-core@lists.openembedded.org
Cc: pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH v3] libffi: add ptest support

On Mon May 11, 2026 at 11:00 AM CEST, Pratik Farkase wrote:
> Hi Mathieu,
>
>   Thanks for looking into this.
>
>   The glib-2.0 locale issue looks pre-existing =97 my patch only modifies
>   ptest-packagelists.inc which likely invalidated sstate and exposed it.
>
>   The multilib symlinks conflict I can address in v4 if confirmed.
>
>   The complex_int failure on riscv64 could be arch-specific =97 happy to
>   exclude it if it reproduces consistently.
>
>   Let me know what you find after further testing.
>
> Best Regards,
> Pratik
>

So I tired again and applied this series on top of an otherwise fully
working branch. I basically got all the same failures:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1577

This does include the ptest one, so I believe we should disable the
'libffi.complex/complex_int' test.

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


