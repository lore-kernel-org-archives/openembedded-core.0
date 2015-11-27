Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 798526012A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 19:51:15 +0000 (UTC)
Received: by wmww144 with SMTP id w144so69313352wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 11:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=w5UnbnSxYCHn9AYcmWURnajpQFKY+XzLNH2dx89Ukaw=;
	b=D384tnT+0ifNa+mBqLiFmF45UJujQamv8raAXRQMxMdR8vQukRk1KPhgI/JEXpMUgR
	ppBaVSomB4dOsx2snqzkCOxq5yFbfa2fRsslzPSjb0JabzDTMNy4fnxjnptaemwSeHgn
	3v/Lu/0JeL+mcb4eqOgr3Mv8GsNYMdEuRpvDw6OCgA7/z/do/Kr4HvYNZpnM+GSkL4JV
	y0xoVyLl7SyYqnMGODdb3fmmDiqAJ7QzZ14kveDskVCln/UuR8fzxZOVl5+KxbfP4ywv
	U0oznTrnSiQF7B3gvPVzICPIBMjsqb3YgeVYrfc5VwuPkK7GbTfeFMqN9RnZ1qslFCTG
	n01g==
MIME-Version: 1.0
X-Received: by 10.194.203.99 with SMTP id kp3mr16097882wjc.3.1448653875567;
	Fri, 27 Nov 2015 11:51:15 -0800 (PST)
Received: by 10.194.140.38 with HTTP; Fri, 27 Nov 2015 11:51:15 -0800 (PST)
In-Reply-To: <1448622259-5907-3-git-send-email-maxin.john@intel.com>
References: <1448622259-5907-1-git-send-email-maxin.john@intel.com>
	<1448622259-5907-3-git-send-email-maxin.john@intel.com>
Date: Fri, 27 Nov 2015 11:51:15 -0800
Message-ID: <CAJ86T=Wmiaa7Trg78BVn5tu+3y63M_4CT=-0tQ=_aGh8gZUm9g@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] libjpeg-turbo: import the recipe from meta-oe
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
X-List-Received-Date: Fri, 27 Nov 2015 19:51:15 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 27, 2015 at 3:04 AM, Maxin B. John <maxin.john@intel.com> wrote:
> libjpeg-turbo has same API/ABI as libjpeg. It is relatively
> faster in JPEG compression/decompression than libjpeg.

Please take the libjpeg-turbo 1.4.2 recipe from meta-oe master-next
instead of the 1.4.1 recipe from meta-oe master.

> [YOCTO #8628]
>
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb | 40 ++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb
>
> diff --git a/meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb b/meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb
> new file mode 100644
> index 0000000..e79f800
> --- /dev/null
> +++ b/meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb
> @@ -0,0 +1,40 @@
> +DESCRIPTION = "libjpeg-turbo is a derivative of libjpeg that uses SIMD instructions (MMX, SSE2, NEON) to accelerate baseline JPEG compression and decompression"
> +HOMEPAGE = "http://libjpeg-turbo.org/"
> +
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=12;md5=cad955d15145c3fdceec6855e078e953 \
> +                    file://jpeglib.h;endline=14;md5=dfc803dc51ae21178d1376ec73c4454d \
> +                    file://djpeg.c;endline=9;md5=e93a8f2061e8a0ac71c7a485c10489e2 \
> +"
> +
> +DEPENDS = "nasm-native"
> +
> +BASEPV = "${@d.getVar('PV',True).split('+')[1]}"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${BASEPV}.tar.gz"
> +SRC_URI[md5sum] = "b1f6b84859a16b8ebdcda951fa07c3f2"
> +SRC_URI[sha256sum] = "4bf5bad4ce85625bffbbd9912211e06790e00fb982b77724af7211034efafb08"
> +
> +S = "${WORKDIR}/${BPN}-${BASEPV}"
> +
> +# Drop-in replacement for jpeg
> +PROVIDES = "jpeg"
> +RPROVIDES_${PN} += "jpeg"
> +RREPLACES_${PN} += "jpeg"
> +RCONFLICTS_${PN} += "jpeg"
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF = "--with-jpeg8 "
> +
> +PACKAGES =+ "jpeg-tools libturbojpeg"
> +
> +DESCRIPTION_jpeg-tools = "The jpeg-tools package includes client programs to access libjpeg functionality.  These tools allow for the compression, decompression, transformation and display of JPEG files and benchmarking of the libjpeg library."
> +FILES_jpeg-tools = "${bindir}/*"
> +
> +FILES_libturbojpeg = "${libdir}/libturbojpeg.so"
> +INSANE_SKIP_libturbojpeg = "dev-so"
> +
> +BBCLASSEXTEND = "native"
> +
> +LEAD_SONAME = "libjpeg.so.8"
> --
> 2.4.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

