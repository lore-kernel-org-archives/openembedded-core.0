Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 259FDC0219D
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 20:51:02 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.53])
 by mx.groups.io with SMTP id smtpd.web10.3817.1739220625359940033
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 12:50:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=pWmx8VJ0;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=pWmx8VJ0;
 spf=pass (domain: arm.com, ip: 40.107.22.53, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=GS/YPL/SrAwuzhbifCD2+N3eUp7RRYF5YLxpF9v5hNToZHJPI9E2Nxa39PTMOSk3vxECiNRerltH8uT57EdIaqzIhjETdTzKNh66C1ZclrCpHt46Tz/VbmexoTlALF+GPcjy9OKUCccn32PWHbpBPjzzX0U2XHnFCM+hSmjR4F8gpaVNA1KCGyvTcqxyahFCBDPuHm2OimRX5wUYnjbTOblggl2NXqbjqtMUvenVnc1+cSbR+re5rHtaoAomK6nozUsvcupa4Tyaf2+2ThVYSHVoP5YdNyCZhVhxEfsKQ/gVgAKFjnj8ecUOYHk5iK6HZjWVU2A9XUF9GZtkLzRYAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qq1UBE7r5E4Nc7CJpMd2b56wt850WvENQ+1BHqu64hA=;
 b=MvsgrXypGC8vzkPOnznGOjekw96Isp91s0cMQHErKjWJfJ9D+Vf08lJwX+PixPT69PneIX3z+OaoGsQzITcoFFNnkDOAjg9yQaN85vwrwKMTANesIgotQymvZfkj5c8Sao138PTT8YMRum9fIUuN8ELR/Z1TIMkF9Q9769VCIJxwTMrvGloJ6/FnL/XSn+eSFcJEpcTBeFtamzwYJuOkhcfMTSZwPSsg2vF4IVvWhZ5AT2b3oH0Z/+JMM+qAc8SAIs+wCa6aTj0sNadb+1MPMGOC5UGRQiOUfGiksQi+xcUuns0mp1/uWaBY4ssclCUBr5j/on5s4ot8F49JTlEvdw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qq1UBE7r5E4Nc7CJpMd2b56wt850WvENQ+1BHqu64hA=;
 b=pWmx8VJ0WO5kBSbJDuzk5D7M8XYX22NBfrigjZUlLO6e17INTMSzeuWlEaQci+QH48nk0FEIkvnJdzhVqIqIZ1MUMuzkLCa6OFvLjzzDhJVPGTnN2oIGmXZ3VOtsPzGe1GzkKKggcgBO7dwjbtArWofQpJO1BGge05wVi7f88mg=
Received: from PA7P264CA0253.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:371::9)
 by DBBPR08MB10772.eurprd08.prod.outlook.com (2603:10a6:10:53c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 20:50:20 +0000
Received: from AMS1EPF00000043.eurprd04.prod.outlook.com
 (2603:10a6:102:371:cafe::83) by PA7P264CA0253.outlook.office365.com
 (2603:10a6:102:371::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.31 via Frontend Transport; Mon,
 10 Feb 2025 20:50:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000043.mail.protection.outlook.com (10.167.16.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.10
 via Frontend Transport; Mon, 10 Feb 2025 20:50:20 +0000
Received: ("Tessian outbound 4fd325905615:v567"); Mon, 10 Feb 2025 20:50:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 31d684f550b4b27b
X-TessianGatewayMetadata: tPDEgp8/lYcVmBq/HKhRKxQMXYgMruSR7wf+J5eb2DKeYzZnTSeeU5RGnw7MsBfBTc+neoJsinjQu21zR7+rxDy8aJP4kqk1sgjtyoCvRxHF2lZDzhjU8aYZxES2K+iWgXmoKtLSIa7vvIStqJk1BHfdUlyGLPnlLUUt604yFTc=
X-CR-MTA-TID: 64aa7808
Received: from L0f652a7089b0.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F6881BEF-A41C-4402-A700-18B0A815C2B9.1;
	Mon, 10 Feb 2025 20:50:13 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L0f652a7089b0.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 10 Feb 2025 20:50:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZD1mydYlTmUWoog1FfcnZmqisLQcnYkzvGTIBsYhIvDsnc0IuG2/CtzlmnQxcZlzQQz/5PK+YFtp4vg0dHmnqHG0FJ7THUfY/lYRD5tRmhRYv3cY2cXTCwwIl25COUPZ/KGS79L37CPdb16ZJhYXM/KVBYhZb/ZfmWrqeWArkVErycsKEoEE6bo1FHcCN5lia07+uqYe0jbWpI2cUzl6wHCDKlwdcJWunX6lYdCWCXMlqtnASr6q3AnqWOTB1WyqiZLQX3r0e7W8RefdklUjB02IVMhznhV/guCrO0Wf0SKeBeRHq/knG6KJYc7ngw7EzkcnC2sP4yYOCGV39nxIIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qq1UBE7r5E4Nc7CJpMd2b56wt850WvENQ+1BHqu64hA=;
 b=y5opX+oWgoEpb56HGQL2CCDiTXPNdFa3I5DAa9eG3pF9dMxdEsNagqZBMivt+0DAUVCg1NKYaNYfXzjSHYKaRoVnQCdOA3bcZb6DHFInIkb2+1r84FRfZ5TIskfMYK4iqNmnF7wXd8VJTdvtzz5LyDEQ7Z2BFNaoqTmku8x/VTNaTsTeSwFtKzBHB+7hk4U9/N6Iz1s1jB5FfnYDcD6W1Ti9tIGmDBqE5931XceeSrBhD3YOMfg20TDYqXYvzRreI8OLnNMR4Lzx42OqILVoMoEtju2MdzKY2Vi2OjpwNHMowJdP05533NnYdmGJluAimLA4I1UfLo+4xKzkDZpgiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qq1UBE7r5E4Nc7CJpMd2b56wt850WvENQ+1BHqu64hA=;
 b=pWmx8VJ0WO5kBSbJDuzk5D7M8XYX22NBfrigjZUlLO6e17INTMSzeuWlEaQci+QH48nk0FEIkvnJdzhVqIqIZ1MUMuzkLCa6OFvLjzzDhJVPGTnN2oIGmXZ3VOtsPzGe1GzkKKggcgBO7dwjbtArWofQpJO1BGge05wVi7f88mg=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by GV1PR08MB8743.eurprd08.prod.outlook.com (2603:10a6:150:87::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 20:50:09 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe%6]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 20:50:09 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "rybczynska@gmail.com" <rybczynska@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Marta Rybczynska
	<marta.rybczynska@ygreky.com>
Subject: Re: [OE-core] [PATCH v3][OE-core 0/4] cve-check: allow feed selection
Thread-Topic: [OE-core] [PATCH v3][OE-core 0/4] cve-check: allow feed
 selection
Thread-Index: AQHbd9so7CD3FrTn1ECIY47mUgVfM7NBCvuA
Date: Mon, 10 Feb 2025 20:50:09 +0000
Message-ID: <D5B706C8-F7EF-42AF-97D1-30A876C70496@arm.com>
References: <20250205143439.38233-1-marta.rybczynska@ygreky.com>
In-Reply-To: <20250205143439.38233-1-marta.rybczynska@ygreky.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|GV1PR08MB8743:EE_|AMS1EPF00000043:EE_|DBBPR08MB10772:EE_
X-MS-Office365-Filtering-Correlation-Id: 18cf0615-8d00-4c34-4b2f-08dd4a148857
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?NGt6MTlCRDhVTDB1VWdQV0VWMWZHMHFmOFh6WjU3ODNKTEw1bHJ5NVpHTm5G?=
 =?utf-8?B?cmtZZnJtV1VVTFNjZzgvUC9TZ01sL20wUmYya1dMcVBiamVTNWt1ZTNkVm56?=
 =?utf-8?B?cFRpbEtnNVRndVQ4c25wVytEQjdKMUR1OXF6cXhHMVVGL2d3R0YyV1BVN0cr?=
 =?utf-8?B?d3Jwdy9LZkVxMTg3eGEvMlE4b1NtaGZUenhTWkhGOEFUUjV2b0FGam9WRkVu?=
 =?utf-8?B?dXJmbHMycTZGbmFKenlMUlBhTHZiNHkvMnBQVXowdFNrbEpEOU9VVjVxeVp4?=
 =?utf-8?B?Z21mcEQ2TGNqMTBYWjAzVFZueTg3cHFQYVZFbzVPN2M0WVNTa0RnRFhLV1M3?=
 =?utf-8?B?UzVzQ3NNUVYvSjJDaURKNWxQSnlPMzZvMjIvbld6cXZMWDdDa0dUczV2aUdp?=
 =?utf-8?B?SG5lOXF6bGRuN0JQZkZrTkpqLzZhbkt1cUV3WmNIZjVtZ2FvajdZRjZML2xy?=
 =?utf-8?B?SFFzUUFmSFgvRjY4TU5XK2x0dnRmTWMyL0ZESWhGQmJRSkM0dEVKWG01bXla?=
 =?utf-8?B?ekZJYm91OTFNT0QvUnlVZno0TkR1MFBHV3d4a0FLdDZWQlduOGlVMFRaWEl6?=
 =?utf-8?B?R1RUTUlBNk5maG1mN2cyZzYxYnRDWjlBMWNRQll1NkhpMHhPQXVUWDB3bnZG?=
 =?utf-8?B?QWxXanQxQzdvdHNCbXQ2bXVLcHczeXNieTVrNXQxdGVGT041cDVXRW9qTnFG?=
 =?utf-8?B?NmNrWm9uOWllSHNKS1dXdUJDVlpWa1FJY29mbFIxVERscTVoNnhXUS9CeVZq?=
 =?utf-8?B?ZjkvK3MwM1RjVnZnWlVGb0I5MUdxVDVBdjdnMmpnTTdqL1o1dXVHbWRKRTFu?=
 =?utf-8?B?QWl2Qk4wRktBQTRWZTcyT1FmOGRaTExMaGk0ZENic2FKaW5VaUNsYUNzLzl6?=
 =?utf-8?B?S0kvWUR4UUJpQXFld3RKYlllQVJnaWtLbTRxd1lvNWtFelZnMDVBRWhuVlpu?=
 =?utf-8?B?cXJyRml1alptWG0vcXhnQlVYSVpzWGVPaXNnYmZtR1U1T1ZGZzBOaWdXT3Jy?=
 =?utf-8?B?RHIvS256N1ZxMmZGVVFEeHFZc0FaNFlHS1BRVENpd0QwR0FiQ1ltZ3VWNFAx?=
 =?utf-8?B?a05BMS9ObUd2WXB4eFBJMHR2NVVLbDNhdFRxb0NBNkFFbVREZUNpSTcrVlhC?=
 =?utf-8?B?b3hjSG1vWE5MOERXWkEwWHNuVHJRUWhBRnhNK0pobldWcTkrYVpab2k4dnVr?=
 =?utf-8?B?akppYld3NjBnVjJma2JHWU5hS1c3ei9LTVd1TGJFWjJOSFUrTXA5NXNWYjNw?=
 =?utf-8?B?VWJNbk5jSFZYYVBieDQzVGJQd25SNzdCYUJCWHBWRkxBY0hjUWlBTTk2MmpZ?=
 =?utf-8?B?U0hQS2xaM0Q1VnBPZExZd0Z0V2Q1dXFtMW1yKzdBR2VJSVJ3dWRMVllVRmpn?=
 =?utf-8?B?MFVSOVlmSWR2VE5LZ3pOR3V1Z1podGdjc2VoVmI1UE1IbHZmQmFkTEJvUWJj?=
 =?utf-8?B?ZDZOVVZXcFg0RGl2QUhRZG45WENhRlJiZEJYS01sSk1rbzlQTVFZdWRaQ1Nu?=
 =?utf-8?B?b0xyNHcvcTJRcTd2NjF1UEZTY3d2MjVmOHdJYm5jRWxsYk5aRHQ5UERlK0tZ?=
 =?utf-8?B?TEcxblhVUlV4MTFDMmo0QWNRWmwwQ0FYUWhMbFMreXRkZXJJNjBnN1psdHRR?=
 =?utf-8?B?UzlnMDhoWUgvUVNwcThnMW4yS1lhamRPUVJSdTRJV3h6UklhSUsvbE5MVmdT?=
 =?utf-8?B?NHZiTW1iaDRuU3p1aHBDTXc3Z2d0Rk9EZ05NbGIyazJscVQ1N3RrazVXTmxr?=
 =?utf-8?B?dnRFSzZNY3FTSUlQRU5aYVB0dEo4bXpaelc5eEYrbGQzUEVDWThsUnpOaEZS?=
 =?utf-8?B?Z0wxOHh3b3A0a0JnSzdwbjBUWE9jclplQlVtNUhxYmJmNXlzRloyYUl2Zmpj?=
 =?utf-8?B?amtWTUx6L3g0S2dRci9RNnRxUTFxZHUwZTNUcE84THdsQTBiRGsvZzhuTFZN?=
 =?utf-8?Q?ZidC6Yj0GvecqxQC56uMUL8+NkBKUxPV?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5C4E19261BED0744B6F6F26389ACBDDC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8743
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:20b:4e1::9];domain=AS4PR08MB7429.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000043.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9675597b-64ae-489e-036b-08dd4a1481ee
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|1800799024|376014|82310400026|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M0NEZlc4ZmxZRWdFc1Nmb2NTbTlOK0FPZlpIZWdvVXppcXRZRTdyU09IMW1O?=
 =?utf-8?B?dnVuT3dtNFhObWZYdU5uTmJmR1ZWRnNjL3RHNHF2UFNyMUgrUVRFUjM4Wmpr?=
 =?utf-8?B?cnVDUkZ4cGZVUTBKY01VcHN3dDNaNlhjaVpHVFhPKy91K2ZYeFZxVFFPb2M4?=
 =?utf-8?B?SHQwZEFDVk9zQVdaa05EczNRakwyYytEM3EvQVdFL0RxMFRNbjc1ZUVrQWs3?=
 =?utf-8?B?WnFacmkrNitNUmNLb2lNR3Fwd1dZSWdTZHRiU2pVczgwV1lZL0pCeE9zU0du?=
 =?utf-8?B?a09wSDdvRG9yV2FJUjBNa3BWZWk3Ly8xMmRRS21HcHZjbThhSElpU0tXWEc2?=
 =?utf-8?B?MUZwNG14U3ZwY3FvUGlIMWVvUHdmbnVzZDEyYkZrSjQxTnY4SmYwM0JBNDJI?=
 =?utf-8?B?MUlrcUtLZmNwYjFhQ3hzVUJ0RVljMzQyQVMvajlqT0xSeEt6VXNjcVdBdnZJ?=
 =?utf-8?B?Smo5aXA0WURYUm4rOS80N2JwNkg2UUhrQ2VXRDVrUUpmU09rL0tLRGNuQkVJ?=
 =?utf-8?B?Mm5XOCtnbmQxZlU4MGRPZVJmcytWZVN6QmttY0FFeW9LYXdRUHg4VVEwS0Rz?=
 =?utf-8?B?clVnKy8rdFhpMXVEazZDSlAybTlGNUUvWGVESXlRaEJVcWZ3ak5vUmZ2R0pz?=
 =?utf-8?B?TU1MeUc5UXBMQ2RtOEVUUzBpcTYyR0NKaC9hS25hMWhKOTlmeXptMExVcjFE?=
 =?utf-8?B?aXdGZm4yUUhGNHFNRlozVG54M1FDU0k4bnlzU0J5dEFKLzNvdEg1SE9UTUYw?=
 =?utf-8?B?WGQxbjFkUVFrMnU2R0tQRTF0VEtGd0UvRjNVcUczLzlhUmNnL1RlWk4xRlQ5?=
 =?utf-8?B?RkZLNlRzWklPdWs2amQ5Y2lJWU9iYTRRUExVWS8wczlxOXdFZEc0ZmN4T1Vn?=
 =?utf-8?B?TzhQOEozNG96MldrSGZLSHRpajlsNThsN0IvcXBXeG05dCtxNk8yQkxHTVBp?=
 =?utf-8?B?ZXJaNnlJL0VmbElSa2xETTI0TUM2MmY3R0dCamNuYlRBWWNYQzVjK1F0OE82?=
 =?utf-8?B?UmpESXVrYlVPdEluWjAzT3M5ZkhpMXZJUzJod1ViYVBDcXFvSmlCUlJwUnlI?=
 =?utf-8?B?Tmx5ZTUzMVMvd3E0N0lnTVFqMktnSU84OTVBU1Qya09TWnhQaUtPbjU5djIw?=
 =?utf-8?B?akwrRUpsTmFoZEZFRjRmR1lHNVRuYTJBUElwTUlabU16cFQ5dEVXTzNPc1hU?=
 =?utf-8?B?RUJDTVk3VkR1UGtnaXYySWhzVk1EN0xSNTlwK05lTmc1aW5OR0JHTGJvMVVo?=
 =?utf-8?B?Y3NmRGo1dWU4NytJVDFJZFc5bklRWnRXd3d1SmFBSGV6N04weEZMYTdGYmxu?=
 =?utf-8?B?a1FnaDBSajFLdEluaUQ5L0g3TWFzV2x2eS94QVhZTnlacHpKS0RvRVlaL0Vw?=
 =?utf-8?B?RXNtVkxIUTZVTVhjYmpFUlJVaXNYOE5YV2c1bUJ0WHpyWTNxeTIvQWtSMXlD?=
 =?utf-8?B?TEd3c0VRSTlFRnZaM2ZzYUhoN2JwS0U0SXBjeXBycnVsSHdGS1BJR0VjcWU0?=
 =?utf-8?B?WFJ6WU9oeTFESnhzaFQ1azc4YzJvQWJuRWYxcDZmd1JVdlhBN0ZUK3FGWmhM?=
 =?utf-8?B?MGlxLzhaeU85VUtQck1ObE8rZjlJUjVJOURMaHJUL2VlZ1ZoYzFJOVFkekEr?=
 =?utf-8?B?RGdZd3A0MGNDWEJIU0x1VTNhTWFuYTJpaTJsWFBld1RGVnRDOWF6Q3dPSUE4?=
 =?utf-8?B?MktLVzk0QVNzdStWQW1ybXZEUU5WM1hDY2dVY0s5OVdRYjdIay9KQmoraG03?=
 =?utf-8?B?SFV3RjV1NDdvZ0V4ekIyL2gwd0pLOFZ5NGN6ckMxTGVzT2kyRWtPbkpJUWEr?=
 =?utf-8?B?bGFtbzJjNWpqa1V6Vm1YVnY1K1d0dlJvcjhUc3BMZmpySVRGejVDREtWMnBB?=
 =?utf-8?B?MDdzVEZyTmg3OVpod1ppNkgxNW92bzgvdDVMUnRncFFiY1ZzY3VYWUVPaEkr?=
 =?utf-8?B?Tkt1VEZVOU9rUng2VUFLcTNVTXR5SzZyclFHbThWVU54dXFYVzdGQUR2Ti9l?=
 =?utf-8?Q?JCDB3GuVTIaAcoluYvHGHmQ75P7TXw=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(376014)(82310400026)(35042699022)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 20:50:20.3077
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18cf0615-8d00-4c34-4b2f-08dd4a148857
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000043.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10772
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 20:51:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211118

T24gNSBGZWIgMjAyNSwgYXQgMTQ6MzQsIE1hcnRhIFJ5YmN6eW5za2EgdmlhIGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgPHJ5YmN6eW5za2E9Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiANCj4gVGhpcyBzZXJpZXMgaXMgYWxsb3dpbmcgY2hvaWNlIG9mIHRoZSBOVkQg
ZmVlZCB0byB1c2UsIHlvdSBjYW4NCj4gY29uZmlndXJlIHRoZW0gdXNpbmcgdGhlIE5WRF9EQl9W
RVJTSU9OIHZhcmlhYmxlIGluIGxvY2FsLmNvbmYNCj4gDQo+IEF2YWlsYWJsZSBmZWVkczoNCj4g
LSBOVkQyIChkZWZhdWx0KSAtIHRoZSBjdXJyZW50IE5WRCBBUEkgdjIgZmVlZA0KPiAtIE5WRDEg
LSB0aGUgb2xkIE5WRCBmZWVkIChkZXByZWNhdGVkLCBidXQgc3RpbGwgd29ya2luZykNCj4gLSBG
S0lFIC0gdGhlIE5WRCBmZWVkIHJlc3RvcmF0aW9uIGZyb20gRktJRS1DQUQNCg0KU29tZXRoaW5n
IGJyb2tlLiAgSWYgSSBwaWNrIEZLSUU6DQoNCiQgYml0YmFrZSBjb3JlLWltYWdlLXNhdG8gLS1y
dW5hbGwgY3ZlX2NoZWNrDQrigKYNCldBUk5JTkc6IGN2ZS11cGRhdGUtZGItbmF0aXZlLTEuMC1y
MCBkb19mZXRjaDogL3dvcmsvcm9zcy9idWlsZC90bXAvc3lzcm9vdHMvQ1ZFX0NIRUNLL3RlbXBf
bnZkY3ZlXzEuMS5kYg0KWyBJIGFkZGVkIHRoYXQgd2FybmluZyB0byBzaG93IHRoZSBwYXRoIHRo
YXQgaXQgaXMgdHJ5aW5nIHRvIHVzZSBdDQoNCkVSUk9SOiBjdmUtdXBkYXRlLWRiLW5hdGl2ZS0x
LjAtcjAgZG9fZmV0Y2g6IEVycm9yIGV4ZWN1dGluZyBhIHB5dGhvbiBmdW5jdGlvbiBpbiBleGVj
X2Z1bmNfcHl0aG9uKCkgYXV0b2dlbmVyYXRlZDoNCg0KVGhlIHN0YWNrIHRyYWNlIG9mIHB5dGhv
biBjYWxscyB0aGF0IHJlc3VsdGVkIGluIHRoaXMgZXhjZXB0aW9uL2ZhaWx1cmUgd2FzOg0KRmls
ZTogJ2V4ZWNfZnVuY19weXRob24oKSBhdXRvZ2VuZXJhdGVkJywgbGluZW5vOiAyLCBmdW5jdGlv
bjogPG1vZHVsZT4NCiAgICAgMDAwMToNCiAqKiogMDAwMjpkb19mZXRjaChkKQ0KICAgICAwMDAz
Og0KRmlsZTogJy9ob21lL3Jvc2J1cjAxL1lvY3RvL3Bva3kvbWV0YS9yZWNpcGVzLWNvcmUvbWV0
YS9jdmUtdXBkYXRlLWRiLW5hdGl2ZS5iYicsIGxpbmVubzogNzAsIGZ1bmN0aW9uOiBkb19mZXRj
aA0KICAgICAwMDY2OiAgICBiYi51dGlscy5ta2RpcmhpZXIoZGJfZGlyKQ0KICAgICAwMDY3OiAg
ICBpZiBvcy5wYXRoLmV4aXN0cyhkYl9maWxlKToNCiAgICAgMDA2ODogICAgICAgIHNodXRpbC5j
b3B5MihkYl9maWxlLCBkYl90bXBfZmlsZSkNCiAgICAgMDA2OToNCiAqKiogMDA3MDogICAgaWYg
dXBkYXRlX2RiX2ZpbGUoZGJfdG1wX2ZpbGUsIGQpID09IFRydWU6DQogICAgIDAwNzE6ICAgICAg
ICAjIFVwZGF0ZSBkb3dubG9hZGVkIGNvcnJlY3RseSwgY2FuIHN3YXAgZmlsZXMNCiAgICAgMDA3
MjogICAgICAgIHNodXRpbC5tb3ZlKGRiX3RtcF9maWxlLCBkYl9maWxlKQ0KICAgICAwMDczOiAg
ICBlbHNlOg0KICAgICAwMDc0OiAgICAgICAgIyBVcGRhdGUgZmFpbGVkLCBkbyBub3QgbW9kaWZ5
IHRoZSBkYXRhYmFzZQ0KRmlsZTogJy9ob21lL3Jvc2J1cjAxL1lvY3RvL3Bva3kvbWV0YS9yZWNp
cGVzLWNvcmUvbWV0YS9jdmUtdXBkYXRlLWRiLW5hdGl2ZS5iYicsIGxpbmVubzogMTUyLCBmdW5j
dGlvbjogdXBkYXRlX2RiX2ZpbGUNCiAgICAgMDE0ODogICAgaXNfbnZkID0gZC5nZXRWYXIoIk5W
RF9EQl9WRVJTSU9OIikgPT0gIk5WRDEiDQogICAgIDAxNDk6DQogICAgIDAxNTA6ICAgICMgQ29u
bmVjdCB0byBkYXRhYmFzZQ0KICAgICAwMTUxOiAgICBiYi53YXJuKGRiX3RtcF9maWxlKQ0KICoq
KiAwMTUyOiAgICBjb25uID0gc3FsaXRlMy5jb25uZWN0KGRiX3RtcF9maWxlKQ0KICAgICAwMTUz
OiAgICBpbml0aWFsaXplX2RiKGNvbm4pDQogICAgIDAxNTQ6DQogICAgIDAxNTU6ICAgIHdpdGgg
YmIucHJvZ3Jlc3MuUHJvZ3Jlc3NIYW5kbGVyKGQpIGFzIHBoLCBvcGVuKG9zLnBhdGguam9pbihk
LmdldFZhcigiVE1QRElSIiksICdjdmVfY2hlY2snKSwgJ2EnKSBhcyBjdmVfZjoNCiAgICAgMDE1
NjogICAgICAgIHRvdGFsX3llYXJzID0gZGF0ZS50b2RheSgpLnllYXIgKyAxIC0gWUVBUl9TVEFS
VA0KRXhjZXB0aW9uOiBzcWxpdGUzLk9wZXJhdGlvbmFsRXJyb3I6IHVuYWJsZSB0byBvcGVuIGRh
dGFiYXNlIGZpbGUNCg0KSeKAmW0gc3VycHJpc2VkIHRvIHNlZSB0aGF0IG1ldGEvY2xhc3Nlcy9j
dmUtY2hlY2suYmJjbGFzcyBoYXMgQ1ZFX0NIRUNLX0RCX0RJUiA/PSAiJHtTVEFHSU5HX0RJUn0v
Q1ZFX0NIRUNL4oCdLCBJ4oCZZCBoYXZlIHRob3VnaHQgdGhhdCB3b3VsZCBnbyBpbnRvIGEgZGlm
ZmVyZW50IGRpcmVjdG9yeS4gIEnigJltIGd1ZXNzaW5nIHRoZSBwcm9ibGVtIGlzIHRoYXQgdGhl
IGRpcmVjdG9yeSB3YXNu4oCZdCBjcmVhdGVkPw0KDQpSb3Nz

