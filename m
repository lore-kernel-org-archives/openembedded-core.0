Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE11CC369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 07:07:32 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.88])
 by mx.groups.io with SMTP id smtpd.web10.34388.1745305647207844531
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 00:07:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=UmfEHtAw;
 spf=pass (domain: ericsson.com, ip: 40.107.22.88, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lsUvT74Oj9+OG6yqbcNkPW7vc033YKfmrOAtyojjMvd0w4KwNSQVTzdbfh0A4s3ovengEN7XUnpzKpC2abY0N/79S0sUw+uRN5GfApkd1Jw0H9xathCtQDj5rKXTSUdxGjdVkKzsAv4BszEFUvEEO07MIZEUelrPHbzeZvSZOOspYP3Jdd/vm/8xbA14J8P6UVjGfFr6N6dysHH0KUwb3WSibNArhTszpYOamFsRxByJm8MDdOphGJ+bPMEozZtlV+u/ZGvRcDek8GIwd8JWQAhTqy+l7WQ09vBl2TrfmvIJyWiwy8PNKyUZtHZnaOGrahqePRGSetlvwVTRaEInFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=um6F1HbFaax1GzLUfN7ESntOqirqnp3grkXSJ4O8atg=;
 b=pxf9eRIm/PoYi3rml6W2oz9lJO1jGpla59AJwFza4pmBTEq8Pp0pd7Tk3oW+EOzVvz/o6jMqDvA0+zO5iWdr7NgKF2XzQWLWlZOBGfMWh68mMtn/wtyPxOHNOg+5F+7ruKXpRkrBmMj3L3qp5ahr6jJ5nNi2jTwTfn6/2gIrwhiU2IIKeTQ9Pe6xkdhRlIH71SkEcvFib2IJWiqla8RiZURHkzfbaO0WX/+jvWwJ4B14UcfhiAQM6tDT0sPr34ODgPvoCSO5AuLknjIMStfbcgFNeuczPnq6fRCUoqskwGLrn0Z1/e49VLetzQrkiSbueV3M10vX/Bsj+ij+Fjgiow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=um6F1HbFaax1GzLUfN7ESntOqirqnp3grkXSJ4O8atg=;
 b=UmfEHtAwMBVqnKcpA1b6HSGtdGI7SFsCfXa+esj7Nk11gCxakh4R20JQDMYkFGpfp4ekIQNGY5uFsN/hgd4fABcgzUI3lOLj5Px4ed2RUm0A0rydmaBVEoRZEqagHu8tocXorp6lf/SyldLY6NaxvU9d9Q7GGsHKD3D9pPT3iDtX21RSc2SENapMisOYw4+8ni07m/NWdO9SOxoFouNzW7WjbHC63KCvGaTS1SYSaulj/3EYJI06il756OEqbzKUbsOq1VYv3paRblTBWjApEVWjQykwBhZrWFandKEK2pQLfP4+wHUf+DiPR5RwtP7GF/rBCPXjsK5GQl8GdmoXaA==
Received: from PR3PR07MB6666.eurprd07.prod.outlook.com (2603:10a6:102:61::16)
 by AM8PR07MB7411.eurprd07.prod.outlook.com (2603:10a6:20b:248::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 07:07:23 +0000
Received: from PR3PR07MB6666.eurprd07.prod.outlook.com
 ([fe80::548a:adf1:280d:283b]) by PR3PR07MB6666.eurprd07.prod.outlook.com
 ([fe80::548a:adf1:280d:283b%3]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 07:07:23 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: Quentin Schulz <quentin.schulz@cherry.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "rybczynska@gmail.com" <rybczynska@gmail.com>, "steve@sakoman.com"
	<steve@sakoman.com>, "Peter.Marko@siemens.com" <Peter.Marko@siemens.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"ross.burton@arm.com" <ross.burton@arm.com>
Subject: RE: [OE-core] [PATCH 2/2] cve-check-kernel: verify kernel CVEs using
 programFile from kernel.org CNA
Thread-Topic: [OE-core] [PATCH 2/2] cve-check-kernel: verify kernel CVEs using
 programFile from kernel.org CNA
Thread-Index: AQHbrtvxhP8g6KlAaUCdOKcfO3S1H7OpTHUAgAX/JxA=
Date: Tue, 22 Apr 2025 07:07:22 +0000
Message-ID: 
 <PR3PR07MB66668568086F5C994D9048578ABB2@PR3PR07MB6666.eurprd07.prod.outlook.com>
References: <20250416142859.909037-1-daniel.turull@ericsson.com>
 <20250416142859.909037-3-daniel.turull@ericsson.com>
 <9c12c8c3-201b-4953-827e-af47722feadd@cherry.de>
In-Reply-To: <9c12c8c3-201b-4953-827e-af47722feadd@cherry.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3PR07MB6666:EE_|AM8PR07MB7411:EE_
x-ms-office365-filtering-correlation-id: 8b678f5b-41af-4778-79cd-08dd816c5472
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|7053199007|13003099007|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?NXIyV1lXTTRmNElsamx4aTRzY3pNWW5HY2VkVTVjR0VmQlJOVGtLZHZNOHFm?=
 =?utf-8?B?RXdxQXBIeWplQnAxOGdBTVZYS0tMcXA4VGVEWG8ySkxUTjZ0WStzdTJYN0w2?=
 =?utf-8?B?U1pBMll1a2RPTmM5WWxaTEt0Qm9GUXo1NW94Z0hTYWM3aUtCVVdGbE0rR2lT?=
 =?utf-8?B?cUMxMmJFbEZWWEdZSHNBZnVPMldOeDhibjBFWkxlNXpVLzNUWHpGSFczeWJM?=
 =?utf-8?B?QWswVG9aZlpQT1M1OGRnNDZ3Ykd2a2FtSGRZR3BNQzZjNEFmbDJSbEVOQ1c1?=
 =?utf-8?B?YjRzMVBVZk9NZlp5U1hCa2VlMGlMdkRrSVlNQU5ZeTRiNkxnWU52Rno2dDhJ?=
 =?utf-8?B?RjBXMTZTQzArdjlZcXEzVmhIWWZTLzZlVStNdEVxUEVpcEdTM2gyNWNkOWpV?=
 =?utf-8?B?TjNseG02Nng3bm96R1lWczhxSm1MQ1JNVmY4YURLWWRMbUZJWlV0d2lPSUo3?=
 =?utf-8?B?VU5Qa0pabEM4UVJ0VzdYb2gwakRPREszRHRGbk1JN0RUM2ZXMmN1ZkdINU40?=
 =?utf-8?B?bXd3TXV1NDNZckIwU0dBanVqZG5XbWlSeXVVbG1RTmVIWjZTek9TdnpKVnh0?=
 =?utf-8?B?N0crVDMzNnJ5U1FaYm1BS1RXT3RJeHNZT2JwbHFtOGxROW1wSjJBeXVQMGNh?=
 =?utf-8?B?ZXhJdERPY1ZScXRDUndRbGJMOHpzNG9tTUJ4ZHBuUU5FUTlZNGJJaFFWbUFz?=
 =?utf-8?B?b0kvem5SQWR3Y2g2VERQRDZib2EzSDNFaXNUQ3FrVmJyd0VleXRqOVJtOG90?=
 =?utf-8?B?dW5kekU4elZvak4xN25VMGJVdVZHTWJuZWkxc2ViWGJpZEcvUHYxK1RwZ1Ni?=
 =?utf-8?B?a0VqYVdXVEJidk5lY3R1UnBhL21JenNjVVVob1ZNNUFUazIvdllBeExGaWlL?=
 =?utf-8?B?M2lzUnMxZVFYRFpqYVNwbVdKREdNa0lEOEVSSjNxdWUrR1krTVBQMFQxc2xM?=
 =?utf-8?B?M2puNnI2cFJLWTUvUE5VWkQ3Wm04RnR1bGEwUFdRNWxUNGFrbWs2TVVZUnZ5?=
 =?utf-8?B?WWRLbnVhV3c1QkxER2NSVmVVNWtlcDdpaEh3dlBwYU1aWEN5aHhZbHBCdE5G?=
 =?utf-8?B?YW9NbEFjVjVmTHRKbm1FQ3dWc1VKSWpuMHh4L3FpNXNibVVjbE5kYW1Ibk5F?=
 =?utf-8?B?aVZycjRyUm5PZ0pkNVNIOVFlY2d0aWdKc2RnUytSMUlKcUZ0Q1VvNXU2VjJj?=
 =?utf-8?B?N3BGbG1CVHRtYTJkcG13eDRJNUo5MVZxSXU2YTFxWXFNTngrVDdwaUtSc0du?=
 =?utf-8?B?Q2JsUjNCanN2SkdjL3Y2U0dBSXB2SGV2WTlSUHdGTHh3RGZWTU14Sk9MWXFU?=
 =?utf-8?B?Y1AzR0RDSWt1QXp2Q0s3Tjd2MVJyY0srSUhBT2RJeG5Ic3dmYUV6ZVRrUnpt?=
 =?utf-8?B?MUNFblFySEsrcHozcGFvbzRadGtIZFJOUkFobGcwNVBBVDZMeEkyWmcxVU8r?=
 =?utf-8?B?UTFTNHZhWVZsKzZVSDhWdUpBWnVHVnVqOEowczd5RVY2VXp1N3hRT3A4aWRm?=
 =?utf-8?B?OXRhTGtEbndSYXQxUjZKeDRrVDR2cjRjOGo4MDRuSlljaG5WVEdkVit3YlYv?=
 =?utf-8?B?Uk94eDNDWk96Nllrek9iUFZ1N1dBUG9LN1A4aU5xRVhEa3o4UTRsZzMvY3Ba?=
 =?utf-8?B?OFV4dHRMUUk0R1FKK3hlVVdYMGZOSGg3OUJGZVpDUHN1SHBpWk9ORkFkOXk3?=
 =?utf-8?B?cDFuMHVKcml1UGZzQ0N2WVhVMDhuUmFNRWZjTStJbkZ0UVpHY01TM3RrVHZO?=
 =?utf-8?B?aHdTaCsxSktCdnRoenloeUI3SUxsS3diQVNwdWgyY3FCaHN3N3lGa3FQNkhj?=
 =?utf-8?B?N0h3bDlxU0I5eHdLcTZSWDVHQjY2UmlQUlQzZmR6SE5CU3Q4bDkvZmRaL1d5?=
 =?utf-8?B?d21xSmR4aU1XVE1jcFdoUHprbW5DUGxzRUZXOUw1T3BEZFQvUDRHbGhXa1Zz?=
 =?utf-8?B?L3VhOEpUL2UzaDdhUG1tdjIzZ2tQaC9nYmk5a1JaOExuV0dTM21GUWR2UVND?=
 =?utf-8?B?L0lvdXNZanJ3PT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR07MB6666.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?a05mOXZWcWkwOUdjWklhVExzdVRBSW5tWGtXbE9OOHJhS1ViTFY4QnprWkts?=
 =?utf-8?B?ME1hSlNaTVVGRzJlYmtkNUQxaWhjKzBGNXhNbkpEbmxhTHdoK1VqeTVIWTRC?=
 =?utf-8?B?ajN0QTlyT0p6My94MzlsRTE1LzdvRTZab3gxL1lQRHhpbXBpWEZmT1ZDd1RN?=
 =?utf-8?B?SzBZeXVPdUZDdzhPODQzZkhEQjYweUJxc3dPZnlZbzdrdTRydVR6RkNxeGRl?=
 =?utf-8?B?b1ZRQlB4b2s3dXFBc1JWRHYvaFRNREFCNGJndkZoaFp6VmQxUDN3LzhBbHh3?=
 =?utf-8?B?L1VnOU5GL1IzVWVEUmVXZTdndFhwMFNSdExjRENpMzNwREk2WEF2bkczSUZI?=
 =?utf-8?B?WWNmMlYxcU9FTnhtR2M0blg3aExRRmZUY3Jrb3JOVXdCRW90WjI1a1dnWGhK?=
 =?utf-8?B?RFJVWi9nVmc0RC9JSGtld3J2ejdBemEycHJqOUl0UE8vdThTSWFqZGRONDh2?=
 =?utf-8?B?eDV0blI0SDB3ZTgvQkpQQlNSTnZURUJyL1NLTWExRnE5UUtLcW5DWWpUT1hM?=
 =?utf-8?B?U2oxZFdPbytudDI3eVFLa05rOVlaNTFhSE1aZlp5T3Yzd2lYd1dSaFlXNkYr?=
 =?utf-8?B?dWYzMk9uSXVQMm82U1hDV2o1SG9vMW52aFlHQ0dPVS9UU2hrdGFXVWthcUQ4?=
 =?utf-8?B?ZEtTM014bEk1SHlxb1ZzakVhNGUrejIxWEtlSy91Y3hWbzdsYStsTWpWSHRu?=
 =?utf-8?B?N0RlN1o2LzRCcU9WV3d6UlkwRnZhWUxScDZVUWJnZStNRENZVU1ueFZjK0Vz?=
 =?utf-8?B?VzZOendYL1lpWEZVVk5xRFU5VzJpdm84TXFPdFl5NFlRdHRUWTJweUlhOFpQ?=
 =?utf-8?B?aGZRNEpwRXVHeWppc0cvQ09PYzlKK1ZxRUh4NUtjWWhOeWpJOEF4ckJjcXUx?=
 =?utf-8?B?L1F5Ykc5a2QxQUkwekE4dU9YYVhEUEcrVW5XZ1Q1aG0vUmdxOTdvR1JSRE5p?=
 =?utf-8?B?dytRaGVzOXkvRDNlSzEyb2tkTjdFTjdrSGxWbktEV0ZoUHhNSVBxdlFZVEl4?=
 =?utf-8?B?M1ZBdkxQU3FuM0kzQU4vb0w3M2hpSTVJZzlWUnBIMklSTDM2N2dKUXFkMkhz?=
 =?utf-8?B?WnNKTGlRb0VXcWtHMnpkbVUwdHREZFlWcVVLMFdKVE84YW1nWFEvdGsvOHJL?=
 =?utf-8?B?ODI5am9IcU1FQVNDOEpIZ0NwVVhYczRnWDg4SHFNSjNYMGJ0TFA2VG1pcFR3?=
 =?utf-8?B?SVBqUllORmlEOTJPa1Bzei94Nko3WkNtWkxwSm1nNWdHN0FydWxNK3VmZEhx?=
 =?utf-8?B?M1NqbWpmVkY5cE9FRzFTRXdNZjE5M0lkUGxieHRSaC91ZGV1QktxR3dMaks4?=
 =?utf-8?B?WUl4ZktjRGJ0SkNPMnUvcHR4N01qRU1Ba3lWTGdyaE4wRlUwRnV5cVpTME85?=
 =?utf-8?B?L1VxRTNoaEh4VXdQcGVTMUtydTRqMnk2SktBL1NUbmgrUyswdVdSendMT1lQ?=
 =?utf-8?B?Wkt3WlZNVDRLUFhQZHh5ZDlIZjNKK2F1T0lLMEt2SFNBcFJEVGVVUEhjVDcy?=
 =?utf-8?B?T2IyeHVONHZZNUdtb0pBd2w5emt4Q1hwVEV3VXVydEhRaE15cDFMTmNObjl3?=
 =?utf-8?B?cUhmNjBDdDV0Z01uc1AyR0h5cnJJT05YVUR6Rm1xNEN2eTVoVnJmSFlaWHVs?=
 =?utf-8?B?VXkzcDBuWis3cUU5QXZjTWlqZm95OGV2Ykw2Vk15eTMyTTIxWldGVHozVnFm?=
 =?utf-8?B?bEVOUlBzQmE4K3pqejY4b1h2ajYwNXorSzBlYmtwTHJXV1RuYmFKeEdLY0cy?=
 =?utf-8?B?eFV5QS9ia2U5L0lER2NaazBTMzJhMy9sczZsNWlnMTJZN0QzUW9xcGw5RVUv?=
 =?utf-8?B?WkxyR2puVkpOWDV3WGlPZWJlYzB3NGd6QWhJWkpVWGJXWDQxVWg2WjhleE1w?=
 =?utf-8?B?RFJBUkp5bURUTkZaMnhJcWRxQkFtZVBERVdzR2kwaldScHYya2kwdjlPb1o3?=
 =?utf-8?B?TVl6NU5sZ2hEZVBLWXJlY2RWbXYrY3ZBT256MTJHdVVXb2ljQ0JIenRTaCsw?=
 =?utf-8?B?YlNLZ0JMaG5JT1UrUFYvdXFLY0c4WXpzb2ZCdnovRktsb3lyYkdiZzZWSlRC?=
 =?utf-8?B?dllBd1FmcDY3ZjQ4dFpMdVZKWFpVUmxkUWlLMWFTMXMzTmJZTDBIOWdKa3Vw?=
 =?utf-8?Q?VEdULLzkEOhlrBDCFKp2oHYva?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR07MB6666.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b678f5b-41af-4778-79cd-08dd816c5472
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 07:07:22.9357
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /s+JvyfMlr/AhxSsaMy0lgmQGoezP08pLvhQPjtAjy9wSWS+AK9x3zi5cCEHxiXuylO332weXW78W25IXrlO5tquBQ6+S1r4R4Je4fVUoL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR07MB7411
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 07:07:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215194

VGhhbmtzIFF1ZW50aW4gZm9yIHBvaW50aW5nIGl0IG91dC4gSSdsbCByZXdyaXRlIGJvdGggcGF0
Y2hlcyBhZnRlciBQZXRlcidzIGNvbW1lbnRzLg0KDQpJIGNvdWxkIHVzZSB3aGF0IGlzIGluIGxp
bnV4LXlvY3RvOg0KDQpkLmdldFZhcigiS0VSTkVMX1BBQ0tBR0VfTkFNRSIpID09ICJrZXJuZWwi
IGFuZCBkLmdldFZhcigiUFJFRkVSUkVEX1BST1ZJREVSX3ZpcnR1YWwva2VybmVsIikgIT0gZC5n
ZXRWYXIoIlBOIikNCg0Kb3IgYWxzbyBjaGVjayB0aGUgQ1ZFX1BST0RVQ1QgaXMgImxpbnV4X2tl
cm5lbCIsIHNpbmNlIHRoZXNlIGFyZSB0aGUgQ1ZFcyB0aGF0IHdlIGNhcmUuDQoNCkRhbmllbA0K
DQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogUXVlbnRpbiBTY2h1bHogPHF1ZW50
aW4uc2NodWx6QGNoZXJyeS5kZT4gDQpTZW50OiBGcmlkYXksIDE4IEFwcmlsIDIwMjUgMTM6MjkN
ClRvOiBEYW5pZWwgVHVydWxsIDxkYW5pZWwudHVydWxsQGVyaWNzc29uLmNvbT47IG9wZW5lbWJl
ZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCkNjOiByeWJjenluc2thQGdtYWlsLmNv
bTsgc3RldmVAc2Frb21hbi5jb207IFBldGVyLk1hcmtvQHNpZW1lbnMuY29tOyByaWNoYXJkLnB1
cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnOyByb3NzLmJ1cnRvbkBhcm0uY29tDQpTdWJqZWN0OiBS
ZTogW09FLWNvcmVdIFtQQVRDSCAyLzJdIGN2ZS1jaGVjay1rZXJuZWw6IHZlcmlmeSBrZXJuZWwg
Q1ZFcyB1c2luZyBwcm9ncmFtRmlsZSBmcm9tIGtlcm5lbC5vcmcgQ05BDQoNCltZb3UgZG9uJ3Qg
b2Z0ZW4gZ2V0IGVtYWlsIGZyb20gcXVlbnRpbi5zY2h1bHpAY2hlcnJ5LmRlLiBMZWFybiB3aHkg
dGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50
aWZpY2F0aW9uIF0NCg0KSGkgRGFuaWVsLA0KDQpPbiA0LzE2LzI1IDQ6MjggUE0sIERhbmllbCBU
dXJ1bGwgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+IFtZb3UgZG9uJ3Qgb2Z0
ZW4gZ2V0IGVtYWlsIGZyb20gDQo+IGRhbmllbC50dXJ1bGw9ZXJpY3Nzb24uY29tQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcuIExlYXJuIHdoeSB0aGlzIGlzIA0KPiBpbXBvcnRhbnQgYXQgaHR0cHM6
Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4NCj4gRnJvbTogRGFu
aWVsIFR1cnVsbCA8ZGFuaWVsLnR1cnVsbEBlcmljc3Nvbi5jb20+DQo+DQo+IFRoaXMgY2xhc3Mg
aXMgdXNlZCB0byBjaGVjayB0aGUgQ1ZFcyBhZ2FpbnN0IGEgc3BlY2lmaWMga2VybmVsIGNvbmZp
Z3VyYXRpb24uDQo+IERlcGVuZHMgb24gZGF0YSBmcm9tIHRoZSBrZXJuZWwub3JnIENOQQ0KPiBo
dHRwczovL2V1cjAyLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMl
M0ElMkYlMkZnaXQuDQo+IGtlcm5lbC5vcmclMkZwdWIlMkZzY20lMkZsaW51eCUyRnNlY3VyaXR5
JTJGdnVsbnMuZ2l0JmRhdGE9MDUlN0MwMiU3Q2QNCj4gYW5pZWwudHVydWxsJTQwZXJpY3Nzb24u
Y29tJTdDODYzNDg4YWE3NDMyNDZlMGNhMTMwOGRkN2U2YzNkZGQlN0M5MmU4NA0KPiBjZWJmYmZk
NDdhYmJlNTIwODBjNmI4Nzk1M2YlN0MwJTdDMCU3QzYzODgwNTcyNTU1NjI3Nzg4OCU3Q1Vua25v
d24lN0NUDQo+IFdGcGJHWnNiM2Q4ZXlKRmJYQjBlVTFoY0draU9uUnlkV1VzSWxZaU9pSXdMakF1
TURBd01DSXNJbEFpT2lKWGFXNHpNaUkNCj4gc0lrRk9Jam9pVFdGcGJDSXNJbGRVSWpveWZRJTNE
JTNEJTdDMCU3QyU3QyU3QyZzZGF0YT11VDFkZDd5T25yNHY4QiUyQg0KPiBWTGpmWmJvUzVING1q
TW51MFRBVGNKSkNvWDNrJTNEJnJlc2VydmVkPTANCj4gVGhlIENWRSBkYXRhIHByb3ZpZGVkIGJ5
IGtlcm5lbC5vcmcgaW5jbHVkZXMgdGhlIGZpbGVzIHRoYXQgYXJlIA0KPiBhZmZlY3RlZCBieSBh
IGdpdmVuIENWRSBhbmQgYXJlIHByb3ZpZGVkIGFzIGpzb24gZmlsZXMNCj4NCj4gSXQgcmVxdWly
ZXMgdGhlIGtlcm5lbCB0byBiZSBjb21waWxlZCB0byBiZSBhYmxlIHRvIGV4dHJhY3Qgd2hpY2gg
ZmlsZXMgYXJlIHVzZWQuDQo+IEl0IGlzIGNyZWF0ZWQgYXMgb3B0aW9uYWwgY2hlY2sgb24gdG9w
IGN2ZS1jaGVjay4NCj4NCj4gVG8gZW5hYmxlIGFkZCBpbiB5b3VyIGxvY2FsLmNvbmYNCj4gSU5I
RVJJVCArPSBjdmUtY2hlY2sNCj4gSU5IRVJJVCArPSBjdmUtY2hlY2sta2VybmVsDQo+DQo+IFRv
IHRlc3QgaXQNCj4gYml0YmFrZSB2aXJ0dWFsL2tlcm5lbCAtYyBjdmVfY2hlY2tfa2VybmVsDQo+
DQo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBUdXJ1bGwgPGRhbmllbC50dXJ1bGxAZXJpY3Nzb24u
Y29tPg0KPiAtLS0NCj4gICBtZXRhL2NsYXNzZXMvY3ZlLWNoZWNrLWtlcm5lbC5iYmNsYXNzIHwg
MTMyICsrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEzMiBp
bnNlcnRpb25zKCspDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvY2xhc3Nlcy9jdmUtY2hl
Y2sta2VybmVsLmJiY2xhc3MNCj4NCj4gZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy9jdmUtY2hl
Y2sta2VybmVsLmJiY2xhc3MgDQo+IGIvbWV0YS9jbGFzc2VzL2N2ZS1jaGVjay1rZXJuZWwuYmJj
bGFzcw0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwLi5jMDFmMGVm
ZDFkDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvbWV0YS9jbGFzc2VzL2N2ZS1jaGVjay1rZXJu
ZWwuYmJjbGFzcw0KPiBAQCAtMCwwICsxLDEzMiBAQA0KPiArIw0KPiArIyBDb3B5cmlnaHQgT3Bl
bkVtYmVkZGVkIENvbnRyaWJ1dG9ycyAjICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IA0KPiAr
TUlUICMgIyBUaGlzIGNsYXNzIGlzIHVzZWQgdG8gY2hlY2sgdGhlIENWRXMgYWdhaW5zdCBhIHNw
ZWNpZmljIA0KPiAra2VybmVsIGNvbmZpZ3VyYXRpb24uDQo+ICsjIERlcGVuZHMgb24gZGF0YSBm
cm9tIHRoZSBrZXJuZWwub3JnIENOQSAjIA0KPiAraHR0cHM6Ly9ldXIwMi5zYWZlbGlua3MucHJv
dGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2l0DQo+ICsua2VybmVsLm9y
ZyUyRnB1YiUyRnNjbSUyRmxpbnV4JTJGc2VjdXJpdHklMkZ2dWxucy5naXQmZGF0YT0wNSU3QzAy
JTcNCj4gK0NkYW5pZWwudHVydWxsJTQwZXJpY3Nzb24uY29tJTdDODYzNDg4YWE3NDMyNDZlMGNh
MTMwOGRkN2U2YzNkZGQlN0M5Mg0KPiArZTg0Y2ViZmJmZDQ3YWJiZTUyMDgwYzZiODc5NTNmJTdD
MCU3QzAlN0M2Mzg4MDU3MjU1NTYyOTY1MjQlN0NVbmtub3duDQo+ICslN0NUV0ZwYkdac2IzZDhl
eUpGYlhCMGVVMWhjR2tpT25SeWRXVXNJbFlpT2lJd0xqQXVNREF3TUNJc0lsQWlPaUpYYVcNCj4g
KzR6TWlJc0lrRk9Jam9pVFdGcGJDSXNJbGRVSWpveWZRJTNEJTNEJTdDMCU3QyU3QyU3QyZzZGF0
YT1oU2N1ZWh0MU9Meg0KPiArR0tCcWgzZzVJdWlSVEtOM3VsUHdCcEN1UnJ1SnUlMkJhUSUzRCZy
ZXNlcnZlZD0wDQo+ICsjIFRoZSBDVkUgZGF0YSBwcm92aWRlZCBieSBrZXJuZWwub3JnIGluY2x1
ZGVzIHRoZSBmaWxlcyB0aGF0IGFyZSAjIA0KPiArYWZmZWN0ZWQgYnkgYSBnaXZlbiBDVkUgYW5k
IGFyZSBwcm92aWRlZCBhcyBqc29uIGZpbGVzICMgIyBJdCANCj4gK3JlcXVpcmVzIHRoZSBrZXJu
ZWwgdG8gYmUgY29tcGlsZWQgdG8gYmUgYWJsZSB0byBleHRyYWN0IHdoaWNoIGZpbGVzIA0KPiAr
YXJlICMgdXNlZC4gSXQgaXMgY3JlYXRlZCBhcyBvcHRpb25hbCBjaGVjayBvbiB0b3AgY3ZlLWNo
ZWNrLg0KPiArIw0KPiArIyBUbyBlbmFibGUgYWRkIGluIHlvdXIgbG9jYWwuY29uZg0KPiArIyBJ
TkhFUklUICs9IGN2ZS1jaGVjaw0KPiArIyBJTkhFUklUICs9IGN2ZS1jaGVjay1rZXJuZWwNCj4g
KyMNCj4gKyMgVGhlbiBleGVjdXRlDQo+ICsjIGJpdGJha2UgdmlydHVhbC9rZXJuZWwgLWMgY3Zl
X2NoZWNrX2tlcm5lbCAjDQo+ICsNCj4gK0tFUk5FTF9GSUxFU19ESVIgPz0gIiR7TE9HX0RJUn0v
Y3ZlL2tlcm5lbF9maWxlcyINCj4gK0tFUk5FTF9TUkNfRklMRVMgPz0gIiR7S0VSTkVMX0ZJTEVT
X0RJUn0vY29tcGlsZV9jb21tYW5kcy5qc29uIg0KPiArS0VSTkVMX0NOQV9SRVBPID89ICIke0RM
X0RJUn0vQ1ZFX0NIRUNLL3Z1bG5zIg0KPiArDQo+ICtweXRob24gKCkgew0KPiArICAgIGlmIG5v
dCBiYi5kYXRhLmluaGVyaXRzX2NsYXNzKCJjdmUtY2hlY2siLCBkKToNCj4gKyAgICAgICAgcmFp
c2UgYmIucGFyc2UuU2tpcFJlY2lwZSgiU2tpcCBjdmUtY2hlY2sta2VybmVsIHdoZW4gDQo+ICtj
dmUtY2hlY2sgY2xhc3MgaXMgbm90IGxvYWRlZC4iKQ0KPiArDQo+ICsgICAgaWYgZC5nZXRWYXIo
J1BOJywgVHJ1ZSkgPT0gZC5nZXRWYXIoIlBSRUZFUlJFRF9QUk9WSURFUl92aXJ0dWFsL2tlcm5l
bCIsIFRydWUpOg0KDQpJIGRvbid0IHRoaW5rIHRoaXMgd2lsbCB3b3JrIHJlbGlhYmx5Pw0KDQpJ
IHRoaW5rIHlvdSBjb3VsZCBoYXZlIGFub3RoZXIgdmlydHVhbCBwcm92aWRlciBpbiBQUkVGRVJS
RURfUFJPVklERVJfdmlydHVhbC9rZXJuZWwgYW5kIHRoZW4gdGhpcyB3b3VsZG4ndCBtYXRjaC4N
Cg0KSSBoYXZlIG5vIGNsdWUgaG93IHRvIGhhbmRsZSB0aGF0IHByb3Blcmx5Lg0KDQpJJ20gbm90
IHN1cmUgaG93IHRvIG1ha2Ugc3VyZSB3ZSdyZSBhbHdheXMgdXNpbmcgdGhlIGxhdGVzdCBsaW51
eC12dWxucyBkYXRhYmFzZSAoYW5kIHNvIG5vdCByZWx5IG9uIHRoZSBjYWNoZShzKSkgYnV0IGF0
IHRoZSBzYW1lIHRpbWUgYWxsb3cgYnVpbGRpbmcgd2l0aG91dCBuZXR3b3JrIGFjY2Vzcy4gSSBn
dWVzcyB3ZSBjb3VsZCBwcm92aWRlIHNvbWUgaGFzaCBvciB0YXJiYWxsIGZvciBsaW51eC12dWxu
cyBieSBkZWZhdWx0LCBmb3IgYnVpbGRpbmcgd2l0aG91dCBuZXR3b3JrIGFjY2Vzcz8NCg0KQ2hl
ZXJzLA0KUXVlbnRpbg0K

