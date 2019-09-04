Return-Path: <quentin.schulz@streamunlimited.com>
Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
	by mail.openembedded.org (Postfix) with ESMTP id 1B4A17F282
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 12:55:39 +0000 (UTC)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 46NkMH4tGcz5tlG;
	Wed,  4 Sep 2019 14:55:39 +0200 (CEST)
Date: Wed, 4 Sep 2019 14:55:38 +0200
From: Quentin Schulz <quentin.schulz@streamunlimited.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20190904125538.c6f6mz6cwcz56ebr@qschulz>
References: <20190903163241.87739-1-alex.kanavin@gmail.com>
	<20190904073239.rlk6spusid6m2zbd@qschulz>
	<CANNYZj_ZFESLDrUxU9XjjdTQXEp-awnq+-EJEavE32SqJOZSXA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj_ZFESLDrUxU9XjjdTQXEp-awnq+-EJEavE32SqJOZSXA@mail.gmail.com>
User-Agent: NeoMutt/20180716
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package.bbclass: allow shell-style wildcards in PRIVATE_LIBS
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
X-List-Received-Date: Wed, 04 Sep 2019 12:55:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alex,

On Wed, Sep 04, 2019 at 12:11:29PM +0200, Alexander Kanavin wrote:
> On Wed, 4 Sep 2019 at 09:32, Quentin Schulz <
> quentin.schulz@streamunlimited.com> wrote:
> 
> > > +++ b/meta/classes/package.bbclass
> > > @@ -1646,7 +1646,8 @@ python package_do_shlibs() {
> > >                  prov = (this_soname, ldir, pkgver)
> > >                  if not prov in sonames:
> > >                      # if library is private (only used by package) then
> > do not build shlib for it
> > > -                    if not private_libs or this_soname not in
> > private_libs:
> > > +                    import fnmatch
> > > +                    if not private_libs or len([i for i in private_libs
> > if fnmatch.fnmatch(this_soname, i)]) == 0:
> >
> > We only need to know if this_soname is matching one of the patterns, we
> > don't need to check for each and every pattern.
> >
> > Something like:
> >
> > for pattern in private_libs:
> >         if fnmatch.fnmatch(this_soname, pattern)]) == 0:
> >                 sonames.add(prov)
> >                 break
> >
> > would be possible?
> >
> 
> Actually, this suggested code snippet looks altogether wrong to me. We do

Indeed.

> need to check the file against every pattern, and only if it matches none
> of them, it gets added to sonames. Note the original code says 'this_soname

So we just need to invert the logic actually.

matched = False
for pattern in private_libs:
	if fnmatch.fnmatch(this_soname, pattern)]) == 0:
		matched = True
		break

if not matched:
	sonames.add(prov)

> not in private_libs', which also means going over every item in the list.
> 

I'd hope Python devs did optimization on this one and stopped at the
first match in the list, but I'm not one of them so...

BR,
Quentin
-- 
StreamUnlimited Engineering GmbH
High Tech Campus Vienna, Gutheil-Schoder-Gasse 10, 1100 Vienna, Austria
quentin.schulz@streamunlimited.com, www.streamunlimited.com

