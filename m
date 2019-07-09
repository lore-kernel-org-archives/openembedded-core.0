Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3AD277DE4B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2019 08:23:49 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id h28so8449103lfj.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jul 2019 01:23:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=2NZX78tD32HjORKXUlz2w0gDbZYNQhFQMHk7nGAOPA0=;
	b=Pv+NSgo7yRph3kCWDYevXUjF8Sn1wvbP1ZlLLByzbzN/SkstILDjt/idgjnTcJcXMM
	R2tnhldNPn3csnryYWUCFDxevRqDA/7kCdAdqYp3nslX4Tqn/YPNQss6YMlL2i/2ONgi
	SzwWsPRD3Xfl1/iHSiQvt5P7+/Yzsn1oWy7EU/exDupswEjeTKAECkZvRojcyoKCauRg
	yBLfLaVsAeVMNSRNQ64xMy4ti34frrMKuRj4D2u7I4DsHVTJIJi89VM2MnbjVAzDKO5Y
	uPb3wSXvsHDexSoG7nh0zj2jJKG3R85M59a3P0SP5BR4/WxcKbUHOupHlbvX9FZOam2G
	5gGg==
X-Gm-Message-State: APjAAAXJzQ3RM7J5YAH6FSbjLSPpm0yO+BVwdvbHVqmehk41ttYaL5Bi
	A41SdX9yQKZ58uRkfS5Jrrd8YeuG7QD0OO4GjVVTGzua
X-Google-Smtp-Source: APXvYqz2Klgoez824+esATCD6B7RM8Yw1LckrJcO/vPUAVPI7HCUxSeGH/KtzoXN9RRZNm+F6zx2pR9mX4gIEhPiKPA=
X-Received: by 2002:a19:ca4b:: with SMTP id h11mr10513868lfj.162.1562660629295;
	Tue, 09 Jul 2019 01:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190703163303.5397-1-ricardo@ribalda.com>
In-Reply-To: <20190703163303.5397-1-ricardo@ribalda.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Date: Tue, 9 Jul 2019 10:23:31 +0200
Message-ID: <CAPybu_3Lqr08s+TbeH=RAggPLYC=U-GYvfRnnuKrS8z4+5i2Cw@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH v2] systemd-bootconf: Make is machine specific
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
X-List-Received-Date: Tue, 09 Jul 2019 08:23:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard

Something else that I need to fix on this patch?

Thanks!

On Wed, Jul 3, 2019 at 6:33 PM Ricardo Ribalda Delgado
<ricardo@ribalda.com> wrote:
>
> Recipe makes use of the variable APPEND:
>
> do_configure[vardeps] +=3D "APPEND"
>
> APPEND is usually linked to a to a machine and not to a
> cpu architecture, as it describe things like the location
> of the main serial port or tty.
>
> Therefore the recipe should be MACHINE_ARCH.
>
> This patch avoids multiconfig errors such as:
>
> | NOTE: Direct dependencies are ['multiconfig:qt5022:/workdir/repo/poky/m=
eta/recipes-core/glibc/glibc_2.29.bb:do_populate_sysroot', 'multiconfig:qt5=
022:virtual:native:/workdir/repo/poky/meta/recipes-devtools/pseudo/pseudo_g=
it.bb:do_populate_sysroot', 'multiconfig:qt5022:/workdir/repo/poky/meta/rec=
ipes-devtools/quilt/quilt-native_0.65.bb:do_populate_sysroot', 'multiconfig=
:qt5022:/workdir/repo/poky/meta/recipes-devtools/gcc/gcc-cross_8.3.bb:do_po=
pulate_sysroot', 'multiconfig:qt5022:/workdir/repo/poky/meta/recipes-devtoo=
ls/gcc/gcc-runtime_8.3.bb:do_populate_sysroot']
> | NOTE: Installed into sysroot: []
> | NOTE: Skipping as already exists in sysroot: ['glibc', 'pseudo-native',=
 'quilt-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'linux-libc-h=
eaders', 'libtool-native', 'texinfo-dummy-native', 'libmpc-native', 'flex-n=
ative', 'automake-native', 'zlib-native', 'mpfr-native', 'gmp-native', 'bin=
utils-cross-x86_64', 'xz-native', 'autoconf-native', 'gnu-config-native', '=
gettext-minimal-native', 'm4-native']
> | DEBUG: Python function extend_recipe_sysroot finished
> | DEBUG: Executing shell function do_install
> | install: cannot stat 'loader.conf': No such file or directory
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_install (log file is located at /workdir/bui=
ld/tmp/work/bobcat-poky-linux/systemd-bootconf/1.00-r0/temp/log.do_install.=
737)
> NOTE: recipe systemd-bootconf-1.00-r0: task do_install: Failed
> ERROR: Task (multiconfig:qt5022:/workdir/repo/poky/meta/recipes-core/syst=
emd/systemd-bootconf_1.00.bb:do_install) failed with exit code '1'
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> ---
>  meta/recipes-core/systemd/systemd-bootconf_1.00.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/systemd/systemd-bootconf_1.00.bb b/meta/re=
cipes-core/systemd/systemd-bootconf_1.00.bb
> index e9c2466456..d13b8c518f 100644
> --- a/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
> +++ b/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
> @@ -3,6 +3,7 @@ LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT=
;md5=3D3da9cfbcb788c80a0384
>  SUMMARY =3D "Basic systemd-boot configuration files"
>
>  RPROVIDES_${PN} +=3D "virtual/systemd-bootconf"
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>
>  inherit systemd-boot-cfg
>
> --
> 2.20.1
>


--=20
Ricardo Ribalda

