Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 80BC26C23C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 08:49:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x038nvGr018176
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 3 Jan 2019 00:49:57 -0800 (PST)
Received: from [128.224.163.218] (128.224.163.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 3 Jan 2019 00:49:57 -0800
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <20181218163005.1330-1-alex.kanavin@gmail.com>
	<20181218163005.1330-4-alex.kanavin@gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <a5b9f3c5-7ed2-ceb9-70aa-8ea5ec7b86c9@windriver.com>
Date: Thu, 3 Jan 2019 16:46:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181218163005.1330-4-alex.kanavin@gmail.com>
Subject: Re: [PATCH 04/13] libdazzle: fix a build issue with meson 0.49.0
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
X-List-Received-Date: Thu, 03 Jan 2019 08:49:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018/12/19 上午12:29, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>

Hi Alexander,

Have you ever meet build failure on qemumips with libdazzle:

  389 
/home/kkang/buildarea/WRLX-1019/systemd-oe-selftest-Dec24/tmp-glibc/work/mips32r2-wrs-linux/libdazzle/3.30.2-r0/recipe-sysroot/usr/include/glib-2.0/gobject/gobject.h:725: 
syntax error,
      unexpected ')' in '    ((__typeof__(new_object)) (g_object_ref) 
(new_object));' at ')'
  390 qemu: uncaught target signal 11 (Segmentation fault) - core dumped
  391 
/home/kkang/buildarea/WRLX-1019/systemd-oe-selftest-Dec24/tmp-glibc/work/mips32r2-wrs-linux/libdazzle/3.30.2-r0/recipe-sysroot/usr/bin/g-ir-scanner-qemuwrapper: 
line 6: 24294 Segmentati
      on fault      (core dumped) PSEUDO_UNLOAD=1 qemu-mips -r 3.2.0 -L 
/home/kkang/buildarea/WRLX-1019/systemd-oe-selftest-Dec24/tmp-glibc/work/mips32r2-wrs-linux/libdazzle/3.30.2-r0/recipe-
      sysroot -E 
LD_LIBRARY_PATH=$GIR_EXTRA_LIBS_PATH:.libs:/home/kkang/buildarea/WRLX-1019/systemd-oe-selftest-Dec24/tmp-glibc/work/mips32r2-wrs-linux/libdazzle/3.30.2-r0/recipe-sysroot//usr
/lib:/home/kkang/buildarea/WRLX-1019/systemd-oe-selftest-Dec24/tmp-glibc/work/mips32r2-wrs-linux/libdazzle/3.30.2-r0/recipe-sysroot//lib 
"$@"
  392 If the above error message is about missing .so libraries, then 
setting up GIR_EXTRA_LIBS_PATH in the recipe should help.
  393 (typically like this: GIR_EXTRA_LIBS_PATH="${B}/something/.libs" )
  394 Command 
'['/home/kkang/buildarea/WRLX-1019/systemd-oe-selftest-Dec24/tmp-glibc/work/mips32r2-wrs-linux/libdazzle/3.30.2-r0/recipe-sysroot/usr/bin/g-ir-scanner-qemuwrapper', 
'/home/kkang
/buildarea/WRLX-1019/systemd-oe-selftest-Dec24/tmp-glibc/work/mips32r2-wrs-linux/libdazzle/3.30.2-r0/build/tmp-introspecta3rexhyk/Dazzle-1.0', 
'--introspect-dump=/home/kkang/buildarea/W
RLX-1019/systemd-oe-selftest-Dec24/tmp-glibc/work/mips32r2-wrs-linux/libdazzle/3.30.2-r0/build/tmp-introspecta3rexhyk/functions.txt,/home/kkang/buildarea/WRLX-1019/systemd-oe-selftest-D
ec24/tmp-glibc/work/mips32r2-wrs-linux/libdazzle/3.30.2-r0/build/tmp-introspecta3rexhyk/dump.xml']' 
returned non-zero exit status 1
  395 ninja: build stopped: subcommand failed.
  396 WARNING: 
/home/kkang/buildarea/WRLX-1019/systemd-oe-selftest-Dec24/tmp-glibc/work/mips32r2-wrs-linux/libdazzle/3.30.2-r0/temp/run.do_compile.23419:1 
exit 1 from 'ninja -v -j 32'
  397 ERROR: Function failed: do_compile (log file is located at 
/home/kkang/buildarea/WRLX-1019/systemd-oe-selftest-Dec24/tmp-glibc/work/mips32r2-wrs-linux/libdazzle/3.30.2-r0/temp/log.do_co
      mpile.23419)


The first error has been fixed in gobject-introspection 1.58.2. But I 
didn't find out the root cause of "qemu: uncaught target signal 11 
(Segmentation fault) - core dumped".


Regards,
Kai


> ---
>   ...ine-so-that-gir-compilation-succeeds.patch | 26 +++++++++++++++++++
>   .../libdazzle/libdazzle_3.30.2.bb             |  1 +
>   2 files changed, 27 insertions(+)
>   create mode 100644 meta/recipes-gnome/libdazzle/libdazzle/0001-Add-a-define-so-that-gir-compilation-succeeds.patch
>
> diff --git a/meta/recipes-gnome/libdazzle/libdazzle/0001-Add-a-define-so-that-gir-compilation-succeeds.patch b/meta/recipes-gnome/libdazzle/libdazzle/0001-Add-a-define-so-that-gir-compilation-succeeds.patch
> new file mode 100644
> index 00000000000..c959d43972f
> --- /dev/null
> +++ b/meta/recipes-gnome/libdazzle/libdazzle/0001-Add-a-define-so-that-gir-compilation-succeeds.patch
> @@ -0,0 +1,26 @@
> +From 546d53c3515e8a488a204763437d1fa0917097e5 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Tue, 11 Dec 2018 12:39:30 +0100
> +Subject: [PATCH] Add a define so that gir compilation succeeds
> +
> +For some reason meson 0.49.0 does not anymore pass global arguments to gir compiler.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + src/meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/meson.build b/src/meson.build
> +index 6ff8a6a..f0b2887 100644
> +--- a/src/meson.build
> ++++ b/src/meson.build
> +@@ -132,7 +132,7 @@ if get_option('with_introspection')
> +         install_dir_gir: girdir,
> +     install_dir_typelib: typelibdir,
> +         export_packages: libdazzle_package,
> +-             extra_args: [ '--c-include=dazzle.h', '--quiet' ],
> ++             extra_args: [ '--c-include=dazzle.h', '--quiet', '-DDAZZLE_COMPILATION' ],
> +   )
> +
> +   if get_option('with_vapi')
> diff --git a/meta/recipes-gnome/libdazzle/libdazzle_3.30.2.bb b/meta/recipes-gnome/libdazzle/libdazzle_3.30.2.bb
> index 029adddb9ee..5441c10f990 100644
> --- a/meta/recipes-gnome/libdazzle/libdazzle_3.30.2.bb
> +++ b/meta/recipes-gnome/libdazzle/libdazzle_3.30.2.bb
> @@ -7,6 +7,7 @@ inherit gnomebase upstream-version-is-even vala gobject-introspection
>   
>   DEPENDS = "glib-2.0-native glib-2.0 gtk+3"
>   
> +SRC_URI += " file://0001-Add-a-define-so-that-gir-compilation-succeeds.patch"
>   SRC_URI[archive.md5sum] = "24e2e1b914a34f5b8868a9507d1f3c4c"
>   SRC_URI[archive.sha256sum] = "78770eae9fa15ac5acb9c733d29459330b2540affbf72933119e36dbd90b36d5"
>   


-- 
Kai Kang


