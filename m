Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 2C9BE6C72D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 10:04:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 17 Jan 2014 02:04:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,670,1384329600"; d="scan'208";a="460423057"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jan 2014 02:04:12 -0800
Received: from irsmsx105.ger.corp.intel.com (163.33.3.28) by
	IRSMSX101.ger.corp.intel.com (163.33.3.153) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Fri, 17 Jan 2014 10:04:11 +0000
Received: from irsmsx103.ger.corp.intel.com ([169.254.3.66]) by
	IRSMSX105.ger.corp.intel.com ([169.254.7.215]) with mapi id
	14.03.0123.003; Fri, 17 Jan 2014 10:04:11 +0000
From: "Stoicescu, CorneliuX" <corneliux.stoicescu@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] oe-selftest: Patch sstate tests to work with new
	sstate-cache naming and content
Thread-Index: AQHPE2rMjpmfexiwOUKO3VpJ0jItTZqIsAHw
Date: Fri, 17 Jan 2014 10:04:10 +0000
Message-ID: <33115ABC4887814E8A92A08FBC93416B0A1C793A@IRSMSX103.ger.corp.intel.com>
References: <1389957083-19676-1-git-send-email-corneliux.stoicescu@intel.com>
In-Reply-To: <1389957083-19676-1-git-send-email-corneliux.stoicescu@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Subject: Re: [PATCH] oe-selftest: Patch sstate tests to work with new sstate-cache naming and content
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
X-List-Received-Date: Fri, 17 Jan 2014 10:04:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I forgot a few comment lines. I will resend the patch.

> -----Original Message-----
> From: Stoicescu, CorneliuX
> Sent: Friday, January 17, 2014 1:11 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Stoicescu, CorneliuX
> Subject: [PATCH] oe-selftest: Patch sstate tests to work with new sstate-
> cache naming and content
>=20
> Made modifications to account for:
> - .siginfo files present in sstate-cache from non sstate-enabled tasks
> - new naming format for sstate files
>=20
> Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
> ---
>  meta/lib/oeqa/selftest/sstatetests.py |   35 +++++++++++++++++++++------=
--
> ----
>  1 file changed, 22 insertions(+), 13 deletions(-)
>=20
> diff --git a/meta/lib/oeqa/selftest/sstatetests.py
> b/meta/lib/oeqa/selftest/sstatetests.py
> index 4b2c26d..4eed21e 100644
> --- a/meta/lib/oeqa/selftest/sstatetests.py
> +++ b/meta/lib/oeqa/selftest/sstatetests.py
> @@ -48,12 +48,22 @@ class SStateTests(SStateBase):
>          bitbake(['-ccleansstate'] + targets)
>=20
>          bitbake(targets)
> -        file_tracker_1 =3D self.search_sstate('|'.join(map(str, targets)=
),
> distro_specific, distro_nonspecific)
> -        self.assertTrue(file_tracker_1, msg=3D"Could not find sstate fil=
es for: %s"
> % ', '.join(map(str, targets)))
> +        tgz_created =3D self.search_sstate('|'.join(map(str, [s + '.*?\.=
tgz$' for s in
> targets])), distro_specific, distro_nonspecific)
> +        self.assertTrue(tgz_created, msg=3D"Could not find sstate .tgz
> + files for: %s" % ', '.join(map(str, targets)))
> +
> +        siginfo_created =3D self.search_sstate('|'.join(map(str, [s + '.=
*?\.siginfo$'
> for s in targets])), distro_specific, distro_nonspecific)
> +        self.assertTrue(siginfo_created, msg=3D"Could not find sstate
> + .siginfo files for: %s" % ', '.join(map(str, targets)))
>=20
>          bitbake(['-ccleansstate'] + targets)
> -        file_tracker_2 =3D self.search_sstate('|'.join(map(str, targets)=
),
> distro_specific, distro_nonspecific)
> -        self.assertTrue(not file_tracker_2)
> +        tgz_removed =3D self.search_sstate('|'.join(map(str, [s + '.*?\.=
tgz$' for s
> in targets])), distro_specific, distro_nonspecific)
> +        self.assertTrue(not tgz_removed, msg=3D"do_cleansstate didn't
> + remove .tgz sstate files for: %s" % ', '.join(map(str, targets)))
> +
> +#        siginfo_remaining =3D self.search_sstate('|'.join(map(str, [s +
> '.*?\.siginfo$' for s in targets])), distro_specific, distro_nonspecific)
> +#        siginfo_created_not_remaining =3D [s for s in siginfo_created i=
f s not in
> siginfo_remaining]
> +#        self.assertTrue(not siginfo_created_not_remaining ,
> msg=3D"do_cleansstate removed some sstate .siginfo files for %s: %s" % ('=
,
> '.join(map(str, targets)), ', '.join(map(str, siginfo_created_not_remaini=
ng))))
> +
> +#        file_tracker_2 =3D self.search_sstate('|'.join(map(str, targets=
])),
> distro_specific, distro_nonspecific)
> +#        self.assertTrue(not file_tracker_2)
>=20
>      def test_cleansstate_task_distro_specific_nonspecific(self):
>          self.run_test_cleansstate_task(['binutils-cross', 'binutils-nati=
ve', 'eglibc-
> initial'], distro_specific=3DTrue, distro_nonspecific=3DTrue,
> temp_sstate_location=3DTrue) @@ -72,9 +82,9 @@ class
> SStateTests(SStateBase):
>          bitbake(['-ccleansstate'] + targets)
>=20
>          bitbake(targets)
> -        self.assertTrue(self.search_sstate('|'.join(map(str, targets)),
> distro_specific=3DFalse, distro_nonspecific=3DTrue) =3D=3D [], msg=3D"Fou=
nd distro
> non-specific sstate for: %s" % ', '.join(map(str, targets)))
> -        file_tracker_1 =3D self.search_sstate('|'.join(map(str, targets)=
),
> distro_specific=3DTrue, distro_nonspecific=3DFalse)
> -        self.assertTrue(len(file_tracker_1) > len(targets), msg =3D "Not=
 all sstate
> files ware created for: %s" % ', '.join(map(str, targets)))
> +        self.assertTrue(self.search_sstate('|'.join(map(str, [s + '.*?\.=
tgz$' for s
> in targets])), distro_specific=3DFalse, distro_nonspecific=3DTrue) =3D=3D=
 [],
> msg=3D"Found distro non-specific sstate for: %s" % ', '.join(map(str, tar=
gets)))
> +        file_tracker_1 =3D self.search_sstate('|'.join(map(str, [s + '.*=
?\.tgz$' for s
> in targets])), distro_specific=3DTrue, distro_nonspecific=3DFalse)
> +        self.assertTrue(len(file_tracker_1) >=3D len(targets), msg =3D "=
Not
> + all sstate files ware created for: %s" % ', '.join(map(str, targets)))
>=20
>          self.track_for_cleanup(self.distro_specific_sstate + "_old")
>          shutil.copytree(self.distro_specific_sstate, self.distro_specifi=
c_sstate +
> "_old") @@ -82,8 +92,8 @@ class SStateTests(SStateBase):
>=20
>          bitbake(['-cclean'] + targets)
>          bitbake(targets)
> -        file_tracker_2 =3D self.search_sstate('|'.join(map(str, targets)=
),
> distro_specific=3DTrue, distro_nonspecific=3DFalse)
> -        self.assertTrue(len(file_tracker_2) > len(targets), msg =3D "Not=
 all sstate
> files ware created for: %s" % ', '.join(map(str, targets)))
> +        file_tracker_2 =3D self.search_sstate('|'.join(map(str, [s + '.*=
?\.tgz$' for s
> in targets])), distro_specific=3DTrue, distro_nonspecific=3DFalse)
> +        self.assertTrue(len(file_tracker_2) >=3D len(targets), msg =3D "=
Not
> + all sstate files ware created for: %s" % ', '.join(map(str, targets)))
>=20
>          not_recreated =3D [x for x in file_tracker_1 if x not in file_tr=
acker_2]
>          self.assertTrue(not_recreated =3D=3D [], msg=3D"The following ss=
tate files
> ware not recreated: %s" % ', '.join(map(str, not_recreated))) @@ -121,18
> +131,18 @@ class SStateTests(SStateBase):
>              self.append_config(global_config[idx])
>              self.append_recipeinc(target, target_config[idx])
>              if target_config[idx] =3D=3D target_config[-1]:
> -                target_sstate_before_build =3D self.search_sstate(target=
)
> +                target_sstate_before_build =3D self.search_sstate(target
> + + '.*?\.tgz$')
>              bitbake("-cclean %s" % target)
>              result =3D bitbake(target, ignore_status=3DTrue)
>              if target_config[idx] =3D=3D target_config[-1]:
> -                target_sstate_after_build =3D self.search_sstate(target)
> +                target_sstate_after_build =3D self.search_sstate(target =
+
> + '.*?\.tgz$')
>                  expected_remaining_sstate +=3D [x for x in target_sstate=
_after_build
> if x not in target_sstate_before_build]
>              self.remove_config(global_config[idx])
>              self.remove_recipeinc(target, target_config[idx])
>              self.assertEqual(result.status, 0)
>=20
>          runCmd("sstate-cache-management.sh -y --cache-dir=3D%s --remove-
> duplicated" % self.sstate_path)
> -        actual_remaining_sstate =3D self.search_sstate(target)
> +        actual_remaining_sstate =3D self.search_sstate(target +
> + '.*?\.tgz$')
>=20
>          actual_not_expected =3D [x for x in actual_remaining_sstate if x=
 not in
> expected_remaining_sstate]
>          self.assertFalse(actual_not_expected, msg=3D"Files should have b=
een
> removed but ware not: %s" % ', '.join(map(str, actual_not_expected))) @@ =
-
> 183,4 +193,3 @@ class SStateTests(SStateBase):
>=20
>=20
>=20
> -
> --
> 1.7.9.5


