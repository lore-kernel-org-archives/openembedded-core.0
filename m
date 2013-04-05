Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UO5uy-0008QW-6t
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 14:39:21 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 3AB44D22E9; Fri,  5 Apr 2013 14:21:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 4A0E2D20D2;
	Fri,  5 Apr 2013 14:21:16 +0200 (CEST)
Message-ID: <515EC1B2.4060103@linaro.org>
Date: Fri, 05 Apr 2013 14:21:06 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <515E976C.8060302@linaro.org>
In-Reply-To: <515E976C.8060302@linaro.org>
X-Enigmail-Version: 1.4.6
Subject: Re: Does support for external toolchains working in current OE?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Apr 2013 12:39:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 05.04.2013 11:20, Marcin Juszkiewicz pisze:

> ERROR: Multiple .bb files are due to be built which each provide virtual/libc (/home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/eglibc/eglibc_2.17.bb /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/meta-linaro/meta-linaro-toolchain/recipes-devtools/external-linaro-toolchain/external-linaro-toolchain.bb).
>  This usually means one provides something the other doesn't and should.

Let's enable debug:

DEBUG: providers for virtual/libc are: ['eglibc', 'external-linaro-toolchain']
NOTE: selecting external-linaro-toolchain to satisfy virtual/libc due to PREFERRED_PROVIDERS
DEBUG: sorted providers for virtual/libc are: ['/home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/meta-linaro/meta-linaro-toolchain/recipes-devtools/external-linaro-toolchain/external-linaro-toolchain.bb', '/home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/eglibc/eglibc_2.17.bb']
DEBUG: adding /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/meta-linaro/meta-linaro-toolchain/recipes-devtools/external-linaro-toolchain/external-linaro-toolchain.bb to satisfy virtual/libc
DEBUG: adding /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/eglibc/eglibc_2.17.bb to satisfy virtual/libc

And now - let's dig deep into BitBake code. We want two files:

- lib/bb/providers.py
- lib/bb/taskdata.py

1. Bitbake jumps into taskdata/add_provider_internal(). 
2. Then asks bb.providers.filterProviders() 
   "is there any provider for 'virtual/libc'"?
3. In providers/_filterProviders this output is printed:
   "DEBUG: providers for virtual/libc are: ['eglibc', 'external-linaro-toolchain']"
4. providers/filterProviders() (note lack of "_") checks for
   PREFERRED_PROVIDER_virtual/libc and outputs:
   NOTE: selecting external-linaro-toolchain to satisfy virtual/libc due to PREFERRED_PROVIDERS
   sets foundUnique to True, outputs:
   DEBUG: sorted providers for virtual/libc are: ['/home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/meta-linaro/meta-linaro-toolchain/recipes-devtools/external-linaro-toolchain/external-linaro-toolchain.bb', '/home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/eglibc/eglibc_2.17.bb']
   and returns all providers + foundUnique
5. We are back at taskdata/add_provider_internal() and we
   have more then one entry in "eligible" array plus
   foundUnique set to True.
6. Here we are happy of results and skips two "if" checks.
7. Then we add each entry as good one with this output:
DEBUG: adding /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/meta-linaro/meta-linaro-toolchain/recipes-devtools/external-linaro-toolchain/external-linaro-toolchain.bb to satisfy virtual/libc
DEBUG: adding /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-core/eglibc/eglibc_2.17.bb to satisfy virtual/libc

The question is - why providers/filterProviders() returns more 
then one entry when it founds that one of them is preferred?

So I got with this change:

diff --git a/lib/bb/providers.py b/lib/bb/providers.py
index fcee6dc..0b37c44 100644
--- a/lib/bb/providers.py
+++ b/lib/bb/providers.py
@@ -296,8 +296,7 @@ def filterProviders(providers, item, cfgData, dataCache):
             pn = dataCache.pkg_fn[p]
             if dataCache.preferred[item] == pn:
                 logger.verbose("selecting %s to satisfy %s due to PREFERRED_PROVIDERS", pn, item)
-                eligible.remove(p)
-                eligible = [p] + eligible
+                eligible = [p]
                 foundUnique = True
                 break

And when I added "eglibc" into PROVIDES in 
external-linaro-toolchain.bb I got bitbake pass!!!
NO MULTIPLE RECIPES!!! :D


