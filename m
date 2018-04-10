Return-Path: <anuj.mittal@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 281D7746BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 07:00:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Apr 2018 00:00:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,431,1517904000"; d="scan'208";a="44919741"
Received: from anmitta2-mobl1.png.intel.com (HELO [10.221.20.111])
	([10.221.20.111])
	by fmsmga004.fm.intel.com with ESMTP; 10 Apr 2018 00:00:43 -0700
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1523295825-118054-1-git-send-email-ee.peng.yeoh@intel.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <6ac3ac3c-2167-0002-9825-09277f5c103f@intel.com>
Date: Tue, 10 Apr 2018 15:00:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1523295825-118054-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: Re: [PATCH] oe-selftest: runqemu: add tests for qemu boot and shutdown
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
X-List-Received-Date: Tue, 10 Apr 2018 07:00:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/10/2018 01:43 AM, Yeoh Ee Peng wrote:
> QA team were testing qemu boot image and shutdown on each
> qemu architecture manually. Add automated test to test qemu boot on
> ext4 and nfs, finally check that it can shutdown properly.
> 
> Original runqemu tests was dedicated for MACHINE=qemux86-64 and
> it was testing various live image (iso and hddimg) will be able
> to boot while live image was not supported on all qemu architecture.
> 
> The new tests were designed as a separate class as this tests
> focus on testing qemu boot and shutdown on each qemu architecture.
> Furthermore, this tests focus on testing qemu could shutdown
> as expected.
> 
> Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
> ---
>  meta/lib/oeqa/selftest/cases/runqemu.py | 61 +++++++++++++++++++++++++++++++--
>  1 file changed, 59 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
> index 47d41f5..7288ab2 100644
> --- a/meta/lib/oeqa/selftest/cases/runqemu.py
> +++ b/meta/lib/oeqa/selftest/cases/runqemu.py
> @@ -3,9 +3,10 @@
>  #
>  
>  import re
> -
> +import tempfile
> +import time
>  from oeqa.selftest.case import OESelftestTestCase
> -from oeqa.utils.commands import bitbake, runqemu, get_bb_var
> +from oeqa.utils.commands import bitbake, runqemu, get_bb_var, runCmd
>  from oeqa.core.decorator.oeid import OETestID
>  
>  class RunqemuTests(OESelftestTestCase):
> @@ -136,3 +137,59 @@ SYSLINUX_TIMEOUT = "10"
>          cmd = "%s %s" % (self.cmd_common, rootfs)
>          with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
>              self.assertTrue(qemu.runner.logged, "Failed: %s" % cmd)
> +
> +class QemuTest(OESelftestTestCase):
> +
> +    @classmethod
> +    def setUpClass(cls):
> +        super(QemuTest, cls).setUpClass()
> +        cls.recipe = 'core-image-minimal'
> +        cls.machine =  get_bb_var('MACHINE')
> +        cls.deploy_dir_image =  get_bb_var('DEPLOY_DIR_IMAGE')
> +        cls.cmd_common = "runqemu nographic"
> +        cls.qemuboot_conf = "%s-%s.qemuboot.conf" % (cls.recipe, cls.machine)
> +        cls.qemuboot_conf = os.path.join(cls.deploy_dir_image, cls.qemuboot_conf)
> +        result = bitbake(cls.recipe)

This 'result' isn't used.

> +
> +    def _start_qemu_shutdown_check_if_shutdown_succeeded(self, qemu, timeout):
> +        status, output = qemu.run_serial("shutdown -h now")
> +        qemu.runner.stop_thread()

If you call stop_thread like this, this test will probably always pass?
Please check the value of output and then is_alive/check().

> +        print('DEBUG: shutdown and stop thread')
> +        time_track = 0
> +        while True:
> +            is_alive = qemu.check()
> +            if not is_alive:
> +                return True
> +            if time_track > timeout:
> +                return False
> +            time.sleep(1)
> +            time_track += 1
> +            print(time_track)

We shouldn't be printing these values.

> +
> +    def test_qemu_can_shutdown(self):
> +        if not os.path.exists(self.qemuboot_conf):
> +            self.skipTest("%s not found" % self.qemuboot_conf)
> +        cmd = "%s %s" % (self.cmd_common, self.qemuboot_conf)
> +        shutdown_timeout = 120
> +        with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
> +            qemu_shutdown_succeeded = self._start_qemu_shutdown_check_if_shutdown_succeeded(qemu, shutdown_timeout)
> +            self.assertTrue(qemu_shutdown_succeeded, 'Failed: qemu does not shutdown within timeout(%s)' % shutdown_timeout)
> +
> +    def test_qemu_can_boot_nfs_and_shutdown(self):
> +        bitbake('meta-ide-support')
> +        rootfs_tar = "%s-%s.tar.bz2" % (self.recipe, self.machine)
> +        rootfs_tar = os.path.join(self.deploy_dir_image, rootfs_tar)
> +        if not os.path.exists(rootfs_tar):
> +            self.skipTest("%s not found" % rootfs_tar)
> +        tmpdir = tempfile.mkdtemp(prefix='qemu_nfs')
> +        tmpdir_nfs = os.path.join(tmpdir, 'nfs')
> +        cmd_extract_nfs = 'runqemu-extract-sdk %s %s' % (rootfs_tar, tmpdir_nfs)
> +        runCmd(cmd_extract_nfs)
> +        if not os.path.exists(self.qemuboot_conf):
> +            self.skipTest("%s not found" % self.qemuboot_conf)

This and others should be marked failure I think if env wasn't setup
properly after doing bitbake. Does skipTest result in a failure?

Thanks,
Anuj

