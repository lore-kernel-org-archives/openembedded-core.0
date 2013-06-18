Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 252A5601DB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 15:48:18 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5IFsEbB000702; Tue, 18 Jun 2013 16:54:15 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id t4J4hjVJ6hYO; Tue, 18 Jun 2013 16:54:14 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5IFsAMg000695
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 18 Jun 2013 16:54:11 +0100
Message-ID: <1371570476.20823.121.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Jun 2013 16:47:56 +0100
In-Reply-To: <CAJTo0LbT7ZbbmbibLCzOvv4a2939-Hr8uGEoUqg2sRVgEOCqmQ@mail.gmail.com>
References: <CAJTo0LbHu=CyeCL=yvyBrUtc0i==ybVXQSXDVkVqMy4jsyoEfg@mail.gmail.com>
	<1371566573.6580.59.camel@phil-desktop.brightsign>
	<CAJTo0LZD46Gckm=PGRw2NdSBibREWUzJbG_zhVtcAAqtAunn+w@mail.gmail.com>
	<1371567621.3466.16.camel@localhost>
	<CAJTo0LbT7ZbbmbibLCzOvv4a2939-Hr8uGEoUqg2sRVgEOCqmQ@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: magic libtool .la removal
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
X-List-Received-Date: Tue, 18 Jun 2013 15:48:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-06-18 at 16:05 +0100, Burton, Ross wrote:
> On 18 June 2013 16:00, Colin Walters <walters@verbum.org> wrote:
> > The relevant data I have on hand are:
> >
> > https://bugzilla.gnome.org/show_bug.cgi?id=654013
> > https://git.gnome.org/browse/jhbuild/commit/?id=965c8d5ceda9d1c5d6021ef2c534e0a7f68ca976
> >
> > I think the executive summary is that libltdl knows how to load .so
> > files directly (at least currently), so there's no reason to have even
> > ${libdir}/modulename/plugins/foo.la.
> 
> Thanks Colin.  Let's ignore the "libdir" option so this is a
> per-package keep-or-wipe option.  I'd like to default it to removing
> all by default after a verification that the build results are
> identical.

The thing which really worries me about this is that we'll start to
deviate quite massively with how upstream expect us to use autotools.

As things stand, we have a number of sysroot fixes for the sysroot
support in libtool which is basically broken out the box. I have tried
discussing them with upstream and was ignored, mainly as we patch
libtool and we're supposed to use it unpatched. 

I worry that if we go this route, the builds will stop working without
the .la file removal and that we'll lose any chance of being able to
resolve our patchset with libtool upstream. We might as well throw away
libtool at that point and save the overhead. It also means we will have
bigger problems working on something like darwin (which I've had work in
the past).

So I don't see the pressing need to set us off down a path on our own.
Yes the .la files are annoying but they're not that much of a problem,
are they?

Cheers,

Richard




