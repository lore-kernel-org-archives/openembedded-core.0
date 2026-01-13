Return-Path: <y.moog@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F34AD2D0E8
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 12:42:52 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.114])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57999.1768308169758966414
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 04:42:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=selector2 header.b=NhbhspLe;
 spf=pass (domain: phytec.de, ip: 40.107.130.114, mailfrom: y.moog@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s3AC53M9ivttUp56n0t3HwOsp1vH7Yjotc/0Bo11g/9URO6Rhs+VMDetmOmHLgTEJ0b7QU+tguV2GQbP//qihJD5kNcB9rT8WPcNX3vJTTCnrk+v0sq1I/rtnhwbqc+PVCiV6kGcpUDnpFs7WoSuPs3jtKFFqwF60K0BCro1uunyGA0fKC8mVvQsSFXrXJgub9t958lxrphTH0lFOmAQdRp3UOFZOSDXbaarlVJboD94mfq503JGChF1tviEZDNWolu8RbWEMA4v60ffI5clLzYR8jpBg9OdF3aL9rsdog8tm//4Ij+24WQwU/NpfwHVUf91p0NZ/irUhg+n0UoNWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p0lhEnW/v7J3eRl3TOCLLB/YkjXXkfGToOD7sMofdUU=;
 b=W0KqXIp1Z1hIh4VRKG8P5D7sUNfcHSyjQDXhXlz88+7UY/ZdlhjaM8Qv1w9v4KvKnBRLnAxqbhcRPZ6TXpDRnTa2Rq/IGIuUkR9c+vfIzzGTeP6Ok6J34EdWDsQlYSluT5O1XWdZ22q45b2agws5/qZhihpRDeS4pwA5zWXJ4p2yMf6gjwTOrrQnS9Zml7rhxztwM4wK6r6J3EVfJgq3pUyEEhfvMws8JX0NyCsf74/mBw59XKGqfh1M9VfGLhXBvZERjs/doe9JtqZeDXTf9rCloIYjSOfx65JHp1zXMWHm+rP+3Vfo+bi0DrjUMi+dRQ7MBPNeWn+cy+FQAeqKgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0lhEnW/v7J3eRl3TOCLLB/YkjXXkfGToOD7sMofdUU=;
 b=NhbhspLe5tpG07aedCyWHNo9ywedyl/22XM0pAmBPfUdxm/IFDU/v+90ohS6VSADFczasehK5XZRx4jwgKIKEVq9DacWHuppD6f8ZTkwnk8E585DVExkZwX7RkZtlK+M0zg7glFdTbvuBfjm0XNOf3oOLcVR0KI5LbjwadFURhsC+HIglJAJ5sVvdFxMJ5ilOmKB85ico+TXimjKAclFBq4shdYIxTVqmsXQwSLELets216bHdAK1QnwTL/tIESQesTLSCuYZ0w2n0oRqG3Ut5fUThDAp4xYEDg6rB3hivuEwpz0oT+XZNBhK+PNpatmM7+wHVMOuF0kQ+PdXPLtXw==
Received: from VI2P195MB2491.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:22f::14)
 by VI1P195MB0478.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:145::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 12:42:43 +0000
Received: from VI2P195MB2491.EURP195.PROD.OUTLOOK.COM
 ([fe80::4131:8d3c:f0c6:c414]) by VI2P195MB2491.EURP195.PROD.OUTLOOK.COM
 ([fe80::4131:8d3c:f0c6:c414%6]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 12:42:43 +0000
From: Yannic Moog <Y.Moog@phytec.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex@linutronix.de>, "upstream@lists.phytec.de" <upstream@lists.phytec.de>
Subject: Re: [OE-core] [PATCH] icu: split at '.' instead of '-' for major
 version
Thread-Topic: [OE-core] [PATCH] icu: split at '.' instead of '-' for major
 version
Thread-Index: AQHchGZ7iEvJMQ6zdk+rTy1Aeifi2rVP6jQAgAAhN4A=
Date: Tue, 13 Jan 2026 12:42:43 +0000
Message-ID: <458f839bc4a7f231cf4c1a8ea442bbcd5601a353.camel@phytec.de>
References: <20260113-icu-major-version-fix-v1-1-50e1e75b4254@phytec.de>
	 <CANNYZj90X_vSfAhUAVhiik+RNKSydLMD8iv_AoRHUAm1TQSjzQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj90X_vSfAhUAVhiik+RNKSydLMD8iv_AoRHUAm1TQSjzQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI2P195MB2491:EE_|VI1P195MB0478:EE_
x-ms-office365-filtering-correlation-id: 370c3ec6-1cb4-4d79-ec19-08de52a13f06
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?dmlZaEtWTVNadkJsNy9yMGtQZ1dMdk52TjErRTFpN01MeEl3REt3b08wcW1W?=
 =?utf-8?B?enZzNTFkbGRBSGVNdTIvb2JxeHA3aHhUeThZdThKQWRDa2sxZU1hZDNicVhW?=
 =?utf-8?B?NGJhc0twc3k0UkE1WmtESHdFNlMyQ3QzZFdsZGMzaHp0TVlLb2I0dWlxYTJs?=
 =?utf-8?B?dFY5ejlOOEQ3cU5jUHBCOGJ0WjhHNUlLUFNVUUNJOTIrRjVKVnlzTGtkVUNC?=
 =?utf-8?B?VmFBdHQya1VzYng2aFQ1QlIvVy9zeU9QV25pamJjdUVhcEkzTHBnRjRuUjdy?=
 =?utf-8?B?V3NPdFRlb2xBMTkwS1hHRFcxS0ZHMGVQNGFWSTVnRGhjOWdyOVVvVWNraHFH?=
 =?utf-8?B?RUthcUo2V3h3VVE5R00vSmNOOFc5RkQ5bFBrOFlNM3FCSG1JaXZ6ZDAyd0J0?=
 =?utf-8?B?c1doVlhKUTdJeDQwa2Znb3hDNkQ4VkNwaXl0WHBxem5abnMyN3VHam9yOHVu?=
 =?utf-8?B?NzBHKzBPcVcxekNYNERJdnltemxieHkrL2RaOGtVR3RTb3VEZVp3NkZ3WTBB?=
 =?utf-8?B?M2htbEZlQ0NsYU1uWGE1R2RaTndqbHVjbFF3MW1jZVM0S2lydFcrUWNFVFVq?=
 =?utf-8?B?RnkxcVdWRWNZV3h2eHFJdmpxYjZzVzJ3d0NSK2dSR0JFOHdNVTNjQTYrRGlp?=
 =?utf-8?B?UUpUSEhCMUhTcjdsU2FoazdtbDdobDJJOElqdElOYjJkQ2xBcVFmRlBmQ0lN?=
 =?utf-8?B?bDJPbGl0Vjd3dFUyV1VhQlR5VzFrY05RUmtIcStlT3hQL1hmVUhueEl2YjU4?=
 =?utf-8?B?MkdXQXh4K2U5c29VV2hFSkJMMUdtRjhLQVpiMFJNUjFRTnRKYTZ6T3dUM3lK?=
 =?utf-8?B?aTAwRm9YY1FOTk5vZjg3N0FLVUltaUFYQzRvTkVvekY4YTZqRE9IZmwzYmp0?=
 =?utf-8?B?RWhQcEdOU05jayttc3Y4ZWtORlNpaWVvMzd1YkxVSFp1M1pNaktiYURTK00v?=
 =?utf-8?B?SDRpd1ZSSUQ1Yk8yaHNYK3RxK0dXaUZWNkxOemFUcmZiL2hkaWplZGtJVzlQ?=
 =?utf-8?B?dVNVYlppeWZ1MU9tU0VBT1BYT1krNGwwY1U0L2hSWGlwWjJ2SE9Mc0ZMQVVP?=
 =?utf-8?B?YVZKSklxN3dQR2ZrYWVmeit3c0FXV3NYZ2JPYS93NTJCR0xxbW9QMVgzVjFL?=
 =?utf-8?B?NWplallCbGRMZkJSSG04OWMzbG1qNGlwRGZuWVZOc1BsaFRWWEM3bTNGTDk2?=
 =?utf-8?B?RlFEMkNsamY1OWt2TVdJcldSNEdoQVpMQU4rOVFaYTA0UDZLelp6YnB0U29O?=
 =?utf-8?B?cWR0WU4reFA4aGRLS1c3OTJaV1JZYTFtTGcvT3BPK09jbkRjSzNQdnpzUzhV?=
 =?utf-8?B?SDk1UEd0RkJLa2pkOFBzQ0pYdGwzelhWSU9QRGxHc3FIcTZWZUxNZ3N5UDBL?=
 =?utf-8?B?T3VEdU5RNjJ6YUNNOHM3dGtBTGN0emtWd0tiTXV3T0NyS0lSOHF2QXhTOHE5?=
 =?utf-8?B?aEUvbzFVNDV4b3BlOFVZaTJXakd5R28vZVlqekszcEFyOWJVQnpaZkZnR3h0?=
 =?utf-8?B?eGhTQ1hNeGhYYVAwbGNkdklxNVhRVEs2YUxPejZGZlVwNkt1WHBqeHV4T0Y1?=
 =?utf-8?B?UVdscFBFam5MSHBqaW04NlRYdTBVZmpBMUkyaU92MElSS0dtQTlYWGFiUC9n?=
 =?utf-8?B?TitWUXRtUm1BM3dGdS9PZTY4RzIxb0hQZndMeWdBUkFhR1lGcHFtTFl5a2ph?=
 =?utf-8?B?Yi9yTlVNdFZHdVhwRTlzQkJMS1JEZmxXYy9UN1lacElCd3QrdTVrRm80VWNG?=
 =?utf-8?B?WDcwdDBsYWdobktCMTRwWVlPZWVPWVNJUFJKcmZ3R0JXSCtlbnEya3cvYUxj?=
 =?utf-8?B?L1lDcUZHYWo3RmVPaWtGT0tZUjZmVEo1dXlXWGltdnQ0T2xUaXZTQkw5THR6?=
 =?utf-8?B?b0RCaWRQeUtUeTdiTDR5S2h5alY0RFFwTGpCcXd4dkVLK3BDd1VudHUxVGVN?=
 =?utf-8?B?aDBHaGhhSTdmVE44VjlpcjlBN1BzRlc1NUJMMXFsTlpxZVlEVlZpdEhMMjVn?=
 =?utf-8?B?OWExYjkxSXdRNFM5SjNqY2dvR1VQWG8wM244a3lEVWhQWGJKWXpkL29EVm1Z?=
 =?utf-8?Q?c2c1Ie?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2P195MB2491.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?R01JVzhaS3FCbnpyWklJY25rRjMwOWc0U3Jub3F1dVlJNzAxV2hJTkY5SkpR?=
 =?utf-8?B?bndkZnJWSml2UjZKaXJ3OUtGSEcrcU1RcFc3TzUyVHdCUlBqT0FVV2I0RFZ6?=
 =?utf-8?B?aktJTVZ2NE9qU0RmTW5hS2YvRTVpbm4vcEVlb0ZYQjBHeGVlYjhYQ1NYT2h2?=
 =?utf-8?B?ZWtCMGc2dHE4czRkTGVUVWlHWTYyQ1YzSzlWQjR1dkpuL2x1Ynk4UFVBQjM5?=
 =?utf-8?B?UVk2cXdnTE9DUkkxRzZXZEJ2Sm1MOWNTK2wrd24yTG1nRU53bUZZM3hhbVFL?=
 =?utf-8?B?ekNkMExjQURLZW43cUhJYVhIclRwQlVTWnJmWExsdHI2bXA3eTJKdzJJdzV0?=
 =?utf-8?B?VjFOQ0lVZnlyODVVeS9lRUFrUjliTWlPdCtyd0dHSUpwRlZ1dndNcHpUOVFy?=
 =?utf-8?B?NEs4NDVFUVNSVWFnaFN5azdPOFM4RE5YY21SSWh4ZjlRSU9aNGpYVlMrRitX?=
 =?utf-8?B?amZtbWZFVEQza3FoVlBOVDNmQlU0ektaUmNvdHRESUdEWHlsMExvd1BudkZN?=
 =?utf-8?B?cDdXSFpieG00cm9NV2xaMXZQcEpzZ3lzY3lCdGw5T1owcW9vSUtXQS95KzJ2?=
 =?utf-8?B?dVFqcFBFUk5MbkxEenA0SXpoT0pkWSsrbVlnei9RREdJbURNWVBnN20zOERt?=
 =?utf-8?B?UXNvUytpdjJyS3dpdzFzbGxzNmcvRS9ta2twMTFoTFpxa0xqSStBQnBULzYw?=
 =?utf-8?B?bW12bWdtelFZNW9NVnZXOFppWjR5TThZMTVPS0tEY0xLRUhjaTR4dythWFF1?=
 =?utf-8?B?WklaWlllaFlZVmxBTmVYdkY4QTlnaGs2YlRCM0IzMDZ2MHU3MnVCTXl0RjZq?=
 =?utf-8?B?MVhHeStVeElvSHI1S3hvUHN0M0RTNklLcTNBUmdZUzFRUHFLaGNFdDRiM3Vz?=
 =?utf-8?B?MXlSSmY5T1VPdVgzVlFZU2ovaXFWZ2dkNGplTjlQOWFXaEtTZmZrbzdwL3dG?=
 =?utf-8?B?RmUwd29tQkc2WXcxdTBVRE1IcTlzenJRUEc1T003MmxxMFRDZk4zcDIveC9X?=
 =?utf-8?B?QTZpbG5VNGt6dHlmOXdpa3VDdkxlbmNPQzNGdEdVT1RsYkxiZWd3blRBVjJQ?=
 =?utf-8?B?MWlDRnozYmFYNmFWRkd2eWhyelZHKzE3d3J6WEdtZk1YSEZQZFhRR01WZEZ4?=
 =?utf-8?B?L2kwcWpHTGVEb3Bqdk5OLzBVdWZyeTBCTTRhYWc1d0RoOW9xZEFzdWNNRkJy?=
 =?utf-8?B?LzNZR1pGUDlEOWJtdmxVNmhKMVBQcklVYVZ6cHNrc2xmVVVvTzhQRDZTbkhG?=
 =?utf-8?B?ZU9UMFNpSnRtNnd6N1hqamtnS3JvMjlZNWt0RWFZbU8yZzZocUd0ZVFQWWJW?=
 =?utf-8?B?MzdrUlJUWm4xMmhSUTV0SnJSYkFDSjZsYVVUdGJLdnpoQloyeGZ6L2RXR0xr?=
 =?utf-8?B?N1IwUGxiNkVpZ3BJREZGL3lQaDh2NDk1TnBGL0dsTm82RWcxVjdLYlJmK2Vn?=
 =?utf-8?B?aHpuTHpZK0QwdkM0Y1JKVm5NMll5bXRnQkp5RkdvQ1NDbHlYcWdNbTNIUTQ4?=
 =?utf-8?B?L0pXQTY4VDFrSjdqUGcxQlFpRjJld3hIWHYzNTQrNFYrYUtqNlhMK2tCR0lh?=
 =?utf-8?B?RzBVUEZIdEE4OHk0YTVybk1jTDZmVFllQjR0VU9SWnB4eHVNQzJYTi9lNWpu?=
 =?utf-8?B?alFwRWRLa3ptK1c0ZmhPV3Z3akZsaG1jdmIyUjNqYWRtS054Y1lHWnpwQnMw?=
 =?utf-8?B?Zzh1eFhXOW9LU2s3RWs4K1lsNHQ3NjEyd2JZWGpGdGRka0E3NlBZY0FHRWlY?=
 =?utf-8?B?cFdWeG9vcC95U3QvbytSMndOdUpVMENlc0lCaW8wQUpmUzIwbTk4QUM0SC80?=
 =?utf-8?B?RHRUVFFOaDA3MmxOdGxKZEhhVWF1c2l4R3pYaStiMlNUZUR3bktmZU5vd2Zh?=
 =?utf-8?B?aFFYWDdFMDR5R2dDUEVoZ3hOSlJ0alVFSElyNUs1VVFZL0tyclo3TWNic0Y3?=
 =?utf-8?B?ZnNrenB0aDZhK2FHbHFxMFpFeGRiL0JncjFyVUl2NjRqcmJQZHZ4SjRIb2VT?=
 =?utf-8?B?WUlXY1R4SDlQSFVBczVnYnVJOTNiZWJZc0pLUUEzTWhUR1pBbVVvR0ROTjJv?=
 =?utf-8?B?a3crVHcwYm5iY3AxdHYycGVMcTY2OU0vcDhRYUdoMk5ZOGtjWmtuMHVNa2Jv?=
 =?utf-8?B?MTJiWFRsdmc4ZVkxVS9pa2IwN3haVTlkQXNpa2Rma08wUEszQUVKQWZYUmVW?=
 =?utf-8?B?bzRiWDdhK0RaV1hNcFhPcTlHNGFRZStmNnhQUVlHQXQxdjNOSFF4SWFIZ0ww?=
 =?utf-8?B?U21CYndWSW42M08vTjlsSVlZaCtCOHovUnRZNHpTQy96RFhrbEFwRDRDQWF6?=
 =?utf-8?Q?/Z/Vess0lIKw9smYzj?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6151C1BF3F563642B6E49DC897FE3744@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI2P195MB2491.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 370c3ec6-1cb4-4d79-ec19-08de52a13f06
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 12:42:43.3349
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uew6+urrzEUYbryc75lThblisPEfVEuzjYwLzIor21Tc+54nqh9X6f9WVUIHNJ3O21ciZT8k8BRA5prnl3oWuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P195MB0478
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 12:42:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229262

T24gVHVlLCAyMDI2LTAxLTEzIGF0IDExOjQzICswMTAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToKPiBPbiBUdWUsIDEzIEphbiAyMDI2IGF0IDA5OjI3LCBZYW5uaWMgTW9vZyB2aWEgbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZwo+IDx5Lm1vb2c9cGh5dGVjLmRlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOgo+ID4gV2l0aCB2ZXJzaW9uIDc4LjEsIGljdSBhZG9wdGVkICcuJyBhcyBzZXBh
cmF0b3IgYmV0d2VlbiBtYWpvciBhbmQgbWlub3IKPiA+IHZlcnNpb24uIFdpdGggdGhlIHVwZ3Jh
ZGUgY29tbWl0LCBJQ1VfTUFKT1JfVkVSIHdhc24ndCB1cGRhdGVkIGFuZCBzdGlsbAo+ID4gdHJp
ZWQgdG8gc3BsaXQgdmVyc2lvbnMgd2l0aCAnLScgaW5zdGVhZCBvZiAnLicuIEZpeCBieSB1c2lu
ZyAnLicgYXMKPiA+IHNlcGFyYXRvci4KPiA+IC1JQ1VfTUFKT1JfVkVSID0gIiR7QGQuZ2V0VmFy
KCdQVicpLnNwbGl0KCctJylbMF19Igo+ID4gK0lDVV9NQUpPUl9WRVIgPSAiJHtAZC5nZXRWYXIo
J1BWJykuc3BsaXQoJy4nKVswXX0iCj4gCj4gUHJlc3VtYWJseSB0aGlzIGNoYW5nZSBjb21lcyBm
cm9tIGJ1aWxkIHByb2JsZW1zIHlvdSBhcmUgb2JzZXJ2aW5nLAo+IGJ1dCBpdCBkb2Vzbid0IGV4
cGxhaW4gd2h5IHBsYWluIHBva3kgaXMgYnVpbGRpbmcgZmluZSB3aXRob3V0IHRoaXMKPiBmaXgu
IENhbiB5b3UgbG9vayBpbnRvIHRoYXQgcGxlYXNlPwoKWWVwLiBJIHdhcyBtaXN0YWtlbiBpbml0
aWFsbHkuIFRoZSB0YXNrIHRoYXQgZmFpbGVkIGZvciBtZSBpcyB0aGUgZG9fbWFrZV9pY3VkYXRh
LgoKV2l0aGluIHRoYXQgdGFzaywgdGhlIGxhc3QgY29tbWFuZCBmYWlsczoKCmRvX21ha2VfaWN1
ZGF0YTpjbGFzcy10YXJnZXQgKCkgewogICAgJHtAYmIudXRpbHMuY29udGFpbnMoJ1BBQ0tBR0VD
T05GSUcnLCAnbWFrZS1pY3VkYXRhJywgJycsICdleGl0IDAnLCBkKX0KICAgIFsuLi5dCiAgICBp
bnN0YWxsIC1EbTY0NCAke1N9L2RhdGEvb3V0L2ljdWR0JHtJQ1VfTUFKT1JfVkVSfWwuZGF0ICR7
U30vZGF0YS9pbi9pY3VkdCR7SUNVX01BSk9SX1ZFUn1sLmRhdAp9CgpXZSBkbyBub3Qgc2VlIGl0
IHdpdGggcG9reSwgYmVjYXVzZSBQQUNLQUdFQ09ORklHIGRvZXMgbm90IGNvbnRhaW4gbWFrZS1p
Y3VkYXRhLgpXZSBoYXZlIHRoZSBmb2xsb3dpbmcgaW4gYSBiYmFwcGVuZCBvZiBvdXIgZGlzdHJv
IGxheWVyOgoKRklMRVNFWFRSQVBBVEhTOnByZXBlbmQgOj0gIiR7VEhJU0RJUn0vZmlsZXM6IgpT
UkNfVVJJICs9ICJmaWxlOi8vZmlsdGVyLmpzb24iClBBQ0tBR0VDT05GSUcgKz0gIm1ha2UtaWN1
ZGF0YSIKUEFDS0FHRUNPTkZJRzpwbi1pY3UtbmF0aXZlICs9ICIgbWFrZS1pY3VkYXRhIgoKd2hp
Y2ggdHJpZ2dlcnMgdGhlIGVycm9yLgoKWWFubmljCgo+IAo+IEFsZXgK

