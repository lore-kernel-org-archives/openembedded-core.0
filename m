Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1T9ZT2-0007Hn-D1
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 12:37:48 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1T9ZH2-0005L5-UE; Thu, 06 Sep 2012 12:25:25 +0200
From: Phil Blundell <philb@gnu.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Thu, 06 Sep 2012 11:25:23 +0100
In-Reply-To: <4865258.AYjzzpLvn7@helios>
References: <CALbNGRTrP1i2R69pT-rgtGhs+qmeGeGtPnBAxGgpxq5L2SJ3Ag@mail.gmail.com>
	<4865258.AYjzzpLvn7@helios>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1346927124.2673.184.camel@phil-desktop>
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: IMAGE_LINGUAS question
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
X-List-Received-Date: Thu, 06 Sep 2012 10:37:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-09-06 at 10:51 +0100, Paul Eggleton wrote:
> On Tuesday 28 August 2012 06:33:55 Andreas M=C3=BCller wrote:
> > The display manager LXDM (and I think others too) check in
> > configuration files which languages to offer. I would like to add a
> > postinst for LXDM which fills it's configuration file according to
> > what was installed by IMAGE_LINGUAS. Now my question (I looked into
> > image.bbclass but did not find something useful): Is there some file
> > around in rootfs where I can get the information which languages were
> > installed by image linguas?
>=20
> My suggestion would be to add a shell function called from=20
> ROOTFS_POSTPROCESS_COMMAND which calls the get_split_linguas shell functi=
on=20
> (see image.bbclass) or uses IMAGE_LINGUAS directly depending on what your=
=20
> configuration file expects.

That is a good idea for static rootfses without O_P_M, but obviously it
won't help much for subsequent online installs of LXDM.  Also, in an
ideal world, you'd want LXDM to dynamically update for subsequent online
installation or removal of other language packs.

It used to be fairly straightforward to inspect /usr/share/locale to
determine what linguas were installed, but this doesn't work anymore
with the packed locale archive format.  It might be worth offering a
DISTRO option to have language packs install some dummy marker file
(e.g. /usr/share/locale/LINGUA.installed) to advertise their presence,
perhaps.  Or alternatively write some tool to poke at the
locale-archive, but that'd end up being somewhat libc-specific.

p.




