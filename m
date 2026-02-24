Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 708E8F4BB68
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 17:52:45 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26466.1771955556693224852
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 09:52:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=USmI0L0f;
 spf=pass (domain: siemens.com, ip: 52.101.72.28, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c5ogZj/hLUrFqecfHv6CF40wn0R59B21WSsJHmmXYhhmwWDdzuqDNmY4m5nIT7hscfrHLUpl1L435b1JTWhZefLdCxCEIYJwervvGgEEL8L1AJNn77qFf+BBAkkDXLVFDrqD1UOQh2d6hyx+Z9JlzNiaxaD9qpOi/CZjbtsHWoKlSyX23p+P6nLW1aS4bjAN5uEOCkSKv2KI2sJVzRNOVB37uKhdeZE1/PIiY4phrPR4Re5GtljyC4T6s24na0+M1x7cmgww/rEt6SYNnt7mAtABBVcCLQv6bZ8P7y/M1mUolqTGDELvxm4yiFYDOtfbNzrui0AsJwYqa1NHvyCvaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lz1Keg8DQxkJvY2ECFMhEjPcad2jKSq2sLsvn7lysI8=;
 b=rpEs/HuM/GmsRhgDCRlwqXCk4bvazZze60BJz5ofLrjSAAchnqy/k4knBex5sw5FlM25StXj7f8+m9V42BH55EF+3FlfMCzjwEwHXwAYbArgY4A3/oSS8c+6SLKPu0FHuqJeXHksi97NsGeCKsd4OsfRpcQS9ksuc+4qck5eBPI17I+/fPyRVxeiJqpusDEsPKF5XNhEmIuwbNM0aZreC1aXJiBqn8x4w+zbcg2c/52nqegXpnK3/T0NrS3geWsBB4euODsOhgBQ+yzyuGh6zPqchdEqjjVkAZKe6gKTulnrW+QitRp2EC7gqI/kfYiKhvVYC8vRDj4MSAkPR3uHiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lz1Keg8DQxkJvY2ECFMhEjPcad2jKSq2sLsvn7lysI8=;
 b=USmI0L0f2LqxFM3cTJ7nHq11lKPsHv08nSY5foFAXSIFQR12v+aG/Vt75wcxdZTGxf9xBPyomPfznH4ev6UBO5bNWZ4tRAb6Q5znBxDSLc+avAqWhVNUA1BR30f+IBu4p8wqOmFewUQc4UoGB+jAn3q7wSBbGdBgiQ+Xs4dXrUFLn8pX78nKoHr7Pg2pUQOEae5WaCrQ6Su3JdzaySPXd7stiNfhLzXVKrekERDWMKc4HWNMTwRbfNVxppUdjb5C7Tl2v8TdnOhD1BbCj35+MSqXl2p5flLudd78BHtFPwK//9jsJ5JOeCi5xkIZBttzxcKCUMLj0E5yKpjwXcnRkw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS4PR10MB5371.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4bb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 17:52:29 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 17:52:29 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Yoann Congal
	<yoann.congal@smile.fr>
Subject: RE: [OE-core][PATCH] vim: upgrade 9.1.2144 -> 9.2.0
Thread-Topic: [OE-core][PATCH] vim: upgrade 9.1.2144 -> 9.2.0
Thread-Index: AQHcpap8iOaO6th6zE2X5YVZJtlBgrWSCk1AgAANlICAAAVa8A==
Date: Tue, 24 Feb 2026 17:52:28 +0000
Message-ID: 
 <AS1PR10MB5697276E91B1CE488F9E4E09FD74A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <18973B8A1D1BE087.558139@lists.openembedded.org>
 <AS1PR10MB56978C6748852F61C4F7109BFD74A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CANNYZj_Wo8czbE191kMach590DA7pyhs=UDGq3aRW9zstbEXBA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_Wo8czbE191kMach590DA7pyhs=UDGq3aRW9zstbEXBA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=e9872ddc-295f-48a1-b2d1-45eb7c4755b4;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-02-24T17:37:44Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS4PR10MB5371:EE_
x-ms-office365-filtering-correlation-id: 74753a82-8663-4595-0e89-08de73cd7a4a
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?aGJocHdHYTM4YVF4YUxMOUx0djVleTc1ZVJrOERtaEc4ZWtBS2VzOWc1YUlZ?=
 =?utf-8?B?SDZwak8rVDlRRnQ1VnhmV0J1VVYrb2NhaGFPZXpKTFhZc01mdkF2V28za05X?=
 =?utf-8?B?MTRDZnFXM1JPNGI5aDU3YnorNlFZZExRNmFSdCt1NjNkMVR2Z2RadkJCaDRx?=
 =?utf-8?B?WGpDR3R5dEphWWtFS2VFTjhSVnd4bmRXU3dFSmhZV0I2U3pwbTFpOEY2ZW9E?=
 =?utf-8?B?bk9uNWZLbVNjRWRXQVdKY3NBSGxsOWVKVUs2bDBRbTdvbHVoWVZTZHUzQmo4?=
 =?utf-8?B?QWQrdmloS1NkQXdSNElJZmVta3dyOXhHUmw0Q3VlcExFSllydmZ2UzM1WFcv?=
 =?utf-8?B?b0trY3dKalNwRlhMa1FmTXFGazgxOW5KeDNnT29sNXBhdXR5ZmJ3Yi9WaVhs?=
 =?utf-8?B?RkpvUHhDcnA4MVVteGZ2RVNhWFpiZ3FYaC9VMU95RlRZSkdHRkRsQmovc1gw?=
 =?utf-8?B?WklPTEhtSU94S0lKeE9zU3NQWmRFVjBROUJ0N2UrQjJ0ZzIxUXZZeHBsYnFx?=
 =?utf-8?B?bGRlY0VUWWFyWHpsaEgyZGlkS2EwTXYzSnZadDM1Qi9HNmMxM2d5Zk40bUp5?=
 =?utf-8?B?SWxrMEh5elRyMnlLSnNEamlnN1pkZFV3QkxSdVoxbkEzWVhMcTZpY3dudkc5?=
 =?utf-8?B?NHRMdGpjTVVId0NteEQ0dVVja3pWcFIxaGpoMkgrNnl2ZVNSUDhRSjk5WDF4?=
 =?utf-8?B?REM3dXM3SXBoVjcvU1JLdjVYcUUwMEREak5ZNUluTHVmY3ZsbEI5bmREN1pV?=
 =?utf-8?B?QWF4Rzl4UHFtWlVFZXhLSkx6SDNMVW1lSG5MZWd6VVZXU1ZrOU53OUE1VWg1?=
 =?utf-8?B?SlQ0WjN1WFBIMEM5ZEdoOFdoYWVldWF3SzBjWEF3cG5MdlE0aFVlWEllb0lO?=
 =?utf-8?B?THhFK2c4eGpBNnpnZ3c2TFlnNEpOOVRCb2RuaFVkejlkN1FFaGQ2cUMrUHRM?=
 =?utf-8?B?bXlTL3J3cTBpWFFkUWN5WU9WNWNER1VBcnhobFlXYkNTNW5QOG1MTVRUZCtw?=
 =?utf-8?B?cVF3Q1JZTTVVNFRjZXE5aEZCK3pRVy9yTGZ4MXR6dmhHZVRESmVYNHlLSnM1?=
 =?utf-8?B?bWY1UFBGVkNwM21wU0NTTUhzb1dmQm05UE1UbTI2WGJzMUVRd3czckMrdDFJ?=
 =?utf-8?B?cWFFa1dUZ1ZZeHZaZGUxbk9qblk2RXVIQlEwc2RZenJvNTBkOHRxSHNoSU9T?=
 =?utf-8?B?Qm85N1ZOQ1FlMHVXQWNFL0V2dkJseS9xMnJBanpBL3h3YmNlcjlabnRLYnU0?=
 =?utf-8?B?b3VTY2hGdzF4eVMrdzVuTzhUejQ5aVBWeEhZWnh6b1BlSUZwQ0RHOTJrZ21h?=
 =?utf-8?B?VDJXaDBFbEFZU3p1WFVzWWlaZlRFbW9zVzduQWZVdUZaL3NzMGxubXZEWTVW?=
 =?utf-8?B?eXN2ZmdZVHdubHpBSTlHeW9FR3RkdXN1QUh4UTlmQWVUTDRaMkVTVlZha1JR?=
 =?utf-8?B?cmxzVTlraTJHbzBtVk9PRVZxYkR0QXkrVnhYTUxIUDBpams5eGRlTFNMRGsv?=
 =?utf-8?B?TnFqUWVFUjJoV1BER2ZNeHV2SUN3TVl4OUZFOHd4Slc4ZTgzUm0xbDgrYzNv?=
 =?utf-8?B?cjZqdHVlQnd2L2tITUpBSVpaN3Fac2VaTElkeXJMd1J3OEo5OEVZNXRvWUoz?=
 =?utf-8?B?cTZocVpjMUxJQW10NFhRRjFFeXg4bGc0S0Vqclg5dnBiY1kzZENjVU1oNVh6?=
 =?utf-8?B?QVF4ajA0WXYzKzhBOUErSFJNMFVyRk8zSk53cUtWS0lXWDJkOGNjaCtHa3BM?=
 =?utf-8?B?UjdYUFFWeXZWYW80dUQwckQvOGh2L3VNY094QnFjd0JKV2xVSExSbkRvbGF5?=
 =?utf-8?B?ZVNQNTB3ZWxOYTI2S0N5K3BFbHRQOWEvKzFQdUwxcXg4ZlU5Q25qMncvTkQ3?=
 =?utf-8?B?R2Yzb2hJS3pBQlBnSXpMWERsUmhsTTFVeTlObjNnZW41TzBwUnhIU0pPM3lv?=
 =?utf-8?B?c0RyUFZzclIxWlhWSk1kRkRuTlNRMU91L1BmU2kxb2tjM2JsYzUvK0hhc0c2?=
 =?utf-8?B?dCtUM1o0Wk1YSnNiYTZDZzFlL2dJd0VCWm55N0E4cEVvSTRLVzV1SG00YVM2?=
 =?utf-8?B?eDBpRUgrQk8ydGRJTW1MNGZ0d293WkkyTXlKTnhiU1diZVVleTFWanJzdHNX?=
 =?utf-8?B?ZXkxQ0FXZkt5enk2THEyeTNoTC9nbkxtY0xhQ0JIZVRRRHlUa2hOR3d6Q05v?=
 =?utf-8?Q?uC3VPiqh3ocma13C325i8Fk=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?akk0b1gzbzlXZTJjQWc4Ly8yRDFXQ3pXT2ZLRmROK0pJR2tHU1dLQXdQTVJO?=
 =?utf-8?B?SkJRNWI2c1NxNmRwK2FGT01Rc1RPTUZlY05PQkdlSkFSYklvU3hNOGtBK1lB?=
 =?utf-8?B?QjVDSkhBeDZkc1R3QlpwRVQ0N2F0NkF3K0k0ZEdHWUJMU2h1Vkh5YVFHYnBG?=
 =?utf-8?B?S0k3M2trRWFpbWlaVnpFdk9MME9CeEhDVVNIMXNWWW5heHZRU0NQODA5cWsy?=
 =?utf-8?B?WEJ1QXlzYmRWQXRiWTZtN2Ixdm9ZT0FqK2E0ZnpoTVJsaEtmQTBnVFBqd1ds?=
 =?utf-8?B?NTVtWnA2NE10YkQwdmtwZTIyWWZCME9BTXk5Y0JvNkZJVFc5bUsrNEpUU0Vh?=
 =?utf-8?B?UlY5cmdvUDU4MWpibFJPYTZpQUlqRnk0eTJkQjE5dVZCenlzTkY0c3BtRVhq?=
 =?utf-8?B?VVN2MGx0Zk4wd3N3Lzc5ZHh5a3hsdVI3ajJmcVN4OTZhOUhPQ3dCZ2JDanZY?=
 =?utf-8?B?bjlkbXZLUlE4UUhQNFVZeEp4WTV4dVB1bTVQUzlidXlEK0ErLzhUUnI0TUVo?=
 =?utf-8?B?Q2tSdjRKNGZLMnhHNzUyTENBaEpza2QrMnU3MTNnbmwxWlJQRmtqdHZ4UXA3?=
 =?utf-8?B?eldGQU1abGF2RkNScit4blQ0VHUxajZuSkFsTWdJYlNXLzMrMVYwa3Z2NzMr?=
 =?utf-8?B?OU1wMXBYcDYyZmtLek9BcU55cmtnRzVqQjRORFIvKyt2Vmlxd3ZOZFN5SVpY?=
 =?utf-8?B?SEF1eEZSeFk2eFkzN2ZpalF1dFI5Tk9rRTQ1S3laajRFS09YQTVYT05OTUVt?=
 =?utf-8?B?YXdLM0U4a3FsTS80Z0IyRUl4QzNZa2p6TWxiVlpQN2ZBS09SYVlEUXYyWHA3?=
 =?utf-8?B?QmltY3V0UDhQdDNiNndNMThGOFBocndONXYzU3UrdlFHVmJOb1Uzc1A1dzVk?=
 =?utf-8?B?UDcrT0g3WlVSZ3hxVmpqV2JUaUZYWUNZNE42c2V3VzQwTGNlM0wyQVpCTzNq?=
 =?utf-8?B?RGN5RUc4a05HYzNpODlvekJZdmtVOEN5VDhLK0k0MmlpRUsxaXhRY3o2azQ1?=
 =?utf-8?B?cjNZUnYvV3Zpb3owYlBuTXZRQzFYemlZZFN4bXNSVXBKWFJ4MksyNkY4THRz?=
 =?utf-8?B?UERReTNFeVZOcWdKMUxlcUxkYW1qZXlBRFYrTVlwbzRKNisrS1FYaEdPMjZV?=
 =?utf-8?B?ZzBoU1BtMG0vRXdwTDBFK25ySG0xbzZ6TkpPdEJZeHIvelpPcmg1Zm5ZaG4w?=
 =?utf-8?B?bjR0VlFDMEJQdktLVkZYYUh4OVpmMkVFNGR2Nm0waXBLdHFMelhPaW5OVzBn?=
 =?utf-8?B?bGpXRU42eUtwU1p5d202UkxXRzRtdUhEcmxMcE1mcGo2d0ExZytiWWYyL00x?=
 =?utf-8?B?N1NUNHF2eDZDa05va2tQVnpVYVF6Nll3bVRUelBCeTV0MXRib0RlZFg4UEFo?=
 =?utf-8?B?aVBvRTZCazhqdVJ2Qlcxa0pXYmVGQW1PREN2TDBBMmhwbU5jOGx3VXdMNm1p?=
 =?utf-8?B?L1JoQjBwRndYM0s3TkZhd1RJTzA4WDQ2dUN4eVJBZno5d05QOG9WK1Z1UTUy?=
 =?utf-8?B?MExTaFY3WlNZbTlvWjNOYm1QKzJJNlFVV0lzTGZTL2xFRlhqa0U1aFh1b3Ez?=
 =?utf-8?B?MlNaOU5ZOVMraTNjRVhPcGVLeEYrbXoyc2FZVmdNRXJVaEg1cm9BQTlzNXpP?=
 =?utf-8?B?UFg5V0NqQmFoKzQ2RFRWaGp0UWh2MXJORmFzN21hWno1TG91SjNZdGdHWnVs?=
 =?utf-8?B?c0VDZzBxdzUxeFI5aExIQmdweE55R25KcC84di9JVHlOdFZqdlRzM3JWUFk5?=
 =?utf-8?B?RTl1WCtYSXlOenlmRXFMa0JneFF0ZjZYOFB2ZjBHRWcwOXNmZmVPQjgyZ3Vy?=
 =?utf-8?B?bGN6YUY3M0JpWWtDRmR5bUdMWkt2N1o5NW95OUVMKzhuZXVySks4YlltUUll?=
 =?utf-8?B?MlQ5RnZBaXEyN2JIK1piRDFlR2szRW0yQWI0NjdDc1hYa1JpbnNhc3dWWTZB?=
 =?utf-8?B?cStudUQ2SjRNOHNNbVNKU0VpU05ONVdYM1V0UnBZcEg0Y3l1NGtSWEQ4bDN1?=
 =?utf-8?B?aWx4Q1AyQXpwdUoxMTJ0bUpLQVd5dmV6c3hxZGdIOXR2RTdoNzRTV05DVUpp?=
 =?utf-8?B?RlpkQzI4QlNtbXl4N3d0R1hwdXRReGw3R1J2alg3cFpwMHFGdDY3WjY5K1pP?=
 =?utf-8?B?NWZCSEpjT1N5MVljZ0NEQk1odDNuZ0NwUFNBNGo4dHR5Vk9rbFZoMUl6TXpi?=
 =?utf-8?B?SHdLRTh4UEJ3d21IQXNpbkUxQWgwb2hCdllqMFdHVlFzQ1hZVmVjN3gvQkZI?=
 =?utf-8?B?MG1RNEk4bGMrMUdmMHVFSk9GTWpOZG1RRERUNC9LWGp6R2FEakRwenZFVzZU?=
 =?utf-8?B?cEF0T2dCQ3BmR0RHSEpqUEd1TlZYOXFKQ1ZBbFNETnNVRnduT3hLZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 74753a82-8663-4595-0e89-08de73cd7a4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 17:52:28.9836
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5o8G0KuCmUVojQujnJnqcP4m6ofABOJzxR9Q/6z5/w6dXf1IHhunH85kPJ9XIwVVUutaLOspDSlvC/x4JcXBLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5371
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 17:52:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231899

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleGFuZGVyIEthbmF2
aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEZlYnJ1YXJ5IDI0
LCAyMDI2IDE4OjE5DQo+IFRvOiBNYXJrbywgUGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkgPFBldGVy
Lk1hcmtvQHNpZW1lbnMuY29tPg0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZzsgWW9hbm4gQ29uZ2FsDQo+IDx5b2Fubi5jb25nYWxAc21pbGUuZnI+DQo+IFN1
YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0hdIHZpbTogdXBncmFkZSA5LjEuMjE0NCAtPiA5LjIu
MA0KPiANCj4gT24gVHVlLCAyNCBGZWIgMjAyNiBhdCAxNzo0NSwgUGV0ZXIgTWFya28gdmlhIGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPHBldGVyLm1hcmtvPXNpZW1lbnMuY29tQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiA+IEFsdGVybmF0aXZlbHksIHdlIGNvdWxkIGFsc28g
Y29udGludWUgdXBkYXRpbmcgdmltIGluIExUUyBsaWtlIHdlIGRpZCBpbiB0aGUgcGFzdC4NCj4g
PiBGb3Igbm93LCB0aGVyZSBhcmUgdHdvIGFjdGl2ZSBDVkVzIGluIExUUyByZWxlYXNlcy4NCj4g
PiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgSSBuZWVkIHRvIGJhY2twb3J0IHBhdGNoZXMgbm93IG9y
IGlmIHZpbSB1cGdyYWRlIHdvdWxkIGJlDQo+IGFjY2VwdGVkLg0KPiA+DQo+ID4gQW55IHRob3Vn
aHRzIGZyb20gdGhlIG1haW50YWluZXJzPw0KPiANCj4gSW4gdGhlIHBhc3Qgd2UgdHJpZWQgYmFj
a3BvcnRpbmcgQ1ZFIHBhdGNoZXMgdG8gdmltIGZvciBzb21lIHRpbWUuDQo+IFRoZW4gaXQgYmVj
YW1lIGNsZWFyIHRoYXQgYXBwcm9hY2ggaXMgdW5zdXN0YWluYWJsZS4NCj4gDQo+IEJ1dCBJIGhh
dmUgYSBkaWZmZXJlbnQgdGhvdWdodC4gTGV0J3MgZHJvcCB2aW0gZnJvbSBvZS1jb3JlIGFuZA0K
PiByZXBsYWNlIGl0IHdpdGggbmFubyA6KQ0KPiANCj4gQmVuZWZpdHM6DQo+IC0gc2FuZSB2ZXJz
aW9uIHBvbGljeSwgbm90IHRoYXQgbWFueSAocHJvYmFibHkgbm9uZSkgQ1ZFcw0KPiAtIGl0J3Mg
dGhlIG9ubHkgZWRpdG9yIHRoYXQgZG9lc24ndCBhbm5veSBtZSA6KQ0KPiANCj4gTmFubyBpcyBh
bHJlYWR5IGluIG1ldGEtb2UsIGlmIHlvdSBzdXBwb3J0IHRoZSBpZGVhLCBjYW4geW91IHByZXBh
cmUNCj4gdGhlIHBhdGNoZXMgdG8gbW92ZSBpdCBoZXJlPw0KDQpBcHBlYWxpbmcuLi4gcXVpY2sg
Z3JlcCBpbiBvZS1jb3JlIHNob3dzIGl0IHdvdWxkIGJlIHBvc3NpYmxlLg0KTm90aGluZyByZWFs
bHkgZGVwZW5kaW5nIG9uIGl0LCBkaWZmb3Njb3BlIGJlaW5nIHRoZSBvbmx5IG9uZSB3aGljaCB3
b3VsZCBoYXZlIHRvIGJlIGxvb2tlZCBhdC4NCg0KQnV0IEkgdGhpbmsgdGhhdCB2aW0gaXMgc3Rp
bGwgc29tZXRoaW5nIHRoYXQgdXNlcnMgd291bGQgbGlrZSB0byBoYXZlIChJIHBlcnNvbmFsbHkg
cHJlZmVyIGl0IG92ZXIgYm90aCBuYW5vIGFuZCB2aSkuDQpTbyBpdCB3b3VsZCBiZSBtb3ZlZCB0
byBtZXRhLW9lLCBkdW1waW5nIHRoZSBDVkUgd29yayBvbiB0aGVtIChHeW9yZ3k/KSwgbm90IHJl
YWxseSBoZWxwaW5nIHRoZSBlY29zeXN0ZW0uDQpBbHNvIG5hbm8gaGFzIHRoZSBkcmVhZGVkIEdQ
TC0zLi4uDQpBbmQgdGhlIGJlbmVmaXRzIHdvdWxkIGJlIHNlZW4gb25seSBpbiAyIHllYXJzIGFm
dGVyIHNjYXJ0aGdhcCB3b3VsZCBnbyBFT0wgc28gbm90IHNvbHZpbmcgdGhlIGltbWVkaWF0ZSBx
dWVzdGlvbiBhdCBoYW5kLg0KDQoNClBldGVyDQoNCj4gDQo+IEFsZXgNCg==

