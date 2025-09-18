Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C398DCA1013
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 16:08:34 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.41])
 by mx.groups.io with SMTP id smtpd.web10.18720.1758211704653570936
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 09:08:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=b2tNJ1j8;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=b2tNJ1j8;
 spf=pass (domain: arm.com, ip: 40.107.162.41, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=eKXIJAOhtYc2RwNN9sLDnTVgboFlI5KM9E+gOzqWVKRYwpZXQwFFgju/rbmsQyMRc4TFaVp1ZLvZWkMlpiyus5KyMzBCsqmp/cIVVPRnj+hSSN1dBzY/PafPXxbHCP7goO12jhsUqSdHcKwOWzw9cbM6mZd36rXOuhcV6NsXVBXaphgD0gnf4meloBu9Eo7VyNjolabm43ycCnYMM1Lv9rxQdzdzfpUR8/mDSVnsAlUiknyV5ZvzEcxfMWF/mQJDZcYbeNRNNgUJD9uVoIZspsgZPghVGn7B7y2v6sHA9tzRK63fLXUKDWjaMk/u9KNebbu0IFI+Q87jEc7YEZJ+uw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLnqv9thYXnCZIUn7vtAbXqZax+rE5/0edkS6jaVgaE=;
 b=ixB4HaRN++h0UMIj7PB7N4UhtZRw0BUsCBSpnnwmvGBTfFODvYWsPeiOWboXKab2LZuqM2R5eUz1bdJBjYEG+t0qV5cfbx1kgxRexDstFhu8vMOvVJnhvpg62LP5RQH1XwEvNExZi7NEhVC+n7Qihzf0xC55ybjw3xUlCuXU++W7zEoZ3JuBDRvHPooU3IFVgln64EqsA5aBJzt+JCs93v+qkjPsWH2MrmNy4Pb/OIcCvewhON0rz0lZ//G8v7jDIgkQLrl3Hh2XB83svgeBrIJdrDWrvbjAK96gxh0nmgMC8/LHv0OK7P1jC9Vk5jzeunbFag14Td/ap0jM3hB9ig==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLnqv9thYXnCZIUn7vtAbXqZax+rE5/0edkS6jaVgaE=;
 b=b2tNJ1j8juoo25Ue2coVUXDgn736+3pymXaEvI8eETk7k4yaaWTvUHgK/+yRPmN6rQ03te7JCplUwIbaFJiF/Gd8Vpr8fk6e7BSOtYQY1UyhI9qoqcE4kbkwMB9/NamLTpQHB8c7hIizU3MhqCKnHlDEJ3lFlmYmrDlX6OtyeqY=
Received: from DB7PR05CA0065.eurprd05.prod.outlook.com (2603:10a6:10:2e::42)
 by AM0PR08MB5489.eurprd08.prod.outlook.com (2603:10a6:208:18e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 16:08:21 +0000
Received: from DU2PEPF00028D07.eurprd03.prod.outlook.com
 (2603:10a6:10:2e:cafe::f) by DB7PR05CA0065.outlook.office365.com
 (2603:10a6:10:2e::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.14 via Frontend Transport; Thu,
 18 Sep 2025 16:08:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D07.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.12
 via Frontend Transport; Thu, 18 Sep 2025 16:08:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ahN3h+4U0r3CQ24qmRsPNb+ko5nq5yYz9TPjRUi155D56Zec6nWkt6aUUen1YQXE11GCQC9g3WWGRlN4jCQ+F8R8T8G4whc+NtwbaUr+IHHRfH4K9OzzKkFEU5b9V7UlcyW5mU9vlP6fY+9yODIalYhLATPOGoWmZ467k/mdAj38bNZFXd8UrNdjCYgoYIQ83uzQRLD+0E+EI7oNvkKb6agjVJV6e7tbvybQZqYdZeVjEuiN4uSPieI1Y+fDW2moFOfg7DTBaJX5hSHrcxGw43v/nS3wyD6v4xkcDq93dSArURZCeKXm3NMioP9LLyPbs4rQmw19rzhTUudQQapxSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLnqv9thYXnCZIUn7vtAbXqZax+rE5/0edkS6jaVgaE=;
 b=D7ceMh+AhuQa8KpwA4mszYItXMoJd0/pJpbE0Md5e5V0ugb1MXlOIYZlDyuZvth/LhglCPNLnYc7b+acxBDyp3pOrAowjQcRpKHdn2esbh1Uz285ohKSWGbr76j8qUWsH/gDkjng0w71LUp9XV25qODHT3MsOH7D4+2PoL9VhcickpfGwZyBh6DiQUNeYia6Nn+lO8pCSOkhWXxNH7DxHvAeXjKrX+R+qNXEUSBxZyAlKtL5Cvs6UB/d5/Zvh+7D0SMx0hWAMKXFHdJ4UkPmttK9tmygHF079sca2v0zU0QOA6h/LxhlZ+9rrx5GXYd6o+iY4XGcpf5okR+4TGeIcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLnqv9thYXnCZIUn7vtAbXqZax+rE5/0edkS6jaVgaE=;
 b=b2tNJ1j8juoo25Ue2coVUXDgn736+3pymXaEvI8eETk7k4yaaWTvUHgK/+yRPmN6rQ03te7JCplUwIbaFJiF/Gd8Vpr8fk6e7BSOtYQY1UyhI9qoqcE4kbkwMB9/NamLTpQHB8c7hIizU3MhqCKnHlDEJ3lFlmYmrDlX6OtyeqY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBBPR08MB10412.eurprd08.prod.outlook.com (2603:10a6:10:535::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 16:07:48 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 16:07:48 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Harish.Sadineni@windriver.com" <Harish.Sadineni@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Sundeep.Kokkonda@windriver.com"
	<Sundeep.Kokkonda@windriver.com>
Subject: Re: [OE-core] [PATCH v2 4/5] oeqa/sdk/cases/rust.py: Add test to
 verify cargo build builds for target
Thread-Topic: [OE-core] [PATCH v2 4/5] oeqa/sdk/cases/rust.py: Add test to
 verify cargo build builds for target
Thread-Index: AQHcJiuSvf64HOR1JEiQjE02+xSP27SZIFyA
Date: Thu, 18 Sep 2025 16:07:48 +0000
Message-ID: <EEF664F7-CDAB-48D3-B5C8-974A1666D34C@arm.com>
References: <20250915102750.3298492-1-Harish.Sadineni@windriver.com>
 <20250915102750.3298492-4-Harish.Sadineni@windriver.com>
In-Reply-To: <20250915102750.3298492-4-Harish.Sadineni@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBBPR08MB10412:EE_|DU2PEPF00028D07:EE_|AM0PR08MB5489:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c3910a7-ade6-4392-2ef1-08ddf6cd9645
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?bnRlSmVjUHpDNEc1YmdkdEdpOTdvQ3ZYWVFVSlNobFlwYllyTERtU29ka0w0?=
 =?utf-8?B?TXp5N0dlQTV5cWpXNG1HK2gwcWI0VElabXF1MTFKUHBRcGZJZ0g0U05jd3hS?=
 =?utf-8?B?UGdRVEtRdTBjMTNZbkRvWnZQTmVzRHVCWWZ3RVJ1bDNHYjAreFFxbVBDUWRu?=
 =?utf-8?B?NkxscitJMGtLUlRtWVRON2szMXZ0U3JicUY1c3A0NTZMZitsYmEvODBWUjJN?=
 =?utf-8?B?cFNUeEdFYXNSYVhHQlF0NjZBQUJvQ2Rjdm8wU3VRU3YrcE9QbWZuWkpNc0VL?=
 =?utf-8?B?K0JLenZkaWJ5dW9DclBscVhBTHg3OE1VQkVjcnZHVGtUZnZnTS9NbVpMZzZ1?=
 =?utf-8?B?SmxGdytDM1VJdmw3TlFLQ1BlQWJjTGpndDRBSDhrWnpHWVVxUGE4NXlvQUpX?=
 =?utf-8?B?N09mTFZHY2pCQTBVV0tkNWNQbFc3VnpLbWNsc25zQkR0clc4eUg2dm9XK3A5?=
 =?utf-8?B?UjFFOHVGdFNxWDhFT2NHY0JIcFcwZHJGdHl5Wmh1Sno4NXlHLzFkS1dqNkRO?=
 =?utf-8?B?dllBMW1jVE9ZWk9XMzVBNVdubmxJK2diajZhQW5KU1p2eXBmVUYyd0x4ZGZI?=
 =?utf-8?B?dUpSejFyOFVxQmpMMUYzZWIvT1N4Z1cyVFVVMHpRdERySlp3VUZkMkVFMHJJ?=
 =?utf-8?B?OUNEQ2IvU20zQXliOGFlU0FIWER5R1RIMzlHeitaNXhIWUU0L1JsSFBUVk1i?=
 =?utf-8?B?SDJUdS9UUHk4YWRCR0s4UUJGZDhuZC8rMkY4dklhTlVJU25QV1RzNEZzNXZs?=
 =?utf-8?B?UXhhZFVnRDV2NE1SN3V4YWZIdTZ6NHF5K0duVkRjWDI0OVlnNExVM1p5R3VD?=
 =?utf-8?B?UnNSUE5lcjJMUi94N2EvK1IwVWU0TmhCWjFicGgzV1RCTnlXWHZRRktJckRT?=
 =?utf-8?B?bFljQ0d1VGI5Sm9ZdVhFdDJlZk1jREpWZTROZWltamNWcS9ic2Z6R3NYeUhU?=
 =?utf-8?B?OHQ5aDR1eWhjUm9UTCtNR3l1cFhwSHdZYTlsaEdpcXI1U3VTb2dmSHh1enlF?=
 =?utf-8?B?UlZPVndpUzFpUCtoc2pzRzA0ekw5Y1NSM0Y2NkxnNmcyQ3hNZUdweURyaFFF?=
 =?utf-8?B?NnZWU3pJUU5MWU54a1dEcFlqZXV2UzNtWHY2b3BDRmQzQ2hkSGp0R0trd0Ro?=
 =?utf-8?B?TDEyTTdMOEpmWWltaUo1RHh1R2RFZ2x2dmZoNjRxMUQ5cEtMZWp0ajlOVWZw?=
 =?utf-8?B?ZUxoR1E5Y1RJazZnVlNyOGhkNDFtMmdtdzZZK0FQbFp1aHg5Zzl6eTRKaXRS?=
 =?utf-8?B?eWdYeHlrK2lMSm5kbU5ISU9YYWVNYnU4U0pkcEVtTmIycTk5UUlwUU5CRU45?=
 =?utf-8?B?Y1czWlJEaUR4eDN4SmpJODZJN2lXT3hWMDBzQy95WlRORzdGSnNXclFmS3ha?=
 =?utf-8?B?bVkzWXJvTlpCeGNmSGw0ZGJIbThDaEF4RmdXV1hsRzdUUkYycllDZXczZUhE?=
 =?utf-8?B?VDd6L0ZSdkJPQkNDeWtHcldqS0pBdXNLMlZvdXRHaTRLOFlHOHgyamFsdzN4?=
 =?utf-8?B?OGZSRnVHbGFOdDVSd3VQaTk1Zkk0UHVkRVFzMmVJUWxFeXptbUt5TnUxa1pr?=
 =?utf-8?B?N0lCM1A1QW8xRnkrTitHUEZNU0FTOXloYi9XTlpMN0ZrQi9jNVg1ZGVFVGQv?=
 =?utf-8?B?dDI5dTM2T2R0NVlFVUZCclZsS2ZKTXE5VDZEbytSWkVySTBlVXYvR1Nud0tK?=
 =?utf-8?B?WS9iM1p4TE1MdEZzNW94QVdPSngyemt0VGd2OVozazBkb2xoeTNDWXhnNCsv?=
 =?utf-8?B?M3A2RUVrUzRwUHBSYW04aldZejJ0MVRtRHdEUnlrMHExSnozTS9ER25UY1Vx?=
 =?utf-8?B?S0NCcXNVblJOdlM1SkxRWmNabm8yUEIybkpueHlNeTZ2eHpIL095eXR5bmJy?=
 =?utf-8?B?YnBWZzNGZGllQnRnQnl5a1RQbjBkckhTUWJBSllWT0RjUUlrRHRtWWREd05G?=
 =?utf-8?B?ME5uQW4yL1ppNC9jeGlnenNQZnpPYzBaZG4yTElxU1Noa2EzcUVmb2pCWTV6?=
 =?utf-8?B?MVk2UStxL1FnPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <964A36E4B853EA4CBE68B79E136E6D0D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10412
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D07.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4e59a131-2595-4365-a46b-08ddf6cd82f2
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|14060799003|376014|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RENDZkRoU0hPYzl5OEIvdTlldWFEZ2xWQXE1SUs2YVB1cXNTSTdKM3R5TWJZ?=
 =?utf-8?B?bEFnbzFlZlNaWFBjMXBXOWxacWRMVHA4amRYMXhseUl4bENSR2VhVEY2bS9E?=
 =?utf-8?B?NC94bUc1SmlCUXlJTlhJZmNlWExXMXFMRUxSUWdINi9PR2NJSlp2U2FGUGJx?=
 =?utf-8?B?cnlFNFQvWWtRbElJbU1VMDF1WmQ3QkR6bWkxblNIL2srQy9vTWp1SFZZVVNz?=
 =?utf-8?B?WmFEZmEzNnkxVjNFWHEyRFRLOWJhWWlmd251alA0Wm1wSkhVTWRVbklrNk8y?=
 =?utf-8?B?YW5JRVNiQ0NIRWd0VXVvUEppNm5lM1VWb2tHZGUwa3dBMlBCdTVRZTV6ZExL?=
 =?utf-8?B?N3dlSzZrUXY2TW5NRExlQWNxT1BZV2Y0MCs0UW4wYUtRTjdRQ0xiZjRxWUJj?=
 =?utf-8?B?SkZScWJwc0lnNjYwRnhIZmhiamRwc05XVGxVL3VtNWJpVWpyYTJzMjJhcDkx?=
 =?utf-8?B?R3NUbW5pVlkvWHlEYmFsNjNjS2Y4M2R4d3M3MUJONmI2blZ2azlxMHlzQVFZ?=
 =?utf-8?B?RGdMOUU5ODJCZjVWVStWTTBlY2FqbXN4OWxMMUQrWXJXR1FkZ2hjcEJ2eisz?=
 =?utf-8?B?bW1vQU12bldKY1laVGtGY1kwRDZrUXM0RUpoanJnMTcreTJDUGV1d3NGR1Zy?=
 =?utf-8?B?TlZIMlY2cUNxZGNGSnFCM25ETDEvTHRLS3c4azVoWTJUbzZPTjhoa0FQczhN?=
 =?utf-8?B?dXc4N29JbmpJWExoUjluMitDRkdVakRtby8vVmtmRFhKNWQ2cVZkelZldkxQ?=
 =?utf-8?B?a0tCcDI4ZlVScHJyWGl4WDR6VzN0QnhtU01ZNElDaWFBYmhHMlVieHVDeHdn?=
 =?utf-8?B?ZkJDb2RNelF0SnlvQ3Z6b1hvMzhPeGZqN0NkaUhNK3BvWm15dE9HaVpxclN1?=
 =?utf-8?B?dmRlV1J2ZTlCZS9zY0p6VzErNFdPalR2REZmVmxCZ0REd0RaQTFOMndiRXN3?=
 =?utf-8?B?UmVLdHUyM0g3WmhNRXhUQitNT1h5Wm42R2NqREwrYnMzU2FGT0Uwd0lWSjhL?=
 =?utf-8?B?UGZwM0h0S1ZEKzJUemNybWJIU2d2a1QzNWVvMy9MRUdBS3VnV2l3SVdteHlv?=
 =?utf-8?B?c2hlTnBkeEhOWlJaRmZhM2JRMi81MG96ckN3ajNHTklsYXp6Zyt6UTc0ZHlU?=
 =?utf-8?B?dlp6TWd5YVlibUx3ZmdkdmExMmFCdEJuckh0eU1vSVIxV0dabGF3ZzRQWDJR?=
 =?utf-8?B?SFRtUmYrZVo0MVY4Rmh0U0F6UEpVMzdpelViODA2WGNuMW9IRDBPQ01PdkRY?=
 =?utf-8?B?cW9WKzRtaTIrR0N0b2hSSUlmZ0VnbzZ0ME5Hd0xrc1pvTXFxdXptU2N2eFJw?=
 =?utf-8?B?K2JZZWt5eCswaCs4aEI3b0wzdVlWUjltWSttSE5uSWN2QUFUaWo5QVhvL25m?=
 =?utf-8?B?V3ozQm82Vm9kMlhvWmc3QlkrUlhxV2V6eE44dDR2Y0VNSTgvNlVoN3M3Ykxh?=
 =?utf-8?B?ak14dG9ZWThTZEpjY0h1d082RnBmaHJjQit1N05vNXd1L2p6Kzg5ay9lcHZu?=
 =?utf-8?B?ai91TUhwandLbGE0TnZNbkYyT1c1dE9jbU1VQkdZZTRuYmR2a0xDa3Yzdkto?=
 =?utf-8?B?OUlrcXVDek5hcmhaTmozWG1OSHUrWWR5Zm00NmdreWRYSkF4eTRveVFYZE9L?=
 =?utf-8?B?bDI1WnhtenJ4TEtRZ3dqSjRtZDJHd3NGaDBhUW1zQ29WK0pPakZrd0I5dVY4?=
 =?utf-8?B?MlMzWkVjWXNjYW5yYk92REc0RmZPemQxWDhDcjJ0MFlGdENtU1U4amV3bUZE?=
 =?utf-8?B?YjdSbk9oSTRaYlFmOWNyL0NSOGQ3T3FHbXRpWHdMS3JnUGJBdGdBdVRqMkV6?=
 =?utf-8?B?Yk53aDJBYVY4L3NoRnpTU2hpdWRjbmsrK3hNVDk2K3BUanJ6M2JjdXNBcDZG?=
 =?utf-8?B?SmJOOGtPYzBjcno1VGRuUkh0d05aNWZVQzNkc0VSN05JMWg2am9CcTJCaFox?=
 =?utf-8?B?NjhQUkJPZXBWWkRLWVlFd1pTc3hNR3Brc0xteU5JWXJKWHo5NTNQL200dWRj?=
 =?utf-8?B?bmpud3JNWlRWZGpsaERvNWJuV1d6am1ncmZTUDluWVRjWi95cExwSjkyWS83?=
 =?utf-8?Q?PpOTDm?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(14060799003)(376014)(35042699022)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 16:08:20.5237
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c3910a7-ade6-4392-2ef1-08ddf6cd9645
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D07.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5489
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 16:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223650

T24gMTUgU2VwIDIwMjUsIGF0IDExOjI3LCBTYWRpbmVuaSwgSGFyaXNoIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxIYXJpc2guU2FkaW5lbmk9d2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnPiB3cm90ZToNCj4gKyAgICAgICAgcmVzdWx0ID0gc2VsZi5fcnVuKCJjZCAlcy9o
ZWxsbzsgY2FyZ28gYnVpbGQgLS1tZXNzYWdlLWZvcm1hdD1qc29uIHwganEgLXJjICdzZWxlY3Qo
LmV4ZWN1dGFibGUgIT0gbnVsbCkgfCAuZXhlY3V0YWJsZSciICUgKHNlbGYudGMuc2RrX2Rpcikp
DQoNCldlIGRvbuKAmXQgcHV0IGpxIGludG8gdGhlIFNES3MsIHNvIHlvdeKAmXJlIHJlbHlpbmcg
b24gaXQgYmVpbmcgaW5zdGFsbGVkIG9uIHRoZSBob3N0Lg0KDQpJbnN0ZWFkLCBqdXN0IG91dHB1
dCBKU09OIGFuZCBwYXJzZSBpdCBpbiB0aGUgdGVzdCBjb2RlLg0KDQpSb3NzDQo=

