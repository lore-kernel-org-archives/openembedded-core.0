Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6CEE37CD45
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 08:51:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x218pPFX013881
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Mar 2019 00:51:25 -0800 (PST)
Received: from [128.224.163.141] (128.224.163.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.435.0;
	Fri, 1 Mar 2019 00:51:24 -0800
To: <openembedded-core@lists.openembedded.org>
References: <cover.1551430235.git.Qi.Chen@windriver.com>
	<e9c8abe986cf352c8d931c738ba5e4a228313402.1551430235.git.Qi.Chen@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <6461742c-3821-1eee-3c91-bb2b7d301d36@windriver.com>
Date: Fri, 1 Mar 2019 17:01:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <e9c8abe986cf352c8d931c738ba5e4a228313402.1551430235.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.163.141]
Subject: Re: [PATCH 3/3] systemd-boot: upgrade to 241
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
X-List-Received-Date: Fri, 01 Mar 2019 08:51:24 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/01/2019 04:52 PM, Chen Qi wrote:
> The following two patches are added because I cannot figure
> out how to pass parameter to efi-cc if it's changed to be
> an array value.
>
>    systemd/0001-Revert-meson-print-EFI-CC-configuration-nicely.patch
>    systemd/0001-Revert-meson-use-an-array-option-for-efi-cc.patch
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   .../{systemd-boot_239.bb => systemd-boot_241.bb}   | 10 +--
>   ...t-meson-print-EFI-CC-configuration-nicely.patch | 33 ++++++++++
>   ...vert-meson-use-an-array-option-for-efi-cc.patch | 77 ++++++++++++++++++++++
>   3 files changed, 116 insertions(+), 4 deletions(-)
>   rename meta/recipes-core/systemd/{systemd-boot_239.bb => systemd-boot_241.bb} (85%)
>   create mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-meson-print-EFI-CC-configuration-nicely.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-meson-use-an-array-option-for-efi-cc.patch
>
> diff --git a/meta/recipes-core/systemd/systemd-boot_239.bb b/meta/recipes-core/systemd/systemd-boot_241.bb
> similarity index 85%
> rename from meta/recipes-core/systemd/systemd-boot_239.bb
> rename to meta/recipes-core/systemd/systemd-boot_241.bb
> index 2450d52..083a864 100644
> --- a/meta/recipes-core/systemd/systemd-boot_239.bb
> +++ b/meta/recipes-core/systemd/systemd-boot_241.bb
> @@ -3,23 +3,25 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
>   
>   DEPENDS = "intltool-native libcap util-linux gnu-efi gperf-native"
>   
> -SRC_URI += "file://0002-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch \
> -            file://0006-remove-nobody-user-group-checking.patch \
> +# NOTE: These three patches are in theory not needed, but we haven't
> +#       figured out how to correctly pass efi-cc parameter if it's an array.
> +SRC_URI += "file://0001-Revert-meson-use-an-array-option-for-efi-cc.patch \
> +            file://0001-Revert-meson-print-EFI-CC-configuration-nicely.patch \
>               file://0001-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch \
> -            file://0001-meson-rename-Ddebug-to-Ddebug-extra.patch \
>               "
>   
>   inherit meson pkgconfig gettext
>   inherit deploy
>   
>   EFI_CC ?= "${CC}"
> +
>   EXTRA_OEMESON += "-Defi=true \
>                     -Dgnu-efi=true \
>                     -Defi-includedir=${STAGING_INCDIR}/efi \
>                     -Defi-ldsdir=${STAGING_LIBDIR} \
>                     -Defi-libdir=${STAGING_LIBDIR} \
>                     -Dman=false \
> -                  -Defi-cc='${EFI_CC}' \
> +                  -Defi-cc='${CC}' \
>                     -Defi-ld='${LD}' \
>                     "
>   

The above change is not needed.
I've fixed it and updated the remote branch.

   git://git.pokylinux.org/poky-contrib ChenQi/systemd-241
   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/systemd-241


Best Regards,
Chen Qi

> diff --git a/meta/recipes-core/systemd/systemd/0001-Revert-meson-print-EFI-CC-configuration-nicely.patch b/meta/recipes-core/systemd/systemd/0001-Revert-meson-print-EFI-CC-configuration-nicely.patch
> new file mode 100644
> index 0000000..ed14e25
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0001-Revert-meson-print-EFI-CC-configuration-nicely.patch
> @@ -0,0 +1,33 @@
> +From 0bf530aac152630500939db31f98d933158fdabd Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Tue, 26 Feb 2019 14:27:49 +0800
> +Subject: [PATCH] Revert "meson: print EFI CC configuration nicely"
> +
> +This reverts commit c512dfb9ac948ddb1ced0dab07b9dac88b198293.
> +
> +This patch is here because we haven't figured out how to pass
> +parameter to efi-cc if it's an array in systemd-boot recipe.
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 70fb218..30df834 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -3138,7 +3138,7 @@ if conf.get('ENABLE_EFI') == 1
> +         if have_gnu_efi
> +                 status += [
> +                         'EFI machine type:                  @0@'.format(EFI_MACHINE_TYPE_NAME),
> +-                        'EFI CC                             @0@'.format(' '.join(efi_cc)),
> ++                        'EFI CC                             @0@'.format(efi_cc),
> +                         'EFI lib directory:                 @0@'.format(efi_libdir),
> +                         'EFI lds directory:                 @0@'.format(efi_ldsdir),
> +                         'EFI include directory:             @0@'.format(efi_incdir)]
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-core/systemd/systemd/0001-Revert-meson-use-an-array-option-for-efi-cc.patch b/meta/recipes-core/systemd/systemd/0001-Revert-meson-use-an-array-option-for-efi-cc.patch
> new file mode 100644
> index 0000000..0d2ebf6
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0001-Revert-meson-use-an-array-option-for-efi-cc.patch
> @@ -0,0 +1,77 @@
> +From 0030dcbac1a9177ef7a28af209ac67149b899f5f Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Tue, 26 Feb 2019 14:17:25 +0800
> +Subject: [PATCH] Revert "meson: use an array option for efi-cc"
> +
> +This reverts commit 595343fb4c99c2679d347ef7c19debfbfed6342e.
> +
> +This patch is here because we haven't figured out how to pass
> +parameter to efi-cc if it's an array in systemd-boot recipe.
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + meson_options.txt        |  2 +-
> + src/boot/efi/meson.build | 11 ++++++-----
> + 2 files changed, 7 insertions(+), 6 deletions(-)
> +
> +diff --git a/meson_options.txt b/meson_options.txt
> +index 044bb79..3d28bfd 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -292,7 +292,7 @@ option('dbus', type : 'combo', choices : ['auto', 'true', 'false'],
> +
> + option('gnu-efi', type : 'combo', choices : ['auto', 'true', 'false'],
> +        description : 'gnu-efi support for sd-boot')
> +-option('efi-cc', type : 'array',
> ++option('efi-cc', type : 'string',
> +        description : 'the compiler to use for EFI modules')
> + option('efi-ld', type : 'string',
> +        description : 'the linker to use for EFI modules')
> +diff --git a/src/boot/efi/meson.build b/src/boot/efi/meson.build
> +index 2140151..d8db3a1 100644
> +--- a/src/boot/efi/meson.build
> ++++ b/src/boot/efi/meson.build
> +@@ -34,8 +34,8 @@ stub_sources = '''
> +
> + if conf.get('ENABLE_EFI') == 1 and get_option('gnu-efi') != 'false'
> +         efi_cc = get_option('efi-cc')
> +-        if efi_cc.length() == 0
> +-                efi_cc = cc.cmd_array()
> ++        if efi_cc == ''
> ++                efi_cc = ' '.join(cc.cmd_array())
> +         endif
> +         efi_ld = get_option('efi-ld')
> +         if efi_ld == ''
> +@@ -57,7 +57,8 @@ if conf.get('ENABLE_EFI') == 1 and get_option('gnu-efi') != 'false'
> +
> +         efi_libdir = get_option('efi-libdir')
> +         if efi_libdir == ''
> +-                ret = run_command(efi_cc + ['-print-multi-os-directory'])
> ++                cmd = 'cd /usr/lib/$(@0@ -print-multi-os-directory) && pwd'.format(efi_cc)
> ++                ret = run_command('sh', '-c', cmd)
> +                 if ret.returncode() == 0
> +                         path = join_paths('/usr/lib', ret.stdout().strip())
> +                         ret = run_command('realpath', '-e', path)
> +@@ -152,7 +153,7 @@ if have_gnu_efi
> +                 o_file = custom_target(file + '.o',
> +                                        input : file,
> +                                        output : file + '.o',
> +-                                       command : efi_cc + ['-c', '@INPUT@', '-o', '@OUTPUT@']
> ++                                       command : [efi_cc, '-c', '@INPUT@', '-o', '@OUTPUT@']
> +                                                  + compile_args,
> +                                        depend_files : efi_headers)
> +                 if (common_sources + systemd_boot_sources).contains(file)
> +@@ -163,7 +164,7 @@ if have_gnu_efi
> +                 endif
> +         endforeach
> +
> +-        libgcc_file_name = run_command(efi_cc + ['-print-libgcc-file-name']).stdout().strip()
> ++        libgcc_file_name = run_command(efi_cc, '-print-libgcc-file-name').stdout().strip()
> +         systemd_boot_efi_name = 'systemd-boot@0@.efi'.format(EFI_MACHINE_TYPE_NAME)
> +         stub_efi_name = 'linux@0@.efi.stub'.format(EFI_MACHINE_TYPE_NAME)
> +         no_undefined_symbols = find_program('no-undefined-symbols.sh')
> +--
> +2.7.4
> +



