Return-Path: <bruno.bottazzini@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 48B1073D27
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 16:54:05 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 08 Sep 2015 09:54:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,491,1437462000"; d="scan'208";a="640827760"
Received: from bottazzini-thinkpad-t430.bz.intel.com (HELO [10.218.99.154])
	([10.218.99.154])
	by orsmga003.jf.intel.com with ESMTP; 08 Sep 2015 09:54:04 -0700
Message-ID: <1441731212.2545.41.camel@bottazzini-ThinkPad-T430>
From: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 08 Sep 2015 13:53:32 -0300
In-Reply-To: <55EEFB75.7050300@linux.intel.com>
References: <bruno.bottazzini@intel.com>
	<1441405142-7497-1-git-send-email-bruno.bottazzini@intel.com>
	<1441405142-7497-2-git-send-email-bruno.bottazzini@intel.com>
	<55EEFB75.7050300@linux.intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 08 Sep 2015 16:54:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-09-08 at 08:15 -0700, Saul Wold wrote:
> On 09/04/2015 03:19 PM, Bruno Bottazzini wrote:
> > If it is passed only the image parameter, it will show some interactive
> > options to help to conclude the script.
> >
> > With this patch it will detect devices available in the machine, asking
> > to choose what it is wanted to be flashed.
> >
> > it will suggest the target device. If it is a SD card the suggestion
> > is /dev/mmcblk0. If it is a pendrive it will suggest to use /dev/sda.
> >
> > Signed-off-by: Bruno Bottazzini <bruno.bottazzini@intel.com>
> > ---
> >   scripts/contrib/mkefidisk.sh | 63 ++++++++++++++++++++++++++++++++++++++++----
> >   1 file changed, 58 insertions(+), 5 deletions(-)
> >
> > diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
> > index 55f72b0..66e0e58 100755
> > --- a/scripts/contrib/mkefidisk.sh
> > +++ b/scripts/contrib/mkefidisk.sh
> > @@ -152,8 +152,55 @@ unmount() {
> >   # Parse and validate arguments
> >   #
> >   if [ $# -lt 3 ] || [ $# -gt 4 ]; then
> > -	usage
> > -	exit 1
> > +    if [ $# -eq 1 ]; then
> > +        AVAILABLE_DISK=`lsblk | grep "disk" | cut -f 1 -d " "`
> > +        X=0
> > +        for disk in `echo $AVAILABLE_DISK`; do
> > +            mounted=`blkid -o list | grep "/dev/$disk" | grep "not mounted"`
> Is there any way to not call blkid multiple time (ie save the output and 
> use it once?

Unfortunately no, both outputs are different.

> 
> 
> Are the lsblk and blkid commands guaranteed to be installed on most 
> machines?

I double checked it before sending this patch and the answer was yes.

> 
> Also this seems to have matched my root disk, which again concerns me, I 
> am still not convinced that a selection system like this is safe.

This is odd. My output shows only unmounted disks.

> 
> > +            if [ -n "$mounted" ]; then
> > +                UNMOUNTED_AVAILABLES="$UNMOUNTED_AVAILABLES /dev/$disk\n"
> 
> I think the \n is not needed here, what shell are you using, with Bash I 
> get the following output:
> 
> 0 - /dev/sda
> 1 - /dev/sdb
> 2 - /dev/mmcblk0
> Choose unmounted device number: 1

This output is strange mine shows only (without sda and sdb which i do
have them also, but mounted):
        contrib > ./mkefidisk.sh image
        0 - /dev/mmcblk0
        Choose unmounted device number:

Are you sure you have updated the script with the changes? What distro
are you using?

> 
> Choose a name of the device that will be boot from
> Recommended name is: /dev/sda\n
> Is target device okay? [y/N]: y
> 
> Usage: mkefidisk.sh [-v] DEVICE HDDIMG TARGET_DEVICE
>         -v: Verbose debug
>         DEVICE: The device to write the image to, e.g. /dev/sdh
>         HDDIMG: The hddimg file to generate the efi disk from
>         TARGET_DEVICE: The device the target will boot from, e.g. 
> /dev/mmcblk0
> Device /dev/sdb\n cannot be found
> 
> Note the \n above in the choose a name and then the trailing \n here 
> with the device not being found.

You are right I am removing \n. Strangely here it works perfectly:
        0 - /dev/sdc
        1 - /dev/mmcblk0
        Choose unmounted device number: 1
        
        Choose a name of the device that will be boot from
        Recommended name is: /dev/mmcblk0
        Is target device okay? [y/N]: y


> 
> 
> 
> > +                info "$X - /dev/$disk"
> > +                X=`expr $X + 1`
> > +            fi
> > +        done
> > +        if [ $X -eq 0 ]; then
> > +            die "No unmounted device found."
> > +        fi
> > +        read -p "Choose unmounted device number: " DISK_NUMBER
> > +        X=0
> > +        for line in `echo $UNMOUNTED_AVAILABLES`; do
> > +            if [ $DISK_NUMBER -eq $X ]; then
> > +                DISK_TO_BE_FLASHED=$line
> > +                break
> > +            else
> > +                X=`expr $X + 1`
> > +            fi
> > +        done
> > +        if [ -z "$DISK_TO_BE_FLASHED" ]; then
> > +            die "Option \"$DISK_NUMBER\" is invalid. Choose a valid option"
> > +        else
> > +            if [ -z `echo $DISK_TO_BE_FLASHED | grep "mmc"` ]; then
> > +                TARGET_TO_BE_BOOT="/dev/sda"
> > +            else
> > +                TARGET_TO_BE_BOOT="/dev/mmcblk0"
> > +            fi
> > +        fi
> > +        echo ""
> > +        echo "Choose a name of the device that will be boot from"
> > +        echo -n "Recommended name is: "
> > +        info "$TARGET_TO_BE_BOOT\n"
> 
> You are still outputting the \n here

Removed too

Thank you a lot,

Bruno

> 
> > +        read -p "Is target device okay? [y/N]: " RESPONSE
> > +        if [ "$RESPONSE" != "y" ]; then
> > +            read -p "Choose target device name: " TARGET_TO_BE_BOOT
> > +        fi
> > +        echo ""
> > +        if [ -z "$TARGET_TO_BE_BOOT" ]; then
> > +            die "Error: choose a valid target name"
> > +        fi
> > +    else
> > +        usage
> > +	    exit 1
> > +    fi
> >   fi
> >
> >   if [ "$1" = "-v" ]; then
> > @@ -162,9 +209,15 @@ if [ "$1" = "-v" ]; then
> >   	shift
> >   fi
> >
> > -DEVICE=$1
> > -HDDIMG=$2
> > -TARGET_DEVICE=$3
> > +if [ -z "$AVAILABLE_DISK" ]; then
> > +    DEVICE=$1
> > +    HDDIMG=$2
> > +    TARGET_DEVICE=$3
> > +else
> > +    DEVICE=$DISK_TO_BE_FLASHED
> > +    HDDIMG=$1
> > +    TARGET_DEVICE=$TARGET_TO_BE_BOOT
> > +fi
> >
> This change I like, if done with checking for 2 parameter (image and 
> disk to flash, the 3 paramter can be determined as you have with best 
> guess of /dev/sda if it's an sd and mmc if it's a /dev/mmc flash device.
> 
> Sau!
> 
> 
> >   LINK=$(readlink $DEVICE)
> >   if [ $? -eq 0 ]; then
> >



