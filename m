Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6BF3CCA470
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 14:59:24 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.100])
 by mx.groups.io with SMTP id smtpd.web10.20979.1759849160274875978
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 07:59:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.com header.s=selector2 header.b=eKY5NA90;
 spf=pass (domain: weidmueller.com, ip: 52.101.66.100, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CmxrvDiVJ9o3hqlK9rjsJbIewwMlXhM6vb6rPQBcJOep9ffFUGiXMVzJuq7FMkY4WbkZOf6FAWwGaOjAETeXgL8qk71onz7LYz5PknUf9uMiBwA8J3oqGBLgo71lRc9dxfIDNeJsDvcCbNvHekfKe44IwTJLY2mXpvzCzC2E236D9lKHwB0QHZgzXHJ4n/t7/YY9MWhF8kkc9wUXkNATA6K/1KGTkb7sfkjAVkv5MTlXa9mGXBD6uLEeJ72v5a43YpPJOLIQamOCUh1X3coC//9dUbZ4XxCBdPZGJTIQcQdSEO4N3UwWQBPQtf+0A2LocJ49W2Kku1UqiOt6uqX3Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=chgMC9r/3WVBF8LRC/tigY464OxYzF6lloZ+ovyrDHk=;
 b=g87l2qz0003Nc8Pqqu2J0+o2zJXNPDx0BeNij0GO33I5pEqB0XX4NgRTezT3OKx+g/dv1cL+hxT1es1hr8rDYyeH5QpabK5ZJoorYeK9+JoNOWLB5gcbAkKYXkAoQ2xwNMuNZYduOm4dADc3BleNzc63RdfeX8rdl6X+NKOKBT3/Iapwvs3Yov9fUqYamV1PoBz1tUoxU7IsCRUPbsx783bbcM02941g+JA2xsvt09MUgCcL+4IVlUy/ReDpJRUMQeQRVwmKoMCPagBDCCpXuiBT2yy/gs1KypK6RfCI0WTBxYHSDtiMK3Ksovod3HZZ1e7v2O/Oh/fPCuli6kAlPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chgMC9r/3WVBF8LRC/tigY464OxYzF6lloZ+ovyrDHk=;
 b=eKY5NA90f1L6Z2GdBRaH3RC0wlA3z89oh6zCVxjerEEVi4ktDlTwJCxMhxGud3zLCt9e9/rHj4vRhkWKmPZhy4q390xfcZARnXo7A1XsnZrQ6LyvvqgSPD8zM1SEujmdWZ4H4gWhNe7QCsVN/doDqOXOUnXaGQy5wQ99pL1hwKhADFNPfuy2+z0uVscp1IBfZfy0jpvK4hOOL7p46bGBO//tfYarwb49Dq/TJyBjeNzxL75Rn9e+es/0WzfnthE11cA+/kxM8GXb6Du9AOECUEtGyt/IsCRVe85e+EO2IguJRFDgiw3dC9vLLkAXrJdX2mEL82EgfnkOLTg23pub2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by DU2PR08MB10038.eurprd08.prod.outlook.com (2603:10a6:10:49c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 14:59:13 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%5]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 14:59:12 +0000
Message-ID: <211549e4-c4c2-464d-9b63-88c27d5bdf18@weidmueller.com>
Date: Tue, 7 Oct 2025 16:59:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH] cargo_common.bbclass: use source
 replacement instead of dependency patching
To: skandigraun@gmail.com, openembedded-core@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
References: <20251003213000.2256939-1-skandigraun@gmail.com>
Content-Language: en-US
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <20251003213000.2256939-1-skandigraun@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::6) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|DU2PR08MB10038:EE_
X-MS-Office365-Filtering-Correlation-Id: 98ea493d-2d86-4726-ef0d-08de05b21374
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eWJrMVErak11bU9NTkRnODBpek5OeFBsaURGQVdEc0xFL1hxSElndDNxQmxv?=
 =?utf-8?B?VVRBRFlGbTZ2c0FoREkyWDRRbG1TRnhpQVRNclNvdUFyc3MyMStFZGhMNjhl?=
 =?utf-8?B?alcxNkRxMm9kdC9UUVg0STBrWGRhTjMyZ0gzckxtR3VMQjB5blJpcWxRQXpP?=
 =?utf-8?B?YWh5TzA3S1hQbkpGVTN1QkwyWHEwaVpXRG9nUUtKMlFISUFSVXk0dE9yUmNO?=
 =?utf-8?B?SnRvWlpOM280L2ZzVXcvYkRnV2txS3cwSzFqSFF5bnJDcUJlbGFROXp0WkdS?=
 =?utf-8?B?SjBLNlM3MW1MWVVHUi9mRjB5b1lSS2FMbEpQb2c5ekVOOVhqVkI2dHVjcFRN?=
 =?utf-8?B?dlBpMGpiUVBpbTZRcUo3TnNCcWdlSVVwcEZSamdRVHIwNHhLVDdGMnl3ckNX?=
 =?utf-8?B?S2dZUEJDaGl1N0FCQW9RU3dROXp1cncrbFNETzhod1AvU0UrSmZDRDE0QWJw?=
 =?utf-8?B?VVBvY0hvUkdPSjRCbWR1dTJCdnorMTR0R3FpYVBCODltcFdtbzhlTXBGamJo?=
 =?utf-8?B?MnZhYVN3VFRMcGsrSEk0WDhtNFJVR2hURWt2aUFWNDRSZTlNNjA0bXdwWFF2?=
 =?utf-8?B?NDZMbVhKODMwbmF4NEMvaTBSWXhySUlTNWNEMkh1RDhsKzdWb2xBV3FUTkI0?=
 =?utf-8?B?RVU4OTMyeXFxbnUrbFFXYVBzWnV6VDljeEpHSEZBUVRxZzlWL0c5eVNJcWFX?=
 =?utf-8?B?M2EzU0tqMjlHeTU0azVIYndEV3hkek4vQ3NxdnlnQmMwZXdCUFNsY3FtNCtH?=
 =?utf-8?B?OTVxY0w0MHpSSDRkWXV3cG94RVRGL1JLczdmMTY2ODJvbFlmcmZnK0plbTZK?=
 =?utf-8?B?Z0xwU2duSmY5RGtsd3BvbDJUY09DMFNHTW1MemtNWFhnaEFQUHM1M3FhZURH?=
 =?utf-8?B?NU5hREJMcVFyeUxERGh2MDN2WXVUSllDTm9mUXpUOGhDSW9UdmdrdlMrUkNh?=
 =?utf-8?B?Kzl1ZUptNEhvSTdrZzN5QjZ0SmZIUFVXd3RHVytYNG1vZGZZVmcvQkxFdUJZ?=
 =?utf-8?B?TFlVcXNXZTBmd2ZHeCs1bnV0SVhNSTFvcno3a3hyWUJHcHpHSW40OXFWUHdD?=
 =?utf-8?B?bWsxdVNyY05vMjdEemFabzRObVdvOXVINEhMQVFFWCt2ZGVGS25LMlNlMnJU?=
 =?utf-8?B?dFdvUGlOYXRDVW1KaEJmdkt3MVJqcnh4amdpUEgwT3BtZjJOM25GWlJiam0w?=
 =?utf-8?B?NXg2R1BCdUozRm40U3QvNkhYTDlhSGZLd3BZYTRBazNnazZRa1NJUHFyaGRO?=
 =?utf-8?B?K1FYVUNoV2N5QTU1cjZwVUJDZFQ5K3l2TUEybU5zTWgrQkpUREZ3UGV2N2Vi?=
 =?utf-8?B?VGJBNzZZYnZ4S1k1ZVQ0b0pBQXFXQk1FMkpEdjhJbmlGQVMxUTlwZmZKMDZq?=
 =?utf-8?B?OXF5cFk0Z2NyRkdGTmUyaTVZL0s4R3Zsc3ZKSG5qcmNqWG5ob2RxRFRxMDJD?=
 =?utf-8?B?cW5EWW9xTE5CSjdqQVRURG8rRVREcHQ1QkRJZzlwYjdRZStZQ0hSUUF2QmNB?=
 =?utf-8?B?bytmUDNWdVVlQkFrWk5sN0xmNkt5WG1TZ1FDTG9OZG1JZm1tbmY3Q0VrY0Fp?=
 =?utf-8?B?RjFZZjcvYTRjKy92b1B2UGZoKzUvdDJqTktaRWVFTzZDTnR5b0dNajFBRExn?=
 =?utf-8?B?bENlSlNCd2g1T3RGcCt3ZjFleXZnVzVWYk1WNVBvWW5lTStaNE9ZRGVCcE9E?=
 =?utf-8?B?bjdHYy9sSk5JZy9LcGp0R3FxQ0g3SXNGZHdVMFRQM3BFb2pXZi9hVHBUSjRL?=
 =?utf-8?B?Q1BuT0x1NWxweURpakd5YURjNTJPZFFvOTBSd2UxVHNZTG1zV0JrM2xnQlpL?=
 =?utf-8?B?NWNOY0N6SkRkOWdXZGpMS3duZ3I0NGFDM0VnamZjalVSQ0VhNmJzdzRWUjRp?=
 =?utf-8?B?V29HS09OeTlDWFlYbUoxRXd6ekRjTWl5aFZGM2R0NzdVY1E9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eW9nY2xyc3JLSzBiU1lmTHB5OU5La2JZNzkzUjQvWTExU215bTVZaVJ5VzJr?=
 =?utf-8?B?NkZHd0hyOU4wS000R0FLQnJnV2ptUmdyaWFlQU1LTlA3bFdHK3RMVDBCNHNJ?=
 =?utf-8?B?SXFZR1I5NXMxdG1ZL2d0d1JXZjI5allQOWVCMk1NNkU5Mm96VkNVZU80dXRI?=
 =?utf-8?B?ZzY1RHl4TTJTUUJGbSttK1R0dU9WMzNZNW8ydG1BWFhXN0xNUWpVaTI4U2VM?=
 =?utf-8?B?dStmTXNUVzNVYVpqVWpIQkhudG9KZTljSmExMGNZcE1XaEJQTU5kTDFLcU5V?=
 =?utf-8?B?UXovMCt4N3JrWEhlVTZySmNtWUJFR3pOdXl2bnV2T1dHUC9adElpRE5wVFNQ?=
 =?utf-8?B?TkJhNGthR3A5R1pac1VGL3dtc3M4VFZpdG1pUnpvYTVvQk4zWHFlQThsS1BF?=
 =?utf-8?B?b2puQnJXc3NSbHlVY3p4T0Jpa2N6NkpxR0FhQnVHbTBhc0lvN2RtRjR1NHM2?=
 =?utf-8?B?TnFGTktpSUFjZTh1SUhCMTNVWGVuMDRLYjg5YkJucFloY2cyQ3hNbmlUb2Vy?=
 =?utf-8?B?dytPSmRaU1NQbUh5QWc2MmxaYmd2azJzbkdEOEZxQTlydS9scmRRM2NySVdh?=
 =?utf-8?B?ZU0zVGd5U0xBcXFPV29yN0c2WldNUlhSZDJRdDhtT051TVphdllIRG5HRWJt?=
 =?utf-8?B?UkdEd2I5eWJzeWlaTHV6VDNUNUQ0MUl1M1FTSmNqbHpyTFNYc2lSdWlMUzBh?=
 =?utf-8?B?dVhwVmExZ3ArbHBVbk5FZm45Qk13K2JwNjVrbHRlZ1I2NVZaelFiUDJLbUVk?=
 =?utf-8?B?N01kMkF5S0hwT1BsZ2h5aTZldC8wRnBkamNyV05CdFBzbEU3UUw2VGZHR0Mw?=
 =?utf-8?B?NU5mRzdtRlNmbTdIeTZFdkcrMEpMMnNVUnBkZVcrZXNSYjN3ZE1uaVIwa2R6?=
 =?utf-8?B?bTFqSFJHQTQ2ZnBrc1ozMU9wRW9TUmoyNjEwcU11blRmc2xNVVhGVTAzM3lS?=
 =?utf-8?B?bDRCakZCcC9WQXFTT29PbVBoQnJXYlZNdDVDRlR2NWRRNjNRZFhPTWg4YkVM?=
 =?utf-8?B?cDkzTUVLWFVqUVFiaWltRVVmcUowTXdnSXFDQyswMkNnbmJtT0xKVWVBZzln?=
 =?utf-8?B?WXJjYWs0bC9kREwvV25KOTc2UUpHRlV5Sll6MWtkeEgyb1BsTFk2V3RmMTd3?=
 =?utf-8?B?eWZqZWkrQ0RtWVdzWDdxZEhNekFRaDVMcjdhTXRjVDhOSFRzWHgrVWYxTytJ?=
 =?utf-8?B?eGNRNHBIeWt4WUxwc1QyNUNDTjkxUjh3TEpiVFk3bDBkNityK3NTaERlcjJS?=
 =?utf-8?B?d09oWVNTZ0lGSS9tbWlmMWxzMUNSenlTRUd5V3B0UWR0cE5DR2M1Tmt6ajRH?=
 =?utf-8?B?RVhTbVpCYkVBcHAxYlA0TG8rQXYwVEJOTit2cVZHb0NybmIxUFRTeGJDVVlB?=
 =?utf-8?B?enQyenZSbDQvb2RnNTZPME1tVGpJcnhHaW8zT0JGcnBaTzJGOURJc0FVYUxo?=
 =?utf-8?B?OFhTaEN6K2JoQ1A3T082bXFibC85ZFNJWDByTm5BZHp6MmpWems4WXlxMlZX?=
 =?utf-8?B?M2gxR3dLR2F4SjNMWVczb3puWlRTNUtOY2hMT04rSXhnVzFBYXk0V3A1WElk?=
 =?utf-8?B?Y2hxR2QxQWp2bG0vbGk0NkdNRFNmUHJ1RFNOZjU3Zyt0bm9ML0VhVUpHMnUz?=
 =?utf-8?B?Rm9DNEw1NWg1S25rME9uWDFMbWFCNDB5ZWFlTDBXbjF5ZzB4N1VpUURTeTY5?=
 =?utf-8?B?bkM1SVQvQ050aE95RUwwcmZBZjVpK3VEV2w2c3pLN0xwa3o5VEdyUGR0bVJz?=
 =?utf-8?B?L1d3dUQ0Mmg0RlFmYlpmZEV0cjVhbE9xaVZ2VWJJZXFjczJwTHZ3RzFNdkxT?=
 =?utf-8?B?Y0JkQzVMQmtFS1FXcFNJTnlBVVV4dWN5MGRwK1Y2ZjVUd2dnTG52WjlqbU5B?=
 =?utf-8?B?R2o4SVZQWGFINnJlOVhiSGRvRUw1N2wwaGZMbHlqOUQzUm8yMjRrNDEwa1pr?=
 =?utf-8?B?T3lORWp2UlVMWnlFVitMaTRlZHBEdzhCOElvaGNpZjNkc0l4c0xYV3FGZ201?=
 =?utf-8?B?NTk0NktHSmlMZm5SK1BiYUpWQlFnZzlHaWs4bStMd0laZnZtRFdpRVVoeDd5?=
 =?utf-8?B?Qlpha2s3WE03YXhUcFI2UThPQWVJeEVDdmtkVEhQM2pLOVg1dDJ1eDYrUHNN?=
 =?utf-8?B?R1pWb3hreHl1SWdWK1pPOHVvZ3htbUsxZ3hOUDBEVGx1dmJKU0FHVXVqaVpM?=
 =?utf-8?B?VVE9PQ==?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98ea493d-2d86-4726-ef0d-08de05b21374
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 14:59:12.3824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 29urpED/Egkm5zANi73evw5pqy1ppTeyHO1OqGWyh3mfRogfPISo1T8ftRoUaKJbEbA1Kpp7ATxThyQTHMhSWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 14:59:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224538

Am 03.10.2025 um 23:30 schrieb Gyorgy Sarvari via lists.openembedded.org:
> Cargo.toml files usually contain a list of dependencies in one of two forms:
> either a crate name that can be fetched from some registry (like crates.io), or
> as a source crate, which is most often fetched from a git repository.
>
> Normally cargo handles fetching the crates from both the registry and from git,
> however with Yocto this task is taken over by Bitbake.
>
> After fetching these crates, they are made available to cargo by adding the location
> to $CARGO_HOME/config.toml. The source crates are of interest here: each git repository
> that can be found in the SRC_URI is added as one source crate.
>
> This works most of the time, as long as the repository really contains one crate only.
>
> However in case the repository is a cargo workspace, it contains multiple crates in
> different subfolders, and in order to allow cargo to process them, they need to be
> listed separately. This is not happening with the current implementation of cargo_common.
>
> This change introduces the following:
> - instead of patching the dependencies, use source replacement (the primary motivation for
>    this was that maturin seems to ignore source crate patches from config.toml)
> - the above also allows to keep the original Cargo.lock untouched (the original implementation
>    deleted git repository lines from it)
> - it adds a new folder, currently ${UNPACKDIR}/yocto-vendored-source-crates. During processing
>    the separate crate folders are copied into this folder, and it is used as the central
>    vendoring folder. This is needed for source replacements: the folder that is used for
>    vendoring needs to contain the crates separately, one crate in one folder. Each folder
>    has the name of the crate that it contains. Workspaces are not included here (unless the
>    given manifest is a workspace AND a package at once)
> - previuosly the SRC_URI had to contain a "name" and a "destsuffix" parameter to be considered
>    to be a rust crate. The name is not derived from the Cargo.toml file, not from the SRC_URI.
>    Having destsuffix is still mandatory though.
>
> The change does not handle nested workspaces, only the top level Cargo.toml is processed.

I use a similar approach for my Cargo.lock fetcher. In my case the code 
finds the crate on the fly inside the a git repository because the 
Cargo.lock doesn't contain the subpath.


> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> Cc: Tom Geelen <t.f.g.geelen@gmail.com>
>
> ---
>   meta/classes-recipe/cargo_common.bbclass | 158 ++++++++++++++++-------
>   1 file changed, 108 insertions(+), 50 deletions(-)
>
> diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
> index c9eb2d09a5..79c1351298 100644
> --- a/meta/classes-recipe/cargo_common.bbclass
> +++ b/meta/classes-recipe/cargo_common.bbclass
> @@ -129,6 +129,44 @@ cargo_common_do_configure () {
>   python cargo_common_do_patch_paths() {
>       import shutil
>   
> +    def is_rust_crate_folder(path):
> +        cargo_toml_path = os.path.join(path, 'Cargo.toml')
> +        return os.path.exists(cargo_toml_path)
> +
> +    def load_toml_file(toml_path):
> +        import tomllib
> +        with open(toml_path, 'rb') as f:
> +            toml = tomllib.load(f)
> +        return toml
> +
> +    def get_matching_repo_from_lockfile(lockfile_repos, repo, revision):
> +        for lf_repo in lockfile_repos.keys():
> +            if repo in lf_repo and lf_repo.endswith(revision):

Does this works if the URL contains a "rev" query parameter? This 
happens if the same git repository is used with different revisions.

> +                lockfile_repos[lf_repo] = True
> +                return lf_repo.split("#")[0]
> +        bb.fatal('Cannot find %s (%s) repository from SRC_URI in Cargo.lock file' % (repo, revision))
> +
> +    def create_cargo_checksum(folder_path):
> +        checksum_path = os.path.join(folder_path, '.cargo-checksum.json')
> +        if os.path.exists(checksum_path):
> +            return
> +
> +        import hashlib, json
> +
> +        checksum = {'files': {}}
> +        for root, _, files in os.walk(folder_path):
> +            for f in files:
> +                full_path = os.path.join(root, f)
> +                relative_path = os.path.relpath(full_path, folder_path)
> +                if relative_path.startswith(".git/"):
> +                    continue
> +                with open(full_path, 'rb') as f2:
> +                    file_sha = hashlib.sha256(f2.read()).hexdigest()
> +                checksum["files"][relative_path] = file_sha

Do we really need the calculation of the checksum?

> +
> +        with open(checksum_path, 'w') as f:
> +            json.dump(checksum, f)
> +
>       cargo_config = os.path.join(d.getVar("CARGO_HOME"), "config.toml")
>       if not os.path.exists(cargo_config):
>           return
> @@ -137,66 +175,86 @@ python cargo_common_do_patch_paths() {
>       if len(src_uri) == 0:
>           return
>   
> -    patches = dict()
> +    lockfile = d.getVar("CARGO_LOCK_PATH")
> +    if not os.path.exists(lockfile):
> +        bb.fatal(f"{lockfile} file doesn't exist")
> +
> +    lockfile = load_toml_file(lockfile)
> +
> +    # key is the repo url, value is a boolean, which is used later
> +    # to indicate if there is a matching repository in SRC_URI also
> +    lockfile_git_repos = {}
> +    for p in lockfile['package']:
> +        if 'source' in p and p['source'].startswith('git+'):
> +            lockfile_git_repos[p['source']] = False
> +
> +    sources = dict()
>       workdir = d.getVar('UNPACKDIR')
>       fetcher = bb.fetch2.Fetch(src_uri, d)
> +
> +    vendor_folder = os.path.join(workdir, 'yocto-vendored-source-crates')
> +
> +    os.makedirs(vendor_folder)
> +
>       for url in fetcher.urls:
>           ud = fetcher.ud[url]
> -        if ud.type == 'git' or ud.type == 'gitsm':
> -            name = ud.parm.get('name')
> -            destsuffix = ud.parm.get('destsuffix')
> -            if name is not None and destsuffix is not None:
> -                if ud.user:
> -                    repo = '%s://%s@%s%s' % (ud.proto, ud.user, ud.host, ud.path)
> -                else:
> -                    repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
> -                path = '%s = { path = "%s" }' % (name, os.path.join(workdir, destsuffix))
> -                patches.setdefault(repo, []).append(path)
> +        if ud.type != 'git' and ud.type != 'gitsm':
> +            continue
>   
> -    with open(cargo_config, "a+") as config:
> -        for k, v in patches.items():
> -            print('\n[patch."%s"]' % k, file=config)
> -            for name in v:
> -                print(name, file=config)
> +        destsuffix = ud.parm.get('destsuffix')
> +        crate_folder = os.path.join(workdir, destsuffix)
>   
> -    if not patches:
> -        return
> +        if destsuffix is None or not is_rust_crate_folder(crate_folder):
> +            continue
>   
> -    # Cargo.lock file is needed for to be sure that artifacts
> -    # downloaded by the fetch steps are those expected by the
> -    # project and that the possible patches are correctly applied.
> -    # Moreover since we do not want any modification
> -    # of this file (for reproducibility purpose), we prevent it by
> -    # using --frozen flag (in CARGO_BUILD_FLAGS) and raise a clear error
> -    # here is better than letting cargo tell (in case the file is missing)
> -    # "Cargo.lock should be modified but --frozen was given"
> +        if ud.user:
> +            repo = '%s://%s@%s%s' % (ud.proto, ud.user, ud.host, ud.path)
> +        else:
> +            repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
>   
> -    lockfile = d.getVar("CARGO_LOCK_PATH")
> -    if not os.path.exists(lockfile):
> -        bb.fatal(f"{lockfile} file doesn't exist")
> +        sources[destsuffix] = (repo, ud.revision, crate_folder)
> +
> +        cargo_toml_path = os.path.join(workdir, destsuffix, 'Cargo.toml')
> +        cargo_toml = load_toml_file(cargo_toml_path)
> +
> +        if 'workspace' in cargo_toml:
> +            members = cargo_toml['workspace']['members']
> +            for member in members:
> +                member_crate_folder = os.path.join(workdir, destsuffix, member)
> +                member_crate_cargo_toml = os.path.join(member_crate_folder, 'Cargo.toml')
> +                member_cargo_toml = load_toml_file(member_crate_cargo_toml)
> +                member_crate_name = member_cargo_toml['package']['name']
> +                shutil.copytree(member_crate_folder, os.path.join(vendor_folder, member_crate_name))
> +
> +        if 'package' in cargo_toml:
> +            crate_folder = os.path.join(workdir, destsuffix)
> +            crate_name = cargo_toml['package']['name']
> +            shutil.copytree(crate_folder, os.path.join(vendor_folder, crate_name))
> +
> +    for d in os.scandir(vendor_folder):
> +        if d.is_dir():
> +            create_cargo_checksum(d.path)
> +
> +
> +    with open(cargo_config, "a+") as config:
> +        print('\n[source."yocto-vendored-sources"]', file=config)
> +        print('directory = "%s"' % vendor_folder, file=config)
> +
> +        for destsuffix, (repo, revision, repo_path) in sources.items():
> +            lockfile_repo = get_matching_repo_from_lockfile(lockfile_git_repos, repo, revision)
> +            print('\n[source."%s"]' % lockfile_repo, file=config)
> +            print('git = "%s"' % repo, file=config)
> +            print('rev = "%s"' % revision, file=config)
> +            print('replace-with = "yocto-vendored-sources"', file=config)
> +
> +    # check if there are any git repos in the lock file that were not visited
> +    # in the previous loop, when the source replacement was created, and warn about it
> +    for lf_repo, found_in_src_uri in lockfile_git_repos.items():
> +        if not found_in_src_uri:
> +            bb.warn(f"{lf_repo} is present in lockfile, but not found in SRC_URI")
>   
> -    # There are patched files and so Cargo.lock should be modified but we use
> -    # --frozen so let's handle that modifications here.
> -    #
> -    # Note that a "better" (more elegant ?) would have been to use cargo update for
> -    # patched packages:
> -    #  cargo update --offline -p package_1 -p package_2
> -    # But this is not possible since it requires that cargo local git db
> -    # to be populated and this is not the case as we fetch git repo ourself.
> -
> -    lockfile_orig = lockfile + ".orig"
> -    if not os.path.exists(lockfile_orig):
> -        shutil.copy(lockfile, lockfile_orig)
> -
> -    newlines = []
> -    with open(lockfile_orig, "r") as f:
> -        for line in f.readlines():
> -            if not line.startswith("source = \"git"):
> -                newlines.append(line)
> -
> -    with open(lockfile, "w") as f:
> -        f.writelines(newlines)
>   }
> +
>   do_configure[postfuncs] += "cargo_common_do_patch_paths"
>   
>   do_compile:prepend () {
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224426): https://lists.openembedded.org/g/openembedded-core/message/224426
> Mute This Topic: https://lists.openembedded.org/mt/115578466/6374899
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [stefan.herbrechtsmeier-oss@weidmueller.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

