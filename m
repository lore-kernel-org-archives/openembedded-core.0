Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 481A1C83F11
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 06:20:27 +0000 (UTC)
Subject: Re: [kirkstone][PATCH] Qemu: Resolve undefined reference issue in CVE-2023-2861
To: openembedded-core@lists.openembedded.org
From: "Siddharth" <sdoshi@mvista.com>
X-Originating-Location: Ahmedabad, Gujarat, IN (157.32.94.184)
X-Originating-Platform: Linux Chrome 116
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 27 Aug 2023 23:20:21 -0700
References: <CAOSpxdb486X1AMdNaerZKxdf7Dwi4JgZ8P--GYoKGsQLn1D-2Q@mail.gmail.com>
In-Reply-To: <CAOSpxdb486X1AMdNaerZKxdf7Dwi4JgZ8P--GYoKGsQLn1D-2Q@mail.gmail.com>
Message-ID: <14699.1693203621642809477@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="BvVDR0NytnS9nSoLUj6J"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 06:20:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186816

--BvVDR0NytnS9nSoLUj6J
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve,

Please find the detailed error log:
{{{
| [629/6213] Compiling C object libqemuutil.a.p/stubs_win32-kbd-hook.c.o
| [630/6213] Compiling C object libqemuutil.a.p/stubs_replay-tools.c.o
| [631/6213] Compiling C object fsdev/virtfs-proxy-helper.p/9p-marshal.c.o
| [632/6213] Compiling C object libqemuutil.a.p/stubs_xen-hw-stub.c.o
| [633/6213] Compiling C object fsdev/virtfs-proxy-helper.p/9p-iov-marshal.=
c.o
| [634/6213] Linking static target libqemuutil.a
| [635/6213] Compiling C object tests/qtest/libqos/libqos.fa.p/qos_external=
.c.o
| [636/6213] Compiling C object tests/qtest/libqos/libqos.fa.p/fw_cfg.c.o
| [637/6213] Compiling C object tests/qtest/libqos/libqos.fa.p/pci.c.o
| [638/6213] Compiling C object tests/qtest/libqos/libqos.fa.p/qgraph.c.o
| [639/6213] Compiling C object fsdev/virtfs-proxy-helper.p/virtfs-proxy-he=
lper.c.o
| In file included from ../qemu-6.2.0/fsdev/virtfs-proxy-helper.c:29:
| /home/siddharth/tmp/work/../qemu/6.2.0-r0/qemu-6.2.0/hw/9pfs/9p-util.h: I=
n function 'close_if_special_file':
| /home/siddharth/tmp/work/../qemu/6.2.0-r0/qemu-6.2.0/hw/9pfs/9p-util.h:46=
:9: warning: implicit declaration of function 'qemu_fstat' [-Wimplicit-func=
tion-declaration]
|=C2=A0 =C2=A0 46 |=C2=A0 =C2=A0 =C2=A0if (qemu_fstat(fd, &stbuf) < 0) {
|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~
| /home/siddharth/tmp/work/../qemu/6.2.0-r0/qemu-6.2.0/hw/9pfs/9p-util.h:46=
:9: warning: nested extern declaration of 'qemu_fstat' [-Wnested-externs]
| [640/6213] Compiling C object tests/qtest/libqos/libqos.fa.p/malloc-pc.c.=
o
| [641/6213] Linking target fsdev/virtfs-proxy-helper
| FAILED: fsdev/virtfs-proxy-helper
}}}

>=20
> The fix patch mentions that the issue leads to "undefined symbol error
> on certain architectures", but doesn't identify which architectures speci=
fically.
>=20
>=20

- I am facing this on x86_64 and riscv architectures. Atleast these are the=
 two which i tried on and got the same error.
- Logically looking at the code, it should ideally fail on any machine it i=
s compiled on regardless of the architecture as the wrapper "qemu_fstat" is=
 not defined anywhere in the code and is called.
- However, since i had not tested on all architectures, i couldn't tell abo=
ut all the architectures.
- It definately made me confuse more since it had passed autobuilder test, =
so i explicitly mentioned in certain architectures and not fails everywhere=
.

- Just building qemu with `PACKAGECONFIG:append =3D " libusb virtfs" ` is e=
nough to re-produce the error. Atleast that's what i am building it with.

--BvVDR0NytnS9nSoLUj6J
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve,<br /><br />Please find the detailed error log:<br />{{{<br />
<div style=3D"line-height: 1.42857;">| [629/6213] Compiling C object libqem=
uutil.a.p/stubs_win32-kbd-hook.c.o</div>
<div style=3D"line-height: 1.42857;">| [630/6213] Compiling C object libqem=
uutil.a.p/stubs_replay-tools.c.o</div>
<div style=3D"line-height: 1.42857;">| [631/6213] Compiling C object fsdev/=
virtfs-proxy-helper.p/9p-marshal.c.o</div>
<div style=3D"line-height: 1.42857;">| [632/6213] Compiling C object libqem=
uutil.a.p/stubs_xen-hw-stub.c.o</div>
<div style=3D"line-height: 1.42857;">| [633/6213] Compiling C object fsdev/=
virtfs-proxy-helper.p/9p-iov-marshal.c.o</div>
<div style=3D"line-height: 1.42857;">| [634/6213] Linking static target lib=
qemuutil.a</div>
<div style=3D"line-height: 1.42857;">| [635/6213] Compiling C object tests/=
qtest/libqos/libqos.fa.p/qos_external.c.o</div>
<div style=3D"line-height: 1.42857;">| [636/6213] Compiling C object tests/=
qtest/libqos/libqos.fa.p/fw_cfg.c.o</div>
<div style=3D"line-height: 1.42857;">| [637/6213] Compiling C object tests/=
qtest/libqos/libqos.fa.p/pci.c.o</div>
<div style=3D"line-height: 1.42857;">| [638/6213] Compiling C object tests/=
qtest/libqos/libqos.fa.p/qgraph.c.o</div>
<div style=3D"line-height: 1.42857;">| [639/6213] Compiling C object fsdev/=
virtfs-proxy-helper.p/virtfs-proxy-helper.c.o</div>
<div style=3D"line-height: 1.42857;">| In file included from ../qemu-6.2.0/=
fsdev/virtfs-proxy-helper.c:29:</div>
<div style=3D"line-height: 1.42857;">| /home/siddharth/tmp/work/../qemu/6.2=
.0-r0/qemu-6.2.0/hw/9pfs/9p-util.h: In function 'close_if_special_file':</d=
iv>
<div style=3D"line-height: 1.42857;">| /home/siddharth/tmp/work/../qemu/6.2=
.0-r0/qemu-6.2.0/hw/9pfs/9p-util.h:46:9: warning: implicit declaration of f=
unction 'qemu_fstat' [-Wimplicit-function-declaration]</div>
<div style=3D"line-height: 1.42857;">|&nbsp; &nbsp; 46 |&nbsp; &nbsp; &nbsp=
;if (qemu_fstat(fd, &amp;stbuf) &lt; 0) {</div>
<div style=3D"line-height: 1.42857;">|&nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;^~~~~~~~~~</div>
<div style=3D"line-height: 1.42857;">| /home/siddharth/tmp/work/../qemu/6.2=
.0-r0/qemu-6.2.0/hw/9pfs/9p-util.h:46:9: warning: nested extern declaration=
 of 'qemu_fstat' [-Wnested-externs]</div>
<div style=3D"line-height: 1.42857;">| [640/6213] Compiling C object tests/=
qtest/libqos/libqos.fa.p/malloc-pc.c.o</div>
<div style=3D"line-height: 1.42857;">| [641/6213] Linking target fsdev/virt=
fs-proxy-helper</div>
<div style=3D"line-height: 1.42857;">| FAILED: fsdev/virtfs-proxy-helper<br=
 />}}}<br /><br /></div>
<div style=3D"line-height: 1.42857;">
<blockquote>
<div style=3D"line-height: 1.42857;"><span style=3D"white-space-collapse: p=
reserve;">The fix patch mentions that the issue leads to "undefined symbol =
error</span></div>
<span style=3D"white-space-collapse: preserve;">on certain architectures", =
but doesn't identify which architectures </span><span style=3D"white-space-=
collapse: preserve;">specifically.<br /></span></blockquote>
- I am facing this on x86_64 and riscv architectures. Atleast these are the=
 two which i tried on and got the same error.<br />- Logically looking at t=
he code, it should ideally fail on any machine it is compiled on regardless=
 of the architecture as the wrapper "qemu_fstat" is not defined anywhere in=
 the code and is called.<br />- However, since i had not tested on all arch=
itectures, i couldn't tell about all the architectures.<br />- It definatel=
y made me confuse more since it had passed autobuilder test, so i explicitl=
y mentioned in certain architectures and not fails everywhere.<br /><br />-=
 Just building qemu with <span style=3D"color: #222222; font-family: Arial,=
 Helvetica, sans-serif; font-size: small;">`PACKAGECONFIG:append =3D " libu=
sb virtfs"</span><span style=3D"color: #222222; font-family: Arial, Helveti=
ca, sans-serif; font-size: small;">`&nbsp;</span>is enough to re-produce th=
e error. Atleast that's what i am building it with.&nbsp;</div>

--BvVDR0NytnS9nSoLUj6J--

