Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T8j9J-0007te-82
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 04:45:57 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 Sep 2012 19:33:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,363,1344236400"; d="scan'208";a="188400477"
Received: from unknown (HELO [10.255.12.252]) ([10.255.12.252])
	by azsmga001.ch.intel.com with ESMTP; 03 Sep 2012 19:33:34 -0700
Message-ID: <5045687E.7010505@linux.intel.com>
Date: Mon, 03 Sep 2012 19:33:34 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
	<1a2dd4def9f665707e0b8e99f52166906f14f1b5.1346668109.git.paul.eggleton@linux.intel.com>
In-Reply-To: <1a2dd4def9f665707e0b8e99f52166906f14f1b5.1346668109.git.paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/28] classes/core-image: remove *_IMAGE_FEATURES variables
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
X-List-Received-Date: Tue, 04 Sep 2012 02:45:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/03/2012 03:30 AM, Paul Eggleton wrote:
> This indirection does not add anything in terms of configuration and
> only serves to increase confusion; and given the nature of these it is
> unlikely they are being used outside of OE-Core. Change the sato-sdk and
> sato-dev images to be based on the main Sato image (avoiding the need
> for a common SATO_IMAGE_FEATURES variable) and eliminate all references
> to them.
>
> Fixes [YOCTO #2458].
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>   meta/classes/core-image.bbclass                    |    4 ----
>   meta/recipes-core/images/core-image-core.bb        |    2 +-
>   meta/recipes-graphics/images/core-image-clutter.bb |    2 +-
>   meta/recipes-sato/images/core-image-sato-dev.bb    |    6 ++----
>   meta/recipes-sato/images/core-image-sato-sdk.bb    |    8 +++-----
>   meta/recipes-sato/images/core-image-sato.bb        |    2 +-
>   6 files changed, 8 insertions(+), 16 deletions(-)
>
> diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
> index f401313..d6dd646 100644
> --- a/meta/classes/core-image.bbclass
> +++ b/meta/classes/core-image.bbclass
> @@ -62,10 +62,6 @@ CORE_IMAGE_EXTRA_INSTALL ?= ""
>
>   IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"
>
> -X11_IMAGE_FEATURES  = "x11-base apps-x11-core package-management"
> -ENHANCED_IMAGE_FEATURES = "${X11_IMAGE_FEATURES} apps-x11-games package-management"
> -SATO_IMAGE_FEATURES = "${ENHANCED_IMAGE_FEATURES} x11-sato ssh-server-dropbear"
> -
>   inherit image
>
>   # Create /etc/timestamp during image construction to give a reasonably sane default time setting
> diff --git a/meta/recipes-core/images/core-image-core.bb b/meta/recipes-core/images/core-image-core.bb
> index ed33e12..ea6ba7e 100644
> --- a/meta/recipes-core/images/core-image-core.bb
> +++ b/meta/recipes-core/images/core-image-core.bb
> @@ -1,7 +1,7 @@
>   DESCRIPTION = "An X11 image with simple applications such as terminal, editor, \
>   and file manager."
>
> -IMAGE_FEATURES += "apps-console-core ${X11_IMAGE_FEATURES}"
> +IMAGE_FEATURES += "apps-console-core package-management x11-base apps-x11-core"
>
>   LICENSE = "MIT"
>
> diff --git a/meta/recipes-graphics/images/core-image-clutter.bb b/meta/recipes-graphics/images/core-image-clutter.bb
> index 6c49a02..aa6e2a2 100644
> --- a/meta/recipes-graphics/images/core-image-clutter.bb
> +++ b/meta/recipes-graphics/images/core-image-clutter.bb
> @@ -1,7 +1,7 @@
>   DESCRIPTION = "An image with support for the Open GL-based toolkit Clutter, \
>   which enables development of rich and animated graphical user interfaces."
>
> -IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES}"
> +IMAGE_FEATURES += "apps-console-core package-management x11-base apps-x11-core apps-x11-games x11-sato ssh-server-dropbear"
>
>   LICENSE = "MIT"
>
> diff --git a/meta/recipes-sato/images/core-image-sato-dev.bb b/meta/recipes-sato/images/core-image-sato-dev.bb
> index 5ee9a04..b3db2e6 100644
> --- a/meta/recipes-sato/images/core-image-sato-dev.bb
> +++ b/meta/recipes-sato/images/core-image-sato-dev.bb
> @@ -2,8 +2,6 @@ DESCRIPTION = "Image with Sato for development work. It includes everything \
>   within core-image-sato plus a native toolchain, application development and \
>   testing libraries, profiling and debug symbols."
>
> -IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES} dev-pkgs"
> +require core-image-sato.bb
>
> -LICENSE = "MIT"
> -
> -inherit core-image
> +IMAGE_FEATURES += "dev-pkgs"
> diff --git a/meta/recipes-sato/images/core-image-sato-sdk.bb b/meta/recipes-sato/images/core-image-sato-sdk.bb
> index 18ed0cd..c462254 100644
> --- a/meta/recipes-sato/images/core-image-sato-sdk.bb
> +++ b/meta/recipes-sato/images/core-image-sato-sdk.bb
> @@ -2,12 +2,10 @@ DESCRIPTION = "Image with Sato support that includes everything within \
>   core-image-sato plus meta-toolchain, development headers and libraries to \
>   form a standalone SDK."
>
> -IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES} dev-pkgs tools-sdk qt4-pkgs \
> -	tools-debug tools-profile tools-testapps debug-tweaks ssh-server-openssh"
> -
> -LICENSE = "MIT"
> +require core-image-sato.bb
>
> -inherit core-image
> +IMAGE_FEATURES += "dev-pkgs tools-sdk qt4-pkgs \
> +	tools-debug tools-profile tools-testapps debug-tweaks ssh-server-openssh"
>
>   IMAGE_INSTALL += "kernel-dev"
>
> diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
> index c228a35..4bbf099 100644
> --- a/meta/recipes-sato/images/core-image-sato.bb
> +++ b/meta/recipes-sato/images/core-image-sato.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "Image with Sato, a mobile environment and visual style for \
>   mobile devices. The image supports X11 with a Sato theme, Pimlico \
>   applications, and contains terminal, editor, and file manager."
>
> -IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES}"
> +IMAGE_FEATURES += "apps-console-core package-management x11-base apps-x11-core apps-x11-games x11-sato ssh-server-dropbear"
>
Should package-management be here or should it be a DISTRO_FEATURE and 
have the ability to be enabled or disabled more on DISTRO basis?  I know 
that we explicitly disable it on core-image-minimal and have a 
ROOTFS_POSTPRESSES_COMMAND there, but I wonder about setting that up on 
a DISTRO basis?

It's part of the following:

meta/recipes-core/images/build-appliance-image.bb
meta/recipes-graphics/images/core-image-clutter.bb
meta/recipes-graphics/images/core-image-x11.bb
meta/recipes-sato/images/core-image-sato.bb

What about LSB? core-image-base or core-image-basic?


Maybe I missed something in all the rest of these changes?

Sau!





>   LICENSE = "MIT"
>
>


