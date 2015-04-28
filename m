Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3C944716CE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 09:41:36 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 28 Apr 2015 02:41:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,662,1422950400"; d="scan'208";a="702017232"
Received: from pkcletus-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.20.230])
	by fmsmga001.fm.intel.com with ESMTP; 28 Apr 2015 02:41:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Date: Tue, 28 Apr 2015 10:41:35 +0100
Message-ID: <204319168.AWQiYTztFe@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.9-200.fc21.x86_64; KDE/4.14.6; x86_64; ; )
In-Reply-To: <1429820740-5133-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1429820740-5133-1-git-send-email-ed.bartosh@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [wic][PATCH] wic tests: Add functional tests for directdisk
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
X-List-Received-Date: Tue, 28 Apr 2015 09:41:38 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Ed,

On Thursday 23 April 2015 23:25:40 Ed Bartosh wrote:
> Added 2 simple functional test cases to check if
> wic is able to produce images using directdisk.wks
> 
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  scripts/setup.cfg                       |  2 +-
>  scripts/tests/02_wic_test_directdisk.py | 61
> +++++++++++++++++++++++++++++++++ 2 files changed, 62 insertions(+), 1
> deletion(-)
>  create mode 100644 scripts/tests/02_wic_test_directdisk.py
> 
> diff --git a/scripts/setup.cfg b/scripts/setup.cfg
> index 48a0bb2..f378efa 100644
> --- a/scripts/setup.cfg
> +++ b/scripts/setup.cfg
> @@ -3,4 +3,4 @@ verbosity=2
>  exe=1
>  with-coverage=1
>  cover-erase=1
> -cover-package=wic,image
> +cover-package=wic,image,wic.imager
> diff --git a/scripts/tests/02_wic_test_directdisk.py
> b/scripts/tests/02_wic_test_directdisk.py new file mode 100644
> index 0000000..9108621
> --- /dev/null
> +++ b/scripts/tests/02_wic_test_directdisk.py
> @@ -0,0 +1,61 @@
> +#!/usr/bin/env python
> +# ex:ts=4:sw=4:sts=4:et
> +# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
> +#
> +# Copyright (c) 2015, Intel Corporation.
> +# All rights reserved.
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License version 2 as
> +# published by the Free Software Foundation.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License along
> +# with this program; if not, write to the Free Software Foundation, Inc.,
> +# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> +#
> +# AUTHORS
> +# Ed Bartosh <ed.bartosh@linux.intel.com>
> +
> +"""Test directdisk builds."""
> +
> +import imp
> +import unittest
> +import os
> +import shutil
> +import glob
> +
> +class TestWicDirectdisk(unittest.TestCase):
> +    """Test build of directdisk image"""
> +    def __init__(self, methodName='runTest'):
> +        unittest.TestCase.__init__(self, methodName)
> +        self.main = imp.load_source("wic", "wic").main
> +        self.resultdir = "/var/tmp/wic/build/"
> +
> +    def setUp(self):
> +        """This code executes before each test method."""
> +        shutil.rmtree(self.resultdir)
> +        os.chdir(os.getenv("BUILDDIR"))
> +
> +    def _build(self, cmdline):
> +        """Call self.main with provided commandline."""
> +        self.assertIsNone(self.main(cmdline))
> +        self.assertEqual(1, len(glob.glob(self.resultdir + \
> +                                "directdisk-*.direct")))
> +
> +    def testbuild_image_name(self):
> +        self._build(["create", "directdisk",
> +                     "--image-name", "core-image-minimal"])
> +
> +    def testbuild_artifacts(self):
> +        self._build(["create", "directdisk",
> +                     "-b", "tmp/sysroots/qemux86/usr/share",
> +                     "-k", "tmp/deploy/images/qemux86",
> +                     "-n", "tmp/sysroots/x86_64-linux",
> +                     "-r", "tmp/work/qemux86-poky-linux/"
> +                           "core-image-minimal/1.0-r0/rootfs"])
> +

So I appreciate what you're trying to do here, but I really think we ought to 
be running wic as users would run it or we're not really testing the same 
thing. Additionally, we should have these tests as part of the existing 
oe-selftest framework (tests in meta/lib/oeqa/selftest) rather than a new 
framework that has to be run separately. (I should have mentioned this when 
you sent the first patch earlier, sorry about that.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

