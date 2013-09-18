Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id F22E76023B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 13:58:56 +0000 (UTC)
Received: by mail-la0-f45.google.com with SMTP id eh20so5750682lab.32
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 06:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=8tTc0uG3Mj/4tf7YpnsRNwGAMIaasd7TsoNAEizWx3M=;
	b=Y9Udpv3y2K/+ne1YZt+bSwFLgsZsuxELOyW7FaJ1JZCHwwUhq/K8M+zHPrPTu+/zGl
	WVCpcBukqSnbHat8rEmsoQh1B6cuOeE6eZRtLQoCyCLYZMrG12SvIWTs8/iq8NmBYPKE
	aGOXsgwXY9y9buzzo3dS6LTA6mKMfFYA9Pt8anWT++Ve4ooHMBoQt2/NgxXt5eee1q29
	c8t6VYFuaMc6WKQIC/cvM3TBorkKutxDAwRSEQ1sON0iPqOOJA3zUbM6azjJB+rBGZQf
	hqJXB/smvz0NZ668LrL7nKHF5H/d984KKsy6ra5gkMUa90nw55L4W5XIbsGEH8G4Jbkt
	KG2g==
MIME-Version: 1.0
X-Received: by 10.152.29.103 with SMTP id j7mr34109601lah.7.1379512734108;
	Wed, 18 Sep 2013 06:58:54 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Wed, 18 Sep 2013 06:58:54 -0700 (PDT)
In-Reply-To: <1379512264-8755-1-git-send-email-otavio@ossystems.com.br>
References: <1379512264-8755-1-git-send-email-otavio@ossystems.com.br>
Date: Wed, 18 Sep 2013 09:58:54 -0400
Message-ID: <CADkTA4O=WqnNCdUogbhMTCzWxqqg1DTXQwuLSYUUPT+xCEXvpQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: Add LDFLAGS to allow build of old kernels without patching
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
X-List-Received-Date: Wed, 18 Sep 2013 13:58:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Sep 18, 2013 at 9:51 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> The LDFLAGS is required or some old kernels fails due missing
> symbols and this is preferred than requiring patches to every old
> supported kernel.
>
> Fixes [YOCTO: #5221]
>

Confirmed here as well, I was able to build my perf tests, and the meta-fsl-ppc
ones have been confirmed in the bug, and with Otavio's confirmation here .. we
should be good to go .. I hope :)

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Cheers,

Bruce

> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/recipes-kernel/perf/perf.bb | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index 4a815ff..269069f 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -60,6 +60,11 @@ B = "${WORKDIR}/${BPN}-${PV}"
>  SCRIPTING_DEFINES = "${@perf_feature_enabled('perf-scripting', '', 'NO_LIBPERL=1 NO_LIBPYTHON=1',d)}"
>  TUI_DEFINES = "${@perf_feature_enabled('perf-tui', '', 'NO_NEWT=1',d)}"
>
> +# The LDFLAGS is required or some old kernels fails due missing
> +# symbols and this is preferred than requiring patches to every old
> +# supported kernel.
> +LDFLAGS="-ldl -lutil"
> +
>  EXTRA_OEMAKE = \
>                 '-C ${S}/tools/perf \
>                 O=${B} \
> @@ -88,13 +93,13 @@ PARALLEL_MAKE = ""
>
>  do_compile() {
>         # Linux kernel build system is expected to do the right thing
> -       unset CFLAGS LDFLAGS
> +       unset CFLAGS
>         oe_runmake all
>  }
>
>  do_install() {
>         # Linux kernel build system is expected to do the right thing
> -       unset CFLAGS LDFLAGS
> +       unset CFLAGS
>         oe_runmake DESTDIR=${D} install
>         # we are checking for this make target to be compatible with older perf versions
>         if [ "${@perf_feature_enabled('perf-scripting', 1, 0, d)}" = "1" -a $(grep install-python_ext ${S}/tools/perf/Makefile) = "0"]; then
> --
> 1.8.4.rc3
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

