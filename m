Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB5D5C3ABC0
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 08:18:51 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.49])
 by mx.groups.io with SMTP id smtpd.web10.3647.1746605927746326373
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 01:18:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=C+TwrjtT;
 spf=pass (domain: siemens.com, ip: 40.107.130.49, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aWvQ91lZCp6dIuz1bVQgykitu2OV4ns4i1lf8va/bnfCotqqhKp2p1w7XkWUUQYDGurfqLaIYLnp3j7k/ezrIy5UkToMBT9kPcNceDLr6rabYHBiFAfYfwFymbkw2fhpT5EMdY/ERm/va+ngqWAPJFM/OZPR7gwjJeHL6LgGPWwUXuPiD+4mVQ1MRJkYDWDmbSLRs9pV39nBWbl865u2za/WzQaL3ygqrMzAsdZ7UwUlHjDKc+JiHDXaddvEbWl+6mOGOwgOOCxzOAQOHFBeER0887XKSEgnvfWrrvgzCqZ8rFc77BO77xgMu2xiX5N8UuaEvIxqqN/xTqR3CiQGKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YBKkSWLgH0KR/zbiS3nDDl0irokBR41/ykrYAO71/A=;
 b=a+AqM58hvZ7RiBL/r26DmpEtVJ1efXVU5IE/wjpx6g5h5XNljUd86PBVCe9N52dlhUquh8cYq7ID9dPtCnUFpWfRxLXR6+Cfxv7znQRV7WrNuGe5dhmWx/K2v38/MlZU8R6/jhIQE95MTRbblDYtM+VEr2LhMWl7+lOSjmtXpPDJKj1iByObp/XJdbn7hxoCJOAx9WhbB0yvTL7RQDYfnKYFdzV1p8byevmYJ5Kehjp2oxIrCIaR24emtvbRJaNFww6X+c+kEhIBHh8O2DWmf87K5BokUvPOKJpO/MdZ2W3RPfkAfZJ0PDmIVAeRr080XoDNQex24Q0m0eRBs9dglQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YBKkSWLgH0KR/zbiS3nDDl0irokBR41/ykrYAO71/A=;
 b=C+TwrjtTl4wXXWihxL5HKSW5tdIph1tvJTRWl4Wh0PR9RkDNaWJSVIGbbOz4Ja+B30bepqy4ZcfjGTvonmnjYsqvcKOXMRATh8mR84eqz8/CkfNf9XT3zqZc9xOtEO0LPv0EG5vSRK5gCiGxmb5Zdk7PZVgC6DKCkU6pnTLCwYN0rj980qitd7mQqtLJLz8pc5/VWC6fVWIm8JTh1AQOcLGaAnwlC08yjpo5zhP1PzkrgRr5eaQhK2BSFfcyZTr2RmvgMaH+yzDpnCUrFQAzOc7DRn3xElDdwKCtHqFHthOQIUYPAP06xVoSVCnQI7DwJhtl0AAOfClhGwTh1NVF2g==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AM7PR10MB3143.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:103::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Wed, 7 May
 2025 08:18:41 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%4]) with mapi id 15.20.8699.019; Wed, 7 May 2025
 08:18:41 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] sqlite3: upgrade 3.48.0 -> 3.49.1
Thread-Topic: [OE-core] [PATCH] sqlite3: upgrade 3.48.0 -> 3.49.1
Thread-Index: AQHbvqU5RFHeanjzE0maEuj3BkAj/7PGys0AgAAI4BA=
Date: Wed, 7 May 2025 08:18:41 +0000
Message-ID: 
 <AS1PR10MB569703699175BD0AA0C77394FD88A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250506163705.4099385-1-peter.marko@siemens.com>
 <D9PRFCSKFCLI.1VXXE2QET4AOG@bootlin.com>
In-Reply-To: <D9PRFCSKFCLI.1VXXE2QET4AOG@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=846d50e5-6604-4bb1-beb6-c989b2e41aef;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-05-07T08:17:33Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AM7PR10MB3143:EE_
x-ms-office365-filtering-correlation-id: 25eec0f3-f518-466c-21a4-08dd8d3fc6d5
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?YWFsQk9vakpvRllGbVdPQUFXaUtvZDJ0T251QzFwOEVEOFFBZWJqSnE4WW0w?=
 =?utf-8?B?dEVxYTNHRzhHMURsVFY1QVNWanZZV1ltYVpJM3NGZDNxVTVubitUbnBzd2Vr?=
 =?utf-8?B?eXU2Nm1PRmJpcjRTSHRua1lBOUZ5WmNZUkY3eWIySkozR2JhV2VIMmw2b0M0?=
 =?utf-8?B?TUpGUW9hVXF2ZmI2Q1NVa2o0VndodlBjWGQzVG9ZdU01N1NYeC9ROStsR1Ju?=
 =?utf-8?B?VWN3RlpnRzIwM2hrUExqS21Eb0krYXM2M0wvMC9Fb0x4VldKcEtkUDByUHdB?=
 =?utf-8?B?M01yYjlCSk1HNllqRGd1U05tTlprS3I5SWlqMHFWRWwyT21veW5OeTAxb3ly?=
 =?utf-8?B?TC9WNHdabW10TDd4NGFpQW1OcEtPQkVUc3dsZlk0Sys2RXc3MmhTNDl5UWxY?=
 =?utf-8?B?am5ERVg0Uk14YVVBSGtJU0ZsMGt6c3ZLQnVsWTJrUFFnRitHRlBRemw0VnRo?=
 =?utf-8?B?Zk1HN3BONk5lcUZ2bzQ0ZENYR2pHd0wzTG5wZHg1OGJjUGhOdzNmWDY0bUZB?=
 =?utf-8?B?bWMyMVRvOEVlbE5NNzcwUWREMVh6elY0T3hCNkEydUgzWGtXU2FaOW1RcXdJ?=
 =?utf-8?B?RU4zUHdtaXZIRzdkVjdDbTZOV0hQenB6b0ZIaTZDYUk3Q09IZWN5aGVaOVZj?=
 =?utf-8?B?azN1bDRyYXJvVkljMjJKV25iVDFnWldCL29wYWEwQ3dHUnJQZURqM1RSQVcy?=
 =?utf-8?B?bUV6WnA0WHdKRGN3ODgxTjNTQTFzaXlZY3NOcHp6eEU3ZXNXWVFZbnFsbjZz?=
 =?utf-8?B?KzhHbmUvWnRLRFh2TzdHc0ErcUVCRk5HN3VCY1J0Y0pKTytKbVJjdC8wMkJn?=
 =?utf-8?B?Ui8xeVBnaE5TUXlCRFM0ZUtuMCtHNjRBQUFkMTd2WnRYQTVNTkI4SjBNaExv?=
 =?utf-8?B?ZEFhanAyek1aUHBIdTU5SzUxRGh4OXlHR2xTL1UvYUVpWU9VRitqenIrZ2J1?=
 =?utf-8?B?YzkxRlAxYWh6dTJnbE11TmFxeUlyVTBIME1iV2xoOGhjZGhQSCt4TDBYS25T?=
 =?utf-8?B?eko4MWhEc1krb3N3RDZReFdUOEVKQ05TYjZwRmVwSTJURG9EMTJyUS9hRUh6?=
 =?utf-8?B?WSs0amFrZDIzcHdWWmFsWUQ4QlorS3ZBUHIxRXZON1dCT3RZdVl0WmRuUXhm?=
 =?utf-8?B?WUVoekxZYlN0dFBqQXdidGpEUmU1WDVQcDUzNlVhSHBHQ2tvMWM3Uk4xSzc2?=
 =?utf-8?B?U21yTFNia2ZvUVhZVzg3eDJCRW16Ry8wUkNxYVZTcGlUTzJlR0FsMjQ4aW52?=
 =?utf-8?B?SCtvRTgzQnFGdk9ObHY0RVlpM3RmTXBzejNrbDBUMEsxMVBRM0QvdVFrTHJ6?=
 =?utf-8?B?dWZXNitRR0ZKVVVSa1YvM2kzNVJPTkkyMVlBZjhIOW9xODVTcWZ5Vjczc3I0?=
 =?utf-8?B?R2p5VXR4Y1cyYWhzeFlSRlg1ME1CYkhWOXdvQmQrYThvVlBvQytHYzV5Qi9u?=
 =?utf-8?B?NTdrZE1Ya09xVkl3ekNsOTNBMTloZDU0VnpodUwyd1ZnQWlFaVNqUERDVjRB?=
 =?utf-8?B?ZGhrRXJNYkJRMWdBVGlObmhmcldiNEFsajhVU1pia1ptRnVhbnZFSDRZTVF0?=
 =?utf-8?B?eEo0Ti9FUUlGL1Q5K1pkZ3ZIZTRZTHJIVENOM2crWGhlenpjVjdCZ29Yc05a?=
 =?utf-8?B?aEpFeGpOeEltc1BTY1FpWGpaTG1VU3FubHpTYWoyVUpFcjB0eGt4Tm1NRjRw?=
 =?utf-8?B?a0IwYzkxQTFuWnk0Y28vVkl0VmNJckthd3hOem94TG5VZU5yRnRab1FDdkNI?=
 =?utf-8?B?RTQ2dGNuKzFNclJjbmVNMW9Fb2w0eXVNMDBOd3BQZWJXMTB5eDMvMnVOc2FH?=
 =?utf-8?B?aEJUZ3UwYmR2Y0dpL2JQbnFRZWtNQWRrRm9TYUJNaFJYVWg5aDVaNDAzUUNh?=
 =?utf-8?B?YkJQOEhkNERFdkpiTExtMnAvc3BkOHRDZnFQSGFMNy9IaTNWWjlETnVpQjVy?=
 =?utf-8?Q?KmShSne52dE=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VGFIWnltc0hUbkEvRWp2WXRqUWhNZ3FsM0d1UUtnNzFwcWp2NXVnbHMxTE5h?=
 =?utf-8?B?MTN6Ukx4Q0hSSkZObDh0WDRXREdiTXhhN1ZPK1ZMMmJxMjRuUjk5Z3NETEVQ?=
 =?utf-8?B?VzErcU9Pck1OVWxXM3QzQjA5UkptakM4YzU1WTdjLytXRzdXUWd1c1lBdDB6?=
 =?utf-8?B?NGRIOFdmamFaUllaV01aOFdNejJac0U3eVgwWVZXRDJoZ2RXQW5jNkxUQmpV?=
 =?utf-8?B?YUlMMjdxZWJtWHZBWFN0NkNuQUNPUmxEbTlCMW5JSnpHS1ZuWUd3SU82dHVa?=
 =?utf-8?B?NXpIeStQUTRJVUpTcDZESEJXcXdBNnoyMWFLNmgrM0daR3A0bmRFSU9HVUpZ?=
 =?utf-8?B?TERpcnBUR245aDk1TWpxYWV3dEV6ckg0Vm4yOTU0bXFrMmJnMlF1WFpmck1Z?=
 =?utf-8?B?YlBQUnpEcHdXQy9XdFZWbVR4QkNjMklpTzJWV3ZidVR2aFlzOExIQTkyblVH?=
 =?utf-8?B?QmFRbzYvdU1oVXV1UUNZUEpWQnBUNElaWWdxbC8wM0xBRkNrSjdvZ0o5Mk1x?=
 =?utf-8?B?V1N1K2MxcWxzQ2k2ek1pejNTa1RhaXRIeEpzR0dwR1h6OHo4akhCZlJza3hm?=
 =?utf-8?B?SllCL25PZDBZSkxicFU0RWVUdC85SkJqYW1QUUgvSnFKdjRaWVBRU1FtNkFl?=
 =?utf-8?B?U20zK2x4cEtKSzFjQlByd2xJN1d6Qm1QYzJ2cW82RkhFOTVzVGpybUV2c3Jm?=
 =?utf-8?B?NStuMmdNRWIrUFNydWptZnNnNDJ1UDVWSkF2alZPRXNrZkpmM0R3QVFWN3Y1?=
 =?utf-8?B?Ti9CbmcwMnBMVTdjZ0dxbWloVG1xTUUyUVRoazBQVlp0Y2IyZU5RVjlYQWNn?=
 =?utf-8?B?S1NEekdjaXVYSGVrZzVMKzlOOFV2WWxzcUlyQjBCT3NPU0dVZEd5QlBmY0Zw?=
 =?utf-8?B?ME90bnFDbEZBV0UzMFJUcGdYakRObFVHR3ZzUnBmL3JZYWVQZVhxQUY3WmR0?=
 =?utf-8?B?VldaNktoZDBBR3dhM2gvWGI0UFUyWW1ic0RPWWR2elRWZDVzN2xiTDVOeURP?=
 =?utf-8?B?OUZBTHhOQXNreGVPYThnWURpZ1JRbVpJdnF3eUpVdktZUnRhU1dNWHF4ck50?=
 =?utf-8?B?aTBwYnQ5NEhhamxnMitjTmdHMkVQRlhYOHR3WUg4bFVIKzNNRmIxdU5BcEI5?=
 =?utf-8?B?NnVQWEIzVWpqM3hQSDB5R2FzTkJlUGZZaVNNUldRdmNRWkVpYXhUZHJrNmx3?=
 =?utf-8?B?dS9PWm4yeFVINHc4emh1c0EzajYyRG4vSkRNb1VxMXJnY1drMFpkMFBpL0VM?=
 =?utf-8?B?OGIrYmY1UUVmay83UVZzWERCRVlhdVh0NjYray9qYk1kT0RBbENHWDVGdlkr?=
 =?utf-8?B?cTVqNVJkWEdJa2pKTFRLK0VnSnBESmUxd1hUcmVFVTFMWlQ3NUEyYzBvQTgv?=
 =?utf-8?B?Zzlta3dGMm5uTWFibnNoZlYra0lSWnRjclpKaE1wUVV3bmlJdG5nN3gyMTZx?=
 =?utf-8?B?VEJkUkJGOG5nNVNUZGhtMHRBbWZ1ZEp2WFV2L3M0SkRSa0ZFYkgzbHpHWVhu?=
 =?utf-8?B?VVNXbW9EbWFNVFo4YThhbFBQYmxvYkR2VmF1a1ExY0JpUlFkaFRhc2Y3LzY2?=
 =?utf-8?B?WTNLc0dZTTlUejJWQXFvNGozbzdKamtjRFRVQ1VlZk1HaEdkaW9tZkhidENi?=
 =?utf-8?B?TGdxRktja214Z3BFUzU1UVN5a0NCQVdSOTV3Rzh4VmZzOW93ay9mY1hYaEtI?=
 =?utf-8?B?SHd6bnVFWnRETjZabEkya2VFZlYzRE9qT1lhZHdUYS9IMGJiakJ3aHNxMDRS?=
 =?utf-8?B?aVYrc0dhNUlVQVlpQmlFakIxSkZPV3BMWVFyM08zd0FaWWpUOXErNzR4SjVa?=
 =?utf-8?B?UGlrQkpSTEt4R2k1Z2k0eVEyQ2V3bnJJbTN6allWTWM5ZlgzNFFTeHBMQXc5?=
 =?utf-8?B?VDdDbDVYUVgxOHR6SHh2cVBndFgxVnZhOVc4cDVBUFh5ZW5KS0tZR3NWbkxz?=
 =?utf-8?B?UnhVMW42TUkrenhwajVWbHl0OFFzT1hRMmozbkZoNkhVZmF5SlhtY21vQ1ZC?=
 =?utf-8?B?U2hTb0FmbEltbVdmWk1Pb0NxYWJ6U29YeUsrRXUxRVd5VmJMMytPVFhUMUVh?=
 =?utf-8?B?SmNTNFhFa2ovMDdNNkhucW5xT25nR0RwYXluZXM2bGJNZmRTZkpnOHErZFh6?=
 =?utf-8?Q?XGTwT6FUg0hOjvc4+fjbzhaOB?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 25eec0f3-f518-466c-21a4-08dd8d3fc6d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 08:18:41.4720
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iKcTUfWOWpUSqiSLGskXFAhwVsjO7svJsQvEWfqDa0lCXhvRw+jnREgs4IO7X11NlIWt4QIi5QNtC3xBjGMlng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3143
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 08:18:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216100

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWF0aGlldSBEdWJvaXMt
QnJpYW5kIDxtYXRoaWV1LmR1Ym9pcy1icmlhbmRAYm9vdGxpbi5jb20+DQo+IFNlbnQ6IFdlZG5l
c2RheSwgTWF5IDcsIDIwMjUgOTo0Ng0KPiBUbzogTWFya28sIFBldGVyIChGVCBEIEVVIFNLIEJG
UzEpIDxQZXRlci5NYXJrb0BzaWVtZW5zLmNvbT47DQo+IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIHNxbGl0
ZTM6IHVwZ3JhZGUgMy40OC4wIC0+IDMuNDkuMQ0KPiANCj4gT24gVHVlIE1heSA2LCAyMDI1IGF0
IDY6MzcgUE0gQ0VTVCwgUGV0ZXIgTWFya28gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4g
d3JvdGU6DQo+ID4gRnJvbTogUGV0ZXIgTWFya28gPHBldGVyLm1hcmtvQHNpZW1lbnMuY29tPg0K
PiA+DQo+ID4gSGFuZGxlIENWRS0yMDI1LTMyNzcsIENWRS0yMDI1LTI5MDg3IGFuZCBDVkUtMjAy
NS0yOTA4OC4NCj4gPg0KPiA+IFRoaXMgdXBkYXRlIGluY2x1ZGVzIG1ham9yIGNoYW5nZSBpbiBo
b3cgaXQgaXMgYnVpbHQuDQo+ID4gSW5zdGVhZCBvZiBhdXRvdG9vbHMsIGF1dG9zZXR1cCBpcyB1
c2VkLg0KPiA+DQo+ID4gQXV0b3NldHVwIChodHRwczovL21zdGV2ZWIuZ2l0aHViLmlvL2F1dG9z
ZXR1cC8pIGNsYWltcyB0byBiZQ0KPiA+ICogUmVwbGFjZW1lbnQgZm9yIGF1dG9jb25mIGluIG1h
bnkgc2l0dWF0aW9ucw0KPiA+IEhvd2V2ZXIgaXQgYWxzbyBjbGFpbXMgTk9UIHRvDQo+ID4gKiBJ
bnRlbmRlZCB0byByZXBsYWNlIGFsbCBwb3NzaWJsZSB1c2VzIG9mIGF1dG9jb25mDQo+ID4gVGhp
cyBtZWFucyB0aGF0IHNvbWUgYXV0b2NvbmYgZmVhdHVyZXMgYXJlIG5vdCBhdmFpbGFibGUuDQo+
ID4NCj4gPiBSZWNpcGUgY2hhbmdlczoNCj4gPiAqIHN0b3AgaW5oZXJpdGluZyBhdXRvdG9vbHMg
YW5kIGRlZmluZSBCLCBkb19jb25maWd1cmUgYW5kIGRvX2luc3RhbGwNCj4gPiAqIGRlcGVuZCBv
biB6bGliIHVuY29uZGl0aW9uYWxseSwgYXV0b2NvbmYgY2Fubm90IGJlIHByZWNvbmZpZ3VyZWQg
aW4NCj4gPiAgIHNpbWlsYXIgd2F5IGFzIGF1dG90b29scw0KPiA+ICogdXBkYXRlIHBhY2thZ2Vj
b25maWcgb3B0aW9ucyB0byBtYXRjaCBuZXcgc3ludGF4DQo+ID4gKiBsaWJlZGl0IGlzIGRldGVj
dGVkIHdpdGggbmN1cnNlcyBsaW5raW5nIG9wdGlvbnMgKGFzIHNlZW4gaW4NCj4gPiAgIGRvX2Nv
bmZpZ3VyZSBsb2cpDQo+ID4gKiBiYWNrcG9ydCBycGF0aHMgZml4DQo+ID4gKiBkZWZpbmUgc29u
YW1lIHRvIGF2b2lkIGZpbGUtcmRlcHMgUUEgZXJyb3IgZHVlIHRvIHdyb25nIGxpYnJhcnkgbmFt
ZQ0KPiA+ICogY2xlYW4gQiBmb3IgZG9fY29uZmlndXJlIGFzIHRoZSBuZXcgTWFrZWZpbGVzIGRv
IG5vdCBzZWVtIHRvIHByb3Blcmx5DQo+ID4gICByZXRyaWdnZXIgYnVpbGQgaWYgY29uZmlndXJh
dGlvbiBjaGFuZ2VzDQo+ID4gKiB1c2UgdW5zdHJpcHBlZCBiaW5hcmllcyBmb3IgbmF0aXZlIChu
b24tY3Jvc3MtY29tcGlsZSkgY2FzZQ0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgTWFy
a28gPHBldGVyLm1hcmtvQHNpZW1lbnMuY29tPg0KPiA+IC0tLQ0KPiANCj4gSGkgUGV0ZXIsDQo+
IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2guDQo+IA0KPiBJdCBsb29rcyBsaWtlIHdlIGNhbiBz
ZWUgc29tZSBidWlsZCBlcnJvcnMgb24gdGhlIGF1dG9idWlsZGVyOg0KPiANCj4gRVJST1I6IHNx
bGl0ZTMtM18zLjQ5LjEtcjAgZG9faW5zdGFsbDogb2VfcnVubWFrZSBmYWlsZWQNCj4gRVJST1I6
IHNxbGl0ZTMtM18zLjQ5LjEtcjAgZG9faW5zdGFsbDogRXhlY3V0aW9uIG9mICcvc3J2L3Bva3li
dWlsZC95b2N0by0NCj4gd29ya2VyL2dlbmVyaWNhcm02NC1hbHQvYnVpbGQvYnVpbGQvdG1wL3dv
cmsvYXJtdjhhLXBva3ktDQo+IGxpbnV4L3NxbGl0ZTMvMy40OS4xL3RlbXAvcnVuLmRvX2luc3Rh
bGwuMjQyNTU4OScgZmFpbGVkIHdpdGggZXhpdCBjb2RlIDENCj4gLi4uDQo+IHwgc3RyaXA6IFVu
YWJsZSB0byByZWNvZ25pc2UgdGhlIGZvcm1hdCBvZiB0aGUgaW5wdXQgZmlsZSBgL3Nydi9wb2t5
YnVpbGQveW9jdG8tDQo+IHdvcmtlci9nZW5lcmljYXJtNjQtYWx0L2J1aWxkL2J1aWxkL3RtcC93
b3JrL2FybXY4YS1wb2t5LQ0KPiBsaW51eC9zcWxpdGUzLzMuNDkuMS9pbWFnZS91c3IvYmluL3Nx
bGl0ZTMnDQo+IHwgL3Nydi9wb2t5YnVpbGQveW9jdG8td29ya2VyL2dlbmVyaWNhcm02NC1hbHQv
YnVpbGQvYnVpbGQvdG1wL2hvc3R0b29scy9pbnN0YWxsOg0KPiBzdHJpcCBwcm9jZXNzIHRlcm1p
bmF0ZWQgYWJub3JtYWxseQ0KPiANCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qu
b3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvMjIvYnVpbGRzLzE1NTMNCj4gDQo+IENhbiB5b3UgaGF2
ZSBhIGxvb2sgYXQgdGhpcyBmYWlsdXJlIHBsZWFzZT8NCg0KSSB3YXMgYWZyYWlkIG9mIHRoaXMg
a2luZCBvZiBmYWlsdXJlLCBidXQgSSB3YW50ZWQgdG8gaGF2ZSBhIG5pY2UgY29kZS4NCkkgaGF2
ZSBzZW50IGEgdjIgd2l0aCBhIGxpdHRsZSB0d2Vhay4NCklmIHRoYXQgd2lsbCBub3Qgd29yayBm
b3IgYWxsIHBsYXRmb3JtcywgSSdsbCBoYXZlIHRvIGRvIHNvbWUgdWdseSBoYWNrcy4uLg0KDQpQ
ZXRlcg0KDQo+IA0KPiAtLQ0KPiBNYXRoaWV1IER1Ym9pcy1CcmlhbmQsIEJvb3RsaW4NCj4gRW1i
ZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZw0KPiBodHRwczovL2Jvb3RsaW4uY29t
DQoNCg==

