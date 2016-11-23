Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id B0EE171A84
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 11:24:30 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 23 Nov 2016 03:24:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,537,1473145200"; d="scan'208";a="904702284"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 23 Nov 2016 03:24:31 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id D146F6A4006;
	Wed, 23 Nov 2016 03:23:48 -0800 (PST)
Date: Wed, 23 Nov 2016 13:23:56 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Maciej Borzecki <maciej.borzecki@rndity.com>
Message-ID: <20161123112356.GA12545@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <cover.1479887010.git.maciej.borzecki@rndity.com>
	<fd75ccfd4bbd3420f72b32c815feb92b06b2b9fb.1479887010.git.maciej.borzecki@rndity.com>
MIME-Version: 1.0
In-Reply-To: <fd75ccfd4bbd3420f72b32c815feb92b06b2b9fb.1479887010.git.maciej.borzecki@rndity.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4 5/7] wic: selftest: do not repeat core-image-minimal
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
X-List-Received-Date: Wed, 23 Nov 2016 11:24:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 23, 2016 at 08:46:31AM +0100, Maciej Borzecki wrote:
> Replace repeated core-image-minimal with Wic class field.
> 
> Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
> ---
>  meta/lib/oeqa/selftest/wic.py | 111 +++++++++++++++++++++++++++---------------
>  1 file changed, 73 insertions(+), 38 deletions(-)
> 
> diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
> index 2db14445956bc5adcf1e755844bbdb69edcb468f..37ed2c6de5a7f22f982f921476fa392304995b2e 100644
> --- a/meta/lib/oeqa/selftest/wic.py
> +++ b/meta/lib/oeqa/selftest/wic.py
> @@ -57,6 +57,8 @@ class Wic(oeSelfTest):
>      resultdir = "/var/tmp/wic/build/"
>      image_is_ready = False
>  
> +    OE_IMAGE = "core-image-minimal"
> +
>      def setUpLocal(self):
>          """This code is executed before each test method."""
>          arch = get_bb_var('HOST_ARCH', 'core-image-minimal')
> @@ -75,7 +77,7 @@ class Wic(oeSelfTest):
>                  tools += ' syslinux syslinux-native'
>              bitbake(tools)
>  
> -            bitbake('core-image-minimal')
> +            bitbake(self.OE_IMAGE)
>              Wic.image_is_ready = True
I'd agree with Ross here - it looks less readable.
How it would look if we decide to add test case for another image?

>  
>          rmtree(self.resultdir, ignore_errors=True)
> @@ -100,14 +102,14 @@ class Wic(oeSelfTest):
>      def test_build_image_name(self):
>          """Test wic create directdisk --image-name core-image-minimal"""
>          self.assertEqual(0, runCmd("wic create directdisk "
> -                                   "--image-name core-image-minimal").status)
> +                                   "--image-name %s" % self.OE_IMAGE).status)
>          self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
>  
>      @testcase(1212)
>      @onlyForArch('i586', 'i686', 'x86_64')
>      def test_build_artifacts(self):
>          """Test wic create directdisk providing all artifacts."""
> -        bbvars = dict((var.lower(), get_bb_var(var, 'core-image-minimal')) \
> +        bbvars = dict((var.lower(), get_bb_var(var, self.OE_IMAGE)) \
>                          for var in ('STAGING_DATADIR', 'DEPLOY_DIR_IMAGE',
>                                      'STAGING_DIR_NATIVE', 'IMAGE_ROOTFS'))
>          status = runCmd("wic create directdisk "
> @@ -123,7 +125,7 @@ class Wic(oeSelfTest):
>      def test_gpt_image(self):
>          """Test creation of core-image-minimal with gpt table and UUID boot"""
>          self.assertEqual(0, runCmd("wic create directdisk-gpt "
> -                                   "--image-name core-image-minimal").status)
> +                                   "--image-name %s" % self.OE_IMAGE).status)
>          self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
>  
>      @testcase(1213)
> @@ -157,8 +159,8 @@ class Wic(oeSelfTest):
>      def test_compress_gzip(self):
>          """Test compressing an image with gzip"""
>          self.assertEqual(0, runCmd("wic create directdisk "
> -                                   "--image-name core-image-minimal "
> -                                   "-c gzip").status)
> +                                   "--image-name %s "
> +                                   "-c gzip" % self.OE_IMAGE).status)
>          self.assertEqual(1, len(glob(self.resultdir + \
>                                           "directdisk-*.direct.gz")))
>  
> @@ -167,8 +169,8 @@ class Wic(oeSelfTest):
>      def test_compress_bzip2(self):
>          """Test compressing an image with bzip2"""
>          self.assertEqual(0, runCmd("wic create directdisk "
> -                                   "--image-name core-image-minimal "
> -                                   "-c bzip2").status)
> +                                   "--image-name %s "
> +                                   "-c bzip2" % self.OE_IMAGE).status)
>          self.assertEqual(1, len(glob(self.resultdir + \
>                                           "directdisk-*.direct.bz2")))
>  
> @@ -177,8 +179,8 @@ class Wic(oeSelfTest):
>      def test_compress_xz(self):
>          """Test compressing an image with xz"""
>          self.assertEqual(0, runCmd("wic create directdisk "
> -                                   "--image-name core-image-minimal "
> -                                   "-c xz").status)
> +                                   "--image-name %s "
> +                                   "-c xz" % self.OE_IMAGE).status)
>          self.assertEqual(1, len(glob(self.resultdir + \
>                                           "directdisk-*.direct.xz")))
>  
> @@ -187,26 +189,31 @@ class Wic(oeSelfTest):
>      def test_wrong_compressor(self):
>          """Test how wic breaks if wrong compressor is provided"""
>          self.assertEqual(2, runCmd("wic create directdisk "
> -                                   "--image-name core-image-minimal "
> -                                   "-c wrong", ignore_status=True).status)
> +                                   "--image-name %s "
> +                                   "-c wrong" % self.OE_IMAGE,
> +                                   ignore_status=True).status)
>  
>      @testcase(1268)
>      @onlyForArch('i586', 'i686', 'x86_64')
>      def test_rootfs_indirect_recipes(self):
>          """Test usage of rootfs plugin with rootfs recipes"""
>          wks = "directdisk-multi-rootfs"
> -        self.assertEqual(0, runCmd("wic create %s "
> -                                   "--image-name core-image-minimal "
> -                                   "--rootfs rootfs1=core-image-minimal "
> -                                   "--rootfs rootfs2=core-image-minimal" \
> -                                   % wks).status)
> +        wic_cmd_vars = {
> +            'wks': wks,
> +            'image': self.OE_IMAGE,
> +        }
> +        self.assertEqual(0, runCmd("wic create %(wks)s "
> +                                   "--image-name %(image)s "
> +                                   "--rootfs rootfs1=%(image)s "
> +                                   "--rootfs rootfs2=%(image)s" \
> +                                   % wic_cmd_vars).status)
>          self.assertEqual(1, len(glob(self.resultdir + "%s*.direct" % wks)))
>  
>      @testcase(1269)
>      @onlyForArch('i586', 'i686', 'x86_64')
>      def test_rootfs_artifacts(self):
>          """Test usage of rootfs plugin with rootfs paths"""
> -        bbvars = dict((var.lower(), get_bb_var(var, 'core-image-minimal')) \
> +        bbvars = dict((var.lower(), get_bb_var(var, self.OE_IMAGE)) \
>                          for var in ('STAGING_DATADIR', 'DEPLOY_DIR_IMAGE',
>                                      'STAGING_DIR_NATIVE', 'IMAGE_ROOTFS'))
>          bbvars['wks'] = "directdisk-multi-rootfs"
> @@ -226,24 +233,23 @@ class Wic(oeSelfTest):
>      def test_iso_image(self):
>          """Test creation of hybrid iso image with legacy and EFI boot"""
>          self.assertEqual(0, runCmd("wic create mkhybridiso "
> -                                   "--image-name core-image-minimal").status)
> +                                   "--image-name %s" % self.OE_IMAGE).status)
>          self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.direct")))
>          self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.iso")))
>  
>      @testcase(1347)
>      def test_image_env(self):
>          """Test generation of <image>.env files."""
> -        image = 'core-image-minimal'
> -        self.assertEqual(0, bitbake('%s -c do_rootfs_wicenv' % image).status)
> -        stdir = get_bb_var('STAGING_DIR_TARGET', image)
> +        self.assertEqual(0, bitbake('%s -c do_rootfs_wicenv' % self.OE_IMAGE).status)
> +        stdir = get_bb_var('STAGING_DIR_TARGET', self.OE_IMAGE)
>          imgdatadir = os.path.join(stdir, 'imgdata')
>  
> -        basename = get_bb_var('IMAGE_BASENAME', image)
> -        self.assertEqual(basename, image)
> +        basename = get_bb_var('IMAGE_BASENAME', self.OE_IMAGE)
> +        self.assertEqual(basename, self.OE_IMAGE)
>          path = os.path.join(imgdatadir, basename) + '.env'
>          self.assertTrue(os.path.isfile(path))
>  
> -        wicvars = set(get_bb_var('WICVARS', image).split())
> +        wicvars = set(get_bb_var('WICVARS', self.OE_IMAGE).split())
>          # filter out optional variables
>          wicvars = wicvars.difference(('HDDDIR', 'IMAGE_BOOT_FILES',
>                                        'INITRD', 'ISODIR'))
> @@ -275,8 +281,12 @@ class Wic(oeSelfTest):
>      def test_qemux86_directdisk(self):
>          """Test creation of qemux-86-directdisk image"""
>          image = "qemux86-directdisk"
> -        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
> -                                   % image).status)
> +        wic_cmd_vars = {
> +            'wks': image,
> +            'image': self.OE_IMAGE,
> +        }
> +        self.assertEqual(0, runCmd("wic create %(wks)s -e %(image)s" \
> +                                   % wic_cmd_vars).status)
>          self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
>  
>      @testcase(1349)
> @@ -284,8 +294,12 @@ class Wic(oeSelfTest):
>      def test_mkgummidisk(self):
>          """Test creation of mkgummidisk image"""
>          image = "mkgummidisk"
> -        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
> -                                   % image).status)
> +        wic_cmd_vars = {
> +            'wks': image,
> +            'image': self.OE_IMAGE,
> +        }
> +        self.assertEqual(0, runCmd("wic create %(wks)s -e %(image)s" \
> +                                   % wic_cmd_vars).status)
>          self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
>  
>      @testcase(1350)
> @@ -293,8 +307,12 @@ class Wic(oeSelfTest):
>      def test_mkefidisk(self):
>          """Test creation of mkefidisk image"""
>          image = "mkefidisk"
> -        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
> -                                   % image).status)
> +        wic_cmd_vars = {
> +            'wks': image,
> +            'image': self.OE_IMAGE,
> +        }
> +        self.assertEqual(0, runCmd("wic create %(wks)s -e %(image)s" \
> +                                   % wic_cmd_vars).status)
>          self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
>  
>      @testcase(1385)
> @@ -302,8 +320,12 @@ class Wic(oeSelfTest):
>      def test_directdisk_bootloader_config(self):
>          """Test creation of directdisk-bootloader-config image"""
>          image = "directdisk-bootloader-config"
> -        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
> -                                   % image).status)
> +        wic_cmd_vars = {
> +            'wks': image,
> +            'image': self.OE_IMAGE,
> +        }
> +        self.assertEqual(0, runCmd("wic create %(wks)s -e %(image)s" \
> +                                   % wic_cmd_vars).status)
>          self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
>  
>      @testcase(1422)
> @@ -322,7 +344,12 @@ class Wic(oeSelfTest):
>      def test_bmap(self):
>          """Test generation of .bmap file"""
>          image = "directdisk"
> -        status = runCmd("wic create %s -e core-image-minimal --bmap" % image).status
> +        wic_cmd_vars = {
> +            'wks': image,
> +            'image': self.OE_IMAGE,
> +        }
> +        status = runCmd("wic create %(wks)s -e %(image)s --bmap" \
> +                        % wic_cmd_vars).status
>          self.assertEqual(0, status)
>          self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
>          self.assertEqual(1, len(glob(self.resultdir + "%s-*direct.bmap" % image)))
> @@ -331,14 +358,22 @@ class Wic(oeSelfTest):
>      def test_systemd_bootdisk(self):
>          """Test creation of systemd-bootdisk image"""
>          image = "systemd-bootdisk"
> -        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
> -                                   % image).status)
> +        wic_cmd_vars = {
> +            'wks': image,
> +            'image': self.OE_IMAGE,
> +        }
> +        self.assertEqual(0, runCmd("wic create %(wks)s -e %(image)s" \
> +                                   % wic_cmd_vars).status)
>          self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
>  
>      def test_sdimage_bootpart(self):
>          """Test creation of sdimage-bootpart image"""
>          image = "sdimage-bootpart"
>          self.write_config('IMAGE_BOOT_FILES = "bzImage"\n')
> -        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
> -                                   % image).status)
> +        wic_cmd_vars = {
> +            'wks': image,
> +            'image': self.OE_IMAGE,
> +        }
> +        self.assertEqual(0, runCmd("wic create %(wks)s -e %(image)s" \
> +                                   % wic_cmd_vars).status)
>          self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
> -- 
> 2.5.0
> 

-- 
--
Regards,
Ed

