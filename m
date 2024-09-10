Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71959EDE9A8
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 17:05:47 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.60])
 by mx.groups.io with SMTP id smtpd.web11.1690.1725987945261702193
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Sep 2024 10:05:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=KVh92fPe;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=KVh92fPe;
 spf=pass (domain: arm.com, ip: 40.107.22.60, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=LrS3+ZNLomjOK2vfFtQhPnZaPEBa2gqRzBI0GQJaj3AMrmc1mpoj0YLb2j6tVlCL3SwAO6Ag+NTucu6+7DYJOcNgH7HKc8Ul0fAmo8oPnh7yMSJOtBBO+PdpZi3t08jtPO0pEfKZIETywUYyZn47TEQpIpRLAqFzys3uGAzj96wVZcwvs2awHL2s1YxgMo0U1fcGgMnWD53DnaZgCRgvWsTRIkSgERKyxWKbJfW+rdljt9xQYRWslauNbMU0jr320t2aV6ubszV43dyRHmLgi+Y18WXcOhrUkWj74r54mkerreL5/KSRxDcHlCTT3GLdBscdTv7Ps/9oojQJC90JBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=usY84jv+jGpRa0hcNe+V5znHqbq7LQ6tXtwZPRz7sMA=;
 b=VHheBEqzsEjjqqhV1SCenPcrQwHusODDD9AyxVlMtBhsdeA5vmfOydec0VjDJ9Vv3EJQ6pGc1pOBv9vOrrWTLS0yBMSXgwC9znzcGom+uwxrKS9dvYlMS1VJZUN4B/0angQkTNJM3r0sXEs9srdWuVCw2t+zYxY2z8UZCA458t8+NMMxHJXAkc1/JQrTZ5rn9UMYTw5ma8hmYWIe2FRencFwQsUnz4IPxqONC0L8YGLK0Y2Zd5yKMyAJWkbDV+6xZ5ysx9kbIuEenBP1xkYHAI8wgNNsv6kPDU7q52lTOsWU5zfHIWDUPurrERDZJjQYmASxg6m2U9r++R1oYhlBWw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=usY84jv+jGpRa0hcNe+V5znHqbq7LQ6tXtwZPRz7sMA=;
 b=KVh92fPeRb/ExC59blSEaIE310QJFoqrUPf/40HhdMhFMNB+o0XDyAMuJBEM2ntzZYRmQlnHxFQOB+DOCbm8XRp7Q1de0beiRCvO+XtRJH9VQbRyAOP+WXgvpnvIWtlO3VlPgWmqhDVSpODXT87bejwjgp7FxQOicJXklXNcrUE=
Received: from AS9PR06CA0175.eurprd06.prod.outlook.com (2603:10a6:20b:45c::25)
 by AS2PR08MB9390.eurprd08.prod.outlook.com (2603:10a6:20b:596::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.16; Tue, 10 Sep
 2024 17:05:34 +0000
Received: from AM1PEPF000252DC.eurprd07.prod.outlook.com
 (2603:10a6:20b:45c:cafe::be) by AS9PR06CA0175.outlook.office365.com
 (2603:10a6:20b:45c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25 via Frontend
 Transport; Tue, 10 Sep 2024 17:05:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM1PEPF000252DC.mail.protection.outlook.com (10.167.16.54) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Tue, 10 Sep 2024 17:05:32 +0000
Received: ("Tessian outbound 76fca07d1c26:v441"); Tue, 10 Sep 2024 17:05:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cbd3c1cb5cee2a3d
X-CR-MTA-TID: 64aa7808
Received: from L08b3eded53ee.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id EEE7E58B-90B9-42FA-83CD-8541E2ADB83D.1;
	Tue, 10 Sep 2024 17:05:26 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L08b3eded53ee.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 10 Sep 2024 17:05:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iCLz6aqmyRpvfNizeXLu6c4dZWNkcvo+PaacIH+OlEHGkO/v4XriX+CWtNmlDjlRoubp/djBFvYowC1Kh8r9fULPX5tIUUUjQxfTLQ5GJILjdE4xCDnNvzSKi9lyxdIylEVE2DifpKoamHRTeVHSaYWKNOtI/Mlxm4/tzzt9ToJAlx9/gFgrRfr2/qVKiFA8tuW7tRSUitrgj6Vk+I2otEgPXh8FOCJnHbUFIsKGr26YiXnAxYfsVGFcYx5eQ0vaMi+A5XD5VGJhDAe0kyYZZJnXXfRCTuBxU7n5sHbfaRl61+9sgLaNioGb7UbXmwB3XKB0TSO1F0B61cda9QIruQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=usY84jv+jGpRa0hcNe+V5znHqbq7LQ6tXtwZPRz7sMA=;
 b=dD3ZozUBXgw+ARvLZCn9ojw38eGE1x8m4aCTU6WpUbRMiIOV7gnvohOvTv0xirGNgS4OXlrrWxy7jtQqvEUZa/eizod7XUccAxygfY6SCXb8WVJ8muZunM7oJm2ucjRNy3I0ztJRbFXNcdLNgYq8dpvZTlR8kyoEs4LVpXEVpC4zNmSWzU+WFpp+2IMdr2xC3q/kGKte4HTbKplRUbzeoM3hkRSvdMGOLEeE8SZbfArgF6rSKIXGVtJlmQFv77fUThpKNzXHeZvHrc0Y4IW5dtR3/j65OCFjMeil7rO8k7mrHjmyKPblcbeS0j+2C6CJ1j2pyyEMgGV71sfvHzCziA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=usY84jv+jGpRa0hcNe+V5znHqbq7LQ6tXtwZPRz7sMA=;
 b=KVh92fPeRb/ExC59blSEaIE310QJFoqrUPf/40HhdMhFMNB+o0XDyAMuJBEM2ntzZYRmQlnHxFQOB+DOCbm8XRp7Q1de0beiRCvO+XtRJH9VQbRyAOP+WXgvpnvIWtlO3VlPgWmqhDVSpODXT87bejwjgp7FxQOicJXklXNcrUE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB9594.eurprd08.prod.outlook.com (2603:10a6:20b:60a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 10 Sep
 2024 17:05:23 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.7962.014; Tue, 10 Sep 2024
 17:05:23 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Markus Volk <f_l_k@t-online.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH] gtk4: update 4.14.5 -> 4.16.0
Thread-Topic: [oe-core][PATCH] gtk4: update 4.14.5 -> 4.16.0
Thread-Index: AQHbAonfsmMnwYiFS0OOWSp4bw8VUbJRQh+A
Date: Tue, 10 Sep 2024 17:05:23 +0000
Message-ID: <2A003221-497E-487E-BF79-1BD16102A1F7@arm.com>
References: <20240909072859.1331936-1-f_l_k@t-online.de>
In-Reply-To: <20240909072859.1331936-1-f_l_k@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB9594:EE_|AM1PEPF000252DC:EE_|AS2PR08MB9390:EE_
X-MS-Office365-Filtering-Correlation-Id: 0146dade-8553-4cf6-1070-08dcd1bac7ed
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|4022899009|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?RFNiNVVFbWxDMUE2dlFIaVFseTB2Zlh6OEw0VVp5ajVUUm13cjFDRnFFUTd4?=
 =?utf-8?B?R0VqTlFNSHlRZlpxLzlaZ0p2L2hrUEo5eWd5eFV6SzBEQS9RMXVRODh2ekI5?=
 =?utf-8?B?QTlCUUlUU0N4TFlrdmZPUFhEczVSbW4yRVk0RlFKcDRhMzBDVVMxeUVlais2?=
 =?utf-8?B?ckMvS3AwK2w3aGgvZkdHbzdmZW5oRHJ5RjZvUFFyK1JpQVJtV1ZUZHNra1A2?=
 =?utf-8?B?M0pzYnV2RVlvYVpuMzRqZGROSGlBcXQ0ZURjdWs4T1ZLNTY2Tzc2Vmo5SUN5?=
 =?utf-8?B?SzRlMkh3NGVLYjFKZEJGNWZGcnV1TEEzMVZnMXgxY1VVYkhQN3JuZ0trbnBx?=
 =?utf-8?B?ejFHY2hhM1lMc05DdDFzanhLK21BeUxQUCs4bjY0UHF3c2NabjF6V2tVSHVN?=
 =?utf-8?B?ejlOU3kvdVBGdWxVOURzTi9MazJCeFpXZjR6RzNBZ2FKVkloR094U2dSWi95?=
 =?utf-8?B?VStMeFh1RENDeTJDNjR4aFFWL3pjZmVsWm91N1MzMXpoN3h1L0RCZjg2S3dy?=
 =?utf-8?B?UllibWFGVm10VWlwYS94bks2am1Fb3dnN1FPVEJmU1VXRXEwdWNZdVlZeEN6?=
 =?utf-8?B?bUNhV01OdVhHMXVTL2F4S1VVeFRwMGhvQ20yWGZ1VzNlcmxiRStFZU92ZkQ1?=
 =?utf-8?B?OC9QTlB4bnBHOVorN3d3ZWRyUGh1TmgzOXo2WWlQempoU3ZjUUM0bHFaeWdr?=
 =?utf-8?B?enp5OHhUa1NqbXRqMGl6V2FxOWIzT3o1MUNEcXk2WVk3N0RpN1V2MGl0U0Z4?=
 =?utf-8?B?VXFIdGlRd2RIQzkxa0JwTDFtbEZDeW81cGNsQm9QcmhXYXJOTDU0LzZkU0V4?=
 =?utf-8?B?dlNQQnlxNDFhYXhrZE1MZkg5VzlEcHo5QTJ2WmRhdlhxZkd3bDg3YzVFQlNj?=
 =?utf-8?B?eXRwTFQzcUFJZGRUdUVMekdQYkUydSthN1pwUE53K2ZlRXRhK1g0aFo5cktj?=
 =?utf-8?B?VWxINlJuTFkxbXh6UElYSk5LVmNtQmlUc1M0T254YjZ0RHp4cW5YYWxFU056?=
 =?utf-8?B?NFJDZkZpU0w2bUFSeWFIU2E1eTlSR3lid2NWb05BbE9FaFBmV2t2Z1RxdFRj?=
 =?utf-8?B?ZUwvYXVUQ2dkOGRRU0lYSUlnaFRrOWhEanM3L2FmK3V3V2I0RHZZMmtiMytq?=
 =?utf-8?B?NnJqc2V5dzZoMTJwN2JlbWlBNzBGNEc0OThRUGFkeEIwK2huaUJmaFdDdHhD?=
 =?utf-8?B?clEvd2FjY0MxaTBGa1h1UUlTeDZjTmdTaDVCaU5Jd1BSTmdvWFpIN21yOURH?=
 =?utf-8?B?Ukp0RVFhSWNtRTZ1RUg3N2h3TVE2YTRaVFZ1N3FkdHdhYnlGanEvR2xhNFV0?=
 =?utf-8?B?cnFRNmN6Y1FoLzd6eU9BN3N1VHYrczdnd1pZM0s5OVhyTERmWDg1ekMzSElS?=
 =?utf-8?B?blpJbEF6VHlQb2g3OHl3OTB6RnFMYjJlc0ZrZ1loeEM3aFNDdkU4NTd4anRi?=
 =?utf-8?B?VEdOMmJzWDBYcEZmczRiaGs0aGNiKzlSNDBJc3ZYTjZoYmNkeVFhemwvbGd6?=
 =?utf-8?B?VENiVlo3TjRoS0NYanVmdXVObnBKUlJGZlZSdzZRVXdRbEFsSWNuT0tUcmNh?=
 =?utf-8?B?SUh3NkJZdlpmZGlFbVZ3Y2NTZlM2eVRMZWFnQ0NTMGphSE1EREd6ZlBUUkhD?=
 =?utf-8?B?Y201WjlNYkcrR29FTDRSY21zTFp2RWVVY0xDTlhSVVEvK1pPY0tLNjJXeE1s?=
 =?utf-8?B?bExDakIvbVBQQndDWDNWbmJhb0dyaDVPdGRMbmx2Nk9PclI3TjdaN2d2di9R?=
 =?utf-8?B?RGlxOHdUc2h4SGhlQWMrSFk1aU5OMUcxbTNNZXVSa0ZsUDlQWnh1ckptT0Yz?=
 =?utf-8?Q?S3/mdZpJQDFHJ70elSycTt/iyQ9x5eV4Q9AyQ=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF3B2FC1D606C44C9B4D6A459AFB0674@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9594
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM1PEPF000252DC.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1d30c6e2-d99e-4a8a-0076-08dcd1bac260
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|1800799024|35042699022|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZkRRcDRWZk1qdzllQVY4RCtRandNRjZBMmdqT01Cd0oxcHNCOWIrZHovNnVT?=
 =?utf-8?B?M0gyclhUVnlCR0YxY1prRitZUUFFUjBTSDZmWnVTcGxCSW5TNkl5bWtRdDlS?=
 =?utf-8?B?REE2THE1OUtKODVSYW9zVXBocnBkQnlCV0RSSG84L0NnY1kySlpZZjJPbXZu?=
 =?utf-8?B?a1ZVR1F4cHpEcnc0eGlVYjRTWmF2Rk43UUxrUWNBOHhQRlR3NStvVlV3OERr?=
 =?utf-8?B?dnFzc3p6YXZWc1FmK0tRcDduVzhhbTJCZXJGazQrbTRTaTQyc1JhN2JkSWFJ?=
 =?utf-8?B?UGwzYnZiWG9GVm9jcFg4VkIzb200SzJudzlrRGxyVXBtR1hoK2c1Zk1KWUox?=
 =?utf-8?B?eVlLcDIvM0ZlYnlhVnNIdTJmSEErWVVFWGFEU3JxWWZ0WE8zS2w5elp2SC9I?=
 =?utf-8?B?dEdjK3ozTEMrTEdSbjVXc2VDUjJLY09UQ2RrMGdDNWNGNXo2UFhoOU5vN0dw?=
 =?utf-8?B?YzZlb2xUZURZNHVRTjM3RDl0RUtRTW1zOTlDTUZ4SHVEMkkvTy9RSlRDZ0hY?=
 =?utf-8?B?SDI5UFpvTGo2VWhYelZkdXpOSGdOSlpFSjk4akN2NEROallnVnMzRUZMU3A5?=
 =?utf-8?B?WGh1bW5LMXNYL3ViQVA3YVJxSUFieFNaZG8xamMxT1VzRW0yMUs3S1ZlNW5I?=
 =?utf-8?B?RFZhdHlBYS9NSXIxbVFLR29DendyeksxaGlWQU5RR2hFdU1DWGlkUllzSEVT?=
 =?utf-8?B?QmxlR3I2bTZXdG9DSGdENWMwaEZYVlhtZDJNUkJ2MnEwSElDNS81bTBtNE4z?=
 =?utf-8?B?TDZLNWp4cFVGYlNlNFo2bzh1UzdoZHl3ZUJZazFSWXU2SmFzT01WQWU0VERh?=
 =?utf-8?B?MFJCSzFyN1RJTXhmQk1pU29nTWZnMWwvaDYxbGFqYXgyd2xkeDBHQVU0bGxH?=
 =?utf-8?B?VFdWcy96WGRSN2RIOVZKalo3eE5RcTk0MjlVY3lRWnV5dzY1WDBGZk5KdFB2?=
 =?utf-8?B?cDc0c3NMbklncEpaVUFEM0dHOGJHOEJsdWtpR21pWFlKMlp3Y0szTXpxN0lI?=
 =?utf-8?B?Q1ZiRlBaWVRzL0l4WFZSMFk1MDNjM1hrNmtHWVVxZWg1ZW9vSm5Kbm9aenNn?=
 =?utf-8?B?cysrbHhhb2ZIV002V0VxOTJ2Y0IyK21iTHJnbWZIQnZzRWg4eFlIMDk4bXp4?=
 =?utf-8?B?eWxCNUdwb3lOOHdIT2VZMDQrNEZNVlg4S1FpWGs4M1RIbGt1RzU0TWRtVllE?=
 =?utf-8?B?SVkrbWJpOFBTVGlJVFdiYkZoNzhFb1Z6L1NKV2xuWHdjZ2hDZW5aUXA1clNZ?=
 =?utf-8?B?VElNb0lxTjJQMk41RGZORzR6WjFqUGxqeXNWWDY4NlVUT2diN3RqUWc1S1JG?=
 =?utf-8?B?cmNJeWlkVERVVklZUGlpeERuQXF3dUhmb1VEWFdXODlmZkZoTzJTa25XQ3lz?=
 =?utf-8?B?SWhjRmt3NHd6bldOTnA3QnFuY0tkLzhJNWlqWkdNaVh2RTAvZ3Z2WUl6TG5V?=
 =?utf-8?B?TmFZWkUwUnJldlpUazhRUE12VWpYWG1hQzNpS2tjbldjMWI3c21qUTd2bk9P?=
 =?utf-8?B?dWFCN3F5cWZ3Yi9kcTRPSlFneVIwaktpSWtxWkVoeDNTcklxQnczVHQxaEhj?=
 =?utf-8?B?MDFsak85UU5UdVhhZ29ScmNVTEo2SXBCVlBoMkw4VFVKQkZka1lTZE9IeEJt?=
 =?utf-8?B?YnFGQ2ptTHBCbDRxLzZ2RVdWNUlYVy9CS09IOW1Wa2txdHNNU2tmcFRqcmhm?=
 =?utf-8?B?Y0k5Q0Nvekt2S3pvM1B2elJpcDB3eFVIOFZnN1d0ZmxnM1ltR3cwdnNnc21p?=
 =?utf-8?B?bmNKbkMzQ1B0N2oyVzJFaWtkdmltbWhmSXRYSlhERnRMRXd6VWVXdUZWUlAv?=
 =?utf-8?B?OUVtbUdEMDQ4OVVrQkE3S1JMT1dQYTNRcXYyTDd0bkk1cWp3Ny90REJYQzJm?=
 =?utf-8?B?UUVyZVVoa3ZVOHVXVXRORmlHTldFaWpqUmxoOGQyaDhXSWc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(35042699022)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 17:05:32.7467
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0146dade-8553-4cf6-1070-08dcd1bac7ed
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DC.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9390
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 17:05:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204360

VGhpcyBpcyBhIG1ham9yIHVwZGF0ZSBzbyBpdOKAmXMgdG9vIGxhdGUgZm9yIHRoaXMgdG8gbGFu
ZCBpbiBtYXN0ZXIuDQoNCkNhbiB5b3UgY2hhbmdlIHRoZSByZWxlYXNlIG5vdGVzIGZyYWdtZW50
IHRvIGluY2x1ZGUgdGhlIG1ham9yIGNoYW5nZXMgaW4gdGhlIDQuMTUueCByZWxlYXNlcyBpbnN0
ZWFkIG9mIGp1c3QgdGhlIGxhc3QgZmV3IGZpeGVzIHRoYXQgd2VudCBpbnRvIHRoZSA0LjE2LjAg
cmVsZWFzZT8NCg0KUm9zcw0KDQo+IE9uIDkgU2VwIDIwMjQsIGF0IDA4OjI4LCBNYXJrdXMgVm9s
ayB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8Zl9sX2s9dC1vbmxpbmUuZGVAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiAtIEFkZCBweXRob24zLWRvY3V0aWxzLW5hdGl2
ZSB0byBwcm92aWRlIHJzdDJtYW4gYW5kIHJzdDJodG1sNQ0KPiAgT3RoZXJ3aXNlIGJ1aWxkIGZh
aWxzIGlmIGRvY3VtZW50YXRpb24gaXMgYnVpbHQNCj4gLSBSZW1vdmUgZHVwbGljYXRlIGdpLWRv
Y2dlbiBkZXBlbmRlbmN5LiBJdHMgYWxyZWFkeSBpbmNsdWRlZA0KPiAgYnkgZ2ktZG9jZ2VuLmJi
Y2xhc3MNCj4gDQo+IE5vdGU6IFRoaXMgcmVsZWFzZSBjaGFuZ2VzIHRoZSBkZWZhdWx0IEdTSyBy
ZW5kZXJlciB0byBiZSBWdWxrYW4sDQo+IG9uIFdheWxhbmQuIE90aGVyIHBsYXRmb3JtcyBzdGls
bCB1c2UgbmdsLiBUaGUgaW50ZW50IG9mIHRoaXMgY2hhbmdlDQo+IGlzIHRvIHVzZSB0aGUgYmVz
dCBhdmFpbGFibGUgcGxhdGZvcm0gQVBJcy4gWW91IGNhbiBzdGlsbCBvdmVycmlkZQ0KPiB0aGUg
cmVuZGVyZXIgY2hvaWNlIHVzaW5nIHRoZSBHU0tfUkVOREVSRVIgZW52aXJvbm1lbnQgdmFyaWFi
bGUuDQo+IA0KPiBXZSBiZWxpZXZlIHRoYXQgbW9zdCBvZiB0aGUgcHJvYmxlbXMgcmVwb3J0ZWQg
d2l0aCB0aGUgbmV3IHJlbmRlcmVycw0KPiBkdXJpbmcgdGhlIDQuMTMgYW5kIDQuMTUgZGV2ZWxv
cG1lbnQgY3ljbGVzIGhhdmUgYmVlbiBhZGRyZXNzZWQgYnkgbm93Lg0KPiANCj4gQnV0IHRoZSBu
ZXcgcmVuZGVyZXJzIGFuZCBkbWFidWYgc3VwcG9ydCBhcmUgdXNpbmcgZ3JhcGhpY3MgZHJpdmVy
cw0KPiBpbiBkaWZmZXJlbnQgd2F5cyB0aGFuIHRoZSBvbGQgZ2wgcmVuZGVyZXIsIGFuZCB0cmln
Z2VyIG5ldyBkcml2ZXIgYnVncy4NCj4gVGhlcmVmb3JlLCBpdCBpcyByZWNvbW1lbmRlZCB0byB1
c2UgdGhlIGxhdGVzdCBtZXNhIHJlbGVhc2UgKDI0LjIpDQo+IHdpdGggdGhlIG5ldyByZW5kZXJl
cnMuDQo+IA0KPiAqIEd0a1NjYWxlOg0KPiAtIEZpeCBwb3NpdGlvbmluZyBvZiBzY2FsZSB2YWx1
ZXMNCj4gDQo+ICogR3RrRW1vamlDaG9vc2VyOg0KPiAtIE1ha2UgQ29udHJvbC1jbGlja3Mgd29y
ayBmb3IgdGhlIHJlY2VudCBzZWN0aW9uDQo+IA0KPiAqIEd0a1BvcG92ZXI6DQo+IC0gTWFrZSBz
dXJlIGZvY3VzIGxhbmRzIG9uIHRoZSByaWdodCB3aWRnZXQgd2hlbiBjYXNjYWRpbmcNCj4gDQo+
ICogR3RrU3BpbkJ1dHRvbjoNCj4gLSBEaXNhYmxlIEVtb2ppIGlucHV0IGZvciBudW1lcmljIHNw
aW4gYnV0dG9ucw0KPiANCj4gKiBHdGtTaW5nbGVTZWxlY3Rpb246DQo+IC0gSW1wbGVtZW50IHVu
c2VsZWN0X2FsbA0KPiANCj4gKiBBY2Nzc2liaWxpdHk6DQo+IC0gRml4IHJvbGVzIGZvciByYWRp
byBidXR0b25zDQo+IC0gQ2hlY2sgaWYgQVRzIGFyZSBsaXN0ZW5pbmcgYmVmb3JlIGV4cG9ydGlu
ZyB0cmVlcw0KPiAtIEFkZCBhIGNoZWNrIGZvciBzYW5kYm94ZWQgYWNjZXNzaWJpbGl0eSBidXMN
Cj4gLSBGaXggaGFuZGxpbmcgb2YgdGhlIGVycm9yIG1lc3NhZ2UgcmVsYXRpb24NCj4gLSBUdXJu
IGNyaXRpY2FscyBpbnRvIGRlYnVnIG1lc3NhZ2VzDQo+IC0gU2V0IGV4cGFuZGVkIHN0YXRlcyBw
cm9wZXJseSBpbiBtZW51cw0KPiANCj4gKiBDU1M6DQo+IC0gRml4IGEgZmV3IGlzc3VlcyBvbiBi
aWdlbmRpYW4gc3lzdGVtcw0KPiAtIEF2b2lkIGEgY3Jhc2ggd2l0aCByZWxhdGl2ZSBjb2xvcnMN
Cj4gDQo+ICogR1NLOg0KPiAtIFVzZSB0aGUgcmlnaHQgR0wgY29udGV4dCB3aGVuIGV4cG9ydGlu
ZyB0ZXh0dXJlcw0KPiAtIERvbid0IGxldCBjb2xvcnMgaW5mbHVlbmNlIGRlcHRoIGRlY2lzaW9u
cw0KPiAtIEFsbG93IHVwbG9hZGluZyBvZiBtaXBtYXAgbGV2ZWxzIHdoZW4gdGlsaW5nIHRleHR1
cmVzDQo+IA0KPiAqIEdESzoNCj4gLSBVcGRhdGUga2V5c3ltcyBmcm9tIGxpYlgxMSAxLjguMTAN
Cj4gLSBJbXBsZW1lbnQgY3B1LXNpZGUgbWlwbWFwcGluZw0KPiAtIFVzZSBhIHRocmVhZCBwb29s
IGZvciBjb2xvciBjb252ZXJzaW9ucyBhbmQgbWlwbWFwcGluZw0KPiANCj4gKiBWdWxrYW46DQo+
IC0gRml4IGRyYWcgc3VyZmFjZSBvZmZzZXRzDQo+IA0KPiAqIFdheWxhbmQ6DQo+IC0gRml4IGEg
Y3Jhc2gNCj4gLSBBc3NvY2lhdGUgRUdMIHdpbmRvd3Mgd2l0aCBjb250ZXh0IGxhdGVyDQo+IA0K
PiAqIFgxMToNCj4gLSBGaXggaW5pdGlhbCBFR0wgY29udGV4dCBjcmVhdGlvbg0KPiAtIEZpeCBh
IHByb2JsZW0gd2l0aCBHTCBjb250ZXh0IGNyZWF0aW9uDQo+IA0KPiAqIEJyb2Fkd2F5Og0KPiAt
IEltcGxlbWVudCBjb21wdXRlX3NpemUgYW5kIHJlcXVlc3RfbGF5b3V0DQo+IA0KPiAqIE1hY09T
Og0KPiAtIFNldCB0cmFuc3BhcmVudCBiYWNrZ3JvaXVuZCBmb3IgdG9wbGV2ZWwgd2luZG93cw0K
PiANCj4gKiBXaW5kb3dzOg0KPiAtIEltcHJvdmUgZGVidWcgb3V0cHV0DQo+IC0gRGV0ZWN0IE1l
c2FzIGQzZDEyIGRyaXZlciBhbmQgcmVxdWVzdCBHREkgY29tcGF0DQo+IA0KPiAqIERlbW9zOg0K
PiAtIFNldCB3aW5kb3cgaWNvbnMgaW4gZGVtb3MNCj4gLSBBZGQgYSA2NGsgeCA2NGsgaW1hZ2Ug
dG8gdGhlIGltYWdlIHNjYWxpbmcgZGVtbw0KPiANCj4gKiBUcmFuc2xhdGlvbiB1cGRhdGVzDQo+
IEJlbGFydXNpYW4NCj4gQnJhemlsaWFuIFBvcnR1Z3Vlc2UNCj4gQ2F0YWxhbg0KPiBDemVjaA0K
PiBHYWxpY2lhbg0KPiBHZXJtYW4NCj4gSGVicmV3DQo+IEluZG9uZXNpYW4NCj4gS29yZWFuDQo+
IExpdGh1YW5pYW4NCj4gUGVyc2lhbg0KPiBQb2xpc2gNCj4gUG9ydHVndWVzZQ0KPiBTbG92ZW5p
YW4NCj4gU3BhbmlzaA0KPiBUdXJraXNoDQo+IFVrcmFpbmlhbg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogTWFya3VzIFZvbGsgPGZfbF9rQHQtb25saW5lLmRlPg0KPiAtLS0NCj4gbWV0YS9yZWNpcGVz
LWdub21lL2d0aysve2d0azRfNC4xNC41LmJiID0+IGd0azRfNC4xNi4wLmJifSB8IDYgKysrLS0t
DQo+IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IHJl
bmFtZSBtZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy97Z3RrNF80LjE0LjUuYmIgPT4gZ3RrNF80LjE2
LjAuYmJ9ICg5NiUpDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2d0aysv
Z3RrNF80LjE0LjUuYmIgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMTYuMC5iYg0K
PiBzaW1pbGFyaXR5IGluZGV4IDk2JQ0KPiByZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ25vbWUv
Z3RrKy9ndGs0XzQuMTQuNS5iYg0KPiByZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdub21lL2d0aysv
Z3RrNF80LjE2LjAuYmINCj4gaW5kZXggMGIzZDMzZjhlYi4uNjMzMWU4NmJmNSAxMDA2NDQNCj4g
LS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2d0aysvZ3RrNF80LjE0LjUuYmINCj4gKysrIGIvbWV0
YS9yZWNpcGVzLWdub21lL2d0aysvZ3RrNF80LjE2LjAuYmINCj4gQEAgLTExLDcgKzExLDYgQEAg
REVQRU5EUyA9ICIgXA0KPiAgICAgZnJpYmlkaSBcDQo+ICAgICBnZGstcGl4YnVmIFwNCj4gICAg
IGdkay1waXhidWYtbmF0aXZlIFwNCj4gLSAgICBnaS1kb2NnZW4gXA0KPiAgICAgZ2xpYi0yLjAg
XA0KPiAgICAgZ3JhcGhlbmUgXA0KPiAgICAgaGFyZmJ1enogXA0KPiBAQCAtMjIsNiArMjEsNyBA
QCBERVBFTkRTID0gIiBcDQo+ICAgICBsaWJyc3ZnIFwNCj4gICAgIGxpYnhrYmNvbW1vbiBcDQo+
ICAgICBwYW5nbyBcDQo+ICsgICAgcHl0aG9uMy1kb2N1dGlscy1uYXRpdmUgXA0KPiAgICAgdGlm
ZiBcDQo+ICINCj4gDQo+IEBAIC0zOCw3ICszOCw3IEBAIE1BSl9WRVIgPSAiJHtAb2UudXRpbHMu
dHJpbV92ZXJzaW9uKCIke1BWfSIsIDIpfSINCj4gVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAiZ3Rr
LSg/UDxwdmVyPlxkK1wuKFxkKlswMjQ2OF0pKyhcLlxkKykrKVwudGFyLnh6Ig0KPiANCj4gU1JD
X1VSSSA9ICJodHRwOi8vZnRwLmdub21lLm9yZy9wdWIvZ25vbWUvc291cmNlcy9ndGsvJHtNQUpf
VkVSfS9ndGstJHtQVn0udGFyLnh6Ig0KPiAtU1JDX1VSSVtzaGEyNTZzdW1dID0gIjU1NDdmMmI5
ZjAwNmIxMzM5OTNlMDcwYjg3YzE3ODA0ZTA1MWVmZGEzOTEzZmVhY2ExMTA4ZmEyYmU0MWUyNGQi
DQo+ICtTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGVmNTM4Nzc4YzgyYzA5ODcwYTZjYzMyNTE5NTA0
OWNhZWM1NTkzYzFjYTM3ZGY5MTVhN2I2YjEwZjU1MjRlYSINCj4gDQo+IFMgPSAiJHtXT1JLRElS
fS9ndGstJHtQVn0iDQo+IA0KPiBAQCAtNTYsNyArNTYsNyBAQCBHU0VUVElOR1NfUEFDS0FHRTpj
bGFzcy1uYXRpdmUgPSAiIg0KPiANCj4gQU5ZX09GX0RJU1RST19GRUFUVVJFUyA9ICIke0dUSzNE
SVNUUk9GRUFUVVJFU30iDQo+IFJFUVVJUkVEX0RJU1RST19GRUFUVVJFUyA9ICJvcGVuZ2wiDQo+
IC1HVEtET0NfTUVTT05fT1BUSU9OID0gImRvY3VtZW50YXRpb24iDQo+ICtHSURPQ0dFTl9NRVNP
Tl9PUFRJT04gPSAiZG9jdW1lbnRhdGlvbiINCj4gR0lSX01FU09OX0VOQUJMRV9GTEFHID0gJ2Vu
YWJsZWQnDQo+IEdJUl9NRVNPTl9ESVNBQkxFX0ZMQUcgPSAnZGlzYWJsZWQnDQo+IA0KPiAtLSAN
Cj4gMi40Ni4wDQo+IA0KPiANCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlv
dSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkg
T25saW5lICgjMjA0MzEzKTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVt
YmVkZGVkLWNvcmUvbWVzc2FnZS8yMDQzMTMNCj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xp
c3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTA4MzUwMzQyLzY4NzU4ODgNCj4gR3JvdXAgT3duZXI6
IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gVW5zdWJz
Y3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3Jl
L3Vuc3ViIFtyb3NzLmJ1cnRvbkBhcm0uY29tXQ0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0K
PiANCg0K

