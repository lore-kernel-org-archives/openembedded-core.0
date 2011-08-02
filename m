Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QoGXw-0004Yw-B4
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 17:06:16 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1QoGTl-0002Tk-4u; Tue, 02 Aug 2011 17:01:57 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Nitin A Kamble
	<nitin.a.kamble@intel.com>
Date: Tue, 02 Aug 2011 16:01:56 +0100
In-Reply-To: <C9D28EB1-CE86-42E9-9825-0A408698FD66@dominion.thruhere.net>
References: <1312296431-18991-1-git-send-email-koen@dominion.thruhere.net>
	<C9D28EB1-CE86-42E9-9825-0A408698FD66@dominion.thruhere.net>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1312297317.4325.46.camel@phil-desktop>
Mime-Version: 1.0
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
X-List-Received-Date: Tue, 02 Aug 2011 15:06:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

It does look a bit weird.  That code was introduced in 561d8754,
ostensibly as a merger of the eglibc and glibc equivalents.  But, the
original code from glibc-package.bbclass did:

       def output_locale_binary_rdepends(name, pkgname, locale, encoding):
               m = re.match("(.*)\.(.*)", name)
               if m:
                       glibc_name = "%s.%s" % (m.group(1), m.group(2).lower().replace("-",""))
               else:
                       glibc_name = name
               bb.data.setVar('RDEPENDS_%s' % pkgname, legitimize_package_name('glibc-binary-localedata-%s' % glibc_name), d)

... i.e. it was using the "." separator both for splitting and joining,
which seems reasonable.  But somehow when it showed up in
libc-package.bbclass it had gotten transmogrified so that it split on
"_" but joined with "." as you showed below.  That seems bogus to me.

p.

On Tue, 2011-08-02 at 16:55 +0200, Koen Kooi wrote:
> The bug I was seeing was caused by something else, but I'd still like feedback on this patch to find out why the dot vs dash difference exists
> 
> Op 2 aug. 2011, om 16:47 heeft Koen Kooi het volgende geschreven:
> 
> > When using binary locales rootfs generation fails with:
> > 
> > | Unknown package 'locale-base-en-us'.
> > | Collected errors:
> > |  * opkg_install_cmd: Cannot install package locale-base-en-us.
> > 
> > This is due to:
> > 
> > $ dpkg-deb -I ipk/armv7a/locale-base-en-us_2.12-r16_armv7a.ipk | grep Depends
> > Depends: eglibc-binary-localedata-en.us
> > 
> > Note the '.' seperator
> > 
> > $ ls ipk/armv7a/ | grep binary-localedata-en | grep us
> > eglibc-binary-localedata-en-us_2.12-r16_armv7a.ipk
> > 
> > Note the '-' seperator vs the '.' in the locale-base packages.
> > 
> > Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> > ---
> > meta/classes/libc-package.bbclass |    2 +-
> > 1 files changed, 1 insertions(+), 1 deletions(-)
> > 
> > diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
> > index de57230..67d08c0 100644
> > --- a/meta/classes/libc-package.bbclass
> > +++ b/meta/classes/libc-package.bbclass
> > @@ -243,7 +243,7 @@ python package_do_split_gconvs () {
> > 	def output_locale_binary_rdepends(name, pkgname, locale, encoding):
> > 		m = re.match("(.*)_(.*)", name)
> > 		if m:
> > -			libc_name = "%s.%s" % (m.group(1), m.group(2).lower().replace("-",""))
> > +			libc_name = "%s-%s" % (m.group(1), m.group(2).lower().replace("-",""))
> > 		else:
> > 			libc_name = name
> > 		bb.data.setVar('RDEPENDS_%s' % pkgname, legitimize_package_name('%s-binary-localedata-%s' \
> > -- 
> > 1.6.6.1
> > 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




