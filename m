Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RDyC6-0007vm-Pg
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 14:45:58 +0200
Received: by ggnq1 with SMTP id q1so611771ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 05:40:15 -0700 (PDT)
Received: by 10.223.4.132 with SMTP id 4mr46410818far.12.1318423214842;
	Wed, 12 Oct 2011 05:40:14 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id a7sm3879575fam.22.2011.10.12.05.40.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Oct 2011 05:40:14 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1318423059.23801.151.camel@ted>
Date: Wed, 12 Oct 2011 14:40:12 +0200
Message-Id: <34BF83B1-F868-4AED-B6DF-E724687ACBFE@dominion.thruhere.net>
References: <cover.1318371066.git.josh@linux.intel.com>
	<1318423059.23801.151.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [RFC PATCH 0/1] QA check for defined packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Oct 2011 12:45:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 12 okt. 2011, om 14:37 heeft Richard Purdie het volgende geschreven:

> On Tue, 2011-10-11 at 15:29 -0700, Joshua Lock wrote:
>> I'm looking for some comments on this WIP patch.
>>=20
>> The reason I've added this is because the hob GUI requires us to =
offer much
>> more reliable metadata - we show the user available packages, as =
defined by
>> each recipe, to add to their image. Should a recipe define a package =
and yet
>> not actually create it and the user has included that in their image =
we cause
>> errors at build time.
>>=20
>> However whilst the idea seems sound enough, there are some caveats - =
running
>> a world build with this patch I see failures fairly early on at least =
a few
>> of which I'd expect we'll need to special-case:
>> * eglibc-local
>> * linux-yocto
>> * linux-libc-headers
>> * gcc-runtime
>>=20
>> Thoughts?
>=20
> I think we probably do need to cleanup some of that data.
>=20
> I have some thoughts about where we're at with hob and this is =
probably
> as good a time as any to share them.
>=20
> Effectively the problem is that there is a large body of data we only
> compute during the build process. This includes what the exact runtime
> dependencies of packages are, which packages exactly are generated
> (PACKAGES_DYNAMIC), what the size of the packages are, how long they
> take to build and so on. Some things we can fix, some things we can =
hack
> around but at the end of the day there are some things we just plain
> can't change.
>=20
> I'm beginning to think we need to have two phases of control of the
> system:
>=20
> a) The build phase
>=20
> This is the step that generates the package feeds.
>=20
> b) The image construction phase
>=20
> This is the step that takes the package feed data and turns it into an
> image.
>=20
> Obviously, you can skip to b) if you already have a package feed.
>=20
> So we'd be talking about two UI's that could effectively hand off to
> each other and share a "build in progress" feedback to the user =
system.
> The image construction dialog would have a "Missing Packages? Build =
them
> here" type switch. This would mean the build system can continue on at
> what it does best yet the UI can let the users do what they want to =
do,
> particularly on a prebuilt package feed.
>=20
> Thoughts?

I really, really, REALLY like the attention packages feeds are getting =
lately on the oe-core and yocto mailinglists!=


