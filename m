Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RiEQu-0002Ll-5U
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 01:10:20 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Jan 2012 16:02:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="92656719"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by orsmga001.jf.intel.com with ESMTP; 03 Jan 2012 16:02:58 -0800
Message-ID: <4F039732.4050808@linux.intel.com>
Date: Tue, 03 Jan 2012 16:02:58 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1325196879-11092-1-git-send-email-kergoth@gmail.com>
In-Reply-To: <1325196879-11092-1-git-send-email-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH v2] elfutils: fix for dso link change in recent ld
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
X-List-Received-Date: Wed, 04 Jan 2012 00:10:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/29/2011 02:14 PM, Christopher Larson wrote:
> From: Christopher Larson<chris_larson@mentor.com>
>
> This patch makes the link to the dependencies of libdw explicit, as recent ld
> no longer implicitly links them. See
> http://lists.fedoraproject.org/pipermail/devel/2010-March/133601.html as
> a similar example of the error message you can encounter without this patch,
> and https://fedoraproject.org/wiki/UnderstandingDSOLinkChange and
> https://fedoraproject.org/wiki/Features/ChangeInImplicitDSOLinking for more
> details.
>
> Signed-off-by: Christopher Larson<chris_larson@mentor.com>
> ---
>   .../elfutils/elfutils/dso-link-change.patch        |   32 ++++++++++++++++++++
>   meta/recipes-devtools/elfutils/elfutils_0.148.bb   |    5 ++-
>   2 files changed, 35 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-devtools/elfutils/elfutils/dso-link-change.patch
>
> diff --git a/meta/recipes-devtools/elfutils/elfutils/dso-link-change.patch b/meta/recipes-devtools/elfutils/elfutils/dso-link-change.patch
> new file mode 100644
> index 0000000..d0cd3ed
> --- /dev/null
> +++ b/meta/recipes-devtools/elfutils/elfutils/dso-link-change.patch
> @@ -0,0 +1,32 @@
> +Upstream-Status: Pending
> +
> +# This patch makes the link to the dependencies of libdw explicit, as recent
> +# ld no longer implicitly links them. See
> +# http://lists.fedoraproject.org/pipermail/devel/2010-March/133601.html as
> +# a similar example of the error message you can encounter without this patch,
> +# and https://fedoraproject.org/wiki/UnderstandingDSOLinkChange and
> +# https://fedoraproject.org/wiki/Features/ChangeInImplicitDSOLinking for more
> +# details.
> +
> +--- elfutils-0.148.orig/src/Makefile.am
> ++++ elfutils-0.148/src/Makefile.am
> +@@ -86,7 +86,7 @@ libdw = ../libdw/libdw.a $(zip_LIBS) $(l
> + libelf = ../libelf/libelf.a
> + else
> + libasm = ../libasm/libasm.so
> +-libdw = ../libdw/libdw.so
> ++libdw = ../libdw/libdw.so $(zip_LIBS) $(libelf) $(libebl) -ldl
> + libelf = ../libelf/libelf.so
> + endif
> + libebl = ../libebl/libebl.a
> +--- elfutils-0.148.orig/tests/Makefile.am
> ++++ elfutils-0.148/tests/Makefile.am
> +@@ -172,7 +172,7 @@ libdw = ../libdw/libdw.a $(zip_LIBS) $(l
> + libelf = ../libelf/libelf.a
> + libasm = ../libasm/libasm.a
> + else
> +-libdw = ../libdw/libdw.so
> ++libdw = ../libdw/libdw.so $(zip_LIBS) $(libelf) $(libebl) -ldl
> + libelf = ../libelf/libelf.so
> + libasm = ../libasm/libasm.so
> + endif
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
> index 0f4e8ca..710959a 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3\
>                       file://EXCEPTION;md5=570adcb0c1218ab57f2249c67d0ce417"
>   DEPENDS = "libtool bzip2 zlib"
>
> -PR = "r4"
> +PR = "r5"
>
>   SRC_URI = "https://fedorahosted.org/releases/e/l/elfutils/elfutils-${PV}.tar.bz2"
>
> @@ -29,7 +29,8 @@ SRC_URI += "\
>   	file://elfutils-fsize.patch \
>   	file://remove-unused.patch \
>   	file://mempcpy.patch \
> -	file://fix_for_gcc-4.7.patch\
> +	file://fix_for_gcc-4.7.patch \
> +	file://dso-link-change.patch \
>   "
>   # Only apply when building uclibc based target recipe
>   SRC_URI_append_libc-uclibc = " ${@['', 'file://uclibc-support.patch']['${PN}' == '${BPN}']}"

Merged to OE-Core

Thanks
	Sau!


