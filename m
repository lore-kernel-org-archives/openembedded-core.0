Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A61AEC64ED6
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 06:28:45 +0000 (UTC)
Subject: Re: Yocto reproducibilty issue :: rust-llvm binary differences
To: openembedded-core@lists.openembedded.org
From: "Sundeep KOKKONDA" <sundeep.kokkonda@windriver.com>
X-Originating-Location: Hyderabad, Telangana, IN (183.83.146.54)
X-Originating-Platform: Windows Chrome 110
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 28 Feb 2023 22:28:37 -0800
References: <CAMKF1sp8fQHaZw=eyXD6C4qnQhLjNjZ6_upxfauEZ8jBT9egbw@mail.gmail.com>
In-Reply-To: <CAMKF1sp8fQHaZw=eyXD6C4qnQhLjNjZ6_upxfauEZ8jBT9egbw@mail.gmail.com>
Message-ID: <22315.1677652117161137395@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="E7BFT78VwhE41NNgfvLR"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 06:28:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177868

--E7BFT78VwhE41NNgfvLR
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I tried to copy the libLTO.so to ${D}. But this shows ERROR: rust-llvm-1.67=
.0-r0 do_package_qa: QA Issue: -dev package rust-llvm-dev contains non-syml=
ink .so '/usr/lib/llvm-rust/lib/libLTO.so' [dev-elf] and I had a look into =
symlink where it points... The libLTO.so files RPATH in ${D} & sysroot-dest=
dir are different as below,

$ objdump -x ./image/wdr/poky/buildA/tmp/work/x86_64-linux/rust-llvm-native=
/1.67.0-r0/recipe-sysroot-native/usr/lib/llvm-rust/lib/libLTO.so | grep 'R.=
*PATH'

RUNPATH /wdr/poky/buildA/tmp/work/x86_64-linux/rust-llvm-native/1.67.0-r0/r=
ecipe-sysroot-native/usr/lib:/wdr/poky/buildA/tmp/work/x86_64-linux/rust-ll=
vm-native/1.67.0-r0/recipe-sysroot-native/lib::::::::::::::::::::::::::::::=
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::=
:::::::::::::

$ objdump -x ./sysroot-destdir/wdr/poky/buildA/tmp/work/x86_64-linux/rust-l=
lvm-native/1.67.0-r0/recipe-sysroot-native/usr/lib/llvm-rust/lib/libLTO.so =
| grep 'R.*PATH'

RUNPATH $ORIGIN/../..:$ORIGIN/../../../../lib:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.=
:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:=
.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.=
:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.

Also, the libLTO.so is a symlink for libLTO.so.15. So, I tried copying both=
 libLTO.so & libLTO.so.15 but again getting below QA error:

ERROR : rust-llvm-1.67.0-r0 do_package: QA Issue: File '/usr/lib/llvm-rust/=
lib/libLTO.so' from rust-llvm was already stripped, this will prevent futur=
e debugging! [already-stripped]

ERROR : rust-llvm-1.67.0-r0 do_package: QA Issue: File '/usr/lib/llvm-rust/=
lib/libLTO.so.15' from rust-llvm was already stripped, this will prevent fu=
ture debugging! [already-stripped]

WARNING : rust-llvm-1.67.0-r0 do_package: rust-llvm-liblto-1.67.0 was regis=
tered as shlib provider for libLTO.so.15, changing it to rust-llvm-dev-1.67=
.0 because it was built later

ERROR : rust-llvm-1.67.0-r0 do_package: Fatal QA errors were found, failing=
 task.

So, I disabled stripping of binaries in kernel.bbclass (@line 743 : #oe.pac=
kage.runstrip((kernel_image_stripped, 8, strip, extra_sections))) but still=
 facing below errors.

WARNING : rust-llvm-1.67.0-r0 do_package: rust-llvm-liblto-1.67.0 was regis=
tered as shlib provider for libLTO.so.15, changing it to rust-llvm-dev-1.67=
.0 because it was built later

WARNING : rust-llvm-1.67.0-r0 do_package_qa: QA Issue: File /usr/lib/llvm-r=
ust/lib/libLTO.so.15 in package rust-llvm-liblto contains reference to TMPD=
IR [buildpaths]

WARNING : rust-llvm-1.67.0-r0 do_package_qa: QA Issue: File /usr/lib/llvm-r=
ust/lib/libLTO.so in package rust-llvm-dev contains reference to TMPDIR [bu=
ildpaths]

ERROR : rust-llvm-1.67.0-r0 do_package_qa: QA Issue: -dev package rust-llvm=
-dev contains non-symlink .so '/usr/lib/llvm-rust/lib/libLTO.so' [dev-elf]

ERROR : rust-llvm-1.67.0-r0 do_package_qa: Fatal QA errors were found, fail=
ing task.

I tried to do the same with by adding my own task with ' addtask patchso af=
ter do_install ' but that is also having some issues while calling that tas=
k and that is not recommended=C2=A0way to do it by Richard.

Is there any way I can fix it or disable these checks for my testing?

Thanks,

Sundeep K.

--E7BFT78VwhE41NNgfvLR
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p class=3D"DefangedMsoNormal" style=3D"margin-bottom: 0cm; line-height: no=
rmal; background: white; vertical-align: baseline;" style=3D"margin:0px;"><=
span style=3D"font-size: 12.0pt; mso-ascii-font-family: Calibri; mso-fareas=
t-font-family: &#39;Times New Roman&#39;; mso-hansi-font-family: Calibri; m=
so-bidi-font-family: Calibri; color: black; mso-fareast-language: EN-IN; ms=
o-bidi-language: TE;">Hello,</span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin-bottom: 0cm; line-height: no=
rmal; background: white; vertical-align: baseline;" style=3D"margin:0px;"><=
span style=3D"font-size: 12.0pt; mso-ascii-font-family: Calibri; mso-fareas=
t-font-family: &#39;Times New Roman&#39;; mso-hansi-font-family: Calibri; m=
so-bidi-font-family: Calibri; color: black; mso-fareast-language: EN-IN; ms=
o-bidi-language: TE;">=C2=A0</span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin-bottom: 0cm; line-height: no=
rmal; background: white; vertical-align: baseline;" style=3D"margin:0px;"><=
span style=3D"font-size: 12.0pt; mso-ascii-font-family: Calibri; mso-fareas=
t-font-family: &#39;Times New Roman&#39;; mso-hansi-font-family: Calibri; m=
so-bidi-font-family: Calibri; color: black; mso-fareast-language: EN-IN; ms=
o-bidi-language: TE;">I tried to copy the=C2=A0<em>libLTO.so</em>=C2=A0to $=
{D}. But this shows=C2=A0</span><em><span style=3D"font-size: 10.0pt; font-=
family: Consolas; mso-fareast-font-family: &#39;Times New Roman&#39;; mso-b=
idi-font-family: Calibri; color: #ed5c57; border: none windowtext 1.0pt; ms=
o-border-alt: none windowtext 0cm; padding: 0cm; mso-fareast-language: EN-I=
N; mso-bidi-language: TE;">ERROR: rust-llvm-1.67.0-r0 do_package_qa: QA Iss=
ue: -dev package rust-llvm-dev contains non-symlink .so &#39;/usr/lib/llvm-=
rust/lib/libLTO.so&#39; [dev-elf]</span></em><span style=3D"font-size: 12.0=
pt; mso-ascii-font-family: Calibri; mso-fareast-font-family: &#39;Times New=
 Roman&#39;; mso-hansi-font-family: Calibri; mso-bidi-font-family: Calibri;=
 color: black; mso-fareast-language: EN-IN; mso-bidi-language: TE;">=C2=A0a=
nd I had a look into symlink where it points... The libLTO.so files RPATH i=
n ${D} &amp; sysroot-destdir are different as below,</span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin-bottom: 0cm; line-height: no=
rmal; background: white; vertical-align: baseline;" style=3D"margin:0px;"><=
span style=3D"font-size: 12.0pt; mso-ascii-font-family: Calibri; mso-fareas=
t-font-family: &#39;Times New Roman&#39;; mso-hansi-font-family: Calibri; m=
so-bidi-font-family: Calibri; color: black; mso-fareast-language: EN-IN; ms=
o-bidi-language: TE;">=C2=A0</span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin-bottom: 0cm; line-height: no=
rmal; background: white; vertical-align: baseline;" style=3D"margin:0px;"><=
span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast-font-fa=
mily: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; color: #388=
89f; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; pa=
dding: 0cm; mso-fareast-language: EN-IN; mso-bidi-language: TE;">$</span><s=
pan style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast-font-fam=
ily: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; color: black=
; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; paddi=
ng: 0cm; mso-fareast-language: EN-IN; mso-bidi-language: TE;">=C2=A0objdump=
 -x ./image/wdr/poky/buildA/tmp/work/x86_64-linux/rust-llvm-native/1.67.0-r=
0/recipe-sysroot-native/usr/lib/llvm-rust/lib/libLTO.so | grep &#39;R.*PATH=
&#39;</span><span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fa=
reast-font-family: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri=
; color: #141414; border: none windowtext 1.0pt; mso-border-alt: none windo=
wtext 0cm; padding: 0cm; background: gray; mso-fareast-language: EN-IN; mso=
-bidi-language: TE;">=C2=A0</span><span style=3D"mso-ascii-font-family: Cal=
ibri; mso-fareast-font-family: &#39;Times New Roman&#39;; mso-hansi-font-fa=
mily: Calibri; mso-bidi-font-family: Calibri; mso-fareast-language: EN-IN; =
mso-bidi-language: TE;"></span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin-bottom: 0cm; line-height: no=
rmal; background: white; vertical-align: baseline;" style=3D"margin:0px;"><=
span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast-font-fa=
mily: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; color: blac=
k; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padd=
ing: 0cm; mso-fareast-language: EN-IN; mso-bidi-language: TE;">=C2=A0=C2=A0=
RUNPATH=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0<span style=3D"background: yellow;">/wdr/poky/buildA/tmp/=
work/x86_64-linux/rust-llvm-native/1.67.0-r0/recipe-sysroot-native/usr/lib:=
/wdr/poky/buildA/tmp/work/x86_64-linux/rust-llvm-native/1.67.0-r0/recipe-sy=
sroot-native/lib:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::=
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::</span></span><s=
pan style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast-font-fam=
ily: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; color: #1414=
14; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; pad=
ding: 0cm; background: gray; mso-fareast-language: EN-IN; mso-bidi-language=
: TE;">=C2=A0</span><span style=3D"mso-ascii-font-family: Calibri; mso-fare=
ast-font-family: &#39;Times New Roman&#39;; mso-hansi-font-family: Calibri;=
 mso-bidi-font-family: Calibri; color: black; mso-fareast-language: EN-IN; =
mso-bidi-language: TE;"></span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin-bottom: 0cm; line-height: no=
rmal; background: white; vertical-align: baseline;" style=3D"margin:0px;"><=
span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast-font-fa=
mily: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; color: #388=
89f; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; pa=
dding: 0cm; mso-fareast-language: EN-IN; mso-bidi-language: TE;">$</span><s=
pan style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast-font-fam=
ily: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; color: black=
; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; paddi=
ng: 0cm; mso-fareast-language: EN-IN; mso-bidi-language: TE;">=C2=A0objdump=
 -x ./sysroot-destdir/wdr/poky/buildA/tmp/work/x86_64-linux/rust-llvm-nativ=
e/1.67.0-r0/recipe-sysroot-native/usr/lib/llvm-rust/lib/libLTO.so | grep &#=
39;R.*PATH&#39;</span><span style=3D"font-size: 10.0pt; font-family: Consol=
as; mso-fareast-font-family: &#39;Times New Roman&#39;; mso-bidi-font-famil=
y: Calibri; color: #141414; border: none windowtext 1.0pt; mso-border-alt: =
none windowtext 0cm; padding: 0cm; background: gray; mso-fareast-language: =
EN-IN; mso-bidi-language: TE;">=C2=A0</span><span style=3D"mso-ascii-font-f=
amily: Calibri; mso-fareast-font-family: &#39;Times New Roman&#39;; mso-han=
si-font-family: Calibri; mso-bidi-font-family: Calibri; mso-fareast-languag=
e: EN-IN; mso-bidi-language: TE;"></span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin-bottom: 0cm; line-height: no=
rmal; background: white; vertical-align: baseline;" style=3D"margin:0px;"><=
span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast-font-fa=
mily: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; color: blac=
k; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; padd=
ing: 0cm; mso-fareast-language: EN-IN; mso-bidi-language: TE;">=C2=A0=C2=A0=
RUNPATH=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0<span style=3D"background: yellow;">$ORIGIN/../..:$ORIGIN=
/../../../../lib:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:=
.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.=
:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:=
.:.:.:.:.:.:.:.:.:.:.:.:.:.</span></span><span style=3D"font-size: 10.0pt; =
font-family: Consolas; mso-fareast-font-family: &#39;Times New Roman&#39;; =
mso-bidi-font-family: Calibri; color: #141414; border: none windowtext 1.0p=
t; mso-border-alt: none windowtext 0cm; padding: 0cm; background: gray; mso=
-fareast-language: EN-IN; mso-bidi-language: TE;">=C2=A0</span><span style=
=3D"mso-ascii-font-family: Calibri; mso-fareast-font-family: &#39;Times New=
 Roman&#39;; mso-hansi-font-family: Calibri; mso-bidi-font-family: Calibri;=
 color: black; mso-fareast-language: EN-IN; mso-bidi-language: TE;"></span>=
</p>
<p class=3D"DefangedMsoNormal" style=3D"margin-bottom: 0cm; line-height: no=
rmal; background: white; vertical-align: baseline;" style=3D"margin:0px;"><=
span style=3D"font-size: 12.0pt; mso-ascii-font-family: Calibri; mso-fareas=
t-font-family: &#39;Times New Roman&#39;; mso-hansi-font-family: Calibri; m=
so-bidi-font-family: Calibri; mso-fareast-language: EN-IN; mso-bidi-languag=
e: TE;">=C2=A0</span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin-bottom: 0cm; line-height: no=
rmal; background: white; vertical-align: baseline;" style=3D"margin:0px;"><=
span style=3D"font-size: 12.0pt; mso-ascii-font-family: Calibri; mso-fareas=
t-font-family: &#39;Times New Roman&#39;; mso-hansi-font-family: Calibri; m=
so-bidi-font-family: Calibri; color: black; mso-color-alt: windowtext; mso-=
fareast-language: EN-IN; mso-bidi-language: TE;">Also, the libLTO.so is a s=
ymlink for libLTO.so.15. So,=C2=A0<u>I tried copying both libLTO.so &amp; l=
ibLTO.so.15 but again getting below QA error:</u></span><span style=3D"font=
-size: 12.0pt; mso-ascii-font-family: Calibri; mso-fareast-font-family: &#3=
9;Times New Roman&#39;; mso-hansi-font-family: Calibri; mso-bidi-font-famil=
y: Calibri; mso-fareast-language: EN-IN; mso-bidi-language: TE;"></span></p=
>
<p class=3D"DefangedMsoNormal" style=3D"margin-bottom: 0cm; line-height: no=
rmal; background: white; vertical-align: baseline;" style=3D"margin:0px;"><=
span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast-font-fa=
mily: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; color: #aa5=
555; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; pa=
dding: 0cm; mso-fareast-language: EN-IN; mso-bidi-language: TE;">ERROR</spa=
n><span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast-font=
-family: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; color: b=
lack; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; p=
adding: 0cm; mso-fareast-language: EN-IN; mso-bidi-language: TE;">:=C2=A0</=
span><span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast-f=
ont-family: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; color=
: #aa4040; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0=
cm; padding: 0cm; mso-fareast-language: EN-IN; mso-bidi-language: TE;">rust=
-llvm-1.67.0-r0 do_package: QA Issue: File &#39;/usr/lib/llvm-rust/lib/libL=
TO.so&#39; from rust-llvm was already stripped, this will prevent future de=
bugging! [already-stripped]</span><span style=3D"font-size: 10.0pt; font-fa=
mily: Consolas; mso-fareast-font-family: &#39;Times New Roman&#39;; mso-bid=
i-font-family: Calibri; color: #141414; border: none windowtext 1.0pt; mso-=
border-alt: none windowtext 0cm; padding: 0cm; background: gray; mso-fareas=
t-language: EN-IN; mso-bidi-language: TE;">=C2=A0</span><span style=3D"mso-=
ascii-font-family: Calibri; mso-fareast-font-family: &#39;Times New Roman&#=
39;; mso-hansi-font-family: Calibri; mso-bidi-font-family: Calibri; color: =
black; mso-fareast-language: EN-IN; mso-bidi-language: TE;"></span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin-bottom: 0cm; line-height: no=
rmal; background: white; vertical-align: baseline;" style=3D"margin:0px;"><=
span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast-font-fa=
mily: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; color: #aa5=
555; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; pa=
dding: 0cm; mso-fareast-language: EN-IN; mso-bidi-language: TE;">ERROR</spa=
n><span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast-font=
-family: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; color: b=
lack; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; p=
adding: 0cm; mso-fareast-language: EN-IN; mso-bidi-language: TE;">:=C2=A0</=
span><span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast-f=
ont-family: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; color=
: #aa4040; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0=
cm; padding: 0cm; mso-fareast-language: EN-IN; mso-bidi-language: TE;">rust=
-llvm-1.67.0-r0 do_package: QA Issue: File &#39;/usr/lib/llvm-rust/lib/libL=
TO.so.15&#39; from rust-llvm was already stripped, this will prevent future=
 debugging! [already-stripped]</span><span style=3D"font-size: 10.0pt; font=
-family: Consolas; mso-fareast-font-family: &#39;Times New Roman&#39;; mso-=
bidi-font-family: Calibri; color: #141414; border: none windowtext 1.0pt; m=
so-border-alt: none windowtext 0cm; padding: 0cm; background: gray; mso-far=
east-language: EN-IN; mso-bidi-language: TE;">=C2=A0</span><span style=3D"m=
so-ascii-font-family: Calibri; mso-fareast-font-family: &#39;Times New Roma=
n&#39;; mso-hansi-font-family: Calibri; mso-bidi-font-family: Calibri; colo=
r: black; mso-fareast-language: EN-IN; mso-bidi-language: TE;"></span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin-bottom: 0cm; line-height: no=
rmal; background: white; vertical-align: baseline;" style=3D"margin:0px;"><=
span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast-font-fa=
mily: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; color: #949=
20c; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; pa=
dding: 0cm; mso-fareast-language: EN-IN; mso-bidi-language: TE;">WARNING</s=
pan><span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast-fo=
nt-family: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; color:=
 black; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm;=
 padding: 0cm; mso-fareast-language: EN-IN; mso-bidi-language: TE;">:=C2=A0=
</span><span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast=
-font-family: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; col=
or: #7e7e0c; border: none windowtext 1.0pt; mso-border-alt: none windowtext=
 0cm; padding: 0cm; mso-fareast-language: EN-IN; mso-bidi-language: TE;">ru=
st-llvm-1.67.0-r0 do_package: rust-llvm-liblto-1.67.0 was registered as shl=
ib provider for libLTO.so.15, changing it to rust-llvm-dev-1.67.0 because i=
t was built later</span><span style=3D"font-size: 10.0pt; font-family: Cons=
olas; mso-fareast-font-family: &#39;Times New Roman&#39;; mso-bidi-font-fam=
ily: Calibri; color: #141414; border: none windowtext 1.0pt; mso-border-alt=
: none windowtext 0cm; padding: 0cm; background: gray; mso-fareast-language=
: EN-IN; mso-bidi-language: TE;">=C2=A0</span><span style=3D"mso-ascii-font=
-family: Calibri; mso-fareast-font-family: &#39;Times New Roman&#39;; mso-h=
ansi-font-family: Calibri; mso-bidi-font-family: Calibri; color: black; mso=
-fareast-language: EN-IN; mso-bidi-language: TE;"></span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin-bottom: 0cm; line-height: no=
rmal; background: white; vertical-align: baseline;" style=3D"margin:0px;"><=
span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast-font-fa=
mily: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; color: #aa5=
555; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; pa=
dding: 0cm; mso-fareast-language: EN-IN; mso-bidi-language: TE;">ERROR</spa=
n><span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast-font=
-family: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; color: b=
lack; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; p=
adding: 0cm; mso-fareast-language: EN-IN; mso-bidi-language: TE;">:=C2=A0</=
span><span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast-f=
ont-family: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; color=
: #aa4040; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0=
cm; padding: 0cm; mso-fareast-language: EN-IN; mso-bidi-language: TE;">rust=
-llvm-1.67.0-r0 do_package: Fatal QA errors were found, failing task.</span=
><span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast-font-=
family: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; color: #1=
41414; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; =
padding: 0cm; background: gray; mso-fareast-language: EN-IN; mso-bidi-langu=
age: TE;">=C2=A0</span><span style=3D"mso-ascii-font-family: Calibri; mso-f=
areast-font-family: &#39;Times New Roman&#39;; mso-hansi-font-family: Calib=
ri; mso-bidi-font-family: Calibri; color: black; mso-fareast-language: EN-I=
N; mso-bidi-language: TE;"></span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin-bottom: 0cm; line-height: no=
rmal; background: white; vertical-align: baseline;" style=3D"margin:0px;"><=
span style=3D"mso-ascii-font-family: Calibri; mso-fareast-font-family: &#39=
;Times New Roman&#39;; mso-hansi-font-family: Calibri; mso-bidi-font-family=
: Calibri; color: black; mso-fareast-language: EN-IN; mso-bidi-language: TE=
;">=C2=A0</span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin-bottom: 0cm; line-height: no=
rmal; background: white; vertical-align: baseline;" style=3D"margin:0px;"><=
u><span style=3D"font-size: 12.0pt; mso-ascii-font-family: Calibri; mso-far=
east-font-family: &#39;Times New Roman&#39;; mso-hansi-font-family: Calibri=
; mso-bidi-font-family: Calibri; color: black; mso-fareast-language: EN-IN;=
 mso-bidi-language: TE;">So, I disabled stripping of binaries in=C2=A0<em>k=
ernel.bbclass (@line 743 : #oe.package.runstrip((kernel_image_stripped, 8, =
strip, extra_sections)))</em>=C2=A0but still facing below errors.</span></u=
><span style=3D"font-size: 12.0pt; mso-ascii-font-family: Calibri; mso-fare=
ast-font-family: &#39;Times New Roman&#39;; mso-hansi-font-family: Calibri;=
 mso-bidi-font-family: Calibri; color: black; mso-fareast-language: EN-IN; =
mso-bidi-language: TE;"></span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin-bottom: 0cm; line-height: no=
rmal; background: white; vertical-align: baseline;" style=3D"margin:0px;"><=
span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast-font-fa=
mily: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; color: #949=
20c; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; pa=
dding: 0cm; mso-fareast-language: EN-IN; mso-bidi-language: TE;">WARNING</s=
pan><span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast-fo=
nt-family: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; color:=
 black; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm;=
 padding: 0cm; mso-fareast-language: EN-IN; mso-bidi-language: TE;">:=C2=A0=
</span><span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast=
-font-family: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; col=
or: #7e7e0c; border: none windowtext 1.0pt; mso-border-alt: none windowtext=
 0cm; padding: 0cm; mso-fareast-language: EN-IN; mso-bidi-language: TE;">ru=
st-llvm-1.67.0-r0 do_package: rust-llvm-liblto-1.67.0 was registered as shl=
ib provider for libLTO.so.15, changing it to rust-llvm-dev-1.67.0 because i=
t was built later</span><span style=3D"font-size: 10.0pt; font-family: Cons=
olas; mso-fareast-font-family: &#39;Times New Roman&#39;; mso-bidi-font-fam=
ily: Calibri; color: #141414; border: none windowtext 1.0pt; mso-border-alt=
: none windowtext 0cm; padding: 0cm; background: gray; mso-fareast-language=
: EN-IN; mso-bidi-language: TE;">=C2=A0</span><span style=3D"font-size: 12.=
0pt; mso-ascii-font-family: Calibri; mso-fareast-font-family: &#39;Times Ne=
w Roman&#39;; mso-hansi-font-family: Calibri; mso-bidi-font-family: Calibri=
; color: black; mso-fareast-language: EN-IN; mso-bidi-language: TE;"></span=
></p>
<p class=3D"DefangedMsoNormal" style=3D"margin-bottom: 0cm; line-height: no=
rmal; background: white; vertical-align: baseline;" style=3D"margin:0px;"><=
span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast-font-fa=
mily: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; color: #949=
20c; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; pa=
dding: 0cm; mso-fareast-language: EN-IN; mso-bidi-language: TE;">WARNING</s=
pan><span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast-fo=
nt-family: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; color:=
 black; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm;=
 padding: 0cm; mso-fareast-language: EN-IN; mso-bidi-language: TE;">:=C2=A0=
</span><span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast=
-font-family: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; col=
or: #7e7e0c; border: none windowtext 1.0pt; mso-border-alt: none windowtext=
 0cm; padding: 0cm; mso-fareast-language: EN-IN; mso-bidi-language: TE;">ru=
st-llvm-1.67.0-r0 do_package_qa: QA Issue: File /usr/lib/llvm-rust/lib/libL=
TO.so.15 in package rust-llvm-liblto contains reference to TMPDIR [buildpat=
hs]</span><span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fare=
ast-font-family: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; =
color: #141414; border: none windowtext 1.0pt; mso-border-alt: none windowt=
ext 0cm; padding: 0cm; background: gray; mso-fareast-language: EN-IN; mso-b=
idi-language: TE;">=C2=A0</span><span style=3D"mso-ascii-font-family: Calib=
ri; mso-fareast-font-family: &#39;Times New Roman&#39;; mso-hansi-font-fami=
ly: Calibri; mso-bidi-font-family: Calibri; color: black; mso-fareast-langu=
age: EN-IN; mso-bidi-language: TE;"></span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin-bottom: 0cm; line-height: no=
rmal; background: white; vertical-align: baseline;" style=3D"margin:0px;"><=
span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast-font-fa=
mily: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; color: #949=
20c; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; pa=
dding: 0cm; mso-fareast-language: EN-IN; mso-bidi-language: TE;">WARNING</s=
pan><span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast-fo=
nt-family: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; color:=
 black; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm;=
 padding: 0cm; mso-fareast-language: EN-IN; mso-bidi-language: TE;">:=C2=A0=
</span><span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast=
-font-family: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; col=
or: #7e7e0c; border: none windowtext 1.0pt; mso-border-alt: none windowtext=
 0cm; padding: 0cm; mso-fareast-language: EN-IN; mso-bidi-language: TE;">ru=
st-llvm-1.67.0-r0 do_package_qa: QA Issue: File /usr/lib/llvm-rust/lib/libL=
TO.so in package rust-llvm-dev contains reference to TMPDIR [buildpaths]</s=
pan><span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast-fo=
nt-family: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; color:=
 #141414; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0c=
m; padding: 0cm; background: gray; mso-fareast-language: EN-IN; mso-bidi-la=
nguage: TE;">=C2=A0</span><span style=3D"mso-ascii-font-family: Calibri; ms=
o-fareast-font-family: &#39;Times New Roman&#39;; mso-hansi-font-family: Ca=
libri; mso-bidi-font-family: Calibri; color: black; mso-fareast-language: E=
N-IN; mso-bidi-language: TE;"></span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin-bottom: 0cm; line-height: no=
rmal; background: white; vertical-align: baseline;" style=3D"margin:0px;"><=
span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast-font-fa=
mily: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; color: #aa5=
555; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; pa=
dding: 0cm; mso-fareast-language: EN-IN; mso-bidi-language: TE;">ERROR</spa=
n><span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast-font=
-family: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; color: b=
lack; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; p=
adding: 0cm; mso-fareast-language: EN-IN; mso-bidi-language: TE;">:=C2=A0</=
span><span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast-f=
ont-family: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; color=
: #aa4040; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0=
cm; padding: 0cm; mso-fareast-language: EN-IN; mso-bidi-language: TE;">rust=
-llvm-1.67.0-r0 do_package_qa: QA Issue: -dev package rust-llvm-dev contain=
s non-symlink .so &#39;/usr/lib/llvm-rust/lib/libLTO.so&#39; [dev-elf]</spa=
n><span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast-font=
-family: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; color: #=
141414; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm;=
 padding: 0cm; background: gray; mso-fareast-language: EN-IN; mso-bidi-lang=
uage: TE;">=C2=A0</span><span style=3D"mso-ascii-font-family: Calibri; mso-=
fareast-font-family: &#39;Times New Roman&#39;; mso-hansi-font-family: Cali=
bri; mso-bidi-font-family: Calibri; color: black; mso-fareast-language: EN-=
IN; mso-bidi-language: TE;"></span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin-bottom: 0cm; line-height: no=
rmal; background: white; vertical-align: baseline;" style=3D"margin:0px;"><=
span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast-font-fa=
mily: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; color: #aa5=
555; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; pa=
dding: 0cm; mso-fareast-language: EN-IN; mso-bidi-language: TE;">ERROR</spa=
n><span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast-font=
-family: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; color: b=
lack; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0cm; p=
adding: 0cm; mso-fareast-language: EN-IN; mso-bidi-language: TE;">:=C2=A0</=
span><span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast-f=
ont-family: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; color=
: #aa4040; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0=
cm; padding: 0cm; mso-fareast-language: EN-IN; mso-bidi-language: TE;">rust=
-llvm-1.67.0-r0 do_package_qa: Fatal QA errors were found, failing task.</s=
pan><span style=3D"font-size: 10.0pt; font-family: Consolas; mso-fareast-fo=
nt-family: &#39;Times New Roman&#39;; mso-bidi-font-family: Calibri; color:=
 #141414; border: none windowtext 1.0pt; mso-border-alt: none windowtext 0c=
m; padding: 0cm; background: gray; mso-fareast-language: EN-IN; mso-bidi-la=
nguage: TE;">=C2=A0</span><span style=3D"mso-ascii-font-family: Calibri; ms=
o-fareast-font-family: &#39;Times New Roman&#39;; mso-hansi-font-family: Ca=
libri; mso-bidi-font-family: Calibri; color: black; mso-fareast-language: E=
N-IN; mso-bidi-language: TE;"></span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin-bottom: 0cm; line-height: no=
rmal; background: white; vertical-align: baseline;" style=3D"margin:0px;"><=
br/><span style=3D"color: #000000;">I tried to do the same with by adding m=
y own task with &#39;</span><em style=3D"color: black;">addtask patchso aft=
er do_install</em><span style=3D"color: #000000;">&#39; but that is also ha=
ving some issues while calling that task and that is not recommended=C2=A0w=
ay to do it by <em>Richard</em>.<br/></span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin-bottom: 0cm; line-height: no=
rmal; background: white; vertical-align: baseline;" style=3D"margin:0px;"><=
span style=3D"font-size: 12.0pt; mso-ascii-font-family: Calibri; mso-fareas=
t-font-family: &#39;Times New Roman&#39;; mso-hansi-font-family: Calibri; m=
so-bidi-font-family: Calibri; color: black; border: none windowtext 1.0pt; =
mso-border-alt: none windowtext 0cm; padding: 0cm; mso-fareast-language: EN=
-IN; mso-bidi-language: TE;">Is there any way I can fix it or disable these=
 checks for my testing?</span><span style=3D"font-size: 12.0pt; mso-ascii-f=
ont-family: Calibri; mso-fareast-font-family: &#39;Times New Roman&#39;; ms=
o-hansi-font-family: Calibri; mso-bidi-font-family: Calibri; color: black; =
mso-fareast-language: EN-IN; mso-bidi-language: TE;"></span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin-bottom: 0cm; line-height: no=
rmal; background: white; vertical-align: baseline;" style=3D"margin:0px;"><=
span style=3D"font-size: 12.0pt; mso-ascii-font-family: Calibri; mso-fareas=
t-font-family: &#39;Times New Roman&#39;; mso-hansi-font-family: Calibri; m=
so-bidi-font-family: Calibri; color: black; mso-fareast-language: EN-IN; ms=
o-bidi-language: TE;">=C2=A0</span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin-bottom: 0cm; line-height: no=
rmal; background: white; vertical-align: baseline;" style=3D"margin:0px;"><=
span style=3D"font-size: 12.0pt; mso-ascii-font-family: Calibri; mso-fareas=
t-font-family: &#39;Times New Roman&#39;; mso-hansi-font-family: Calibri; m=
so-bidi-font-family: Calibri; color: black; mso-fareast-language: EN-IN; ms=
o-bidi-language: TE;">=C2=A0</span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin-bottom: 0cm; line-height: no=
rmal; background: white; vertical-align: baseline;" style=3D"margin:0px;"><=
span style=3D"font-size: 12.0pt; mso-ascii-font-family: Calibri; mso-fareas=
t-font-family: &#39;Times New Roman&#39;; mso-hansi-font-family: Calibri; m=
so-bidi-font-family: Calibri; color: black; mso-fareast-language: EN-IN; ms=
o-bidi-language: TE;">Thanks,</span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin-bottom: 0cm; line-height: no=
rmal; background: white; vertical-align: baseline;" style=3D"margin:0px;"><=
span style=3D"font-size: 12.0pt; mso-ascii-font-family: Calibri; mso-fareas=
t-font-family: &#39;Times New Roman&#39;; mso-hansi-font-family: Calibri; m=
so-bidi-font-family: Calibri; color: black; mso-fareast-language: EN-IN; ms=
o-bidi-language: TE;">Sundeep K.</span></p>

--E7BFT78VwhE41NNgfvLR--

