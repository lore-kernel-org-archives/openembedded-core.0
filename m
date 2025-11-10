Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD9FCCFA13
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 15:18:24 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50465.1762787901917270876
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 07:18:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=aOBmPfsC;
 spf=pass (domain: siemens.com, ip: 52.101.83.36, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GHz90MjxlODzw3vVPZCmuVZziOKhXeDYFlSU8IfESx6Df1PAa67VkAV8gx1EjbLwqV6/6QCFngWCoR2mvjgmeU+tPsl+hjhjdncL9eQ4C9Slpj8Iwaogo5O92VFB/er1hycvK2H2UMV2zUvCnXXLBA48kdqPWVUK2hRfZzaw7iNZE6XgqSiY6peVi2FMhvtTABCDvW9IO7T9gVxlI0Er2v7IRWj/7qhDqgRUFZh7cgYfkrontLZnUOvjGS5nVd6G4VYpJnshQVzkcDErn9i3QTiGp0lmh3QhbmK8zCV7sK4daT1UiwCyymHnN0JEweDmqGn5eypnhMP6oOBAYoDYLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEbS+bJiHJVbtyK6gZzhO17BEeEkRv87Oh8n+Rze99Y=;
 b=rFh2NXe3wqLhWIwWeuwqujCmmbyFUFvNKUDar5Ttzdf3NGVIioiNmf6+0ztOzPeI45QeUWDo62S9zk2wLymz3jMT9OmWApNqkLeqbHWewJNQEfZiwkJHJmFL4Adtc/JtVv+qDv8gaCkQK8R1T81WlR4+JOdQpqTGqstz35miFygZMe3gZQpDoI/zORn8Y/qm5+Moic3R8kiw67E7IXUj37fXxGdoqgIQRJR1mvNe43MhydT/62bq+/8qBrV+Q8hHXqIqTTyEon3LL334BLSXBkXDYbWNt4gUbWVq7Ll284zavBfe3eA3CXuoAya2lfYXSQOWJMg3SDywJtBuDF7xYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEbS+bJiHJVbtyK6gZzhO17BEeEkRv87Oh8n+Rze99Y=;
 b=aOBmPfsC+633dCaLTWWE+TqE8ojjFMslwwjuZzMgvbeILjRNgor8gDyme6TvIqC86yLHiEIA/e+WCqcGCU8dBbc9CLQkdFBOaa7rEu07SflYyKXL4RoneUXVZmOu162fcr+y2+IgSyLkPx4Uq/7UgwtoQ46lqs0luSN/v/jC1mL4wyarQmNdtpEpanCbZmr0UT+HAP6ns+wUbQXFF+SzBi25TRBzaS7CjdpjhSL0KP5ioAW/YNhJggDdmnraTuAW+TWoorPWiao5zbEgNp0LqV/T9/ztKN5DwFo6PxHc+siz3L90Enomap6FtXVF6Z7OsvWaXOGc8ppIBaxDlTKwXg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV1PR10MB6636.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:84::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Mon, 10 Nov
 2025 15:18:16 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9275.013; Mon, 10 Nov 2025
 15:18:16 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Marta Rybczynska <rybczynska@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
CC: "niko.mauno@vaisala.com" <niko.mauno@vaisala.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "ross.burton@arm.com"
	<ross.burton@arm.com>
Subject: RE: [OE-core] [PATCH 5/5] cve-update: Keep mtime stamp in the
 database itself
Thread-Topic: [OE-core] [PATCH 5/5] cve-update: Keep mtime stamp in the
 database itself
Thread-Index: AQHcTM6qoOx/HMnrh0mRh2uJmpNwFrTr/3yAgAAMKQCAAAMb8A==
Date: Mon, 10 Nov 2025 15:18:15 +0000
Message-ID: 
 <AS1PR10MB5697F694A61CEF460D80F25EFDCEA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20251103143157.315178-1-niko.mauno@vaisala.com>
 <20251103143157.315178-5-niko.mauno@vaisala.com>
 <1ccdd952a740a2d09774d825cc28bee20ff1525d.camel@linuxfoundation.org>
 <CAApg2=R=nyLt3hiqH5uEKqhp1XZ2WKkWrAH837ZqTGRTVSCWHw@mail.gmail.com>
In-Reply-To: 
 <CAApg2=R=nyLt3hiqH5uEKqhp1XZ2WKkWrAH837ZqTGRTVSCWHw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=3cfef50f-b7a1-4239-aed6-a623a297555b;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-11-10T15:10:43Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV1PR10MB6636:EE_
x-ms-office365-filtering-correlation-id: 6d38e095-9bfc-4a59-27e0-08de206c5f42
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ME93MWdYUGJwaDB6b2xpM1BTREo1VCtNK2RIR1VxeUNobGdzNkZ5NVA2TU40?=
 =?utf-8?B?UFpPS1BzYmVTaWVtVWMwMDNReWJ5SHpPcGhwU1NZRjNCVjAvSkhkbHZuQXhn?=
 =?utf-8?B?d3p0Y1R4V1E1bEdFS0pHQ3pVVXYzK2Vrd1hLQ3VPNnJjMUFWZUJHUHhOTjhx?=
 =?utf-8?B?ek1IdWRjeGgwa2JKNFZ5ZndkQjQ1SWhudnpyWFpDM1ZzUWRoaERibXBlV2hO?=
 =?utf-8?B?eWtRRDUvMDNsQ3U0RVJRbUZJRkQweUMrWEIzRW95MmpKS25oay9NTlBEV3dW?=
 =?utf-8?B?M3oyWVRnSHBRSUUzVms5cVoyUHkyYlBRRWxhWUhCL05lcXE4M0hCSndHNUo2?=
 =?utf-8?B?SWV3RjRxTFVrWnBYL0pRMXF6SkcxdTUxUkNlM21McDR0VnYyYzhTRXppaVV4?=
 =?utf-8?B?UU5SWXdZU0g1Q0poR2FKVkF4Z3YxOU11dXJWUzFsZWR0WW5yK0xKTDdFRmVZ?=
 =?utf-8?B?cTJPaFYwSXQ4eGFJWGUwQnUxTGQrZlpndTBvU0FGUXZUQ2txdVdjUmpaRUtp?=
 =?utf-8?B?TnFwY2tUdk95Um0rRkpCSzZnWnBUNDlJYnZ6WjhKSzBialZtYUVGNGdzUUFv?=
 =?utf-8?B?cW1nSHpyeDZiMWxYa0pOdm5wcTRHL3JuNll3TjVuRSt0b0hHYVhsQWlleTYz?=
 =?utf-8?B?VG9Gb09rcUNyMFloNEVHTjlIWHJ5ZjN2b09lNHp5ODRSQ2FTeWRGUG40aEZZ?=
 =?utf-8?B?LzNQSG92aUp4YUxhQjVCWld5R1ovUTh6b1JsQ01lWFN4blRsRDIwNjhkcGs3?=
 =?utf-8?B?SVZwcVpMRG50VzV5Yk9NK0lxNkVlWGZkKzQxSnVYa1hLY2RUaUVoa1pLZGRa?=
 =?utf-8?B?MGx6WE5ubC9veXp5ZWc2VkNKK2dzeUFSK2VELzU1VHM4ODVWd2h2ZHYvREhI?=
 =?utf-8?B?dmlMcXllQkl4TWtaU3VMWk52b0huZkNSd1g2YjZTcnJBTncrZi9XK2w0U0k5?=
 =?utf-8?B?S0tHMmQ3RjVpWmQ4N2pBR1ZWcWdWWXl0c3orMDR3bVEwb0xZUmpTTit5b0Q2?=
 =?utf-8?B?RWQ2WUpOVGxacWM4S2FrSlJDYlRpOGk2YjR1UnI0Qm9Jd1BXUi9oSlNrRlds?=
 =?utf-8?B?K2pjZUJmb3JiZXdxdkRDWFJYa0FQVVBzMkFlRkhPRzdOREhnRFJQcHMybHVX?=
 =?utf-8?B?dE1RdFRScDAxN0E0OGc2WThDMW9RTjdiRVNTZ0JNdFppQmU2allWZXFTbWtm?=
 =?utf-8?B?dTF0R1ZJdk5TN2NQZGFJY1l4SkNmbjRxeUdGUGNsckxCNXI3eTYzaGVoVEQ4?=
 =?utf-8?B?d1MzRm4ram11L20wV2dIRlpHMWlJNzJ6cWxVVXpSU2p6L3ZuWjZKcDVkNTJt?=
 =?utf-8?B?anp5aTVkUTZrS1RZSWVjV1V0aW9SaktJUW8yeGhiSWY3MFlhbUVNdlpETnBj?=
 =?utf-8?B?VXRvYUNpS1hUbEdQdWdJbzNsSjBJUXRUOHJ5UUppKzVER1hDQkJXVFZLNkpq?=
 =?utf-8?B?bUVySTlYbUVrZXBHY2VnTXhHMUNoRk5IT1R1bW14U0R1RDIzd1JkZkk3bkM2?=
 =?utf-8?B?VVZrZmk1M3JlanNUZFMxRUdVcEp1SC9YYXZkN1Q1MHB3dXVzb0kyVU5GYXhJ?=
 =?utf-8?B?emJ4aStNMUZINFVXOGViM0JwOHNzTEtBNlU2cFB3RVdCVWJkV2srRHhKSEk1?=
 =?utf-8?B?azdDMSszVDlCbER3MHh2V090VCswaTZYUjV1a1NhcDI0OTIvb09LWUVVTDhj?=
 =?utf-8?B?NDhZMUpyZHIxZlA2cm9yOVRrL3lsUHlOMmtEMjg5UnJzeVoyRzRCWi83R0Vp?=
 =?utf-8?B?ZXQ2N1RNcWl6TFhteUsrZzRpekNiMEZCd2pXOXZEd1lTSG1oZHhSZlFsUU9E?=
 =?utf-8?B?WFBJeHh2NHVVS1o1aDZ3dmpIMWI1c1ZKVWl2dG8zejdyUmdIZFlJK2l6dDdw?=
 =?utf-8?B?WE5uSUE2OGJpcTlGSG5lTGlMb0tTblFFVTlHZEtpWUZUWHV4MWtVU1o2YThF?=
 =?utf-8?Q?y2f/pAJvHGwu1Zv5AEJlPY607GqUqGt3?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?L1NQUmt1eDFaOFBOVDNjdStFOXJ2M2M1VjdveTIyS2dUL3VFZDBDRVMxK1RF?=
 =?utf-8?B?UngrbHVYSVE4ajZLVXNIWWxEa2h6UlRwZkxpeE8weXRxTWtaNmU4SkZqMUN2?=
 =?utf-8?B?UjZrdnN2S0dhaDZiQThNdHM3RUk2Q0wwTGc2cStaZG1BcFFFMlNodGt6VW9Z?=
 =?utf-8?B?enpuZ0lDZXF0R2FKeW4rNllvZ1ZzSFRUaFdwVVRGSmt4UlU4S21pUlVBdFJH?=
 =?utf-8?B?YkppM3BpRDk0ZEs2dmIzYUUralpSRWhaSW54TmtsYll6NnVSQVpKZTBYQTR5?=
 =?utf-8?B?K2RReSs2bjRFdnlyRUtCQnFxdnZsRWtSZlN5OFp5Y3cxVG9kOEZlVDh6UDdn?=
 =?utf-8?B?TjFPNW14VmhGcXBRSnhzb1pDU0JmV3dYRGthQW1NSm9ZTUFCaWJwUzdveXFM?=
 =?utf-8?B?a3diYXZ6aVJ6N3FzQlMyUzdSa0RPeXZ3dURGVlpUNjF0UmdsL2xXc1NYakhW?=
 =?utf-8?B?KzlhUVhxSmFjdk5zbDQ0dUtGNTZEb2NOQ0FKREpBM1lkd1VjT2syOTh5SGJq?=
 =?utf-8?B?N2FsMzV6WEtxbXZKZlFoQmE2eG1xSjFEUFBMS1plTDM5c2dsL1l6TjNhRzQ3?=
 =?utf-8?B?bzVndmpwakthMlhoOEtYSUlqMUhyL2pJekNwanU2bGhVWmtDVDRnbFFLTzdZ?=
 =?utf-8?B?d0ZhZkNjaGlhelVMcWJ1Y1hTaVliMzMrV0hMMmxCQnZkR1pLenErdG1EWms1?=
 =?utf-8?B?cjcxeVpndU1icXpwekJvSzEvQWRNa3pwU05yUHFmTVBNQXFxcngrUWVISzRy?=
 =?utf-8?B?NXp5UDRwNy9xV1BzR3BLbFQ1VW9OUlZxSjJVTlNaYzQzS0dSUkYra1paUlNw?=
 =?utf-8?B?aTQ3azBVaVVYTjI4WnVRRmRyamVJV01vSWNtWkREd05XdE9DR1pHNFlFVkU1?=
 =?utf-8?B?dlZCZDE2SUtZYVFreS9kY2pKR3pDQWNnMDVUYnZkaE1IMW5hV1UvRW4vK3Bi?=
 =?utf-8?B?eGZrL1F2MUU0QkdkQ0l2d3ZaZlFwL3NtR1BmWW5HWlMxekRCTzNNaCt0dFVG?=
 =?utf-8?B?NUY2L3FtNGtsa1JqZi9wclJFaFhKWjA2WWJLRERPVGovV3ovVE9TSkM1NDVU?=
 =?utf-8?B?WS9rZlRJNVpnaGFnSnpvUGlJRkswV1VHT243ZEh2Rjh1M01yNzRPbDRnN05i?=
 =?utf-8?B?Y0dmRUJ0dVNMRG5xc2s3cTBTbGxNR3pLTnp6RmJNZjBVSFN1ZmlVR3ovbmNw?=
 =?utf-8?B?b3VMYUdMUGFCS1FWTmNScERDVjh1NVFiYkRTb2FaamVXMW1KSFZSZkE1WGNv?=
 =?utf-8?B?V2FpVUJzQUNObmhLMUxGY29XSzh5VS9mMTBpalgxUEpzUGFrcUNmazBwUzJI?=
 =?utf-8?B?eFZDeUkrWW1vMmVjZEhJYnNkSUZrMVFDZTNOZTVyOVdXSHMvaHFiV05IZXkv?=
 =?utf-8?B?bjlFaVp1SUY1M2VwNnF6VitzNHprV3liSHkrMjYrZitGUzRmRFFkTTh6NGp4?=
 =?utf-8?B?OUpzZTBrUzlyOTd3UGRjRGF0VUoyUnhLQnBaczBDQWUzeVZkcHM1V01xMmhi?=
 =?utf-8?B?dUZidGhKMTV2V2ZOUGs3K3NsMWVWNkptc3ptNjAyNWR1MHE1Q2pjSk9uL2ZN?=
 =?utf-8?B?NFE3OE52dVFSRUZrTjYwL3JRSU9SbXFBRGFQYVBPbmlhU0JSUFE3R0JGK1Bz?=
 =?utf-8?B?VmI3RjVwajkvbkptSW5rTVJlWlg0WFFXNTRuWERtWHpYOGg3M0Fkbm9LQTRC?=
 =?utf-8?B?WGR3VW9iUGZ3UUYxVWM2RDVTUnR3U0Z3ZVlrTWRzRzFCdEVhc3pUZG5Oc1J4?=
 =?utf-8?B?ckk5aFNvZ3V6RGRzUit3bWVGN0kxYndjVmdEYjZaRnFUNi9CUTNGcEpFNStM?=
 =?utf-8?B?YXMwZG85QXQ1eFJWOWJhSlNIVEtvL09DZDZOZG1kcUlGOFl0L04yVGRkQ0Q4?=
 =?utf-8?B?cUlRQ3ppT3djRkU2OTFjbVVFSGt5US9EVUYxcVA4czVEbHUwV0dzOGZxTkhh?=
 =?utf-8?B?OENEMlhOTm80VEhBMDEwU3VUMHIrTUZPOHZtcWVCNk1WSk5TYk1VbjBJcFEr?=
 =?utf-8?B?WWoyK1RmcTdRbjZxcm91bGRpM2xBYWFua0JCQXhZTCtwNjgrTkhvbkF6aktC?=
 =?utf-8?B?cXBFa2R2MEErM0N1bkZ4ZW9HbTVEMlJkRXcyVC9venJSRlNNLzUyTW4zSjFs?=
 =?utf-8?Q?Ub7eCeFMPYkU+t6ouMyiQJy4o?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d38e095-9bfc-4a59-27e0-08de206c5f42
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2025 15:18:15.9633
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UvplOF8OXiDanbDh4hQTyd/FXpXJRDpqnBxiy7f6UZYrgSS/G85ZVrBaQyUjBDWkeNHgvBq+MpIySBVPeTwV2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6636
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 15:18:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226125

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFydGEgUnliY3p5bnNr
YSA8cnliY3p5bnNrYUBnbWFpbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgTm92ZW1iZXIgMTAsIDIw
MjUgMTY6MDANCj4gVG86IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5k
YXRpb24ub3JnPg0KPiBDYzogbmlrby5tYXVub0B2YWlzYWxhLmNvbTsgb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzsNCj4gcm9zcy5idXJ0b25AYXJtLmNvbTsgTWFya28s
IFBldGVyIChGVCBEIEVVIFNLIEJGUzEpDQo+IDxQZXRlci5NYXJrb0BzaWVtZW5zLmNvbT4NCj4g
U3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggNS81XSBjdmUtdXBkYXRlOiBLZWVwIG10aW1l
IHN0YW1wIGluIHRoZQ0KPiBkYXRhYmFzZSBpdHNlbGYNCj4gDQo+IA0KPiANCj4gT24gTW9uLCBO
b3YgMTAsIDIwMjUgYXQgMzoxNuKAr1BNIFJpY2hhcmQgUHVyZGllDQo+IDxyaWNoYXJkLnB1cmRp
ZUBsaW51eGZvdW5kYXRpb24ub3JnIDxtYWlsdG86cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0
aW9uLm9yZz4NCj4gPiB3cm90ZToNCj4gDQo+IA0KPiAJT24gTW9uLCAyMDI1LTExLTAzIGF0IDE0
OjMxICswMDAwLCBOaWtvIE1hdW5vIHZpYQ0KPiBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxodHRw
Oi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gIHdyb3RlOg0KPiAJPiBUaGlzIHNob3VsZCBoZWxw
IHRvIGF2b2lkIHByb2JsZW1zIHRoYXQgd2lsbCBvY2N1ciBpZiB0aGUgbW9kaWZpY2F0aW9uDQo+
IAk+IHRpbWUgb2YgZGF0YWJhc2UgZmlsZSBpdHNlbGYgaXMgYWx0ZXJlZCBlLmcuIGJ5IHVuYXNz
b2NpYXRlZA0KPiAJPiBwcm9jZXNzKGVzKSBvbiB0aGUgZmlsZSBzeXN0ZW0gd2hpY2ggaG9zdHMg
dGhlIGRhdGFiYXNlIGZpbGUuDQo+IAk+DQo+IAk+IFNpbmNlIHRoaXMgY2hhbmdlIHVwZGF0ZXMg
dGhlIGRhdGFiYXNlIHN0cnVjdHVyZSBieSBhZGRpbmcgYSBuZXcgdGFibGUsDQo+IAk+IGJ1bXAg
dGhlICdtaW5vcicgdmVyc2lvbiBudW1iZXIgaW4gZGF0YWJhc2UgZmlsZSBuYW1lcyB0byBlbmZv
cmNlIGZ1bGwNCj4gCT4gZGF0YWJhc2UgZmV0Y2guIFRoaXMgc2hvdWxkIGFsc28gaXJvbiBvdXQg
ZS5nLiBzaXR1YXRpb24gd2hlcmUgdGhlDQo+IAk+IGRhdGFiYXNlIG1pZ2h0IGhhdmUgaW5jb25z
cGljdW91c2x5IG9taXR0ZWQgZW50cmllcyBkdWUgdG8gd2F5IGluDQo+IHdoaWNoDQo+IAk+IHRo
ZSBtdGltZSBvZiBkYXRhYmFzZSBmaWxlIGl0c2VsZiB3YXMgcmVsaWVkIHVwb24uDQo+IAk+DQo+
IAk+IFNpZ25lZC1vZmYtYnk6IE5pa28gTWF1bm8gPG5pa28ubWF1bm9AdmFpc2FsYS5jb20NCj4g
PG1haWx0bzpuaWtvLm1hdW5vQHZhaXNhbGEuY29tPiA+DQo+IAk+IC0tLQ0KPiAJPiAgbWV0YS9j
bGFzc2VzL2N2ZS1jaGVjay5iYmNsYXNzICAgICAgICAgICAgICAgIHwgIDIgKy0NCj4gCT4gIC4u
Li9yZWNpcGVzLWNvcmUvbWV0YS9jdmUtdXBkYXRlLWRiLW5hdGl2ZS5iYiA8aHR0cDovL2N2ZS11
cGRhdGUtZGItDQo+IG5hdGl2ZS5iYj4gIHwgIDMgKw0KPiAJPiAgbWV0YS9yZWNpcGVzLWNvcmUv
bWV0YS9jdmUtdXBkYXRlLW5hdGl2ZS5pbmMgIHwgNTkgKysrKysrKysrKysrLS0tLS0tLQ0KPiAJ
PiAgLi4uL21ldGEvY3ZlLXVwZGF0ZS1udmQyLW5hdGl2ZS5iYiA8aHR0cDovL2N2ZS11cGRhdGUt
bnZkMi1uYXRpdmUuYmI+DQo+IHwgIDMgKw0KPiAJPiAgNCBmaWxlcyBjaGFuZ2VkLCA0NiBpbnNl
cnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkNCj4gDQo+IAlJIGFtIGEgYml0IHdvcnJpZWQgYWJv
dXQgdGhpcyBzaW5jZSBpdCB0YWtlcyB3aGF0IGlzIGEgc2ltcGxlIG10aW1lDQo+IAljb21wYXJp
c29uIGFuZCBtZWFucyB0aGF0IHRvIGNoZWNrIHRoZSBkYXRhYmFzZSB5b3Ugbm93IGhhdmUgdG8g
bG9jaw0KPiAJYW5kIG9wZW4gaXQgd2hpY2ggaXMgY29tcGFyYXRpdmVseSBleHBlbnNpdmUuDQo+
IA0KPiAJV2hhdCBraW5kIG9mICJ1bmFzc29jaWF0ZWQgcHJvY2Vzc2VzIiBhcmUgdXBkYXRpbmcg
dGhlIG10aW1lPw0KPiANCj4gDQo+IA0KPiANCj4gSSBzZWNvbmQgUmljaGFyZCBoZXJlLiBJZiB3
ZSB3b3VsZCByZWFsbHkgd2FudCB0byBrZWVwIHRoZSBkYXRlIHNvbWV3aGVyZSBlbHNlDQo+IHRo
YW4gdGhlIGZpbGUNCj4gdGltZXN0YW1wLCB3ZSBjb3VsZCBjcmVhdGUgYSBzaW1wbGUgZmlsZSB0
aGF0IHN0b3JlcyBpdCwgd2hhdCBpcyB3YXkgc2ltcGxlciBhbmQNCj4gZG9lc24ndCByZXF1aXJl
DQo+IHRvIG9wZW4gdGhlIGRhdGFiYXNlIGp1c3QgdG8gc2VlIGlmIHlvdSB3YW50IHRvIHVwZGF0
ZSBpdC4NCj4gDQo+IEkgc2Vjb25kIFJpY2hhcmQncyBxdWVzdGlvbjogaW4gd2hhdCBraW5kIG9m
IGEgc2l0dWF0aW9uIGhhdmUgeW91IHNlZW4gYW4gaXNzdWU/DQoNClRoZSBpc3N1ZSBpcyBvbiBZ
b2N0byBBQi4NCkl0IGhhcyBub3QgdXBkYXRlZCBzdGF0aXN0aWNzIGZvciBtb3JlIHRoYW4gNSBt
b250aHMgbm93Lg0KDQpMb29raW5nIGF0IHRoZSBsb2dzLCBzb21ldGhpbmcgaXMgdXBkYXRpbmcg
bXRpbWUgdmVyeSBmcmVxdWVudGx5Li4uDQpJIGRvbid0IGtub3cgdGhlIEFCIGluZnJhc3RydWN0
dXJlLCBidXQgaXQgbG9va3MgbGlrZSB0aGVyZSBpcyBzb21lIGZpbGVzeXN0ZW0gY3Jhd2xlciwg
bWF5YmUgYmFja3VwIG9mIHN5bmMgcHJvY2Vzcy4NCk9yIHRoZSBuZnMgbW91bnQgaXMgcGxhaW4g
YnJva2VuIHRoZXJlPw0KDQpFeGFtcGxlIGlzIGhlcmU6DQpodHRwczovL3ZhbGt5cmllLnlvY3Rv
LmlvL3B1Yi9ub24tcmVsZWFzZS8yMDI1MTEwOS00My90ZXN0cmVzdWx0cy9tZXRyaWNzL2RiLXVw
ZGF0ZS8NCk5PVEU6IEN1cnJlbnQgdGltZTogU3VuIE5vdiAgOSAwNzoxNzo1MiAyMDI1OyBEQiB0
aW1lOiBTdW4gTm92ICA5IDA3OjE0OjUxIDIwMjUNCk5PVEU6IEN1cnJlbnQgdGltZTogU3VuIE5v
diAgOSAwNzoxOToyMiAyMDI1OyBEQiB0aW1lOiBTdW4gTm92ICA5IDA3OjE4OjE0IDIwMjUNCjIg
am9icyBhcmUgOTAgc2Vjb25kcyBmcm9tIGVhY2ggb3RoZXIsIGJ1dCBzb21ldGhpbmcgbWFuYWdl
ZCB0byBjaGFuZ2UgdGhlIHRpbWVzdGFtcCBpbiBiZXR3ZWVuIGFuZCBvbmx5IDMuNSBtaW51dGVz
IGFmdGVyIGxhc3QgY2hhbmdlIQ0KDQpQZXRlcg0KDQo+IA0KPiBLaW5kIHJlZ2FyZHMsDQo+IE1h
cnRhDQoNCg==

