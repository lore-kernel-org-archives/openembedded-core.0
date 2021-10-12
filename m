X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <afaa1c15-6d82-062d-3e39-672757ba1e29@synaptics.com>
Date: Tue, 12 Oct 2021 19:23:25 +0800
Subject: Re: [PATCH 2/2] [WIP]: meson: install native file in sdk
References: <20211012101233.49978-1-randy.li@synaptics.com>
 <20211012101233.49978-3-randy.li@synaptics.com>
 <CANNYZj9wu6gCuU5_4AU6ancy=i1sjwvtwLz9YLE87gmB9QkSFA@mail.gmail.com>
From: "Hsia-Jun Li" <randy.li@synaptics.com>
In-Reply-To: <CANNYZj9wu6gCuU5_4AU6ancy=i1sjwvtwLz9YLE87gmB9QkSFA@mail.gmail.com>
Return-Path: Randy.Li@synaptics.com
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>



On 10/12/21 18:49, Alexander Kanavin wrote:
> CAUTION: Email originated externally, do not click links or open 
> attachments unless you recognize the sender and know the content is safe.
> 
> Can you add a nativesdk testcase for this please? Into 
> meta/lib/oeqa/sdk/cases/.
I see

Meanwhile, this patch is buggy, I just tested it.
I just wonder whether there is a better way to compose those properties 
and I want to show how ugly it would be if there would not be a better 
method.

> 
> Alex
> 
> On Tue, 12 Oct 2021 at 12:13, Hsia-Jun Li <randy.li@synaptics.com 
> <mailto:randy.li@synaptics.com>> wrote:
> 
>     From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com
>     <mailto:randy.li@synaptics.com>>
> 
>     Without a native environment file, find_program() can't
>     locate the native program inside SDK.
> 
>     That stops wayland compositor using wayland scanner.
> 
>     Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com
>     <mailto:randy.li@synaptics.com>>
>     ---
>       meta/classes/meson-routines.bbclass           |  4 ++
>       .../meson/meson/meson-setup.py                |  2 +
>       .../meson/meson/meson-wrapper                 |  1 +
>       .../meson/nativesdk-meson_0.59.1.bb
>     <https://urldefense.proofpoint.com/v2/url?u=http-3A__nativesdk-2Dmeson-5F0.59.1.bb&d=DwMFaQ&c=7dfBJ8cXbWjhc0BhImu8wQ&r=P4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=rZRVMF0TdY-eN9YYy3VmV26Iu6PaWjRmF1zrbh4B24A&s=-45qJZTfmnPboJWsspT4Jt9sjXV0_M8sBu84n8NK7zc&e=>
>               | 38 +++++++++++++++++++
>       4 files changed, 45 insertions(+)
> 
>     diff --git a/meta/classes/meson-routines.bbclass
>     b/meta/classes/meson-routines.bbclass
>     index be3aeedeba..a74a9916d8 100644
>     --- a/meta/classes/meson-routines.bbclass
>     +++ b/meta/classes/meson-routines.bbclass
>     @@ -4,6 +4,10 @@ def meson_array(var, d):
>           items = d.getVar(var).split()
>           return repr(items[0] if len(items) == 1 else items)
> 
>     +def meson_list_str(var, d):
>     +    items = d.getVar(var).split()
>     +    return repr(items[0]) if len(items) == 1 else ', '.join(repr(s)
>     for s in items)
>     +
>       # Map our ARCH values to what Meson expects:
>       # http://mesonbuild.com/Reference-tables.html#cpu-families
>     <https://urldefense.proofpoint.com/v2/url?u=http-3A__mesonbuild.com_Reference-2Dtables.html-23cpu-2Dfamilies&d=DwMFaQ&c=7dfBJ8cXbWjhc0BhImu8wQ&r=P4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=rZRVMF0TdY-eN9YYy3VmV26Iu6PaWjRmF1zrbh4B24A&s=EapMOkBLWInOH2bqaFYDqP016Yvq4DLaXltKV6Nnmw4&e=>
>       def meson_cpu_family(var, d):
>     diff --git a/meta/recipes-devtools/meson/meson/meson-setup.py
>     b/meta/recipes-devtools/meson/meson/meson-setup.py
>     index 7ac4e3ad47..4a0a967fef 100755
>     --- a/meta/recipes-devtools/meson/meson/meson-setup.py
>     +++ b/meta/recipes-devtools/meson/meson/meson-setup.py
>     @@ -27,6 +27,8 @@ except KeyError:
> 
>       template_file = os.path.join(sysroot,
>     'usr/share/meson/meson.cross.template')
>       cross_file = os.path.join(sysroot, 'usr/share/meson/%smeson.cross'
>     % os.environ["TARGET_PREFIX"])
>     +native_template_file = os.path.join(sysroot,
>     'usr/share/meson/meson.native.template')
>     +native_file = os.path.join(sysroot, 'usr/share/meson/meson.native')
> 
>       with open(template_file) as in_file:
>           template = in_file.read()
>     diff --git a/meta/recipes-devtools/meson/meson/meson-wrapper
>     b/meta/recipes-devtools/meson/meson/meson-wrapper
>     index d4ffe60f9a..d4b5187f8d 100755
>     --- a/meta/recipes-devtools/meson/meson/meson-wrapper
>     +++ b/meta/recipes-devtools/meson/meson/meson-wrapper
>     @@ -11,4 +11,5 @@ unset CC CXX CPP LD AR NM STRIP
> 
>       exec "$OECORE_NATIVE_SYSROOT/usr/bin/meson.real" \
>            --cross-file
>     "${OECORE_NATIVE_SYSROOT}/usr/share/meson/${TARGET_PREFIX}meson.cross" \
>     +     --native-file
>     "${OECORE_NATIVE_SYSROOT}/usr/share/meson/meson.native" \
>            "$@"
>     diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.59.1.bb
>     <https://urldefense.proofpoint.com/v2/url?u=http-3A__nativesdk-2Dmeson-5F0.59.1.bb&d=DwMFaQ&c=7dfBJ8cXbWjhc0BhImu8wQ&r=P4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=rZRVMF0TdY-eN9YYy3VmV26Iu6PaWjRmF1zrbh4B24A&s=-45qJZTfmnPboJWsspT4Jt9sjXV0_M8sBu84n8NK7zc&e=>
>     b/meta/recipes-devtools/meson/nativesdk-meson_0.59.1.bb
>     <https://urldefense.proofpoint.com/v2/url?u=http-3A__nativesdk-2Dmeson-5F0.59.1.bb&d=DwMFaQ&c=7dfBJ8cXbWjhc0BhImu8wQ&r=P4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=rZRVMF0TdY-eN9YYy3VmV26Iu6PaWjRmF1zrbh4B24A&s=-45qJZTfmnPboJWsspT4Jt9sjXV0_M8sBu84n8NK7zc&e=>
>     index 5657397ddc..f537204a2d 100644
>     --- a/meta/recipes-devtools/meson/nativesdk-meson_0.59.1.bb
>     <https://urldefense.proofpoint.com/v2/url?u=http-3A__nativesdk-2Dmeson-5F0.59.1.bb&d=DwMFaQ&c=7dfBJ8cXbWjhc0BhImu8wQ&r=P4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=rZRVMF0TdY-eN9YYy3VmV26Iu6PaWjRmF1zrbh4B24A&s=-45qJZTfmnPboJWsspT4Jt9sjXV0_M8sBu84n8NK7zc&e=>
>     +++ b/meta/recipes-devtools/meson/nativesdk-meson_0.59.1.bb
>     <https://urldefense.proofpoint.com/v2/url?u=http-3A__nativesdk-2Dmeson-5F0.59.1.bb&d=DwMFaQ&c=7dfBJ8cXbWjhc0BhImu8wQ&r=P4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=rZRVMF0TdY-eN9YYy3VmV26Iu6PaWjRmF1zrbh4B24A&s=-45qJZTfmnPboJWsspT4Jt9sjXV0_M8sBu84n8NK7zc&e=>
>     @@ -15,6 +15,44 @@ SRC_URI += "file://meson-setup.py \
>       #   them.
>       do_install:append() {
>           install -d ${D}${datadir}/meson
>     +
>     +    cat >${D}${datadir}/meson/meson.native.template <<EOF
>     +[binaries]
>     +c = ${@meson_array('BUILD_CC', d)}
>     +cpp = ${@meson_array('BUILD_CXX', d)}
>     +ar = ${@meson_array('BUILD_AR', d)}
>     +nm = ${@meson_array('BUILD_NM', d)}
>     +strip = ${@meson_array('BUILD_STRIP', d)}
>     +readelf = ${@meson_array('BUILD_READELF', d)}
>     +pkgconfig = 'pkg-config-native'
>     +
>     +[built-in options]
>     +c_args = ['-isystem' @OECORE_NATIVE_SYSROOT '${includedir_native}'
>     , ${@meson_list_str('BUILD_OPTIMIZATION', d)}]
>     +c_link_args = ['-L' @OECORE_NATIVE_SYSROOT '${libdir_native}',
>     +               '-L' @@OECORE_NATIVE_SYSROOT '${base_libdir_native}',
>     +               '-Wl,-rpath-link,' @OECORE_NATIVE_SYSROOT
>     '${libdir_native}',
>     +               '-Wl,-rpath-link,' @OECORE_NATIVE_SYSROOT
>     '${base_libdir_native}',
>     +               '-Wl,--allow-shlib-undefined',
>     +               '-Wl,--dynamic-linker=' @OECORE_NATIVE_SYSROOT
>     '${base_libdir_native}'
>     +               '${@bb.utils.contains('BUILD_ARCH', 'x86_64',
>     'ld-linux-x86-64.so.2', '', d)}
>     +                ${@bb.utils.contains('BUILD_ARCH', 'i686',
>     'ld-linux.so.2', '', d)}
>     +                ${@bb.utils.contains('BUILD_ARCH', 'aarch64',
>     'ld-linux-aarch64.so.1', '', d)}'
>     +]
>     +cpp_args = ['-isystem@OECORE_NATIVE_SYSROOT' 'usr/include',
>     ${@meson_list_str('BUILD_OPTIMIZATION', d)}]
>     +cpp_link_args = ['-L' @OECORE_NATIVE_SYSROOT '${libdir_native}',
>     +               '-L' @@OECORE_NATIVE_SYSROOT '${base_libdir_native}',
>     +               '-Wl,-rpath-link,' @OECORE_NATIVE_SYSROOT
>     '${libdir_native}',
>     +               '-Wl,-rpath-link,' @OECORE_NATIVE_SYSROOT
>     '${base_libdir_native}',
>     +               '-Wl,--allow-shlib-undefined',
>     +               '-Wl,--dynamic-linker=' @OECORE_NATIVE_SYSROOT
>     '${base_libdir_native}'
>     +               '${@bb.utils.contains('BUILD_ARCH', 'x86_64',
>     'ld-linux-x86-64.so.2', '', d)}
>     +                ${@bb.utils.contains('BUILD_ARCH', 'i686',
>     'ld-linux.so.2', '', d)}
>     +                ${@bb.utils.contains('BUILD_ARCH', 'aarch64',
>     'ld-linux-aarch64.so.1', '', d)}'
>     +]
>     +[properties]
>     +sys_root = @OECORE_NATIVE_SYSROOT
>     +EOF
>     +
>           cat >${D}${datadir}/meson/meson.cross.template <<EOF
>       [binaries]
>       c = @CC
>     -- 
>     2.17.1
> 

-- 
Hsia-Jun(Randy) Li
