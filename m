Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 217F760017
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2016 14:44:35 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP; 16 Dec 2016 06:44:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,358,1477983600"; d="scan'208";a="43278381"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 16 Dec 2016 06:44:37 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id C77DD6A4080;
	Fri, 16 Dec 2016 06:43:47 -0800 (PST)
Date: Fri, 16 Dec 2016 16:44:23 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <20161216144423.GB6398@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <20161128111825.GA16035@linux.intel.com>
	<1481732934-5128-1-git-send-email-kristian.amlie@mender.io>
	<1481732934-5128-4-git-send-email-kristian.amlie@mender.io>
MIME-Version: 1.0
In-Reply-To: <1481732934-5128-4-git-send-email-kristian.amlie@mender.io>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 3/3] selftest/wic: Add tests for --exclude-dir option.
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
X-List-Received-Date: Fri, 16 Dec 2016 14:44:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 14, 2016 at 05:28:54PM +0100, Kristian Amlie wrote:
> Based partially on an earlier patch by Maciej Borzecki.
> 
> Signed-off-by: Kristian Amlie <kristian.amlie@mender.io>
> ---
>  meta/lib/oeqa/selftest/wic.py | 106 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 105 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
> index faac11e..b2b0fe8 100644
> --- a/meta/lib/oeqa/selftest/wic.py
> +++ b/meta/lib/oeqa/selftest/wic.py
> @@ -49,7 +49,8 @@ class Wic(oeSelfTest):
>          # setUpClass being unavailable.
>          if not Wic.image_is_ready:
>              bitbake('syslinux syslinux-native parted-native gptfdisk-native '
> -                    'dosfstools-native mtools-native bmap-tools-native')
> +                    'dosfstools-native mtools-native bmap-tools-native '
> +                    'e2tools-native')
>              bitbake('core-image-minimal')
>              Wic.image_is_ready = True
>  
> @@ -299,3 +300,106 @@ class Wic(oeSelfTest):
>          self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
>                                     % image).status)
>          self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
> +
> +    def test_exclude_path(self):
> +        """Test --exclude-path wks option."""
> +
> +        # For using 'e2ls'.
> +        old_path = os.environ['PATH']
> +        os.environ['PATH'] = get_bb_var('PATH', 'core-image-minimal')
> +
> +        wks_file = 'temp.wks'
> +        ks = open(wks_file, 'w')
I'd use more pythonic 'with open(wks_file, 'w') as wks:' here.

> +        rootfs_dir = get_bb_var('IMAGE_ROOTFS', 'core-image-minimal')
> +        ks.write("""part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path usr
> +part /usr --source rootfs --ondisk mmcblk0 --fstype=ext4 --rootfs-dir %s/usr
> +part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --rootfs-dir %s/usr"""
> +                 % (rootfs_dir, rootfs_dir))
> +        ks.close()
> +        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
> +                                   % wks_file).status)
> +
> +        os.remove(wks_file)
> +        wicout = glob(self.resultdir + "%s-*direct" % 'temp')
> +        self.assertEqual(1, len(wicout))
> +
> +        wicimg = wicout[0]
> +
> +        # verify partition size with wic
> +        res = runCmd("parted -m %s unit b p 2>/dev/null" % wicimg)
> +        self.assertEqual(0, res.status)
> +
> +        # parse parted output which looks like this:
> +        # BYT;\n
> +        # /var/tmp/wic/build/tmpfwvjjkf_-201611101222-hda.direct:200MiB:file:512:512:msdos::;\n
> +        # 1:0.00MiB:200MiB:200MiB:ext4::;\n
> +        partlns = res.output.splitlines()[2:]
> +
> +        self.assertEqual(3, len(partlns))
> +
> +        for part in [1, 2, 3]:
> +            part_file = os.path.join(self.resultdir, "selftest_img.part%d" % part)
> +            partln = partlns[part-1].split(":")
> +            self.assertEqual(7, len(partln))
> +            start = int(partln[1].rstrip("B")) / 512
> +            length = int(partln[3].rstrip("B")) / 512
> +            self.assertEqual(0, runCmd("dd if=%s of=%s skip=%d count=%d" %
> +                                       (wicimg, part_file, start, length)).status)
> +
> +        # Test partition 1, should contain the normal root directories, except
> +        # /usr.
> +        res = runCmd("e2ls %s" % os.path.join(self.resultdir, "selftest_img.part1"))
> +        self.assertEqual(0, res.status)
> +        files = res.output.split()
> +        self.assertIn("etc", files)
> +        self.assertNotIn("usr", files)
> +
> +        # Partition 2, should contain common directories for /usr, not root
> +        # directories.
> +        res = runCmd("e2ls %s" % os.path.join(self.resultdir, "selftest_img.part2"))
> +        self.assertEqual(0, res.status)
> +        files = res.output.split()
> +        self.assertNotIn("etc", files)
> +        self.assertNotIn("usr", files)
> +        self.assertIn("share", files)
> +
> +        # Partition 3, should contain the same as partition 2, including the bin
> +        # directory, but not the files inside it.
> +        res = runCmd("e2ls %s" % os.path.join(self.resultdir, "selftest_img.part3"))
> +        self.assertEqual(0, res.status)
> +        files = res.output.split()
> +        self.assertNotIn("etc", files)
> +        self.assertNotIn("usr", files)
> +        self.assertIn("share", files)
> +        self.assertIn("bin", files)
> +        res = runCmd("e2ls %s:bin" % os.path.join(self.resultdir, "selftest_img.part3"))
> +        self.assertEqual(0, res.status)
> +        self.assertEqual("No files found!", res.output.strip())
> +
> +        for part in [1, 2, 3]:
> +            part_file = os.path.join(self.resultdir, "selftest_img.part%d" % part)
> +            os.remove(part_file)
> +
> +        os.environ['PATH'] = old_path
> +
> +    def test_exclude_path_errors(self):
> +        """Test --exclude-path wks option error handling."""
> +        wks_file = 'temp.wks'
> +
> +        rootfs_dir = get_bb_var('IMAGE_ROOTFS', 'core-image-minimal')
> +
> +        # Absolute argument.
> +        ks = open(wks_file, 'w')
and here
> +        ks.write("part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path /usr")
> +        ks.close()
> +        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal" \
> +                                      % wks_file, ignore_status=True).status)
> +        os.remove(wks_file)
> +
> +        # Argument pointing to parent directory.
> +        ks = open(wks_file, 'w')
and here
> +        ks.write("part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path ././..")
> +        ks.close()
> +        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal" \
> +                                      % wks_file, ignore_status=True).status)
> +        os.remove(wks_file)

--
Regards,
Ed

