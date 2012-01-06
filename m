Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Rj9dZ-00020q-Qv
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 14:15:13 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Rj9WS-0003id-2E
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 14:07:52 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 06 Jan 2012 13:07:51 +0000
In-Reply-To: <4F0642B9.20104@opendreambox.org>
References: <1325799041-3640-1-git-send-email-andrei@gherzan.ro>
	<4F0642B9.20104@opendreambox.org>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1325855272.28005.177.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] wpa-supplicant: Compile without CONFIG_GNUTLS_EXTRA
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
X-List-Received-Date: Fri, 06 Jan 2012 13:15:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-01-06 at 01:39 +0100, Andreas Oberritter wrote:
> On 05.01.2012 22:30, Andrei Gherzan wrote:
> > From: Andrei Gherzan <andrei.gherzan@windriver.com>
> > 
> > CONFIG_GNUTLS_EXTRA is needed as support for TLS/IA which was designed to be used
> > in the EAP-TTLSv1. As we don't see any requirement for that protocol today we decided
> > to remove it from wpa-supplicant .config file.
> 
> With this option removed, is there any reason to prefer GnuTLS over
> OpenSSL? OpenSSL is wpa-supplicant's default, and at least Ubuntu uses
> OpenSSL with it, too. I guess it's tested more thoroughly than GnuTLS.

OpenSSL's license can be a nuisance at times because it is incompatible
with the GPL.  In the particular case of wpa-supplicant it doesn't
present a massive problem since wpa-supplicant itself is dual-licensed
and you can just ship the binaries under the BSD license instead.

However:

a) you might want to modify wpa-supplicant by linking it with GPL code,
which would require the resulting binary to also be distributed under
the GPL (and hence prohibit the use of openssl); or

b) you might already be using GnuTLS elsewhere on the system (e.g. for
other programs which are GPL-only or simply don't include support for
OpenSSL at a technical level).  In this case you probably want to link
wpa-supplicant with GnuTLS as well so as to avoid shipping more SSL
libraries than necessary.

So, ideally, I think the choice as to whether OpenSSL or GnuTLS is
preferred should be a DISTRO_FEATURE, and/or a PACKAGECONFIG option for
wpa-supplicant.

p.




