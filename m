Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QWEXn-0001Ko-Si
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 23:19:36 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 13 Jun 2011 14:16:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,360,1304319600"; d="scan'208";a="14050637"
Received: from miles.jf.intel.com (HELO [10.7.199.83]) ([10.7.199.83])
	by orsmga001.jf.intel.com with ESMTP; 13 Jun 2011 14:16:10 -0700
Message-ID: <4DF67E19.8060808@intel.com>
Date: Mon, 13 Jun 2011 14:16:09 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1307985976-22648-1-git-send-email-anders@chargestorm.se>
In-Reply-To: <1307985976-22648-1-git-send-email-anders@chargestorm.se>
Subject: Re: [PATCH] runqemu: take TMPDIR from bitbake
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
X-List-Received-Date: Mon, 13 Jun 2011 21:19:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/13/2011 10:26 AM, Anders Darander wrote:
> The old standard of using /home/anders/openembedded-core/build/tmp as TMPDIR do not work any longer,
> as - is appended to the real TMPDIR. Thus, always take TMPDIR from
> bitbake, unless TMPDIR is set in the environment.
>
> Signed-off-by: Anders Darander<anders@chargestorm.se>

Thanks for this improvement!

Acked-by: Scott Garman <scott.a.garman@intel.com>

> ---
>   scripts/runqemu |   22 +++++++++-------------
>   1 files changed, 9 insertions(+), 13 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index a09362c..aa44070 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -262,20 +262,16 @@ SPITZ_DEFAULT_ROOTFS="core-image-sato"
>
>   setup_tmpdir() {
>       if [ -z "$TMPDIR" ]; then
> -        if [ "x$BUILDDIR" = "x" -o ! -d "$BUILDDIR/tmp" ]; then
> -            # BUILDDIR unset, try and get TMPDIR from bitbake
> -            type -P bitbake&>/dev/null || {
> -                echo "In order for this script to dynamically infer paths";
> -                echo "to kernels or filesystem images, you either need";
> -                echo "bitbake in your PATH or to source oe-init-build-env";
> -                echo "before running this script">&2;
> -                exit 1; }
> -
> -            # We have bitbake in PATH, get TMPDIR from bitbake
> -            TMPDIR=`bitbake -e | grep TMPDIR=\" | cut -d '=' -f2 | cut -d '"' -f2`
> -        else
> -            TMPDIR=$BUILDDIR/tmp
> -        fi
> +        # BUILDDIR unset, try and get TMPDIR from bitbake
> +        type -P bitbake&>/dev/null || {
> +            echo "In order for this script to dynamically infer paths";
> +            echo "to kernels or filesystem images, you either need";
> +            echo "bitbake in your PATH or to source oe-init-build-env";
> +            echo "before running this script">&2;
> +            exit 1; }
> +
> +        # We have bitbake in PATH, get TMPDIR from bitbake
> +        TMPDIR=`bitbake -e | grep TMPDIR=\" | cut -d '=' -f2 | cut -d '"' -f2`
>       fi
>   }
>


-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


