Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 31BFE6FFA4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 22:03:15 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 23 Dec 2015 14:03:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,470,1444719600"; d="scan'208";a="713740483"
Received: from shwumeie-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.145.224])
	by orsmga003.jf.intel.com with ESMTP; 23 Dec 2015 14:03:14 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Dec 2015 11:03:11 +1300
Message-ID: <1508862.OrpW3lfmya@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.2.7-300.fc23.x86_64; KDE/4.14.14; x86_64; ;
	)
In-Reply-To: <1450878509-3827-1-git-send-email-ross.burton@intel.com>
References: <1450878509-3827-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH] oeqa/selftest: support sets in devtool comparisons
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
X-List-Received-Date: Wed, 23 Dec 2015 22:03:20 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wed, 23 Dec 2015 13:48:29 Ross Burton wrote:
> The devtool and recipetool tests do literal string comparisons, but for some
> fields the ordering could be irrelevant and potentially non-deterministic. 
> For example, the recipetool_create_simple test started failing with:
> 
> AssertionError: 'GPLv2 Unknown' != 'Unknown GPLv2' : values for LICENSE do
> not match
> 
> The ordering of the LICENSE field isn't relevant.  So, if the expected value
> is a set(), split the string into a set too and compare those.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/lib/oeqa/selftest/devtool.py    | 2 ++
>  meta/lib/oeqa/selftest/recipetool.py | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oeqa/selftest/devtool.py
> b/meta/lib/oeqa/selftest/devtool.py index 6f76ce7..1eadd6b 100644
> --- a/meta/lib/oeqa/selftest/devtool.py
> +++ b/meta/lib/oeqa/selftest/devtool.py
> @@ -44,6 +44,8 @@ class DevtoolBase(oeSelfTest):
>                      needvalue = checkvars.pop(var)
>                      if needvalue is None:
>                          self.fail('Variable %s should not appear in
> recipe') +                    if isinstance(needvalue, set):
> +                        value = set(value.split())
>                      self.assertEqual(value, needvalue, 'values for %s do
> not match' % var)
> 
> 
> diff --git a/meta/lib/oeqa/selftest/recipetool.py
> b/meta/lib/oeqa/selftest/recipetool.py index 34e383f..85a40f7 100644
> --- a/meta/lib/oeqa/selftest/recipetool.py
> +++ b/meta/lib/oeqa/selftest/recipetool.py
> @@ -413,7 +413,7 @@ class RecipetoolTests(RecipetoolBase):
>              self.fail('recipetool did not create recipe file; output:\n%s'
> % result.output) self.assertEqual(dirlist[0], 'socat_%s.bb' % pv, 'Recipe
> file incorrectly named') checkvars = {}
> -        checkvars['LICENSE'] = 'Unknown GPLv2'
> +        checkvars['LICENSE'] = set(['Unknown', 'GPLv2'])
>          checkvars['LIC_FILES_CHKSUM'] =
> 'file://COPYING.OpenSSL;md5=5c9bccc77f67a8328ef4ebaf468116f4
> file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263' # We don't check
> DEPENDS since they are variable for this recipe depending on what's in the
> sysroot checkvars['S'] = None

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

