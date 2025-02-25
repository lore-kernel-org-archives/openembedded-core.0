Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2BC6C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 14:49:22 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.46])
 by mx.groups.io with SMTP id smtpd.web10.9546.1740494953958901583
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 06:49:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=CFlj7jYr;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=CFlj7jYr;
 spf=pass (domain: arm.com, ip: 52.101.66.46, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=mW3sg+W30V+LJ71Wce/Z6kY49erZYJoDOfCkbxRF6JFxRwti6spb2T9R7S5La3K+tt3HpLrU/2G4a8l/NWnTVvvsClGCC0uSgMvqif4H8evnJmhsu+reveJbptJinvOvZyj5O6lulRx4Y17JZHiMzMuHp+gxb7Sb5bpJthEUfzpWkRZ6f6mqRih3PhyyQgY0nPgIrbJw8kDTKD2gCmQktdg4jExebiXno6CY0+7UV+8HkdUrqEsqnoRPn++yD6AjoLvQDRtGF3rZt8BNZSLttfpC2COPU0eM82bF2SXXXrxh9hSfbf9PIBFww2dUOdcGh34AZO5homdgpzkrF+d0qg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8fUCRB5ONzdwG+BfABe7bgy35srTei0UsCa5qkqgsio=;
 b=Wl3JyDr9kvsro474VF8vDa1JZ2EnNotmdXNdNw2WIKcJhhtO/7oThBHLKRwtsRJia2h5U9bXCKXzFk7sTAZlAcYePqON3pZl1bbmLZTRC+gOkIz9PlkZ2HHqgRaedZ2ySbPtI+tARQ/7zpyO7kkQgjFb+BJaLV1wYasN9gzqO6SjQ29BRBnxBhkdILX5+KhsIdQaQGemcSVdnkd3d40TLXhbrWR7z1aWqXtF54JT6aiuIaL+pKmbH9vj/sTzJ43MnEj3FFykOax3TpHJOxfDTKh1o9pajJk9bBUJy6MDJooHg0NfNzBd0yD1orXf9eJOUQq0F1iP03Xsqgoj9WnWKA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fUCRB5ONzdwG+BfABe7bgy35srTei0UsCa5qkqgsio=;
 b=CFlj7jYrCWC+WVs3nO+AzJUTmWx9BajeyO/Zvmr6fLohxut3spgWJ+1J2rymoPdwR6rjTuj77tJY4pOa7EB//FaSheW/z9ViR8uGnwXvQ/aDwldsUb0PXpSftwb1yxxSy4vNhlQVOD///lKlwpytxpAnLCQOJQ4c/XnpisMLLys=
Received: from DU7P191CA0002.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::31)
 by AS4PR08MB7877.eurprd08.prod.outlook.com (2603:10a6:20b:51c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Tue, 25 Feb
 2025 14:49:09 +0000
Received: from DU2PEPF00028D00.eurprd03.prod.outlook.com
 (2603:10a6:10:54e:cafe::2f) by DU7P191CA0002.outlook.office365.com
 (2603:10a6:10:54e::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.21 via Frontend Transport; Tue,
 25 Feb 2025 14:49:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D00.mail.protection.outlook.com (10.167.242.184) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.16
 via Frontend Transport; Tue, 25 Feb 2025 14:49:08 +0000
Received: ("Tessian outbound 678e42ac23ee:v585"); Tue, 25 Feb 2025 14:49:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d4920fcca738d5d3
X-TessianGatewayMetadata: ceGq9RMaAEquR7Nm8/Kr3uLlx3xK2+glpc0YxCUCJciNEgyxfh0dZ21cunqYMt/R0kMvs/OyI+e7xPF5Qpg2BKEqE5VYs7VxKgrsZvgXtJAum5Z3Rpp2aZDQ3Hbhtw7CKZPLiYvfSnClTH01xkJDxRRJ2msn9LPxXflfxjKYQe0=
X-CR-MTA-TID: 64aa7808
Received: from L97ae7f717df6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 42D5F3F6-B31A-4E6D-89B2-88DF001579A0.1;
	Tue, 25 Feb 2025 14:49:01 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L97ae7f717df6.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 25 Feb 2025 14:49:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RkiG2O+lq94zRjXqRUz6RjK2bOYNwRqo/Fi6YZRGSp8M4LlpoGxlvYX1Qsx3eMfWvilFkewfdtpgRSaZv4HRhB3JapZZjvtwaeUFH8oXUbYTI6HmUiem9Ol44OwyPVUUMlgHsfkygUT15lsU2fJ5KxxEks/Kk6jgVLeNu0AMoIoKnaYh7/INB9LlfC4iO1Zr6zv0tYV8SbI0sDGMZAa4S0T5YIkcFRVflYdhAhKYHvyf4yuc5O5mgRXzlZXtD962Xk7T/Q9d/ZHnjVGK0ePzf2hsU/VQ+MlwCTuQOBIYw10+pl3wqJ4n7ldo5NScDiFcefnQpmXJhM4LCONKwZGBqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8fUCRB5ONzdwG+BfABe7bgy35srTei0UsCa5qkqgsio=;
 b=yHoEUQhjRBAf6sP8FNaPexW6tY+2hzKEBCkxbN0hlhnch6KEXRa+rqP3w/jESr5SAdq9yIQalMzO1KWc4Hc9UX9ucf+bJJUQDRwKsRfhuEy8lW7JnCZxI6nt4jBw/7CNCuW6mKEiBWl7gTIgNl8D4tRe7lV5v7FCmKq0DeJ5liTAR+qjaOqghZjZ779KDamr43hoCws8gLIFmz0XL9VFaS4cIR+He5SiECaH3mR7CV4Dgn639oPJ8/4qv3KvTjtdFYi7nMxIizbUge1oAwct6eXXPcoSYhc7J7AxHpo+V396BhIHBd4a+G1GL55PXWyfe9JGmKFRetRlXtzWSr8cUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fUCRB5ONzdwG+BfABe7bgy35srTei0UsCa5qkqgsio=;
 b=CFlj7jYrCWC+WVs3nO+AzJUTmWx9BajeyO/Zvmr6fLohxut3spgWJ+1J2rymoPdwR6rjTuj77tJY4pOa7EB//FaSheW/z9ViR8uGnwXvQ/aDwldsUb0PXpSftwb1yxxSy4vNhlQVOD///lKlwpytxpAnLCQOJQ4c/XnpisMLLys=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9576.eurprd08.prod.outlook.com (2603:10a6:20b:618::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 14:48:59 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8466.020; Tue, 25 Feb 2025
 14:48:59 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "uvv.mail@gmail.com" <uvv.mail@gmail.com>
CC: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>, Alex Kiernan
	<alex.kiernan@gmail.com>, Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: Re: [OE-core] [PATCH v6] systemd: Build the systemctl executable
Thread-Topic: [OE-core] [PATCH v6] systemd: Build the systemctl executable
Thread-Index: AQHbgrqX2sHRWL+ZiUmJxjuf9Qa01rNQPCMAgAAdbuKAAALZAIAHxuEA
Date: Tue, 25 Feb 2025 14:48:58 +0000
Message-ID: <A5978220-EBAF-4C51-8587-76498A346624@arm.com>
References: <20250219103908.42513-1-uvv.mail@gmail.com>
 <71BF1160-E808-4212-B790-5462F95BFBA4@arm.com>
 <1825F47182B39BA0.23135@lists.openembedded.org>
 <ae46ffa2-b88d-4ec5-822a-08c00e2baa46@gmail.com>
 <CAO5Uq5SCkF9n9ngCvcNSkHLNSPQpKxwXv+o+OfLP+VkMeq3TQA@mail.gmail.com>
In-Reply-To: 
 <CAO5Uq5SCkF9n9ngCvcNSkHLNSPQpKxwXv+o+OfLP+VkMeq3TQA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9576:EE_|DU2PEPF00028D00:EE_|AS4PR08MB7877:EE_
X-MS-Office365-Filtering-Correlation-Id: 867e12d0-4f5a-40e1-e81e-08dd55ab8ed2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?TWlQOHJCOG9EUWNKSnFzVUdHWmliSG1wbzBVSjRqSGZOeHNBbDk3N01uZFg3?=
 =?utf-8?B?bXpiQnJkb1BLUmovbGVLVnkrOWd0QjdJSU5nOEF4T3kyRENvRmpJVjYzTWx4?=
 =?utf-8?B?M0c0Szd6WVdMdkN5SHV0ZVJKb1h4UjhBcVBCa2tJMERXSlNDejVnWHZwY2hY?=
 =?utf-8?B?RmJZVzUra0VkM05kOEJNZi9iT0Z5WTR1Rm1oQWF5MkdYMnR2elZWRlowTk5n?=
 =?utf-8?B?Mk1MWElXeWlOZjZxbVphMndlQnFJTHN0ZUpLZGh5eUFCdVF2WTNKbGVqeVBU?=
 =?utf-8?B?QktEemZQVExtcWU1K2NOemU0azlWd1pVcU51OXZUS3dBMlhZSnNuN2MvUDhx?=
 =?utf-8?B?a1NGdHhFckdQWmtqWlZZQmpqUUZ5QjRTalA1ek9HQS9tRFA1REhIeUNVLzFy?=
 =?utf-8?B?QW1MYjN6ZjFSKzk0VTZlbjVITDBpdDliYlRLenN5UElJc2FNNGpENkdUU09u?=
 =?utf-8?B?U3BTWlVTS29RYVd2ZWNkK2J2N2FLVGp5aWpkSFNCclhNcHNlOEVLb3JNUGhl?=
 =?utf-8?B?a0IvOXpuRjlXVjBKU0orWExLekNUZ2ljWmUweTloQW9JcStzZ25PSmJIaHZF?=
 =?utf-8?B?T0VYVnZMd2cwYTBscC9NdVJ1YjVWTkp5bVRrWHl3RkkzNHhGdFYxbnNuS280?=
 =?utf-8?B?LzJLcFpYcTRjS1RVSVByZkJCTUx4eVdYNE5IRkxXU1J1SlorSSs1UkhyaURD?=
 =?utf-8?B?ZUFQb1ZVVFdNTTNLeVljeWt0S3ptbTR0OGY2ZE85NFhXVDh1OWtJZWh4Q3dv?=
 =?utf-8?B?UFQ2MUpNejNacmpOazhBOWZFN2VtRy9xNFM1N0RlejBiZXFsRjRTOCtCSHlD?=
 =?utf-8?B?dU5hL0doUlVJNHY0dTdSYzRFTTJJc21sK1lDSVJIeEltSEpjVmMvZE5ldXo3?=
 =?utf-8?B?VUlFclZtT2xTZldKS1JZMnJkQlowQnNHdnBaYzhFejhSeGw1R0ErL2h4SURC?=
 =?utf-8?B?dlQrYitLdnZ5a25HNVlNS0hjdUh6WGwxWlVKQ3FLQmh5clJoRDE4UGJ4MlhM?=
 =?utf-8?B?by9YQWppanlWaWhibHo5aDJoaUlqYkFpYlQzeDlmMVBFRFpuRVlaR2xwdjJv?=
 =?utf-8?B?d1h5cE0yWVNWV21MUDNDdWVNN0xPU0lzQmhrUmRTWmp2endHLzltSVJzdzlo?=
 =?utf-8?B?ZmJWUG1ITGFWT3lCVHpobHBLdm9uaGpwdkFhUlBVV0tXODAyZmF5TkIrQ2lF?=
 =?utf-8?B?NENtVUc1S256d3l1a1lDaEQyZzRKR1VlZlE2eWMvUTg2Z2FUdDZ6ZjR3Z2pQ?=
 =?utf-8?B?a3Uvc256bGVmS3p1dldqc1NjQ0VoU013R3k2aXZJUEdBL3BtUlBDdVhpdDFh?=
 =?utf-8?B?VkltNkVQOFlIcWUwL3ZIazIzT2ZnS1FWZFJaeDgxNXh3cU41YlFPWjA5ai9Z?=
 =?utf-8?B?UWdHc2dHamdSV2p3aXNuTFZ6RWQ5cSt6ZTd6MUxjQjdKeS9kTk1hQjBmUlg4?=
 =?utf-8?B?dVNuUXVIc21LZytNUXI5Nld3aU5YbjVlNFJFY3pKNlRLaytnTG9PRHhOT1Vq?=
 =?utf-8?B?MW5hMHc3dGY2K09sUG5oNWVQOThDUk82NGd2MmdWMEZETXhkU0dVYXlMaEhV?=
 =?utf-8?B?S3hCKzREM2VSQzloUDQ2NWdjcjgwazV1WnZyVmxFRVEwbFVMVUhnS0hwZm5z?=
 =?utf-8?B?WlV3VjhYMjQ2RXFKZkg3dzlGMTVDNUNnSHcyOFlmVWE0S0ZrUWVRNzlGTFBu?=
 =?utf-8?B?SVhiL3p5Sjc1K1pmRzBPQWhWbUtWUnViNS9ZR0YxMWZUUldVM0U5eCs4RFk2?=
 =?utf-8?B?RzlFNG5yWXlBeWZWalJUZUVpZ1pJOFdZS200RlVlT1FjaHI4ZDJ0WFFNZW8v?=
 =?utf-8?B?bUFncjR5WEJWVEFXQmdWcXZpWEFMdmtjTmN4dmkwMEVtOVkvOHRVQkZkRkRx?=
 =?utf-8?B?SzZOT3pRMDVFM2pzdnBmc1YzUGIrUkE0Z3lKTDFoSHMza1E9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <583671141D1C364294B060D6F36A08BF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9576
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	45680c31-0d21-4d8d-2aee-08dd55ab896d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|82310400026|376014|36860700013|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eVlnemE0YWl6THlGOFE3OXZRdktZVldqNUwya1g5MXhOZVk0ODhud2RXWnNI?=
 =?utf-8?B?dW5oNzliOHV5a3I4N1pBRklqKzVVL0Y5ZmNWOTUrM3NpKytid2NTMStqQnJ6?=
 =?utf-8?B?VERxa3BFZ2ZQdWJWbkNXMzFUcWp6T2FXYk5BY2g3ZWhUZUQyUkwwOHNKb2NF?=
 =?utf-8?B?WFFYL05MYU5HZWRuN0ZXaGtjRURHZWRHK3lpSStDZmlJR3JQeEYrMytJUXNM?=
 =?utf-8?B?bVhDM1lYVzZNck1DU2JuMFl4TGxLTUFWY01mQTczU3VwZzlIUU83dEFCV05j?=
 =?utf-8?B?L1NLSGZScXFYTDFoeWd1VVBaOHoyaExSQXR1WWlaWTllSDRyQzVQbnc3dkw5?=
 =?utf-8?B?Rzd6ZlVOdE9OSEZTVFhPMW05OW9KQ1dna0NFV2NVS01rRERkL21DME1wTHVm?=
 =?utf-8?B?d3FZYzlIbXI1TmVuTURpbXR6WU1iVG12VXo3S1VpMFBETGxQLzF5VjlGOHNZ?=
 =?utf-8?B?Y0xuTk0rbWhySHpvZEF4c1U3ZE56eHF4RnhpZ3BtSU53UUprNXpsZXVLNm5C?=
 =?utf-8?B?Rklua0FvNjVxaE9WS1NsbzdUd0VEbXB0VlhMM1VTejczNjFyUng0V0tSN0xy?=
 =?utf-8?B?NHZaaWsxMmxNQzIwNENmVzBQN0ZMcHBSVVNGaGVlcVFZd2pFQ0VuR0ZnYlVE?=
 =?utf-8?B?V2J1eUhGVXJnQVpKQVZKdXFkb1FDOENaM2haVHhORExJcjdPd1pUZlNiWnpW?=
 =?utf-8?B?Y1duS3NtZGZ2MUc1SnRWeENFakpQWUhOd2RDNjhGKzZ0Vng3M2ZtNGg3a1Vv?=
 =?utf-8?B?TWFlNjdoSUF2Snlrd0pYTTZMMFY0R3BVbDM0Wmhham1QdlZDRHZEejBNSDN1?=
 =?utf-8?B?cU5kSXZXM29DK0toWDkxMkpsSXBQVEdBRHl2UExsaXRqOGQyaUh2LzJ4WHZl?=
 =?utf-8?B?a3NVRklBd3JvTFA3U0hPdG9sb2dtOXY1K2w1NjFnckNSMGVGOURrd0RPZWY1?=
 =?utf-8?B?Um93OUZ5QmV6Qno5aWVPRG1KSlJ2MmNrZzZLb0RTdEQ3MjhjUUF0WDdSSUdE?=
 =?utf-8?B?djdLVGtZc2E5NjEzSHp1bE9LUDNhUDlJdXlLMm5KeEp1SWlQbWhMK3E2dm44?=
 =?utf-8?B?bGRuazFaS042ZTg3aFZZU0pRTUZ1NERhejNQRmZyTU5sMEtRQS9GeEVFTmVr?=
 =?utf-8?B?Mmg0ckpmY2lscjkvaW5DREVZUHdzTG55L1ZJZ3E5am9rcmZGenNsclJQZWV3?=
 =?utf-8?B?TGNKMzExUWxveXpIT2ZaYlQ5d3cwUXhhNnFOd1hld3dQdVRYNXVMWUZ4TW1P?=
 =?utf-8?B?NGI2TVFpRDJtWCsrZGp3MmUxUnJ0aVhma3ZUMVBwRU14ZFFRY0RzN1dKNlhm?=
 =?utf-8?B?UjMxbzNWWWFhUlo5TFBRb2xvL1g1NFBVbjJmVGc5NENEOE9Lb0F6QWowYTcr?=
 =?utf-8?B?WEc1VHZVakRkdUFVenBhZDRpdGtzQ3RpdldyV0wyNWlFa2lRTHJvOFZTRFp3?=
 =?utf-8?B?NkF2dUJVL2lrS2VxNzhiTnFHc3N2eUdaSUNrL2N4VnRQc1RFU1EwcnlHeVJV?=
 =?utf-8?B?dHVzM2FHQkFBUms3NDZRZ2FjbklJWmt5L2l2Z3huNFhlSDVKcGlCWTJSeFZR?=
 =?utf-8?B?QlkwVnVwV1Y4RlFxL3dCb0dpUkR1SlZlTnZ1dDAzdzBBMktIYktTZDl4VlYy?=
 =?utf-8?B?djhQZTA4NjJLR1o4RG9aak1ORlZTcGc0a0lHV2JkWVF3Yy9SRkVPclRrd2lD?=
 =?utf-8?B?WDlaT3BYWUFTeENKcmxQS3VqNjZOdG44RkZFUWU1UitPUUlKQXVmUjVxbGxC?=
 =?utf-8?B?ait0ekpkNlVqSWVSSXZQSW81MkxzUmFBVTVBYXJCZWJrRWJUUUVPWERWRmRG?=
 =?utf-8?B?cERMQkVVbXNmMDd5QnIzTXlxTEdOeUZLQnpYQm15NlZUdllrbXZnNWoycmp6?=
 =?utf-8?B?Nm1qTFduVWhVRHQrdFVCOHVGZnJDbnk3OUdPYVhRYjhoMTZwLzJDTHFYcFUx?=
 =?utf-8?Q?4RY6zNUtS0I=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(376014)(36860700013)(35042699022)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 14:49:08.0121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 867e12d0-4f5a-40e1-e81e-08dd55ab8ed2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7877
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 14:49:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211908

T24gMjAgRmViIDIwMjUsIGF0IDE1OjMzLCBWeWFjaGVzbGF2IFl1cmtvdiA8dXZ2Lm1haWxAZ21h
aWwuY29tPiB3cm90ZToNCj4gSXNuJ3QgaXMgc3VwcG9zZWQgdG8gYmUgY3JlYXRlZCBvbiBmaXJz
dCBib290Pw0KDQoNClllcywgaXNoLCBidXQgb3VyIHJvb3RmcyBpcyByZWFkIG9ubHkgYXQgdGhp
cyBwb2ludDoNCg0KWyAgICA3LjYzOTc2Nl0gc3lzdGVtZFsxXTogU3lzdGVtIGNhbm5vdCBib290
OiBNaXNzaW5nIC9ldGMvbWFjaGluZS1pZCBhbmQgL2V0YyBpcyBtb3VudGVkIHJlYWQtb25seS4N
ClsgICAgNy42NDExMzVdIHN5c3RlbWRbMV06IEJvb3RpbmcgdXAgaXMgc3VwcG9ydGVkIG9ubHkg
d2hlbjoNClsgICAgNy42NDE4NDRdIHN5c3RlbWRbMV06IDEpIC9ldGMvbWFjaGluZS1pZCBleGlz
dHMgYW5kIGlzIHBvcHVsYXRlZC4NClsgICAgNy42NDI1ODhdIHN5c3RlbWRbMV06IDIpIC9ldGMv
bWFjaGluZS1pZCBleGlzdHMgYW5kIGlzIGVtcHR5Lg0KWyAgICA3LjY0MzI3OV0gc3lzdGVtZFsx
XTogMykgL2V0Yy9tYWNoaW5lLWlkIGlzIG1pc3NpbmcgYW5kIC9ldGMgaXMgd3JpdGFibGUuDQoN
Ck9uIDIwIEZlYiAyMDI1LCBhdCAxNjowMywgQWxleCBLaWVybmFuIDxhbGV4LmtpZXJuYW5AZ21h
aWwuY29tPiB3cm90ZToNCj4gSSBkbyBrbm93IHRoYXQgaXQgd2FzIGEgaG9ycmlibGUgdGhpbmcg
dG8gZ2V0IHJpZ2h0IHdoZW4gSSByZXdyb3RlIHRoZQ0KPiBzaGVsbCBzY3JpcHQgaW4gcHl0aG9u
ICh3aGljaCBJJ20gdmVyeSBnbGFkIHRvIHNlZSB0aGUgYmFjayBvZik6DQo+IA0KPiAgICAjIElm
IHdlIHBvcHVsYXRlIHRoZSBzeXN0ZW1kIGxpbmtzIHdlIGFsc28gY3JlYXRlIC9ldGMvbWFjaGlu
ZS1pZCwgd2hpY2gNCj4gICAgIyBhbGxvd3Mgc3lzdGVtZCB0byBib290IHdpdGggdGhlIGZpbGVz
eXN0ZW0gcmVhZC1vbmx5IGJlZm9yZSBnZW5lcmF0aW5nDQo+ICAgICMgYSByZWFsIHZhbHVlIGFu
ZCB0aGVuIGNvbW1pdHRpbmcgaXQgYmFjay4NCj4gICAgIw0KPiAgICAjIEZvciB0aGUgc3RhdGVs
ZXNzIGNvbmZpZ3VyYXRpb24sIHdoZXJlIC9ldGMgaXMgZ2VuZXJhdGVkIGF0IHJ1bnRpbWUNCj4g
ICAgIyAoZm9yIGV4YW1wbGUgb24gYSB0bXBmcyksIHRoaXMgc2NyaXB0IHNob3VsZG4ndCBydW4g
YXQgYWxsIGFuZCB3ZQ0KPiAgICAjIGFsbG93IHN5c3RlbWQgdG8gY29tcGxldGVseSBwb3B1bGF0
ZSAvZXRjLg0KPiANCj4gSXQgbWF5IGJlIHRoYXQgdGhpcyBiZWhhdmlvdXIgd2FzIHdyb25nIGlu
IHNvbWUgY2FzZXMsIGJ1dCBhdCB0aGUgc2FtZQ0KPiB0aW1lLCBJIHJlbWVtYmVyIHNwZW5kaW5n
IGEgbG90IG9mIHRpbWUgZ2V0dGluZyB0aGlzIHJpZ2h0IQ0KDQpJdCBjZXJ0YWlubHkgbG9va3Mg
bGlrZSBpdOKAmXMg4oCcdHJpY2t54oCdIHRvIGdldCB0aGUgcmlnaHQgc2VtYW50aWNzIGhlcmUg
YmVjYXVzZSB0aGUgcmFuZ2Ugb2YgcG90ZW50aWFsIHVzZS1jYXNlcyBpcyB0b28gZ3JlYXQuDQoN
CkkgYmVsaWV2ZSB3ZSBzaG91bGQgYmUgd3JpdGluZyAvZXRjL21hY2hpbmUtaWQgYXQgcm9vdGZz
IHRpbWUgaWYgc3lzdGVtZCBpcyBiZWluZyB1c2VkLiAgQ3VycmVudGx5IHRoaXMgaXMgZG9uZSBp
biB0aGUgc3lzdGVtY3RsIGNsYXNzIGlmIGl0IHdyaXRlcyBsaW5rcywgYW5kIHRoZW4gaW4gdGhl
IHJvb3RmcyBjbGFzcyBpZiB0aGUgcm9vdGZzIGlzIHJlYWQtb25seS4NCg0KSSB0aGluayB3ZSBz
aG91bGQgY29uc29saWRhdGUgdGhvc2UgaW50byB0aGUgcm9vdGZzIGNsYXNzLCBhbmQgZ2l2ZSB0
aGUgdXNlciB0aGUgY2hvaWNlIG9mIHdoZXRoZXIgdG8gdHJlYXQgdGhlIGltYWdlIGFzIGJvb3Rl
ZCBvciBub3QgYnkgd3JpdGluZyBlaXRoZXIg4oCc4oCdIG9yIOKAnHVuaW5pdGlhbGl6ZWTigJ0g
dG8gdGhlIGZpbGUgYXMgcGVyIGh0dHBzOi8vd3d3LmZyZWVkZXNrdG9wLm9yZy9zb2Z0d2FyZS9z
eXN0ZW1kL21hbi9sYXRlc3QvbWFjaGluZS1pZC5odG1sI0ZpcnN0JTIwQm9vdCUyMFNlbWFudGlj
cy4NCg0KdGw7ZHI6IGlmIGl0IGNvbnRhaW5zIOKAnHVuaW5pdGlhbGl6ZWTigJ0gdGhlbiB0aGlz
IGlzIHRoZSBmaXJzdCBib290LCBvdGhlcndpc2UgaXTigJlzIG5vdC4gIEJ5IGFsd2F5cyB0b3Vj
aGluZyB0aGUgZmlsZSB3ZSBicmVhayB0aGUgYWJpbGl0eSBmb3IgYW55b25lIHRvIHVzZSBzeXN0
ZW1kLWZpcnN0LWJvb3Qgb3IgQ29uZGl0aW9uRmlyc3RCb290IGluIHRoZWlyIG93biB1bml0cywg
d2hpY2ggc2VlbXMgd3JvbmcuDQoNCldl4oCZcmUgYWJvdXQgYSB3ZWVrIGZyb20gZmVhdHVyZSBm
cmVlemUgYW5kIGdldHRpbmcgdGhpcyBtZXJnZWQgd291bGQgYmUgZ3JlYXQsIGRvIHlvdSB0aGlu
ayB5b3UgY2FuIGZpbmlzaCB0aGlzIG9mZiBTbGF2YT8NCg0KVGhhbmtzLA0KUm9zcw==

