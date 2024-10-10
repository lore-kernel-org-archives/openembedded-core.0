Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A396AD2444F
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 20:21:34 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.80])
 by mx.groups.io with SMTP id smtpd.web10.54514.1728591684762995824
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 13:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nJeRZTi5;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nJeRZTi5;
 spf=pass (domain: arm.com, ip: 40.107.247.80, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=HPiJ7QlFezcxc/abzFHKJQLXZJXJbG10BXdAwQ/jSvLLxlprTm2oWpbvaSY7l8k0kqx5FaHZeAjPfgqNRf36XmZw4yRiGpZ6Aqgz6sYsOivnebDWlrgIqDecovFFhNmIo8UafTOundSrWdQb661jDQg36AYDnSQ4IMi0sUFWN5HlXVtRnzgQzokrgaL7IkPTLLzXjPHyrliQy94XT6DQXum1o+3A1wJvHsj0/4/fmzIawSFEG946kCaIBmEwe1Rsrp8JxW3xDgm834x8EJZhBZ6/YyhKw4by1MSEcJr5yvGDOKZcxzy5/Vhzs0KZt8n6I3eA/97HfXcX2CRJmRhadA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JzGl8NFEIwPRMTHMKEbIYpiIGZdDkgHIkhnD1SO7Mgs=;
 b=O6nmnZszI7cSwYCAH2GtJ0YuGAc48sxkHUZ/ydye7TMSg/LsY/Fw04wwv8wx61bKYMQl5CgSx7UoYrLhA1UKILWSmi5zmE0bNXvZnPHuJdIw7ZBwT9mt1k/+9B+0ORuyXPR2dhg5AoG55uyy1nSBeWumOw/ru5jIYIZfzmLNi/OcdpQP5O9oDJFNn6xhoHB8pkK2VBIl7Z01nZh83/DIg8FicFIQu+ak0cWWNw/iX3B9+GGWbxHEKUML/3i/92drxg4E99L2V+5KC9JsotTDc8koQScnCCM4+ZqEDEzOp/mjYHL0S5pKpnCdVlxv0lTGa1OhQFdxJY575u4Vexcvew==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JzGl8NFEIwPRMTHMKEbIYpiIGZdDkgHIkhnD1SO7Mgs=;
 b=nJeRZTi5MJPxrmQZ4soWDfeBSaDAQNmxICrIaV0fzUZrRSKCdxDDDZE0AQGMpGiHPqJ9xcNoxzjylNNd1N2++yvEGZnVxiQb1TpZ4PVAyUQxlG46ArJjJGjSYsVdcv1xrhlPcBiZ/GnF898ygQrlEt1kD0Xbjg5XBcgATHv+mOo=
Received: from DB9PR06CA0030.eurprd06.prod.outlook.com (2603:10a6:10:1db::35)
 by PAVPR08MB9354.eurprd08.prod.outlook.com (2603:10a6:102:301::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Thu, 10 Oct
 2024 20:21:19 +0000
Received: from DB5PEPF00014B8F.eurprd02.prod.outlook.com
 (2603:10a6:10:1db:cafe::47) by DB9PR06CA0030.outlook.office365.com
 (2603:10a6:10:1db::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18 via Frontend
 Transport; Thu, 10 Oct 2024 20:21:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B8F.mail.protection.outlook.com (10.167.8.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8048.13
 via Frontend Transport; Thu, 10 Oct 2024 20:21:18 +0000
Received: ("Tessian outbound de6fe3af73ff:v473"); Thu, 10 Oct 2024 20:21:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 084d3e589f5f0978
X-TessianGatewayMetadata: e9i/3ZOYO/KCTtR3n4HQqv3f0V4TV2vGO0mbLvNJXiHZTWdpyqevLBjHukZDyDldt8A9q9KQImevEHVZfe0rtLkcO/LIi4hTUuuRNpWeQl59tX0+t3gcu2xdPN7wOYeskJb9UbGxM1rFU/b86dG69XQ90qDTrY5Qm0SQDEkZqIc=
X-CR-MTA-TID: 64aa7808
Received: from L978ecca58739.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F8A391CE-D302-499A-A3BA-51B6F11067F1.1;
	Thu, 10 Oct 2024 20:21:12 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L978ecca58739.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 10 Oct 2024 20:21:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hlxp/b1xLVttts947JyoA7d1KUzFRMXuhI1LMeDC8ZWjDhTaaPggQwdtrvzdq463EXbbS9I8eiisAWvEC38Ge3G6ZHYr1d/buYISe1ZsWsUQWepwkSlk4I1nnZ25It84L1tpA2X0deDxp0CaBSzP5wujLDhwkJ1PYeL1wtMimScPeGMzra6dVfzfBGmFt/AsiytKKXqcJ5H973hTktQ4Vk+1o8rLIvcmxS7c6GhGhx0VuphSHMvqyV8oQkjpXPXDO+nfVUxX/Wy0fYTU3XLFxIhtpxqrKX6hQkv/+u8klFsOc/pcoEQmNV7x691AYr+G2UkFigsmouRv1rwYvkUd6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JzGl8NFEIwPRMTHMKEbIYpiIGZdDkgHIkhnD1SO7Mgs=;
 b=KLV9zvWxTVu+k0X7lwEzNcN6sENF6vBFMW8e2bbiTsCst7SY0dxZHQGUXfohG/pBkeE25NLdirUzi7lhY0C+yK15xS1Vd/AjLeOPLrszFtEiGKyapnXioa1ECKAKQQZotF/MZRmbLHhO1M/VQHQ+wvsP0Vp8cuNwCPtY9Y+mYdiUKGNnwwuC0Y2ZLkuvlQzim+n5zzM5WwMYnHoH4ps0njRwPXhHPuuZOPklsCYLzlh+oxG8DGrlYrFqsSoGfgPHZX+HNcHQL08lv/DJ59LT3gIrWKHJq0dSFdfUyLxAzzr98LuIrP7ka6RcKzVYP5Yl0Uva6tBX4DS3P/LzMa+m7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JzGl8NFEIwPRMTHMKEbIYpiIGZdDkgHIkhnD1SO7Mgs=;
 b=nJeRZTi5MJPxrmQZ4soWDfeBSaDAQNmxICrIaV0fzUZrRSKCdxDDDZE0AQGMpGiHPqJ9xcNoxzjylNNd1N2++yvEGZnVxiQb1TpZ4PVAyUQxlG46ArJjJGjSYsVdcv1xrhlPcBiZ/GnF898ygQrlEt1kD0Xbjg5XBcgATHv+mOo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9553.eurprd08.prod.outlook.com (2603:10a6:102:314::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Thu, 10 Oct
 2024 20:21:11 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8048.013; Thu, 10 Oct 2024
 20:21:11 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
CC: ",openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v7 0/8] systemd uki support
Thread-Topic: [OE-core] [PATCH v7 0/8] systemd uki support
Thread-Index: AQHbGvJppLRDssKV5Eu4iShpnmhe7LKAbfIA
Date: Thu, 10 Oct 2024 20:21:11 +0000
Message-ID: <D33B3B0D-0404-4FE6-8E3D-0271585B57A0@arm.com>
References: <20241010085647.439990-1-mikko.rapeli@linaro.org>
In-Reply-To: <20241010085647.439990-1-mikko.rapeli@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB9553:EE_|DB5PEPF00014B8F:EE_|PAVPR08MB9354:EE_
X-MS-Office365-Filtering-Correlation-Id: 4167aa97-d42b-4bdc-c836-08dce969198e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?a01Hbzlickg4MkJtV3loNTVNQkMvbDlYS3NNS1RDODVhMmN0Z25WYm50UEJk?=
 =?utf-8?B?Rlo3K05jSFhTQjMvaTd1cHdLOStIMzRMYSs3ODQwZUhTeGlqN0ZRblpLZWMv?=
 =?utf-8?B?cFlVY2U1Zlh6NkdIQXl2OHBrKzlOQ0R3Q0JCN2I5Tjg2aFZDSjc2REVydGRB?=
 =?utf-8?B?bFNxSHoxeXhMbUZHRThMZUZ6bFRWL0wzYlJpODFyN2FRU1JMcmRjVGtkVHZW?=
 =?utf-8?B?ODFLWm1VcU00eTFPOHhwMXlGMHlWN1MxTlhsbEZDdTlnQmVucmdJcTY1Y0RD?=
 =?utf-8?B?ZFBHaDFmbUM0czVzSzJ0RU9CNW1VS2RsODJqQWN3MGx1R3VxLzYzcGhYUVZq?=
 =?utf-8?B?QTFreWUyclh4c3ZrcXk3RTdOZ3BVV1RZUjRkSVpYakQ1cGpKSFlZaGtKNWZ5?=
 =?utf-8?B?b0I4VXhCMzlSZUN5NngrcktMTTV1dWR0OW9EV1laamdmdHJYN0Z1WW9vaFNG?=
 =?utf-8?B?YmQ3V1Z4Y3hTbjZac3B2cndmeFFuTmRyNzNxVDRuQkJyNTVlRHJPMm5kWU1N?=
 =?utf-8?B?WVBzQllwN1ZvNVQ5VHBVNGR0YTBKN3ZmOEwwdTBGcmRRZW1TUDNvWnhDY24z?=
 =?utf-8?B?RmlCQ3Bid2MycWtJcnVINWlWcjB6d0NyTXA1SmFscmcyUyt1M1VxWU5CM2xT?=
 =?utf-8?B?cTBUNjFCc08yVEJxZGNlL2xlRm0vdmRGRGRMTXN1NXliSTF3LytQTXBSUzRD?=
 =?utf-8?B?WnpSL0JwTURoejYzOUx4UmxvRG5tbGdQcVowQ3F4M3puM3oxZzcrZ29JeDUx?=
 =?utf-8?B?aVZ6enBHMGRJbWYwbnVFZFE5TUhtUDVNVjlENDFYL0J4M3IvVUh5c0ttc0N4?=
 =?utf-8?B?ZHV6OTBhZkpocElKVGxiZjdKaGtpYStQWWNMN1FhVy9pNmJkR0t5M1UyVE9W?=
 =?utf-8?B?bzRPUUhSbGRRN0pZa2oyd2JzYnAwZFIxRHkzR2FENmZKSXAvdEJUQkJpK0Uw?=
 =?utf-8?B?WlRNaGt4NzNsNnZHT0hYSVFudVVLS3dLQW5laU1oajh2SG9RMWt3dStvM1Ax?=
 =?utf-8?B?aFhPRFduRC9SSWdKaXRScUZ3b0t3bFordm5OR2FzT3gwVGV1TlUraEloai9R?=
 =?utf-8?B?ZHFRUjBlcWxlWDRoMkpYUHkxMGRiL2l4RURiaHhTOVNRV3F1UGI4cjBWV0du?=
 =?utf-8?B?aUNEOVdxakpxOUVMNVhnbTlHcXQxcUZmWGRLZnBLcmRpL1VEV295Z0ZDaENF?=
 =?utf-8?B?VUNjeWdzZ1E5U0tTTm1mRjFlcXovbnRVbmpyL3RNN3NBbmh6VjJjSHhJbG5m?=
 =?utf-8?B?UkIyUGs3OWJCc3F3cnI4dUZ0eHBna3hNakYvSDlJWnlXTTcxaDdYY29IMzVD?=
 =?utf-8?B?NWtUemcwazlnN1J4TmVUSHVyeW82R0ptcDN3TDBrTitycFdzK1J6cU9UQy9u?=
 =?utf-8?B?dFJYeVFYZlg0WGJjRzhXc0F5Zlo4c2dVMzlyUzlKUWZWczBzNTExbml1Z294?=
 =?utf-8?B?a2NlZno4dGZ0TjdFWURMeG5xYnljVXpSVjBKTGZhRzUraEE0MTY4R2VTR3JB?=
 =?utf-8?B?Um50TFhSQW9CS1htMGJHZG5MR0FUaHM4U3BJYWMxTUplMmxxY3RHZWRxQVcv?=
 =?utf-8?B?SFUxdU0zZm8wT3RYSnNvTUhlbEpGNHFtR2EyNEVpbFZtak8rOFFNNnNkS3lt?=
 =?utf-8?B?c2RwZndrUDJ1MlNGOUZ1ak5vVkp6VXRVMTV0QW1GakdiYUVPOVB4VVl0dEZi?=
 =?utf-8?B?NnBVa2JRNWNtRU9YSWNQdTJHYlU2Ti9nNE5CcEFqUW52VUREa0lGWDZKakta?=
 =?utf-8?B?QTM3ckdEVlZ6cHRVaUN3QnBPUTA4NEFpRHRheHF1cUkwOHNzR3N2cStaT29E?=
 =?utf-8?B?VDFlQVFqUVU3VVo0RjUyUT09?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2693F8410082DD4380C8AC68575CA44D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9553
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	88a3102e-c254-4903-83f7-08dce96914e6
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|35042699022|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bHV3K2FML2tBNDFuSFA0V0d2V05Eam0ybU1XdDJMVWhBOHB2N0ZySjdpZXlH?=
 =?utf-8?B?dWZQNW9POXArMWJwT0FjQm4reUlTdzJJTUd4U2MwczJBMGZwMTJPendsVDZh?=
 =?utf-8?B?NXhUcU5XeS9BVXBodTByKy9ReEhoZHJPMzhzQ3h6UERsR0p5SE55VEhQSk9O?=
 =?utf-8?B?MVZRbXpYVVFDYW9NT3M1UkFKQVMyaGZleFpIZkJJMUdtUzY0ZjZMTk1Ob0Vs?=
 =?utf-8?B?c3ZpTUpHNmsxa2FUbCt6S05ZWCtCNjBUcVVmWXpueEhnakxBRm9laStHN1NN?=
 =?utf-8?B?MzNmSExDajdHMEs3QlMxUHphL1NOWTlpSUt4NVp1Q0RESW5BN21sbi80VjN0?=
 =?utf-8?B?SW5kcjdBK1p0bUZtTndoQnpqRHV2NkhNWU53VjhBc2VnbnNBUGtEd2pSM2sx?=
 =?utf-8?B?aTNDNmx2UGpGOW01L0ZkTmZpelo4MXk5dnk5Tzh0NzFyYS9qVGQvY0tjRXhY?=
 =?utf-8?B?anpaR2ozK1lmOUsyb2xUeEhJQ3VHVDZwaXFmbTY0Mm93OXM3MmEwMkRUTldh?=
 =?utf-8?B?TnBFL1Jra05ITUEyTW5WRURkZm1tbW9DUURFNVYwM29iWEZoOXVSK256aVNH?=
 =?utf-8?B?ZFFodmxHODRXQnVQZW4zVlB2eFJKa285a3Y4YlFyNnAyKy95bHM3L0xyNFV5?=
 =?utf-8?B?ampaTG5sWmVjNE9YWDRScERQaTNLOUFWRmdVL1g1L0VaWWlkVUVxbk0xWnFS?=
 =?utf-8?B?TWd2cm5nSU55WXZlSjZZZENsUzBUV3lZWHA3TTkwOEdkMFU0bU93a2Zvb1Rz?=
 =?utf-8?B?dTkyNWpDd01lRGk5NVRnOEl4YzdWS2g4YWxwWnd6eVBDUytJNUM2RWMwQ3hI?=
 =?utf-8?B?NElaTjYxdzlnYlUxeTE5RWgwSDVDVUp1WlV6TzdaWUlJdzVmS1NoV3dRYWVF?=
 =?utf-8?B?S0wxVFhZbHZKZFNlT2VwajhheFZHcHRDOUJyYnM3UkdvU3lBbENmaDRtRFJG?=
 =?utf-8?B?N21haXQ4eEpmcEVzelN1a0NBVWRsSVZaQURyVWxqbUZIUmNOVDREdzlHalJR?=
 =?utf-8?B?eUZlUFU0MWRndUwzRGZsSWdGTFhWNHF2VmtSYmh6aUVmalVzZXJ6MGZNYkNz?=
 =?utf-8?B?ZkZ1T3ptQitiemlwc3pmU1FEdVNzQTlsTFVnMm02Ym1MN3pZTXRQeHcyNFJU?=
 =?utf-8?B?NnVvUllOdHVqNVJhaHkyTGZac2JHc3hPRHRDNFk4bVFVOXNySE9wbmtqdDM4?=
 =?utf-8?B?UlVYWk9ZTkhBcjdkVVFnQk5DTkhJZ0Zkb2RnZlZHZHNBL0Z5R3Mxd3NLSWNx?=
 =?utf-8?B?RDd3aVZoRG9CdjhqN0w3ZjRXQ29Tb0cwVDhpb3JueFpzSjYvd25kNWFIWlZD?=
 =?utf-8?B?RHhUOTlJTXgzTEg2RmFIbi9DS0pOdHBzOWlEUkNDcmROdHlJbTZlYmxQNHdY?=
 =?utf-8?B?R2JWRk1nZGZrS0ozQ1ExSmF4NlVNSHZJUWl1MVFVbGNVWEF0d1pSZzMxaEhL?=
 =?utf-8?B?WjNJQlZNa3Y1ZnI0ZFZVZ2NUSW9DN0dDdm1FbC9ORHNoL3BsQVRCOUk0Nk85?=
 =?utf-8?B?bllaTjRKaGdjVHFJdUphNFYxM1hnRmlPZkcxYnNoK1p4RTB2RW5QdzJhdzNa?=
 =?utf-8?B?akNmcG5CMmdPbE0yM1JUSG1OWm5XRnJ6M0ZTb1J1YXJLdnZtZXg3QkhhTFhK?=
 =?utf-8?B?NW41dDA0MnJ5NFZiTnZxRWZPZWEvdmhVZWFVTzQ2WUsyWml2YlovUFcrZkR4?=
 =?utf-8?B?N2psQWVtMHV1OWx0VEZnM1FTVGtRR1luWFlTL3A1WXEvWU1wNUdvTUlIcWda?=
 =?utf-8?B?Yk9KQlI4Y3RQZVdjUVpyL0ZOanBtQ1kzdW5SQkJOUWROWlhTL2w1KyszMFN0?=
 =?utf-8?B?VjNENy93Q09UeHV6WkIxU2hwdWNHNHExUmVJV3N2Q0M3QXFQKy9YaS9aLzRY?=
 =?utf-8?Q?uhwC2N89yfCVg?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(35042699022)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 20:21:18.9393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4167aa97-d42b-4bdc-c836-08dce969198e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9354
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 20:21:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205645

T24gMTAgT2N0IDIwMjQsIGF0IDA5OjU2LCBNaWtrbyBSYXBlbGkgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPG1pa2tvLnJhcGVsaT1saW5hcm8ub3JnQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiBUZXN0ZWQgb24gcWVtdWFybTY0LXNlY3VyZWJvb3QgbWFjaGluZSBmcm9tIG1l
dGEtYXJtIHdpdGggY2hhbmdlcyB0bw0KPiBzdXBwb3J0IHNlY3VyZSBib290LiBTbGlnaHRseSBk
aWZmZXJlbnQgY29uZmlndXJhdGlvbiB0ZXN0ZWQgb24NCj4gbXVsdGlwbGUgYXJtNjQgU3lzdGVt
IFJlYWR5IGJvYXJkcyB3aXRoIFVFRkkgZmlybXdhcmUsIHJlYWwgYW5kIGZpcm13YXJlDQo+IGJh
c2VkIFRQTSBkZXZpY2VzLiBUZXN0ZWQgd2l0aCBvdm1mIGZpcm13YXJlIG9uIHg4Nl82NCB3aXRo
IHNlbGZ0ZXN0cyBidXQNCj4gd2l0aG91dCBzZWN1cmUgYm9vdCB3aGljaCBzZWVtcyB0byBiZSBo
YXJkZXIgdG8gc2V0dXAgaW4gb3ZtZi4NCg0KSSB0aG91Z2h0IEkgZm9sbG93ZWQgdGhlIGluc3Ry
dWN0aW9ucyB0byBlbmFibGUgZ2VuZXJpY2FybTY0IHdpdGggVUtJLCBpbmNsdWRpbmcgY2hhbmdp
bmcgdGhlIFdLUyBpbWFnZSwgYnV0IHdoZW4gc3lzdGVtZC1ib290IHBvcHMgdXAgaXRzIG1lbnUg
dGhlcmUgYXJlIHN0aWxsIHR3byBlbnRyaWVzOiBvbmUgcHJlc3VtYWJseSB0aGUgVUtJLCB0aGUg
b3RoZXIgZnJvbSBhbiBleHBsaWNpdCBsb2FkZXIuY29uZjoNCg0Kcm9vdEBnZW5lcmljYXJtNjQ6
fiMgZmluZCAvYm9vdC8gLXR5cGUgZg0KL2Jvb3QvRUZJL0JPT1QvYm9vdGFhNjQuZWZpDQovYm9v
dC9FRkkvTGludXgvdWtpLmVmaQ0KL2Jvb3QvSW1hZ2UNCi9ib290L2NvcmUtaW1hZ2UtaW5pdHJh
bWZzLWJvb3QtZ2VuZXJpY2FybTY0LmNwaW8uZ3oNCi9ib290L2xvYWRlci9lbnRyaWVzL2Jvb3Qu
Y29uZg0KL2Jvb3QvbG9hZGVyL2xvYWRlci5jb25mDQoNCknigJltIHN1cmUgSeKAmW0gZG9pbmcg
c29tZXRoaW5nIG9idmlvdXNseSB3cm9uZyAtIGFueSBpZGVhPw0KDQpSb3Nz

