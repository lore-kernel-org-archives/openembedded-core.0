Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 84312719F4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 07:09:03 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 17 Oct 2016 00:09:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,356,1473145200"; d="scan'208";a="180510318"
Received: from haslinge-mobl1.ger.corp.intel.com (HELO
	jlock-mobl1.ger.corp.intel.com) ([10.252.18.238])
	by fmsmga004.fm.intel.com with ESMTP; 17 Oct 2016 00:09:01 -0700
Message-ID: <1476688132.2604.8.camel@linux.intel.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Oct 2016 08:08:52 +0100
In-Reply-To: <88ed2fc1a30df53f6c94192966c00c5c41de3869.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<88ed2fc1a30df53f6c94192966c00c5c41de3869.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Subject: Re: [PATCH 2/9] selftest: skip two bbtest tests depending on distro
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
X-List-Received-Date: Mon, 17 Oct 2016 07:09:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-10-14 at 11:40 -0500,
leonardo.sandoval.gonzalez@linux.intel.com wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> 
> There are two bbtests that just makes sense on certain distros:
> test_bitbake_g cannot be done on poky-tiny and test_non_gplv3
> just makes sense on poky and poky-tiny. Skip these when
> necessary under the latter conditions.
> 
> [YOCTO #8525]
> 
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.in
> tel.com>
> ---
>  meta/lib/oeqa/selftest/bbtests.py | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/meta/lib/oeqa/selftest/bbtests.py
> b/meta/lib/oeqa/selftest/bbtests.py
> index baae1e0..9b11cd9 100644
> --- a/meta/lib/oeqa/selftest/bbtests.py
> +++ b/meta/lib/oeqa/selftest/bbtests.py
> @@ -114,6 +114,9 @@ class BitbakeTests(oeSelfTest):
>  
>      @testcase(167)
>      def test_bitbake_g(self):
> +        if self.distro == 'poky-tiny':
> +            self.skipTest('core-image-full-cmdline is not buildable
> with poky-tiny')
> +

This test is still valid for poky-tiny, it's just that the image the
test builds isn't buildable with poky-tiny, right?

I think it would be better to change the test to a different, smaller,
image that can also be built for poky-tiny (core-image-minimal?). 
We'd also need to change the target the test checks for the presence of
in pn-buildlist.

Regards,

Joshua

>          result = bitbake('-g core-image-full-cmdline')
>          for f in ['pn-buildlist', 'pn-depends.dot', 'package-
> depends.dot', 'task-depends.dot']:
>              self.addCleanup(os.remove, f)
> @@ -229,6 +232,10 @@ INHERIT_remove = \"report-error\"
>  
>      @testcase(1119)
>      def test_non_gplv3(self):
> +        supported_distros = ['poky', 'poky-tiny']
> +        if not self.distro in supported_distros:
> +            self.skipTest('Test considers only %s distros' %
> ','.join(supported_distros))
> +
>          data = 'INCOMPATIBLE_LICENSE = "GPLv3"'
>          conf = os.path.join(self.builddir, 'conf/local.conf')
>          ftools.append_file(conf ,data)
> -- 
> 2.1.4
> 

