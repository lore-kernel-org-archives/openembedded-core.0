Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SMj1v-0002zq-6y
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Apr 2012 18:55:55 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Apr 2012 09:45:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="145345590"
Received: from unknown (HELO [10.255.12.125]) ([10.255.12.125])
	by fmsmga001.fm.intel.com with ESMTP; 24 Apr 2012 09:45:55 -0700
Message-ID: <4F96D8C3.7080508@linux.intel.com>
Date: Tue, 24 Apr 2012 09:45:55 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1335183741-2902-1-git-send-email-mpnorman@gmail.com>
In-Reply-To: <1335183741-2902-1-git-send-email-mpnorman@gmail.com>
Subject: Re: [PATCH] uclibc SDK not including libpthread_nonshared.a
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
X-List-Received-Date: Tue, 24 Apr 2012 16:55:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/23/2012 05:22 AM, Mark Norman wrote:
> Modified the uclibc PACKAGES list order to ensure the uclibc-dev package is
> processed before uclibc-staticdev to allow *_nonshared.a libraries to be
> packaged in the uclibc-dev package.  The *_nonshared.a libraries are required
> by the SDK.
> ---
>   meta/recipes-core/uclibc/uclibc.inc |    6 +++---
>   1 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
> index 893d8fd..9316e26 100644
> --- a/meta/recipes-core/uclibc/uclibc.inc
> +++ b/meta/recipes-core/uclibc/uclibc.inc
> @@ -48,9 +48,9 @@ RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
>
>   INHIBIT_DEFAULT_DEPS = "1"
>
> -PACKAGES =+ "ldd uclibc-utils-dbg uclibc-utils uclibc-gconv uclibc-thread-db uclibc-argp uclibc-backtrace"
> -PACKAGES =+ "uclibc-libcrypt uclibc-libintl uclibc-libnsl uclibc-libresolv uclibc-libm"
> -PACKAGES =+ "uclibc-libdl uclibc-libutil uclibc-libpthread uclibc-librt"
> +# Ensure the uclibc-dev package is processed before uclibc-staticdev to allow
> +# *_nonshared.a libraries to be packaged in the uclibc-dev package.
> +PACKAGES = "${PN}-dbg ${PN} ldd ${PN}-utils ${PN}-utils-dbg uclibc-thread-db uclibc-gconv ${PN}-dev ${PN}-staticdev ${PN}-doc uclibc-argp uclibc-backtrace uclibc-libcrypt uclibc-libintl uclibc-libnsl uclibc-libresolv uclibc-libm uclibc-libdl uclibc-libutil uclibc-libpthread uclibc-librt"
>
>   FILES_uclibc-libcrypt = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so"
>   FILES_uclibc-libintl = "${base_libdir}/libintl*.so.* ${base_libdir}/libintl-*.so"

As packaging has changed, this needs a PR bump

Sau!


