Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TivxG-0001p3-Uh
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Dec 2012 00:43:11 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 12 Dec 2012 15:28:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,269,1355126400"; d="scan'208";a="261376275"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.105])
	by fmsmga001.fm.intel.com with ESMTP; 12 Dec 2012 15:28:35 -0800
Message-ID: <50C91323.10204@linux.intel.com>
Date: Wed, 12 Dec 2012 15:28:35 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <20121212212745.GD1756@jama.jama.net>
	<1355351624-16993-1-git-send-email-Martin.Jansa@gmail.com>
	<1355351624-16993-2-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1355351624-16993-2-git-send-email-Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] gettext: move remove-potcdate.sin from gettext-native to gettext-minimal-native
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
X-List-Received-Date: Wed, 12 Dec 2012 23:43:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/12/2012 02:33 PM, Martin Jansa wrote:

A little more on my this is needed please.

Sau!

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   .../gettext-minimal-0.18.1.1/remove-potcdate.sin      | 19 +++++++++++++++++++
>   .../gettext/gettext-minimal-native_0.18.1.1.bb        |  4 +++-
>   meta/recipes-core/gettext/gettext_0.18.1.1.bb         |  3 ++-
>   3 files changed, 24 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-core/gettext/gettext-minimal-0.18.1.1/remove-potcdate.sin
>
> diff --git a/meta/recipes-core/gettext/gettext-minimal-0.18.1.1/remove-potcdate.sin b/meta/recipes-core/gettext/gettext-minimal-0.18.1.1/remove-potcdate.sin
> new file mode 100644
> index 0000000..2436c49
> --- /dev/null
> +++ b/meta/recipes-core/gettext/gettext-minimal-0.18.1.1/remove-potcdate.sin
> @@ -0,0 +1,19 @@
> +# Sed script that remove the POT-Creation-Date line in the header entry
> +# from a POT file.
> +#
> +# The distinction between the first and the following occurrences of the
> +# pattern is achieved by looking at the hold space.
> +/^"POT-Creation-Date: .*"$/{
> +x
> +# Test if the hold space is empty.
> +s/P/P/
> +ta
> +# Yes it was empty. First occurrence. Remove the line.
> +g
> +d
> +bb
> +:a
> +# The hold space was nonempty. Following occurrences. Do nothing.
> +x
> +:b
> +}
> diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.18.1.1.bb b/meta/recipes-core/gettext/gettext-minimal-native_0.18.1.1.bb
> index a46a40d..f008a79 100644
> --- a/meta/recipes-core/gettext/gettext-minimal-native_0.18.1.1.bb
> +++ b/meta/recipes-core/gettext/gettext-minimal-native_0.18.1.1.bb
> @@ -1,6 +1,7 @@
>   SRC_URI = "file://aclocal.tgz \
>              file://config.rpath \
>              file://Makefile.in.in \
> +           file://remove-potcdate.sin \
>              file://COPYING"
>
>   INHIBIT_DEFAULT_DEPS = "1"
> @@ -11,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0854da868a929923087141d9d7aba7d5"
>
>   inherit native
>
> -PR = "r4"
> +PR = "r5"
>
>   S = "${WORKDIR}"
>
> @@ -21,4 +22,5 @@ do_install () {
>   	install -d ${D}${datadir}/gettext/po/
>   	cp ${WORKDIR}/config.rpath ${D}${datadir}/gettext/
>   	cp ${WORKDIR}/Makefile.in.in ${D}${datadir}/gettext/po/
> +	cp ${WORKDIR}/remove-potcdate.sin ${D}${datadir}/gettext/po/
>   }
> diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> index c3265e1..4639481 100644
> --- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> +++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> @@ -5,7 +5,7 @@ SECTION = "libs"
>   LICENSE = "GPLv3+ & LGPL-2.1+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>
> -PR = "r18"
> +PR = "r19"
>   DEPENDS = "gettext-native virtual/libiconv ncurses expat"
>   DEPENDS_class-native = "gettext-minimal-native"
>   PROVIDES = "virtual/libintl virtual/gettext"
> @@ -104,6 +104,7 @@ do_install_append_class-native () {
>   	rm ${D}${datadir}/aclocal/*
>   	rm ${D}${datadir}/gettext/config.rpath
>   	rm ${D}${datadir}/gettext/po/Makefile.in.in
> +	rm ${D}${datadir}/gettext/po/remove-potcdate.sin
>   }
>
>   BBCLASSEXTEND = "native nativesdk"
>


