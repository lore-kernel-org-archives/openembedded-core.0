Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F81C5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 15:17:55 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44958.1786115871594600443
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2026 08:17:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=crbLY1SA;
 spf=pass (domain: siemens.com, ip: 52.101.66.19, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W6hnigBirnMyUaMCZuEew1LKDbbcUP0k9b1pnO1UR6CY92g+XSRgMOKJLZd0P4SLagL/Hb4ZhcfS3teuyKDXohl3uOk8suTwhX8lZriLz51GtSe1spJK6yOUmibxNL84KU2PsjbXB4jV08gBlijH9ptPTR0iB6yxLoZzoC86SnkCV2yJQR582Iaixuxrv/iGFWqO/374qXwO8vfdiGq2RW8ToRMdiEjJkCEkMT1X31fm9kQ+tMJZq7XHSYo8oSl7cWOki2ACmjEEf0rPGyJcEu2DNBcotus+EdWCNo0p1KoGdf4c7Wyla3wNpwPJC5/xRb/p62iu9jXuHqM2xby/hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IHE4NIrLFLR1EQludD+AEeAo3gDQrVIYLbi4OHMZ2Wk=;
 b=t9Po+M4n83Cxi3kDzYmhR8LhUkz1qxiD7Z632ic30mp1EjVhRows8lI+pGzIfZnZCw+lqGVUIL2bkype+mRzlaZIa4IUeko6moVUiGDgrNngemvYsCccwxqhSEmjWIF0d2NiMRGk/5jvSyw/jpltsqKVEHTj5YeHsjdmdjhvklaeSHp4GMt7pT7f5FEoKJrNpOj3M99VJykpwN30Q/UkkWwvQfzF/15YKUXbVyS/MfPxnSX4HeIaSwDxXUTsLFhhQHYXuVgo/M8b02MiRRqHRLxjQUch6hfsKAu8RyFW2e6FIZ4CRXq2JgsLbtmxF6yHTor280L1u+DB1xtMXG+qqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IHE4NIrLFLR1EQludD+AEeAo3gDQrVIYLbi4OHMZ2Wk=;
 b=crbLY1SAW3P6x90lIG0Tc/eKgj4I+qyGTFgPmn3e6ihra1SF9rnMRDg9HcmuOIrj0EAPS389XAWYox/7zG62ndrpzNLQsyz7+zliJm7/15+sdyeJUimaxqvRYBWwjC/7vU3jR0qlL1SzXSEVhrWqnLIbinUYpQCj/P04boQq9lNOQ9AHMF3Xd9td4E8fkUJaUuT0O428to0aSrsgqdERx+PeNvQnayGVTTxiYXNRrfoLNCkqOy9BuFSNfTUa9dVxJ4E2/vLDE71vG85/19dbVgaZ8kFFs5EyuMAPi3n5nae4FXWQ+QiMxhvoTMUvkTE5Ghn9iWUPfXhcPU8/4lYbIg==
Received: from AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:14e::19)
 by VI0PR10MB8693.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:23a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 15:17:46 +0000
Received: from AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7576:68aa:ea32:323f]) by AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7576:68aa:ea32:323f%5]) with mapi id 15.21.0292.019; Fri, 7 Aug 2026
 15:17:46 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 13/14] oe-selftest: devtool ide-sdk: add
 clang/LLDB test
Thread-Topic: [OE-core] [PATCH v2 13/14] oe-selftest: devtool ide-sdk: add
 clang/LLDB test
Thread-Index: AQHdJAj5oE1c2uQ7KkuPxmqJkJLyHLaSthwAgAABnYA=
Date: Fri, 7 Aug 2026 15:17:46 +0000
Message-ID: <08283607bf7d58c11af1c20c84e553c62150f511.camel@siemens.com>
References: <20260804120034.378787-1-adrian.freihofer@siemens.com>
	 <20260804120034.378787-14-adrian.freihofer@siemens.com>
	 <DKIT3XLETTWD.4QS3K7M6HPXE@bootlin.com>
In-Reply-To: <DKIT3XLETTWD.4QS3K7M6HPXE@bootlin.com>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR10MB3745:EE_|VI0PR10MB8693:EE_
x-ms-office365-filtering-correlation-id: 5cc58ee4-714a-4073-961c-08def49708fc
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|56012099006|22082099003|18002099003|55112099003|4143699003|38070700021|10067099003|11063799006;
x-microsoft-antispam-message-info: 
 qOX5k/FzrwJ9b4gHyiLvXtA+vqIWhmwxdCaAKDpns9OFt2AxmAPZE04IPwSfI8CWG3sL7Qk/5jR/oxbrzv298FaBSRYYcBT+xaOH0ND75vrPYtpOGbiYtPac/It2fDujfk4NTBmbmOvy+7VUSYfU3zGaevOl1oOyVdFa0ND5/czzuTf8h35gd2dMZllOmlK+ICaBDodGu7vEfcX2R+px+3U80/1AGpG82TifVAZWkU8pUbWZiRNrT7me4jmg7uCLWeJk7vp0d5vTW4ucn6dJinGO/19nK4At+AVX8vjIWDpCQCO68lpT0C9XbKEcw/vgBonkj2TnWMnxKGIsSrgfjkE+ChVNeH4IyYtrPD5EXvWvlc/TxW4QYx0F65MD3FBI8T5rcSsP01vNgRwYqcNeZwbrVIFqsMkkvpZtlhdBo1p8L67wA8sJoS7ZNGo/Z+sQuyfxFuOLTfIJGl6jCzhVgbi3rO0FanXHjKPcf1t6H8UQwf6hfyGRZkQ7+92qeP1l80TLEuTuvltqZ2a+oHly/66rH8mubAgqfkpSasSicFKvXYXAo7dSgNLwI4Mq2YU0pXujkcNiI9vvCbaUDTMselDCSrgBupJya1WCVpMMr1UrFM6DrkwyDoSkTU76bahCbHu1g+nJVGOxUqCxhD+4fm2yegdLuJ2252kb8XKNb8zJJ2v4HQ3uXiGDt8/DxM1c8GaNw4/mf63+oWYpOlKGQjO53a0Qn5Swl2oFILMXFJ4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(56012099006)(22082099003)(18002099003)(55112099003)(4143699003)(38070700021)(10067099003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QWJ1SFNMMGxLOVhteEY0YS96QTVlTFJTK1NYZ2lJVDFod256MVlJYjFsaVdz?=
 =?utf-8?B?ZXpSN0tDN3hyUXdVNmIxWjRuQ2x2OWVuUm42RE1KemtMOFFETFVCZG95WXB2?=
 =?utf-8?B?N2x5ZXI1bXJwOFYrVzZjTGtlWWVlWWpBWTMzc0NBTVpUeUFyeWdCdW1hM1Vz?=
 =?utf-8?B?T3RKb3pjZVMxTnh1T0FKd0ZkWEtWMWNVeEdLR25iUk5ldWl1NmIzQnpFRFJt?=
 =?utf-8?B?aTE3eUJ6WWJSWXRzWGZLNEFrbUg0RlJubmpkUm10QnRtVFVRMGhBRys5V201?=
 =?utf-8?B?N0R4dmtwaWViVmdBTC9pWlI0ZjNHRFYxcWVUTFk1dTlONk9PM1FpYUNQcjM1?=
 =?utf-8?B?Z2E0NDZQZ2dZdmpPUXF1bC8rSVZXNUMzb0hKS3g3S2NVay91WW5oMHJ0WXdT?=
 =?utf-8?B?S2dTUTQzZFBhRDZ6clZya3E3L3pVSHdqU2lsNld3ZXVCbHZQUXg5US9RQ1hY?=
 =?utf-8?B?ckRRVXQ1VS9vL3lPZ2wrcWEyQ1FuNElVSFR5ZVI3VzFvWDViU0h5dTJFRHM1?=
 =?utf-8?B?RHdORXg0QlZSMnROQ2hJNWRHZnNzV2RiTWFBeEJlU3ZBRW9zQWZDMmt1SU1H?=
 =?utf-8?B?QlpSbW5nUDBUUVZySFQxS2tGTUI2UHIvZndHUThMN2ppZVFEV2lUU25TcG9o?=
 =?utf-8?B?Z051VG1oaXhCaDhZRDJSWGp2aXpXM3U4NVduR3NHaC96UGNjbEdOZU9RdTJM?=
 =?utf-8?B?bm05Smg0eWFEUHhXUXcvRnhHMDBOWkIxejFXQ29IMVRXRytFR1dXcDFtSmkr?=
 =?utf-8?B?S25jTERlS21FUURoTHJTYkpBK050T1BHMFZJdWJTRkp3bUVkMDl1MGQwcXNV?=
 =?utf-8?B?NC9mclV1VnBYek5TY3ZaajZycEhsejRrbjZ1SnN2ekhXQXUra2c5VElUSm1M?=
 =?utf-8?B?SFhxMTcwSlJ1bXZxeUpyRjhwMUtPZTQ1R1JRZlpNc3dJSzVEaVFpV1JETDBW?=
 =?utf-8?B?ODE1NEJaWUl2NnlXUHBsYVRtK2FKOEZWNVhCMmhqejFZUHlLclo2Vmp3bVZQ?=
 =?utf-8?B?bmU2UnFwUmlqODh3UEZ0ZGVBY3UxOWxTemgxQ0QvRElUQVJMOFhDR3RJWkZv?=
 =?utf-8?B?SHhHSUNndzh5cGdiSWRiQ3orQlV1RTQvU1k1NFhYWURtampaRmU1YWhwb2lB?=
 =?utf-8?B?VmVYa0NxTE0wZVhUWmVwa2N3dFVuT0I0SENZakVMZ1hrSGFBcUwwb2w4MGdq?=
 =?utf-8?B?NGhKREVaWktLMW5OWFhVMnNpT1ZqbmVnTzVmeU5pSEVteHZsQW1pVU5BcTZF?=
 =?utf-8?B?cWxsWWhPamVCRG5Bbk83SkJxWGF3TnNqek04aW1kc0FjdVBoOXBNcTRFSzg1?=
 =?utf-8?B?dTgrVGV0UzhtM2grcjVvbitNMGJHQmFYR0I0TTJkNjRvSzgyaGpyNWxsV2FC?=
 =?utf-8?B?OXdtRldxbytuSTh6TWZSRU02YzNlN2Z1Mmh0blZTZHpnQ0htY1B6amJVYzFp?=
 =?utf-8?B?cFNYTEg2d0V2VXphMnhDa04xSEtRVmYxYzNhem83WFpsWWozT2drcFNva1Bp?=
 =?utf-8?B?a1NyMEduYzd6alVDZjB2ZlFTSzRqVjR2RCs5d0dHK1JGcXVDVGpraVFrcDk5?=
 =?utf-8?B?bk1JVU9JaHA5V3BqS0FkS204Zm01YU5jKzV3bTVZdWNNbHhMZk1iM3E4Z0FM?=
 =?utf-8?B?UXV6M3F1dFZtRnZnTUQ5b0prM2pubDkrVHhWWXQwalhVd2wwbFhtZkQxa3RY?=
 =?utf-8?B?NExBeU55SVByMmt4MHpYcmxsdGlZZWU5REhZL1ZoNnpiS1BBZS9rcGd5WHhz?=
 =?utf-8?B?elJqZUgzRVlOZk8wdjYxVC9ZSHRLaElQOUJ5L0lXYTdvc3pCUnlXMGZTREE2?=
 =?utf-8?B?MzUzNVYwa2Z1VFpKUkt0dHF2OEZqSnFLZys3WWxhRllSUWU1MTR6aStIMWU4?=
 =?utf-8?B?dWNJbC9FVUl2ZmpiTlR3dXA1YktCUExwS1VsR0w2TUp2SzJGaG5JZnloM3ho?=
 =?utf-8?B?Z3Z3ZU4vdElTOXord3hrOHJRTHhJdkhqYWVHcmNhTTh3aFJuRUNldHc1ek5h?=
 =?utf-8?B?QXNlOUFPK3JTYk9iOEZvaFppRmxBWkRpUC9xMyt1eURGK2Uyb3NIUWV4aDZY?=
 =?utf-8?B?a09iZndxK2VrMXB5cUxETG1nUjRwZWtsWCt6L2FqaXpSdUdVWHkrSGNPSEJK?=
 =?utf-8?B?SHBPL0xhb1BLUE0xNkRNc2dGMFJTeFVrZE9GWmNpeXdGUWJUU3JHQUhyRlRy?=
 =?utf-8?B?Ujl2bjdha1FjOU5TMjJuOHJXd2k3QUJDNXcyZzUzdWw4R0JUUkVFNnI4NjVS?=
 =?utf-8?B?TU44NHFTZUNxTEt6aTZja1gwVVFFNEtRS3k4T2NOOVhBMDg4OWhFSURFSDJp?=
 =?utf-8?B?dmdpcUl3VW1QTnVUU25KbGlWTnhpMzg1TjJrVTREM0RYRE42L2hxZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD961F5DBFE278488E9CE06AE3FD46A7@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc58ee4-714a-4073-961c-08def49708fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2026 15:17:46.0614
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uC5+dolQihZSg507UqVej7rWZk1CXaWNBuhAz7WwgK+xq/UJRueOz9ebFMHTMxhMAJ+NJi9tcjVpWkJZotMsJtatxDdpGhOzlW47mAQZMDo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8693
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 15:17:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243015

CkhpIE1hdGhpZXUKCkkgaG9wZSB0aGlzIHdpbGwgZml4IGl0OgpodHRwczovL2xpc3RzLm9wZW5l
bWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzI0Mjk5NQoKUmVnYXJkcywK
QWRyaWFuCg==

