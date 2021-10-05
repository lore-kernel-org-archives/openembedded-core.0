Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A70BAC433FE
	for <webhook@archiver.kernel.org>; Tue,  5 Oct 2021 18:19:55 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web12.561.1633457994182053674
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 11:19:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id E0AF1100003;
	Tue,  5 Oct 2021 18:19:51 +0000 (UTC)
Date: Tue, 5 Oct 2021 20:19:51 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Pgowda <pgowda.cve@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, rwmacleod@gmail.com,
	alex.kanavin@gmail.com, umesh.kalappa0@gmail.com,
	vinay.m.engg@gmail.com
Subject: Re: [OE-core] [PATCH v2 1/3] Rust oe-selftest script
Message-ID: <YVyXR9wSCrB9s402@piout.net>
References: <20210929080448.16224-1-pgowda.cve@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210929080448.16224-1-pgowda.cve@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Oct 2021 18:19:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156655

Hello,

I got the following (cryptic) failures today:

https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/4100/steps/18/logs/stdio

https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/4094/steps/18/logs/stdio


On 29/09/2021 01:04:46-0700, Pgowda wrote:
> The file builds remote-test-server and executes rust testing
> remotely using background ssh. It adds the necessary test environment
> and variables to run the rust oe-selftest.
> 
> Print the results in case of failure of runCmd().
> 
> Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/rust.py | 53 ++++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 meta/lib/oeqa/selftest/cases/rust.py
> 
> diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
> new file mode 100644
> index 0000000000..7978758221
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/cases/rust.py
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: MIT
> +import os
> +import subprocess
> +from oeqa.core.decorator import OETestTag
> +from oeqa.core.case import OEPTestResultTestCase
> +from oeqa.selftest.case import OESelftestTestCase
> +from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars, runqemu, Command
> +from oeqa.utils.sshcontrol import SSHControl
> +
> +# Total time taken for testing is of about 2hr 20min, with PARALLEL_MAKE set to 40 number of jobs.
> +class RustSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
> +
> +	def run_check_emulated(self, *args, **kwargs):
> +		# build remote-test-server before image build
> +		recipe = "rust-testsuite"
> +		bitbake("{} -c compile".format(recipe))
> +		builddir = get_bb_var("B", "rust-testsuite")
> +		# build core-image-minimal with required packages
> +		default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp"]
> +		features = []
> +		features.append('IMAGE_FEATURES += "ssh-server-openssh"')
> +		features.append('CORE_IMAGE_EXTRA_INSTALL += "{0}"'.format(" ".join(default_installed_packages)))
> +		self.write_config("\n".join(features))
> +		bitbake("core-image-minimal")
> +		# wrap the execution with a qemu instance
> +		with runqemu("core-image-minimal", runqemuparams = "nographic", qemuparams = "-m 512") as qemu:
> +			# Copy remote-test-server to image through scp
> +			ssh = SSHControl(ip=qemu.ip, logfile=qemu.sshlog, user="root")
> +			ssh.copy_to(builddir + "/" + "build/x86_64-unknown-linux-gnu/stage1-tools-bin/remote-test-server","~/")
> +			# Execute remote-test-server on image through background ssh
> +			command = '~/remote-test-server -v remote'
> +			sshrun=subprocess.Popen(("ssh", '-o',  'UserKnownHostsFile=/dev/null', '-o',  'StrictHostKeyChecking=no', '-f', "root@%s" % qemu.ip, command),
> +                                shell=False,
> +                                stdout=subprocess.PIPE,
> +                                stderr=subprocess.PIPE)
> +			# Get the values of variables.
> +			targetsys = get_bb_var("TARGET_SYS", "rust-testsuite")
> +			rustlibpath = get_bb_var("STAGING_LIBDIR_NATIVE", "rust-testsuite")
> +			tmpdir = get_bb_var("TMPDIR", "rust-testsuite")
> +			testargs = "--no-fail-fast --bless"
> +			# Set path for target-poky-linux-gcc, RUST_TARGET_PATH and hosttools.
> +			cmd = " export PATH=%s/../bin:$PATH;" % rustlibpath
> +			cmd = cmd + " export PATH=%s/../bin/%s:%s/hosttools:$PATH;" % (rustlibpath, targetsys, tmpdir)
> +			cmd = cmd + " export RUST_TARGET_PATH=%s/rustlib;" % rustlibpath
> +			# Trigger testing.
> +			cmd = cmd + " export TEST_DEVICE_ADDR=\"%s:12345\";" % qemu.ip
> +			cmd = cmd + " cd %s;  python3 src/bootstrap/bootstrap.py test %s --target %s ;" % (builddir, testargs, targetsys)
> +			result = runCmd(cmd)
> +
> +@OETestTag("toolchain-system")
> +class RustSelfTestSystemEmulated(RustSelfTestBase):
> +	def test_rust(self):
> +		self.run_check_emulated("rust")
> -- 
> 2.31.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156448): https://lists.openembedded.org/g/openembedded-core/message/156448
> Mute This Topic: https://lists.openembedded.org/mt/85943724/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

