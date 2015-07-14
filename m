Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3FCC065C78
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 12:27:16 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 14 Jul 2015 05:27:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,471,1432623600"; d="scan'208";a="746861427"
Received: from irsmsx153.ger.corp.intel.com ([163.33.192.75])
	by fmsmga001.fm.intel.com with ESMTP; 14 Jul 2015 05:27:17 -0700
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.117]) by
	IRSMSX153.ger.corp.intel.com ([169.254.9.140]) with mapi id
	14.03.0224.002; Tue, 14 Jul 2015 13:27:12 +0100
From: "Istrate, Daniel AlexandruX" <daniel.alexandrux.istrate@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] oeqa/selftest: [YOCTO #7976] Updated
	imagefeature testcases.
Thread-Index: AQHQvhHKPLnyARwwm0yJywn+Ga5pYJ3aomKAgAA6ngA=
Date: Tue, 14 Jul 2015 12:27:11 +0000
Message-ID: <174AD7CFE5F468498ACCFE3FEE0EF1EBE66974@IRSMSX102.ger.corp.intel.com>
References: <1436863689-29230-1-git-send-email-daniel.alexandrux.istrate@intel.com>
	<6014412.IjVSLHLSvX@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <6014412.IjVSLHLSvX@peggleto-mobl.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/selftest: [YOCTO #7976] Updated imagefeature testcases.
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
X-List-Received-Date: Tue, 14 Jul 2015 12:27:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Thank you very much for your feedback.

A stylistic thing perhaps, but instead of ... {}".format(str) why not just =
use ... %s" % str ?
-- I don't have strong feelings about using str.format ..I could use "%s %s=
tr" instead if that's the style. I like format because I don't have to cast=
 to string the passed in parameter.

Hmm, so I thought the plan we talked about here was to use QemuRunner. As I=
 said earlier, if QemuRunner isn't doing what we need here (e.g. isn't allo=
wing us to use pexpect) then we should fix it so that it does or at least m=
ake it optional. Even with these changes we are still left with a complete =
implementation of running QEMU here in the test, which we want to avoid.
-- I am aware that we should use QemuRunner but at the moment it isn't doin=
g what we need here.
    Since these testcases might interfere with other qemu instances running=
 in parallel I thought it is a good compromise the way I implemented in thi=
s patch.
    When we will manage to update QemuRunner, these testcase can be easily =
updated too. =20

These changes aren't described in the commit message - please either add=20
mention of them or if they aren't actually related to resolving the QEMU=20
running issue, put them in a separate patch.
-- I updated the assert message to also include the output. Is it really ne=
cessary to submit another patch with this minor change?

Thanks,
--Daniel


-----Original Message-----
From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]=20
Sent: Tuesday, July 14, 2015 12:30 PM
To: Istrate, Daniel AlexandruX
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] oeqa/selftest: [YOCTO #7976] Updated imagefe=
ature testcases.

Hi Daniel,

Comments in-line below.

On Tuesday 14 July 2015 11:48:09 Daniel Istrate wrote:
> Updated testcases that use qemu to not interfere with other qemu=20
> instances that might run in parallel.

The [YOCTO #....] reference should go here, not in the shortlog.

> Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
> ---
>  meta/lib/oeqa/selftest/imagefeatures.py | 153
> ++++++++++++-------------------- 1 file changed, 58 insertions(+), 95
> deletions(-)
>=20
> diff --git a/meta/lib/oeqa/selftest/imagefeatures.py
> b/meta/lib/oeqa/selftest/imagefeatures.py index e0e424d..030969e=20
> 100644
> --- a/meta/lib/oeqa/selftest/imagefeatures.py
> +++ b/meta/lib/oeqa/selftest/imagefeatures.py
> @@ -2,13 +2,20 @@ from oeqa.selftest.base import oeSelfTest  from=20
> oeqa.utils.commands import runCmd, bitbake, get_bb_var  from=20
> oeqa.utils.decorators import testcase  import pexpect -from os.path=20
> import expanduser, isfile
> +from os.path import isfile
>  from os import system
>  import glob
> +import time
>=20
>=20
>  class ImageFeatures(oeSelfTest):
>=20
> +    test_user =3D 'tester'
> +    root_user =3D 'root'
> +    prompt =3D r'qemux86:\S+[$#]\s+'
> +    ssh_cmd =3D "ssh {} -l {} -o UserKnownHostsFile=3D/dev/null -o
> StrictHostKeyChecking=3Dno"=20
> +    get_ip_patt =3D r'\s+ip=3D(?P<qemu_ip>(\d+.){3}\d+)::'
> +
>      @testcase(1107)
>      def test_non_root_user_can_connect_via_ssh_without_password(self):
>          """
> @@ -20,69 +27,49 @@ class ImageFeatures(oeSelfTest):
>          AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com=
>
>          """
>=20
> -        test_user =3D 'tester'
> -        root_user =3D 'root'
> -        prompt =3D r'qemux86:\S+[$#]\s+'
> -        tap_inf_ip =3D '192.168.7.2'
> -
>          features =3D 'EXTRA_IMAGE_FEATURES +=3D "ssh-server-openssh=20
> empty-root-password"\n' features +=3D 'INHERIT +=3D "extrausers"\n'
> -        features +=3D 'EXTRA_USERS_PARAMS =3D "useradd -p \'\' {}; userm=
od -s
> /bin/sh {};"'.format(test_user, test_user) +        features +=3D
> 'EXTRA_USERS_PARAMS =3D "useradd -p \'\' {}; usermod -s /bin/sh=20
> {};"'.format(self.test_user, self.test_user)
>=20
>          # Append 'features' to local.conf
>          self.append_config(features)
>=20
>          # Build a core-image-minimal
>          ret =3D bitbake('core-image-minimal')
> -        self.assertEqual(0, ret.status, 'Failed to build a
> core-image-minimal')
> -
> -        rm_ssh_keys_cmd =3D 'ssh-keygen -f "{}/.ssh/known_hosts" -R
> {}'.format(expanduser('~'), tap_inf_ip)=20
> -        # Delete the ssh keys for 192.168.7.2 (qemu)
> -        ret =3D runCmd(rm_ssh_keys_cmd)
> -        self.assertEqual(0, ret.status, 'Failed to delete ssh keys for q=
emu
> host.')
> +        self.assertEqual(0, ret.status, 'Failed to build a
> core-image-minimal. Reason: {}'.format(ret.output))

A stylistic thing perhaps, but instead of ... {}".format(str) why not just =
use ... %s" % str ?

>          # Boot qemu image
> -        proc_qemu =3D pexpect.spawn('runqemu qemux86 nographic')
> +        proc_qemu =3D pexpect.spawn('runqemu qemux86')

Hmm, so I thought the plan we talked about here was to use QemuRunner. As I=
 said earlier, if QemuRunner isn't doing what we need here (e.g. isn't allo=
wing us to use pexpect) then we should fix it so that it does or at least m=
ake it optional. Even with these changes we are still left with a complete =
implementation of running QEMU here in the test, which we want to avoid.

...
>      @testcase(1101)
>      def test_efi_gummiboot_images_can_be_build(self):
> @@ -311,7 +274,7 @@ class Gummiboot(oeSelfTest):
>          # Create efi/gummiboot installation images
>          wic_create_cmd =3D 'wic create mkgummidisk -e core-image-minimal=
'
>          ret =3D runCmd(wic_create_cmd)
> -        self.assertEqual(0, ret.status, 'Failed to create efi/gummiboot
> installation images.')=20
> +        self.assertEqual(0, ret.status, 'Failed to
> create efi/gummiboot installation images. Reason: {}'.format(ret.output))

These changes aren't described in the commit message - please either add=20
mention of them or if they aren't actually related to resolving the QEMU=20
running issue, put them in a separate patch.

Thanks,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

