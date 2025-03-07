Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 289A1C19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 14:36:30 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.56])
 by mx.groups.io with SMTP id smtpd.web10.12553.1741358184216476346
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 06:36:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=pG8+h6ai;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=pG8+h6ai;
 spf=pass (domain: arm.com, ip: 40.107.21.56, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=KCUlCTj5jurMuLNvHkbIaJCssosiXgSNSUgvNQhg0gtti/NOUXlPNZi6s5VUUfndfa1oxbNIf69nUxLPfgRPJ2vaF21YN7lsUrGS+u6SvLa/7r8p9zCloKawgG4kbf8G2yatXe36q5RWBRGU842jsxBo1LhL9/UuMRdnAmeinm1RCjejXs72yiyQfW+GgV1oVD/xfJG+JR6wvVF/c0AQU8XtUV4EV+QC99Rf+x1AEsUm+ff7YcPNFGyDAUThdfPdmDn/DTcRF9cXMfcESNiImp9PSvxLQK5CMixFvxnNCxkbLa0e0T17r0+t3RAC+HNQQwZNBVFSH9BlZKYtm9wftg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5wpFtIJqLBDnDG9gkEjxxyNsTx4nCyd+j0M1jD+eJA=;
 b=hO4Au0o3Z1E+uaFFpDCCYbw7ngg5nkpPv8OWHuenfsUxlhF7sCuBFW/rGOfxQkhiTI+U7uq9jmzu5z3W+0f0ol5sElPO1XvTGv5t8H1DejfROfiBFv23n0KuBbkeQKf28mlFkazTYxu0wArr83zXLVKo91rGjbjC7VMUE283yFbitLDWB0PA1QlV8Y0NalqI8FhtLamtj75pqdU3QLL7hqB+hRwoAu2YpmsieNTHQ4Lo170ZAw6KquJ8iXBVyrtj/lMhJUW8hYMgX7KRT+3hkTT06VJClEsM2QDzTntVJL7UbSwluNukILSUBX7OayE63+YX8ewf2OzW60Cj9v59jA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a5wpFtIJqLBDnDG9gkEjxxyNsTx4nCyd+j0M1jD+eJA=;
 b=pG8+h6aijOYiOdlbYXqxmu+8QQbilWhMNWeVgEX5NcDogbYnO6H7zgYuw+KlV59ego82Dw61ExzyJKHWU5V5uJdDDrwoyiSUhM1pqUkGn/TaMGFKIG16cXE6RhO/OBVby+46w8A2jdWKkctEauyw+Z/gRNl8ayWFq0Y8UDapqec=
Received: from PAZP264CA0246.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:239::15)
 by GV2PR08MB8725.eurprd08.prod.outlook.com (2603:10a6:150:b4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Fri, 7 Mar
 2025 14:36:14 +0000
Received: from AM2PEPF0001C70D.eurprd05.prod.outlook.com
 (2603:10a6:102:239:cafe::55) by PAZP264CA0246.outlook.office365.com
 (2603:10a6:102:239::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.19 via Frontend Transport; Fri,
 7 Mar 2025 14:36:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C70D.mail.protection.outlook.com (10.167.16.201) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15
 via Frontend Transport; Fri, 7 Mar 2025 14:36:13 +0000
Received: ("Tessian outbound a60532193129:v585"); Fri, 07 Mar 2025 14:36:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 53355ef827b1cfd5
X-TessianGatewayMetadata: BFJoc++exd31vYd9TDrnqzg5a35QYB25MByq6kHNXOhI9dgiRJswHSuRNGo+Mw5Q7OB4Y1bY1Hbjt5soDKvNOmMvHkvlG0GJ8SFaQBrxoMDLtB/NykeFXnHG+x9H1G65EJ17UbWzSW7kQzMLwWH3sVbihdMSJR1OXLFSdsYH1O8=
X-CR-MTA-TID: 64aa7808
Received: from L99e0b23d5508.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2007F7E3-6DE9-4817-85D4-AF84165A57C6.1;
	Fri, 07 Mar 2025 14:36:05 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L99e0b23d5508.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Fri, 07 Mar 2025 14:36:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OoJ2UEU5suensZayv9irXjCSPLnlgpnV+As/znPJnvo7iK6aWmlw5MlXDh8UMh58FqnZX1+Nnt0dMM8LxICVYUwrPbP8mObaafYdafnRxjmuDdleNnLvCseoOkMIe4KEQyt6cCr2akX6d53dIqo8hIQYLEUZDYw98IMHsRpl3Jq5nj1WDsESvq4HUnCgQjLtd451kal26k1Tz+MCWmbGsssD7/mnvPFaczrn77JBCfOuOhdlme6vnL68dZmIxCH5Dt7Sv0esGXiWD2ETrvDQ7rFsjQtp28rLaI94p1qpo69DG2riE7neIiZ445LwzqF1n6V06jF1eiYDoekdLHfVxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5wpFtIJqLBDnDG9gkEjxxyNsTx4nCyd+j0M1jD+eJA=;
 b=u+COD/bTQjhf53Mg9ayfeimYnqCH6Sghy+94nHBnFB2+rUnn0mPT0C4ksFwDQ/0JWp570BzH5y+xpAGCpQ2/NG+gkTVhh35LVDjXZZLAnQ/4UtWUlQIxeAhwSY656cZ9t/p0y51vd2fEd/PBlm9eNt1nI9MB68wDFeztWokUCh9XgoDAh+E9UqGVN7F+2JObNGKDlak4DszNx6rEcaTMTJApcL6tPYtm7T9XgT+buhJ7BAAlnwJ9B/Yf7zsTyNmtUc2a7RUa67T5BnQQT8Ofhk0u8WevN61igrxgvS5TC+id+Ni4uyjhuEOAewuaVZAKIvztIhHzgOhLeu8dMcPyKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a5wpFtIJqLBDnDG9gkEjxxyNsTx4nCyd+j0M1jD+eJA=;
 b=pG8+h6aijOYiOdlbYXqxmu+8QQbilWhMNWeVgEX5NcDogbYnO6H7zgYuw+KlV59ego82Dw61ExzyJKHWU5V5uJdDDrwoyiSUhM1pqUkGn/TaMGFKIG16cXE6RhO/OBVby+46w8A2jdWKkctEauyw+Z/gRNl8ayWFq0Y8UDapqec=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8344.eurprd08.prod.outlook.com (2603:10a6:150:c0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Fri, 7 Mar
 2025 14:36:03 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 14:36:03 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>
Subject: Future of CVE scanning in Yocto
Thread-Topic: Future of CVE scanning in Yocto
Thread-Index: AQHbj25Ae51IJoM27EqHOiSzcVrh6w==
Date: Fri, 7 Mar 2025 14:36:03 +0000
Message-ID: <7D6E419E-A7AE-4324-966C-3552C586E452@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB8344:EE_|AM2PEPF0001C70D:EE_|GV2PR08MB8725:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b1f15cf-d5f2-4243-09cc-08dd5d85693a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?WTdCdVAzenBPRkhja1VWQUpqR0xQTFpQV2VIQVVBRldDa2h0R0NQOGZmbWJz?=
 =?utf-8?B?eGRNVk9VcitWL2hicmdQb2owckdXNDQxNFpoc0o3MmJlRUsxUVRHQ3cwczB1?=
 =?utf-8?B?NTIvOVRySkpnMFJZMGpWc2hTV2pCbG42NkpQNndZZ0ozVjc1TEhWQWcrQnpZ?=
 =?utf-8?B?WXRNQXNsWmpzZXZob0VYWEFYbXdQWHRhUTFnSytOVXYvdHFCVTdkeXZPV2FK?=
 =?utf-8?B?ZkJiMUt2aDFYWDY0SndLYUYzdkRlamxxUFRPQjB5UmQ5Y0owaWJHbzZUVTV6?=
 =?utf-8?B?cjdFWkV0SFhlcnpmcmlsQXhXS3FQWTJ6d0s3d2JxWmI2VTc5dU56dXY1Z1RO?=
 =?utf-8?B?aUd0TDVla0IzRXBUUk8wS2JOK1dOVmNMU2NuakdOSXMzNGtPTDJqTisycTB5?=
 =?utf-8?B?ZjBYSUxUc0Z1OW9jOTJMcmV2R3dQU3RGbkJjYm80bWxLcXV0L3RTT2JYTmRu?=
 =?utf-8?B?cHRkQXpFcnQ4bE5rSzNrVW9XVFhJSGxweHV4SVRMODFkMlAvYnd2a01MMzJl?=
 =?utf-8?B?Rm5TNWtpc21YdktxdHhoamhHZjUrWDlYMFA2UmdlVjZOeXR4NGp0SktCblpu?=
 =?utf-8?B?STMzU1B0VUgwR1NFZXhyckRHKy96N3ZQdkhvakYrZDdjNUhZYXpGQnhhekVX?=
 =?utf-8?B?dlp6VDFNTTdLdFpOaGlHbnljeVVpTWJIMGpiNG5YNlVYaUIyQ3Bzd0FpUEF1?=
 =?utf-8?B?cHBzay9yQmJzT0FHaDJ4ZS8wOFdoanFiU2VINnpWbEdEVFdDa3R1OGE0S2pJ?=
 =?utf-8?B?T05lTysvdUptQ0s1VDFjRlQwamRLWmhLSkVOVisyYmVENUNHaEdrVXQ2Y01u?=
 =?utf-8?B?blNYbG9uekJDSFJHUHRjNlZuY3pnRnYxSFQ3R2RZVFc1M1BLZlJHVWl6amJk?=
 =?utf-8?B?b1ExUnhjaEhnS2RmZ2p2VlFOMDNCSUlySnJCR1NtV1FiaUZVVytaajhibGg4?=
 =?utf-8?B?Y3lBbVhqZ0N5QWF3RkwyL2g5Y3BqVVBzNzRhWXdCTURhZW1SUS8rMWtSNUZZ?=
 =?utf-8?B?SHBMY1JkRWYyKzF3dlBzRWZCZnFWRW0rQ01GK0lOdldaWFZrbG5qYW1Cb2tY?=
 =?utf-8?B?anZkMFMwcjQ5d2E5aU8yYzJ3NWtQLy9rRzBCWnpsdXk4bklWL3ZYOXNJQzBT?=
 =?utf-8?B?dFZDVm5wdWM0ZkZNY0FaSk5nZkpwQ2lyVC9lQTdrbEMwZUZ1MXV5cWpEWUtu?=
 =?utf-8?B?QStnTmxiTnN5bFdVSnV2R1YwRHM2SlpnbGpCK1VwanpwZi93aXBXempieDE3?=
 =?utf-8?B?ZE9HRVczV1QwRGsxTklFYXVIelJlTmpTYVNHa2NmWjlNSXlLWDYvaEZ4dWIw?=
 =?utf-8?B?aGUxTGtLcktnSnJ4ZnpMLzc0Q25DeUpJVnU1d0hWQkJzemppL0pYK0NIRmxL?=
 =?utf-8?B?Z29ZM0t0dnZIVmpzYnBNVzUwaXBjV0VnT3RqY25aOWtEaGZ4NFBxdVAyWkJl?=
 =?utf-8?B?VWpkZXR4MGczWkhWOXVLRzFWZDdIc3I0WkoyaUF2NytPeXErT3RIcnkzSVpM?=
 =?utf-8?B?QndCWlZ3MHVDZE9ab01KRlNUQ3Rtck52bzVmV1U5OWVNaUwrL3l5RFI5MFdt?=
 =?utf-8?B?SzZiSm9qNkNQcWxIOEtMWndEMXdleXR4QnNldCtvcmZWcXpWbHJ4NExYN3U1?=
 =?utf-8?B?VUVYM2xuVnR3bWtuRE0rNDdRcit2MURTaVlneUo1SW5obVZTcXVTbFUxQ1JR?=
 =?utf-8?B?WEJnaWpFcnd6Z3lIMWlFaDQxSm9FLzYwOGxvNm1QSkVlcVdJbXE2VVR2cGVl?=
 =?utf-8?B?bDhSeVdCbXNIZFV0dTNuRWIxQm1vME1ZcDR1WXlQbUhSbjh4T1hGYWRtNmda?=
 =?utf-8?B?alM2NytMem1rWEVVQkVxQzBCWllXYTc3WEQ2RWxYdUhPWVVSSUFsczVLWGZV?=
 =?utf-8?B?TzFnNUMxenlHYlAwMmp0WFBmNUo0V1kxTGVraVk2NEFYT2c9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2282A446FF1FB14786BD804AC40C5627@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8344
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C70D.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4967993d-22f0-4e85-e2b4-08dd5d85631b
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|14060799003|36860700013|82310400026|376014|35042699022|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZjV4YmYyaGk2Tmt6OUxFMTV0Q2o3TjA4ZUgxZ0tvMDUrSzlrR1M2WTE4UFo2?=
 =?utf-8?B?T3lVYlcwVEJGUWo4cEZRNFFFUUJNa3JiUVlCeVRrK0NINnJXNDgwWFpGTW1l?=
 =?utf-8?B?REZPb0Z0UjVGSGRvaXpGL0s0N3RJMlVmWU9IVUJJb2dCOGNZQWppR1QzRmlo?=
 =?utf-8?B?SlloMGZJMEtaRUR3OGUzSVlOUkk0N3FhMGtyb1NtY090cm01Y3hpVFIwQ3lr?=
 =?utf-8?B?aUprWUwwalA2M2EydGFyNzl4dS9NUTdHRlBWU2dFdTVyY1ZBN1dQYllvQUt3?=
 =?utf-8?B?Um1Vd0VvcVZ0WXNmZlJ3V01Hd3c5c1pFL0NkWWRXRzBYa3FvMERDallJVWo3?=
 =?utf-8?B?bXpzK25pZUFEQU50L2dPYmI4SStoTmhMeUZ5NU1DS1dJanBzNTZVODZNTVY1?=
 =?utf-8?B?VnBhTzBYOGJ0U05IV1k5b25RZFNLbGpFRkJhV1JwTXpyeXFMRDkwY0ZQSEt0?=
 =?utf-8?B?VndmZHFBcjRkNGZ1QkZiWFlpKzhKdVRaWEw5eE8yMlZCTko4TmhLaGoyM2Rq?=
 =?utf-8?B?UWh1RlFSZ2FWYzFOZXBaWHovakM3SUxuS2R4SThmK2MzMm0wQUZ3eFAzQnhH?=
 =?utf-8?B?c1pSRytqS2FrZlZydE1JbEMzZU5Jc3dGRy94WG5KOTFoeE16WVdRTzI0Zjdj?=
 =?utf-8?B?L2dFZzdoM0dpSWl1S3JGVmtxMUJwZ0dET0xhQkVvMGVlMHp0VzQ0WnprQ0RT?=
 =?utf-8?B?M0ZkWmdaTWJpTlZsZDRCQmpCeUliUHhZdDZMS1N6TEFONmFpOGVHOFFBMXRn?=
 =?utf-8?B?SFlTby8vempJcjFHTXVpYzFBNlh3cmtLdHZ4VGs3RWdONHB4SDFOdnkrc2ds?=
 =?utf-8?B?MFh0Y0oyRXMxR3RTdEx0aHQ2a1REdnE5a3FnMnhtejdadC9pekM4T0llVTg4?=
 =?utf-8?B?TzFyZm5uNUZjYkFHei9KTVpTUzJWMjVkVDJ4QzhwNEU5NGpoTHdDRmRMeHlJ?=
 =?utf-8?B?dUttYzNIbzJ4aHd3YktNbHo5dVdIVTFJTldLaWZSTHQxemlFWGU3Q3RtMk9t?=
 =?utf-8?B?ZGRka2tjazQ5SlMrQ2RiYUFjMjMrWXNaNUo0N2FsQloxU25TWmg0MHY2U25M?=
 =?utf-8?B?RzB0cXg0S3FSRGx6ZnhhakhrMWxqVWVSenFLZVYycTVvMGFFRkxPNGpmN1BC?=
 =?utf-8?B?c214UGFBUVk4V2ErWUhCNitzRFdZaU9MbUJ5RWh1Tmdab1FoRyttc1YzNVA1?=
 =?utf-8?B?cndQeXRCVDNwV0FQaFB3SFAwZVVGZTB0elIwTUU3bWE3eEV1TzhGODJjajU1?=
 =?utf-8?B?NGxKcTFmdHMzMGdpYWo4QjdMSFdIL0I5Q1I4OWl6SVRZREUvNDZHcWxKc3hR?=
 =?utf-8?B?RDl2RFl5bXU5OU82SXBDZ3AwbHFOTzFCVUZuZFVDRngwbVJ0MjUvbUduRlNZ?=
 =?utf-8?B?a2pZWU94SGhkZEV6NEVOVzBqZzdjVEZIb05PZllkSE5Wa01yeks5TjNvQXhK?=
 =?utf-8?B?WnBMVVRyTFZiWkJZdFppeklMdVRON2l5QVV4ZkFxK21XNlR4STR1WlJPS29K?=
 =?utf-8?B?UFVrT3NzTlFFdG80VGlRL2E3SGxRQklBUEdQUVBXWUZrcnNhK0haaVorZHU5?=
 =?utf-8?B?SGRnRkhXOE9Kb3cvQjRRcEozYTM2czZZalcxejBxaElQK3E3QUFWVzZXekF6?=
 =?utf-8?B?RmFrMndtMmhZaDc4Z1IraWNQeG5VMTNVVmVMMFJzTzVISnM4aDdROHIvUDdM?=
 =?utf-8?B?M0lxU0Z5UmMvdkNHUkNhSGlKNUQxTy9wMjc4djEwellIQjBPWW1HellsdW5t?=
 =?utf-8?B?SGtoZlhWNk5pOEFFNnAwOTFQN2xzUTNvU2VUNytoajFCdVRpSTI5OUVaYlI2?=
 =?utf-8?B?S05IaFFLUEFSN0UvYXJDaFBPeE90RE0zUjBSNEtlMk1TT0dlN04rb1BQeDhj?=
 =?utf-8?B?cnlmcFJMTlpLaTU0RHFNK2xRQ25acC9rRm4rRHh4NHpJRE1FNXE1Vkh3YVkw?=
 =?utf-8?Q?MJagjfrJGTOy4rTCt3s6mRM6W/TZMVoC?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(36860700013)(82310400026)(376014)(35042699022)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 14:36:13.3141
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b1f15cf-d5f2-4243-09cc-08dd5d85693a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C70D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8725
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 14:36:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212446

SGksDQoNClsgdGhpcyB0dXJuZWQgaW50byBhIHdhbGwgb2YgdGV4dCwgSSBjbGVhcmx5IG5lZWQg
dG8gZ28gYW5kIGJ1eSBUaGUgQXJ0IG9mIEV4cGxhbmF0aW9uLiAgRmVlbCBmcmVlIHRvIHNraW0g
ZG93biB0byB0bDtkciBdDQoNClRoaXMgaXNu4oCZdCBnb2luZyB0byBiZSBhIHN1cnByaXNlIHRv
IGFueW9uZSB3aG8gaGFzIGJlZW4ga2VlcGluZyB1cCB3aXRoIHRoZSBDVkUgc2l0dWF0aW9uLCBi
dXQgdGhlcmXigJlzIGJlZW4gcHJvYmxlbXMgYW5kIGNoYW5nZXMgYXQgTklTVCByZWxhdGVkIHRv
IHRoZSBOYXRpb25hbCBWdWxuZXJhYmlsaXR5IERhdGFiYXNlIChOVkQpLiAgRm9yIGV4YW1wbGUs
IFRoZSBSZWdpc3RlclsxXSBoYWQgYW4gYXJ0aWNsZSBsYXN0IHllYXIgZGlzY3Vzc2luZyB0aGUg
YWxtb3N0IGNvbXBsZXRlIHN0YWxsIG9mIHByb2Nlc3NpbmcgbmV3IGlzc3VlcywgYW5kIHRoZSBO
VkQgbmV3cyBzaXRlWzJdIHRhbGtzIGFib3V0IGhvdyB0aGV5IGFyZSBhdHRlbXB0aW5nIHRvIGRl
YWwgd2l0aCB0aGUgYmFja2xvZywgYnV0IGFsc28gYWRtaXRzIHRoYXQgdGhleeKAmXJlIHN0cnVn
Z2xpbmcgd2l0aCBBUEkgc3RhYmlsaXR5IGFuZCBpbnRlZ3JhdGluZyBkYXRhIGF0IGFuIGFjY2Vw
dGFibGUgc3BlZWQuDQoNClVuZm9ydHVuYXRlbHksIG91ciBjdmUtY2hlY2sgY2xhc3MgdXNlcyB0
aGUgTlZEIGRhdGFiYXNlIGJlY2F1c2UgYXQgdGhlIHRpbWUgaXQgd2FzIGJ5IGZhciB0aGUgYmVz
dCBvcGVuIHNvbHV0aW9uOiBpdCB3YXMgZWFzaWx5IGRvd25sb2FkZWQsIHRoZSBkYXRhIGhhZCBt
YWNoaW5lLXJlYWRhYmxlIG1ldGFkYXRhIGlkZW50aWZ5aW5nIHdoYXQgc29mdHdhcmUgd2FzIGFm
ZmVjdGVkIChjYWxsZWQgQ1BFcyksIGFuZCB0aGUgQ1BFcyB3ZXJlIGVhc2lseSB1cGRhdGVkIGlm
IHRoZXkgd2VyZSBpbmNvcnJlY3QgYnkganVzdCBzZW5kaW5nIGFuIGVtYWlsLiAgVGhlIOKAnHVw
c3RyZWFt4oCdIENWRSBwcm9qZWN0IChjdmUub3JnLCByYW4gYnkgTUlUUkUpIGF0IHRoZSB0aW1l
IGRpZG7igJl0IGhhdmUgYSBjb252ZW5pZW50IHdheSB0byBiYXRjaC1kb3dubG9hZCB0aGUgZGF0
YWJhc2UgYW5kIGRpZG7igJl0IGluY2x1ZGUgYW55IENQRSBpbmZvcm1hdGlvbiBzbyBpdCB3YXNu
4oCZdCByZWFsbHkgYW4gb3B0aW9uLg0KDQpUaGUgZW5kIHJlc3VsdCBpcyB0aGF0IHRoZSBzZWN1
cml0eSByZXBvcnRzIGdlbmVyYXRlZCBieSBvdXIgY3ZlLWNoZWNrIGNsYXNzIG1heSBsb29rIHJl
YXNvbmFibGUsIGJ1dCB0aGV54oCZcmUgbWlzc2luZyBsYXJnZSBudW1iZXJzIG9mIGlzc3VlcyBh
cyB0aGUgQ1BFcyBhcmUgbWlzc2luZyBmb3IgdGhlIHNjYW5uZXIgdG8gd29yay4gIFJhbmRvbWx5
IHBpY2tlZCBleGFtcGxlIGlzIGh0dHBzOi8vbnZkLm5pc3QuZ292L3Z1bG4vZGV0YWlsL0NWRS0y
MDI0LTUzNTg5OiB0aGUgaHVtYW4tcmVhZGFibGUgc3VtbWFyeSBzYXlzIHRoaXMgaXMgYW4gaXNz
dWUgaW4gb2JqZHVtcCAyLjQzIGJ1dCB0aGVyZeKAmXMgbm8gQ1BFLCBzbyBjdmUtY2hlY2sgY2Fu
bm90IHByb2Nlc3MgaXQuDQoNClRoaXMgaXMgYSBwcm9ibGVtIHdlIG5lZWQgdG8gbWl0aWdhdGU6
IHRoZSByZXBvcnRzIF9sb29rXyBnb29kIGJ1dCB0aGUgcmVhbGl0eSBpcyB1bmtub3duLg0KDQpU
aGUgZ29vZCBuZXdzIGlzIHRoYXQgdGhlIENWRSBQcm9qZWN0IGhhcyBiZWVuIHF1aWV0bHkgY2F0
Y2hpbmcgdXAuICBUaGUgZGF0YWJhc2UgaXMgYXZhaWxhYmxlIGluIGEgZ2l0IHJlcG9zaXRvcnkg
b24gR2l0SHViWzNdIGFuZCB0aGVyZeKAmXMgYW4g4oCcdnVsbnJpY2htZW504oCdIHByb2dyYW0g
dG8gYWRkIG1vcmUgbWV0YWRhdGEgdG8gYWxsIGZ1dHVyZSBDVkVzIGFuZCBiYWNrZmlsbGluZyBp
dCBhcyBuZWVkZWQuICBUaGlzIG1lYW5zIHdl4oCZcmUgbm93IGluIGEgc2l0dWF0aW9uIHdoZXJl
IG5ld2VyIENWRXMgb2Z0ZW4gaGF2ZSBubyBDUEUgaW4gdGhlIE5WRFs0XSBidXQgaGF2ZSBhIENQ
RSBpbiB0aGUgQ1ZFIGRhdGFiYXNlWzVdLCBhcyB0aGV54oCZcmUgcHVsbGluZyBtb3JlIGluZm9y
bWF0aW9uIGZyb20gdGhlIHByb3ZpZGVyIChHaXRIdWIgaW4gdGhlIGNhc2Ugb2YgdGhpcyBzcGVj
aWZpYyBpc3N1ZSkuDQoNClNvIHRoZXJl4oCZcyBhbiBhcmd1bWVudCB0byBiZSBtYWRlIHRoYXQg
dGhlIGN2ZS1jaGVjayBjbGFzcyBzaG91bGQgYmUgcG9ydGVkIHRvIHVzZSB0aGUgQ1ZFIGRhdGFi
YXNlLiAgSG93ZXZlciwgdGhlIGN2ZS1jaGVjayBjbGFzcyBpdHNlbGYgaXMgcXVpdGUgbGltaXRl
ZCBiZWNhdXNlIGl0IG9ubHkgcnVucyBhdCBidWlsZCB0aW1lOiB0aGVyZeKAmXMgbm8gd2F5IHRv
IHRha2UgdGhlIG91dHB1dCBvZiBhIGJ1aWxkIGFuZCByZS1ydW4gdGhlIHNlY3VyaXR5IHNjYW5u
ZXIgYSB5ZWFyIGxhdGVyIHdpdGhvdXQgaW52b2x2aW5nIGJpdGJha2UgYWdhaW4uDQoNCkkgYmVs
aWV2ZSB0aGF0LCBsaWtlIG1hbnkgdGhpbmdzLCBTUERYMyBjYW4gaGVscCB1cyBoZXJlLiAgU1BE
WDMgY2FuIGNvbnRhaW4gdnVsbmVyYWJpbGl0eSBpbmZvcm1hdGlvbiB0byB0aGUgZXh0ZW50IHRo
YXQgaXTigJlzIHNpbXBsZSB0byBleHRyYWN0IGl0IGFzIE9wZW5WRVggaWYgdGhhdOKAmXMgdGhl
IHNvcnQgb2YgdGhpbmcgeW91IHdhbnRbNl0uICBPdXIgU1BEWCBjb250YWlucyBmb3IgZXZlcnkg
cmVjaXBlOg0KLSBBbGwga25vd24gQ1BFcw0KLSBEZXRhaWxzIG9mIGlzc3VlcyB0aGF0IGFyZSBt
aXRpZ2F0ZWQgd2l0aCBDVkVfU1RBVFVTDQotIERldGFpbHMgb2YgaXNzdWVzIHRoYXQgYXJlIG1p
dGlnYXRlZCB3aXRoIHBhdGNoZXNbN10NCg0KVGhpcyBtZWFucyB3ZSBoYXZlIGEgc2luZ2xlIGZp
bGUgdGhhdCBjYW4gYWN0IGFzIGJvdGggdGhlIGltYWdlIG1hbmlmZXN0IGFuZCB2dWxuZXJhYmls
aXR5IGxpc3QsIHNvIHdpdGggc29tZSBzdWl0YWJsZSB0b29saW5nICh1c2luZyB0aGUgQ1ZFIGRh
dGFiYXNlKSB0aGF0IGNhbiBiZSB1c2VkIHN0YW5kYWxvbmUgb3IgZGlyZWN0bHkgcG9zdC1idWls
ZCB3ZSBjYW4gaGF2ZSBzZWN1cml0eSByZXBvcnRzIGF0IGJ1aWxkIHRpbWUgb3IgcGVyaW9kaWNh
bGx5IGFmdGVyIHRoZSBidWlsZC4gIFRoaXMgd291bGQgdGhlbiBvYnNvbGV0ZSBib3RoIHRoZSBj
dmUtY2hlY2sgYW5kIHZleCBjbGFzc2VzLCBhbmQgYXNzb2NpYXRlZCByZWNpcGVzLg0KDQp0bDtk
cjogIEkgcHJvcG9zZToNCi0gRm9yIHRoZSB1cGNvbWluZyAoQXByaWwgMjAyNSkgcmVsZWFzZSB3
ZSBzaG91bGQgYWRkIHRvIHRoZSByZWxlYXNlIG5vdGVzIHRoYXQgd2XigJlyZSBhd2FyZSB0aGF0
IE5WRCBpcyBzdHJ1Z2dsaW5nLCB0aGlzIGlzIHdoYXQgb3VyIENWRSB0b29saW5nIGlzIGJhc2Vk
IG9uLCBhbmQgd2XigJlyZSB3b3JraW5nIG9uIGEgc29sdXRpb24gZm9yIHRoZSBPY3RvYmVyIDIw
MjUgcmVsZWFzZS4NCi0gVGhlIGZ1dHVyZSBvZiBDVkUgdG9vbGluZyBzaG91bGQgcmV2b2x2ZSBh
cm91bmQgU1BEWDMgU0JPTXMuIElmIHRoZXJl4oCZcyBhbnkgbWlzc2luZyBtZXRhZGF0YSB0aGF0
IGlzbuKAmXQgaW4gdGhlIFNQRFggYWxyZWFkeSwgd2Ugc2hvdWxkIGFkZCBpdC4NCi0gV2Ugc2hv
dWxkIGlkZWFsbHkgZmluZCwgb3IgYWx0ZXJuYXRpdmVseSB3cml0ZSwgYSB0b29sIHRoYXQgY2Fu
IGRvIGF1dG9tYXRlZCBDVkUgZGV0ZWN0aW9uIHN3ZWVwcyBsaWtlIGN2ZS1jaGVjayBkb2VzIHVz
aW5nIHRoZSBDVkUgRGF0YWJhc2UgYW5kIFNQRFgzLiBUaGlzIHRvb2wgc2hvdWxkIGJlIGFibGUg
dG8gYmUgcnVuIGF0IGJvdGggYnVpbGQgdGltZSBpbnNpZGUgYSBZb2N0byBidWlsZCwgb3Igb24g
YSBzZXBhcmF0ZSBzeXN0ZW0gd2l0aCBqdXN0IHRoZSBTUERYIGFzIGFuIGlucHV0Lg0KLSBBdXRv
bWF0ZWQgdG9vbGluZyBpcyBqdXN0IGEgcGllY2Ugb2YgdGhlIHB1enpsZSwgYnV0IGl04oCZcyBh
IHVzZWZ1bCBwaWVjZS4gIE1vcmUgb24gdGhhdCBsYXRlci4uLg0KDQpDaGVlcnMsDQpSb3NzDQoN
Cg0KWzFdIGh0dHBzOi8vd3d3LnRoZXJlZ2lzdGVyLmNvbS8yMDI0LzAzLzIyL29waW5pb25fY29s
dW1uX25pc3QvDQpbMl0gaHR0cHM6Ly93d3cubmlzdC5nb3YvaXRsL252ZA0KWzNdIGh0dHBzOi8v
Z2l0aHViLmNvbS9DVkVQcm9qZWN0L2N2ZWxpc3RWNQ0KWzRdIGh0dHBzOi8vbnZkLm5pc3QuZ292
L3Z1bG4vZGV0YWlsL0NWRS0yMDI1LTI2NjAzDQpbNV0gaHR0cHM6Ly93d3cuY3ZlLm9yZy9DVkVS
ZWNvcmQ/aWQ9Q1ZFLTIwMjUtMjY2MDMNCls2XSBodHRwczovL2dpdGh1Yi5jb20vSlBFV2Rldi9z
cGR4M3Rvb3BlbnZleA0KWzddIE9uY2UgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb3BlbmVtYmVk
ZGVkLWNvcmUvMjAyNTAzMDYyMTIwMDcuNDQ4ODAtMS1KUEVXaGFja2VyQGdtYWlsLmNvbS9ULyN1
IGlzIG1lcmdlZA0KDQo=

