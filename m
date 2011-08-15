Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qt0fC-0007d2-L0
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 19:09:22 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Aug 2011 10:04:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,375,1309762800"; d="scan'208";a="39716909"
Received: from unknown (HELO [10.255.14.242]) ([10.255.14.242])
	by fmsmga002.fm.intel.com with ESMTP; 15 Aug 2011 10:04:42 -0700
Message-ID: <4E4951AA.10100@linux.intel.com>
Date: Mon, 15 Aug 2011 10:04:42 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1313163102-5851-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1313163102-5851-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH] intltool: Use nativeperl binary for PERL instead of 'perl'
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
X-List-Received-Date: Mon, 15 Aug 2011 17:09:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/12/2011 08:31 AM, Khem Raj wrote:
> License is GPLv2 change it.
> Defining PERL for native intltool is not needed anymore
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   .../intltool/intltool-0.40.6/use-nativeperl.patch  |   20 ++++++++++++++++++++
>   meta/recipes-devtools/intltool/intltool.inc        |    3 +--
>   meta/recipes-devtools/intltool/intltool_0.40.6.bb  |    9 +++++++--
>   3 files changed, 28 insertions(+), 4 deletions(-)
>   create mode 100644 meta/recipes-devtools/intltool/intltool-0.40.6/use-nativeperl.patch
>
> diff --git a/meta/recipes-devtools/intltool/intltool-0.40.6/use-nativeperl.patch b/meta/recipes-devtools/intltool/intltool-0.40.6/use-nativeperl.patch
> new file mode 100644
> index 0000000..5f5fed3
> --- /dev/null
> +++ b/meta/recipes-devtools/intltool/intltool-0.40.6/use-nativeperl.patch
> @@ -0,0 +1,20 @@
> +OE has perl binary as 'nativeperl' in native sysroot so we look for it
> +in order to avoid intltool searching and finding perl from /usr/bin
> +on build system which may not have all the modules that it needs.
> +
> +Signed-off-by: Khem Raj<raj.khem@gmail.com>
> +
> +Upstream-Status: Inappropriate [OE specific]
> +Index: intltool-0.40.6/intltool.m4
> +===================================================================
> +--- intltool-0.40.6.orig/intltool.m4	2009-02-14 14:12:28.000000000 -0800
> ++++ intltool-0.40.6/intltool.m4	2011-08-09 08:07:16.427347846 -0700
> +@@ -110,7 +110,7 @@
> +     AC_MSG_ERROR([GNU gettext tools not found; required for intltool])
> + fi
> +
> +-AC_PATH_PROG(INTLTOOL_PERL, perl)
> ++AC_PATH_PROG(INTLTOOL_PERL, nativeperl)
> + if test -z "$INTLTOOL_PERL"; then
> +    AC_MSG_ERROR([perl not found])
> + fi
> diff --git a/meta/recipes-devtools/intltool/intltool.inc b/meta/recipes-devtools/intltool/intltool.inc
> index 1e778b6..7e11fc9 100644
> --- a/meta/recipes-devtools/intltool/intltool.inc
> +++ b/meta/recipes-devtools/intltool/intltool.inc
> @@ -1,6 +1,6 @@
>   DESCRIPTION = "Utility scripts for internationalizing XML"
>   SECTION = "devel"
> -LICENSE = "GPL"
> +LICENSE = "GPLv2"
>
>   URLV="${@'.'.join(bb.data.getVar('PV',d,1).split('.')[0:2])}"
>   SRC_URI = "${GNOME_MIRROR}/intltool/${URLV}/intltool-${PV}.tar.bz2"
> @@ -13,5 +13,4 @@ RRECOMMENDS_${PN}_virtclass-native = ""
>
>   inherit autotools pkgconfig perlnative
>
> -export PERL_virtclass-native = "/usr/bin/env perl"
>   BBCLASSEXTEND = "native"
> diff --git a/meta/recipes-devtools/intltool/intltool_0.40.6.bb b/meta/recipes-devtools/intltool/intltool_0.40.6.bb
> index c7938e5..931122d 100644
> --- a/meta/recipes-devtools/intltool/intltool_0.40.6.bb
> +++ b/meta/recipes-devtools/intltool/intltool_0.40.6.bb
> @@ -1,9 +1,14 @@
>   require intltool.inc
>   LICENSE="GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> -PR = "r3"
> +PR = "r4"
>
> -SRC_URI_append = " file://intltool-nowarn-0.40.0.patch"
> +SRC_URI_append = " file://intltool-nowarn-0.40.0.patch \
> +                   ${NATIVEPATCHES} \
> +                 "
> +
> +NATIVEPATCHES = ""
> +NATIVEPATCHES_virtclass-native = "file://use-nativeperl.patch"
>
>   SRC_URI[md5sum] = "69bc0353323112f42ad4f9cf351bc3e5"
>   SRC_URI[sha256sum] = "4d1e5f8561f09c958e303d4faa885079a5e173a61d28437d0013ff5efc9e3b64"

Merged into OE-Core

Thanks
	Sau!


