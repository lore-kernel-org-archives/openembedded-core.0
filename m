Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UaR3f-0002Ds-Aa for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 15:38:57 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UaQmD-00082L-Fd; Thu, 09 May 2013 15:20:53 +0200
Message-ID: <1368105605.16243.65.camel@pb-ThinkPad-R50e>
From: Phil Blundell <pb@pbcl.net>
To: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
Date: Thu, 09 May 2013 14:20:05 +0100
In-Reply-To: <1368104132-30116-1-git-send-email-bogdan.a.marinescu@intel.com>
References: <1368104132-30116-1-git-send-email-bogdan.a.marinescu@intel.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: include libgcc when libpthread is enabled
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
X-List-Received-Date: Thu, 09 May 2013 13:38:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-05-09 at 15:55 +0300, Bogdan Marinescu wrote:
>  # nptl needs libgcc but dlopens it, so our shlibs code doesn't detect this
> -#RDEPENDS_${PN} += "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
> +RDEPENDS_${PN} += "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"

Wow, it seems like this has been broken since 2008 and nobody noticed.
That line was commented out in oe-classic e96e82cd without any real
explanation and it's been that way ever since.

That said, forcing libgcc into RDEPENDS_${PN} unconditionally like this
is suboptimal, because programs that don't link -lpthread (or possibly
even programs that do, if they don't use cancellation) still don't need
libgcc.  With this change it will be impossible to avoid getting libgcc
in an image, which will be a loss for those trying to build small images
with single threaded programs.

p.




