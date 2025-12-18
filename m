Return-Path: <erik.schumacher@iris-sensing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38ABCD6D22D
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 14:30:05 +0000 (UTC)
Received: from FR6P281CU001.outbound.protection.outlook.com (FR6P281CU001.outbound.protection.outlook.com [52.101.171.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43322.1766068195823043873
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 06:29:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@iris-sensing.com header.s=selector1 header.b=AhFoOSRD;
 spf=pass (domain: iris-sensing.com, ip: 52.101.171.79, mailfrom: erik.schumacher@iris-sensing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOCxu3wm1L1jdNuzA/L41EqRio5Wsir6sAex8vagqzmG+WFlkg7Sr9UgO2ed+CJMb/gXbNKX1uWZ0TEnYyTFjk1xA6S/KF0BF6lMLajqK+CO7Eh5EEoVCG1Txa55ImTlo7/sODfF9/IYQc5aCgMr6EH6QmgQFyrSfag+sctoNLHHbnXM9UywPxPCMGp6yD4T69NWcpqwtTj0bIGMPyuzCbouMx0SrS50jMcRTx6OnFtM9Yi/f95BXrLctXsvioUlZE7E8r6nSNFeYIX4X2SZp/jWk2yC126LWr+sUoN8SvEzTtKGAa/JmciWrTetluB/KbBE6/zeGRyXO5YFFhczeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVkMwLsv5ODYn6XJw0kscdxhh0C+jDjNjQOVUsjBkFg=;
 b=a7jtykS8UDLzgKy31e5t+l0pLh857+Gjxl72ohfpjKLcDtgwoU9LKpaspJexkqwxHZWdIj6UpsSTYRBCdVa77x07wIJ4Df1z3qXJI36yxzKNIEkvTjMd3Gyhg9gExIVA0j8iiEU9AceUzR0bDioJFBg2wI75E2sKUnCRqb+zg/E+xVvpJpy9BTqB5KMA2Fufl6AsMAvMI7xElKy4Ri0iJZ2fuypP4i54rd9bNWxuadQrg1ZIgYfZ5gc2V3W0TiXJEBczUvo2Un9AVrPv2rBDkhirlmFhgiFLiOqvInljOP1YuhRW7BCewSNsByIZ9zGC5Kw2ZRt7eiAcQ0PWbccQiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iris-sensing.com; dmarc=pass action=none
 header.from=iris-sensing.com; dkim=pass header.d=iris-sensing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iris-sensing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVkMwLsv5ODYn6XJw0kscdxhh0C+jDjNjQOVUsjBkFg=;
 b=AhFoOSRDPTGo3DH7rPuxUNWJfXKeAHA4hZ0r/nMeFqbrcHKFMlPMU8DcJMJGeXYHdzItfdbyR7RWWlWuJbD+4rsMCytq8z6Vzh1OBbRmbyKOZp7qAhy8eXXPIDda7NSw+sAVw6pfiwR9QlpOI3xV2MlCEvCHsiZmYZF+UxMw4rnf06VGZK807zTk2BIChJ+9o1wheQugFkvr7GvqcEjRtxkzAkxcF8hKtNd9pHAxWAIN468RHNmSzEwcnT6UBABJB265yawfniXegCbkop5Z/Sh4SnzEFmZeQH411s5DEf4dMcNFWwWNR02nDIU0R0dqjoz6U15CjLERer1QJSJMXg==
Received: from FRSP281MB5825.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1ba::18)
 by BEYP281MB4007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:b9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 14:29:51 +0000
Received: from FRSP281MB5825.DEUP281.PROD.OUTLOOK.COM
 ([fe80::8bd8:4e0:64b4:7b4a]) by FRSP281MB5825.DEUP281.PROD.OUTLOOK.COM
 ([fe80::8bd8:4e0:64b4:7b4a%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 14:29:51 +0000
From: Erik Schumacher <erik.schumacher@iris-sensing.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "adrian.freihofer@siemens.com"
	<adrian.freihofer@siemens.com>
Subject: Re: [OE-core] [PATCH v2] initramfs-framework: rdepend on mountpoint
 command
Thread-Topic: [OE-core] [PATCH v2] initramfs-framework: rdepend on mountpoint
 command
Thread-Index: AQHcbqesy0KR9OqVTUGSeCBVe3xjsLUnNcmAgABCcAA=
Date: Thu, 18 Dec 2025 14:29:51 +0000
Message-ID: <76ba88ad3a4104bfcb512da7b51c8d4eb0f10772.camel@iris-sensing.com>
References: <4f922d17bac5aaadc452efb965b9d320daca8f1e.camel@iris-sensing.com>
	 <c6cc1a74b0ca64345f846b643fd8680878908f6d.camel@siemens.com>
In-Reply-To: <c6cc1a74b0ca64345f846b643fd8680878908f6d.camel@siemens.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iris-sensing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FRSP281MB5825:EE_|BEYP281MB4007:EE_
x-ms-office365-filtering-correlation-id: 8e8c3c29-97a1-45fc-8eba-08de3e41e791
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|10070799003|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?VmZncXQ5NnJDSlh0RVRiczI2YVN5dHdYVVprUXptTGNwZUJ5Vno4N3BvTDBv?=
 =?utf-8?B?byt2eTJlUm1NSEV0QWg4YWdUQ1NtUmVuN3BKWnNvTVlvWHZ6MHhWUnRJVUxw?=
 =?utf-8?B?UUNMN0d6ZDJuSDNkcGlXbjdOYWE0Rm95elE3amJGaVE5aWxqSGdxMUorUnQr?=
 =?utf-8?B?TUlVbjF3MDhUWnJVdWMyR1h3Rko1Y1FkeEh6V2dITWlHc2h6L0ZnOWlFNWFZ?=
 =?utf-8?B?dTJYOWtHVzlJWTZ0WmhxZkdxeG81SE1wcTlJb2xtNmNUbW1iUVptamR0cyth?=
 =?utf-8?B?TjVsczR1bHgxd1FuUXBlenM4eWZTL1YyVzR0dmw1S0wzUUYyQlMyRHUydXl6?=
 =?utf-8?B?QWNMYzZUQjJ6R2Y0TXZCUkZYdm1PYThMN3ZvYTdxMXhUbGZTN09kT0M5TFln?=
 =?utf-8?B?TGtpbzdrdk9hNDNZZ3RmSGRJR25VZEg1TDF2NWpWdEhuSkZ5STE0dVNVVFI3?=
 =?utf-8?B?Qm5GZURRQXgzTWgzSFExbythMWZ3emtBT1pYUHBEcHJGY0p0RzAvTEVHZUlZ?=
 =?utf-8?B?UlU3ZGVCZnlqV2tqMW1IYnlCenhLQmZyUUdZcVk2V0ptT3d2b2hQNjhUcllL?=
 =?utf-8?B?cTEvNXFCanNiTGVZV1J0RTZlOGpZUERPNXgyelpKQ083RU5SZ0IxSW0wZ3Q3?=
 =?utf-8?B?dExjcmFVakt6ZUZJTklLL1l2YVF0RUNzckUyYmM4V0FlVjQrQmVVV3BENTBY?=
 =?utf-8?B?L1Y5bWxQRDZSa0k1UGtBTm94YlNXQWZpVDR4eE1YbEljbTlUY2IvNkF6YldJ?=
 =?utf-8?B?aEJrU3UyRUpaejFFQ0g4bDhFVzg2aEFtRE83MmIyWWUxRk8wbC80dVNYdTNw?=
 =?utf-8?B?amViaTlvSUlaMVQ3S3hzNUZrOTlzbTcvOGtrdmo5WjRHNmZPVFBYdzhUUWNS?=
 =?utf-8?B?ank0MFBLSU5lMG1mUzdMcWowaEVySFNjZ1p2MzB2TXRiYURCaGNGYXdUUEFR?=
 =?utf-8?B?aGFLVnV0L0gvTW04WGwrMWl4SnhSMjBBTHRuS1loS01hTitUU2xWVkZOKzQ2?=
 =?utf-8?B?SVdBZEZFNVQxck9KUzMrMS82bEY0aXczU0Z6MXpoQnNSQUhtMVVvN3BWSUZP?=
 =?utf-8?B?ZzA2R3ZhcXhlUjlxeXpxUVV2Y2tWV0NpeU5iSWJZejJmaEZEdmZXa2hIYVZt?=
 =?utf-8?B?cEJJOVNlM1FjTkxrMkcrcG1NR2tKZ21mR3FvZWhRaTcwbHVXSHg0MFo2YjUv?=
 =?utf-8?B?dEdFSDYxZmFRbUFPSVN3dmRseFdvQU4wQlpNT3d5c2VLWEkyTjN0UlB1Y1BG?=
 =?utf-8?B?aGRScXFiMm51TmNybjl4ZVdRck5la1pTbEV5M3NVaWxFd0hzRjZsV25ObTlK?=
 =?utf-8?B?cXRSbWVZNllqSGhxYnE3UW1qdG5SZURVRC84Ny9aeUROSlpqM3FYZ01zQmFw?=
 =?utf-8?B?d0N2R1Q5RlhMRXpXWFN1VklpQ0dnTS93YWgrdS9rUUtMNDY1cE5SSlZlSUhY?=
 =?utf-8?B?SkRLQ3Y5Tmk5L0p4V1N4dzYvdnVKS3ZWZmhGUENuNFlkeGZ4N0MwWTRSVk1x?=
 =?utf-8?B?Vi93S1hmelEzYWtHRHdiVHhER1VYZm5lVEIvcmxSMFFVZjBDVDArNXJwVStE?=
 =?utf-8?B?L0loYWJ3d0MzcVBROENhd2V5WWRZQy9rVCtYNlphUVR1WkVlL29CbC9Jd1Ft?=
 =?utf-8?B?R2V0NVVCYm5nL001ay9FMnpNQzJud3dsUVlOOFE4OE96NXVmUkx6TE9xZ1Az?=
 =?utf-8?B?ZGk0YmJpd1J2RGpTVnY2M2hFLzA4VHN4RnNDWFpnQnFjZHFzTTMzMzRoeW15?=
 =?utf-8?B?dVVxMEsxZ01naUlQRmI5MG5kbFFhRU8yWTE4MlVQc3JadkNuY09VTlhxRUJq?=
 =?utf-8?B?R0RtTVFQRUhjVEIvYzRDcE5NMGtvbDV0RWZuNHE0UFVQRFlxSTA3SnNtVXdC?=
 =?utf-8?B?eSt1QmF3VWxtVlFXM3orczhidFVBOE9mTEczYTY5a1RlTUYxR1IyazZqeGhh?=
 =?utf-8?B?NWE1Qjk4NXpRNDg1SjRpNkx3L2xQRDRRRm9CcVFSbkgyWHMxdWZpaXg0SXVs?=
 =?utf-8?B?SnZjcUlUa2hnS0ZqMDJqUm5RRU5aR0Y1YnJXL09oc3JlczBkUUJYMTEvTFg3?=
 =?utf-8?Q?wkcJN/?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRSP281MB5825.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YzFJeWI5UE1WdnpRaHFhQW5CUE9TeTlEeEY0Uld1dWVETDgxajFMeGtqMHZj?=
 =?utf-8?B?Nnc3WWhNRnh5Tzhnd2FpRU8wVkxpWlFYOE9KWklJQmVySC8vM0ExbjhvbkpR?=
 =?utf-8?B?Qlg5WlN0eTNEZU5hSXVPUnoxR1lxa1IwTXpDWTlrbmFQc1FmQ1lrbURFNUJE?=
 =?utf-8?B?TDdXY0JDSkZ1R0tyM2RjZTBKMjlZeTBONE9mazd3NjlRTkJjLzkwMExpdTVY?=
 =?utf-8?B?akdzR2JrL0dBSDIrSHpvSUNBMUtxcWJCeGNHL3p1c3E5cTFQODIxczZQOEt6?=
 =?utf-8?B?d0h2NXIzVVluVHdqcFZBdWQ3WjVwWE43cFlkcVQ4UVcwNmVYTEFFWmFzVnZx?=
 =?utf-8?B?alBOblFyTXR4UXRWTW8yc29MWTRiUnZtcnArVGxSRURXamFlbU5mNXZsS2Nq?=
 =?utf-8?B?dE4yVXNsNkpyWnB0VHVDNVk5YlZUSWNDcHc0NVI0Vld2Wk9MdHZtSVE2eCtw?=
 =?utf-8?B?cjNzZ29GQ0htK25FR3RLaUYvVnRzNzUrN0lJMVZGN3k5UVYxeTFrUXFNTEg5?=
 =?utf-8?B?Z1FBaS9iVWc4QlFuQmxlc1cxYnpTSk5sc24rOXQxMERDUWRiK096VjBLL3Qz?=
 =?utf-8?B?UHVPeU9sd1o3amNtaGUxRWIrTWxXUzJWR2NObVQ2ZWlkZGdtNEp3RTUxak0r?=
 =?utf-8?B?c1I4ZTlpK3YybHE0cll1TEJsbTdrTE1ubGl4eUJ1a2dNV1RFSlZtSUZVQWxl?=
 =?utf-8?B?bVY0WHlXNHYzaDBOUFNXZWxJQXZKa1VrVnZyT3l4aFRNc2Yya2V2Skp4VW5R?=
 =?utf-8?B?WWs2eUJWMHlPMDJXTlllMzRmYnkxYzMxclgvZlAzSHJUdmhkWGVReWErVUla?=
 =?utf-8?B?YlFwZjVramZHS2JKejVFczRrRXFDVno4azZ6TUJmNjVIY0RNQTJOTERJVWVh?=
 =?utf-8?B?WHJWYU9HbThjTzlRcTZFVnZ6NFJ1QU91OU1sS1RZVmdSb2JKUEFEMWJoQ1dr?=
 =?utf-8?B?dnVHUTFaclpUL3hka1BFT2QxOU1aU00zZ0RzWTNHeVlvWDZoUmdxV1dTRS9P?=
 =?utf-8?B?a2VIdGNSNXJCSFk0dG9BeXVtbkZydng0VkoxcXRkRXFvVG5VOUg1UTRCTy91?=
 =?utf-8?B?Z3k0emhNTS9oL3R6M0FLZGlSRm5LRWxMNjlyT3FaUXVQNzV3My91TFBZTXAv?=
 =?utf-8?B?cmU3TmtOZTFUWkVQZ1hsWWtORVRLcmhSMC9CR1k2dituUm5KZHNXZy9xekN3?=
 =?utf-8?B?N25yYmZwZmJJRzN0eU5nZlBqZDM4V1JCWlpxaDN2bDVYaHR4blhOckN6U1FT?=
 =?utf-8?B?SllUTzFtRlVsaElYK2dyNTdyZUhxcTFzbVFyTktneUlCR0Q0Y1FlbkxzenIr?=
 =?utf-8?B?cWNBUTNVc3NqZVZ4dHlNWWxYRDZ5Yk9Pa2hXekRnZUphbnlJdFo4b1BIaFh3?=
 =?utf-8?B?NnlrTGViY0h3MDFvT1FyOE1wN2lVT29LMjBHZmkwTnpDeVoxWEhGYWN6Nlo3?=
 =?utf-8?B?NWRSYTcrM0xLTytiYmVGcmhoNGhIaW9lbHFJclZGYkVGS1kvZ1U4NmdZWDdZ?=
 =?utf-8?B?bGZzZ3lxYURVZ25PcDJFTWh0Q0dHOHdqTWpaak1pL1VMNk9jWkRzeUJoZ1Rv?=
 =?utf-8?B?U2dxRG5QTGNUcEdpUHhSME9YdmQrSkdNajFGanJXSUkrM0k1RlhTaGJxY0Na?=
 =?utf-8?B?T3R6aFdUUXJtWGtMZVhqOGZTanlWWkNjM2pXelBTbXJUL2lLdENqY3JOZFhM?=
 =?utf-8?B?cktKWmhKSkxzTnB0RGtjN1llU0xCYUt2bmJpcTZCV2pZci93a1dzdllVbUN1?=
 =?utf-8?B?aC9YRVppMVdKeUdvMmt6SzZ3MXpTcXd3UnRrcFJZYW1NcDFFcnF2MVVtV3Rt?=
 =?utf-8?B?UHdhUHVlM3VOUkVkd2tvRCtoWUlpd08rT05LL3ZCeis0UlFHdE9xQm5ZUndp?=
 =?utf-8?B?bmZaL1ROUGV2ZEpiNkM2UmYyc3R1RVNPVzA0V01lWWRCTWtxK0xDUW5QdWcr?=
 =?utf-8?B?cm1HTFd3aVA4SmdKdWI0d2F6Yzh4MlFOQVZ2OGpnTFFaV09qY2hvWUNaYVFS?=
 =?utf-8?B?VDI3aFY5VTIyZStUa3UyR2l4Wkg3NVlZM3VjY0JVZFpPdWhpZlJhdUlBSkRM?=
 =?utf-8?B?RFpXSVA5RVB6ZmN2RTcvWFJmOXNnbWVmVm1EL1dYZkkzVm5aVUpqUjM4NnRZ?=
 =?utf-8?B?elJmTWRib0xSQjJvUkt1ZlhlMkJjTUZjY3BISVEvcld0U1JXR0RaOG1LR3Vl?=
 =?utf-8?B?UWhwSkFMNmtXZ1ExSDd4YnNnb1BhdkRSVGlzUEFUZUxIbzFWQ0xkTFNNbHls?=
 =?utf-8?B?NFNTZ3FaQ2d1WTVzY2MzdDBCalVGSDZYQmhjWVpyQURCQXRUYVpMTHNXTEhW?=
 =?utf-8?B?V1RJclpJc0xEN3h5U2tabXRMUWVQVkFELzhGdzJTTXFPc05TMkRjZHl6Wmsy?=
 =?utf-8?Q?42CzYu3+UwbKx/zi369ztGHvAEwrLTaoKbs20Qx4jpD5Y?=
x-ms-exchange-antispam-messagedata-1: 
 Fk1UXFhsKLczouILvgVtzQ/k+6uBtaEPQBd5IYqLLn0v3UwNsy7HniU/
Content-Type: text/plain; charset="utf-8"
Content-ID: <3BD28765B5873A419D2F4D75BCEA8343@DEUP281.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: iris-sensing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FRSP281MB5825.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e8c3c29-97a1-45fc-8eba-08de3e41e791
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2025 14:29:51.1133
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 963f3913-ffae-43fd-856b-2dfd3f6604e3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sQrVcOLF+/MEeB4GsPLh9HfqiDJIulUqUv62EEhUbTGSTc4kg893zIoN1KdaEahIL1xddvJDqn+D+IVUakmD6U6qzjlc5iV0iScYwC0vkPtfJKO3JezhHV+KTkbVDN3v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEYP281MB4007
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 14:30:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228126

QW0gRG9ubmVyc3RhZywgZGVtIDE4LjEyLjIwMjUgdW0gMTA6MzIgKzAwMDAgc2NocmllYiBGcmVp
aG9mZXIsIEFkcmlhbjoNCj4gDQo+IE9uIFR1ZSwgMjAyNS0xMi0xNiBhdCAxNjoxOCArMDAwMCwg
RXJpayBTY2h1bWFjaGVyIHZpYQ0KPiBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiA+
IFtZb3UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20NCj4gPiBlcmlrLnNjaHVtYWNoZXI9aXJp
cy1zZW5zaW5nLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnLiBMZWFybiB3aHkNCj4gPiB0aGlz
IGlzIGltcG9ydGFudCBhdCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmlj
YXRpb24gXQ0KPiA+IA0KPiA+IFRoZSBzY3JpcHRzIG9mIHRoZSBmcmFtZXdvcmsgYmFzZSBwYWNr
YWdlIGFuZCB0aGUgcm9vdGZzIG1vZHVsZQ0KPiA+IHNjcmlwdCwNCj4gPiBib3RoIGRlcGVuZCBv
biB0aGUgbW91bnRwb2ludCBjb21tYW5kIGJlaW5nIGF2YWlsYWJsZSwgd2hpY2ggd2FzDQo+ID4g
cHJldmlvdXNseSBub3QgdGhlIGNhc2UuIFRoaXMgbGVkIHRvIGJvb3QgZmFpbHVyZXMgd2hlbiB0
cnlpbmcgdG8NCj4gPiBib290DQo+ID4gYW55IHJvb3RmcyB3aXRoIHRoZSBjb3JlLWltYWdlLWlu
aXRyYW1mcy1ib290IGluaXRyZDoNCj4gPiANCj4gPiAvaW5pdDogZXZhbDogbGluZSAxNjogbW91
bnRwb2ludDogbm90IGZvdW5kDQo+ID4gDQo+ID4gVGhpcyBjaGFuZ2UgYWRkcyB0aGUgY29ycmVj
dCBSREVQRU5EUyB0byB0aGUgYmFzZS1wYWNrYWdlIGFuZCB0aGUNCj4gPiByb290ZnMgbW9kdWxl
Lg0KPiANCj4gVGhlcmUgYXJlIHByb2JhYmx5IHR3byB3YXlzIHRvIHNvbHZlIHRoaXMgaXNzdWU6
DQo+IC0gQ29uZmlndXJlIGJ1c3lib3ggdG8gcHJvdmlkZSB0aGUgbW91bnRwb2ludCB1dGlsaXR5
DQo+IC0gQWRkIHRoZSBSREVQRU5EUyBvbiB1dGlsLWxpbnV4DQo+IA0KPiBTaW5jZSB0aGUgZGVm
YXVsdCBjb25maWd1cmF0aW9uIG9mIGJ1c3lib3ggaGFzIG1vdW50cG9pbnQgYnVpbHQtaW4sIEkn
bQ0KPiB3b25kZXJpbmcgd2hhdCBraW5kIG9mIHNldHVwIGxlYWRzIHRvIHRoaXMgaXNzdWUuDQo+
IFdvdWxkIGl0IGJlIHBvc3NpYmxlIG9yIGV2ZW4gYmV0dGVyIHRvIGp1c3QgdXNlIHRoZSBidXN5
Ym94DQo+IGltcGxlbWVudGF0aW9uIGFsc28gaW4geW91ciBzZXR1cD8NCj4gDQoNCkhpIEFkcmlh
biwNCg0KdGhhbmsgeW91IGZvciBwb2ludGluZyBtZSB0b3dhcmRzIGJ1c3lib3guIFRoYXQgd2Fz
IHRoZSBhY3R1YWwgcHJvYmxlbQ0Kd2l0aCBteSBzZXR1cHM6DQoNClRoZSBmaXJzdCBzZXR1cCB3
YXMgYSBzY2FydGhnYXAgYnVpbGQgd2l0aCBjdXN0b20gbGF5ZXJzIC8gY3VzdG9tDQpkaXN0cm8g
YmFzZWQgb24gcG9reSB3aGljaCB1c2VzIGEgY3VzdG9tIGRlZmNvbmZpZyBmb3IgYnVzeWJveC4g
VGhlDQpDT05GSUdfTU9VTlRQT0lOVCB3YXMgbWlzc2luZyB0aGVyZS4NCg0KVGhlbiBJIHRyaWVk
IHRvIHJlcHJvZHVjZSB0aGUgYmVoYXZpb3Igd2l0aCBhIHNlY29uZCBzZXR1cCB3aGljaCB3YXMg
YQ0KY2xlYW4gcHVsbCBvZiB0aGUgcG9reSByZXBvLiBBbmQgdG8gc3BlZWQgdXAgYnVpbGRpbmcg
SSB1c2VkIHBva3ktdGlueQ0KYXMgZGlzdHJvLiBBbmQgaXQgdHVybnMgb3V0LCBwb2t5LXRpbnkg
YWxzbyBwdWxscyBpbiBhIGN1c3RvbSBidXN5Ym94DQpjb25maWcgd2l0aCBDT05GSUdfTU9VTlRQ
T0lOVCBtaXNzaW5nLg0KDQpSaWdodCBub3cgSSB0ZXN0ZWQgaXQgYWdhaW4gd2l0aCBhIGNsZWFu
IHNldHVwIG9mIG9wZW5lbWJlZGRlZC1jb3JlICsNCmJpdGJha2UuIFRoZXJlLCBDT05GSUdfTU9V
TlRQT0lOVCB3YXMgc2V0IGFuZCB0aGUgaW5pdHJhbWZzIGluY2x1ZGVkDQp0aGUgbW91bnRwb2lu
dCBjb21tYW5kIChsaW5rZWQgdG8gYnVzeWJveCkNCg0KQmFzZWQgb24gdGhhdCwgcGxlYXNlIGln
bm9yZSBteSBwYXRjaCENCg0KQnV0IEkgaGF2ZSBhIGZvbGxvdy11cCBxdWVzdGlvbjoNCklzIHRo
ZXJlIGFueSB3YXkgdG8gY2F0Y2ggc3VjaCBhIG1pc2NvbmZpZ3VyYXRpb24/IENhbiB3ZSBkZXBl
bmQgb24gYQ0KdmlydHVhbCBwYWNrYWdlIGxpa2UgYnVzeWJveC1tb3VudHBvaW50IHRoYXQgaXMg
b25seSBhdmFpbGFibGUgaWYgdGhlDQpkZWZjb25maWcgaXMgc2V0IGFjY29yZGluZ2x5Pw0KDQpS
ZWdhcmRzLA0KRXJpaw0K

