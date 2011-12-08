Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RYhGR-00018w-4s
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 17:56:07 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 08 Dec 2011 08:49:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="83674777"
Received: from unknown (HELO [10.255.12.35]) ([10.255.12.35])
	by azsmga001.ch.intel.com with ESMTP; 08 Dec 2011 08:49:15 -0800
Message-ID: <4EE0EA8B.6010103@linux.intel.com>
Date: Thu, 08 Dec 2011 08:49:15 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1323123226-24719-1-git-send-email-kergoth@gmail.com>
In-Reply-To: <1323123226-24719-1-git-send-email-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH v2] lzop-1.03: add recipe
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
X-List-Received-Date: Thu, 08 Dec 2011 16:56:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/05/2011 02:13 PM, Christopher Larson wrote:
> From: Christopher Larson<chris_larson@mentor.com>
>
> This is needed by some kernels when CONFIG_KERNEL_LZO=y (specifically, given
> the current defconfig, this affects linux-omap4 2.6 in the meta-ti layer).
>
> Signed-off-by: Christopher Larson<chris_larson@mentor.com>
> ---
>   meta/recipes-support/lzop/lzop/acinclude.m4 |  390 +++++++++++++++++++++++++++
>   meta/recipes-support/lzop/lzop_1.03.bb      |   25 ++
>   2 files changed, 415 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-support/lzop/lzop/acinclude.m4
>   create mode 100644 meta/recipes-support/lzop/lzop_1.03.bb
>

<SNIP>

> diff --git a/meta/recipes-support/lzop/lzop_1.03.bb b/meta/recipes-support/lzop/lzop_1.03.bb
> new file mode 100644
> index 0000000..d0cb842
> --- /dev/null
> +++ b/meta/recipes-support/lzop/lzop_1.03.bb
> @@ -0,0 +1,25 @@
> +SUMMARY = "Real-time file compressor"
> +DESCRIPTION = "lzop is a compression utility which is designed to be a companion to gzip. \n\
> +It is based on the LZO data compression library and its main advantages over \n\
> +gzip are much higher compression and decompression speed at the cost of some \n\
> +compression ratio. The lzop compression utility was designed with the goals \n\
> +of reliability, speed, portability and with reasonable drop-in compatibility \n\
> +to gzip."
> +DEPENDS += "lzo"
> +PR = "r0"
> +
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=dfeaf3dc4beef4f5a7bdbc35b197f39e \
> +                    file://src/lzop.c;beginline=5;endline=21;md5=6797bd3ed0a1a49327b7ebf9366ebd86"
> +
> +SRC_URI = "http://www.lzop.org/download/${BP}.tar.gz \
I think this ------------------------------- ^^
should really be ${BPN}-${PV} which make is much easier to do updates 
with by just changing the file name.


> +           file://acinclude.m4"
> +
NO SRC_URI Checksums!

> +inherit autotools
> +
> +do_configure () {
> +    ln -sf ../acinclude.m4
> +    autotools_do_configure
> +}
> +
> +BBCLASSEXTEND += "native nativesdk"


