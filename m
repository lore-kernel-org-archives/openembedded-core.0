Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 08BBB72541
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 14:35:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0FEZb6d015259
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 15 Jan 2015 06:35:37 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Thu, 15 Jan 2015 06:35:37 -0800
Message-ID: <54B7D038.1020409@windriver.com>
Date: Thu, 15 Jan 2015 08:35:36 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
References: <1421316230.31262.51.camel@linuxfoundation.org>
In-Reply-To: <1421316230.31262.51.camel@linuxfoundation.org>
Subject: Re: [PATCH] cross-canadian/meta-environment: Allow modification of TARGET_OS to be optional
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
X-List-Received-Date: Thu, 15 Jan 2015 14:35:43 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

I've verified this fixes the problem that I had (along with another patch that I
have not yet sent.)

--Mark

On 1/15/15 4:03 AM, Richard Purdie wrote:
> There are some cases we want the manipulation cross-canadian performance
> on TARGET_OS, there are also cases like meta-environment where we do not
> want this manipulation.
> 
> We did try and use immediate expansion to avoid this problem and it
> works in the non multilib case. If we have a multilib that used an
> extension, like for example:
> 
> require conf/multilib.conf
> MULTILIBS = "multilib:lib32 multilib:lib64"
> DEFAULTTUNE = "mips32r2"
> DEFAULTTUNE_virtclass-multilib-lib32 = "mips64-n32"
> DEFAULTTUNE_virtclass-multilib-lib64 = "mips64"
> 
> then the n32 extension case will be misconfigured.
> 
> It turns out saving an unexpanded variable is hard. The best I could
> come up with was:
> 
> SAVEDTOS := "${@d.getVar('TARGET_OS', False).replace("{", "*")}"
> 
> and then
> 
> localdata.setVar("TARGET_OS", d.getVar("SAVEDOS", False).replace('*','{'))
> 
> which is rather evil, I'd challenge someone to come up with a nicer way
> of making it work though!
> 
> Rather than the above madness, we modify cross-canadian to make the
> problamtic code conditional.
> 
> This fixes the original issue (where a linux-gnuspe target was seeing
> 'linux') of
> http://cgit.openembedded.org/openembedded-core/commit/?id=0038634ee6e2b6035c023a2702547f20f67c103a
> but also fixes the multilib one.
> 
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
> index fec6438..824be07 100644
> --- a/meta/classes/cross-canadian.bbclass
> +++ b/meta/classes/cross-canadian.bbclass
> @@ -16,6 +16,7 @@ STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${S
>  #
>  PACKAGE_ARCH = "${SDK_ARCH}-${SDKPKGSUFFIX}"
>  CANADIANEXTRAOS = ""
> +MODIFYTOS = "1"
>  python () {
>      archs = d.getVar('PACKAGE_ARCHS', True).split()
>      sdkarchs = []
> @@ -23,6 +24,9 @@ python () {
>          sdkarchs.append(arch + '-${SDKPKGSUFFIX}')
>      d.setVar('PACKAGE_ARCHS', " ".join(sdkarchs))
>  
> +    # Allow the following code segment to be disabled, e.g. meta-environment
> +    if d.getVar("MODIFYTOS", True) != "1":
> +        return
>      # PowerPC can build "linux" and "linux-gnuspe"
>      tarch = d.getVar("TARGET_ARCH", True)
>      if tarch == "powerpc":
> diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
> index b3737bb..5d72e38 100644
> --- a/meta/recipes-core/meta/meta-environment.bb
> +++ b/meta/recipes-core/meta/meta-environment.bb
> @@ -6,9 +6,9 @@ PR = "r8"
>  
>  EXCLUDE_FROM_WORLD = "1"
>  
> -ORIGOS := "${TARGET_OS}"
> +MODIFYTOS = "0"
>  
> -REAL_MULTIMACH_TARGET_SYS = "${TUNE_PKGARCH}${TARGET_VENDOR}-${ORIGOS}"
> +REAL_MULTIMACH_TARGET_SYS = "${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
>  
>  inherit toolchain-scripts
>  TOOLCHAIN_NEED_CONFIGSITE_CACHE += "zlib"
> @@ -30,7 +30,6 @@ python do_generate_content() {
>  
>      # make sure we only use the SDKTARGETSYSROOT value from 'd'
>      localdata.setVar('SDKTARGETSYSROOT', d.getVar('SDKTARGETSYSROOT', True))
> -    localdata.setVar('TARGET_OS', d.getVar('ORIGOS', True))
>      localdata.setVar('libdir', d.getVar('target_libdir', False))
>  
>      # Process DEFAULTTUNE
> 
> 


