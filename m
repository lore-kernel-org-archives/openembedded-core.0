Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC20C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 15:47:57 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.92.74.25])
 by mx.groups.io with SMTP id smtpd.web08.1742.1646840876477136031
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 07:47:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=EJhTn3wJ;
 spf=pass (domain: outlook.com, ip: 40.92.74.25,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iPV4x6z2/0iAvzVesh1yvwBiUrlLTQJYM61wtDqP5hrOReDhq7rcGeg7QgAWEsVHCW5G6VWldu0uLTLkXIzpGUPWlxBzkTfNeFV6CbzxLGSItf+AlIWYh3AiTBaDcHj9GOaY/gM+rS/gxTGfgY/nHGH293zxyYnr5DA/fibpwSm6A9IWGoWWSHUmZxj/OglP8DsONG/yaZlGwdWXF8YbUKojT/Mn6veoeFljELUzm6Q9dvjb3vNJoLPUSp7u3956DJ3F8Krlbpjo8A6BCx7yPxL3FeCOWRb9z/P8VJsjsf9ddrk1wHHBOJjcH2JgPvzo0cY+GOh3DoeB2T6/VaFbLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qvfF9bpP5531MNM/3Wu0VM0U4y62wbs7MnQJ4UuJEI4=;
 b=E+JXc3M229UCvC9Ibjk01e6O51Bdw2czqhbB0Pc5DXjOJg5kDnG1feF9rhknXQCt1oY9oCiQ6fIUwJtru+s0mPXvPwgV4YnQ8P4w2OUn9+PM0s1vM/A9y8+Gw1OkxrZ6L8gw3ekIy+aaTlWX0xnTX9JX6VfblnHuieAi2avGc0u4SbK0r34ghWY+PSPXsfz1vti4gyaSNLPn2ILEePDEpkr9NLF9c5lfVunsEF79iKyMFhnQBUHI9q7lJs42Wf2uV+uHam9fml/dcHZjK762CwWUSx+KJY6OatQ7ezEJJRGhMakNoAXKvGPmJyfZZb15p5qluMlSv7QTeaEANVaJwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qvfF9bpP5531MNM/3Wu0VM0U4y62wbs7MnQJ4UuJEI4=;
 b=EJhTn3wJbF08+t3UvifeGEZZkL4ZvKsjyzXZsDZlV5xDGGfYUJ5jgjKn7v2+/8/zEdrhDzaFJWaUJZIUGw5xSTlvRkAgJLCmScdrUtmhVzZijtkWMZ1bN/j0jYpw2xTVatFCLk1SATMgLeEq8hTy67pQLeXl8mYgb2eBv1erJAWF0gf//QeVCeNG8lOu6M39XSqaOM+/jk9Wca5a4cp9KyFBu3S5vJlsGzY5UQfv0ZQEQP6f7hPQ8toBXnMoj2tEiJRFSIZg0vPgmDDzO048LpIfNqxPYsxENuTew3gAdMqZ1Sg5Ut7KTVW7nrzbQm5WCm3s3GCkkYBh7KCP6X5RYA==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by VI1PR0902MB1934.eurprd09.prod.outlook.com (2603:10a6:802:d::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.26; Wed, 9 Mar
 2022 15:47:53 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b%8]) with mapi id 15.20.5038.029; Wed, 9 Mar 2022
 15:47:53 +0000
Message-ID: 
 <AM9PR09MB4642C97B03C03260CDB40D66A80A9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Wed, 9 Mar 2022 16:47:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH] pip_install_wheel: install wheel with a glob
Content-Language: en-US
To: Ross Burton <ross@burtonini.com>, openembedded-core@lists.openembedded.org
References: <20220309150224.2661618-1-ross.burton@arm.com>
From: Konrad Weihmann <kweihmann@outlook.com>
In-Reply-To: <20220309150224.2661618-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [tuCb6IzdWeYXrDSAiY7xCOaB1QI1Lz3Rt0NHvB/UvuSz4aQemoIjisB+Vt5mTzY+]
X-ClientProxiedBy: AM6PR10CA0027.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::40) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <36c72a6d-a0bf-7349-e5b4-8a21921e2735@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98d7405d-92fe-4924-f0e2-08da01e42c1d
X-MS-TrafficTypeDiagnostic: VI1PR0902MB1934:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hl8xqPOPwdm92eyWJgueD3pplHc7mDpEYK0I20MLWoZQWnQDj/egjfk42ZlfPow2PrC1d73CM3Lin7mjdsJVNJohzbah46KO45wbVyGDdlHcNzb05aZtJDk3nQF5SH4sAA9+SZ+7xfozoWpnFNnMaQjiSTQJBbPJ7o3NEd0Y70dmjCKXC485FxFGjBSUHrPEqn+Tn2b2In8I/vTL9mhg3+HQcv6nmff06sIml6Qf6GHhzhgUGazPBNdfw/t9YcwPHqOIFIvmGYYkJMZKtaY95e7HLouYBGanovcmFbZqNFGjYXm/pVdO8Z0+yHDwuLmOnKdcNRM3K1d5nW7kw342HvDYOv+yM0MrGPA+mpzyy/PxX2t/GY0sYd4ANKEjpb3AIFuqBUFDeZ7YneB/oyeYnDiXdCvJg0Hsv7vFxNGnFU6xxHAuBhRmxM0WWWwBA7eRO4eSMYZos9oEV6QHABbzqh16TDzUq1VR95sxikV44TrITAIB3PLXZBm2CArO2b0eOIL9lJu/G9k82y2Yy4yO5HnC3EdrqlSOxU2ZsAsmHAWOKmZ0o8qQThA32rIiT1CNECIzgenEmsyPy34gb71+8dNWF543pfMAF+5F8BC8fldcTRQXyfIi13GbxLturHTTBP4jdsM5RwYNyI8lovDTM15oCFNyFMN512SNcGxIDRc=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R0hPUDlyTHp3Sjl1eFJrM3V5Rm83K29ZaGxBNHZUNEFTQU1DR2VZa0dUcDJq?=
 =?utf-8?B?bG96eTM4djFyQit2bkJ4RkExcko3R3g4TFN5WXNjcWVob0RqeGUrc0dBcndo?=
 =?utf-8?B?SE9Gd2c2akttT010UnpBR3FPcHY3N0Z5T1lCOGJGVVd2aE00ek91MlNxdyt6?=
 =?utf-8?B?TjRIU0VsdmsxZk83UHF1eHZjZ1ZBeXRFK0JpZkN3NTVWNWRhemZCT3E3S0JF?=
 =?utf-8?B?anFiNXVjWXlFVEFCQ0w2cE9CckdvVzlkYTVhOTluSjFVT2MxMGhQN2dVRlMy?=
 =?utf-8?B?dzE5R2RuODc5WHhXNlo2TmZiQU5mM3BQdnpYODhZa2ZrUURIellIMml1R084?=
 =?utf-8?B?ZWl0SDYvcGFxUnkrbUhMS1gwNWRKQnI2VzE0THA0UE93ZnFwS2x0eGVzM2dX?=
 =?utf-8?B?a2dmMXBsVFo4VDBGVzV4YnRhYkUzVTVUVzQzdVZac0txa05Hc1R0NW1rMlJU?=
 =?utf-8?B?WTAySUVEczVTTTJtT3ptcUlwYklVVVNpM3VZU1BXUkFaU0VnWFlxSXlJNzFO?=
 =?utf-8?B?Q0hNZHBIN21VNVJWL2wvbk52OGJPUFpMZnU1Z1pHeXE5UXBRUUs3aWtELzNn?=
 =?utf-8?B?VkN2Y1VGZ2NNMm5OZVdxSkZnZVE1ZDRqZHdDa0g3ZmdXU0wydWlnRXgwd2k0?=
 =?utf-8?B?ditzTzlEdEJkdk84bTJ4Mm03YnQ3TTVKSVlWOEhHUlUyR2t1TXBqbS9PaEM0?=
 =?utf-8?B?bng4TXhRejh6ejJFUmVXMyszenIwODltZ1c3WDNncDlJTUExMDUwU3NPb2hp?=
 =?utf-8?B?Qmw3Z1VhTkhhTE4yQ1RyR29DbUhCOGpkSWJhVGtsc0lDMUlsSERZVHJEbTk2?=
 =?utf-8?B?OWNzVzd2NDl5M0J0bjNyalZjM2gvNitCV0MvUlIwczFXVFBvMSsxdEhCNW1m?=
 =?utf-8?B?NDQvcldMd1lmU3Y0cG4rc2ViWE9jZkFKN1ZDM2JJNEtkeFJFbFc5dU5rTHVv?=
 =?utf-8?B?MGJLczlwdWJLL1pkSWFjUy82SHdOT1V6RE1WUjcrVzNYYUZCdUxLSVA1R20y?=
 =?utf-8?B?WDk3ZnFFZ0Y3ajFVd2RPaEhrMEhyNHc5ZEUydW5NbENPdnlDSXZhalg3OEVI?=
 =?utf-8?B?NVdQM01QdmpIRWRteGYxZHMyenpBTDFzdmIzbE1nSUVQOHNERUxBdEEwdStG?=
 =?utf-8?B?MnBuZWMrUTZPYkwybVBwa0ZRS1IwYnRKVmZROVIzSldzb1JUdW4zQmtCeDRC?=
 =?utf-8?B?ZjZDcVBEaS9CM2JOMVU1ZWN1U1p4RjV5SnNsS2RHa2Z5Sm5SM2Zhc0p3S21G?=
 =?utf-8?B?Yng4M09PSXEvZWNVdFhlaUU5Q0xIb2ZrWHB4NDJsYnZNd1M0MW91UmN5dWpk?=
 =?utf-8?B?QUNpdFpoNjkvRm1DL0FRMWo5N1hwTWtyblAwaHBqc3MxdGlZTlZXZUFlMDFX?=
 =?utf-8?B?UkdzVFpyQ2tBRmc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 98d7405d-92fe-4924-f0e2-08da01e42c1d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 15:47:53.3814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0902MB1934
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 15:47:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162965



On 09.03.22 16:02, Ross Burton wrote:
> Now that the build systems that use pip_install_wheel are all building
> their wheel into a directory that we knew was empty before, we can just
> install *.whl and not need to know the precise names.
> 
> By design a pyproject.toml will always build a single wheel, so there
> shouldn't be any way for this to end up installing more than expected.
> 
> This obsoletes PIP_INSTALL_PACKAGE and PYPA_WHEEL, neither of which are
> needed anymore.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   meta/classes/pip_install_wheel.bbclass | 14 +++-----------
>   1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/meta/classes/pip_install_wheel.bbclass b/meta/classes/pip_install_wheel.bbclass
> index 954a6b750f..5d09e795d0 100644
> --- a/meta/classes/pip_install_wheel.bbclass
> +++ b/meta/classes/pip_install_wheel.bbclass
> @@ -1,20 +1,10 @@
>   DEPENDS:append = " python3-pip-native"
>   
> -def guess_pip_install_package_name(d):
> -    import re
> -    '''https://www.python.org/dev/peps/pep-0491/#escaping-and-unicode'''
> -    name = d.getVar('PYPI_PACKAGE') or re.sub(r"^python3-", "", d.getVar('BPN'))
> -    return name.replace('-', '_')
> -
> -PIP_INSTALL_PACKAGE ?= "${@guess_pip_install_package_name(d)}"
> -
>   # The directory where wheels should be written too. Build classes
>   # will ideally [cleandirs] this but we don't do that here in case
>   # a recipe wants to install prebuilt wheels.
>   PIP_INSTALL_DIST_PATH ?= "${WORKDIR}/dist"
>   
> -PYPA_WHEEL ??= "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-*-*.whl"
> -
>   PIP_INSTALL_ARGS = "\
>       -vvvv \
>       --ignore-installed \
> @@ -29,7 +19,9 @@ PIP_INSTALL_PYTHON = "python3"
>   PIP_INSTALL_PYTHON:class-native = "nativepython3"
>   
>   pip_install_wheel_do_install () {
> -    nativepython3 -m pip install ${PIP_INSTALL_ARGS} ${PYPA_WHEEL} ||
> +    test -f ${PIP_INSTALL_DIST_PATH}/*.whl || bbfatal No wheels in ${PIP_INSTALL_DIST_PATH}

Can we, for the very unlikely case that do have more than one wheel in 
this dir, bbfatal out here as well - otherwise I'm worried that this 
will never get noticed

> +
> +    nativepython3 -m pip install ${PIP_INSTALL_ARGS} ${PIP_INSTALL_DIST_PATH}/*.whl ||
>         bbfatal_log "Failed to pip install wheel. Check the logs."
>   
>       cd ${D}
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162964): https://lists.openembedded.org/g/openembedded-core/message/162964
> Mute This Topic: https://lists.openembedded.org/mt/89664344/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

