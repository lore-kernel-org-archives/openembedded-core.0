Return-Path: <thune.a.tran@boeing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53082C7115C
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 13:43:10 +0000 (UTC)
Received: from ewa-mbsout-01.mbs.boeing.net (ewa-mbsout-01.mbs.boeing.net [130.76.20.194])
 by mx.groups.io with SMTP id smtpd.web10.15626.1750858987345142803
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jun 2025 06:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@boeing.com header.s=boeing-s1912 header.b=os8fMayc;
 dkim=pass header.i=@boeing.onmicrosoft.com header.s=selector1-boeing-onmicrosoft-com header.b=Z4KaqFNO;
 spf=pass (domain: boeing.com, ip: 130.76.20.194, mailfrom: thune.a.tran@boeing.com)
Received: from localhost (localhost [127.0.0.1])
	by ewa-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id 55PDh5Ud046793;
	Wed, 25 Jun 2025 06:43:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1750858986;
	bh=VldXkKTXO328elQtN2WPQrkwye5RWSwdiFyxWkXbG8Y=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=os8fMaycmf1gauUOG3Ai5Om4A2n1GRCxjevNDMKqmoFw3VQq7CbjOPM2bOilUSVaL
	 8TTKZMNFsglFKN61XuUITb650SUuO9ua0T21SnToJWkEX/DGYfMaZTqLTTEe0fl3CT
	 /6NtSAKU0Rw01BR7E5U8IA6uBgGw6YJpPX5uL6OExwtx+HutG8iwTe0+0lNVTvJF+9
	 /gs/bADpcD/DG5RLGGRpaEYv9nGQaMAAdun1bYZN/BDWhiymOwLvZcLf96v2QTTujB
	 DXeJ8IWsPhYLVX5vl5VwaiZXAPV3bLw8mVp90hHnf+0s/cvfJDAg71efbZm6NLI7lU
	 Qo9iBThTMr+2w==
Received: from XCH16-03-03.nos.boeing.com (xch16-03-03.nos.boeing.com [137.137.111.12])
	by ewa-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with ESMTPS id 55PDgrNs046683
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 25 Jun 2025 06:42:53 -0700
Received: from XCH16-02-01.nos.boeing.com (137.137.110.53) by
 XCH16-03-03.nos.boeing.com (137.137.111.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 25 Jun 2025 06:42:52 -0700
Received: from XCH19-EDGE-Q02.nos.boeing.com (130.76.23.14) by
 XCH16-02-01.nos.boeing.com (137.137.110.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44 via Frontend Transport; Wed, 25 Jun 2025 06:42:52 -0700
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.178)
 by boeing.com (130.76.23.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 25 Jun
 2025 06:42:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=PLZ6gT9izNIX9h5O7JYFZcAfpM1TGtYDpFfr7TiPiq771doJyAg8SghGKbPYEJ9Kk36xV9Qgy1KCijRJxhiVai27wkLKJz3UR9UHCeeRC9+rlsF87PDeiiIIumPaiqurrtVb4t9iFe6H/+fnhSCOsqQmzyyUhpQyEEV3QMwsQLfKqp4QysCcXthpgZ/mv3x73oFPyJmhm/mMSZGxfjXJFUyFaz9dg7PYHame3w6Yb7CT/3NGIzPd83bJzIptV0ARXJoYw+e/kw6zsVktpvrCASAWNNkK4yVuD5wavx5mmdtEuYPXL53Qy2LXLAKDQHWVt+ybLPxvCFx2pN3MXIvYSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VldXkKTXO328elQtN2WPQrkwye5RWSwdiFyxWkXbG8Y=;
 b=X9VI+FHHKQC0+iK/+oiUcq9IaiRJ4ddt/X7Ni1y5Y8EjuFZPKvKYWz6EsX/nV+apwrGiyjOPc1XkOu/1RxhIsKTxTkE+H8Szoua7O+2e0213H/b1JsV5aTkEGEdVnE3Y2XiKgeaWJJT5F8l0twNOxYGRetm41TuIiXYwKfaiIZjddoqIbLd8/Rg5cveHbmLyJu8WMp2bgh+PjXPhIlBd4rV7RtGZs3svNPf6i5Xtib97kaCJrd4KukHQbWFm2rmf/HwxR54ZrswqHvGAeI4EpoxhcTKMPhrMFy9aSUZ4kXX7tvhTyc0D8VaSxG7RVZzzskcrXjDTX0UZnW/VlB7W+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VldXkKTXO328elQtN2WPQrkwye5RWSwdiFyxWkXbG8Y=;
 b=Z4KaqFNOSiJoUB6MciQms56GDnVexMXCNJQfipYDpSC+q9kgSf/B+6MOm8kr6Dr1+T7KnSrrdUCZpzUz9TN2+egnADxMXRgsN0DbTuGjqs70P7n6/e7LHR8RrwkO44uSBbvKINb6N1TZsMGD/1YnaQ9aNjnuUITXtmrvbgYznxE=
Received: from SA1P110MB2250.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:166::5)
 by SA1P110MB1327.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:197::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.31; Wed, 25 Jun
 2025 13:42:27 +0000
Received: from SA1P110MB2250.NAMP110.PROD.OUTLOOK.COM
 ([fe80::458e:59d0:1c4f:a9f]) by SA1P110MB2250.NAMP110.PROD.OUTLOOK.COM
 ([fe80::458e:59d0:1c4f:a9f%6]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 13:42:27 +0000
From: "Tran (US), Thune A" <thune.a.tran@boeing.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "ross.burton@arm.com"
	<ross.burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "Wolber (US), Chuck"
	<chuck.wolber@boeing.com>
Subject: Re: [OE-core] [PATCH v2] oeqa/sdk: Simplify test specification and
 discovery
Thread-Topic: [OE-core] [PATCH v2] oeqa/sdk: Simplify test specification and
 discovery
Thread-Index: AQHb5db9sGlRIVBSnEO9qPHb/F6nOg==
Date: Wed, 25 Jun 2025 13:42:27 +0000
Message-ID: <SA1P110MB2250089E3E0924A65A0254BDB77BA@SA1P110MB2250.NAMP110.PROD.OUTLOOK.COM>
References: <20250605221301.890797-1-thune.a.tran@boeing.com>
	 <758CF101-6F42-470E-A68B-CD0F48F2702E@arm.com>
 <9f403e68b52b3d00ea2e4420cdb3a2b764847b9c.camel@linuxfoundation.org>
In-Reply-To: <9f403e68b52b3d00ea2e4420cdb3a2b764847b9c.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1P110MB2250:EE_|SA1P110MB1327:EE_
x-ms-office365-filtering-correlation-id: f706720b-d753-4876-c4a1-08ddb3ee1ff5
x-ld-processed: bcf48bba-4d6f-4dee-a0d2-7df59cc36629,ExtAddr
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QU1JWTdaZjVLL05wbnFTaFRwNnUyQng2RFlmR0ZxVE85K2lxd1NOQTlWUHZE?=
 =?utf-8?B?cE9PcHhkd2Z4S2QrdWJ6YUl1YTFtVlFtUW5WUWpQdk9oODF6Si9VVUpZQURD?=
 =?utf-8?B?Y3VCcGl2UnR3TGxMTUpSTG1VZE00VHEzRTBjVHhvdEpjaEUyN1hZL21Mdklu?=
 =?utf-8?B?Wlg3NGRxSmRTc3F3S3k0RnNBR3JPdThOVGhQcWI5Y0VuTFlpN3dZODhUWUlu?=
 =?utf-8?B?dGZ4d040eWVOV3pnc2VDU2dZSUowNWhHZERyWnltUXlWcXVVTDlkVTNiYXZI?=
 =?utf-8?B?YTVFanR3Z29RcUZMOUxkVXBhV1JRZCtaWjZiQU1rbTdtWk1hRzJVSUh3ZnZt?=
 =?utf-8?B?eEJjS2tEWEJmU1IraU13UjF6QitFSFNTejVDYnlGbnlSWmFpQXM5c0J6OHNm?=
 =?utf-8?B?cDFDZzJvcko2cDY3RzhXSldpMHhCcmMxUFZSeTdLUlMwbThNQWExOVRiVTN3?=
 =?utf-8?B?NkZUdWdCMmpHRWh2VG9ITWh6TXdCRDVBcWFwRmxtQmVrR2NPc3hKTXJEblY5?=
 =?utf-8?B?bklXbWg4Q01RU2V3M25vR09RNDlIeFcxUHA5L1pQVEdkbzFjbXZsUnN6TzlP?=
 =?utf-8?B?LzhpeVhHY1lxazFOam1PSFNGbXJmZDc1c0kxRnFTSUNTY3hHOWtlN1NkWDdG?=
 =?utf-8?B?ZzRuY3FZRTZvSkZEWGNnTUZpdVVlODkrc1l3WEtnWjdoTjhINGNBRGVnL25l?=
 =?utf-8?B?NnY0S3FPRzBGbHVUVW5ocTYyQlB5YUFQL2c0WDlTNElKWlpJOVVpc1RFY3dT?=
 =?utf-8?B?anNaeUpEQThqM1duZnlKcjBIMEViVFo5SUF5OEV5U3hkaTkyMWZrQWRYRWMw?=
 =?utf-8?B?UktKVVBnY1gwUzNOR2FvVGtVbWExVTI4ei9oQ21wbDFDdG5OdkRqRVNERjNp?=
 =?utf-8?B?K1FKZE1sU2dRK21URXRKL2hBa25Bbkc5MmpLcGZRNmpQTWdtZWFRaTV3TFNE?=
 =?utf-8?B?bERJdGZoOENTR0hoTUlTaHZmWlRjMm1JTitiUEUvZFdReFRiWVE3RzlRb2t1?=
 =?utf-8?B?R3Q3N2FicjNFa3Jjelc2VXZDVFFSWFFGMkNNQTQ0NVA5elpRbFZUOXhZbkxD?=
 =?utf-8?B?TENPalIxbVRBbDUxSzgrQkt6NS9Ba1NOTHVnb3grcXJvdzZiZGRZdm5vN3Fi?=
 =?utf-8?B?RUNhTDh5Y2ozbmJtUEVGN3FUeHNsQ3pkaVVYNmZnT0RNQXUxVXFXeVo4Um8z?=
 =?utf-8?B?SWl2eTZmbm8rSWREL2JVOE5xemxZeHVtcXhUTHIxbzdiZXBNNkg4cFFsVGNw?=
 =?utf-8?B?dmRHckdiZi9TazB5MVF0RlFTd0NoNDNDcEZaaitlSlAvajFFSzJUV0RMa0lE?=
 =?utf-8?B?aDN3aHBtUTZlQVR0SDY5RnZ1WkFpazV2clVLTy9yUXFJbkt1cWNzUWRqdXYr?=
 =?utf-8?B?cGZuSlVUbkxkdEtFNzNKK1BObEhiVUNHTldQcWVZTWlRNUVPSGtMNkJpUXZE?=
 =?utf-8?B?OGt4OGhaZXZoVXB6VmpPd1F0TXJJNHJENXFlbU1MV1JuT2c2VXBsZkIwUUJr?=
 =?utf-8?B?NXdVUHNVZ2hwSGVMS3NSK1FwNk9HMXZQNnkvT21QNEtTRHJPZkVYeW5wMUJN?=
 =?utf-8?B?OUtjWmZwVVNUNkpZaXR2aFRMUDF6aW91YlZUeUt5ZFRtd2ZCSW5qdVd6V0lB?=
 =?utf-8?B?VFVaYm5LRS9mbC83T053OHg3blFxQ3MvOGN3VFIxWk5CeDB2dWRUUFRwRGhp?=
 =?utf-8?B?WGlESkhMOVgwZ3FnMjVhRnRjNjB4TkRBbC9Yd2NYejN4Yk1aNzE5YkpTMlMr?=
 =?utf-8?B?ZWFESC9RcTNvNldRV0ZReFM1U3J5YktpR1RTQ3ZSVWIzL1ViK2RHTXo2RVpk?=
 =?utf-8?B?VW53TUZsR0FjR2JCUlUwaDZkWC9ObGgzTU1EMVh3U2Vxbm15cGlJWWlmeG5r?=
 =?utf-8?B?L2RlYTN4aXZtOHZZdUtuNTZaZWlqeXIvaEZoMFZyRE1MczdCckw4VzN6a2hC?=
 =?utf-8?B?QkZ4OGx1b3EvYzNYSHpmQzU4VWpJSklMR3FaQVdWbGZjTVJyQ0FLWHJ1Yzdn?=
 =?utf-8?B?YkFiN1pzQ0Z3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1P110MB2250.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VmhkKzIzOHFDY2dUYm8wQklKK1NSUzQxSWJHTmdnYzhwMm9kUGRXSk41dWwy?=
 =?utf-8?B?QmNlb0RVSTcwZ0tHMzk1ZkZKbW9LZ2ZXQ0pmNGp6dllSU2tOM2cvZDludEVt?=
 =?utf-8?B?LzZ6cnlMOS9VMk5EVlNqaEF5ejJiSlBQOTdiU01xU0Q5MTBkSURuMGlac2kz?=
 =?utf-8?B?SlVaZ2w1TEVEMnlWaWFiVGtOUTJtRHVMTGJ1cVlLSmJWZkZ4ZnhsWVRUbDZy?=
 =?utf-8?B?ZnNsak1RRG04QzNxbENMODRhN0ZIeXFUcnBwWjNDSUJpaXR4TTcvZHphcGtZ?=
 =?utf-8?B?RjNZM1BKZFpocHZ5WWhTbUlZbkE0ZGk1dFQzWlNwTHgrMU9PcmxaVk5KNllQ?=
 =?utf-8?B?T3JvbG5aVGlaTVpoa29iTFYreTdSL1RhQVYvYlVvUnIyVEVveW8zeU5yRklJ?=
 =?utf-8?B?cWIwN0VjclM4ZHE4R2hKcHpETDZoekN0N1Q3a0RuUCtzU29IeU14UjhiWWov?=
 =?utf-8?B?VEQvT0lqeGdUOVliUFh1K0VCMDg5UTJBWjRjNW5ucHcwd25tRzdNR0FRTTUw?=
 =?utf-8?B?TjJkVWN0ck9aY0JhYk0vZ2NwY204U0Mra2RIdS9QK0lYZktVQ1FGaUxpaEYr?=
 =?utf-8?B?OEJZQ21lNGVhZ2NXMGJrL0kreFlOYWpuaDBxdGJnN2dpSTRVNmdZSW5NaW1W?=
 =?utf-8?B?TkwyNFAyaDJzaHJMR1dUUWZPeXhIcjNvZ1NYQmVTSGdwUXhCYUJsWDROTVVF?=
 =?utf-8?B?QktwWGhVUmFiRzliaG55UFBsVmgzcFZnM0F1aEJ3aXl4Qno4NmpFTEd0dTBG?=
 =?utf-8?B?MGxoY0MvbGEvQmdxNG9EMHRjZXU0SjdtdGxlbTYxQ1BNSGdVUzZqeGxBb1NF?=
 =?utf-8?B?ZUQyZ043QWZ6MVQ1amVrNVZNcFJsaVMwYmJLYnZzR2d0eWFhcHBic2QxMTBJ?=
 =?utf-8?B?SDZVVFRmamtIempCYTl2ZjJoenN0Y0lNWE43dS9OT0FmUHNMSGl3eTZHWnUw?=
 =?utf-8?B?aDhnUU9KR2NVbUVnWFFJaGVLKzgzNnpYbGdsVFNYQnJBL3dDelJDVGR4MEhy?=
 =?utf-8?B?WDlLOE9XdXZwTk95dU5BbUNrTzJRQmE1aXFTQmVrVkFTYS9IYXdsc29SUVAx?=
 =?utf-8?B?aFhwL3ZWYmNTQitxWTRhSWlyVFVlZlUzTXRCT3BydXB0UlBEaFp2NDl1R0c1?=
 =?utf-8?B?TGlTNmtQRlpac1MyWEFzYXdzTHBZNnlLTnpJSnFMQS9qVUFQOHJzbFhrNkht?=
 =?utf-8?B?QjhUOE5oQjBKZmVUZzFsdDd2VldMQ1VqVXFSSFJnbkZ2ek5LV2h4NFJ0aUhz?=
 =?utf-8?B?emRVeitsc2Fpczk4MWhYbHZNUmdqTjY5WEhJSWgrZW1QRWdkUS9pclhHenJj?=
 =?utf-8?B?UEplcGtSalNvVUVjV1JBRVlRdHBobEVrcW9aRGhsSnNXcnZpTWFmakc5b3VV?=
 =?utf-8?B?c0cwMmxXaHRUTElrMGMwS0ptVmhDeGFQWC83MGkwOFUzTDdvYnlRVlQ1ZGJn?=
 =?utf-8?B?N1FjY1pRYTYvQ1hOenRFektoK3RSdzhKY0hoU0JFR2MwTEpZTExTL1VCUW1x?=
 =?utf-8?B?RzRHb1ZDYmlJSllhUkhKblNISFBqUDVSZWtjNzE2dWxIOWM1NjZOMDZaYi9P?=
 =?utf-8?B?QWQyRjFyZWZJL0dSaTJqMEp6OVpIUDBlUXBjeEQxbGxjSFdwbVpaZVZXNWdp?=
 =?utf-8?B?VUp3Uk1LcUMzQ09OVnFHTkpNaUpVOWo3aG9sNGRqWGsrWnFvN2EwU2dHUUtE?=
 =?utf-8?B?bkNEQUduYlJ0bDhUZUw2eVFScHdJZkxmRE96Tm5vRnJSSjFkbFM3YysvQ2xC?=
 =?utf-8?B?cFZ0VlpYRVZQUFJZT0F3ZDZnNHdTMzZiZXNxanQxL29aZzVZU3JGdVB3elM4?=
 =?utf-8?B?b08yVkVEMngyaEpzNkVYcU9jV2lBRHp1NWQ5ejQ2N241SkQ2YXFGWFRoS0I2?=
 =?utf-8?B?WFpwd2d6eWIvdzdqY0ZsYzFBc1hhZXVVcU9lcUZndzVYNHJnNXVIQmZDTUY3?=
 =?utf-8?B?ODZRWjRoamRUVnQ4aXhJblhhYWIwZnA1ZEtyQWFGWUxzZXRuL2VGV3BlSlg4?=
 =?utf-8?B?MlAxeU83QTAweFpVdVdQVHNOb3BxdzdOSHZHUUVrV29yM3lKcE9PL2NNekRU?=
 =?utf-8?Q?jQD+8i?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1P110MB2250.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f706720b-d753-4876-c4a1-08ddb3ee1ff5
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 13:42:27.6225
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P110MB1327
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 13:43:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219319

PiBPbiBUdWUsIDIwMjUtMDYtMjQgYXQgMTE6NTkgKzAwMDAsIFJvc3MgQnVydG9uIHZpYSBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+IHdyb3RlOg0KPj4+ICogSW50cm9kdWNlIGBURVNUU0RLX0NB
U0VfRElSU2AgdmFyaWFibGUgdG8gc3BlY2lmeSB0ZXN0IGRpcmVjdG9yeQ0KPj4+IHR5cGVzLA0K
Pj4+IMKgcmVwbGFjaW5nIHRoZSBuZWVkIHRvIG1vZGlmeSB0aGUgZGVmYXVsdF9jYXNlcyBjbGFz
cyBtZW1iZXINCj4+IA0KPj4gSXMgdGhlcmUgYSBuZWVkIGZvciB0aGlzIHRvIGJlIF9ESVJTIGFu
ZCBub3QgX0RJUj8NCj4+IA0KPj4gSXMgdGhpcyBqdXN0IGJlaW5nIGdlbmVyYWxpc2VkIGJlY2F1
c2UgeW91IGNhbiwgb3IgZG8geW91IGhhdmUNCj4+IGludGVybmFsIHVzZXMgd2hlcmUgdGhlcmUg
YXJlIG11bHRpcGxlIGNhc2UgZGlyZWN0b3J5IG5hbWVzPw0KDQpXZSBjdXJyZW50bHkgZG9uJ3Qg
aGF2ZSBhbnkgdXNlIGNhc2VzIHJlcXVpcmluZyBtdWx0aXBsZSBjYXNlIGRpcnMsIGp1c3QgDQpm
b2xsb3dpbmcgcGF0dGVybnMgb2Ygb3RoZXIgbGlzdCB2YXJpYWJsZXMuIA0KDQo+PiBDYW4geW91
IGRyb3AgdGhlIHNkayBwcmVmaXggZnJvbSBzZGtidWlsZHRvb2xzIGFuZCBzZGtidWlsZHRvb2xz
LQ0KPj4gZG9jcz8NCg0KWWVzDQoNCj4+IEnigJltIHRlbXB0ZWQgdG8gc2F5IGRvbuKAmXQgYm90
aGVyIGhhdmluZyBtaW5ndyBjb21wYXRpYmlsaXR5LCBidXQgaWYgeW91DQo+PiBjYW4gc2VuZCBh
IHBhdGNoIHRvIG1pZ3JhdGUgbWV0YS1taW5ndyB0aGVuIHdlIGNhbiBqdXN0IG1lcmdlIHRoZW0N
Cj4+IGJvdGggYXQgdGhlIHNhbWUgdGltZS4NCg0KSSdsbCByZW1vdmUgdGhlIG1pbmd3IGNvbXBh
dGliaWxpdHkgYW5kIHN1Ym1pdCBhIHNlcGFyYXRlIHBhdGNoIHRvIA0KbWV0YS1taW5ndyBzbyBi
b3RoIGNhbiBiZSBtZXJnZWQgdG9nZXRoZXIuDQoNCj4gUGVyc29uYWxseSwgSSBkb24ndCBtaW5k
IHRoZSBtdWx0aXBsZSB0ZXN0IGNhc2UgZGlycyBidXQganVzdCB3YW50ZWQgdG8gc2F5IEkNCj4g
YWdyZWUgd2l0aCB0aGUgcmVzdCBvZiB0aGUgZmVlZGJhY2sgYW5kIGl0IG1hdGNoZXMgd2hhdCBJ
J2QgbWVudGlvbmVkIG9uIHRoZQ0KPiByZXZpZXcgY2FsbC4gVGhlIHBhdGNoIGluIGdlbmVyYWwg
aXMgZ3JlYXQgdG8gc2VlLCB3ZSBqdXN0IG5lZWQgdG8gdHdlYWsgdGhlDQo+IGRldGFpbHMgc2xp
Z2h0bHksIHRoYW5rcyENCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2shIEknbGwgc2VuZCB2MyB3
aXRoIHRoZXNlIGNoYW5nZXMuDQo=

