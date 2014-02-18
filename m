Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 35D526EFD9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 08:37:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 Feb 2014 00:32:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,500,1389772800"; d="scan'208";a="485069793"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.45])
	by orsmga002.jf.intel.com with ESMTP; 18 Feb 2014 00:37:09 -0800
Date: Tue, 18 Feb 2014 10:37:08 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20140218083708.GQ10078@lpalcu-linux>
References: <cover.1392665521.git.raj.khem@gmail.com>
	<af841644dfc682e9774287331ef39c3cd1ede978.1392665521.git.raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <af841644dfc682e9774287331ef39c3cd1ede978.1392665521.git.raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/6] rootfs.py: Check for LDCONFIGDEPEND being empty string
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
X-List-Received-Date: Tue, 18 Feb 2014 08:37:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Khem,

On Mon, Feb 17, 2014 at 11:34:15AM -0800, Khem Raj wrote:
> We override LDCONFIGDEPEND to be empty string for uclibc
> however the current check is for it being None as a result
> the function is still executed but ldconfig-native is not
> built as dependency for rootfs when building with uclibc
> 
> Fixes errors like below
> 
> File:
> '/home/kraj/work/angstrom-repo/sources/openembedded-core/meta/lib/oe/rootfs.py',
> lineno: 191, function: _run_ldconfig
>      0187:    def _run_ldconfig(self):
>      0188:        if self.d.getVar('LDCONFIGDEPEND', True) is not None:
>      0189:            bb.note("Executing: ldconfig -r" +
> self.image_rootfs + "-c new -v")
>      0190:            self._exec_shell_cmd(['ldconfig', '-r',
> self.image_rootfs, '-c',
>  *** 0191:                                  'new', '-v'])
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/lib/oe/rootfs.py |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index d149ca3..3bcb812 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -185,7 +185,7 @@ class Rootfs(object):
>                          self._handle_intercept_failure(registered_pkgs)
>  
>      def _run_ldconfig(self):
> -        if self.d.getVar('LDCONFIGDEPEND', True) is not None:
> +        if self.d.getVar('LDCONFIGDEPEND', True) != "":
May I suggest:
           if (self.d.getVar('LDCONFIGDEPEND', True) or "") != "":
here? Otherwise, the condition will be true even if LDCONFIGDEPEND is
None.

laurentiu
>              bb.note("Executing: ldconfig -r" + self.image_rootfs + "-c new -v")
>              self._exec_shell_cmd(['ldconfig', '-r', self.image_rootfs, '-c',
>                                    'new', '-v'])
> -- 
> 1.7.10.4
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

