Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 113FDC4332F
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 00:09:26 +0000 (UTC)
Subject: Re: [PATCH] llvm: fix native llvm-config RUNPATH
To: openembedded-core@lists.openembedded.org
From: "Vincent Davis Jr" <vince@underview.tech>
X-Originating-Location: Richmond, Texas, US (99.113.4.128)
X-Originating-Platform: Linux Firefox 106
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 13 Nov 2022 16:09:16 -0800
References: <CANNYZj_Gt0eou9UeCiq=kZ1dCVJoPqgqEzV0o6O4CvHyrJC4Ag@mail.gmail.com>
In-Reply-To: <CANNYZj_Gt0eou9UeCiq=kZ1dCVJoPqgqEzV0o6O4CvHyrJC4Ag@mail.gmail.com>
Message-ID: <17985.1668384556897417838@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="8UTjWY1Wcod0C34fhLGp"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 00:09:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173214

--8UTjWY1Wcod0C34fhLGp
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

O I see usr/lib directory does exists for me in recipe-sysroot-native too, =
but not in recipe-sysroot.
Think mesa configure may be utilizing the version of llvm-config in recipe-=
sysroot and
not recipe-sysroot-native.

mesa/2_22.2.2-r0/mesa-22.2.2# ldd ../recipe-sysroot-native/usr/bin/llvm-con=
fig
linux-vdso.so.1 (0x00007ffe7b5cb000)
libpseudo.so =3D> /../../../../../../../tmp/sysroots-components/x86_64/pseu=
do-native/usr/lib/pseudo/lib64/libpseudo.so (0x00007f4d138ed000)
libtinfo.so.5 =3D> /../../../../../../../tmp/work/amd64-northstar-linux/mes=
a/2_22.2.2-r0/mesa-22.2.2/../recipe-sysroot-native/usr/bin/../lib/libtinfo.=
so.5 (0x00007f4d138bd000)
libstdc++.so.6 =3D> /lib/x86_64-linux-gnu/libstdc++.so.6 (0x00007f4d1367d00=
0)
libm.so.6 =3D> /lib/x86_64-linux-gnu/libm.so.6 (0x00007f4d13594000)
libgcc_s.so.1 =3D> /lib/x86_64-linux-gnu/libgcc_s.so.1 (0x00007f4d13574000)
libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so.6 (0x00007f4d1334c000)
libdl.so.2 =3D> /lib/x86_64-linux-gnu/libdl.so.2 (0x00007f4d13347000)
libpthread.so.0 =3D> /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007f4d13342=
000)
/../../../../../../../tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-=
64.so.2 =3D> /lib64/ld-linux-x86-64.so.2 (0x00007f4d13994000)

mesa/2_22.2.2-r0/mesa-22.2.2# ldd ../recipe-sysroot/usr/bin/llvm-config
linux-vdso.so.1 (0x00007ffc5bc95000)
libpseudo.so =3D> /../../../../../../../tmp/sysroots-components/x86_64/pseu=
do-native/usr/lib/pseudo/lib64/libpseudo.so (0x00007f1c6c02b000)
libtinfo.so.5 =3D> /../../../../../../../tmp/work/amd64-northstar-linux/mes=
a/2_22.2.2-r0/mesa-22.2.2/../recipe-sysroot/usr/bin/../../lib64/libtinfo.so=
.5 (0x00007f1c6bffb000)
libstdc++.so.6 =3D> /../../../../../../../tmp/work/amd64-northstar-linux/me=
sa/2_22.2.2-r0/mesa-22.2.2/../recipe-sysroot/usr/bin/../lib64/libstdc++.so.=
6 (0x00007f1c6bdd7000)
libm.so.6 =3D> /../../../../../../../tmp/work/amd64-northstar-linux/mesa/2_=
22.2.2-r0/mesa-22.2.2/../recipe-sysroot/usr/bin/../../lib64/libm.so.6 (0x00=
007f1c6bcfb000)
libgcc_s.so.1 =3D> /../../../../../../../tmp/work/amd64-northstar-linux/mes=
a/2_22.2.2-r0/mesa-22.2.2/../recipe-sysroot/usr/bin/../../lib64/libgcc_s.so=
.1 (0x00007f1c6bcdb000)
libc.so.6 =3D> /../../../../../../../tmp/work/amd64-northstar-linux/mesa/2_=
22.2.2-r0/mesa-22.2.2/../recipe-sysroot/usr/bin/../../lib64/libc.so.6 (0x00=
007f1c6bafd000)
libdl.so.2 =3D> /lib/x86_64-linux-gnu/libdl.so.2 (0x00007f1c6bae2000)
libpthread.so.0 =3D> /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007f1c6badb=
000)
/../../../../../../../tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-=
64.so.2 =3D> /lib64/ld-linux-x86-64.so.2 (0x00007f1c6c0d2000)

../mesa/2_22.2.2-r0/mesa-22.2.2# which llvm-config
/../../../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/recip=
e-sysroot/usr/bin/crossscripts/llvm-config

../mesa/2_22.2.2-r0/mesa-22.2.2# llvm-config --version
15.0.1

../mesa/2_22.2.2-r0/mesa-22.2.2# llvm-config --libdir
/../../../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/recip=
e-sysroot/usr/lib64

../mesa/2_22.2.2-r0/mesa-22.2.2# ls /../../../../../../../mesa/2_22.2.2-r0/=
recipe-sysroot/usr/
bin=C2=A0 include=C2=A0 lib64=C2=A0 share

***************************************************************************=
**************************************************

../mesa/2_22.2.2-r0/mesa-22.2.2# ../recipe-sysroot-native/usr/bin/llvm-conf=
ig --version
15.0.1

../mesa/2_22.2.2-r0/mesa-22.2.2# ../recipe-sysroot-native/usr/bin/llvm-conf=
ig --libdir
/../../../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/recip=
e-sysroot-native/usr/lib64

../mesa/2_22.2.2-r0/mesa-22.2.2# ls /../../../../../../../tmp/work/amd64-no=
rthstar-linux/mesa/2_22.2.2-r0/recipe-sysroot-native/usr/
bin=C2=A0 include=C2=A0 lib=C2=A0 libexec=C2=A0 sbin=C2=A0 share

My apologies mesa configure utilizes the bin in recipe-sysroot not recipe-s=
ysroot-native.

--8UTjWY1Wcod0C34fhLGp
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

O I see usr/lib directory does exists for me in recipe-sysroot-native too, =
but not in recipe-sysroot.<br />Think mesa configure may be utilizing the v=
ersion of llvm-config in recipe-sysroot and<br />not recipe-sysroot-native.=
<br /><br />mesa/2_22.2.2-r0/mesa-22.2.2# ldd ../recipe-sysroot-native/usr/=
bin/llvm-config<br />&nbsp;&nbsp; &nbsp;linux-vdso.so.1 (0x00007ffe7b5cb000=
)<br />&nbsp;&nbsp; &nbsp;libpseudo.so =3D&gt; /../../../../../../../tmp/sy=
sroots-components/x86_64/pseudo-native/usr/lib/pseudo/lib64/libpseudo.so (0=
x00007f4d138ed000)<br />&nbsp;&nbsp; &nbsp;libtinfo.so.5 =3D&gt; /../../../=
../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/mesa-22.2.2/../=
recipe-sysroot-native/usr/bin/../lib/libtinfo.so.5 (0x00007f4d138bd000)<br =
/>&nbsp;&nbsp; &nbsp;libstdc++.so.6 =3D&gt; /lib/x86_64-linux-gnu/libstdc++=
.so.6 (0x00007f4d1367d000)<br />&nbsp;&nbsp; &nbsp;libm.so.6 =3D&gt; /lib/x=
86_64-linux-gnu/libm.so.6 (0x00007f4d13594000)<br />&nbsp;&nbsp; &nbsp;libg=
cc_s.so.1 =3D&gt; /lib/x86_64-linux-gnu/libgcc_s.so.1 (0x00007f4d13574000)<=
br />&nbsp;&nbsp; &nbsp;libc.so.6 =3D&gt; /lib/x86_64-linux-gnu/libc.so.6 (=
0x00007f4d1334c000)<br />&nbsp;&nbsp; &nbsp;libdl.so.2 =3D&gt; /lib/x86_64-=
linux-gnu/libdl.so.2 (0x00007f4d13347000)<br />&nbsp;&nbsp; &nbsp;libpthrea=
d.so.0 =3D&gt; /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007f4d13342000)<b=
r />&nbsp;&nbsp;&nbsp; /../../../../../../../tmp/sysroots-uninative/x86_64-=
linux/lib/ld-linux-x86-64.so.2 =3D&gt; /lib64/ld-linux-x86-64.so.2 (0x00007=
f4d13994000)<br /><br /><br />mesa/2_22.2.2-r0/mesa-22.2.2# ldd ../recipe-s=
ysroot/usr/bin/llvm-config<br />&nbsp;&nbsp; &nbsp;linux-vdso.so.1 (0x00007=
ffc5bc95000)<br />&nbsp;&nbsp; &nbsp;libpseudo.so =3D&gt; /../../../../../.=
./../tmp/sysroots-components/x86_64/pseudo-native/usr/lib/pseudo/lib64/libp=
seudo.so (0x00007f1c6c02b000)<br />&nbsp;&nbsp; &nbsp;libtinfo.so.5 =3D&gt;=
 /../../../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/mesa=
-22.2.2/../recipe-sysroot/usr/bin/../../lib64/libtinfo.so.5 (0x00007f1c6bff=
b000)<br />&nbsp;&nbsp; &nbsp;libstdc++.so.6 =3D&gt; /../../../../../../../=
tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/mesa-22.2.2/../recipe-sysro=
ot/usr/bin/../lib64/libstdc++.so.6 (0x00007f1c6bdd7000)<br />&nbsp;&nbsp; &=
nbsp;libm.so.6 =3D&gt; /../../../../../../../tmp/work/amd64-northstar-linux=
/mesa/2_22.2.2-r0/mesa-22.2.2/../recipe-sysroot/usr/bin/../../lib64/libm.so=
.6 (0x00007f1c6bcfb000)<br />&nbsp;&nbsp; &nbsp;libgcc_s.so.1 =3D&gt; /../.=
./../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/mesa-22.2.=
2/../recipe-sysroot/usr/bin/../../lib64/libgcc_s.so.1 (0x00007f1c6bcdb000)<=
br />&nbsp;&nbsp; &nbsp;libc.so.6 =3D&gt; /../../../../../../../tmp/work/am=
d64-northstar-linux/mesa/2_22.2.2-r0/mesa-22.2.2/../recipe-sysroot/usr/bin/=
../../lib64/libc.so.6 (0x00007f1c6bafd000)<br />&nbsp;&nbsp; &nbsp;libdl.so=
.2 =3D&gt; /lib/x86_64-linux-gnu/libdl.so.2 (0x00007f1c6bae2000)<br />&nbsp=
;&nbsp; &nbsp;libpthread.so.0 =3D&gt; /lib/x86_64-linux-gnu/libpthread.so.0=
 (0x00007f1c6badb000)<br />&nbsp;&nbsp; /../../../../../../../tmp/sysroots-=
uninative/x86_64-linux/lib/ld-linux-x86-64.so.2 =3D&gt; /lib64/ld-linux-x86=
-64.so.2 (0x00007f1c6c0d2000)<br /><br /><br />../mesa/2_22.2.2-r0/mesa-22.=
2.2# which llvm-config<br />/../../../../../../../tmp/work/amd64-northstar-=
linux/mesa/2_22.2.2-r0/recipe-sysroot/usr/bin/crossscripts/llvm-config<br /=
><br />../mesa/2_22.2.2-r0/mesa-22.2.2# llvm-config --version<br />&nbsp;15=
.0.1<br /><br />../mesa/2_22.2.2-r0/mesa-22.2.2# llvm-config --libdir<br />=
/../../../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/recip=
e-sysroot/usr/lib64<br /><br />../mesa/2_22.2.2-r0/mesa-22.2.2# ls /../../.=
./../../../../mesa/2_22.2.2-r0/recipe-sysroot/usr/<br />bin&nbsp; include&n=
bsp; lib64&nbsp; share<br /><br />*****************************************=
***************************************************************************=
*********<br /><br />../mesa/2_22.2.2-r0/mesa-22.2.2# ../recipe-sysroot-nat=
ive/usr/bin/llvm-config --version<br />15.0.1<br /><br />../mesa/2_22.2.2-r=
0/mesa-22.2.2# ../recipe-sysroot-native/usr/bin/llvm-config --libdir<br />/=
../../../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/recipe=
-sysroot-native/usr/lib64<br /><br />../mesa/2_22.2.2-r0/mesa-22.2.2# ls /.=
./../../../../../../tmp/work/amd64-northstar-linux/mesa/2_22.2.2-r0/recipe-=
sysroot-native/usr/<br />bin&nbsp; include&nbsp; lib&nbsp; libexec&nbsp; sb=
in&nbsp; share<br /><br />My apologies mesa configure utilizes the bin in r=
ecipe-sysroot not recipe-sysroot-native.

--8UTjWY1Wcod0C34fhLGp--

