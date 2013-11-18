Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id EBBDF6D2F0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 11:57:45 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAIBvTFl028971; Mon, 18 Nov 2013 11:57:40 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id j30icwbbt60j; Mon, 18 Nov 2013 11:57:40 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAIBvZ4W028980
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 18 Nov 2013 11:57:37 GMT
Message-ID: <1384775852.6460.214.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, Paul Barker <paul@paulbarker.me.uk>
Date: Mon, 18 Nov 2013 11:57:32 +0000
In-Reply-To: <20131118114000.GB3727@jama>
References: <CANyK_8c67C4NL7mNf3LTDwurtfpeU+S5ts4+O2t+HiDv84YgaQ@mail.gmail.com>
	<52898177.5000303@windriver.com> <20131118114000.GB3727@jama>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: opkg dependencies and update-alternatives
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
X-List-Received-Date: Mon, 18 Nov 2013 11:57:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-11-18 at 12:40 +0100, Martin Jansa wrote:
> On Mon, Nov 18, 2013 at 10:54:47AM +0800, ChenQi wrote:
> > On 11/18/2013 02:57 AM, Paul Barker wrote:
> > > Hi all,
> > >
> > > I've been trying to add PACKAGECONFIG options to opkg and have ran
> > > into a dependency loop whilst building with certain options. Enabling
> > > curl support within opkg requires a dependency on curl. curl in turn
> > > depends on ncurses (via a few intermediate dependencies) and ncurses
> > > uses update-alternatives causing a dependency on
> > > virtual/update-alternatives.
> > > PREFERRED_PROVIDER_virtual/update-alternatives is set to "opkg" in
> > > meta/conf/distro/include/default-providers.inc and so we have a
> > > dependency loop if curl is enabled via the new PACKAGECONFIG options
> > > for opkg.
> > >
> > > I can cause the same dependency loop by setting
> > > PREFERRED_PROVIDER_virtual/update-alternatives to "dpkg" as dpkg
> > > directly depends on ncurses (which uses update-alternatives). So if
> > > someone wanted to use the more powerful update-alternatives from dpkg
> > > on a target system it doesn't look like that is currently possible.
> > >
> > > This places quite a constraint on whichever recipe PROVIDES
> > > update-alternatives. Going forward I'm hoping to use libarchive within
> > > opkg and libarchive depends on bzip2 by default which uses
> > > update-alternatives, which would cause the same problem.
> > >
> > > Does anyone have any clever solutions to this? Perhaps we could split
> > > update-alternatives off into its own recipe which should be dependent
> > > on very little, allowing opkg a little more freedom in its
> > > dependencies.
> > >
> > > Thanks,
> > >
> > 
> > I opened a bug some time ago for this update-alternative problem.
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=4836
> > 
> > It would be really helpful if you could add some input in the comments 
> > of that bug.
> 
> FWIW: current u-a implementation provided by opkg is in OE-classic and
> was in older poky/oe-core provided also in standalone recipe
> update-alternatives-cworth
> 
> http://git.openembedded.org/openembedded/tree/recipes/update-alternatives/update-alternatives-cworth_0.99.154.bb
> 
> commit 44b538eedab7c255051fa3375f9f2439cd2db3dd
> Author: Marcin Juszkiewicz <hrw@openedhand.com>
> Date:   Wed Mar 19 15:36:01 2008 +0000
> 
>     update-alternatives-cworth: dropped as they are now generated with opkg recipe

Turning this back into a standalone recipe might be worthwhile and seems
like the best way to address the problems.

Paul: Have you any opinion of moving update-alternatives to its own
repository separate from opkg? or just check it into OE-Core as its just
a single script? Its not as if it really needs much from opkg at this
point?

I'm also wondering how it compares to the dpkg version (which is C
iirc). Should we switch to that? Does it give better performance?

Cheers,

Richard


