Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5D061745D1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jun 2018 09:57:37 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5U9vZhx019434
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sat, 30 Jun 2018 10:57:36 +0100
Message-ID: <7fa47b1ad1e01ac0e5d5606ae69ae29a06e94b00.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 30 Jun 2018 10:57:35 +0100
In-Reply-To: <20180629175445.21871-1-JPEWhacker@gmail.com>
References: <20180628175342.16560-1-JPEWhacker@gmail.com>
	<20180629175445.21871-1-JPEWhacker@gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH v2] oe-selftest: Add bitbake-layer create-layer test
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
X-List-Received-Date: Sat, 30 Jun 2018 09:57:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-06-29 at 12:54 -0500, Joshua Watt wrote:
> Adds a test that creates a layer, adds it to bblayers.conf, then
> ensure
> that it appears properly in bitbake-layers show-layers.
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/bblayers.py | 26
> +++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)

I ran this on the autobuilder and it showed:

https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/1154/steps/Running%20oe-selftest/logs/stdio

Tests were working, it runs this test, then everything fails:

2018-06-29 23:50:23,781 - oe-selftest - INFO -  ... OK (719.550s)
2018-06-29 23:50:23,783 - oe-selftest - INFO -   test_bitbakelayers_add_remove (bblayers.BitbakeLayers)
2018-06-29 23:50:39,742 - oe-selftest - INFO -  ... OK (15.959s)
2018-06-29 23:50:39,742 - oe-selftest - INFO -   test_bitbakelayers_createlayer (bblayers.BitbakeLayers)
2018-06-29 23:50:49,526 - oe-selftest - INFO -  ... OK (9.783s)
2018-06-29 23:50:49,526 - oe-selftest - INFO -   test_bitbakelayers_flatten (bblayers.BitbakeLayers)
2018-06-29 23:50:49,971 - oe-selftest - INFO -  ... FAIL (0.445s)
2018-06-29 23:50:49,971 - oe-selftest - INFO -   test_bitbakelayers_showappends (bblayers.BitbakeLayers)
2018-06-29 23:50:50,356 - oe-selftest - INFO -  ... FAIL (0.385s)
2018-06-29 23:50:50,356 - oe-selftest - INFO -   test_bitbakelayers_showcrossdepends (bblayers.BitbakeLayers)
2018-06-29 23:50:50,761 - oe-selftest - INFO -  ... FAIL (0.405s)

Later you can see the error:

ERROR: Layer directory '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/test-bitbakelayer-layercreate' does not exist! Please check BBLAYERS in /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/conf/bblayers.conf

so I think something in the cleanup of the test is wrong...

Cheers,

Richard

> diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py
> b/meta/lib/oeqa/selftest/cases/bblayers.py
> index 90a2249b081..f2fc8327647 100644
> --- a/meta/lib/oeqa/selftest/cases/bblayers.py
> +++ b/meta/lib/oeqa/selftest/cases/bblayers.py
> @@ -2,7 +2,7 @@ import os
>  import re
>  
>  import oeqa.utils.ftools as ftools
> -from oeqa.utils.commands import runCmd, get_bb_var
> +from oeqa.utils.commands import runCmd, get_bb_var, get_bb_vars
>  
>  from oeqa.selftest.case import OESelftestTestCase
>  from oeqa.core.decorator.oeid import OETestID
> @@ -85,6 +85,30 @@ class BitbakeLayers(OESelftestTestCase):
>          self.assertNotEqual(result.status, 0, 'bitbake-layers show-
> recipes -i nonexistentclass should have failed')
>          self.assertIn('ERROR:', result.output)
>  
> +    def test_bitbakelayers_createlayer(self):
> +        priority = 10
> +        layername = 'test-bitbakelayer-layercreate'
> +        layerpath = os.path.join(get_bb_var('COREBASE'), layername)
> +        self.assertFalse(os.path.exists(layerpath), '%s should not
> exist at this point in time' % layerpath)
> +        result = runCmd('bitbake-layers create-layer --priority=%d
> %s' % (priority, layerpath))
> +        self.track_for_cleanup(layerpath)
> +        result = runCmd('bitbake-layers add-layer %s' % layerpath)
> +        result = runCmd('bitbake-layers show-layers')
> +        find_in_contents = re.search(re.escape(layername) + r'\s+' +
> re.escape(layerpath) + r'\s+' + re.escape(str(priority)),
> result.output)
> +        self.assertTrue(find_in_contents, "%s not found in
> layers\n%s" % (layername, result.output))
> +
> +        layervars = ['BBFILE_PRIORITY', 'BBFILE_PATTERN',
> 'LAYERDEPENDS', 'LAYERSERIES_COMPAT']
> +        bb_vars = get_bb_vars(['BBFILE_COLLECTIONS'] + ['%s_%s' %
> (v, layername) for v in layervars])
> +
> +        for v in layervars:
> +            varname = '%s_%s' % (v, layername)
> +            self.assertIsNotNone(bb_vars[varname], "%s not found" %
> varname)
> +
> +        find_in_contents = re.search(r'(^|\s)' +
> re.escape(layername) + r'($|\s)', bb_vars['BBFILE_COLLECTIONS'])
> +        self.assertTrue(find_in_contents, "%s not in
> BBFILE_COLLECTIONS" % layername)
> +
> +        self.assertEqual(bb_vars['BBFILE_PRIORITY_%s' % layername],
> str(priority), 'BBFILE_PRIORITY_%s != %d' % (layername, priority))
> +
>      def get_recipe_basename(self, recipe):
>          recipe_file = ""
>          result = runCmd("bitbake-layers show-recipes -f %s" %
> recipe)

