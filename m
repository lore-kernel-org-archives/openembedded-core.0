Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F0CE77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 11:09:53 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.88])
 by mx.groups.io with SMTP id smtpd.web10.127002.1734606575355026441
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 03:09:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=kdleXO76;
 spf=pass (domain: cherry.de, ip: 40.107.104.88, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uBpxgztT2MFIpKXPrpj57hd/c58hQjRxeVmqfEOkShIQxB7lhaJb6bxEPa0XeBADJdqLWrrxlRd3bG+DjHx6AS/MHcMPphLJfeooAHM92zQehJTobN5QPh6dshZkelYcOObeW6AN4JGyvIBBgHbUcLA+xe9wcy6VCG9xWH12jjZ2TEleQuhpJx5w6K8y8ruhFkyRDNxxg5o/us4+jS6i7enwPETDJXsKYEettoGI6dpHgJXIyDAqGR7km9t3cTjopgip/4j5egXnzxN0KuNZMo1+jxlzNWIT30oExMwyS2qqWfPwZ02BGr5x1yJr/IVRft96TqClVGjKZ/NXbf7S0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ewDmwM2rlvSlTMcCmz3kn40mX/vnzEQCOrd+lGauQKs=;
 b=RuU8Uf+QyuR+ONa/zOx4ZIbtUCTYqowiHcn82rmN+vq0tIMvBmmjqwLOjXPHh/jkHr8PfWjwZDCO9gtzZzvxBznp6IRFcNet3wNp5kyLX2euscFELJcuX2c+h5WDyA0pmAU1+JFZokUlDUfqWxPbQTHG/kZwfMcBmpf71bijxHghVeoKIDVeiRhKQD426jeuo3f0A2/EATS5EvkhglAgcK3Iku/YBouhXWf8OIkFb8RkZcyCS71D5eimYNnAh2DCkyKc7QPgZ/VE0D4gND7SQHnxIRB6+80s+DPzW/MIWiHYI15R4wZnnBQmML3BBLmpI4seYAgZ21QWEP4IxNvKxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ewDmwM2rlvSlTMcCmz3kn40mX/vnzEQCOrd+lGauQKs=;
 b=kdleXO76kbtAv+vbNgYa8JydHQbC8qZ4L1ofYeqbhdJCgb4xd6OGbwSPJwTctIKes/PqDNzVD/j58e8rhon1eBzk26CxQaLuxonGqqZ9Ni3TUnaAZbF7+hRz9KyIMDvikVy1+CADId2j3/jHqx37iGSIezLojcmhRnMzL0prEVM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM7PR04MB6983.eurprd04.prod.outlook.com (2603:10a6:20b:102::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.19; Thu, 19 Dec
 2024 11:09:32 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 11:09:31 +0000
Message-ID: <1ca6a9db-3832-454e-90c3-f4e1fe638289@cherry.de>
Date: Thu, 19 Dec 2024 12:09:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCHv3 1/2] classes/ptest-python-pytest: add a new
 class to consolidate pytest ptest functionality
To: derek@asterius.io, openembedded-core@lists.openembedded.org
References: <20241218180548.3539070-1-derek@asterius.io>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241218180548.3539070-1-derek@asterius.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0043.eurprd04.prod.outlook.com
 (2603:10a6:802:2::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM7PR04MB6983:EE_
X-MS-Office365-Filtering-Correlation-Id: 648f0d28-8f2c-461a-4617-08dd201d9d17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OEN5WUlyK2x4MWMvejNEbUJQOGxaVDcxZnRWanpKcUt4N0dsankyVlBLN25t?=
 =?utf-8?B?bmYxb1RLT0sxTXVmS1JFcytaaW9oTDhGcElQVUJldTJnVjZsUE5aYm5McnNB?=
 =?utf-8?B?bWxPbEs5STQ5R3p0WkVqaGVxNEF5RnJOa2pCZjVUUHljYkp2K3lpSE0wd042?=
 =?utf-8?B?RDY1a0pLd0QwblVLZ0Z1cW9ReHdKM3NqSmZ1OENVNXNNblQwMnFqeVI5WU9V?=
 =?utf-8?B?NkUrZXg0VmpTUGxmSEhKYy9YY3BueUVIelk0dHBkUko2b2RtWkErbThVV1h0?=
 =?utf-8?B?RytTTmNXUGZ6OXplTVhNdTlwOVUzMnBRVTB4RkM2MnlVNEJtYmFjaURISENR?=
 =?utf-8?B?cDB4ZytMalFKdnJTcDkxYnBJcHZhcW5reVFmeVczeUxoQnNQM1lwek55YW5S?=
 =?utf-8?B?Skk1a0N6cGhjT0Z4aWNPZi9temxQRjhhNHkzVnk0Wm43ems2UUxoVHRNbXBY?=
 =?utf-8?B?d3dhV2tFTy83eTc1Vms5ZFlhbmFXSENPK2lORXRxeDVxYnU5UzZKODFLYnB0?=
 =?utf-8?B?UERjSVZwbXlYZ1BIZ2Z5SDM2VS80aXN5cERuMFowTlZaUWVrcy9wVVBlRmZj?=
 =?utf-8?B?dlJ6MGxld3gvUFpIOFJtYlZxM1JBdkdYUTVZYmtkdTBzUmRYZ0lMR1d3OFMx?=
 =?utf-8?B?NHp4R0xtbTV6bzhaWngxRW1XamxRbEloeEhpWHhwNWQ5emptZWJNWGVYVjVB?=
 =?utf-8?B?d0x1aUp5Rk1iU3BCYS9LQnNsa0V2NldmdDhlRklNOTdHelRONzlYT3NET2l1?=
 =?utf-8?B?OHd6WGhmcjNBWGYxWW40N0lFZ3JGbHpCV3kybHJYSnJtbEJoRzE4Y1Z1WUNh?=
 =?utf-8?B?eGh2RE5mWDVacUNzS3FPQTdJOXNFU0MyVzBNVXF4eGJtMENsVjVVRFpiNWZB?=
 =?utf-8?B?T1IzK3BFUnkwQ3hxOXMwYlNROUFZT2Qva0hYeTBaSG9aOVJSVldwTGxyY1Ay?=
 =?utf-8?B?UVJuNGRhODBjdTFJZm9jYi9DUHVPUlJKSGNXd2NzWTdQYnVMK284QkpzY1VK?=
 =?utf-8?B?NjExeWFLWERpWkRLS2pJbFhQdXZmVmoxZTFTcFFVVEd4Z2hzSDlLQ21vZXd5?=
 =?utf-8?B?dXc1b201MS9QaWt1WWpvbTArRDYvUjRKOHNPYVlQeE9hK2gyanFkbmdvak5G?=
 =?utf-8?B?UWVmRTY0NGo0YTVMRUFVQ3plOTRzSGJvUVR0cjcwaFdYa2ptZjNKY3R6VWFw?=
 =?utf-8?B?N3ZDWk5laDRIVHhyRVJpZHJQcXhIamoxMkRrTTlUQzh6Zkd5cjRDWDNudkUr?=
 =?utf-8?B?bU9IR0N4SlJRQzF3ODVTVzR1NVVOalJ3UUZ4K2hOOXBUV3RHYjIrWmNQSW1J?=
 =?utf-8?B?SGRrL21ZbU9mdTV0VTFqemp5QW1Pb2MvZlpaZXl5RERHb1dWcy9EL2IyODMy?=
 =?utf-8?B?R3I5d09IZFdUT0FCZFdNSXA3cXdVQlVRVFpySGpCby82VXJodEQxWGcwcnRh?=
 =?utf-8?B?eHAvVTdFQTRKekdSUWdJZXRESEk5eUFsN0MxNnJUYjRqOFVPRXJuWlVpa0Fx?=
 =?utf-8?B?RTVmdzZ1U1U0ZFk5elVKUVc4dW5nSTU4NTJIQlZ2M0ppZmpXbytYQWNjTGtL?=
 =?utf-8?B?S1hFUXZtSWpzZHQ5U0JVOWZveDhNMHhaNCs0RXFCQXQxR29DQVN4NmhEM3BB?=
 =?utf-8?B?WitBRGlMdXZJTFJDb0lvVlBjeTlkQ2ZrOEdpb25wamVYNmpiMkFzWXNibzN5?=
 =?utf-8?B?YndVUGgzaG5hK1luekRtSy9LRDEzeDNXb1VLbzZKMkVZbE51T3J4QVZGdExG?=
 =?utf-8?B?QlZ3Qk4wZnNYWVpoa2RVUzFVRHhkakpGbmkzOHh3Y2lDRlJWWHZEUTlGMDdE?=
 =?utf-8?B?a2NWdkVXT3BETlJhOFo0ajZVbVZZbHA2OVJDQnU4WHBXM3hhMThvQ3dmcHJk?=
 =?utf-8?Q?1p1aCAfmzgIny?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eUp6VkdkT0VSOFVBMTFVVjJZUE1ueVFpWGNsYkVQcEtqdEh3emc3S2t0WkhE?=
 =?utf-8?B?Vmk1Q1R6WDN0Zng3dmFFVWNyc2lpenV0ck9uQmRVWkJJa081Y3QyN3NlSCt6?=
 =?utf-8?B?UGtIUVB2VS85Y0dKWWxjcUlLNXZzNGhUYjRBQlVqR2VqNmYzNzNPYjZFZWxu?=
 =?utf-8?B?dTdOUWQ3T3NHalJVOGptYzZ6aXFmUGNidTJnait4NnZhUXdlekxRNURPbUpQ?=
 =?utf-8?B?T0k1U0RiMk9XdlBRck1zTUo0OVZhdGVmOVhVSGdyQ2VGeXlDekNuSkF3Ulkx?=
 =?utf-8?B?QTFkK0FtL0UxYy90V2ZPZGw0VlZVUXlFWE44STBBL0ZEK1NmaXg0YlFnOTZ0?=
 =?utf-8?B?K1NVd2hTWVhjVU1ITFh2K01EVzBFVjhEY1hYM1gwcWpWY1BsSll0THNsNVA2?=
 =?utf-8?B?TTBqUFN6Y1RQcldrTis0MW96UnJjZlRaOTBHRDZpQThaMlBJRU9YM293dCsz?=
 =?utf-8?B?NnZzSW1ROGVlazgxMXZWOW9XeXdHdVV0MDl6d0FKelM5Y3JHSUlLTkEyR0lT?=
 =?utf-8?B?Vk9lVlZwV0REY1hsZVVSVXE4OUN2dmtaZmdNNlhtMXNoc2kxT0swTEFYd2Jl?=
 =?utf-8?B?aTZoa2hMbFE4bTRzTnA2NjUrdGMyTTRGSysybU1xNzNHVlNLRnpyQ1lXYmQ0?=
 =?utf-8?B?Nk5MNzhXRW9Jdkx4bnVDcnordmpWSCtncjViQVV4andqbnBKK3FIWjNOd0hF?=
 =?utf-8?B?UnowM0VQbmtBbzlrVUhXMTJiTWdhVmpjampKQTBSQ1RFRnJOb1VsQ2YvRi9V?=
 =?utf-8?B?RGRWTENRQ1UvYWJKdlFPaGtGbWJNaGpkZ3BrUFFMWWw0S3lDeHhXN0NoWG41?=
 =?utf-8?B?Rk8yaWlVKzRqeGdyYkg4SkQrOEhNMm5nWCtuRWVsSGI4UDVqUWRCMFVPMnRG?=
 =?utf-8?B?aGM3eE05V3Q1VXk2aDhwUGcyQ0ZjVlloRlU5cVBoZUNBMEpTdCtRZ3dHaUho?=
 =?utf-8?B?NkxkSytrcXhYN0xVUy9ENGl1dU4wd0EvNDQ5VjJBQVZkZHFKWi9kbFh1bkYv?=
 =?utf-8?B?RDN0VE1RcG1ObzBwOXltY3N0SFRXYjdwZyttTElBMk1GRjdDUTU1T2NudUFw?=
 =?utf-8?B?dG5sc0ZsdTR6K3ord1JXeHNYblkvQ3lwQXhWcTY2SzhIOUpIK2tNWFZMd1BO?=
 =?utf-8?B?V0JNQXNpT2xwRG5oVW1EL01jdXczOGpicGpIdXZRUEdhLzdXc3lNZWNWZFRJ?=
 =?utf-8?B?dkhtYkRmMWdJWE1LL05raE8xVnZpeDVsQnFXYzQ2L0MzTW44bjQxVXhsdjRQ?=
 =?utf-8?B?aVRkQUgzQTd4TWN2L0UrRGREL2t0aTZGd25WY2FLMnZtRFZTRy9nQ1AxTklI?=
 =?utf-8?B?T0FSLzZpbW9IdXZzQkU4RHZBTU9RVzFGNElsYldLM0FIeDlqNzkzNFl4VmZj?=
 =?utf-8?B?NksvYklQcnh0WnU5YmkzOTJqcnZ4NytRQVhzcXlPNStPYk9kaDVEVUpXQUdI?=
 =?utf-8?B?Y01xVjhJNnBpRzE3MEJpRWZIS01Md0QwTU5Td3d6WFBqTDRMcWtyY1dQOEV4?=
 =?utf-8?B?aVhnMTdEcjc3by9GZkIzczdEMElwTUxMTFdkUjBhRkduME5nM1MrcHZMMm15?=
 =?utf-8?B?a3ZxOWhRb1krMlVGS01BYlpSNFp6K1poZmxVMldISzdOc1cweGk1OFhsMUhN?=
 =?utf-8?B?UnlJQWd5Q0Y4ZVA4OFQ3UWlKdFRvMnZzNThRWFVtMzVueEFFK2RBNnJlUVph?=
 =?utf-8?B?cGx3YkJLVjV3N24reWFpM2phVWFWVzJrNGpzZHczd2J6YW5VdzFnTnV0a2kr?=
 =?utf-8?B?SEpwL01pRFc3RjllV2hHQ0cxcnpGck5wUjBHTk9qWWUxd2pQaWFVSWw4VG13?=
 =?utf-8?B?MjN5MDd3akZ0eVJIaVErbTRNQnBWdXRwcnd0b2lVOU5KdWRqZHIrc3JoUUJx?=
 =?utf-8?B?T0xmTzJGakpLVXBWcUtZZ2g1bWhVTWNQV1htZFA3amlXTmdxME9OZ01RMjNp?=
 =?utf-8?B?QlBaREpSa24waVhtSUQ5WG1IeVNLamNoMkN2aHk2WEg3NHdsdmp4YUNBeWps?=
 =?utf-8?B?dG9TMmhlc0xESTNjRVhxaU1YM1RlelVVQmtYZW8vQm1TQ00yWlNkcnhsTUxt?=
 =?utf-8?B?REhycVhIcGFvS2NoSVBJR0RYTk9ndm52VThwc3M3VnkwbS9tV3oyTkhCZ3pu?=
 =?utf-8?B?Rk8xcmYvYXZ2dGVYVTFrTVIzRTAxbTJBeTVOS2xieUQ2dko5UmY5eC9yNE1G?=
 =?utf-8?Q?6Ip4Z6U/TxymF2lp8xC8zvQ=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 648f0d28-8f2c-461a-4617-08dd201d9d17
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 11:09:31.9402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xSpeSKdLQ882pDt5JEH1781vf3QMr/anYLVrXi3IAznQudJRLfC44mdDy8xta++PEcaVpT5vCp5Hl9+lP2TRazjNYG5eMJX6HE1WlPg798U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6983
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 11:09:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208904

Hi Derek,

On 12/18/24 7:05 PM, Derek Straka via lists.openembedded.org wrote:
> A large number of python packages leverage the pytest unit test
> framework for their ptest functionality.  Currently, many of the tests
> have duplicate code for:
>      1. Installing pytest files
>      2. Declaring ptest dependencies
>      3. Script for executing tests (run-ptes)
> 
> To simplify adding common pytest based ptests, added a new class
> enabling base functionality.  Users can also override the location of
> the pytest files in addition to using their own version of run-ptest
> 
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>   .../ptest-python-pytest.bbclass               | 31 +++++++++++++++++++
>   meta/files/ptest-python-pytest/run-ptest      |  3 ++
>   2 files changed, 34 insertions(+)
>   create mode 100644 meta/classes-recipe/ptest-python-pytest.bbclass
>   create mode 100755 meta/files/ptest-python-pytest/run-ptest
> 
> diff --git a/meta/classes-recipe/ptest-python-pytest.bbclass b/meta/classes-recipe/ptest-python-pytest.bbclass
> new file mode 100644
> index 0000000000..801079e6ab
> --- /dev/null
> +++ b/meta/classes-recipe/ptest-python-pytest.bbclass
> @@ -0,0 +1,31 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +inherit ptest
> +
> +FILESEXTRAPATHS:prepend := "${COREBASE}/meta/files:"
> +
> +SRC_URI:append = "\
> +    file://ptest-python-pytest/run-ptest \
> +"
> +
> +# Overridable configuration for the directory within the source tree
> +# containing the pytest files
> +PTEST_PYTEST_DIR ?= "tests"
> +
> +do_install_ptest() {
> +	if [ ! -f ${D}${PTEST_PATH}/run-ptest ]; then
> +		install -m 0755 ${UNPACKDIR}/ptest-python-pytest/run-ptest ${D}${PTEST_PATH}
> +	fi

Still same issue as v2. You need to check the presence of 
${UNPACKDIR}/ptest-python-pytest/run-ptest not 
${D}${PTEST_PATH}/run-ptest otherwise a leftover workdir will prevent 
updating the run-ptest script.

This should be preventable if we simply get run-ptest from this class 
installed in UNPACKDIR directly, as ptest.bbclass does that already. I 
think it makes sense to reuse as much as possible from the original 
class for ptest?

> +    if [ -d "${S}/${PTEST_PYTEST_DIR}" ]; then
> +        install -d ${D}${PTEST_PATH}/${PTEST_PYTEST_DIR}
> +        cp -rf ${S}/${PTEST_PYTEST_DIR}/* ${D}${PTEST_PATH}/${PTEST_PYTEST_DIR}/
> +    fi
> +}
> +
> +FILES:${PN}-ptest:prepend = "${PTEST_PATH}/*"

This one should have ${PTEST_PYTEST_DIR} as well to match what you're 
doing above. Otherwise it's useless since ptest.bbclass that we inherit 
at the top already defines this.

I'm out of office for the next 3 weeks in 4 hours, so anything not 
settled by then I won't be able to answer until then, up to 
maintainers/other reviewers to chime in at that point :)

Cheers,
Quentin

