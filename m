Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3E27A610DC
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Oct 2013 03:22:17 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 04 Oct 2013 20:22:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1037,1371106800"; d="scan'208";a="414279859"
Received: from unknown (HELO [10.255.15.228]) ([10.255.15.228])
	by orsmga002.jf.intel.com with ESMTP; 04 Oct 2013 20:22:18 -0700
Message-ID: <524F85EA.30805@linux.intel.com>
Date: Fri, 04 Oct 2013 20:22:18 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130923 Thunderbird/17.0.9
MIME-Version: 1.0
To: Richard Tollerton <rich.tollerton@ni.com>
References: <1380929753-10606-1-git-send-email-rich.tollerton@ni.com>
In-Reply-To: <1380929753-10606-1-git-send-email-rich.tollerton@ni.com>
Cc: paul.eggleton@linux.intel.com, gratian.crisan@ni.com, ken.sharp@ni.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [dylan, master][PATCH] autotools.bbclass: Fix race with sed-native
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
X-List-Received-Date: Sat, 05 Oct 2013 03:22:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/04/2013 04:35 PM, Richard Tollerton wrote:
> Suppose the following:
> 1) foo.do_configure/do_build runs in parallel with
>     sed-native.do_configure;
> 2) foo.do_configure/do_build makes use of sed (i.e. inherits autotools);
> 3) A previously built sed-native already exists in the native sysroot,
>     and in the sstate cache.
>
> Then sed-native may be deleted from its sysroot via
> sstate_clean_manifest while foo.do_configure/do_build is using it,
> leading to an irreproducible build failure.
>
> This fix does for sed-native what's already done for libtool-native,
> with some additional light refactoring.
>
This also starts to create more front end bottle next on autotools 
related items before we can really start to parallelize the build.

More thought is required on this.

> Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> ---
>   meta/classes/autotools.bbclass | 26 +++++++++++++++++---------
>   1 file changed, 17 insertions(+), 9 deletions(-)
>
> diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
> index 66c0f5d..2bb2aa3 100644
> --- a/meta/classes/autotools.bbclass
> +++ b/meta/classes/autotools.bbclass
> @@ -7,17 +7,25 @@ def autotools_dep_prepend(d):
>
>       if pn in ['autoconf-native', 'automake-native', 'help2man-native']:
>           return deps
> -    deps += 'autoconf-native automake-native '
> +    deps += 'autoconf-native automake-native gnu-config-native '
>
You don't mention anything about this change.

Sau!
> -    if not pn in ['libtool', 'libtool-native'] and not pn.endswith("libtool-cross"):
> -        deps += 'libtool-native '
> -        if not bb.data.inherits_class('native', d) \
> -                        and not bb.data.inherits_class('nativesdk', d) \
> -                        and not bb.data.inherits_class('cross', d) \
> -                        and not d.getVar('INHIBIT_DEFAULT_DEPS', True):
> -            deps += 'libtool-cross '
> +    if pn in ['libtool', 'libtool-native'] or pn.endswith("libtool-cross"):
> +        return deps
> +    deps += 'libtool-native '
> +
> +    if d.getVar('INHIBIT_DEFAULT_DEPS', True):
> +        return deps
> +
> +    if pn not in ['sed-native']:
> +        deps += 'sed-native '
> +
> +    if bb.data.inherits_class('native', d) \
> +       or bb.data.inherits_class('nativesdk', d) \
> +       or bb.data.inherits_class('cross', d):
> +        return deps
> +    deps += 'libtool-cross '
>
> -    return deps + 'gnu-config-native '
> +    return deps
>
>   EXTRA_OEMAKE = ""
>
>

