Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RyWY4-0007rK-Ha
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Feb 2012 23:45:06 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 17 Feb 2012 14:36:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="67830500"
Received: from unknown (HELO [10.255.15.81]) ([10.255.15.81])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Feb 2012 14:36:48 -0800
Message-ID: <4F3ED680.5020909@linux.intel.com>
Date: Fri, 17 Feb 2012 14:36:48 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1e2722b29db9486276198e13f06345babce10518.1329147583.git.Martin.Jansa@gmail.com>
	<b17109ebc9396973f7c0dbf6812699e2c0930349.1329147583.git.Martin.Jansa@gmail.com>
In-Reply-To: <b17109ebc9396973f7c0dbf6812699e2c0930349.1329147583.git.Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 2/4] gdb-cross-canadian: use NATIVESDK paths as it happens to be here
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
X-List-Received-Date: Fri, 17 Feb 2012 22:45:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/13/2012 07:40 AM, Martin Jansa wrote:
> * seems like config/config in -L was also wrong
>
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   meta/recipes-devtools/gdb/gdb-cross-canadian.inc |   10 ++++++++--
>   1 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> index b5746ce..bac63b7 100644
> --- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> +++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> @@ -10,12 +10,18 @@ RDEPENDS += "python-nativesdk-core python-nativesdk-lang python-nativesdk-re \
>
>   EXTRA_OECONF_append = "--with-python=${WORKDIR}/python"
>
> +NATIVESDK_NAME = "oecore-${SDK_ARCH}-${SDK_ARCH}"
> +NATIVESDK_PATH = "/usr/local/${NATIVESDK_NAME}"
Martin,

These two lines will not work in the general case, since the NATIVESDK 
might be for a different distro (not oecore) or in a different directory 
such as /opt vs /usr/local.

The Poky build fails with this patch for example.

Sau!

> +NATIVESDK_PATHNATIVE = "${NATIVESDK_PATH}/sysroots/${SDK_SYS}"
> +NATIVESDK_LIBDIR = "${NATIVESDK_PATHNATIVE}${libdir_nativesdk}"
> +NATIVESDK_INCLUDEDIR = "${NATIVESDK_PATHNATIVE}${includedir_nativesdk}"
> +

>   do_configure_prepend() {
>   cat>  ${WORKDIR}/python<<  EOF
>   #! /bin/sh
>   case "\$2" in
> -        --includes) echo "-I${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}${exec_prefix}/include/python${PYTHON_BASEVERSION}/" ;;
> -        --ldflags) echo "-L${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}${libdir}/python${PYTHON_BASEVERSION}/config/config -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
> +        --includes) echo "-I${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}${NATIVESDK_INCLUDEDIR}/python${PYTHON_BASEVERSION}/" ;;
> +        --ldflags) echo "-L${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}${NATIVESDK_LIBDIR}/python${PYTHON_BASEVERSION}/config -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
>           --exec-prefix) echo "/usr" ;;
>           *) exit 1 ;;
>   esac


