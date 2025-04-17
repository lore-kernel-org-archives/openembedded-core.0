Return-Path: <thune.a.tran@boeing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 383A7C369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 15:53:59 +0000 (UTC)
Received: from clt-mbsout-02.mbs.boeing.net (clt-mbsout-02.mbs.boeing.net [130.76.144.163])
 by mx.groups.io with SMTP id smtpd.web10.12341.1744905232389415122
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 08:53:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@boeing.com header.s=boeing-s1912 header.b=Gn87yJrA;
 dkim=pass header.i=@boeing.onmicrosoft.com header.s=selector1-boeing-onmicrosoft-com header.b=FnHUbMTJ;
 spf=pass (domain: boeing.com, ip: 130.76.144.163, mailfrom: thune.a.tran@boeing.com)
Received: from localhost (localhost [127.0.0.1])
	by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id 53HFrkPB017926;
	Thu, 17 Apr 2025 11:53:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1744905231;
	bh=cbmNI3+ja1yoTiDBLd21PDWDxFnev/ORwVk9Wh+1PPQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Gn87yJrAU90eMnT3RJWStBiGcMo9BpJZJCOT2Bq7ILhKwMUBwf0uZu+G2LjUugjEX
	 2CfdB3tm8fXoP2iCEkA/RU9iPqc05IA/MfRC8/wRv0aC2Cxcegp0v37l7Voro1m63n
	 OjcgUXFr4ljrk8AE2Q9+m0SROuFgc2VZCi572Uyo4vzj0A4PjfGHoIGWmIfpc6Z0Oc
	 cuuxX5jQLkdNcRVdW/b8+ly011A4UMkBTOq3MqmeIJIRp3ZfYbXob26c1TEDsjcaaO
	 DYqx/bxHkSWFn8qqoL0fcTYLoSjbZ7Vb5uzCQCTrsiYo6eP+q5qJ0qxRzN6oVIzJ1m
	 4WNGBNi7giOUQ==
Received: from XCH16-06-10.nos.boeing.com (xch16-06-10.nos.boeing.com [144.115.66.106])
	by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with ESMTPS id 53HFrcWV017800
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 17 Apr 2025 11:53:38 -0400
Received: from XCH16-08-10.nos.boeing.com (144.115.66.118) by
 XCH16-06-10.nos.boeing.com (144.115.66.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 08:53:37 -0700
Received: from XCH19-EDGE-C01.nos.boeing.com (130.76.144.197) by
 XCH16-08-10.nos.boeing.com (144.115.66.118) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44 via Frontend Transport; Thu, 17 Apr 2025 08:53:37 -0700
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.144)
 by boeing.com (130.76.144.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 17 Apr
 2025 08:53:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=z/Wa6yTh2jDlYiVz2W8/Cql0tm3pXnyzEMaifGPHSh4XAXXqz/XuQ1QAHSYv4ficnsIsYeNk1WVhOm13zvoaHMyKYwyCoay9CoYa85EkUi/GHXQ7FXRzIUaDpUSSWT5es6hVzViEksmc4ZDnb4IpiyZwUmRcpxMOYzPUPIp2TtfT/WgHs8BsaRkOid5nm9t0bVsnJCWnBd8CvN9cyWGcM1fQb+CZEJORfvNtLULB/qQ+WUbnsVuZ3nnNe+j/3lmO4uf4WkF6bZ5ImLmxssRjak5VD8bpc9J7ef2au85v0Dc3e/LAcOMOV7TFU4eb45UyUgBUBE9NX6XIM0T3sm0fdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbmNI3+ja1yoTiDBLd21PDWDxFnev/ORwVk9Wh+1PPQ=;
 b=GaWeZorUyVwJtBDFijR1Gg4UnJLd+crKbnxtkpkmeYfY4XsENmVR8widD/qHmZ/QcBATEcIgeeyVLZM5NUlDgft3q3DeVc4FMCrSpHlywKEtjdWaFeC9nOgwWJtOFtvKYVEK6ZAGK1gH6LE3S0WpMn0Vtyu269QjkXvXmPLHoJF5d8+ZowS6PFb0SX1S8do1exkDVmSKmHJIsjHkw4p6bLOs8eVxw+mITA4ExAn3m6SIlIHKA3DHKtJ03IjXPpU+8VPcnSDpoch0CqJvHxrbTPLHxNi+iAi4wxzt5mmG4qRIG5CuxYvWug7vJUZ3m9CZPaf57RQoVWMjvYFvmzvkJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbmNI3+ja1yoTiDBLd21PDWDxFnev/ORwVk9Wh+1PPQ=;
 b=FnHUbMTJ4v2xLDOSXq6zApb8eyA4+i9d0YegX42T8gbsu1WtMbxrbfNf1u2lwdVjrGWm2ZMHdM/iBIWcoto5q5Oa9Bh3XkGWYJ28zjCag/hIotG431xfkTOPfLKR/JE6bszby0pzinm5l6soCcT7FSl/HS4yOTGTy04/YJeaV24=
Received: from SA1P110MB2250.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:166::5)
 by SA1P110MB1941.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.31; Thu, 17 Apr
 2025 15:53:03 +0000
Received: from SA1P110MB2250.NAMP110.PROD.OUTLOOK.COM
 ([fe80::458e:59d0:1c4f:a9f]) by SA1P110MB2250.NAMP110.PROD.OUTLOOK.COM
 ([fe80::458e:59d0:1c4f:a9f%4]) with mapi id 15.20.8632.025; Thu, 17 Apr 2025
 15:53:03 +0000
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
Thread-Index: AQHbr7DNX21cEvJSUk2JU081VisD8w==
Date: Thu, 17 Apr 2025 15:53:03 +0000
Message-ID: <SA1P110MB2250B8D80A2374E3003A7C2DB7BCA@SA1P110MB2250.NAMP110.PROD.OUTLOOK.COM>
References: <20250416164134.399-1-thune.a.tran@boeing.com>
		 <dd0877909b1240d999dae6979ce1efa269180173.camel@linuxfoundation.org>
		 <CAB=6tBQsqNJBqFsocxDQM9sOwz5S3w5HqkOO2cLuvH8OmSQ4kA@mail.gmail.com>
	 <1264db75faf2ae16362f1f05ea2b6b77e0fb7616.camel@linuxfoundation.org>
	 <SA1P110MB22506DADB11B27B51A1CC536B7BCA@SA1P110MB2250.NAMP110.PROD.OUTLOOK.COM>
 <34381df1e0f5da0ba1e4512afc83fc1a99e9e54e.camel@linuxfoundation.org>
In-Reply-To: <34381df1e0f5da0ba1e4512afc83fc1a99e9e54e.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1P110MB2250:EE_|SA1P110MB1941:EE_
x-ms-office365-filtering-correlation-id: 958480aa-278e-458c-12c9-08dd7dc7f017
x-ld-processed: bcf48bba-4d6f-4dee-a0d2-7df59cc36629,ExtAddr
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RW1EYUVvNlR4RXU4YmVWR0M0dENqeElIUDd5WFRveWxXZ29TNUdDMldsR0po?=
 =?utf-8?B?cUNML0tHRFFoV2ltRitzakRYSm0wempoM2RCamNkTm95N1NoaG1QT3dVR01B?=
 =?utf-8?B?cjZqZ1R5dSthM2U0S3BWMXlBTTBoRVhjbjZFbjVjbms2TGlsVVRhZDlIK1Yz?=
 =?utf-8?B?SWRtV05JU204aDdCbVFOdXBpNitTcXdJK3Q4dFFEYlVnV1pxdE1CcnMvdDcw?=
 =?utf-8?B?KzUzaFNXdEJlbWlHRkhpekNHMVhWVmZqSThqZXd5WkFVU052RllYN0U4amJz?=
 =?utf-8?B?TGoyVm5IQ0Y4NGwxL0d2SjVUQlpHY1J0M2VMcGtFSVBBcGlFMm1KTU1tOGJJ?=
 =?utf-8?B?djN4Z04vY3I3bFhYclJDbVN2eEZNd2IwTGIzSFp4M0tSTjVIbFNXUG9vZEIy?=
 =?utf-8?B?U01HbUJtTnREQU9SZElRSWNXY0FQRnB1SDB6bkNpNzhqdlowVHZuL1MvZkNa?=
 =?utf-8?B?YkNta1VVMFAyQzgzV3lSVEo0TlFjV0ZnOThkSWpPUXpuQ1lGQWY0SXYrQkZa?=
 =?utf-8?B?TmEvZ296UDAxNWtvdDRsY2crazlINnVVQUhXRjJuSmJlZDJnblJxeEpPaFdw?=
 =?utf-8?B?TFdvZkJwRzZ4NC84VStYQkl6dkpUQVQxb0gyb2liZzYyUTNXWUMxYlFXTHIv?=
 =?utf-8?B?SGUwNVJuelhvdXRweFBsM2JneGdFZ3NEKzZBWFpyeHZaUGQrVWk4TlgzVVlI?=
 =?utf-8?B?a21WYmpNZzQxL0pxVnUreWhYdE85T284d1JSTG5kNTY1R3VtakNWbC9NN1p1?=
 =?utf-8?B?b0pFc1FwWFI1dlFSbzBZakxuVDV5RGxnM2RqK2NjWlNpVGxwdEFCM3luTGRQ?=
 =?utf-8?B?Mm9abHM1RUs5UXVuL1k5M3ljUnpWVHRZMWtXcEhMbnNibDNOSCtsNnJQcHY4?=
 =?utf-8?B?a0d5VHhsM1ZWUTRTbS9MTkRHMWVwUXFEN3cyUVRqdlZPeHVtV3owMGl4bjlr?=
 =?utf-8?B?eWxTbXNZM0FQdDc4K1cxQ3lXVyt4WlhVNmF4TFVrRUYxSGF0QkZSNDd1d3Nu?=
 =?utf-8?B?NTJ6V3gzdHp6N0lXZ0E2elZMZWtlVTU0SVhVRFI4N2VYanFOYml6bjNYejdh?=
 =?utf-8?B?UTl0Z1RaaXJTREhOcTc4emZlM3RtWkpDb01GQzRUK1UvSTByUWM5d1k4OFZY?=
 =?utf-8?B?RDZoRDREMW4zYXFFZnVaTnBxMnJQcHR4b2x1UVBHK3ZjZUY2WDY2NkpHRS91?=
 =?utf-8?B?Q05xWlpXb0dBRDNZa1RGdlBrSUpqL3diQWRJL1V6c3lWYWlaRm1YWkxGb0Fm?=
 =?utf-8?B?bytvZWhRNFpnUHplTjlGTmRLQ25BdHM5Nk1nYmlHZ090UHJPTTVyK3IrUEk5?=
 =?utf-8?B?eENpQnNlOENodzFQR0h0VG9HYVJvTDlVdnJRckU2WkQ5bTEyU093bjdwaCtt?=
 =?utf-8?B?MVJ6b1ptYnJ5ZndjTjlsNGhEc2xIY21OSUZkdWJTV3pqRCthYVM3UU9tRDZx?=
 =?utf-8?B?Vkp5TksrTzF1eGk2Zk84YUlDVDIrckF6R1lNcGM5NWNRNWwzQ0RPK2lKL0Rt?=
 =?utf-8?B?Nndvdjc0N3N0V2xBSFpLeDBNRlZ5VExKUmFSWW1JbEJyU3VxMS9mMEpCMUow?=
 =?utf-8?B?WU53Mkt1N2N5TTAveEE3SVRzSGNkSUpkRG16UEpOeDBkdWRRc1loS1Rmay9w?=
 =?utf-8?B?WE8zN0xQMHhueGNPekh5SXB6N1ZSTHl3c1U1Vzc1Z3FzWmVvSGJnbXNxZzhi?=
 =?utf-8?B?TFVoRVV5d29ZcFY0VzhMZHdnZHZkSHBMbHpHdHhTOWNSYUtQNjBvVEdkNTdm?=
 =?utf-8?B?UzdwRU5KWXErNEwvVFZvdXlhRS9SdGJzUXlheVVLMnp4VHBIREswdnpQalZa?=
 =?utf-8?B?M0xMaVVyUnZTYnhwRldoTmx5aTBhZFpWU3hrWEJkYTQxRmFRS3AxblFsMUl4?=
 =?utf-8?B?Yjl2Q0VFdVJWMDRwMjg5SEx6SG9QbkltSEZ6SmxTMlNvRGZORTk4dmxVQncz?=
 =?utf-8?Q?0BdE15FtyM0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1P110MB2250.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T1BIU0lXQ3lydUxrMEZ2WitsRUJ6Zk5pR0NkZkhMSWdERU9aS1Y2SUVhei9E?=
 =?utf-8?B?UmxQRGRPWW1Odm5EZm5uNmlESVhtTHhFWVhoRHBkUHJPOW12ZjRRR0RVazQ3?=
 =?utf-8?B?RzJhS0IyMlgyZVF2VU5YOHhyaXYyM3huRjZqSGd2VVVYdEF5QXhSRk1ZV09x?=
 =?utf-8?B?MEYwWlNORlNkWFIrVS8yQVd4L09DbFpaMm10V3RtTlFEbUh4ZXhYa09QTTlD?=
 =?utf-8?B?bzY2elNSakNJV0pHOWQ0bEtaRGdGRUJ3RnVTRlRtTHNwSmQwQkkvUHIyc0hU?=
 =?utf-8?B?L1BrRXE3K0lWVkVxVTZyZmxJQ28zaGYyUkF4ZWZKRU5OTE4rV0g0R2xiQTJR?=
 =?utf-8?B?cHV3R0F5blduc0JnekMveGJNamNKd3JsS2t6OUoxcDRZZ1crZmk1QlZjL1hs?=
 =?utf-8?B?RUpqSVpYQWNjRmRzTXd0K3Q1MHVZZlVxb3F4WjJxWXQ1KzA1VEFKWVRHeTRq?=
 =?utf-8?B?Qm0xUGtxZnl6K3NzWUh0OUgrRTF3OHc1SVUxSm41RU90QW10ZXJ6YmZKd3p3?=
 =?utf-8?B?TU1rQWM5YkUxUTNkOU5jU2Y5dUVjMEsvM1ZJZWFwZUhHL05GbHQ4cDh5dzM5?=
 =?utf-8?B?Z0tUVW5rRDVKd3h0STdyVHJEZ0NBMDNZbGIrRDVYdi9XZzNDOVAzSTNyZGdL?=
 =?utf-8?B?S0tuQWI0SjVNQTh5Zlh3ODAvUERTQUtqTG9ycFlJN3VPZVo2a1Q2WndzUDhm?=
 =?utf-8?B?WjhGL0Vkak95L0V1TWt6T1BTOVBYTHVjdUdPOWc5VUFDMGlBSUg3S2EwbGxx?=
 =?utf-8?B?NU9RclIyKzdGT0w0cjVxVzkxbHNiRTNYczArQ1A5cjhsVlJ2QS95dmxBVU1V?=
 =?utf-8?B?NkJFbFFhZEk1LzdYZWF2WktiZ1FTWUlGNEJ2UytMREF6OFdkZExYRE4xSzd3?=
 =?utf-8?B?b0h1ZFNvWU9xLy9LV0ovRnI5VTlGT1ZsdVA5WmN4REg1aUl6Y2xwdktRenhv?=
 =?utf-8?B?cXp3VTJTcE1tcWdoYmRpZ1Eyb1hWYnhQNlVZTEFoNm0valdNT21FclcxaU1z?=
 =?utf-8?B?S1ZyU2gxY25pbEZKQytBZHl1THJFZElvSWlRTUw3aXRvbEZGNGR3U1R6VDFF?=
 =?utf-8?B?Z3lMWnFjUGVCNlVrQjZJQUNtZFhNN2NVQllJOGdKSXFwcHYyWE5kMTcwZ3Zi?=
 =?utf-8?B?TmVsNGY0Vlp1WFpRK2VCNm91enVYZXl3S0FBeitFVHg4YWZwV29iNFM4dnR3?=
 =?utf-8?B?RGYzYjdQVUFPbS9ma0k0ZXJ2QUlzdUVmNzMzSmJzMTF1ODBrUkJVeHAzR3U5?=
 =?utf-8?B?WVBuc0tBRnNLUGkxMmZkVkJFMjF3REw0dnE2UkppSTIwakRHSWV1Z3hza1o1?=
 =?utf-8?B?amtoOTV1b3lYMzNabHdHTUhjZEhKcWFOR2dLc1daSzFjVngxMWtUZHEzdzNv?=
 =?utf-8?B?TlRxSnVUSCtRbTB5eDV2VmpId0crbWNtcW9yVHRJL1MxUWxabkJQY3d6SFJx?=
 =?utf-8?B?emlaV0ZoQXJxZzI2NEZXcUJHc3pCNkRENkora1FwVnNFbHF3U01ER2FzMTFD?=
 =?utf-8?B?dTFNeklsT2I3U25uUVhOeEQyLzVPd1ZYejMxM1BXczA5MjN4bytEaFNZNUEv?=
 =?utf-8?B?QkthYTY1NFN1TkpISDhjbmxVdUdjTVUvcHcvMFNJNVl3djVaRnloRTZSQm82?=
 =?utf-8?B?bUMyS0x3NmRNNGZ1aHlQV2hXYkk5ckFweTRGYk53LzMwWE1VYnlxUmwxYi9i?=
 =?utf-8?B?TmxLUnV0aWJZSlZuaTNXbVpVWnRVUDZ5eHhjc0V5dFBma2Q4a2w0ZXYrK3Uv?=
 =?utf-8?B?MXZ2eUQwdUJMcjVxV2NMSnJsUjZFOC8xUTV5RStSak9PYnB3NXRwV0dWaXBx?=
 =?utf-8?B?ajRSZHE0cFpiSnFwbGM2bk9FRlRrSTAzZG95NGNaam01cmJJSm5hUG9Hc0No?=
 =?utf-8?B?dFVucXk2TjgwcGJ4RzNCWlkxVlVmWWRHR0cxeC9IQ3BsN0hQWFVYSi9GUFlG?=
 =?utf-8?B?bnI3blNQRktwTXdJWEtCdXVoTWtzbDNNNnVLTlBWZG05VzVEVFJTQnlYT2hJ?=
 =?utf-8?B?ZmFYSlVDZ1NtUmdldWN1WWk5ZlFCdUxXcXErTUZTNW5JdW5Hd2lFcGM3aGVL?=
 =?utf-8?Q?Ix01L9?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1P110MB2250.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 958480aa-278e-458c-12c9-08dd7dc7f017
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2025 15:53:03.5877
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P110MB1941
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 15:53:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215104

PiBPbiBUaHUsIDIwMjUtMDQtMTcgYXQgMTI6NTQgKzAwMDAsIFRodW5lIFRyYW4gdmlhIGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gd3JvdGU6DQo+Pj4gT24gV2VkLCAyMDI1LTA0LTE2IGF0IDIx
OjM5IC0wNzAwLCBDaHVjayBXb2xiZXIgd3JvdGU6DQo+Pj4+IE9uIFdlZCwgQXByIDE2LCAyMDI1
IGF0IDM6MDfigK9QTSBSaWNoYXJkIFB1cmRpZSB2aWENCj4+Pj4gbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KPj4+PiA8cmljaGFyZC5wdXJkaWU9bGludXhmb3VuZGF0aW9uLm9yZ0BsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiB3cm90ZToNCj4+Pj4gDQo+Pj4+ICU8IFNOSVAgJDwNCj4+Pj4+IA0KPj4+
Pj4gSSBzdXNwZWN0IHRoaXMgY2F1c2VzIHNvbWUgcmVncmVzc2lvbnMgaW4gb3VyIGF1dG9tYXRl
ZCB0ZXN0aW5nDQo+Pj4+PiB1bmZvcnR1bmF0ZWx5Og0KPj4+Pj4gDQo+Pj4+PiBidWlsZHRvb2xz
Og0KPj4+Pj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMv
YnVpbGRlcnMvNDMvYnVpbA0KPj4+Pj4gZHMvMQ0KPj4+Pj4gMzk2DQo+Pj4+PiANCj4+Pj4+IG1l
dGEtbWluZ3c6DQo+Pj4+PiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFs
a3lyaWUvIy9idWlsZGVycy83L2J1aWxkDQo+Pj4+PiBzLzE0DQo+Pj4+PiAzMA0KPj4+Pj4gDQo+
Pj4+IA0KPj4+PiANCj4+Pj4gV291bGQgaXQgbWFrZSBtb3JlIHNlbnNlIHRvIGFkZA0KPj4+PiBz
ZWxmLmNvbnRleHRfZXhlY3V0b3JfY2xhc3MuZGVmYXVsdF9jYXNlcw0KPj4+PiB0byB0aGUgbGlz
dCBvZiBwYXRocyByZXR1cm5lZCBieSBnZXRfc2RrX3BhdGhzPw0KPj4+IA0KPj4+IG1ldGEvcmVj
aXBlcy1jb3JlL21ldGEvYnVpbGR0b29scy10YXJiYWxsLmJiIGRvZXM6DQo+Pj4gDQo+Pj4gwqDC
oMKgIGNhc2VzX3BhdGggPQ0KPj4+IG9zLnBhdGguam9pbihvcy5wYXRoLmFic3BhdGgob3MucGF0
aC5kaXJuYW1lKG9lcWEuc2RrLnRlc3RzZGsuX19maWxlDQo+Pj4gX18pKSwNCj4+PiBkLmdldFZh
cigiVEVTVFNES19DQVNFUyIpKQ0KPj4+IMKgwqDCoCB0ZXN0c2RrLmNvbnRleHRfZXhlY3V0b3Jf
Y2xhc3MuZGVmYXVsdF9jYXNlcyA9IGNhc2VzX3BhdGggbWluZ3cNCj4+PiBkb2VzIHRoaW5ncyBp
biBhIGRpZmZlcmVudCBwbGFjZSwgc2V0dGluZzoNCj4+PiANCj4+PiDCoMKgwqAgZGVmYXVsdF9j
YXNlcyA9DQo+Pj4gW29zLnBhdGguam9pbihvcy5wYXRoLmFic3BhdGgob3MucGF0aC5kaXJuYW1l
KF9fZmlsZV9fKSksDQo+Pj4gJ2Nhc2VzJyldDQo+Pj4gDQo+Pj4gaW4gbWV0YS1taW5ndy9saWIv
b2VxYS9zZGttaW5ndy9jb250ZXgucHkNCj4+PiANCj4+PiBJIHRoaW5rIHdlIG5lZWQgdG8gYWRk
IHNvbWV0aGluZyB3aGljaCByZXByZXNlbnRzIHRoZSBuYW1lIG9mIHRoZQ0KPj4+IGRpcmVjdG9y
eSBmb3IgY2FzZXMsIGkuZS4gInNkayIsICJzZGttaW5nIiwgInNkay9idWlsZHRvb2xzLWNhc2Vz
Ig0KPj4+IGFuZCB0aGVuIGFsbG93IHRoaXMgdG8gYmUgcGFzc2VkIGludG8geW91ciBmdW5jdGlv
biBzbyByZWdhcmRsZXNzLA0KPj4+IGl0IGFsbG93cyBjdXN0b21pc2F0aW9uIHdpdGhpbiBhIGxh
eWVyLg0KPj4gV2UgY2FuIG1hdGNoIHRoZSB0ZXN0IGRpcmVjdG9yeSBwYXR0ZXJuIChzZGssIHNk
a21pbmcsDQo+PiBzZGsvYnVpbGR0b29scy1jYXNlcykgZm91bmQgaW4gZGVmYXVsdF9jYXNlcy4g
VGhlIHRlc3QgZGlzY292ZXJ5IHdpbGwNCj4+IHRoZW4gYmUgYmFzZWQgb24gdGhlIG1hdGNoZWQg
cGF0dGVybi4NCj4+IA0KPiANCj4gV2UgY291bGQgZG8gdGhhdCBidXQgaW4gdGhpcyBjYXNlIEkg
dGhpbmsgaXQgbWlnaHQgYmUgYmV0dGVyIHRvIGltcHJvdmUNCj4gdGhlIGNvZGUgYW5kIG1ha2Ug
aXQgYSBiaXQgY2xlYW5lciBpZiB3ZSBjYW4sIGV2ZW4gaWYgdGhhdCBpcyBhIGxpdHRsZQ0KPiBt
b3JlIGludmFzaXZlLg0KPiANCj4gVGhpcyBhcmVhIG9mIHRoZSBjb2RlIGNvdWxkIGRvIHdpdGgg
c2ltcGxpZmljYXRpb24vY2xlYW51cC4uLg0KDQpNYWtlcyBzZW5zZS4gV2UnbGwgbG9vayBpbnRv
IGhvdyB0aGUgY29kZSBjYW4gYmUgaW1wcm92ZWQgYXMgd2UgY29udGludWUgDQp0byB3b3JrIGlu
IGFuZCBiZWNvbWUgbW9yZSBmYW1pbGlhciB3aXRoIHRoaXMgYXJlYSBvZiB0aGUgY29kZS4NCj4g
Q2hlZXJzLA0KPiANCj4gUmljaGFyZA0KDQoNCg==

