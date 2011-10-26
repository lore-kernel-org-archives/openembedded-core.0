Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RJ9vk-0003Iw-KD
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Oct 2011 22:18:32 +0200
Received: from mail-wy0-f180.google.com ([74.125.82.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 26 Oct 2011 13:12:31 -0700
Received: by wyg24 with SMTP id 24so2091374wyg.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2011 13:12:30 -0700 (PDT)
Received: by 10.227.207.130 with SMTP id fy2mr12120710wbb.8.1319659949921;
	Wed, 26 Oct 2011 13:12:29 -0700 (PDT)
Received: from [10.192.3.184] ([85.13.70.251])
	by mx.google.com with ESMTPS id gg13sm5171563wbb.8.2011.10.26.13.12.28
	(version=SSLv3 cipher=OTHER); Wed, 26 Oct 2011 13:12:29 -0700 (PDT)
Message-ID: <4EA869AB.5090904@intel.com>
Date: Wed, 26 Oct 2011 22:12:27 +0200
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20111019212659.GA30050@sakrah.homelinux.org>
	<1319215187-24168-1-git-send-email-cliff.brake@gmail.com>
In-Reply-To: <1319215187-24168-1-git-send-email-cliff.brake@gmail.com>
Cc: Cliff Brake <cbrake@bec-systems.com>
Subject: Re: [PATCHv3] squashfs-tools: add recipe
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
X-List-Received-Date: Wed, 26 Oct 2011 20:18:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/2011 06:39 PM, Cliff Brake wrote:
> From: Cliff Brake<cbrake@bec-systems.com>
>
> added xz compression option, general cleanup
> ---
>   .../squashfs-tools/squashfs-tools_4.2.bb           |   40 ++++++++++++++++++++
>   1 files changed, 40 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
>
> diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
> new file mode 100644
> index 0000000..6691797
> --- /dev/null
> +++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
> @@ -0,0 +1,40 @@
> +# Note, we can probably remove the lzma option as it has be replaced with xz,
> +# and I don't think the kernel supports it any more.
> +DESCRIPTION = "Tools to manipulate Squashfs filesystems."
> +SECTION = "base"
> +LICENSE = "GPLv2&  Public Domain"
> +LIC_FILES_CHKSUM = "file://../COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
> +                    file://../../7zC.txt;beginline=12;endline=16;md5=2056cd6d919ebc3807602143c7449a7c \
> +                   "
> +DEPENDS = "attr zlib xz"
> +PR = "0"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/squashfs/squashfs${PV}.tar.gz;name=squashfs \
> +           http://downloads.sourceforge.net/sevenzip/lzma465.tar.bz2;name=lzma \
> +          "
> +SRC_URI[squashfs.md5sum] = "1b7a781fb4cf8938842279bd3e8ee852"
> +SRC_URI[squashfs.sha256sum] = "d9e0195aa922dbb665ed322b9aaa96e04a476ee650f39bbeadb0d00b24022e96"
> +SRC_URI[lzma.md5sum] = "29d5ffd03a5a3e51aef6a74e9eafb759"
> +SRC_URI[lzma.sha256sum] = "c935fd04dd8e0e8c688a3078f3675d699679a90be81c12686837e0880aa0fa1e"
> +
> +S = "${WORKDIR}/squashfs${PV}/squashfs-tools"
> +
> +# EXTRA_OEMAKE is typically: -e MAKEFLAGS=
> +# the -e causes problems as CFLAGS is modified in the Makefile, so
> +# we redefine EXTRA_OEMAKE here
> +EXTRA_OEMAKE = "MAKEFLAGS= LZMA_SUPPORT=1 LZMA_DIR=../.. XZ_SUPPORT=1"
> +
> +do_compile() {
> +        oe_runmake mksquashfs
> +}
> +do_install () {
> +        install -d ${D}${sbindir}
> +        install -m 0755 mksquashfs ${D}${sbindir}/
> +}
> +
> +# required to share same place with -lzma specific packages
> +FILESPATHPKG =. "squashfs-tools-${PV}:"
> +
> +ARM_INSTRUCTION_SET = "arm"
> +
> +BBCLASSEXTEND = "native"

Pulled into OE-Core

Thanks
	Sau!



