Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C38DD6FEF5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 01:24:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w281OAEQ025431
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 7 Mar 2018 17:24:10 -0800
Received: from [128.224.162.197] (128.224.162.197) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 7 Mar 2018 17:23:35 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1520213817.git.Qi.Chen@windriver.com>
	<3caecc99c62194c9d0419c248947fba03e013940.1520213817.git.Qi.Chen@windriver.com>
	<CAJTo0LY0adVVH9aP_fgimcXSzR8dDfGuZWF4mpyBX-4AnbZ4tA@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <bc1b1a5b-1470-e677-54be-7b57e3ea0caf@windriver.com>
Date: Thu, 8 Mar 2018 09:24:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY0adVVH9aP_fgimcXSzR8dDfGuZWF4mpyBX-4AnbZ4tA@mail.gmail.com>
X-Originating-IP: [128.224.162.197]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] systemd-boot: upgrade to 237
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
X-List-Received-Date: Thu, 08 Mar 2018 01:24:09 -0000
Content-Type: multipart/alternative;
	boundary="------------5FD3475FB2334BEC840EF54B"

--------------5FD3475FB2334BEC840EF54B
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/2018 09:44 PM, Burton, Ross wrote:
> Can you rebase this to master as there's been changes to booting made.
>
> Ross
>

Hi Ross,

I've done this.
The remote branch has been updated.

git://git.pokylinux.org/poky-contrib ChenQi/systemd-237
http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/systemd-237


Best Regards,
Chen Qi

> On 5 March 2018 at 02:02, Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     Upgrade systemd-boot to 237.
>
>     As systemd has dropped autotools support, fix configure and compile
>     failures related to meson.
>
>     Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>>
>     ---
>      .../{systemd-boot_234.bb <http://systemd-boot_234.bb> =>
>     systemd-boot_237.bb <http://systemd-boot_237.bb>}  | 32 ++++++-----
>      ...01-Also-check-i386-i586-and-i686-for-ia32.patch | 28 ++++++++++
>      ...efi_cc-and-efi_ld-correctly-when-cross-co.patch | 62
>     ++++++++++++++++++++++
>      3 files changed, 109 insertions(+), 13 deletions(-)
>      rename meta/recipes-core/systemd/{systemd-boot_234.bb
>     <http://systemd-boot_234.bb> => systemd-boot_237.bb
>     <http://systemd-boot_237.bb>} (41%)
>      create mode 100644
>     meta/recipes-core/systemd/systemd/0001-Also-check-i386-i586-and-i686-for-ia32.patch
>      create mode 100644
>     meta/recipes-core/systemd/systemd/0001-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch
>
>     diff --git a/meta/recipes-core/systemd/systemd-boot_234.bb
>     <http://systemd-boot_234.bb>
>     b/meta/recipes-core/systemd/systemd-boot_237.bb
>     <http://systemd-boot_237.bb>
>     similarity index 41%
>     rename from meta/recipes-core/systemd/systemd-boot_234.bb
>     <http://systemd-boot_234.bb>
>     rename to meta/recipes-core/systemd/systemd-boot_237.bb
>     <http://systemd-boot_237.bb>
>     index 88a14ac..ec87cbf 100644
>     --- a/meta/recipes-core/systemd/systemd-boot_234.bb
>     <http://systemd-boot_234.bb>
>     +++ b/meta/recipes-core/systemd/systemd-boot_237.bb
>     <http://systemd-boot_237.bb>
>     @@ -3,20 +3,27 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
>
>      DEPENDS = "intltool-native libcap util-linux gnu-efi gperf-native"
>
>     -SRC_URI +=
>     "file://0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch"
>     +SRC_URI +=
>     "file://0003-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
>     \
>     +            file://0027-remove-nobody-user-group-checking.patch \
>     +           
>     file://0001-Also-check-i386-i586-and-i686-for-ia32.patch \
>     +           
>     file://0001-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch
>     \
>     +            "
>
>     -inherit autotools pkgconfig gettext
>     +inherit meson pkgconfig gettext
>      inherit deploy
>
>      EFI_CC ?= "${CC}"
>     -# Man pages are packaged through the main systemd recipe
>     -EXTRA_OECONF = " --enable-gnuefi \
>     -                 --with-efi-includedir=${STAGING_INCDIR} \
>     -                 --with-efi-ldsdir=${STAGING_LIBDIR} \
>     -                 --with-efi-libdir=${STAGING_LIBDIR} \
>     -                 --disable-manpages \
>     -                 EFI_CC='${EFI_CC}' \
>     -               "
>     +
>     +EXTRA_OEMESON += "-Defi=true \
>     +                  -Dgnu-efi=true \
>     +                  -Defi-includedir=${STAGING_INCDIR}/efi \
>     +                  -Defi-ldsdir=${STAGING_LIBDIR} \
>     +                  -Defi-libdir=${STAGING_LIBDIR} \
>     +                  -Dman=false \
>     +                  -Defi-cc='${EFI_CC}' \
>     +                  -Defi-ld='${LD}' \
>     +                  "
>     +
>
>      # Imported from the old gummiboot recipe
>      TUNE_CCARGS_remove = "-mfpmath=sse"
>     @@ -28,8 +35,7 @@ do_compile() {
>             if [ "${TARGET_ARCH}" = "x86_64" ]; then
>                     SYSTEMD_BOOT_EFI_ARCH="x64"
>             fi
>     -
>     -       oe_runmake systemd-boot${SYSTEMD_BOOT_EFI_ARCH}.efi
>     +       ninja src/boot/efi/systemd-boot${SYSTEMD_BOOT_EFI_ARCH}.efi
>      }
>
>      do_install() {
>     @@ -38,6 +44,6 @@ do_install() {
>      }
>
>      do_deploy () {
>     -       install ${B}/systemd-boot*.efi ${DEPLOYDIR}
>     +       install ${B}/src/boot/efi/systemd-boot*.efi ${DEPLOYDIR}
>      }
>      addtask deploy before do_build after do_compile
>     diff --git
>     a/meta/recipes-core/systemd/systemd/0001-Also-check-i386-i586-and-i686-for-ia32.patch
>     b/meta/recipes-core/systemd/systemd/0001-Also-check-i386-i586-and-i686-for-ia32.patch
>     new file mode 100644
>     index 0000000..877bb1c
>     --- /dev/null
>     +++
>     b/meta/recipes-core/systemd/systemd/0001-Also-check-i386-i586-and-i686-for-ia32.patch
>     @@ -0,0 +1,28 @@
>     +From 3e8c19bb1bbc4493c591f75c00c1fefe3b1c8a69 Mon Sep 17 00:00:00
>     2001
>     +From: Chen Qi <Qi.Chen@windriver.com <mailto:Qi.Chen@windriver.com>>
>     +Date: Tue, 27 Feb 2018 20:42:41 -0800
>     +Subject: [PATCH] Also check i386, i586 and i686 for ia32
>     +
>     +Upstream-Status: Pending
>     +
>     +Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>>
>     +---
>     + meson.build | 2 +-
>     + 1 file changed, 1 insertion(+), 1 deletion(-)
>     +
>     +diff --git a/meson.build b/meson.build
>     +index 28cb8b60e..489531a43 100644
>     +--- a/meson.build
>     ++++ b/meson.build
>     +@@ -1217,7 +1217,7 @@ conf.set10('SYSTEMD_SLOW_TESTS_DEFAULT',
>     slow_tests)
>     + if get_option('efi')
>     +         efi_arch = host_machine.cpu_family()
>     +
>     +-        if efi_arch == 'x86'
>     ++        if efi_arch == 'x86' or efi_arch == 'i386' or efi_arch
>     == 'i586' or efi_arch == 'i686'
>     +                 EFI_MACHINE_TYPE_NAME = 'ia32'
>     +                 gnu_efi_arch = 'ia32'
>     +         elif efi_arch == 'x86_64'
>     +--
>     +2.13.0
>     +
>     diff --git
>     a/meta/recipes-core/systemd/systemd/0001-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch
>     b/meta/recipes-core/systemd/systemd/0001-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch
>     new file mode 100644
>     index 0000000..e2e19ba
>     --- /dev/null
>     +++
>     b/meta/recipes-core/systemd/systemd/0001-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch
>     @@ -0,0 +1,62 @@
>     +From 527413ec243564a89ffaad6368d446de44415970 Mon Sep 17 00:00:00
>     2001
>     +From: Chen Qi <Qi.Chen@windriver.com <mailto:Qi.Chen@windriver.com>>
>     +Date: Tue, 27 Feb 2018 21:42:23 -0800
>     +Subject: [PATCH] Fix to run efi_cc and efi_ld correctly when
>     cross-compiling
>     +
>     +When cross-compiling, efi_cc and efi_ld may take the form of
>     +'xxx-gcc --sysroot=xxx', and this would cause run_command and
>     +the alike fail.
>     +
>     +Fix to split them to make commands run correctly.
>     +
>     +Upstream-Status: Pending
>     +
>     +Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>>
>     +---
>     + src/boot/efi/meson.build | 16 +++++++++++++---
>     + 1 file changed, 13 insertions(+), 3 deletions(-)
>     +
>     +diff --git a/src/boot/efi/meson.build b/src/boot/efi/meson.build
>     +index 992a3ba4c..9f9ec4911 100644
>     +--- a/src/boot/efi/meson.build
>     ++++ b/src/boot/efi/meson.build
>     +@@ -157,7 +157,7 @@ if have_gnu_efi
>     +                 o_file = custom_target(file + '.o',
>     +                                        input : file,
>     +                                        output : file + '.o',
>     +-                                       command : [efi_cc, '-c',
>     '@INPUT@', '-o', '@OUTPUT@']
>     ++                                       command : efi_cc.split()
>     + ['-c', '@INPUT@', '-o', '@OUTPUT@']
>     +                                                  + compile_args,
>     +                                        depend_files : efi_headers)
>     +                 if (common_sources +
>     systemd_boot_sources).contains(file)
>     +@@ -168,7 +168,17 @@ if have_gnu_efi
>     +                 endif
>     +         endforeach
>     +
>     +-        libgcc_file_name = run_command(efi_cc,
>     '-print-libgcc-file-name').stdout().strip()
>     ++        find_libgcc_cmd_all = efi_cc + ' -print-libgcc-file-name'
>     ++        find_libgcc_cmd = find_libgcc_cmd_all.split()[0]
>     ++        find_libgcc_args = []
>     ++        cmd_args_all = find_libgcc_cmd_all.split()
>     ++        foreach arg : cmd_args_all
>     ++                if arg != find_libgcc_cmd
>     ++                        find_libgcc_args += arg
>     ++                endif
>     ++        endforeach
>     ++
>     ++        libgcc_file_name = run_command(find_libgcc_cmd,
>     find_libgcc_args).stdout().strip()
>     +         systemd_boot_efi_name =
>     'systemd-boot@0@.efi'.format(EFI_MACHINE_TYPE_NAME)
>     +         stub_efi_name =
>     'linux@0@.efi.stub'.format(EFI_MACHINE_TYPE_NAME)
>     +         no_undefined_symbols =
>     find_program('no-undefined-symbols.sh')
>     +@@ -179,7 +189,7 @@ if have_gnu_efi
>     +                         tuple[0],
>     +                         input : tuple[2],
>     +                         output : tuple[0],
>     +-                        command : [efi_ld, '-o', '@OUTPUT@'] +
>     ++                        command : efi_ld.split() + ['-o',
>     '@OUTPUT@'] +
>     +                                   efi_ldflags + tuple[2] +
>     +                                   ['-lefi', '-lgnuefi',
>     libgcc_file_name])
>     +
>     +--
>     +2.13.0
>     +
>     --
>     1.9.1
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>


--------------5FD3475FB2334BEC840EF54B
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 03/07/2018 09:44 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LY0adVVH9aP_fgimcXSzR8dDfGuZWF4mpyBX-4AnbZ4tA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">Can you rebase this to master as there's been
        changes to booting made.
        <div><br>
        </div>
        <div>Ross</div>
      </div>
      <div class="gmail_extra"><br>
      </div>
    </blockquote>
    <br>
    Hi Ross,<br>
    <br>
    I've done this.<br>
    The remote branch has been updated.<br>
    <br>
    git://git.pokylinux.org/poky-contrib ChenQi/systemd-237
    <br>
      <a class="moz-txt-link-freetext"
href="http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/systemd-237">http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/systemd-237</a>
    <br>
    <br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
    <blockquote
cite="mid:CAJTo0LY0adVVH9aP_fgimcXSzR8dDfGuZWF4mpyBX-4AnbZ4tA@mail.gmail.com"
      type="cite">
      <div class="gmail_extra">
        <div class="gmail_quote">On 5 March 2018 at 02:02, Chen Qi <span
            dir="ltr">&lt;<a moz-do-not-send="true"
              href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">Upgrade
            systemd-boot to 237.<br>
            <br>
            As systemd has dropped autotools support, fix configure and
            compile<br>
            failures related to meson.<br>
            <br>
            Signed-off-by: Chen Qi &lt;<a moz-do-not-send="true"
              href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
            ---<br>
             .../{<a moz-do-not-send="true"
              href="http://systemd-boot_234.bb" rel="noreferrer"
              target="_blank">systemd-boot_234.bb</a> =&gt; <a
              moz-do-not-send="true" href="http://systemd-boot_237.bb"
              rel="noreferrer" target="_blank">systemd-boot_237.bb</a>} 
             | 32 ++++++-----<br>
             ...01-Also-check-i386-i586-<wbr>and-i686-for-ia32.patch |
            28 ++++++++++<br>
             ...efi_cc-and-efi_ld-<wbr>correctly-when-cross-co.patch |
            62 ++++++++++++++++++++++<br>
             3 files changed, 109 insertions(+), 13 deletions(-)<br>
             rename meta/recipes-core/systemd/{<a moz-do-not-send="true"
              href="http://systemd-boot_234.bb" rel="noreferrer"
              target="_blank">sys<wbr>temd-boot_234.bb</a> =&gt; <a
              moz-do-not-send="true" href="http://systemd-boot_237.bb"
              rel="noreferrer" target="_blank">systemd-boot_237.bb</a>}
            (41%)<br>
             create mode 100644 meta/recipes-core/systemd/<wbr>systemd/0001-Also-check-i386-<wbr>i586-and-i686-for-ia32.patch<br>
             create mode 100644 meta/recipes-core/systemd/<wbr>systemd/0001-Fix-to-run-efi_<wbr>cc-and-efi_ld-correctly-when-<wbr>cross-co.patch<br>
            <br>
            diff --git a/meta/recipes-core/systemd/<a
              moz-do-not-send="true" href="http://systemd-boot_234.bb"
              rel="noreferrer" target="_blank">sy<wbr>stemd-boot_234.bb</a>
            b/meta/recipes-core/systemd/<a moz-do-not-send="true"
              href="http://systemd-boot_237.bb" rel="noreferrer"
              target="_blank">sy<wbr>stemd-boot_237.bb</a><br>
            similarity index 41%<br>
            rename from meta/recipes-core/systemd/<a
              moz-do-not-send="true" href="http://systemd-boot_234.bb"
              rel="noreferrer" target="_blank">syst<wbr>emd-boot_234.bb</a><br>
            rename to meta/recipes-core/systemd/<a
              moz-do-not-send="true" href="http://systemd-boot_237.bb"
              rel="noreferrer" target="_blank">syst<wbr>emd-boot_237.bb</a><br>
            index 88a14ac..ec87cbf 100644<br>
            --- a/meta/recipes-core/systemd/<a moz-do-not-send="true"
              href="http://systemd-boot_234.bb" rel="noreferrer"
              target="_blank">sy<wbr>stemd-boot_234.bb</a><br>
            +++ b/meta/recipes-core/systemd/<a moz-do-not-send="true"
              href="http://systemd-boot_237.bb" rel="noreferrer"
              target="_blank">sy<wbr>stemd-boot_237.bb</a><br>
            @@ -3,20 +3,27 @@ FILESEXTRAPATHS =.
            "${FILE_DIRNAME}/systemd:"<br>
            <br>
             DEPENDS = "intltool-native libcap util-linux gnu-efi
            gperf-native"<br>
            <br>
            -SRC_URI += "<a class="moz-txt-link-freetext" href="file://0007-use-lnr-wrapper">file://0007-use-lnr-wrapper</a>-<wbr>instead-of-looking-for-<wbr>relative-opti.patch"<br>
            +SRC_URI += "<a class="moz-txt-link-freetext" href="file://0003-use-lnr-wrapper">file://0003-use-lnr-wrapper</a>-<wbr>instead-of-looking-for-<wbr>relative-opti.patch
            \<br>
            +            <a class="moz-txt-link-freetext" href="file://0027-remove-nobody">file://0027-remove-nobody</a>-<wbr>user-group-checking.patch
            \<br>
            +            <a class="moz-txt-link-freetext" href="file://0001-Also-check-i386">file://0001-Also-check-i386</a>-<wbr>i586-and-i686-for-ia32.patch
            \<br>
            +            <a class="moz-txt-link-freetext" href="file://0001-Fix-to-run-efi_cc">file://0001-Fix-to-run-efi_cc</a>-<wbr>and-efi_ld-correctly-when-<wbr>cross-co.patch
            \<br>
            +            "<br>
            <br>
            -inherit autotools pkgconfig gettext<br>
            +inherit meson pkgconfig gettext<br>
             inherit deploy<br>
            <br>
             EFI_CC ?= "${CC}"<br>
            -# Man pages are packaged through the main systemd recipe<br>
            -EXTRA_OECONF = " --enable-gnuefi \<br>
            -                 --with-efi-includedir=${<wbr>STAGING_INCDIR}
            \<br>
            -                 --with-efi-ldsdir=${STAGING_<wbr>LIBDIR} \<br>
            -                 --with-efi-libdir=${STAGING_<wbr>LIBDIR} \<br>
            -                 --disable-manpages \<br>
            -                 EFI_CC='${EFI_CC}' \<br>
            -               "<br>
            +<br>
            +EXTRA_OEMESON += "-Defi=true \<br>
            +                  -Dgnu-efi=true \<br>
            +                  -Defi-includedir=${STAGING_<wbr>INCDIR}/efi
            \<br>
            +                  -Defi-ldsdir=${STAGING_LIBDIR} \<br>
            +                  -Defi-libdir=${STAGING_LIBDIR} \<br>
            +                  -Dman=false \<br>
            +                  -Defi-cc='${EFI_CC}' \<br>
            +                  -Defi-ld='${LD}' \<br>
            +                  "<br>
            +<br>
            <br>
             # Imported from the old gummiboot recipe<br>
             TUNE_CCARGS_remove = "-mfpmath=sse"<br>
            @@ -28,8 +35,7 @@ do_compile() {<br>
                    if [ "${TARGET_ARCH}" = "x86_64" ]; then<br>
                            SYSTEMD_BOOT_EFI_ARCH="x64"<br>
                    fi<br>
            -<br>
            -       oe_runmake systemd-boot${SYSTEMD_BOOT_<wbr>EFI_ARCH}.efi<br>
            +       ninja src/boot/efi/systemd-boot${<wbr>SYSTEMD_BOOT_EFI_ARCH}.efi<br>
             }<br>
            <br>
             do_install() {<br>
            @@ -38,6 +44,6 @@ do_install() {<br>
             }<br>
            <br>
             do_deploy () {<br>
            -       install ${B}/systemd-boot*.efi ${DEPLOYDIR}<br>
            +       install ${B}/src/boot/efi/systemd-<wbr>boot*.efi
            ${DEPLOYDIR}<br>
             }<br>
             addtask deploy before do_build after do_compile<br>
            diff --git a/meta/recipes-core/systemd/<wbr>systemd/0001-Also-check-i386-<wbr>i586-and-i686-for-ia32.patch
            b/meta/recipes-core/systemd/<wbr>systemd/0001-Also-check-i386-<wbr>i586-and-i686-for-ia32.patch<br>
            new file mode 100644<br>
            index 0000000..877bb1c<br>
            --- /dev/null<br>
            +++ b/meta/recipes-core/systemd/<wbr>systemd/0001-Also-check-i386-<wbr>i586-and-i686-for-ia32.patch<br>
            @@ -0,0 +1,28 @@<br>
            +From 3e8c19bb1bbc4493c591f75c00c1fe<wbr>fe3b1c8a69 Mon Sep
            17 00:00:00 2001<br>
            +From: Chen Qi &lt;<a moz-do-not-send="true"
              href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
            +Date: Tue, 27 Feb 2018 20:42:41 -0800<br>
            +Subject: [PATCH] Also check i386, i586 and i686 for ia32<br>
            +<br>
            +Upstream-Status: Pending<br>
            +<br>
            +Signed-off-by: Chen Qi &lt;<a moz-do-not-send="true"
              href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
            +---<br>
            + meson.build | 2 +-<br>
            + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
            +<br>
            +diff --git a/meson.build b/meson.build<br>
            +index 28cb8b60e..489531a43 100644<br>
            +--- a/meson.build<br>
            ++++ b/meson.build<br>
            +@@ -1217,7 +1217,7 @@ conf.set10('SYSTEMD_SLOW_<wbr>TESTS_DEFAULT',
            slow_tests)<br>
            + if get_option('efi')<br>
            +         efi_arch = host_machine.cpu_family()<br>
            +<br>
            +-        if efi_arch == 'x86'<br>
            ++        if efi_arch == 'x86' or efi_arch == 'i386' or
            efi_arch == 'i586' or efi_arch == 'i686'<br>
            +                 EFI_MACHINE_TYPE_NAME = 'ia32'<br>
            +                 gnu_efi_arch = 'ia32'<br>
            +         elif efi_arch == 'x86_64'<br>
            +--<br>
            +2.13.0<br>
            +<br>
            diff --git a/meta/recipes-core/systemd/<wbr>systemd/0001-Fix-to-run-efi_<wbr>cc-and-efi_ld-correctly-when-<wbr>cross-co.patch
            b/meta/recipes-core/systemd/<wbr>systemd/0001-Fix-to-run-efi_<wbr>cc-and-efi_ld-correctly-when-<wbr>cross-co.patch<br>
            new file mode 100644<br>
            index 0000000..e2e19ba<br>
            --- /dev/null<br>
            +++ b/meta/recipes-core/systemd/<wbr>systemd/0001-Fix-to-run-efi_<wbr>cc-and-efi_ld-correctly-when-<wbr>cross-co.patch<br>
            @@ -0,0 +1,62 @@<br>
            +From 527413ec243564a89ffaad6368d446<wbr>de44415970 Mon Sep
            17 00:00:00 2001<br>
            +From: Chen Qi &lt;<a moz-do-not-send="true"
              href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
            +Date: Tue, 27 Feb 2018 21:42:23 -0800<br>
            +Subject: [PATCH] Fix to run efi_cc and efi_ld correctly
            when cross-compiling<br>
            +<br>
            +When cross-compiling, efi_cc and efi_ld may take the form
            of<br>
            +'xxx-gcc --sysroot=xxx', and this would cause run_command
            and<br>
            +the alike fail.<br>
            +<br>
            +Fix to split them to make commands run correctly.<br>
            +<br>
            +Upstream-Status: Pending<br>
            +<br>
            +Signed-off-by: Chen Qi &lt;<a moz-do-not-send="true"
              href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
            +---<br>
            + src/boot/efi/meson.build | 16 +++++++++++++---<br>
            + 1 file changed, 13 insertions(+), 3 deletions(-)<br>
            +<br>
            +diff --git a/src/boot/efi/meson.build
            b/src/boot/efi/meson.build<br>
            +index 992a3ba4c..9f9ec4911 100644<br>
            +--- a/src/boot/efi/meson.build<br>
            ++++ b/src/boot/efi/meson.build<br>
            +@@ -157,7 +157,7 @@ if have_gnu_efi<br>
            +                 o_file = custom_target(file + '.o',<br>
            +                                        input : file,<br>
            +                                        output : file +
            '.o',<br>
            +-                                       command : [efi_cc,
            '-c', '@INPUT@', '-o', '@OUTPUT@']<br>
            ++                                       command :
            efi_cc.split() + ['-c', '@INPUT@', '-o', '@OUTPUT@']<br>
            +                                                  +
            compile_args,<br>
            +                                        depend_files :
            efi_headers)<br>
            +                 if (common_sources +
            systemd_boot_sources).<wbr>contains(file)<br>
            +@@ -168,7 +168,17 @@ if have_gnu_efi<br>
            +                 endif<br>
            +         endforeach<br>
            +<br>
            +-        libgcc_file_name = run_command(efi_cc,
            '-print-libgcc-file-name').<wbr>stdout().strip()<br>
            ++        find_libgcc_cmd_all = efi_cc + '
            -print-libgcc-file-name'<br>
            ++        find_libgcc_cmd = find_libgcc_cmd_all.split()[0]<br>
            ++        find_libgcc_args = []<br>
            ++        cmd_args_all = find_libgcc_cmd_all.split()<br>
            ++        foreach arg : cmd_args_all<br>
            ++                if arg != find_libgcc_cmd<br>
            ++                        find_libgcc_args += arg<br>
            ++                endif<br>
            ++        endforeach<br>
            ++<br>
            ++        libgcc_file_name = run_command(find_libgcc_cmd,
            find_libgcc_args).stdout().<wbr>strip()<br>
            +         systemd_boot_efi_name =
            '<a class="moz-txt-link-abbreviated" href="mailto:systemd-boot@0@.efi">systemd-boot@0@.efi</a>'.format(<wbr>EFI_MACHINE_TYPE_NAME)<br>
            +         stub_efi_name = '<a class="moz-txt-link-abbreviated" href="mailto:linux@0@.efi.stub">linux@0@.efi.stub</a>'.format(<wbr>EFI_MACHINE_TYPE_NAME)<br>
            +         no_undefined_symbols = find_program('no-undefined-<wbr>symbols.sh')<br>
            +@@ -179,7 +189,7 @@ if have_gnu_efi<br>
            +                         tuple[0],<br>
            +                         input : tuple[2],<br>
            +                         output : tuple[0],<br>
            +-                        command : [efi_ld, '-o',
            '@OUTPUT@'] +<br>
            ++                        command : efi_ld.split() + ['-o',
            '@OUTPUT@'] +<br>
            +                                   efi_ldflags + tuple[2] +<br>
            +                                   ['-lefi', '-lgnuefi',
            libgcc_file_name])<br>
            +<br>
            +--<br>
            +2.13.0<br>
            +<br>
            <span class="HOEnZb"><font color="#888888">--<br>
                1.9.1<br>
                <br>
                --<br>
                ______________________________<wbr>_________________<br>
                Openembedded-core mailing list<br>
                <a moz-do-not-send="true"
                  href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.<wbr>openembedded.org</a><br>
                <a moz-do-not-send="true"
                  href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                  rel="noreferrer" target="_blank">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
              </font></span></blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------5FD3475FB2334BEC840EF54B--
