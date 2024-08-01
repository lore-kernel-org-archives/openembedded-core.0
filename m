Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23560C52D54
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 13:02:17 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.74])
 by mx.groups.io with SMTP id smtpd.web11.67547.1722517330336213596
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 06:02:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=l0HYKxVM;
 spf=pass (domain: cherry.de, ip: 40.107.21.74, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ROFZwF+ayI5ayWv4LAAoJ72gGVTvDeAhyjmE7wpkuGhIqtKqXKGah5wDVS/EOq66P/3o8wAAB5+dj3soQtNiOEGB/CJagi952HZ1xddso1aBtE6k6+TG8XQieh/DA4imU54c2nEy0crLEZOynSdJO/JJU3tH/9MHtaPjRhpTKUu31qpNUi0l6r6u559zsNn5UkALqaq7T2iohM5g0R25Pdd1rzKYBR3Donr+P0GVoArG754a6jLG4ECZh6u0oL8ArsPXKOLLSmSL6MSZmJsW3R/O90+dJV06V1gY2zxPeavta+feNxIpHas+ejr8MNRh1WEFrv3154bhVuJ6I1iwuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ZvPjjT/oP3U8emCAsJHpKrw6fV0LPX7sEvgqBikD2s=;
 b=H+9KYRzVeAKv28/iBR4JFmPFVxTArBEOcqA02OEFxWUR9NsXroKdNANElLVoVVPemACOwPOSFkMmBngsfb8BuNsccnkoJpKR7zYki805F7zu5GM7HByGc7uJgt/dx1pdfP/GEGHhQfUDW4FWyufxOQQ9CbRYetitM6tDx2Lp0H2L0Wx2vSMNP0V7N1t6V6uVZeNeptYsYp1a52FD/2bZ/3E8a5JZKH1E06kVncuaN0+jfv9xC2Qx77DDIwp0yVTP39rAbym/RujEmdVdqwBFLKZxLQEtGy5W8DcPXRYKnwnbsFjlxvkzA4ZVFKV0LShL8KDC6hEL7CHhu4m3Ujfz5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ZvPjjT/oP3U8emCAsJHpKrw6fV0LPX7sEvgqBikD2s=;
 b=l0HYKxVMJg7NEFm3zwZNYe7HqAVD5k2a1g0wPhi+cznK7u9NLC+SplZN2/YDyEUxgmb3eSZ2RkTA/Ff3C4v+2M2/Fw/OUuqT4WWJYTpnFKq+NCkJQV8Vj+hh1lORYMk5fIwpBE/2z1rWurN2KDHOwxHrcv65/tqIXxoZsALO7NQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU4PR04MB10484.eurprd04.prod.outlook.com (2603:10a6:10:564::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 13:01:59 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.7784.020; Thu, 1 Aug 2024
 13:01:59 +0000
Message-ID: <fce52f6c-d4cd-4750-ba64-152cc540bd56@cherry.de>
Date: Thu, 1 Aug 2024 15:01:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-Core][scarthgap][PATCH] rust: Add new varaible
 RUST_ENABLE_EXTRA_TOOLS
To: ranjitsinh.rathod@kpit.com, openembedded-core@lists.openembedded.org
References: <20240801125441.16164-1-ranjitsinh.rathod@kpit.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240801125441.16164-1-ranjitsinh.rathod@kpit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0021.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:15::7) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU4PR04MB10484:EE_
X-MS-Office365-Filtering-Correlation-Id: 140d4b97-c395-476e-a9e7-08dcb22a2116
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UStyQ2ZwRk9ZOGlTMDVZTGFvTmRWNW0wOXJxTzBmMTM4RytzbHE0djEvQTBj?=
 =?utf-8?B?cXdIaEVBOStKMkt4N0pvRXR5bHh3ZUdTeHBYRTJiZkVLRDJyYk0yZzgyVHNK?=
 =?utf-8?B?Y0E4WmxqVElkQ0hLd1d0V3ROMUJnTVdFRGo1cE1GUm9JNk1kbnhkaThaQ2JZ?=
 =?utf-8?B?WENQQXd6aDJrZ0dLaUphRjdHb1cxeldjY1VKRUFjY3FiakhSbkhsTU5mZEtM?=
 =?utf-8?B?dGVubk1QZkl3aS9CQkpqZnc3UnNRdkF2TFhZVlVQeHVJOVRQaTgrTnBYR3FG?=
 =?utf-8?B?Y3hRU3plVld3a3A4dlJ0THJDL0YzUTl5ck51QVlHMTVEdFVRRTcwSllhc3g2?=
 =?utf-8?B?V3dpYlhhSVhjUktMb1M5bUFwR21PeFVYYUNCc2NVSXptWkR3ajcrT0RhWnJ2?=
 =?utf-8?B?VjdnY1pEaFRVa2dqWW14VkFXWVRTY2pFSUZNRUZjTEwxQkR1UStjclVZYU0r?=
 =?utf-8?B?YUtvMnBTMWFITGdVZEgvaitoMGdHN0dzaEhtR050S2o5a1ViUVNCNHY4R2Nt?=
 =?utf-8?B?VVY0QklPUkcrSCs3R1lhZ2ZObG0rZTVVcmNPdHRPR25Lc21YL3Z5MlRWRUx4?=
 =?utf-8?B?SHUyQTY3cWZjZWx4TXFVOG5VUGh4aUszdHBFVHdHNzZpMVErUjNNd2dVWTlh?=
 =?utf-8?B?ejZPdnljZ2w1ZnZKOUFtZWVGenRQSitjK0UvaDN0TitzeXhrUHp3aDFYWDM1?=
 =?utf-8?B?Sm51bDdMVFY4VExkYi95ZXpHWFlZU3l2blkyOEhJMUpxbmVLTS8zampRaW45?=
 =?utf-8?B?T05jWHA0RjBrSyt2OFNhbmt5Sk9ocGhrQ1REUVRCVDAwbmdiTUZjQzdLQkVG?=
 =?utf-8?B?ZEcrdXdxN05GNmRnU1lMQ2RhUnJDQ094OHlwRDEvOWN0b1pOcWFud1Jhdzdm?=
 =?utf-8?B?VHlwcGtFb0VMQUt5WStxa1JGaVAxd1QrdHRnbU1OK0xyblorRnFKM1UzcDNG?=
 =?utf-8?B?VUVzQjNjNWhEbzdVWGxrYXdURWREQWZOT1prWFZPTEFKbysvRzdySEFoeGdu?=
 =?utf-8?B?aEZhaVdMVVk5MWhMUVFVV1pmUXhTYjRsMUFwdTA0bkhFVmdkNENEbHFCVktt?=
 =?utf-8?B?OVVOVkt4ckNOTTZYUzl1dVZ3YTNWRmJKYWlyRXdCY3V1VHlwOHJoSzZrUHoz?=
 =?utf-8?B?dEVyRlUzSkhwMVNXMHFMWWYyUVpTdFVnUm9VMnJkN24xM3FtZTNsNnBTTzJ3?=
 =?utf-8?B?MkhJcndYSnUra2M3di9SZEFKQUtiaEtBajMzWDlhY1IyQ3lNbW13MitjMXNV?=
 =?utf-8?B?RFRweU44T0ljUEZoV3R2Qmd2Y1VjbGRyRzhLeDltODBLL2dpVTl6a2orMlQr?=
 =?utf-8?B?bDNCVnlqL2VvNnovMGFrTWg3bzZRVW1meSt2QTJzN3lrTk1yRlVHVzV6Y2RP?=
 =?utf-8?B?Mk0zWVlwMWFYcmsvNWM1dS9tSVVjd0FUOXAvNEsrODFETVpJMzFONGk4YXo0?=
 =?utf-8?B?ZzJjenFzWVlOYUkxcC84Mm9BOE5BQlJqWGxXVTBJZXRwS2lVbnhGb1NXTE0y?=
 =?utf-8?B?Q2YzRFp0VHk4MkN0alROR2p0a3I1YzNEQWFDU3RLMFFqN2wzUEZseHI0Ulpr?=
 =?utf-8?B?and4YU9zRStudSs5MnNLNk4wY1pEUDIwWHpwVGNMVXVOUVJvLzg2Y09wTzJ2?=
 =?utf-8?B?S0w3VVljWEt2QjBjb05KYmwwanBiYWdwYWxFL0QyM3ZsazNpU2FhWFY1SXRD?=
 =?utf-8?B?cGJhL0NlQ3orRUpCQU5GYjR1SXg0TUxXRGJCVWc0Mk05Qlp4YnozNUZsbkRC?=
 =?utf-8?Q?387hHPvSh+VybiCf4E=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SzZwTTg5bXhJTEY4ZS94VkVuaWRvWXFkMm9kNzlZL0p5b3V5TGFSZTZuSG55?=
 =?utf-8?B?L0pSVjlERXZyUWZQdHVLZzB1MFZ5RERhZmFyUjI0ekg0bmIyVjRGVnJBcnVL?=
 =?utf-8?B?M1hCaVErVzBkODlXdGd3eHAxb0V0WDd6Sy9rdzRQa3hWWDRCTmtCQWZTTGNG?=
 =?utf-8?B?dE4rdDZoRitqeGdDQkpQSVNrWE1LTnpROXlvczZnRU14bGdxdDBQakFQMjdP?=
 =?utf-8?B?eXljN3cvZFdSSzNkM3NDSzJYeDF5VWxkUmxja1BJMUNDRzFBTUtuWC85aVZS?=
 =?utf-8?B?NzZTQkgxYUFaekUyYnQ4UXh3eWlrcUkrTkRPbHhldGpIQVRrZHFhOU5jR0VJ?=
 =?utf-8?B?TEZUdjYzLzVFTWhia3RwdW1iV1ljSHJidTg1cnFHOVROQ3dhUzNQRThGdVhu?=
 =?utf-8?B?SnZaUC9YS2V3Tm1HTGp2TDZHblJLUWVzZE9ENUJYUERiNnBrbUhISzlBd0Jm?=
 =?utf-8?B?WVRRYlBrT3haekswanlxTXJXWk1qN1VUL0dva2ZsTWlLQTV6bmVtUFk5K3lK?=
 =?utf-8?B?Rzkvb0wxdEtNSTcra3h6eWtJSlR6NURCaUZZL1ZyTDZKQ0lpOHBaREVuVGg1?=
 =?utf-8?B?eHdjQWxITjROUlg1REFKbUloaXpXNVh1WjZOL1hWK3FnanlmTjJBQlZOSWEx?=
 =?utf-8?B?UEkyQVE4dUVGNTM3MnZrVFN0VElqRjZGS1R3c0xoaUZHVXh3UU80Tm1tR1Rs?=
 =?utf-8?B?a1dMZUdFNXlLVnowT0EyL0REQ3psV0hCd1ZlRWVxZk5JRHlUNzRiMFZqUGZM?=
 =?utf-8?B?WGg2ZmZoeWh1dHJycHEra3gwUmdOTmxkcmo5Si83ZTkxaGlOUHdveDBPUVlE?=
 =?utf-8?B?SnNQN2YvS2xwbG9XN0d5dEJJd2dabnBnVjdqN2xUaU4vcGdmUmRaTzN3NTB2?=
 =?utf-8?B?WjMvbFEzZjZVZThIVm45NzMyWFFVYzcyZnlnRFJnTzJxZHVnL1dPV2xPWmFs?=
 =?utf-8?B?eklheGw3d0czOU4zQXVkbEw5QkwrSDBsdWxlTXlkZFV4QThlVC93Sm1PaDJR?=
 =?utf-8?B?V01QdysrbXlqWlVKVkpLbWl5cm1aR24yNlh1UFpNMmlSb2JGL3FkYWpDbjlL?=
 =?utf-8?B?Wm1GY3czWjhNQ1h5RWZoRVc2aHZJbnJwa0s4QTNWNEh1aTh4a2VwVUl0cGpW?=
 =?utf-8?B?WHp3T1E3NDhiQjBZYXVQOVlVVTlmUVhRWS93OWJENmluRUpIbDBEcTNCQ1dC?=
 =?utf-8?B?SkdEWEM4NzBYM0J1a1N1NFhGZHcveGthQ0pBdW9lMzBBMEZVS25KYmxEMDRC?=
 =?utf-8?B?eDd1cHBDYVZGbE4wRXRuVWQvRHdZaTEweldoTFM5UE9qSUlDeDBwS1A5ZkxO?=
 =?utf-8?B?cUNRa3R1ZEIrb2dPeldZNFRRZUFENEhvL3pXZVVsd20zZTV2U3FlY0psUHFl?=
 =?utf-8?B?dXBVYzd1TDBxV3lGNW0ydmZVcE5tenV4VXE5QmNVblBoMisraFdQc1FvYkph?=
 =?utf-8?B?ZVUxQ3VaTmtCbUxxdWtHNk9yRy9NNXkzMXdzMDBvZDV3Qm91WkhNNTN1N25R?=
 =?utf-8?B?QWttcHRuSDkyVStHUlVXWDl2U0t1NFQxempQTDIrM0psN0I4YUZBaUZPbE5k?=
 =?utf-8?B?dndueFptYkQ5N2F3ZWJncUkxVkRZMzd2YkdFeDMwSGh4NjFiWnJtNFJ4b1BB?=
 =?utf-8?B?bm80ZW10b0xyYXhmVjAwWGhXM2ZIdmZ1Tk56UktIcGh3WWR4VWh4akNCeVhx?=
 =?utf-8?B?c2RuczBybW9reGtBZXRSakZFUVRLdHNaR3RXNHdSUEI1SWxYejBzWGlRTFky?=
 =?utf-8?B?amlRSE40UnhsMFdVU1h4bklrdS9GWmdpWm03dmMvR3pxb2h0ZE1UOW5ZN01h?=
 =?utf-8?B?L0kzQXhFalMyam5mTjZDOUluQzRydTdZTlhsa2k1U1lza05RUGtpQnFtTFJn?=
 =?utf-8?B?bUYyUjFORnJJMlRMall1MDE1MzZFdkJMR0VUSWFSNGdMbUNqMFF2NXlWdTZu?=
 =?utf-8?B?WWN5R2ZWNkNWbXB4V1c3T2RSYUdlU1cyOFZaZ2VZRGtDN252QWhCMDhkOEgx?=
 =?utf-8?B?cldLcXh5aVloaG9aaHFzYjdZWENYSDhRTGlMZVlVU1pJUWo1UTY4Y2lFZHhV?=
 =?utf-8?B?Qnk4dzQrdmhWM2k0dGFEQmJGVWtZNGFoT1BQYUdkZGJDSjZUUzVFSUJERktK?=
 =?utf-8?B?YXBkWGYwOG5ER3dCUkNOYjgxaFZ2VmkyTmZYR2E5SUVhRUpHVUF1VE1mMWxx?=
 =?utf-8?B?RVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 140d4b97-c395-476e-a9e7-08dcb22a2116
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 13:01:59.4156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nG3ZttVCkO+HRIQejsNU5XlNqdKVDHQLHyTO5eeP18EyAbUHYGzNl4t3LXahdpbeND9ha0uSEeVN7RL1LTP+BHzwMDCZ2bbuxJbXlKxhl/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10484
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 13:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202731

Hi Ranjitsinh,

Is this not compatible with master? If so, why? If not, please send the 
patch for the master branch (just remove the [scarthgap] prefix) first, 
then we can backport it to still-maintained branches once merged in master.

The rule is basically: master first then backport or master not 
compatible thus only impacted branches.

Cheers,
Quentin

On 8/1/24 2:54 PM, Ranjitsinh Rathod via lists.openembedded.org wrote:
> [You don't often get email from ranjitsinh.rathod=kpit.com@lists.openembedded.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> There is a need to enable some extra tools from the rust for the build
> and so this new variable will help for that
> 
> This varaible then we can use during do_configure task to add overall
> values as per json format in build -> tools
> 
> Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> ---
>   meta/recipes-devtools/rust/rust_1.75.0.bb | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/rust/rust_1.75.0.bb b/meta/recipes-devtools/rust/rust_1.75.0.bb
> index 76e1fe2d84..c33f31d261 100644
> --- a/meta/recipes-devtools/rust/rust_1.75.0.bb
> +++ b/meta/recipes-devtools/rust/rust_1.75.0.bb
> @@ -70,6 +70,10 @@ addtask do_test_compile after do_configure do_rust_gen_targets
>   do_rust_setup_snapshot[dirs] += "${WORKDIR}/rust-snapshot"
>   do_rust_setup_snapshot[vardepsexclude] += "UNINATIVE_LOADER"
> 
> +# there is a need to enable some more rust tools for the project
> +# We can extend a list of more tools via this variable
> +RUST_ENABLE_EXTRA_TOOLS ?= "rust-demangler"
> +
>   python do_configure() {
>       import json
>       import configparser
> @@ -141,7 +145,7 @@ python do_configure() {
>       config.add_section("build")
>       config.set("build", "submodules", e(False))
>       config.set("build", "docs", e(False))
> -    config.set("build", "tools", ["rust-demangler",])
> +    config.set("build", "tools", e(d.getVar("RUST_ENABLE_EXTRA_TOOLS").split()))
> 
>       rustc = d.expand("${WORKDIR}/rust-snapshot/bin/rustc")
>       config.set("build", "rustc", e(rustc))
> --
> 2.25.1
> 
> This message contains information that may be privileged or confidential and is the property of the KPIT Technologies Ltd. It is intended only for the person to whom it is addressed. If you are not the intended recipient, you are not authorized to read, print, retain copy, disseminate, distribute, or use this message or any part thereof. If you receive this message in error, please notify the sender immediately and delete all copies of this message. KPIT Technologies Ltd. does not accept any liability for virus infected mails.
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202730): https://lists.openembedded.org/g/openembedded-core/message/202730
> Mute This Topic: https://lists.openembedded.org/mt/107665271/6293953
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [quentin.schulz@cherry.de]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

