Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QcfBC-0007Em-Iv for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 16:58:50 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1Qcf7c-0002Ma-5K
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 16:55:08 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4FC82E26-5A0C-48DF-99F5-7E2D9B8C7290@dominion.thruhere.net>
References: <1309446689-21243-1-git-send-email-koen@dominion.thruhere.net>
	<201106301633.48933.paul.eggleton@linux.intel.com>
	<4FC82E26-5A0C-48DF-99F5-7E2D9B8C7290@dominion.thruhere.net>
Organization: Phil Blundell Consulting Ltd
Date: Fri, 01 Jul 2011 15:55:06 +0100
Message-ID: <1309532106.2633.74.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH] insane bbclass: turn fatal errors back into fatal errors
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
X-List-Received-Date: Fri, 01 Jul 2011 14:58:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-30 at 17:49 +0200, Koen Kooi wrote:
> It's a white list, so:
> 
> # 0 - non dev contains .so
> # 5 - .la contains installed=yes or reference to the workdir
> # 7 - the desktop file is not valid
> # 8 - .la contains reference to the workdir
> # 9 - LDFLAGS ignored
> 
> Are warnings and
> 
> # 1 - package contains a dangerous RPATH
> # 2 - package depends on debug package
> # 3 - non dbg contains .so
> # 4 - wrong architecture
> # 6 - .pc contains reference to /usr/include or workdir
> # 10 - Build paths in binaries
> # 11 - package depends on devel package
> 
> Are fatal errors. The splits seems arbitrary to me, but it that's how it was last year before RP disabled all fatal errors.

I guess the split does make some sense as it is, although I can't see
any reason for #8 not to be in the fatal set.  #5 also seems like it
would belong there except that, as far as I can tell, that test doesn't
actually exist in the code so it's a bit academic how the results are
treated.

#7 is, in the scheme of things, a relatively minor infringement (and
usually an upstream bug anyway) so probably oughtn't to make a package
unshippable.  #9 is potentially a nuisance but in most cases doesn't
cause any actual problems, so again I think it's fair for this to be a
warning. 

Incidentally, it seems that the description for #6 is a bit wrong: it
doesn't actually do any checking for /usr/include.  And #3 should
obviously be talking about .debug not .so.

p.



