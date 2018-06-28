Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A63BF74DCB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 21:55:00 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5SLsw8R003014
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 28 Jun 2018 22:54:59 +0100
Message-ID: <26ebd00a74dd86c7e35fa67ae5ccfae8dec14a38.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 28 Jun 2018 22:54:58 +0100
In-Reply-To: <20180628175342.16560-2-JPEWhacker@gmail.com>
References: <20180628175342.16560-1-JPEWhacker@gmail.com>
	<20180628175342.16560-2-JPEWhacker@gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 2/2] oe-selftest: Add bitbake-layer create-layer test
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
X-List-Received-Date: Thu, 28 Jun 2018 21:55:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-06-28 at 12:53 -0500, Joshua Watt wrote:
> Adds a test that creates a layer, adds it to bblayers.conf, then ensure
> that it appears properly in bitbake-layers show-layers.
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/bblayers.py | 26 +++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
> index 90a2249b081..fba7fbb9b0f 100644
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
>          self.assertNotEqual(result.status, 0, 'bitbake-layers show-recipes -i nonexistentclass should have failed')
>          self.assertIn('ERROR:', result.output)
>  
> +    def test_bitbakelayers_createlayer(self):
> +        priority = 10
> +        layername = 'test-bitbakelayer-layercreate'
> +        layerpath = os.path.join(get_bb_var('COREBASE'), layername)
> +        self.assertFalse(os.path.exists(layerpath), '%s should not exist at this point in time' % layerpath)
> +        result = runCmd('bitbake-layers create-layer --priority=%d %s' % (priority, layerpath))
> +        self.track_for_cleanup(layerpath)
> +        result = runCmd('bitbake-layers add-layer %s' % layerpath)
> +        result = runCmd('bitbake-layers show-layers')
> +        find_in_contents = re.search(re.escape(layername) + r'\s+' + re.escape(layerpath) + r'\s+' + re.escape(str(priority)), result.output)
> +        self.assertTrue(find_in_contents, "%s not found in layers" % layername)

This looks good and top marks for adding unit tests!

One tip learnt from experience is that assertTrue can be problematic
because when it fails, the debug output it gives is useless as it says
it wasn't True. In this case, you need to put result.output into the
msg so that we'd have some chance of debugging it from the failure
message.

> +
> +        layervars = ['BBFILE_PRIORITY', 'BBFILE_PATTERN', 'LAYERDEPENDS', 'LAYERSERIES_COMPAT']
> +        bb_vars = get_bb_vars(['BBFILE_COLLECTIONS'] + ['%s_%s' % (v, layername) for v in layervars])
> +
> +        for v in layervars:
> +            varname = '%s_%s' % (v, layername)
> +            self.assertTrue(bb_vars[varname], "%s not found" % varname)

self.assertIsNotNone() ?

Cheers,

Richard



