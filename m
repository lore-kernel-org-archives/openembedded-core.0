Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1QtZMs-0003RP-21
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 08:12:46 +0200
Received: from mail-pz0-f45.google.com ([209.85.210.45])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 16 Aug 2011 23:07:01 -0700
Received: by pzk33 with SMTP id 33so591403pzk.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 23:07:01 -0700 (PDT)
Received: by 10.142.224.9 with SMTP id w9mr298727wfg.124.1313561221045;
	Tue, 16 Aug 2011 23:07:01 -0700 (PDT)
Received: from [172.17.180.228] ([206.191.100.2])
	by mx.google.com with ESMTPS id y11sm351031wfc.11.2011.08.16.23.07.00
	(version=SSLv3 cipher=OTHER); Tue, 16 Aug 2011 23:07:00 -0700 (PDT)
Message-ID: <4E4B5A83.50301@intel.com>
Date: Tue, 16 Aug 2011 23:06:59 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1313550631-26516-1-git-send-email-aalonso00@gmail.com>
In-Reply-To: <1313550631-26516-1-git-send-email-aalonso00@gmail.com>
Subject: Re: [PATCH] file: new file version 5.07
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
X-List-Received-Date: Wed, 17 Aug 2011 06:12:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/16/2011 08:10 PM, Adrian Alonso wrote:
> * file version 5.07 also prevents magic file mistmatch
>    in Fedora 15
> * related to bug 1358.
>    http://bugzilla.pokylinux.org/show_bug.cgi?id=1358
>
> Signed-off-by: Adrian Alonso<aalonso00@gmail.com>

Adrian, for OE-Core unless there is a reason to keep the older version 
of a recipe, it should be removed, so please update this patch to remove 
the older version unless we need to keep 5.04 for some reason?

Sau!

> ---
>   meta/recipes-devtools/file/file_5.07.bb |   36 +++++++++++++++++++++++++++++++
>   1 files changed, 36 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-devtools/file/file_5.07.bb
>
> diff --git a/meta/recipes-devtools/file/file_5.07.bb b/meta/recipes-devtools/file/file_5.07.bb
> new file mode 100644
> index 0000000..9b5b51f
> --- /dev/null
> +++ b/meta/recipes-devtools/file/file_5.07.bb
> @@ -0,0 +1,36 @@
> +SUMMARY = "File classification tool"
> +DESCRIPTION = "File attempts to classify files depending \
> +on their contents and prints a description if a match is found."
> +HOMEPAGE = "http://www.darwinsys.com/file/"
> +SECTION = "console/utils"
> +
> +# two clause BSD
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=6a7382872edb68d33e1a9398b6e03188"
> +
> +DEPENDS = "zlib file-native"
> +DEPENDS_virtclass-native = "zlib-native"
> +PR = "r0"
> +
> +SRC_URI = "ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz \
> +           file://dump \
> +           file://filesystems"
> +
> +SRC_URI[md5sum] = "b8d1f9a8a644067bd0a703cebf3f4858"
> +SRC_URI[sha256sum] = "c968bfe97d87f9f564728a894d57be2c6bba9a2006763fffff85c5f72a9a3c2f"
> +
> +inherit autotools
> +
> +do_configure_prepend() {
> +	cp ${WORKDIR}/dump ${S}/magic/Magdir/
> +	cp ${WORKDIR}/filesystems ${S}/magic/Magdir/
> +}
> +
> +FILES_${PN} += "${datadir}/misc/*.mgc"
> +
> +do_install_append_virtclass-native() {
> +	create_cmdline_wrapper ${D}/${bindir}/file \
> +		--magic-file ${datadir}/misc/magic.mgc
> +}
> +
> +BBCLASSEXTEND = "native"


