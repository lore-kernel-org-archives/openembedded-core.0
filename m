Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20BB7E9D3F2
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 14:58:18 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22259.1770217094492375055
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 06:58:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=qeoV+7iL;
 spf=pass (domain: ericsson.com, ip: 52.101.69.60, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O4lzcpEO8E9ijKoxHnhwpOIC8nkQUUNpuuNg1TQclawmsaEc7rcF8NPh8BHQu1oH7EFyh2Gi4eadWX40D2/0oxa1krqAnPeFJhfcriahnqMhscQ5PDv4kG7tQZ8bsSH42HC/dX/wEOYCzR6qYx/vIwWuSJjUCbXN0DeIO48MVOSXMQU6HoTnj7KlkYhOPZsySJyTI3qU6qUeou0a26aYx+kZd85addECjDjOKdzwUNMrc7tGLgA6OIw4DIHc/jFfCC5o+HWt+74IAcdvYkhcoCKduX3zd+gZT/Q6ueMdzDo68vYyCkmpzo6ZIimgYexETqrwXHRjKRRRVNnTWSegmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBMeVj5qFT5YphFRgdQj6w4kChMIkUzLmahhR2Jtw8w=;
 b=PqUIl8XotAO/Ct/g+aMmryYG1Eta5liucRggEf62Hz1sSUY2JnxOKuE4Pwpl/qHK6Aklqo6JA9U6YVWbeGkdku5SFsG8Q9LZlqnw9vev7Mjk7w877N8/hx4txb8ze51BWYUEiSIoUfGj0wtr+MShdEccUfzFnPB5z3TkqAGJbRxQZ/umWsHxtJKNKgfkAb69jFHlGdeIw3quUBwfzO/sptlzJ7RxSDHQoRfdVHzHwgAlOVAuMdJNZ3B733wEfON/wEMjboS1JDYvYmfZkRpC+cy1W8+4oib7KQeGYTOforWOArDrwHtOkgrmSVQreC5citGkmEGruPlD2sUsj3x/sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LBMeVj5qFT5YphFRgdQj6w4kChMIkUzLmahhR2Jtw8w=;
 b=qeoV+7iLB1y49L6AbkAulCk4IcgtdGowuHymMmOHN8gE0rBoN1OYb8+nHTnMwPVup/LjUtxiohGQYFrwUzE895gno1in0NEroJJq49W1XSsyUmlkLQODl70SlOwmbYLY43mPTubNz9LK50epRlswr12BhK+oa2+dpIFAU2NO8qFqLQ6hOncTDS8VEK4KGp0smMBNPkXmYug+Vkz1tcQyP/vdN/ulfezaUAGjanHteHtVCIW5dukOIHe9Q0byFio70V9c3j2sRzxQrCS2/A6M8Kw5i3ssmBofRdmyUr2rOgUb7MOsEST3wQpX0rsDN6XXoDsuQYHgHZ2e2si7UiCGXQ==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by PA4PR07MB7069.eurprd07.prod.outlook.com (2603:10a6:102:f4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Wed, 4 Feb
 2026 14:58:10 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%7]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 14:58:10 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: ValentinBoudevin <valentin.boudevin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "jerome.oufella@savoirfairelinux.com"
	<jerome.oufella@savoirfairelinux.com>
Subject: RE: [PATCH v6 0/2] improve_kernel_cve_report: Add a bbclass support
Thread-Topic: [PATCH v6 0/2] improve_kernel_cve_report: Add a bbclass support
Thread-Index: AQHclIgPeJ0D7TQSck228rHTtJp4yLVyo58w
Date: Wed, 4 Feb 2026 14:58:10 +0000
Message-ID: 
 <PA3PR07MB107219357A78C841A123980438A98A@PA3PR07MB10721.eurprd07.prod.outlook.com>
References: <188AFD4FCC1313A8.2683732@lists.openembedded.org>
 <20260202210811.2136027-1-valentin.boudevin@gmail.com>
In-Reply-To: <20260202210811.2136027-1-valentin.boudevin@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|PA4PR07MB7069:EE_
x-ms-office365-filtering-correlation-id: e640e082-f370-4f0b-0777-08de63fdd02f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|19052099003|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ZGpkWnRWUVZQcXV6WEhNdnQxWCsvbUpIRW1NTlNlY1BnV0RTWUZLM0ZJQ1Jt?=
 =?utf-8?B?c2JQUW44MXFHaG9tMkhjMUtuYUdQeUpDZ05CSTZTZzNCVy9DMUFIelA0R3Zn?=
 =?utf-8?B?bVBaZ3pTS2NmMi8xWjdWbXZmOHVXTmxHdnB3UjMwc0E1RUFHVFZ0RmlSaVlM?=
 =?utf-8?B?TERTZHo4VU9kZjBDUWkrQW9iMHp3bTgzT0NwaUpMUFN2a05mNnh4RG55ZFBR?=
 =?utf-8?B?aWVDclR4N2NMV2VXR1VTUUNkVTc2algyeDBJK2NIbWM1YjUzcWFlblFTdUkr?=
 =?utf-8?B?UG51Q1dGV2pWVHQrblJQeUQwOHFGcXgzcSs3VWxSUXpyM00rQ09BZWxla2VO?=
 =?utf-8?B?WTR1NVVHMCtRUHRUbDlBZWdmM3VuMFB1K3RQWUE2N1gxQnFXdVcvVUFVYW5E?=
 =?utf-8?B?QXlqYzFTVjdFNVoxN0NoUkl5NmN3T2pHaVhmWjM1UTlKMzNGN0Z5c0I2TllD?=
 =?utf-8?B?US9JUXRjekFvSXVxdkJhRlhIdFhVRUxSaitEUjlPTFlGOUEzaTJMdERqallW?=
 =?utf-8?B?SUVPZk5HbDUzWGFwTlgzaHFQSVBjejNHSXpFengwNGZWUmVLS2ZuV24zMGlh?=
 =?utf-8?B?eGlZN0h3TnNUZHRIc0RiTUw3TTdHYURDMEtKNkM5cHVHT2g3cy83Z2lCZ1Jx?=
 =?utf-8?B?OHVoVVF3Zm42NWlzYTBnZjVUb1pOUEtUT2dqZW9EcHpUYzVpRnV6Ti9VWVJv?=
 =?utf-8?B?WTJ0a29nZnVrMC9xTGRZdnEwY2E3NnB1QnJDUXdTTm0xemp4L1IrUFpQSndE?=
 =?utf-8?B?Vy9Fa0JhVWxZdU0ydkxKY1FJeDYwTFFPeXdJNmZBL2NJWURCN2kwR0ZxYU11?=
 =?utf-8?B?VDkyWDQ1b3Q2S3RZSGZ4akthZDJOOEJBYnlDc3BKTkMzT0tBcnhpWkpuQlpq?=
 =?utf-8?B?VTdITEtIZWM4TER4a2JWRC9VSWFDK2UrMnVBekduOVhJZVZtcUhha21YZXc5?=
 =?utf-8?B?YW1OVDFBcGE0SDh2OW9oQ2k3d0g3ZWVWNlNrSmhCamRWRjJWVWJsNGNXeGdQ?=
 =?utf-8?B?K1lacjluSGpzbng1N3U3QWNTc0VuaUJndnRqcEM0QzNhMUROb0R2d3A2di9p?=
 =?utf-8?B?VVUwUVcyTGIva0lnNVhXbG5ZRi9RaEM4T2ZCTDZ6c3RnQ1ZmYjFHZy9rVVVG?=
 =?utf-8?B?bjJadXV1TU9SZTl3bWlPd3FZamRkZWNuTTNRY3VFWDg2cVZTYTJ6VFdMYjM0?=
 =?utf-8?B?UklJVTlCU1c2WVc4OUJoL01rU2xxaTNVeGdOejdwb0VmMGxZOUwxQ1gzNVor?=
 =?utf-8?B?WFR5a3oyMktsdzZ0Tit0Qms2Y0J2bytTWUxCUzJ4dGFuWHd6K2ZqZVFsWXVl?=
 =?utf-8?B?dWZ2THFMVEhCelZFeFhPa2ZQQWRjWjdVY25tVnp2ay9zTUFxeitZVkc5akZW?=
 =?utf-8?B?QmJUSy8rRWV6SjdBanhGb3UrTjlUMG9CT1o2Vko3eW5BQ0FFVHdpdXRZRjVW?=
 =?utf-8?B?VUtTRGZNZDFCbkJrUzBTS1YzS3prd2wreG0rdFk3emNjdGJXQUlIbWJPTnZ1?=
 =?utf-8?B?QUMvT2FvRC9mcm9Pd1JObnVjSFVUTXd1Q3hRRzEyTnArbXptd0NFT1hsT1dD?=
 =?utf-8?B?dzNhc0hpNFloNnNEc0xmVUdFTlNnVWZMTnpXbW1La3Jyb0RqZDFEaFNENHdm?=
 =?utf-8?B?MXNHeVRiQ045aTFvRTh2TVhwdWE3VUtZSFZsblRCV2kyZ2RSL2FtYjNhbXg4?=
 =?utf-8?B?QW1WVGIvK2pibVdPU0c1NFdud3FmbTRxMnJtWG5GL0RDV1JFUlNkSUtyZjZP?=
 =?utf-8?B?bGdOUEhqejNpQ3VoeTB6WEs5cnBVM1lsOHdpTG0zM1hTV0tyUnY4NXZrU2JZ?=
 =?utf-8?B?UmErRmExc1I2Mm95TXhJUHhjZ3dmSzV5OG1NZkVjSE00NjQxcDRxWE1yTGg3?=
 =?utf-8?B?NCt5TkZnVDZ2VFdKV2lEODVJL21WcW5wd01XbE52UGI2WjNsaUhGSnBXRXlJ?=
 =?utf-8?B?MytjSnU1V0g5QWt2TS9BbkVla0FsRTdrakpWV0hRYjNIcTFRL1NaWDB5eGNI?=
 =?utf-8?B?NEVJZmxJNnRwY2ZUd3ZyV1IyUVZ1bk9pK0tJUW9ML0wyRXEvb2YzODU3R1hZ?=
 =?utf-8?B?T3pZbURaUUpiL0JxRlBxSklwMVRvdVNjemRGZ1BMcEZmZ1FpZmkxem9idEs5?=
 =?utf-8?B?elBscllqckt6VHU0cnlEeUxvVjlrTFA2aWpSQVdlQWxjRW40V0hvbHNTUHNk?=
 =?utf-8?Q?HNp6rcqRP36VHEnzJc2kJgk=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19052099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SlhmWEtPd1hEL000R1hiemhleUFPWWR2d3VvQXMyRXBWVldlZEwvenh6ck1Q?=
 =?utf-8?B?ZjE1bi9sNnFoSDRtTDVBWURvVkFRdkRLbHpNUmZlTGZOMnpLWmRlY0kxbTBS?=
 =?utf-8?B?YlFtMjBreHlPNXpocEJHTUJHeEJJMXJKQmJxME9YTFU4Z09FU2JXYzBaZklG?=
 =?utf-8?B?SFFCME03SWZqamlGaWpQRnQ2UVpQU0N5cHN5cTFHR2VJSWZKNTk0ckJmM2Zo?=
 =?utf-8?B?L2pBYTk5QWZFUDJRNHRUcjg3d0R3dXlLZlQ3d2VjS2lkeUZzNHZqOHdXQnpW?=
 =?utf-8?B?bG1MV21jYS82RnAxdDJLeXhPN1ZoSzdOcy80ZWt4bXY5RnptU0hKc2tzbWZF?=
 =?utf-8?B?UHk2OHlHWXAwdnB5ZjR3RkF6UTJtV3JDUm9GSGFaN2I0UXkyck1JaFdSVTZX?=
 =?utf-8?B?blNIbmplbGJmcWw5QzFpN2ZaRTk5UDZHV0RKT2tFWm9kYTlaVmhseVlDRXNJ?=
 =?utf-8?B?YmJDejR3dGFHRk5XQ1V1czVqNmJ4RnQ3OUxUbVJlNkFaWHVkbzUyTldaVzNr?=
 =?utf-8?B?Zm5OR1YxOUxwWjVEWm80Sk5PVG1SdXMveWVOYUc3R3JiSDVTdjZaOHk1WTVs?=
 =?utf-8?B?MnJXUzAvUWVmQThzeTBLNmJObytkQmJnV0l2cUh1NGwrOWhyUlJER2JDQmNs?=
 =?utf-8?B?MG1kV2F5WTJrZTFvUG9VakhFbS9jNXpwZnlaQVVmNjJqbG4vWnNjTjE2WnR3?=
 =?utf-8?B?NVU0L2VKelZyRmlWSEh6UktMNmNjbWgwYVhwK0lEanh6a3lpM1RSczNuL1dL?=
 =?utf-8?B?QnpzWkprZ1pGbzd0UkdrM0V3MEwvL29YZWlQT0FIT1VibWxzdDY0VTcraEFn?=
 =?utf-8?B?TE5ZZ0I4Rk91cmVWZngrcDNkQTFTRCtMc1JVTTFHejVXMTFyS21tbnJrbDFT?=
 =?utf-8?B?RjJzWEhyUG90UTByTytaUUs1emZ0TCt1Q2hEU2RjQzdDdzVNaDcvRGU1Mmp3?=
 =?utf-8?B?ek5HRGk5dTFSb08vbTNMSzAwanJWMUJEMVpTT0RUd2R3dUJyTVdUWjkzZTdp?=
 =?utf-8?B?L0pTN3gxcjJEb1R4emRuWTAzQmQxVDN0RWU2NXgzNEdscjlUbWxreC9uNjFq?=
 =?utf-8?B?QnBKb0VDUW5ydXBTdmsyN05OTVJ2TjV1UHR0QW9uT3JVMzZYYVgycmZpTzZo?=
 =?utf-8?B?Q3BtMHh1S2E0RXRtYUZuSVR5dy9LNjVVMUd1MHlqN21BbmYvRlJtRE9GRU05?=
 =?utf-8?B?TUt3WHFKSjRSN0cxMDFFemk5U3g0TzJ4ZlhYNmMrbWVsQU9mZ1RuNFc4bzlQ?=
 =?utf-8?B?L3VTL1pSS2pUU0ljem5QbmM0cEZ0cnRGOGJMZjZCQll2RDRwM202Q3V3Z0VE?=
 =?utf-8?B?Q2pOd0VlV3RpYWV5K1J3aWFUTzBwbzhJeGdKRzA2ZTZFOGV1VUZQM3lpYU90?=
 =?utf-8?B?MHljaGFpUGhMdHRxQ1JBa0thZVllM0FmSVhuTU5CalgxK0lYcmJCbklIYUN5?=
 =?utf-8?B?alpJQWJkRUl4QWt4WCtNNHNNQnZuaEVDeWVXaW9vT0dpV0QwcVFOMDBzVElo?=
 =?utf-8?B?Ym5rNkE0bEhJQ1d5UjFPbFFIaFVXQ1N1T3dxbGZVeWtPSjMzRWNOcjZLL1VC?=
 =?utf-8?B?NCtFWDV5amlHL3lxY3lRWmw4SDZDTDEzNnhEeXJ1Y1Y2MjBkZHFObGFFeHFl?=
 =?utf-8?B?MlQ4SXJtMWFoNkxHbUdOYVNvVERnekNTblZpcWl5OUY3Qmk0ZkUrZWljQUoy?=
 =?utf-8?B?ZnQxVmF6bkZLcW1OUmRDSGtVa3J2US96cDVwcHBCbmFmZGJ0WWpHNVBCTXlh?=
 =?utf-8?B?b2tJQ2EyUG5ycy9ISE1aajQ3Nk1HQm9NSG9pZStjK0hJVHMxdzduUkc5ZWFv?=
 =?utf-8?B?QWczRmZESHFDeTNJWjhVSkZvS2ZhMUt2U0RnWDBDVjNhNmhOZjF6MmdqcDk2?=
 =?utf-8?B?SkFjdVlBbHVOejRuZGF6TVpUYW0rREp6c0VBVDhHMUtjQ0NBUldENWJ5NWhS?=
 =?utf-8?B?R0Z0c3lSWDZwMmsyelN3bFB2UEd5UXcvYWFJdmVpcjUxVjV5cEhLRnRXMlNk?=
 =?utf-8?B?N0JZdUVmWHRhQjF6cEwzcVl4WUxWZU12SXRsYUlzQWJKV1RPTVhIeDBhdXJa?=
 =?utf-8?B?Qy9IbTE0aFpNWlp2cUFsd3JKa0t6VEoza1UvckZtVHdLYlhUYk8yZ0xQdlNn?=
 =?utf-8?B?VVpWRTVTUk9LR0MyRWdiVnFaMk05SWhzejBjT2hZY2c4ZzdIV2p3emZBRVVQ?=
 =?utf-8?B?YTc5ZE5FSHVBK3EwS3RPN05VYTlMQWFxdTFTM0pPTThQT3ZXTy9vS0IycDZs?=
 =?utf-8?B?b1pvd3oxTXd6RlJoZnFYcDRJYW94R0VrMDNUTkpTSHJYWGdvOXlBdVVBSVpk?=
 =?utf-8?B?Q1pObHd1MWs3ejNXQjRaTkoxSUEwY205c0ZBdmkwYUpSaVlZcHNDdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e640e082-f370-4f0b-0777-08de63fdd02f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 14:58:10.3709
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a24maWtEnRFCJu4C7KInUUiK/2qI5rKTJXHJ/OhwHlAmCHlcap4ZugT6b91TsEmZi2Gf2b1cM8k6ON9lOFaREpbCGW4U29ZiEXirqUs7C3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB7069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 14:58:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230539

SGksDQoNClRoZSBzZXJpZXMgd29ya3MgZm9yIG1lLiBGb3IgcmVmZXJlbmNlIHRoZSBpc3N1ZSB0
aGF0IEkgaGFkIGlzIHRoYXQgdGhlIHFlbXVhcm02NCBkb2Vzbid0IGluY2x1ZGUgdGhlIGtlcm5l
bCBpbiB0aGUgY3ZlIHJlcG9ydCwgc2luY2UgaXQgaXMgbm90IHBhcnQgb2YgdGhlIGltYWdlLCB3
aGlsZSB0aGUgcWVtdXg4Ni02NCBkb2VzLg0KDQpJIGhhdmUgdGVzdGVkIGl0IGxvY2FsbHkgYW5k
IGl0IHNlZW1zIHRvIHdvcmsgZmluZSwgYWxzbyBmaWx0ZXJpbmcgb3V0IHRoZSBmaWxlcyBub3Qg
aW5jbHVkZWQgaW4gdGhlIGtlcm5lbC4NCg0KQmVzdCByZWdhcmRzLA0KRGFuaWVsDQoNCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVmFsZW50aW5Cb3VkZXZpbiA8dmFsZW50
aW4uYm91ZGV2aW5AZ21haWwuY29tPg0KPiBTZW50OiBNb25kYXksIDIgRmVicnVhcnkgMjAyNiAy
MjowOA0KPiBUbzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBD
YzogRGFuaWVsIFR1cnVsbCA8ZGFuaWVsLnR1cnVsbEBlcmljc3Nvbi5jb20+Ow0KPiBqZXJvbWUu
b3VmZWxsYUBzYXZvaXJmYWlyZWxpbnV4LmNvbTsgVmFsZW50aW5Cb3VkZXZpbg0KPiA8dmFsZW50
aW4uYm91ZGV2aW5AZ21haWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjYgMC8yXSBpbXByb3Zl
X2tlcm5lbF9jdmVfcmVwb3J0OiBBZGQgYSBiYmNsYXNzIHN1cHBvcnQNCj4gDQo+IENoYW5nZXMg
c2luY2UgdjU6DQo+IC0gVXBkYXRlIHRoZSBtYWludGFpbmVycy5pbmMgZmlsZSB0byBhZGQgbmV3
IG1haW50YWluZXIgZm9yIHRoZQ0KPiAgIHZ1bG5zLW5hdGl2ZSByZWNpcGUuDQo+IC0gVXBkYXRl
IHZ1bG5zLW5hdGl2ZSByZWNpcGUgdG8gcmVtb3ZlIHRoZSB2YXJpYWJsZXMNCj4gVlVMTlNfTkFU
SVZFX0RFRkFVTFRfU1JDUkVWIGFuZCBWVUxOU19OQVRJVkVfVVNFX0FVVE9SRVYgZm9yIGENCj4g
Zml4ZWQNCj4gICBTUkNSRVYgdXNhZ2UgKEFVVE9SRVYgd2lsbCBiZSByZWNvbW1lbmRlZCBpbiB0
aGUgZG9jdW1lbnRhdGlvbiBpZiB0aGUgdXNlcg0KPiB3YW50cyB0byB1c2UgdGhlIGxhdGVzdCBh
dmFpbGFibGUgY29tbWl0KS4NCj4gLSBVcGRhdGUgaW1wcm92ZV9rZXJuZWxfY3ZlX3JlcG9ydC1i
YXNlLmJiY2xhc3MgX19hbm9ueW1vdXMgZnVuY3Rpb24gY2hlY2sNCj4gdGhlIHByb3ZpZGVyIGJh
c2VkIG9uICBJTVBST1ZFX0tFUk5FTF9QUkVGRVJSRURfUFJPVklERVIgY29ycmVzcG9uZHMNCj4g
dG8gdGhlIFNQRFggdmVyc2lvbiB1c2VkLiBJdCBndWFyYW50ZWVzIHRoYXQgdGhlIGNvcnJlY3Qg
U1BEWCB2ZXJzaW9uIGlzIHVzZWQgd2l0aA0KPiB0aGUgIGltcHJvdmVfa2VybmVsX2N2ZV9yZXBv
cnQqLmJiY2xhc3MgaW5oZXJpdGVkLg0KPiANCj4gQ2hhbmdlcyBzaW5jZSB2NDoNCj4gLSBBZGQg
YSBuZXcgY29tbWl0IHdoaWNoIGNvbnRhaW5zIGEgbmV3IHJlY2lwZSAidnVsbnMtbmF0aXZlIiB0
byBjbG9uZSB0aGUNCj4gTGludXggU2VjdXJpdHkgVnVsbnMgUmVwby4NCj4gLSBSZW1vdmUgdGhl
IHRhc2tzIGRvX2Nsb25lX2tlcm5lbF9jdmUgd2hpY2ggaXMgbm93IGRvbmUgYnkgdGhlIG5ldyB2
dWxucy0NCj4gbmF0aXZlIHJlY2lwZS4NCj4gLSBVcGRhdGUgdGhlIGRvX3Njb3V0X2V4dHJhX2tl
cm5lbF92dWxucyB0YXNrIHRvIHVzZSB0aGUgbmV3IHZ1bG5zLW5hdGl2ZQ0KPiByZXBvc2l0b3J5
IHBhdGguDQo+IC0gUmVtb3ZlIHZhcmlhYmxlcyBJTVBST1ZFX0tFUk5FTF9DVkVfU1JDX1VSSSwN
Cj4gSU1QUk9WRV9LRVJORUxfQ1ZFX1NSQ1JFViwgSU1QUk9WRV9LRVJORUxfQ1ZFX05FVFdPUkss
DQo+IElNUFJPVkVfS0VSTkVMX0NWRV9XT1JLRElSLCBhbmQgSU1QUk9WRV9LRVJORUxfQ1ZFX0RF
U1RTVUZGSVguDQo+IC0gTW9kaWZ5IF9fYW5vbnltb3VzIGZ1bmN0aW9uIHRvIG5vdCBzZXQgU1JD
X1VSSSBhbmQgU1JDUkVWLg0KPiAtIFVwZGF0ZSBfX2Fub255bW91cyBmdW5jdGlvbiB0byB1c2Ug
YmIuZGF0YS5pbmhlcml0c19jbGFzcy4NCj4gLSBVcGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlIHRv
IHJlZmxlY3QgdGhlc2UgY2hhbmdlcy4NCj4gLSBNb3ZlIGltcHJvdmVfa2VybmVsX2N2ZV9yZXBv
cnQuYmJjbGFzcyB0byBpbXByb3ZlX2tlcm5lbF9jdmVfcmVwb3J0LXNwZHgtDQo+IDMuMC5iYmNs
YXNzLg0KPiAtIE5ldyBpbXByb3ZlX2tlcm5lbF9jdmVfcmVwb3J0LmJiY2xhc3MgdG8gaW5jbHVk
ZSB0aGUgYXBwcm9wcmlhdGUgc3BkeA0KPiB2ZXJzaW9uIGJiY2xhc3MuDQo+IA0KPiBDaGFuZ2Vz
IHNpbmNlIHYzOg0KPiAtQXZvaWQgY29kZSBkdXBsaWNhdGlvbiB3aXRoIGEgbmV3IGJiY2xhc3Mg
ImltcHJvdmVfa2VybmVsX2N2ZV9yZXBvcnQtDQo+IGJhc2UuYmJjbGFzcyIuDQo+IC1SZW1vdmUg
ZGlyZWN0IHNldCBvZiBTUkNfVVJJIGFuZCBTUkNSRVYgZm9yIG9mZmxpbmUgbW9kZS4NCj4gLVVz
ZSBuZXcgX19hbm9ueW1vdXMgZnVuY3Rpb24gdG8gc2V0IFNSQ19VUkksIFNSQ1JFViBhbmQgdGFz
ayBzY2hlZHVsZQ0KPiBkb19zY291dF9leHRyYV9rZXJuZWxfdnVsbnMgYmFzZWQgb24gU1BEWCB2
ZXJzaW9uIHVzZWQuDQo+IC1pbXByb3ZlX2tlcm5lbF9jdmVfcmVwb3J0LXNwZHgtMi4yLmJiY2xh
c3MgYW5kIGltcHJvdmVfa2VybmVsX2N2ZV9yZXBvcnQtDQo+IHNwZHguYmJjbGFzcyBhcmUgb25s
eSB1c2VkIHRvIGRlZmluZSBJTVBST1ZFX0tFUk5FTF9QUkVGRVJSRURfUFJPVklERVINCj4gYW5k
IElNUFJPVkVfS0VSTkVMX1NQRFhfRklMRQ0KPiANCj4gQ2hhbmdlcyBzaW5jZSB2MjoNCj4gLSBG
aXhlZCBTUkNfVVJJOmFwcGVuZCBzeW50YXggKGEgc3BhY2Ugd2FzIG1pc3Npbmcgd2l0aCB0aGUg
YXBwZW5kIG9wZXJhdG9yKS4NCj4gLSBSZW1vdmVkIHVudXNlZCB2YXJpYWJsZSBkZWJ1Z19zb3Vy
Y2VfcGF0aA0KPiANCj4gQ2hhbmdlcyBzaW5jZSB2MToNCj4gLSBJTVBST1ZFX0tFUk5FTF9DVkVf
U1JDX1VSSSBhbmQgSU1QUk9WRV9LRVJORUxfQ1ZFX1NSQ1JFViBjYW4gYmUNCj4gdXNlZCB0byBz
ZXQgYSBkaWZmZXJlbnQgc291cmNlIHJlcG9zaXRvcnkgb3IgYSBkZXRlcm1pbmlzdGljIHJldmlz
aW9uLg0KPiAtIElNUFJPVkVfS0VSTkVMX0NWRV9ORVRXT1JLIHZhcmlhYmxlIGNhbiBiZSB1c2Vk
IHRvIHVzZSB0aGlzIHJlcG8gb2ZmbGluZQ0KPiBiYXNlZCBvbiBleGlzdGluZyBmZXRjaCByZXBv
IGluIERMX0RJUi4NCj4gLSBBZGQgc3VwcG9ydCBmb3IgU1BEWDIuMiB3aXRoIGEgbmV3IGJiY2xh
c3MgaW1wcm92ZV9rZXJuZWxfY3ZlX3JlcG9ydC1zcGR4LQ0KPiAyLjIuYmJjbGFzcy4NCj4gDQo+
IFZhbGVudGluQm91ZGV2aW4gKDIpOg0KPiAgIHZ1bG5zOiBhZGQgYSBuZXcgcmVjaXBlDQo+ICAg
aW1wcm92ZV9rZXJuZWxfY3ZlX3JlcG9ydDogQWRkIGEgYmJjbGFzcyBzdXBwb3J0DQo+IA0KPiAg
Li4uL2ltcHJvdmVfa2VybmVsX2N2ZV9yZXBvcnQtYmFzZS5iYmNsYXNzICAgIHwgNjQgKysrKysr
KysrKysrKysrKysrKw0KPiAgLi4uaW1wcm92ZV9rZXJuZWxfY3ZlX3JlcG9ydC1zcGR4LTIuMi5i
YmNsYXNzIHwgIDQgKysNCj4gLi4uaW1wcm92ZV9rZXJuZWxfY3ZlX3JlcG9ydC1zcGR4LTMuMC5i
YmNsYXNzIHwgIDQgKysNCj4gLi4uL2NsYXNzZXMvaW1wcm92ZV9rZXJuZWxfY3ZlX3JlcG9ydC5i
YmNsYXNzIHwgIDMgKw0KPiAgbWV0YS9jb25mL2Rpc3Ryby9pbmNsdWRlL21haW50YWluZXJzLmlu
YyAgICAgIHwgIDEgKw0KPiAgLi4uL3Z1bG5zLW5hdGl2ZS92dWxucy1uYXRpdmVfZ2l0LmJiICAg
ICAgICAgIHwgMTkgKysrKysrDQo+ICA2IGZpbGVzIGNoYW5nZWQsIDk1IGluc2VydGlvbnMoKykN
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL2NsYXNzZXMvaW1wcm92ZV9rZXJuZWxfY3ZlX3Jl
cG9ydC1iYXNlLmJiY2xhc3MNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL2NsYXNzZXMvaW1w
cm92ZV9rZXJuZWxfY3ZlX3JlcG9ydC1zcGR4LTIuMi5iYmNsYXNzDQo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgbWV0YS9jbGFzc2VzL2ltcHJvdmVfa2VybmVsX2N2ZV9yZXBvcnQtc3BkeC0zLjAuYmJj
bGFzcw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvY2xhc3Nlcy9pbXByb3ZlX2tlcm5lbF9j
dmVfcmVwb3J0LmJiY2xhc3MNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMta2Vy
bmVsL3Z1bG5zLW5hdGl2ZS92dWxucy1uYXRpdmVfZ2l0LmJiDQoNCg==

