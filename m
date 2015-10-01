Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 56A5377027
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 07:42:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t917gJ8R021579
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Oct 2015 00:42:19 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 1 Oct 2015 00:42:18 -0700
Message-ID: <560CE3D9.8040001@windriver.com>
Date: Thu, 1 Oct 2015 15:42:17 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1443684954.git.liezhi.yang@windriver.com>
	<19939d4ec68483314514606bdc16ab09cee6faed.1443684954.git.liezhi.yang@windriver.com>
In-Reply-To: <19939d4ec68483314514606bdc16ab09cee6faed.1443684954.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 1/1] smart:cache.py: getPackages() matches name + arch
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
X-List-Received-Date: Thu, 01 Oct 2015 07:42:22 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/01/2015 03:40 PM, Robert Yang wrote:
> It only matched name ony in the past, for example:
> smart install busybox (matched)
> but:
> smart install busybox@core2_64 (didn't match)
>
> The installation is very slow when no match since it would seach all the
> packages in the repo, and what we use mostly in oe-core is the second
> case, so the installation is very slow when install COMPLEMENTARY
> packages such as the task do_populate_sdk.
>
> This patch makes it match both.
>
> * Speed up
>    MACHINE = "qemux86-64"
>    - When multilib enabled:
>      $ bitbake core-image-sato -cpopulate_sdk
>      time: 6m5s -> 2m34s (Reduce 57% )
>
>      $ bitbake core-image-minimal -cpopulate_sdk
>      time: 2m1s -> 1m26s (Reduce 28% )
>
>      $ bitbake core-image-sato-sdk
>      time: 10m15s -> 7m12s (Reduce 29% )
>
>    - When multilib NOT enabled:
>      $ bitbake core-image-sato-sdk -cpopulate_sdk

Sorry , a typo, this should be :
$ bitbake core-image-sato -cpopulate_sdk.

Updated in in the repo.

// Robert

>      time: 4m25s -> 2m28s (Reduce 44% )
>
> [YOCTO #8389]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   ...cache.py-getPackages-matches-name-version.patch |   43 ++++++++++++++++++++
>   meta/recipes-devtools/python/python-smartpm_git.bb |    1 +
>   2 files changed, 44 insertions(+)
>   create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-cache.py-getPackages-matches-name-version.patch
>
> diff --git a/meta/recipes-devtools/python/python-smartpm/smart-cache.py-getPackages-matches-name-version.patch b/meta/recipes-devtools/python/python-smartpm/smart-cache.py-getPackages-matches-name-version.patch
> new file mode 100644
> index 0000000..225b02f
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python-smartpm/smart-cache.py-getPackages-matches-name-version.patch
> @@ -0,0 +1,43 @@
> +From ee05e55e84b53f4bb0d0baba13ca47a8f84b7cb4 Mon Sep 17 00:00:00 2001
> +From: Robert Yang <liezhi.yang@windriver.com>
> +Date: Wed, 30 Sep 2015 01:12:52 -0700
> +Subject: [PATCH] smart:cache.py: getPackages() matches name + arch
> +
> +It only matched name ony in the past, for example:
> +smart install busybox (matched)
> +but:
> +smart install busybox@core2_64 (didn't match)
> +
> +The installation is very slow when no match since it would seach all the
> +packages in the repo
> +This patch makes it match both.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +---
> + smart/cache.py |    3 ++-
> + smart/ccache.c |    9 ++++++++-
> + 2 files changed, 10 insertions(+), 2 deletions(-)
> +
> +diff --git a/smart/control.py b/smart/control.py
> +index d44abe7..f23a604 100644
> +--- a/smart/control.py
> ++++ b/smart/control.py
> +@@ -876,9 +876,13 @@ class Control(object):
> +         objects = []
> +
> +         # If we find packages with exactly the given
> +-        # name or name-version, use them.
> +-        for pkg in self._cache.getPackages(s):
> +-            if pkg.name == s or "%s-%s" % (pkg.name, pkg.version) == s:
> ++        # name, name-version, or name@arch, use them.
> ++        s_name = s
> ++        if "@" in s:
> ++            s_name = s.split("@")[0]
> ++        for pkg in self._cache.getPackages(s_name):
> ++            if pkg.name == s or "%s-%s" % (pkg.name, pkg.version) == s \
> ++                    or "%s@%s" % (pkg.name, pkg.version.split('@')[1]) == s:
> +                 objects.append((1.0, pkg))
> +
> +         if not objects:
> diff --git a/meta/recipes-devtools/python/python-smartpm_git.bb b/meta/recipes-devtools/python/python-smartpm_git.bb
> index 8b974b0..d6c378b 100644
> --- a/meta/recipes-devtools/python/python-smartpm_git.bb
> +++ b/meta/recipes-devtools/python/python-smartpm_git.bb
> @@ -23,6 +23,7 @@ SRC_URI = "\
>             file://smart-add-for-rpm-ignoresize-check.patch \
>             file://smart-already-installed-message.patch \
>             file://smart-set-noprogress-for-pycurl.patch \
> +          file://smart-cache.py-getPackages-matches-name-version.patch \
>            "
>
>   SRCREV = "407a7eca766431257dcd1da15175cc36a1bb22d0"
>

