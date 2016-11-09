Return-Path: <paul@paulbarker.me.uk>
X-Greylist: delayed 11097 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 09 Nov 2016 21:13:55 UTC
Received: from 1.mo5.mail-out.ovh.net (1.mo5.mail-out.ovh.net [188.165.57.91])
	by mail.openembedded.org (Postfix) with ESMTP id 6911E719D8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 21:13:55 +0000 (UTC)
Received: from player760.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 483BB406AB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 19:08:57 +0100 (CET)
Received: from nuc.betafive.co.uk
	(cpc11-shep11-2-0-cust130.8-3.cable.virginm.net [86.27.96.131])
	(Authenticated sender: paul@betafive.co.uk)
	by player760.ha.ovh.net (Postfix) with ESMTPSA id 66A71334;
	Wed,  9 Nov 2016 19:08:55 +0100 (CET)
Date: Wed, 9 Nov 2016 18:08:54 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20161109180854.130d6804@nuc.betafive.co.uk>
In-Reply-To: <CADkTA4NmhstuGn7cZLD-MGB1OdNbAFLkiOKrf20Bri0KSEsuQA@mail.gmail.com>
References: <1477161480-20271-1-git-send-email-paul@paulbarker.me.uk>
	<20161105101438.1ef1f627@nuc.betafive.co.uk>
	<CAJTo0LbB0eGStoFbyinDYP0zzEJ27BL0eDyGKFkjdh=AaWBPVA@mail.gmail.com>
	<CADkTA4OaRgUJwFwT=S_h41EW4OO_Koa+QQr=t3t+X+6pszrzBQ@mail.gmail.com>
	<CAJTo0LZxGYzpjUetPspX6mKktoL_XnDqfncyHFWN5Kzfij8-UQ@mail.gmail.com>
	<CADkTA4NmhstuGn7cZLD-MGB1OdNbAFLkiOKrf20Bri0KSEsuQA@mail.gmail.com>
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.25; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Ovh-Tracer-Id: 7365918667942627670
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrtddtgdejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Cc: OpenEmbedded Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: Allow ${S} to be overridden
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
X-List-Received-Date: Wed, 09 Nov 2016 21:13:56 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 9 Nov 2016 08:09:09 -0500
Bruce Ashfield <bruce.ashfield@gmail.com> wrote:

> On Wed, Nov 9, 2016 at 5:04 AM, Burton, Ross <ross.burton@intel.com> wrote:
> 
> >
> > On 9 November 2016 at 02:23, Bruce Ashfield <bruce.ashfield@gmail.com>
> > wrote:
> >
> >> I can ack this patch, since no defaults change .. there's no risk to
> >> existing users.
> >>
> >
> > Saying that of course doomed the patch:
> >
> 
> interesting.
> 
> Paul: obviously you were building with this in place, and my local test did
> work here
> as well .. so any idea to the difference ?
> 
> Let me know if you want any help looking into it.
> 
> Cheers,
> 
> Bruce
> 

The reason for this patch is that I'm using a tarball for the kernel
sources in the new meta-arduino layer. That tarball doesn't get
extracted to ${STAGING_KERNEL_DIR} and so it needs to be copied over to
there. Looking at kernel.bbclass, it looks like the logic to do this is
present:


    # Old style kernels may set ${S} = ${WORKDIR}/git for example
    # We need to move these over to STAGING_KERNEL_DIR. We can't just
    # create the symlink in advance as the git fetcher can't cope with
    # the symlink.
    do_unpack[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILDDIR}"
    do_clean[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILDDIR}"
    base_do_unpack_append () {
        s = d.getVar("S", True)
        if s[-1] == '/':
            # drop trailing slash, so that os.symlink(kernsrc, s) doesn't use s as directory name and fail
            s=s[:-1]
        kernsrc = d.getVar("STAGING_KERNEL_DIR", True)
        if s != kernsrc:
            bb.utils.mkdirhier(kernsrc)
            bb.utils.remove(kernsrc, recurse=True)
            if d.getVar("EXTERNALSRC", True):
                # With EXTERNALSRC S will not be wiped so we can symlink to it
                os.symlink(s, kernsrc)
            else:
                import shutil
                shutil.move(s, kernsrc)
                os.symlink(kernsrc, s)
    }

The problem is we can't set S to anything unless we can override it.

I've now looked into this futher and it seems to be working for some
kernel recipes but not others. The issue may be that we have an
assignment for S in bitbake.conf:

    S = "${WORKDIR}/${BP}"

That's obviously overriding the 'S ?= ...' assignment when my patch is
applied where S isn't also explicitly assigned in the recipe, some
other class or include file.

I'm not sure on how precedence is determined if a variable is assigned
using '=' multiple times.

I'll have another look into it and see where I get. I have a workaround
in place for the meta-arduino layer for now so it doesn't need an
urgent fix.

However, if it turns out we can't reliably override S in a kernel recipe
then should we still have that comment and base_do_unpack_append() in
kernel.bbclass?

Thanks,
Paul

