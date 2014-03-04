Return-Path: <nitin.a.kamble@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 66F9B6EF8D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 18:37:52 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 04 Mar 2014 10:37:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,586,1389772800"; d="scan'208";a="492293898"
Received: from orsmsx102.amr.corp.intel.com ([10.22.225.129])
	by fmsmga002.fm.intel.com with ESMTP; 04 Mar 2014 10:37:53 -0800
Received: from orsmsx103.amr.corp.intel.com ([169.254.2.166]) by
	ORSMSX102.amr.corp.intel.com ([169.254.1.197]) with mapi id
	14.03.0123.003; Tue, 4 Mar 2014 10:37:53 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: "Palcu, Laurentiu" <laurentiu.palcu@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/2] Revert "lib/oe/package_manager.py:
	RpmPM: fix	issue with multilib builds"
Thread-Index: AQHPNsVXn54yH4Io4E2N9GpUKr2kBZrRQ/YA
Date: Tue, 4 Mar 2014 18:37:53 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C7CDB013B@ORSMSX103.amr.corp.intel.com>
References: <cover.1393839480.git.laurentiu.palcu@intel.com>
	<0d516ff4d652cf74a5a43106f46321ff52c97900.1393839480.git.laurentiu.palcu@intel.com>
In-Reply-To: <0d516ff4d652cf74a5a43106f46321ff52c97900.1393839480.git.laurentiu.palcu@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] Revert "lib/oe/package_manager.py: RpmPM: fix	issue with multilib builds"
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
X-List-Received-Date: Tue, 04 Mar 2014 18:37:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Laurentiu Palcu
> Sent: Monday, March 03, 2014 1:44 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/2] Revert "lib/oe/package_manager.py:
> RpmPM: fix issue with multilib builds"
>=20
> Converting a list to a set does not keep the order of the items, as they =
were
> added, which might result in the wrong packages being installed in the fi=
nal
> image...
>=20
> This reverts commit 12f47c23df8c109676f66d580d666a3147f3b046.
>=20
> [YOCTO #5890]
>=20
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
Acked-By: Nitin A Kamble <nitin.a.kamble@intel.com>

This resolves the packaging issues I was seeing.
Thanks,
Nitin


> ---
>  meta/lib/oe/package_manager.py |   13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/lib/oe/package_manager.py
> b/meta/lib/oe/package_manager.py index ff4f1de..6c133c3 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -368,18 +368,19 @@ class RpmPM(PackageManager):
>                                  self.ml_os_list['default'])
>=20
>          # List must be prefered to least preferred order
> -        default_platform_extra =3D set()
> -        platform_extra =3D set()
> +        default_platform_extra =3D list()
> +        platform_extra =3D list()
>          bbextendvariant =3D self.d.getVar('BBEXTENDVARIANT', True) or ""
>          for mlib in self.ml_os_list:
>              for arch in self.ml_prefix_list[mlib]:
>                  plt =3D arch.replace('-', '_') + '-.*-' + self.ml_os_lis=
t[mlib]
>                  if mlib =3D=3D bbextendvariant:
> -                        default_platform_extra.add(plt)
> +                    if plt not in default_platform_extra:
> +                        default_platform_extra.append(plt)
>                  else:
> -                        platform_extra.add(plt)
> -
> -        platform_extra =3D platform_extra.union(default_platform_extra)
> +                    if plt not in platform_extra:
> +                        platform_extra.append(plt)
> +        platform_extra =3D default_platform_extra + platform_extra
>=20
>          self._create_configs(platform, platform_extra)
>=20
> --
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

