Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7903EC02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 12:36:06 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.45])
 by mx.groups.io with SMTP id smtpd.web11.15988.1736771762883434893
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 04:36:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=QGCVb1t6;
 spf=pass (domain: cherry.de, ip: 40.107.104.45, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kWnxYi8Sdqi0NWbNnsafyxXnwEulYAmMpnxDdRyxxdfv3lcsFCsVREkVPbABpFy/4SeiN34M4QPNuFVZbj9ySBln9eVSgiVwgVBA7sURonIrXQMBw27vzTFK/Z4Oa3E9GMjFyPz5c+PabQK4AwCVM/3znGdhUyQU1+0NbnGSk4LlCWPI3Oa89rT9N72HmUW+irre0Suhl20fTD/xcUY8/sQGJqPHKOCLRDCu0YJhw9FAhdS7KtGIobA2oiCVwxiHO9K9I3gdhXmTzn47cWXZDco3oz/Y2wxA0DhtBk/kV18+9/UBtQIPzJ8h2W4dcZw5uQwTs+c2zbV4iF6wMHVU4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xdD3Ep9OOMCbyuTxnpgMW1ArGb1+rhLKYEWSeSRS600=;
 b=XX0uEFTcC2cvY+fkafiICk5SeU7w3sTTyooFRHLXooMM2Q1rNcujPLbB130cQlnVIJiFO/N5o/uqWZud10ZoMLXBJPL1VFehM69wCXhj3edCwsN66RT1g5oeouI3FP7twcxlOLdfNAKna+8+tFI6Ttz4/3zqMl7a+9diPARGJpemovtqv+fMNEysCH8JbNNFvHVhSi5ahs8StpDUYpt2QKW2tbIOsO9dRauAXGTDkgXWXgpZgS0isdsg2lHWvkUe4ojZlcuYRJg4M0rAUFNHcMlHe46fA55mfJCb0uHOLxP+E1sdKL7TiA1Z0MbSCIzk75H/Z05xii/6nqQw2Ikkaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xdD3Ep9OOMCbyuTxnpgMW1ArGb1+rhLKYEWSeSRS600=;
 b=QGCVb1t6UCnGjyr+C01m26uDE59YzjdODl0C48QJ7SUPrW+ID1YQf2kV3RJM55ftTW4HdvpCN3uhATPyVKCRydlUKpk9GKjKD8jVOUefr+5KWmZtOwrJpbWC8LuTJlcnK9+K3AzDsVtOA20QFXzYY/WWuYn6H4od10s7cyKhX0k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA1PR04MB10986.eurprd04.prod.outlook.com (2603:10a6:102:489::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 12:35:58 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8335.015; Mon, 13 Jan 2025
 12:35:58 +0000
Message-ID: <3014df0c-b553-4366-851f-9f6118ba6489@cherry.de>
Date: Mon, 13 Jan 2025 13:35:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCHv3] classes/ptest-python-pytest: simplify python
 ptest file overriding
To: derek@asterius.io, openembedded-core@lists.openembedded.org
References: <20250110155929.3547418-1-derek@asterius.io>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250110155929.3547418-1-derek@asterius.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0224.eurprd07.prod.outlook.com
 (2603:10a6:802:58::27) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA1PR04MB10986:EE_
X-MS-Office365-Filtering-Correlation-Id: d307cb7c-4468-4478-d0ec-08dd33ced494
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SVJyZnNmcm5BM2RPaDlZL2UyTjd6eDhCcmxXVW81clpsM0JVRStvbFJqTTdh?=
 =?utf-8?B?YnJscDFhbldHV3pCREJKQncwYVhjR1EzU1hhQ3BtdklYbFZRNERscjlTWnNS?=
 =?utf-8?B?bjBnVFQwWUxTV0JQUXozdFpJYllHWWdzMXFiUElnbUQ4WlowQ0pCSjVaR1Bt?=
 =?utf-8?B?ZzNYNHgreWVLb2M4NDhKU2ZuQzBhM0s4WEh1NUxXV0VoRDdweS9qVS9XTUV0?=
 =?utf-8?B?SlJrMEE4ODFFY1dzL1cyNGtSUHVBcGVvVThoWk9EY3hqN3NYcmFlUVJsakVi?=
 =?utf-8?B?WnpMT3lxKy9uVFExOHA4aHN5WnNXcmdzNzdjZnhNQlhLSG5GSHFVSkFOc2xm?=
 =?utf-8?B?cU96RjBSb0hPMFkyUTA2QXYvZFVoR0pGR2hGTER1RythSHNHeHBpUnU3N3RO?=
 =?utf-8?B?amc5OFdoQXNXUXh5M0hIMzdIZ3BjenUxOFp4eG9XZlhkcEwxbWJuTk5qc3B1?=
 =?utf-8?B?YlQ2Kzg3UGZjcG50VllDNjdGUUZTTGR0OHRTQzJwMlFyVUROWVN1NDc3WGo2?=
 =?utf-8?B?YWV3ajhkNXVhTWVnNHR2Y2oxdWp1VUxwYmFCY3YvNzlvUHB1RlRRQnB4WElI?=
 =?utf-8?B?TS9Kb2JnMG02cEE2b2lNek9SSGF1K1JwY2RERnc1ajhVZ0JCYVR6eG9xM3A3?=
 =?utf-8?B?V3lvVVlBNjBjRkFJclBScnJMaExBM09CZEZBWDAyS1VJMHhNZGUrajNoVW91?=
 =?utf-8?B?REpGZDNMZzdYcXBFT0JQUkk0MUZzOTMzVVVtYVdyOTEzRDgxdmNuYlk0aTlw?=
 =?utf-8?B?cHV1UUN1NGNOYndKbmVzUE14STVqNW1sTnNSd1VoSERDRlZBQ3hWT3Q0VjRs?=
 =?utf-8?B?djMzeXU3d0tyRThYb2xhQUUzWUVDUFVtWUQrcUcrNUMyUjFzNEtOR1p1R3Nv?=
 =?utf-8?B?ZTBzL1NFWlFpVC9MMUdoMWlpWkhoZHB2K1FITUJvRTRpWlN1TStBd0pMMjJF?=
 =?utf-8?B?ZWJqUDRJc3J1dkFzK09BNXM0ZjMveDVIeUhVRmFEcHI0Z0FUTEtlRlllRmR0?=
 =?utf-8?B?MDNuR0gwVVVaUmZXN2czQVZkQ1lYTlEwTVJtWW8xc3hPUVlPeHhFTFBpKzVB?=
 =?utf-8?B?a1F1U1pZSm8zNC9Wb25CbUhGM1lzWVVrOGYwZlRxUDJOOElOR1luZ2xaVVFY?=
 =?utf-8?B?bHRvQ1ZVNExPckhmY1N3Ujl1UU5CMmhMMmpKUnh6cGxyVUd2V1k2ZUNZVUMx?=
 =?utf-8?B?U0VZTjNGdGdhV255azZzbzZ3eTNmOUI2SmR3RFZHSmdONzlYczR0VEt6OUFR?=
 =?utf-8?B?S05NZWMvYkVTUG9tV3FWQlByQXorUnB0b2lmQ0pCK291bktvbFFFckt4bENE?=
 =?utf-8?B?bkV0OTVwZjZsaGxCRTJVaXEvclJxOG9LTTNQUUFaVXJZWnpKNGdFTTZvVmJL?=
 =?utf-8?B?dCtSbFVkUk5NeExoKzN5VkxRVmtUZldvczhKYnZHblB5Q3hoL2RHbzNJbWc3?=
 =?utf-8?B?K1RPL1lQUi9hdTUwdzRuUDFWQ2ROUC9LdjY1d2c1VVZ0U0YrenBKZTBNNGVl?=
 =?utf-8?B?UDZ3bFdJcTA5RFhaeVgxQnlXZXpCSWJVVGRDZDFoNmp4TFB0LzlpTTh0UDh3?=
 =?utf-8?B?QkhXem1UZ2hEM1hJUmR3UFdOeEhOVTAvNTc0K1VVZ0NxS01sazNiSDgweXdE?=
 =?utf-8?B?cVRsbW8wYkZxeE1yeHZZTngydW1UZWRLQW9KVXpYbFdYQUg5NWdVR0Y4VWkx?=
 =?utf-8?B?a1hVVVd1OEFIL0k3cVR1VWdPdHNhdWNQdzZxWG1oWnl0QVQ0SWNuV2doT2VL?=
 =?utf-8?B?OFBQY3AxZ2hKSkw1bzNiYnJXd0VFSGkrcEoxbm9YcTNJcHNHZS81c1JydlJF?=
 =?utf-8?B?QVRqb2ducmk1Sml5TjVGUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dXBiZVA5YlFlY2NBVFV3SjJYNFhHd0s0R2krSVRCVVNpQld5c3VldnI3dVpC?=
 =?utf-8?B?MEkzdTZ2S2JuZmtCMjkzbE9tN01kbC9zZnNwM0U4Y0dxVHhHWmdIYmMzZ1B5?=
 =?utf-8?B?ZGFERjZuaTJ3MGQ3L1RPckMvbnBka0pwMUdxcldJRHZXb0J4T2hDWW1YYngz?=
 =?utf-8?B?YnY1VkYzT0dXSlVRSDZzd3NLMjdjUnhoR0NXNFpscGRjRHZPODF1VFZqYlBY?=
 =?utf-8?B?SDlBdkREN0p1UzNBUzhobWFpaldtSmoxRkN3dVVLRmp4RFJsVmN2TExIWlZz?=
 =?utf-8?B?K2RsUWt0K2tmbkI5THpGSFVPNTkyNDdHZ2lmR0JqTHdUL0FvWDFIVG5TNXUz?=
 =?utf-8?B?a0dwblRUNWhsQnBFUDdKWlVOeTZJS1hIYzhmU3dEWFFnT2JCRS83alhDNDhF?=
 =?utf-8?B?MXpQWmRRdVVGV2pqblR2bnF0cDRaeFdMdzlFaHpRaXEwWHpidUs3UnJ1dWNU?=
 =?utf-8?B?cWJ1MVRXRUNsV0krTHpWSXlOd0p5MFdpVE1McDI1cU5lZmMveFJqaWJxenNl?=
 =?utf-8?B?cXFXcVN3ZjEvWE9uSXpOMFpWRzBUS0YveTNGck9Ic0JmQUkyQVpBMlJCcUph?=
 =?utf-8?B?bVdPSElwRjRUNXQxYlpzSldSNTBtY3hVWWNoYTUwODJ2THhjVFNRY3JSTnZz?=
 =?utf-8?B?Qk1ubEtNeDVYMG9Bb1p4Q0xBUWpkMmtSL2dyQUw3aXh4dzdpbUI4clpuZktY?=
 =?utf-8?B?djkvUnRMcnRHVnhKN0x3UUJ3blhzcVJLWkF5a0xqMjJSUWQweEpOTXhvZmhH?=
 =?utf-8?B?NWRSMkhqWWxWUHhjd2hjVXBRa2pLWEw5bFREZDJFbnd1eVBnTmUxcDR1N05G?=
 =?utf-8?B?QkdsRStVcERnVzMzZ0lBQUtac1k1WFFzdGxDK3ZLOXdDbWJmL1NWVnFDQnBx?=
 =?utf-8?B?V2tmamtqUXZ4NVBOcUJnSnpLc25UcVZ4ZWZKZG1IdlFRdU1VbUMyUERUNEw3?=
 =?utf-8?B?aHZ2TnQ4ZWx5WmMrZ1I4R3M5Qllva0tiTThxbW5Eei9oNnZiTGExakhDdndE?=
 =?utf-8?B?UkRRWVdubW03VE1hRERCUGJXNkNSNnAvTmp6SjhyeEhyKy9MdmNiSFVqeldM?=
 =?utf-8?B?bEc0UXQ1ejlZN3pHYjNyOUR6MGhJaUNjRVkyeTU2NGhXWEY5VFdyQks0SW5j?=
 =?utf-8?B?MmZKakU0NjdRaGpoaVFZTDM5Y1VUVzA1akxpenA0b2xsOHA3REs0Uzlna3Qw?=
 =?utf-8?B?eU1ZUkVrME0ybnlzUlBDMGJ6WlV4YS8rcGVEc0JIVEVYNE9hVkIzZW5hZlMv?=
 =?utf-8?B?dlJRZkl3YjhHdU9FUXhEWXFhSHNtK000ZDNjNk1BYnpWV2xsNmtMZWdvYU9K?=
 =?utf-8?B?dVIrUUs5amFvYWkrUUtTZmFtZ0x2b0xVUUVWUXM2M1oxNW03YlVmNk52Vitm?=
 =?utf-8?B?WHFsMlVrTmVLL1U4OWE4K2RPbGpCS3lQK1BobWE1UHhLRWhqRGlwb0p2RWNQ?=
 =?utf-8?B?d2R4SWxmVWNXRnF4OFJwbTZPcnZKT0xob2hreU5JSEtEdmhnM3VSeUhKbVlQ?=
 =?utf-8?B?dFQvcFVFNnFtZndUK2creUVmQmkvUGZ2UjRUbW1sc1dEcWpJL2hMeUVYS25M?=
 =?utf-8?B?aDh2QWswaEU4Q2RDVkErNFV4cUFhd0tqd2lUcnVSTmRGc21iRDh6dlJoVk1Z?=
 =?utf-8?B?cHhpbjY3ZUxoN0VXWkRrVlIydzJ1dFF3blRlQURGb0F3RWlqVE9aUEFlb2po?=
 =?utf-8?B?djFFa2NyeFlnL3dzRWF3Ky9TbWdRUHlONkNDUmRNcmhGN05kck96aStrclNx?=
 =?utf-8?B?Um5Yd3YwQzVrWURkRlhaRk51MHdjckRMdU12KzBEdU5HVnl1T0UxZWoxb0do?=
 =?utf-8?B?SmV6MWZYdTRJVzEzQzh0VUljMnlSRmpENnZ0c1pkV3NsdUJ3a01GRjlwZjN6?=
 =?utf-8?B?TFM1T0QybzAyMmUwNXZsT0E4TTFMNExuVWNMYVlWc0g4MlJvUXkxUjk3V0J5?=
 =?utf-8?B?V0ZyNVV2cGVWSytCWmg4Y3A4N0UrbWR4eTlnRlZDT0tUYmY5ejVpSGlKdWpY?=
 =?utf-8?B?b3B6ZUZNTnhmb2d1RnJKTkY2OWE0YTlmV0MvL0V4bjVpeTZxSHUxRnBqWTAr?=
 =?utf-8?B?RklhMXRRZWNNcnFQL2pJeUNlcWZ5cytzL3B6ek1mRlJneHZjSElPUWhKb3BP?=
 =?utf-8?Q?kdTsogDG7KEJCetNf1xx26PGH?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d307cb7c-4468-4478-d0ec-08dd33ced494
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 12:35:58.2642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WJPCFf0zTH+LrFJ2ccv5TUE+z6eJ76oxP5fO3XIhQMsU3fevKAiu8W2z2hpF3N24mPR5lZVpRoc8/L6EfXVEbOCPTtmOcOZmIl+147v0JXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10986
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 12:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209718

Hi Derek,

On 1/10/25 4:59 PM, Derek Straka via lists.openembedded.org wrote:
> The complexity of overriding files from the bbclass made the behavior at
> times hard to follow and predict. This change replaces the default file with a
> heredoc equivalent that creates a default file if the user does not provide their
> own version of run-ptest in the SRC_URI.
> 
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>   .../ptest-python-pytest.bbclass               | 30 +++++++++++--------
>   meta/files/ptest-python-pytest/run-ptest      |  3 --
>   2 files changed, 18 insertions(+), 15 deletions(-)
>   delete mode 100755 meta/files/ptest-python-pytest/run-ptest
> 
> diff --git a/meta/classes-recipe/ptest-python-pytest.bbclass b/meta/classes-recipe/ptest-python-pytest.bbclass
> index 801079e6ab..0ece83dfc8 100644
> --- a/meta/classes-recipe/ptest-python-pytest.bbclass
> +++ b/meta/classes-recipe/ptest-python-pytest.bbclass
> @@ -6,24 +6,30 @@
>   
>   inherit ptest
>   
> -FILESEXTRAPATHS:prepend := "${COREBASE}/meta/files:"
> -
> -SRC_URI:append = "\
> -    file://ptest-python-pytest/run-ptest \
> -"
> -
>   # Overridable configuration for the directory within the source tree
>   # containing the pytest files
>   PTEST_PYTEST_DIR ?= "tests"
>   
>   do_install_ptest() {
> -	if [ ! -f ${D}${PTEST_PATH}/run-ptest ]; then
> -		install -m 0755 ${UNPACKDIR}/ptest-python-pytest/run-ptest ${D}${PTEST_PATH}
> +    # Check if the recipe provides its own version of run-ptest
> +    # If nothing exists in the SRC_URI, dynamically create a
> +    # run-test script of "last resort" that has the default
> +    # pytest behavior.
> +    #

Ah, this is a smart way to work around having to fiddle with 
FILESEXTRAPATHS!

> +    # Users can override this behavior by simply including a
> +    # custom script (run-ptest) in the source file list
> +	if [ ! -f "${UNPACKDIR}/run-ptest" ]; then

You should be able to check for the presence of 
${D}${PTEST_PATH}/run-ptest directly instead. Since 
do_install_ptest_base does install the file from UNPACKDIR in there. 
do_install_ptest is called only from within do_install_ptest_base which 
always cleans ${D}${PTEST_PATH} (via the cleandirs varflag for the task).

The benefit is that we wouldn't need to rely on the file being installed 
via SRC_URI file:// and could be part of a tarball/git archive (maybe it 
works already today, I haven't tested).

Also, it probably works better wrt 
https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/ptest.bbclass#n60 
which calls make to install ptest into ${D}${PTEST_PATH} which wouldn't 
be handled by this check.

> +		cat > ${D}${PTEST_PATH}/run-ptest << EOF
> +#!/bin/sh
> +pytest --automake
> +EOF
> +		# Ensure the newly created script has the execute bit set
> +		chmod 755 ${D}${PTEST_PATH}/run-ptest
> +	fi


> +	if [ -d "${S}/${PTEST_PYTEST_DIR}" ]; then
> +		install -d ${D}${PTEST_PATH}/${PTEST_PYTEST_DIR}
> +		cp -rf ${S}/${PTEST_PYTEST_DIR}/* ${D}${PTEST_PATH}/${PTEST_PYTEST_DIR}/
>   	fi
> -    if [ -d "${S}/${PTEST_PYTEST_DIR}" ]; then
> -        install -d ${D}${PTEST_PATH}/${PTEST_PYTEST_DIR}
> -        cp -rf ${S}/${PTEST_PYTEST_DIR}/* ${D}${PTEST_PATH}/${PTEST_PYTEST_DIR}/
> -    fi

The indentation seems odd though?

>   }
>   
>   FILES:${PN}-ptest:prepend = "${PTEST_PATH}/*"

This line can be removed (in a separate patch) as it's already there, 
coming from the ptest.bbclass, c.f. 
https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/ptest.bbclass#n19

Cheers,
Quentin

