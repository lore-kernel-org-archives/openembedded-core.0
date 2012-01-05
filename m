Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RityE-0000XX-OC
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 21:31:31 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jan 2012 12:24:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="92826247"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by azsmga001.ch.intel.com with ESMTP; 05 Jan 2012 12:24:06 -0800
Message-ID: <4F0606E6.5060609@linux.intel.com>
Date: Thu, 05 Jan 2012 12:24:06 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1325697008.28005.84.camel@phil-desktop>
In-Reply-To: <1325697008.28005.84.camel@phil-desktop>
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [PATCH] python-native: correct prefix handling for oe-core sysroot layout
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
X-List-Received-Date: Thu, 05 Jan 2012 20:31:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2012 09:10 AM, Phil Blundell wrote:
> Don't try to guess a path based on ${HOST_SYS} since this is not where the
> files in the sysroot are likely to be.  Instead, just use the "plat_specific"
> approach of taking STAGING_INCDIR and knocking off the trailing "/include" for
> all cases.  This is still evidently suboptimal but does at least seem to give
> the correct results.
>
> Signed-off-by: Phil Blundell<philb@gnu.org>
> ---
> v2: python 2.7.2 not python 2.6.6
>
>   ...2-distutils-prefix-is-inside-staging-area.patch |   22 ++++++++-----------
>   .../recipes-devtools/python/python-native_2.7.2.bb |    2 +-
>   2 files changed, 10 insertions(+), 14 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!

> diff --git a/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-inside-staging-area.patch
> index 8e721fe..b46caf6 100644
> --- a/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-inside-staging-area.patch
> +++ b/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-inside-staging-area.patch
> @@ -2,12 +2,11 @@ Upstream-Status: Inappropriate [embedded specific]
>
>   # The proper prefix is inside our staging area.
>   # Signed-Off: Michael 'Mickey' Lauer<mickey@vanille-media.de>
> +# Signed-off-by: Phil Blundell<philb@gnu.org>
>
> -Index: Python-2.6.6/Lib/distutils/sysconfig.py
> -===================================================================
> ---- Python-2.6.6.orig/Lib/distutils/sysconfig.py
> -+++ Python-2.6.6/Lib/distutils/sysconfig.py
> -@@ -19,8 +19,8 @@ import sys
> +--- Python-2.6.6/Lib/distutils/sysconfig.py.orig	2012-01-03 14:02:03.027005296 +0000
> ++++ Python-2.6.6/Lib/distutils/sysconfig.py	2012-01-03 14:02:31.517601081 +0000
> +@@ -19,8 +19,8 @@
>    from distutils.errors import DistutilsPlatformError
>
>    # These are needed in a couple of spots, so just compute them once.
> @@ -18,19 +17,16 @@ Index: Python-2.6.6/Lib/distutils/sysconfig.py
>
>    # Path to the base directory of the project. On Windows the binary may
>    # live in project/PCBuild9.  If we're dealing with an x64 Windows build,
> -@@ -70,7 +70,10 @@ def get_python_inc(plat_specific=0, pref
> +@@ -70,7 +70,7 @@
>        sys.exec_prefix -- i.e., ignore 'plat_specific'.
>        """
>        if prefix is None:
>   -        prefix = plat_specific and EXEC_PREFIX or PREFIX
> -+        if plat_specific:
> -+            prefix = plat_specific and os.environ['STAGING_INCDIR'].rstrip('include')
> -+        else:
> -+            prefix = plat_specific and EXEC_PREFIX or PREFIX
> ++        prefix = os.environ['STAGING_INCDIR'].rstrip('include')
>
>        if os.name == "posix":
>            if python_build:
> -@@ -115,12 +118,16 @@ def get_python_lib(plat_specific=0, stan
> +@@ -115,12 +115,16 @@
>        If 'prefix' is supplied, use it instead of sys.prefix or
>        sys.exec_prefix -- i.e., ignore 'plat_specific'.
>        """
> @@ -49,7 +45,7 @@ Index: Python-2.6.6/Lib/distutils/sysconfig.py
>            if standard_lib:
>                return libpython
>            else:
> -@@ -216,7 +223,7 @@ def get_config_h_filename():
> +@@ -216,7 +220,7 @@
>        else:
>            # The name of the config.h file changed in 2.2
>            config_h = 'pyconfig.h'
> @@ -58,7 +54,7 @@ Index: Python-2.6.6/Lib/distutils/sysconfig.py
>
>
>    def get_makefile_filename():
> -@@ -225,7 +232,7 @@ def get_makefile_filename():
> +@@ -225,7 +229,7 @@
>            return os.path.join(os.path.dirname(os.path.realpath(sys.executable)),
>                                "Makefile")
>        lib_dir = get_python_lib(plat_specific=1, standard_lib=1)
> diff --git a/meta/recipes-devtools/python/python-native_2.7.2.bb b/meta/recipes-devtools/python/python-native_2.7.2.bb
> index 7d8c597..8bf736d 100644
> --- a/meta/recipes-devtools/python/python-native_2.7.2.bb
> +++ b/meta/recipes-devtools/python/python-native_2.7.2.bb
> @@ -1,6 +1,6 @@
>   require python.inc
>   DEPENDS = "openssl-native bzip2-full-native zlib-native readline-native sqlite3-native"
> -PR = "${INC_PR}.2"
> +PR = "${INC_PR}.3"
>
>   SRC_URI += "file://04-default-is-optimized.patch \
>              file://05-enable-ctypes-cross-build.patch \


