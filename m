Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qp62E-00077A-Tf
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 00:04:59 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qp5xw-0004tN-5Z
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 00:00:32 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <F2D133A8-03CF-408A-A22B-CCC200E2AF18@dominion.thruhere.net>
References: <1312296431-18991-1-git-send-email-koen@dominion.thruhere.net>
	<C9D28EB1-CE86-42E9-9825-0A408698FD66@dominion.thruhere.net>
	<1312297317.4325.46.camel@phil-desktop>
	<F2D133A8-03CF-408A-A22B-CCC200E2AF18@dominion.thruhere.net>
Date: Thu, 04 Aug 2011 23:00:26 +0100
Message-ID: <1312495226.3169.8.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH] libc-package bbclass: fix binary localedata dependency code
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
X-List-Received-Date: Thu, 04 Aug 2011 22:04:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-03 at 08:19 +0200, Koen Kooi wrote:
> Op 2 aug. 2011, om 17:01 heeft Phil Blundell het volgende geschreven:
> 
> > It does look a bit weird.  That code was introduced in 561d8754,
> > ostensibly as a merger of the eglibc and glibc equivalents.  But, the
> > original code from glibc-package.bbclass did:
> > 
> >       def output_locale_binary_rdepends(name, pkgname, locale, encoding):
> >               m = re.match("(.*)\.(.*)", name)
> >               if m:
> >                       glibc_name = "%s.%s" % (m.group(1), m.group(2).lower().replace("-",""))
> >               else:
> >                       glibc_name = name
> >               bb.data.setVar('RDEPENDS_%s' % pkgname, legitimize_package_name('glibc-binary-localedata-%s' % glibc_name), d)
> > 
> > ... i.e. it was using the "." separator both for splitting and joining,
> > which seems reasonable.  But somehow when it showed up in
> > libc-package.bbclass it had gotten transmogrified so that it split on
> > "_" but joined with "." as you showed below.  That seems bogus to me.

I'm not sure whether your original locale problem is still an issue, but
I am still fairly convinced that the change to the regex in the code
above was incorrect.  Unless the author of 561d8754 wants to speak up in
its defence soon, I will submit a patch to change it back to using ".".

p.




