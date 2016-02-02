Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 9D35B771C6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 22:07:05 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 02 Feb 2016 14:07:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,386,1449561600"; d="scan'208";a="875530870"
Received: from kng2-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.178.194])
	by orsmga001.jf.intel.com with ESMTP; 02 Feb 2016 14:07:01 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Wed, 03 Feb 2016 11:06:59 +1300
Message-ID: <1685931.lfZTPyxPBX@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.3.3-303.fc23.x86_64; KDE/4.14.16; x86_64; ;
	)
In-Reply-To: <56B12812.70900@linux.intel.com>
References: <cover.1454424743.git.anibal.limon@linux.intel.com>
	<4491582.7184pyYJcq@peggleto-mobl.ger.corp.intel.com>
	<56B12812.70900@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, benjamin.esquivel@intel.com,
	=?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <limon.anibal@gmail.com>
Subject: Re: [PATCH 18/20] classes/populate_sdk_ext: Add SDK_EXT_TARGET_MANIFEST and SDK_EXT_HOST_MANIFEST
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
X-List-Received-Date: Tue, 02 Feb 2016 22:07:05 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Tue, 02 Feb 2016 16:05:06 An=EDbal Lim=F3n wrote:
> On 02/02/2016 03:52 PM, Paul Eggleton wrote:
> > On Tue, 02 Feb 2016 09:14:21 An=EDbal Lim=F3n wrote:
> >> From: An=EDbal Lim=F3n <limon.anibal@gmail.com>
> >>=20
> >> Extensible SDK needs to point to the correct manifest so add
> >> SDK_EXT_TARGET_MANIFEST and SDK_EXT_HOST_MANIFEST variables.
> >>=20
> >> oeqa/oetest.py: Fix SDKExtTestContext for load the correct manifes=
ts.
> >>=20
> >> Signed-off-by: An=EDbal Lim=F3n <limon.anibal@gmail.com>
> >> ---
> >>=20
> >>  meta/classes/populate_sdk_ext.bbclass |  3 +++
> >>  meta/lib/oeqa/oetest.py               | 11 +++++++++--
> >>  2 files changed, 12 insertions(+), 2 deletions(-)
> >>=20
> >> diff --git a/meta/classes/populate_sdk_ext.bbclass
> >> b/meta/classes/populate_sdk_ext.bbclass index fc96a4b..27dc030 100=
644
> >> --- a/meta/classes/populate_sdk_ext.bbclass
> >> +++ b/meta/classes/populate_sdk_ext.bbclass
> >> @@ -43,6 +43,9 @@ B_task-populate-sdk-ext =3D "${SDK_DIR}"
> >>=20
> >>  TOOLCHAINEXT_OUTPUTNAME =3D "${SDK_NAME}-toolchain-ext-${SDK_VERS=
ION}"
> >>  TOOLCHAIN_OUTPUTNAME_task-populate-sdk-ext =3D
> >>  "${TOOLCHAINEXT_OUTPUTNAME}"
> >>=20
> >> +SDK_EXT_TARGET_MANIFEST =3D
> >> "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.target.manifest"
> >> +SDK_EXT_HOST_MANIFEST =3D
> >> "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.host.manifest" +
> >>=20
> >>  SDK_TITLE_task-populate-sdk-ext =3D "${@d.getVar('DISTRO_NAME', T=
rue) or
> >>=20
> >> d.getVar('DISTRO', True)} Extensible SDK"
> >>=20
> >>  python copy_buildsystem () {
> >>=20
> >> diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
> >> index 6beb6c5..c951989 100644
> >> --- a/meta/lib/oeqa/oetest.py
> >> +++ b/meta/lib/oeqa/oetest.py
> >>=20
> >> @@ -382,14 +382,18 @@ class SDKTestContext(TestContext):
> >>          self.sdktestdir =3D sdktestdir
> >>          self.sdkenv =3D sdkenv
> >>=20
> >> +        if not hasattr(self, 'target_manifest_name'):
> >> +            self.target_manifest_name =3D "SDK_TARGET_MANIFEST"
> >>=20
> >>          try:
> >> -            with open(d.getVar("SDK_TARGET_MANIFEST", True)) as f=
:
> >>=20
> >> +            with open(d.getVar(self.target_manifest_name, True)) =
as f:
> >>                   self.pkgmanifest =3D f.read()
> >>         =20
> >>          except IOError as e:
> >>              bb.fatal("No package manifest file found. Did you bui=
ld the
> >>              sdk
> >>=20
> >> image?\n%s" % e)
> >>=20
> >> +        if not hasattr(self, 'host_manifest_name'):
> >> +            self.host_manifest_name =3D "SDK_HOST_MANIFEST"
> >>=20
> >>          try:
> >> -            with open(d.getVar("SDK_HOST_MANIFEST", True)) as f:
> >>=20
> >> +            with open(d.getVar(self.host_manifest_name, True)) as=
 f:
> >>                  self.hostpkgmanifest =3D f.read()
> >>         =20
> >>          except IOError as e:
> >>              bb.fatal("No host package manifest file found. Did yo=
u build
> >>=20
> >> the sdk image?\n%s" % e) @@ -406,6 +410,9 @@ class
> >>=20
> >> SDKTestContext(TestContext):
> >>  class SDKExtTestContext(SDKTestContext):
> >>      def __init__(self, d, sdktestdir, sdkenv):
> >> +        self.target_manifest_name =3D "SDK_EXT_TARGET_MANIFEST"
> >> +        self.host_manifest_name =3D "SDK_EXT_HOST_MANIFEST"
> >> +
> >>=20
> >>          super(SDKExtTestContext, self).__init__(d, sdktestdir, sd=
kenv)
> >>         =20
> >>          self.sdkextfilesdir =3D
> >>          os.path.join(os.path.dirname(os.path.abspath(
> >=20
> > I really don't like the idea of passing the variable name here rath=
er than
> > values. However, besides that, the manifest is always the SDK name =
plus
> > .host.manifest or .target.manifest - do we even need to pass separa=
te
> > names? All you should need is the name of the SDK i.e. the value of=

> > TOOLCHAINEXT_OUTPUTNAME.
>=20
> I prefer to have explicit value and construct them into one place
> instead of have many name constructions like you said to use
> TOOLCHAINEXT_OUTPUTNAME and suppose that always be end with .{host,
> target}.manifest.

When you add a variable to populate_sdk_ext.bbclass, it isn't just defi=
ned for=20
the ext SDK - it's defined for every image recipe. I want to try to avo=
id=20
defining additional variables and thus expanding the environment where =
we don't=20
really need to.

The naming of the manifest is something we can rely on, because externa=
l tools=20
need to be able to.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

