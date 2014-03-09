Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id F1CB06F4E7
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Mar 2014 08:09:27 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Mar 2014 00:09:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,617,1389772800"; d="scan'208";a="494907575"
Received: from unknown (HELO [10.255.12.212]) ([10.255.12.212])
	by fmsmga002.fm.intel.com with ESMTP; 09 Mar 2014 00:09:28 -0800
Message-ID: <531C21B8.3000308@linux.intel.com>
Date: Sun, 09 Mar 2014 00:09:28 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1394238610-25905-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
In-Reply-To: <1394238610-25905-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][resend] runqemu: Add option for custom BIOS directory
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
X-List-Received-Date: Sun, 09 Mar 2014 08:09:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/2014 04:30 PM, Ricardo Neri wrote:
> Add support to specify a directory for custom BIOS, VGA BIOS and
> keymaps as supported by qemu (-L option). Even though this can be
> done through qemuparams, having this option provides better user
> experience by not having to specify a long and cluttered path along
> other qemuparams that the user might want to specify.
>
> This new options assumes that the path provided is relative to
> OECORE_NATIVE_SYSROOT and will check whether it exists before proceeding.
>
> Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
> ---
>   scripts/runqemu | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 619ffb6..9eff90d 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -149,6 +149,9 @@ while true; do
>               SCRIPT_KERNEL_OPT="$SCRIPT_KERNEL_OPT console=ttyS0"
>               SERIALSTDIO="1"
>               ;;
> +	"biosdir="*)
> +            CUSTOMBIOSDIR="${arg##biosdir=}"
> +	    ;;
>           "qemuparams="*)
>               SCRIPT_QEMU_EXTRA_OPT="${arg##qemuparams=}"
>
> @@ -489,5 +492,16 @@ if [ ! -f "$INTERNAL_SCRIPT" -o ! -r "$INTERNAL_SCRIPT" ]; then
>   INTERNAL_SCRIPT=`which runqemu-internal`
>   fi
>
> +# Specify directory for BIOS, VGA BIOS and keymaps
> +if [ ! -z "$CUSTOMBIOSDIR" ]; then
> +    if [ -d "$OECORE_NATIVE_SYSROOT/$CUSTOMBIOSDIR" ]; then
I don't think we should be assuming anything here, if the direcotry is 
passed then it should be given that it is an accurate path to the 
directory that contains the customer bios, don't make people second gess 
that it needs to be in the native sysroot.

Sau!

> +           echo "Assuming $CUSTOMBIOSDIR really means $OECORE_NATIVE_SYSROOT/$CUSTOMBIOSDIR"
> +           SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -L $OECORE_NATIVE_SYSROOT/$CUSTOMBIOSDIR"
> +       else
> +           echo "Custom BIOS directory $OECORE_NATIVE_SYSROOT/$CUSTOMBIOSDIR not found."
> +           exit 1;
> +    fi
> +fi
> +
>   . $INTERNAL_SCRIPT
>   exit $?
>

