Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Su9m5-0001OE-F0
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 00:09:45 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jul 2012 14:58:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="198114983"
Received: from unknown (HELO [10.255.12.157]) ([10.255.12.157])
	by fmsmga002.fm.intel.com with ESMTP; 25 Jul 2012 14:58:14 -0700
Message-ID: <50106BF6.4020108@linux.intel.com>
Date: Wed, 25 Jul 2012 14:58:14 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1343203669-23792-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1343203669-23792-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH] slang 2.2.4: fix the pcre existence checking
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
X-List-Received-Date: Wed, 25 Jul 2012 22:09:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/25/2012 01:07 AM, rongqing.li@windriver.com wrote:
> From: Roy.Li <rongqing.li@windriver.com>
>
> [YOCTO #2820]
>
> when check if there is pcre, the configure file always check
> the host dir. now we make it work by adding correct prefix for
> cross-compile environment.
>
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>   .../slang/slang/fix-check-pcre.patch               |  108 ++++++++++++++++++++
>   meta/recipes-extended/slang/slang_2.2.4.bb         |    3 +-
>   2 files changed, 110 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-extended/slang/slang/fix-check-pcre.patch
>
> diff --git a/meta/recipes-extended/slang/slang/fix-check-pcre.patch b/meta/recipes-extended/slang/slang/fix-check-pcre.patch
> new file mode 100644
> index 0000000..0c1553a
> --- /dev/null
> +++ b/meta/recipes-extended/slang/slang/fix-check-pcre.patch
> @@ -0,0 +1,108 @@
> +fix the pcre existence checking
> +
> +when check if there is pcre, the configure file always check
> +the host dir. now we make it work by adding correct prefix for
> +cross-compile environment.
> +
> +When enable pcre-module, we see a QA warning because rpaths
> +hardcoded into the build, rpaths are not needed, so lets turn
> +this off.
> +
> +Upstream-Status: Inappropriate
> +Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> +---
> + configure |   60 ++++++------------------------------------------------------
> + 1 files changed, 6 insertions(+), 54 deletions(-)
> +
> +diff --git a/configure b/configure

Patching configure here will not work since this is an autotools based 
recipe configure is generated from configure.ac, you need to look into 
how to modify configure.ac.

Also are you that the xincdir and xlibdir are not able to be set to a 
sysroot dir earlier on in the configure process?

Why remove all that host code?

This might be an appropriate patch to upstream for better 
cross-compiling support, please fix the patch correctly.

Thanks
	Sau!


> +index f1586c3..d22814f 100755
> +--- a/configure
> ++++ b/configure
> +@@ -6991,6 +6991,7 @@ $as_echo_n "checking for the pcre library and header files ... " >&6; }
> + 	 /usr/include/pcre,/usr/lib \
> + 	 /usr/pcre/include,/usr/pcre/lib \
> + 	 /usr/include,/usr/lib \
> ++	 /usr/include,/usr/lib64 \
> + 	 /opt/include/pcre,/opt/lib \
> + 	 /opt/pcre/include,/opt/pcre/lib \
> + 	 /opt/include,/opt/lib"
> +@@ -7021,14 +7022,14 @@ $as_echo_n "checking for the pcre library and header files ... " >&6; }
> +         xincdir=`echo $include_and_lib | tr ',' ' ' | awk '{print $1}'`
> + 	xlibdir=`echo $include_and_lib | tr ',' ' ' | awk '{print $2}'`
> + 	found=0
> +-	if test -r $xincdir/$xincfile
> ++	if test -r $PKG_CONFIG_SYSROOT_DIR/$xincdir/$xincfile
> + 	then
> + 	  for E in $exts
> + 	  do
> +-	    if test -r "$xlibdir/$xlibfile.$E"
> ++	    if test -r "$PKG_CONFIG_SYSROOT_DIR/$xlibdir/$xlibfile.$E"
> + 	    then
> +-	      jd_pcre_include_dir="$xincdir"
> +-	      jd_pcre_library_dir="$xlibdir"
> ++	      jd_pcre_include_dir="$PKG_CONFIG_SYSROOT_DIR/$xincdir"
> ++	      jd_pcre_library_dir="$PKG_CONFIG_SYSROOT_DIR/$xlibdir"
> + 	      jd_with_pcre_library="yes"
> + 	      found=1
> + 	      break
> +@@ -7054,56 +7055,7 @@ $as_echo "yes: $jd_pcre_library_dir and $jd_pcre_include_dir" >&6; }
> +     then
> +       PCRE_LIB=""
> +     else
> +-
> +-if test "X$jd_pcre_library_dir" != "X"
> +-then
> +-  if test "X$RPATH" = "X"
> +-  then
> +-
> +-case "$host_os" in
> +-  *linux*|*solaris* )
> +-    if test "X$GCC" = Xyes
> +-    then
> +-      if test "X$ac_R_nospace" = "Xno"
> +-      then
> +-        RPATH="-Wl,-R,"
> +-      else
> +-        RPATH="-Wl,-R"
> +-      fi
> +-    else
> +-      if test "X$ac_R_nospace" = "Xno"
> +-      then
> +-        RPATH="-R "
> +-      else
> +-	RPATH="-R"
> +-      fi
> +-    fi
> +-  ;;
> +-  *osf*|*openbsd*)
> +-    if test "X$GCC" = Xyes
> +-    then
> +-      RPATH="-Wl,-rpath,"
> +-    else
> +-      RPATH="-rpath "
> +-    fi
> +-  ;;
> +-  *netbsd*)
> +-    if test "X$GCC" = Xyes
> +-    then
> +-      RPATH="-Wl,-R"
> +-    fi
> +-  ;;
> +-esac
> +-
> +-    if test "X$RPATH" != "X"
> +-    then
> +-      RPATH="$RPATH$jd_pcre_library_dir"
> +-    fi
> +-  else
> +-    RPATH="$RPATH:$jd_pcre_library_dir"
> +-  fi
> +-fi
> +-
> ++      RPATH=""
> +     fi
> +
> +     PCRE_INC=-I$jd_pcre_include_dir
> +--
> +1.7.4.1
> +
> diff --git a/meta/recipes-extended/slang/slang_2.2.4.bb b/meta/recipes-extended/slang/slang_2.2.4.bb
> index 72dd99f..7082611 100644
> --- a/meta/recipes-extended/slang/slang_2.2.4.bb
> +++ b/meta/recipes-extended/slang/slang_2.2.4.bb
> @@ -10,7 +10,7 @@ to recode S-Lang procedures in C if you need to."
>   HOMEPAGE = "http://www.jedsoft.org/slang/"
>   SECTION = "libs"
>   DEPENDS = "pcre"
> -PR = "r9"
> +PR = "r10"
>
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=a52a18a472d4f7e45479b06563717c02"
> @@ -18,6 +18,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a52a18a472d4f7e45479b06563717c02"
>
>   SRC_URI = "ftp://space.mit.edu/pub/davis/slang/v2.2/slang-${PV}.tar.bz2 \
>              file://rpathfix.patch \
> +           file://fix-check-pcre.patch \
>             "
>   SRC_URI_append_arm = " file://change-char-type-to-signed-char-in-macros.patch"
>
>



