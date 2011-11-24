Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RTdpI-00079U-Ji
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 19:15:12 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RTdiz-0001rw-H1
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 19:08:41 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 24 Nov 2011 18:08:40 +0000
In-Reply-To: <20111124180305.GD28767@sakrah.homelinux.org>
References: <1322041226-10075-1-git-send-email-msm@freescale.com>
	<CAMKF1sqdUPP1=3wiAMTD+Jmf8mbJyDXq4GT7Ho06=mBee92pPw@mail.gmail.com>
	<CAEsOVNd+AuWWwHQAWmeyJ0jnNaVm2522pO_ykVdqzc1X9m96Tg@mail.gmail.com>
	<CAMKF1sov7U1oRZYDyBdWT3uYr1_P0+pAJxU7kLVsDfngJhG16Q@mail.gmail.com>
	<CAEsOVNe22kPLsNn0pmkuSycHwNfO6AFgJGxqMb=ex+VamAK9hw@mail.gmail.com>
	<CAEsOVNe-AvQ-DXUH-TMZFtmmAJ0oqSRveh+ovC-qvttrpguARg@mail.gmail.com>
	<CAMKF1sr8RdXbS3po2fz+e_Q9oKt133QmdJzs=+idSdeQ7MEWnQ@mail.gmail.com>
	<CAEsOVNezsZu5dDEKZCiPd6ya8bmgyejMCmFvrgJ1br2JQQqs9w@mail.gmail.com>
	<1322132099.26081.43.camel@phil-desktop>
	<20111124180305.GD28767@sakrah.homelinux.org>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1322158121.26081.60.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [RFC] gcc-cross.inc: Add depedency on BUILD_ARCH
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
X-List-Received-Date: Thu, 24 Nov 2011 18:15:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-11-24 at 10:03 -0800, Khem Raj wrote:
> On (24/11/11 10:54), Phil Blundell wrote:
> > On Thu, 2011-11-24 at 07:29 +0000, McClintock Matthew-B29882 wrote:
> > > On Thu, Nov 24, 2011 at 1:21 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > > > hmmm I guess cross recipes are special they should not have been built
> > > > under target recipes. Adding build arch to package name would be ok
> > > > too but may be if they were built under directory of their own which
> > > > was something like <build>-<host>-<target> then it would also solve
> > > > the problem i think
> > > 
> > > I agree - this is the discussion I'm trying to start. ;)
> > 
> > It's certainly true that the way the cross recipes are done at the
> > moment does suck.  Really, they should be built as primarily native and
> > the target arch ought to just be encoded into ${PN} somehow, rather than
> > the current arrangement of pretending that they are target recipes.
> > (All the runtime bits are, or should be, packaged separately by either
> > libgcc or gcc-runtime so they will already get the right PACKAGE_ARCH.)
> 
> yes building them under native build dir and suffixing with
> build.host.arch would be way to go

I don't think it's necessary to put all three components in the name,
and doing so would make it harder to construct the right string to go in
DEPENDS later.

PACKAGE_ARCH for native is already the host system, so you get that one
for free, and the build arch is (or ought to be) irrelevant as far as
the artifacts are concerned.  So I think it's just the target system
name that needs to be encoded into PN for gcc-cross and binutils-cross.

p.




