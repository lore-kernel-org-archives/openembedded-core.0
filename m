Return-Path: <Oliver.Rohe@wago.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0014C3ABD8
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 13:56:35 +0000 (UTC)
Received: from mx08-005c9601.pphosted.com (mx08-005c9601.pphosted.com [205.220.185.5])
 by mx.groups.io with SMTP id smtpd.web10.13851.1747403794039970332
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 May 2025 06:56:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wago.com header.s=p012021 header.b=Nb0Fn2AI;
 spf=pass (domain: wago.com, ip: 205.220.185.5, mailfrom: prvs=12317ec50a=oliver.rohe@wago.com)
Received: from pps.filterd (m0237837.ppops.net [127.0.0.1])
	by mx08-005c9601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GDYZv8007880;
	Fri, 16 May 2025 15:56:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wago.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p012021; bh=0U
	kJxZPiot6MURTSICd+8urcuug8aew3XTP3Ydd53f0=; b=Nb0Fn2AIK+RUiwz38a
	BOzSeWeXDLbtCkSmcL1cmZfhMSqpfotSwAzHWQirMMg/N+ukqCOScKBC6lUp7bcQ
	O0iiK9IowRpK1V5t84ibUMW6OLfnGAK0uUUhXhBlmv6i1fvwVbe8pTX3JfxEwiqY
	W7tz11A1cUbE2Dd9SWaUgHKKm3iVWRA7fXhUmOEk8ed0/9jxyisVbhRjcWfo+PGY
	fapp+4MIRSh32iyrqPEHAGeA2qHVIXopODl2mWnQeMBB18my3vNZdTVQT3pA3O3v
	/QTGLNBwRbO0jXx/T6pzJblgqdhLER79ggxn38R1uAVTlz0znTVJ8KLYAiCelHR0
	q64w==
Received: from as8pr04cu009.outbound.protection.outlook.com (mail-westeuropeazlp17011030.outbound.protection.outlook.com [40.93.65.30])
	by mx08-005c9601.pphosted.com (PPS) with ESMTPS id 46p6c4g0q7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 15:56:31 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uXVTpCiFj0KgSR9pWUzM17nWSCskmcy37nb7fpdkL1wDfE6ZZarRbht0p0SorypnI6rOohinEDaRPZDgWlZRQjSHn9gftdshjjklpnqZgkG0Fj74O8R+1nO3qNUs9YHzv1YjbMMV396mwY9pdEJCco/5LTl5hNUiDKw4W7tXml+RMSrX/IKbGkeXIocGsYOsOOoVIBGSIIQc+XXM+kNSKxpKmpcQGKzururRnlmHW5eXI26MbfB1U5diHxB6J5b5+roAnliWdJsYZC2EDMufBvF16/5LiraKQWUztMbvqd5LMQGg0/pLtC43RVtltcO2VCm3S7w8boSFHQLX58zLUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0UkJxZPiot6MURTSICd+8urcuug8aew3XTP3Ydd53f0=;
 b=N4hd0KEkZ0YMu6NJOOgyVI0FWm7ZKZFH6n79t0D1dw3gL5bm0f7nVDVjJMxrEbRNX93p1ng4l8TUX1mk8zSHvfvXIOn7bUI6Qh/3shbxB60N+76hJIXhDEFCijD+CsA8RdTNMXWYOEZjUA90W8wCrqyf/hTRN5haLyw9rKJpSswXb44JH7VRex3PIJU3mrZoG1lgMdgo+mH1UTPQ7eGzgB4IVSJH8YsmVswVCTwCzfBwrSDE8arWtLuvhMDxiD/dLpAISxm44u8fe7atONx+hbH4Hs0jJPQGM5QMv2A0YtGPvlzwqI+w1BCDmqdwKnE9DLOcdNags2omhKHEyBXSNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wago.com; dmarc=pass action=none header.from=wago.com;
 dkim=pass header.d=wago.com; arc=none
Received: from DB4PR08MB8102.eurprd08.prod.outlook.com (2603:10a6:10:386::8)
 by AS2PR08MB9787.eurprd08.prod.outlook.com (2603:10a6:20b:604::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 13:56:29 +0000
Received: from DB4PR08MB8102.eurprd08.prod.outlook.com
 ([fe80::93b6:7bd:c4e5:7e99]) by DB4PR08MB8102.eurprd08.prod.outlook.com
 ([fe80::93b6:7bd:c4e5:7e99%4]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 13:56:28 +0000
From: Oliver ROHE <Oliver.Rohe@wago.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] kernel-fitImage: allow overwrite the
 configuration dtb label
Thread-Topic: [OE-core] [PATCH] kernel-fitImage: allow overwrite the
 configuration dtb label
Thread-Index: AQHbxlwJ3kd3lvqCT0yrzOhlqhd1qrPVQe2AgAADsZg=
Date: Fri, 16 May 2025 13:56:27 +0000
Message-ID: 
 <DB4PR08MB81021A4E22EFABA7919DBFBA9E93A@DB4PR08MB8102.eurprd08.prod.outlook.com>
References: 
 <DB4PR08MB8102C882795C5B8725105A0F9E93A@DB4PR08MB8102.eurprd08.prod.outlook.com>
 <D9XMHMXOU4SN.EDYVQGG8UO7G@bootlin.com>
In-Reply-To: <D9XMHMXOU4SN.EDYVQGG8UO7G@bootlin.com>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_6b160f33-c33b-4e10-8636-cf83f9ca7d3c_Enabled=True;MSIP_Label_6b160f33-c33b-4e10-8636-cf83f9ca7d3c_SiteId=e211c965-dd84-4c9f-bc3f-4215552a0857;MSIP_Label_6b160f33-c33b-4e10-8636-cf83f9ca7d3c_SetDate=2025-05-16T13:56:27.475Z;MSIP_Label_6b160f33-c33b-4e10-8636-cf83f9ca7d3c_Name=Internal;MSIP_Label_6b160f33-c33b-4e10-8636-cf83f9ca7d3c_ContentBits=0;MSIP_Label_6b160f33-c33b-4e10-8636-cf83f9ca7d3c_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB4PR08MB8102:EE_|AS2PR08MB9787:EE_
x-ms-office365-filtering-correlation-id: 5e7df006-d161-45e3-edd5-08dd9481745b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-7?B?Vk53ZFM0ZzlwWXlLZ3k3d0x6UG12SFJaY0JhNjNOWmttUGFWUE92QTVKUUoy?=
 =?utf-7?B?NzlGcTRkcmNJbVRVVUxqazQySzQwMWEyOW9DMmJkR29DTWN6eERqckJuQXBv?=
 =?utf-7?B?ZXdUQnJMVXVraXJuRi9XQUtmdXdlUWl3RE1PNk5KOThyTmVuczdtVTFaL1ow?=
 =?utf-7?B?a0V5UmVld1F3OHNSTU96ckJTWXZHZVdjKy1nUy9aRzJGWVE1MlArLXhocmZq?=
 =?utf-7?B?emZyRzUrLUp3WCstd1JEb0VKY1lwV3pyTDBsOWUwaGQzd2lKdUpQTDd6VTFN?=
 =?utf-7?B?ekt4QUo2emNVbmcrLXM0U3Q2b09oNnREZ0p1OHNFVlJ4T092L21LQ2R2bDZl?=
 =?utf-7?B?US9pcnQrLWpzVEhCU0xJVEFwTUxZOThBUTNkNXQyOVFaTWVyTkdRYjRUODdQ?=
 =?utf-7?B?c1lJa2p3NjY3MkI0MjM3UGkzQk9hVSstNjdxT3VJSjRPVTlsSkYwcUszTll3?=
 =?utf-7?B?RXBaMistZE1HOTRiVHlJZUxmUVJHbzBrNExPOWdkQ1JUbWtKZWNVR3lubHd1?=
 =?utf-7?B?aFJ0dDhHejBGTEZTS1FDS1RjQ2JuS2NNb1hPKy1XRDZjWldDKy1JQlZhQmF0?=
 =?utf-7?B?ZjhLME14R0JVSWo3L0Q1Ykw0YWJyZ3VwT2NwSHFIZkEyOVYzWjl2clU3NW9T?=
 =?utf-7?B?TXBxUHJVeWdibEpnT3Y5L1l1RistUWtrajY3M2dFMno3dmltUzNObVp5WnRt?=
 =?utf-7?B?YjlQWXFKZE4wVDlHVUFHeXIxTE53NnViYjZWY1o3RU9aSUZOSDRYMVMvR29l?=
 =?utf-7?B?V0VZTDE2R25qS2U1RmRTOTRPdWRNUkxOSDhyNkl5TDJ2TXhMeistNnlBWmZi?=
 =?utf-7?B?bystVlk3ZE5Bd0hOQnkzTU43SENQS29ybE1yQTRsb0V5VE1wNFJpMTJzQ1pR?=
 =?utf-7?B?TE5odEx3cUdKV3htbHc0TG5QY2thTTFQb1FkbFd4b1h4RXFJNjVlU3k5c3N4?=
 =?utf-7?B?clowVmFVL0VCVU5TaDQvdHlQMVJLdmx2S29qeVc5RHRtWDVsYnA1L0hNV2h1?=
 =?utf-7?B?NTlXZmtsSExYcXhpZ3p0UTBaQWYwa0MxaTNic1g3dHdkUlFuWnNDZklEbkFL?=
 =?utf-7?B?ZFB5eDRJQi9Rd2VZTTZZKy1vKy04MHdHME9vVDMvYi9QdzBlSkg3MFRMV3FL?=
 =?utf-7?B?ZE4rLWYrLWhSRm1jVExRMUVkWTVGNXE1S2Y4Z3hMWEFXU1FHdXdmSnVvYTVh?=
 =?utf-7?B?Y0Zia0xXbG1ZNHo2NWhqb2pNWEEzR2RFVDU2aHNPT3dzbXFSTWVXSUxibkZr?=
 =?utf-7?B?aW5FNzJ4VUJzbmlJOEZxMGk0aUdhdU52TjZjZ2dIUUhoRGd5Mm9QTEd5T3pI?=
 =?utf-7?B?anBVWDlscEN4ZUJiKy1OVTB1QlVYdGU0UE1Ub1ZFSUE5QU5ZTEVLMXJjRE1r?=
 =?utf-7?B?Q0NNUlRjZ0R3YTVZQXhjSFgrLXNyeWJpbEVPTTdvUzBTZEtwanBleFZyNWVC?=
 =?utf-7?B?YkJEblZpeExmSW9sVHJvMnJMaUpqU3BxNzAxTlAyaGsweVVOV3lJZGxObUN6?=
 =?utf-7?B?dlZvaGt6NTJEZnJ5aGx6U3VDUUJLckFoWUltNHdkdEpTVGlIdFluSGJwYVhW?=
 =?utf-7?B?Mk1XSXU5RUNrYnBsUGdQMTZtcFo1RVZ4ODRVVlZPdzBnNHAySWtJbGdYZXZw?=
 =?utf-7?B?Ky1EQXlTcTZpak5MZXRjNi90NGZVNXNyZnBZTUZaZUJYOHUvQVhvc3ZyREY5?=
 =?utf-7?B?clJxcVpKUmY3Y2I1OTM4bnlibHVFdUFMdWZRNEgwT0x3TzhRdTJ6aWEvd011?=
 =?utf-7?B?Q3RxRWo3aW1lU1V0ME1RVE94WXVtb1NKN2dNNkwxMzIycUZReWpSRms5Ujkw?=
 =?utf-7?B?RlNBeWZGdGR5RVByRUpFSFBSN0VhRkx4OE1Gc2hyRDB1RUJTejJkVjNmb0VS?=
 =?utf-7?B?S1E0ZEE3d2p1ajFsYzVnQzdqZEdtaXcvblpYT1h1cXZXekpaKy1MemtjZTJH?=
 =?utf-7?B?WDR2TGZFOFU2VmVqMmRoaUgwUjRwazBJdVBQYk1EbXFBL2dHdVBkd1JPNkE0?=
 =?utf-7?B?UjdoeTVUUSstbFpsSWdVbzVvc3ROWG9iVWs0cVpZdytBRDBBUFEt?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR08MB8102.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-7?B?R2gyS3puU25INVFwSFFWTGk0Rzl1dGtQVUIrLUloTWNZd1c0UlJ5QXpWeUQ=?=
 =?utf-7?B?ZystZDNFT29PTWJkdFRDM3lUUGJRMmxER1g1em9wZzdBRzhqcjZkZUVDckJH?=
 =?utf-7?B?NGszL1VobXhFYlJLN2FzQmdIZ0FWeEhPaG1hMXRnY0JCbkh6UTBGQm1nTnRQ?=
 =?utf-7?B?WDZnbEFwUG9rMk9JeUdYUTlVR3I2eDYxbWFyZkRrV0lZMlNKd1JjcUVjS3pt?=
 =?utf-7?B?UistZmdNT1MxTVNZNW1TYll6a0h5WkZ3OHE2V21QQVQ2U1RDRXlwTzExTGlm?=
 =?utf-7?B?aUlVZmVhbmtRMDRiRU1RcC9WaGVyZ3E0TGJpUFNpdk8wdUFac0twcmdFNVM5?=
 =?utf-7?B?c1hhbEFCUkRsMDhvZEhMUUgwY3o5WnBnTmMxdnZIZlZMSkt3S3RYL0lEcVlT?=
 =?utf-7?B?WHFEclBPTnVPY0lGb3FWL0dSc3hkTXVLYmFvdmg1R3JWQ3FicktjLzVOZUN3?=
 =?utf-7?B?ZUVMREpod2pwS2NrQXhlcFpFUXNvNEJoOXg1dlc2eTZyeTkrLUR3WHVyeWt5?=
 =?utf-7?B?WklhU3hBNmtvaEdIWkRtR2hHakZ0NFVxU0NsMk9YNm5NKy16VS82YUFBaUZN?=
 =?utf-7?B?RnpqKy1hVmdmSlU1ZkdqU0lYd2F2RXA2dnd3RFF3WHQvbVpZejBlL0ZNbEVE?=
 =?utf-7?B?U2ZpYystQ09kaXNFcGgrLVZMQklYL3NWcDR2a0o0clFnanU3Tkk5WlhFVTJC?=
 =?utf-7?B?MHVhUFNQdjRDM1BDL3NrYTlXNFREQ2tVWTJsMk9FOWJaRW1XbXJOS3VPYm12?=
 =?utf-7?B?WDlOaHV0UGNubU45UnVOdzArLTVLUkwwKy0rLURVUXJqMmFmandUNVYrLXc3?=
 =?utf-7?B?ci8wRjBQOEF3UllURjJoWVVLOUlWN1FjZmxGb2tpZGMxUmpmbTJjTW9FeWFr?=
 =?utf-7?B?elVpTCstSnk0N0ExSjA2VmVGOFhneHplRy9NQXEzVWQ0MForLXJBZW5CWXdn?=
 =?utf-7?B?cW02Z1RoMGU0THR5c1NocDlIdEhTcWVZV1NNTlRha3NMU2IybTNOcW96VE1F?=
 =?utf-7?B?Y0ZYOWZoS2wxOGVaWksvOE5JSVlWRmVpTFVRbVFtSDF2S0xkbXRXeDZTbTBF?=
 =?utf-7?B?WTdLRjkxdk5xZWF4cldzeEErLUJnRXN3L1pzYjBleU0zREdkWTlnRmg1bmlr?=
 =?utf-7?B?L0hySHY1TjZWZG9aN01yaElRalU0SW9aNkhPODR4WXJxTUFwckd5TkxaMHhV?=
 =?utf-7?B?MjBtQzRjQUNHWVFNSjFWc09OV2x5NDk3YmxhQ1BnSzArLU1KRjIwVm4xOVM4?=
 =?utf-7?B?SGd0ajh4cVBLODY1UmVZM1RhdUlONFVRbGQ2QXBYTWlGSk43Nm1BSDh4SW5h?=
 =?utf-7?B?clo4eXJXODExbHdiNDJTRDZLMk82MnRqTDVBQTZhcHhqZlhzaDRMZEdsSElu?=
 =?utf-7?B?UnJMcUdzRksvbFE3NnhZa0l5T0xRWS94SWlQbkhJeGEvQVZ5UjRuSDIzVjli?=
 =?utf-7?B?VVZDWXRydElBV05ua2ZCSDFwdG4zZDkyeU5xRUczTE1mMlRHdjVaZzVjemRk?=
 =?utf-7?B?NnByQnhZSDBLQVhOR0wxSUF0WGkrLXdORGRITE9Qa3JBT3VNYzRVV1NDTFhU?=
 =?utf-7?B?Ynl5R2haL0MvU2hnTE4rLXdMV2FNRndhVFErLXR0bFhnNW9lemVEVmhLb2Mv?=
 =?utf-7?B?MEprRHRkdnU2czhCYUVjaTZDT2ROdmJ3dHNFbHJWTistSzFFM0xoOEZTZ2kw?=
 =?utf-7?B?UmNzQmpQY29FR2w3RkY0Qk9kbG13aUR3ZUltRGtXKy11NTFRZms2Y2d6ckU0?=
 =?utf-7?B?NE5uL3pLelZTUEFoYkFLV3czcDM5cnRSZkY1blFqVnRKUWxlKy1ndkJDYkJK?=
 =?utf-7?B?SWp0V0hiVEczSFdCaXpQOWYrLTF6Ky1NUWRzZ0Y4TmhEUHdyeFFHRlkxMU1q?=
 =?utf-7?B?OTdUdXVqVzM3NjlCOTYySzJFdmJYckhZcUt4bXFQbUVlQ2JpNGNQbWMrLTNG?=
 =?utf-7?B?OVI3MmNvL0d1c3VLYXhERktaa21JdHdiNExEQWhoS1RPdUdyM3ZseG8rLUNV?=
 =?utf-7?B?TDQ2SUxxZXZEaVNhRnA4dVFCRzQ1c1gvaFluaWpyTystWDY1MDdEQWp5cko2?=
 =?utf-7?B?QS8rLVE5MHZTVmxZNjVQTElRKy13YzRhLzRodm1nSm5TRXRwRUhqc3FFWnFO?=
 =?utf-7?B?VTdkQ2M1QjJ3bGNzRjFpTENrd0R1d1BlNHR0REMySjNnQVZpVWdKVndMbnZk?=
 =?utf-7?B?Z0E5cE9leUxreQ==?=
Content-Type: text/plain; charset="utf-7"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	xjUOYUrA7+XaqbJbpaAi1OxcG9W/FE/u9864AxBDwsj7mOUykNJGQtyW3gd36XbcRjD+7VltC6Hxiu0ZfKbjoM22583XBWw1DWkdQRRAZshy06cqh+lKLylTwjnMk4lDx1yBAZRgC+Dtpi/K1zlFPreZnTxIz/L0edRa/bsW1L3tfEr4y4B08lCU0mJlBB+w6gL2lhkl7aXkPKML7T7Q7v7XD5eAI9OGJQr2wdfW0PnrSMvk5tiJhD5jRVh0rvb8rslgiLqUtvDvOSholvDfL7bd5P6hoXy2HKDv/JtVUcCk0/jZGZhZhCGFx74eqtKaeSPWjFF7sTaN8NHWAdod3X5tVjsJ+JOSwFI09u1ZlbBd+YTNvaorWsJleabp54CvX6YnivATyV68FkkaeafQR3l6vw4PqEhDKJwSC7ttSKDOq01lSYW2fXa0kh1TmcDmDmHJNfyGYrzi4ErvYOL3L2WGXoxy011azOA1C194oSm/tPf5bpThjXSG8VzLvAz3bwczVx6q02tFjRc7NKUmjs+Fc+hmD8nCh6AqY/X22fsRPEsUr2R79+8z3oUKDjS7ziOiGkRx9dxvOWP1vrdolvCQbuJGqL2b33C4YW3MCAJXVxTWG+jVkIIX1Sd0+hcr
X-OriginatorOrg: wago.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB4PR08MB8102.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e7df006-d161-45e3-edd5-08dd9481745b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2025 13:56:27.9741
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e211c965-dd84-4c9f-bc3f-4215552a0857
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: enOVthhDrzzwHdIwbaKW+2LJMt3OZSaCMglcdHbfSyEkqXr/j5Z+IBMwRFK88hgxJAcGPtz0eMCrUw2U+INXaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9787
X-Proofpoint-GUID: 3lOgzFAaIsqocKiGYWb33nhCAXurTati
X-Proofpoint-ORIG-GUID: 3lOgzFAaIsqocKiGYWb33nhCAXurTati
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDEzNCBTYWx0ZWRfX9OMeFaaVtMNq OMl0DftYQAhA3JdzJK9sPwE/2YUf1Fe6TBZ4OCfdgJB7LOJAfwsawMA0qpdK6mzZSKC0ansygdK rvlxMu0HnDh7kN+4ZtAya5PrXq2HJqgUt8l1EeIayg4oYmBb2PTvekrNfQedWFLgt9issnuTTdn
 49K3My8LdQMfLwNeBELe59PxXy9a0yIm5icNe2fYfQd+34DUwRF7WG5K7h99v5Ing92CspMnXjL I5wCx9AH1ny27FlUvDKwchVG0+9e+R82/P0aISBPaxm8L3q83BrsnISBTm8a4tS01suT1ckhTBl FYLPVO03atTelnvWD3PPZeM90GKCD9yttw20glJuIk3F+J7kaeGqXYIf9Imn2QBIDmr7l0UaNMm
 5XRYCJYf/XTSNi28rCsYyxBvDiGxeOmYpnwoB4DScIfcYXUTXRwh/zevmgF9Ai3Auht9GzFe
X-Authority-Analysis: v=2.4 cv=UuNjN/wB c=1 sm=1 tr=0 ts=6827440f cx=c_pps a=h2a5A89wNYV5C1w1UYgd7Q==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=wzW8d0FwaosA:10
 a=TjCsNTqe5bEA:10 a=dt9VzEwgFbYA:10 a=uherdBYGAAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8 a=ThMX_IV2AAAA:8 a=x_K2OgyKAAAA:8 a=MFFWu9hoAAAA:8 a=WreNF_b81wXf6cAUTxcA:9 a=avxi3fN6y70A:10 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=0jcnvs3wCqEDeep41k2a:22 a=uSGbBGx2Jid6J7mcpKVF:22 a=SV2Tz2c5VQls2wiQynLY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1011 phishscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505160134
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 13:56:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216754

+AD4- I've corrected the spacing on my side for this patch, but may you hav=
e a
+AD4- look at your configuration for the next time?

Thanks a lot Mathieu, unfortunately my company uses exchange,
but I'll make sure it's properly formatted next time+ACE-


Internal
+AF8AXwBfAF8AXwBfAF8AXwBfAF8AXwBfAF8AXwBfAF8AXwBfAF8AXwBfAF8AXwBfAF8AXwBfAF=
8AXwBfAF8AXwBfAF8AXwBfAF8AXwBfAF8-
From: Mathieu Dubois-Briand +ADw-mathieu.dubois-briand+AEA-bootlin.com+AD4-
Sent: Friday, May 16, 2025 3:35 PM
To: Oliver ROHE+ADs- openembedded-core+AEA-lists.openembedded.org
Subject: Re: +AFs-OE-core+AF0- +AFs-PATCH+AF0- kernel-fitImage: allow overw=
rite the configuration dtb label

On Fri May 16, 2025 at 2:+IAo-32 PM CEST, Oliver ROHE via lists.+IAo-openem=
bedded.+IAo-org wrote: +AD4- This allows to provide a custom label for each=
 dtb +AD4- without having to overwrite the whole function. +AD4- +AD4- Sign=
ed-off-by: Oliver Rohe +ADw-oliver.+IAo-rohe+AEAgCg-wago.+IAo-com+AD4-
ZjQcmQRYFpfptBannerStart
This Message Is From an External Sender
Please use caution when clicking on links or opening attachments+ACE-

ZjQcmQRYFpfptBannerEnd

On Fri May 16, 2025 at 2:32 PM CEST, Oliver ROHE via lists.openembedded.org=
 wrote:
+AD4- This allows to provide a custom label for each dtb
+AD4- without having to overwrite the whole function.
+AD4-
+AD4- Signed-off-by: Oliver Rohe +ADw-oliver.rohe+AEA-wago.com+AD4-
+AD4- ---

Hi Oliver,

Thanks for your patch.

Just a first note about it: it looks like tabs in the patch were
replaced by spaces, so this is a bit painful to apply on our side. It
might come from your mailer setup. Are you using git send-email command?

I've corrected the spacing on my side for this patch, but may you have a
look at your configuration for the next time?

Thanks
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://urldefense.com/v3/+AF8AXw-https://bootlin.com+AF8AXwA7ACEAIQ-B6Ltl4=
Q+ACE-s2MCbb3GTkcg21eG8sFvDBktA1RwKRfaA08LUgjKn6ORs7PA24FcU2M9K90ijWKJUAZOq=
aUnZCQNVtTZS4dHLdfNYkgj+ACQ-



