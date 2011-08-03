Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QohoK-0000CR-5l
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 22:13:01 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1Qohk6-0004Eh-1V; Wed, 03 Aug 2011 22:08:38 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E39A92B.5040207@mlbassoc.com>
References: <1312389206-15422-1-git-send-email-msm@freescale.com>
	<4E397AE8.5020707@mlbassoc.com>
	<CAEsOVNf5eZ6PLkqw_Ya8XEEzr1uQprGXOeqc4aS7BCcja7Bsmw@mail.gmail.com>
	<4E39A92B.5040207@mlbassoc.com>
Date: Wed, 03 Aug 2011 21:08:31 +0100
Message-ID: <1312402111.4007.6.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Cc: McClintock Matthew-==B29882 <B29882@freescale.com>,
	"openembedded-core@openembedded.org" <openembedded-core@openembedded.org>
Subject: Re: [yocto] [PATCH] Update intltool to set perl shebang correctly for installed tools
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
X-List-Received-Date: Wed, 03 Aug 2011 20:13:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

[ Removed yocto@ from Cc.  Please don't crosspost between oe-core and
yocto. ]

On Wed, 2011-08-03 at 14:01 -0600, Gary Thomas wrote:
> On 2011-08-03 13:52, McClintock Matthew-B29882 wrote:
> > (Sorry if this get sent twice...)
> >
> > On Wed, Aug 3, 2011 at 11:44 AM, Gary Thomas<gary@mlbassoc.com>  wrote:
> >> On 2011-08-03 10:33, Matthew McClintock wrote:
> >>>
> >>> Several installed scripts set the perl shebang that is too long
> >>> which can cause failures on certian older bash versions.
> >>
> >> How does the change below correspond to this comment?  It's not
> >> clear [at least to me] how changing that environment variable
> >> affects shebang constructs.  Can you give a more thorough explanation?
> >
> > The scripts intltool-{update,etc} installed in sysroot end up having
> > *really* long shebangs without this change. On older distros this
> > causes the intltool scripts to just fail usually during the configure
> > task. intltools recipe itself will
> > build and install fine. However, when a package that requires
> > intltool's is being configured they will all fail withing invoking
> > intltools.
> 
> This much was already clear from your explanation - the "what happens and
> why it needs fixing" part.
> 
> What I don't see is the "why" - why does defining PERL vs PERL_virtclass-native
> have this effect?

Agreed, that seems weird and bogus.  Surely the scripts which go into
the sysroot (and later get executed on the build host) are going to be
the ones that were built with virtclass-native, in which case this would
be a no-op.  

And for scripts that are going to be packaged for installation on the
target, I'm not sure it is safe to assume that env is installed at all
and, even if it is guaranteed to be there, it is certainly not safe to
hardcode "/usr/bin" as the path to find it.  So I'm pretty sure that
this patch is the wrong thing.

p.




