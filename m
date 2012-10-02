Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TIxBk-0003iH-Bc
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 09:46:44 +0200
Received: by eeit10 with SMTP id t10so2348824eei.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Oct 2012 00:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=HthU01zwiRnq+7QQlcUWA0KWDqQiskSgnZF9wroRpqE=;
	b=V+dNzEgJWTgI8w7630uqVgwAXZAUdXy7dbRieKOVtCTVfclJA9GDyPQ/hXVvq5b40e
	E241yyDYUq2cA65+oGPkMW2Tpgt9cVLJNM3KxZ4Ha3QiGIpLxzmLd8iN0MSL+z4ZTD+6
	WmB4UyEsrLQvAEv0lPKLAs87omWloCCnjFkZ89y43V30czo36rhQhtLRSuyVcCnDQr4i
	myjlZzSFuXptpc26lFFZ0fLp4FlOGkeWt8PjJf21/5JvTZUGlrO4CIiugdzqRGFv72cf
	Cgn3MgRC3DCGpR5aJ9mxtTDvKZdA8ngNEs5wsXUIBvLPDfl2CnkpzVggtskat0jg4Q1o
	tf1A==
Received: by 10.14.202.131 with SMTP id d3mr21201797eeo.32.1349163226253; Tue,
	02 Oct 2012 00:33:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.173.69 with HTTP; Tue, 2 Oct 2012 00:33:16 -0700 (PDT)
In-Reply-To: <1349156215-16686-1-git-send-email-raj.khem@gmail.com>
References: <1349156215-16686-1-git-send-email-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Oct 2012 00:33:16 -0700
Message-ID: <CAMKF1soLwgEoyR0RkYLpjsGGNi07gLsjVcZtzbR=arHuGt9wbg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] binutils-crossdk: Fix interp size expansion
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Oct 2012 07:46:44 -0000
Content-Type: text/plain; charset=UTF-8

i need to check it with 1 more case. Please hold on for applying it. I
welcome testing

On Mon, Oct 1, 2012 at 10:36 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Currently for sdk binutils we expand the size of .interp
> section to 0x1000 assuming that its at the beginning of
> the linker map but there may be program header before that
> so actually we want to add 0x1000 - sizeof(.interp) section
> to current location and not assign is absolutely to 0x1000
>
> This fixes errors like
>
> built in linker script:11 cannot move location counter backwards (from
> 0000000000401054 to 0000000000401000)
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../binutils/binutils-crosssdk_2.22.bb             |    2 +-
>  .../binutils/binutils/relocatable_sdk.patch        |   10 +++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb
> index c936549..d3c25b6 100644
> --- a/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb
> +++ b/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb
> @@ -2,7 +2,7 @@ require binutils-cross_${PV}.bb
>
>  inherit crosssdk
>
> -PR = "r1"
> +PR = "r2"
>
>  PROVIDES = "virtual/${TARGET_PREFIX}binutils-crosssdk"
>
> diff --git a/meta/recipes-devtools/binutils/binutils/relocatable_sdk.patch b/meta/recipes-devtools/binutils/binutils/relocatable_sdk.patch
> index 33f9e68..4a2494a 100644
> --- a/meta/recipes-devtools/binutils/binutils/relocatable_sdk.patch
> +++ b/meta/recipes-devtools/binutils/binutils/relocatable_sdk.patch
> @@ -7,16 +7,16 @@ by the relocating script.
>
>  Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
>
> -Index: binutils-2.22/ld/scripttempl/elf.sc
> +Index: git/ld/scripttempl/elf.sc
>  ===================================================================
> ---- binutils-2.22.orig/ld/scripttempl/elf.sc
> -+++ binutils-2.22/ld/scripttempl/elf.sc
> -@@ -116,7 +116,7 @@ if test -n "${COMMONPAGESIZE}"; then
> +--- git.orig/ld/scripttempl/elf.sc     2012-10-01 21:42:18.729294685 -0700
> ++++ git/ld/scripttempl/elf.sc  2012-10-01 22:26:35.149173335 -0700
> +@@ -125,7 +125,7 @@
>     DATA_SEGMENT_RELRO_END=". = DATA_SEGMENT_RELRO_END (${SEPARATE_GOTPLT-0}, .);"
>   fi
>   if test -z "${INITIAL_READONLY_SECTIONS}${CREATE_SHLIB}"; then
>  -  INITIAL_READONLY_SECTIONS=".interp       ${RELOCATING-0} : { *(.interp) }"
> -+  INITIAL_READONLY_SECTIONS=".interp       ${RELOCATING-0} : { *(.interp); . = 0x1000; }"
> ++  INITIAL_READONLY_SECTIONS=".interp       ${RELOCATING-0} : { *(.interp); . = (. & 0x1000) + 0x1000; }"
>   fi
>   if test -z "$PLT"; then
>     IPLT=".iplt         ${RELOCATING-0} : { *(.iplt) }"
> --
> 1.7.9.5
>


