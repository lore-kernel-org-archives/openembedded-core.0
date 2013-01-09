Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tt0uq-0005Hv-Co
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 20:02:23 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 Jan 2013 10:47:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,439,1355126400"; d="scan'208";a="241925944"
Received: from unknown (HELO [10.255.14.147]) ([10.255.14.147])
	by azsmga001.ch.intel.com with ESMTP; 09 Jan 2013 10:46:57 -0800
Message-ID: <50EDBB21.1000208@linux.intel.com>
Date: Wed, 09 Jan 2013 10:46:57 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Marko Lindqvist <cazfi74@gmail.com>
References: <1357733634-23036-1-git-send-email-cazfi74@gmail.com>
	<1357733634-23036-2-git-send-email-cazfi74@gmail.com>
	<1357733634-23036-3-git-send-email-cazfi74@gmail.com>
In-Reply-To: <1357733634-23036-3-git-send-email-cazfi74@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 2/2] pango: update to upstream version 1.32.5
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Jan 2013 19:02:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/09/2013 04:13 AM, Marko Lindqvist wrote:
> multilib-fix-clean.patch adjusted to apply cleanly, and to handle
> new modules.cache file.
>
> Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> ---
>   .../pango/pango-1.30.1/multilib-fix-clean.patch    |   42 -----------
>   .../pango/pango-1.32.5/multilib-fix-clean.patch    |   75 ++++++++++++++++++++
>   .../{pango-1.30.1 => pango-1.32.5}/no-tests.patch  |    0
>   meta/recipes-graphics/pango/pango.inc              |    6 +-
>   .../pango/{pango_1.30.1.bb => pango_1.32.5.bb}     |    4 +-
>   5 files changed, 80 insertions(+), 47 deletions(-)
>   delete mode 100644 meta/recipes-graphics/pango/pango-1.30.1/multilib-fix-clean.patch
>   create mode 100644 meta/recipes-graphics/pango/pango-1.32.5/multilib-fix-clean.patch
>   rename meta/recipes-graphics/pango/{pango-1.30.1 => pango-1.32.5}/no-tests.patch (100%)
>   rename meta/recipes-graphics/pango/{pango_1.30.1.bb => pango_1.32.5.bb} (59%)
>
This patch needs to be rebased due to the postinstall patch that's now 
in master.

Thanks
	Sau!

> diff --git a/meta/recipes-graphics/pango/pango-1.30.1/multilib-fix-clean.patch b/meta/recipes-graphics/pango/pango-1.30.1/multilib-fix-clean.patch
> deleted file mode 100644
> index 3f00ad8..0000000
> --- a/meta/recipes-graphics/pango/pango-1.30.1/multilib-fix-clean.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -Upstream-Status: Pending
> -
> -Index: pango-1.28.4/configure.in
> -===================================================================
> ---- pango-1.28.4.orig/configure.in	2011-04-05 04:29:16.000000000 +0800
> -+++ pango-1.28.4/configure.in	2012-05-08 21:32:17.000000000 +0800
> -@@ -205,6 +205,11 @@
> -
> - AC_SUBST(PANGO_DEBUG_FLAGS)
> -
> -+AC_ARG_WITH(mlprefix,
> -+            AC_HELP_STRING([--with-mlprefix=<ARG>], [multilib prefix]),
> -+            mlprefix_str=$withval, mlprefix_str="")
> -+AC_DEFINE_UNQUOTED([MLPREFIX], ["$mlprefix_str"], [multilib prefix.])
> -+
> - AC_ARG_ENABLE(rebuilds,
> -               [AC_HELP_STRING([--disable-rebuilds],
> -                               [disable all source autogeneration rules])],,
> -Index: pango-1.28.4/pango/modules.c
> -===================================================================
> ---- pango-1.28.4.orig/pango/modules.c	2010-09-22 03:37:01.000000000 +0800
> -+++ pango-1.28.4/pango/modules.c	2012-05-08 21:21:02.000000000 +0800
> -@@ -529,7 +529,8 @@
> -
> -   if (!file_str)
> -     file_str = g_build_filename (pango_get_sysconf_subdirectory (),
> --				 "pango.modules",
> -+/* For multilib case, keep multiple config file for different libs */
> -+				 MLPREFIX "pango.modules",
> - 				 NULL);
> -
> -   files = pango_split_file_list (file_str);
> -@@ -640,7 +641,8 @@
> -       if (!no_module_warning)
> - 	{
> - 	  gchar *filename = g_build_filename (pango_get_sysconf_subdirectory (),
> --					      "pango.modules",
> -+/* For multilib case, keep multiple config file for different libs */
> -+					      MLPREFIX "pango.modules",
> - 					      NULL);
> - 	  g_critical ("No modules found:\n"
> - 		      "No builtin or dynamically loaded modules were found.\n"
> diff --git a/meta/recipes-graphics/pango/pango-1.32.5/multilib-fix-clean.patch b/meta/recipes-graphics/pango/pango-1.32.5/multilib-fix-clean.patch
> new file mode 100644
> index 0000000..ad414dd
> --- /dev/null
> +++ b/meta/recipes-graphics/pango/pango-1.32.5/multilib-fix-clean.patch
> @@ -0,0 +1,75 @@
> +Upstream-Status: Pending
> +
> +Updated to apply to pango-1.32.5
> +
> +Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> +diff -Nurd pango-1.32.5/configure.ac pango-1.32.5/configure.ac
> +--- pango-1.32.5/configure.ac	2012-12-07 04:43:25.000000000 +0200
> ++++ pango-1.32.5/configure.ac	2013-01-09 08:27:40.328516792 +0200
> +@@ -213,6 +213,11 @@
> +
> + AC_SUBST(PANGO_DEBUG_FLAGS)
> +
> ++AC_ARG_WITH(mlprefix,
> ++            AC_HELP_STRING([--with-mlprefix=<ARG>], [multilib prefix]),
> ++            mlprefix_str=$withval, mlprefix_str="")
> ++AC_DEFINE_UNQUOTED([MLPREFIX], ["$mlprefix_str"], [multilib prefix.])
> ++
> + AC_ARG_ENABLE(rebuilds,
> +               [AC_HELP_STRING([--disable-rebuilds],
> +                               [disable all source autogeneration rules])],,
> +diff -Nurd pango-1.32.5/pango/modules.c pango-1.32.5/pango/modules.c
> +--- pango-1.32.5/pango/modules.c	2012-12-17 20:27:56.000000000 +0200
> ++++ pango-1.32.5/pango/modules.c	2013-01-09 08:31:16.336512052 +0200
> +@@ -555,11 +555,11 @@
> +       files = g_new (char *, 3);
> +
> +       files[0] = g_build_filename (pango_get_sysconf_subdirectory (),
> +-                                   "pango.modules",
> ++                                   MLPREFIX "pango.modules",
> +                                    NULL);
> +       files[1] = g_build_filename (pango_get_lib_subdirectory (),
> +                                    MODULE_VERSION,
> +-                                   "modules.cache",
> ++                                   MLPREFIX "modules.cache",
> +                                    NULL);
> +       files[2] = NULL;
> +     }
> +@@ -674,7 +674,8 @@
> +       if (!no_module_warning)
> +	{
> +	  gchar *filename = g_build_filename (pango_get_sysconf_subdirectory (),
> +-					      "pango.modules",
> ++/* For multilib case, keep multiple config file for different libs */
> ++					      MLPREFIX "pango.modules",
> +					      NULL);
> +	  g_critical ("No modules found:\n"
> +		      "No builtin or dynamically loaded modules were found.\n"
> +diff -Nurd pango-1.32.5/pango/modules.c.rej pango-1.32.5/pango/modules.c.rej
> +--- pango-1.32.5/pango/modules.c.rej	1970-01-01 02:00:00.000000000 +0200
> ++++ pango-1.32.5/pango/modules.c.rej	2013-01-09 08:27:40.328516792 +0200
> +@@ -0,0 +1,12 @@
> ++--- pango/modules.c	2010-09-22 03:37:01.000000000 +0800
> +++++ pango/modules.c	2012-05-08 21:21:02.000000000 +0800
> ++@@ -529,7 +529,8 @@
> ++
> ++   if (!file_str)
> ++     file_str = g_build_filename (pango_get_sysconf_subdirectory (),
> ++-				 "pango.modules",
> +++/* For multilib case, keep multiple config file for different libs */
> +++				 MLPREFIX "pango.modules",
> ++ 				 NULL);
> ++
> ++   files = pango_split_file_list (file_str);
> +diff -Nurd pango-1.32.5/pango/querymodules.c pango-1.32.5/pango/querymodules.c
> +--- pango-1.32.5/pango/querymodules.c	2012-08-28 15:27:18.000000000 +0300
> ++++ pango-1.32.5/pango/querymodules.c	2013-01-09 08:31:47.828511359 +0200
> +@@ -304,7 +304,7 @@
> +
> +       cache_file = g_build_filename (pango_get_lib_subdirectory (),
> +                                      MODULE_VERSION,
> +-                                     "modules.cache",
> ++                                     MLPREFIX "modules.cache",
> +                                      NULL);
> +       err = NULL;
> +       if (!g_file_set_contents (cache_file, contents->str, -1, &err))
> diff --git a/meta/recipes-graphics/pango/pango-1.30.1/no-tests.patch b/meta/recipes-graphics/pango/pango-1.32.5/no-tests.patch
> similarity index 100%
> rename from meta/recipes-graphics/pango/pango-1.30.1/no-tests.patch
> rename to meta/recipes-graphics/pango/pango-1.32.5/no-tests.patch
> diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
> index 81c2a7e..ce5caf6 100644
> --- a/meta/recipes-graphics/pango/pango.inc
> +++ b/meta/recipes-graphics/pango/pango.inc
> @@ -10,13 +10,13 @@ SECTION = "libs"
>   LICENSE = "LGPLv2.0+"
>
>   X11DEPENDS = "virtual/libx11 libxft"
> -DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv cairo elfutils pango-native"
> +DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv cairo elfutils pango-native harfbuzz"
>
>   PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
>   PACKAGECONFIG[x11] = "--with-x,--without-x,${X11DEPENDS}"
>
>   BBCLASSEXTEND = "native"
> -DEPENDS_class-native = "glib-2.0-native cairo-native"
> +DEPENDS_class-native = "glib-2.0-native cairo-native harfbuzz-native"
>
>   PACKAGES_DYNAMIC += "^pango-module-.*"
>
> @@ -41,7 +41,7 @@ EXTRA_OECONF = "--disable-glibtest \
>   	        --with-mlprefix=${MLPREFIX}"
>
>   LEAD_SONAME = "libpango-1.0*"
> -LIBV = "1.6.0"
> +LIBV = "1.8.0"
>
>   postinst_prologue() {
>   if ! [ -e $D${sysconfdir}/pango ] ; then
> diff --git a/meta/recipes-graphics/pango/pango_1.30.1.bb b/meta/recipes-graphics/pango/pango_1.32.5.bb
> similarity index 59%
> rename from meta/recipes-graphics/pango/pango_1.30.1.bb
> rename to meta/recipes-graphics/pango/pango_1.32.5.bb
> index 7254321..e71f514 100644
> --- a/meta/recipes-graphics/pango/pango_1.30.1.bb
> +++ b/meta/recipes-graphics/pango/pango_1.32.5.bb
> @@ -9,7 +9,7 @@ GNOME_COMPRESS_TYPE="xz"
>   SRC_URI += "file://no-tests.patch \
>               file://multilib-fix-clean.patch"
>
> -SRC_URI[archive.md5sum] = "ec3c1f236ee9bd4a982a5f46fcaff7b9"
> -SRC_URI[archive.sha256sum] = "3a8c061e143c272ddcd5467b3567e970cfbb64d1d1600a8f8e62435556220cbe"
> +SRC_URI[archive.md5sum] = "8e846804d6e219bc795a26a4a39b5bfd"
> +SRC_URI[archive.sha256sum] = "7d7bc99c3d9b580cb4fe787fe47824e56e39534b9040e1c8a2a159248d8e5821"
>
>   #PARALLEL_MAKE = ""
>


