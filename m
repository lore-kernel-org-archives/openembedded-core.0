Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SuRFD-0004vp-RP
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 18:49:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6QGbRti001755
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 09:37:27 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.34.34) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 26 Jul 2012 09:37:27 -0700
Message-ID: <50117246.2030502@windriver.com>
Date: Thu, 26 Jul 2012 11:37:26 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <D9D7124626ED1E43963D86B2657D5CCD03A69B7A@FRSNPREXC1.usr.ingenico.loc>
In-Reply-To: <D9D7124626ED1E43963D86B2657D5CCD03A69B7A@FRSNPREXC1.usr.ingenico.loc>
Subject: Re: SDK and external toolchain
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jul 2012 16:49:00 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/26/12 2:14 AM, Matthieu CRAPET wrote:
> Greetings,
>
> Updated recently my oe-core and faced an unwanted side effect.
> You need to know that I'm using an externel (linaro) toolchain (my
> .bb/.inc are a clone of "sourcery" toolchain example).
> My toolchain is compiled against a custom (external) eglibc 2.15.
>
> Since commit a0de2a56f19ae4d8cd88e46e96917a7a019fe1ab --
> image.bbclass: Add support to build the SDK in parallel with the image
> http://cgit.openembedded.org/openembedded-core/commit/?id=a0de2a56f19ae4
> d8cd88e46e96917a7a019fe1ab

I have run into similar failures.  Your are missing some items in the PROVIDES 
most likely, and as for the multiple providers the PREFERRED_PROVIDER is the 
right answer.

We list a preferred provider for:

linux-libc-headers, linux-libc-headers-dev, virtual/${TARGET_PREFIX}gcc, 
virtual/${TARGET_PREFIX}gcc-initial, virtual/${TARGET_PREFIX}gcc-intermediate, 
virtual/${TARGET_PREFIX}g++, virtual/${TARGET_PREFIX}binutils, 
virtual/${TARGET_PREFIX}libc-for-gcc, virtual/${TARGET_PREFIX}compilerlibs, 
libgcc, virtual/libc, virtual/libintl, virtual/libiconv, glibc-thread-db, 
virtual/linux-libc-headers, eglibc, binutils-cross, gcc-cross

(We have some more, but they are only useful when building an SDK with a custom 
import script...)

> my images generation are failing because it tries to compile eglib 2.16
> and do_configure fails. I have also 3 errors:
> ERROR: Multiple .bb files are due to be built which each provide
> virtual/libc (.../meta/recipes-core/eglibc/eglibc_2.15.bb
> .../meta-ingenico/recipes/external-linaro-toolchain/external-linaro-tool
> chain.bb).

virtual/libc is the item for the above

>   This usually means one provides something the other doesn't and should.
> ERROR: Multiple .bb files are due to be built which each provide
> virtual/arm-ingenico-linux-gnueabi-libc-for-gcc
> (.../meta/recipes-core/eglibc/eglibc_2.15.bb
> .../meta-ingenico/recipes/external-linaro-toolchain/external-linaro-tool
> chain.bb).

virtual/${TARGET_PREFIX}libc-for-gcc is the item for the above

>   This usually means one provides something the other doesn't and should.
> ERROR: Multiple .bb files are due to be built which each provide
> virtual/libiconv (.../meta/recipes-core/eglibc/eglibc_2.15.bb
> .../meta-ingenico/recipes/external-linaro-toolchain/external-linaro-tool
> chain.bb).
>   This usually means one provides something the other doesn't and should.

and virtual/libiconv is the item for the above...

> Notice that "PREFERRED_PROVIDER"s are correctly defined (like in
> distro/include/tcmode-external-sourcery.inc). And I use bitbake 1.15.3.

We had to add additional preferred_providers to the tcmode-external-sourcey.inc. 
  We (similar to you) have a custom binary toolchain... so the tailoring was 
required to get our stuff to work right.

> For now I fixed it crudely, because I don't need SDK.
>
> diff --git a/meta/classes/toolchain-scripts.bbclass
> b/meta/classes/toolchain-scripts.bbclass
> index 44284c3..f5fd4d7 100644
> --- a/meta/classes/toolchain-scripts.bbclass
> +++ b/meta/classes/toolchain-scripts.bbclass
> @@ -136,7 +136,7 @@ toolchain_create_sdk_env_script_for_installer () {
>   #we get the cached site config in the runtime
>   TOOLCHAIN_CONFIGSITE_NOCACHE = "${@siteinfo_get_files(d, True)}"
>   TOOLCHAIN_CONFIGSITE_SYSROOTCACHE =
> "${STAGING_DATADIR}/${TARGET_SYS}_config_site.d"
> -TOOLCHAIN_NEED_CONFIGSITE_CACHE = "${TCLIBC} ncurses"
> +TOOLCHAIN_NEED_CONFIGSITE_CACHE = "ncurses"

That is incorrect.. the CONFIGSITE_CACHE should be generated for the TCLIBC.  If 
you don't do that, then you will be running the same configure steps -- looking 
for basic glibc information over and over and over, causing a fairly expensive 
performance penalty.

>
>   #This function create a site config file
>   toolchain_create_sdk_siteconfig () {
> ---
>
> populate_sdk_base.bbclass inheric toolchain-scripts which adds the
> (unwanted) eglibc dependency.

It's not an "eglibc" dependency, it's a libc dependency.  You definitely want 
that!  Otherwise you can end up with an SDK w/o a libc...

> Maybe this should be conditional from TOOLCHAIN_TARGET_TASK value?  Or
> dependencies should be added only when calling
> task-core-standalone-sdk-target?
> In my use case, when I bitbake an image recipe, I don't want to deal
> with SDK.

I don't know the exact bitbake version numbers, but a fairly recent bitbake 
change (approx the same time as the patch you referred to) resolves an issue 
where un-used tasks were adding in build dependencies and causing the system to 
take longer to execute.)  So as long as you have a recent bitbake to match the 
recent oe-core, you should be ok.

> Concerning errors, is there a way to see what's not provided in order to
> fix virtual/libc message (bitbake -e) ?

bitbake -e, grep for PREFERRED_PROVIDER to see what you -do- have listed.. 
Otherwise no, you just have to go off of the error messages and add things until 
you've listed everything.

General rule of thumb, anything thats listed in the PROVIDES of the recipe will 
be needed in the PREFERRED_PROVIDER as well.

--Mark

> Best regards,
> Matthieu
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



