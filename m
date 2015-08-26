Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1354076DB0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 16:48:21 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 26 Aug 2015 09:47:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,417,1437462000"; d="scan'208";a="791423278"
Received: from pbyrne-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.9.60])
	by fmsmga002.fm.intel.com with ESMTP; 26 Aug 2015 09:47:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Date: Wed, 26 Aug 2015 17:47:50 +0100
Message-ID: <3218476.qDKd8vBb19@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.5-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <55DDE971.3040803@linux.intel.com>
References: <cover.1440574631.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<55DDE63D.4020204@linux.intel.com>
	<55DDE971.3040803@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/2] oeqa/selftest: new tests for devtool upgrage feature
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
X-List-Received-Date: Wed, 26 Aug 2015 16:48:26 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Wednesday 26 August 2015 11:29:37 Leonardo Sandoval wrote:
> On 08/26/2015 11:15 AM, An=EDbal Lim=F3n wrote:
> > Comments below.
> >=20
> > On 26/08/15 02:43, leonardo.sandoval.gonzalez@linux.intel.com wrote=
:
> >> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.co=
m>
> >>=20
> >> Basic tests for the devtool's upgrade feature, including:
> >>        * Parameter check
> >>        * Upgrading a real recipe (e2fsprogrs) without patching and=

> >>       =20
> >>            checing its output
> >>       =20
> >>        * Devtool status after upgrade
> >>=20
> >> Signed-off-by: Leonardo Sandoval
> >> <leonardo.sandoval.gonzalez@linux.intel.com>
> >> ---
> >>=20
> >>   meta/lib/oeqa/selftest/devtool.py | 36
> >>=20
> >> ++++++++++++++++++++++++++++++++++++
> >>=20
> >>   1 file changed, 36 insertions(+)
> >>=20
> >> diff --git a/meta/lib/oeqa/selftest/devtool.py
> >> b/meta/lib/oeqa/selftest/devtool.py
> >> index b59db15..f72e010 100644
> >> --- a/meta/lib/oeqa/selftest/devtool.py
> >> +++ b/meta/lib/oeqa/selftest/devtool.py
> >>=20
> >> @@ -857,3 +857,39 @@ class DevtoolTests(DevtoolBase):
> >>               result =3D runCmd('devtool undeploy-target -c %s roo=
t@%s'
> >>=20
> >> % (testrecipe, qemu.ip))
> >>=20
> >>               result =3D runCmd('ssh %s root@%s %s' % (sshargs, qe=
mu.ip,
> >>=20
> >> testcommand), ignore_status=3DTrue)
> >>=20
> >>               self.assertNotEqual(result, 0, 'undeploy-target did =
not
> >>=20
> >> remove command as it should have')
> >> +
> >> +    def test_devtool_upgrade(self):
> >> +        # Check preconditions
> >> +        workspacedir =3D os.path.join(self.builddir, 'workspace')=

> >> +        self.assertTrue(not os.path.exists(workspacedir), 'This t=
est
> >> cannot be run with a workspace directory under the build directory=
')
> >> +        # Check parameters
> >> +        result =3D runCmd('devtool upgrade -h')
> >> +        for param in 'recipename srctree --version -V --branch -b=

> >> --keep-temp --no-patch'.split():
> >> +            self.assertIn(param, result.output)
> >> +        # For the moment, we are using a real recipe.
> >> +        recipe=3D'e2fsprogs'
> >> +        version=3D'1.42.13'
> >=20
> > Isn't a guarantee that this version will be newer ever (i.e. if som=
eone
> > upgrade e2fsprogs to 1.42.13) what happen in this case?
>=20
> Good question. In fact, the code will fail just in case current and
> upgrade version are the same. The tool can also do downgrades, so at =
the
> end it does not matter what the version is. I will correct this point=

> and send a v3.
>=20
> As mentioned by Paul in a previous message, we need 'upgradable' reci=
pes
> which whenever the test is done, it can be upgrade. The only point he=
re
> is that we need a tarball somewhere, so the URL is always live. Not s=
ure
> if poky repository is a good place for the latter, any suggestion?

This is what we have meta-selftest for. We can put a recipe (or multipl=
e=20
recipes) in there that's named specially so as not to overlap with one =
in OE-
Core and is a known old version.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

