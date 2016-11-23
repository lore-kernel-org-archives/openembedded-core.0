Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 5E60A719AA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 16:54:11 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20161123165410185_0685;
	Wed, 23 Nov 2016 08:54:10 -0800
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [174.118.92.171] (port=57874 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c9ao6-0004Xm-70; Wed, 23 Nov 2016 11:54:02 -0500
Date: Wed, 23 Nov 2016 11:52:56 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <20161123150525.GA3265@jama>
Message-ID: <alpine.LFD.2.20.1611231143100.13816@localhost.localdomain>
References: <alpine.LFD.2.20.1611230540200.7856@ca624034.mitel.com>
	<CAJTo0LZvk-Ssv3Bc5rSYSuYCm2rQma4Vwv2jvh5zdE7cCPE0Vg@mail.gmail.com>
	<alpine.LFD.2.20.1611230633180.8293@ca624034.mitel.com>
	<CAFkk2KRQ+vv+X9paB+ZLCuFobAVpXyi7gaV7P5kwgX3hja9Rhg@mail.gmail.com>
	<20161123150525.GA3265@jama>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: migrating simple tarballs over to OE recipes?
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
X-List-Received-Date: Wed, 23 Nov 2016 16:54:14 -0000
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Nov 2016, Martin Jansa wrote:

> On Wed, Nov 23, 2016 at 01:00:12PM +0100, Ulf Magnusson wrote:
> > On Wed, Nov 23, 2016 at 12:34 PM, Robert P. J. Day
> > <rpjday@crashcourse.ca> wrote:
> > > On Wed, 23 Nov 2016, Burton, Ross wrote:
> > >
> > >>
> > >> On 23 November 2016 at 10:42, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > >>         colleague has a pile of tarballs that were used to
> > >>       customize an x86 centos system, wants to move all that to
> > >>       OE with as little fuss as possible, i guess the simplest
> > >>       way is to just create recipes that have the same tarball
> > >>       in the files/ directory, and write a trivial do_install()
> > >>       task that untars it into the root fs, yes?
> > >>
> > >>
> > >> Pretty much, yeah.
> > >>
> > >> If you've a large pile and they're all effectively the same
> > >> then a little class can automate it even more.
> > >
> > >   already going down that road, just wanted to make sure i
> > > hadn't overlooked something obvious.
> > >
> > > rday
> >
> > bin_package.bbclass might be useful as well, especially if the
> > files are already arranged like in the rootfs inside the tarballs.
>
> If these files are overwriting files owned by some other packages,
> then you will loose that customization when the package is upgraded
> by package manager (unless those files are listed in CONFFILES). You
> need to use RREPLACES at least.
>
> > do_install() task that untars it into the root fs, yes?
>
> ? do_install installs them to $D not root fs which doesn't even exist yet.
>
> You might also need to skip strip if there are also some binaries
> which are already stripped, skip ldflash qa check if they don't have
> matching hash type etc

  ok, let me clarify/simplify a few things to zero in on the optimal
solution.

  first, there are several dozen tarballs, all containing content
relative to the very top of the root directory, and i've been assured
they're proprietary application-specific and hence won't clash with
any "regular" recipes/RPMs. rather than trying to verify that, i'm
just going to accept that. so something along the lines of
bin_package.bbclass would seem to be acceptable.

  (SIDE NOTE: i was asked if recipes could be written so that the
accompanying "files/" directory contained, not a single tarball, but
the actual, *exploded* content in directory structure to be copied
as-is into the target rootfs. i've never seen that, is that ever done?
i'm not sure how i'd even assign to SRC_URI to handle that. so i'll
insist on tarballs.)

  second, given content all in a single tarball, i'm assuming i'd use
simply:

    SRC_URI = "file://rday.tar.gz"

  finally, looking at bin_package.bbclass, i'm puzzled by this:

  do_configure[noexec] = "1"
  do_compile[noexec] = "1"

  # Install the files to ${D}
  bin_package_do_install () {
    # Do it carefully
    [ -d "${S}" ] || exit 1
    cd ${S} || exit 1
    tar --no-same-owner --exclude='./patches' --exclude='./.pc' -cpf - . \
        | tar --no-same-owner -xpf - -C ${D}
  }

  FILES_${PN} = "/"

  EXPORT_FUNCTIONS do_install

what is the relationship between bin_package_do_install() and the
EXPORTed do_install()? seems like an overriding/inheritance thing,
yes?

  anyway, i think i can see the way to go.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


