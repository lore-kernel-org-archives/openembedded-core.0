Return-Path: <laurentiu.palcu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B633065D56
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 11:00:14 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 15 Oct 2014 03:50:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="400568855"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.104.113])
	by FMSMGA003.fm.intel.com with ESMTP; 15 Oct 2014 03:52:57 -0700
Date: Wed, 15 Oct 2014 14:00:09 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20141015110009.GA9446@lpalcu-linux>
References: <cover.1413364849.git.hongxu.jia@windriver.com>
	<ddbf3f85e6178376e6f76048d40ea3e2b8d85a2e.1413364849.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <ddbf3f85e6178376e6f76048d40ea3e2b8d85a2e.1413364849.git.hongxu.jia@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] multilib.bbclass/package_manager.py: fix <multilib>-meta-toolchain build failure
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
X-List-Received-Date: Wed, 15 Oct 2014 11:00:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hongxu,

On Wed, Oct 15, 2014 at 05:23:16PM +0800, Hongxu Jia wrote:
> There is a failure to build lib32-meta-toolchain:
> ...
> |ERROR: lib32-packagegroup-core-standalone-sdk-target not found in the base
> feeds (qemux86_64 x86 noarch any all).
> ...
> 
> In package_manager.py, the variable 'DEFAULTTUNE_virtclass-multilib-lib32'
> is used to process multilib image/toolchain. But for the build of lib32-
> meta-toolchain, the value of 'DEFAULTTUNE_virtclass-multilib-lib32' is
> deleted. In 'bitbake lib32-meta-toolchain -e', we got:
> ...
> |# $DEFAULTTUNE_virtclass-multilib-lib32 [2 operations]
> |#   set? /home/jiahongxu/yocto/build-20141010-yocto/conf/local.conf:237
> |#     "x86"
> |#   del data_smart.py:406 [finalize]
> |#     ""
> |# pre-expansion value:
> |#   "None"
> ...
> 
> The commit 899d45b90061eb3cf3e71029072eee42cd80930c in oe-core deleted
> it at DataSmart.finalize
> ...
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Tue May 31 23:52:50 2011 +0100
> 
>     bitbake/data_smart: Change overrides behaviour to remove
>        expanded variables from the datastore
> ...
> 
> We add an internal variable 'DEFAULTTUNE_ML_<multilib>', assign it with the
> value of 'DEFAULTTUNE_virtclass-multilib-lib32' before deleting.
> 
> In package_manager.py, we use DEFAULTTUNE_virtclass-multilib-lib32 first,
> if it is not available, and try to use DEFAULTTUNE_ML_<multilib>
> 
> [YOCTO #6842]
Is this an RPM only issue? (It's not clear from the bug description...) If
not, maybe this should be fixed for the other backends too.

> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/classes/multilib.bbclass  | 1 +
>  meta/lib/oe/package_manager.py | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
> index 6e143dd..6aad894 100644
> --- a/meta/classes/multilib.bbclass
> +++ b/meta/classes/multilib.bbclass
> @@ -60,6 +60,7 @@ python multilib_virtclass_handler () {
>      newtune = e.data.getVar("DEFAULTTUNE_" + "virtclass-multilib-" + variant, False)
>      if newtune:
>          e.data.setVar("DEFAULTTUNE", newtune)
> +        e.data.setVar('DEFAULTTUNE_ML_%s' % variant, newtune)
>  }
>  
>  addhandler multilib_virtclass_handler
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
> index 27fdf26..d42cdcc 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -63,6 +63,9 @@ class RpmIndexer(Indexer):
>                      localdata = bb.data.createCopy(self.d)
>                      default_tune_key = "DEFAULTTUNE_virtclass-multilib-" + eext[1]
>                      default_tune = localdata.getVar(default_tune_key, False)
> +                    if not default_tune:
Testing for None should always be done using 'is' or 'is not'. There's a
good explanation for this in PEP8.

laurentiu

> +                        default_tune_key = "DEFAULTTUNE_ML_" + eext[1]
> +                        default_tune = localdata.getVar(default_tune_key, False)
>                      if default_tune:
>                          localdata.setVar("DEFAULTTUNE", default_tune)
>                          bb.data.update_data(localdata)
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

