Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2A464731F6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 15:20:16 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 09 Aug 2016 08:20:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,495,1464678000"; 
	d="asc'?scan'208";a="746342280"
Received: from jalamego-mobl2.zpn.intel.com (HELO [10.219.5.140])
	([10.219.5.140])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Aug 2016 08:20:16 -0700
To: ed.bartosh@linux.intel.com
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
	<1d31183647c7567646a2804ad8f239a722853789.1470671417.git.jose.a.lamego@linux.intel.com>
	<20160809072638.GA12414@linux.intel.com>
From: Jose Lamego <jose.a.lamego@linux.intel.com>
Message-ID: <dc4b4699-8cde-54ac-3d1b-d9387d35fedd@linux.intel.com>
Date: Tue, 9 Aug 2016 10:20:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160809072638.GA12414@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 19/20] oeqa.selftest.wic: Split configuration from code
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
X-List-Received-Date: Tue, 09 Aug 2016 15:20:17 -0000
X-Groupsio-MsgNum: 85569
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="kHuFErTukRXcaGdC5XOg9DX7vH93mwgQT"

--kHuFErTukRXcaGdC5XOg9DX7vH93mwgQT
Content-Type: multipart/mixed; boundary="wvmwGMR7Wlt6umUXpLFCI3ruB5NMlRbJA"
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: ed.bartosh@linux.intel.com
Cc: openembedded-core@lists.openembedded.org
Message-ID: <dc4b4699-8cde-54ac-3d1b-d9387d35fedd@linux.intel.com>
Subject: Re: [OE-core] [PATCH 19/20] oeqa.selftest.wic: Split configuration
 from code
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
 <1d31183647c7567646a2804ad8f239a722853789.1470671417.git.jose.a.lamego@linux.intel.com>
 <20160809072638.GA12414@linux.intel.com>
In-Reply-To: <20160809072638.GA12414@linux.intel.com>

--wvmwGMR7Wlt6umUXpLFCI3ruB5NMlRbJA
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi Ed, thanks for your quick response.

On 08/09/2016 02:26 AM, Ed Bartosh wrote:
> Hi Jose,
>=20
> On Mon, Aug 08, 2016 at 09:23:07AM -0700, Jose Lamego wrote:
>> Improve oeqa-selftest capabilities and UX by placing
>> test configuration features and variables into a separate
>> configuration file.
>>
>=20
> Frankly I have mixed feelings about these changes. From the first look
> splitting configuration and code is a good idea. However, looking at th=
e
> result I must say I feel like the test became less readable and harder
> to understand and maintain.
>=20
> May be the changes make sense for other tests, but for this one they ma=
ke
> my life as a maintainer of this one less easy I'd say.
I totally understand you point. But before we drop the idea of this
change for wic, would there be a way to keep the code  understandable
while leveraging on the configuration file to be able to easily try
different input/output combinations without touching the test code
(which is the basic purpose of the change)? Maybe renaming the conf
variables (see below proposals)?
If you still believe there would be no benefits from this change, it
will be better to skip it for wic.
>=20
>> [Yocto 9389]
>>
>> Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
>> ---
>>  meta/lib/oeqa/selftest/conf/wic.conf |  10 +++
>>  meta/lib/oeqa/selftest/wic.py        | 150 ++++++++++++++++++++------=
---------
>>  2 files changed, 98 insertions(+), 62 deletions(-)
>>  create mode 100644 meta/lib/oeqa/selftest/conf/wic.conf
>>
>> diff --git a/meta/lib/oeqa/selftest/conf/wic.conf b/meta/lib/oeqa/self=
test/conf/wic.conf
>> new file mode 100644
>> index 0000000..e2afb8d
>> --- /dev/null
>> +++ b/meta/lib/oeqa/selftest/conf/wic.conf
>> @@ -0,0 +1,10 @@
>> +[Wic]
>> +setUpClass_image1 =3D core-image-minimal
>> +setUpClass_image2 =3D minimal
> setUpClass_image2 is not used in the code.
>=20
>> +setUpClass_image3 =3D qemux86-directdisk
>> +setUpClass_image4 =3D directdisk
>> +setUpClass_image5 =3D wic-image-minimal
> setUpClass_image1 is an image produced by bitbake, but setUpClass_image=
3
> is a name of wic image. They're not the same. Bitbake image is an input=

> for wic and wic image is an output. setUpClass_image5 is again the name=

> of the bitbake target, but it differs from _image3. Naming doesn't refl=
ect this fact.
setUpClass_image1 could be renamed to setUpClass_bitbakeImage1
setUpClass_image3 could be renamed to setClass_wicImage
setUpClass_image5 to setUpClass_bitbakeImage2
>=20
>=20
>> +setUpClass_features =3D IMAGE_FSTYPES +=3D " hddimg"
>> +                      MACHINE_FEATURES_append =3D " efi"
>> +setUpClass_recipes =3D syslinux syslinux-native parted-native gptfdis=
k-native dosfstools-native mtools-native bmap-tools-native
> This list is used only once in the test. Moving it to config file makes=

> it longer to understand what's in the list.
>=20
>> diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wi=
c.py
>> index e550785..dc81457 100644
>> --- a/meta/lib/oeqa/selftest/wic.py
>> +++ b/meta/lib/oeqa/selftest/wic.py
>> @@ -31,6 +31,7 @@ from shutil import rmtree
>>  from oeqa.selftest.base import oeSelfTest
>>  from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
>>  from oeqa.utils.decorators import testcase
>> +from oeqa.utils.readconfig import conffile
>> =20
>> =20
>>  class Wic(oeSelfTest):
>> @@ -39,6 +40,18 @@ class Wic(oeSelfTest):
>>      resultdir =3D "/var/tmp/wic/build/"
>>      image_is_ready =3D False
>> =20
>> +    @classmethod
>> +    def setUpClass(cls):
>> +        # Get test configurations from configuration file
>> +        cls.config =3D conffile(__file__)
>> +        cls.image1 =3D cls.config.get('Wic', 'setUpClass_image1')
>> +        cls.image2 =3D cls.config.get('Wic', 'setUpClass_image2')
>> +        cls.image3 =3D cls.config.get('Wic', 'setUpClass_image3')
>> +        cls.image4 =3D cls.config.get('Wic', 'setUpClass_image4')
>> +        cls.image5 =3D cls.config.get('Wic', 'setUpClass_image5')
>> +        cls.features =3D cls.config.get('Wic', 'setUpClass_features')=

>> +        cls.recipes =3D cls.config.get('Wic', 'setUpClass_recipes')
> This looks like a duplication of code and configuration and also hides =
real
> image names and features making test much less readable.
>=20
>> +
>>      def setUpLocal(self):
>>          """This code is executed before each test method."""
>>          self.write_config('IMAGE_FSTYPES +=3D " hddimg"\n'
>> @@ -48,9 +61,8 @@ class Wic(oeSelfTest):
>>          # clean up which can result in the native tools built earlier=
 in
>>          # setUpClass being unavailable.
>>          if not Wic.image_is_ready:
>> -            bitbake('syslinux syslinux-native parted-native gptfdisk-=
native '
>> -                    'dosfstools-native mtools-native bmap-tools-nativ=
e')
>> -            bitbake('core-image-minimal')
>> +            bitbake(self.recipes)
>> +            bitbake(self.image1)
> I'd really prefer to see list of dependencies and the image name right
> in the test code without having to look into configuration file.
Could this dependency list be renamed to something that reflects its
nature? something like "nativeDependencies"? So a different dependency
group could be used from the conf file.

>=20
> The same is true for pretty much all the changes.
>=20
>>              Wic.image_is_ready =3D True
>> =20
>>          rmtree(self.resultdir, ignore_errors=3DTrue)
>> @@ -73,30 +85,35 @@ class Wic(oeSelfTest):
>>      @testcase(1211)
>>      def test_build_image_name(self):
>>          """Test wic create directdisk --image-name core-image-minimal=
"""
>> -        self.assertEqual(0, runCmd("wic create directdisk "
>> -                                   "--image-name core-image-minimal")=
=2Estatus)
>> -        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.d=
irect")))
>> +        self.assertEqual(
>> +            0, runCmd("wic create %s --image-name %s"
>> +                      % (self.image4, self.image1)).status)
>> +        self.assertEqual(
>> +            1, len(glob(self.resultdir + "%s-*.direct" % self.image4)=
))
>> =20
>>      @testcase(1212)
>>      def test_build_artifacts(self):
>>          """Test wic create directdisk providing all artifacts."""
>> -        bbvars =3D dict((var.lower(), get_bb_var(var, 'core-image-min=
imal')) \
>> -                        for var in ('STAGING_DATADIR', 'DEPLOY_DIR_IM=
AGE',
>> -                                    'STAGING_DIR_NATIVE', 'IMAGE_ROOT=
FS'))
>> +        bbvars =3D dict((var.lower(), get_bb_var(var, self.image1))
>> +                      for var in ('STAGING_DATADIR', 'DEPLOY_DIR_IMAG=
E',
>> +                                  'STAGING_DIR_NATIVE', 'IMAGE_ROOTFS=
'))
>>          status =3D runCmd("wic create directdisk "
>>                          "-b %(staging_datadir)s "
>>                          "-k %(deploy_dir_image)s "
>>                          "-n %(staging_dir_native)s "
>>                          "-r %(image_rootfs)s" % bbvars).status
>>          self.assertEqual(0, status)
>> -        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.d=
irect")))
>> +        self.assertEqual(1, len(glob(self.resultdir + "%s-*.direct"
>> +                         % self.image4)))
>> =20
>>      @testcase(1157)
>>      def test_gpt_image(self):
>> -        """Test creation of core-image-minimal with gpt table and UUI=
D boot"""
>> -        self.assertEqual(0, runCmd("wic create directdisk-gpt "
>> -                                   "--image-name core-image-minimal")=
=2Estatus)
>> -        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.d=
irect")))
>> +        """Test creation of %s with gpt table and UUID boot""" % self=
=2Eimage1
>> +        self.assertEqual(0, runCmd("wic create %s-gpt "
>> +                                   "--image-name %s"
>> +                                   % (self.image4, self.image1)).stat=
us)
>> +        self.assertEqual(1, len(glob(self.resultdir + "%s-*.direct"
>> +                                     % self.image4)))
>> =20
>>      @testcase(1213)
>>      def test_unsupported_subcommand(self):
>> @@ -127,55 +144,63 @@ class Wic(oeSelfTest):
>>      @testcase(1264)
>>      def test_compress_gzip(self):
>>          """Test compressing an image with gzip"""
>> -        self.assertEqual(0, runCmd("wic create directdisk "
>> -                                   "--image-name core-image-minimal "=

>> -                                   "-c gzip").status)
>> -        self.assertEqual(1, len(glob(self.resultdir + \
>> -                                         "directdisk-*.direct.gz")))
>> +        self.assertEqual(0, runCmd("wic create %s "
>> +                                   "--image-name %s "
>> +                                   "-c gzip"
>> +                                   % (self.image4, self.image1)).stat=
us)
>> +        self.assertEqual(1, len(glob(
>> +                                self.resultdir + "%s-*.direct.gz"
>> +                                % self.image4)))
>> =20
>>      @testcase(1265)
>>      def test_compress_bzip2(self):
>>          """Test compressing an image with bzip2"""
>> -        self.assertEqual(0, runCmd("wic create directdisk "
>> -                                   "--image-name core-image-minimal "=

>> -                                   "-c bzip2").status)
>> -        self.assertEqual(1, len(glob(self.resultdir + \
>> -                                         "directdisk-*.direct.bz2")))=

>> +        self.assertEqual(0, runCmd("wic create %s "
>> +                                   "--image-name %s "
>> +                                   "-c bzip2"
>> +                                   % (self.image4, self.image1)).stat=
us)
>> +        self.assertEqual(1, len(glob(
>> +                                self.resultdir + "%s-*.direct.bz2"
>> +                                % self.image4)))
>> =20
>>      @testcase(1266)
>>      def test_compress_xz(self):
>>          """Test compressing an image with xz"""
>> -        self.assertEqual(0, runCmd("wic create directdisk "
>> -                                   "--image-name core-image-minimal "=

>> -                                   "-c xz").status)
>> -        self.assertEqual(1, len(glob(self.resultdir + \
>> -                                         "directdisk-*.direct.xz")))
>> +        self.assertEqual(0, runCmd("wic create %s "
>> +                                   "--image-name %s "
>> +                                   "-c xz"
>> +                                   % (self.image4, self.image1)).stat=
us)
>> +        self.assertEqual(1, len(glob(
>> +                                self.resultdir + "%s-*.direct.xz"
>> +                                % self.image4)))
>> =20
>>      @testcase(1267)
>>      def test_wrong_compressor(self):
>>          """Test how wic breaks if wrong compressor is provided"""
>> -        self.assertEqual(2, runCmd("wic create directdisk "
>> -                                   "--image-name core-image-minimal "=

>> -                                   "-c wrong", ignore_status=3DTrue).=
status)
>> +        self.assertEqual(2, runCmd("wic create %s "
>> +                                   "--image-name %s "
>> +                                   "-c wrong" % (self.image4, self.im=
age1),
>> +                                   ignore_status=3DTrue).status)
>> =20
>>      @testcase(1268)
>>      def test_rootfs_indirect_recipes(self):
>>          """Test usage of rootfs plugin with rootfs recipes"""
>>          wks =3D "directdisk-multi-rootfs"
>>          self.assertEqual(0, runCmd("wic create %s "
>> -                                   "--image-name core-image-minimal "=

>> -                                   "--rootfs rootfs1=3Dcore-image-min=
imal "
>> -                                   "--rootfs rootfs2=3Dcore-image-min=
imal" \
>> -                                   % wks).status)
>> +                                   "--image-name %s "
>> +                                   "--rootfs rootfs1=3D%s "
>> +                                   "--rootfs rootfs2=3D%s"
>> +                                   % (wks, self.image1, self.image1,
>> +                                      self.image1)).status)
>>          self.assertEqual(1, len(glob(self.resultdir + "%s*.direct" % =
wks)))
>> =20
>>      @testcase(1269)
>>      def test_rootfs_artifacts(self):
>>          """Test usage of rootfs plugin with rootfs paths"""
>> -        bbvars =3D dict((var.lower(), get_bb_var(var, 'core-image-min=
imal')) \
>> -                        for var in ('STAGING_DATADIR', 'DEPLOY_DIR_IM=
AGE',
>> -                                    'STAGING_DIR_NATIVE', 'IMAGE_ROOT=
FS'))
>> -        bbvars['wks'] =3D "directdisk-multi-rootfs"
>> +        bbvars =3D dict((var.lower(), get_bb_var(var, self.image1))
>> +                      for var in ('STAGING_DATADIR', 'DEPLOY_DIR_IMAG=
E',
>> +                                  'STAGING_DIR_NATIVE', 'IMAGE_ROOTFS=
'))
>> +        bbvars['wks'] =3D "%s-multi-rootfs" % self.image4
>>          status =3D runCmd("wic create %(wks)s "
>>                          "-b %(staging_datadir)s "
>>                          "-k %(deploy_dir_image)s "
>> @@ -191,14 +216,14 @@ class Wic(oeSelfTest):
>>      def test_iso_image(self):
>>          """Test creation of hybrid iso image with legacy and EFI boot=
"""
>>          self.assertEqual(0, runCmd("wic create mkhybridiso "
>> -                                   "--image-name core-image-minimal")=
=2Estatus)
>> +                                   "--image-name %s" % self.image1).s=
tatus)
>>          self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG=
-*.direct")))
>>          self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG=
-*.iso")))
>> =20
>>      @testcase(1347)
>>      def test_image_env(self):
>>          """Test generation of <image>.env files."""
>> -        image =3D 'core-image-minimal'
>> +        image =3D self.image1
>>          self.assertEqual(0, bitbake('%s -c do_rootfs_wicenv' % image)=
=2Estatus)
>>          stdir =3D get_bb_var('STAGING_DIR_TARGET', image)
>>          imgdatadir =3D os.path.join(stdir, 'imgdata')
>> @@ -222,11 +247,11 @@ class Wic(oeSelfTest):
>>      @testcase(1351)
>>      def test_wic_image_type(self):
>>          """Test building wic images by bitbake"""
>> -        self.assertEqual(0, bitbake('wic-image-minimal').status)
>> +        self.assertEqual(0, bitbake(self.image5).status)
>> =20
>>          deploy_dir =3D get_bb_var('DEPLOY_DIR_IMAGE')
>>          machine =3D get_bb_var('MACHINE')
>> -        prefix =3D os.path.join(deploy_dir, 'wic-image-minimal-%s.' %=
 machine)
>> +        prefix =3D os.path.join(deploy_dir, '%s-%s.' % (self.image5, =
machine))
>>          # check if we have result image and manifests symlinks
>>          # pointing to existing files
>>          for suffix in ('wic', 'manifest'):
>> @@ -236,42 +261,42 @@ class Wic(oeSelfTest):
>> =20
>>      @testcase(1348)
>>      def test_qemux86_directdisk(self):
>> -        """Test creation of qemux-86-directdisk image"""
>> -        image =3D "qemux86-directdisk"
>> -        self.assertEqual(0, runCmd("wic create %s -e core-image-minim=
al" \
>> -                                   % image).status)
>> -        self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % =
image)))
>> +        """Test creation of %s image""" % self.image3
>> +        self.assertEqual(0, runCmd("wic create %s -e %s"
>> +                                   % (self.image3, self.image1)).stat=
us)
>> +        self.assertEqual(1, len(glob(self.resultdir + "%s-*direct"
>> +                                     % self.image3)))
>> =20
>>      @testcase(1349)
>>      def test_mkgummidisk(self):
>>          """Test creation of mkgummidisk image"""
>>          image =3D "mkgummidisk"
>> -        self.assertEqual(0, runCmd("wic create %s -e core-image-minim=
al" \
>> -                                   % image).status)
>> +        self.assertEqual(0, runCmd("wic create %s -e %s"
>> +                                   % (image, self.image1)).status)
>>          self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % =
image)))
>> =20
>>      @testcase(1350)
>>      def test_mkefidisk(self):
>>          """Test creation of mkefidisk image"""
>>          image =3D "mkefidisk"
>> -        self.assertEqual(0, runCmd("wic create %s -e core-image-minim=
al" \
>> -                                   % image).status)
>> +        self.assertEqual(0, runCmd("wic create %s -e %s"
>> +                                   % (image, self.image1)).status)
>>          self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % =
image)))
>> =20
>>      @testcase(1385)
>>      def test_directdisk_bootloader_config(self):
>> -        """Test creation of directdisk-bootloader-config image"""
>> -        image =3D "directdisk-bootloader-config"
>> -        self.assertEqual(0, runCmd("wic create %s -e core-image-minim=
al" \
>> -                                   % image).status)
>> +        """Test creation of %s-bootloader-config image""" % self.imag=
e4
>> +        image =3D "%s-bootloader-config" % self.image4
>> +        self.assertEqual(0, runCmd("wic create %s -e %s"
>> +                                   % (image, self.image1)).status)
>>          self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % =
image)))
>> =20
>>      @testcase(1422)
>>      def test_qemu(self):
>> -        """Test wic-image-minimal under qemu"""
>> -        self.assertEqual(0, bitbake('wic-image-minimal').status)
>> +        """Test %s under qemu""" % self.image5
>> +        self.assertEqual(0, bitbake(self.image5).status)
>> =20
>> -        with runqemu('wic-image-minimal', ssh=3DFalse) as qemu:
>> +        with runqemu(self.image5, ssh=3DFalse) as qemu:
>>              command =3D "mount |grep '^/dev/' | cut -f1,3 -d ' '"
>>              status, output =3D qemu.run_serial(command)
>>              self.assertEqual(1, status, 'Failed to run command "%s": =
%s' % (command, output))
>> @@ -279,8 +304,9 @@ class Wic(oeSelfTest):
>> =20
>>      def test_bmap(self):
>>          """Test generation of .bmap file"""
>> -        image =3D "directdisk"
>> -        status =3D runCmd("wic create %s -e core-image-minimal --bmap=
" % image).status
>> +        image =3D self.image4
>> +        status =3D runCmd("wic create %s -e %s --bmap"
>> +                        % (image, self.image1)).status
>>          self.assertEqual(0, status)
>>          self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % =
image)))
>>          self.assertEqual(1, len(glob(self.resultdir + "%s-*direct.bma=
p" % image)))
>> --=20
>> 1.8.3.1
>>
>> --=20
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20

--=20
Jose Lamego | OTC Embedded Platforms & Tools | GDC


--wvmwGMR7Wlt6umUXpLFCI3ruB5NMlRbJA--

--kHuFErTukRXcaGdC5XOg9DX7vH93mwgQT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJXqfSwAAoJEFJAtowlSEbnxWoH/Rc64Rqym5A8f8WcuH+obOMc
TBR7/PGUJC0bqwnMW86T/+HM5wvb6+Phx+Ts0T5pBUlbq7EjDZXRwHJLawTHlJKK
N01wJdHfE3iIWD/dStwrcDcORPQgWj5MeZTDd/v05I98dlnNqmPE80MnNfJcd1dr
1jjOFbqwtPaYJyXG780yDlZphvhVjbCYFlybOtIftxWhejdoxDJQAJoJpeIR2j4x
UZAk9GFygWfJtA+B/vZkOepWkOpYYjxZ8kbLVWuGJ80yrXYiKWlP6FD+cuuyl06/
9O1FAVOwyY/ExBq5ZUDRlZVGhFTWRjnT+f9KDdgcc0NRmCZaDei/KGpxaw0eWSQ=
=oX2j
-----END PGP SIGNATURE-----

--kHuFErTukRXcaGdC5XOg9DX7vH93mwgQT--
