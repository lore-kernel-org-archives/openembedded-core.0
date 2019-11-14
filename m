Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 3119B7F973
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2019 14:47:14 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 95DAB5C1D4B;
	Thu, 14 Nov 2019 15:47:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1573742834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=IoRvQXOhNbcrwykkunzvdfrnpUcI5vJDFpBn8qgVx1M=;
	b=scOqi3HGt4G1+3KUnkPG0a0PCvm9RVtXznc0MU4f6/yk7yu2eKxbDI6oFIog9D1G1vALp9
	9kOWp65Yi1ITiWrWHv1FjdnyZ8ku+ekaOijK3JNYEPlW0iCLzTCeOwRnFBsaRw/tyPzkDS
	h+nsqx0sZAbc/XAnU3vpN1ZgOd3gcOg=
MIME-Version: 1.0
Date: Thu, 14 Nov 2019 15:47:14 +0100
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
In-Reply-To: <20191108091419.25156-1-stefan@agner.ch>
References: <20191108091419.25156-1-stefan@agner.ch>
Message-ID: <7e0b2e1cc9931c92c2bcdcf5ef1f6f75@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH v3 1/2] zstd: move recipe to oe-core from meta-oe
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
X-List-Received-Date: Thu, 14 Nov 2019 14:47:14 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2019-11-08 10:14, Stefan Agner wrote:
> From: Stefan Agner <stefan.agner@toradex.com>
> 
> Zstd is a very fast compression algorithm and has gained quite some
> popularity recently. An upcoming patch allows to compress rootfs
> using Zstd. Moving Zstd to oe-core allows this new conversion formats
> to be automatically tested by the oe-selftest
> imagefeatures.ImageFeatures.test_image_fstypes test.
> 
> Furthermore there are three packages in oe-core which allow to enable
> Zstd support through packageconfig currently.

Any update/thoughts on this?

--
Stefan

> 
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> ---
>  meta/recipes-extended/zstd/zstd_1.4.4.bb | 35 ++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 meta/recipes-extended/zstd/zstd_1.4.4.bb
> 
> diff --git a/meta/recipes-extended/zstd/zstd_1.4.4.bb
> b/meta/recipes-extended/zstd/zstd_1.4.4.bb
> new file mode 100644
> index 0000000000..eb201f4139
> --- /dev/null
> +++ b/meta/recipes-extended/zstd/zstd_1.4.4.bb
> @@ -0,0 +1,35 @@
> +SUMMARY = "Zstandard - Fast real-time compression algorithm"
> +DESCRIPTION = "Zstandard is a fast lossless compression algorithm, targeting \
> +real-time compression scenarios at zlib-level and better compression ratios. \
> +It's backed by a very fast entropy stage, provided by Huff0 and FSE library."
> +HOMEPAGE = "http://www.zstd.net/"
> +SECTION = "console/utils"
> +
> +LICENSE = "BSD-3-Clause & GPLv2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c7f0b161edbe52f5f345a3d1311d0b32 \
> +                    file://COPYING;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0"
> +
> +SRC_URI = "git://github.com/facebook/zstd.git;nobranch=1"
> +
> +SRCREV = "10f0e6993f9d2f682da6d04aa2385b7d53cbb4ee"
> +UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
> +
> +S = "${WORKDIR}/git"
> +
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[lz4] = "HAVE_LZ4=1,HAVE_LZ4=0,lz4"
> +PACKAGECONFIG[lzma] = "HAVE_LZMA=1,HAVE_LZMA=0,xz"
> +PACKAGECONFIG[zlib] = "HAVE_ZLIB=1,HAVE_ZLIB=0,zlib"
> +
> +# See programs/README.md for how to use this
> +ZSTD_LEGACY_SUPPORT ??= "4"
> +
> +do_compile () {
> +    oe_runmake ${PACKAGECONFIG_CONFARGS}
> ZSTD_LEGACY_SUPPORT=${ZSTD_LEGACY_SUPPORT}
> +}
> +
> +do_install () {
> +    oe_runmake install 'DESTDIR=${D}'
> +}
> +
> +BBCLASSEXTEND = "native nativesdk"

