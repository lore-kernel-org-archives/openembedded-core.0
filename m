Return-Path: <bruno.bottazzini@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 33E3460053
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 13:19:51 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 08 Sep 2015 06:19:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,490,1437462000"; d="scan'208";a="800032070"
Received: from bottazzini-thinkpad-t430.bz.intel.com (HELO [10.218.99.154])
	([10.218.99.154])
	by orsmga002.jf.intel.com with ESMTP; 08 Sep 2015 06:19:50 -0700
Message-ID: <1441718359.2545.31.camel@bottazzini-ThinkPad-T430>
From: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 08 Sep 2015 10:19:19 -0300
In-Reply-To: <1441405142-7497-2-git-send-email-bruno.bottazzini@intel.com>
References: <bruno.bottazzini@intel.com>
	<1441405142-7497-1-git-send-email-bruno.bottazzini@intel.com>
	<1441405142-7497-2-git-send-email-bruno.bottazzini@intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: Re: [PATCH] mkefidisk: Create interactive menu for the script
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
X-List-Received-Date: Tue, 08 Sep 2015 13:19:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Ping

On Fri, 2015-09-04 at 19:19 -0300, Bruno Bottazzini wrote:
> If it is passed only the image parameter, it will show some interactive
> options to help to conclude the script.
> 
> With this patch it will detect devices available in the machine, asking
> to choose what it is wanted to be flashed.
> 
> it will suggest the target device. If it is a SD card the suggestion
> is /dev/mmcblk0. If it is a pendrive it will suggest to use /dev/sda.
> 
> Signed-off-by: Bruno Bottazzini <bruno.bottazzini@intel.com>
> ---
>  scripts/contrib/mkefidisk.sh | 63 ++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 58 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
> index 55f72b0..66e0e58 100755
> --- a/scripts/contrib/mkefidisk.sh
> +++ b/scripts/contrib/mkefidisk.sh
> @@ -152,8 +152,55 @@ unmount() {
>  # Parse and validate arguments
>  #
>  if [ $# -lt 3 ] || [ $# -gt 4 ]; then
> -	usage
> -	exit 1
> +    if [ $# -eq 1 ]; then
> +        AVAILABLE_DISK=`lsblk | grep "disk" | cut -f 1 -d " "`
> +        X=0
> +        for disk in `echo $AVAILABLE_DISK`; do
> +            mounted=`blkid -o list | grep "/dev/$disk" | grep "not mounted"`
> +            if [ -n "$mounted" ]; then
> +                UNMOUNTED_AVAILABLES="$UNMOUNTED_AVAILABLES /dev/$disk\n"
> +                info "$X - /dev/$disk"
> +                X=`expr $X + 1`
> +            fi
> +        done
> +        if [ $X -eq 0 ]; then
> +            die "No unmounted device found."
> +        fi
> +        read -p "Choose unmounted device number: " DISK_NUMBER
> +        X=0
> +        for line in `echo $UNMOUNTED_AVAILABLES`; do
> +            if [ $DISK_NUMBER -eq $X ]; then
> +                DISK_TO_BE_FLASHED=$line
> +                break
> +            else
> +                X=`expr $X + 1`
> +            fi
> +        done
> +        if [ -z "$DISK_TO_BE_FLASHED" ]; then
> +            die "Option \"$DISK_NUMBER\" is invalid. Choose a valid option"
> +        else
> +            if [ -z `echo $DISK_TO_BE_FLASHED | grep "mmc"` ]; then
> +                TARGET_TO_BE_BOOT="/dev/sda"
> +            else
> +                TARGET_TO_BE_BOOT="/dev/mmcblk0"
> +            fi
> +        fi
> +        echo ""
> +        echo "Choose a name of the device that will be boot from"
> +        echo -n "Recommended name is: "
> +        info "$TARGET_TO_BE_BOOT\n"
> +        read -p "Is target device okay? [y/N]: " RESPONSE
> +        if [ "$RESPONSE" != "y" ]; then
> +            read -p "Choose target device name: " TARGET_TO_BE_BOOT
> +        fi
> +        echo ""
> +        if [ -z "$TARGET_TO_BE_BOOT" ]; then
> +            die "Error: choose a valid target name"
> +        fi
> +    else
> +        usage
> +	    exit 1
> +    fi
>  fi
>  
>  if [ "$1" = "-v" ]; then
> @@ -162,9 +209,15 @@ if [ "$1" = "-v" ]; then
>  	shift
>  fi
>  
> -DEVICE=$1
> -HDDIMG=$2
> -TARGET_DEVICE=$3
> +if [ -z "$AVAILABLE_DISK" ]; then
> +    DEVICE=$1
> +    HDDIMG=$2
> +    TARGET_DEVICE=$3
> +else
> +    DEVICE=$DISK_TO_BE_FLASHED
> +    HDDIMG=$1
> +    TARGET_DEVICE=$TARGET_TO_BE_BOOT
> +fi
>  
>  LINK=$(readlink $DEVICE)
>  if [ $? -eq 0 ]; then



