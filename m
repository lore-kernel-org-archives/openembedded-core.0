Return-Path: <charles.embedded@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB2FE7FDF3
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 22:09:00 +0000 (UTC)
Subject: Re: [PATCH] runqemu: parse QB_GRAPHICS for nographic flag
To: openembedded-core@lists.openembedded.org
From: charles.embedded@gmail.com
X-Originating-Location: =?UTF-8?B?Sm/Do28gUGVzc29hLCBQYXJhw61iYSwgQlI=?= (179.211.75.188)
X-Originating-Platform: Linux Chrome 144
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 02 Feb 2026 14:08:50 -0800
References: <20260131211111.1189479-1-charles.embedded@gmail.com> <CANNYZj82ZMXiNpFC4tihxgmcLJEJ143Jui+1KAaAXokrj-uYXw@mail.gmail.com>
In-Reply-To: <CANNYZj82ZMXiNpFC4tihxgmcLJEJ143Jui+1KAaAXokrj-uYXw@mail.gmail.com>
Message-ID: <496119.1770070130858397788@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="eEzvO4bwIX8drMs1jDGt"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 22:09:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230407

--eEzvO4bwIX8drMs1jDGt
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 2, 2026 at 12:58 PM, Alexander Kanavin wrote:

>=20
> I'm not sure specifying -nographic in a BSP layer via QB_GRAPHICS is
> correct. QB_GRAPHICS is intended for what emulated hardware should be
> present in the guest machine.
>=20
> -nographic is a host option that tells qemu what to do with the
> graphical output (in case of -nographic, discard it). I don't think
> it's up to the BSP layer to make that decision.

Hi Alex,

Thanks for the feedback.

In meta-zephyr/meta-zephyr-bsp/conf/machine/qemu-x86.conf are defined sever=
al QEMU settings that are used to generate the.qemuboot.conf file during th=
e image build (e.g. ${TMPDIR}/deploy/images/qemu-x86/zephyr-helloworld-qemu=
-x86-20260201174846.elf).

The expectation is that, based on the resulting.qemuboot.conf , running run=
qemu should be sufficient to boot Zephyr and see the console output in the =
terminal (no GUI required). However, in this case QB_GRAPHICS=3D"-nographic=
" is ignored, and the generated QEMU invocation still selects a graphical d=
isplay device, so the Zephyr output does not appear on the terminal as expe=
cted. Please see the QEMU command:

/<path-to>/usr/bin/qemu-system-i386 -nic none -object rng-random,filename=
=3D/dev/urandom,id=3Drng0 -device virtio-rng-pci,rng=3Drng0 =C2=A0 =C2=A0-m=
achine type=3Dq35 -cpu qemu32,+nx,+pae =C2=A0-m 256 -serial mon:vc -serial =
null -device virtio-vga =C2=A0-display sdl,show-cursor=3Don -nographic -mac=
hine acpi=3Doff -kernel <path-to-build> /tmp/deploy/images/qemu-x86/zephyr-=
helloworld-qemu-x86-20260201174846.elf -append ' =C2=A0mem=3D256M swiotlb=
=3D0 '

So even though -nographic is present, QEMU is still invoked with -device vi=
rtio-vga and -display sdl , and the serial is set to mon:vc.

My intent with the patch is to ensure that when QB_GRAPHICS includes -nogra=
phic , runqemu does not select a graphical display device and routes the se=
rial console to the terminal (so the Zephyr log is visible as expected).

Please let me know if I'm not on the right track. Thank you!

Charles Dias

--eEzvO4bwIX8drMs1jDGt
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Mon, Feb 2, 2026 at 12:58 PM, Alexander Kanavin wrote:</div>
<div>
<blockquote>I'm not sure specifying -nographic in a BSP layer via QB_GRAPHI=
CS is<br />correct. QB_GRAPHICS is intended for what emulated hardware shou=
ld be<br />present in the guest machine.<br /><br />-nographic is a host op=
tion that tells qemu what to do with the<br />graphical output (in case of =
-nographic, discard it). I don't think<br />it's up to the BSP layer to mak=
e that decision.</blockquote>
<div>Hi Alex,</div>
<div>&nbsp;</div>
<div>Thanks for the feedback.</div>
<div>&nbsp;</div>
<div>In <em>meta-zephyr/meta-zephyr-bsp/conf/machine/qemu-x86.conf</em>&nbs=
p; are defined several QEMU settings that are used to generate the <em>.qem=
uboot.conf</em> file during the image build (e.g. <em>${TMPDIR}/deploy/imag=
es/qemu-x86/zephyr-helloworld-qemu-x86-20260201174846.elf)</em>.</div>
<div>&nbsp;</div>
<div>The expectation is that, based on the resulting <em>.qemuboot.conf</em=
>, running <em>runqemu</em> should be sufficient to boot Zephyr and see the=
 console output in the terminal (no GUI required). However, in this case QB=
_GRAPHICS=3D"-nographic" is ignored, and the generated QEMU invocation stil=
l selects a graphical display device, so the Zephyr output does not appear =
on the terminal as expected. Please see the QEMU command:</div>
<div>&nbsp;</div>
<div>/&lt;path-to&gt;/usr/bin/qemu-system-i386 -nic none -object rng-random=
,filename=3D/dev/urandom,id=3Drng0 -device virtio-rng-pci,rng=3Drng0 &nbsp;=
 &nbsp;-machine type=3Dq35 -cpu qemu32,+nx,+pae &nbsp;-m 256 -serial mon:vc=
 -serial null -device virtio-vga &nbsp;-display sdl,show-cursor=3Don -nogra=
phic -machine acpi=3Doff -kernel <em>&lt;path-to-build&gt;</em>/tmp/deploy/=
images/qemu-x86/zephyr-helloworld-qemu-x86-20260201174846.elf -append ' &nb=
sp;mem=3D256M swiotlb=3D0 '</div>
<div>&nbsp;</div>
<div>
<div>So even though <em>-nographic</em> is present, QEMU is still invoked w=
ith <em>-device virtio-vga and -display sdl</em>, and the serial is set to =
<em>mon:vc.</em></div>
<div>&nbsp;</div>
<div>My intent with the patch is to ensure that when QB_GRAPHICS includes <=
em>-nographic</em>, <em>runqemu</em> does not select a graphical display de=
vice and routes the serial console to the terminal (so the Zephyr log is vi=
sible as expected).</div>
<div>&nbsp;</div>
<div>Please let me know if I'm not on the right track. Thank you!</div>
<div>&nbsp;</div>
<div>Charles Dias</div>
</div>
</div>

--eEzvO4bwIX8drMs1jDGt--

