Return-Path: <paul@paulbarker.me.uk>
X-Greylist: delayed 8866 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 11 Nov 2016 22:06:54 UTC
Received: from 10.mo68.mail-out.ovh.net (10.mo68.mail-out.ovh.net
	[46.105.79.203])
	by mail.openembedded.org (Postfix) with ESMTP id A5CCD62134
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 22:06:54 +0000 (UTC)
Received: from player763.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo68.mail-out.ovh.net (Postfix) with ESMTP id 928B7BC79
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 20:39:07 +0100 (CET)
Received: from nuc.betafive.co.uk
	(cpc11-shep11-2-0-cust130.8-3.cable.virginm.net [86.27.96.131])
	(Authenticated sender: paul@betafive.co.uk)
	by player763.ha.ovh.net (Postfix) with ESMTPSA id 29DA43C0067;
	Fri, 11 Nov 2016 20:39:05 +0100 (CET)
Date: Fri, 11 Nov 2016 19:39:02 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20161111193902.3e34bf60@nuc.betafive.co.uk>
In-Reply-To: <CAJ86T=XNd_ypY_aBc+eVGpJ4ntUUecT7Umdg37hUrNqZNAw_6g@mail.gmail.com>
References: <1477161480-20271-1-git-send-email-paul@paulbarker.me.uk>
	<20161105101438.1ef1f627@nuc.betafive.co.uk>
	<CAJTo0LbB0eGStoFbyinDYP0zzEJ27BL0eDyGKFkjdh=AaWBPVA@mail.gmail.com>
	<CADkTA4OaRgUJwFwT=S_h41EW4OO_Koa+QQr=t3t+X+6pszrzBQ@mail.gmail.com>
	<CAJTo0LZxGYzpjUetPspX6mKktoL_XnDqfncyHFWN5Kzfij8-UQ@mail.gmail.com>
	<CADkTA4NmhstuGn7cZLD-MGB1OdNbAFLkiOKrf20Bri0KSEsuQA@mail.gmail.com>
	<20161109180854.130d6804@nuc.betafive.co.uk>
	<CAJ86T=XNd_ypY_aBc+eVGpJ4ntUUecT7Umdg37hUrNqZNAw_6g@mail.gmail.com>
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.25; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Ovh-Tracer-Id: 2187342047023171937
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrtdeigdduvdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Fri, 11 Nov 2016 22:06:55 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 9 Nov 2016 15:42:29 -0800
Andre McCurdy <armccurdy@gmail.com> wrote:

> On Wed, Nov 9, 2016 at 10:08 AM, Paul Barker <paul@paulbarker.me.uk> wrote:
> >
> > The reason for this patch is that I'm using a tarball for the kernel
> > sources in the new meta-arduino layer. That tarball doesn't get
> > extracted to ${STAGING_KERNEL_DIR} and so it needs to be copied over to
> > there. Looking at kernel.bbclass, it looks like the logic to do this is
> > present:
> >
> >
> >     # Old style kernels may set ${S} = ${WORKDIR}/git for example
> >     # We need to move these over to STAGING_KERNEL_DIR. We can't just
> >     # create the symlink in advance as the git fetcher can't cope with
> >     # the symlink.
> >     do_unpack[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILDDIR}"
> >     do_clean[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILDDIR}"
> >     base_do_unpack_append () {
> >         s = d.getVar("S", True)
> >         if s[-1] == '/':
> >             # drop trailing slash, so that os.symlink(kernsrc, s) doesn't use s as directory name and fail
> >             s=s[:-1]
> >         kernsrc = d.getVar("STAGING_KERNEL_DIR", True)
> >         if s != kernsrc:
> >             bb.utils.mkdirhier(kernsrc)
> >             bb.utils.remove(kernsrc, recurse=True)
> >             if d.getVar("EXTERNALSRC", True):
> >                 # With EXTERNALSRC S will not be wiped so we can symlink to it
> >                 os.symlink(s, kernsrc)
> >             else:
> >                 import shutil
> >                 shutil.move(s, kernsrc)
> >                 os.symlink(kernsrc, s)
> >     }
> >
> > The problem is we can't set S to anything unless we can override it.
> >
> > I've now looked into this futher and it seems to be working for some
> > kernel recipes but not others. The issue may be that we have an
> > assignment for S in bitbake.conf:
> >
> >     S = "${WORKDIR}/${BP}"
> >
> > That's obviously overriding the 'S ?= ...' assignment when my patch is
> > applied where S isn't also explicitly assigned in the recipe, some
> > other class or include file.
> >
> > I'm not sure on how precedence is determined if a variable is assigned
> > using '=' multiple times.
> >
> > I'll have another look into it and see where I get. I have a workaround
> > in place for the meta-arduino layer for now so it doesn't need an
> > urgent fix.
> >
> > However, if it turns out we can't reliably override S in a kernel recipe
> > then should we still have that comment and base_do_unpack_append() in
> > kernel.bbclass?
> 
> The solution I use (learned the hard way) is to ensure that "S = ..."
> comes after "inherit kernel" in the kernel recipe.
> 

Ok, yea, this works for me.

Is this expected? S is set to ${STAGING_KERNEL_DIR} at the start of
kernel.bbclass. The base_do_unpack_append() function is defined later
in kernel.bbclass. If S is set to ${WORKDIR}/${BP} only after
kernel.bbclass is inherited, then that's after base_do_unpack_append()
has been parsed.

I've re-read the bitbake user manual [1] but I can't clearly understand
why this works. Is it to do with when the _append is applied?

Is there any way we can make this more obvious or is this just the
nature of bitbake?

[1]: http://www.yoctoproject.org/docs/2.2/bitbake-user-manual/bitbake-user-manual.html#basic-syntax

