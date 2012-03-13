Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7UCz-0004ar-0w
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 17:04:21 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Mar 2012 08:55:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="120606980"
Received: from unknown (HELO [10.255.15.137]) ([10.255.15.137])
	by orsmga002.jf.intel.com with ESMTP; 13 Mar 2012 08:54:35 -0700
Message-ID: <4F5F6DBB.6060401@linux.intel.com>
Date: Tue, 13 Mar 2012 08:54:35 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1330749589.git.otavio@ossystems.com.br>
	<57c7884c358bda5259c0cef0ec6fb10bc47eb158.1330749589.git.otavio@ossystems.com.br>
In-Reply-To: <57c7884c358bda5259c0cef0ec6fb10bc47eb158.1330749589.git.otavio@ossystems.com.br>
Subject: Re: [PATCH 1/1] image.bbclass: fix rootfs generation without package management tools
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Mar 2012 16:04:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/02/2012 08:40 PM, Otavio Salvador wrote:
> When building without package management tools the
> ROOTFS_BOOTSTRAP_INSTALL packages need to be available to provide the
> bare minimal for rootfs unconfigure postinsts to be on first boot.
>
> Those packages where being include in core-image.bbclass' based images
> however every image needs those available for proper rootfs generation.
>
> Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
> ---
>   meta/classes/core-image.bbclass |    2 --
>   meta/classes/image.bbclass      |    7 +++++--
>   2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
> index 668297b..e2ad0fc 100644
> --- a/meta/classes/core-image.bbclass
> +++ b/meta/classes/core-image.bbclass
> @@ -51,8 +51,6 @@ CORE_IMAGE_BASE_INSTALL = '\
>       task-core-boot \
>       task-base-extended \
>       \
> -    ${@base_contains("IMAGE_FEATURES", "package-management", "", "${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)} \
> -    \
>       ${CORE_IMAGE_EXTRA_INSTALL} \
>       '
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index dfce381..8e9da99 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -5,7 +5,7 @@ inherit imagetest-${IMAGETEST}
>
>   LICENSE = "MIT"
>   PACKAGES = ""
> -RDEPENDS += "${IMAGE_INSTALL} ${LINGUAS_INSTALL} ${NORMAL_FEATURE_INSTALL}"
> +RDEPENDS += "${IMAGE_INSTALL} ${LINGUAS_INSTALL} ${NORMAL_FEATURE_INSTALL} ${ROOTFS_BOOTSTRAP_INSTALL}"
>   RRECOMMENDS += "${NORMAL_FEATURE_INSTALL_OPTIONAL}"
>
>   INHIBIT_DEFAULT_DEPS = "1"
> @@ -14,6 +14,9 @@ INHIBIT_DEFAULT_DEPS = "1"
>   IMAGE_FEATURES ?= ""
>   IMAGE_FEATURES[type] = "list"
>
> +# rootfs bootstrap install
> +ROOTFS_BOOTSTRAP_INSTALL = "${@base_contains("IMAGE_FEATURES", "package-management", "", "${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)}"
> +
>   # packages to install from features
>   FEATURE_INSTALL = "${@' '.join(oe.packagegroup.required_packages(oe.data.typed_value('IMAGE_FEATURES', d), d))}"
>   FEATURE_INSTALL_OPTIONAL = "${@' '.join(oe.packagegroup.optional_packages(oe.data.typed_value('IMAGE_FEATURES', d), d))}"
> @@ -52,7 +55,7 @@ PACKAGE_GROUP_doc-pkgs[optional] = "1"
>   IMAGE_INSTALL ?= ""
>   IMAGE_INSTALL[type] = "list"
>   IMAGE_BASENAME[export] = "1"
> -export PACKAGE_INSTALL ?= "${IMAGE_INSTALL} ${FEATURE_INSTALL}"
> +export PACKAGE_INSTALL ?= "${IMAGE_INSTALL} ${ROOTFS_BOOTSTRAP_INSTALL} ${FEATURE_INSTALL}"
>   PACKAGE_INSTALL_ATTEMPTONLY ?= "${FEATURE_INSTALL_OPTIONAL}"
>
>   # Images are generally built explicitly, do not need to be part of world.

Merged into OE-Core

Thanks
	Sau!


