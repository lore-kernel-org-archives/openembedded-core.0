Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFEA2C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 11:48:06 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.92.68.54])
 by mx.groups.io with SMTP id smtpd.web10.8465.1646912885614583190
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 03:48:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=KI/EjeMa;
 spf=pass (domain: outlook.com, ip: 40.92.68.54,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCH4sh+GH0zHME4g+fWLNz3DHh4xZp35ft3ZiDjb/1F9gw2fK4pc12bhpuN3P5gAgNwk02yv13K0hAoRGdO8vDe/VBgCd3mPizZp4zh9pLmHI6ntp/FAbJJUOnWHr+cEQWMqB4Y9cTm1hK9G7/C2x8/ciYdQcHCmh/R6g6d+mEHWH/gEaCYIpepg/l894HEe3dV8akqErUEyJfZGCywOuMI8Tt0VpYDyNROMCnQBypcErpeZwkR1otJyQV9ouz1oHR3QyVTzd+01651+fAA26Zrf2uBzpDb3Iny5xQ/kXxVvkazaUU1awn4b1kWQmqTA5fx5+kajJbjzUFxZLgU4NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IEkuaNQGYQ98SzQ902a8Pt9C1ggY+ZB8sclsyYta7+Q=;
 b=H2xXAsr3wXHzn3B+4YIaAM6pUfc6ZGsX/WnWMqF3QGsxUbPn5iHbpFl0XWmKyClJqmXjsqa6ccdEBNVTVrwYb0tVWJsAMGzU/3h+gNFSODgNNSgGocKAjuGzkU2zYK2glxgklqz4+ww1z8z7J8KVa5krbEU0dcZuWrsh2arKwp1CAnmaB1PDVWbnTT8vfJqaozxQdmEgdsVfH/2vgKFyT2Y3BH0ClhSivBAaHi7xBiMs21bqqcGOPm28/8AKEN8AczEly0pcR4msfotNjMeo07C9yKqNEbPk94D7l+Xc+7aCBGFGFcChIfTILnuQK3wGCh8SiDCbF6sJlzZ98fdLQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IEkuaNQGYQ98SzQ902a8Pt9C1ggY+ZB8sclsyYta7+Q=;
 b=KI/EjeMaJLI9bN70vZfMW9kbG1DlgqQkHO5WdE3pn9188auubmxKn/PvM2mcowu6XVw5gUhpCxSOm+Fg0dR+1DXL4BDQijseXTAEH/kROOx24PhmSc2HXWHAc6K+qxfEDsE27wZYGWqOiSEGjBig10OI0XqgZU9FoXZBJCPQYLIM8r33mNk1ZRJp7pWT7V8R3j0UwICpctTRII5L+KCL4gDErhURuP/qH0nERO9Tu2+j55Xnw5UGZryRqnIQYcZmRTNwGljIRDJIYuGw9BWtmcqoMddQgDqyQNxQm9jRBXXw5BfCvhM8hIlIy4P6RDMknxJLDTL3oejLdJfvBintqw==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by DBBPR09MB2981.eurprd09.prod.outlook.com (2603:10a6:10:d6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Thu, 10 Mar
 2022 11:48:02 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b%7]) with mapi id 15.20.5061.022; Thu, 10 Mar 2022
 11:48:02 +0000
Message-ID: 
 <AM9PR09MB4642CA1CCF4C29F109985C76A80B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 10 Mar 2022 12:48:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH 1/3] pip_install_wheel: add a generic do_install
 for bootstrapping
Content-Language: en-US
To: Ross Burton <ross@burtonini.com>, openembedded-core@lists.openembedded.org
References: <20220310114035.2226442-1-ross.burton@arm.com>
From: Konrad Weihmann <kweihmann@outlook.com>
In-Reply-To: <20220310114035.2226442-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [xv9luGR18/y473w+d7xQV49WHoJMksZYLeAuBaHMBNAAkbKJMBSW0PZAs55BWYm7]
X-ClientProxiedBy: AM6P195CA0038.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::15) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <bb1df325-3c72-a321-94a6-df931e12db44@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d9bcab5-412d-435d-4cdc-08da028bd4c1
X-MS-TrafficTypeDiagnostic: DBBPR09MB2981:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4gYTADsN40imESTCzy9gOfXZcgTA4RQefgHEUfcJtyuKdDXwOqNbXr1c+oKCU34Gh8z1Pg31qelxZ8KhkS1gV6ZHDckGev4//zrBGficyJlqwb1rPiCRLiR51Qsjakz0f0wSf7ti3DkQNZhDEkKvH4VBg/LY2Pa9Amg8zRK92UlVi16wWlO0cLx8ZnzxQrZ0OQOULGOC+sQzAbdhgnQBGlen0sDIFJeyMIyW/tKEFmHCUtC6k9TOT4+IPYpAOEUZ+1jQLzyg2HUfh9u5cdk9AIdLleGb2xKFayjMzBnC47DoIiW6epdHSqrRCtCazGihWoQgnqwOvjt/ly8RDOFTe0QlsoKpyUAD87uhstIrgGtCQGQPIgQo6DkkM/sZtor8i34FA364RxHEZY19PlI4sIefhZme+2KxFOa4b414aEFVnDS1Qglsro7rWt36p5wkf3moYKtp9TiQAc2OE+r4rnXddpEywRkhqvXK/6TweXB4slyCG9rMyQZk0ATwXKkq+Jox0ckI6y2uMX6GBBaMIRM2KPU+j1RsuTZimEyiv3Q3urSMYsi9In158YT2ABvE+zdA4bswYVnlzn+ATkBO1w8SBYU9cZEF4+qW3Jqbr6c76E+d8xkO/AcXaCjPYXXGUeOdjkMcRi0RkIQ/YD1yBkRZNLH+yOjFa0HTZR0sN6A=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d2NpMDZOZXp4ZTV5Vnl0VXAzRUxGaUQ1NXdMSzRraGN4U1FSTU5MQXVjMmEx?=
 =?utf-8?B?RzV6MVFraisrMEJZak14QUxCbXhNY05lbXFTWmtRWm5EUjVRU1ptZSthQlgx?=
 =?utf-8?B?dWFiemZyRk9KcithWEVtVm1kMGZqWmZIWEVUczNLUnJLZzVyVWNTOGREK1V3?=
 =?utf-8?B?V2FmVVFiVHhmUGNJZjhkaVhlL2xZV2tuWTN6V2VBcXBzTktDMldEQ3c2aURx?=
 =?utf-8?B?aXdUczVuc0hlWm9NeTd1eEw0NzNUMUZRMjJWWlBNR3oybHpKMG1lU3piNEhl?=
 =?utf-8?B?RHRHUVFlc1dHQTBET0R1Tlo1ZUtSU3ZKVmpFSTdEK3NERUZreldTNTVod2Fr?=
 =?utf-8?B?OUtITGJNY213Zjg2SUlSa0xKTWs2QzJCZmEvZkJ6NDNMU0p0QWNXT0JxMmll?=
 =?utf-8?B?VU1HT09lbVZLR2pkeFB5UU4yVnhSSUplYk84SHZLaXhEVXhVWDc3S2wycnk3?=
 =?utf-8?B?R1ZsR0hMdE56NmFMNmwvQ3pvTVliakx0bnp4Ukxqc1lvN0F3cy8xSndoQW9w?=
 =?utf-8?B?T3loQTFKM2Z1NEpCR25aTnVGejlJazdjZ2tDWExHMk5lejNFWmVnZU5SWTF4?=
 =?utf-8?B?Tks5cjJidWMvdHRDSDdVTE5CNkFvREh1OXA5aXRwSTBFeVFta1RqTXlIQjIy?=
 =?utf-8?B?VGRDaDZoRTBiKys2OVR0elRKbTUvT29TbjN1OUZpY0xJN01YS2JncHR0Tmdn?=
 =?utf-8?B?dXZzaFJSZnJ5UlNGaTZUeUdFRmpaWXE4bndaYkQ5T1RCV0FOMEZ5L2pYKzRU?=
 =?utf-8?B?MXh1dm5PVzU4K3VRL2NOdU5uNTE3Q1VzWThzVHFFZUpmc1hpSi9BL0NvYzA5?=
 =?utf-8?B?RVZjS0hDQ0h2RFhLbExmelAvQkowSkpaZ2tBaVd6eDEwMkExeDBiT2xQeTBT?=
 =?utf-8?B?bVBaL0swanlmWjZsQXZxU3NoYUM4KytxU0V2b2xrbHFZYkRvK3pmMWRhanBv?=
 =?utf-8?B?amZyK3l3aEJCVUViNWVsaFNaZ2lrVmdRcUFZL0RWVVpUMTBJbTk3Q0hkblJU?=
 =?utf-8?B?SldnYS9OcWFvR1l6VWlEUDUxUW1SYm1vWDJ6OUIwdzFtYTM5UHl2dWVoS05U?=
 =?utf-8?B?RHVaa0NSTmN3TjJyRmJHSiszM3JBQmhiekd1MmtVZExJZU5yUTc4Um5OYy93?=
 =?utf-8?B?KzNmbDlEWUUxNXplcWN2K05JOXM3MnJkbGgzN2t1bmNiOU1QY29uSS9ESXV3?=
 =?utf-8?B?Kzg5a3B2d29MYXBCNm9jcU50WnVrOGkwSXRSaDlsb2JBNTdEcFNhZ2FDM0M5?=
 =?utf-8?B?emVNdXlXeUZoM1Jxa0thdVNDemRLV0R0SVN1RDFnM2dMdk92QjJ5cUZsVTM3?=
 =?utf-8?B?OXJhWWlSZXZZYTdjcFdHS1VENG9VdlZKNVRjRlgxb0Y5SkVJSEx6Si9CZnpK?=
 =?utf-8?B?RC96aFYvNVZ5VHc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6d9bcab5-412d-435d-4cdc-08da028bd4c1
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 11:48:02.3724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR09MB2981
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 11:48:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163016



On 10.03.22 12:40, Ross Burton wrote:
> Several recipes are duplicating the same bootstrap logic for installing
> a wheel without using any tools.  Add an implementation to
> pip_install_wheel to centralise the code, and remove the duplicated code
> from the following recipes:
> 
> - python3-flit-core
> - python3-pip
> - python3-setuptools
> - python3-wheel
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   meta/classes/pip_install_wheel.bbclass                    | 6 ++++++
>   meta/recipes-devtools/python/python3-flit-core_3.7.1.bb   | 3 +--
>   meta/recipes-devtools/python/python3-pip_22.0.3.bb        | 4 +---
>   meta/recipes-devtools/python/python3-setuptools_59.5.0.bb | 4 +---
>   meta/recipes-devtools/python/python3-wheel_0.37.1.bb      | 4 +---
>   5 files changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/meta/classes/pip_install_wheel.bbclass b/meta/classes/pip_install_wheel.bbclass
> index 3861dae75a..29cd544aa3 100644
> --- a/meta/classes/pip_install_wheel.bbclass
> +++ b/meta/classes/pip_install_wheel.bbclass
> @@ -40,4 +40,10 @@ pip_install_wheel_do_install () {
>       done
>   }
>   
> +# A manual do_install that just uses unzip for bootstrapping purposes. Callers should DEPEND on unzip-native.

Minor nitpick - wouldn't it make sense to add a hard DEPENDS on 
unzip-native right here into the class - it should do no harm when done 
like DEPENDS:append:class-native = " unzip-native"

> +pip_install_wheel_do_bootstrap_install () {
> +    install -d ${D}${PYTHON_SITEPACKAGES_DIR}
> +    unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ${PIP_INSTALL_DIST_PATH}/*.whl
> +}

I think these two lines could be moved into a generic do_install:native 
- and then removing all the override code from the recipes below.

Or is there some special case I'm not seeing here that would require 
having this extra function.


Thanks for the patches - after all these rounds code looks good and 
should provide a seamless transition for most of the layers

> +
>   EXPORT_FUNCTIONS do_install
> diff --git a/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb b/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb
> index 196e391a8d..1f14345d50 100644
> --- a/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb
> +++ b/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb
> @@ -21,8 +21,7 @@ PYPI_PACKAGE = "flit"
>   PEP517_SOURCE_PATH = "${S}/flit_core"
>   
>   do_install:class-native () {
> -    install -d ${D}${PYTHON_SITEPACKAGES_DIR}
> -    unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ${PIP_INSTALL_DIST_PATH}/flit_core*.whl
> +    pip_install_wheel_do_bootstrap_install
>   }
>   
>   PACKAGES =+ "${PN}-tests"
> diff --git a/meta/recipes-devtools/python/python3-pip_22.0.3.bb b/meta/recipes-devtools/python/python3-pip_22.0.3.bb
> index d7000b891a..f7fcf47c06 100644
> --- a/meta/recipes-devtools/python/python3-pip_22.0.3.bb
> +++ b/meta/recipes-devtools/python/python3-pip_22.0.3.bb
> @@ -19,9 +19,7 @@ SRC_URI += "file://reproducible.patch"
>   SRC_URI[sha256sum] = "f29d589df8c8ab99c060e68ad294c4a9ed896624f6368c5349d70aa581b333d0"
>   
>   do_install:class-native() {
> -    # Bootstrap to prevent dependency loop in python3-pip-native
> -    install -d ${D}${PYTHON_SITEPACKAGES_DIR}
> -    unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ${PIP_INSTALL_DIST_PATH}/*.whl
> +    pip_install_wheel_do_bootstrap_install
>   
>       # pip install would normally generate [console_scripts] in ${bindir}
>       install -d ${D}/${bindir}
> diff --git a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb b/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
> index 9d2c2fd744..7cd67b85f9 100644
> --- a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
> +++ b/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
> @@ -22,9 +22,7 @@ DEPENDS:remove:class-native = "python3-pip-native python3-setuptools-native"
>   DEPENDS:append:class-native = " unzip-native"
>   
>   do_install:class-native() {
> -    # Bootstrap to prevent dependency loop in python3-pip-native
> -    install -d ${D}${PYTHON_SITEPACKAGES_DIR}
> -    unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ${PIP_INSTALL_DIST_PATH}/*.whl
> +    pip_install_wheel_do_bootstrap_install
>   }
>   
>   RDEPENDS:${PN} = "\
> diff --git a/meta/recipes-devtools/python/python3-wheel_0.37.1.bb b/meta/recipes-devtools/python/python3-wheel_0.37.1.bb
> index 83a7c986a8..cf0d8191b4 100644
> --- a/meta/recipes-devtools/python/python3-wheel_0.37.1.bb
> +++ b/meta/recipes-devtools/python/python3-wheel_0.37.1.bb
> @@ -13,9 +13,7 @@ SRC_URI += " file://0001-Backport-pyproject.toml-from-flit-backend-branch.patch"
>   DEPENDS:remove:class-native = "python3-pip-native"
>   
>   do_install:class-native () {
> -    # We need to bootstrap python3-wheel-native
> -    install -d ${D}${PYTHON_SITEPACKAGES_DIR}
> -    unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ${PIP_INSTALL_DIST_PATH}/*.whl
> +    pip_install_wheel_do_bootstrap_install
>   
>       # pip install would normally generate [project.scripts] in ${bindir}
>       install -d ${D}/${bindir}
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163014): https://lists.openembedded.org/g/openembedded-core/message/163014
> Mute This Topic: https://lists.openembedded.org/mt/89684105/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

