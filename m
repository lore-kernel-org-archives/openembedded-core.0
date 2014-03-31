Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5A3E76EDF9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 16:49:57 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 31 Mar 2014 09:49:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,766,1389772800"; d="scan'208";a="503659229"
Received: from ranerica-desk01.sc.intel.com (HELO [10.3.52.86]) ([10.3.52.86])
	by fmsmga001.fm.intel.com with ESMTP; 31 Mar 2014 09:49:47 -0700
Message-ID: <1396284511.2792.120.camel@ranerica-desk01>
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Mon, 31 Mar 2014 09:48:31 -0700
In-Reply-To: <1395344133-7310-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
References: <1395344133-7310-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] runqemu: Add option for custom BIOS directory
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
X-List-Received-Date: Mon, 31 Mar 2014 16:50:05 -0000
Content-Type: text/plain; charset="TIS-620"
Content-Transfer-Encoding: 7bit

On Thu, 2014-03-20 at 12:35 -0700, Ricardo Neri wrote:
> Add support to specify a directory for custom BIOS, VGA BIOS and
> keymaps as supported by qemu (-L option). Even though this can be
> done through qemuparams, having this option provides better user
> experience by not having to specify a long and cluttered path along
> with other qemuparams that the user might want to specify.
> 
> This new options assumes first that the path provided is relative to
> OECORE_NATIVE_SYSROOT and will check whether it exists before proceeding.
> If not, it will treat the provided path as absolute. This provides
> the user flexibility to use BIOS binaries generated inside or outside
> the OE build environment.
> 
> Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
> ---
>  scripts/runqemu | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 619ffb6..b1d2d1a 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -149,6 +149,9 @@ while true; do
>              SCRIPT_KERNEL_OPT="$SCRIPT_KERNEL_OPT console=ttyS0"
>              SERIALSTDIO="1"
>              ;;
> +	"biosdir="*)
> +            CUSTOMBIOSDIR="${arg##biosdir=}"
> +	    ;;
>          "qemuparams="*)
>              SCRIPT_QEMU_EXTRA_OPT="${arg##qemuparams=}"
>  
> @@ -489,5 +492,21 @@ if [ ! -f "$INTERNAL_SCRIPT" -o ! -r "$INTERNAL_SCRIPT" ]; then
>  INTERNAL_SCRIPT=`which runqemu-internal`
>  fi
>  
> +# Specify directory for BIOS, VGA BIOS and keymaps
> +if [ ! -z "$CUSTOMBIOSDIR" ]; then
> +    if [ -d "$OECORE_NATIVE_SYSROOT/$CUSTOMBIOSDIR" ]; then
> +        echo "Assuming biosdir is $OECORE_NATIVE_SYSROOT/$CUSTOMBIOSDIR"
> +        SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -L $OECORE_NATIVE_SYSROOT/$CUSTOMBIOSDIR"
> +    else
> +        if [ ! -d "$CUSTOMBIOSDIR" ]; then
> +            echo "Custom BIOS directory not found. Tried: $CUSTOMBIOSDIR"
> +            echo "and $OECORE_NATIVE_SYSROOT/$CUSTOMBIOSDIR"
> +            exit 1;
> +        fi
> +        echo "Assuming biosdir is $CUSTOMBIOSDIR"
> +        SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -L $CUSTOMBIOSDIR"
> +    fi
> +fi
> +
>  . $INTERNAL_SCRIPT
>  exit $?

Hi!

I just wanted to check if there are comments about this patch.

BR,
Ricardo



