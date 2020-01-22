Return-Path: <quentin.schulz@streamunlimited.com>
Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
	by mail.openembedded.org (Postfix) with ESMTP id 23E977FF2F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 10:06:56 +0000 (UTC)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 482h010vX3z5tlC;
	Wed, 22 Jan 2020 11:06:57 +0100 (CET)
Date: Wed, 22 Jan 2020 11:06:55 +0100
From: Quentin Schulz <quentin.schulz@streamunlimited.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200122100655.eenl3tcnhj4kkcda@qschulz>
References: <20180514144415.40730-1-stefan@agner.ch>
	<20200113145729.amwegnpvnp2kb3ut@qschulz>
	<20200120123246.o5abx73ehcoqbbim@qschulz>
	<4e98fdb7ff73df6804e58f2f4339c816@agner.ch>
	<059aa62b-1c45-50a3-5d58-40f2646247ad@gmail.com>
	<20200121092341.bgb2elaqey75egjp@qschulz>
	<CAMKF1spxORPSqDJuD2RWLFNXs8pHZSDQtVgzp+xcb3w2tC3htQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spxORPSqDJuD2RWLFNXs8pHZSDQtVgzp+xcb3w2tC3htQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
Cc: Stefan Agner <stefan.agner@toradex.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: busybox: udhcpc: fix IPv6 support when using udhcpc
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
X-List-Received-Date: Wed, 22 Jan 2020 10:06:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Khem,

On Tue, Jan 21, 2020 at 10:08:59AM -0800, Khem Raj wrote:
> On Tue, Jan 21, 2020 at 1:23 AM Quentin Schulz
> <quentin.schulz@streamunlimited.com> wrote:
> >
> > Hi Khem,
> >
> > On Mon, Jan 20, 2020 at 11:26:27AM -0800, Khem Raj wrote:
> > > > Just checked, we still override that script in our layer, so definitely
> > > > would be happy if this gets merged upstream so I can get rid of our
> > > > custom script downstream.
> > > >
> > >
> > > I think this is good to go got OE-core, but I was wondering if default
> > > script in busybox also need this and perhaps upstream too
> > >
> >
> > What do you mean by "default script"?
> > https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/busybox/files/default.script
> > ?
> 
> yes.

I'm confused then. Bear with me, I'm new to userspace so I'm sure I'm missing
something rather obvious.
The content of default.script is:

exec run-parts -a "$1" /etc/udhcpc.d

AFAICT from a quick look at busybox.inc, the only things in that
/etc/udhcpc.d directory are simple.script (named 50default actually) and
default.script.

What do you think should be done for that file wrt the original issue?

> >
> > Upstream could benefit from it, I'd agree. Though, it is technically
> > just provided as an example.
> > https://git.busybox.net/busybox/tree/examples/udhcp/simple.script
> >
> 

@all: FYI, patch is merged:
https://git.openembedded.org/openembedded-core/commit/meta/recipes-core/busybox/files/simple.script?id=b77541dbb2f442e51842f9d24c8745a6df2d1478

> > The reason why I didn't bother to send a patch to busybox before pinging
> > on this patch was that we're already different from the upstream simple.script
> > so it didn't make sense to me to add the Upstream-Status: pending or
> > something on the patch (in some ways, since it's patching the file
> > directly and not adding a patch in SRC_URI). Anyway, digressing. Do you
> > want a patch to be sent to busybox ML (or PR or whatever they use)
> > before taking this patch?
> >
> 
> I think the problem this patch fixes is generic and somewhere the
> script OE has is also derived from
> that example, so while the patch in itself is enough for OE, it would
> be better if it was in upstream too
> perhaps one less thing to worry about when we cherry pick changes from
> upstream script in future.
> 

Agreed, I'll put it on my TODO-list. If I do not send an answer on this
mail with the link to the PR or patch in the next week, anyone, please ping me.

Thx,
Quentin

