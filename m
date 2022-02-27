Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C49EC433F5
	for <webhook@archiver.kernel.org>; Sun, 27 Feb 2022 10:29:58 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.92.75.72])
 by mx.groups.io with SMTP id smtpd.web08.7817.1645957797434043786
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Feb 2022 02:29:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=qv+6q6Aj;
 spf=pass (domain: outlook.com, ip: 40.92.75.72,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UI7GQd9YW/JevxMtKHmhEtOppXpAltFZdujGwSujB0g1d3lejrB7P/gEZUuEM04vvz9NGqFQC4UNrFZRLexwoo+3U+GZeMMWsZvpays5gBFvi7BnjcCDQbUzzdFLKkBeA9J0dOp2SYqAcdTtei/Yo1UF6c1NnAM0BXnVc6QYf35aisViCAIClEx4LzjoxVOg+eJBlLx8X5AcDpUl3AMvmeVF8QCb5KJqbFnkd0aT28DgGuL1XHtfujIUXLVotPhZrRHjwKldTkcmg9lEx2N+kuwh1u07V6SlCoWdYw8DpSQlUMXQTTSVOwposcy2WHwUJOz5YGJSfeRkqcvZX9yxhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbyHaVYAu95yOdRZSSLl+83TG8rFKMjxaxVqHt++uWw=;
 b=bfY62yv4PvJeMyGrkslTwqxJzfZ3TxK+RNHTf/X6aYDuqgLPoe4H2p5EoCrH1vRI2464u/kKPO0pKriCPHHn2TorvXhKEoApar+V8Sg9P2wRFYV9ORneNBs0lQ4/kUJq3ATKHFpYqWDJcB5MdAnsdfFKqCGQfFDVU1khmkA2WDzcbvDUvLagA4cqRSkQyQ8YTobMFnFQThWdiP+Lgm8TR0Gpj3EmfneR8PLbbSZRT7VdDesUiJc3dI/a6GQ9OHCK5E5DkSWP1UkQb68vdDf8krZVZAYMc7evq2ElHVxmJp+llo3X5ueOv6tCqyjQpxnZbS+Ns5sGIm2dXSOjbTPW9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wbyHaVYAu95yOdRZSSLl+83TG8rFKMjxaxVqHt++uWw=;
 b=qv+6q6AjhalpEhuVKi/4Y4y8Q+pYdicD/Fz5anqQycSLdldwC3fV5prKsgJ/hi1X+ejMma3bUnVnJsGBtQoHum7dxUtD8E0lm+nSrgep32sX46LDTOBdIncPZ3QWZJhHM0FZ7nkhf7v8OCchdsXbuWHF3Z5k5bt0wJCKHiuG1DMY/LzWEEJUbHl4h7r2NqYilj8u+/afc9yAfnBP2bEfQeBZci+y+j4NZYlLgH9nvm6qf3RDYgKXr4imyNMayboB7lNnQQkjGf8YAF5XjMMKw8Mi83xV+FymutOrl+ztF/U9jvHTwtdh5pNDrSTCltBtpb8+Bu5geAspS/ElZGUaYw==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB3331.eurprd09.prod.outlook.com (2603:10a6:208:16e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Sun, 27 Feb
 2022 10:29:49 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b%6]) with mapi id 15.20.5017.026; Sun, 27 Feb 2022
 10:29:49 +0000
Message-ID: 
 <AM9PR09MB464226CEBC12C7654CE46946A8009@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Sun, 27 Feb 2022 11:29:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH] pip_install_wheel: Use BPN instead of PN to
 construct PYPI_PACKAGE default
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org, Tim Orling <ticotimo@gmail.com>
References: <20220226082142.119063-1-richard.purdie@linuxfoundation.org>
From: Konrad Weihmann <kweihmann@outlook.com>
In-Reply-To: <20220226082142.119063-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [HkNrwOtQ95OguD+VRtJ2+RPRMup9flyoIC7wMn9rSxxjnbvrQ4qJSCyOeIBCTTHM]
X-ClientProxiedBy: AM5PR0301CA0032.eurprd03.prod.outlook.com
 (2603:10a6:206:14::45) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <0df69af6-7655-6b8c-d20a-84c5e483833b@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b25aaa26-bddf-47f3-a4c2-08d9f9dc1523
X-MS-TrafficTypeDiagnostic: AM0PR09MB3331:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UMqRvt8oKGTZW0giLMRK8jT1nZNb4cNd2fpZtx1SC9N6YE/pRCxK37iWgjczRXt/cP1xufVoZn+2WImCHpkv/qPCktwWaEWQ9Xe9OyXbYycoeS0Wxk+IZtLLISxPeNqOUGH8XyVa3UHV2V8kjglj2hj47Ewlp9BsIiBqgfykxmcUy/RAAtHlYbGjkkY+U+Ao/c4lw+k6rmPhv1CeqEWERZ6hrpTlkUOPpOb6iCQ+CF7wVGRJPs5Ntomcfvg4ZuZZ9e9zQZYXZuB81UoGxabkJgRcUgRkAC/4B3wml3ap9YS/yx9cUvusvD84JMUaPAkgee01gaiBZ8rONBS8HqdjShqVMgNYwWUfUQwt8aHE3eNlzNFo6BoxGIR/Ij9o9CRJxazyshG68GSjwEvMqsrvIy6bwIhR1/XNpiOZ70D1Pn4NK/n9IrbNKVSzX6b9fv/YUCdFjwtxHmrzen0Zr9bmnQW0gyQgp0+83qvFED+yAQM2A7ib8NlPYnigl6ETRyTH/eD88SNMB2GsPiBj4m1My2DS8Aqk6Rh54N+LsDUDg1nIL8+32geRYh0CsB8eQ2nt/6nyKnQpawS+IAoSKxeF/h9poXs+4pjpGE3s+qyuKSEYSl6iDcQzDxyPDGJe5nwznUhYHnz98hDYCoWPbgy+GqukeRlz3LK9HlznMCvocy0=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bkVoVVVoNlZiaEVPOHg0bzY3OVN3dTZNYmhWZ0dTakcxYS9kSGx6TEVLdFdt?=
 =?utf-8?B?Zktjb0RSNkFTcHRtbVpUQXRsckZpS0JWV1RYaUVpVDZCSVowUjlyeWxNelU0?=
 =?utf-8?B?WmUwR2FNd1lDUHZ6NnZwYmFZVVdRRmdJOWQ4VE84amYvSTBFRTBDd1FZLzFV?=
 =?utf-8?B?U0F4NHliNXlLSmlWWnlpUitOUEg2QTBRTm5zelNmUFNodkRVbXgyamI5ZTdP?=
 =?utf-8?B?Skk1ZFI3d1ZoWWFJVTRqcjZyZHJRZ1AyN3U4d2ZpSWFwYk5BS1RxZmF1UnV3?=
 =?utf-8?B?cEN6dUowRXZ5b1ZaUlNQYUVlaFNWNHNzSmkrYWR6R2RRN3FPQ3ZLVjVQN3FZ?=
 =?utf-8?B?VkVLVzFkZEdCMHpTMGF1dHR1Y2FrOE9sMWhuVW9nLzdmL3ZiQndncHN3NXU3?=
 =?utf-8?B?eHE0Rko1bllKV1NTN2ZtLzZ2c2pSYTNJOWRaNDZvaEVCbTlRcldLSEJMc2wy?=
 =?utf-8?B?T2drN0FiK040YS95UHdSR094V0d2TFRvM3BuazlvWkhDZUMrbmhmN1NIaGFy?=
 =?utf-8?B?UDFBK3dEbVZYSEdSYnF0cVd5b2ZrNVc5WFZ4SVBBeXZLT3hvSlNoREtPejc5?=
 =?utf-8?B?RG9PYmxXRk05SitsYW54UVprRzlJL2luVjM3eWRRUVVmait1dVl3TXpUVFFv?=
 =?utf-8?B?QVBFYkorcmJaa3ZibGM4VHhhUC9WaUJOMjFlSThKV0VXdHZmS0hlS01GNjBW?=
 =?utf-8?B?bFRLM1RqY3QwcnkraitBMUtSbVJ3L2RkS3VBdjZ3em5NRjIrN1h3SzFQWG92?=
 =?utf-8?B?Ny92MHhSblhyUCtjdzdHSVpQZUJkYVk1cnRqWTExbzNnaW5TWCt0Tll4bjJV?=
 =?utf-8?B?V2piV0xqazdUL1pydFNnd1o3dmVCUmVKK0JFWndNVGJKWTJ5QndlcnJWVVVo?=
 =?utf-8?B?MnJGdjJnM3FmelM1RWQzMnpPQm9nZitHQ0FTTlBvOEdTemIzdXc4M3l5blli?=
 =?utf-8?B?UWVBcWNVck5JRStRNWtHdGZLQVBDbFZoR0RwWEIyK0EzcW0yc0dUL1IzalM1?=
 =?utf-8?B?WlFjcmtrdlVoc1lUTXhDNXRVb1BRMVRrMWVEYmg3cjYvRUx0VC9acTlLOEhJ?=
 =?utf-8?B?VW1DdkpJVExPZEZRVnZjRytxVWM1a2h2VENTZUQzODhmUWpSNVJYRHlPSm4x?=
 =?utf-8?B?cURMeENkQjlkSWhnWmFza1RRWFZpVU5WQjFCdm9IQjZvLzZtdUhJRVFjdXJU?=
 =?utf-8?B?eElQV1RqZmNmcDhxemNKOVZreU5pRHM2bEh4Zm1UUEFvZ3Rka1ZBMEpjUFNX?=
 =?utf-8?B?RFM0UXNrd0RNcnZpN0JuZk02Q3VtdWd2ZllRVlBieklJZmlyUzFRREs1RTBh?=
 =?utf-8?B?cHlJUWk4OG9lQ1FuMFBQV1dpRUNnWThvaitLSEV5QVoyWW9CbytRbTQvbDJZ?=
 =?utf-8?B?T296c3B2bTZWRFE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b25aaa26-bddf-47f3-a4c2-08d9f9dc1523
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2022 10:29:49.5070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB3331
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Feb 2022 10:29:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162432

Some more observations when using the current state of the pip/wheels 
patch series (from today's master)

- when using recipes that inherit setuptools (but not pypi) and do have 
a "python3-..." prefix in the recipe name - the name guessing fails. IMO 
it would be best to strip the "python3-" prefix in the guessing too

- when using recipes that do not have a version matching *exactly* the 
one from setup.py|pyproject.toml the wheel glob `PYPA_WHEEL ??= 
"${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-${PV}-*.whl"` fails
  - examples:
	- PV = "1.2.3+${SRCREV}" for recipes that have additional patches on it
	- recipe name is python3-foo_git.bb

In my opinion it doesn't make sense to have ${PV} in that glob - a 
simple asterisk would match all of them easily - or this there any real 
life example where a single python project builds several packages with 
different versions in the same workspace?

- another thing is SETUPTOOLS_INSTALL_ARGS ?= "--root=${D} 
--prefix=${prefix}" breaks a recipe that was previously installing files 
to "/etc" aka ${sysconfdir} - these are now installed into /usr/etc, 
which doesn't look right. For reference the project is 
https://github.com/HewlettPackard/reconbf

In a sense of a more painless transition these issues should be 
addressed before any release

On 26.02.22 09:21, Richard Purdie wrote:
> This fixes the name for native and nativesdk recipes.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/classes/pip_install_wheel.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/pip_install_wheel.bbclass b/meta/classes/pip_install_wheel.bbclass
> index 9f9feda6ee0..5b7e5cd7064 100644
> --- a/meta/classes/pip_install_wheel.bbclass
> +++ b/meta/classes/pip_install_wheel.bbclass
> @@ -2,7 +2,7 @@ DEPENDS:append = " python3-pip-native"
>   
>   def guess_pip_install_package_name(d):
>       '''https://www.python.org/dev/peps/pep-0491/#escaping-and-unicode'''
> -    return (d.getVar('PYPI_PACKAGE') or d.getVar('PN')).replace('-', '_')
> +    return (d.getVar('PYPI_PACKAGE') or d.getVar('BPN')).replace('-', '_')
>   
>   PIP_INSTALL_PACKAGE ?= "${@guess_pip_install_package_name(d)}"
>   PIP_INSTALL_DIST_PATH ?= "${B}/dist"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162423): https://lists.openembedded.org/g/openembedded-core/message/162423
> Mute This Topic: https://lists.openembedded.org/mt/89406689/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

