Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CB20D700F0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 09:08:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v5S98Z4c014860
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 02:08:35 -0700
Received: from soho-mhatle-m.local (147.11.119.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 28 Jun 2017 02:08:34 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.f2f002a814bb8f4571ff6f9fd7cb880b94cc611f.1498577501.git-series.patrick.ohly@intel.com>
	<2312c1a18a7a4154d99028405f5f865be42fa7a5.1498577501.git-series.patrick.ohly@intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <628a4bc1-c5cb-a1f8-9e12-4cb305f96dbb@windriver.com>
Date: Wed, 28 Jun 2017 11:08:33 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <2312c1a18a7a4154d99028405f5f865be42fa7a5.1498577501.git-series.patrick.ohly@intel.com>
Subject: Re: [PATCH v2 3/6] yocto-compat-layer.py: apply test_signatures to all layers
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
X-List-Received-Date: Wed, 28 Jun 2017 09:08:35 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/27/17 5:33 PM, Patrick Ohly wrote:
> Software layers were previously allowed to change signatures, but
> that's not desired for those layers either. The rule that a layer
> which is "Yocto Compatible 2.0" must not change signatures unless
> explicitly requested holds for all kinds of layers.
> 
> However, as this is something that software layers might not be able
> to do right away, testing for signature changes in software layers can
> be disabled. It's on by default, as that was Richard's
> recommendation. Whether that should change needs further discussion as
> part of finalizing "Yocto Compatible 2.0".
> 
> As it might still change, the tool now has both a with/without
> parameter so that users of the tool can choose the desired behavior
> without being affected by future changes to the default.

How would you regulate the behavior of a software layer that is doing bbappends
or similar to a system provided component.

My understanding is that the inclusion of the software layer SHOULD be able to
modify the existing recipe behavior, as there currently is no other way to
'control' activation.

This is different then BSP and distro layers, which have a specific activation
(and thus override) behavior.

--Mark

> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  scripts/lib/compatlayer/cases/common.py |  5 +++--
>  scripts/lib/compatlayer/context.py      |  3 ++-
>  scripts/yocto-compat-layer.py           | 12 +++++++++---
>  3 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/lib/compatlayer/cases/common.py b/scripts/lib/compatlayer/cases/common.py
> index 2dfcbb1..a1cdbab 100644
> --- a/scripts/lib/compatlayer/cases/common.py
> +++ b/scripts/lib/compatlayer/cases/common.py
> @@ -27,8 +27,9 @@ class CommonCompatLayer(OECompatLayerTestCase):
>                        'bitbake -e')
>  
>      def test_signatures(self):
> -        if self.tc.layer['type'] == LayerType.SOFTWARE:
> -            raise unittest.SkipTest("Layer %s isn't BSP or DISTRO one." \
> +        if self.tc.layer['type'] == LayerType.SOFTWARE and \
> +           not self.tc.test_software_layer_signatures:
> +            raise unittest.SkipTest("Not testing for signature changes in a software layer %s." \
>                       % self.tc.layer['name'])
>  
>          # task -> (old signature, new signature)
> diff --git a/scripts/lib/compatlayer/context.py b/scripts/lib/compatlayer/context.py
> index 4932238..7811d4a 100644
> --- a/scripts/lib/compatlayer/context.py
> +++ b/scripts/lib/compatlayer/context.py
> @@ -9,6 +9,7 @@ import re
>  from oeqa.core.context import OETestContext
>  
>  class CompatLayerTestContext(OETestContext):
> -    def __init__(self, td=None, logger=None, layer=None):
> +    def __init__(self, td=None, logger=None, layer=None, test_software_layer_signatures=True):
>          super(CompatLayerTestContext, self).__init__(td, logger)
>          self.layer = layer
> +        self.test_software_layer_signatures = test_software_layer_signatures
> diff --git a/scripts/yocto-compat-layer.py b/scripts/yocto-compat-layer.py
> index 30c55a9..a16974f 100755
> --- a/scripts/yocto-compat-layer.py
> +++ b/scripts/yocto-compat-layer.py
> @@ -30,12 +30,12 @@ CASES_PATHS = [os.path.join(os.path.abspath(os.path.dirname(__file__)),
>                  'lib', 'compatlayer', 'cases')]
>  logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
>  
> -def test_layer_compatibility(td, layer):
> +def test_layer_compatibility(td, layer, test_software_layer_signatures):
>      from compatlayer.context import CompatLayerTestContext
>      logger.info("Starting to analyze: %s" % layer['name'])
>      logger.info("----------------------------------------------------------------------")
>  
> -    tc = CompatLayerTestContext(td=td, logger=logger, layer=layer)
> +    tc = CompatLayerTestContext(td=td, logger=logger, layer=layer, test_software_layer_signatures=test_software_layer_signatures)
>      tc.loadTests(CASES_PATHS)
>      return tc.runTests()
>  
> @@ -53,6 +53,12 @@ def main():
>              help='List of MACHINEs to be used during testing', action='store')
>      parser.add_argument('--additional-layers', nargs="+",
>              help='List of additional layers to add during testing', action='store')
> +    group = parser.add_mutually_exclusive_group()
> +    group.add_argument('--with-software-layer-signature-check', action='store_true', dest='test_software_layer_signatures',
> +                       default=True,
> +                       help='check that software layers do not change signatures (on by default)')
> +    group.add_argument('--without-software-layer-signature-check', action='store_false', dest='test_software_layer_signatures',
> +                       help='disable signature checking for software layers')
>      parser.add_argument('-n', '--no-auto', help='Disable auto layer discovery',
>              action='store_true')
>      parser.add_argument('-d', '--debug', help='Enable debug output',
> @@ -173,7 +179,7 @@ def main():
>              layers_tested = layers_tested + 1
>              continue
>  
> -        result = test_layer_compatibility(td, layer)
> +        result = test_layer_compatibility(td, layer, args.test_software_layer_signatures)
>          results[layer['name']] = result
>          results_status[layer['name']] = 'PASS' if results[layer['name']].wasSuccessful() else 'FAIL'
>          layers_tested = layers_tested + 1
> 


