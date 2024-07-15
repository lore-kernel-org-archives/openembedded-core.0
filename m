Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A47B5C3DA59
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 11:18:47 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.70])
 by mx.groups.io with SMTP id smtpd.web10.35708.1721042322453434243
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 04:18:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=NHRGpnGN;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=NHRGpnGN;
 spf=pass (domain: arm.com, ip: 40.107.249.70, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=VvzP/vXrZ4PIP8dUL0EDlNHDD7J9IbwxdZfzRxCoq1RE0kYvg+s493iLVZmLPnlCKf2YZK+k9Tk+VaN0DKYXGG1dLl19bvpyC6DaJRWd+l0wHgm/BVLQ/qjOMq3zc/2KFKmSoES0hAngwkG1CDnDubcpyVSDGI8Skrginag1NpZsJWcOcttI5uRgU7W3uw6P8tH5i+UmwofwnPp0mFddpthJDJSCZ0qLQ8q6et7o0o08tuPux6Db/dIEs1Xg+Ad/LkjrH0ejuw3n0mSnxGB5Vtf/k53YrxciF9D94BaGEyZI7eGt8mw2LqK+bkU0pT4crmDtauv9xOjWuBgXvgUjdw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQferaiUOaFc7hyvNDO0JKBp7QvsprKZulcZLBPSjxg=;
 b=YJMUzFzUsq7ENJklLVRJZbFepHllqUuUYNd4seY5XA/45BPM59YIynt9DgDXr07gX0b8auXCrq7/XtpluLFpuDEVMlicM016DeAq7KqkxAzGx26xK716W9sSplArolIhMYn7Y+zZIpkrv3dYvKuWZvHkrKUXFke0Rj8cIgMD3jymOx3j0G2plfd7O8vEDRXZdVA7SS83WtDaJaA3bFI2BsaX7Kn4DT97mWgMHsaLQxBWr+1dizU+jgsxxUK9cx3LCS2mnHel1BsHKtFIzj1zcO38RvyPfmP5Ud/fSegUNLEEUbR3B3o48MwIp0DfKEQLI5XsTngGTszPoGZYZlqKtA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQferaiUOaFc7hyvNDO0JKBp7QvsprKZulcZLBPSjxg=;
 b=NHRGpnGNSnhqb0Vi0449Zd52A9OT03KzXXZ/Jr3mo9DPYn6qw5PRd+h6Z9X31mqQ/+EDVHWfo0b7IHhBnIQqHKTCf42yhu/NVFwaxO+gsRix6iraEJMe+ntM4BUtDPUSu9cWYarUAZOkMe4Xalaw1yQJA1/xMFfv3YoWJ9qKaHU=
Received: from DB3PR08CA0019.eurprd08.prod.outlook.com (2603:10a6:8::32) by
 DBBPR08MB10818.eurprd08.prod.outlook.com (2603:10a6:10:532::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 15 Jul
 2024 11:18:38 +0000
Received: from DU2PEPF0001E9C4.eurprd03.prod.outlook.com
 (2603:10a6:8:0:cafe::3d) by DB3PR08CA0019.outlook.office365.com
 (2603:10a6:8::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28 via Frontend
 Transport; Mon, 15 Jul 2024 11:18:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9C4.mail.protection.outlook.com (10.167.8.73) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7784.11 via
 Frontend Transport; Mon, 15 Jul 2024 11:18:38 +0000
Received: ("Tessian outbound 07fc57942f32:v359"); Mon, 15 Jul 2024 11:18:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 524a87922c383971
X-CR-MTA-TID: 64aa7808
Received: from ae5bc7708ca6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2BAD5E87-3BE3-416F-AB6C-2FCB6427B31E.1;
	Mon, 15 Jul 2024 11:18:32 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ae5bc7708ca6.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 15 Jul 2024 11:18:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vfx3PTwsRJ2xEw4C2kAPsLN4EYKBrTgzsr1Rt6XdB54XM1SCtRKWpRP4NVhHppi904RRGACkWLOrpnG5F+jP5sbpou1uIr3JT52TRrlBU8qbwwQjIWORLU6vl60yuuTpu5aKahVRhrJVLpFj1gAR/e4qAeqfUiAtMu8NYJqwrbEHmcO0VxK3Z8VHDwrV8RFKnh0egbOBBXrmMJ0kXDk6bPnYmIFHHEXU1xI2bTNjNiPkrBlp1Gl3Dl/rspjfaUWicTAyO5XtyGhE3+VKPqvoBDTn52THEOBACc2azNuniun1AUJwNW8qhtUfFgzAOgsHC+ezLFb5ghyBwDjIh4oeKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQferaiUOaFc7hyvNDO0JKBp7QvsprKZulcZLBPSjxg=;
 b=TR8ESLddb9IKS4XMp0A8kH2ZRghQoHT1LF+wX+oh8p1JYJNbchVLn3pQnSKU2XCsP1SrpzJIifpzcmt+MZta1/hMW82exJuXkGi+dpjGUErfqiV/Q/hSNlKod6/Yx/iuLBP8ZecktJlS62WfDJxpiOVSikymzlfSwPd4wU4Gm8tjDTczF7tMVZgAjFyZQolgnGyQAushrzE4TcU+3aa8ddebLyNgpG65oDd1XrEKDboRngekOa4VSk2IlSQ3t2rWXQC7KL0DojRLGcJp8g95lUSUcsXqPue6hhGGYyUaUZsBoE1V+cBjVu4o4EyIAoJQ5ITmBK0GmW7r0kI5N8bxCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQferaiUOaFc7hyvNDO0JKBp7QvsprKZulcZLBPSjxg=;
 b=NHRGpnGNSnhqb0Vi0449Zd52A9OT03KzXXZ/Jr3mo9DPYn6qw5PRd+h6Z9X31mqQ/+EDVHWfo0b7IHhBnIQqHKTCf42yhu/NVFwaxO+gsRix6iraEJMe+ntM4BUtDPUSu9cWYarUAZOkMe4Xalaw1yQJA1/xMFfv3YoWJ9qKaHU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB10945.eurprd08.prod.outlook.com (2603:10a6:102:46e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 15 Jul
 2024 11:18:30 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 11:18:30 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] oeqa/sdk: add out-of-tree kernel module
 building test
Thread-Topic: [OE-core] [PATCH] oeqa/sdk: add out-of-tree kernel module
 building test
Thread-Index: AQHa1IuEYGBXaEa+/0WUf7aRULf8VLH3myaAgAANJoA=
Date: Mon, 15 Jul 2024 11:18:30 +0000
Message-ID: <ADC09946-15C3-478B-A833-DDC3A595820F@arm.com>
References: <20240712184358.3103083-1-ross.burton@arm.com>
 <ZpT6c4hgYV6xIJsf@nuoska>
In-Reply-To: <ZpT6c4hgYV6xIJsf@nuoska>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB10945:EE_|DU2PEPF0001E9C4:EE_|DBBPR08MB10818:EE_
X-MS-Office365-Filtering-Correlation-Id: f5c8a653-fb60-46e0-4109-08dca4bfe010
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?bVQ0aG5raDE0SVUvaG9VNmY5NUxjOHlsNGd5RGt1aXNNN1BkT2JxQTFOaWda?=
 =?utf-8?B?L3RpK2xxY0h1WjYwTjF2Tzg0WHVPSCtZV0lxeXVndTVxcHNjeXFUMElVZXlU?=
 =?utf-8?B?ZmN6Y1JDS2xpZitJdnVIRnFZeGo0eUhwQjJJbHcwOUhEb2FTYk5SYXdtMkht?=
 =?utf-8?B?Tmh0UWVSM1RwRFpyblpoR1ovSUppTllIaXJTMG4vdGxUNmRZSlBQcGtHcklG?=
 =?utf-8?B?T3VaZGtiU200UUF2QjVRWDF2YzZLQWw4ODY0MzB1cmg1MytYYlFGekt1elVz?=
 =?utf-8?B?YXNFL2tOTWJ3RUY1MWZLZG55OTdQZFIwWEhXUjFNZ0FJa0tiS2xwSnJRTUx4?=
 =?utf-8?B?Q2RPb2EyUGpOVzIzNW5DUTRDK2FLSExsU3hzcGxmYWtIS1hzb3duUEdENHdr?=
 =?utf-8?B?ZFhFR0ZRSVQxbUtOMUM3cFd3SHZSdEZpanVJUyszZFlLOUtHeHN3UUtsRlE3?=
 =?utf-8?B?dWhUMEg0WTdxWlFMNjl2bHZaUEdJeWtNNHpSRDZQZmxCcERmNjQxZHgvM1ZG?=
 =?utf-8?B?SjdWVzRoN09uNy83dmRkRXBBZjdyYnZwUUVLYm11THZoUDhkRTRUYWJVQ0Z2?=
 =?utf-8?B?SmtpYm8wcWF5MXhwc2hXd1haVU1NQllJb1I4TUluZ3Z2UUlJaTV2bUovTXZp?=
 =?utf-8?B?eU5BeWZRRTJkWXY0SVBENjZKTk9ibE9NQXJBVzh3K20zNUVydnRkUDdHZjRS?=
 =?utf-8?B?dnZYVjJMK0pPYWxjZVhaNlRXMHJTNUtuazRMWEpmc3Ixc1NjakZIWUxVVkRE?=
 =?utf-8?B?REZWSVM0K0Jxa1RtVG14MVlwR0pwYkxIVzJTL3ZqWWJUbENlOW4zaHA3OUpS?=
 =?utf-8?B?aTd3Q0kvRzZvazYzQzgyWTVnN3JUd2pmeTZiQlRWMFRJQUswQUdPMVBSZU9o?=
 =?utf-8?B?TTQ2VXhUdGtlK1ZMNXNEZnlsKzc3QnN5UUFjRTZzVHc2SDM5eFNFVS9CN3hT?=
 =?utf-8?B?bmtrNzd3ZzVyek45THRSVTVuYUJtN3E1THVHdzZNeXhGUU9CNld2UWY2U3BP?=
 =?utf-8?B?YzNhNTBtVStmTGlXcGtqbGwzZzNCSGlEMS83cWlXT3RkY05PWWNxcTNJaVhI?=
 =?utf-8?B?bjlJYTZEUUtzanhXa2Z2blhMQklraTJMa1RXMWs2T3h4VkF3dS9nWXE3MDNr?=
 =?utf-8?B?R2pkQ3dDUGdrRzUycDlJTnhjRm5MNElXWmttQzJGejFGelV6UWhUVVQxeE52?=
 =?utf-8?B?bUxRSFc1QkF4V05iL3kwb09uZDFRczkvVDlPZnM4cnl3QWVjN2ZjOWIxSmZQ?=
 =?utf-8?B?d0JaYXE0NTZUK05PaHd5WEdBV1RET0xvUHIvYWJoeUFPbGQwaDhFNTZCd2la?=
 =?utf-8?B?bmNwOFJlTmVFUjFMU0lyajZnL1N2ZjhsWE05OE5EWVdGV2NhQW1BSm5DcHRk?=
 =?utf-8?B?UnY5dWhKWDJOS2FUUGVHQnZlYkQyNGkxMUJMazZ2MWx2NHpZOXVIWi93K3k3?=
 =?utf-8?B?TStUS3d2anllOHJuWXMxbU9McDYxY2FSeDkvTEtOTTFCY0lYNHhUMUhBS1RM?=
 =?utf-8?B?UG9MdGFmc0JKRDk2MzMra3Q4djh4blNPK2VCZkE3Sy9RQVpKWitCOFpHZGlJ?=
 =?utf-8?B?aS9qMW9jZ2RQaldDelB6YW1IVWg4MlAzWnR3akZid1lJUXJuS0lkR2JUTjdW?=
 =?utf-8?B?T1ZxMU1jc0dJOXJhUTFCVElzaThKK0xjMDUvN1Y3dGVaRjZFZmNZR0FPaG9v?=
 =?utf-8?B?em8zR3doeDgvQTVjQnZjb1grMndKQ2dMcWpRQlF4M29lOFJYZnNjSDJrUlUz?=
 =?utf-8?B?MXoyd3hNSE9NYUJqdENTWnJaRURsaGpXNFVWcEgvWXdyRzdjTTlNTVJMVGZi?=
 =?utf-8?Q?blL24/mxzBdFkq0NPO4Xk7u0zn3nQ7Ut7gCVo=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B77F549565AEAC40A7024C2C2DC1B62C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10945
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5edeb1be-41b6-46c9-79e9-08dca4bfdb13
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QVdFcFFIbnVWS1g5UnhLMWlJVi90NjlQMGVTRy9DSTJCM203VGxPdlpuNWVS?=
 =?utf-8?B?K1ZsNnBEdVNXRG9ia2hkalRFcGcraWsvMmJRVndzcW5oUGVTa2Q0VnFKdCtv?=
 =?utf-8?B?UXdaZll6M2tIYURjNTF3QncyeHJXbkU2Zmk0VTFMSHExTTZQazFPNUdmRGcv?=
 =?utf-8?B?c1YyTEVQM2N2dG81a1dMRXpyeFF2bEhXTXZISFQvT2NnUndibzRadDM2TFZN?=
 =?utf-8?B?SXJzK0FyMDJxbGhlQitPSkJJRzMyeGFYcytxazI5TG5WZ0w2SnIwNXBnV2dR?=
 =?utf-8?B?bWV4UmRKcnBBMjhiYWRZVHYxUTg2V1R5cFk0SjM0aEpvS0NQdHNEYUhqMUlX?=
 =?utf-8?B?UFY5N2ZrZERRWEsxRUkxNEFrdktXNEd2clJVYXFDL2JtWU5jM3lHMzUvc2pW?=
 =?utf-8?B?eHcxa2xwZEFZWFI5Rml0N1ByNGJmcjJMaC82QmNmRTBhOTg2d3YzQVBPYy9u?=
 =?utf-8?B?OU9JdUxEYWliWU5obmVSQjlXU3Zub1podFFuWWxwTDBWN2xDZFl6Q3lyQ1Rq?=
 =?utf-8?B?di80cjhxRXRyL2czUG5neFlCdG9RdTB2M3A1RFVhVlpKSURWc1RaaGVSdzdU?=
 =?utf-8?B?c1llWkRhWCtkYk5saVZXeDZRVXpSbVcwSi9qcG1PaUJXeCtLU05IOVVFZUNR?=
 =?utf-8?B?ajNabVRoU0NneVIzdEl1ZzErdDNlaGNXbTJ1UDkrT3NXQnJvMDFsSEVRRGpy?=
 =?utf-8?B?ZUYxdHkxcXhMWExtQnNvelg3VXFucnp2eFhWV0RMcndEWjFQZXlIYjExaHpE?=
 =?utf-8?B?NHAva0ZjZk5CNUZYQXcrREc2UHprVXVaT1grNzJ2Z2I2ck82V1NHSWZVZ3ZN?=
 =?utf-8?B?Q0dKZ1UwR010emJTVWVVd3JIdHF1M1o5ZGZnSXlHaTlUaUxSQ3ZIM05xTU8x?=
 =?utf-8?B?c2xPVlVaampzL0t3blNvYllOYk1tellGMVIreU0vSlQxZXhyWjE0amJkVklp?=
 =?utf-8?B?SXY3WUlXNVNJeitsS29ZOTlqVFM5MlEyS2JxRDRmZ3VqL1JOeFpZYVErNWE0?=
 =?utf-8?B?a3pUeGRsOWlVajZpMkNQSCtRL0hBd00wWXZISnBUbUVyMmxRUnBNNW9LbEtY?=
 =?utf-8?B?QVpOd0VYTkFINmord2hvMlVlZWtIbXcvOGlHMWdzLzcxUGFDNmpvTk9ac2lv?=
 =?utf-8?B?NkZ5ODRxLzNGYmdJMTl1UWo3UzVUeXdoVEw5bWZwcFFiV3dxelZHdGdwcGpW?=
 =?utf-8?B?THZQZ1VpQ21LSEpYNndqMitEQjZoM29GdjBmbEZJcjdNa3NSMHBSOXBIbGZx?=
 =?utf-8?B?SjlVNDlmeGpjVHVSRDVuTDVCb3NrVjcwcjU4TnVxSWthNVFMcDZjWHh0NDNM?=
 =?utf-8?B?ZzRMUE82Mkd2bDdKR2N3bG8rZUJZbVBtRjBVdG0zc1VrcHF2MG8ybE9IMlZD?=
 =?utf-8?B?ZmV4NWlSNG4rNkVWNTRGNHRzeHdiRzRzVDdiM3FCRTZiNVZ5Ym1yWHhQRlFy?=
 =?utf-8?B?NHhxcW02TEVkT1VBV0FhYjJEQzE3QUlCVGlQdE1Ma3hpaERpT2M0UVFZVUJl?=
 =?utf-8?B?KzBEY1JVOW1JY0JyWitBWWFWMWU0WFZ4UzI0VUg0ZWMxdHlSZjlsblJzYmNT?=
 =?utf-8?B?OGhwTEhTNC8xOFAzbldYN1d0U1IzTmFvbm12elM2T0pJckF1OTJKSVVRU2Ix?=
 =?utf-8?B?L08xM0loZWpnOFlzRWlyWjNsSGprWDJaclVpOWFpaFB6Z05RMXhOSk5lR3ZE?=
 =?utf-8?B?bXY1N04xd0NwdWRKNWMrb2F4RTE3ZnJVR0syK3NSNzErMGUrYVEzVFg1Myts?=
 =?utf-8?B?WHRZLytHVkZPMDk2ZXNqNlEzSWlka1NLcE81N0xIUENHZlR5dFNjK2tFZWwx?=
 =?utf-8?B?ZFNWNVdBbll0bjZBS2UxTFptWTJ3Z2h3L3VLSGMxSFZDQ3hNYzFzNmJUVUQw?=
 =?utf-8?B?VXllVjdaWlBydHdRL1NQY1ZUUlV0ZE5HRER3TmZpM05Nd0E9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(35042699022)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 11:18:38.4638
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5c8a653-fb60-46e0-4109-08dca4bfe010
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10818
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 11:18:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201912

T24gMTUgSnVsIDIwMjQsIGF0IDExOjMxLCBNaWtrbyBSYXBlbGkgPG1pa2tvLnJhcGVsaUBsaW5h
cm8ub3JnPiB3cm90ZToNCj4+ICsgICAgZGVmIHRlc3RfY3J5cHRvZGV2KHNlbGYpOg0KPj4gKyAg
ICAgICAgd2l0aCB0ZW1wZmlsZS5UZW1wb3JhcnlEaXJlY3RvcnkocHJlZml4PSJjcnlwdG9kZXYi
LCBkaXI9c2VsZi50Yy5zZGtfZGlyKSBhcyB0ZXN0ZGlyOg0KPj4gKyAgICAgICAgICAgIGdpdF91
cmwgPSAiaHR0cHM6Ly9naXRodWIuY29tL2NyeXB0b2Rldi1saW51eC9jcnlwdG9kZXYtbGludXgi
DQo+PiArICAgICAgICAgICAgIyBUaGlzIGlzIGEga25ub3duLWdvb2QgY29tbWl0IHBvc3QtMS4x
MyB0aGF0IGJ1aWxkcyB3aXRoIGtlcm5lbCA2LjcrDQo+PiArICAgICAgICAgICAgZ2l0X3NoYSA9
ICJiYjhiYzdjZjYwZDJjMGIwOTdjOGIzYjBlODA3ZjgwNWI1NzdhNTNmIg0KPj4gKw0KPj4gKyAg
ICAgICAgICAgIHNvdXJjZWRpciA9IG9zLnBhdGguam9pbih0ZXN0ZGlyLCAiY3J5cHRvZGV2LWxp
bnV4IikNCj4+ICsgICAgICAgICAgICBzdWJwcm9jZXNzLmNoZWNrX291dHB1dChbImdpdCIsICJj
bG9uZSIsIGdpdF91cmwsIHNvdXJjZWRpcl0sIHN0ZGVycj1zdWJwcm9jZXNzLlNURE9VVCkNCj4g
DQo+IElzIHRoZXJlIGFueSB3YXkgdG8gY2FjaGUgdGhpcywgZS5nLiB5b2N0byBidWlsZCBkb3du
bG9hZCBjYWNoZT8NCj4gDQo+IEFkZGluZyBJbnRlcm5ldCBkb3dubG9hZHMgdG8gdGVzdCBzdGVw
cyBpcyBhIGJhZCBkZXNpZ24gSU1PIHdoaWNoIGV2ZW50dWFsbHkNCj4gY2F1c2VzIGEgbG90IG9m
IGZhaWx1cmVzLg0KDQpZZWFoLCBJIGtub3cuICBDYWxsaW5nIGJhY2sgaW50byB0aGUgYml0YmFr
ZSBmZXRjaGVyIGlzIGFuIG9wdGlvbiBidXQgbm9uLXRyaXZpYWwgdG8gYmUgaG9uZXN0LiBJIGhv
cGUgdGhhdCBjcnlwdG9kZXYgd2lsbCBtYWtlIGEgbmV3IHJlbGVhc2UgYXQgc29tZSBwb2ludCBh
cyB0aGVpciBsYXN0IHJlbGVhc2UgZG9lc27igJl0IGFjdHVhbGx5IHdvcmsgd2l0aCBhbnl0aGlu
ZyB5b3XigJlkIGNvbnNpZGVyIGEgcmVjZW50IGtlcm5lbC4NCg0KQ2hhbmdpbmcgdGhlIGRvd25s
b2FkIGNvZGUgaW4gb2VxYSB0byBqdXN0IHVzZSB0aGUgZmV0Y2hlciBsb2dpYyB3b3VsZCBtYWtl
IHNlbnNlLCBJ4oCZbGwgcHV0IGl0IG9uIHRoZSBsaXN0IG9mIHRoaW5ncyB0byBkby4NCg0KUm9z
cw==

