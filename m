Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnEym-0002at-P2
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 20:46:01 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 11:38:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="57371635"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Jan 2012 11:38:22 -0800
Message-ID: <4F15CE2E.80505@linux.intel.com>
Date: Tue, 17 Jan 2012 11:38:22 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1326385824-32201-5-git-send-email-enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <1326385824-32201-5-git-send-email-enrico.scholz@sigma-chemnitz.de>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH] bitbake.conf: search /lib for -native builds
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
X-List-Received-Date: Tue, 17 Jan 2012 19:46:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/12/2012 08:30 AM, Enrico Scholz wrote:
> Changes to BUILD_LDFLAGS are required due to the recent movement of some
> libraries from ${libdir} to ${base_libdir}.  ${base_libdir} must be now
> in the linker search path to avoid build problems of -native packages.
>
> Signed-off-by: Enrico Scholz<enrico.scholz@sigma-chemnitz.de>
> ---
>   meta/conf/bitbake.conf |    8 +++++++-
>   1 files changed, 7 insertions(+), 1 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 43eedad..d051363 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -49,6 +49,7 @@ bindir_native = "${prefix_native}/bin"
>   sbindir_native = "${prefix_native}/sbin"
>   includedir_native = "${prefix_native}/include"
>   libdir_native = "${prefix_native}/lib"
> +base_libdir_native = "/lib"
>   datadir_native = "${prefix_native}/share"
>   bindir_cross = "/bin"
>   bindir_crossscripts = "${bindir}/crossscripts"
> @@ -330,6 +331,7 @@ STAGING_BINDIR_NATIVE = "${STAGING_DIR_NATIVE}${bindir_native}"
>   STAGING_BINDIR_CROSS = "${STAGING_BINDIR}/crossscripts"
>   STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
>   STAGING_LIBDIR_NATIVE = "${STAGING_DIR_NATIVE}${libdir_native}"
> +STAGING_BASE_LIBDIR_NATIVE = "${STAGING_DIR_NATIVE}${base_libdir_native}"
>   STAGING_INCDIR_NATIVE = "${STAGING_DIR_NATIVE}${includedir_native}"
>   STAGING_ETCDIR_NATIVE = "${STAGING_DIR_NATIVE}${sysconfdir_native}"
>   STAGING_DATADIR_NATIVE = "${STAGING_DIR_NATIVE}${datadir_native}"
> @@ -462,8 +464,12 @@ export CXXFLAGS = "${TARGET_CXXFLAGS}"
>   export TARGET_CXXFLAGS = "${TARGET_CFLAGS} -fpermissive"
>
>   export BUILD_LDFLAGS = "-L${STAGING_LIBDIR_NATIVE} \
> +                        -L${STAGING_BASE_LIBDIR_NATIVE} \
>                           -Wl,-rpath-link,${STAGING_LIBDIR_NATIVE} \
> -                        -Wl,-rpath,${STAGING_LIBDIR_NATIVE} -Wl,-O1"
> +                        -Wl,-rpath-link,${STAGING_BASE_LIBDIR_NATIVE} \
> +                        -Wl,-rpath,${STAGING_LIBDIR_NATIVE} \
> +                        -Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE} \
> +                        -Wl,-O1"
>
>   BUILDSDK_LDFLAGS = "-L${STAGING_LIBDIR} \
>                       -Wl,-rpath-link,${STAGING_LIBDIR} \
Merged into OE-Core

Thanks
	Sau!


