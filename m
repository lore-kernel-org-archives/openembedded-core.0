Return-Path: <bruno.bottazzini@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8D2B37702B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 13:32:27 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 Sep 2015 06:32:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,469,1437462000"; d="scan'208";a="782652485"
Received: from bottazzini-thinkpad-t430.bz.intel.com (HELO [10.218.99.154])
	([10.218.99.154])
	by fmsmga001.fm.intel.com with ESMTP; 04 Sep 2015 06:32:26 -0700
Message-ID: <1441373521.2545.19.camel@bottazzini-ThinkPad-T430>
From: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Fri, 04 Sep 2015 10:32:01 -0300
In-Reply-To: <55E8D96A.80403@linux.intel.com>
References: <bruno.bottazzini@intel.com>
	<1441135341-2048-1-git-send-email-bruno.bottazzini@intel.com>
	<55E8D96A.80403@linux.intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: "Hart, Darren" <darren.hart@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] scripts: Create interactive menu for mkefidisk script
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
X-List-Received-Date: Fri, 04 Sep 2015 13:32:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-09-03 at 16:36 -0700, Saul Wold wrote:
> On 09/01/2015 12:22 PM, Bruno Bottazzini wrote:
> > If it is passed only the image parameter, it will show some interactive
> > options to help to conclude the script.
> >
> > With this patch it will detect devices available in the machine, asking
> > to choose what it is wanted to be flashed.
> >
> > it will suggest the target device. If it is a SD card the suggestion
> > is /dev/mmcblk0. If it is a pendrive it will suggest to use /dev/sda.
> >
> 
> I am little concerned by this patch since it allows the root disk to be 
> selected, even if someone can type it on the command line, but offering 
> it in list would make someone believe that it was OK.

You are totally right. 

However, the script already warn and handles this kind of situation. 
Also, this gives free will to the user. I don't see this as problem but
something, besides as you have told the user may pass it as argument
too. Maybe we can change the header message telling "all detect storage"
or something like this?

I was wondering if the user wants to flash a H.D. when running a live CD
and then maybe the root may be a right choice.

Since I have started using this patch, it got really faster when it
comes flashing the device (I don't have to remember parameters every
time). I think this will be a really good new feature for this script.

> 
> 
> > Signed-off-by: Bruno Bottazzini <bruno.bottazzini@intel.com>
> > ---
> >   scripts/contrib/mkefidisk.sh | 60 ++++++++++++++++++++++++++++++++++++++++----
> >   1 file changed, 55 insertions(+), 5 deletions(-)
> >
> > diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
> > index 55f72b0..7628de7 100755
> > --- a/scripts/contrib/mkefidisk.sh
> > +++ b/scripts/contrib/mkefidisk.sh
> > @@ -152,8 +152,52 @@ unmount() {
> >   # Parse and validate arguments
> >   #
> >   if [ $# -lt 3 ] || [ $# -gt 4 ]; then
> > -	usage
> > -	exit 1
> > +    if [ $# -eq 1 ]; then
> > +        AVAILABLE_DISK=`fdisk -l | grep "Disk /" | cut -f 1 -d ':' | cut -f 2 -d ' '`
> > +        if [ -z "$AVAILABLE_DISK" ]; then
> > +            die "Starting mkefidisk.sh as root is required"
> > +        fi
> > +        echo "Available disks are"
> > +        X=0
> > +        for line in `echo $AVAILABLE_DISK`; do
> > +            info "$X - $line"
> > +            X=`expr $X + 1`
> > +        done
> > +        read -p "Choose flashable device number: " DISK_NUMBER
> > +        X=0
> > +        for line in `echo $AVAILABLE_DISK`; do
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
> The \n usage is probably wrong here.
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
> > @@ -162,9 +206,15 @@ if [ "$1" = "-v" ]; then
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
> >   LINK=$(readlink $DEVICE)
> >   if [ $? -eq 0 ]; then
> >



