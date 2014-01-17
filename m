Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 52BD66A467
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 17:55:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 Jan 2014 09:51:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,675,1384329600"; d="scan'208";a="468387328"
Received: from unknown (HELO [10.255.12.195]) ([10.255.12.195])
	by orsmga002.jf.intel.com with ESMTP; 17 Jan 2014 09:55:34 -0800
Message-ID: <52D96E96.1080001@linux.intel.com>
Date: Fri, 17 Jan 2014 09:55:34 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: b28495@freescale.com, openembedded-core@lists.openembedded.org
References: <1389692997-5088-1-git-send-email-b28495@freescale.com>
	<1389692997-5088-3-git-send-email-b28495@freescale.com>
In-Reply-To: <1389692997-5088-3-git-send-email-b28495@freescale.com>
Subject: Re: [PATCH 3/3] wayland-native: disable macro checks not used for scanner
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
X-List-Received-Date: Fri, 17 Jan 2014 17:55:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/14/2014 01:49 AM, b28495@freescale.com wrote:
> From: Ting Liu <b28495@freescale.com>
>
> We only build wayland-native for the scanner, so disable the bits we
> don't actually need. This avoid build issue on older distro such as
> Centos 5.x:
> | error: 'O_CLOEXEC' undeclared (first use in this function)
> | error: sys/timerfd.h: No such file or directory
> | error: 'CLOCK_MONOTONIC' undeclared (first use in this function)
> | error: 'TFD_CLOEXEC' undeclared (first use in this function)
> | error: 'SFD_CLOEXEC' undeclared (first use in this function)
>
> Signed-off-by: Ting Liu <b28495@freescale.com>
> ---
>   ...disable-macro-checks-not-used-for-scanner.patch |   52 ++++++++++++++++++++
>   meta/recipes-graphics/wayland/wayland_1.3.0.bb     |    5 ++-
>   2 files changed, 56 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-graphics/wayland/wayland/disable-macro-checks-not-used-for-scanner.patch
>
> diff --git a/meta/recipes-graphics/wayland/wayland/disable-macro-checks-not-used-for-scanner.patch b/meta/recipes-graphics/wayland/wayland/disable-macro-checks-not-used-for-scanner.patch
> new file mode 100644
> index 0000000..8a22079
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/wayland/disable-macro-checks-not-used-for-scanner.patch
> @@ -0,0 +1,52 @@
> +From 0af87a0382ffa4f1f6c81960d5f2ff07d3726529 Mon Sep 17 00:00:00 2001
> +From: Ting Liu <b28495@freescale.com>
> +Date: Mon, 13 Jan 2014 16:49:45 +0800
> +Subject: [PATCH] disable macro checks not used for scanner
> +
> +We only build wayland-native for the scanner, so disable the bits we don't
> +actually need. This avoid build issue on older distro such as Centos 5.x:
> +| error: 'O_CLOEXEC' undeclared (first use in this function)
> +| error: sys/timerfd.h: No such file or directory
> +| error: 'CLOCK_MONOTONIC' undeclared (first use in this function)
> +| error: 'TFD_CLOEXEC' undeclared (first use in this function)
> +| error: 'SFD_CLOEXEC' undeclared (first use in this function)
> +
Missing the Upstream-Status: Tag


> +Signed-off-by: Ting Liu <b28495@freescale.com>
> +---
> + configure.ac | 20 ++++++++++----------
> + 1 file changed, 10 insertions(+), 10 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index fa924ae..bf1b85a 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -41,16 +41,16 @@ AC_SUBST(GCC_CFLAGS)
> +
> + AC_CHECK_FUNCS([accept4 mkostemp])
> +
> +-AC_CHECK_DECL(SFD_CLOEXEC,[],
> +-	      [AC_MSG_ERROR("SFD_CLOEXEC is needed to compile wayland")],
> +-	      [[#include <sys/signalfd.h>]])
> +-AC_CHECK_DECL(TFD_CLOEXEC,[],
> +-	      [AC_MSG_ERROR("TFD_CLOEXEC is needed to compile wayland")],
> +-	      [[#include <sys/timerfd.h>]])
> +-AC_CHECK_DECL(CLOCK_MONOTONIC,[],
> +-	      [AC_MSG_ERROR("CLOCK_MONOTONIC is needed to compile wayland")],
> +-	      [[#include <time.h>]])
> +-AC_CHECK_HEADERS([execinfo.h])
> ++##AC_CHECK_DECL(SFD_CLOEXEC,[],
> ++#	      [AC_MSG_ERROR("SFD_CLOEXEC is needed to compile wayland")],
> ++#	      [[#include <sys/signalfd.h>]])
> ++#AC_CHECK_DECL(TFD_CLOEXEC,[],
> ++#	      [AC_MSG_ERROR("TFD_CLOEXEC is needed to compile wayland")],
> ++#	      [[#include <sys/timerfd.h>]])
> ++#AC_CHECK_DECL(CLOCK_MONOTONIC,[],
> ++#	      [AC_MSG_ERROR("CLOCK_MONOTONIC is needed to compile wayland")],
> ++#	      [[#include <time.h>]])
> ++#AC_CHECK_HEADERS([execinfo.h])
> +
> + AC_ARG_ENABLE([scanner],
> +               [AC_HELP_STRING([--disable-scanner],
> +--
> +1.8.3.2
> +
> diff --git a/meta/recipes-graphics/wayland/wayland_1.3.0.bb b/meta/recipes-graphics/wayland/wayland_1.3.0.bb
> index 212e08a..a60d02a 100644
> --- a/meta/recipes-graphics/wayland/wayland_1.3.0.bb
> +++ b/meta/recipes-graphics/wayland/wayland_1.3.0.bb
> @@ -14,7 +14,10 @@ SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
>   SRC_URI[md5sum] = "d16d27081e0871de82d08840c2f133fc"
>   SRC_URI[sha256sum] = "2e817685f68a26acd19964d69ddbc4549ba5412114ad95e1a9f5934cce470d6e"
>
> -SRC_URI_append_class-native = " file://just-scanner.patch"
> +SRC_URI_append_class-native = " \
> +    file://just-scanner.patch \
> +    file://disable-macro-checks-not-used-for-scanner.patch \
> +"
>
>   inherit autotools pkgconfig
>
>

