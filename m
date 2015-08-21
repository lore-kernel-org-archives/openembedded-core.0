Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C719B60557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 20:02:42 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 21 Aug 2015 13:02:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,723,1432623600"; d="scan'208";a="753085360"
Received: from besquive-mobl2.zpn.intel.com (HELO
	besquive-mobl2.amr.corp.intel.com) ([10.219.17.195])
	by orsmga001.jf.intel.com with ESMTP; 21 Aug 2015 13:02:35 -0700
Message-ID: <1440187353.6529.24.camel@linux.intel.com>
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: leonardo.sandoval.gonzalez@linux.intel.com, 
	openembedded-core@lists.openembedded.org, georgex.l.musat@intel.com
In-Reply-To: <1438614064-10290-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
References: <1438614064-10290-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
Organization: Intel Corporation
Date: Fri, 21 Aug 2015 15:02:33 -0500
Mime-Version: 1.0
X-Mailer: Evolution 3.16.4 (3.16.4-2.fc22) 
Subject: Re: [PATCH] init-install-efi.sh: Avoid /mnt/mtab creation if already present
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: benjamin.esquivel@linux.intel.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Aug 2015 20:02:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Leo, this fix looks good to me, can you mention how did you test
this?

On Mon, 2015-08-03 at 15:01 +0000,
leonardo.sandoval.gonzalez@linux.intel.com wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> 
> The base-files recipe installs /mnt/mtab (it is a softlink of 
> /proc/mounts),
> so if an image includes the latter, there is no new to created it 
> again inside
> the install-efi.sh script, otherwise an error may occur as indicated 
> on the
> bug's site.
> 
> [YOCTO #7971]
> 
> Signed-off-by: Leonardo Sandoval <
> leonardo.sandoval.gonzalez@linux.intel.com>
> ---
>  meta/recipes-core/initrdscripts/files/init-install-efi.sh | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/initrdscripts/files/init-install
> -efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> index f339b30..665d04a 100644
> --- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> +++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> @@ -109,7 +109,11 @@ rm -f /etc/udev/scripts/mount*
>  umount ${device}* 2> /dev/null || /bin/true
>  
>  mkdir -p /tmp
> -cat /proc/mounts > /etc/mtab
> +
> +# Create /etc/mtab if not present
> +if [ ! -e /etc/mtab ]; then
> +    cat /proc/mounts > /etc/mtab
> +fi
>  
>  disk_size=$(parted ${device} unit mb print | grep Disk | cut -d" " 
> -f 3 | sed -e "s/MB//")
>  
> -- 
> 1.8.4.5
> 

