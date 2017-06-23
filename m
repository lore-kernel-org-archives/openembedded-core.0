Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 27030780C3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 14:08:09 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Jun 2017 07:08:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,378,1493708400"; d="scan'208";a="277858038"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by fmsmga004.fm.intel.com with ESMTP; 23 Jun 2017 07:08:01 -0700
Message-ID: <1498227433.31575.79.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Jun 2017 09:17:13 -0500
In-Reply-To: <20170608204022.427-1-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20170608204022.427-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: Re: [PATCH] context: allow test execution with buildhistory unless version-going-backwards is present
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
X-List-Received-Date: Fri, 23 Jun 2017 14:08:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The proposed approach is not the best one as discussed by RP [1]:

""Just as another note, 

ERROR_QA_remove = "version-going-backwards"
WARN_QA_remove = "version-going-backwards"

doesn't work since we can't then enable this check and the test cases
test_buildhistory_buildtime_pr_backwards and test_buildhistory_diff then
fail."

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=11580#c7


On Thu, 2017-06-08 at 13:40 -0700,
leonardo.sandoval.gonzalez@linux.intel.com wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> 
> Users constantly running oe-selftest find annoying to disable buildhistory before running
> 'oe-selftest' then enabling after it. To lessen the buildhistory restriction, allow buildhistory
> unless 'version-going-backwards' is present on ERROR_QA bitbake variable.
> 
> [YOCTO #11580]
> 
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> ---
>  meta/lib/oeqa/selftest/context.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
> index ca73070c0b..f061b987b0 100644
> --- a/meta/lib/oeqa/selftest/context.py
> +++ b/meta/lib/oeqa/selftest/context.py
> @@ -150,7 +150,8 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
>          _check_required_env_variables(["BUILDDIR"])
>          _check_presence_meta_selftest()
>  
> -        if "buildhistory.bbclass" in self.tc.td["BBINCLUDED"]:
> +        # buildhistory introduce QA 'version-going-backwards' errors so stop if the latter are enabled
> +        if "buildhistory.bbclass" in self.tc.td["BBINCLUDED"] and 'version-going-backwards' in self.tc.td['ERROR_QA']:
>              self.tc.logger.error("You have buildhistory enabled already and this isn't recommended for selftest, please disable it first.")
>              raise OEQAPreRun
>  



