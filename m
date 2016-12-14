Return-Path: <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id DC7C6760A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 00:25:13 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 13 Dec 2016 16:24:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,343,1477983600"; d="scan'208";a="202295213"
Received: from jairdeje-mobl3.amr.corp.intel.com (HELO jairdejeMOBL3)
	([10.219.17.204])
	by fmsmga004.fm.intel.com with ESMTP; 13 Dec 2016 16:24:58 -0800
From: "Jair Gonzalez" <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
To: <ed.bartosh@linux.intel.com>
References: <1481644407-16699-1-git-send-email-jair.de.jesus.gonzalez.plascencia@linux.intel.com>
	<20161213201722.GA6557@linux.intel.com>
In-Reply-To: <20161213201722.GA6557@linux.intel.com>
Date: Tue, 13 Dec 2016 18:24:57 -0600
Message-ID: <012801d255a0$806ad8e0$81408aa0$@linux.intel.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQCuN9iHhIWtvvReDcBYllgaE6CYAQEj180Wo0WfsdA=
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiODY1YmIxNjQtOTRjYS00ODY4LWE4YTItYmJlNjY5MjViZTE5IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE1LjkuNi42IiwiVHJ1c3RlZExhYmVsSGFzaCI6Imhma1V1eHU2YVYrVHF2cVJhRHdMM3RMRlJ6MXdxbWZcLzQzdnZwZStFZnhnPSJ9
x-ctpclassification: CTP_IC
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] selftest/wic: extending test coverage for WIC script options
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
X-List-Received-Date: Wed, 14 Dec 2016 00:25:14 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us

Hi Ed,

Thank you for your response and suggestions. Below are my comments.

> -----Original Message-----
> From: Ed Bartosh [mailto:ed.bartosh@linux.intel.com]
> Sent: Tuesday, December 13, 2016 2:17 PM
> To: Jair Gonzalez <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] selftest/wic: extending test coverage for
WIC
> script options
> 
> Hi Jair,
> 
> Thank you for the patch! My comments are below.
> 
> On Tue, Dec 13, 2016 at 09:53:27AM -0600, Jair Gonzalez wrote:
> > The previous WIC script selftest didn't cover all of its command line
> > options. The following test cases were added to complete covering
> > them:
> >
> > 1552 Test wic --version
> > 1553 Test wic help create
> > 1554 Test wic help list
> > 1555 Test wic list images
> > 1556 Test wic list source-plugins
> > 1557 Test wic listed images help
> > 1558 Test wic debug, skip-build-check and build_rootfs
> > 1559 Test image vars directory selection
> > 1562 Test alternate output directory
> 
> > In addition, the following test cases were assigned an ID number on
> > Testopia:
> >
> > 1560 Test creation of systemd-bootdisk image
> > 1561 Test creation of sdimage-bootpart image
> >
> > Finally, part of the test methods were rearranged to group them by
> > functionality, and some cleanup was made to improve the code's
> > compliance with PEP8 style guide.
> 
> I'd suggest to split this patch to at least 3 patches:
> - new testcases (fix for YOCTO 10594)
> - assigning id numbers
> - removing WKS_FILE = "wic-image-minimal" from config
> - code cleanup
Agreed. I'll split it and submit the new patches.
> 
> > Fixes [YOCTO 10594]
> >
> > Signed-off-by: Jair Gonzalez
> > <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
> > ---
> >  meta/lib/oeqa/selftest/wic.py | 246
> > +++++++++++++++++++++++++++++-------------
> >  1 file changed, 174 insertions(+), 72 deletions(-)
> >
> > diff --git a/meta/lib/oeqa/selftest/wic.py
> > b/meta/lib/oeqa/selftest/wic.py index e652fad..46bfb94 100644
> > --- a/meta/lib/oeqa/selftest/wic.py
> > +++ b/meta/lib/oeqa/selftest/wic.py
> > @@ -37,13 +37,13 @@ class Wic(oeSelfTest):
> >      """Wic test class."""
> >
> >      resultdir = "/var/tmp/wic/build/"
> > +    alternate_resultdir = "/var/tmp/wic/build/alt/"
> >      image_is_ready = False
> >
> >      def setUpLocal(self):
> >          """This code is executed before each test method."""
> >          self.write_config('IMAGE_FSTYPES += " hddimg"\n'
> > -                          'MACHINE_FEATURES_append = " efi"\n'
> > -                          'WKS_FILE = "wic-image-minimal"\n')
> I like the change, but it should be also in a separate patch.
Agreed.
> 
> > +                          'MACHINE_FEATURES_append = " efi"\n')
> >
> >          # Do this here instead of in setUpClass as the base setUp does
some
> >          # clean up which can result in the native tools built earlier
> > in @@ -56,10 +56,16 @@ class Wic(oeSelfTest):
> >
> >          rmtree(self.resultdir, ignore_errors=True)
> >
> > +    @testcase(1552)
> > +    def test_version(self):
> > +        """Test wic --version"""
> > +        self.assertEqual(0, runCmd('wic --version').status)
> > +
> >      @testcase(1208)
> >      def test_help(self):
> > -        """Test wic --help"""
> > +        """Test wic --help and wic -h"""
> >          self.assertEqual(0, runCmd('wic --help').status)
> > +        self.assertEqual(0, runCmd('wic -h').status)
> >      @testcase(1209)
> >      def test_createhelp(self):
> > @@ -71,19 +77,74 @@ class Wic(oeSelfTest):
> >          """Test wic list --help"""
> >          self.assertEqual(0, runCmd('wic list --help').status)
> >
> > +    @testcase(1553)
> > +    def test_help_create(self):
> > +        """Test wic help create"""
> > +        self.assertEqual(0, runCmd('wic help create').status)
> > +
> > +    @testcase(1554)
> > +    def test_help_list(self):
> > +        """Test wic help list"""
> > +        self.assertEqual(0, runCmd('wic help list').status)
> > +
> > +    @testcase(1215)
> > +    def test_help_overview(self):
> > +        """Test wic help overview"""
> > +        self.assertEqual(0, runCmd('wic help overview').status)
> > +
> > +    @testcase(1216)
> > +    def test_help_plugins(self):
> > +        """Test wic help plugins"""
> > +        self.assertEqual(0, runCmd('wic help plugins').status)
> > +
> > +    @testcase(1217)
> > +    def test_help_kickstart(self):
> > +        """Test wic help kickstart"""
> > +        self.assertEqual(0, runCmd('wic help kickstart').status)
> > +
> > +    @testcase(1555)
> > +    def test_list_images(self):
> > +        """Test wic list images"""
> > +        self.assertEqual(0, runCmd('wic list images').status)
> > +
> > +    @testcase(1556)
> > +    def test_list_source_plugins(self):
> > +        """Test wic list source-plugins"""
> > +        self.assertEqual(0, runCmd('wic list source-plugins').status)
> > +
> > +    @testcase(1557)
> > +    def test_listed_images_help(self):
> > +        """Test wic listed images help"""
> > +        output = runCmd('wic list images').output
> > +        imageDetails = [line.split() for line in output.split('\n')]
> > +        imageList = [row[0] for row in imageDetails]
> How about replacing two last lines with this?
> imagelist = [line.split()[0] for line in output.split('\n')]
I agree. What about this?
imagelist = [line.split()[0] for line in output.splitlines()]
> 
> > +        for image in imageList:
> > +            self.assertEqual(0, runCmd('wic list %s help' %
> > + image).status)
> > +
> > +    @testcase(1213)
> > +    def test_unsupported_subcommand(self):
> > +        """Test unsupported subcommand"""
> > +        self.assertEqual(1, runCmd('wic unsupported',
> > +                                   ignore_status=True).status)
> > +
> > +    @testcase(1214)
> > +    def test_no_command(self):
> > +        """Test wic without command"""
> > +        self.assertEqual(1, runCmd('wic', ignore_status=True).status)
> > +
> >      @testcase(1211)
> >      def test_build_image_name(self):
> >          """Test wic create directdisk --image-name
core-image-minimal"""
> >          self.assertEqual(0, runCmd("wic create directdisk "
> > -                                   "--image-name
core-image-minimal").status)
> > +
> > + "--image-name=core-image-minimal").status)
> Is '=' mandatory here?
On wic's help it appears as mandatory, but on practice, it can be used both
ways. I decided to use both ways along the module to test both usages and
increase coverage, but not to dedicate specific test cases to each
combination.
> 
> >          self.assertEqual(1, len(glob(self.resultdir +
> > "directdisk-*.direct")))
> >
> >      @testcase(1212)
> >      def test_build_artifacts(self):
> >          """Test wic create directdisk providing all artifacts."""
> > -        bbvars = dict((var.lower(), get_bb_var(var,
'core-image-minimal')) \
> > -                        for var in ('STAGING_DATADIR',
'DEPLOY_DIR_IMAGE',
> > -                                    'STAGING_DIR_NATIVE',
'IMAGE_ROOTFS'))
> > +        bbvars = dict((var.lower(), get_bb_var(var,
'core-image-minimal'))
> > +                      for var in ('STAGING_DATADIR',
'DEPLOY_DIR_IMAGE',
> > +                                  'STAGING_DIR_NATIVE',
> > + 'IMAGE_ROOTFS'))
> >          status = runCmd("wic create directdisk "
> >                          "-b %(staging_datadir)s "
> >                          "-k %(deploy_dir_image)s "
> > @@ -96,113 +157,110 @@ class Wic(oeSelfTest):
> >      def test_gpt_image(self):
> >          """Test creation of core-image-minimal with gpt table and UUID
> boot"""
> >          self.assertEqual(0, runCmd("wic create directdisk-gpt "
> > -                                   "--image-name
core-image-minimal").status)
> > +                                   "--image-name core-image-minimal "
> > +                                   ).status)
> What does this fix?
It's to conform to PEP8 with equal or less than 79 chars per line.
> 
> >          self.assertEqual(1, len(glob(self.resultdir +
> > "directdisk-*.direct")))
> >
> > -    @testcase(1213)
> > -    def test_unsupported_subcommand(self):
> > -        """Test unsupported subcommand"""
> > -        self.assertEqual(1, runCmd('wic unsupported',
> > -                                   ignore_status=True).status)
> > -
> > -    @testcase(1214)
> > -    def test_no_command(self):
> > -        """Test wic without command"""
> > -        self.assertEqual(1, runCmd('wic', ignore_status=True).status)
> > -
> > -    @testcase(1215)
> > -    def test_help_overview(self):
> > -        """Test wic help overview"""
> > -        self.assertEqual(0, runCmd('wic help overview').status)
> > -
> > -    @testcase(1216)
> > -    def test_help_plugins(self):
> > -        """Test wic help plugins"""
> > -        self.assertEqual(0, runCmd('wic help plugins').status)
> > -
> > -    @testcase(1217)
> > -    def test_help_kickstart(self):
> > -        """Test wic help kickstart"""
> > -        self.assertEqual(0, runCmd('wic help kickstart').status)
> > -
> >      @testcase(1264)
> >      def test_compress_gzip(self):
> >          """Test compressing an image with gzip"""
> >          self.assertEqual(0, runCmd("wic create directdisk "
> > -                                   "--image-name core-image-minimal "
> > +                                   "-e core-image-minimal "
> --image-name is more readable than -e from my point of view.
Similarly to the '=' to define long option names' arguments, I used both
forms of each option along the module to increase coverage.
> 
> >                                     "-c gzip").status)
> > -        self.assertEqual(1, len(glob(self.resultdir + \
> > -                                         "directdisk-*.direct.gz")))
> > +        self.assertEqual(1, len(glob(self.resultdir +
> > +                                     "directdisk-*.direct.gz")))
> >
> >      @testcase(1265)
> >      def test_compress_bzip2(self):
> >          """Test compressing an image with bzip2"""
> >          self.assertEqual(0, runCmd("wic create directdisk "
> > -                                   "--image-name core-image-minimal "
> > +                                   "--image-name=core-image-minimal "
> >                                     "-c bzip2").status)
> > -        self.assertEqual(1, len(glob(self.resultdir + \
> > -                                         "directdisk-*.direct.bz2")))
> > +        self.assertEqual(1, len(glob(self.resultdir +
> > +                                     "directdisk-*.direct.bz2")))
> >
> >      @testcase(1266)
> >      def test_compress_xz(self):
> >          """Test compressing an image with xz"""
> >          self.assertEqual(0, runCmd("wic create directdisk "
> > -                                   "--image-name core-image-minimal "
> > -                                   "-c xz").status)
> > -        self.assertEqual(1, len(glob(self.resultdir + \
> > -                                         "directdisk-*.direct.xz")))
> > +                                   "--image-name=core-image-minimal "
> > +                                   "--compress-with=xz").status)
> > +        self.assertEqual(1, len(glob(self.resultdir +
> > +                                     "directdisk-*.direct.xz")))
> >
> >      @testcase(1267)
> >      def test_wrong_compressor(self):
> >          """Test how wic breaks if wrong compressor is provided"""
> >          self.assertEqual(2, runCmd("wic create directdisk "
> > -                                   "--image-name core-image-minimal "
> > +                                   "--image-name=core-image-minimal "
> >                                     "-c wrong",
> > ignore_status=True).status)
> >
> > +    @testcase(1558)
> > +    def test_debug_skip_build_check_and_build_rootfs(self):
> > +        """Test wic debug, skip-build-check and build_rootfs"""
> > +        self.assertEqual(0, runCmd("wic create directdisk "
> > +                                   "--image-name=core-image-minimal "
> > +                                   "-D -s -f").status)
> > +        self.assertEqual(1, len(glob(self.resultdir +
"directdisk-*.direct")))
> > +        self.assertEqual(0, runCmd("wic create directdisk "
> > +                                   "--image-name=core-image-minimal "
> > +                                   "--debug "
> > +                                   "--skip-build-check "
> > +                                   "--build-rootfs").status)
> > +        self.assertEqual(1, len(glob(self.resultdir +
> > + "directdisk-*.direct")))
> > +
> I'd split this to two test cases as they're testing two different options.
Actually, those are three different options (with their short and long
versions). I did this to not add too many test cases, but as you mention,
probably it's better to separate them by option to make it clearer.
> 
> >      @testcase(1268)
> >      def test_rootfs_indirect_recipes(self):
> >          """Test usage of rootfs plugin with rootfs recipes"""
> >          wks = "directdisk-multi-rootfs"
> >          self.assertEqual(0, runCmd("wic create %s "
> > -                                   "--image-name core-image-minimal "
> > +                                   "--image-name=core-image-minimal "
> >                                     "--rootfs rootfs1=core-image-minimal
"
> > -                                   "--rootfs
rootfs2=core-image-minimal" \
> > +                                   "--rootfs
rootfs2=core-image-minimal"
> >                                     % wks).status)
> >          self.assertEqual(1, len(glob(self.resultdir + "%s*.direct" %
> > wks)))
> >
> >      @testcase(1269)
> >      def test_rootfs_artifacts(self):
> >          """Test usage of rootfs plugin with rootfs paths"""
> > -        bbvars = dict((var.lower(), get_bb_var(var,
'core-image-minimal')) \
> > -                        for var in ('STAGING_DATADIR',
'DEPLOY_DIR_IMAGE',
> > -                                    'STAGING_DIR_NATIVE',
'IMAGE_ROOTFS'))
> > +        bbvars = dict((var.lower(), get_bb_var(var,
'core-image-minimal'))
> > +                      for var in ('STAGING_DATADIR',
'DEPLOY_DIR_IMAGE',
> > +                                  'STAGING_DIR_NATIVE',
> > + 'IMAGE_ROOTFS'))
> >          bbvars['wks'] = "directdisk-multi-rootfs"
> >          status = runCmd("wic create %(wks)s "
> > -                        "-b %(staging_datadir)s "
> > -                        "-k %(deploy_dir_image)s "
> > -                        "-n %(staging_dir_native)s "
> > +                        "--bootimg-dir=%(staging_datadir)s "
> > +                        "--kernel-dir=%(deploy_dir_image)s "
> > +                        "--native-sysroot=%(staging_dir_native)s "
> >                          "--rootfs-dir rootfs1=%(image_rootfs)s "
> > -                        "--rootfs-dir rootfs2=%(image_rootfs)s" \
> > +                        "--rootfs-dir rootfs2=%(image_rootfs)s"
> >                          % bbvars).status
> >          self.assertEqual(0, status)
> > -        self.assertEqual(1, len(glob(self.resultdir + \
> > +        self.assertEqual(1, len(glob(self.resultdir +
> >                                       "%(wks)s-*.direct" % bbvars)))
> >
> >      @testcase(1346)
> >      def test_iso_image(self):
> >          """Test creation of hybrid iso image with legacy and EFI
boot"""
> >          self.assertEqual(0, runCmd("wic create mkhybridiso "
> > -                                   "--image-name
core-image-minimal").status)
> > -        self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-
> *.direct")))
> > -        self.assertEqual(1, len(glob(self.resultdir +
"HYBRID_ISO_IMG-*.iso")))
> > +                                   "--image-name core-image-minimal"
> > +                                   ).status)
> This is less readable. Is this only to fit the line into 80 chars?
> If so, let's not do it. Lines up to 100 chars long are more readable than
this I
> believe.
I changed it to conform to PEP8 and increase readability on editors adjusted
to 80 chars. However, if you consider it's better to leave it on 100 chars,
I could work within that.
> 
> > +        self.assertEqual(1, len(glob(self.resultdir +
> > +                                     "HYBRID_ISO_IMG-*.direct")))
> > +        self.assertEqual(1, len(glob(self.resultdir +
> > +                                     "HYBRID_ISO_IMG-*.iso")))
> > +
> The same thing. Full lines from previous code are more readable.
> 
> > +    def __get_image_env_path(self, image):
> Do you really need this to be mangled? one underscore should be enough.
Agreed, I'll change it.
> 
> > +        """Generate and obtain the path to <image>.env"""
> > +        self.assertEqual(0, bitbake('%s -c do_rootfs_wicenv' %
image).status)
> > +        stdir = get_bb_var('STAGING_DIR_TARGET', image)
> > +        imgdatadir = os.path.join(stdir, 'imgdata')
> > +        return imgdatadir
> Can we cache results here? This would speed up testing I guess.
> Something like this should be ok:
> 
> if image not in self.wicenv_cache:
>     self.assertEqual(0, bitbake('%s -c do_rootfs_wicenv' %
> image).status)
>     stdir = get_bb_var('STAGING_DIR_TARGET', image)
>     self.wicenv_cache[image] = os.path.join(stdir, 'imgdata')
> 
> return self.wicenv_cache[image]
Agreed, thanks. I'll try your suggestion.
> 
> >
> >      @testcase(1347)
> >      def test_image_env(self):
> > -        """Test generation of <image>.env files."""
> > +        """Test generation of <image>.env files"""
> >          image = 'core-image-minimal'
> > -        self.assertEqual(0, bitbake('%s -c do_rootfs_wicenv' %
image).status)
> > -        stdir = get_bb_var('STAGING_DIR_TARGET', image)
> > -        imgdatadir = os.path.join(stdir, 'imgdata')
> > +        imgdatadir = self.__get_image_env_path(image)
> >
> >          basename = get_bb_var('IMAGE_BASENAME', image)
> >          self.assertEqual(basename, image) @@ -220,6 +278,21 @@ class
> > Wic(oeSelfTest):
> >                  self.assertTrue(var in content, "%s is not in .env
file" % var)
> >                  self.assertTrue(content[var])
> >
> > +    @testcase(1559)
> > +    def test_image_vars_dir(self):
> > +        """Test image vars directory selection"""
> > +        image = 'core-image-minimal'
> > +        imgenvdir = self.__get_image_env_path(image)
> > +
> > +        self.assertEqual(0, runCmd("wic create directdisk "
> > +                                   "--image-name=%s "
> > +                                   "-v %s"
> > +                                   % (image, imgenvdir)).status)
> > +        self.assertEqual(0, runCmd("wic create directdisk "
> > +                                   "--image-name=%s "
> > +                                   "--vars %s"
> > +                                   % (image, imgenvdir)).status)
> > +
> Do we really want to test short and long variant of options?
> If so, we should do it for all options.
Within the module, all short and long variant of options are tested. Not all
combinations of long variants with '=' and without it are tested, though.
> 
> >      @testcase(1351)
> >      def test_wic_image_type(self):
> >          """Test building wic images by bitbake"""
> > @@ -239,7 +312,7 @@ class Wic(oeSelfTest):
> >      def test_qemux86_directdisk(self):
> >          """Test creation of qemux-86-directdisk image"""
> >          image = "qemux86-directdisk"
> > -        self.assertEqual(0, runCmd("wic create %s -e
core-image-minimal" \
> > +        self.assertEqual(0, runCmd("wic create %s -e
core-image-minimal"
> >                                     % image).status)
> >          self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" %
> > image)))
> >
> > @@ -247,7 +320,8 @@ class Wic(oeSelfTest):
> >      def test_mkgummidisk(self):
> >          """Test creation of mkgummidisk image"""
> >          image = "mkgummidisk"
> > -        self.assertEqual(0, runCmd("wic create %s -e
core-image-minimal" \
> > +        self.assertEqual(0, runCmd("wic create %s --image-name "
> > +                                   "core-image-minimal"
> >                                     % image).status)
> >          self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" %
> > image)))
> 
> I agree, this doesn't look good. How about dropping 'image' variable in
this
> and similar test cases?
> 
> cmd = "wic create mkgummidisk --image-name core-image-minimal"
> self.assertEqual(0, runCmd(cmd).status)
> 
> self.assertEqual(1, len(glob(self.resultdir + "mkgummidisk-*direct")))
> 
Agreed.
> > @@ -255,7 +329,7 @@ class Wic(oeSelfTest):
> >      def test_mkefidisk(self):
> >          """Test creation of mkefidisk image"""
> >          image = "mkefidisk"
> > -        self.assertEqual(0, runCmd("wic create %s -e
core-image-minimal" \
> > +        self.assertEqual(0, runCmd("wic create %s -e
core-image-minimal"
> >                                     % image).status)
> >          self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" %
> > image)))
> >
> > @@ -263,11 +337,11 @@ class Wic(oeSelfTest):
> >      def test_directdisk_bootloader_config(self):
> >          """Test creation of directdisk-bootloader-config image"""
> >          image = "directdisk-bootloader-config"
> > -        self.assertEqual(0, runCmd("wic create %s -e
core-image-minimal" \
> > +        self.assertEqual(0, runCmd("wic create %s -e
core-image-minimal"
> >                                     % image).status)
> >          self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" %
> > image)))
> >
> > -    @testcase(1422)
> > +    @testcase(1424)
> >      def test_qemu(self):
> >          """Test wic-image-minimal under qemu"""
> >          self.assertEqual(0, bitbake('wic-image-minimal').status)
> > @@ -275,28 +349,56 @@ class Wic(oeSelfTest):
> >          with runqemu('wic-image-minimal', ssh=False) as qemu:
> >              command = "mount |grep '^/dev/' | cut -f1,3 -d ' '"
> >              status, output = qemu.run_serial(command)
> > -            self.assertEqual(1, status, 'Failed to run command "%s":
%s' %
> (command, output))
> > +            self.assertEqual(1, status, 'Failed to run command "%s":
%s'
> > +                                        % (command, output))
> less readable
Same, PEP8, but I may change it to 100 chars instead.
> 
> >              self.assertEqual(output, '/dev/root /\r\n/dev/vda3 /mnt')
> >
> > +    @testcase(1496)
> >      def test_bmap(self):
> >          """Test generation of .bmap file"""
> >          image = "directdisk"
> > -        status = runCmd("wic create %s -e core-image-minimal --bmap" %
> image).status
> > +        status = runCmd("wic create %s -e core-image-minimal -m"
> > +                        % image).status
> less readable. --bmap is better to use here than -m.
Same, PEP8, but I may change it to 100 chars instead. Using -m and --bmap in
different test cases to increase coverage.
> 
> > +        self.assertEqual(0, status)
> > +        self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" %
image)))
> > +        self.assertEqual(1, len(glob(self.resultdir +
> > +                                     "%s-*direct.bmap" % image)))
> > +        status = runCmd("wic create %s -e core-image-minimal --bmap"
> > +                        % image).status
> >          self.assertEqual(0, status)
> >          self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" %
image)))
> > -        self.assertEqual(1, len(glob(self.resultdir + "%s-*direct.bmap"
%
> image)))
> > +        self.assertEqual(1, len(glob(self.resultdir + "%s-*direct.bmap"
> > +                                                      % image)))
> >
> > +    @testcase(1560)
> >      def test_systemd_bootdisk(self):
> >          """Test creation of systemd-bootdisk image"""
> >          image = "systemd-bootdisk"
> > -        self.assertEqual(0, runCmd("wic create %s -e
core-image-minimal" \
> > +        self.assertEqual(0, runCmd("wic create %s -e
core-image-minimal"
> >                                     % image).status)
> >          self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" %
> > image)))
> >
> > +    @testcase(1561)
> >      def test_sdimage_bootpart(self):
> >          """Test creation of sdimage-bootpart image"""
> >          image = "sdimage-bootpart"
> >          self.write_config('IMAGE_BOOT_FILES = "bzImage"\n')
> > -        self.assertEqual(0, runCmd("wic create %s -e
core-image-minimal" \
> > +        self.assertEqual(0, runCmd("wic create %s -e
core-image-minimal"
> >                                     % image).status)
> the same thing - it doesn't worth it to please PEP8 if it reduces code
> readability.
Same, PEP8, but I may change it to 100 chars instead.
> 
> >          self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" %
> > image)))
> > +
> > +    @testcase(1562)
> > +    def test_alternate_output_dir(self):
> > +        """Test alternate output directory"""
> > +        self.assertEqual(0, runCmd("wic create directdisk "
> > +                                   "-e core-image-minimal "
> > +                                   "-o %s"
> > +                                   % self.alternate_resultdir).status)
> > +        self.assertEqual(1, len(glob(self.alternate_resultdir +
> > +                                     "build/directdisk-*.direct")))
> > +        self.assertEqual(0, runCmd("wic create mkefidisk -e "
> > +                                   "core-image-minimal "
> > +                                   "--outdir %s"
> > +                                   % self.alternate_resultdir).status)
> > +        self.assertEqual(1, len(glob(self.alternate_resultdir +
> > +                                     "build/mkefidisk-*direct")))
> Would one test be enough?
I'm using both output option variants to increase coverage.
> 
> BTW, did you measure how long does the test run before and after your
> changes? We should be careful here as this test runs on ab and makes
people
> wait longer for results.
Agreed. I didn't do it, but I'll measure it and take it into account for my
next update.
> 
> --
> Regards,
> Ed

Regards,
Jair


