Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1U74Cd-000766-Qf
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Feb 2013 14:22:59 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r1HD6aMk013327
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 17 Feb 2013 14:06:37 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1U73wy-00062P-BX; Sun, 17 Feb 2013 14:06:36 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1361006114.31795.19.camel@ted>
	<lyhalcmpxd.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1361018098.31795.33.camel@ted>
Date: Sun, 17 Feb 2013 14:06:36 +0100
In-Reply-To: <1361018098.31795.33.camel@ted> (Richard Purdie's message of
	"Sat, 16 Feb 2013 12:34:58 +0000")
Message-ID: <ly8v6nm6n7.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Spam-Score: -1.3
X-Spam-Level: -
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL
X-Scanned-By: MIMEDefang 2.73
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
X-List-Received-Date: Sun, 17 Feb 2013 13:23:00 -0000
Content-Type: text/plain

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

> meta-oe earned a *horrendous* reputation because of the way systemd was
> implemented there.

Can you point me to the corresponding discussion resp. which aspects of
the meta-oe implementation were criticized?

I can image only two problems with splitted -sysv/-systemd packages:

1. it enlarges the package database

2. there does not exist a good mechanism to select automatically the
   correct subpackage; e.g. so that when somebody makes 'opkg install
   foo', the -sysv subpackage gets installed on sysv systems and the
   -systemd subpackage on systemd systems.  Ditto with rpm and dpkg
   package managers.

   meta-oe implementation defined a default with help of RRECOMMENDS
   which can be overridden at image build time with BAD_RECOMMENDS.


For me, point 1 is negligible because pkg management is disabled for
images where every byte matters.

Point 2 needs some discussion but I am pretty sure that some clean
technical solution can be found.  The most trivial one might be the
moving of -<initsys> packages into an own 'all-<initsys>' architecture
whose package feed is enabled at image build time. This does not scale
well and violates orthogonality of buildsystem somehow, but works now.

Another approach might adding RRECOMMENDS on all supported -<initsys>
packages and let the package manager choose this with the lowest costs.
That's not trivial and requires probably changes in opkg.

Blacklisting packages with a certain, configurable pattern in its name
or (better) rprovides (e.g. implementing BAD_RECOMMENDS in opkg, smart,
...) is another way requiring changes in the package manager.
  

> I believe (as do a number of others) that it has damaged OE's reputation
> and usability and actively hurts new users.

The current oe-core implementation hurts active, long time users.


> It was clear systemd needed to move into the core but also become more
> configurable to work for everyone.

Exactly this configurability was taken away.


> I don't want to remove features, I do want to talk about whether there
> is a better way we can fulfil certain uses cases, particularly with a
> focus on usability.

For me, a good usability of a build system is defined by a small,
orthogonal and powerful set of tools and rules.

Implementing hacks for specific use cases (e.g. magically remove the
busybox or util-linux -> systemd dep for "rescue systems") violates
this and will probably cause bad surprises (e.g. for people who want
'lighttp' in the rescue system and when the hack has not been applied
to this package).


> I'm actually moderately annoyed that throughout the various discussions
> about systemd and how we'd get it into OE-Core nobody actually mentioned
> these specific requirements until very late in the implementation.

That's a general problem with oe release model.  Parts of systemd (in
-core) were changed without adapting the other ones (in -meta).  This
made the whole oe unbuildable for me for one week and I did not saw the
problem with the rescue image hence.


>> Assuming we are able to break the hard dependencies, what is with package
>> scripts which require programs, files or directories from these deps?  Do
>> we need a way to differ between good and bad script failures then?
>
> At the technical level there is little difference from packaging these
> things separately to avoid specific dependencies and explicitly telling
> the package manager to avoid that dependency instead.

see Martin's comment about post/pre scripts


> Equally there are other cases where people do want to break specific
> dependencies so this could help us in that area too.

Dependencies and recommends are good and moving things into subpackages
is *the* way to break them.



Enrico


