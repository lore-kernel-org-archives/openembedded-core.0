Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 76BD77066B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 16:46:36 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 12 Feb 2015 08:42:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,565,1418112000"; d="scan'208";a="665497367"
Received: from rmooney1-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.18.4])
	by fmsmga001.fm.intel.com with ESMTP; 12 Feb 2015 08:46:35 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Thu, 12 Feb 2015 16:46:31 +0000
Message-ID: <3627050.lDnyP7JDsZ@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.17.8-200.fc20.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <65b3eb26c24648674ec3deb4da87f4933c2c0f21.1414748681.git.hongxu.jia@windriver.com>
References: <cover.1414748681.git.hongxu.jia@windriver.com>
	<65b3eb26c24648674ec3deb4da87f4933c2c0f21.1414748681.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] package_manager.py: fix rpm based do_rootfs failed while IMAGE_INSTALL_append = " python3"
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
X-List-Received-Date: Thu, 12 Feb 2015 16:46:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Hongxu,

On Friday 31 October 2014 17:46:24 Hongxu Jia wrote:
> While a pkg name (such as python3) not existed in variable
> PACKAGES, but provided by another pkg (such as python-core),
> in this situation, rpm based do_rootfs could not search it in
> the feeds.
> 
> The fix is to invoke 'smart query --provides' to do the search
> if the feeds search failed. We don't drop the feeds search,
> because the smart query search is too slow, and the feeds
> search is fast and could work well with most pkgs.
> 
> [YOCTO #6918]
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/lib/oe/package_manager.py | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
> index ffb83b2..a0ecf3a 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -671,6 +671,22 @@ class RpmPM(PackageManager):
> 
>          return ""
> 
> +    def _search_pkg_provider_in_smart(self, pkg, feed_archs):
> +        output = self._invoke_smart('query  --provides %s' % pkg) or ''
> +        for provider in output.split('\n'):
> +            # Filter out the line which is empty or start with space
> +            if provider.strip() == '' or provider[0] == ' ':
> +                continue
> +
> +            for arch in feed_archs:
> +                arch = '@' + arch.replace('-', '_')
> +                if arch in provider:
> +                    # First found is best match
> +                    return provider
> +
> +        return ''
> +
> +
>      '''
>      Translate the OE multilib format names to the RPM/Smart format names
>      It searched the RPM/Smart format names in probable multilib feeds
> first, @@ -691,7 +707,8 @@ class RpmPM(PackageManager):
>                  # if the pkg in this multilib feed
>                  if subst != pkg:
>                      feed_archs = self.ml_prefix_list[mlib]
> -                    new_pkg = self._search_pkg_name_in_feeds(subst,
> feed_archs) +                    new_pkg =
> self._search_pkg_name_in_feeds(subst, feed_archs) or \ +                   
>     self._search_pkg_provider_in_smart(subst, feed_archs) if not new_pkg:
>                          # Failed to translate, package not found!
>                          err_msg = '%s not found in the %s feeds (%s).\n' %
> \ @@ -709,7 +726,8 @@ class RpmPM(PackageManager):
>              if pkg == new_pkg:
>                  # Search new_pkg in default archs
>                  default_archs = self.ml_prefix_list['default']
> -                new_pkg = self._search_pkg_name_in_feeds(pkg,
> default_archs) +                new_pkg =
> self._search_pkg_name_in_feeds(pkg, default_archs) or \ +                  
>  self._search_pkg_provider_in_smart(pkg, default_archs) if not new_pkg:
>                      err_msg = '%s not found in the base feeds (%s).\n' % \
>                                (pkg, ' '.join(default_archs))

It took a long time to reply to this, my apologies. This patch looks OK but 
Richard pointed out that it may have an impact on the speed of do_rootfs 
because of the extra calls out to smart. Do you have any performance impact 
figures?

Thanks,
Paul
-- 

Paul Eggleton
Intel Open Source Technology Centre

