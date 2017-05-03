Return-Path: <Andreas.Reichel@tngtech.com>
Received: from proxy.tng.vnc.biz (zimbra-vnc.tngtech.com [83.144.240.98])
	by mail.openembedded.org (Postfix) with ESMTP id 1DD4871AE4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 08:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by proxy.tng.vnc.biz (Postfix) with ESMTP id D48671E18B0;
	Wed,  3 May 2017 10:43:53 +0200 (CEST)
X-Spam-Flag: NO
X-Spam-Score: -1.501
X-Spam-Level: 
X-Spam-Status: No, score=-1.501 tagged_above=-10 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-0.5, LOCAL_FROM_TNG=-0.001]
	autolearn=ham autolearn_force=no
Received: from proxy.tng.vnc.biz ([127.0.0.1])
	by localhost (proxy.tng.vnc.biz [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id jEoqui8UydUw; Wed,  3 May 2017 10:43:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by proxy.tng.vnc.biz (Postfix) with ESMTP id 0E7391E199F;
	Wed,  3 May 2017 10:43:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at 
Received: from proxy.tng.vnc.biz ([127.0.0.1])
	by localhost (proxy.tng.vnc.biz [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id D8qFvzee7Hcb; Wed,  3 May 2017 10:43:52 +0200 (CEST)
Received: from localhost (p578a821c.dip0.t-ipconnect.de [87.138.130.28])
	by proxy.tng.vnc.biz (Postfix) with ESMTPSA id A064E1E18B0;
	Wed,  3 May 2017 10:43:52 +0200 (CEST)
Date: Wed, 3 May 2017 10:45:52 +0200
From: Andreas Reichel <Andreas.Reichel@tngtech.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Message-ID: <20170503084552.GA1431@tng>
References: <20170421121145.9797-1-andreas.reichel@tngtech.com>
	<20170421121145.9797-2-andreas.reichel@tngtech.com>
	<20170502125638.GA17260@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20170502125638.GA17260@linux.intel.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Andreas Reichel <andreas.reichel.ext@siemens.com>,
	Daniel Wagner <daniel.wagner@siemens.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [wic patch 1/5] wic: Catch errors during image files clean-up
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
X-List-Received-Date: Wed, 03 May 2017 08:43:56 -0000
X-Groupsio-MsgNum: 96854
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline

--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=iso-8859-1
Content-Description: message
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 02, 2017 at 03:56:38PM +0300, Ed Bartosh wrote:
> On Fri, Apr 21, 2017 at 02:11:41PM +0200, Andreas J. Reichel wrote:
> > Handle exception if a file could not be deleted during clean-up of
> > unwanted files, thus preventing a failure of wic in this case.
>=20
> Can you explain why partition images can't be deleted?
> As wic creates them it's not obvious why it can't remove them.
>=20
As part of our internal project, we generate artifacts to be packaged
in further archives and only contain one single partition image. The
image generation process is solely done by wic and post-processing
scripts, therefore we always used the .p2 file for the root partition,
that had already peen patched (for example fstab by wic). Suddenly the
file was missing and CI was not working anymore. Here, instead of
just stating, that *nobody* needs these files, my idea was to
introduce a parameter, so that people can chose if they want them or
not.=20
We do not want to generate any image artifacts with bitbake to keep
things separated better.
Just saving space is not a valid argument to me because building
a system with bitbake needs up to 50 GB and if you do it for several
machines, a few hundred MB should not matter. However, no problem for me
to delete them per standard, if you say *most* people don' use them.

> > Signed-off-by: Andreas Reichel <andreas.reichel.ext@siemens.com>
> > Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> > Signed-off-by: Daniel Wagner <daniel.wagner@siemens.com>
> >=20
> > ---
> >  scripts/lib/wic/plugins/imager/direct.py | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic=
/plugins/imager/direct.py
> > index f2e6127331..d6b47ff0bb 100644
> > --- a/scripts/lib/wic/plugins/imager/direct.py
> > +++ b/scripts/lib/wic/plugins/imager/direct.py
> > @@ -541,7 +541,12 @@ class PartitionedImage():
> >      def cleanup(self):
> >          # remove partition images
> >          for image in set(self.partimages):
> > -            os.remove(image)
> > +            try:
> > +                os.remove(image)
> > +            except IOError as e:
> > +                logger.warning(
> > +                    "Could not delete file. {0}: I/O error ({1}): {2}\=
n".format(
> > +                    image, e.errno, e.strerror))
> > =20
> >      def assemble(self):
> >          logger.debug("Installing partitions")
> > --=20
> > 2.11.0
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
> --=20
> --
> Regards,
> Ed

--=20
Andreas Reichel=20
Dipl.-Phys. (Univ.)=20
Software Consultant

Andreas.Reichel@tngtech.com=20
+49-174-3180074

TNG Technology Consulting GmbH, Betastr. 13a, 85774 Unterf=F6hring
Gesch=E4ftsf=FChrer: Henrik Klagges, Christoph Stock, Dr. Robert Dahlke
Sitz: Unterf=F6hring * Amtsgericht M=FCnchen * HRB 135082

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEESCAi86kD+H79vFKkuq/cYNuJpbQFAlkJmL0ACgkQuq/cYNuJ
pbTaUQ/9F5BEoQXKH1mhxukz33ibbNtVeIauL6HOx7ZcRCmdhq8jckymqG8z+0SX
CbLbI+E+qB1Zp4trbv4Ouy23pVd84HHZHIM5AO5F5Ti7K2c9UP3G8ESJ2Ch/k/Mx
+Cg+B6ZWj5z6NyN9Di4Cr7PJrzoMM/HSZkOVhVZgB6CKeCHQ/BzxwZcOfQNLScAk
InXg7zvcrTNrlwzaNuCkKGsPwVNY/sN3I6OegbQQ2RwzwoXw1XqwRzpXye7UgwXQ
wTPpjIsv41jyBXifyCP3RdTRP6RZr0pdveTv01+A1nvyMXtZkCZtqOU9343keB2I
fH7yTNg2n11w9vAf9kkjSsiWdZVqTtXJxZbw66u+dHOUoRwEi7l3vY0uj82+GJbP
05vhUCGMjyb7cgiBt5iPy8QqbG/okf31s/VI5Na6Vsc983ejDlEOwecrPJpr2qi/
JSQtCcrtW10hP4s6fDoFYdU46Eu+kIZE7BP6bVHVX2QE6WA7kue4itwlYTxOHhzh
lMwKeEo3FhWYNaQUVTxw0QsO9zmzNgDU91GVxxvFs4KJGd88AkpP9PaoBzaprAGx
SgOvvukQyft4mDVjaplOqT90uXE1c4l9Po9F7MPKyGySszd7zwTgkLN2Ul9UHzct
L+M5Tzhm977L/sbzkuFakjyU6KEUmY/nXtKA8/OT3fJQZxswTKk=
=L5H0
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--
