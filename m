Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4284E78957
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 13:51:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Mar 2018 06:51:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,340,1517904000"; d="scan'208";a="44058338"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 21 Mar 2018 06:51:40 -0700
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1521503987-70014-1-git-send-email-ee.peng.yeoh@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <cec1c204-c8c1-74da-d89d-bba2ed0d369c@linux.intel.com>
Date: Wed, 21 Mar 2018 15:45:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1521503987-70014-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: Re: [PATCH] oe-selftest: crosstap: add tests for crosstap script
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
X-List-Received-Date: Wed, 21 Mar 2018 13:51:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/20/2018 01:59 AM, Yeoh Ee Peng wrote:
> +    def start_qemu_with_image(self, recipe, fstypes, cmd, targetlogger):
> +        tinfoil = bb.tinfoil.Tinfoil()
> +        tinfoil.prepare(config_only=False, quiet=True)
> +        try:
> +            tinfoil.logger.setLevel(logging.WARNING)
> +            tinfoil.config_data.setVar("TEST_LOG_DIR", "${WORKDIR}/testimage")
> +            tinfoil.config_data.setVar("TEST_QEMUBOOT_TIMEOUT", "1000")
> +            # Tell QemuTarget() whether need find rootfs/kernel or not
> +            #tinfoil.config_data.setVar("FIND_ROOTFS", '0')
> +            recipedata = tinfoil.parse_recipe(recipe)
> +            logdir = recipedata.getVar("TEST_LOG_DIR")
> +            qemu = oeqa.targetcontrol.QemuTarget(recipedata, targetlogger, fstypes)
> +        finally:
> +            # We need to shut down tinfoil early here in case we actually want
> +            # to run tinfoil-using utilities with the running QEMU instance.
> +            # Luckily QemuTarget doesn't need it after the constructor.
> +            tinfoil.shutdown()
> +        print('DEBUG: qemu.deploy')
> +        qemu.deploy()
> +        try:
> +            print('DEBUG: qemu.start')
> +            qemu.start(ssh=True, launch_cmd=cmd, discard_writes=True)
> +        except bb.build.FuncFailed:
> +            raise Exception('Failed to start QEMU - see the logs in %s' % logdir)
> +
> +        return qemu

Can you use runqemu from oeqa.utils.commands, instead of this custom 
hand-written invocation? There are plenty of examples in oe-selftests, e.g.:

                     with runqemu('core-image-minimal') as qemu:
                         # Make the test echo a string and search for 
that as
                         # run_serial()'s status code is useless.'
                         for filename in ("rootfs", "delayed-a", 
"delayed-b"):
                             status, output = qemu.run_serial("test -f 
%s && echo found" % os.path.join(targettestdir, filename))
                             self.assertEqual(output, "found", "%s was 
not present on boot" % filename)


Alex

