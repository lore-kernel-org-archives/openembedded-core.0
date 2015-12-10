Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id F3AE6605B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 23:16:10 +0000 (UTC)
Received: by wmec201 with SMTP id c201so46306530wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 15:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=oukD39mnlHClz41FQxd2gthL8KbDkSM2LtTxzXb8poM=;
	b=fCyuxXqTHA6pdvCcgWWWdbFEUIGIbMDbzw+vTfYheOKNvE22IQSJlaBiX/asDaHHSw
	pe+EasFggkiZLc6t9umz62BLOhYw8qb4mGfuGeUfCUXb8CSbPvqpkPe5UH1QHfzzMEBA
	82VqVbyYbeAuzx0Oqkv2dM9gLxL9ZMjgXeEJnrDr9bi+srYUnCaCoJEUvkE5SXueLLOF
	vZOUfT8d4Xm0mrfdFZ6aXMeTXFnBcdPt2QnajEWNgrZouOlUhdwLyV14ZLiw//scGyr3
	uAA8Mp8zIBT7fIFPaIlGu31B2OMNDPPLSZewJ7cZhIb5+mhlb8v8AdcOdMJNmkVV+p25
	SJOA==
MIME-Version: 1.0
X-Received: by 10.28.180.132 with SMTP id d126mr1736899wmf.72.1449789370356;
	Thu, 10 Dec 2015 15:16:10 -0800 (PST)
Received: by 10.194.117.68 with HTTP; Thu, 10 Dec 2015 15:16:10 -0800 (PST)
In-Reply-To: <1449782540-4416-1-git-send-email-alejandro.delcastillo@ni.com>
References: <1449702069-11889-1-git-send-email-alejandro.delcastillo@ni.com>
	<1449782540-4416-1-git-send-email-alejandro.delcastillo@ni.com>
Date: Thu, 10 Dec 2015 15:16:10 -0800
Message-ID: <CAJ86T=WinR1iEU-7QwQ1j75174dM8S+oY6H3WZgudXUyoOaX7A@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] libsolv: add new recipe
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
X-List-Received-Date: Thu, 10 Dec 2015 23:16:11 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 10, 2015 at 1:22 PM, Alejandro del Castillo
<alejandro.delcastillo@ni.com> wrote:
> Required by the optional opkg 0.3.1 libsolv backend.
>
> Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> ---
>  meta/recipes-extended/libsolv/libsolv_0.6.14.bb | 28 +++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 meta/recipes-extended/libsolv/libsolv_0.6.14.bb
>
> diff --git a/meta/recipes-extended/libsolv/libsolv_0.6.14.bb b/meta/recipes-extended/libsolv/libsolv_0.6.14.bb
> new file mode 100644
> index 0000000..fba6b2d
> --- /dev/null
> +++ b/meta/recipes-extended/libsolv/libsolv_0.6.14.bb
> @@ -0,0 +1,28 @@
> +SUMMARY = "Library for solving packages and reading repositories"
> +HOMEPAGE = "https://github.com/openSUSE/libsolv"
> +BUGTRACKER = "https://github.com/openSUSE/libsolv/issues"
> +SECTION = "devel"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
> +
> +SRC_URI = "https://github.com/openSUSE/libsolv/archive/${PV}.zip"

GitHub tar file archives sometimes get regenerated and the hashes
change. I'm not sure if the same can happen for zip files, but it's
probably safer to checkout a git release tag rather than trust the zip
file.

> +SRC_URI[md5sum] = "171da68f08f672cacd1930643f8d1b4d"
> +SRC_URI[sha256sum] = "0263b11372012be9c83f1c01f7d55ea9464dde58c109f5ae4de1e52870034a45"
> +
> +S = "${WORKDIR}/libsolv-${PV}"

This is effectively the default value, so this line can be removed (if
you switch to a git checkout then S does need to be specified though).

> +inherit cmake
> +
> +EXTRA_OECMAKE = "-DLIB=${baselib}"
> +
> +DEPENDS = "expat zlib"

DEPENDS should be above SRC_URI. See the OE style guide:

  http://www.openembedded.org/wiki/Styleguide

> +PACKAGES =+ "${PN}-tools ${PN}ext ${PN}ext-dbg"
> +
> +FILES_${PN}-dev += "${datadir}/cmake/Modules/FindLibSolv.cmake"
> +FILES_${PN}-tools = "${bindir}/*"
> +FILES_${PN}ext = "${libdir}/${PN}ext.so.*"
> +FILES_${PN}ext-dbg = "${libdir}/.debug/${PN}ext.so.*"
> +
> +BBCLASSEXTEND =+ "native nativesdk"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

