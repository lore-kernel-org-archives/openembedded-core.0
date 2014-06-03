Return-Path: <martin.jansa@gmail.com>
Received: from mail-pb0-f50.google.com (mail-pb0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id CEDCF6B711
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 08:31:54 +0000 (UTC)
Received: by mail-pb0-f50.google.com with SMTP id ma3so5188221pbc.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jun 2014 01:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fqDiJAi5Pbjhzoti1q9rnU777retOwiA03Y6+F7Pnoo=;
	b=H1DNv0JwYL4iMXhPDYQ/vJ7mAaP/Mly5sBqIYCEIbGw2D8N4v0mjG9hY1dvXfybFtQ
	ASAwvdJg9BjqxDBoT9oCQ1yPpjSgsMgwVRqSRSzmNq/QSj1qmzUoQczDMZemqQYWtBpA
	F9LhCzZPjd3IBghUwCFin2Ec4Rp4PSeTyvXD4q5JawMguviZKaIjhES32CZ9uRxO2zWN
	igXPKiGVdLjoiCrOEH9v+ubWJXlI4hYhMXrXhlw6a+XwW0ST+vENQvF1A0LH6ku+ZHJj
	uW6uj6TImVCgGn7ndMZ5ke5kXgjXrwFvoiSdobGScWX7fLPiQ/YyIFtM5KfyJ6RkJvoJ
	NHOA==
X-Received: by 10.68.164.4 with SMTP id ym4mr47495078pbb.53.1401784315436;
	Tue, 03 Jun 2014 01:31:55 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	wp3sm24950379pbc.67.2014.06.03.01.31.52 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Jun 2014 01:31:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 3 Jun 2014 10:32:04 +0200
To: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <20140603083204.GN2426@jama>
References: <53843793.3030309@topic.nl>
	<CAMKF1sr1vGQf8WSvbeXE5SufAaDivpn7czr5EL-VWKhw9_drBg@mail.gmail.com>
	<CABcZANm0dkCh1zFysD6VjDLS-ijHGqNat=FRVTYf03SeUF4XDQ@mail.gmail.com>
	<1401318733.2607.71.camel@ted> <538D5C34.4060905@topic.nl>
MIME-Version: 1.0
In-Reply-To: <538D5C34.4060905@topic.nl>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: How to find out why shared sstate is not being used for a recipe
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
X-List-Received-Date: Tue, 03 Jun 2014 08:32:02 -0000
X-Groupsio-MsgNum: 53776
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uQ3BaAlxDi9XKvis"
Content-Disposition: inline

--uQ3BaAlxDi9XKvis
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 03, 2014 at 07:25:08AM +0200, Mike Looijmans wrote:
> =EF=BB=BFOn 05/29/2014 01:12 AM, Richard Purdie wrote:
> > On Wed, 2014-05-28 at 13:46 -0700, Christopher Larson wrote:
> >>
> >> On Wed, May 28, 2014 at 1:42 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >>          On Mon, May 26, 2014 at 11:58 PM, Mike Looijmans
> >>          <mike.looijmans@topic.nl> wrote:
> >>          > I have a deja-vu feeling about this question.
> >>          >
> >>          > I have this recipe:
> >>          >
> >>          >
> >>          https://github.com/topic-embedded-products/meta-topic/blob/ma=
ster/recipes-bsp/fpga/fpga-image-miami.bb
> >>          >
> >>          > Which includes this one:
> >>          >
> >>          https://github.com/topic-embedded-products/meta-topic/blob/ma=
ster/recipes-bsp/fpga/fpga-image.inc
> >>          >
> >>          > I have a build server that exports its sstate-cache
> >>          directory through HTTP,
> >>          > and a local host that attempts to use that sstate-cache.
> >>          This works fine,
> >>          > except for the recipe above. Building this recipe takes
> >>          about 1 hour, so i
> >>          > really really really want to share that state at any cost.
> >>          As you can see,
> >>          > I've done a big shotgun blast of "vardepdsexclude" to get
> >>          the recipe to be
> >>          > as common as possible. Still any host wants to build its own
> >>          version.
> >>          >
> >>          > How can I diagnose the REASON that my machine thinks it
> >>          isn't building the
> >>          > exact same thing as the build server?
> >>
> >>
> >>          see https://wiki.yoctoproject.org/wiki/Enable_sstate_cache
> >>          towards the end it talks about verifying sstate sigs
> >>
> >>
> >> If the sstate is local at least, you can use bitbake -S printdiff
> >> <target>. There's also bitbake-whatchanged, but the bitbake one is
> >> superior.
>=20
> It's on two different machines, so I think that does not qualify as "loca=
l".
>=20
> > Worst case, you can pull the siginfo files from one build and the
> > siginfo files from the sstate mirror and then see which ones are
> > different, then run bitbake-diffsigs X Y to compare the two files.
>=20
> How do I find what to pull? I have (ssh) access to both machines. The=20
> sstate-cache dir contains a bunch of two-digit directories and a gazillio=
n files.
>=20
> I could just copy the whole thing to one machine, there's gigabit between=
=20
> them, but then what do I do with these files?

You can also use openembedded-core/scripts/sstate-diff-machines.sh
script to create just .sigdata files on both machines and then copy just
this sstate-diff directory, see header of that script for very short
readme.

> > bitbake -S just tries to automate that process if it can.
> >
>=20
> bitbake -S usually crashes here.

Are you using latest bitbake? There was fix for that in newer bitbake alrea=
dy/

> Met vriendelijke groet / kind regards,
>=20
> Mike Looijmans
>=20
> TOPIC Embedded Systems
> Eindhovenseweg 32-C, NL-5683 KH Best
> Postbus 440, NL-5680 AK Best
> Telefoon: (+31) (0) 499 33 69 79
> Telefax:  (+31) (0) 499 33 69 70
> E-mail: mike.looijmans@topic.nl
> Website: www.topic.nl
>=20
> Please consider the environment before printing this e-mail
>=20
> Visit us at MEDTEC Europe 3-5 June, Messe Stuttgart, stand number 5D20
> http://medteceurope.com/index.php?page=3Dhome-en
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uQ3BaAlxDi9XKvis
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlONiAQACgkQN1Ujt2V2gBwhUACeJGLYIJ8Ir6ROb8FF2vOyFiPU
FHMAn0O7ejZiCbf4nRNB2VHsvGa8r9KH
=2VPH
-----END PGP SIGNATURE-----

--uQ3BaAlxDi9XKvis--
