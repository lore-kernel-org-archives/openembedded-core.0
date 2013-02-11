Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1U4re6-0004o3-2L
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Feb 2013 12:34:02 +0100
Message-ID: <5118D36A.60700@communistcode.co.uk>
Date: Mon, 11 Feb 2013 11:18:02 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130109 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAJTo0Lbf+qsJd2R_39bN2GDHZNbncKPZFa1VUQiHn7USVZy_iA@mail.gmail.com>
	<1360336833-14523-1-git-send-email-ml@communistcode.co.uk>
In-Reply-To: <1360336833-14523-1-git-send-email-ml@communistcode.co.uk>
Subject: Re: [PATCHv2] packagegroup-core-boot: add VIRTUAL-RUNTIME_network_manager
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Feb 2013 11:34:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/02/13 15:20, ml@communistcode.co.uk wrote:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>
> Now netbase has been split into netbase and init-ifupdown, the user should
> be able to make a choice on which network manager to install, and not be
> forced to install init-ifupdown alongside if they wish to use a vanilla copy
> of packagegroup-core-boot
>
> v2:
> - Update packagage-core-x11-sato to use the new variable
>
> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> ---
>   meta/recipes-core/packagegroups/packagegroup-core-boot.bb     | 3 ++-
>   meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb | 3 ++-
>   2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> index b9183a8..a714879 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> @@ -29,6 +29,7 @@ VIRTUAL-RUNTIME_login_manager ?= "tinylogin"
>   VIRTUAL-RUNTIME_init_manager ?= "${DISTRO_FEATURES_INITMAN}"
>   VIRTUAL-RUNTIME_initscripts ?= "${@base_contains('DISTRO_FEATURES', 'sysvinit', 'initscripts', '',d)}"
>   VIRTUAL-RUNTIME_keymaps ?= "keymaps"
> +VIRTUAL-RUNTIME_network_manager ?= "init-ifupdown"
>   
>   RDEPENDS_${PN} = "\
>       base-files \
> @@ -38,7 +39,7 @@ RDEPENDS_${PN} = "\
>       ${@base_contains("MACHINE_FEATURES", "keyboard", "${VIRTUAL-RUNTIME_keymaps}", "", d)} \
>       modutils-initscripts \
>       netbase \
> -    init-ifupdown \
> +    ${VIRTUAL-RUNTIME_network_manager} \
>       ${VIRTUAL-RUNTIME_login_manager} \
>       ${VIRTUAL-RUNTIME_init_manager} \
>       ${VIRTUAL-RUNTIME_initscripts} \
> diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
> index a4413be..7c000ab 100644
> --- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
> +++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
> @@ -26,6 +26,8 @@ RDEPENDS_${PN} = "\
>   NETWORK_MANAGER ?= "connman-gnome"
>   NETWORK_MANAGER_libc-uclibc = ""
>   
> +VIRTUAL-RUNTIME_network_manager = "${NETWORK_MANAGER}"
> +
>   SUMMARY_${PN}-base = "Sato desktop - base packages"
>   RDEPENDS_${PN}-base = "\
>       matchbox-desktop \
> @@ -40,7 +42,6 @@ RDEPENDS_${PN}-base = "\
>       gtk-sato-engine \
>       shutdown-desktop \
>       libsdl \
> -    ${NETWORK_MANAGER} \
>       "
>   
>   # pcmanfm doesn't work on mips

Ok, this isn't going to work as I intended, VIRTUAL-RUNTIME can only be 
set in the distro configuration so we can't have it set on a per image 
basis. I'm not sure how the best way to solve this is now, suggestions 
welcomed...

Regards,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



