Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U6hEa-0002hY-9J for openembedded-core@lists.openembedded.org;
	Sat, 16 Feb 2013 13:51:32 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1GCfPo0010594; Sat, 16 Feb 2013 12:41:25 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 09NkjK6--MmJ; Sat, 16 Feb 2013 12:41:24 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1GCfImf010444
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sat, 16 Feb 2013 12:41:21 GMT
Message-ID: <1361018098.31795.33.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Sat, 16 Feb 2013 12:34:58 +0000
In-Reply-To: <lyhalcmpxd.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1361006114.31795.19.camel@ted>
	<lyhalcmpxd.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: RFE: make the init manager an image feature (again)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Feb 2013 12:51:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2013-02-16 at 12:57 +0100, Enrico Scholz wrote:
> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
> >> it would be nice when the decision to make the init manager a distribution
> >> feature will be reverted to the old oe-meta mechanism.
> >
> > The trouble is that by making it an "image feature", people will
> > expect *everything* to work properly and to be able to have fully
> > functional sysvinit and systemd variants of images.
> 
> I do not see an obvious reason why fully functional sysvinit, systemd and
> perhaps upstart image variants based on the same distribution/package set
> are impossible.
> 
> Of course, not "everything" will work.  But initmgr being a distribution
> feature makes some things completely impossible.
>
> > We already see this expectation.
> 
> IMO, removal of features just to lower expectations is the completely
> wrong way.

meta-oe earned a *horrendous* reputation because of the way systemd was
implemented there. I believe (as do a number of others) that it has
damaged OE's reputation and usability and actively hurts new users. Yes,
the people who use systemd and meta-oe were happy. People who didn't
want systemd were not. There continues to be a fairly toxic mix of
distro policy mingled in with the recipes in there although good
progress is being made in fixing that and I'm grateful to the people
who've noticed and taken on that work (and done previous work like the
separation of meta-systemd).

It was clear systemd needed to move into the core but also become more
configurable to work for everyone. I don't want to remove features, I do
want to talk about whether there is a better way we can fulfil certain
uses cases, particularly with a focus on usability.

> > Trying to explain to people what the limitations are, what is expected
> > to work and what isn't will be difficult.
> 
> OpenEmbedded is not an end-user distribution but for people who are
> willing to invest some learning effort.  Trying to limit ourself on the
> lowest common ground is not desirable imo.

I did not say we're not going to support your use case. I'm asking if we
can summarise exactly what the problem is and whether there is another
way we can get there which isn't going to surprise as many people and be
easier to use.

I'm actually moderately annoyed that throughout the various discussions
about systemd and how we'd get it into OE-Core nobody actually mentioned
these specific requirements until very late in the implementation.

At the bare minimum, we actually need to document the usecases people
are using and require. Yes, you know your usecase but you need to take
some responsibility for ensuring its documented and known about else it
will continue to get broken time and time again.

> > For that reason I'd rather see this done in a different way, for
> > example blacklisting the problematic systemd dependencies at image
> > generation time with some kind of stronger BAD_RECOMMENDS code.
> 
> Assuming we are able to break the hard dependencies, what is with package
> scripts which require programs, files or directories from these deps?  Do
> we need a way to differ between good and bad script failures then?

At the technical level there is little difference from packaging these
things separately to avoid specific dependencies and explicitly telling
the package manager to avoid that dependency instead.

Equally there are other cases where people do want to break specific
dependencies so this could help us in that area too.

Perhaps there is a dependency we need to drop to a Recommends level,
then use BAD_RECOMMENDS to handy that. We do need to document why we do
that and how it is expected to be used.

> Sounds extremely hacky and fragile...

It depends on the implementation.

Having initscripts in individual packages and having to play tricks to
ensure the right sets of packages get installed is rather hacky and
fragile.

Cheers,

Richard



