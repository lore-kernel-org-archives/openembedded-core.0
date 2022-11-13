Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B542AC4332F
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 19:17:07 +0000 (UTC)
Subject: Re: [PATCH] llvm: fix native llvm-config RUNPATH
To: openembedded-core@lists.openembedded.org
From: "Vincent Davis Jr" <vince@underview.tech>
X-Originating-Location: Richmond, Texas, US (99.113.4.128)
X-Originating-Platform: Linux Firefox 106
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 13 Nov 2022 11:17:04 -0800
References: <CANNYZj_hMQeMh-Rp-fJ=nezRUcwaOk3mMpX4iKSxAEia7tmZeg@mail.gmail.com>
In-Reply-To: <CANNYZj_hMQeMh-Rp-fJ=nezRUcwaOk3mMpX4iKSxAEia7tmZeg@mail.gmail.com>
Message-ID: <3205.1668367024981923542@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="6T7QP8fQaII0u8nE4ZwT"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 19:17:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173209

--6T7QP8fQaII0u8nE4ZwT
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hey,

Desired outcome is for mesa meson configure to succeeded by updating
RUNPATH on llvm-config native binary required by mesa when gallium-llvm
included. When running bitbake -c devshell mesa. Then chrpath -l on llvm-co=
nfig

Should return on TARGET_ARCH x86_64
$ORIGIN/../lib64:$ORIGIN/../../lib64
not
$ORIGIN/../lib:$ORIGIN/../../lib

SNAPSHOT OF FAILURE
***************************************************************************=
**********************************************
File "/../../../mesa/<version>/recipe-sysroot-native/usr/lib/python3.11/re/=
__init__.py", line 223, in finditer
return _compile(pattern, flags).finditer(string)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
TypeError: expected string or bytes-like object, got 'NoneType'
***************************************************************************=
**********************************************

Reason for above failure, at least for me, when TARGET_ARCH =3D x86_64 you =
run into
bellow when running llvm-config --help or variant commands directly.

llvm-config: error while loading shared libraries: libtinfo.so.5: cannot op=
en shared object file: No such file or directory

Because of that when mesa configure executes llvm-config --version the stri=
ng is not returned. Thus, leading
to above error.

If you run chrpath -l on llvm-config you see

$ORIGIN/../lib:$ORIGIN/../../lib:::::::::::::::::::::::::::::::::::::::::::=
::::::::::::::::::::::::::::::::::

When target architecture is x86_64 those folders don't exists in recipe-sys=
root of a recipe that requires llvm-native.

The llvm_sysroot_preprocess_native function in current MR addresses that pr=
oblem by
making RUNPATH target architecture dependent.

As to why RUNPATH includes both the original RUNPATH and the update target =
architecture
dependent directory name the llvm recipe requires the llvm-native llvm-conf=
ig binary to
compile, but the build libs are stored in lib directory not lib64. Tried ev=
erything I could
think of change that not much can be done about that. When llvm-native gets=
 included
in another recipe however libs are located at $ORIGIN/../lib64:$ORIGIN/../.=
./lib64, at least
for TARGET ARCH x86_64.

As for the second problem llvm-config --libdir returns

/../../../../../../mesa/2_22.2.2-r0/recipe-sysroot/usr/lib

instead of

/../../../../../../mesa/2_22.2.2-r0/recipe-sysroot/usr/lib64

Which causes mesa configure to fail as ../../mesa/2_22.2.2-r0/recipe-sysroo=
t/usr/lib doesn't exist.

According to https://github.com/llvm/llvm-project/blob/a11cd0d94ed3cabf0998=
a0289aead05da94c86eb/llvm/CMakeLists.txt#L399
and https://github.com/llvm/llvm-project/blob/a11cd0d94ed3cabf0998a0289aead=
05da94c86eb/llvm/CMakeLists.txt#L389

LLVM_LIBDIR_SUFFIX variable is used to set command. MR addresses that by se=
tting the LLVM_LIBDIR_SUFFIX
variable. The reason I decided to use HOST_ARCH instead of TARGET_ARCH is b=
ecause bitbake sets
HOST_ARCH =3D "${TARGET_ARCH}" in bitbake.conf, but I'll admit there's igno=
rance on my part in terms
of what I think that variable is set to and what class-native it used for.

:)

--6T7QP8fQaII0u8nE4ZwT
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hey,<br /><br />Desired outcome is for mesa meson configure to succeeded by=
 updating<br />RUNPATH on llvm-config native binary required by mesa when g=
allium-llvm<br />included. When running bitbake -c devshell mesa. Then chrp=
ath -l on llvm-config<br /><br />Should return on TARGET_ARCH x86_64<br />$=
ORIGIN/../lib64:$ORIGIN/../../lib64<br />not <br />$ORIGIN/../lib:$ORIGIN/.=
./../lib<br /><br />SNAPSHOT OF FAILURE<br />******************************=
***************************************************************************=
****************<br />File "/../../../mesa/&lt;version&gt;/recipe-sysroot-n=
ative/usr/lib/python3.11/re/__init__.py", line 223, in finditer<br />return=
 _compile(pattern, flags).finditer(string)<br />^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^<br />TypeError: expected string or bytes-like object, got 'N=
oneType'<br />*************************************************************=
************************************************************<br /><br />Rea=
son for above failure, at least for me, when TARGET_ARCH =3D x86_64 you run=
 into<br />bellow when running llvm-config --help or variant commands direc=
tly.<br /><br />llvm-config: error while loading shared libraries: libtinfo=
.so.5: cannot open shared object file: No such file or directory<br /><br /=
>Because of that when mesa configure executes llvm-config --version the str=
ing is not returned. Thus, leading<br />to above error.<br /><br />If you r=
un chrpath -l on llvm-config you see<br /><br />$ORIGIN/../lib:$ORIGIN/../.=
./lib::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::=
:::::::<br /><br />When target architecture is x86_64 those folders don't e=
xists in recipe-sysroot of a recipe that requires llvm-native.<br /><br />T=
he llvm_sysroot_preprocess_native function in current MR addresses that pro=
blem by<br />making RUNPATH target architecture dependent.<br /><br />As to=
 why RUNPATH includes both the original RUNPATH and the update target archi=
tecture<br />dependent directory name the llvm recipe requires the llvm-nat=
ive llvm-config binary to<br />compile, but the build libs are stored in li=
b directory not lib64. Tried everything I could<br />think of change that n=
ot much can be done about that. When llvm-native gets included<br />in anot=
her recipe however libs are located at $ORIGIN/../lib64:$ORIGIN/../../lib64=
, at least<br />for TARGET ARCH x86_64.<br /><br />As for the second proble=
m llvm-config --libdir returns<br /><br />/../../../../../../mesa/2_22.2.2-=
r0/recipe-sysroot/usr/lib<br /><br />instead of<br /><br />/../../../../../=
../mesa/2_22.2.2-r0/recipe-sysroot/usr/lib64<br /><br />Which causes mesa c=
onfigure to fail as ../../mesa/2_22.2.2-r0/recipe-sysroot/usr/lib doesn't e=
xist.<br /><br />According to <a href=3D"https://github.com/llvm/llvm-proje=
ct/blob/a11cd0d94ed3cabf0998a0289aead05da94c86eb/llvm/CMakeLists.txt#L399" =
target=3D"_blank" rel=3D"noopener">https://github.com/llvm/llvm-project/blo=
b/a11cd0d94ed3cabf0998a0289aead05da94c86eb/llvm/CMakeLists.txt#L399</a><br =
/>and <a href=3D"https://github.com/llvm/llvm-project/blob/a11cd0d94ed3cabf=
0998a0289aead05da94c86eb/llvm/CMakeLists.txt#L389" target=3D"_blank" rel=3D=
"noopener">https://github.com/llvm/llvm-project/blob/a11cd0d94ed3cabf0998a0=
289aead05da94c86eb/llvm/CMakeLists.txt#L389</a><br /><span class=3D"pl-smi"=
><br />LLVM_LIBDIR_SUFFIX variable is used to set </span>command. MR addres=
ses that by setting the <span class=3D"pl-smi">LLVM_LIBDIR_SUFFIX<br />vari=
able. The reason I decided to use HOST_ARCH instead of TARGET_ARCH is becau=
se bitbake sets<br />HOST_ARCH =3D "${TARGET_ARCH}" in bitbake.conf, but I'=
ll admit there's ignorance on my part in terms<br />of what I think that va=
riable is set to and what class-native it used for.<br /><br />:)<br /></sp=
an>
<div id=3D":pf" class=3D"a3s aiL "><wbr /></div>

--6T7QP8fQaII0u8nE4ZwT--

