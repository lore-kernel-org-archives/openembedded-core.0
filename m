Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E988C76FD7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 14:15:04 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 29 Sep 2015 07:15:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,608,1437462000"; d="scan'208";a="570531139"
Received: from mbabyjoh-mobl.fi.intel.com ([10.237.68.37])
	by FMSMGA003.fm.intel.com with ESMTP; 29 Sep 2015 07:15:01 -0700
Date: Tue, 29 Sep 2015 12:28:45 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Randy Witt <randy.e.witt@linux.intel.com>
Message-ID: <20150929092845.GA28457@mbabyjoh-mobl.fi.intel.com>
References: <1443479903-32731-1-git-send-email-randy.e.witt@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1443479903-32731-1-git-send-email-randy.e.witt@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] runqemu-internal: Make sure two serial ports always exist
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
X-List-Received-Date: Tue, 29 Sep 2015 14:15:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


On Mon, Sep 28, 2015 at 03:38:23PM -0700, Randy Witt wrote:
> Since inittab for qemu images now always tries to start getty on a
> second serial device, make sure that device exists.
> 
> Otherwise the following message will be spammed:
>     INIT: Id "S1" respawning too fast: disabled for 5 minutes
> 
> [YOCTO #8374]
> 
> Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
> ---
>  scripts/runqemu-internal | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
> index d6b1102..078545e 100755
> --- a/scripts/runqemu-internal
> +++ b/scripts/runqemu-internal
> @@ -700,6 +700,38 @@ if [ "x$SERIALSTDIO" = "x1" ]; then
>          stty intr ^]
>  fi
>  
> +
> +# Preserve the multiplexing behavior for the monitor that would be there based
> +# on whether nographic is used.
> +if echo "$QEMUOPTIONS $SERIALOPTS $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT" | grep -- "-nographic"; then
> +    FIRST_SERIAL_OPT="-serial mon:stdio"
> +else
> +    FIRST_SERIAL_OPT="-serial mon:vc"
> +fi
> +
> +# qemuarm64 uses virtio for any additional serial ports so the normal mechanism
> +# of using -serial will not work
> +if [ "$MACHINE" = "qemuarm64" ]; then
> +    SECOND_SERIAL_OPT="$SCRIPT_QEMU_EXTRA_OPT -device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
> +else
> +    SECOND_SERIAL_OPT="-serial null"
> +fi
> +
> +# We always want a ttyS1. Since qemu by default adds a serial port when
> +# nodefaults is not specified, it seems that all that would be needed is to
> +# make sure a "-serial" is there. However, it appears that when "-serial" is
> +# specified, it ignores the default serial port that is normally added.
> +# So here we make sure to add two -serial if there are none. And only one
> +# if there is one -serial already.
> +NUM_SERIAL_OPTS=`echo $QEMUOPTIONS $SERIALOPTS $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT | sed -e 's/ /\n/g' | grep --count -- -serial`
> +
> +if [ "$NUM_SERIAL_OPTS" = "0" ]; then
> +    SCRIPT_QEMU_EXTRA_OPT="$SCRIPT_QEMU_EXTRA_OPT $FIRST_SERIAL_OPT $SECOND_SERIAL_OPT"
> +elif [ "$NUM_SERIAL_OPTS" = "1" ]; then
> +    SCRIPT_QEMU_EXTRA_OPT="$SCRIPT_QEMU_EXTRA_OPT $SECOND_SERIAL_OPT"
> +fi
> +
> +
>  echo "Running $QEMU..."
>  # -no-reboot is a mandatory option - see bug #100
>  if [ "$FSTYPE" = "vmdk" -o "$FSTYPE" = "hddimg" -o "$FSTYPE" = "hdddirect" ]; then
> -- 
> 2.4.3
>

Verified on qemux86 and qemuppc.

Reviewed-by: Maxin B. John <maxin.john@intel.com>

Best Regards,
Maxin

