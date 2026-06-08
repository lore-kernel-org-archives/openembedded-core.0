Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD41CD8C92
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 13:44:59 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54978.1780926298288427168
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2026 06:44:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Ur1uKIsE;
 spf=pass (domain: cherry.de, ip: 52.101.83.70, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hRByepHjXhBRsNl+rKB4yXug40O6rOrc1xKRHiG2XBw6quKbvIUE0tSPz1Ikd+NTWoLwDypxrob0UsOZv0gTjfaAmsCTfrmxygfas5hqBe4fuySGlSQFEphZNPjfsV/NWG76mP5w3fUAWybYMNTxMhwKMxNYyTItcBKKWikhaJogRrIeBaBuF8qb3hNOKMj00/+ThjIMTCOAfNwFr53vPBoHIr8ogF9y5eyltMgw31bHUwobSL7v+QwZ8oL1A43LxowtvQytZ5+t3MU4mFyxJ0JNjGH5f49Ekbt42OWfADIzWshh6/ZRPaEgM1D6Uifcss8DFMBEG8LngXb4nQwhKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KaN/Pj2D0Dhf+Hd1ZLPLPjoq2h8DRkSd8FUrTsznpWg=;
 b=eAbpcivUkxBgAGw0x9bLd+jSLIfAlnlZIRE3CeXClEeXTtgoCOcQlqm1WVjSmOYHAFS4XNH/rJ5NZhpNdOjPkSl9BPtnCukfFecwBNhwIuOPLxzX64tqKXsi9JSSdoQ4D06KVXFL9Y95P6iA+6LBO5yCg5bpTL2tyYQTyzgLP4LPshxjyvjI8Pladm13GXXtr4yD6QLmJEaHkmh+oxrbea9SszYg+x86pgGMz7kIHjuxnPC7sNzzLsPoEWHBO0Q8xw5xnZ5uMbbKjIAeqf/29pkHHUKOjDv7ZG03qvrRSgN4la6TIp9QvFbcryC/JOd8slzP+UGv59n8NGc6V6ni0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KaN/Pj2D0Dhf+Hd1ZLPLPjoq2h8DRkSd8FUrTsznpWg=;
 b=Ur1uKIsEf6JK+OmVLQr8DGL0EWGJ8OLCzZESE+2RqFfTWJJmABu5Q8vokLNCMmDFP3+CfCbYethndfMtUZU11DPV+JFzHZ2k1hF1DtUUCwB0gSkbg9FTCXVsemcbO+LMmDBUDTAfZHcYrjOdUmShJlK+S4Jyh+vpfdqmyfBrOmk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by DU2PR04MB8550.eurprd04.prod.outlook.com (2603:10a6:10:2d5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 13:44:53 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0071.010; Mon, 8 Jun 2026
 13:44:53 +0000
Message-ID: <64f789e2-3f7b-4466-8067-2f4f29828596@cherry.de>
Date: Mon, 8 Jun 2026 15:44:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] tools: mkeficapsule: Rework pkcs11 support
To: Wojciech Dubowik <Wojciech.Dubowik@mt.com>, u-boot@lists.denx.de
Cc: Franz Schnyder <fra.schnyder@gmail.com>, trini@konsulko.com,
 "openembedded-core @ lists . openembedded . org"
 <openembedded-core@lists.openembedded.org>,
 Francesco Dolcini <francesco@dolcini.it>, Simon Glass <sjg@chromium.org>,
 David Lechner <dlechner@baylibre.com>
References: <20260529110525.22822-1-Wojciech.Dubowik@mt.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260529110525.22822-1-Wojciech.Dubowik@mt.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0043.eurprd04.prod.outlook.com
 (2603:10a6:802:2::14) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|DU2PR04MB8550:EE_
X-MS-Office365-Filtering-Correlation-Id: 3269a5f9-9b17-45a8-d1cb-08dec5641e81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	VTgPPkeRWkKozyGVvLTWY5YiNhTU12hoCPTVv1+SHoC7awoFyxH4jrUsGx63moUqWYhptHeop1anBBFwB6XIhoTWn0wy2CaK4NCTaxVqgndM/SQaCYfg7TtghAsnI+koy6y2REGdzKwYxO/NM+3zeI6scvt57+eTXK640TRNTdwxmFayodyfXd/rpmh0c/MG3W0/nRrE9r2GnEQ0vT/J1vH7VPr0vlMMIO/g9+uUZuKSCUpfemuPXv4EFtpp3IzwKz4lVGZF38R9EyYgvOK75k66J+fpiWh/zjXnsT9JIQaR5I9Fk7Jxr6HfZNy0Qty+MAjGQHgm63mszgzyjX7l4PkN+yDqvwfZSP3bhbyEgL7lZFS89ybkxTZCoFaw3hKCYtFeflmK21BFJAP+IN1mnPpgGJ7zfK4PyABNAwtrnwxYpPOPXpZn4MtiC/Gh2EPRj7SSRccVB4sQSOM5RuVrLVaLf5e6lwX2WGYBxIBBar8RCNkqB/O8U3gp7YZ3Vqc9tpl4Z2K2vBeZuMIfo8JTzTFugVl4V07W2nIwUw6pax/iOEGYt/5mMwPjYAy7Nvm3TOlZWmAxWc8ei1mq+VTB4l83wuwR/Puxj9wi8YhaTeLEGd4ip1uq52Iko4GtuqZPUzIFBgY1eT9skWy0gXu9LgC7yr54X91jFhnRyqbx1IHsgLyIlr6MQ373JKf1ASHH
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NVRubk9ra0JxWDcxUWIrbkhPbVhrZVVGbDRVWlF1OWVVRGtPSEtXV1pNeFpB?=
 =?utf-8?B?cnJ4em93ZWF5UTNQeGpnVUtiU3dWUXZ3UHN1ZDdPQU9VK1FmbGlFV05MY3Fh?=
 =?utf-8?B?L002TGExL2RFUEFTMk8wamloQi9lSDRkNXJ4Yk40akJUR2V3dm00enRSdEZp?=
 =?utf-8?B?MnBFMU1lNm80VGNsMmxQT3NxUzdmVkVOQkFzOUl5VEtzdmtTR0dPajl6V3ds?=
 =?utf-8?B?OEJkMnR5ZUJRQ21JZWlhanpCRCtNemdTQXRnL2tqck5rRklWMFhIeEp6S0RF?=
 =?utf-8?B?aDk2QWtVRk1DdnUza2tveG83VVllNEVtU2JYM2xrTUtuazFBNTczRmZHUStG?=
 =?utf-8?B?eWFxbVNoR1YrZ3dzNUtoNk9IeGkwUEJFcFBIT3JxRm11QUduMmt0NFcwNU9I?=
 =?utf-8?B?aVcyTzNWT3RGaU5wKzFmT2RNTW9vWWd1UC8wQ1Z5bnp2eE9pTVRsb1BBUXJz?=
 =?utf-8?B?OGpvOWh2NUdZS1JaOERjcHUvTlhWb2wrNk1TU2I4N2hQMG82UkxrSmhnQVJI?=
 =?utf-8?B?Rk1KWWZ4UmhnK2ZQSEp5RkpyODIraGZVQmRqN2prUk9qbEo2aHBnSzNXR1Q3?=
 =?utf-8?B?UlI0QklZNnFWdWw3Z0ZLVEFiT1YwWTdRUUdaeHI1NlNwdHRHWlRUZUZ1NWVK?=
 =?utf-8?B?VFN0QWZYUzhnRFZILzQ4WHkvb0QwNzVxQ0Q5MmZtcUJmZnQvbWl3N1p2aWwy?=
 =?utf-8?B?VUZOVE80SWg3bVI1cjNDWm1aVC9KeEZoUlM2cHJ5Y3E4TkNkaTc1akJDVW5B?=
 =?utf-8?B?YncvK3hvcE14T2NzcGdSbEtkRXFiUkgzd3BiREU4MWhGek5FSE5YOGcyelVT?=
 =?utf-8?B?WFNQbnhNUTBXTENSdEx0aW5jcHJoV3g2YzFKQXRhLzlzQ0U2MmRrRWZwRzRH?=
 =?utf-8?B?MTU1aGhRdmZGMzNBaU5kZUpGMEk2MStRQ3IwWFJ5eG1FSzJOVTBnK3V3ZjlE?=
 =?utf-8?B?d01kUUdTTnNwQWtkRStUNEF0K3l0MndrMzQzZTBmd282akNOMy9WMWRvL2tL?=
 =?utf-8?B?UXpQSFVjclFibEUzNmZnRkJuRktvU25qSnhTYWhHam5HNDhnbjV2UC80ZHdt?=
 =?utf-8?B?dWRYZDI4Yk9VUm4xSm5lRzhBeGNZQWdFNXNFZmkzQXIwMXVwdy9uOTFRUDRE?=
 =?utf-8?B?TzJjOU9rNm41MXhHTWVTVjdibDR4YitzWnlHcE9oNitTVzBFM2xVMXdaWEFr?=
 =?utf-8?B?NUVLSzEzSHJCKzBJUGVVSzVwbE00Tkhta1Radm14Y2N1dHJMOHk5UFBoeGVt?=
 =?utf-8?B?Zlo0K1IxTkRIVDB3ZExYQjRZZW0vTFVRMVp4ZWZEdk1xMEZTWnhxVnZFNHhN?=
 =?utf-8?B?dGtqM2l4aHdjOXArZzhyWS9LenBSdDhtUVJVRVhwTFlFTmxIQTV2dzNCWlFG?=
 =?utf-8?B?M1dSQmF1bU5oNUxzZmVWOGxMVUF3ZVNzeFJpWnBGbEJ5ZVA5eGh2YTIwTFgy?=
 =?utf-8?B?UHBSQUFmU3BUNHRmZVVGODhYRVlSMUFVd2pBMEhpWVlNQnVSM3NoN3J2cE92?=
 =?utf-8?B?S2VjeTM4VTQxMXJxTGNvUmpQNVJEVjl1VEp5T0J6c2hyMldUSjVpTHRXckUx?=
 =?utf-8?B?SGlIZ2VkOHIvVkdSS3RzSEdDVWpEL0VWWFNmM1pJZ3A4ekRRRVJidVJ2NHJu?=
 =?utf-8?B?SzZlQm1DSFQyVmhvbUxhUHduQkY0bE04R0Z0RWVsK2NMU2xwVVVmZzI4V29s?=
 =?utf-8?B?MHp2TEFoa0tDdHNFNW0raVEvRTA5NFFPMHA5Z1kvRkc5WUp6OEpDZWZ4K01h?=
 =?utf-8?B?L0s5SlJKL2Vzd0hXUEtpMmNhM0s4R2pIU1U5ejFKa083RFMvQTRhcVI2U2Z1?=
 =?utf-8?B?M0dkcjNQUkJpcUNkWlByZlJMWjErOVhWMVhiZHhiUjJEOVc0Wk5rV1I4Yzk5?=
 =?utf-8?B?YWVPaTJUSGppdHRCT01yYlFnUHFCVEttL0l2eGdVZWtlOHJYU1M1bWJRcGVl?=
 =?utf-8?B?SU9Eb3B6SlQzNG9NWWJJQWoreEZISlRZTnVPUW1TZGExbU9iWEN5c3BLMm1n?=
 =?utf-8?B?VW5tbktTcjg1cFRyZElEYUZHMCtxM05xd1hXU3JVcVFabmQ4cmR1QjExbnJU?=
 =?utf-8?B?M2VqK0NDSUtHZlJkVGNHTkNXTkhCZmMvc1JDamMzNkFLRFFFUlZXOFNZZnoy?=
 =?utf-8?B?ek1yMEhxbzhwYVY4L24weG81cC9RMkZEa3FBTVR5RWJpdzA4c000anhhRC90?=
 =?utf-8?B?R1hVN2ZmUGcyUnV2aDFsTzJFamRvSVk3RFc3dlNROGYvajJra0MvcDV0aWdo?=
 =?utf-8?B?R3JzVWxtbVFZN3l2dDRZZURPRVNKcU1hRk1PUGxLNFk4dmlPS1BVVXk5bm84?=
 =?utf-8?B?NDZ2R3A4YkZLV0VOdS9XeWVQeEFHd1Z4Y0RiUDdLMFkwTDRKbGI1Zz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3269a5f9-9b17-45a8-d1cb-08dec5641e81
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 13:44:53.4521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQ10arD9BdsVuNJlYE1fDTQAk1QxZZGPc9rSkfpi+xmWTDb4EKyYRQ/G1WBmsjGCHlUlBkw5DSbBgPQ4vXmWV0F5EtYde0PGN44l4uVe3mM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8550
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 13:44:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238240

Hi Wojciech,

On 5/29/26 1:05 PM, Wojciech Dubowik wrote:
> Some distros like OpenEmbedded are using gnutls library
> without pkcs11 support and linking of mkeficapsule will fail.
> It would make maintenance of default configs a hurdle.
> Add detection of pkcs11 support in gnutls so it's enabled
> when available and doesn't need to be set explicitly.
> 
> Acked-by: Quentin Schulz <quentin.schulz@cherry.de>
> Suggested-by: Tom Rini <trini@konsulko.com>
> Cc: Franz Schnyder <fra.schnyder@gmail.com>
> Signed-off-by: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
> ---
> Changes in v6:
> - removed return code check from gnutls_x509_crt_import_pkcs11
>    sugessted by Quentin, to be sent in separate patch later
> Changes in v5:
> - removed more unrelated cleanup improvements spotted by
>    Quentin, to be sent in another patch later
> Changes in v4:
> - abstract pkcs11 init function
> - removed unrelated cleanup improvements, to be sent in
>    another patch later
> Changes in v3:
> - remove config option for pkcs11 support and add auto
>    detection in Makefile
> - reduce amount of ifdefs by abstracting import pkcs11
>    functions
> - add missing free and deinit functions
> Changes in v2:
> - make use of stderr more consistent
> - add missing ifndef around pkcs11 deinit functions
> ---
>   tools/Makefile       |  5 +++
>   tools/mkeficapsule.c | 95 +++++++++++++++++++++++++++++++++-----------
>   2 files changed, 77 insertions(+), 23 deletions(-)
> 
> diff --git a/tools/Makefile b/tools/Makefile
> index 1a5f425ecdaa..e85f5a354b81 100644
> --- a/tools/Makefile
> +++ b/tools/Makefile
> @@ -271,6 +271,11 @@ mkeficapsule-objs := generated/lib/uuid.o \
>   	$(LIBFDT_OBJS) \
>   	mkeficapsule.o
>   hostprogs-always-$(CONFIG_TOOLS_MKEFICAPSULE) += mkeficapsule
> +GNUTLS_SUPPORTS_P11KIT = $(shell pkg-config --libs gnutls --print-requires-private \
> +			 2> /dev/null | grep p11-kit-1)
> +ifeq ($(GNUTLS_SUPPORTS_P11KIT),p11-kit-1)
> +HOSTCFLAGS_mkeficapsule.o += -DMKEFICAPSULE_PKCS11
> +endif
>   
>   include tools/fwumdata_src/fwumdata.mk
>   
> diff --git a/tools/mkeficapsule.c b/tools/mkeficapsule.c
> index ec640c57e8a5..576903753660 100644
> --- a/tools/mkeficapsule.c
> +++ b/tools/mkeficapsule.c
> @@ -207,6 +207,71 @@ static int write_capsule_file(FILE *f, void *data, size_t size, const char *msg)
>   	return 0;
>   }
>   
> +#ifdef MKEFICAPSULE_PKCS11
> +static int pkcs11_init(void)
> +{
> +	const char *lib;
> +	int ret;
> +
> +	lib = getenv("PKCS11_MODULE_PATH");
> +	if (!lib) {
> +		fprintf(stdout,
> +			"PKCS11_MODULE_PATH not set in the environment\n");
> +		return -1;
> +	}
> +
> +	gnutls_pkcs11_init(GNUTLS_PKCS11_FLAG_MANUAL, NULL);
> +	gnutls_global_init();
> +
> +	ret = gnutls_pkcs11_add_provider(lib, "trusted");
> +	if (ret < 0) {
> +		fprintf(stdout, "Failed to add pkcs11 provider\n");
> +		return -1;
> +	}
> +
> +	return 0;
> +}
> +
> +static int import_pkcs11_crt(gnutls_x509_crt_t *x509, struct auth_context *ctx)
> +{
> +	gnutls_pkcs11_obj_t *obj_list;
> +	unsigned int obj_list_size = 0;
> +	int ret;
> +
> +	ret = gnutls_pkcs11_obj_list_import_url4(&obj_list, &obj_list_size,
> +						 ctx->cert_file, 0);
> +	if (ret < 0 || obj_list_size == 0)
> +		return ret;
> +

As noted by Simon on v5 (after the v6 was posted, so you did *not* 
ignore review), this should return -1 to conserve the same behavior as 
before this commit.

Indeed, if gnutls_pkcs11_obj_list_import_url4 returns anything but 0 and 
obj_list_size=0, then this function will return ret, which can be 0, or 
anything > 0, which isn't what we currently do.

Can you send a v7 with this fixed please?

Cheers,
Quentin

