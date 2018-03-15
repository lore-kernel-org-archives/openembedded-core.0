Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A04FC788BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 14:05:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Mar 2018 07:05:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,311,1517904000"; d="scan'208";a="25518624"
Received: from lisamorr-mobl1.ger.corp.intel.com (HELO [10.252.22.51])
	([10.252.22.51])
	by orsmga008.jf.intel.com with ESMTP; 15 Mar 2018 07:05:43 -0700
User-Agent: Microsoft-MacOutlook/10.b.0.180311
Date: Thu, 15 Mar 2018 16:05:41 +0200
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Ross Burton <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
Message-ID: <8030F17E-D0A7-44DC-8745-224F49DBBA68@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] buildperf: measure the size of core-image-sato
	rootfs
References: <20180315131350.12270-1-ross.burton@intel.com>
In-Reply-To: <20180315131350.12270-1-ross.burton@intel.com>
Mime-version: 1.0
Subject: Re: [PATCH] buildperf: measure the size of core-image-sato rootfs
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
X-List-Received-Date: Thu, 15 Mar 2018 14:05:43 -0000
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: 7bit

On 15/03/2018, 15.14, "Ross Burton" <openembedded-core-bounces@lists.openembedded.org on behalf of ross.burton@intel.com> wrote:

    Signed-off-by: Ross Burton <ross.burton@intel.com>
    ---
     meta/lib/oeqa/buildperf/test_basic.py | 4 ++--
     1 file changed, 2 insertions(+), 2 deletions(-)
    
    diff --git a/meta/lib/oeqa/buildperf/test_basic.py b/meta/lib/oeqa/buildperf/test_basic.py
    index a19089a6ed2..6d6b01b04b4 100644
    --- a/meta/lib/oeqa/buildperf/test_basic.py
    +++ b/meta/lib/oeqa/buildperf/test_basic.py
    @@ -15,8 +15,7 @@ import shutil
     
     import oe.path
     from oeqa.buildperf import BuildPerfTestCase
    -from oeqa.utils.commands import get_bb_vars
    -
    +from oeqa.utils.commands import get_bb_var, get_bb_vars
     
     class Test1P1(BuildPerfTestCase):
         build_target = 'core-image-sato'
    @@ -30,6 +29,7 @@ class Test1P1(BuildPerfTestCase):
             self.measure_cmd_resources(['bitbake', self.build_target], 'build',
                                        'bitbake ' + self.build_target, save_bs=True)
             self.measure_disk_usage(self.bb_vars['TMPDIR'], 'tmpdir', 'tmpdir')
    +        self.measure_disk_usage(get_bb_var("IMAGE_ROOTFS", self.build_target), 'rootfs', 'rootfs', True)
    
Alternatively you could do
   self.bb_vars = get_bb_vars(None, self.build_target)

as the first step of the test case (i.e. before the rm_tmp() and other initializations). Generally, I think this would be a safer pattern as get_bb_var() does recipe parsing which might affect test results in some cases, although in this particular case it doesn't really matter.

Thanks,
  Markus





