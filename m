Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UJGN9-0000ct-5m
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Mar 2013 05:48:05 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Mar 2013 21:31:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,896,1355126400"; d="scan'208";a="310777584"
Received: from unknown (HELO [10.255.13.200]) ([10.255.13.200])
	by fmsmga002.fm.intel.com with ESMTP; 22 Mar 2013 21:30:56 -0700
Message-ID: <514D3000.6090205@linux.intel.com>
Date: Fri, 22 Mar 2013 21:30:56 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
	<9be960b9dc1f6970577d93d349c47800271ec87c.1363973088.git.ross.burton@intel.com>
In-Reply-To: <9be960b9dc1f6970577d93d349c47800271ec87c.1363973088.git.ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 19/22] packagegroup-core-boot: revert to specifying sysvinit as default init manager
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 23 Mar 2013 04:48:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/22/2013 10:38 AM, Ross Burton wrote:
> Don't follow DISTRO_FEATURES_INITMAN as that makes the packagegroups rebuild if
> you switch init manager.
>
This change still seems to include a reference to 
DISTRO_FEATURES_INITMAN for the systemd-compat-units line, is that correct?

  ${@base_contains('DISTRO_FEATURES_INITMAN', 'systemd', 
'systemd-compat-units', '',d)} \


Sau!



> As in hybrid situations there's generally a clear primary and minimal init
> manager choice, so change VIRTUAL-RUNTIME_init_manager to set the primary init
> manager, and roll your own groups/images for the secondary.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-core/packagegroups/packagegroup-core-boot.bb |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> index e73b46e..7f278f6 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> @@ -26,8 +26,8 @@ RCONFLICTS_${PN} = "task-core-boot"
>   # Distro can override the following VIRTUAL-RUNTIME providers:
>   VIRTUAL-RUNTIME_dev_manager ?= "udev"
>   VIRTUAL-RUNTIME_login_manager ?= "tinylogin"
> -VIRTUAL-RUNTIME_init_manager ?= "${DISTRO_FEATURES_INITMAN}"
> -VIRTUAL-RUNTIME_initscripts ?= "${@base_contains('DISTRO_FEATURES_INITMAN', 'sysvinit', 'initscripts', '',d)}"
> +VIRTUAL-RUNTIME_init_manager ?= "sysvinit"
> +VIRTUAL-RUNTIME_initscripts ?= "initscripts"
>   VIRTUAL-RUNTIME_keymaps ?= "keymaps"
>
>   RDEPENDS_${PN} = "\
>


