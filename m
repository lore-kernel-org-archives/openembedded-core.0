Return-Path: <Andreas.Reichel@tngtech.com>
Received: from proxy.tng.vnc.biz (zimbra-vnc.tngtech.com [83.144.240.98])
	by mail.openembedded.org (Postfix) with ESMTP id C933C71AE4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 08:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by proxy.tng.vnc.biz (Postfix) with ESMTP id 037E01E1986;
	Wed,  3 May 2017 10:45:47 +0200 (CEST)
X-Spam-Flag: NO
X-Spam-Score: -1.501
X-Spam-Level: 
X-Spam-Status: No, score=-1.501 tagged_above=-10 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-0.5, LOCAL_FROM_TNG=-0.001]
	autolearn=ham autolearn_force=no
Received: from proxy.tng.vnc.biz ([127.0.0.1])
	by localhost (proxy.tng.vnc.biz [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id K4Qtj61KFiVe; Wed,  3 May 2017 10:45:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by proxy.tng.vnc.biz (Postfix) with ESMTP id 3073E1E199F;
	Wed,  3 May 2017 10:45:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at 
Received: from proxy.tng.vnc.biz ([127.0.0.1])
	by localhost (proxy.tng.vnc.biz [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id qXHg2on1F9KL; Wed,  3 May 2017 10:45:46 +0200 (CEST)
Received: from localhost (p578a821c.dip0.t-ipconnect.de [87.138.130.28])
	by proxy.tng.vnc.biz (Postfix) with ESMTPSA id B06A31E1986;
	Wed,  3 May 2017 10:45:45 +0200 (CEST)
Date: Wed, 3 May 2017 10:47:45 +0200
From: Andreas Reichel <Andreas.Reichel@tngtech.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Message-ID: <20170503084745.GB1431@tng>
References: <20170421121145.9797-1-andreas.reichel@tngtech.com>
	<20170421121145.9797-6-andreas.reichel@tngtech.com>
	<20170502133622.GA29938@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20170502133622.GA29938@linux.intel.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Andreas Reichel <andreas.reichel.ext@siemens.com>,
	Daniel Wagner <daniel.wagner@siemens.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [wic patch 5/5] wic: Use enum like dicts for string constants
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
X-List-Received-Date: Wed, 03 May 2017 08:45:46 -0000
X-Groupsio-MsgNum: 96855
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yNb1oOkm5a9FJOVX"
Content-Disposition: inline

--yNb1oOkm5a9FJOVX
Content-Type: text/plain; charset=iso-8859-1
Content-Description: message
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 02, 2017 at 04:36:22PM +0300, Ed Bartosh wrote:
> On Fri, Apr 21, 2017 at 02:11:45PM +0200, Andreas J. Reichel wrote:
> > To increase code maintainability, use dictionaries
> > as enum-like container for parameter string comparisons.
> >=20
> > Signed-off-by: Andreas Reichel <andreas.reichel.ext@siemens.com>
> > Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> > Signed-off-by: Daniel Wagner <daniel.wagner@siemens.com>
> >=20
> > ---
> >  scripts/lib/wic/engine.py | 16 +++++++++++++---
> >  1 file changed, 13 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
> > index 647358287f..1428a73ba8 100644
> > --- a/scripts/lib/wic/engine.py
> > +++ b/scripts/lib/wic/engine.py
> > @@ -35,6 +35,16 @@ from wic import WicError
> >  from wic.pluginbase import PluginMgr
> >  from wic.utils.misc import get_bitbake_var
> > =20
> > +class StrEnum(dict):
> > +    __getattr__ =3D dict.get
> > +
> > +ListType =3D StrEnum({
> > +    'LIST_IMAGES': "images",
> > +    'LIST_SRC_PLUGINS': "source-plugins" })
> > +
> > +HelpArg =3D StrEnum({
> > +    'HELP': "help" })
> > +
> >  logger =3D logging.getLogger('wic')
> > =20
> >  def verify_build_env():
> > @@ -204,14 +214,14 @@ def wic_list(args, scripts_path):
> >      if args.list_type is None:
> >          return False
> > =20
> > -    if args.list_type =3D=3D "images":
> > +    if args.list_type =3D=3D ListType.LIST_IMAGES:
> > =20
> >          list_canned_images(scripts_path)
> >          return True
> > -    elif args.list_type =3D=3D "source-plugins":
> > +    elif args.list_type =3D=3D ListType.LIST_SRC_PLUGINS:
> >          list_source_plugins()
> >          return True
> > -    elif len(args.help_for) =3D=3D 1 and args.help_for[0] =3D=3D 'help=
':
> > +    elif len(args.help_for) =3D=3D 1 and args.help_for[0] =3D=3D HelpA=
rg.HELP:
> >          wks_file =3D args.list_type
> >          fullpath =3D find_canned_image(scripts_path, wks_file)
> >          if not fullpath:
>=20
> I'm not sure if this increases maintainability, but it definitely increas=
es code complexity and
> decreases readability. Can you explain the idea in a bit more detailed wa=
y?
>=20
In general, if string constants are used as keys, it is better do define th=
em as
constants. Maintainability increases because if you have to change them,
you only change them in one place. You have a central place for this
definition and not scattered them all over the code. That's the idea.

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

--yNb1oOkm5a9FJOVX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEESCAi86kD+H79vFKkuq/cYNuJpbQFAlkJmTEACgkQuq/cYNuJ
pbTLHg/+OmvfWDm+WDuZCM74jULoe3Z8oSEePNgjxx6IXvippFFjwuaMOptW3Om5
Dg+nqlJ6dQcVXN4B2ipFdWYOvF0iDBwCDZ1T9UuheKDVtH3kzAidQaVQEb9mYELp
H/fqVk9raAdemslnuBOmJMC+hZxw896YHbtw6cN3VUxPAG12qjc8qLui6dqqKGv7
17PMLJPnSFBapesvj/OF+kRpbb2ozzEFjP8UaSE2OOtqNeGen9lhlDS45mvQOqrO
AbSTsOhDa40okR/ypgCqcS+IbpFKZh4ucGAtX0FUHX9TAIGP6KIdtkYdTS1tmMui
EPEg9tuBcl6W/5/B/m1ClkYrEA/58F54/mAFbJf800+tVca+5OzRRTIpibrxlL80
RBYmJYdIlKMp3j96BYSrhg55OwJ1kbD5GlPIW/haGo1tkpHxA+3gjzw7sJBWOOMi
fVVYyn11uzNn+GzxMJw3FRB8w0cencagLD/jKjkqgZGauodP4cda5kUIHu+aDOQM
vpXf/3CQ/TZpthDThxps6xOiXlSfQU4nTvtEHsLdNRNwzaaw66hWgT93yW0Rnuym
hVfqCl9jgXiRokXSHhhpnFspzX+VEb33bRG+aCoaZNzAoTaJ8VAWYfK+NxVL5Ysq
NVx+IBa/33GuWwYEwb4mL1EYzWo+a7iqB0fsuJ0cusjtDsDlThY=
=qaIK
-----END PGP SIGNATURE-----

--yNb1oOkm5a9FJOVX--
