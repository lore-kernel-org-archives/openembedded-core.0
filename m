Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F6A9CCA470
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 17:17:00 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.45])
 by mx.groups.io with SMTP id smtpd.web11.1304.1759771011818712707
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 10:16:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=p4qjx0FK;
 spf=pass (domain: siemens.com, ip: 40.107.162.45, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HgmE/gDeMAvDTnfNz48CCt/g6gw8V8S5dRMcc8WoSOOFREWHOoIx7V9qkfc8f2OjAsKJEWBfB0YhlyKEDvWt552SclPqsh3R4pqDcVxFZcLzP8RrZiGMyc4HbYJ7Y+77LKRo/NVkujf+YyVWtyg2VlXezUsaXCJlH/tYEpNqxmwf5qJVACpqNVsxCpXv6/ZYmcm8LzdYC+3mE/feng74pwomwlSD+VXxMfevgSDOunFtT6NWYMgMbm28+G9ZIi0wQmpHAJN0P8uJDl4St9F90R4oKZ7YJi1LCtwbJjFjaGxVSPDIBlJAeJCfgn5CDovjwWctwpFrUdbZvhDOe5unqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJHtSiksK00cgdcKa3vkWwOzm6ZZfYNlahKkYXjgTd0=;
 b=MOWqwh4cos9Y8yRP7e+ulABY+fwfnb1tyy7QHquHSrSDK4nr5g5MMH93+z791KiJ6qv3mX9lIatQRRGt8Xp1Mk+Ocup2Gq8PgkfPkUg4WSWLN+d5OWFlGq/w3AlzCZXSZ+Jllr+FEsRNLCV80uuIYQHaCQsmUiloG3YsTRtbVRXyBW3oG3hMQ31u24pWc/DEm5YCse73RcY+9pfQElEBm/t//oXCGXpwh55ycb7cMZLYF8BfmuOJlkfiZ0EPwho7uA5DR5bTKXmeUoS6NKNtu/ZV1bacVvoMkFMGnaiG+H8CDHzI5862tdmuSRnA6GFhP7dTvql4qE7hDzxDyHpXiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJHtSiksK00cgdcKa3vkWwOzm6ZZfYNlahKkYXjgTd0=;
 b=p4qjx0FK7gMU3eYYIFaZyIMrM8Mwrfzh1vLdoRDsRrgZxvRq2wvCc08HOQwOPH+m5GnvF1/ENS5l/xxgU0gqvNLW80W40enEo8++Kr7VKV8hEL2RDR7eh6BCwqhOogkVo7wf7lmnznIVEV5ntqBwAJevlmSioxsFE/fQyCU+HXlj+EtMDZrRuvwBogF9aNVcAa1kQp7cez6/ITUUgq7rQ6RRMHpFyDiosSmRR9DJurbP9hMIS0xy+kXABO94arJgGX6gsdrvocDvNS/wVwUBXvZ9laa+CzE8skp0mFhJNdykWEQOTWw3TEc8RZse7a5woNo4AWxDE76UpTvAMcto8g==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU2PR10MB7883.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:491::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 17:16:42 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9182.015; Mon, 6 Oct 2025
 17:16:42 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Steve Sakoman <steve@sakoman.com>
CC: "archana.polampalli@windriver.com" <archana.polampalli@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [oe-core][kirkstone][PATCH 1/1] openssl: upgrade 3.0.17 -> 3.0.18
Thread-Topic: [oe-core][kirkstone][PATCH 1/1] openssl: upgrade 3.0.17 ->
 3.0.18
Thread-Index: AQHcNpkt7Tgal0Wex0KgeV5nGQ4iYbS04CBQgABkw4CAABbMwA==
Date: Mon, 6 Oct 2025 17:16:42 +0000
Message-ID: 
 <AS1PR10MB5697A0AD4EA288B6E49B2002FDE3A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20251006081341.3653614-1-archana.polampalli@windriver.com>
 <AS1PR10MB56979D4719B7D45235350DB2FDE3A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CAOSpxdYM7wQyvRYrDS7GUq7ZfVGzqb9=t7JhcnZpstA0H204xA@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdYM7wQyvRYrDS7GUq7ZfVGzqb9=t7JhcnZpstA0H204xA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=12aae8a8-2d73-4c62-ae11-e0817a9b006c;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-10-06T17:12:49Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU2PR10MB7883:EE_
x-ms-office365-filtering-correlation-id: adda7ba7-1675-4225-55e3-08de04fc1ed1
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|4022899009|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?TWx1SDFLcWNpVDYzZ3NZcmV2OWUzcWYxRWlJWVRFQUhTWUNTVFlBdXRMZWw4?=
 =?utf-8?B?c2hKZ1NDOXlyeDU4SENhd2F2UXJMSnlnTVhOTTQ0MUhoY1pJb0NPamEvRUxY?=
 =?utf-8?B?VE1HTk5OZnBtNS8rWlEzWE9yajJ1NThKdzg5SXJzbXVhUFFvZXkwOVVTTXRz?=
 =?utf-8?B?MTRKT0ZvTzdvNmJ3SSswMnN4WnBMbHBmUDdLUUszZVJKZVg5ajVocVRNOXFP?=
 =?utf-8?B?djUwZkZ0eFJLZWRBUHkvMHpoZlArKythMmg5UVdMK3RxSEpxUGdxeGFhNEtU?=
 =?utf-8?B?NkZkT1pncUlNNHI4K0xjV0hldUh2Nnh6TWFLRkRhREdTR2FueXhyNk1rNUVK?=
 =?utf-8?B?QjZMSUlydkFuQXZGUytNS0hiVVVUU01MU0xZelhiMkx2U1U1OXJIREkvckFN?=
 =?utf-8?B?bExNRm5NeFZ1T3ZUWCtzNWhONFVyOFB5MDd5cGxEZlNNWFpLOWQ5bzhUM05T?=
 =?utf-8?B?dHNkYTlQdElMWXhWc0xhcTNVdTRkSWU0Y0JJVk9ZRnBzdEJ2SjU2dlIyNEJs?=
 =?utf-8?B?bDY1T1ZPRlQ2SXFlMStaTjZxMHd4ZDZ2ZXZJRm10VGZONXZtWDlsV29DdlFU?=
 =?utf-8?B?eWwyejRoWEdjOEh4WFhVM0pER05uWnZBd2tRNkt0dnBYYUFlUmVkVmY1NnJo?=
 =?utf-8?B?ZXlhMGNCOVo5UUNuR25LQndnTW03Mmk1aVFDUXMxblFEV29KTEd1d2dySDhK?=
 =?utf-8?B?eXU0NmpTNENLR0p2ZUg0UCtpTzZmUDBheG9OYXFuRjAzNDg2eWQ0Ry80R3or?=
 =?utf-8?B?aHdOOFhIdGNJalNIRFZodFU3b01jZXdyelVOalNueGRtWk95Y2lxNlJmV0lQ?=
 =?utf-8?B?WitTdFE5M2oxb0VGaGRVUHlXY2ZlY1NEYjZ2bzlKZjdmc2lwWjJPenhkN3o5?=
 =?utf-8?B?bzR1T2R3b2I3OUo5VWFXOVZzakJnbk1XYW5NaXRUZ25FN3NvMW1PK2pLK1JV?=
 =?utf-8?B?WjhHZXJQckh3ZnZlb0RqMnpkOUwycE1SVnR3OWcxS0F4em5hV0tzcXdDTUkv?=
 =?utf-8?B?M014TEJzK0NrTy8vN3F5RHVYQkplaVhMYjN0SEJ1bVk2YmR4ZW9CNm1oajhy?=
 =?utf-8?B?L0FmN1FKVTBuOUNrV0NVT3RJZUxCRzdqNTh5VzRVTVJyVTFDcmxadE0zNEZ6?=
 =?utf-8?B?UTBsMTQ2ZHF2UUpqNXN3MVpTL1krYk9XVUNiQlBybC82NkRNa2dNTXVlRHAv?=
 =?utf-8?B?cURkRXFaYi9VcGEwL0ZtTmgzeXFyN0VFbWhaOCtjS0h6RjN4YlZteXM5M0lO?=
 =?utf-8?B?dUhFKzhIMlpQaWlVMmlXa1J3RWtMSVVlb3VmNWExT1JRejczSHBxdEN0eTNx?=
 =?utf-8?B?VUdCVVdaTlZjVGg3V2JtOWdrVVp0VmhYZzlmbHJVbENQYVN0cjhxSjlPcThJ?=
 =?utf-8?B?OTBlSE9VSnRaVEt5bFJKN2QyaUpZdDc0U3hSbGp4M1FqVXV0eWg2SUIvTmRq?=
 =?utf-8?B?dlk0NFdnZ2JNQnByVlNOM0Jqb3dXSnJWWUt4dTlpVGpqdHpFZk9rRmRUUENT?=
 =?utf-8?B?MGZvRFRaUE1KM3p4UlE1ejM5SHJhR3E1cVk2eWRlUTdRSExtcldYRStLckMx?=
 =?utf-8?B?NjhDZG5EcG9nME5OTVVFamFSeVpGblFKK0VJVDkyV3V4M01MUU5VWG0rVEYx?=
 =?utf-8?B?MVhhY2g4NXpWdUJTM08vZG9VN3IxUHB0S1RiaE9NaTBrem1oRE5rQTF2MHIr?=
 =?utf-8?B?eGx0c1pNYjkwYWpySmtpRnZaV0pPTVoxTE1lblYzL3dDYW4rWDZZdllSdDdu?=
 =?utf-8?B?ZnZ4Yjk4ZnNYR25jU1NjMExFN2M4UzdVK2RaZXgzNnNTTW5CWHgvQTYzMStI?=
 =?utf-8?B?RlhGMTNiS1VGMGpDN1ZmaFVWVzF5YUgzNjN6YXNaS2FEaW1FTlJTKysybXl5?=
 =?utf-8?B?d1lwTldjOFhhWmVvZWdteHFjRFU3Z1NzeDNTWXJDcVppa29yZHdsUnZ3ZlpJ?=
 =?utf-8?Q?X5vm57EO4lHDPoz+6DDEwNgu9jNO2jI1?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WFc3ZnoxdEJXajQvanFkaWlYSS9pdmJCbW5velJrbVlsVjNUV2JEZElmYmQ5?=
 =?utf-8?B?RFNZWUpHalUrZWhMMWhNMGZXa3FaLytJOTdYNlRwdjVVUWJoaS9ia0ZobFV4?=
 =?utf-8?B?TTFCanFoeG94NGdSVEZQaGVlZ1ZheHZGNDlpeERtZHVOUk5WWkJ5QWdvVDMy?=
 =?utf-8?B?VnJiU2svQ0czUlBMa2p4TmFyUEFZUFpmRWQyaEhobUd6SWhKQlgyN0h1OWRv?=
 =?utf-8?B?WlA3a0w4N2hxenllbjh0Z2tkTFpoRzdxOUJMWU9zU2kwNnFncWo1UHNaaEJI?=
 =?utf-8?B?ZnBvWWxiS0o4OThualRJblRtZTZKOXcwUGREdUlnZUVWWmh6b3UzbmplV05k?=
 =?utf-8?B?czg0MjMreUVhSVdMbFFwdERzRXNPZ3JwU09ZZmVXeUw2djNMN2M4NFFQbWhI?=
 =?utf-8?B?ZzdZZWVrL1g2UjduNVdoY2pDN3ZEMEFTNEJyZWNva3FHeVNaQ2s4QTc0V3ls?=
 =?utf-8?B?RldYVHVkcFlIUWxnSEdHU0xoSkFSa0FmOGRLYkhEMFBCLzVrbEJMUXE3cW5O?=
 =?utf-8?B?OTY4dWhiSHFXZlZPUTBkWXlxbk1HYmVZeFVkaWVQZ1FrZDFLcWpFSFErMUxz?=
 =?utf-8?B?Yld6M1QzOHh4MUdNa3VIcm5sazJiUFpwYWZZY29ZZ2lHYVUyWU5VdHYyL1J6?=
 =?utf-8?B?dnU3RHhkYndiTWdGekU3Sk9oYitidkQzcUpwZjBvREdLck5uT01MUzVjbkp5?=
 =?utf-8?B?NkNrWFNacEpaTjBKWTJ6ZUs2eGloeEt1Y05rVWVqUXdydUZvMDFRcTJCUkFO?=
 =?utf-8?B?OXpsYzFrWmxkZVJ5VzZZS1JSYzBJOU1jOW5yZE5MbzRUdUMyaDdmVTkxR2RZ?=
 =?utf-8?B?VnZCOWU1U3ROZWtkTlRxWUduUzFjdnNzTm0ydzR2eW9YbUg5TDlTUXhWODQ1?=
 =?utf-8?B?WDBtc2JmZ0F0N1QvWEhob0ZjaU1zZllac2J0eFFIZXd1aTB1Mk9LeWpJMUFQ?=
 =?utf-8?B?Y0NqeDFPOVVyOVhpN2Q3Y0pha0VxbEdRY0JLYkRFZmxRY0FKdTcvNXh5c1h3?=
 =?utf-8?B?TXppTGtuUURaNm9jUWNJcFB3WHhTMFhZdzFacmlqeGYxNUNIZ05zZWN6Wkgr?=
 =?utf-8?B?dVlBS2JBb0JIa3F5MXRCU3B6bHpPOStCVFF2SmhyYURqTmhHUGlDMG9EZnk4?=
 =?utf-8?B?WUVSa0w4K2dDd0JuN1RETDExUGl4dFhWRlFBb0tuaFpDbUt5QWJ6U0IwVjVC?=
 =?utf-8?B?elVsb3BtUXYvUWNTdVRJaDZ4b2RoNGNzS24zak1BaUtHNnAzdWlqN0F1aisy?=
 =?utf-8?B?MFVpVjMwdjgyQ1h3SFZnWCtxcWtQZWF5T3lEUkZObDJRanFTdUMzMWdjNzRp?=
 =?utf-8?B?bU5ERU03R0JjSUZvV1drL1lsOWRUVEtvcjBTdW1oUW5idFJCZnUzbnhleXY4?=
 =?utf-8?B?MXorb2RqL2RvdUxtK0E0QU1FQ3ZCTWtyMWIvUmRnbkRNbUpoT21YeXhKR0VP?=
 =?utf-8?B?WkZIc3JsbWsxUndrQU9MdW5XSWdIZ3FiU0s2aEFZaUxUdlR4clRrT0NQSkwr?=
 =?utf-8?B?S0s0THhkdWV5eUt5WUNtdGNUb3BDaW1vamt1cHQ0azR5VzYvN3dUaXZ1Q05G?=
 =?utf-8?B?bkRIZTJmUit5VjNpaDdGQm5yeXAzbFlJZzVmREdQaFlWV1VYMVAvTWpsMVRD?=
 =?utf-8?B?clgxd1hySzZPd2ttRy8raHRmL3FVMjhQeXcrM1lwSWF3L0NYcjQxT1d5bHJo?=
 =?utf-8?B?ZUxsbnA4cnViRU1UY2hqU2RrZDVwRzJBYW54TWlOeDdzNWM4N3JBbXhOOFQx?=
 =?utf-8?B?dnV5bWwxQmlKUCtYa21Fa1g2Wi9adFB0ekxHU3VyWCtXdnNIY0s3WjQwRDRV?=
 =?utf-8?B?QXBRNmJvYWpMK2lIYWw4dG1qczRJdE9QMmcyNDNQZk9CRVdPYjRIdTVxUFZM?=
 =?utf-8?B?UGNXaVpTZHpPWEJTL1hMQWk1Wi9ycGwwMC9Mam1HdjdxWEN2VS81UGJNQlY2?=
 =?utf-8?B?NmJvdExRZythZ3IzbWFxTExSUzZaTHVVeDNjY0FNalRiL3NUdW4xYXIvbEoz?=
 =?utf-8?B?eWFyQi9TT0VvWmRrQjE3R2lKRytnVFRXVVNqU2U1YjgzRG1qUC8wZ1B5MWxX?=
 =?utf-8?B?b3RIcnR1cnBhOGxBQlkwTFNIODhacHpFeXRtSGt5RmpBM1VoMFFhdWh3aG94?=
 =?utf-8?Q?gYjEYUQiWOJHEQApd8wXnBknj?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: adda7ba7-1675-4225-55e3-08de04fc1ed1
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2025 17:16:42.8031
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9B1N9q4sphyhSB1Krqjpz4VR1qMDhjaX5O2NjflZywZXpH871FN9tMf3G0HSWICRa1NWQGMZCp2GHCl/h9CSwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR10MB7883
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 17:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224499

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3RldmUgU2Frb21hbiA8
c3RldmVAc2Frb21hbi5jb20+DQo+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciA2LCAyMDI1IDE3OjUx
DQo+IFRvOiBNYXJrbywgUGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkgPFBldGVyLk1hcmtvQHNpZW1l
bnMuY29tPg0KPiBDYzogYXJjaGFuYS5wb2xhbXBhbGxpQHdpbmRyaXZlci5jb207IG9wZW5lbWJl
ZGRlZC0NCj4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbb2Ut
Y29yZV1ba2lya3N0b25lXVtQQVRDSCAxLzFdIG9wZW5zc2w6IHVwZ3JhZGUgMy4wLjE3IC0+IDMu
MC4xOA0KPiANCj4gT24gTW9uLCBPY3QgNiwgMjAyNSBhdCAyOjUy4oCvQU0gUGV0ZXIgTWFya28g
dmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPHBldGVyLm1hcmtvPXNpZW1lbnMuY29tQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiA+DQo+ID4gSSBoYXZlIHNlbnQgb3V0IGFu
b3RoZXIgcGF0Y2ggd2hpY2ggYWxzbyByZWZyZXNoZWQgcGF0Y2hlcy4NCj4gPiBIZXJlIEknZCBs
aWtlIHRvIGFzayB0aGUgbWFpbnRhaW5lcnMgcmVnYXJkaW5nIHBhdGNoIHJlZnJlc2ggcG9saWN5
Lg0KPiA+IFNob3VsZCBJIGJlIGRvaW5nIGl0IGFsc28gd2hlbiB0aGUgZG9fcGF0Y2ggZG9lcyBu
b3QgcmVwb3J0IGFueSBmdXp6LCBvbmx5IHdoZW4NCj4gc29tZSBsaW5lIG51bWJlcnMgbW92ZWQg
YSBiaXQ/DQo+IA0KPiBEZWZpbml0ZWx5IGVsaW1pbmF0ZSBmdXp6LCBidXQgaWYgdGhlIHBhdGNo
ZXMgYXBwbHkgSSdtIG5vdCB0b28NCj4gY29uY2VybmVkIGFib3V0IGxpbmUgbnVtYmVycyBtb3Zp
bmcgYSBiaXQuDQo+IA0KPiBIb3dldmVyIEkgbm90aWNlIHRoYXQgeW91ciB2ZXJzaW9uIG9mIHRo
aXMgcGF0Y2ggYWxzbyBjaGFuZ2VkIHRoZQ0KPiBjb250ZW50IG9mIG9uZSBvZiB0aGUgcGF0Y2hl
cyAoQ1ZFLTIwMjQtNDE5OTYucGF0Y2gpLiAgV2FzIHRoaXMNCj4gaW50ZW50aW9uYWw/DQo+IA0K
PiBTdGV2ZQ0KDQpUaGF0J3Mgd2hhdCBkZXZ0b29sIGRpZCBhbmQgSSBhc3Nlc3NlZCBpdCBhcyBj
b3JyZWN0IGNoYW5nZS4NCkl0IGxvb2tzIGxpa2UgdGhlIHBhdGNoIHdhcyBub3QgMTAwJSBwZXIg
c3BlY2lmaWNhdGlvbiBhcyBwYXRjaCBuZWVkcyB0byBoYXZlIGxlYWRpbmcgIisiLCAiLSIgb3Ig
IiAiLg0KUHJvYmFibHkgcGF0Y2ggZWRpdGVkIG1hbnVhbGx5IGFuZCBlZGl0b3Igc3RyaXBwZWQg
dGhlIHNwYWNlIGR1ZSB0byBlZGl0b3Jjb25maWc/DQoNClBldGVyDQoNCj4gDQo+ID4NCj4gPiBQ
ZXRlcg0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTog
b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0K
PiA+ID4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgUG9sYW1wYWxs
aSwgQXJjaGFuYSB2aWENCj4gPiA+IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiA+IFNlbnQ6
IE1vbmRheSwgT2N0b2JlciA2LCAyMDI1IDEwOjE0DQo+ID4gPiBUbzogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+ID4gU3ViamVjdDogW29lLWNvcmVdW2tpcmtz
dG9uZV1bUEFUQ0ggMS8xXSBvcGVuc3NsOiB1cGdyYWRlIDMuMC4xNyAtPiAzLjAuMTgNCj4gPiA+
DQo+ID4gPiBGcm9tOiBBcmNoYW5hIFBvbGFtcGFsbGkgPGFyY2hhbmEucG9sYW1wYWxsaUB3aW5k
cml2ZXIuY29tPg0KPiA+ID4NCj4gPiA+IFRoaXMgcmVsZWFzZSBpbmNvcnBvcmF0ZXMgdGhlIGZv
bGxvd2luZyBidWcgZml4ZXMgYW5kIG1pdGlnYXRpb25zOg0KPiA+ID4gRml4IE91dC1vZi1ib3Vu
ZHMgcmVhZCAmIHdyaXRlIGluIFJGQyAzMjExIEtFSyBVbndyYXAuIChDVkUtMjAyNS05MjMwKQ0K
PiA+ID4gRml4IE91dC1vZi1ib3VuZHMgcmVhZCBpbiBIVFRQIGNsaWVudCBub19wcm94eSBoYW5k
bGluZy4gKENWRS0yMDI1LTkyMzIpDQo+ID4gPg0KPiA+ID4gQ2hhbmdlbG9nOg0KPiA+ID4gaHR0
cHM6Ly9naXRodWIuY29tL29wZW5zc2wvb3BlbnNzbC9ibG9iL29wZW5zc2wtMy4wLjE4L05FV1Mu
bWQjb3BlbnNzbC0zMA0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEFyY2hhbmEgUG9sYW1w
YWxsaSA8YXJjaGFuYS5wb2xhbXBhbGxpQHdpbmRyaXZlci5jb20+DQo+ID4gPiAtLS0NCj4gPiA+
ICAuLi4vb3BlbnNzbC97b3BlbnNzbF8zLjAuMTcuYmIgPT4gb3BlbnNzbF8zLjAuMTguYmJ9ICAg
ICAgICAgICAgfCAyICstDQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pDQo+ID4gPiAgcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3Bl
bnNzbC97b3BlbnNzbF8zLjAuMTcuYmIgPT4NCj4gPiA+IG9wZW5zc2xfMy4wLjE4LmJifSAoOTkl
KQ0KPiA+ID4NCj4gPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29w
ZW5zc2wvb3BlbnNzbF8zLjAuMTcuYmINCj4gYi9tZXRhL3JlY2lwZXMtDQo+ID4gPiBjb25uZWN0
aXZpdHkvb3BlbnNzbC9vcGVuc3NsXzMuMC4xOC5iYg0KPiA+ID4gc2ltaWxhcml0eSBpbmRleCA5
OSUNCj4gPiA+IHJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzbC9v
cGVuc3NsXzMuMC4xNy5iYg0KPiA+ID4gcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvb3BlbnNzbC9vcGVuc3NsXzMuMC4xOC5iYg0KPiA+ID4gaW5kZXggYTUwYmQyZWRiZi4uYThk
ZDMzODMyNyAxMDA2NDQNCj4gPiA+IC0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3Bl
bnNzbC9vcGVuc3NsXzMuMC4xNy5iYg0KPiA+ID4gKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9vcGVuc3NsL29wZW5zc2xfMy4wLjE4LmJiDQo+ID4gPiBAQCAtMjUsNyArMjUsNyBAQCBT
UkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmVzZGsgPSAiIFwNCj4gPiA+ICAgICAgICAgICAgIGZp
bGU6Ly9lbnZpcm9ubWVudC5kLW9wZW5zc2wuc2ggXA0KPiA+ID4gICAgICAgICAgICAgIg0KPiA+
ID4NCj4gPiA+IC1TUkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiA+ID4gImRmZGQ3N2U0ZWExYjU3ZmYz
YTZkYmRlNmIwYmRjM2YzMWRiNWFjOTllN2ZkZDRlYWY5ZTFmYmI2ZWMyZGI4Y2UiDQo+ID4gPiAr
U1JDX1VSSVtzaGEyNTZzdW1dID0NCj4gPiA+ICJkODBjMzRmNWNmOTAyZGNjZjFmMWI1ZGY1ZWJi
ODZkMDM5MmUzNzA0OWU1ZDczZGYxYjNhYmFlNzJlNGZmZThiIg0KPiA+ID4NCj4gPiA+ICBpbmhl
cml0IGxpYl9wYWNrYWdlIG11bHRpbGliX2hlYWRlciBtdWx0aWxpYl9zY3JpcHQgcHRlc3QgcGVy
bG5hdGl2ZQ0KPiA+ID4gIE1VTFRJTElCX1NDUklQVFMgPSAiJHtQTn0tYmluOiR7YmluZGlyfS9j
X3JlaGFzaCINCj4gPiA+IC0tDQo+ID4gPiAyLjQwLjANCj4gPg0KPiA+DQo+ID4gLT0tPS09LT0t
PS09LT0tPS09LT0tPS0NCj4gPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQg
dG8gdGhpcyBncm91cC4NCj4gPiBWaWV3L1JlcGx5IE9ubGluZSAoIzIyNDQ3Mik6IGh0dHBzOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC0NCj4gY29yZS9tZXNzYWdlLzIy
NDQ3Mg0KPiA+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3Jn
L210LzExNTYxMzg3Ni8zNjIwNjAxDQo+ID4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3Jl
K293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9s
aXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWINCj4gW3N0ZXZl
QHNha29tYW4uY29tXQ0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4NCg==

