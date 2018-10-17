Return-Path: <ola.x.nilsson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id BFDC574C97
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 10:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 3DF1B184DC;
	Wed, 17 Oct 2018 12:08:50 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id LNfo_zowFLM7; Wed, 17 Oct 2018 12:08:49 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 28005183FC;
	Wed, 17 Oct 2018 12:08:49 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 115E31A061;
	Wed, 17 Oct 2018 12:08:49 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 05A7D1A05F;
	Wed, 17 Oct 2018 12:08:49 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Wed, 17 Oct 2018 12:08:48 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id EDDE817F3;
	Wed, 17 Oct 2018 12:08:48 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Wed, 17 Oct 2018 12:08:48 +0200
Received: from lnxolani1 (10.0.5.60) by xbox02.axis.com (10.0.5.16) with
	Microsoft SMTP Server id 15.0.1365.1 via Frontend Transport;
	Wed, 17 Oct 2018 12:08:48 +0200
References: <20181003090036.508-1-andrej.valek@siemens.com>
	<20181016141024.19071-1-andrej.valek@siemens.com>
User-agent: mu4e 1.0; emacs 27.0.50
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: Andrej Valek <andrej.valek@siemens.com>
In-Reply-To: <20181016141024.19071-1-andrej.valek@siemens.com>
Date: Wed, 17 Oct 2018 12:08:38 +0200
Message-ID: <jwq1s8ozxzt.fsf@axis.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] rootfs: possibility to add packages to debug rootfs
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
X-List-Received-Date: Wed, 17 Oct 2018 10:08:50 -0000
Content-Type: text/plain


Comments inline.

On Tue, Oct 16 2018, Andrej Valek wrote:

> Static libraries are not included in rootfs, it means, that sources are
> not going into debug rootfs. This option enables to install additional
> packages even if the standard package is not installed.
>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  meta/classes/image.bbclass             |  4 +++-
>  meta/classes/populate_sdk_base.bbclass |  2 +-
>  meta/lib/oe/package_manager.py         | 11 +++++++++++
>  meta/lib/oe/rootfs.py                  |  3 +++
>  4 files changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 34fdbb0850..452b1ad391 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -38,6 +38,8 @@ IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs empty-root-password
>  # Generate companion debugfs?
>  IMAGE_GEN_DEBUGFS ?= "0"
>  
> +# These pacackages will be installed as additional into debug rootfs
> +IMAGE_INSTALL_DEBUGFS ?= ""
>  
>  # These packages will be removed from a read-only rootfs after all other
>  # packages have been installed
> @@ -125,7 +127,7 @@ def rootfs_variables(d):
>                   'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_LINK_NAME','IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','IMAGE_FSTYPES','IMAGE_INSTALL_COMPLEMENTARY','IMAGE_LINGUAS',
>                   'MULTILIBRE_ALLOW_REP','MULTILIB_TEMP_ROOTFS','MULTILIB_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIANTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS',
>                   'PACKAGE_ARCHS','PACKAGE_CLASSES','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI','INTERCEPT_DIR','USE_DEVFS',
> -                 'CONVERSIONTYPES', 'IMAGE_GEN_DEBUGFS', 'ROOTFS_RO_UNNEEDED', 'IMGDEPLOYDIR', 'PACKAGE_EXCLUDE_COMPLEMENTARY', 'REPRODUCIBLE_TIMESTAMP_ROOTFS']
> +                 'CONVERSIONTYPES', 'IMAGE_GEN_DEBUGFS', 'ROOTFS_RO_UNNEEDED', 'IMGDEPLOYDIR', 'PACKAGE_EXCLUDE_COMPLEMENTARY', 'REPRODUCIBLE_TIMESTAMP_ROOTFS', 'IMAGE_INSTALL_DEBUGFS']
>      variables.extend(rootfs_command_variables(d))
>      variables.extend(variable_depends(d))
>      return " ".join(variables)
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index d9a391c613..677ba3cf12 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -296,7 +296,7 @@ def sdk_command_variables(d):
>  def sdk_variables(d):
>      variables = ['BUILD_IMAGES_FROM_FEEDS','SDK_OS','SDK_OUTPUT','SDKPATHNATIVE','SDKTARGETSYSROOT','SDK_DIR','SDK_VENDOR','SDKIMAGE_INSTALL_COMPLEMENTARY','SDK_PACKAGE_ARCHS','SDK_OUTPUT',
>                   'SDKTARGETSYSROOT','MULTILIB_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIANTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS','PACKAGE_ARCHS',
> -                 'PACKAGE_CLASSES','TARGET_VENDOR','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI', 'PACKAGE_EXCLUDE_COMPLEMENTARY']
> +                 'PACKAGE_CLASSES','TARGET_VENDOR','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI', 'PACKAGE_EXCLUDE_COMPLEMENTARY', 'IMAGE_INSTALL_DEBUGFS']
>      variables.extend(sdk_command_variables(d))
>      return " ".join(variables)
>  
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
> index 8f4b42b0da..1316a284e7 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -594,6 +594,17 @@ class PackageManager(object, metaclass=ABCMeta):
>              # And now delete the binary locales
>              self.remove(fnmatch.filter(self.list_installed(), "glibc-binary-localedata-*"), False)
>  
> +    def install_additional(self):
> +        """
> +        Install additional packages. Possibility to install additional packages,
> +        which are not automatically installed via complementary packages of
> +        standard one, e.g. debug packages of static library
> +        """
> +        additional_pkgs =  self.d.getVar('IMAGE_INSTALL_DEBUGFS')
> +        if additional_pkgs:
> +            bb.note("Installing additional packages ...")
> +            self.install(additional_pkgs.split(), attempt_only=True)

Do we actually need this function?  The name is completely disconnected
from what it actually does, and the same should be achievable with

self.pm.install((d.getVar('IMAGE_INSTALL_DEBUGFS') or '').split(),
                attempt_only=True)

in rootfs.py.  There is no reason for package_manager.py to be aware of
the IMAGE_INSTALL_DEBUGFS variable.

Besides, this patch prints the "Install additional packages" twice.
That message should be improved as well, "Install extra debugfs
packages" looks better to me.

>      def deploy_dir_lock(self):
>          if self.deploy_dir is None:
>              raise RuntimeError("deploy_dir is not set!")
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index ddda552263..bf3d4bcf38 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -148,6 +148,9 @@ class Rootfs(object, metaclass=ABCMeta):
>              bb.note("  Install complementary '*-src' packages...")
>              self.pm.install_complementary('*-src')
>  
> +        bb.note("  Install additional packages...")
> +        self.pm.install_additional()
> +
>          bb.note("  Rename debug rootfs...")
>          try:
>              shutil.rmtree(self.image_rootfs + '-dbg')
> -- 
> 2.11.0

-- 
Ola x Nilsson

