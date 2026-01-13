Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECB48D2F32D
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 23:18:05 +0000 (UTC)
Subject: Re: [PATCH] llvm: enable LLVMgold.so build by adding binutils dependency
To: openembedded-core@lists.openembedded.org
From: "mark.yang" <mark.yang@lge.com>
X-Originating-Location: Nowon-gu, Seoul, KR (27.122.242.71)
X-Originating-Platform: Windows Firefox 146
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 13 Jan 2026 15:17:57 -0800
References: <20260113225424.1208879-1-mark.yang@lge.com>
In-Reply-To: <20260113225424.1208879-1-mark.yang@lge.com>
Message-ID: <939.1768346277734118893@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="xHFKdjjuG92zsq1OuejE"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 23:18:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229293

--xHFKdjjuG92zsq1OuejE
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

This patch is intended for recipes that use the bfd linker instead of the l=
ld linker when using LTO in a clang environment.

In Yocto scarthgap, this option was enabled, allowing LTO to be used even w=
hen using clang + LTO + bfd linker.
While the lld linker does not require a plugin, the following plugins are r=
equired when using the bfd linker.
LLVMgold.so, libLTO.so

We can reproduce the build by adding the following options to your local.co=
nf:
PREFERRED_TOOLCHAIN_TARGET =3D "clang"
DISTRO_FEATURES:append =3D " ld-is-lld"
require conf/distro/include/lto.inc
DISTRO_FEATURES:append =3D " lto"
# The settings below were taken from meta-clang.
LTO:toolchain-clang:class-target =3D "${@bb.utils.contains('DISTRO_FEATURES=
', 'thin-lto', '-flto=3Dthin', '-flto -fuse-ld=3Dlld', d)}"
LTO:toolchain-clang:class-nativesdk =3D "${@bb.utils.contains('DISTRO_FEATU=
RES', 'thin-lto', '-flto=3Dthin', '-flto -fuse-ld=3Dlld', d)}"

For example, components such as zlib force the use of the bfd linker. ( htt=
ps://github.com/openembedded/openembedded-core/commit/be5856616aee1d2134e6a=
edefc5fe664ad5e2a7d )
In this case, it causes the following error when building zlib: ( https://e=
rrors.yoctoproject.org/Errors/Details/895736/ )
usr/bin/aarch64-oe-linux/../lib/LLVMgold.so: cannot open shared object file=
: No such file or directory
`/usr/bin/lib/LLVMgold.so` is a very strange path, but this is an issue to =
be investigated further later. (This occurs because the clang binary is loc=
ated in `/usr/bin/aarch64-oe-linux`, and the plugin searches for it using a=
 relative path from clang's current location.)

In fact, LLVMgold.so does not exist in the sysroot.
bitbake/bitbake-builds/oe-nodistro-master-nodistro-machine_qemuarm64/build/=
tmp/sysroots-components $ find ./ -name "*LLVMgold*"
# nothing
bitbake/bitbake-builds/oe-nodistro-master-nodistro-machine_qemuarm64/build/=
tmp/sysroots-components $ find ./ -name "*libLTO*"
# nothing
To produce this, the following configuration is required in the llvm recipe=
.
DEPENDS +=3D "binutils"
EXTRA_OECMAKE +=3D "-DLLVM_BINUTILS_INCDIR=3D ${STAGING_INCDIR} "
It existed in the clang recipe for scarthgap, but was omitted in commit htt=
ps://github.com/openembedded/openembedded-core/commit/d76dc362c8e18779cc4dd=
c6a778fb423c0e66a65.
It seems this was missed during the process of streamlining the clang build=
 and separating the clang and llvm recipes.

However, the following configuration already exists in llvm_git.bb.
70: PACKAGECONFIG:remove:class-native =3D "lto thin-lto"
81: PACKAGECONFIG[lto] =3D "-DLLVM_ENABLE_LTO=3DFull -DLLVM_BINUTILS_INCDIR=
=3D ${STAGING_INCDIR} ,,binutils,"
82: PACKAGECONFIG[thin-lto] =3D "-DLLVM_ENABLE_LTO=3DThin -DLLVM_BINUTILS_I=
NCDIR=3D ${STAGING_INCDIR} ,,binutils,"
The `lto` and `thin-lto` settings in `PACKAGECONFIG` determine whether LTO =
(Link Time Optimization) will be applied to LLVM itself.
Furthermore, for `llvm-native`, `lto` or `thin-lto` settings in `PACKAGECON=
FIG` are never applied because they are explicitly removed.
PACKAGECONFIG:remove:class-native =3D "lto thin-lto" was added in https://g=
ithub.com/openembedded/openembedded-core/commit/d76dc362c8e18779cc4ddc6a778=
fb423c0e66a65.
It seems that the use of LTO for LLVM/Clang itself is being avoided to redu=
ce the increase in build time, which is a known disadvantage of LTO.

Even if LLVM/Clang itself does not use LTO, I want to enable LTO for compon=
ents that are built using LLVM/Clang.
Therefore, providing the necessary tools (LLVMgold.so, libLTO.so) in the sy=
sroot seems appropriate.

Building with this configuration will provide the following files in the sy=
sroot:
bitbake/bitbake-builds/oe-nodistro-master-nodistro-machine_qemuarm64/build/=
tmp/sysroots-components $ find . -name "*LLVMgold*"
./x86_64/llvm-native/usr/lib/LLVMgold.so
bitbake/bitbake-builds/oe-nodistro-master-nodistro-machine_qemuarm64/build/=
tmp/sysroots-components $ find . -name "*libLTO*"
./x86_64/llvm-native/usr/lib/libLTO.so.21.1
./x86_64/llvm-native/usr/lib/libLTO.so

Even after this patch, zlib will still fail with an error as it cannot find=
 the path to LLVMgold.so.
However, this should be addressed in a future patch.
As mentioned above, because the clang binary is copied to the usr/bin/aarch=
64-oe-linux/ location and provided to the sysroot, the relative path used t=
o locate the plugin is incorrect.

--xHFKdjjuG92zsq1OuejE
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>This patch is intended for recipes that use the bfd linker instead of =
the lld linker when using LTO in a clang environment.<br /><br /></div>
<div>In Yocto scarthgap, this option was enabled, allowing LTO to be used e=
ven when using clang + LTO + bfd linker.<br />While the lld linker does not=
 require a plugin, the following plugins are required when using the bfd li=
nker.</div>
<span style=3D"text-decoration: underline;">LLVMgold.so, libLTO.so</span><b=
r /><br />We can reproduce the build by adding the following options to you=
r local.conf:</div>
<div>
<pre>PREFERRED_TOOLCHAIN_TARGET =3D "clang"<br />DISTRO_FEATURES:append =3D=
 " ld-is-lld"<br />require conf/distro/include/lto.inc<br />DISTRO_FEATURES=
:append =3D " lto"<br /># The settings below were taken from meta-clang.<br=
 />LTO:toolchain-clang:class-target =3D "${@bb.utils.contains('DISTRO_FEATU=
RES', 'thin-lto', '-flto=3Dthin', '-flto -fuse-ld=3Dlld', d)}"<br />LTO:too=
lchain-clang:class-nativesdk =3D "${@bb.utils.contains('DISTRO_FEATURES', '=
thin-lto', '-flto=3Dthin', '-flto -fuse-ld=3Dlld', d)}"</pre>
</div>
<div><br />For example, components such as zlib force the use of the bfd li=
nker. (<a href=3D"https://github.com/openembedded/openembedded-core/commit/=
be5856616aee1d2134e6aedefc5fe664ad5e2a7d" target=3D"_blank" rel=3D"noopener=
">https://github.com/openembedded/openembedded-core/commit/be5856616aee1d21=
34e6aedefc5fe664ad5e2a7d</a>)<br />In this case, it causes the following er=
ror when building zlib: (<a href=3D"https://errors.yoctoproject.org/Errors/=
Details/895736/" target=3D"_blank" rel=3D"noopener">https://errors.yoctopro=
ject.org/Errors/Details/895736/</a>)<br />
<pre>usr/bin/aarch64-oe-linux/../lib/LLVMgold.so: cannot open shared object=
 file: No such file or directory</pre>
<div><span style=3D"text-decoration: underline;">`/usr/bin/lib/LLVMgold.so`=
</span> is a very strange path, but this is an issue to be investigated fur=
ther later. (This occurs because the clang binary is located in `/usr/bin/a=
arch64-oe-linux`, and the plugin searches for it using a relative path from=
 clang's current location.)<br /><br />In fact, LLVMgold.so does not exist =
in the sysroot.<br />
<pre class=3D"jeCodeBlock" dir=3D"auto"><code class=3D"bash hljs">bitbake/b=
itbake-builds/oe-nodistro-master-nodistro-machine_qemuarm64/build/tmp/sysro=
ots-components $ find ./ -name <span class=3D"hljs-string">"*LLVMgold*"</sp=
an>
<span class=3D"line"></span><span class=3D"hljs-comment"># nothing</span>
<span class=3D"line"></span>bitbake/bitbake-builds/oe-nodistro-master-nodis=
tro-machine_qemuarm64/build/tmp/sysroots-components $ find ./ -name <span c=
lass=3D"hljs-string">"*libLTO*"</span>
<span class=3D"line"></span><span class=3D"hljs-comment"># nothing</span></=
code></pre>
<br />To produce this, the following configuration is required in the llvm =
recipe.<br />
<pre class=3D"jeCodeBlock" dir=3D"auto"><code class=3D"bash hljs">DEPENDS +=
=3D <span class=3D"hljs-string">"binutils"</span>
<span class=3D"line"></span>EXTRA_OECMAKE +=3D <span class=3D"hljs-string">=
"-DLLVM_BINUTILS_INCDIR=3D<span class=3D"hljs-variable">${STAGING_INCDIR}</=
span>"</span></code></pre>
<br />It existed in the clang recipe for scarthgap, but was omitted in comm=
it <a href=3D"https://github.com/openembedded/openembedded-core/commit/d76d=
c362c8e18779cc4ddc6a778fb423c0e66a65" rel=3D"noopener">https://github.com/o=
penembedded/openembedded-core/commit/d76dc362c8e18779cc4ddc6a778fb423c0e66a=
65</a>.
<div>It seems this was missed during the process of streamlining the clang =
build and separating the clang and llvm recipes.</div>
<div>&nbsp;</div>
<div>However, the following configuration already exists in llvm_git.bb.</d=
iv>
<pre class=3D"jeCodeBlock" dir=3D"auto"><code class=3D"bash hljs"><span cla=
ss=3D"line"></span>70: PACKAGECONFIG:remove:class-native =3D <span class=3D=
"hljs-string">"lto thin-lto"</span>
<span class=3D"line"></span>81: PACKAGECONFIG[lto] =3D <span class=3D"hljs-=
string">"-DLLVM_ENABLE_LTO=3DFull -DLLVM_BINUTILS_INCDIR=3D<span class=3D"h=
ljs-variable">${STAGING_INCDIR}</span>,,binutils,"</span>
<span class=3D"line"></span>82: PACKAGECONFIG[thin-lto] =3D <span class=3D"=
hljs-string">"-DLLVM_ENABLE_LTO=3DThin -DLLVM_BINUTILS_INCDIR=3D<span class=
=3D"hljs-variable">${STAGING_INCDIR}</span>,,binutils,"</span></code></pre>
<br />The `lto` and `thin-lto` settings in `PACKAGECONFIG` determine whethe=
r LTO (Link Time Optimization) will be applied to LLVM itself.<br />Further=
more, for `llvm-native`, `lto` or `thin-lto` settings in `PACKAGECONFIG` ar=
e never applied because they are explicitly removed.<br />PACKAGECONFIG:rem=
ove:class-native =3D "lto thin-lto" was added in <a href=3D"https://github.=
com/openembedded/openembedded-core/commit/d76dc362c8e18779cc4ddc6a778fb423c=
0e66a65" rel=3D"noopener">https://github.com/openembedded/openembedded-core=
/commit/d76dc362c8e18779cc4ddc6a778fb423c0e66a65</a>.<br />It seems that th=
e use of LTO for LLVM/Clang itself is being avoided to reduce the increase =
in build time, which is a known disadvantage of LTO.<br /><br />
<div>Even if LLVM/Clang itself does not use LTO, I want to enable LTO for c=
omponents that are built using LLVM/Clang.<br />Therefore, providing the ne=
cessary tools (LLVMgold.so, libLTO.so) in the sysroot seems appropriate.</d=
iv>
<div>&nbsp;</div>
<div>Building with this configuration will provide the following files in t=
he sysroot:</div>
<pre class=3D"jeCodeBlock" dir=3D"auto"><code class=3D"bash hljs"><span cla=
ss=3D"line"></span>bitbake/bitbake-builds/oe-nodistro-master-nodistro-machi=
ne_qemuarm64/build/tmp/sysroots-components $ find . -name <span class=3D"hl=
js-string">"*LLVMgold*"</span>
<span class=3D"line"></span>./x86_64/llvm-native/usr/lib/LLVMgold.so
<span class=3D"line"></span>bitbake/bitbake-builds/oe-nodistro-master-nodis=
tro-machine_qemuarm64/build/tmp/sysroots-components $ find . -name <span cl=
ass=3D"hljs-string">"*libLTO*"</span>
<span class=3D"line"></span>./x86_64/llvm-native/usr/lib/libLTO.so.21.1
<span class=3D"line"></span>./x86_64/llvm-native/usr/lib/libLTO.so
<span class=3D"line"></span></code></pre>
</div>
<div>Even after this patch, zlib will still fail with an error as it cannot=
 find the path to LLVMgold.so.<br />However, this should be addressed in a =
future patch.<br />As mentioned above, because the clang binary is copied t=
o the <span style=3D"text-decoration: underline;">usr/bin/aarch64-oe-linux/=
</span> location and provided to the sysroot, the relative path used to loc=
ate the plugin is incorrect.<br /><br /><br /></div>
</div>

--xHFKdjjuG92zsq1OuejE--

