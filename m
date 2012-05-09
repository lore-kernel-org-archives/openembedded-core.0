Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SS9AF-0002ZX-Nh
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 17:50:55 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 May 2012 08:41:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="138691921"
Received: from unknown (HELO envy.home) ([10.255.13.57])
	by orsmga001.jf.intel.com with ESMTP; 09 May 2012 08:41:01 -0700
Message-ID: <4FAA8FEF.9050702@linux.intel.com>
Date: Wed, 09 May 2012 08:40:31 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@windriver.com>
References: <cover.1336535085.git.bruce.ashfield@windriver.com>
	<893d8018c655f70ada731eaf5f03b178f4dfe2b3.1336535085.git.bruce.ashfield@windriver.com>
In-Reply-To: <893d8018c655f70ada731eaf5f03b178f4dfe2b3.1336535085.git.bruce.ashfield@windriver.com>
X-Enigmail-Version: 1.4.1
Cc: openembedded-core@lists.openembedded.org, poky@yoctoproject.org,
	saul.wold@intel.com
Subject: Re: [PATCH 1/1] kern-tools: checkpoint restoration for reset branches
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 May 2012 15:50:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 05/08/2012 08:48 PM, Bruce Ashfield wrote:
> Updating the SRCREV to pickup the following fix:
> 
>     createme: fix checkpoint restoration for reset branches
> 
>     The meta branch can optionally be merged out to BSP branches. This removes
>     the need to restore the checkpoint when working with the tree.  The way
>     it detects the merge is by checking to see how many branches contain the
>     meta data. If there's more than one, the branch was was merged out.
> 
>     Unless you are a BSP that isn't tracking the latest meta, and you get
>     meta and meta-orig created. That's two branches and the code opts to not
>     restore the checkpoint, which leads to configuration errors.
> 
>     The fix is simple. We allow for 2 or less branches with meta, and will
>     still restore the checkpoint. Three and up, we won't.
> 

Uhm... am I the only one for whom this language is really confusing?
"merged out" ?
"restore the checkpoint" ?
Why does a BSP using a different meta SRCREV get two meta branches?

The fix of incrementing the allowed count of meta branches honestly
feels like a bandaid. Why do we create two in the first place?

Regardless, this is a blocker for working with meta-intel, so we need
this in. But it does seem to me that a more direct solution may be
needed. Bruce, can you help fill me in re. the above?

--
Darren

> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  .../kern-tools/kern-tools-native_git.bb            |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> index b6fab39..b5e203e 100644
> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=e2bf4415f3d8
>  
>  DEPENDS = "git-native guilt-native"
>  
> -SRCREV = "9bb704df0a86578b8ae1f4c85e45089bef28e026"
> +SRCREV = "de3649840e8e3ca25bc79d2444f04a1b158a1769"
>  PR = "r12"
>  PV = "0.1+git${SRCPV}"
>  

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


