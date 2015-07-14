Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8042D65C78
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 09:30:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Jul 2015 02:30:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,470,1432623600"; d="scan'208";a="764052752"
Received: from cbernard-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.31.54])
	by orsmga002.jf.intel.com with ESMTP; 14 Jul 2015 02:29:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
Date: Tue, 14 Jul 2015 10:29:55 +0100
Message-ID: <6014412.IjVSLHLSvX@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.0.7-200.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <1436863689-29230-1-git-send-email-daniel.alexandrux.istrate@intel.com>
References: <1436863689-29230-1-git-send-email-daniel.alexandrux.istrate@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 14 Jul 2015 09:30:09 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Daniel,

Comments in-line below.

On Tuesday 14 July 2015 11:48:09 Daniel Istrate wrote:
> Updated testcases that use qemu to not interfere with other qemu instances
> that might run in parallel.

The [YOCTO #....] reference should go here, not in the shortlog.

> Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
> ---
>  meta/lib/oeqa/selftest/imagefeatures.py | 153
> ++++++++++++-------------------- 1 file changed, 58 insertions(+), 95
> deletions(-)
> 
> diff --git a/meta/lib/oeqa/selftest/imagefeatures.py
> b/meta/lib/oeqa/selftest/imagefeatures.py index e0e424d..030969e 100644
> --- a/meta/lib/oeqa/selftest/imagefeatures.py
> +++ b/meta/lib/oeqa/selftest/imagefeatures.py
> @@ -2,13 +2,20 @@ from oeqa.selftest.base import oeSelfTest
>  from oeqa.utils.commands import runCmd, bitbake, get_bb_var
>  from oeqa.utils.decorators import testcase
>  import pexpect
> -from os.path import expanduser, isfile
> +from os.path import isfile
>  from os import system
>  import glob
> +import time
> 
> 
>  class ImageFeatures(oeSelfTest):
> 
> +    test_user = 'tester'
> +    root_user = 'root'
> +    prompt = r'qemux86:\S+[$#]\s+'
> +    ssh_cmd = "ssh {} -l {} -o UserKnownHostsFile=/dev/null -o
> StrictHostKeyChecking=no" 
> +    get_ip_patt = r'\s+ip=(?P<qemu_ip>(\d+.){3}\d+)::'
> +
>      @testcase(1107)
>      def test_non_root_user_can_connect_via_ssh_without_password(self):
>          """
> @@ -20,69 +27,49 @@ class ImageFeatures(oeSelfTest):
>          AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
>          """
> 
> -        test_user = 'tester'
> -        root_user = 'root'
> -        prompt = r'qemux86:\S+[$#]\s+'
> -        tap_inf_ip = '192.168.7.2'
> -
>          features = 'EXTRA_IMAGE_FEATURES += "ssh-server-openssh
> empty-root-password"\n' features += 'INHERIT += "extrausers"\n'
> -        features += 'EXTRA_USERS_PARAMS = "useradd -p \'\' {}; usermod -s
> /bin/sh {};"'.format(test_user, test_user) +        features +=
> 'EXTRA_USERS_PARAMS = "useradd -p \'\' {}; usermod -s /bin/sh
> {};"'.format(self.test_user, self.test_user)
> 
>          # Append 'features' to local.conf
>          self.append_config(features)
> 
>          # Build a core-image-minimal
>          ret = bitbake('core-image-minimal')
> -        self.assertEqual(0, ret.status, 'Failed to build a
> core-image-minimal') 
> -
> -        rm_ssh_keys_cmd = 'ssh-keygen -f "{}/.ssh/known_hosts" -R
> {}'.format(expanduser('~'), tap_inf_ip) 
> -        # Delete the ssh keys for 192.168.7.2 (qemu)
> -        ret = runCmd(rm_ssh_keys_cmd)
> -        self.assertEqual(0, ret.status, 'Failed to delete ssh keys for qemu
> host.') 
> +        self.assertEqual(0, ret.status, 'Failed to build a
> core-image-minimal. Reason: {}'.format(ret.output))

A stylistic thing perhaps, but instead of ... {}".format(str) why not just use 
... %s" % str ?

>          # Boot qemu image
> -        proc_qemu = pexpect.spawn('runqemu qemux86 nographic')
> +        proc_qemu = pexpect.spawn('runqemu qemux86')

Hmm, so I thought the plan we talked about here was to use QemuRunner. As I 
said earlier, if QemuRunner isn't doing what we need here (e.g. isn't allowing 
us to use pexpect) then we should fix it so that it does or at least make it 
optional. Even with these changes we are still left with a complete 
implementation of running QEMU here in the test, which we want to avoid.

...
>      @testcase(1101)
>      def test_efi_gummiboot_images_can_be_build(self):
> @@ -311,7 +274,7 @@ class Gummiboot(oeSelfTest):
>          # Create efi/gummiboot installation images
>          wic_create_cmd = 'wic create mkgummidisk -e core-image-minimal'
>          ret = runCmd(wic_create_cmd)
> -        self.assertEqual(0, ret.status, 'Failed to create efi/gummiboot
> installation images.') 
> +        self.assertEqual(0, ret.status, 'Failed to
> create efi/gummiboot installation images. Reason: {}'.format(ret.output))

These changes aren't described in the commit message - please either add 
mention of them or if they aren't actually related to resolving the QEMU 
running issue, put them in a separate patch.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

