Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1R8dRa-0005M2-R1
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 21:35:54 +0200
Received: from host81-156-123-228.range81-156.btcentralplus.com
	([81.156.123.228] helo=[192.168.1.65])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1R8dMN-0008Tw-AS
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 21:30:31 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CAMKF1spia2JSMq_jQwUUKJWUzjNC+pD-qKTiBAaSDujHuB3iPg@mail.gmail.com>
References: <CAMKF1spia2JSMq_jQwUUKJWUzjNC+pD-qKTiBAaSDujHuB3iPg@mail.gmail.com>
Date: Tue, 27 Sep 2011 20:29:48 +0100
Message-ID: <1317151788.3120.7.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: Selectable linker (ld or gold) per recipe
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
X-List-Received-Date: Tue, 27 Sep 2011 19:35:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-09-27 at 10:23 -0700, Khem Raj wrote:
> We have gold and ld available to us as linker alternatives. When
> linking webkit with ld it takes 45 mins and grabs 2G of memory where
> as with gold on same machine
> it took 7 minutes. But then we can not use gold to link glibc and
> kernel and may not work on all supported arches. So gold may not be a
> complete replacement for ld. A good solution is that we make it
> possible
> to choose linker at compile time when building the application. gcc
> does not have provisions to select linker on commandline although it
> has configure
> options to select default linker.

Are there any real-world scenarios where this is actually causing a
problem?  Glibc already has its own private compiler (i.e.
gcc-cross-initial) which it can configure any way it wishes, and the
kernel generally likes to call ld directly rather than via the gcc
driver.  So those two are basically a non-issue as far as gold is
concerned.  The thing about not working on all arches is also something
of an non-problem from this point of view, since if gold doesn't work on
a particular architecture (eg mips, I think) then there can't be any
question about which linker should be selected and specifying it
per-recipe would be pointless.

I'm not necessarily opposed to adding a wrapper to make the linker
selectable per recipe but it does rather seem to me that it's a solution
in search of a problem.  And, if it genuinely is a widespread problem I
would have rather thought that it ought to be tackled in consultation
with gcc upstream, otherwise they might go off and invent a different
mechanism for doing the same thing.

p.




