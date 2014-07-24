Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EEA616ACE5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 21:22:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6OLM71D025573
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 14:22:07 -0700 (PDT)
Received: from msp-dhcp5.wrs.com (172.25.34.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Thu, 24 Jul 2014 14:22:06 -0700
Message-ID: <53D178FE.6000400@windriver.com>
Date: Thu, 24 Jul 2014 16:22:06 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1406236149.27697.16.camel@ted>
In-Reply-To: <1406236149.27697.16.camel@ted>
Subject: Re: [PATCH] populate_sdk_base: Extend TOOLCHAIN_TARGET_TASK to include multilib variants
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Jul 2014 21:22:06 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/24/14, 4:09 PM, Richard Purdie wrote:
> Most people expect the toolchain from a multilib build to contain multilib
> components. This change makes that happen and is easy for users to override
> should they want something different.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

I tested this (with ipk works, with rpm doesn't work any less then it did before...)

Acked-by: Mark Hatle <mark.hatle@windriver.com>

> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index 0df98db..4b489a6 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -32,7 +32,10 @@ SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${REAL_MULTIMACH_TARGET_SYS}"
>
>   TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-sdk-host packagegroup-cross-canadian-${MACHINE}"
>   TOOLCHAIN_HOST_TASK_ATTEMPTONLY ?= ""
> -TOOLCHAIN_TARGET_TASK ?= "packagegroup-core-standalone-sdk-target packagegroup-core-standalone-sdk-target-dbg"
> +TOOLCHAIN_TARGET_TASK ?= " \
> +    ${@multilib_pkg_extend(d, 'packagegroup-core-standalone-sdk-target')} \
> +    ${@multilib_pkg_extend(d, 'packagegroup-core-standalone-sdk-target-dbg')} \
> +    "
>   TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
>   TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
>
>
>


