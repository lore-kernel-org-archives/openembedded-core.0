Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Si8TG-0000gx-KI
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 20:20:38 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Jun 2012 11:09:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="183796218"
Received: from unknown (HELO [10.255.12.175]) ([10.255.12.175])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jun 2012 11:09:49 -0700
Message-ID: <4FE4B4ED.7000109@linux.intel.com>
Date: Fri, 22 Jun 2012 11:09:49 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <644f893ebb1c70b7081a82cef39b10b7233463cd.1340166208.git.lianhao.lu@intel.com>
	<622f94dd940787bff2cf59299be285cfb6ddec98.1340166208.git.lianhao.lu@intel.com>
In-Reply-To: <622f94dd940787bff2cf59299be285cfb6ddec98.1340166208.git.lianhao.lu@intel.com>
Subject: Re: [PATCH V2 3/3] core-image/misc: Added new IMAGE_FEATURE eclipse-support.
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
X-List-Received-Date: Fri, 22 Jun 2012 18:20:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/19/2012 09:25 PM, Lianhao Lu wrote:
> Added a new IMAGE_FEATURES eclipse-support to support developing user
> applications through Eclipse plugin.
>
Do we really need a new IMAGE_FEATURE?  We already have tools-debug 
which includes the tcf-agent, can we not just add the 
openssh-sftp-server package to the task-core-tools-debug.bb?  That would 
work and not add yet another IMAGE_FEATURE.

Sau!

> Signed-off-by: Lianhao Lu<lianhao.lu@intel.com>
> ---
>   meta/classes/core-image.bbclass                    |    2 ++
>   meta/conf/multilib.conf                            |    1 +
>   .../tasks/task-core-eclipse-support.bb             |   17 +++++++++++++++++
>   meta/recipes-sato/images/core-image-sato-sdk.bb    |    2 +-
>   4 files changed, 21 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-core/tasks/task-core-eclipse-support.bb
>
> diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
> index 6b207d7..8505d6f 100644
> --- a/meta/classes/core-image.bbclass
> +++ b/meta/classes/core-image.bbclass
> @@ -28,6 +28,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
>   # - ssh-server-dropbear - SSH server (dropbear)
>   # - ssh-server-openssh  - SSH server (openssh)
>   # - debug-tweaks        - makes an image suitable for development
> +# - eclipse-support     - Support Eclipse plugin
>   #
>   PACKAGE_GROUP_apps-console-core = "task-core-apps-console"
>   PACKAGE_GROUP_x11-mini = "task-core-x11-mini"
> @@ -46,6 +47,7 @@ PACKAGE_GROUP_ssh-server-dropbear = "task-core-ssh-dropbear"
>   PACKAGE_GROUP_ssh-server-openssh = "task-core-ssh-openssh"
>   PACKAGE_GROUP_package-management = "${ROOTFS_PKGMANAGE}"
>   PACKAGE_GROUP_qt4-pkgs = "task-core-qt-demos"
> +PACKAGE_GROUP_eclipse-support = "task-core-eclipse-support task-core-tools-debug task-core-tools-profile"
>
>
>   # IMAGE_FEAETURES_REPLACES_foo = 'bar1 bar2'
> diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
> index cea8694..ee21d40 100644
> --- a/meta/conf/multilib.conf
> +++ b/meta/conf/multilib.conf
> @@ -618,6 +618,7 @@ BBCLASSEXTEND_append_pn-task-core-basic = " ${MULTILIBS}"
>   BBCLASSEXTEND_append_pn-task-core-boot = " ${MULTILIBS}"
>   BBCLASSEXTEND_append_pn-task-core-clutter = " ${MULTILIBS}"
>   BBCLASSEXTEND_append_pn-task-core-console = " ${MULTILIBS}"
> +BBCLASSEXTEND_append_pn-task-core-eclipse-support = " ${MULTILIBS}"
>   BBCLASSEXTEND_append_pn-task-core-gtk-directfb = " ${MULTILIBS}"
>   BBCLASSEXTEND_append_pn-task-core-lsb = " ${MULTILIBS}"
>   BBCLASSEXTEND_append_pn-task-core-nfs = " ${MULTILIBS}"
> diff --git a/meta/recipes-core/tasks/task-core-eclipse-support.bb b/meta/recipes-core/tasks/task-core-eclipse-support.bb
> new file mode 100644
> index 0000000..78a21a4
> --- /dev/null
> +++ b/meta/recipes-core/tasks/task-core-eclipse-support.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION = "Agent for Eclipse plugin task for Poky"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
> +                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +PR = "r0"
> +
> +PACKAGES = "\
> +    ${PN} \
> +    ${PN}-dev \
> +    ${PN}-dbg \
> +    "
> +
> +ALLOW_EMPTY = "1"
> +
> +RDEPENDS_${PN} = "tcf-agent \
> +	openssh-sftp-server \
> +	"
> diff --git a/meta/recipes-sato/images/core-image-sato-sdk.bb b/meta/recipes-sato/images/core-image-sato-sdk.bb
> index 5bb9469..0630314 100644
> --- a/meta/recipes-sato/images/core-image-sato-sdk.bb
> +++ b/meta/recipes-sato/images/core-image-sato-sdk.bb
> @@ -5,7 +5,7 @@ DESCRIPTION = "Image with Sato support that includes everything within \
>   core-image-sato plus meta-toolchain, development headers and libraries to \
>   form a standalone SDK."
>
> -IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES} dev-pkgs tools-sdk qt4-pkgs"
> +IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES} dev-pkgs tools-sdk qt4-pkgs eclipse-support"
>   EXTRA_IMAGE_FEATURES += "tools-debug tools-profile tools-testapps debug-tweaks"
>
>   SSHSERVER_IMAGE_FEATURES = "ssh-server-openssh"


