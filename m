Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D57C7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 18:00:17 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.25])
 by mx.groups.io with SMTP id smtpd.web11.2378.1750269609041316834
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 11:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Zlvubnxd;
 spf=pass (domain: siemens.com, ip: 52.101.71.25, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chUFkZtRsa2MtkQy7iXfyGY1T2RIA+iThGVQOQiatURPnX0cNveYDtm4KfWI6uxxUtmleoETntIK2yDh6HJmBX+A3PqTN5rAhlKy3NNr5VEp9XKxu6aftQYCcSKPDrcOxNj8yA/iB5uA+6YQckN7bRkBksvYr1rspn5h9LhA6erSgnQxjRnAVqJO0e+pnuq69R2QUxrMp4tdZLTQ0b5t9ZRDgWC8aNGOpe4NVIUvv0i2m8UT3zsuijxucgsOn0RGIrEM0JFibjVvI9Y1bfFFoUgfclcQaDiBaAgr3yJruZvgpGa3/4cq0J9fm39EfVtWMxRrKqtaSylHm1r8phIsfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vvVBhqnqkLOW+pE+TFtSnaDRDZD+f3V0he987GZnz4k=;
 b=TAy+jH2A+BGZqOpjqMARJCIFAQVUeFCGcIC+AYmTKstKNS/jC+GRlNM/taKyXLcj4Bc5VC3pvY010Kn+btEtVbmr/lNsx38CHTn9DErPg5Da65LR9x83v7ynAaPhoWa0Vfs5Xr6bPksfdn+QPjQfTJ7N+ljHQ/wsWS61yD6bSEfn/o2nKyymwkFeO4y07RYqa9FKhGN/Itcz1e83T7blws8HGSi66oz4ai8sXch1eiBx9Ho8jGWaFuyDYeFC/ANYHYnGDfcliFOtiZfMPJIituUP3sUqYaspeS5K1klMY9WDFC2dORayQc5dJD+C8sJR5Od6JEIB+exLRbgfJiEQig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vvVBhqnqkLOW+pE+TFtSnaDRDZD+f3V0he987GZnz4k=;
 b=ZlvubnxdWyIVftoI+uaaBWimMgfSuFZd7DzzYJuEJBt5OyeFi9sr5p5dQLF5+yhKrte4Ds4/Xsz7tO8fMyA+zBspFISIMTB3Q/nefLpJVDlwadH4RDjEMVfI/IBe1z8IWhqK1VrGd3Svjgm+reSQYwtjev6VhodLdWrPtD24SGAZ1tgFX//0Pwtj3jHEAt39XB1KQwgy/entlcmawd045O0VWbRMPOcVEPmcmELAdnNAyvNRpOa8O8pJGz1Y/reQuhESXKjC4p/kcSBQh62S3xK5rdOXODJbYSJPddtMtLSVnowHwc30T5B6sZU5b6XltTs6kizxXEo3Nd9ayZXm/A==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB9PR10MB7387.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 18:00:05 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%4]) with mapi id 15.20.8835.018; Wed, 18 Jun 2025
 18:00:05 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] glibc: stable 2.39 branch updates
Thread-Topic: [OE-core] [PATCH] glibc: stable 2.39 branch updates
Thread-Index: AQHb4HWNus5AotT2GkmxTg15xQ6xJLQJLoMAgAAF8PA=
Date: Wed, 18 Jun 2025 18:00:05 +0000
Message-ID: 
 <AS1PR10MB56976ADAB5A27717F9BC57F2FD72A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250618172131.2131228-1-peter.marko@siemens.com>
 <ff7d6019-9983-4bfb-b625-2ea3163cbaff@gmail.com>
In-Reply-To: <ff7d6019-9983-4bfb-b625-2ea3163cbaff@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=0079341e-186d-43bc-b2dd-2c3f80c97ad0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-06-18T17:59:06Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB9PR10MB7387:EE_
x-ms-office365-filtering-correlation-id: 07e34ac3-061f-44d7-1a51-08ddae91f4ac
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Mnp5QVZWZ3dLY2RDNE45dEttMTk2TUxNeW8xbkJnbG1TMzBQaWhkQ3FTRGVE?=
 =?utf-8?B?Ri9KdEpJTURuVmlVTUpyVGtsK0hhcEpnRXh1UlNQcjU5RDVTc1NGWlJkRnUx?=
 =?utf-8?B?OWVIVHAxVlgwbkpPenk3NzlHZ3VrdGU5Z3RUaG1DNGdyRCtHdVE1dmFsZHFN?=
 =?utf-8?B?R1J3dmFpOS9wZktOL2JXcUswNDY1OUVKRnRGRjFSL2RFMXkrUDhBeEJoSlZV?=
 =?utf-8?B?TmVRZkVRakFGaFpjNEpFK09hbkQ1eVFTc3pMSU15UFUvMFhkL29XOElkZGRp?=
 =?utf-8?B?YXF3SFRuN2poaktvRDZhWXMvUFA0YVNvUkM2cERuRDVvNWx5YTdqYTRFYzF1?=
 =?utf-8?B?OGc5dHlUVUFOSFpQdUZwdkN6V2w4UUFHdmUrOW9TZ2NUdUxXbDlHK3l5RFFX?=
 =?utf-8?B?cDFCUVFmTExqdkRyaExFcWYvaHYxTmx0RHYrU0MyYmhxaXVhRXo0aGd2Y1V3?=
 =?utf-8?B?NXQ5QVp5bDhnTWhQa2tuUy9tSFpQcHhsamwwR0JldVQrYkxoS251bFJSZi9D?=
 =?utf-8?B?d1pCMWJQeC9wN1g5MjBCb2hYL3FJYlFOblE4eC82M29YZktSbVFWRVEwS2t0?=
 =?utf-8?B?WWNpc0YxNHZFT2I0bDRlNGk0M0tIYmREalpQekJReHJNcDhwdUFUSjRzM3Ba?=
 =?utf-8?B?cCtBS2E1dVVCU08zS0VMV0NoNVVSa1FjV0lYaUJOdkl6c2xPRXF1UDJXMnhU?=
 =?utf-8?B?R09FVlpsd29GbC9lMk9aR3I5aFdHUDNwUTlUcm4wM1dob3JOcFJSbG41Yk9m?=
 =?utf-8?B?bWlESmtkZnpoUnoyNXcxZ0FMSE94YzREZUl2eWVHL3lqRzRFaE50SDZVZ3Fx?=
 =?utf-8?B?d2l5ZFVLNTlvREQ4MkRIVXdaZHA4Q3lROEJreFU5aCtpYjQxa1lhd3hPSGQ4?=
 =?utf-8?B?OHhuK0s2TVBmVUxSU1Y2UDBOUjV4ejZRSmk0VjVGdlFKUWxFRUxPazVCdmdr?=
 =?utf-8?B?T2padXU0MWdkdFg1djd5OGU5VDJrclZJenQvREY1VnhYbWc2WGZIZU94em52?=
 =?utf-8?B?Rk1MM0tGSjRIMXVkU05qYnNxNGlicUlPaDB1dmoxM242bEFzazd3V053NTlx?=
 =?utf-8?B?Q0VkOUdqWUlHMVBlYURuZXpGdzltYzJUZUlFYzVMOUJZTlllTzlvSytVVzN1?=
 =?utf-8?B?K0cyTWJHL3k2SnhGSmFubEcrSm8vT2FWdUhqYlRHY1BuT1ZVQ05obitFNzFr?=
 =?utf-8?B?a2U0WER5cThHMU9yUE5pMDJISEZMRXdJSWl0WVVFamNFdXpNcXY5bGh4QWlV?=
 =?utf-8?B?eTJFb1pQVkFjb1V3bkhHRk5qbzBnSFdUNlNQcW1qWTlNMDIyZlJWbkhvVHVG?=
 =?utf-8?B?Z0RRbmEvSnE4dnNQek9wc1RwYndNU0E2TFpwcjlrQXBmZWtMWTJYRHJGSzhJ?=
 =?utf-8?B?dXdPTjdwNDdwbTk0SXUxaHRNRnpZK01OV2xGMFBGMUpRamZoV05HMWNMWUJz?=
 =?utf-8?B?MzNNTDV1M2NvZkYwZWYxQ1JsVVFBenZEaXRZSUxIWFNFc1BzaXVNNW1VajEw?=
 =?utf-8?B?elQ5OG1hMmlYZFB6YTVQSWVNb2ZMOXBBMmZFMzZxaFpEOGFoTVExZ2RjY1dX?=
 =?utf-8?B?dE5mTFAyclQ0alpjbmYvQmdBOWhHN291emNuVWhQUDQ3TytDa2FWMFE5RS9q?=
 =?utf-8?B?NWdITGVIOVd4VHBwU0FQcUU2dUFqZU9lUnBlUXp2akE1U2tSZFBuT0h3cUFH?=
 =?utf-8?B?RkZjMWJ0WUFaUmxKYWZFeEFwL3EvaXEwZ3NnODd4R21LUVNXYXd3b3dHT2h1?=
 =?utf-8?B?aHJtcFdTakc0Z3RBR2lKRmZjTTIxa2YvMWV0STF4QjVpN3FzK1pLVFZTTW4r?=
 =?utf-8?B?Qzk5bGpTc3RGYU9HcUZqQ0l1MG1jKzZtckc1NlV5WjhFa3Q3cEZSdG5ubVZu?=
 =?utf-8?B?cXo1UVJvUEFMNkJTYmowb1VDTkszYWZOTnlkSUZHcisrdVgwSE9QdCtVWTF6?=
 =?utf-8?B?MDJvdkZpTnp5Q1VWR0x4aFpOcTVlQ1JMRGdVYkJrb1FseHErUDBsUzRLRUwz?=
 =?utf-8?B?cnlGbi8yWldnPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?b2E0R0libEVUYWwvak1hSWZTUks4amlrV3FXNVdCQ1ZqSEZTMEZieXBrMlk3?=
 =?utf-8?B?OXd5VVVyTXA1N0FDYmQvNHZacDlwV1huZU9mUGlYcDdDOWxVUklmVS8wR2w0?=
 =?utf-8?B?N0hxUjVNMENuVTkvUXI1Z3lEK1YxOGpvODhURTVSUmk5dHRyd2V4bkwwYUJ5?=
 =?utf-8?B?aGxaNzNLblEyczU3RG45YUFnY0FMWjZOeE5UTnM1QWxoNlZjUHpaMVUvU3Jv?=
 =?utf-8?B?MXZvQjVibSszREFmUmU5RHRuOXVmTWhvRDFhSVFXOWhha1pBWjJwRi9FUlZs?=
 =?utf-8?B?SHY3ZUVJWjE2NElrTUpqcU9uc2dYV2toNHZvaHpSbEVTSmZkamkxbXR2UFFQ?=
 =?utf-8?B?SGNKZlBGT0VFcTBMUUs0bjlMZDdPWEZMVys5NVpSUlBubmJ4ZUtQdFp5aTdw?=
 =?utf-8?B?MlYwSlVkY0tYamQ5UVNrQ2s3ZlVObW1kNTRCcUE3azd4WVdGZEdROXN6cytH?=
 =?utf-8?B?T3doeXJzbzNreEErK1J1a2MyMzlRT3UrMDB2Tm9ad0FXVk9oSnJFZXVmN0M2?=
 =?utf-8?B?c09IVkdrZThhUUd2WVJnM3Z4cUN5dHg3S25MNmRmN1VUMGtkNll6TWI2YS9n?=
 =?utf-8?B?TG4yR3NucG1SV25pRU00ci81eG43QUlnZ3k1K2xLU1JrN05VSkY2M1RlVXcw?=
 =?utf-8?B?TU9qT1oySGllaVNPUFBhZXg5T1lPNzhUZDRrY2xBTFMyZWE1dTlYQ3JzK0g2?=
 =?utf-8?B?bi92V0N2b3ZmRjVJRmNlMVF2dmdNQ1dzSmthc0pWTy84cjQvTkhvZE84dm0y?=
 =?utf-8?B?VVdnZTNtSkllK1ZBTWxYYlVETkZCL3dzZStLN1dxaGhJaHNNR0NVSDZJUVFq?=
 =?utf-8?B?Q2JqQTdSdW54VVl0UmxqUVhhTU8wOW9nU3dMRHhncE42RHRVNTk3ejhDaE5h?=
 =?utf-8?B?bHNCcC95aWlwSHI2blUxVTJqRnpURW16Q0ttakdjNllLZW5LNWlSNzlKWVpD?=
 =?utf-8?B?czI1bE9lNUx3emRkQ1pUa3NOTnFEUWQ0bmw2eGpaazJqYVRCUVl2N280bGNy?=
 =?utf-8?B?NEpCT3ZGdFYxbUpHRlRlVnpUTW1aZGdJRjRQZ3JiSTdaSGFzVnRzY1dncjJa?=
 =?utf-8?B?Ymtqb0VOU01Cb3Y4ZEo3RVZBNEF4RDdDWUZON0l3TDlRU1hHbzFERXBwckdU?=
 =?utf-8?B?N3c5RVBlYWl2UlF0elIvVEJqMjFhZXVNR3I5SXVCVGZIaWJwS3JHTXBIeldh?=
 =?utf-8?B?VGRnV2xRQzY2Ums4Y2IwWmMyYjBCZDZSWi8xNUFmUmVESXVGYW5zY281ZUpz?=
 =?utf-8?B?Um84a2plTGhrK2dvZDZjTGRYRWhxL29xWWIwd2tIL1g0UnlpY0FmUTNiUk92?=
 =?utf-8?B?amtPQnVDcjRJK1k1TU9KZDNpbXhjLzhOMmVNUjVjT2pjZVdLejFlRURzLzQ4?=
 =?utf-8?B?ZjBUV09YRUUrUFJma25MWE5wa2hlVGlvcFZDdGdnekFUekhhckpaSXJGL1VQ?=
 =?utf-8?B?RnNZSmw3THp0Tk5VWkQzRXc3bVM3cFlPcEZZaG9xWGJxUXJkaVlzNUlxaW8v?=
 =?utf-8?B?MGRBNmhIT3l3K2FCNGxnbm5TbXVmbmpiNXU3TjhaYS9WUy9jc09jK3JNaDV3?=
 =?utf-8?B?VkxkaC9jM3llTERhc3dZcXMyNUhhQWRheUQ1Ly9SYi9sbUI4QU4zVUpRck96?=
 =?utf-8?B?WVZSbUJ3V3lvbm1VWTBveklpVGo2Ukl3ditaUmpMTzV0c0JRZGk3WHltS0pI?=
 =?utf-8?B?YVhGTHFycmlUODJ1WjBjWHRzOWZkQ3doQXFQVjJRbjF6N1ludkpVdi85SW9D?=
 =?utf-8?B?djlTWU52RlJaQjNYTXU3WTZMY1R2UFVRTG9zL2ZqSVZZSlBWNS9MTVF6NEp1?=
 =?utf-8?B?RlZUTFdJQnZRckNNRHVSV3R0Qm9OZXBFVzV4YWM4TGRBMllncDQ1dG9EQmFk?=
 =?utf-8?B?MEtKZXF6d2hBS1JKWW01U04vWmZtVzA3TjNHV2laUDlUN2NIVmVORlJUZFNR?=
 =?utf-8?B?V3ZJWW55Y2prOXRnSktEbm9GZFY5aWV0VUdNbGV5amcxOWhQcTh0b1dEdXBq?=
 =?utf-8?B?V0hWRGJlQ25SZ2t0TDBWQllNaVZ4Ym9qVXRZUzV6b3VTTDNOVk5kVlF6aTJW?=
 =?utf-8?B?c0pOQkJ2SzUzTG1UaDkxamtHQTMxNVlZYW50RmhwRFlVdDVHazlCK2ZWN1Bw?=
 =?utf-8?Q?fSExfhLSuSC/ShIqbm4ST030N?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e34ac3-061f-44d7-1a51-08ddae91f4ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2025 18:00:05.4276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G+z33ZI4yQ+A0zpZhn9KWVlmG0mEXx5AKuT96p+AjssAntbIu3uWccnngWKHj6tw3OwI1Gz2l1vtLX5WzEzCYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7387
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 18:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219031

V2VsbCBzcG90dGVkLg0KQ29weStwYXN0ZSBlcnJvciBmcm9tIG15IHNjYXJ0aGdhcCBjb21taXQu
DQpOZXcgcGF0Y2ggd2FzIHNlbnQuDQoNClBldGVyDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gRnJvbTogR3lvcmd5IFNhcnZhcmkgPHNrYW5kaWdyYXVuQGdtYWlsLmNvbT4NCj4g
U2VudDogV2VkbmVzZGF5LCBKdW5lIDE4LCAyMDI1IDE5OjM4DQo+IFRvOiBNYXJrbywgUGV0ZXIg
KEZUIEQgRVUgU0sgQkZTMSkgPFBldGVyLk1hcmtvQHNpZW1lbnMuY29tPjsNCj4gb3BlbmVtYmVk
ZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVd
IFtQQVRDSF0gZ2xpYmM6IHN0YWJsZSAyLjM5IGJyYW5jaCB1cGRhdGVzDQo+IA0KPiBPbiA2LzE4
LzI1IDE5OjIxLCBQZXRlciBNYXJrbyB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToN
Cj4gPiAgU1JDQlJBTkNIID89ICJyZWxlYXNlLzIuNDEvbWFzdGVyIg0KPiA+ICBQViA9ICIyLjQx
K2dpdCINCj4gPg0KPiBUaGUgc3ViamVjdCBtYWRlIG1lIHNjcmF0Y2ggbXkgaGVhZCBhIGJpdCB1
bnRpbCBJIG5vdGljZWQgdGhhdCBpdA0KPiBkb2Vzbid0IGxvb2sgY29ycmVjdDogaXQgc2hvdWxk
IGJlIDIuNDEgaW5zdGVhZCBvZiAyLjM5DQo=

