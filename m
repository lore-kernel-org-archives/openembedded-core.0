Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ED9307671F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 04:28:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t774SgP8027505
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Aug 2015 21:28:43 -0700 (PDT)
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 6 Aug 2015 21:28:42 -0700
Message-ID: <55C433F9.5040403@windriver.com>
Date: Fri, 7 Aug 2015 00:28:41 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1438265949.git.alexander.kanavin@linux.intel.com>
	<646c2c404c3064d5b7ce1d1351690caf1d482aa2.1438265949.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <646c2c404c3064d5b7ce1d1351690caf1d482aa2.1438265949.git.alexander.kanavin@linux.intel.com>
X-Originating-IP: [172.25.44.6]
Subject: Re: [PATCH 19/21] epiphany: add a recipe from meta-gnome
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
X-List-Received-Date: Fri, 07 Aug 2015 04:28:44 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-07-30 10:27 AM, Alexander Kanavin wrote:
> Epiphany is replacing midori as the browser in oe-core recipe set
> and poky distribution.

I just got caught up on oe-core and:
    https://www.mail-archive.com/yocto@yoctoproject.org/msg24522.html

Please move the midori recipe and dependencies to
meta-oe when this change is merged to oe-core. That would help
anyone that needs to provide a transition warning. Of course it
adds more cruft to meta-oe but that's a separate problem.

Thanks,

../Randy



>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>   meta/recipes-gnome/epiphany/epiphany_3.16.3.bb     | 24 ++++++++++++++++
>   .../0001-yelp.m4-drop-the-check-for-itstool.patch  | 33 ++++++++++++++++++++++
>   2 files changed, 57 insertions(+)
>   create mode 100644 meta/recipes-gnome/epiphany/epiphany_3.16.3.bb
>   create mode 100644 meta/recipes-gnome/epiphany/files/0001-yelp.m4-drop-the-check-for-itstool.patch
>
> diff --git a/meta/recipes-gnome/epiphany/epiphany_3.16.3.bb b/meta/recipes-gnome/epiphany/epiphany_3.16.3.bb
> new file mode 100644
> index 0000000..0f5aef1
> --- /dev/null
> +++ b/meta/recipes-gnome/epiphany/epiphany_3.16.3.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "WebKit based web browser for GNOME"
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> +
> +DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes ca-certificates avahi libnotify gcr libwnck3 \
> +	   gsettings-desktop-schemas gnome-desktop3"
> +
> +inherit gnomebase gsettings
> +SRC_URI += "file://0001-yelp.m4-drop-the-check-for-itstool.patch"
> +SRC_URI[archive.md5sum] = "3296af4532b8019775f4b40d21a341ae"
> +SRC_URI[archive.sha256sum] = "d527f1770779ec22d955aeb13b148a846a26144e433ff0480c981af80e2390b1"
> +
> +EXTRA_OECONF += " --disable-nss --with-distributor-name=${DISTRO}"
> +
> +do_configure_prepend() {
> +    touch ${S}/gnome-doc-utils.make
> +    sed -i -e s:help::g ${S}/Makefile.am
> +}
> +
> +FILES_${PN} += "${datadir}/appdata ${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers"
> +FILES_${PN}-dbg += "${libdir}/${PN}/*/web-extensions/.debug/libephywebextension.so"
> +RDEPENDS_${PN} = "iso-codes"
> +RRECOMMENDS_${PN} = "ca-certificates"
> +
> diff --git a/meta/recipes-gnome/epiphany/files/0001-yelp.m4-drop-the-check-for-itstool.patch b/meta/recipes-gnome/epiphany/files/0001-yelp.m4-drop-the-check-for-itstool.patch
> new file mode 100644
> index 0000000..2585d7f
> --- /dev/null
> +++ b/meta/recipes-gnome/epiphany/files/0001-yelp.m4-drop-the-check-for-itstool.patch
> @@ -0,0 +1,33 @@
> +From 30f03a256efe375a4d5c3a24bf4168ebf380e3ab Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Thu, 30 Jul 2015 15:13:23 +0300
> +Subject: [PATCH] yelp.m4: drop the check for itstool
> +
> +It isn't used for anything during build, so there's no need to provide
> +it as a recipe.
> +
> +Upstream-Status: Inappropriate [tarball-specific issue]
> +---
> + m4/yelp.m4 | 6 ------
> + 1 file changed, 6 deletions(-)
> +
> +diff --git a/m4/yelp.m4 b/m4/yelp.m4
> +index 5db847f..1b6ede4 100644
> +--- a/m4/yelp.m4
> ++++ b/m4/yelp.m4
> +@@ -27,12 +27,6 @@ AC_ARG_WITH([help-dir],
> + HELP_DIR="$with_help_dir"
> + AC_SUBST(HELP_DIR)
> +
> +-AC_ARG_VAR([ITSTOOL], [Path to the `itstool` command])
> +-AC_CHECK_PROG([ITSTOOL], [itstool], [itstool])
> +-if test x"$ITSTOOL" = x; then
> +-  AC_MSG_ERROR([itstool not found])
> +-fi
> +-
> + AC_ARG_VAR([XMLLINT], [Path to the `xmllint` command])
> + AC_CHECK_PROG([XMLLINT], [xmllint], [xmllint])
> + if test x"$XMLLINT" = x; then
> +--
> +2.1.4
> +
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

