Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Swaja-0000d9-NQ
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 17:21:15 +0200
Received: by eaad12 with SMTP id d12so667011eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 08:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=SFYnKKqpQab5mdxP3vyX2V/e7isjBDWGSvZA/JMTlmY=;
	b=n7jG6u5w5USN10HE1PKxqT758icBzhR/NqfGz46gitNT5aBxq50ruPdYeRNsxkABlv
	SOTcnOy4jFY/jsMcAbpbkWrnNg7xpRy5ZwOgVuqnuZVb4Taauiv+9t0d4BMD88rS71NM
	VwE8Pu4emucmCQ2zaMFgfxCWGnzOZhDIMr54WInJQAZPCWUHsF74dMJGyS+AzSbMoKwh
	wzpuvJRujdnhnZq2ta3of0rm8rHVV1nCHcCF5v6SqCFTHMiQ/jwY5RuvFUZPiPRzv2Kq
	vU8DhkPTHRVCXaoneVKMJvXhpwZDtNciBfB/up7dEJLDnERPNQhdFtaFuA4y86jXAD4F
	UAgg==
Received: by 10.14.211.6 with SMTP id v6mr22548810eeo.29.1343833776532; Wed,
	01 Aug 2012 08:09:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.97.141 with HTTP; Wed, 1 Aug 2012 08:09:04 -0700 (PDT)
In-Reply-To: <1343808455.9756.51.camel@ted>
References: <1343808455.9756.51.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Aug 2012 08:09:04 -0700
Message-ID: <CAMKF1sr9SY=GLhKh61zzGNUZeqiAxxjFV8sZaYTki1EchVeKtA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-configure-target: Set native-system-header-dir for target gcc
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
X-List-Received-Date: Wed, 01 Aug 2012 15:21:15 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 1, 2012 at 1:07 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Without this set, in the case host=target (which it does for on-target
> gcc), the native header directory is set to the target sysroot with
> no prefix. This means it would look for sdt.h on the build system
> instead of in the target headers and this can lead to build failures
> and is host contamination of the build.
>
> The correct fix is to explicitly set the native header directory to
> the correct location and then the headers get detected correctly.

one concern I think is what will happen to gxxinclude dir if this is
set. if it will become relative to native headers dir as well
I think you have to try it out the compiler on target

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-target.inc b/meta/recipes-devtools/gcc/gcc-configure-target.inc
> index b2f91b7..f41301f 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-target.inc
> @@ -3,4 +3,5 @@ require gcc-configure-common.inc
>  EXTRA_OECONF_PATHS = " \
>      --with-sysroot=/ \
>      --with-build-sysroot=${STAGING_DIR_TARGET} \
> +    --with-native-system-header-dir=${STAGING_DIR_TARGET}${target_includedir} \
>      --with-gxx-include-dir=${includedir}/c++/"
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


