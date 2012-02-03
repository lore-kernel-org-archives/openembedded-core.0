Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RtQIV-0000LC-O8
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 22:03:56 +0100
Received: by pbbb4 with SMTP id b4so2866293pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Feb 2012 12:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Yxya+gZQjcdhUG4MoCXIeHyH/ay/QEvm/v+TB8UiKBU=;
	b=A2O/YtR4rMcQUHxVS4jcKsBu89CCmywVP4s2Kmxnv2zmaTnhWkWdajnAE7c4i26/28
	DLPU8CvTzcDJnJTP3/GivR3Atjpxz/RrzHw7Boxvqfbsau2oEMJulW3GHOHtt3zaUy3M
	eWc9errXB/vC5rZbGUIa5YLWqjVdGkxnSrxUA=
Received: by 10.68.73.100 with SMTP id k4mr20730095pbv.55.1328302557330;
	Fri, 03 Feb 2012 12:55:57 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id z5sm15516376pbc.5.2012.02.03.12.55.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 12:55:56 -0800 (PST)
Date: Fri, 3 Feb 2012 12:55:46 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Wade Farnsworth <wade_farnsworth@mentor.com>
Message-ID: <20120203205546.GB20937@sakrah.homelinux.org>
References: <4F1F26C6.8050501@mentor.com> <4F21A9CF.3020103@mentor.com>
	<4F2C3541.5000409@mentor.com> <4F2C35CD.2050303@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4F2C35CD.2050303@mentor.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 3/3] systemtap: build and install uprobes.ko
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
X-List-Received-Date: Fri, 03 Feb 2012 21:03:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (03/02/12 12:30), Wade Farnsworth wrote:
> SystemTap needs to provide uprobes.ko in order to support user space
> probing.  Build and install the module on systems that support it.
> 
> Additionally, split off common bits into systemtap_git.inc.
> 
> Signed-off-by: Wade Farnsworth <wade_farnsworth@mentor.com>
> ---
>  .../systemtap/systemtap-uprobes_git.bb             |   42 ++++++++++++++++++++
>  meta/recipes-kernel/systemtap/systemtap_git.bb     |   18 +-------
>  meta/recipes-kernel/systemtap/systemtap_git.inc    |   16 +++++++
>  3 files changed, 61 insertions(+), 15 deletions(-)
>  create mode 100644 meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
>  create mode 100644 meta/recipes-kernel/systemtap/systemtap_git.inc
> 
> diff --git a/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb b/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
> new file mode 100644
> index 0000000..fc0e957
> --- /dev/null
> +++ b/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
> @@ -0,0 +1,42 @@
> +DESCRIPTION = "UProbes kernel module for SystemTap"
> +
> +require systemtap_git.inc
> +
> +DEPENDS = "virtual/gettext systemtap virtual/kernel"

would inheriting gettext class be better here ?

> +
> +PR = "r0"
> +
> +# On systems without CONFIG_UTRACE, this package is empty.
> +ALLOW_EMPTY_${PN} = 1
> +
> +inherit module-base
> +
> +FILES_${PN} += "${datadir}/systemtap/runtime/uprobes"
> +
> +EXTRA_OEMAKE = ""
> +
> +# Compile and install the uprobes kernel module on machines with utrace
> +# support.  Note that staprun expects it in the systemtap/runtime directory,
> +# not in /lib/modules.
> +do_compile() {
> +	if grep -q "CONFIG_UTRACE=y" ${STAGING_KERNEL_DIR}/.config
> +	then
> +		unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS CC LD CPP
> +		oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
> +			   AR="${KERNEL_AR}" \
> +			   -C ${STAGING_KERNEL_DIR} scripts
> +		oe_runmake KDIR=${STAGING_KERNEL_DIR}   \
> +			   M="${S}/runtime/uprobes/" \
> +			   CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
> +			   AR="${KERNEL_AR}" \
> +			   -C "${S}/runtime/uprobes/"
> +	fi
> +}
> +
> +do_install() {
> +	if [ -e "${S}/runtime/uprobes/uprobes.ko" ]
> +	then
> +		install -d ${D}/usr/share/systemtap/runtime/uprobes/
> +		install -m 0644 ${S}/runtime/uprobes/uprobes.ko ${D}/usr/share/systemtap/runtime/uprobes/
> +	fi
> +}
> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
> index e3caab7..6eef51e 100644
> --- a/meta/recipes-kernel/systemtap/systemtap_git.bb
> +++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
> @@ -1,16 +1,12 @@
>  DESCRIPTION = "SystemTap - script-directed dynamic tracing and performance analysis tool for Linux"
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +require systemtap_git.inc
>  
>  DEPENDS = "elfutils sqlite3 systemtap-native"
>  DEPENDS_virtclass-native = "elfutils-native sqlite3-native gettext-native"
>  DEPENDS_virtclass-nativesdk = "elfutils-nativesdk sqlite3-nativesdk gettext-nativesdk"
>  
> -SRCREV = "83bd2699d8cff2f2d6b9eaf5ea254e4cb6b33e81"
> -PR = "r4"
> -PV = "1.7+git${SRCPV}"
> -
> -SRC_URI = "git://sources.redhat.com/git/systemtap.git;protocol=git"
> +PR = "r5"
>  
>  EXTRA_OECONF += "--with-libelf=${STAGING_DIR_TARGET} --without-rpm \
>  	     ac_cv_file__usr_include_nss=no \
> @@ -20,14 +16,6 @@ EXTRA_OECONF += "--with-libelf=${STAGING_DIR_TARGET} --without-rpm \
>  	     ac_cv_file__usr_include_avahi_client=no \
>  	     ac_cv_file__usr_include_avahi_common=no "
>  
> -SRC_URI[md5sum]    = "cb202866ed704c44a876d041f788bdee"
> -SRC_URI[sha256sum] = "8ffe35caec0d937bd23fd78a3a8d94b58907cc0de0330b35e38f9f764815c459"
> -
> -# systemtap doesn't support mips
> -COMPATIBLE_HOST = '(x86_64.*|i.86.*|powerpc.*|arm.*)-linux'
> -
> -S = "${WORKDIR}/git"
> -
>  inherit autotools gettext
>  
>  BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
> new file mode 100644
> index 0000000..cc250ff
> --- /dev/null
> +++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
> @@ -0,0 +1,16 @@
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +SRCREV = "83bd2699d8cff2f2d6b9eaf5ea254e4cb6b33e81"
> +PV = "1.7+git${SRCPV}"
> +
> +SRC_URI = "git://sources.redhat.com/git/systemtap.git;protocol=git"
> +
> +SRC_URI[md5sum]    = "cb202866ed704c44a876d041f788bdee"
> +SRC_URI[sha256sum] = "8ffe35caec0d937bd23fd78a3a8d94b58907cc0de0330b35e38f9f764815c459"
> +
> +# systemtap doesn't support mips
> +COMPATIBLE_HOST = '(x86_64.*|i.86.*|powerpc.*|arm.*)-linux'
> +
> +S = "${WORKDIR}/git"
> +
> -- 
> 1.7.0.4
> 

-- 
-Khem


