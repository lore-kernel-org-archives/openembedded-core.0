Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 49B8965D50
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 16:36:30 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Apr 2014 09:35:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,912,1389772800"; d="scan'208";a="498187871"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by orsmga001.jf.intel.com with ESMTP; 23 Apr 2014 09:34:55 -0700
Message-ID: <5357EBAE.6040408@linux.intel.com>
Date: Wed, 23 Apr 2014 09:34:54 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Dan McGregor <danismostlikely@gmail.com>, 
	openembedded-core@lists.openembedded.org
References: <CACS+7ZR=mA9+=NzxF=XLXvxxgypsjzcftZQ0UVWG-0rBLk202A@mail.gmail.com>
In-Reply-To: <CACS+7ZR=mA9+=NzxF=XLXvxxgypsjzcftZQ0UVWG-0rBLk202A@mail.gmail.com>
Subject: Re: [PATCH 2/2] systemd: fix tests when not using gold
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
X-List-Received-Date: Wed, 23 Apr 2014 16:36:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/23/2014 08:01 AM, Dan McGregor wrote:
> From: Dan McGregor <dan.mcgregor@usask.ca>
>
> Explicitly mark the dummy function as externally visible
> so that ld can find the symbol at link time. This is needed
> when the DISTRO_FEATURE ld-is-gold is not enabled; systemd
> uses -flto anyway.
>
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
>   meta/recipes-core/systemd/systemd/systemd-lto-fix.patch | 14 ++++++++++++++
>   meta/recipes-core/systemd/systemd_211.bb                |  1 +
>   2 files changed, 15 insertions(+)
>   create mode 100644 meta/recipes-core/systemd/systemd/systemd-lto-fix.patch
>
> diff --git a/meta/recipes-core/systemd/systemd/systemd-lto-fix.patch
> b/meta/recipes-core/systemd/systemd/systemd-lto-fix.patch
> new file mode 100644
> index 0000000..90875e4
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/systemd-lto-fix.patch

The patch also needs an appropriate Upstream-Status and Signed-off-by 
tags here.

Thanks
	Sau!

> @@ -0,0 +1,14 @@
> +diff --git a/src/test/test-udev.c b/src/test/test-udev.c
> +index b064744..3753c87 100644
> +--- a/src/test/test-udev.c
> ++++ b/src/test/test-udev.c
> +@@ -36,7 +36,8 @@
> + #include "udev.h"
> + #include "udev-util.h"
> +
> +-void udev_main_log(struct udev *udev, int priority,
> ++void __attribute__((externally_visible))
> ++     udev_main_log(struct udev *udev, int priority,
> +                    const char *file, int line, const char *fn,
> +                    const char *format, va_list args) {}
> +
> diff --git a/meta/recipes-core/systemd/systemd_211.bb
> b/meta/recipes-core/systemd/systemd_211.bb
> index df632ab..ddf89b8 100644
> --- a/meta/recipes-core/systemd/systemd_211.bb
> +++ b/meta/recipes-core/systemd/systemd_211.bb
> @@ -23,6 +23,7 @@ PV = "211+git${SRCPV}"
>
>   SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=git
> \
>              file://binfmt-install.patch \
> +           file://systemd-lto-fix.patch \
>              file://systemd-pam-configure-check-uclibc.patch \
>              file://systemd-pam-fix-execvpe.patch \
>              file://systemd-pam-fix-fallocate.patch \
>

