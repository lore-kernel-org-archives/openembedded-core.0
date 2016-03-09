Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E32AA60721
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 17:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u29HQW4C012039; Wed, 9 Mar 2016 17:26:32 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id RtdqmPC4R8pg; Wed,  9 Mar 2016 17:26:32 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u29HQSDu012036
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 9 Mar 2016 17:26:29 GMT
Message-ID: <1457544388.2804.179.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>,
	openembedded-core@lists.openembedded.org, ross.burton@intel.com
Date: Wed, 09 Mar 2016 17:26:28 +0000
In-Reply-To: <d32227aaa1bf8acd225f695857056f1b5dc77efc.1457522031.git.hongxu.jia@windriver.com>
References: <cover.1457522031.git.hongxu.jia@windriver.com>
	<d32227aaa1bf8acd225f695857056f1b5dc77efc.1457522031.git.hongxu.jia@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] tune-ppce500v2.inc: explicitly set gcc float
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
X-List-Received-Date: Wed, 09 Mar 2016 17:26:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-03-09 at 06:18 -0500, Hongxu Jia wrote:
> For powerpc*-*-*spe*, default to with_cpu=8548 if --enable-e500
> -double,
> and to 8540 otherwise.
> vim gcc/config.gcc
> ...
>     powerpc*-*-*spe*)
>       if test x$enable_e500_double = xyes; then
>          with_cpu=8548
>       else
>          with_cpu=8540
>       fi
>       ;;
> ...
> 
> The with_cpu is used for SPE version detection
> vim ./gcc/config/rs6000/t-linux
> ...
>   7 ifneq (,$(findstring spe,$(target)))
>   8 MULTIARCH_DIRNAME := powerpc-linux-gnuspe$(if $(findstring
> 8548,$(with_cpu)),,v1)
>   9 else
>  10 MULTIARCH_DIRNAME := powerpc-linux-gnu
> ...
> 
> The variable MULTIARCH_DIRNAME is the output of '$CC --print
> -multiarch'.
> Without this patch, the output is 'powerpc-linux-gnuspev1' which
> caused
> python3 do_configure failed.
> 
> Since ppce500v2 -mcpu is 8548, explicitly add --enable-e500-double
> could fix
> the issue.
> 
> [YOCTO #9226]
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/conf/machine/include/tune-ppce500v2.inc | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta/conf/machine/include/tune-ppce500v2.inc
> b/meta/conf/machine/include/tune-ppce500v2.inc
> index 20a5f25..70d3078 100644
> --- a/meta/conf/machine/include/tune-ppce500v2.inc
> +++ b/meta/conf/machine/include/tune-ppce500v2.inc
> @@ -18,3 +18,7 @@ AVAILTUNES += "ppce500v2"
>  TUNE_FEATURES_tune-ppce500v2 = "m32 spe ppce500v2"
>  TUNE_PKGARCH_tune-ppce500v2 = "ppce500v2"
>  PACKAGE_EXTRA_ARCHS_tune-ppce500v2 = "ppce500v2"
> +
> +# For powerpc*-*-*spe*, default to with_cpu=8548 if
> +# --enable-e500-double, and to 8540 otherwise.
> +EXTRA_OECONF_GCC_FLOAT += "${@get_gcc_float_setting(bb, d)}"

This is good to understand what is breaking but the patch as it stands
can't be merged as the gcc recipe intentionally doesn't do this, its
only done in gcc-target.inc.

Why?

The theory is we should be building one gcc-cross-powerpc, not multiple
different variants. I did just try a build and realised that switching
machines between p1022ds and qemuppc does rebuild gcc-cross-powerpc but
that is a bug. Adding the above is just going to make this harder to
fix, and will certainly break the SDK gcc-cross-canadian-gcc.

I'm not sure how we should fix this, particularly given that gcc-cross
-powerpc already isn't working properly but the avoid fix isn't right.

Cheers,

Richard





