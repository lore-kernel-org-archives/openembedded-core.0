Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id DEA5B6BF88
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 14:18:11 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2JEHxVO017764; Wed, 19 Mar 2014 14:17:59 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NvncoR7osgIB; Wed, 19 Mar 2014 14:17:59 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2JEHuux017755
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 19 Mar 2014 14:17:58 GMT
Message-ID: <1395238671.3808.122.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Date: Wed, 19 Mar 2014 14:17:51 +0000
In-Reply-To: <1395097374.2792.58.camel@ranerica-desk01>
References: <1394238610-25905-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
	<531C21B8.3000308@linux.intel.com>
	<1394507658.2792.23.camel@ranerica-desk01>
	<1395097374.2792.58.camel@ranerica-desk01>
X-Mailer: Evolution 3.8.4-0ubuntu1 
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
X-List-Received-Date: Wed, 19 Mar 2014 14:18:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-03-17 at 16:02 -0700, Ricardo Neri wrote:
> On Mon, 2014-03-10 at 20:14 -0700, Ricardo Neri wrote:
> > On Sun, 2014-03-09 at 00:09 -0800, Saul Wold wrote:
> > > On 03/07/2014 04:30 PM, Ricardo Neri wrote:
> > > > Add support to specify a directory for custom BIOS, VGA BIOS and
> > > > keymaps as supported by qemu (-L option). Even though this can be
> > > > done through qemuparams, having this option provides better user
> > > > experience by not having to specify a long and cluttered path along
> > > > other qemuparams that the user might want to specify.
> > > >
> > > > This new options assumes that the path provided is relative to
> > > > OECORE_NATIVE_SYSROOT and will check whether it exists before proceeding.
> > > >
> > > > Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
> > > > ---
> > > >   scripts/runqemu | 14 ++++++++++++++
> > > >   1 file changed, 14 insertions(+)
> > > >
> > > > diff --git a/scripts/runqemu b/scripts/runqemu
> > > > index 619ffb6..9eff90d 100755
> > > > --- a/scripts/runqemu
> > > > +++ b/scripts/runqemu
> > > > @@ -149,6 +149,9 @@ while true; do
> > > >               SCRIPT_KERNEL_OPT="$SCRIPT_KERNEL_OPT console=ttyS0"
> > > >               SERIALSTDIO="1"
> > > >               ;;
> > > > +	"biosdir="*)
> > > > +            CUSTOMBIOSDIR="${arg##biosdir=}"
> > > > +	    ;;
> > > >           "qemuparams="*)
> > > >               SCRIPT_QEMU_EXTRA_OPT="${arg##qemuparams=}"
> > > >
> > > > @@ -489,5 +492,16 @@ if [ ! -f "$INTERNAL_SCRIPT" -o ! -r "$INTERNAL_SCRIPT" ]; then
> > > >   INTERNAL_SCRIPT=`which runqemu-internal`
> > > >   fi
> > > >
> > > > +# Specify directory for BIOS, VGA BIOS and keymaps
> > > > +if [ ! -z "$CUSTOMBIOSDIR" ]; then
> > > > +    if [ -d "$OECORE_NATIVE_SYSROOT/$CUSTOMBIOSDIR" ]; then
> > > I don't think we should be assuming anything here, if the direcotry is 
> > > passed then it should be given that it is an accurate path to the 
> > > directory that contains the customer bios, don't make people second gess 
> > > that it needs to be in the native sysroot.
> > > 
> > > Sau!
> > 
> > Thanks for your comments Saul! Are you saying that providing paths to
> > items outside the build environment is a supported use case? That is the
> > reason I made it relative to OECORE_NATIVE_SYSROOT. If absolute paths to
> > anywhere can be provided, I could first check whether the provided
> > absolute path exist and, if not, assume that it is relative to
> > OECORE_NATIVE_SYSROOT. Does that make sense to you?
> 
> So what do you think about this? Besides, I would like to comment that
> the idea of making the path relative to OECORE_NATIVE_SYSROOT is that
> the user does not have to write a very long and cluttered path in case
> his/her BIOS directory is inside the build environment. The whole idea
> is to make the script more usable.

I think what you suggested makes sense. Treat relative paths as being in
the sysroot and absolute paths as being external files. You could test
whether the relative path exists first, then assume it must be the
sysroot if it doesn't exist I guess.

Cheers,

Richard


