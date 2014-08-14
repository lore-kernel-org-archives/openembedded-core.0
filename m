Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa06-07.prod.phx3.secureserver.net
	(p3plsmtpa06-07.prod.phx3.secureserver.net [173.201.192.108])
	by mail.openembedded.org (Postfix) with ESMTP id 5C9E160144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 10:13:44 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa06-07.prod.phx3.secureserver.net with 
	id eaDk1o00F1mTNtu01aDlbK; Thu, 14 Aug 2014 03:13:45 -0700
Message-ID: <53EC8BD8.1020602@pabigot.com>
Date: Thu, 14 Aug 2014 05:13:44 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1408002686-5641-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1408002686-5641-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH 1/3] gcc: Abstract long double configuration into python function
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
X-List-Received-Date: Thu, 14 Aug 2014 10:13:54 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 08/14/2014 02:51 AM, Khem Raj wrote:
> musl does not support IBM 128 long double for ppc, instead of
> doing complex overrides move it into a pythong snippet which
> is easier to read and more compact.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/recipes-devtools/gcc/gcc-common.inc           |    5 +++++
>   meta/recipes-devtools/gcc/gcc-configure-common.inc |    5 +----
>   2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
> index 66a18d9..e06b6ee 100644
> --- a/meta/recipes-devtools/gcc/gcc-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-common.inc
> @@ -25,6 +25,11 @@ def get_gcc_mips_plt_setting(bb, d):
>           return "--with-mips-plt"
>       return ""
>   
> +def get_long_double_setting(bb, d):
> +    if d.getVar('TRANSLATED_TARGET_ARCH', True) in [ 'powerpc', 'powerpc64' ] and d.getVar('TCLIBC', True) in [ 'uclibc', 'eglibc' ]:
> +        return "--with-long-double-128"
> +    return ""
> +
>   def get_gcc_multiarch_setting(bb, d):
>       target_arch = d.getVar('TRANSLATED_TARGET_ARCH', True)
>       multiarch_options = {
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> index 75fb379..3934bcb 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> @@ -46,6 +46,7 @@ EXTRA_OECONF = "${@['--enable-clocale=generic', ''][d.getVar('USE_NLS', True) !=
>                   ${EXTRA_OECONF_FPU} \
>                   ${EXTRA_OECONF_PATHS} \
>                   ${@get_gcc_mips_plt_setting(bb, d)} \
> +                ${@get_long_double_setting(bb, d)} \

This conflicted with my earlier whitespace patch to this file.  I've 
rebased it into my series for the next release, unless Khem objects.  
I'll resend that after some testing and further discussion of how to fix 
the C++11 ABI issue.

Patches 78129 and 78135 to gcc-cross-initial.inc do not conflict with my 
changes to the same file so I'm not planning to absorb them.

Peter

>                   ${@get_gcc_multiarch_setting(bb, d)}"
>   
>   export ac_cv_path_SED = 'sed'
> @@ -64,10 +65,6 @@ EXTRA_OECONF_append_mips64el    = " --with-abi=64 --with-arch-64=mips64 --with-t
>   EXTRA_OECONF_FPU ??= ""
>   CPPFLAGS = ""
>   
> -# powerpc needs this to comply with the ABI
> -EXTRA_OECONF_append_powerpc = " --with-long-double-128"
> -EXTRA_OECONF_append_powerpc64 = " --with-long-double-128"
> -
>   SYSTEMHEADERS = "${target_includedir}"
>   SYSTEMLIBS = "${target_base_libdir}/"
>   SYSTEMLIBS1 = "${target_libdir}/"


