Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2381C369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 13:59:39 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.57])
 by mx.groups.io with SMTP id smtpd.web10.49091.1745848776322887143
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 06:59:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=xfFZTfi9;
 spf=pass (domain: siemens.com, ip: 40.107.104.57, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ch7edbENWNTGvZz/+0kZP6ZXzK3Vxdti753/p9E/wUgbYM8dKZwut7nYJPLh4//YQZ5aeR7k2zuFVOjXkDr0NQgGyK7uGEvQ0irLbtahBn+ECxoTAZhzAGXcAvsZqdbOHMJTOEhdj3l7oZB2my2QABNa7dK4XXH6ISVUG9mwT2lxKOfguLWkHsXGLD6zzSNYO4UHsFnWYaIPadNIzgRMC5BTyrDMvYyEtGFysvk8y2pJt7H6c2thQsPBZzi7pYqLi7BT7kAmszXUf2a4yXb18onFU31qLIOeUFLOzBNP1pDfPly/8o9ZleCnTCwaXkLbmvaAz+Sc2PXrMudsvO3TYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3sM6KB8P0JIpTIHD2CCEFUcy+dp6PgY+s+yrOVkXDU4=;
 b=PZNCFU7BPL+49gHd1oHoozoF/cYT2e4L1jxKXhEOKGA3q0t0mjGwyBUFJ/0OcxKZyQAChKnuVOqGJYoMMDP1+HaSkv/9eEUE8E96ITHX4xHA7XvjhT6dl4DIn5SOs79OldUKOtJ+hWTaEMjf1SMmcluWnjI2NLz/qCy7KIXMH+C10JSu5tntjEwQ8i+jRuk16ba8bYZutSt6xsiFqWKMwRcQf3vb93nI1Ig4b73zRepcV2BRQk9kYfHF+AiLoChKQ05dGhs8MGm5YwKRf+9RtX44qYaAYPHBUa9x9ZmEkT2KLDClHnKR8wsLpJQ7dpG9laLzxlNa969kw++ei1kZGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3sM6KB8P0JIpTIHD2CCEFUcy+dp6PgY+s+yrOVkXDU4=;
 b=xfFZTfi9YfTR01K8VNKTYcojf2EobW9GBRQfZqJyBaIHRZ6mQzkYenpPiiWpOWVxNYPpHcoJ0LcsgLBH8ECbyFCOzeG+0gJNloLogYoOWH0P3T1OKNuFtxNd2zln/Rc5LCpsv2QbVNtjSf/goJK21q9Uv8Ay28se9R0c7z5HQJfL30wy3g+VjiJMBlqJYO1gyrxSRKk7Ok7kgD3Yv0J/kbVmpmCzfoiFK9c2OR5dOxJU6y8ykZCCEdZe1ldOBUqdKtL7wHyTl6szv57XgPKJ1KRBRvPTjQ/8XUs/wHqeJXaibfWA5etKz6yI118VGne5nS7Uzxsfz29tHqhRAu23Pw==
Received: from PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:266::11)
 by PR3PR10MB4111.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:97::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 13:59:33 +0000
Received: from PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4144:34cc:64ca:dd9d]) by PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4144:34cc:64ca:dd9d%6]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 13:59:33 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Joshua Watt <jpewhacker@gmail.com>, "daniel.turull@ericsson.com"
	<daniel.turull@ericsson.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "rybczynska@gmail.com"
	<rybczynska@gmail.com>, "steve@sakoman.com" <steve@sakoman.com>,
	"ross.burton@arm.com" <ross.burton@arm.com>, "skandigraun@gmail.com"
	<skandigraun@gmail.com>
Subject: RE: [PATCH v2 6/6] spdx: add option to include only compiled kernel
 files
Thread-Topic: [PATCH v2 6/6] spdx: add option to include only compiled kernel
 files
Thread-Index: AQHbuENnKCF5iZQsFkWiL4Miu5geA7O5GnGAgAAAObA=
Date: Mon, 28 Apr 2025 13:59:33 +0000
Message-ID: 
 <PA4PR10MB5707A826EFC31F84A660ECE0FD812@PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM>
References: <20250428134205.900354-1-daniel.turull@ericsson.com>
 <20250428134205.900354-7-daniel.turull@ericsson.com>
 <CAJdd5GZB=QyUhtbx4hc+Mg=qtKo+YKAYXf1pTx8NUwUg5Tc4WQ@mail.gmail.com>
In-Reply-To: 
 <CAJdd5GZB=QyUhtbx4hc+Mg=qtKo+YKAYXf1pTx8NUwUg5Tc4WQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=63ccb9a3-2564-439f-928b-f72567902710;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-04-28T13:58:19Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR10MB5707:EE_|PR3PR10MB4111:EE_
x-ms-office365-filtering-correlation-id: 35c28e10-529b-4805-3f45-08dd865ce761
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?dVJ0Q0hVN042MytGRlF4U1h3OE9EemJWTHd1Mlo4elk4VDhrWEtpVkhNRDRs?=
 =?utf-8?B?ZWRIdVI1dWJhSGdJeWd1M0lZd0FTUW40OW5hU0Q3OFJXdHdES3hwcjQzRGxF?=
 =?utf-8?B?R0JXWDRINUlQN2FHWjZOTDVKd2lzUmRvNDYvckRBeDRoUU1zaDZYYzl5ZlY1?=
 =?utf-8?B?eGJKSlJJWnhpQTlUcU80cS9heFNlZDB3bmZDTkVSMG5LbG9sdmVmSFZDRTFp?=
 =?utf-8?B?cFYreHlEQ0o0RDZFakYrUnBNOUNpam9xZ1ppKytXS2JxdkEzYWJ4MnhNemRj?=
 =?utf-8?B?SStKZWMyL3hwVnVpdWhUTm42N2FCaU8zZ3lBdkFHQUVRWlJnbGh6NEh0NXpW?=
 =?utf-8?B?WmlITEt1QTdGMEFQTGxmVXZDcnRjK3BPQ09id0hQVm5XdXlvNi9FU2o1eisw?=
 =?utf-8?B?bStiQ3lkdjBaMHRvVE1OYmVFb2EvVjFHOHBOUWFIYm5WSzdVbmZxZUhKQlJO?=
 =?utf-8?B?RmkvS1pJYXFMaThuQVl4djRJYVZvbHgwbnlVTFJCNXVxWkE4MC9MUE1mWFla?=
 =?utf-8?B?cHNKaHZ3V2c2cFBtUVhlSEFBbUtyVjFIUmpPZEtrQTB5QUxPamtxZUJvbktp?=
 =?utf-8?B?ZXNzRDN4Qm04WjJwRXVMS2Zvc0RYQVRRemF4SDhhSjZLOXdtc2kvZ24zQkMx?=
 =?utf-8?B?NmhlaG9xMFREUDg3LzVNTjFYNnp4WGwwWndnVDU2OHJCc2RLNW80VloyUlIx?=
 =?utf-8?B?d1d5TEpTUUhQTjNCaU50cjhLbkNKR0d3VXdZODFiK3ZJd0g3ZXNHSVBkRmtY?=
 =?utf-8?B?RExIVSsxcVFwU2JNaGRPTHZUSXBaR1N5T28wZGc0MUJvRXBRUWFGWDhtSHFQ?=
 =?utf-8?B?SmRPR3JHYVJUL1dOd1B3R2E5VWZJTlBtMGlIOERLQkczcFNTNjlRdFVLdHp2?=
 =?utf-8?B?bUE0c1NuZGF1YU1EUHFsTEd4emhYOGFKL1hxTVBkdzluWGdyQlZLVE5BVkJP?=
 =?utf-8?B?UTFaWm11R0xFZXhITldCbXdmUlBFOFp1bnRKcVNWSWRnSmVrTmpHbjBxMGhq?=
 =?utf-8?B?Um9TRDZOR093Sld4WkwyMFhud0VLbVBqVk1OTTBzZkpVb2JsYUJQNUxRMHBW?=
 =?utf-8?B?dVRMTXh6Smw4ZFArQWlDbGFRMHBjSXJOZEJZSEtrTTRQc3QrYldwc2FRaXJt?=
 =?utf-8?B?ZTJqcXM3N0dhdGhjVExiaExBenJiRWs3ZGkwZTVWYlpBV1QvNkxjZUEzYkJs?=
 =?utf-8?B?R3JWQTlaSnRjMUIyVFdKM3ZzRmJ1cHdwVkpOb1ZJaWc1Z3VYVmF0eWZlb1Bu?=
 =?utf-8?B?eWcyUjdCbk95aFpIeE10czhrQVY1KzhNdVh2akNYK2ZNbDhoOWErSG40N0pz?=
 =?utf-8?B?L0Y4d256bklLWERzZWt6VEx1Mm1jRW1tOTM3OTRPcWtvbnl0M2tPUDU1Tklh?=
 =?utf-8?B?T0hrdkxrTFcxWStKZXdpK2hFYTZlNTN5R1cydXRNMGxZbGJKQTBleGlrOWJw?=
 =?utf-8?B?dFBZLzkzZDBIYlJhSG1PMUxNeDduVFhhTWIyZ0N5K3Uwa01SZ01XWENGRk1D?=
 =?utf-8?B?ajRFbkU1S0N1YURrdGljVjdQSHlIenNiS0d3c05YTHJSZVd1UWJCOGtHVVQx?=
 =?utf-8?B?cUxXWEcweHljRkd6T0xnWU5COFlXNnZDLzdkTDJBZzMyc3JVOXh2Q3JjcnFB?=
 =?utf-8?B?ZlhvbGpKeGZkS0E3MHZaU2xtRXFlcjE1QUF6TDVQV1VmQTVnbXdoK3Z6NlFK?=
 =?utf-8?B?ZzNnWTJjbHFUK01wVVVrbkZhOVJHVGZpT0tSRGx5N0hWdzlQNHNtZU5DNnpV?=
 =?utf-8?B?WC9VZ3R5QnFkNHhYRUlUYkZEdjlMQk5HSW1TM2ZmMjYrdWVLWjd3eVBETmpQ?=
 =?utf-8?B?aE5YQ0c0aWFMcE1mdmdXOGphOFlDbjhacFVsRFMwUWdkTEk5cU16enVwYnNz?=
 =?utf-8?B?WnFtNktnK3RYNG1zWktqdldSbnROWXZGRVFsemJveTdCK1pKMjdjOGpDa0pr?=
 =?utf-8?B?NzN3aDdwVHBVa0ZzeEFpZWR6OElXcTZYc256TTl3TVRBVTkwMUNSUTRwVkxQ?=
 =?utf-8?Q?DZlLp0/FsJrXo+m8FX+2rKKnUBbOhg=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?N25TR21WWmZMUURpendTVDdGUHpMQysyZHVuVUYvZGFDdXcwT0Z3RDhhNkRw?=
 =?utf-8?B?NGFEaU1aLzVmeW1CRUlObWpKN0ZqMWN4YmVjamNidkx5SVozT0Z1ekg5QXQ2?=
 =?utf-8?B?YUxqaGEyazVXTm1FNGxwRlJBcEpEd3pnYlVFTW1JaThzT0lRTGZ6V2pZSHQ4?=
 =?utf-8?B?bTAwSzZsdVlSTnhXT29YdDJtMEcveWh4TmRJYWoyNVFsMXRVcmpPOEhWR3JJ?=
 =?utf-8?B?WHhSMFVJMkViOHpDVHpiUnN4cFBXWjNKZm1WYVMwb01PditYTUkzb2tYdEJX?=
 =?utf-8?B?WmttclhOQ09pWEtmWEJvMUVXR2M5MFhkd0pzM0RBMHNPd0ZxakRCcFFnYkta?=
 =?utf-8?B?MWVzTGJ5cUFGYnFBcTh1bE1BWnQ1MlVGOEE1N0F1WnRXV3p0U203dXhWYkNh?=
 =?utf-8?B?a3VsS3poVEU1VHpZeHRWWDkxM2ZzZkpuNEpUOUVlYURyb2ovWEwwMkN6SG5W?=
 =?utf-8?B?NzNvUjZnaVB5ZTVKN3U5R1FYNFowREgrelA4c0pYOGlaTDdPdCsxVnlpblhn?=
 =?utf-8?B?Wm5NZ3BNS1cwdTBsVVU0QXJrbVAxbkpNT3NVc1NudGF1T2NXUmVnUkIxVEp0?=
 =?utf-8?B?ZGpsSlJDbGFaTnNTb2ZaVDJzTHkyaUE3UlBDanlud1lFTjhQcXB3NTZnVXcx?=
 =?utf-8?B?MzMyTE9jSXkwWWt0d05pZzYyZ2lWWWIvRkw4SWpCTXFQUlJGaGJITXMvOE5h?=
 =?utf-8?B?Nk8yc2JoNURPSHhGU0dYbVM1Q1M3TGwzNVF5d0VSTnRncCtTanBUWmExZmN1?=
 =?utf-8?B?S0laN0Q2bStlVmJDVDlWSEw5YU5TVkw2SVpnN29xb295K3h6OHVsR0lrdmtw?=
 =?utf-8?B?NEhkYmFJSUNVVGJESU9mc1V1c3UvVnBYUFJqczFtNlNpQXdFaHpkd0s5cHNm?=
 =?utf-8?B?TFBUaDM0amluZEtjR1diRXkrNWJoY0p4Umk2NjNaRUxJMHBYSUJqYXVzRXFN?=
 =?utf-8?B?bEhISGVDQW1kUENIbkJ4amZPMmNUSEM2QnRBMzAyWTYzdU81N3BJY3ZZL3VC?=
 =?utf-8?B?UDZ4MEtWYUZNSnBnd0FpVHI3cFJkcHNwMGxNVkE1Mjd4WkxwSVhpeERZVysx?=
 =?utf-8?B?eEVoZGlod0ZXMjFHZkJTN3RySis4N1hJdkllTjZYQUZlWjlhcFZKQlIvaTEr?=
 =?utf-8?B?bWk3NGJUc3FzdlZYMENLdjZLMm1lZ1lNRUVhZjc2L2pJTUVMV1JSK0pSaWVv?=
 =?utf-8?B?ZENJaGN4TVNhYzl0NU9BRHkxSGpubjdwRTNxM3QvNWttV05SS09ibFhWUFox?=
 =?utf-8?B?VUxYa29wWmZSNHd2R2x5OWdoRjgwaXlIRlZ3YnpVMGtpSjBVZDIzS3BBSDdt?=
 =?utf-8?B?aUtPOEZmekpUK3JHbnJzYjZZSU1GamdtUmpjN3ZGY2lOVWNwQzBndDRYZ3BZ?=
 =?utf-8?B?Y3JvTWhFK2IvcEt2MXZBSHJPVk1PV3ZZeFZ5alIzU1UrZzlwV2VQazhwcFpI?=
 =?utf-8?B?ZXNGSUt1bzNmcmFKVFpRbHFtcDZKRzVyWlFxdUdXQTBDYzFqMWliTjhicDN5?=
 =?utf-8?B?cGFxNk9XdXVRbVNva09TTlpJTVpNdjVxc1AybkpzR3VTUVhVSFIzcmVDTXVr?=
 =?utf-8?B?cXZUMXdtRDhhd0Mxa2NmWTNrRTdSZHpycHpuYTNGcHgyZkpKVEFobXdWdzAw?=
 =?utf-8?B?NVNRbjBYSzJ2NHd0a1dXTWlLNGp1dk9nclF6c29XbklaZlZBSjM5dUZWeXAx?=
 =?utf-8?B?cmprM0psOFZ5cTRSaWllMURlMU1JMkhFOGUzSkxtVHRKOXZFV2FoQXV6TVg4?=
 =?utf-8?B?RTkzbkZGTWE1dDNrVW4wRVBmckZsVE5vTVY4L1FvbnBWa3dkWkdwdCtqWGNQ?=
 =?utf-8?B?NHdRYWlVSVp1WkcyY29xYjZCcllHMGtaNXFBQmNGTFl2K2VMS2JwcmFHaC9y?=
 =?utf-8?B?SWd4YytkVVJCd0FiMm9nWm1YS3U5bmlrRW5Ialhna3NhQnhDRXdmei9kRC9t?=
 =?utf-8?B?TW0waDNOQXN5c1N6bmtJcU9vNWhGZ3NpV0EwUUREakYrSVgvRmt3R3ZCZStq?=
 =?utf-8?B?Z09pWkRJekRLZ0wxMjBxU1hyNkVCLzdybkpwdVlrUlVkdkRoejlWZFNvb2ZC?=
 =?utf-8?B?b3E2U0ZLbVExNE5YNDU5eXFZQUhMaDd0VkxFU2RpY0MyZHJMaGJOK0poYlp5?=
 =?utf-8?Q?3kiCTND9Y/xPbikQK38iAsqOh?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 35c28e10-529b-4805-3f45-08dd865ce761
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2025 13:59:33.2971
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kYAiDBRWlEtPCRooh5jp767ThOhS0/MB0ddf6XxqVGt9hrnIZu+OarRNfGnGa6rX4/WlXPu9we9E6BjL/mBL2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB4111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 13:59:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215608

SSB0aGluayB0aGF0IG9ubHkga2VybmVsIHByb3ZpZGVzIGZpbGUtYmFzZWQgQ1ZFIGluZm9ybWF0
aW9uIHJpZ2h0IG5vdy4NCg0KUGV0ZXINCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBKb3NodWEgV2F0dCA8anBld2hhY2tlckBnbWFpbC5jb20+DQo+IFNlbnQ6IE1vbmRh
eSwgQXByaWwgMjgsIDIwMjUgMTU6NTgNCj4gVG86IGRhbmllbC50dXJ1bGxAZXJpY3Nzb24uY29t
DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnOyByeWJjenlu
c2thQGdtYWlsLmNvbTsNCj4gc3RldmVAc2Frb21hbi5jb207IE1hcmtvLCBQZXRlciAoRlQgRCBF
VSBTSyBCRlMxKQ0KPiA8UGV0ZXIuTWFya29Ac2llbWVucy5jb20+OyByb3NzLmJ1cnRvbkBhcm0u
Y29tOyBza2FuZGlncmF1bkBnbWFpbC5jb20NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiA2LzZd
IHNwZHg6IGFkZCBvcHRpb24gdG8gaW5jbHVkZSBvbmx5IGNvbXBpbGVkIGtlcm5lbCBmaWxlcw0K
PiANCj4gSSBzZWUgdGhlIGFwcGVhbCBoZXJlOyBob3dldmVyIEkndmUgYmVlbiB0cnlpbmcgdG8g
YXZvaWQgdG9vIG11Y2gNCj4ga2VybmVsIHNwZWNpZmljIHN0dWZmIGluIFNQRFguIElzIHRoZXJl
IGEgd2F5IHRvIG1ha2UgdGhpcyBtb3JlDQo+IGdlbmVyaWMgc28gaXQgY291bGQgYmUgdXNlZCBi
eSBhbnkgcmVjaXBlPw0KPiANCj4gT24gTW9uLCBBcHIgMjgsIDIwMjUgYXQgNzo0MuKAr0FNIDxk
YW5pZWwudHVydWxsQGVyaWNzc29uLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBGcm9tOiBEYW5pZWwg
VHVydWxsIDxkYW5pZWwudHVydWxsQGVyaWNzc29uLmNvbT4NCj4gPg0KPiA+IFdoZW4gQ1ZFX0NI
RUNLX0tFUk5FTF9DT05GSUcgaXMgZW5hYmxlZCwgb25seSBpbmNsdWRlIHRoZQ0KPiA+IHNvdXJj
ZSBjb2RlICguYywgLmgpIGZpbGVzIHRoYXQgYXJlIHVzZWQgZHVyaW5nIGNvbXBpbGF0aW9uLg0K
PiA+DQo+ID4gVGhpcyBlbmFibGVzIGFuIGV4dGVybmFsIHRvb2wgdG8gdXNlIHRoZSBTUERYIGlu
Zm9ybWF0aW9uIHRvIGRpc3JlZ2FyZA0KPiA+IHZ1bG5lcmFiaWxpdGllcyB0aGF0IGFyZSBub3Qg
Y29tcGlsZWQuDQo+ID4NCj4gPiBDQzogSm9zaHVhIFdhdHQgPEpQRVdoYWNrZXJAZ21haWwuY29t
Pg0KPiA+IENDOiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+ID4gU2ln
bmVkLW9mZi1ieTogRGFuaWVsIFR1cnVsbCA8ZGFuaWVsLnR1cnVsbEBlcmljc3Nvbi5jb20+DQo+
ID4gLS0tDQo+ID4gIG1ldGEvY2xhc3Nlcy9jcmVhdGUtc3BkeC0yLjIuYmJjbGFzcyB8ICA4ICsr
KysrKysNCj4gPiAgbWV0YS9saWIvb2Uvc3BkeDMwX3Rhc2tzLnB5ICAgICAgICAgIHwgIDggKysr
KysrKw0KPiA+ICBtZXRhL2xpYi9vZS9zcGR4X2NvbW1vbi5weSAgICAgICAgICAgfCAzNCArKysr
KysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgNTAgaW5zZXJ0
aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy9jcmVhdGUtc3BkeC0y
LjIuYmJjbGFzcyBiL21ldGEvY2xhc3Nlcy9jcmVhdGUtc3BkeC0NCj4gMi4yLmJiY2xhc3MNCj4g
PiBpbmRleCA3ZThmOGI5ZmY1Li42YmYwYzcwYmQ0IDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvY2xh
c3Nlcy9jcmVhdGUtc3BkeC0yLjIuYmJjbGFzcw0KPiA+ICsrKyBiL21ldGEvY2xhc3Nlcy9jcmVh
dGUtc3BkeC0yLjIuYmJjbGFzcw0KPiA+IEBAIC0xMzcsNiArMTM3LDEwIEBAIGRlZiBhZGRfcGFj
a2FnZV9maWxlcyhkLCBkb2MsIHNwZHhfcGtnLCB0b3BkaXIsDQo+IGdldF9zcGR4aWQsIGdldF90
eXBlcywgKiwgYXJjaGl2DQo+ID4gICAgICBzcGR4X2ZpbGVzID0gW10NCj4gPg0KPiA+ICAgICAg
ZmlsZV9jb3VudGVyID0gMQ0KPiA+ICsNCj4gPiArICAgIGNoZWNrX2tlcm5lbF9jb21waWxlZCA9
IGJiLmRhdGEuaW5oZXJpdHNfY2xhc3MoImtlcm5lbCIsIGQpIGFuZA0KPiBkLmdldFZhcigiQ1ZF
X0NIRUNLX0tFUk5FTF9DT05GSUciKSA9PSAiMSINCj4gPiArICAgIGlmIGNoZWNrX2tlcm5lbF9j
b21waWxlZDoNCj4gPiArICAgICAgICBrZXJuZWxfc291cmNlcyA9IG9lLnNwZHhfY29tbW9uLmdl
dF9rZXJuZWxfY29tcGlsZWRfZmlsZXMoZCkNCj4gPiAgICAgIGZvciBzdWJkaXIsIGRpcnMsIGZp
bGVzIGluIG9zLndhbGsodG9wZGlyKToNCj4gPiAgICAgICAgICBkaXJzWzpdID0gW2QgZm9yIGQg
aW4gZGlycyBpZiBkIG5vdCBpbiBpZ25vcmVfZGlyc10NCj4gPiAgICAgICAgICBpZiBzdWJkaXIg
PT0gc3RyKHRvcGRpcik6DQo+ID4gQEAgLTE0Nyw2ICsxNTEsMTAgQEAgZGVmIGFkZF9wYWNrYWdl
X2ZpbGVzKGQsIGRvYywgc3BkeF9wa2csIHRvcGRpciwNCj4gZ2V0X3NwZHhpZCwgZ2V0X3R5cGVz
LCAqLCBhcmNoaXYNCj4gPiAgICAgICAgICAgICAgZmlsZW5hbWUgPSBzdHIoZmlsZXBhdGgucmVs
YXRpdmVfdG8odG9wZGlyKSkNCj4gPg0KPiA+ICAgICAgICAgICAgICBpZiBub3QgZmlsZXBhdGgu
aXNfc3ltbGluaygpIGFuZCBmaWxlcGF0aC5pc19maWxlKCk6DQo+ID4gKyAgICAgICAgICAgICAg
ICAjIFdoZW4gY3JlYXRpbmcgc3BkeCBmb3IgdGhlIGtlcm5lbCwgd2Ugb25seSBpbmNsdWRlIGNv
bXBpbGVkIGZpbGVzLg0KPiA+ICsgICAgICAgICAgICAgICAgaWYgY2hlY2tfa2VybmVsX2NvbXBp
bGVkOg0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBpZiBub3Qgb2Uuc3BkeF9jb21tb24uaXNf
a2VybmVsX2NvbXBpbGVkKGZpbGUsIGtlcm5lbF9zb3VyY2VzLA0KPiBkKToNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICBicmVhaw0KPiA+ICAgICAgICAgICAgICAgICAgc3BkeF9maWxl
ID0gb2Uuc3BkeC5TUERYRmlsZSgpDQo+ID4gICAgICAgICAgICAgICAgICBzcGR4X2ZpbGUuU1BE
WElEID0gZ2V0X3NwZHhpZChmaWxlX2NvdW50ZXIpDQo+ID4gICAgICAgICAgICAgICAgICBmb3Ig
dCBpbiBnZXRfdHlwZXMoZmlsZXBhdGgpOg0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL2xpYi9vZS9z
cGR4MzBfdGFza3MucHkgYi9tZXRhL2xpYi9vZS9zcGR4MzBfdGFza3MucHkNCj4gPiBpbmRleCBi
YTk2NTgyMWY4Li4xNGYyNjc3M2M1IDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvbGliL29lL3NwZHgz
MF90YXNrcy5weQ0KPiA+ICsrKyBiL21ldGEvbGliL29lL3NwZHgzMF90YXNrcy5weQ0KPiA+IEBA
IC0xNTYsNiArMTU2LDEwIEBAIGRlZiBhZGRfcGFja2FnZV9maWxlcygNCj4gPiAgICAgICAgICBi
Yi5ub3RlKGYiU2tpcCB7dG9wZGlyfSIpDQo+ID4gICAgICAgICAgcmV0dXJuIHNwZHhfZmlsZXMN
Cj4gPg0KPiA+ICsgICAgY2hlY2tfa2VybmVsX2NvbXBpbGVkID0gYmIuZGF0YS5pbmhlcml0c19j
bGFzcygia2VybmVsIiwgZCkgYW5kDQo+IGQuZ2V0VmFyKCJDVkVfQ0hFQ0tfS0VSTkVMX0NPTkZJ
RyIpID09ICIxIg0KPiA+ICsgICAgaWYgY2hlY2tfa2VybmVsX2NvbXBpbGVkOg0KPiA+ICsgICAg
ICAgIGtlcm5lbF9zb3VyY2VzID0gb2Uuc3BkeF9jb21tb24uZ2V0X2tlcm5lbF9jb21waWxlZF9m
aWxlcyhkKQ0KPiA+ICsNCj4gPiAgICAgIGZvciBzdWJkaXIsIGRpcnMsIGZpbGVzIGluIG9zLndh
bGsodG9wZGlyLCBvbmVycm9yPXdhbGtfZXJyb3IpOg0KPiA+ICAgICAgICAgIGRpcnNbOl0gPSBb
ZCBmb3IgZCBpbiBkaXJzIGlmIGQgbm90IGluIGlnbm9yZV9kaXJzXQ0KPiA+ICAgICAgICAgIGlm
IHN1YmRpciA9PSBzdHIodG9wZGlyKToNCj4gPiBAQCAtMTY3LDYgKzE3MSwxMCBAQCBkZWYgYWRk
X3BhY2thZ2VfZmlsZXMoDQo+ID4gICAgICAgICAgICAgIGZpbGVwYXRoID0gUGF0aChzdWJkaXIp
IC8gZmlsZQ0KPiA+ICAgICAgICAgICAgICBpZiBmaWxlcGF0aC5pc19zeW1saW5rKCkgb3Igbm90
IGZpbGVwYXRoLmlzX2ZpbGUoKToNCj4gPiAgICAgICAgICAgICAgICAgIGNvbnRpbnVlDQo+ID4g
KyAgICAgICAgICAgICMgV2hlbiBjcmVhdGluZyBzcGR4IGZvciB0aGUga2VybmVsLCB3ZSBvbmx5
IGluY2x1ZGUgY29tcGlsZWQgZmlsZXMNCj4gPiArICAgICAgICAgICAgaWYgY2hlY2tfa2VybmVs
X2NvbXBpbGVkOg0KPiA+ICsgICAgICAgICAgICAgICAgIGlmIG5vdCBvZS5zcGR4X2NvbW1vbi5p
c19rZXJuZWxfY29tcGlsZWQoZmlsZSwga2VybmVsX3NvdXJjZXMsIGQpOg0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgYnJlYWsNCj4gPg0KPiA+ICAgICAgICAgICAgICBmaWxlbmFtZSA9IHN0
cihmaWxlcGF0aC5yZWxhdGl2ZV90byh0b3BkaXIpKQ0KPiA+ICAgICAgICAgICAgICBmaWxlX3B1
cnBvc2VzID0gZ2V0X3B1cnBvc2VzKGZpbGVwYXRoKQ0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL2xp
Yi9vZS9zcGR4X2NvbW1vbi5weSBiL21ldGEvbGliL29lL3NwZHhfY29tbW9uLnB5DQo+ID4gaW5k
ZXggNGNhZWZjNzY3My4uYzg3ZTM4NzVjNyAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhL2xpYi9vZS9z
cGR4X2NvbW1vbi5weQ0KPiA+ICsrKyBiL21ldGEvbGliL29lL3NwZHhfY29tbW9uLnB5DQo+ID4g
QEAgLTI0MiwzICsyNDIsMzcgQEAgZGVmIGZldGNoX2RhdGFfdG9fdXJpKGZkLCBuYW1lKToNCj4g
PiAgICAgICAgICB1cmkgPSB1cmkgKyAiQCIgKyBmZC5yZXZpc2lvbg0KPiA+DQo+ID4gICAgICBy
ZXR1cm4gdXJpDQo+ID4gKw0KPiA+ICtkZWYgaXNfa2VybmVsX2NvbXBpbGVkKGZpbGVuYW1lLCBr
ZXJuZWxfc291cmNlcywgZCk6DQo+ID4gKyAgICAiIiINCj4gPiArICAgIENoZWNrIGlmIHRoZSBm
aWxlLCBpcyBhIGtlcm5lbCBjb21waWxlZCBmaWxlDQo+ID4gKyAgICAiIiINCj4gPiArICAgIGlt
cG9ydCBvcw0KPiA+ICsNCj4gPiArICAgIF8sIGV4dGVuc2lvbiA9IG9zLnBhdGguc3BsaXRleHQo
ZmlsZW5hbWUpDQo+ID4gKyAgICAjIFNwZWNpYWwgY2FzZSwgdGhhdCB3ZSBuZWVkIHRvIGlnbm9y
ZSwgc2luY2UgdGhpcyBpcyBub3QgYSBzb3VyY2UgZmlsZQ0KPiA+ICsgICAgaWYgZmlsZW5hbWUu
cmZpbmQoIi5tb2QuYyIpID4gMDoNCj4gPiArICAgICAgICByZXR1cm4gVHJ1ZQ0KPiA+ICsgICAg
IyBXZSBmaWx0ZXIgLmMgZmlsZXMgYW5kIGhlYWRlciBmaWxlcw0KPiA+ICsgICAgaWYgZXh0ZW5z
aW9uIG5vdCBpbiBbIi5jIiwgIi5oIl06DQo+ID4gKyAgICAgICAgcmV0dXJuIFRydWUNCj4gPiAr
ICAgICMgQ2hlY2sgdGhhdCB0aGUgYyBmaWxlIGlzIGluIHRoZSBsaXN0DQo+ID4gKyAgICBpZiBm
aWxlbmFtZSBpbiBrZXJuZWxfc291cmNlczoNCj4gPiArICAgICAgICByZXR1cm4gVHJ1ZQ0KPiA+
ICsgICAgcmV0dXJuIEZhbHNlDQo+ID4gKw0KPiA+ICtkZWYgZ2V0X2tlcm5lbF9jb21waWxlZF9m
aWxlcyhkKToNCj4gPiArICAgICIiIg0KPiA+ICsgICAgR2V0IHJlc3VsdHMgZnJvbSB0aGUgc2F2
ZV9jb21waWxlZCBmaWxlcyBhbmQgaW5jbHVkZSBhbHNvIGhlYWRlciBmaWxlcw0KPiA+ICsgICAg
IiIiDQo+ID4gKyAgICBpbXBvcnQganNvbg0KPiA+ICsgICAgaW1wb3J0IG9zDQo+ID4gKyAgICBr
ZmlsZXMgPSBbXQ0KPiA+ICsgICAgd2l0aCBvcGVuKGQuZ2V0VmFyKCdLRVJORUxfU1JDX0ZJTEVT
JyksICdyJykgYXMgZjoNCj4gPiArICAgICAgICBmb3IgaXRlbSBpbiBqc29uLmxvYWQoZik6DQo+
ID4gKyAgICAgICAgICAgIGtmaWxlID0gb3MucGF0aC5iYXNlbmFtZShpdGVtWydmaWxlJ10pDQo+
ID4gKyAgICAgICAgICAgICMgUmV0dXJuIGFsc28gdGhlIGNvcnJlc3BvbmRpZyBoZWFkZXIgZmls
ZQ0KPiA+ICsgICAgICAgICAgICBoZmlsZSA9ICIuaCIuam9pbihrZmlsZS5yc3BsaXQoIi5jIiwg
MSkpDQo+IA0KPiBUaGlzIGZlZWxzIGEgbGl0dGxlIGJpdCB3cm9uZyB0byBtZS4gSSB0aGluayBh
IGJldHRlciBvcHRpb24gd291bGQgYmUNCj4gdG8gaW5jbHVkZSBhbGwgaGVhZGVycywgc2luY2Ug
d2UgZG9uJ3QgaGF2ZSBhIGdvb2Qgd2F5IG9mIGtub3dpbmcNCj4gd2hpY2ggYXJlIGFjdHVhbGx5
IHVzZWQuDQo+IA0KPiA+ICsgICAgICAgICAgICBrZmlsZXMuYXBwZW5kKGtmaWxlKQ0KPiA+ICsg
ICAgICAgICAgICBrZmlsZXMuYXBwZW5kKGhmaWxlKQ0KPiA+ICsgICAgcmV0dXJuIGtmaWxlcw0K

