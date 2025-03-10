Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11542C28B2E
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 12:53:07 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.65])
 by mx.groups.io with SMTP id smtpd.web10.36779.1741611180083991968
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 05:53:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=x6h2/ou5;
 spf=pass (domain: siemens.com, ip: 40.107.105.65, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xbwybcvMzWsryjLBg5Uy1b7phoGd1CL5aeQHpWHsO3NC5hHTmNbbyAd4sT4QoO5pFuqENTMq3xwuxgN/BjB4YnmavGnEvY04LUyFVCtcIYdbMsu/ppikYdIDVjw7b4VEG7HGaKDHxpuHs9PzDcHSYYEKnDAin2yMEyAB9JjHYj8ktCTuXGqCjcdOovMVyhcfqAnHy1rKq/XdcRmn6cepkr7dej/VLczroZj1BVqwt71047tJKGMKjFQFUidVPPZtAZndp1spw4sdaYOsIXBBGn/H9IwuD1S+gEGDBE3EU9wlaGyjZUXQhxRyRgI7ByqXyS3baoJVmYKxJQCL/Fe5BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J4dGsMxHry8G9tFoMcSHyttyCdecqNkmE3VvFyuV7lM=;
 b=B/b8HY03PiTLSMPQnDKH+v47C7DTX7t5XjdswkZn1lmWUTghMSyP3VnnIKBDTfkvqRy70hnWXunf5Wg8TiH6d6Md76uof6uPPJHutJPoecmlZCedgZQtG4zaSv9zzDkPL2/Od0TWCuzMetAwt2kgjawM9n9Z9lz7UZcdWLNc/NEjELk66h+vS3AFpiu+37ul4fhEbsJ/+XAoE4BM0r7Wq2s/z0wRz7KXF62lZIdP0icEMpM3KQeeA+lQyAGlItMThXkxl1V4Fc+sVTcJqdIXPvqLgFP6LFQHMdWaVrZmvhkqWSigm3G1IkvRYT2gDlyjJykPY5ROEhRCbl9MOYrxjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J4dGsMxHry8G9tFoMcSHyttyCdecqNkmE3VvFyuV7lM=;
 b=x6h2/ou5GrDYXy8Tj1Zih8oakQERTP3rNt/RaVyZh2nehPz7QMhVUe/2BCfwcZgIJX4sCEAKfs3ZSecfbUnkqVntleA8vbFN2ZGQvskv1aJQJ5BT4mw/mqsUElp1soxpIZBqqy/d6QrCDSndbtUp6baouQEBzVVa08BHVYVnb2TXvffRSWkc/rOYdOaQ4gqHYL9pzOQ+9lsakZxFIzO/ckyQdvOrCgyYPLFWhnUA7QCh1P0hI8UyzjzSItz51WXuiBMkkhwSrPvjyj/tldUFrgp28wN7ExoS8dNfimh6LiTDhHAnuodpOeTMQBHkYSESzRG8oWtTPYaN4gtkOYr9oA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PA2PR10MB8820.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:420::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 12:52:57 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 12:52:57 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "ross.burton@arm.com" <ross.burton@arm.com>, "steve@sakoman.com"
	<steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
Subject: RE: [yocto-security] OE-core CVE metrics for master on Sun 09 Mar
 2025 01:00:01 AM HST
Thread-Topic: [yocto-security] OE-core CVE metrics for master on Sun 09 Mar
 2025 01:00:01 AM HST
Thread-Index: AQHbkOVhS9NkHvbH106iZtnIDtPbHLNsUW4AgAACqsA=
Date: Mon, 10 Mar 2025 12:52:57 +0000
Message-ID: 
 <AS1PR10MB5697CB5E5F4FFB0119B13925FDD62@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250309112109.633831003CB@builder.sakoman.com>
 <0AB16BCB-8FD3-4548-84F7-B2B9C4DEB8CE@arm.com>
In-Reply-To: <0AB16BCB-8FD3-4548-84F7-B2B9C4DEB8CE@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=3ada00ed-c452-4ff2-be3d-6553528206c6;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-03-10T12:50:04Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PA2PR10MB8820:EE_
x-ms-office365-filtering-correlation-id: dc495899-cf86-433b-6372-08dd5fd27b47
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?N3pMdWVZQzVoeWpzVytVUGE3dVZpZ21FRVRvanN4Z0QrU2Q1dnhhVnNNbUJ0?=
 =?utf-8?B?NkorV2ZVQ0FCQ2oxWG1zeTRQb29ua2NZMUtaNXV4bWJxaDVBVHlEV0UvR1pT?=
 =?utf-8?B?VDI5L2dHcFo3NUtLVVFnK01tTGZac3VtY3c4Rk9Gd0drTmNOMlltWEJPUE9Y?=
 =?utf-8?B?WHVMUjdOUUZhMDJZNm5STDVZMXRBNHUxUjF5Tm1XY01najZ2K0E1TW9RSjFx?=
 =?utf-8?B?NnN5V0NDTWtzMUJRQ0pWMG0yL3MwRUpJdEdqSkhJRVg3WXJSMjNOSWlDTE1W?=
 =?utf-8?B?QmhTMWkyclJXWmxxNkZMaW4wS1FNaEVxWXEvYzBIUjQwZUVORDVhRjdwei9z?=
 =?utf-8?B?bWZHN2lwNThvdTF0d29vMHM4NllBRUhCOXZQSUF6VWxWUG1GSDNFMW8weTdD?=
 =?utf-8?B?UkxYOE1SZzQ4emM0N2ZYdEx2cTJteHBSbm5ZVkYvak9MN1AxNU5tSmtoUXNX?=
 =?utf-8?B?eHpxNENxTnpZU3RGTXIycENta2N6cGwyb2dCVkcxeWhpWFlvbWFEb1pWcitX?=
 =?utf-8?B?MW1NRzhYZ1NXQ3VIZzRmelhiL2pwcURvejliT21TTlgxNVB1TUlnRFBKQlph?=
 =?utf-8?B?SDhtd3hwZWsrMTRrc2tQclpaeU5Kempzb0J4ZXozc0dtejI5YitNekl5K29X?=
 =?utf-8?B?TUtHajhld3VJYnQxTTRoTWNaLzRkTVlIOUg3MnRXTE1MNWgrMXg2cS9BMEFH?=
 =?utf-8?B?NE91Z3RVekdQL0tSM25SNi9iaWF0OC9oVFUyTlVJSjB0WDlqdFJZV05DZlEy?=
 =?utf-8?B?Nlo0bjQweWtSRlpwWjlrYmlPaitlc25VSjNWcmRUNkJZS3VmbU02QlZWSU1s?=
 =?utf-8?B?aGRlQ3pZYjhSNW00NEVvd0NPUDBkbEpOM001MEhSWlBBVTRlSFJMTnphN3ZT?=
 =?utf-8?B?WGtoUXNxMHlQandsaUxhU1AzV29idXJrRUs5OEh6cUV5c0RnQXduT3ZFL2xF?=
 =?utf-8?B?MnhKTFBDYWZGVjcrZE1DQXJpbklJYXpDZlV1VW81Z1A3NGEwc0J2MHVzNit6?=
 =?utf-8?B?dm5xQ2ovRTY2WFgyaFJBMy9BYXZZbzlHdWplMFNFSHVkZ1I2QXU1ZTNidnk0?=
 =?utf-8?B?ZWM3S2pETWlaY25nMVRMODg4MW1ZTGFqYmFMVS9pb3p1YmFRbDU3RVE1MXVr?=
 =?utf-8?B?cE9SbWVaMUx3L1FpemRTdGFhWnBHalR3UllBZzhSVm5PUU5OVlVxUEY2REZO?=
 =?utf-8?B?L09hVnJZQ2tUU3phS1lQbmlEUDFYOWtZM0Y2Tml5Qkx6L0N1REZtTkwwbkdS?=
 =?utf-8?B?a2YrcENoSno2dWRWSjVrT1lvbFlrRncyZ2ZTRFpraTcrL1Y0dTJ0R1QzaTZK?=
 =?utf-8?B?UkM4WDB2Z1ovY1lSUmw4UE05NTBTeWx0Qzh1YURBZCtUSEJhY2VOcmhHem9V?=
 =?utf-8?B?SnMzVW9kK1Z2QURzYWRWNlgzY1FwWUtvcHJQOS9Ud0RRMFFXR2ZHcDlEYkpZ?=
 =?utf-8?B?c1VqN2k4OHlRbU5xOWQrVjczZVJ0RnFaWEpQVFVtYkJiOUFrU3YxcG1LdVFK?=
 =?utf-8?B?Qjh2bExFUmJEK2VYdjMxZkFJcUZCdlFIekg3Z21qTFU2Q0gyS21ZWWJGaklM?=
 =?utf-8?B?R0hRcXFKVTZ1SUFydlFwNmNEU3U0Mm40eDBuNDR6Y1NKY0dZWWZCZ0l2cFpK?=
 =?utf-8?B?YVp4WHB1TXZRemNRNC9XK3A4MzNyaFpVWG1ucTMyRHptTVliRXNIVE9nYlQ3?=
 =?utf-8?B?NkMxYXNjVE84b1Vrb1VYYUtlTWgxN2FjMXlqUkMzSHQxUXZyS0pzQVQ2Q0VR?=
 =?utf-8?B?UytLSkdmR2N3MENSajBHdS82Z0RTYURVcXNWOHJwQzRJZDEwMVRxT3NCOGNS?=
 =?utf-8?B?SER4dy9BZExtNUczeTJsdVBkZDdHeURxYXY3MHYyeW5hTmdzTmY0Skxidy85?=
 =?utf-8?Q?PhtVGFz8Nk23E?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cERIR2FpaWc0a2ZLM08zMTAvL0NJOHdZMlYvMG1DUUl3eXhUV3k4dE1NUlIy?=
 =?utf-8?B?SG13dVByT2ZacXQrcWFwZDhYbStFTDdDeDJrWHR3TEN0SjZneTlqVlZDc1lJ?=
 =?utf-8?B?eWNoVUlLQVVKTHZaVllnbjd4UzdyRXhtNy8xdWFOeFhMY2IxWHlBd3h0a004?=
 =?utf-8?B?UFNLYmlBOTJ5ekFVVC9CeGpFRGNkU0Fabjhxc0FzeTR0UWpWNXZXWHN0NlRm?=
 =?utf-8?B?L3I4Sk1wU1B5TFdFUVN0M1l3TGk1MHJkZjRIbmg2WkU4K0Vqc3I1dm9pNVF5?=
 =?utf-8?B?UEd0WThVRkE2VEpseGtVbDlSU2pzZkYvQ0hXeE91bTV2d29CYXRIRWhIRjRp?=
 =?utf-8?B?ZDZCamtrU0xuWEg0bDRub2RBZFByT3ZhNkVOUVhtSU1kSUNtamRDS2JkLzFF?=
 =?utf-8?B?ZHMvMEVKRHVEQ3NDdlVXWW1NYkh3bng3aGNZcUZsQzVCVDQ0cmY2QlMzcUJZ?=
 =?utf-8?B?RW1XUmI5YWJabFpLeEk0STY0TTQ0c0xOdFphVnczdmlEWFFia1pCMnl1RkEw?=
 =?utf-8?B?emlhekt0Y3JvaDVlSHJkUklKYTdMaFdhcFFwZ1ppWUV1VUNLR1d6WjdVM0VP?=
 =?utf-8?B?THRTYUd5Q1hqUHNSZy9jNjB6djE3blFhMU1yZDEwNVJxakowbWhjS1B0ekR5?=
 =?utf-8?B?anVVZDcxdEkzSEsxN0o3RHhZL2xRS3VBekZ4L25lYjZ3SzRLa3NKSW1oQVdU?=
 =?utf-8?B?L3R6T1k3UW00a3BsS1d5SkVGcmlsSW0zN3lEWC9ndzgwbFphbGY2U1ZOcjRk?=
 =?utf-8?B?QkF0V29DbG1keVV6dGEyQVZvaldnUUppZUIydWdmWThSMkExNmdQMDZKUjBw?=
 =?utf-8?B?N2F1VEtQWXNhVDFQOGloMmRkeEJ2WHd4WUp6aUxwN0dkUjVobCtINXBKeDJ3?=
 =?utf-8?B?dzB6YWFNYmRGSWM2Y1g2YU50Ykl0NmFNeGFORXZiKzRmdzZvNFFVcGlwVFNw?=
 =?utf-8?B?U1VYK0xKY3lUSlRvcUdhdzE5SWNPb1ozL3VLWE4wVVZjK2NzaE9CL1d3R2NK?=
 =?utf-8?B?OGRuSG9XelZnM0hPT0crYlFwYzhWaTcybWZqVDVBYUZYYUptdDBJNUpjUWNr?=
 =?utf-8?B?QWtnWGtEaGRBV3VMTVY4ZXpCTGY2c3RSZXJxaERydEJYNEc4SytzQk1MZWFV?=
 =?utf-8?B?YWt4ZXVTSExWOE5LUWlLYnhPa2wrS0tFems4d2dQaC8wRnlhUzU0dEVuTGtB?=
 =?utf-8?B?RlpKdVAyUW1OaUh2b0E5dDdCekwzbG5RWmlacW5kR3dnQUpnZmdTdkdtNHhj?=
 =?utf-8?B?UFdXZXNNQlMrcDNWNnNyOGpQbHdTVGpsN0Joa0VyNmZOR3I5M2RMMU1HMGYx?=
 =?utf-8?B?V0puRzdGd3BhcFhhUm9ocit5N1dSS3hXQzNsQWpMWEdzckdyQkR4MC96NUF6?=
 =?utf-8?B?eWROMEhiMnZGbktvU212RFlTSWg3VVNTa0UyOUFEYjVvRW5Xc2tGeDhSTEJl?=
 =?utf-8?B?WVJPMXNpNVB5Zlh3M2xQZnRyRXFad2g1aERzOFR0eVJ0RFMyanMwUlBTcU1T?=
 =?utf-8?B?SW9XVVRFTWFkdE9Sdll3aGtxNlF0ZzJDYWpwMG92L3NZZ2xFNGdZVDVrZmVh?=
 =?utf-8?B?U3ozOTNKS2xjeXZsb1ZRV0NoZ3YrZ256QzRzTG5YdFFrVy9SUFdHUDd0SkZZ?=
 =?utf-8?B?c0FiMUhuUjlMQ0ROUTFhY05yaWNOaDMvWnJOd3gvcU5DamRiNXkrRHhJTTVY?=
 =?utf-8?B?TUlqR0JEMzdGRHdJY01jU24xeG1LeXdLSkZKN1BPQ243RGlJWHlOdWFvQWk0?=
 =?utf-8?B?TU95VUErb2lKU1cwUnIxUUw3TXBaTjRyc1E1Y3VaM1dYcEYraEpFRTlQMDd0?=
 =?utf-8?B?TXI3QVRwTFdNUmNUUlVFSVdpZFZ4bTg5UTJLQVE4WitJU2pqYzh1TkEzS1lm?=
 =?utf-8?B?RURiNCsrdjhwdTFKbVJ2TmxjL0gzd1VieTVKRWNjQ1ltWXhBOHdMTEZmYmxP?=
 =?utf-8?B?YUN1L0N4YlIrUjBEa0NKSXlONEdXUmtJODVaQXNndTdGU0w4VjBtWjV0aHpS?=
 =?utf-8?B?Z0ViczJySnpMNWYrU1ZSM1I0QXZBZGpObm52QnZub2NyZlRnVWczOXduUG9Q?=
 =?utf-8?B?SmJGazRtK1dRVzJqaEFWM1dhYVUzUElEcTUzcWhDQUF2cjRhL0JtMU0veXhU?=
 =?utf-8?Q?hecna7boxfA1HMFMmnsUgCV95?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dc495899-cf86-433b-6372-08dd5fd27b47
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2025 12:52:57.2495
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: weLa4g31BnU0PEbI8xCsKA4dOGir4HJnQJkPa2eAgvmf7FfSLA3YAn3mfUcOImryQOr04dqj78yXRDXTX+XKqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8820
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 12:53:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212517

eHNlcnZlci1vcmcgd2lsbCBuZWVkIHNvbWUgd29yayBvbiBxZW11Og0KaHR0cHM6Ly9saXN0cy5v
cGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8yMTIwNDQNCg0KUGV0
ZXINCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiB5b2N0by1zZWN1cml0
eUBsaXN0cy55b2N0b3Byb2plY3Qub3JnIDx5b2N0by0NCj4gc2VjdXJpdHlAbGlzdHMueW9jdG9w
cm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIFJvc3MgQnVydG9uIHZpYQ0KPiBsaXN0cy55b2N0b3By
b2plY3Qub3JnDQo+IFNlbnQ6IE1vbmRheSwgTWFyY2ggMTAsIDIwMjUgMTM6NDENCj4gVG86IHN0
ZXZlQHNha29tYW4uY29tDQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnOyB5b2N0by0NCj4gc2VjdXJpdHlAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiBTdWJq
ZWN0OiBSZTogW3lvY3RvLXNlY3VyaXR5XSBPRS1jb3JlIENWRSBtZXRyaWNzIGZvciBtYXN0ZXIg
b24gU3VuIDA5IE1hciAyMDI1DQo+IDAxOjAwOjAxIEFNIEhTVA0KPiANCj4gT24gOSBNYXIgMjAy
NSwgYXQgMTE6MjEsIFN0ZXZlIFNha29tYW4gdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj4g
PHN0ZXZlPXNha29tYW4uY29tQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IHdyb3RlOg0KPiA+IENW
RS0yMDI1LTI2NTk0IChDVlNTMzogNy44IEhJR0gpOiB4c2VydmVyLXhvcmc6eHdheWxhbmQNCj4g
aHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDI1
LTI2NTk0ICoNCj4gPiBDVkUtMjAyNS0yNjU5NSAoQ1ZTUzM6IDcuOCBISUdIKTogeHNlcnZlci14
b3JnOnh3YXlsYW5kDQo+IGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWls
P3Z1bG5JZD1DVkUtMjAyNS0yNjU5NSAqDQo+ID4gQ1ZFLTIwMjUtMjY1OTYgKENWU1MzOiA3Ljgg
SElHSCk6IHhzZXJ2ZXIteG9yZzp4d2F5bGFuZA0KPiBodHRwczovL3dlYi5udmQubmlzdC5nb3Yv
dmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjUtMjY1OTYgKg0KPiA+IENWRS0yMDI1LTI2
NTk3IChDVlNTMzogNy44IEhJR0gpOiB4c2VydmVyLXhvcmc6eHdheWxhbmQNCj4gaHR0cHM6Ly93
ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDI1LTI2NTk3ICoN
Cj4gPiBDVkUtMjAyNS0yNjU5OCAoQ1ZTUzM6IDcuOCBISUdIKTogeHNlcnZlci14b3JnOnh3YXls
YW5kDQo+IGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1D
VkUtMjAyNS0yNjU5OCAqDQo+ID4gQ1ZFLTIwMjUtMjY1OTkgKENWU1MzOiA3LjggSElHSCk6IHhz
ZXJ2ZXIteG9yZzp4d2F5bGFuZA0KPiBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxu
L2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjUtMjY1OTkgKg0KPiA+IENWRS0yMDI1LTI2NjAwIChDVlNT
MzogNy44IEhJR0gpOiB4c2VydmVyLXhvcmc6eHdheWxhbmQNCj4gaHR0cHM6Ly93ZWIubnZkLm5p
c3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDI1LTI2NjAwICoNCj4gPiBDVkUt
MjAyNS0yNjYwMSAoQ1ZTUzM6IDcuOCBISUdIKTogeHNlcnZlci14b3JnOnh3YXlsYW5kDQo+IGh0
dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyNS0y
NjYwMSAqDQo+IA0KPiBXZeKAmXJlIG1pc3NpbmcgYW4geHNlcnZlciB1cGdyYWRlLCBidXQgZm9y
IHh3YXlsYW5kIHRoZXNlIGFyZSBmYWxzZSBwb3NpdGl2ZXMgZnJvbQ0KPiB2YWd1ZSBDUEVzLCBJ
4oCZdmUgc2VudCBDUEUgZml4ZXMgdG8gTklTVC4NCj4gDQo+IFJvc3MNCg==

