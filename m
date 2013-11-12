Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id F36956D040
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 22:59:48 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.7]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>)
	id 1VgMw2-0007oG-3y; Tue, 12 Nov 2013 23:59:50 +0100
Message-ID: <1384300735.3828.40.camel@x121e.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Lei Liu <layliu@gmail.com>
Date: Tue, 12 Nov 2013 23:58:55 +0000
In-Reply-To: <52805D73.4050306@gmail.com>
References: <52805D73.4050306@gmail.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.4.4-3 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview:  On Mon, 2013-11-11 at 12:30 +0800,
	Lei Liu wrote: > +def get_optimization(d):
	> + selected_optimization = d.getVar("SELECTED_OPTIMIZATION",
	True) > + if
	base_contains("SELECTED_OPTIMIZATION", "-O0", "x", "",
	d) == "x": > + bb.note("libgcc can't be built with -O0,
	-O2 will be used instead.") > + return
	selected_optimization.replace("-O0", 
	"-O2") > + return selected_optimization > + > +SELECTED_OPTIMIZATION :=
	"${@get_optimization(d)}" [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Disable building libgcc with -O0
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
X-List-Received-Date: Tue, 12 Nov 2013 22:59:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-11-11 at 12:30 +0800, Lei Liu wrote:
> +def get_optimization(d):
> +    selected_optimization = d.getVar("SELECTED_OPTIMIZATION", True)
> +    if base_contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) == "x":
> +        bb.note("libgcc can't be built with -O0, -O2 will be used instead.")
> +        return selected_optimization.replace("-O0", "-O2")
> +    return selected_optimization
> +
> +SELECTED_OPTIMIZATION := "${@get_optimization(d)}"

Do we really need a Python function for this?  It seems like a rather
heavyweight mechanism to detect what is basically just a distro
misconfiguration.

How about just patching the appropriate bit of libgcc to include:

#if __OPTIMIZE__ == 0
#error libgcc can't be built with -O0, please fix your distro to use at least -O1
#endif

or some such?  Even this seems slightly dubious, since it will prevent
you from building an unoptimised libgcc even if you have no intention of
running valgrind with it, but at least this doesn't add extra overhead
within bitbake.

p.



