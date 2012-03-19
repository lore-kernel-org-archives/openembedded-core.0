Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S9fe7-0004ZB-Oo
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 17:41:23 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 19 Mar 2012 09:32:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="119169643"
Received: from unknown (HELO [10.255.15.160]) ([10.255.15.160])
	by orsmga001.jf.intel.com with ESMTP; 19 Mar 2012 09:32:31 -0700
Message-ID: <4F675F9F.60902@linux.intel.com>
Date: Mon, 19 Mar 2012 09:32:31 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1331650371-6055-1-git-send-email-bjst@enea.com>
In-Reply-To: <1331650371-6055-1-git-send-email-bjst@enea.com>
Subject: Re: [PATCH] Add pigz as gzip-native alternative.
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
X-List-Received-Date: Mon, 19 Mar 2012 16:41:24 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/13/2012 07:52 AM, Björn Stenberg wrote:
> pigz, which stands for parallel implementation of gzip, is a fully functional replacement for gzip that exploits multiple processors and multiple cores to the hilt when compressing data. pigz was written by Mark Adler, and uses the zlib and pthread libraries.
>
> This recipe adds pigz as an alternative provider of gzip-native. Pigz is much faster than gzip on multi-core machines.
>
> Upstream-status: Pending
> Signed-off-by: Björn Stenberg<bjst@enea.com>
> ---
>   meta/recipes-extended/pigz/files/ldflags.patch |   11 +++++++++++
>   meta/recipes-extended/pigz/pigz.inc            |   21 +++++++++++++++++++++
>   meta/recipes-extended/pigz/pigz_2.2.4.bb       |    9 +++++++++
>   3 files changed, 41 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-extended/pigz/files/ldflags.patch
>   create mode 100644 meta/recipes-extended/pigz/pigz.inc
>   create mode 100644 meta/recipes-extended/pigz/pigz_2.2.4.bb
>
> diff --git a/meta/recipes-extended/pigz/files/ldflags.patch b/meta/recipes-extended/pigz/files/ldflags.patch
> new file mode 100644
> index 0000000..534d280
> --- /dev/null
> +++ b/meta/recipes-extended/pigz/files/ldflags.patch
> @@ -0,0 +1,11 @@
> +--- pigz-2.2.4/Makefile.orig	2012-01-01 02:46:58.000000000 +0100
> ++++ pigz-2.2.4/Makefile	2012-03-09 08:47:40.025094863 +0100
> +@@ -2,7 +2,7 @@
> + CFLAGS=-O3 -Wall -Wextra
> +
> + pigz: pigz.o yarn.o
> +-	$(CC) -o pigz pigz.o yarn.o -lpthread -lz
> ++	$(CC) $(LDFLAGS) -o pigz pigz.o yarn.o -lpthread -lz
> + 	ln -f pigz unpigz
> +
> + pigz.o: pigz.c yarn.h
> diff --git a/meta/recipes-extended/pigz/pigz.inc b/meta/recipes-extended/pigz/pigz.inc
> new file mode 100644
> index 0000000..b501d7a
> --- /dev/null
> +++ b/meta/recipes-extended/pigz/pigz.inc
> @@ -0,0 +1,21 @@
> +SUMMARY = "A parallel implementation of gzip"
> +DESCRIPTION = "pigz, which stands for parallel implementation of gzip, is a \
> +fully functional replacement for gzip that exploits multiple processors and \
> +multiple cores to the hilt when compressing data. pigz was written by Mark \
> +Adler, and uses the zlib and pthread libraries."
> +HOMEPAGE = "http://zlib.net/pigz/"
> +SECTION = "console/utils"
> +LICENSE = "Zlib"
> +
> +SRC_URI = "http://zlib.net/pigz/pigz-${PV}.tar.gz \
> +           file://ldflags.patch"
> +
> +PROVIDES += "gzip-native"
> +
> +DEPENDS_virtclass-native = "zlib-native"
> +
> +do_install () {
> +        install -d ${D}${bindir}
> +        install ${B}/pigz ${D}${bindir}/gzip
> +        install ${B}/unpigz ${D}${bindir}/gunzip
> +}
> diff --git a/meta/recipes-extended/pigz/pigz_2.2.4.bb b/meta/recipes-extended/pigz/pigz_2.2.4.bb
> new file mode 100644
> index 0000000..598bbe3
> --- /dev/null
> +++ b/meta/recipes-extended/pigz/pigz_2.2.4.bb
> @@ -0,0 +1,9 @@
> +require pigz.inc
> +
> +PR = "r0"
> +
> +BBCLASSEXTEND = "native"
> +
> +SRC_URI[md5sum] = "9df2a3c742524446fa4e797c17e8fd85"
> +SRC_URI[sha256sum] = "7e7967c47f66c07be97cbfa25c8816b72f9d35258466ea31eddc7666c914160e"
> +LIC_FILES_CHKSUM = "file://pigz.c;md5=53f47c097bbf11b937a421b1816a8dc5"

Merged and enabled in OE-Core

Thanks
	Sau!


