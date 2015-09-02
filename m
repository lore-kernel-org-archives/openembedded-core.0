Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4FE327702A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 19:18:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 02 Sep 2015 12:18:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,455,1437462000"; d="scan'208";a="796518943"
Received: from lsandov1-mobl-linux.zpn.intel.com (HELO [10.219.5.40])
	([10.219.5.40])
	by orsmga002.jf.intel.com with ESMTP; 02 Sep 2015 12:18:08 -0700
Message-ID: <55E74BB9.9040102@linux.intel.com>
Date: Wed, 02 Sep 2015 14:19:21 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1438614064-10290-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <1438614064-10290-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
Subject: Re: [PATCH] init-install-efi.sh: Avoid /mnt/mtab creation if already present
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
X-List-Received-Date: Wed, 02 Sep 2015 19:18:11 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

ping..

This patch has not been merged and I believe the reason is that I did 
not label it as V2 (my fault). Instead, V1 [1] was merged (which is 
fine, it gives some message to the user).

[1] 
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=445c49ce5007eb0c0aa14680c41b79e7764d8882

On 08/03/2015 10:01 AM, leonardo.sandoval.gonzalez@linux.intel.com wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>
> The base-files recipe installs /mnt/mtab (it is a softlink of /proc/mounts),
> so if an image includes the latter, there is no new to created it again inside
> the install-efi.sh script, otherwise an error may occur as indicated on the
> bug's site.
>
> [YOCTO #7971]
>
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> ---
>   meta/recipes-core/initrdscripts/files/init-install-efi.sh | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> index f339b30..665d04a 100644
> --- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> +++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> @@ -109,7 +109,11 @@ rm -f /etc/udev/scripts/mount*
>   umount ${device}* 2> /dev/null || /bin/true
>
>   mkdir -p /tmp
> -cat /proc/mounts > /etc/mtab
> +
> +# Create /etc/mtab if not present
> +if [ ! -e /etc/mtab ]; then
> +    cat /proc/mounts > /etc/mtab
> +fi
>
>   disk_size=$(parted ${device} unit mb print | grep Disk | cut -d" " -f 3 | sed -e "s/MB//")
>
>

