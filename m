Return-Path: <anuj.mittal@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id C3B8E605C3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 13:40:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Aug 2018 06:40:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,452,1526367600"; d="scan'208";a="74033925"
Received: from mmshuai-mobl.amr.corp.intel.com (HELO [10.255.160.56])
	([10.255.160.56])
	by fmsmga002.fm.intel.com with ESMTP; 06 Aug 2018 06:39:55 -0700
To: Maksym Kokhan <maksym.kokhan@globallogic.com>,
	openembedded-core@lists.openembedded.org
References: <1533557311-10453-1-git-send-email-maksym.kokhan@globallogic.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <a80f3bf9-abba-fd2c-b1b9-d2327de69f78@intel.com>
Date: Mon, 6 Aug 2018 21:39:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1533557311-10453-1-git-send-email-maksym.kokhan@globallogic.com>
Cc: Ruslan Bilovol <ruslan.bilovol@globallogic.com>,
	Andrii Bordunov <andrii.bordunov@globallogic.com>
Subject: Re: [PATCH] libusb: Add ptest
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
X-List-Received-Date: Mon, 06 Aug 2018 13:40:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/06/2018 08:08 PM, Maksym Kokhan via Openembedded-core wrote:
> Add ptest support to libusb package.
> Uses existing libusb tests.
> 
> Signed-off-by: Maksym Kokhan <maksym.kokhan@globallogic.com>
> Reviewed-by: Andrii Bordunov <andrii.bordunov@globallogic.com>
> ---
>  meta/recipes-support/libusb/libusb1/run-ptest | 15 +++++++++++++++
>  meta/recipes-support/libusb/libusb1_1.0.21.bb | 11 ++++++++++-
>  2 files changed, 25 insertions(+), 1 deletion(-)
>  create mode 100755 meta/recipes-support/libusb/libusb1/run-ptest
> 
> diff --git a/meta/recipes-support/libusb/libusb1/run-ptest b/meta/recipes-support/libusb/libusb1/run-ptest
> new file mode 100755
> index 0000000..646a966
> --- /dev/null
> +++ b/meta/recipes-support/libusb/libusb1/run-ptest
> @@ -0,0 +1,15 @@
> +#!/bin/sh
> +
> +echo
> +echo "---------------------------- libusb1 tests ---------------------------"
> +echo
> +
> +./stress | tr '\n' ' '  | \
> +sed 's/Starting test run: \([a-zA-Z_]*\)\.\.\. \([a-zA-Z_]*\) (.) /\2 \1\n/g' | \
> +sed '$d' | \
> +sed '{
> +	s/^Success/PASS:/g
> +	s/^Failure/FAIL:/g
> +	s/^Error/FAIL:/g
> +	s/^Skip/SKIP:/g
> +}' 
> diff --git a/meta/recipes-support/libusb/libusb1_1.0.21.bb b/meta/recipes-support/libusb/libusb1_1.0.21.bb
> index 1fefd14..073de38 100644
> --- a/meta/recipes-support/libusb/libusb1_1.0.21.bb
> +++ b/meta/recipes-support/libusb/libusb1_1.0.21.bb
> @@ -10,6 +10,7 @@ BBCLASSEXTEND = "native nativesdk"
>  
>  SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2 \
>             file://no-dll.patch \
> +           file://run-ptest \
>            "
>  
>  SRC_URI[md5sum] = "1da9ea3c27b3858fa85c5f4466003e44"
> @@ -17,7 +18,7 @@ SRC_URI[sha256sum] = "7dce9cce9a81194b7065ee912bcd55eeffebab694ea403ffb91b67db66
>  
>  S = "${WORKDIR}/libusb-${PV}"
>  
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig ptest
>  
>  # Don't configure udev by default since it will cause a circular
>  # dependecy with udev package, which depends on libusb
> @@ -30,6 +31,14 @@ do_install_append() {
>  	fi
>  }
>  
> +do_compile_ptest() {                                                             
> +    oe_runmake -C tests stress                                                   
> +}                                                                                
> +                                                                                 
> +do_install_ptest() {                                                             
> +    install -m 755 ${WORKDIR}/build/tests/.libs/stress ${D}${PTEST_PATH}         

This should use ${B} instead of ${WORKDIR}/build otherwise this will
fail when using devtool or externalsrc class or in general when
WORKDIR/build != B.

Thanks,

Anuj

