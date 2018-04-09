Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 44CA765CE9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 12:40:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Apr 2018 05:40:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,427,1517904000"; d="scan'208";a="41888402"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 09 Apr 2018 05:40:36 -0700
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1523244763-108834-1-git-send-email-ee.peng.yeoh@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <12143047-5587-0874-4cdf-6989cab74b27@linux.intel.com>
Date: Mon, 9 Apr 2018 15:34:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1523244763-108834-1-git-send-email-ee.peng.yeoh@intel.com>
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
X-List-Received-Date: Mon, 09 Apr 2018 12:40:37 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/09/2018 06:32 AM, Yeoh Ee Peng wrote:
> QA team were testing qemu boot image and shutdown on each
> qemu architecture manually. Add automated test to test qemu boot on
> ext4 and nfs, finally check that it can shutdown properly.
> 
> Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
> ---
>   meta/lib/oeqa/selftest/cases/runqemu.py | 61 +++++++++++++++++++++++++++++++--
>   1 file changed, 59 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
> index 47d41f5..7288ab2 100644
> --- a/meta/lib/oeqa/selftest/cases/runqemu.py
> +++ b/meta/lib/oeqa/selftest/cases/runqemu.py
> @@ -3,9 +3,10 @@
>   #
>   
>   import re
> -
> +import tempfile
> +import time
>   from oeqa.selftest.case import OESelftestTestCase
> -from oeqa.utils.commands import bitbake, runqemu, get_bb_var
> +from oeqa.utils.commands import bitbake, runqemu, get_bb_var, runCmd
>   from oeqa.core.decorator.oeid import OETestID
>   
>   class RunqemuTests(OESelftestTestCase):
> @@ -136,3 +137,59 @@ SYSLINUX_TIMEOUT = "10"
>           cmd = "%s %s" % (self.cmd_common, rootfs)
>           with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
>               self.assertTrue(qemu.runner.logged, "Failed: %s" % cmd)
> +
> +class QemuTest(OESelftestTestCase):

Please add comments that explain the need for a separate class, what the 
two classes do and how they differ.


Alex

