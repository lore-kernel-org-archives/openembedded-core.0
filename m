Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 06C7160746
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 18:35:30 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 04 Feb 2016 10:35:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,396,1449561600"; d="scan'208";a="647277357"
Received: from rravin1x-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.111])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Feb 2016 10:35:28 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Fri, 05 Feb 2016 07:35:27 +1300
Message-ID: <2637486.2zAlMEmPQJ@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.3.4-300.fc23.x86_64; KDE/4.14.16; x86_64; ;
	)
In-Reply-To: <f4fae173e814851f4a14b4c1e47f5de5c497a7b7.1454459362.git.anibal.limon@linux.intel.com>
References: <cover.1454459362.git.anibal.limon@linux.intel.com>
	<f4fae173e814851f4a14b4c1e47f5de5c497a7b7.1454459362.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: benjamin.esquivel@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 25/28] oeqa/oetest.py: SDK{Ext, } improve host and target manifest load.
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
X-List-Received-Date: Thu, 04 Feb 2016 18:35:31 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Tue, 02 Feb 2016 18:30:37 An=EDbal Lim=F3n wrote:
> Don't pass variable name instead of it expands the host and target
> manifest at init of the classes.
>=20
> Signed-off-by: An=EDbal Lim=F3n <anibal.limon@linux.intel.com>
> ---
>  meta/lib/oeqa/oetest.py | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
> index 6a95c28..80b40b6 100644
> --- a/meta/lib/oeqa/oetest.py
> +++ b/meta/lib/oeqa/oetest.py
> @@ -382,18 +382,18 @@ class SDKTestContext(TestContext):
>          self.sdktestdir =3D sdktestdir
>          self.sdkenv =3D sdkenv
>=20
> -        if not hasattr(self, 'target_manifest_name'):
> -            self.target_manifest_name =3D "SDK_TARGET_MANIFEST"
> +        if not hasattr(self, 'target_manifest'):
> +            self.target_manifest =3D d.getVar("SDK_TARGET_MANIFEST",=
 True)
>          try:
> -            with open(d.getVar(self.target_manifest_name, True)) as =
f:
> +            with open(self.target_manifest) as f:
>                   self.pkgmanifest =3D f.read()
>          except IOError as e:
>              bb.fatal("No package manifest file found. Did you build =
the sdk
> image?\n%s" % e)
>=20
> -        if not hasattr(self, 'host_manifest_name'):
> -            self.host_manifest_name =3D "SDK_HOST_MANIFEST"
> +        if not hasattr(self, 'host_manifest'):
> +            self.host_manifest =3D d.getVar("SDK_HOST_MANIFEST", Tru=
e)
>          try:
> -            with open(d.getVar(self.host_manifest_name, True)) as f:=

> +            with open(self.host_manifest) as f:
>                  self.hostpkgmanifest =3D f.read()
>          except IOError as e:
>              bb.fatal("No host package manifest file found. Did you b=
uild
> the sdk image?\n%s" % e) @@ -410,8 +410,8 @@ class
> SDKTestContext(TestContext):
>=20
>  class SDKExtTestContext(SDKTestContext):
>      def __init__(self, d, sdktestdir, sdkenv):
> -        self.target_manifest_name =3D "SDK_EXT_TARGET_MANIFEST"
> -        self.host_manifest_name =3D "SDK_EXT_HOST_MANIFEST"
> +        self.target_manifest =3D d.getVar("SDK_EXT_TARGET_MANIFEST",=
 True)
> +        self.host_manifest =3D d.getVar("SDK_EXT_HOST_MANIFEST", Tru=
e)
>=20
>          super(SDKExtTestContext, self).__init__(d, sdktestdir, sdken=
v)

Please squash this into the earlier commit where the original logic was=
 added.

Thanks,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

