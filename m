Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B0BBCDD1C9
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 16:02:55 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.75])
 by mx.groups.io with SMTP id smtpd.web10.72672.1727452968134321673
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Sep 2024 09:02:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Qw72nq0r;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Qw72nq0r;
 spf=pass (domain: arm.com, ip: 40.107.247.75, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NpQbE5p5x65dFWSbMvxGQLKrs3zMtJaJHGz6WR+BdvHA01urT5+kUFCobrwABJzKGv5yp/y0CWWXxteZ++98YAhdQZ9ASs+bQvJHzSOZclr70Lumf8+oxkZ2IolxuHpcGnwd6GeXK+CpITGVZ8RBUF5f2LyCU6ynZISpCP0YNCBBZ9eMWuY2rJBGY/qMqcA3rIVluyZ/ost57h1OURdRpD9tJYHLrZaB1KmQkExE0duBvGwnia2XE1B4CANXx55h/OMgbHYxy1LAf0g7awSrLn175fMhmBwiKF2fZs4mU8z9JadEgNvAkJqTzt9mwPI9tES7tJEh/uIsYOhcUZAsXA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmt0CKqgdGsin9eysZReWuP0pmcrn2I5cSKqL0al2UE=;
 b=FGiX8wR1vL+X10gw2cbeHy7ZwGOLjH96P+pVF6XEWtSqBdR7PsmwfQFmsImk+/fUhyXd1eZ7JUdul4ICLwjuiL2BQE88kl0XiMAt3Isht1zybO4CqyUUuA3knsvZ6XSjxnQYsjoVuAHuLIEjvH26pVjgxtJIM+qQ3y1edA5QouKYgyGaJqV+iVCwnUhHjjNTvopek7ql/OodRU6kFCdA6oDxYQ7uWHl8bUrli3DL2QHDcJp4NZNdzpJeYC/tW3NuOQfhx2NscenOxuMfK2se7OWNvhLRdbk2AI80liv31u6QAfKKZPXX5OX4eZ0KRWx7Tj60cBL/26fnl4wT2qqa9Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vmt0CKqgdGsin9eysZReWuP0pmcrn2I5cSKqL0al2UE=;
 b=Qw72nq0rx77eE4bGvXXt5t6JztjuLfdJCi4af1utiL2YhY7eY80fwPan7em8SEgI8C79qnq2l2Afb4xwt2Yv1rxAybjuK9QICh2fZQWqV81Hy9OmoVMgqFbToZsx+UTQMJfg+cMS83HARmezzETbtzBwe4M1WlJNpwn3nsvyyPk=
Received: from AM6P194CA0007.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::20)
 by AM7PR08MB5350.eurprd08.prod.outlook.com (2603:10a6:20b:101::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.9; Fri, 27 Sep
 2024 16:02:44 +0000
Received: from AMS0EPF000001B0.eurprd05.prod.outlook.com
 (2603:10a6:209:90:cafe::2f) by AM6P194CA0007.outlook.office365.com
 (2603:10a6:209:90::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22 via Frontend
 Transport; Fri, 27 Sep 2024 16:02:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B0.mail.protection.outlook.com (10.167.16.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Fri, 27 Sep 2024 16:02:44 +0000
Received: ("Tessian outbound 45432d802583:v465"); Fri, 27 Sep 2024 16:02:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f6cee088d0021465
X-TessianGatewayMetadata: WuOL+4rHFPgjdIbhcc2zhKSY8A/yIWhll+bnsUaeIY+QVrl7BX67kO/k437iAWyt0FR0iiTDtMe7bARTWEOdE7PEJ0FgCYpSRXu1cDLrLFEHXCj+HAZuz+6B27Lse56nyT4q5TJILD7tejIQq94Z4wcWYdnIgy7VmwT4oas+gkc=
X-CR-MTA-TID: 64aa7808
Received: from Lee623dc535ae.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DFEDBEA1-6BBB-4E98-8C18-7AEEA22316DB.1;
	Fri, 27 Sep 2024 16:02:37 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lee623dc535ae.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Sep 2024 16:02:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OuQV1IS7vdoEyIOnDbp7IW9jzAmPOgzc/GAQ1jREO3KKk9e1LDHDy2jxpfM/s/wa0eaI39dw5CoahWCIR1IWeO6MRFyEqbH62tf37BgCiH58xudMOKOTj3sF90V/NVDVCkgfhAkiZAObkDlg5F9lesta180xj9p9wXn6zMJL9kezhEP+3GOYuTYJxRD+nRIiU1/2JV1vymlhiV42M/weOxlZwDwf6mGrXuJ21VFKdPtcDPPJmYXsqA1/b07PQKc2vdlAxGIFzlzqpWq8AtwcgbYTsCPKGd53w3syqvFnjm2FxfTp5OKOyT9nJQrNhLOThgrpvCQfuDheXF6dYQ4UPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmt0CKqgdGsin9eysZReWuP0pmcrn2I5cSKqL0al2UE=;
 b=abN7XFbkDU+s1vkL0E5R0XLe3HDsTHQS89dbdCucbfwy6oxg6gOGOOLIxrvCFJ1SXHs2Ckh9M9KUQwcYtnYYApWFMTmkPgn0IKOlWW0nx+MP8lE69//QT3tiG3+Tjn/F5LvH3rTA23VpMNcfAN9BEh/ZyiYCkkKOYTiHPKA6WumWbeWIK31k8IixIg03Uwzll+IaluWyuywJZqDV7XUtTXy65pL0Ubc+0bWzpbkguQIYFW7fuauPo4VjO/1nhZ5C8cBrY4oXOOXzy3yks1ISbf+U2VYexZY7Kz4O37fn9Si18W8FfGIAz5F8KOHmmOWsUkzVjWuxROMUYApkFeQBrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vmt0CKqgdGsin9eysZReWuP0pmcrn2I5cSKqL0al2UE=;
 b=Qw72nq0rx77eE4bGvXXt5t6JztjuLfdJCi4af1utiL2YhY7eY80fwPan7em8SEgI8C79qnq2l2Afb4xwt2Yv1rxAybjuK9QICh2fZQWqV81Hy9OmoVMgqFbToZsx+UTQMJfg+cMS83HARmezzETbtzBwe4M1WlJNpwn3nsvyyPk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by FRZPR08MB10925.eurprd08.prod.outlook.com (2603:10a6:d10:13a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Fri, 27 Sep
 2024 16:02:36 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8026.005; Fri, 27 Sep 2024
 16:02:35 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "JPEWhacker@gmail.com" <JPEWhacker@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH 3/4] create-spdx-3.0: Upgrade to SPDX 3.0.1
Thread-Topic: [OE-core][PATCH 3/4] create-spdx-3.0: Upgrade to SPDX 3.0.1
Thread-Index: AQHbEPYjlz2edSGXIUaKyb7Zzrc3e7Jry1wA
Date: Fri, 27 Sep 2024 16:02:34 +0000
Message-ID: <979D8C4D-0437-49EB-A5EA-8FAD50B65488@arm.com>
References: <20240927155247.1012846-1-JPEWhacker@gmail.com>
 <20240927155247.1012846-4-JPEWhacker@gmail.com>
In-Reply-To: <20240927155247.1012846-4-JPEWhacker@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|FRZPR08MB10925:EE_|AMS0EPF000001B0:EE_|AM7PR08MB5350:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cc9858c-39ce-4965-e11c-08dcdf0dd2ce
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?aG56d20yV21PWXIzOE5aWnVDd1c0SWcvUC9QeSs0NE95Sk5hVnB2MkRZVVBs?=
 =?utf-8?B?QzlSKytNbWQzQWZxWXg4YU40cWtWZVJjZnlOcWFJL3BEMlRCU1poM2dKUG1M?=
 =?utf-8?B?S2Y1Q0tEZVhZbWZtUFI1NC81SFdSd1VDNmhYR1hudzNieE04K010aG0zOXda?=
 =?utf-8?B?RmRxVWE0SWVweTdxdGNuY3JxTURSMHV1SDlVcmFWRVF4RTV3WTZhc1FlUXls?=
 =?utf-8?B?NkJSSUdNVTBLK2I2RXAwcUpETytYd3gwVW1DZ01VbzRNOUJiMk92L0pLTk1z?=
 =?utf-8?B?Z3EvRVNHMDRHOFhjL2RsdmVGWEFjcmNBVGM1S3hhQ1hEUDJyOUtoakpPaFRW?=
 =?utf-8?B?WWxoaUN5M0dPbjBZdU9OQ2M3Qk45eThPNUs3NnpQb1RCN3pBMmplMlVyeEtu?=
 =?utf-8?B?alhqWE4ydmFpTGhiZTZGWHRweGRmdmpCd1dBU3cwa2xVZmxhRUwxTzRDL25n?=
 =?utf-8?B?RVpEem5aRk44YlZuay9NaGlvZklXMUVtdjVScW1JY1VKQkZZeEdDeEVqN0ti?=
 =?utf-8?B?MHFwbXh6aG1UazdTZndHOEZMNEtuSDVwa2RlYVR2UXNEYUlMWG16NDdnS3E0?=
 =?utf-8?B?Q3lkVnRacHJNR1pJYVhUTGQ2a3N2d1BxRnd6cjhYZlkyRTJ1eHY5ekI0NFJP?=
 =?utf-8?B?TUwrNW5TdS9CRFpTTnhhRmlZc3FOT2FRUnFqK0lKVlNmcTdlaHkxMmMrc0VN?=
 =?utf-8?B?Y2RrYVMvNHlISk5GdGNJVUN6eGxIdTRQMERPaGNQdmRZeThpZXN2bHA3YkJU?=
 =?utf-8?B?bGlIMFNKQXZnYWJCU2JkajlGM3J3R2NIMEhFOEtYSHVSTXd3M2NtMUFxdXdU?=
 =?utf-8?B?czFSTlR6QlNWdkRWdWxOdTZnbUhydVRMSDhuaFZWMkFlYmZMZ08xdjVuWUor?=
 =?utf-8?B?ckZnS2hrSnBSMWQ2aVJMWGRQTTdLeWdoano4QkQ0NjNwTXJKTHVwT0UzRGRZ?=
 =?utf-8?B?L21lYTRRTWYvS2FlcE52Q1VoUHJJTUpvN2pkWEx5Mlk4ZjlpMFB1bnkwZmdC?=
 =?utf-8?B?SjJTcUdzUndtbHNQc1ZQcnY3bWNDNHMwUUUveTNwWFpQV05tRGNGdG9QVWw5?=
 =?utf-8?B?UkpRSEZxYnY0dDlVZ3lxZzN5UzVWYVdJTzlzTWREWlJWSkUzMndxbEZjZkNj?=
 =?utf-8?B?bEtwZXpzV3RpM1NzdFFFQ2hiUG5JZjlueWFmWUZ5WnVXVEQxdDVpbTdDdmNC?=
 =?utf-8?B?ZWVGL3JSeFpJeHlsS01pb3ZQR09VL3VhSHZlK1ZYeG9zK2VPRlBhNFczMTFU?=
 =?utf-8?B?eTgzb0Z5WGRZMm5UTTh0Y2JuRlRkQk1OVDRVR0Q2WXIra0VCaU5mcURwa3o0?=
 =?utf-8?B?Y3NSeGp3Z1ROdDhEVFpwK2RsUnFiN3JNNUFzWDJzU1lTMVFHaUVCd2tHOVJS?=
 =?utf-8?B?dE1QbldSMnEvcDlobU1pZzFoZFRMdGxrVmF1N2Ruc2wxVzU1b2hqQ0t0VmZi?=
 =?utf-8?B?QTN4UVh2Sk5BWUFHQVJFMktuYjllbkxjSkE3alRZbW54T09HS1pKSXVFSklP?=
 =?utf-8?B?bTZFRlBiNXFSaW9RM1hpa1ovbzE0cnRMaC9uaW4yalAzR1BCV1oyQ2YxeFpa?=
 =?utf-8?B?ekV4bytvSkl3OExVbjJNSzI5SlVwU0pVcU56ZElOaFc1QVlqSktNS0Z6b1ZR?=
 =?utf-8?B?L2drNGROcnBGT2ZST3M4Wk41U2RZU1VCc2V4dndLTHIrQnBNYWw4YW9LYjNh?=
 =?utf-8?B?dHplRWlNc2NjUVhHSTI4dmZreVpwTEtuekhROTEvVkk3di9NMnJubnBOWFow?=
 =?utf-8?B?N0NvdzBCYjlQZUJVaGRrQVhCdzRINGlnWkZLL3dQUlhYc09qSVRaVllGV2Q3?=
 =?utf-8?B?ZmUweXFLWW5iV3FvV3ZkUT09?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B99E96FF31E68244A3DFD6030455B3D5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB10925
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001B0.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fbd8ce4e-0505-493e-8dc1-08dcdf0dcd31
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|35042699022|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bEVYc0NhRTYvTGtLS042N1pSdVBKMFBKVXZSNHFKNDlEUHYzU01xcXlrempw?=
 =?utf-8?B?cWRuOGhhMmJ2MjMwSDVGQk0wODRxV09LVkRxOTZTb3YyM0dzQzhjdC95bzhF?=
 =?utf-8?B?SjNJTkZaaEwwNWNUaXpiK2lBSXgraTBMNmJqb0RtWmQ3cFhKMTZhbHB0NEV3?=
 =?utf-8?B?UnVaQWxWd0VueTBNVFMzTkJTSzFTTDBqNW1QM1VEd3NwN3dUdnNCU1REMmtK?=
 =?utf-8?B?Z1pXVmxVNitLblNDdXY1MVQyQTUyMnoxazhGUEIrK2FiM1J0aDBxS3QzL0lr?=
 =?utf-8?B?Nm9NSHMxMzNxSEYwSDVkR1hVYXhTY1d4YzVBaGJTWlpPTXhKcnNHSmhCM0dW?=
 =?utf-8?B?Qmh6Vkh6c0RVV1ZmalYwZGI4WFJTTkRvT2VTOEUwKzEwdHV0Y2liU0IrY2Jh?=
 =?utf-8?B?ZzN2eC81UDRWT0VsMGdZcnR0QkdMdkhRR3NNYnN5by9Uc2RTWVR6UmNJQ3or?=
 =?utf-8?B?T3M5VWxUYlFUNlcrV2ZkMCtweWpoZm5KSDBvbmhFRFdybUVJdERCMFB5a0Vo?=
 =?utf-8?B?NDNEZHlrUDZWR0JCRVJ5Q3dVbGpNcktGYTdRbDlLSzBIYTQ4MzhXREtBUVFo?=
 =?utf-8?B?aUZMdHhYQkh4eHFYSXFEcnRSRUVMbVZNVTkxSEtFYklycFRva3lYZ3ErK1Ro?=
 =?utf-8?B?WU9lV1hqclVCY3pBb0x4MEp2cW1hSjY3bWM4L1BvT3BHd2ZwbmpTQ3ZKSDNX?=
 =?utf-8?B?SzNtRVVJNlE4UDd0VjBPT1huV01oUlJSZVc5bW5IMUxCVms3blBwVWJlNC9n?=
 =?utf-8?B?amh5TUlYMkhNOXlHM0xFd3FPRE1Bd3NVendLMXBQRSs3dGZXSXZQSWZDMVpj?=
 =?utf-8?B?VmhIdE93UGdscDJPendoR2ZEVWE1ZitZK3AwWTQvZnBtYVJTUDdnbUlKb2du?=
 =?utf-8?B?K1dOVjZlRW13TUZxRHZZV3F6dVpWOWNNRGY1eWtOU1FNYXVVYWdHVm1FMGhO?=
 =?utf-8?B?ekZubUw2NWtMWmVGbHhKMG5teFM4YklqU2xBZHZqbmFyZ0JLTjZqbndteEwx?=
 =?utf-8?B?NnQ1a0VLYXdzRXM2Y3hQb2tWdjVUVjE4RVpiWXpxbnJFVSt3U3BjWjVINEVa?=
 =?utf-8?B?SjE1T0Y0UWVacEVTRWdqS0FoekRBWTl4eGRpNmZINEdDbVc0WEp1MVBZQVRv?=
 =?utf-8?B?T0RiSDVnQUNYNW1xWjE0NC9zU2UvMTdJcmNDUEJEb0RrU0JUeDlSZnZEOGRH?=
 =?utf-8?B?MFZ6NTVLVTF0R1A1R25JL3F3aEhDcmFZdEppVUlzaVhISmVxUFlmNGZyd2hJ?=
 =?utf-8?B?L3V2dlVER0FCOGI1T3VORytZZnJuMUc0dGRXZTNvMzVBdGFQakY5TDNxN1g4?=
 =?utf-8?B?aUxwcDE1cWhESkV2Q2IxZjhCQTN2RUtaeGdUNGxEY2dhVDFCQ1NGSzg2NW9p?=
 =?utf-8?B?ZUlxQjNpOStrOHhGOFZqZHJIOW9XNVlZckUzOHpseGFTV3pveE5PaXVwQWpL?=
 =?utf-8?B?cUZGRnMwSzB5RCtxWXdwRUZ0TFdvVUF4NDg1dUhLK0ZWUUp4aEJyNndGK2o2?=
 =?utf-8?B?SzV3UmFGcFF2UkNQVHFCVmJUeEZHdE9VYUFIZjd5SXlKZklNaVVvWm01NTN2?=
 =?utf-8?B?Z3FicnVzdGE3V0gvSUFJT0JOUE1oUDUxQ0lVUVkxc2RrSDNhVmNPY005QTNQ?=
 =?utf-8?B?c0tRbSt2Y0RJTVBjWFY0NHJ1cHdQRGRBSGlpVWJYeEpKZ3JZNjRBdi9weUs0?=
 =?utf-8?B?a0E4KzRUYzdvSmZEdWk1Mis4eEtld3M4ekNqUCtFSlRzWWZWQUUzNExrRm5D?=
 =?utf-8?B?dUNOeUtnM3NxK0Nza2svVFVtSjZKNGZOYXpTYXBFdGZiLzRLZ0tkeE53R3NN?=
 =?utf-8?Q?PuzozqIrIBbbe9k63LoVT81b01GxUAy3Yw1Kw=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(35042699022)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 16:02:44.3641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cc9858c-39ce-4965-e11c-08dcdf0dd2ce
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5350
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 16:02:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205035

T24gMjcgU2VwIDIwMjQsIGF0IDE2OjUxLCBKb3NodWEgV2F0dCB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8SlBFV2hhY2tlcj1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3Jv
dGU6DQo+IA0KPiBVcGdyYWRlcyB0aGUgU1BEWCAzLjAgaW1wbGVtZW50YXRpb24gZnJvbSAzLjAu
MCAtPiAzLjAuMS4gVGhpcyB2ZXJzaW9uDQo+IGludHJvZHVjZWQgc29tZSBicmVha2luZyBjaGFu
Z2VzLiBFZmZlY3RpdmVseSwgMy4wLjAgd2FzIGEgcHJlLXJlbGVhc2UNCj4gdmVyc2lvbiB0aGF0
IHdlIGRvIG5vdCBuZWVkIHRvIHN1cHBvcnQgYW55IGxvbmdlci4NCg0KVGhpcyBzb3VuZHPigKYg
aW1wb3J0YW50Lg0KDQpTaG91bGQgd2UgcmFtIHRoaXMgaW50byBzdHloZWFkIGZvciB0aGUgNS4x
IHJlbGVhc2U/IFdvdWxkIHVwZ3JhZGluZyB0byAzLjAuMSBpbiBhIHN0eWhlYWQgcG9pbnQgcmVs
ZWFzZSBiZSByZWFzb25hYmxlIGlmIG5vdD8gT3Igc2hvdWxkIHRoaXMgc3RheSBpbiBtYXN0ZXIg
YW5kIG5vdCB0b3VjaCBzdHloZWFkPw0KDQpDaGVlcnMsDQpSb3Nz

