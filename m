Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B05CF71AC1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2018 09:19:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w479JARF012619
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 7 May 2018 02:19:10 -0700 (PDT)
Received: from [128.224.16.180] (128.224.16.180) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 7 May 2018 02:19:09 -0700
To: Ross Burton <ross.burton@intel.com>
References: <152542412186.32090.3556134399005947334@git.openembedded.org>
	<20180504085525.6FFE623285C@git.openembedded.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <3b7df43b-d5e4-be81-d8b5-330cdce1e1fd@windriver.com>
Date: Mon, 7 May 2018 17:19:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180504085525.6FFE623285C@git.openembedded.org>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 117/124: libuser: remove
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
X-List-Received-Date: Mon, 07 May 2018 09:19:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit


Hi Ross,

The recipe
meta-openembedded/meta-gnome/recipes-support/usermode/usermode_1.111.bb

depends on libuser, so may be we need add libuser to meta-gnome, please ?

// Robert


On 05/04/2018 04:57 PM, git@git.openembedded.org wrote:
> This is an automated email from the git hooks/post-receive script.
> 
> rpurdie pushed a commit to branch master-next
> in repository openembedded-core.
> 
> commit 11ee7989b2f0709119c450819cd66bad70082a93
> Author: Ross Burton <ross.burton@intel.com>
> AuthorDate: Fri Apr 27 20:10:24 2018 +0100
> 
>      libuser: remove
>      
>      This isn't used by anything in oe-core (or in common use in general, only one
>      package in Debian depends on it), so remove it from oe-core.
>      
>      Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/conf/distro/include/maintainers.inc           |  1 -
>   .../libuser/libuser/0001-Check-for-issetugid.patch | 62 ----------------------
>   ...es.c-parse_field-fix-string-formating-in-.patch | 34 ------------
>   .../libuser/0002-remove-unused-execinfo.h.patch    | 27 ----------
>   meta/recipes-extended/libuser/libuser_0.62.bb      | 35 ------------
>   .../packagegroup-core-full-cmdline.bb              |  1 -
>   6 files changed, 160 deletions(-)
> 
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index c2ab132..4fb9fc2 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -387,7 +387,6 @@ RECIPE_MAINTAINER_pn-liburcu = "Alexander Kanavin <alexander.kanavin@intel.com>"
>   RECIPE_MAINTAINER_pn-liburi-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
>   RECIPE_MAINTAINER_pn-libusb-compat = "Maxin B. John <maxin.john@intel.com>"
>   RECIPE_MAINTAINER_pn-libusb1 = "Maxin B. John <maxin.john@intel.com>"
> -RECIPE_MAINTAINER_pn-libuser = "Robert Yang <liezhi.yang@windriver.com>"
>   RECIPE_MAINTAINER_pn-libva = "Anuj Mittal <anuj.mittal@intel.com>"
>   RECIPE_MAINTAINER_pn-libva-utils = "Anuj Mittal <anuj.mittal@intel.com>"
>   RECIPE_MAINTAINER_pn-libvorbis = "Tanu Kaskinen <tanuk@iki.fi>"
> diff --git a/meta/recipes-extended/libuser/libuser/0001-Check-for-issetugid.patch b/meta/recipes-extended/libuser/libuser/0001-Check-for-issetugid.patch
> deleted file mode 100644
> index 79756b9..0000000
> --- a/meta/recipes-extended/libuser/libuser/0001-Check-for-issetugid.patch
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -From d0537cb7f2dc5877700ad78dfd191515379d4edc Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 7 Jan 2016 02:22:51 +0000
> -Subject: [PATCH 1/2] Check for issetugid()
> -
> -If secure version of getenv is not there then we can use
> -issetugid() as aid to call getenv()
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Pending
> -
> - configure.ac |  1 +
> - lib/config.c | 12 +++++++++++-
> - 2 files changed, 12 insertions(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 1ded1a2..ee19e1f 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -125,6 +125,7 @@ AC_TYPE_OFF_T
> - AC_TYPE_SIZE_T
> -
> - AC_CHECK_FUNCS([__secure_getenv secure_getenv])
> -+AC_CHECK_FUNCS([issetugid])
> -
> - # Modify CFLAGS after all tests are run (some of them could fail because
> - # of the -Werror).
> -diff --git a/lib/config.c b/lib/config.c
> -index 29e7120..30f9daf 100644
> ---- a/lib/config.c
> -+++ b/lib/config.c
> -@@ -44,8 +44,10 @@
> - #  define safe_getenv(string) secure_getenv(string)
> - #elif defined(HAVE___SECURE_GETENV)
> - #  define safe_getenv(string) __secure_getenv(string)
> -+#elif defined(HAVE_ISSETUGID)
> -+#  define safe_getenv(string) safe_getenv_issetugid(string)
> - #else
> --#  error Neither secure_getenv not __secure_getenv are available
> -+#  error None of secure_getenv, __secure_getenv, or issetugid is available
> - #endif
> -
> - struct config_config {
> -@@ -59,6 +61,14 @@ struct config_key {
> - 	GList *values;
> - };
> -
> -+static const char*
> -+safe_getenv_issetugid(const char* name)
> -+{
> -+	if (issetugid ())
> -+		return 0;
> -+	return getenv (name);
> -+}
> -+
> - /* Compare two section names */
> - static int
> - compare_section_names(gconstpointer a, gconstpointer b)
> ---
> -2.7.0
> -
> diff --git a/meta/recipes-extended/libuser/libuser/0001-modules-files.c-parse_field-fix-string-formating-in-.patch b/meta/recipes-extended/libuser/libuser/0001-modules-files.c-parse_field-fix-string-formating-in-.patch
> deleted file mode 100644
> index 7c47df2..0000000
> --- a/meta/recipes-extended/libuser/libuser/0001-modules-files.c-parse_field-fix-string-formating-in-.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From a4857911ece5ebfcdef42aee4c070eb216f39597 Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
> -Date: Fri, 13 May 2016 11:40:13 -0500
> -Subject: [PATCH] modules/files.c: parse_field fix string formating in
> - g_warnings
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -[YOCTO #9547]
> -
> -Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
> -
> -Upstream-Status: Pending
> ----
> - modules/files.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/modules/files.c b/modules/files.c
> -index 4ef0a57..35eafc9 100644
> ---- a/modules/files.c
> -+++ b/modules/files.c
> -@@ -534,7 +534,7 @@ parse_field(const struct format_specifier *format, GValue *value,
> - 						 string, &err);
> - 	if (ret == FALSE) {
> - 		g_assert(err != NULL);
> --		g_warning(lu_strerror(err));
> -+		g_warning(lu_strerror(err), NULL);
> - 		lu_error_free(&err);
> - 	}
> - 	return ret;
> ---
> -2.1.4
> -
> diff --git a/meta/recipes-extended/libuser/libuser/0002-remove-unused-execinfo.h.patch b/meta/recipes-extended/libuser/libuser/0002-remove-unused-execinfo.h.patch
> deleted file mode 100644
> index 4bc0219..0000000
> --- a/meta/recipes-extended/libuser/libuser/0002-remove-unused-execinfo.h.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From 4b2f81f307ffeac12956e5c16e894e5ebb937ea5 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 7 Jan 2016 02:26:00 +0000
> -Subject: [PATCH 2/2] remove unused execinfo.h
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Pending
> -
> - lib/error.c | 1 -
> - 1 file changed, 1 deletion(-)
> -
> -diff --git a/lib/error.c b/lib/error.c
> -index a5ec30a..443e601 100644
> ---- a/lib/error.c
> -+++ b/lib/error.c
> -@@ -18,7 +18,6 @@
> - #include <config.h>
> - #include <sys/types.h>
> - #include <errno.h>
> --#include <execinfo.h>
> - #include <libintl.h>
> - #include <stdarg.h>
> - #include <stdlib.h>
> ---
> -2.7.0
> -
> diff --git a/meta/recipes-extended/libuser/libuser_0.62.bb b/meta/recipes-extended/libuser/libuser_0.62.bb
> deleted file mode 100644
> index 7ec54eb..0000000
> --- a/meta/recipes-extended/libuser/libuser_0.62.bb
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -SUMMARY = "user and group account administration library"
> -DESCRIPTION = "The libuser library implements a standardized interface for manipulating and administering user \
> -and group accounts"
> -HOMEPAGE = "https://pagure.io/libuser"
> -BUGTRACKER = "https://pagure.io/libuser/issues"
> -
> -LICENSE = "LGPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
> -                    file://lib/user.h;endline=19;md5=76b301f63c39fa992062395efbdc9558 \
> -                    file://samples/testuser.c;endline=19;md5=3b87fa660fa3f4a6bb31d624afe30ba1"
> -
> -SECTION = "base"
> -
> -SRC_URI = "https://releases.pagure.org/libuser/libuser-${PV}.tar.xz \
> -           file://0001-Check-for-issetugid.patch \
> -           file://0002-remove-unused-execinfo.h.patch \
> -           file://0001-modules-files.c-parse_field-fix-string-formating-in-.patch \
> -           "
> -
> -SRC_URI[md5sum] = "63e5e5c551e99dc5302b40b80bd6d4f2"
> -SRC_URI[sha256sum] = "a58ff4fabb01a25043b142185a33eeea961109dd60d4b40b6a9df4fa3cace20b"
> -
> -DEPENDS = "popt libpam glib-2.0 python3"
> -
> -inherit distro_features_check
> -REQUIRED_DISTRO_FEATURES = "pam"
> -
> -inherit autotools gettext python3native python3-dir pkgconfig gtk-doc
> -
> -EXTRA_OEMAKE = "PYTHON_CPPFLAGS=-I${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}"
> -
> -PACKAGES += "${PN}-python "
> -
> -FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
> -
> diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
> index 9002fbc..92881e9 100644
> --- a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
> +++ b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
> @@ -129,7 +129,6 @@ RDEPENDS_packagegroup-core-full-cmdline-initscripts = "\
>   RDEPENDS_packagegroup-core-full-cmdline-multiuser = "\
>       cracklib \
>       gzip \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libuser', '', d)} \
>       shadow \
>       sudo \
>       "
> 

