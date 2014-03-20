Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1996A6CA54
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 03:28:56 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Mar 2014 20:28:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,691,1389772800"; d="scan'208";a="476117003"
Received: from ranerica-desk01.sc.intel.com (HELO [10.3.52.86]) ([10.3.52.86])
	by orsmga001.jf.intel.com with ESMTP; 19 Mar 2014 20:28:48 -0700
Message-ID: <1395286051.2792.79.camel@ranerica-desk01>
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 19 Mar 2014 20:27:31 -0700
In-Reply-To: <1395238671.3808.122.camel@ted>
References: <1394238610-25905-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
	<531C21B8.3000308@linux.intel.com>
	<1394507658.2792.23.camel@ranerica-desk01>
	<1395097374.2792.58.camel@ranerica-desk01>
	<1395238671.3808.122.camel@ted>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
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
X-List-Received-Date: Thu, 20 Mar 2014 03:28:59 -0000
Content-Type: text/plain; charset="TIS-620"
Content-Transfer-Encoding: 7bit

On Wed, 2014-03-19 at 14:17 +0000, Richard Purdie wrote:
> On Mon, 2014-03-17 at 16:02 -0700, Ricardo Neri wrote:
> > On Mon, 2014-03-10 at 20:14 -0700, Ricardo Neri wrote:
> > > On Sun, 2014-03-09 at 00:09 -0800, Saul Wold wrote:
> > > > On 03/07/2014 04:30 PM, Ricardo Neri wrote:
> > > > > Add support to specify a directory for custom BIOS, VGA BIOS and
> > > > > keymaps as supported by qemu (-L option). Even though this can be
> > > > > done through qemuparams, having this option provides better user
> > > > > experience by not having to specify a long and cluttered path along
> > > > > other qemuparams that the user might want to specify.
> > > > >
> > > > > This new options assumes that the path provided is relative to
> > > > > OECORE_NATIVE_SYSROOT and will check whether it exists before proceeding.
> > > > >
> > > > > Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
> > > > > ---
> > > > >   scripts/runqemu | 14 ++++++++++++++
> > > > >   1 file changed, 14 insertions(+)
> > > > >
> > > > > diff --git a/scripts/runqemu b/scripts/runqemu
> > > > > index 619ffb6..9eff90d 100755
> > > > > --- a/scripts/runqemu
> > > > > +++ b/scripts/runqemu
> > > > > @@ -149,6 +149,9 @@ while true; do
> > > > >               SCRIPT_KERNEL_OPT="$SCRIPT_KERNEL_OPT console=ttyS0"
> > > > >               SERIALSTDIO="1"
> > > > >               ;;
> > > > > +	"biosdir="*)
> > > > > +            CUSTOMBIOSDIR="${arg##biosdir=}"
> > > > > +	    ;;
> > > > >           "qemuparams="*)
> > > > >               SCRIPT_QEMU_EXTRA_OPT="${arg##qemuparams=}"
> > > > >
> > > > > @@ -489,5 +492,16 @@ if [ ! -f "$INTERNAL_SCRIPT" -o ! -r "$INTERNAL_SCRIPT" ]; then
> > > > >   INTERNAL_SCRIPT=`which runqemu-internal`
> > > > >   fi
> > > > >
> > > > > +# Specify directory for BIOS, VGA BIOS and keymaps
> > > > > +if [ ! -z "$CUSTOMBIOSDIR" ]; then
> > > > > +    if [ -d "$OECORE_NATIVE_SYSROOT/$CUSTOMBIOSDIR" ]; then
> > > > I don't think we should be assuming anything here, if the direcotry is 
> > > > passed then it should be given that it is an accurate path to the 
> > > > directory that contains the customer bios, don't make people second gess 
> > > > that it needs to be in the native sysroot.
> > > > 
> > > > Sau!
> > > 
> > > Thanks for your comments Saul! Are you saying that providing paths to
> > > items outside the build environment is a supported use case? That is the
> > > reason I made it relative to OECORE_NATIVE_SYSROOT. If absolute paths to
> > > anywhere can be provided, I could first check whether the provided
> > > absolute path exist and, if not, assume that it is relative to
> > > OECORE_NATIVE_SYSROOT. Does that make sense to you?
> > 
> > So what do you think about this? Besides, I would like to comment that
> > the idea of making the path relative to OECORE_NATIVE_SYSROOT is that
> > the user does not have to write a very long and cluttered path in case
> > his/her BIOS directory is inside the build environment. The whole idea
> > is to make the script more usable.
> 
> I think what you suggested makes sense. Treat relative paths as being in
> the sysroot and absolute paths as being external files. You could test
> whether the relative path exists first, then assume it must be the
> sysroot if it doesn't exist I guess.

Thanks for your comments! I will implement as we have discussed and
resubmit.

BR,
Ricardo
> 
> Cheers,
> 
> Richard
> 



