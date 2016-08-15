Return-Path: <saul.wold@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B32E96067C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 23:57:08 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 15 Aug 2016 16:57:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,527,1464678000"; d="scan'208";a="1041701817"
Received: from swold-mobl2.amr.corp.intel.com ([10.254.25.136])
	by fmsmga002.fm.intel.com with ESMTP; 15 Aug 2016 16:57:08 -0700
Message-ID: <1471305427.6975.23.camel@intel.com>
From: Saul Wold <saul.wold@intel.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 15 Aug 2016 16:57:07 -0700
In-Reply-To: <12d562d929e08f3dae1d273fb4a1b6a5f1de0021.1469570866.git.alejandro.hernandez@linux.intel.com>
References: <cover.1469570866.git.alejandro.hernandez@linux.intel.com>
	<12d562d929e08f3dae1d273fb4a1b6a5f1de0021.1469570866.git.alejandro.hernandez@linux.intel.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] initramfs-live-boot: Make sure we kill udev before switching root when live booting
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
X-List-Received-Date: Mon, 15 Aug 2016 23:57:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2016-07-26 at 22:10 +0000, Alejandro Hernandez wrote:
> When live booting, we need to make sure the running udev processes
> are killed
> to avoid unexepected behavior, we do this just before switching root,
> once we do, a new udev process will be spawned from init and will
> take care
> of whatever work was still missing
> 
> [YOCTO #9520]
> 
> Signed-off-by: Alejandro Hernandez
> <alejandro.hernandez@linux.intel.com>
Reviewed-by: Saul Wold <sgw@linux.intel.com>

> ---
>  meta/recipes-core/initrdscripts/files/init-live.sh | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh
> b/meta/recipes-core/initrdscripts/files/init-live.sh
> index 09fb479..441b41c 100644
> --- a/meta/recipes-core/initrdscripts/files/init-live.sh
> +++ b/meta/recipes-core/initrdscripts/files/init-live.sh
> @@ -80,7 +80,9 @@ read_args() {
>  boot_live_root() {
>      # Watches the udev event queue, and exits if all current events
> are handled
>      udevadm settle --timeout=3 --quiet
> -    killall "${_UDEV_DAEMON##*/}" 2>/dev/null
> +    # Kills the current udev running processes, which survived after
> +    # device node creation events were handled, to avoid unexpected
> behavior
> +    killall -9 "${_UDEV_DAEMON##*/}" 2>/dev/null
>  
>      # Allow for identification of the real root even after boot
>      mkdir -p  ${ROOT_MOUNT}/media/realroot
> -- 
> 2.6.6
> 

