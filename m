Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFA52CF855A
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 08:28:24 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30101.1763627296394401882
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 00:28:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Mm4PXMw/;
 spf=temperror, err=temporary DNS error (domain: siemens.com, ip: 52.101.84.18, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wqvMzm/5L2y91TL0kLi15Fp4/bGTvYeCabWhAGjn8EokzyUgtlXIgMy83pdJwPUuLPEBnCSkh5iwjfcW1WK51FvxW9gHcxyW8DvgWujWWtqgzO9tomqMdJw60TNMTiabniiTmjqCMUfI5qyldfJF1dPDuL0T2QE1scg3pZZ0Z3nIm53BBkculbvRdmedvCyvf/agX8DTf73WSch80BzQKO4AJgz/mNS04kN27RfaNcNY4yTD/BJsLIm2MIZsamGn5p/O3mN5RehDuKTzEuzqDw8hVsSakUplAMaSdnfNQmRQwKcWQZT42JBcSvO1xISEUunUkkW9AaMrL3qxV+0ITA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EH9iUBXoW/GzCxs+EoJSaCJ6crZWtCwkRz5BOzr36g4=;
 b=onSp7Xpp74Svkjczo6ENXC+BJPtSLYXVKqK8unHpBhjNhEFK7hXxME3I8guq9e87lzmOf6M9YeDGCYY5ewrcyaVHIaROGrunt/xYHo5QnZcjqBqcclYKuyfwfiIn6jRfEZHNDA5ANMeCepwF7XBil1tXOL9T1B1BkIoft63EcBsqaVn+C/rF6lcV4MxQuBkiQRSygAEkyyTP6L+av+1pncm4bmlFPFOb9+Cy3KAO+48xolwlUoVhwjlIVYpUbmAtW0gVTgjsjlE7qClskPaLh7tpi9/Bby+QZ5GR2W9PWeGeqfvZQMlHwwCc1KE5B+ay55R6WpqtiMf993qxdCIAnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EH9iUBXoW/GzCxs+EoJSaCJ6crZWtCwkRz5BOzr36g4=;
 b=Mm4PXMw/QrPH5WXc7FpZ0AYMUnO/4EF7AcwU76ejm2oOMlozLROtNBJ2A65f/AHymzn8e1l5aNfjaJWoCPZfR7FBMqYimKukJGvMnTWk/PyR6fP9al69dSoB+CXznbm2ysA7pDUDpWDMo/gSVfrSOuOYY111EVuit32cSrX6ZovP/ClSm7OEDxP1CR7JbYzSimw01DDTqT+z6s39cg0PX673X/sU8KZZUgm/u+5QBodtILXTRZU1HnOCLmtaGd4ubn1K54AlYPnH9vDZ36bgwDjwj4eqT8uOb9Wnz5OnZZnw69KQGb203KV0HpwrgNCymA5k1m2M93wWyijCNI2qPQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB9PR10MB8167.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4c0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 08:28:13 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 08:28:12 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Steve Sakoman <steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][scarthgap][PATCH 0/9] go tests backports
Thread-Topic: [OE-core][scarthgap][PATCH 0/9] go tests backports
Thread-Index: AQHcVJj9fzTiCW5Kr0SVqdTEVnfEz7T6IbcAgAACKMCAASGLkA==
Date: Thu, 20 Nov 2025 08:28:12 +0000
Message-ID: 
 <AS1PR10MB56977E5AFEAA0385ACCC490EFDD4A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20251113122806.16769-1-peter.marko@siemens.com>
 <CAOSpxdYgTSZ=8fR4eYotZugp1edZu0qaXg8-yPbGCrZgqMVv6Q@mail.gmail.com>
 <AS1PR10MB5697111637A8A6076BCD808DFDD7A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB5697111637A8A6076BCD808DFDD7A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=50900547-4d35-4493-86cf-2b1e41247b51;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-11-19T15:09:42Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB9PR10MB8167:EE_
x-ms-office365-filtering-correlation-id: 28f70925-ce7b-4a34-1cd1-08de280ebec8
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?dzJmenlhMHF0VklMZWF5b1dwdm1hYkRLK3hSZ0VHdG5yYWIvSmpkcm4zcUVs?=
 =?utf-8?B?dVFMT2MvcHhuM3NMUXRUejJOSS9BcWpNUncwSXRpUWxUcmw1RjVObW5EbzRq?=
 =?utf-8?B?dElsUzg2REE2d1FWbjIwbmZhczNLNUhUeVMza08xNTMxaVkrekxsbG0xeUhj?=
 =?utf-8?B?cFkwMFVVbXJKWDBNMWhRK0RGekNZRnF1bktoMWN1RmNPdVpQTHZTR2tBOW9J?=
 =?utf-8?B?U2xRcFBoMWw3R2Q2WlF6WnV1T0hxMnZkNVRxamtHOUdYQkxQOGtFcUcrM0Uy?=
 =?utf-8?B?aDJQWHlERTFvK2dJTXVpK2lnTFRadTcwRmhEaVh6QVhpVFlZdXpTWWRYUU5r?=
 =?utf-8?B?SnV3dTZKZU5JbWdwQkcvOEJkZFNhMWg4Q0R2ZG1Bc3pML1pseWcvVC9NbWZS?=
 =?utf-8?B?Z2VHSFdVYmhBekZJTG9VakpocVVrQ1QyTkIvNERGWVVGKytLdU1LWFgrTXlG?=
 =?utf-8?B?elBFT1JSbFNoZnFvdGxCTG4vMWQwNHdwOG51UlhRT01Wd25qcGt5RWNJTGpr?=
 =?utf-8?B?V1lmWmh2WlVYWjFDUTM0RzA5cjFtbEY1aFlhQnRBVk5CK1hlTUNjUklYalha?=
 =?utf-8?B?b3FaSXh2ektNTjVpQytKSGxiRWJITkVYQTJsQ25LSk45cG9nVmZyM2NLR1Nx?=
 =?utf-8?B?ZE1zTERuV0RPTW1XTnJ1MDZMRHArRVNISnI0TFJ0ejcwWDNUQWdLYStqVXhB?=
 =?utf-8?B?VS9sblc0cEVQSTJYSU4wS3B3UDFBVENteEJWOE1xemdqRlFUOFZPWkk1eDhk?=
 =?utf-8?B?Q1FRRWhOSEYyRll5WDEvZXBxeGhuN2xsR2QvR0h1bExNNWx3QWM4U1ZRYS9m?=
 =?utf-8?B?WjM0bG1vN0EvTnZnenRUYTZZanpNeHh6NERwdkplaWFyVFJIdE10Yk5hL3d1?=
 =?utf-8?B?d0UxWVhSMUg5Vjh3MWRKZzN1c3pDSEw1VmhFdGQwZmcyaWFVcFdWUHo1R3RY?=
 =?utf-8?B?b0pqd2hoVzRGcEw0Z1RuYU1WYWwrWXJaSUFqMXZydDM4WHVvbmNBOHgzMTEv?=
 =?utf-8?B?TjVBVlZ2SjVzVmpxN0VrekNwR2xxaUNHakl5WGprU3Y5bk1ldnErd2ZDSFpa?=
 =?utf-8?B?aURrc0RvUzYxOVJva2xieVlUMWorQUg0SlY4TEdOZGNrUWRpd0hWWVdEWFZz?=
 =?utf-8?B?RitPYitsS0I3bEV0T1BuUFJOMHhsSE9mbXFhVXRoakFidXFYdGF3RVJJb0ZK?=
 =?utf-8?B?SkVxM2R5bmFxZlErTXpuODQ0a3Axbm80bnJoREg1SXFJamxOMUtaVVpwQ1dQ?=
 =?utf-8?B?Qlo3bUc4R0diZGYrODkrcFQ2WGJWRDFsUzRaSEloQklKOHhrSEg4RXBZOC9M?=
 =?utf-8?B?L29MM1ZOTGc2SFJ3dkxmZ2dCMHRSRVdHYWI3cStFNEQ0aklHNGVHZW9yMEZE?=
 =?utf-8?B?TXliMmk3eTZDMWt0NUJnaWplRTNUN01WbFpZTGNQR0dESEIwT2E2bGhaK1Rv?=
 =?utf-8?B?cjR5eU8zOUh3WStESWpSVTVMQTBDSHI1THhWRnl3UHdmZGV5S2lCZTVlc0Zn?=
 =?utf-8?B?V1c0L21uVHRCUkp4eGM3eU1ZK2dDR2xHYVV1V2phSlNISENvckY4MFFBSlgy?=
 =?utf-8?B?TFRmUFVmUENWWjFhS0MzSmY3MjV1UHlRSFZia2VweEFkQWdzNk9FZlBMcWM5?=
 =?utf-8?B?a3pjQTZ3N3BYL3JmcFVuOFVSdjZHQkdMTzUwQUJCZy9yRjhDcmJQdlAvQTdF?=
 =?utf-8?B?bDNxdzlQbGhwMmRocmR5T2dNd0pabkxWSlpQWmV2QkVPT2hER0plNGlLTXpu?=
 =?utf-8?B?b0ZJYlV1MThqcm1ua1pSSzE1RXZpRjZzZkk5eXVYQ05HdHRJSHNoSEtCdmUy?=
 =?utf-8?B?VTBqSDkxTEE3TWtFZi9SZDBzWUJnbk1naStmUU5Xekw3N3E5VVNtM0xjWXV6?=
 =?utf-8?B?RFJLRmpxK01IYzdEWjkzRjVyYkJLNHZ0VFRxY0hxcmFZa0EvTEl6Y2F0YndH?=
 =?utf-8?Q?eP8A7gTf0z1kaqQhXqf7+wp984nJ7GGE?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?c0tPeVBpdytjaG5VTjhFV1MzeU5rZTRUVnliZDY3NUZQU05IclpVRWFPT2lT?=
 =?utf-8?B?QUlZRkZGTnVDMFB1eHU1Z1VaeEVMVkJHWmxqc3pqWHJvUDJWSlc1cGJvV2RU?=
 =?utf-8?B?NXA3WE95ZHNtQmdhcjBleEp4bDRSSVMwQ1p1WFNGSmhwbEN3MWxTcFFYdUlY?=
 =?utf-8?B?WG4rb0htZjJ0L1BReWlVbkQ0RkpVQ3BCYmp2NmZIWWIzdmRPbExpZWl3MDU1?=
 =?utf-8?B?NzdHcERIeTJuVzNyUmNXcHU3Q1V5WUd5WGpRblljSXBNNGlmbW1sVXVtcU9N?=
 =?utf-8?B?a3NvYlVKUnhkMUJmV0EwRmp6OFZsRXlxR2tjTmdPalhmNUFBY1RES2lTd2l4?=
 =?utf-8?B?WFowRmI4dEV3c3JYY1g5cUg2T2oya1VtN0dieVNaZjRHSG93bDFwRDBudGps?=
 =?utf-8?B?OEFIcVdMMEx6RFpneVlvNmlaR0V0aVNGMGNrUnFkdFcwenNnaWMxaVhsQjNk?=
 =?utf-8?B?ak53MXBKa21TNEJKMjh5cUJrVU43R2dnRk1MS0lWdkl4TU1xUTNUZWpscXBS?=
 =?utf-8?B?VnNqaEMyYjF2Y0Fvc0hUQllUKzFyUGYxZkxBV1JOV0t4dGxKMVFidmZpRGpk?=
 =?utf-8?B?MkFtK2tpbkJjbHdmcjRrMEFUVHdqbzJyUGNJVHVDSmUzY3o4OXhIa3V5WXI5?=
 =?utf-8?B?NTkxRkZVbGxtYytnVmF4OVIrRDZBRW5TLzE3bVpnN1VwWDE4dlFjUzBkOVF1?=
 =?utf-8?B?UG5GQ1QvTFBZUldPbTB6NUQyV0NFeVY5ZU9DT0F1bGVaSmtXSHc3cUU4TGsz?=
 =?utf-8?B?c3Nxa2tWV3J3NmRjTXlxbkhaRit3cW9FVnM2b2dOQURHcTl5K01iWWdaUitm?=
 =?utf-8?B?cGVFL0xDODAwYXh5S3VhSENRR3R6NmN5b2pocU9oWkFOQUVyOXowQk1Db0tL?=
 =?utf-8?B?Uk1hMHV0cnBJK2REUVR6VExud1ZyQ2RKSHJsRFIwbFlzbXhUS1JJQU5ZcXJa?=
 =?utf-8?B?S3gzUzRaUjFEQXAzems3SFNLTldpZklYMGp1YWJIYmVMWDNIU1hHT043YlBU?=
 =?utf-8?B?UktPc3RHNUhGbnhlT0ZCYmdhOW83QjlIdFZXVHd3OWF5MEsyQnZUKy85RW9v?=
 =?utf-8?B?aTEvYnR2ZWxIeTVCRlBnay9lRlRpaXU4MHhiQzB4MUFGVWdxa25CNDlQRUJD?=
 =?utf-8?B?dCs1Yi93MHlGL2dHMjFza0dlUzNwOTZtLzNCbkU2M3JId01WWFh5YnJlRmd3?=
 =?utf-8?B?SXRWTFg5a3RkVUduSFR3ME5KR0oxN3FQNHZEWG9sNVBTYzFUU0JEOVJCZmkx?=
 =?utf-8?B?aXRDK091ek9Rcmg3REM4dis2TGx2SjNJZWtJV0xUN1hlSVRWSFFTV0QvRUFx?=
 =?utf-8?B?VXdFbkk1VDBPc1ZweUtBSDdobDd2UXBvSjRZaHRMbEt5NzFUZkx0bVNZYVZl?=
 =?utf-8?B?WlY3cnd2eUlDd2p5MVhVeDY0VHErbEM3MkFndzNHM1N1TEFhQm02elVTMDVs?=
 =?utf-8?B?cklueHMraUdvalJ2Z2hkV0ZVNE5JeUJFSjI2cXBLYTk0UHlPRzdoVXFpY2w1?=
 =?utf-8?B?QTlBTVpJbE5USi9TNmFnTUtHc28zaFN2RWtyTUw5aktPWG4xekVpdzNPSTdH?=
 =?utf-8?B?TUJ4bm5WSFhFMTM3dkdhdUloZWFDeENmNFRnbFVuK29oSmNDNmtsdUZmNkhR?=
 =?utf-8?B?WlBNMWhtQVVaNHN4bHVyQmI4K1ppWlEzUnBnanVIRlhrSVY5S0dHdCtUclE5?=
 =?utf-8?B?YmR3WUwxc3JTR0Z2cmg1OFh0enVVZXAvNUdKaDd6Y3JERnJRR1hPZnlBWENJ?=
 =?utf-8?B?OFJoQ254eWx0aDlZekRibmJXRzBaMWp2cTJrN0ZueTZrSjcybk0wUmRTWTgz?=
 =?utf-8?B?VzNtTDNSdzBub01GR3FtMGx4SXkwdStGM3N4QVdLWG5rMUhrc1I2WVNOUU0z?=
 =?utf-8?B?U0tMV05QcUhqU2x0VjVkT2ZWLy96VTAyR0JjWHBxTUZLQUVqSDYvc2FuY1kr?=
 =?utf-8?B?Qy80VkZWUWhoMVRuZUl2NloyMWRZTXVZMlMvajlxeFV5cDkyU0ZmdUVVeGpW?=
 =?utf-8?B?RUo1bHF4aUtKeGpVQzAybHhWeTl3akdBbVhXS1k3aHVOUmJvRlh4OWhCWkpG?=
 =?utf-8?B?U1UzUHJSejQ1L1hIbWEzUmwzcmFvL25OS3QwdWpHRDIzQTlPcmlnaGZSeit2?=
 =?utf-8?Q?DaThGm/CTaZjaS2It6B/BP4e5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f70925-ce7b-4a34-1cd1-08de280ebec8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2025 08:28:12.7956
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kYefySuWgJZqwoa1HO/wdH62aW5TGqRRftvtyOHBWMGP/h6OyhvpPsaZRDjMIkDwxNc3x9oAlYsuWj1Xul0dtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB8167
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 08:28:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226607

SSBoYXZlIHNlbnQgYSBmaXggZm9yIHRoZXNlIGZhaWx1cmVzIC0gaHR0cHM6Ly9saXN0cy5vcGVu
ZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8yMjY2MDYNCkNvdWxkIHlv
dSBwbGVhc2UgcmUtcXVldWUgdGhlIHNlcmllcyB3aXRoIHRoaXMgbmV3IHBhdGNoIG9uIHRvcD8N
Cg0KUmVhc29uIGZvciB0aGUgZmFpbHVyZXMgd2FzIHRoYXQgbXkgcGF0Y2ggc2VyaWVzIGZpeGVk
IGVTREsgcGFja2FnZSBkZXRlY3Rpb24gc28gaXQgcnVucyBub3cgbW9yZSB0ZXN0cyB0aGFuIGJl
Zm9yZS4NCkFsc28gYSB0ZXN0IHdoaWNoIHdhcyBuZXZlciB3b3JraW5nIHN1ZGRlbmx5IGdvdCBl
eGVjdXRlZC4NCkxldCdzIHNraXAgaXQgYXMgdGhhdCB3YXMgYWxzbyBkb25lIG9uIG1hc3RlciBi
cmFuY2guDQoNClBldGVyDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
TWFya28sIFBldGVyIChGVCBEIEVVIFNLIEJGUzEpDQo+IFNlbnQ6IFdlZG5lc2RheSwgTm92ZW1i
ZXIgMTksIDIwMjUgMTY6MTENCj4gVG86ICdTdGV2ZSBTYWtvbWFuJyA8c3RldmVAc2Frb21hbi5j
b20+DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1
YmplY3Q6IFJFOiBbT0UtY29yZV1bc2NhcnRoZ2FwXVtQQVRDSCAwLzldIGdvIHRlc3RzIGJhY2tw
b3J0cw0KPiANCj4gT0ssIEknbGwgdGFrZSBhIGxvb2sgdG9tb3Jyb3cuDQo+IFBldGVyDQo+IA0K
PiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiA+IGNvcmVAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIFN0ZXZlIFNha29tYW4NCj4gPiBTZW50OiBX
ZWRuZXNkYXksIE5vdmVtYmVyIDE5LCAyMDI1IDE2OjAyDQo+ID4gVG86IE1hcmtvLCBQZXRlciAo
RlQgRCBFVSBTSyBCRlMxKSA8UGV0ZXIuTWFya29Ac2llbWVucy5jb20+DQo+ID4gQ2M6IG9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBTdWJqZWN0OiBSZTogW09F
LWNvcmVdW3NjYXJ0aGdhcF1bUEFUQ0ggMC85XSBnbyB0ZXN0cyBiYWNrcG9ydHMNCj4gPg0KPiA+
IFVuZm9ydHVuYXRlbHkgSSdtIGdldHRpbmcgYSBsb3Qgb2YgZmFpbHVyZXMgd2hlbiB0ZXN0aW5n
IHRoaXMgc2VyaWVzDQo+ID4gb24gdGhlIGF1dG9idWlsZGVyOg0KPiA+DQo+ID4gaHR0cHM6Ly9h
dXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvMjkvYnVpbGRz
LzI3NDENCj4gPg0KPiA+IFRoZXkgYWxsIHNlZW0gdG8gYmUgb2YgdGhpcyB0eXBlOg0KPiA+DQo+
ID4gaHR0cHM6Ly9lcnJvcnMueW9jdG9wcm9qZWN0Lm9yZy9FcnJvcnMvRGV0YWlscy84ODg0ODUv
DQo+ID4NCj4gPiBTdGV2ZQ0KPiA+DQo+ID4gT24gVGh1LCBOb3YgMTMsIDIwMjUgYXQgNDoyOOKA
r0FNIFBldGVyIE1hcmtvIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gPHBldGVyLm1h
cmtvPXNpZW1lbnMuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiA+ID4NCj4g
PiA+IEknbSB3b3JraW5nIG9uIHNjYXJ0aGdhcC9nbyBtaXhpbiBsYXllciB3aGVyZSBJIGFsc28g
d2FudCB0byBydW4gcHJvcGVyIHRlc3RzLg0KPiA+ID4gVGhpcyBzZXJpZXMgbWFrZXMgdGVzdGlu
ZyBlcXVpdmFsZW50IHRvIHRoYXQgd2hhdCBpcyBhdmFpbGFibGUgb24gdGhlIG1hc3Rlcg0KPiA+
IGJyYW5jaC4NCj4gPiA+DQo+ID4gPiBUaGUgdHdvIHBhdGNoZXMgZnJvbSBtZSBhcmUgbm90IGJh
Y2twb3J0cyB5ZXQsIGJ1dCBhcmUgYWxyZWFkeSBzdWJtaXR0ZWQuDQo+ID4gPg0KPiA+ID4gQWxl
eGFuZGVyIEthbmF2aW4gKDEpOg0KPiA+ID4gICBnb2FyY2guYmJjbGFzczogZG8gbm90IGxlYWsg
VFVORV9GRUFUVVJFUyBpbnRvIGNyb3Nzc2RrIHRhc2sNCj4gPiA+ICAgICBzaWduYXR1cmVzDQo+
ID4gPg0KPiA+ID4gT3NhbWEgQWJkZWxrYWRlciAoMyk6DQo+ID4gPiAgIGdvOiBhZGQgc2RrIHRl
c3QNCj4gPiA+ICAgZ286IGV4dGVuZCBydW50aW1lIHRlc3QNCj4gPiA+ICAgZ286IHJlbW92ZSBk
dXBsaWNhdGUgYXJjaCBtYXAgaW4gc2RrIHRlc3QNCj4gPiA+DQo+ID4gPiBQZXRlciBNYXJrbyAo
Mik6DQo+ID4gPiAgIG9lcWE6IGZpeCBwYWNrYWdlIGRldGVjdGlvbiBpbiBnbyBzZGsgdGVzdHMN
Cj4gPiA+ICAgb2VxYTogZHJvcCB1bm5lY2Vzc2FyeSBkZXBlbmRlbmN5IGZyb20gZ28gcnVudGlt
ZSB0ZXN0cw0KPiA+ID4NCj4gPiA+IFJvc3MgQnVydG9uICgzKToNCj4gPiA+ICAgdGVzdHNkazog
YWxsb3cgdXNlciB0byBzcGVjaWZ5IHdoaWNoIHRlc3RzIHRvIHJ1bg0KPiA+ID4gICBvZS9zZGs6
IGZpeCBlbXB0eSBTREsgbWFuaWZlc3RzDQo+ID4gPiAgIGxpYi9vZS9nbzogZG9jdW1lbnQgbWFw
X2FyY2gsIGFuZCByYWlzZSBhbiBlcnJvciBvbiB1bmtub3duDQo+ID4gPiAgICAgYXJjaGl0ZWN0
dXJlDQo+ID4gPg0KPiA+ID4gIG1ldGEvY2xhc3Nlcy1yZWNpcGUvZ29hcmNoLmJiY2xhc3MgIHwg
ICAzICsNCj4gPiA+ICBtZXRhL2NsYXNzZXMtcmVjaXBlL3Rlc3RzZGsuYmJjbGFzcyB8ICAgMyAr
DQo+ID4gPiAgbWV0YS9saWIvb2UvZ28ucHkgICAgICAgICAgICAgICAgICAgfCAgIDYgKy0NCj4g
PiA+ICBtZXRhL2xpYi9vZS9zZGsucHkgICAgICAgICAgICAgICAgICB8ICAgMyArLQ0KPiA+ID4g
IG1ldGEvbGliL29lcWEvZmlsZXMvdGVzdC5nbyAgICAgICAgIHwgICA3ICsrDQo+ID4gPiAgbWV0
YS9saWIvb2VxYS9ydW50aW1lL2Nhc2VzL2dvLnB5ICAgfCAgNjYgKysrKysrKysrKysrKysrKysN
Cj4gPiA+ICBtZXRhL2xpYi9vZXFhL3Nkay9jYXNlcy9nby5weSAgICAgICB8IDEwNw0KPiArKysr
KysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gPiAgbWV0YS9saWIvb2VxYS9zZGsvdGVzdHNk
ay5weSAgICAgICAgfCAgIDMgKy0NCj4gPiA+ICBtZXRhL2xpYi9vZXFhL3Nka2V4dC90ZXN0c2Rr
LnB5ICAgICB8ICAgMyArLQ0KPiA+ID4gIDkgZmlsZXMgY2hhbmdlZCwgMTk3IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pDQo+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvbGliL29l
cWEvZmlsZXMvdGVzdC5nbw0KPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL2xpYi9vZXFh
L3Nkay9jYXNlcy9nby5weQ0KPiA+ID4NCj4gPiA+DQo+ID4gPg0KPiA+ID4NCg==

