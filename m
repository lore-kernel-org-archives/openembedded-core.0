Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CBA197423D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Sep 2015 13:24:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8BDOdnN022220
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 11 Sep 2015 06:24:39 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.235.1; Fri, 11 Sep 2015 06:24:39 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
References: <1441974346.24871.383.camel@linuxfoundation.org>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <55F2D616.1080604@windriver.com>
Date: Fri, 11 Sep 2015 08:24:38 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1441974346.24871.383.camel@linuxfoundation.org>
Subject: Re: [PATCH] populate_sdk_base: Fix aarch64 OLDEST_KERNEL sdk issues
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
X-List-Received-Date: Fri, 11 Sep 2015 13:24:42 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 9/11/15 7:25 AM, Richard Purdie wrote:
> aarch64 sets OLDEST_KERNEL to 3.14. This stops the aarch64 SDK installing on
> anything with an older kernel which is clearly incorrect.
> 
> I attempted to extract the correct non-overridden version from the data store
> but it proved problematic and I was running into data store issues. Those
> are a separate problem but there isn't time to fix this right now.
> 
> Instead just code the SDK kernel version separately to work around this for
> now (and fix the autobuilder tests and SDK usage).

Just an FYI -- if you package QEMU with your SDK, 3.14 might still be required.
 (System level emulation works, but application level emulation will fail on
older kernels.)

--Mark

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index b015bf0..aa7a9a5 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -81,6 +81,11 @@ python write_host_sdk_manifest () {
>  POPULATE_SDK_POST_TARGET_COMMAND_append = " write_target_sdk_manifest ; "
>  POPULATE_SDK_POST_HOST_COMMAND_append = " write_host_sdk_manifest; "
>  
> +# Some archs override this, we need the nativesdk version
> +# turns out this is hard to get from the datastore due to TRANSLATED_TARGET_ARCH
> +# manipulation.
> +SDK_OLDEST_KERNEL = "2.6.32"
> +
>  fakeroot python do_populate_sdk() {
>      from oe.sdk import populate_sdk
>      from oe.manifest import create_manifest, Manifest
> @@ -156,7 +161,7 @@ EOF
>  	sed -i -e 's#@SDK_ARCH@#${SDK_ARCH}#g' \
>  		-e 's#@SDKPATH@#${SDKPATH}#g' \
>  		-e 's#@SDKEXTPATH@#${SDKEXTPATH}#g' \
> -		-e 's#@OLDEST_KERNEL@#${OLDEST_KERNEL}#g' \
> +		-e 's#@OLDEST_KERNEL@#${SDK_OLDEST_KERNEL}#g' \
>  		-e 's#@REAL_MULTIMACH_TARGET_SYS@#${REAL_MULTIMACH_TARGET_SYS}#g' \
>  		-e 's#@SDK_TITLE@#${SDK_TITLE}#g' \
>  		-e 's#@SDK_VERSION@#${SDK_VERSION}#g' \
> 
> 


