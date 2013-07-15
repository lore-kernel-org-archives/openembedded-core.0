Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5349660686
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 23:48:11 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 15 Jul 2013 16:48:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,672,1367996400"; d="scan'208";a="346145425"
Received: from unknown (HELO [10.255.13.97]) ([10.255.13.97])
	by orsmga001.jf.intel.com with ESMTP; 15 Jul 2013 16:48:11 -0700
Message-ID: <51E48A3B.6030607@linux.intel.com>
Date: Mon, 15 Jul 2013 16:48:11 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>
References: <1373919029-19108-1-git-send-email-mark.hatle@windriver.com>
	<1373919029-19108-5-git-send-email-mark.hatle@windriver.com>
In-Reply-To: <1373919029-19108-5-git-send-email-mark.hatle@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] dbus-ptest: Disable python module check
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
X-List-Received-Date: Mon, 15 Jul 2013 23:48:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/15/2013 01:10 PM, Mark Hatle wrote:
> Disable the python module check, as the host python modules are
> not needed for generating the target tests.
>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>   .../dbus/dbus-1.6.8/python-config.patch            | 25 ++++++++++++++++++++++
>   meta/recipes-core/dbus/dbus-ptest_1.6.10.bb        |  1 +
You have a patch in the dbus-1.6.8 directory for a version 1.6.10, patch 
not found!

Sau!

>   2 files changed, 26 insertions(+)
>   create mode 100644 meta/recipes-core/dbus/dbus-1.6.8/python-config.patch
>
> diff --git a/meta/recipes-core/dbus/dbus-1.6.8/python-config.patch b/meta/recipes-core/dbus/dbus-1.6.8/python-config.patch
> new file mode 100644
> index 0000000..2944002
> --- /dev/null
> +++ b/meta/recipes-core/dbus/dbus-1.6.8/python-config.patch
> @@ -0,0 +1,25 @@
> +When building the dbus-ptest package, we have to enable python.  However
> +checking if the host-system python has the necessary library isn't useful.
> +
> +Disable the python module check for cross compiling.
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> +
> +--- dbus-1.6.8/configure.ac.orig	2013-07-11 14:15:58.834554799 -0500
> ++++ dbus-1.6.8/configure.ac	2013-07-11 14:14:40.969554848 -0500
> +@@ -257,13 +257,6 @@
> +   # full test coverage is required, Python is a hard dependency
> +   AC_MSG_NOTICE([Full test coverage (--enable-tests=yes) requires Python, dbus-python, pygobject])
> +   AM_PATH_PYTHON([2.6])
> +-  AC_MSG_CHECKING([for Python modules for full test coverage])
> +-  if "$PYTHON" -c "import dbus, gobject, dbus.mainloop.glib"; then
> +-    AC_MSG_RESULT([yes])
> +-  else
> +-    AC_MSG_RESULT([no])
> +-    AC_MSG_ERROR([cannot import dbus, gobject, dbus.mainloop.glib Python modules])
> +-  fi
> + else
> +   # --enable-tests not given: do not abort if Python is missing
> +   AM_PATH_PYTHON([2.6], [], [:])
> diff --git a/meta/recipes-core/dbus/dbus-ptest_1.6.10.bb b/meta/recipes-core/dbus/dbus-ptest_1.6.10.bb
> index 6c0f404..a8e82ef 100644
> --- a/meta/recipes-core/dbus/dbus-ptest_1.6.10.bb
> +++ b/meta/recipes-core/dbus/dbus-ptest_1.6.10.bb
> @@ -14,6 +14,7 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
>              file://ptest.patch \
>              file://dbus-1.init  \
>              file://run-ptest \
> +           file://python-config.patch \
>              "
>
>   SRC_URI[md5sum] = "de4970c20629aeb958a12132415b3630"
>

