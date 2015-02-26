Return-Path: <bruno.bottazzini@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2CCDA60670
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 22:21:28 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 Feb 2015 14:21:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,655,1418112000"; d="scan'208";a="684058898"
Received: from bottazzini-thinkpad-t430.bz.intel.com (HELO [10.218.99.156])
	([10.218.99.156])
	by fmsmga002.fm.intel.com with ESMTP; 26 Feb 2015 14:21:27 -0800
Message-ID: <1424989287.2764.14.camel@bottazzini-ThinkPad-T430>
From: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
To: Randy Witt <randy.e.witt@linux.intel.com>
Date: Thu, 26 Feb 2015 19:21:27 -0300
In-Reply-To: <54EF93B1.2020902@linux.intel.com>
References: <bruno.bottazzini@intel.com>
	<1424978954-25411-1-git-send-email-bruno.bottazzini@intel.com>
	<54EF93B1.2020902@linux.intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: Darren Hart <dvhart@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mkefidisk: change filesystem to be writeable on grub
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
X-List-Received-Date: Thu, 26 Feb 2015 22:21:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit


On Qui, 2015-02-26 at 13:44 -0800, Randy Witt wrote:
> On 02/26/2015 11:29 AM, Bruno Bottazzini wrote:
> > This patch changes grub configuration so the filesystem will be writeable
> > instead, just read only when running the script.
> > ---
> >   scripts/contrib/mkefidisk.sh | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
> > index b96b7d4..9b84831 100755
> > --- a/scripts/contrib/mkefidisk.sh
> > +++ b/scripts/contrib/mkefidisk.sh
> > @@ -342,7 +342,7 @@ if [ -e "$GRUB_CFG" ]; then
> >   	sed -i "s/ LABEL=[^ ]*/ /" $GRUB_CFG
> >
> >   	sed -i "s@ root=[^ ]*@ @" $GRUB_CFG
> > -	sed -i "s@vmlinuz @vmlinuz root=$TARGET_ROOTFS ro rootwait quiet @" $GRUB_CFG
> > +	sed -i "s@vmlinuz @vmlinuz root=$TARGET_ROOTFS rw rootwait quiet @" $GRUB_CFG
> >   fi
> >
> >   # Look for a gummiboot installation
> >
> 
> This change basically reverts 
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=24cd3ddeb70a3d3f2985ec71c87ae0108f3d2777 
> by Darren. It also doesn't change the ro option when using gummiboot instead.
> 
> What is this change trying to fix?

Hello Randy,

I got the following message:
 "file system is read-only" 

if I try to touch a file that is not on /tmp, or when I start a systemd
service that tries to write on the file system.

After some research, I go it fixed by changing to read/write on the
script that was with read only.

I thought this would be useful for someone else.

Reading the patch you sent me, Darren says that a proper fstab will ensure
the rootfs is rw. 
Maybe I'm missing this. I will look for this to make sure that my fstab OK.

Thanks





