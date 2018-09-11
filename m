Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3666579717
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 08:08:10 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w8B8874u008065
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 11 Sep 2018 09:08:08 +0100
Message-ID: <22e5590602f842f8cac99d5277dc7ebe185652de.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ChenQi <Qi.Chen@windriver.com>, "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Sep 2018 09:08:07 +0100
In-Reply-To: <2ba2543a-d351-8df2-f946-dff83c8e2c22@windriver.com>
References: <cover.1536573689.git.Qi.Chen@windriver.com>
	<d5a1d1701202d4323e15cb31c7f9a3afca88a00f.1536573689.git.Qi.Chen@windriver.com>
	<CAJTo0LZiPj8qNgTVUkvno50LhizJ57VKGCnnQqiTuJUyGNmNRA@mail.gmail.com>
	<2ba2543a-d351-8df2-f946-dff83c8e2c22@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] autotools: do more cleanup when in do_configure
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
X-List-Received-Date: Tue, 11 Sep 2018 08:08:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-09-11 at 09:30 +0800, ChenQi wrote:
> On 09/10/2018 06:24 PM, Burton, Ross wrote:
> > On 10 September 2018 at 11:02, Chen Qi <Qi.Chen@windriver.com>
> > wrote:
> > > I met the following error when compiling some projects.
> > > 
> > > > configure: error: `LDFLAGS' has changed since the previous run:
> > > > configure:   former value:  `-Wl,-O1 -Wl,--hash-style=gnu -Wl,-
> > > > -as-needed'
> > > > configure:   current value: `-Wl,-O1 -Wl,--hash-style=gnu -Wl,-
> > > > -as-needed -fstack-protector-strong -Wl,-z,relro,-z,now'
> > > 
> > > [snip]
> > > > configure: error: changes in the environment can compromise the
> > > > build
> > > > configure: error: run `make distclean' and/or `rm
> > > > .././config.cache' and start over
> > > 
> > > I think when some recipe inherits autotools-brokensep, it should
> > > try to
> > > do more cleanups before configure. So also do 'make distclean'
> > > and remove
> > > config.cache just as what the error message told us.
> > 
> > Does just removing config.cache work for your problem?
> 
> I guess it should, but I haven't checked.
> >    I'm concerned
> > about running a distclean because some upstreams abuse that target
> > and
> > then can't rebuild.
> 
> Hmm... I hold the opposite opinion.
> I suspect that just doing a `make clean' is more likely to break
> rebuild 
> while doing a `make distclean' should reduce the possibility.
> 
> Conceptually, `make clean' is followed by `make' while `make
> distclean' 
> is followed by `configure & make'.
> At rebuild, we are doing `configure & make'; so we should use `make 
> distclean', in theory.
> 
> I'll revisit this issue later and do more investigation.
> > Also obviously the proper fix is to not use autotools-brokensep in
> > the
> > recipe in the first place.
> 
> You are right.
> The recipe is cyrus-sasl and the newly updated version has fixed to
> use 
> autotools instead of autotools-brokensep.
> 
> To summarize, ideally we should have no recipe inheriting 
> autotools-brokensep. But in reality, it's almost not possible.
> I sent out this patch because I thought it would be helpful for such 
> recipes.

I seem to remember trying distclean when we first implemented this
code. A lot of tarballs have generated files in them which distclean
will remove but we lack the code/dependencies to regenerate them.
"clean" was something we could get to work, "distclean" led to a lot of
build failures.

If we were to consider doing this it would need a lot of testing.

Cheers,

Richard


