Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 972C7C3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 05:55:59 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.56])
 by mx.groups.io with SMTP id smtpd.web10.14313.1747720549702255879
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 22:55:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=ga7Y439e;
 spf=pass (domain: siemens.com, ip: 40.107.20.56, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HH12+tC9Dl9RIAafKWIwO/ODfXsOmHb4U3UXRhYOHWP1TN9PYMNHbGgfHdweb0Qn6a+ucrqRF7R7T6LJq5xy6zs+92CgAayiohmlaxvIJySHQUr0hGS5ciHodITyPoK2jzCjMRRSyhJ5dIMLaUabXZoQlR026le6HWRHTCDQbUwXHA/inmhPIzYXjLADIEBJik7+X434cVHGmeQNvcazUJ2DI/ZTqWhMc/D8p1FGv2Bm7fIywSm4m2qKIJ+d6ilmS6l8NZaoliNTEJAZ5Ugqan8CXR5RLayVtd2JsVslN9rJ20Kdp+qu1asy5KncK1YueQetOauMugQoa/wyaxcWrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HI4O+Ye2bI3Mc+/PXBvod/T06+hC7Ro284VwDw9E+a4=;
 b=WTOvz0jh6qahVPI2JsHGVbU/f0EOrOUCx6BqbtzRhF2DuET7l9TnkZY2vmafdMIkJJWrFQ2Uy1XyZMvRWVx684ULWjmdRGkYg6JvKCh1JOABbqn6XPJ7wQXE+kqjmnqNfn8p5Q/H8lHqMcpsUe6PDJ7JFfccyuNgvwpr7m6U3FUIdh4tn/mKXOfZE9z60tyQAhX0YWOTjESG/Bd2ECUQFPi4Qi7goFprB+IcN9QwG1ZexYrEShVFqOBT7I+SPCpXQWSD2qZhjIgyEQfpvhAFMAbKuSKcMdSgL6sn83mv6rC7m6Ns6cycSEQ9sWIZanhMJUVwm+HQzaHz90iCdQMBtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HI4O+Ye2bI3Mc+/PXBvod/T06+hC7Ro284VwDw9E+a4=;
 b=ga7Y439e5gxxkGYznhSzZOjTPSs3Q7m8wLcrti2yKo6FLQ9SztaOcSBi4ip+xs5rFOOMUwn95sICdpdCscmQ/hpRnDH8keZRN2jGWTQPlaYr+ZCajgVxh+PNDOlHw3oL8XJbgGWf/dyJ4VXfy0t766sJsYMdr7W51MwG8cAPtsCeenwEqRulBRRaoSKXIXAhYrotTBxxgU0Ok/TO4f92JhKcgQspcuX2XGIa6c/LK2XC7kb7KuHDA7EvxUvecVHIJzxJDYWyAvj2NLDntQPvooZ/gQ7CjUx7hwSGpT7LqY9d4963UjPY60IiJXdbyrKm9BTzpdhmfb9nJ1rPnMXWXw==
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13e::17)
 by DB4PR10MB6143.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:389::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 05:55:46 +0000
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda]) by DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda%5]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 05:55:46 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: Marco Felsch <m.felsch@pengutronix.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "marex@denx.de" <marex@denx.de>
Subject: Re: [PATCH v4 03/16] kernel-signing-keys-native: refactor key
 generation into a new recipe
Thread-Topic: [PATCH v4 03/16] kernel-signing-keys-native: refactor key
 generation into a new recipe
Thread-Index: AQHbyK5qCX1QypTcdU6Kkmlncjr7/7PaVd0AgACwbAA=
Date: Tue, 20 May 2025 05:55:46 +0000
Message-ID: <44c5c8ad1022357f7064d685a275982ec62fc783.camel@siemens.com>
References: <20250519110838.82978-1-adrian.freihofer@siemens.com>
	 <20250519110838.82978-4-adrian.freihofer@siemens.com>
	 <20250519192418.64tqckzic37h75fj@pengutronix.de>
In-Reply-To: <20250519192418.64tqckzic37h75fj@pengutronix.de>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3529:EE_|DB4PR10MB6143:EE_
x-ms-office365-filtering-correlation-id: a163efec-1d46-40a5-0904-08dd9762f72c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?VVlKbytnWXFJeFpRY2FQUHZmcVZHV056S0d3RkRnbFlySmlYT0ZWM3J3NWZw?=
 =?utf-8?B?bnl6STNQUTlma1c3ZStic2hONUNNblZHR3lEeEdQaUd3akRNeUtFRkdjNnd2?=
 =?utf-8?B?OUtmaldtYXMwQm4rR29kZUk4NFB6RVF4WUw0ckZrajBxMzgxZnIyd3NwUkI5?=
 =?utf-8?B?b1dOWDFIS2k3V1FpazBNMTRNQ01WSVhsZVRYTFRuT1I2dXZrS0tZTG5laEln?=
 =?utf-8?B?T2NGK2V4YnZTa01Fb3c3ZENZQTlVOSs5ZTN5endkcVJlM2h3YTFMbU1MWTFL?=
 =?utf-8?B?WUpIaS9sZ1pBUSs3YWpoby96NlN6ZFdnUWtGcTVNcGdPempjYyt6bFFkWVN6?=
 =?utf-8?B?bkk3K0VwZUNLRzkveEZSTGdCbDNXR3J4Y2k5OCt1dythaDJLRlVmZHN0U3dr?=
 =?utf-8?B?MzRid1V3aXZEd2IzaVVBMmR5Z3lITWR1RDMxek9SWURDTEc5dllLUWhqMEdZ?=
 =?utf-8?B?bzdFQk8ycm1zS3BZVzFZWTRzTTBhMkdiUFhyU2ZzcmFnV0tCS2MrL0lnSkdy?=
 =?utf-8?B?dU1XTUxEbHZ5Y05uRlc5elo3aWtZL09IWGQ0dFpZSWFIczlXdkkwQ1kyODly?=
 =?utf-8?B?UU9XNTFoL2FydkpNeG5udWFZc3J1MFg1L1NsMU1hdlljUEg1b3A1cVdOQ1di?=
 =?utf-8?B?dXNhRzBCWmg5NXN4bFo1UENhY2NFM1BBdUp5a0s2WE54ZnkrTS9vb1c0SEEv?=
 =?utf-8?B?OVRqa1U4MWR4YlpmczBWNkRBWlhaTUdrb3c2ckNvZFRsbXNTRVlyMkRUSkdh?=
 =?utf-8?B?bGVNM2RyazN0ampsZ3V2YnkvK25JYjh2U29zNkdGcDUrVDkrUkVmMWRNVVRL?=
 =?utf-8?B?RmRJbTFOenJ1QUI2VHpPN0FXTE0rSGJKZS93VFVscTJBbys5eXhuT2pSNFJR?=
 =?utf-8?B?ekZIK1FMMmZIZ0Z0WjhOazg1cEV4K3hMdnUzMHhTUDRPYURPSXhnUTVzTks2?=
 =?utf-8?B?ZFJWNGNnTi9Ld1RKc012b1doSmN1dnM2WWFUSW4zVHN6bktVM1orbTVac1Ry?=
 =?utf-8?B?Z2w3Vk9TTnBTeTBwb2FQRkIraEduVFM0eHMxck1NaEFXcjlWVEJxb3FLdWlp?=
 =?utf-8?B?Qm5FeThTZmo5TXljNGdOd0Q4SWhwU2hzVmtYaU9ZY1B5TFVKcFVXYkRuSkxE?=
 =?utf-8?B?L1ZCWjVUY2VDRWM2N0ZXWWlwL0o3NnVieitVSmxkc3FlZmQ3WU5QTExvSnph?=
 =?utf-8?B?Qm1DdUo2WjlrekFzU0FJeVFpSXZsZW1OS3ovMWJnelA5MmVENkdOVEtLWDNN?=
 =?utf-8?B?NitUM0FScjFLcmMxS0NaS2F1UWx3S2ZEUjJUQjRmd3VwOXpRK0ZlRVpLWjFM?=
 =?utf-8?B?dy91bUdReWlkemNzcHZnZEZhcWRkWWVnUlZZSFZCRkk5TzAvdUpZNDgwQ2hG?=
 =?utf-8?B?VmU0anBIa3VldkRjV2d3Z2NURWRJVWljSGk5cWF1RU03d1dVTFNNK2I5K2JO?=
 =?utf-8?B?UVhFOVp4dTR0SzRHRndVQStzbUk2bVNtdHJqT1FjWFh0cW5UaUdJU3BHN0Er?=
 =?utf-8?B?VkFxR3kyUlZmdmpxUStiK0JucmtsT1dQTHAraGRTamVYSDZoZFpPSDlyei9U?=
 =?utf-8?B?WmRBL1VzTmFERXZ5a3hreVkzL0t5T3JnRVBQd2thTFVXbXRRVnc4ZHNEcGcw?=
 =?utf-8?B?ZjV0UlYwZ1FWOU9uS0ZKVmdiQTJZTmpIQzRQWHloZjNWcmRGazlETXljWkNC?=
 =?utf-8?B?OGN0V01QM2dHODB3b3VNWHZZNkwvMDlDM3hpelZsaVhyallrTmQzR2ZZazRs?=
 =?utf-8?B?aEY5bFMwRkV6c1RzYVBMayt3YW5RRDVvV3hTZm1vN0x5ZUMwS1doZzBpajF5?=
 =?utf-8?B?ZU9XSGhUM29FcDl6MGQ2SGRNVHVETXdBSlNJMHdLaDBJRDQzeTRXWXFCZ1lJ?=
 =?utf-8?B?cjZZdTdVMHBTR3ZJTFJKNCs3N1J0OUVQc0FLcm5FcFpYcWNXOW1Ycm9uQ29S?=
 =?utf-8?B?czlxTVp0dy9aVEt3eFB1ZTNYNDFOYlRkWVJxa3N3QTIrR2pUYzhIcTFsUXdY?=
 =?utf-8?B?OTNCY285R0l3PT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Y3RsdCtHWEdTUkhFQWdWQVU3Tk1YTHl4MzJKdGg4S0hoampTTTlQQUFRMlZm?=
 =?utf-8?B?aVcxYkh1eGFHaWloanFSdHAxUXI2cHEzcVhqTE1qS043REVURkE2c3NBOXFr?=
 =?utf-8?B?L0NQRlVPa2VNL2JyZHRrZGluZUJFaHJ5WVlTS2VnU0oydnUwMFBuS2twckZJ?=
 =?utf-8?B?aHA1WjV0RFRzRFVEVEJzdytMU1JoK3d1TXRqcVFodGxSaFFmQys5a05haW9y?=
 =?utf-8?B?Qnlha2dYeXdFMWxrM3B4a2lFZi9ZdzVoSjdjd0wwTTk5bkVZTFIrWUgyMC9H?=
 =?utf-8?B?TzF5L3NYMy95VXpmeGUwRlhFSjYyam04dkx4UEtpd2g2MFhGMENwbmttOE5S?=
 =?utf-8?B?emdpaVBWVlVMZnJIYzA2TjBiQnpJV1FVUllBV1FLV2FzZ0kvSmJEcStOb0dS?=
 =?utf-8?B?aE9FQ1Z1NURUeHVWSG9nT25MS0xZVXhMN2RnU2FFeStZaGZIdWk1NWgySVY0?=
 =?utf-8?B?UEgxL1BQSGhRSEtlTndOYXR3WkZMelpSMUFUeW51VUxONW16ZmxkR3VjZWR1?=
 =?utf-8?B?a3BrRWI0WFVPekJscU1CNmVFekI5UHhWbHIxWjlJZTVQckoyMldST0VWTkhq?=
 =?utf-8?B?VERnZzNRMlJYd2R6ajhQRWNOUlcvK2d0T1FmR3IxcmlLNzZ3bTVNaTRCL1E2?=
 =?utf-8?B?VjkvSVhwc2t2ZlpHL3NMd2FyTUtxUGczbUhpSVkzSFR3UWs3QVJvY2NuNzda?=
 =?utf-8?B?eWdDbEdkcGFWSHpWSlZuVEtKZ1pXOXFLQzFOWXQ3Yk0waWRhTkc1aHM0V1Ew?=
 =?utf-8?B?NTJkRmJ4b0hrQzRWL21od3RJK1BWajU4dWV1Q2FKcklxMkFoYTRVVXp4M05S?=
 =?utf-8?B?K3RzVDRWTWYycGRWOWFlamV4TzhUTXVNNGNwSGN0VGw4ZmxnM2ljeGhBTTFn?=
 =?utf-8?B?ZTRjS3RHeVYzZ2xVVWFyUU5QZkJkcGVkQUhwcjdNZW5kMmJhK2RZZkNTY20v?=
 =?utf-8?B?SzZWQWlPV0NMWk4ycU5hU1lBVlhMMGR5YmZYMHA1UjR4NzhQWWd0cndOZVVp?=
 =?utf-8?B?Wm1mZ08vOW5wNzVGamFpdkVFVVFVMmVNTGhpL0JPd0ZiWEZCOFpTNDJpN3ZC?=
 =?utf-8?B?ckg5c2RXOElFL0FBbHRXbitVRFh5R0p1cXBhenF2a1ZaWm91eEtaZHljY0NZ?=
 =?utf-8?B?QlRpTE1pSDFlaDNqajhDbk9vVC8wUmtzWjRieGwvQkVNRW9IQ1RtRmdNRHE5?=
 =?utf-8?B?VFl4WEJZK2pJZlcxQmZMQkU1MDRpR0tucnYxNzNtOTJodStFUXN2T2p3TFVR?=
 =?utf-8?B?T2NkZUFUY210dEMreVBxSGVvWTNwQ2hZS0d2WDEvTW1PZzBaVkFOSWhlOVV4?=
 =?utf-8?B?YWtISHpXSTc4T2tDemVkNmZ2aEc3ektXNUZQTnNDMlhpQksxMVMvTUI3eERy?=
 =?utf-8?B?TUliZlRramFHLzFCblRSVm9hZnZUYkQ5aklJaFFWMUdZclp3Nk5YVEhEKzhV?=
 =?utf-8?B?UzRGWFZmdGUzTFo4cEFEV211bTJUei9oNzhIemhwRGxSbUhWZzVKYVZxYmVn?=
 =?utf-8?B?YzBLbkF5RzVCb1MwN1VIc2pBRDJ6QWlQSEdvWEc0bTkwN2tTdllNYVF2ZW1o?=
 =?utf-8?B?U1RyV2s4MHlwQ0xuRnhqUWhKaGw2Z2tUQWd2blQ3M3ovUlc5WjZYTFJCOHRk?=
 =?utf-8?B?ZFFqNWVJd0ZpR3M0dHk0NENIejBMdEo1bmp4ekJEY0J6bEJ4dnRkRXVNYnky?=
 =?utf-8?B?SXEwcWF1V1VBR24xUnlMNzJqZTdVWWo1QXJVeTJHaTRPMEtJNFF1M2hWYjB2?=
 =?utf-8?B?WVpHU2hwZGlhQ1F6SVVmREJoOThXYUVKeW1Cck5Sb01hVlRFQThBeHFSVDUr?=
 =?utf-8?B?eEJpQWhkc2Jpb1lTK1VPRmg5aDkrU01DVFBqQ0hkT1RQL0tJa1VkaThPZ09t?=
 =?utf-8?B?RW5zK1BkUkdsZkhPbnpsQkN4YUlIdk1rUk10bFpCMHNpM3NKQ2M3MEJ5VThw?=
 =?utf-8?B?VzYzQ0JUU2pHNXpVM05meXRZa1lwR0FOQ0tlT2FZTk82WXo0dTZYTFdqUG1W?=
 =?utf-8?B?YlBHV042Y01NQTlBV0hzMW0zejBxY0hBQm0wVUZlUEdtYlVuTHQyODQwMEtB?=
 =?utf-8?B?YW42bUxDQUVQNUpLektxL0ZTcXdrbWlkbXozZDF0ZXZNTFZWUG5jRmNuQjRP?=
 =?utf-8?B?RnNkT3RJcUdIWkVFTGJwUmRWWjRKM3hVN3B3WU9mZ3ZEemhacC9Ncm1MUkFK?=
 =?utf-8?B?WkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <47D24188B86D85449B1BD4AB98F32E72@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a163efec-1d46-40a5-0904-08dd9762f72c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 05:55:46.5491
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x5enX2R57kZu8C3SXswAN4GMp4BDDVRg13QOHNqs1Iwi45fXXi6rKNrPkSwHmglBnJLdZY/dFc2e/ytfd4/9+NxKoL2FGVNgC5jrQEwhTe0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6143
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 05:55:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216882

T24gTW9uLCAyMDI1LTA1LTE5IGF0IDIxOjI0ICswMjAwLCBNYXJjbyBGZWxzY2ggd3JvdGU6Cj4g
T24gMjUtMDUtMTksIEFkcmlhbkYgd3JvdGU6Cj4gPiBGcm9tOiBBZHJpYW4gRnJlaWhvZmVyIDxh
ZHJpYW4uZnJlaWhvZmVyQHNpZW1lbnMuY29tPgo+ID4gCj4gPiBUaGUgZG9fa2VybmVsX2dlbmVy
YXRlX3JzYV9rZXlzIGZ1bmN0aW9uIGZyb20ga2VybmVsLQo+ID4gZml0aW1hZ2UuYmJjbGFzcwo+
ID4gaXMgbW92ZWQgdG8gYSBuZXcgcmVjaXBlLCBrZXJuZWwtc2lnbmluZy1rZXlzLW5hdGl2ZS5i
Yi4gVGhpcwo+ID4gcmVmYWN0b3JpbmcgaW50cm9kdWNlcyBubyBmdW5jdGlvbmFsIGNoYW5nZXMu
Cj4gPiAKPiA+IEludGVudGlvbiB0aGlzIGNoYW5nZToKPiA+IC0gUmVtb3ZlIHRoZSBkZXBlbmRl
bmN5IG9mIHVib290LXNpZ24uYmJjbGFzcyBvbiBrZXJuZWwtCj4gPiBmaXRpbWFnZS5iYmNsYXNz
Lgo+ID4gLSBTaW1wbGlmeSB0aGUgdXNlIG9mIGN1c3RvbSBrZXkgZ2VuZXJhdGlvbiBpbXBsZW1l
bnRhdGlvbnMgYnkKPiA+IMKgIGlzb2xhdGluZyB0aGUgZnVuY3Rpb25hbGl0eSBpbnRvIGEgc2Vw
YXJhdGUgcmVjaXBlLgo+ID4gCj4gPiBLbm93biBsaW1pdGF0aW9ucyBvZiB0aGlzIChhbmQgYWxz
byB0aGUgcHJldmlvdXMpIGltcGxlbWVudGF0aW9uOgo+ID4gLSBXaGVuIGdlbmVyYXRpbmcgZnJv
bSBhbiBleGlzdGluZyBUTVBESVIsIHRoZSBleGlzdGluZyBrZXkgaXMKPiA+IHJldXNlZC4KPiA+
IMKgIEhvd2V2ZXIsIHdoZW4gZ2VuZXJhdGluZyBmcm9tIGFuIGVtcHR5IFRNUERJUiBvciBhbiBT
REsgdXNpbmcgdGhlCj4gPiDCoCBzc3RhdGUtY2FjaGUsIGEgbmV3IGtleSBpcyBnZW5lcmF0ZWQs
IHdoaWNoIG1heSBsZWFkIHRvCj4gPiDCoCBpbmNvbnNpc3RlbmNpZXMuCj4gPiAtIFRoZSB1c2Ug
b2YgcmFuZG9tIGtleXMgKHZpYSBGSVRfR0VORVJBVEVfS0VZUykgaXMgY29udmVuaWVudCBmb3IK
PiA+IMKgIGV4cGVyaW1lbnRzIGJ1dCB1bnN1aXRhYmxlIGZvciBwcm9kdWN0aW9uIGVudmlyb25t
ZW50cyByZXF1aXJpbmcKPiA+IMKgIGRldGVybWluaXN0aWMgYW5kIHNlY3VyZSBrZXkgbWFuYWdl
bWVudC4KPiAKPiBUaGlzIGlzIG5vdCByZWxhdGVkIHRvIHlvdXIgcGF0Y2hzZXQgYnV0IElNSE8g
aWYgdGhlIGtleSBoYW5kbGluZyBoYXMKPiB0aGlzIGlzc3VlcyBJIHdvdWxkIGxpa2UgbWFyayB0
aGUgc2lnbmluZyBmZWF0dXJlIGFzIGJyb2tlbiBhbmQgc2tpcAo+IHRoZQo+IHNpZ25pbmcgcGFy
dC4KClNpZ25pbmcgd29ya3MgcGVyZmVjdGx5IHdlbGwuIFRoZXJlIGlzIG9ubHkgdGhlIGxpbWl0
YXRpb24gdGhhdCB0aGUKb3B0aW9uYWwgZmVhdHVyZSBvZiBnZW5lcmF0aW5nIGtleXMgd2l0aCBG
SVRfR0VORVJBVEVfS0VZUyA9ICIxIiBoYXMKc29tZSBsaW1pdGF0aW9ucy4gV2UgY2FuIGltcHJv
dmUgdGhpcyBsYXRlciBvciB3ZSBjYW4gYXNzdW1lIHRoYXQgdXNlcnMKaGF2ZSB0aGVpciBvd24g
d2F5IGZvciBwcm92aWRpbmcgdGhlIGtleXMuCgpSZWdhcmRzLApBZHJpYW4KCj4gCj4gUmVnYXJk
cywKPiDCoCBNYXJjbwoK

