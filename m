Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CAC7A621EB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2013 20:49:45 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jun 2013 13:50:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,795,1363158000"; d="scan'208";a="347491267"
Received: from unknown (HELO [10.255.12.158]) ([10.255.12.158])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2013 13:49:46 -0700
Message-ID: <51AD016A.602@linux.intel.com>
Date: Mon, 03 Jun 2013 13:49:46 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Cristian Iorga <cristian.iorga@intel.com>
References: <1369998428-20266-1-git-send-email-cristian.iorga@intel.com>
In-Reply-To: <1369998428-20266-1-git-send-email-cristian.iorga@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] alsa-tools: Fix configure race
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
X-List-Received-Date: Mon, 03 Jun 2013 20:49:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/31/2013 04:07 AM, Cristian Iorga wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> aclocal is being called here directly,
> not called by autotools.bbclass wrapper.
> aclocal files are installed in sysroot,
> and are removed while build is still running.
> This translates to a possible race condition during the build.
>
> Fixes [YOCTO #4358].
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>   meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb |    8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
> index 81ad55a..24af545 100644
> --- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
> @@ -20,14 +20,20 @@ SRC_URI[sha256sum] = "553338693707fe6ddfc430b9edc4cd2677390e200c9e38de82ede3394e
>
>   inherit autotools
>
> -EXTRA_OEMAKE += "GITCOMPILE_ARGS='--host=${HOST_SYS} --build=${BUILD_SYS} --target=${TARGET_SYS} --with-libtool-sysroot=${STAGING_DIR_HOST} --prefix=${prefix}' ACLOCAL_FLAGS='-I ${STAGING_DATADIR}/aclocal'"
> +EXTRA_OEMAKE += "GITCOMPILE_ARGS='--host=${HOST_SYS} --build=${BUILD_SYS} --target=${TARGET_SYS} --with-libtool-sysroot=${STAGING_DIR_HOST} --prefix=${prefix}'"
>
>   PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'gtk+', '', d)}"
>   PACKAGECONFIG[gtk+] = ",,gtk+,"
>
> +do_configure () {
> +    autotools_do_configure
> +    autotools_copy_aclocal
There must be another part to this patch since nothing defines 
autotools_copy_aclocal().

Sau!

> +}
> +
>   do_compile_prepend () {
>       #Automake dir is not correctly detected in cross compilation case
>       export AUTOMAKE_DIR=${STAGING_DATADIR_NATIVE}/$(ls ${STAGING_DATADIR_NATIVE} | grep automake)
> +    export ACLOCAL="aclocal --system-acdir=${ACLOCALDIR}/"
>   }
>
>   FILES_${PN} += "${datadir}/ld10k1"
>

