Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3A1EA71A72
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 04:59:29 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP; 12 Dec 2016 20:59:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,340,1477983600"; d="scan'208";a="1081067507"
Received: from mauric9x-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.158.7])
	by fmsmga001.fm.intel.com with ESMTP; 12 Dec 2016 20:59:29 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Tue, 13 Dec 2016 17:59:27 +1300
Message-ID: <19498001.0ZzLqTTt5f@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.8.12-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <f7797b9e72ed6e6f7e05be8868b73c68a4ee1a79.1479363545.git.liezhi.yang@windriver.com>
References: <cover.1479363545.git.liezhi.yang@windriver.com>
	<f7797b9e72ed6e6f7e05be8868b73c68a4ee1a79.1479363545.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/8] oe-publish-sdk: add pyshtables.py to .gitignore
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
X-List-Received-Date: Tue, 13 Dec 2016 04:59:30 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wed, 16 Nov 2016 22:19:33 Robert Yang wrote:
> Fixed:
> MACHINE = "qemux86-64"
> require conf/multilib.conf
> MULTILIBS = "multilib:lib32"
> DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
> 
> $ bitbake core-image-minimal -cpopulate_sdk_ext
> [snip]
> ERROR: Failed to update metadata as there have been changes made to it.
> Aborting.\nERROR: Changed files:\nb' M
> poky/bitbake/lib/bb/pysh/pyshtables.py\\n'\n" [snip]
> 
> This is because the test case will run twice
> (environment-setup-core2-64-poky-linux and
> environment-setup-x86-pokymllib32-linux), it would fail in the second
> run since pyshtables.py is regenerated in the first run. This file is
> generated automatically, publish it doesn't make any sense, so add it to
> .gitignore.
> 
> [YOCTO #10647]

The actual fix looks OK but I don't think 10647 is really the right bug 
number. Coincidentally today someone else reported this issue, so this would 
probably be a better one:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=10796
 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  scripts/oe-publish-sdk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/oe-publish-sdk b/scripts/oe-publish-sdk
> index d95c623..e2b1b95 100755
> --- a/scripts/oe-publish-sdk
> +++ b/scripts/oe-publish-sdk
> @@ -116,7 +116,7 @@ def publish(args):
>      cmd_common = "if [ ! -e .git ]; then"
>      cmd_common += "    git init .;"
>      cmd_common += "    mv .git/hooks/post-update.sample
> .git/hooks/post-update;" -    cmd_common += "    echo '*.pyc\n*.pyo' >
> .gitignore;"
> +    cmd_common += "    echo '*.pyc\n*.pyo\npyshtables.py' > .gitignore;"
>      cmd_common += "fi;"
>      cmd_common += "git add -A .;"
>      cmd_common += "git config user.email 'oe@oe.oe' && git config user.name
> 'OE' && git commit -q -m 'init repo' || true;"

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

