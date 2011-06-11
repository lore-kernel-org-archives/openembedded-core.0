Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QVJt7-0004BX-Mh for openembedded-core@lists.openembedded.org;
	Sat, 11 Jun 2011 10:49:49 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>)
	id 1QVJps-0000go-FI; Sat, 11 Jun 2011 10:46:28 +0200
From: Phil Blundell <pb@pbcl.net>
To: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <4DF324BE.2090407@windriver.com>
References: <4DF31F79.4070602@windriver.com>
	<1307779402.3307.12.camel@lenovo.internal.reciva.com>
	<4DF324BE.2090407@windriver.com>
Date: Sat, 11 Jun 2011 09:46:22 +0100
Message-ID: <1307781982.3307.22.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: "Purdie, Richard" <richard.purdie@intel.com>, "Wold,
	Saul" <saul.wold@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: About share eglibc work directories
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
X-List-Received-Date: Sat, 11 Jun 2011 08:49:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-06-11 at 16:18 +0800, Robert Yang wrote:
> On 06/11/2011 04:03 PM, Phil Blundell wrote:
> > On Sat, 2011-06-11 at 15:55 +0800, Robert Yang wrote:
> >> The source code of eglibc and eglibc-nativesdk are not compatible because of
> >> the patch ld-search-order.patch, this makes it a little complex to share their
> >> source directories, what can I think is that always apply
> >> ld-search-order.patch, then in do_configure_prepend:
> >
> > I must admit I never quite understood why ld-search-order.patch is
> > really required; it seems like rather a gruesome hack.  Why can't the
> > SDK paths just be put in RPATH records for the nativesdk binaries?
> >
> 
> Here is the comment in ld-search-order.patch, hope this can answer you question:

Thanks.  I did see that comment before but I don't think it really
answers the question.

If I'm understanding correctly, the issue is that you want nativesdk
binaries to search for libraries inside the SDK initially, and then to
fall back on the host's own search path (i.e. the same one that host
binaries would use) for libs that aren't shipped as part of the SDK.

Is the issue that the SYSTEM_DIRS end up pointing to somewhere inside
the sysroot?  If that's the case then it seems like a better fix would
be just to force it back to the genuine system dirs in the nativesdk
case.  (The default comes from Makeconfig so I think you should be able
to do this without source code patching.)  This would avoid the risk of
the sdk breaking on systems where ld.so.cache is missing for whatever
reason.

p.




