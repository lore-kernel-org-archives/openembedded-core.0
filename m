Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QeO7b-0005jt-8O for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 11:10:15 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1QeO3v-000479-6x
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 11:06:27 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 06 Jul 2011 10:06:26 +0100
In-Reply-To: <CAP9ODKrdgM9re6WDXWOCCt+g2Jfm7YRewFw4GibTUJBFrOUmVA@mail.gmail.com>
References: <cover.1309906154.git.richard.purdie@linuxfoundation.org>
	<CAP9ODKrdgM9re6WDXWOCCt+g2Jfm7YRewFw4GibTUJBFrOUmVA@mail.gmail.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.0.2- 
Message-ID: <1309943187.6337.3.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 00/17] Various QA/unpackaged files cleanups
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
X-List-Received-Date: Wed, 06 Jul 2011 09:10:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-05 at 23:59 -0300, Otavio Salvador wrote:
> On Tue, Jul 5, 2011 at 19:51, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > This patch series is for a number of QA/unpackaged files cleanups.
> 
> I noticed you have added .la files in some packages. This seems wrong
> and useless. In fact I am making a local patchset to drop them all and
> I have most build working (fixing last things before posting for
> review).
> 
> It seems very wrong to depend on .la files for linking and pkg-config
> seems to be the most right solution when possible.

I think Richard's patch to add the .las to the appropriate FILES is a
reasonable one.  Whether you actually want the .la files installed or
not is another question, but if your policy is that you don't then I
think the right answer is a global mechanism to suppress them rather
than tinkering with individual recipes.  It would probably be fairly
straightforward to make a new class which did something like:

do_purge_la() {
	find ${D} -name "*.la" | xargs rm -f
}

addtask purge_la after do_install before do_package do_populate_sysroot

which you could then call in from your DISTRO config as and when
desired.

p.




