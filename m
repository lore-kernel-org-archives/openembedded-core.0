Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id AFD1E605F3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 11:26:12 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id h10so6692798eaj.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 04:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SKoh5aPgGbVsBb/rZ7aSoYt7GMbjpwOEohLX/GTHEes=;
	b=PuW32+vpLnPQRXEjMwOkpRSsbhOuC9qslVC0okNcODhOjHrRf03cOkAnytNpKd4nR3
	g+/8nHGO0uthjqr1bnJbnH/JDI2dr6wmuGd8KWmknI+nuznYW9SYGUF276pWB91QwATJ
	vL3/1d/9ObpzmR7A9UdR076b+CNMjN3K9bGE1L1oCnOehi8vROVOqWWge3iLisqnLQ8T
	9XClQduu8+lOSeh4YyInwW/bHcz1WLwiCcKO0tHZC/CJEyv3cBM6fS7p+qksyWFGITFa
	sBpeg9KZ+C+Kow+7yI2R0+69PfyFCXkqXlP+0d8P333LzXp5Ww9kQjeUK9IAKQ5w5LRP
	3XUA==
X-Received: by 10.15.32.194 with SMTP id a42mr14878927eev.43.1372159170905;
	Tue, 25 Jun 2013 04:19:30 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b3sm35201634eev.10.2013.06.25.04.19.29 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 25 Jun 2013 04:19:30 -0700 (PDT)
Date: Tue, 25 Jun 2013 13:20:06 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20130625112006.GO14021@jama>
References: <1372085149-30510-1-git-send-email-mark.hatle@windriver.com>
	<1372085149-30510-2-git-send-email-mark.hatle@windriver.com>
	<51C8C398.1070908@linux.intel.com> <51C8FB13.6020703@windriver.com>
MIME-Version: 1.0
In-Reply-To: <51C8FB13.6020703@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] sanity.bbclass: Check for the known broken version of make
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
X-List-Received-Date: Tue, 25 Jun 2013 11:26:13 -0000
X-Groupsio-MsgNum: 40956
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R+Rs1qz93vBJxC1z"
Content-Disposition: inline

--R+Rs1qz93vBJxC1z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2013 at 09:06:11PM -0500, Mark Hatle wrote:
> On 6/24/13 5:09 PM, Saul Wold wrote:
> > On 06/24/2013 07:45 AM, Mark Hatle wrote:
> >> See GNU Savannah bug 30612 -- make 3.82 is known to be broken.
> >>
> >> A number of vendors are providing a modified version, so checking
> >> for just the version string is not enough.  We also need to check
> >> if the patch for the issue has been applied.  We use a modified
> >> version of the reproduced to check for the issue.
> >>
> >> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> >> ---
> >>    meta/classes/sanity.bbclass | 39 ++++++++++++++++++++++++++++++++++=
+++++
> >>    1 file changed, 39 insertions(+)
> >>
> >
> > Seems this needs a rebase since RP also changed sanity.bbclass recently.
>=20
> This is from Friday morning.  I'll start a rebase and send new code when =
I have=20
> it ready.

There is another issues with unpatched make-3.82, webkit and newer
nodejs are failing for some people.
https://savannah.gnu.org/bugs/?36451

What about for cycle which generates some very long "ls" or something
like that?

On other hand so long commands arn't so common, so many people
could be using "broken" make without seeing issues with their images.

>=20
> --Mark
>=20
> > Sau!
> >
> >> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> >> index 7f95f31..dc251a1 100644
> >> --- a/meta/classes/sanity.bbclass
> >> +++ b/meta/classes/sanity.bbclass
> >> @@ -336,6 +336,41 @@ def check_gcc_march(sanity_data):
> >>
> >>        return result
> >>
> >> +# Unpatched versions of make 3.82 are known to be broken.  See GNU Sa=
vannah Bug 30612.
> >> +# Use a modified reproducer from http://savannah.gnu.org/bugs/?30612 =
to validate.
> >> +def check_make_version(sanity_data, loosever):
> >> +    status, result =3D oe.utils.getstatusoutput("make --version")
> >> +    if status !=3D 0:
> >> +        return "Unable to execute make --version, exit code %s\n" % s=
tatus
> >> +    version =3D result.split()[2]
> >> +    if loosever(version) =3D=3D loosever("3.82"):
> >> +        # Construct a test file
> >> +        f =3D open("makefile_test", "w")
> >> +        f.write("makefile_test.a: makefile_test_a.c makefile_test_b.c=
 makefile_test.a( makefile_test_a.c makefile_test_b.c)\n")
> >> +        f.write("\n")
> >> +        f.write("makefile_test_a.c:\n")
> >> +        f.write("	touch $@\n")
> >> +        f.write("\n")
> >> +        f.write("makefile_test_b.c:\n")
> >> +        f.write("	touch $@\n")
> >> +        f.close()
> >> +
> >> +        # Check if make 3.82 has been patched
> >> +        status,result =3D oe.utils.getstatusoutput("make -f makefile_=
test")
> >> +
> >> +        os.remove("makefile_test")
> >> +        if os.path.exists("makefile_test_a.c"):
> >> +            os.remove("makefile_test_a.c")
> >> +        if os.path.exists("makefile_test_b.c"):
> >> +            os.remove("makefile_test_b.c")
> >> +        if os.path.exists("makefile_test.a"):
> >> +            os.remove("makefile_test.a")
> >> +
> >> +        if status !=3D 0:
> >> +            return "Your version of make 3.82 is broken. Please rever=
t to 3.81 or install a patched version.\n"
> >> +    return None
> >> +
> >> +
> >>    # Tar version 1.24 and onwards handle overwriting symlinks correctly
> >>    # but earlier versions do not; this needs to work properly for ssta=
te
> >>    def check_tar_version(sanity_data, loosever):
> >> @@ -407,6 +442,10 @@ def check_sanity(sanity_data):
> >>            messages =3D messages + 'Please set a MACHINE in your local=
=2Econf or environment\n'
> >>            machinevalid =3D False
> >>
> >> +    makemsg =3D check_make_version(sanity_data, LooseVersion)
> >> +    if makemsg:
> >> +        messages =3D messages + makemsg
> >> +
> >>        tarmsg =3D check_tar_version(sanity_data, LooseVersion)
> >>        if tarmsg:
> >>            messages =3D messages + tarmsg
> >>
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--R+Rs1qz93vBJxC1z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHJfOYACgkQN1Ujt2V2gByUBwCfRCDMKikGocNvurFn3jvkotqQ
UF4AnjOfHSBIgww3vDobxDpEKCSJRjSH
=ZceC
-----END PGP SIGNATURE-----

--R+Rs1qz93vBJxC1z--
