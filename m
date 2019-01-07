Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2CB8F7BE4E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2019 12:41:54 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id k7so163843iob.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2019 04:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/p744TaGG/T+THu95GQxpYi0UXARDaIIKIInwnIivOI=;
	b=FZFX5k3qzucwrVaJBDp/FvyknUoR9VOQ7r1CQJ0GcBB8z5StpOx6NnX9vJtIB2bzNk
	+ZgcXUwu3y6bT+tl5QTKACltIT2cDitPWmt40M9AqneUnk+MzGNEjKBJAIcxEf8eULto
	CMzkK+sIz07WZrIX5nYwuQCTyQ1mW8JuvvPTOPiBBKO1caqNvK1oPuEc6sHpA1vpMqw1
	t9+M5q40BipKi7TchPl6Q+2eU+Bd6USigpKBELGiQt6t9V+3+If6QIUJTOsIlX3vEz1s
	IVuZbQQHzb7gQJSUlT2tB8c3ct2Ps0g1gWkzBtTP+QBQMbye8DVle6PGxQaKhsGx0aJR
	3DEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/p744TaGG/T+THu95GQxpYi0UXARDaIIKIInwnIivOI=;
	b=kRKd6GLTMflFluEoNj/SL0N8IRV6h55iy1VU2aodvHuR2Jq3mpgCu6Dd2AdkoqemXX
	YzP4r/Ws+KjuRE60PUswcJXRnTo4ZmcEr0u8rnnLh1YsI4jnprRKKNCa18fvQdp6Cpwr
	xrvb9ulb7HLUK4Us6kOFDOKC5ZVsBiXAYejNbOFvqTnSVoDTRKah5NM9Vg3CMdBBPzLt
	5OKD7j8EV81syWoaFTbxf29CNIHdUY9MPNPWjbN6u70vj/iYohGQVzkbyrg2jRPmLPFf
	fACKgJQduxSdj0NdJ3xtr4iN5yp1UQWwo8Fy3VITmjJ2zKOz0Ill5aNj+sUWfyOMwfxK
	WMAA==
X-Gm-Message-State: AJcUukdKR6dpK2Ew/HmevR3zvvR1MPK7QHzKBA9Ukq6jNFPDG1OhsZAq
	l1tlnUSu0KmocPbzjSM9Vycm1Fa2MurCH93DSVnRZT8A
X-Google-Smtp-Source: ALg8bN7AQzOKnXfmtc3vud3JmrMFcb99QzHYaMZLAkuGPqgXxJgTl6lIA1I1d6+DfmI4bqRLwWZJdt1Qg2jrJeH4bXo=
X-Received: by 2002:a6b:acc5:: with SMTP id v188mr40614917ioe.20.1546864915938;
	Mon, 07 Jan 2019 04:41:55 -0800 (PST)
MIME-Version: 1.0
References: <20180601210240.14969-1-mkelly@xevo.com>
	<20180601210240.14969-8-mkelly@xevo.com>
In-Reply-To: <20180601210240.14969-8-mkelly@xevo.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Jan 2019 12:41:45 +0000
Message-ID: <CAJTo0LY-16oCyFf-etweZq1P5=DpOtG8Qou0pQHMa0mZkXvPaA@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 7/7] meson: enable nativesdk
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
X-List-Received-Date: Mon, 07 Jan 2019 12:41:55 -0000
Content-Type: text/plain; charset="UTF-8"

I added a test case to actually build something with Meson on the
autobuilder, and this breaks for multilib SDKs.  These ship multiple
environment files, so the cross generation can't happen at relocate
time.

Ross

On Fri, 1 Jun 2018 at 22:04, Martin Kelly <mkelly@xevo.com> wrote:
>
> Currently, we can't build meson into SDKs because we don't autogenerate
> the required meson.cross file.
>
> Enable this by using the post-relocate hooks and generating a
> meson.cross file based on the SDK environment passed into the
> post-relocate hook.
>
> Signed-off-by: Martin Kelly <mkelly@xevo.com>
> ---
>  meta/recipes-devtools/meson/meson.inc              | 22 +++++++
>  meta/recipes-devtools/meson/meson/meson-setup.py   | 62 ++++++++++++++++++
>  meta/recipes-devtools/meson/meson/meson-wrapper    | 14 ++++
>  meta/recipes-devtools/meson/meson_0.46.1.bb        | 22 +------
>  .../meson/nativesdk-meson_0.46.1.bb                | 74 ++++++++++++++++++++++
>  5 files changed, 173 insertions(+), 21 deletions(-)
>  create mode 100644 meta/recipes-devtools/meson/meson.inc
>  create mode 100755 meta/recipes-devtools/meson/meson/meson-setup.py
>  create mode 100755 meta/recipes-devtools/meson/meson/meson-wrapper
>  create mode 100644 meta/recipes-devtools/meson/nativesdk-meson_0.46.1.bb
>
> diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
> new file mode 100644
> index 0000000000..4c113dcaf7
> --- /dev/null
> +++ b/meta/recipes-devtools/meson/meson.inc
> @@ -0,0 +1,22 @@
> +HOMEPAGE = "http://mesonbuild.com"
> +SUMMARY = "A high performance build system"
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +
> +SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${PV}.tar.gz \
> +           file://0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch \
> +           file://0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch \
> +           file://0001-Linker-rules-move-cross_args-in-front-of-output_args.patch \
> +           file://0003-native_bindir.patch \
> +           file://0004-Prettifying-some-output-with-pathlib.patch \
> +           file://0005-Set-the-meson-command-to-use-when-we-know-what-it-is.patch \
> +           "
> +
> +SRC_URI[md5sum] = "1698f6526574839de5dcdc45e3f7d582"
> +SRC_URI[sha256sum] = "19497a03e7e5b303d8d11f98789a79aba59b5ad4a81bd00f4d099be0212cee78"
> +UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
> +
> +inherit setuptools3
> +
> +RDEPENDS_${PN} = "ninja python3-core python3-modules"
> diff --git a/meta/recipes-devtools/meson/meson/meson-setup.py b/meta/recipes-devtools/meson/meson/meson-setup.py
> new file mode 100755
> index 0000000000..a9749eae9d
> --- /dev/null
> +++ b/meta/recipes-devtools/meson/meson/meson-setup.py
> @@ -0,0 +1,62 @@
> +#!/usr/bin/env python3
> +
> +import os
> +import sys
> +
> +def bail(msg):
> +    print(msg, file=sys.stderr)
> +    sys.exit(1)
> +
> +_MARKER = '@@'
> +def transform_line(line):
> +    # Substitute any special markers of this form:
> +    # @@ENV@@
> +    # with the value of ENV, split into meson array syntax.
> +    start = line.find(_MARKER)
> +    if start == -1:
> +        return line
> +
> +    end = line.rfind(_MARKER)
> +    if end == start:
> +        return line
> +
> +    # Lookup value of the env var.
> +    var = line[start+len(_MARKER):end]
> +    try:
> +        val = os.environ[var]
> +    except KeyError:
> +        bail('cannot generate meson.cross; env var %s not set' % var)
> +
> +    # Transform into meson array.
> +    val = ["'%s'" % x for x in val.split()]
> +    val = ', '.join(val)
> +    val = '[%s]' % val
> +
> +    before = line[:start]
> +    after = line[end+len(_MARKER):]
> +
> +    return '%s%s%s' % (before, val, after)
> +
> +# Make sure this is really an SDK extraction environment.
> +try:
> +    sysroot = os.environ['OECORE_NATIVE_SYSROOT']
> +except KeyError:
> +    bail('OECORE_NATIVE_SYSROOT env var must be set')
> +
> +cross_file = os.path.join(sysroot, 'usr/share/meson/meson.cross')
> +tmp_cross_file = '%s.tmp' % cross_file
> +
> +# Read through and transform the current meson.cross.
> +lines = []
> +with open(cross_file, 'r') as f:
> +    for line in f:
> +        lines.append(transform_line(line))
> +
> +# Write the transformed result to a tmp file and atomically rename it. In case
> +# we crash during the file write, we don't want an invalid meson.cross file.
> +with open(tmp_cross_file, 'w') as f:
> +    for line in lines:
> +        f.write(line)
> +    f.flush()
> +    os.fdatasync(f.fileno())
> +os.rename(tmp_cross_file, cross_file)
> diff --git a/meta/recipes-devtools/meson/meson/meson-wrapper b/meta/recipes-devtools/meson/meson/meson-wrapper
> new file mode 100755
> index 0000000000..b2e00da513
> --- /dev/null
> +++ b/meta/recipes-devtools/meson/meson/meson-wrapper
> @@ -0,0 +1,14 @@
> +#!/bin/sh
> +
> +if [ -z "$OECORE_NATIVE_SYSROOT" ]; then
> +    echo "OECORE_NATIVE_SYSROOT not set; are you in a Yocto SDK environment?" >&2
> +fi
> +
> +# If these are set to a cross-compile path, meson will get confused and try to
> +# use them as native tools. Unset them to prevent this, as all the cross-compile
> +# config is already in meson.cross.
> +unset CC CXX CPP LD AR NM STRIP
> +
> +exec "$OECORE_NATIVE_SYSROOT/usr/bin/meson.real" \
> +     --cross-file "$OECORE_NATIVE_SYSROOT/usr/share/meson/meson.cross" \
> +     "$@"
> diff --git a/meta/recipes-devtools/meson/meson_0.46.1.bb b/meta/recipes-devtools/meson/meson_0.46.1.bb
> index 77f6416cc2..897fa148d9 100644
> --- a/meta/recipes-devtools/meson/meson_0.46.1.bb
> +++ b/meta/recipes-devtools/meson/meson_0.46.1.bb
> @@ -1,23 +1,3 @@
> -HOMEPAGE = "http://mesonbuild.com"
> -SUMMARY = "A high performance build system"
> -
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
> -
> -SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/${BP}.tar.gz \
> -           file://0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch \
> -           file://0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch \
> -           file://0001-Linker-rules-move-cross_args-in-front-of-output_args.patch \
> -           file://0003-native_bindir.patch \
> -           file://0004-Prettifying-some-output-with-pathlib.patch \
> -           file://0005-Set-the-meson-command-to-use-when-we-know-what-it-is.patch \
> -           "
> -SRC_URI[md5sum] = "1698f6526574839de5dcdc45e3f7d582"
> -SRC_URI[sha256sum] = "19497a03e7e5b303d8d11f98789a79aba59b5ad4a81bd00f4d099be0212cee78"
> -UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
> -
> -inherit setuptools3
> -
> -RDEPENDS_${PN} = "ninja python3-core python3-modules"
> +include meson.inc
>
>  BBCLASSEXTEND = "native"
> diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.46.1.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.46.1.bb
> new file mode 100644
> index 0000000000..53503aa998
> --- /dev/null
> +++ b/meta/recipes-devtools/meson/nativesdk-meson_0.46.1.bb
> @@ -0,0 +1,74 @@
> +include meson.inc
> +
> +inherit nativesdk
> +
> +SRC_URI += "file://meson-setup.py \
> +            file://meson-wrapper"
> +
> +def meson_array(var, d):
> +    return "', '".join(d.getVar(var).split()).join(("'", "'"))
> +
> +# both are required but not used by meson
> +MESON_SDK_ENDIAN = "bogus-endian"
> +MESON_TARGET_ENDIAN = "bogus-endian"
> +
> +MESON_TOOLCHAIN_ARGS = "${BUILDSDK_CC_ARCH}${TOOLCHAIN_OPTIONS}"
> +MESON_C_ARGS = "${MESON_TOOLCHAIN_ARGS} ${BUILDSDK_CFLAGS}"
> +MESON_CPP_ARGS = "${MESON_TOOLCHAIN_ARGS} ${BUILDSDK_CXXFLAGS}"
> +MESON_LINK_ARGS = "${MESON_TOOLCHAIN_ARGS} ${BUILDSDK_LDFLAGS}"
> +
> +# This logic is similar but not identical to that in meson.bbclass, since it's
> +# generating for an SDK rather than a cross-compile. Important differences are:
> +# - We can't set vars like CC, CXX, etc. yet because they will be filled in with
> +#   real paths by meson-setup.sh when the SDK is extracted.
> +# - Some overrides aren't needed, since the SDK injects paths that take care of
> +#   them.
> +addtask write_config before do_install
> +do_write_config[vardeps] += "MESON_C_ARGS MESON_CPP_ARGS MESON_LINK_ARGS CC CXX LD AR NM STRIP READELF"
> +do_write_config() {
> +    # This needs to be Py to split the args into single-element lists
> +    cat >${WORKDIR}/meson.cross <<EOF
> +[binaries]
> +c = @@CC@@
> +cpp = @@CXX@@
> +ar = @@AR@@
> +nm = @@NM@@
> +ld = @@LD@@
> +strip = @@STRIP@@
> +pkgconfig = 'pkg-config'
> +
> +[properties]
> +needs_exe_wrapper = true
> +c_args = @@CFLAGS@@
> +c_link_args = @@LDFLAGS@@
> +cpp_args = @@CPPFLAGS@@
> +cpp_link_args = @@LDFLAGS@@
> +
> +[host_machine]
> +system = '${SDK_OS}'
> +cpu_family = '${SDK_ARCH}'
> +cpu = '${SDK_ARCH}'
> +endian = '${MESON_SDK_ENDIAN}'
> +EOF
> +}
> +
> +do_install_append() {
> +    install -d ${D}${datadir}/meson
> +    install -m 0644 ${WORKDIR}/meson.cross ${D}${datadir}/meson/
> +
> +    install -d ${D}${SDKPATHNATIVE}/post-relocate-setup.d
> +    install -m 0755 ${WORKDIR}/meson-setup.py ${D}${SDKPATHNATIVE}/post-relocate-setup.d/
> +
> +    # We need to wrap the real meson with a thin env setup wrapper.
> +    mv ${D}${bindir}/meson ${D}${bindir}/meson.real
> +    install -m 0755 ${WORKDIR}/meson-wrapper ${D}${bindir}/meson
> +}
> +
> +RDEPENDS_${PN} += "\
> +    nativesdk-ninja \
> +    nativesdk-python3-core \
> +    nativesdk-python3-misc \
> +    nativesdk-python3-modules \
> +    "
> +
> +FILES_${PN} += "${datadir}/meson ${SDKPATHNATIVE}"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

