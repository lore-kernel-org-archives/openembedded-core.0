Return-Path: <Oliver.Rohe@wago.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E91C54F30
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 08:45:47 +0000 (UTC)
Received: from mx07-005c9601.pphosted.com (mx07-005c9601.pphosted.com [205.220.184.198])
 by mx.groups.io with SMTP id smtpd.web10.46640.1748335538816192607
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 01:45:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wago.com header.s=p012021 header.b=JxFZR1RH;
 spf=pass (domain: wago.com, ip: 205.220.184.198, mailfrom: prvs=1242aea4d6=oliver.rohe@wago.com)
Received: from pps.filterd (m0237840.ppops.net [127.0.0.1])
	by mx08-005c9601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54QNA2kb023635;
	Tue, 27 May 2025 10:45:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wago.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p012021; bh=4G
	SRu5YZO1qR9Su3mIDsEjbmn7Jo4+HoVK4jQhhhnOg=; b=JxFZR1RHqPNSTdrUFi
	2vUvQBWyqWSummqXzlL+98D4IZG/FCuUFr2jMVwZIHgiKUTowBMbB82DH5jNphNP
	TkD8aVNSIHNqZQM3E09qggsfcX5pNAGmYAeR38baj/NwdXpO501otJ6ty6Otb/wI
	Y/UUM1cs2uXW92D6F/KOALAjojxB3XD2drKWvcbMYAlW+0h7HeJ0YbZTaUnY6dur
	6LMChzB7I6Ip5R83rFg6AWDJG4uY2Fs9+4m2xMCwdoc96OAAEGYO5Y1IZ+z2CbaT
	2Sivl1H+I6/MIsNF76bNoUdULi2SvVpB0i5PZDlXSzSxOKwurqF8XSdptGyyEsap
	jl9A==
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazlp17012015.outbound.protection.outlook.com [40.93.64.15])
	by mx08-005c9601.pphosted.com (PPS) with ESMTPS id 46vdn71m8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 10:45:36 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JWMtuBXbBGijeRAfbZFeRVgN4DZKdhTJURkeh+pyB7L15/3vF1vC9d+M/anRcTkyKiiSYAkVqCcc97nHD6aa/W2i5MS4jv2mwxVHshgVuyjCJ8JZC///51R0JuU50Vql6wcwpjsyTsIUDVeNRBP+bcAUrJyNlifRgGaJrDrBfC+EZQ0apbtbWi+ci8dyJ1KyACGyhLnzRrNERI6Tj6dWRpCl0FlGs/SmXvkGIBglEKE3m3coEWvVLKOWskjcEKOgAiU0uTPQjtLGJHuZJxyV062cBx+8dUAkvIR3F0Tfqi1hLGYagqKzkUy6pCQAIRZpdGgQyJyNtZm8x4nsD2dgOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4GSRu5YZO1qR9Su3mIDsEjbmn7Jo4+HoVK4jQhhhnOg=;
 b=pLWrIInCvxIw3e4NwS9kNyE2/PsxlcseJJDobyVRIF1cJKU/ayl8ASAp+tZncBRBE8rd5Rd7SEeGM0+VmW00yg7fpwvtkmVxetYT6xx8XkrDKmQihGZyzyiZbn9bhFBBMf93otGuKoEXvlgQVr7b7uAPgENhxzGTq1DsD9/M6d4r5CpZKFIwhoaFtQdN4F4CBJTOg6o6WHReZEjY8aL/Z61V7mfcfrwXFoCnjQ9au6wBXxjL60L1sovwK5IE0CSkbqlaCiRPPUE4eH9/y3yxMuMghLFaSktJ7rSfNW5gEnSk/KqODs9nGEbwzTUJjyo9jcWj4vyOTjm3dKGORhX1rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wago.com; dmarc=pass action=none header.from=wago.com;
 dkim=pass header.d=wago.com; arc=none
Received: from DB4PR08MB8102.eurprd08.prod.outlook.com (2603:10a6:10:386::8)
 by GV1PR08MB11148.eurprd08.prod.outlook.com (2603:10a6:150:1f4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 27 May
 2025 08:45:34 +0000
Received: from DB4PR08MB8102.eurprd08.prod.outlook.com
 ([fe80::93b6:7bd:c4e5:7e99]) by DB4PR08MB8102.eurprd08.prod.outlook.com
 ([fe80::93b6:7bd:c4e5:7e99%5]) with mapi id 15.20.8769.019; Tue, 27 May 2025
 08:45:34 +0000
From: Oliver ROHE <Oliver.Rohe@wago.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        "Freihofer,
 Adrian" <adrian.freihofer@siemens.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] kernel-fitImage: allow overwrite the
 configuration dtb label
Thread-Topic: [OE-core] [PATCH] kernel-fitImage: allow overwrite the
 configuration dtb label
Thread-Index: AQHbxlwJ3kd3lvqCT0yrzOhlqhd1qrPaM8CAgAEHCDGACE92gIACsAXw
Date: Tue, 27 May 2025 08:45:34 +0000
Message-ID: 
 <DB4PR08MB81027DE5D9C9EE756EB7B4F29E64A@DB4PR08MB8102.eurprd08.prod.outlook.com>
References: 
 <DB4PR08MB8102C882795C5B8725105A0F9E93A@DB4PR08MB8102.eurprd08.prod.outlook.com>
 <f5080c649ce5d0f214dfdbb69a25449923b2948b.camel@siemens.com>
 <DB4PR08MB81021F9904E04AC45A79E58C9E9FA@DB4PR08MB8102.eurprd08.prod.outlook.com>
 <DA5CTDEBC874.1EIJ5IZLFGK1Q@bootlin.com>
In-Reply-To: <DA5CTDEBC874.1EIJ5IZLFGK1Q@bootlin.com>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_6b160f33-c33b-4e10-8636-cf83f9ca7d3c_Enabled=True;MSIP_Label_6b160f33-c33b-4e10-8636-cf83f9ca7d3c_SiteId=e211c965-dd84-4c9f-bc3f-4215552a0857;MSIP_Label_6b160f33-c33b-4e10-8636-cf83f9ca7d3c_SetDate=2025-05-27T08:45:33.728Z;MSIP_Label_6b160f33-c33b-4e10-8636-cf83f9ca7d3c_Name=Internal;MSIP_Label_6b160f33-c33b-4e10-8636-cf83f9ca7d3c_ContentBits=0;MSIP_Label_6b160f33-c33b-4e10-8636-cf83f9ca7d3c_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB4PR08MB8102:EE_|GV1PR08MB11148:EE_
x-ms-office365-filtering-correlation-id: b5ff431c-2c0b-4e09-aa86-08dd9cfad876
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-7?B?WjVpUkdxbTF5Tkl2b2NFcHBQdEZDTkdCbnp1NistbndrVTBXTm1OdGxrZE12?=
 =?utf-7?B?NUxETkR0UFFLSlR1NW5Zblp0eFNVeHV0LzdXVTAzV29OS2tpZnJnMDRTM2lm?=
 =?utf-7?B?WVlJS0g2Ky1NeUdHUHdvRUJ6c2FmejNWTUZ2UVJJcm9IUm81a2dwTVpwME9Y?=
 =?utf-7?B?ODlTSThtWUtWTWNxKy1UT0Rkcy9BNzhxR3QySkFUUDZkVFZ4T0tkbklSaUhl?=
 =?utf-7?B?SS9SdW84TUJGMFh0b2xnREE5bmVMTTBOMi8xVmlKWGJOQU43RGlGMEJ6aTZN?=
 =?utf-7?B?MW9jUWJWc2J2ckVOMjV3bmNEWDRHNHFqNzFLUkZHenp5cDZiY1hqV0MxeHF3?=
 =?utf-7?B?V3pNaktDUGp0NmdaUlA2THlKd2lPYURTYTRIemR0MUhBRzY3TEZ2RTVKSllV?=
 =?utf-7?B?V213c25ocCstc2N4S1FyRnN4SGxmeTdkZjQ1Z3JYTGtkYTY1OWxNcystdWli?=
 =?utf-7?B?akE1SDNvdFgyNERtaEZrZ1NYWG5vdjVQb0JldG5acG9uTTZYVUdUbFJ6ZlVD?=
 =?utf-7?B?T3AveTYzN1k1eGJmOTdmOW4rLWJhWmdwNHE5MjdTZnpDaWtXOFVIVDNPSEU=?=
 =?utf-7?B?aistSVAvSWM5Z0hOQzVxR1J1S2pqQmZKZ1RoeXQ2MWNvazhweG5Od3dyNHM1?=
 =?utf-7?B?UURPb1lyUXQxM0cvSGxyUHVCcDRPc2NxWEsrLWZhakpGUjJoWThIajBKOGJH?=
 =?utf-7?B?ZDEvVm9odHFScmhoT3lLN1NsZmY4VEM0QS8wUURpQkV0ZFlsWW5lVk1mOXN4?=
 =?utf-7?B?SjhDYTRsSE1UT2hRU25iYTY5R0g3ZVZORGI4SForLWJsWDQxWkhRZVYwd1g5?=
 =?utf-7?B?Qzl6ZkJvNFM2MU9tdTBacG5laWdHeVRjTGc5VUVORGFrdGoyRW15aWxDRGhI?=
 =?utf-7?B?bVdkQXQ0clBGUmRsUzNqams3ODNHZkZvVHd3endKdTl0cVA1MWJVR0k2MWlD?=
 =?utf-7?B?d1BoVXNXQystTzBrekxUVUs5OEMrLXA5ODlCVjZlaUFDYU85bHVXeHZMaE0=?=
 =?utf-7?B?Ky1aeUpZSkJGSjl0ZmFQQ3dDQ0JXM3piaUZFSFRRVjZlL05oNDkybmpqMnpz?=
 =?utf-7?B?UFhwR2xBaVNlb3hQcHRLN0haLy9FUWhjL1YrLXJqMnFLelI0VDZPYTFucTM4?=
 =?utf-7?B?SGNIY3FwbUdDUUtlNDdGbllRT2puaWtQRmNsV0I2VkFpZTBmbXAwVmpxaDk0?=
 =?utf-7?B?SWhiQXplQkVDVHlRS0Nta3M3VXFaQVM1ZUJOVGZNOUJkYnVkV3RxQXpGcWlG?=
 =?utf-7?B?eTRIMUd0ZWNSRCstNnR2cEowVystTnpCUTBvbHRHSmxqZzV0bldOQ1pkZ2ov?=
 =?utf-7?B?UTI5YlA4Z1Y4RUJ2c0x3YmdMalUydWtxSFJEZ0dRcHVrSystV0UyUWJhTDlG?=
 =?utf-7?B?YmpGMHVVYWprVElWa2crLWFBM3ZvTVd4N0N1dFlzSVRjUUlLTHE2TU5BemFR?=
 =?utf-7?B?S0ttSFBEMnQzT2czSTlveWFBS0hmNVU5ajJLRWxiYkFrZElENGxHU3Zvd0VF?=
 =?utf-7?B?Q1AyQ2p4aXVWck1FKy1HaVVtb2w5WXNscEdIeVZGaDlXZFBHcXNYbWFldGIx?=
 =?utf-7?B?SnpsVGR1aVlHZGdyQ0F6eU5CUDRqZ0F1ZTZ4VWc5NFpIcFJvNlV1dGhkV2ln?=
 =?utf-7?B?ci95UnprUldVM2c5WlNiaElIc1RPKy1ab2NzTjhEOWFFMlF1Y29nQk4xY1lE?=
 =?utf-7?B?MnZwM1dPcXE2bG5haDJyNGc2R3NZU1laa1FIeUZqZmRuNDRya3ZTTFR3R2xD?=
 =?utf-7?B?M0RYY0VZOXRqMFl5UXpZekljaDU3cGxBQ2RHUURRdkk0cjBaVTNnVUNrNG9l?=
 =?utf-7?B?cklDT2JIek5NYndyYjViTmJ4QmovZ3Q3MTZ2bE95ZDV6MDBnTVoxSmkwcnlW?=
 =?utf-7?B?RGM1NVBXMEhjVHNVekx2aE1aMzZveVBYQ1VsMXBleTFjUnBHbXpSRFU2V2k2?=
 =?utf-7?B?WWEvVktIck5XRDZ2c3JDUmJQb01JZlhoRUgzSzl6NEUrQUQwLQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR08MB8102.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-7?B?S1BZYW15YzdQSGxDKy1LOUtzRnN4anhab3NDVkUyOFJ6cVIyc3VsRUo5bTF1?=
 =?utf-7?B?bktRY3J2ak9SNVN2TklCOU9iZWV4Q05za0NaaGxZRXMwU25rQU1KazFrR3cv?=
 =?utf-7?B?L2h0WW9pQUxaUGwyZ2hQTWQ1UEU5bXc2eUVoOTFJWGI1TjZFdnlXMjhCQWFt?=
 =?utf-7?B?cEFkU0hQSDYwSDdpNVZvbUY3Nm53c1VhWnI0Ky0wY0V4Q1lDMzZnWW5JZkd0?=
 =?utf-7?B?TFBlWUkzRXVFNFNIRk1NVG00ZnRhaDR4R3Nwam1FYy9RZHlOV0VQMUVOUTJP?=
 =?utf-7?B?cUhwcE85U1JMRmQyaURLM2Z6SVJRaVBCbGh3ME91SjdXY09PZTNyN01uYnJn?=
 =?utf-7?B?LzJlcWtDL0VRcnBnTFo0VldOcTQ0V0t0dDZsYjQ1RlhBQm5pOVVRKy1WQXlF?=
 =?utf-7?B?cFBYc3VmRUNGeWlzdEF0cjNubDNWRXZ2bkh6NEJWS0owVUhuOVkyZExkaGZi?=
 =?utf-7?B?enJJdE40RzdESUdBMEVoSkw4eSstMnp5d0FnUWdqM1J5RmcxR29vOThFcGZ0?=
 =?utf-7?B?UWJJYmFhTEJpQlFrWDM2elZ3RzErLU9OUEsvbWZUaGM5S2tDY3Z3RFE3dW1q?=
 =?utf-7?B?SXFsRTd0Zm1DdmdieGI1OVBrSjE5cm42ZHBic3V6Qm11WWI0NXpwakdLcEFP?=
 =?utf-7?B?ektma1Jxamlsc3JXRngvRlQvTEhTMFNic0tJaXVLdEMyV0Ryd1o2cmZCbjh0?=
 =?utf-7?B?b0Y4U1M4azkxSzQxYXVVMDlGZVdOaWVrMmhmNnoyL2ZLb3F0eHRwTktRUmxC?=
 =?utf-7?B?Mm04aTFUZ0xjekFhSystSkEyUFd0OWU0RHIybGpYZTgyL0taZ2JyMnVCbXAx?=
 =?utf-7?B?NG1VWEg5Ky1mWVlpVlBnd2d5SGFMMUdtV2ltbko4b1hFN05pbWRvRnBkNUF5?=
 =?utf-7?B?MHVhYTZZbGZBSVVCZEgvQk9wQmVBWGVhak8vQmx5emxCcGw3TEphNHoyN3hH?=
 =?utf-7?B?Q0RhRWtkVXlCb3lXVDNmcy9CQlRyd0tqL0JrWEhOc3RualBmTystbEh5Y3F0?=
 =?utf-7?B?OWJWSi9CVlZFdmI0dkttUnR4Ky15Q25XZ3hJRmROS01kRUxMSnZnL0VxTS9U?=
 =?utf-7?B?blFuZU1IdFFTNnZvSSstKy1VUDZQTk12QXhidXJ2RkpUa3hEOU4yRVpwMEhY?=
 =?utf-7?B?ZEFXZ2hRZE0vYWpWWENub0tqUERyKy1nVGZWOFNWakZ6T0tqMU52N21iNjlP?=
 =?utf-7?B?TGVYeC9TZSsteUR4bVBKQzM3bjY3cEhhdmRtSnY0MVFmakw0YmgzdmlGKy1r?=
 =?utf-7?B?Qzl0dTU3eVl4QkZQM3FDRkFtczRhLzlxVmF0aTFBSldBKy1XMExOTmFWb2RX?=
 =?utf-7?B?VjJDMmFna1dSRUMvZUl5UzJWYSstSGhudjRIRTJISi9aR2xNWFV3UUNoN3pW?=
 =?utf-7?B?b1R4NkU3UEFNN1FwWG8vbm5hTlN1WGJrL2VXRGljV1M4V1JmSkt6UjNhYmJ1?=
 =?utf-7?B?SEhkVUFCU2hEa3d4Zy9FczZkbjdDT1QrLTRic2p1TGRGWHJPS0Q5L1hEZWxp?=
 =?utf-7?B?NG96SmN6UjZoQnZVT0poUGg4RERqRE1vNDhzZzNSTHNhcnlVVTIzM0srLThz?=
 =?utf-7?B?enpUc0x3cW9ONkdCR0pFbWcxZ1dsTHpsOFFybnVMYkRWTVhwQnNpV0EvTGFm?=
 =?utf-7?B?bWFwMUpwU0dYMUFRTkJnMCstempvT0xpczBXMTJzTnQ0Ky1iNlZNRXR5Mlhr?=
 =?utf-7?B?VnFuMjV6Qnl2ZVNwd084clFCS2JOMUN4dFdwNnhod2FBTmZTZGRaYXNwd0hD?=
 =?utf-7?B?Zk1CcTVIb2hRWG50WW1mUEp4Nksvci94ZWNZTFhDNDZuV29HazlSeTg2RGZU?=
 =?utf-7?B?MnJ4SWNWZ3c4dDZWZWNCWHFCOEs3cDkzTXN1bWc1ZWpmSDN2OGNmWVZFalVE?=
 =?utf-7?B?aU9YbERlWUYyR081YXQ3WUF5R1NlekVWN21ESW9tZVY4Tmh1cE9pM3BqSnhP?=
 =?utf-7?B?S21ycVJUVHdnNzZMQWxyOEtvdElTWXFzeSstU1JoWEhoWHczdlZ4RVJhY254?=
 =?utf-7?B?a29ZdUI3TzNUNC9YdG1UQlF0aFRyeUVadnVGVm5lTld1aTRlZTdrNWg0UTI=?=
 =?utf-7?B?Ky12U04vWHBKNDRqNmI0Sm8rLVM4ZW9rNystbmk4OFhyVE5GOG9oRU9hdTU=?=
 =?utf-7?B?WSstQUlUcXJmZnZPOTlyNVYxUWkzNFJyVGh5UUVYZ0lyUDM4bklncystaHVp?=
 =?utf-7?B?NDgrLW1CL3gz?=
Content-Type: text/plain; charset="utf-7"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	ybDx/u6s/7oH/RVoUW+53vFPTU5ktkm+9ML5Eaa09L3Yi1BzcJo6A5g1AeMOqlf7GPsx+sf9Al2ARj23V3jnvOzYpFskstuDh+wODZBEAvOHzE/ww0ypkZrJ5LUweIZDMCJNSjvKrEnwqJXsSbvfOxSNIcrQRdgXiy94rh6o1G46DZEHujP71z2jQnawYI4ERNoBKAnqKrd6FxB3mW8E9Js5dlbL4lR/hvgRVFI311IuY+k0LVQLWMAHx2arf1AWlAcc2/Cmn9dd4md5dhROfzWQSoZNDzAOnNRF3LNOkKn1UjdlfRjJKEYC2MmIOvSbQCgyi+y8iIrhKcUNNvyZe8IuZBAl0zxisSlaB9wgmm3nIF6cXow1ngXv2/hzuqepNrnkX1OVVyBp528gRU5fo5SfDDcaSo3euhpHXvFqXDGLEy5/xCiJ0L7Me7buv2INgUwJj9L8cjoVO/+dGmJhQ0wbskPkT011QOkZGLEQmhgNcsO8K+Nlt3muh1JnbzAs7GsrY8m5RjLIiMdq6MqiTcAA8n5JTu4j1TDaxjrv4AH1RxM1N49q8/zh0Efm+9T9Dv5uNg8EWR6hFfOyJ76Ckr5B5bxZMvlgCR+gScOWWXgHK6ydWaumfxNocwrVModl
X-OriginatorOrg: wago.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB4PR08MB8102.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5ff431c-2c0b-4e09-aa86-08dd9cfad876
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2025 08:45:34.3232
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e211c965-dd84-4c9f-bc3f-4215552a0857
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ShXW5Iz0QZBlOrN0YCYWMn8d0sqW1DHLAWKgujSSNaXeh4RM9RycbVXy9ORCMss/gEAdSM13dGpr1gHABj1Zbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11148
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA3MCBTYWx0ZWRfX8UIlGvvT+aiY FP7R8WRqLrVdy/FVAehD+u2Pk5fMIDKdrs+oufXFM47mNI0uckKgoNcUtL4y5hW1al8ApLdOR0m bMm6nfZJbxGOQimg9rAWRpPsqusrIi0KkB4f+AbRkAXVGbanZttgM+bVR7XQx26MWTKFxLlMHsg
 1/+KQbNW7am5teV1cLug2Me6Jv/h2kD6vhJIuHOHuc/h4SagdknPVYvk96XkSEIpkRtMk5g2Q5v pGtmcMjAuFYGahpg8DE1R2W4138l3DNNN0DU7XrkAAnm634v9xge9RsKHpBWnksPmMlBRBfHryN XFSmXnbiJ6Rsl1BoTRPQS6p0+zZtGfTQHXORoyMJicfZmwFTk1WA0Oy7s/3HP3MOYuHzFoToZch
 PbdfHFPMXs85qoaXCZys1omk1FA1jzA/v9hMwhBRtwiLU427UNc2QEIPWg25a3q0msmn5ZB7
X-Authority-Analysis: v=2.4 cv=VNvdn8PX c=1 sm=1 tr=0 ts=68357bb0 cx=c_pps a=fdgve2kSypNCbdO3j254ZA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=wzW8d0FwaosA:10
 a=TjCsNTqe5bEA:10 a=dt9VzEwgFbYA:10 a=uherdBYGAAAA:8 a=Q4-j1AaZAAAA:8 a=P-IC7800AAAA:8 a=x_K2OgyKAAAA:8 a=lPptulwbhZYmAbCYjwgA:9 a=lqcHg5cX4UMA:10 a=avxi3fN6y70A:10 a=ImwWUX5h3JJ3gRE9moBe:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=uSGbBGx2Jid6J7mcpKVF:22
X-Proofpoint-GUID: z0UKKGgiOwHFbhC0iWlOHgk3U_xo0o8q
X-Proofpoint-ORIG-GUID: z0UKKGgiOwHFbhC0iWlOHgk3U_xo0o8q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_04,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0
 suspectscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505270070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 08:45:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217288

+AD4- Just a quick update: Adrian series on +ACI-FIT image improvements+ACI=
- is most
+AD4- likely going to be merged soon: can you rewrite your patch on top of =
it?

Yes, absolutely. Will do. Thanks allot+ACE-


Internal
+AF8AXwBfAF8AXwBfAF8AXwBfAF8AXwBfAF8AXwBfAF8AXwBfAF8AXwBfAF8AXwBfAF8AXwBfAF=
8AXwBfAF8AXwBfAF8AXwBfAF8AXwBfAF8-
From: Mathieu Dubois-Briand +ADw-mathieu.dubois-briand+AEA-bootlin.com+AD4-
Sent: Sunday, May 25, 2025 5:41 PM
To: Oliver ROHE+ADs- Freihofer, Adrian+ADs- openembedded-core+AEA-lists.ope=
nembedded.org
Subject: Re: +AFs-OE-core+AF0- +AFs-PATCH+AF0- kernel-fitImage: allow overw=
rite the configuration dtb label

On Tue May 20, 2025 at 10:+IAo-51 AM CEST, Oliver ROHE via lists.+IAo-opene=
mbedded.+IAo-org wrote: +AD4- Hi Adrian, +AD4- +AD4- +-AD4- There is also a=
 patch-set pending which does a complete rewrite of this +AD4- +-AD4- code =
in Python: +AD4- +-AD4- https:+IAo-//urldefense.+IAo-com/v3/+-AF8AXw-https:=
+IAo-//lists.+IAo-openembedded.+IAo-org/g/
ZjQcmQRYFpfptBannerStart
This Message Is From an External Sender
Please use caution when clicking on links or opening attachments+ACE-

ZjQcmQRYFpfptBannerEnd

On Tue May 20, 2025 at 10:51 AM CEST, Oliver ROHE via lists.openembedded.or=
g wrote:
+AD4- Hi Adrian,
+AD4-
+AD4- +-AD4- There is also a patch-set pending which does a complete rewrit=
e of this
+AD4- +-AD4- code in Python:
+AD4- +-AD4- https://urldefense.com/v3/+-AF8AXw-https://lists.openembedded.=
org/g/
+AD4AKw-AD4- openembedded-core/message/216836+-AF8AXwA7ACEAIQ-B6Ltl4Q+-ACE-
+AD4- +-AD4- sx1j+-AF8-QU1O83+-AF8-wMeOlorBivh3C9HD06dwOTkdj+-AF8-Mvw5g0Jki=
LC3BEVzuC8rMFPlyIDdqYv5r1ln2lPqCb7AhxUktc8So-+-ACQ- +-ADw-https://urldefens=
e.com/v3/+-AF8AXw-https://lists.openembedded.org/g/openembedded-core/messag=
e/216836+-AF8AXwA7ACEAIQ-B6Ltl4Q+-ACE-sx1j+-AF8-QU1O83+-AF8-wMeOlorBivh3C9H=
D06dwOTkdj+-AF8-Mvw5g0JkiLC3BEVzuC8rMFPlyIDdqYv5r1ln2lPqCb7AhxUktc8So-+-ACQ=
APg-.I
+AD4- +-AD4- guess your change will potentially be simpler if it will would=
 done in
+AD4- +-AD4- Python later on. What do you think?
+AD4-
+AD4- Cool, looks very promising. Especially that the fitimage now builds f=
rom the image recipe.
+AD4- I will check and try it out once I have a spare minute.
+AD4-

Hi Oliver,

Just a quick update: Adrian series on +ACI-FIT image improvements+ACI- is m=
ost
likely going to be merged soon: can you rewrite your patch on top of it?

Thanks+ACE-

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://urldefense.com/v3/+AF8AXw-https://bootlin.com+AF8AXwA7ACEAIQ-B6Ltl4=
Q+ACE-vd7BuMgaRBMK8t6hulVlae7tXl7VZzYeDUAfCPWL1glreY7q3VRPQkA-X+AF8-v104dfe=
dKhKGwV-mvFAlJFG9GUdpwb8GMg+ACQ-



