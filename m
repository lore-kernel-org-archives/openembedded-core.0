Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D7B306C747
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 22:30:17 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Nov 2013 14:30:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,754,1378882800"; d="scan'208";a="438307638"
Received: from unknown (HELO [10.255.15.137]) ([10.255.15.137])
	by fmsmga002.fm.intel.com with ESMTP; 22 Nov 2013 14:30:17 -0800
Message-ID: <528FDAF9.1070809@linux.intel.com>
Date: Fri, 22 Nov 2013 14:30:17 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Hongxu Jia <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1385039538.git.hongxu.jia@windriver.com>
	<3177e964cb6b15eebb3c6d26360c9028feace1ed.1385039538.git.hongxu.jia@windriver.com>
In-Reply-To: <3177e964cb6b15eebb3c6d26360c9028feace1ed.1385039538.git.hongxu.jia@windriver.com>
Subject: Re: [PATCH 3/4] lttng-tools: add PACKAGECONFIG to support --enable-python-bindings and lttng-ust
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
X-List-Received-Date: Fri, 22 Nov 2013 22:30:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/2013 05:14 AM, Hongxu Jia wrote:
> Add PACKAGECONFIG to support --enable-python-bindings
> Add PACKAGECONFIG to support lttng-ust
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb | 20 ++++++++++++++++----
>   1 file changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb b/meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb
> index 2f6e504..64b6e02 100644
> --- a/meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb
> +++ b/meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb
> @@ -9,9 +9,18 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
>                       file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                       file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca"
>
> -DEPENDS = "liburcu popt lttng-ust"
> +DEPENDS = "liburcu popt"
>   RDEPENDS_${PN}-ptest += "make"
>
> +PYTHON_OPTION = "am_cv_python_pyexecdir='${libdir}/python${PYTHON_BASEVERSION}/site-packages' \
> +                 am_cv_python_pythondir='${libdir}/python${PYTHON_BASEVERSION}/site-packages' \
> +                 PYTHON_INCLUDE='-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}' \
> +"
> +PACKAGECONFIG = "python lttng-ust"
> +PACKAGECONFIG[python] = "--enable-python-bindings ${PYTHON_OPTION}, \
> +                         --disable-python-bindings, python swig-native"

This seems to bring in a new dependency on "swig", which is not part of 
OE-Core.

Sau!

> +PACKAGECONFIG[lttng-ust] = "--enable-lttng-ust, --disable-lttng-ust, lttng-ust"
> +
>   SRCREV = "5d985544a7ad54afa0514ea7f522a89d8d844860"
>   PV = "v2.3.1"
>
> @@ -26,12 +35,15 @@ inherit autotools ptest
>
>   export KERNELDIR="${STAGING_KERNEL_DIR}"
>
> -FILES_${PN} += "${libdir}/lttng/libexec/*"
> -FILES_${PN}-dbg += "${libdir}/lttng/libexec/.debug"
> +FILES_${PN} += "${libdir}/lttng/libexec/* ${libdir}/python${PYTHON_BASEVERSION}/site-packages/*"
> +FILES_${PN}-dbg += "${libdir}/lttng/libexec/.debug ${libdir}/python2.7/site-packages/.debug"
> +FILES_${PN}-staticdev += "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.a"
> +FILES_${PN}-dev += "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.la"
>
>   # Since files are installed into ${libdir}/lttng/libexec we match
>   # the libexec insane test so skip it.
> -INSANE_SKIP_${PN} = "libexec"
> +# Python module needs to keep _lttng.so
> +INSANE_SKIP_${PN} = "libexec dev-so"
>   INSANE_SKIP_${PN}-dbg = "libexec"
>
>
>


