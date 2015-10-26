Return-Path: <saul.wold@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3049360657
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 18:04:33 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 26 Oct 2015 11:03:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,201,1444719600"; d="scan'208";a="835437500"
Received: from fburke-mobl1.amr.corp.intel.com ([10.254.102.233])
	by orsmga002.jf.intel.com with ESMTP; 26 Oct 2015 11:03:13 -0700
Message-ID: <1445882593.18706.73.camel@intel.com>
From: Saul Wold <saul.wold@intel.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Mon, 26 Oct 2015 11:03:13 -0700
In-Reply-To: <5ca9afcb13639cc38ed268cae4a82709c148759c.1445631234.git.bruce.ashfield@windriver.com>
References: <cover.1445631234.git.bruce.ashfield@windriver.com>
	<5ca9afcb13639cc38ed268cae4a82709c148759c.1445631234.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.12.11 (3.12.11-1.fc21) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/6] linux-yocto: skip kernel meta data branches when finding machine branch
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
X-List-Received-Date: Mon, 26 Oct 2015 18:04:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-10-23 at 16:18 -0400, Bruce Ashfield wrote:
> Before the fetcher validated the specified SRCREV was reachable on a
> specified branch, linux-yocto style kernel's were comparing the value
> of KBRANCH and branch on the SRC_URI and then allowing a SRC_URI
> specified branch to override KBRANCH.
> 
> With the introduction of kernel meta data on the SRC_URI, this routine
> is incorrectly picking up a kernel-cache repository and then attempting
> to apply that branch information to the kernel repository.
> 
> The rationalization of the branch specification is largely no longer
> required, and will may be removed in the future. But for now, to keep
> changes minimal, we can simply not return branch information that comes
> from kernel meta data by checking the 'type' parameter and skipping
> if it is of type 'kmeta'.
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Tested-by: Saul Wold <sgw@linux.intel.com>

> ---
>  meta/classes/kernel-yocto.bbclass | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index 325f94c73560..00d9667fe0a6 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -52,7 +52,9 @@ def get_machine_branch(d, default):
>          parm = urldata.parm
>          if "branch" in parm:
>              branches = urldata.parm.get("branch").split(',')
> -            return branches[0]
> +            btype = urldata.parm.get("type")
> +            if btype != "kmeta":
> +                return branches[0]
>  	    
>      return default
>  



