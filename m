Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AF150609B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 11:05:43 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 21 May 2015 04:05:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,468,1427785200"; d="scan'208";a="496501326"
Received: from lpobrien-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.1.32])
	by FMSMGA003.fm.intel.com with ESMTP; 21 May 2015 04:05:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Date: Thu, 21 May 2015 12:05:43 +0100
Message-ID: <2409378.FaPFWFNbiH@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/3.19.7-200.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <1432195678-6715-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1432195678-6715-1-git-send-email-ed.bartosh@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] oe-selftest: Build wic runtime requirements and images before testing
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
X-List-Received-Date: Thu, 21 May 2015 11:05:47 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Ed,

On Thursday 21 May 2015 11:07:58 Ed Bartosh wrote:
> Some native tools (syslinux, parted, mtools, etc) are required
> by wic to produce images. Unit tests fail if the tools are
> not available.
> 
> Baked tools and image-core-minimal used by wic before running tests.
> 
> [YOCTO #7730]
> 
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  meta/lib/oeqa/selftest/wic.py | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
> index c628b59..817685d 100644
> --- a/meta/lib/oeqa/selftest/wic.py
> +++ b/meta/lib/oeqa/selftest/wic.py
> @@ -36,6 +36,12 @@ class Wic(oeSelfTest):
> 
>      resultdir = "/var/tmp/wic/build/"
> 
> +    @classmethod
> +    def setUpClass(cls):
> +        """Build wic runtime dependencies and images used in the tests."""
> +        runCmd('bitbake syslinux syslinux-native parted-native '
> +               'dosfstools-native mtools-native core-image-minimal')
> +
>      def setUp(self):
>          """This code is executed before each test method."""
>          rmtree(self.resultdir, ignore_errors=True)

FYI there is a bitbake() function in meta/lib/oeqa/utils/commands.py that I'd 
recomment using rather than runCmd() directly. Ultimately it ends up doing the 
same thing, but at least it keeps the details of how bitbake is invoked 
isolated from what your test needs to build.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

