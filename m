Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BDAD671AB6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 11:36:55 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP; 23 Nov 2016 03:36:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,538,1473145200"; d="scan'208";a="34699286"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 23 Nov 2016 03:36:38 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 86C8A6A4006;
	Wed, 23 Nov 2016 03:35:55 -0800 (PST)
Date: Wed, 23 Nov 2016 13:36:30 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Maciej Borzecki <maciej.borzecki@rndity.com>
Message-ID: <20161123113630.GB12545@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <cover.1479887010.git.maciej.borzecki@rndity.com>
	<7c765b6d3940a7b7dc9daeb32f712809a4b5464e.1479887010.git.maciej.borzecki@rndity.com>
MIME-Version: 1.0
In-Reply-To: <7c765b6d3940a7b7dc9daeb32f712809a4b5464e.1479887010.git.maciej.borzecki@rndity.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4 7/7] wic: selftest: add tests for --fixed-size partition flags
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
X-List-Received-Date: Wed, 23 Nov 2016 11:36:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Maciej,

Thank you for the patchset!
The changes and the tests look good to me.
I have little suggestions, but most of them just a matter of taste, so
feel free to ignore them.

On Wed, Nov 23, 2016 at 08:46:33AM +0100, Maciej Borzecki wrote:
> wic has a new flag for setting a fixed parition size --fixed-size. Add
> tests that verify if partition is indeed sized properly and that errors
> are signaled when there is not enough space to fit partition data.
> 
> Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
> ---
>  meta/lib/oeqa/selftest/wic.py | 69 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 
> diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
> index ad783043b92130a023fd70120becec479c6253a7..45f68df1e74828e11401f57dd732a88a50dd1f00 100644
> --- a/meta/lib/oeqa/selftest/wic.py
> +++ b/meta/lib/oeqa/selftest/wic.py
> @@ -29,6 +29,7 @@ import unittest
>  from glob import glob
>  from shutil import rmtree
>  from functools import wraps
> +from tempfile import NamedTemporaryFile
>  
>  from oeqa.selftest.base import oeSelfTest
>  from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
> @@ -61,6 +62,8 @@ class Wic(oeSelfTest):
>  
>      def setUpLocal(self):
>          """This code is executed before each test method."""
> +        self.native_sysroot = get_bb_var('STAGING_DIR_NATIVE', 'core-image-minimal')
> +
>          arch = get_bb_var('HOST_ARCH', 'core-image-minimal')
>          is_x86 = arch in ['i586', 'i686', 'x86_64']
>          if is_x86:
> @@ -378,3 +381,69 @@ class Wic(oeSelfTest):
>          self.assertEqual(0, runCmd("wic create %(wks)s -e %(image)s" \
>                                     % wic_cmd_vars).status)
>          self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
> +
> +    def _make_fixed_size_wks(self, size):
> +        """
> +        Create a wks of an image with a single partition. Size of the partition is set
> +        using --fixed-size flag. Returns a tuple: (path to wks file, wks image name)
> +        """
> +        with NamedTemporaryFile("w", suffix=".wks", delete=False) as tf:
> +            wkspath = tf.name
> +            tf.write("part " \
> +                     "--source rootfs --ondisk hda --align 4 --fixed-size %d "
> +                     "--fstype=ext4\n" % size)
> +        wksname = os.path.splitext(os.path.basename(wkspath))[0]
> +
> +        return (wkspath, wksname)
Would 'return wkspath, wksname' be a bit more readable?

> +
> +    def test_fixed_size(self):
> +        """
> +        Test creation of a simple image with partition size controlled through
> +        --fixed-size flag
> +        """
> +        wkspath, wksname = self._make_fixed_size_wks(200)
> +
> +        wic_cmd_vars = {
> +            'wks': wkspath,
> +            'image': self.OE_IMAGE,
> +        }
> +        self.assertEqual(0, runCmd("wic create %(wks)s -e %(image)s" \
> +                                   % wic_cmd_vars).status)
> +        os.remove(wkspath)
> +        wicout = glob(self.resultdir + "%s-*direct" % wksname)
> +        self.assertEqual(1, len(wicout))
> +
> +        wicimg = wicout[0]
> +
> +        # verify partition size with wic
> +        res = runCmd("parted -m %s unit mib p 2>/dev/null" % wicimg,
> +                     ignore_status=True,
> +                     native_sysroot=self.native_sysroot)
> +        self.assertEqual(0, res.status)
> +
> +        # parse parted output which looks like this:
> +        # BYT;\n
> +        # /var/tmp/wic/build/tmpfwvjjkf_-201611101222-hda.direct:200MiB:file:512:512:msdos::;\n
> +        # 1:0.00MiB:200MiB:200MiB:ext4::;\n
> +        partlns = res.output.splitlines()[2:]
> +
> +        self.assertEqual(1, len(partlns))
> +        self.assertEqual("1:0.00MiB:200MiB:200MiB:ext4::;", partlns[0])
> +
> +    def test_fixed_size_error(self):
> +        """
> +        Test creation of a simple image with partition size controlled through
> +        --fixed-size flag. The size of partition is intentionally set to 1MiB
> +        in order to trigger an error in wic.
> +        """
> +        wkspath, wksname = self._make_fixed_size_wks(1)
> +
> +        wic_cmd_vars = {
> +            'wks': wkspath,
> +            'image': self.OE_IMAGE,
> +        }
> +        self.assertEqual(1, runCmd("wic create %(wks)s -e %(image)s" \
> +                                   % wic_cmd_vars, ignore_status=True).status)
> +        os.remove(wkspath)
> +        wicout = glob(self.resultdir + "%s-*direct" % wksname)
> +        self.assertEqual(0, len(wicout))

--
Regards,
Ed

