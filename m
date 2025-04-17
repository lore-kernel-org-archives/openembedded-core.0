Return-Path: <thune.a.tran@boeing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F98C369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 12:55:18 +0000 (UTC)
Received: from clt-mbsout-02.mbs.boeing.net (clt-mbsout-02.mbs.boeing.net [130.76.144.163])
 by mx.groups.io with SMTP id smtpd.web10.8013.1744894509810231455
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 05:55:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@boeing.com header.s=boeing-s1912 header.b=AygWZsfL;
 dkim=pass header.i=@boeing.onmicrosoft.com header.s=selector1-boeing-onmicrosoft-com header.b=PD8xpzJ4;
 spf=pass (domain: boeing.com, ip: 130.76.144.163, mailfrom: thune.a.tran@boeing.com)
Received: from localhost (localhost [127.0.0.1])
	by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id 53HCt8r1016118;
	Thu, 17 Apr 2025 08:55:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1744894508;
	bh=eIwbPFBM3oKwMsuUW+aGtjVFMTEfpD1Ig7A0tWqvb5s=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=AygWZsfL9M6FqNOTN7GdtRX7IGHwCGAdgG4l0cvF7G645N8vVDAmOayX6i3LD0n4a
	 4Kl+GX3SErOq3Zx1capbRuTfTkL500qZp0rnq7xQC1nwIJNfYZHnSEECUHcFsWxHSS
	 xnpNxuprFseXcsvjp8Erm1kniIEbjFjjPu5pUdG6mOw1yAuFpGboS5RpDy2FrNezrq
	 dovjlEBdwV1DAdbL54+tYrUqhcedlEMTxOYpul5wSIidauTOM8CIuT0OaofFcvYTw2
	 Nvq/sHmBQR7TSHQxs/txXHxRPN/AlIFXzS5BJ1/5HQZtU3evf11NO92nBg3n8NVDNy
	 keHvQ/K8gWcAg==
Received: from XCH16-03-10.nos.boeing.com (xch16-03-10.nos.boeing.com [144.115.66.82])
	by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with ESMTPS id 53HCt4XS016079
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 17 Apr 2025 08:55:04 -0400
Received: from XCH16-02-10.nos.boeing.com (144.115.66.76) by
 XCH16-03-10.nos.boeing.com (144.115.66.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 05:55:03 -0700
Received: from XCH19-EDGE-C01.nos.boeing.com (130.76.144.197) by
 XCH16-02-10.nos.boeing.com (144.115.66.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44 via Frontend Transport; Thu, 17 Apr 2025 05:55:03 -0700
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.182)
 by boeing.com (130.76.144.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 17 Apr
 2025 05:54:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=Apjsb+zvgn1J0kP/y53MgYzhE9Wo/X62QL0ODTKnWPeHsZqjNxzcw8ZrIREVgmvhcGmY6niApMdt1IBurveX4E4X3TzZ6y5C+Rf3UWxZSoaRryy7dbUoS07QjPyYlI5/6tP+cn3+OyEbe1d/sn0tQDNYwi0NVkPIrFiI/wLPbV1REoRjKo1xeQU762CrBGjcSUXt6QRk1qvlBd9T0CNJ50Z/jbTMOEv0wMtG284dknwBz8Is2xOA350Dh1aKMYucR2Wbz7TzyJLZjmbnsmoOxnvlx+jn0mlnUNfGGGxeoo4S333LWybD+bBwqPDF+KQlDFjBabRAKgA+y4BUIe9Qkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eIwbPFBM3oKwMsuUW+aGtjVFMTEfpD1Ig7A0tWqvb5s=;
 b=aVjkvK96V3Wq6G1qj2FXCa4RiY6ibnKPtBInrqob7a47F88hXWsaSMpFzUgz2in0Mkh4DUTa0ixkmYDLWErZdGPtheIfMkBy11l7VeE6oHQXLpGc/Vh8oyyYDqq0aGMwzN2LnLZNCkyICdeAV4GxdYvsJWREpAT/zHSPcWO8x5axuvzP1orkY3Zfwmd697lBv24+otBo1hSml5UBZHzdcs1MZwRZ6ZX5LUNwfvHfUlS4cQg/SGC/LQAH4tbTqb0ezWpuWyW3SgWa3pvXz5RSwbgEtqtD87HZcqAPCL6nf51mIyHVJuai3dMjKnbpMBRfyuPmMHg94DTxa2VGbKmWpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIwbPFBM3oKwMsuUW+aGtjVFMTEfpD1Ig7A0tWqvb5s=;
 b=PD8xpzJ46kNJzyxuPdjykB/UNhsAK6QKIK/0bZMIqWNcllJEbg5dNX/8TRpqbdmT2fhE5Qg0NXsy7QXXp+alIVjpisfl434HWmEFF/NMR6XHFi3KWmd6w5okbQBXZDgjoJC7+7rhEEwKThMX4BnXpy9Kwuo4d6KyzQ2Tpn1hyGU=
Received: from SA1P110MB2250.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:166::5)
 by PH3P110MB1874.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1b4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Thu, 17 Apr
 2025 12:54:37 +0000
Received: from SA1P110MB2250.NAMP110.PROD.OUTLOOK.COM
 ([fe80::458e:59d0:1c4f:a9f]) by SA1P110MB2250.NAMP110.PROD.OUTLOOK.COM
 ([fe80::458e:59d0:1c4f:a9f%4]) with mapi id 15.20.8632.025; Thu, 17 Apr 2025
 12:54:37 +0000
From: "Tran (US), Thune A" <thune.a.tran@boeing.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Chuck Wolber
	<chuckwolber@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "Wolber (US), Chuck"
	<chuck.wolber@boeing.com>
Subject: Re: [OE-core] [PATCH] oeqa/sdk/sdktest: Add test discovery across
 layers
Thread-Topic: [OE-core] [PATCH] oeqa/sdk/sdktest: Add test discovery across
 layers
Thread-Index: AQHbr5ff2W7NZNpjGEimT3WuePR1PA==
Date: Thu, 17 Apr 2025 12:54:36 +0000
Message-ID: <SA1P110MB22506DADB11B27B51A1CC536B7BCA@SA1P110MB2250.NAMP110.PROD.OUTLOOK.COM>
References: <20250416164134.399-1-thune.a.tran@boeing.com>
	 <dd0877909b1240d999dae6979ce1efa269180173.camel@linuxfoundation.org>
	 <CAB=6tBQsqNJBqFsocxDQM9sOwz5S3w5HqkOO2cLuvH8OmSQ4kA@mail.gmail.com>
 <1264db75faf2ae16362f1f05ea2b6b77e0fb7616.camel@linuxfoundation.org>
In-Reply-To: <1264db75faf2ae16362f1f05ea2b6b77e0fb7616.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1P110MB2250:EE_|PH3P110MB1874:EE_
x-ms-office365-filtering-correlation-id: 22e17098-7644-47c8-de97-08dd7daf026b
x-ld-processed: bcf48bba-4d6f-4dee-a0d2-7df59cc36629,ExtAddr
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NDJaazVPTVVaTjRxTUxRZ2M3NzVVRWNNZWV2MENuWkhLWTJZUlpCenFVbk9B?=
 =?utf-8?B?Zis3dEduZytnM2I2blJDejJMcExoYjNmVi8rMW5lbVJTTkZjQmloNXFCcEpF?=
 =?utf-8?B?cGgxMTFVUVB0UktqdmRHVHBDNzFLSFNPSE9DMXdOWjk1M1hSQmtaK3R0RnV0?=
 =?utf-8?B?aWg5NGc5WnlFNU53TDJEZjBuWEJIMWtIOE1waGFMQU8xQzM4VkZtRTZpNk5Y?=
 =?utf-8?B?cFRPUVdBQm51aXN5UThVNUdBdS9TQnhUeEs3TFZMd2VtTnhiY2dDdmdDdXVi?=
 =?utf-8?B?YmUzZm9taGY3b3dNNjVpM0paellqQUl5Ky9tYU91MlhzMUp6akNQaGhtdUh5?=
 =?utf-8?B?Nk82VWNNSStLbEppRWh0YWx4WEFTU2twejFwWFcxUW1pQzlMTlFuUnZNNEw5?=
 =?utf-8?B?aFJFS1ZEd0k2U3Y1RnQzMHdkRmcvSGMydTNybDZMRnpXTG8wTE1jOEd1TzNv?=
 =?utf-8?B?bGhlakpVcXZDQXB6aDl1WEljc2dLTGZ5MlU4WTduQ09CY0Q2dlhqRjRIL3R6?=
 =?utf-8?B?bjBzekNld3hCYWFzK2pUWmZ0NmlYWVJVam1XVDdPVE5LN1RTZEdIaU55U0Rr?=
 =?utf-8?B?Yjg3NFJXWjIrUCtFRGhSWjdDZzNhK2JFM0tRbDU4V2h4V2JkNVdaN3lvSUNk?=
 =?utf-8?B?UUVxOGJ5VllpTS94M0huQ05uSENybWlIL1RBMDc1L2tWblNhMU1JbnBNR2lQ?=
 =?utf-8?B?dlRKVEtVVUR0VjNocHV1bUFuajdsWjQrNkRBNVp1VDVLZFRSSWFwOWp4Qm9K?=
 =?utf-8?B?V2pBUHRhSloyeHo0TUhvSTlVSWhZcld1akIybGlhanhadFNQWUJHYkp5MTM4?=
 =?utf-8?B?Ym5Yc05CUjh5QnVralRHRExzd0ZXUHkxQ3BHaE1YTlh1WVladGJqQmVEN2ZY?=
 =?utf-8?B?RDI2WXM3VWdBMndwWVV0bDV0cENMWUh4SEliWHVRN2xRM1crWGNyVG9Bdmt4?=
 =?utf-8?B?bTJ1aVMvRmQyYW0rK200NVJjaWc5R0E1RVQzcFRIN3VhVDMyeXAyV0VUcWlB?=
 =?utf-8?B?Y2FSNTJBb0lGeXVuTndXOUZqZ2ZMSnVaQmlpSk1EVHFpYTA3OWVLK2pMSFFI?=
 =?utf-8?B?dkI5cCtmUG0yTUo5TWhVVlJjREx2cS90NDFoRUN6QVcrWmlSSDlVSkd2RzFE?=
 =?utf-8?B?RW5nTG9yQTJTajRGNUd6LzIzUE43MVRpOGlmNW9RMXVsbmpKZG1VYkdlNFBT?=
 =?utf-8?B?WTlHSUVwMU1CazdTOFRqUjhhWGsvZXVLSjQ2YldHY3dDNVc3STg1dkNPczZj?=
 =?utf-8?B?U2lJN0ZNMm5ZVlZRTXhQS01PM1pTVllFY1NQTjh5ckFGc2RabUZhZE9YV2NG?=
 =?utf-8?B?WnlaMVpUajdrSlpnRURsSWIyRHU5RGRpNG9SdE14bUd5Ryt6R0tGZ1F0dXRG?=
 =?utf-8?B?RktVTDRrN0lPeHByVnd3dEswS1pjLzV5L20yT2xHcDZNQ3kzejhyczZESThq?=
 =?utf-8?B?dXVDcUxYb2xjSlIzZm5LYXNzNkN3aURqSjNJQ2toYk1zQ3pWS0FCS1VtOXIv?=
 =?utf-8?B?dVowcEcxcnZETWdJaFo0SDBLa2JvRGdQUStxOHBNa2pNQWZseFFVaDVVc3BN?=
 =?utf-8?B?WWxDTTZxNDlUZ3JTMTVMTEs1MnFrdEhrRG1ISi9aYnZxREhBWHcwMzZub01s?=
 =?utf-8?B?RDl5L01iRFpJdm1TU2FSRXhkYU1tazBqWjBseWRzY3BXVmtnZDlCRXpVa3ND?=
 =?utf-8?B?YVVQTGh2cXpOTkFqaFg2QzlqWENzSU1IeG5rc1lBaXJiU1ZzUUYwVno5eHJh?=
 =?utf-8?B?bzg5OWVwL2w5WmxyVDA2VXo3MnRBM1NSQVoxN2J6UzEzRnM0dnB0bTFrcTYx?=
 =?utf-8?B?NGxrNlJWRXRSOFhOY3U5ZDNVSFZNbXpWMGtFdytoVEtRTXN3MXREMThqdndT?=
 =?utf-8?B?Snp0TW53NCtaRjVIaFpHR2VjbDhCU2o3OTY1UzZsaytZckRaMlkyQktqZWFi?=
 =?utf-8?Q?sNgYOBG+ZHg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1P110MB2250.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VGVqNkVIZmRETEJuN1Jtbjd2dVNWcmZnU3R6QlZWQ0dBWUthbDVMdnBDY0Nt?=
 =?utf-8?B?V0RjZDFpYnE0SzZsU2FPeWEzYndvemxyQmwvTFUra0wxUis0dFFnMWZuSXI1?=
 =?utf-8?B?aHR6MTdBYWEzZzFQby9teC9nSUJocGxJVG1yc1dLNlhjUzZnaGJEWFpieFdU?=
 =?utf-8?B?dXRlQ2loWlpYYlg3RkUwMHhLb0xlODY2OTJVZXhkdmdqN08zNTE3U0V5ZzdT?=
 =?utf-8?B?YklWRGh4S3hWUHRnQTZqSk1nS0tuZVg0bDN4MThEa0ltUFFJb3pLOXdJNE1a?=
 =?utf-8?B?ZWQ2N0dQWE5uNVVtcUpCNVd2QWIyMTdxS3VSUlZ6Ky9mRnFoQ2llWWV0eTBK?=
 =?utf-8?B?dm1qeEtmRHlOUWZ2cm56WUhwNG9vSFBnNkJmUGdYZm52MS8xblF6Rm11bk9k?=
 =?utf-8?B?YmxpTGYxNVlHR1FUZE1qYUtEd3A0aGlhcER4WWl4alREWEEwVXZyL1dNTEI0?=
 =?utf-8?B?ZG1OQU1LVXJtWkpHNEFEa2h3NWhUbGRQOVozTXptUEZEUlU1N2FjenZYY3li?=
 =?utf-8?B?QzBuOEhseWdaTVhtZGxSY1dQTE1rV0h6ZlpnZEZ2aWQrMXUvS3NhallpT1dm?=
 =?utf-8?B?T0JyY2k2NjJ1c09Yb0VmM2NtbzVKZGxCbTZYTVBoK0tmejBNYWRHdGlzTlUv?=
 =?utf-8?B?MnkybW1nY2oxOFdOUWtacmpPQmU5dXdJYk9vYS8vaUtScTBnQzZxWUlMdjFW?=
 =?utf-8?B?ZWJvQ3F4eHU2Nm1UUFJ3V0VVMmIxUTduWWtCOWFHa0NwSDBrMWszVTVCNmRW?=
 =?utf-8?B?RkJreGRWRktDWmhNYW15NWh2TUhTR1haSUJjYVJYVThXTi82Z015anhpRlV2?=
 =?utf-8?B?Y0ZPM01Qd3FvVDJyRUpQdXBsVGRWYlR3b29HdGQ1alVSR0JrNEdEeDZPcTY3?=
 =?utf-8?B?R0YwZnN0c09oZG41MGYxVURtSWlJOEl2VCtrUHJ6UURuM2x0bXRlL3E2alRq?=
 =?utf-8?B?S0NUWDVpam5PdncveXlSK095UUhxUnRwQURKa05KYWE5OGpkNFBHWUswMjVt?=
 =?utf-8?B?Wjdldkxtd1BwUEdZZVpsMS9scjVacktQT1VRendOZzdjNEp4WHBZWkUzTzkw?=
 =?utf-8?B?aUl6Y0JXM3lYdW5qT29aL2dLMHVkK1FNQTkvOXJCV1lmbkFkeGVTczVMTG43?=
 =?utf-8?B?Rld6MkttcTZzOSsxSjNtYklwUkhpUmljRkNITENISDNOQkZ6R3lhUTF3RVU2?=
 =?utf-8?B?anA3Mmcwd01ZL00yMkZvZkpCRmVDZVBBZ0JVTi9waHFlQWxvcVBjSjdiSVZn?=
 =?utf-8?B?QTBDSkpscHQ3WXFvVEE2WFZxclVyWklhYmxlaGlpblUydWZCdTBaREk1ZEla?=
 =?utf-8?B?aDEyMFVNUGYrUlFxdnViUnRaTTZiVFdKQnZQS09WQTl4bkZob0Evd0NFMUNq?=
 =?utf-8?B?WEcyeFJENkRzcXVQMmxRVjVTSExqSTEvZytQOWpwNGp0UmdSd0RUdnlkajY4?=
 =?utf-8?B?OE9CNThMU05QM1ZYWFZMaitlSTlZQUZwU3BJS0VKYThEUEZOeEo5Yk5OS0ZD?=
 =?utf-8?B?aThCSUtFV3ZzdE5EUkRlZ3FuWWQ4MEh6cG5KL1BXSG1yTUgvZy9jblJLd1BH?=
 =?utf-8?B?b1pLL3ZpcnNtVmw4cmNSSWtlZXYydUVkcVhhanlTK0Jqb2ZLREFwTDk4QWFZ?=
 =?utf-8?B?TjdNV1lXN2tHU0I3NjhkR2g4QWw0UVNVZnB3eWpCZmVaTGtvRmRjRWNEbHFj?=
 =?utf-8?B?dDREaERSVFVSUGEwcXBQaXpyenZycHQxMm1lYldmMXlZZEd2LzRHTjBjakpm?=
 =?utf-8?B?Q1grZWxiK0RlbTZMMjExOTEvMzlnS1B6WGZZZXByeStZUTBZZ2poZUtubEZm?=
 =?utf-8?B?VXUva0xXejZIVEVJM2VFd05KelNzaDJ2SEJFMkc2cmRyQk5XQVJaRS9PSzZF?=
 =?utf-8?B?cEpteFViSWI5UCsrUUQ1VTVoNXZERHdNYnk5Y3ZBVXNaZksraXVDMVVpZzJ3?=
 =?utf-8?B?NkJKcGxXQkpmZUlwZVlsbDhZU05XVFBKSmhKL05mT21zY24zK0pWOWh3V3Zo?=
 =?utf-8?B?aFlKR1orOGtER0dyTVQrMTZkV2hHaDdvNTl0L1J0Um1vdTNJN3M0SkZpbjJY?=
 =?utf-8?Q?B3wcNl?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1P110MB2250.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 22e17098-7644-47c8-de97-08dd7daf026b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2025 12:54:36.9542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3P110MB1874
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 12:55:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215076

PiBPbiBXZWQsIDIwMjUtMDQtMTYgYXQgMjE6MzkgLTA3MDAsIENodWNrIFdvbGJlciB3cm90ZToN
Cj4+IE9uIFdlZCwgQXByIDE2LCAyMDI1IGF0IDM6MDfigK9QTSBSaWNoYXJkIFB1cmRpZSB2aWEN
Cj4+IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4+IDxyaWNoYXJkLnB1cmRpZT1saW51eGZvdW5k
YXRpb24ub3JnQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPj4gDQo+PiAlPCBTTklQ
ICQ8DQo+Pj4gDQo+Pj4gSSBzdXNwZWN0IHRoaXMgY2F1c2VzIHNvbWUgcmVncmVzc2lvbnMgaW4g
b3VyIGF1dG9tYXRlZCB0ZXN0aW5nDQo+Pj4gdW5mb3J0dW5hdGVseToNCj4+PiANCj4+PiBidWls
ZHRvb2xzOg0KPj4+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJp
ZS8jL2J1aWxkZXJzLzQzL2J1aWxkcy8xDQo+Pj4gMzk2DQo+Pj4gDQo+Pj4gbWV0YS1taW5ndzoN
Cj4+PiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWls
ZGVycy83L2J1aWxkcy8xNA0KPj4+IDMwDQo+Pj4gDQo+PiANCj4+IA0KPj4gV291bGQgaXQgbWFr
ZSBtb3JlIHNlbnNlIHRvIGFkZA0KPj4gc2VsZi5jb250ZXh0X2V4ZWN1dG9yX2NsYXNzLmRlZmF1
bHRfY2FzZXMNCj4+IHRvIHRoZSBsaXN0IG9mIHBhdGhzIHJldHVybmVkIGJ5IGdldF9zZGtfcGF0
aHM/DQo+IA0KPiBtZXRhL3JlY2lwZXMtY29yZS9tZXRhL2J1aWxkdG9vbHMtdGFyYmFsbC5iYiBk
b2VzOg0KPiANCj4gICAgIGNhc2VzX3BhdGggPQ0KPiBvcy5wYXRoLmpvaW4ob3MucGF0aC5hYnNw
YXRoKG9zLnBhdGguZGlybmFtZShvZXFhLnNkay50ZXN0c2RrLl9fZmlsZV9fKSksDQo+IGQuZ2V0
VmFyKCJURVNUU0RLX0NBU0VTIikpDQo+ICAgICB0ZXN0c2RrLmNvbnRleHRfZXhlY3V0b3JfY2xh
c3MuZGVmYXVsdF9jYXNlcyA9IGNhc2VzX3BhdGgNCj4gbWluZ3cgZG9lcyB0aGluZ3MgaW4gYSBk
aWZmZXJlbnQgcGxhY2UsIHNldHRpbmc6DQo+IA0KPiAgICAgZGVmYXVsdF9jYXNlcyA9IFtvcy5w
YXRoLmpvaW4ob3MucGF0aC5hYnNwYXRoKG9zLnBhdGguZGlybmFtZShfX2ZpbGVfXykpLA0KPiAn
Y2FzZXMnKV0NCj4gDQo+IGluIG1ldGEtbWluZ3cvbGliL29lcWEvc2RrbWluZ3cvY29udGV4LnB5
DQo+IA0KPiBJIHRoaW5rIHdlIG5lZWQgdG8gYWRkIHNvbWV0aGluZyB3aGljaCByZXByZXNlbnRz
IHRoZSBuYW1lIG9mIHRoZQ0KPiBkaXJlY3RvcnkgZm9yIGNhc2VzLCBpLmUuICJzZGsiLCAic2Rr
bWluZyIsICJzZGsvYnVpbGR0b29scy1jYXNlcyIgYW5kDQo+IHRoZW4gYWxsb3cgdGhpcyB0byBi
ZSBwYXNzZWQgaW50byB5b3VyIGZ1bmN0aW9uIHNvIHJlZ2FyZGxlc3MsIGl0IGFsbG93cw0KPiBj
dXN0b21pc2F0aW9uIHdpdGhpbiBhIGxheWVyLg0KV2UgY2FuIG1hdGNoIHRoZSB0ZXN0IGRpcmVj
dG9yeSBwYXR0ZXJuIChzZGssIHNka21pbmcsIHNkay9idWlsZHRvb2xzLWNhc2VzKSAgDQpmb3Vu
ZCBpbiBkZWZhdWx0X2Nhc2VzLiBUaGUgdGVzdCBkaXNjb3Zlcnkgd2lsbCB0aGVuIGJlIGJhc2Vk
IG9uIHRoZSBtYXRjaGVkIHBhdHRlcm4uDQo+IA0KPiBKdXN0IGFkZGluZyBkZWZhdWx0IGNhc2Vz
IHRvIGFueXRoaW5nIGluIHRoZSBsYXllciBpcyBnb2luZyB0byBhbHdheXMgYWRkIHRoZQ0KPiBs
YXllcidzIHRlc3QgY2FzZXMgd2hpY2ggaXNuJ3Qgd2hhdCB3ZSB3YW50IChpLmUuIHlvdXIgbGF5
ZXIgd291bGQgYWRkIHRvDQo+IGJ1aWxkdG9vbHMsIG1pbmd3IGFuZCBzZGspLg0KPiANCj4gQ2hl
ZXJzLA0KPiANCj4gUmljaGFyZA0KDQoNCg==

