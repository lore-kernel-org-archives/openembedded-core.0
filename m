Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E7E0360FE0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 19:14:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 23 Sep 2013 12:11:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,964,1371106800"; d="scan'208";a="407864537"
Received: from dvhart-mobl4.jf.intel.com (HELO [10.7.201.154]) ([10.7.201.154])
	by orsmga002.jf.intel.com with ESMTP; 23 Sep 2013 12:14:25 -0700
Message-ID: <1379963665.3463.19.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2013 12:14:25 -0700
In-Reply-To: <33c87052900b49e3f207cdc3e343ba08936a03a4.1379963382.git.dvhart@linux.intel.com>
References: <33c87052900b49e3f207cdc3e343ba08936a03a4.1379963382.git.dvhart@linux.intel.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Subject: Re: [PATCH] init-install-efi.sh: Remove unnecessary udev rules file to avoid errors
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
X-List-Received-Date: Mon, 23 Sep 2013 19:14:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-09-23 at 12:09 -0700, Darren Hart wrote:
> Fixes [YOCTO #5233]
> 
> Modeled after Chen Qi's fix to [YOCTO #3924] from oe-core commit:
> 6b6db7b4fb7aa17b8e29076decc830149b9d35bc
> init-install.sh: remove unnecessary udev rules file to avoid error messages
> 
> /etc/udev/scripts/mount.sh is removed by init-install-efi.sh, but the
> udev rules file which specifies the invocation of this script is not
> removed, thus causing the error message during a live install:
> 
> /etc/udev/scripts/mount.sh: No such file or directory
> 
> The /etc/udev/rules/automount.rules no longer works once the mount.sh
> script is removed. Remove it to avoid the error message.
> 
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> Cc: mihaix.lindner@linux.intel.com
> ---
>  meta/recipes-core/initrdscripts/files/init-install-efi.sh | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> index 23228c9..26e3174 100644
> --- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> +++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> @@ -58,6 +58,7 @@ echo "Installing image on /dev/${device}"
>  #
>  # The udev automounter can cause pain here, kill it
>  #
> +rm -f /etc/udev/rules.d/automount.rules
>  rm -f /etc/udev/scripts/mount*
>  
>  #

Note: this is completely untested. Mihai, could you confirm this
addresses the installation issue you saw?

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



