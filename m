Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4628FC4332F
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 00:40:36 +0000 (UTC)
Subject: Re: [PATCH] llvm: fix native llvm-config RUNPATH
To: openembedded-core@lists.openembedded.org
From: "Vincent Davis Jr" <vince@underview.tech>
X-Originating-Location: Richmond, Texas, US (99.113.4.128)
X-Originating-Platform: Linux Firefox 106
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 13 Nov 2022 16:40:27 -0800
References: <17985.1668384556897417838@lists.openembedded.org>
In-Reply-To: <17985.1668384556897417838@lists.openembedded.org>
Message-ID: <10514.1668386427068661722@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="3VynzU1uoFy2AvU738BU"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 00:40:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173215

--3VynzU1uoFy2AvU738BU
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

To answer second question. When you don't include

EXTRA_OECMAKE:append:class-native =3D "\
-DLLVM_LIBDIR_SUFFIX=3D64 \
"

meson configure fails with
....
....
....
| llvm-config found: YES (/../../../../../../../../tmp/work/amd64-northstar=
-linux/mesa/2_22.2.2-r0/recipe-sysroot/usr/bin/crossscripts/llvm-config15.0=
.1) 15.0.1
| Run-time dependency LLVM (modules: amdgpu, asmparser, bitreader, bitwrite=
r, core, engine, executionengine, instcombine, ipo, mcdisassembler, mcjit, =
native, scalaropts, transformutils, coroutines) found: NO (tried cmake and =
config-tool)
| Building fallback subproject with default_library=3Dshared
|
| ../mesa-22.2.2/meson.build:1783:2: ERROR: Neither a subproject directory =
nor a llvm.wrap file was found.
|
| A full log can be found at /../../.../../../../../../../tmp/work/amd64-no=
rthstar-linux/mesa/2_22.2.2-r0/build/meson-logs/meson-log.txt
....
....
....

Now if you

$ cat < /../../.../../../../../../../tmp/work/amd64-northstar-linux/mesa/2_=
22.2.2-r0/build/meson-logs/meson-log.txt

You see

llvm-config found: YES (/../../.../../../../../../../tmp/work/amd64-northst=
ar-linux/mesa/2_22.2.2-r0/recipe-sysroot/usr/bin/crossscripts/llvm-config15=
.0.1) 15.0.1
llvm-config --shared-mode returned an error
Run-time dependency LLVM (modules: amdgpu, asmparser, bitreader, bitwriter,=
 core, engine, executionengine, instcombine, ipo, mcdisassembler, mcjit, na=
tive, scalaropts, transformutils, coroutines) found: NO (tried cmake and co=
nfig-tool)

Now run llvm-config --shared-mode directly you see

$ llvm-config --shared-mode
llvm-config: error: component libraries and shared library
....
....
....
....
llvm-config: error: missing: /../../.../../../../../../../tmp/work/amd64-no=
rthstar-linux/mesa/2_22.2.2-r0/recipe-sysroot/usr/lib/libLLVMMCParser.a
llvm-config: error: missing: /../../.../../../../../../../tmp/work/amd64-no=
rthstar-linux/mesa/2_22.2.2-r0/recipe-sysroot/usr/lib/libLLVMTextAPI.a
llvm-config: error: missing: /../../.../../../../../../../tmp/work/amd64-no=
rthstar-linux/mesa/2_22.2.2-r0/recipe-sysroot/usr/lib/libLLVMObject.a
llvm-config: error: missing: /../../.../../../../../../../tmp/work/amd64-no=
rthstar-linux/mesa/2_22.2.2-r0/recipe-sysroot/usr/lib/libLLVMDebugInfoDWARF=
.a
llvm-config: error: missing: /../../.../../../../../../../tmp/work/amd64-no=
rthstar-linux/mesa/2_22.2.2-r0/recipe-sysroot/usr/lib/libLLVMDebugInfoMSF.a
llvm-config: error: missing: /../../.../../../../../../../tmp/work/amd64-no=
rthstar-linux/mesa/2_22.2.2-r0/recipe-sysroot/usr/lib/libLLVMDebugInfoPDB.a
....
....
....
....

../mesa/2_22.2.2-r0/mesa-22.2.2# llvm-config --libdir
/../../.../../../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r=
0/recipe-sysroot/usr/lib

../mesa/2_22.2.2-r0/mesa-22.2.2# ls /../../.../../../../../../../tmp/work/a=
md64-northstar-linux/mesa/2_22.2.2-r0/recipe-sysroot/usr
bin=C2=A0 include=C2=A0 lib64=C2=A0 share

That folder doesn't exists for me.

Also another false statement on my end its llvm-config that hard sets direc=
tory where to load libs.
mesa never calls llvm-config --libdir.

--3VynzU1uoFy2AvU738BU
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

To answer second question. When you don't include <br /><br />EXTRA_OECMAKE=
:append:class-native =3D "\<br />&nbsp;&nbsp;&nbsp;&nbsp; -DLLVM_LIBDIR_SUF=
FIX=3D64 \<br />&nbsp;&nbsp;&nbsp;&nbsp; "<br /><br />meson configure fails=
 with<br />....<br />....<br />....<br />| llvm-config found: YES (/../../.=
./../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/recipe-sys=
root/usr/bin/crossscripts/llvm-config15.0.1) 15.0.1<br />| Run-time depende=
ncy LLVM (modules: amdgpu, asmparser, bitreader, bitwriter, core, engine, e=
xecutionengine, instcombine, ipo, mcdisassembler, mcjit, native, scalaropts=
, transformutils, coroutines) found: NO (tried cmake and config-tool)<br />=
| Building fallback subproject with default_library=3Dshared<br />| <br />|=
 ../mesa-22.2.2/meson.build:1783:2: ERROR: Neither a subproject directory n=
or a llvm.wrap file was found.<br />| <br />| A full log can be found at /.=
./../.../../../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/=
build/meson-logs/meson-log.txt<br />....<br />....<br />....<br /><br />Now=
 if you<br /><br />$ cat &lt; /../../.../../../../../../../tmp/work/amd64-n=
orthstar-linux/mesa/2_22.2.2-r0/build/meson-logs/meson-log.txt<br /><br />Y=
ou see<br /><br />llvm-config found: YES (/../../.../../../../../../../tmp/=
work/amd64-northstar-linux/mesa/2_22.2.2-r0/recipe-sysroot/usr/bin/crossscr=
ipts/llvm-config15.0.1) 15.0.1<br />llvm-config --shared-mode returned an e=
rror<br />Run-time dependency LLVM (modules: amdgpu, asmparser, bitreader, =
bitwriter, core, engine, executionengine, instcombine, ipo, mcdisassembler,=
 mcjit, native, scalaropts, transformutils, coroutines) found: NO (tried cm=
ake and config-tool)<br /><br />Now run llvm-config --shared-mode directly =
you see<br /><br />$ llvm-config --shared-mode<br />llvm-config: error: com=
ponent libraries and shared library<br />....<br />....<br />....<br />....=
<br />llvm-config: error: missing: /../../.../../../../../../../tmp/work/am=
d64-northstar-linux/mesa/2_22.2.2-r0/recipe-sysroot/usr/lib/libLLVMMCParser=
.a<br />llvm-config: error: missing: /../../.../../../../../../../tmp/work/=
amd64-northstar-linux/mesa/2_22.2.2-r0/recipe-sysroot/usr/lib/libLLVMTextAP=
I.a<br />llvm-config: error: missing: /../../.../../../../../../../tmp/work=
/amd64-northstar-linux/mesa/2_22.2.2-r0/recipe-sysroot/usr/lib/libLLVMObjec=
t.a<br />llvm-config: error: missing: /../../.../../../../../../../tmp/work=
/amd64-northstar-linux/mesa/2_22.2.2-r0/recipe-sysroot/usr/lib/libLLVMDebug=
InfoDWARF.a<br />llvm-config: error: missing: /../../.../../../../../../../=
tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/recipe-sysroot/usr/lib/libL=
LVMDebugInfoMSF.a<br />llvm-config: error: missing: /../../.../../../../../=
../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/recipe-sysroot/usr/li=
b/libLLVMDebugInfoPDB.a<br />....<br />....<br />....<br />....<br /><br />=
<br />../mesa/2_22.2.2-r0/mesa-22.2.2# llvm-config --libdir<br />/../../...=
/../../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/recipe-s=
ysroot/usr/lib<br /><br />../mesa/2_22.2.2-r0/mesa-22.2.2# ls /../../.../..=
/../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/recipe-sysr=
oot/usr<br />bin&nbsp; include&nbsp; lib64&nbsp; share<br /><br />That fold=
er doesn't exists for me.<br /><br />Also another false statement on my end=
 its llvm-config that hard sets directory where to load libs.<br />mesa nev=
er calls llvm-config --libdir.

--3VynzU1uoFy2AvU738BU--

