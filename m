Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 09FDA6E79B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 12:19:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Feb 2014 04:19:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,505,1389772800"; d="scan'208";a="485770083"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.45])
	by orsmga002.jf.intel.com with ESMTP; 19 Feb 2014 04:19:54 -0800
Date: Wed, 19 Feb 2014 14:19:53 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Kai Kang <kai.kang@windriver.com>
Message-ID: <20140219121953.GD22316@lpalcu-linux>
References: <1392807566-15114-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1392807566-15114-1-git-send-email-kai.kang@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] update-rc.d.bbclass: fix inhibit check
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
X-List-Received-Date: Wed, 19 Feb 2014 12:19:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 19, 2014 at 06:59:26PM +0800, Kai Kang wrote:
> In update-rc.d.bbclass it checks variable INITSCRIPT_PACKAGES to avoid
> inherit this class. But it is wrong logic to check INITSCRIPT_PACKAGES.
> When 'sysvinit' is in 'DISTRO_FEATURES', INITSCRIPT_PACKAGES will not be
> checked.
s/INITSCRIPT_PACKAGES/INHIBIT_UPDATERCD_BBCLASS/ above will make more
sense, I guess.

Because, as I see it, that 'if' will evaluate to True if 'sysvinit' is in
DISTRO_FEATURES, irrespective of how INHIBIT_UPDATERCD_BBCLASS is set...
which is a little bit wrong.

So, I think you just need to adjust the commit message.

laurentiu

> 
> Replace 'or' with 'and' to fix it.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/classes/update-rc.d.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
> index 4b92d8d..0ac2af7 100644
> --- a/meta/classes/update-rc.d.bbclass
> +++ b/meta/classes/update-rc.d.bbclass
> @@ -117,7 +117,7 @@ python populate_packages_updatercd () {
>  
>      # Check that this class isn't being inhibited (generally, by
>      # systemd.bbclass) before doing any work.
> -    if oe.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d) or \
> +    if oe.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d) and \
>         not d.getVar("INHIBIT_UPDATERCD_BBCLASS", True):
>          pkgs = d.getVar('INITSCRIPT_PACKAGES', True)
>          if pkgs == None:
> -- 
> 1.8.1.2
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

