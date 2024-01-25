Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38628C48285
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 22:21:56 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.1885.1706221306382992262
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jan 2024 14:21:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.236] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 40PMKc4h002216;
	Thu, 25 Jan 2024 16:20:39 -0600
Message-ID: <4b6eca03-cc54-4a38-8aa0-73eb73efb6d5@kernel.crashing.org>
Date: Thu, 25 Jan 2024 16:20:37 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/1] qemu: Allow native and nativesdk versions
 on Linux older then 4.17
Content-Language: en-US
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org, mark.hatle@amd.com
References: <1706216634-8340-1-git-send-email-mark.hatle@kernel.crashing.org>
 <1706216634-8340-2-git-send-email-mark.hatle@kernel.crashing.org>
 <CA+chaQekfBh8sXYmNE7zVABKVVhU9Z_W5iD0k7tvNJ-DhPed=Q@mail.gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <CA+chaQekfBh8sXYmNE7zVABKVVhU9Z_W5iD0k7tvNJ-DhPed=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 40PMKc4h002216
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 22:21:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194335



On 1/25/24 3:42 PM, Martin Jansa wrote:
> I did something similar for LGE when we were using 18.04 ubuntu, but II=
RC it's=20
> not about the kernel version, but glibc being older than 2.27.
>=20
> 18.04 is already unsupported for a while, I don't think oe-core should =
support=20
> unsupported host OS versions (that's why I've never send my version).
>=20
> To make this change smaller you can just=20
> revert=C2=A0c42e77a90d9244c8caf76fe0e54f84200430a4e1 from qemu.
>=20
> If oe-core really needs to support this I can share my version as in:
> https://github.com/shr-project/meta-webosose/commit/7528c20bf3ba7576d46=
11f71f987a408ac8845c2 <https://github.com/shr-project/meta-webosose/commi=
t/7528c20bf3ba7576d4611f71f987a408ac8845c2>

This version includes an actual check that the mmap returned a proper val=
ue.=20
The version here just sets the flags to avoid the compilation issue.

Using the buildtools-tarball in your build will accomplish the same end r=
esult,=20
hides the problem but doesn't verify the mmap will actually work (or erro=
r) as=20
needed.

--Mark

> Regards,
>=20
> On Thu, Jan 25, 2024 at 10:04=E2=80=AFPM Mark Hatle <mark.hatle@kernel.=
crashing.org=20
> <mailto:mark.hatle@kernel.crashing.org>> wrote:
>=20
>     From: Mark Hatle <mark.hatle@amd.com <mailto:mark.hatle@amd.com>>
>=20
>     Linux kernel 4.17 introduced two new mmap flags, MAP_FIXED_NOREPLAC=
E and
>     MAP_SHARED_VALIDATE.=C2=A0 Starting with QEMU 8.1, these flags are =
now used
>     and required for proper system operation.=C2=A0 In order to build a=
nd run on a
>     system older then 4.17, we need to emulate this new behavior.
>=20
>     Not having a newer kernel could result in the mmap memory being all=
ocated
>     in a way that will cause failures without QEMU checking for these
>     conditions.=C2=A0 Note, memory allocation issues are rare in my exp=
erience so
>     this is more of a 'just-in-case' behavior.
>=20
>     SDK_OLDEST_KERNEL is currently set to 3.2.0, the only way this can =
claim
>     that qemu works in an SDK is by checking the return values to emula=
te
>     the expected behavior.
>=20
>     Signed-off-by: Mark Hatle <mark.hatle@amd.com <mailto:mark.hatle@am=
d.com>>
>     Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org
>     <mailto:mark.hatle@kernel.crashing.org>>
>     ---
>      =C2=A0meta/recipes-devtools/qemu/qemu.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 12 +
>      =C2=A0...round-for-missing-MAP_FIXED_NOREPLAC.patch | 286 ++++++++=
++++++++++
>      =C2=A0...round-for-missing-MAP_SHARED_VALIDAT.patch |=C2=A0 51 +++=
+
>      =C2=A03 files changed, 349 insertions(+)
>      =C2=A0create mode 100644
>     meta/recipes-devtools/qemu/qemu/0011-linux-user-workaround-for-miss=
ing-MAP_FIXED_NOREPLAC.patch
>      =C2=A0create mode 100644
>     meta/recipes-devtools/qemu/qemu/0012-linux-user-workaround-for-miss=
ing-MAP_SHARED_VALIDAT.patch
>=20
>     diff --git a/meta/recipes-devtools/qemu/qemu.inc
>     b/meta/recipes-devtools/qemu/qemu.inc
>     index ccb2880402..7c31a5aa83 100644
>     --- a/meta/recipes-devtools/qemu/qemu.inc
>     +++ b/meta/recipes-devtools/qemu/qemu.inc
>     @@ -39,6 +39,18 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${=
PV}.tar.xz
>     <https://download.qemu.org/$%7BBPN%7D-$%7BPV%7D.tar.xz> \
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>      =C2=A0UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>=20
>     +# SDK_OLDEST_KERNEL is set below 4.17, which is the minimum versio=
n
>     required by QEMU >=3D 8.1
>     +# This is due to two MMAP flags being used at certain points
>     +SRC_URI:append:class-nativesdk =3D " \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0011-linux-user-workaround-for-m=
issing-MAP_FIXED_NOREPLAC.patch \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0012-linux-user-workaround-for-m=
issing-MAP_SHARED_VALIDAT.patch \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>     +
>     +# Support building and using native version on pre 4.17 kernels
>     +SRC_URI:append:class-native =3D " \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0011-linux-user-workaround-for-m=
issing-MAP_FIXED_NOREPLAC.patch \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0012-linux-user-workaround-for-m=
issing-MAP_SHARED_VALIDAT.patch \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>=20
>      =C2=A0SRC_URI[sha256sum] =3D
>     "bf00d2fa12010df8b0ade93371def58e632cb32a6bfdc5f5a0ff8e6a1fb1bf32"
>=20
>     diff --git
>     a/meta/recipes-devtools/qemu/qemu/0011-linux-user-workaround-for-mi=
ssing-MAP_FIXED_NOREPLAC.patch b/meta/recipes-devtools/qemu/qemu/0011-lin=
ux-user-workaround-for-missing-MAP_FIXED_NOREPLAC.patch
>     new file mode 100644
>     index 0000000000..8941911fb3
>     --- /dev/null
>     +++
>     b/meta/recipes-devtools/qemu/qemu/0011-linux-user-workaround-for-mi=
ssing-MAP_FIXED_NOREPLAC.patch
>     @@ -0,0 +1,286 @@
>     +From fa9bcabe2387bb230ef82d62827ad6f93b8a1e61 Mon Sep 17 00:00:00 =
2001
>     +From: Frederic Konrad <fkonrad@amd.com <mailto:fkonrad@amd.com>>
>     +Date: Wed, 17 Jan 2024 18:15:06 +0000
>     +Subject: [PATCH 1/2] linux-user/*: workaround for missing MAP_FIXE=
D_NOREPLACE
>     +
>     +QEMU v8.1.0 recently requires MAP_FIXED_NOREPLACE flags implementa=
tion for
>     mmap.
>     +
>     +This is missing from ubuntu 18.04, thus this patch catches the mma=
p calls which
>     +could use that new flag and forwards them to mmap when MAP_FIXED_N=
OREPLACE
>     +flag isn't set or emulates them by checking the returned address w=
.r.t the
>     +requested address.
>     +
>     +Signed-off-by: Frederic Konrad <fkonrad@amd.com <mailto:fkonrad@am=
d.com>>
>     +Signed-off-by: Francisco Iglesias <francisco.iglesias@amd.com
>     <mailto:francisco.iglesias@amd.com>>
>     +
>     +Upstream-Status: Inappropriate [OE specific]
>     +
>     +The upstream only supports the last two major releases of an OS.=C2=
=A0 The ones
>     +they have declared all have kernel 4.17 or newer.
>     +
>     +See:
>     +https://xilinx.slack.com/archives/D04G2647CTV/p1705074697942019
>     <https://xilinx.slack.com/archives/D04G2647CTV/p1705074697942019>
>     +
>     +https://www.qemu.org/docs/master/about/build-platforms.html
>     <https://www.qemu.org/docs/master/about/build-platforms.html>
>     +
>     + The project aims to support the most recent major version at all =
times for up
>     + to five years after its initial release. Support for the previous=
 major
>     + version will be dropped 2 years after the new major version is re=
leased or
>     + when the vendor itself drops support, whichever comes first.
>     +
>     +Signed-off-by: Mark Hatle <mark.hatle@amd.com <mailto:mark.hatle@a=
md.com>>
>     +---
>     + linux-user/elfload.c=C2=A0 =C2=A0 |=C2=A0 7 +++--
>     + linux-user/meson.build=C2=A0 |=C2=A0 1 +
>     + linux-user/mmap-fixed.c | 63 ++++++++++++++++++++++++++++++++++++=
+++++
>     + linux-user/mmap-fixed.h | 39 +++++++++++++++++++++++++
>     + linux-user/mmap.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 31 +++++++++++-----=
----
>     + linux-user/syscall.c=C2=A0 =C2=A0 |=C2=A0 1 +
>     + 6 files changed, 125 insertions(+), 17 deletions(-)
>     + create mode 100644 linux-user/mmap-fixed.c
>     + create mode 100644 linux-user/mmap-fixed.h
>     +
>     +Index: qemu-8.2.0/linux-user/elfload.c
>     +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     +--- qemu-8.2.0.orig/linux-user/elfload.c
>     ++++ qemu-8.2.0/linux-user/elfload.c
>     +@@ -22,6 +22,7 @@
>     + #include "qemu/error-report.h"
>     + #include "target_signal.h"
>     + #include "accel/tcg/debuginfo.h"
>     ++#include "mmap-fixed.h"
>     +
>     + #ifdef TARGET_ARM
>     + #include "target/arm/cpu-features.h"
>     +@@ -2765,9 +2766,9 @@ static abi_ulong create_elf_tables(abi_u
>     + static int pgb_try_mmap(uintptr_t addr, uintptr_t addr_last, bool=
 keep)
>     + {
>     +=C2=A0 =C2=A0 =C2=A0size_t size =3D addr_last - addr + 1;
>     +-=C2=A0 =C2=A0 void *p =3D mmap((void *)addr, size, PROT_NONE,
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0MAP_ANONYMOUS | MAP_PRIVATE |
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0MAP_NORESERVE | MAP_FIXED_NOREPLACE, -1, 0);
>     ++=C2=A0 =C2=A0 void *p =3D mmap_fixed_noreplace((void *)addr, size=
, PROT_NONE,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MAP_ANONYMOUS =
| MAP_PRIVATE |
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MAP_NORESERVE =
| MAP_FIXED_NOREPLACE,
>     -1, 0);
>     +=C2=A0 =C2=A0 =C2=A0int ret;
>     +
>     +=C2=A0 =C2=A0 =C2=A0if (p =3D=3D MAP_FAILED) {
>     +Index: qemu-8.2.0/linux-user/meson.build
>     +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     +--- qemu-8.2.0.orig/linux-user/meson.build
>     ++++ qemu-8.2.0/linux-user/meson.build
>     +@@ -14,6 +14,7 @@ linux_user_ss.add(files(
>     +=C2=A0 =C2=A0'linuxload.c',
>     +=C2=A0 =C2=A0'main.c',
>     +=C2=A0 =C2=A0'mmap.c',
>     ++=C2=A0 'mmap-fixed.c',
>     +=C2=A0 =C2=A0'signal.c',
>     +=C2=A0 =C2=A0'strace.c',
>     +=C2=A0 =C2=A0'syscall.c',
>     +Index: qemu-8.2.0/linux-user/mmap-fixed.c
>     +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     +--- /dev/null
>     ++++ qemu-8.2.0/linux-user/mmap-fixed.c
>     +@@ -0,0 +1,63 @@
>     ++/*
>     ++ * Workaround for MAP_FIXED_NOREPLACE
>     ++ *
>     ++ * Copyright (c) 2024, Advanced Micro Devices, Inc.
>     ++ * Developed by Fred Konrad <fkonrad@amd.com <mailto:fkonrad@amd.=
com>>
>     ++ *
>     ++ * Permission is hereby granted, free of charge, to any person ob=
taining a
>     copy
>     ++ * of this software and associated documentation files (the "Soft=
ware"),
>     to deal
>     ++ * in the Software without restriction, including without limitat=
ion the
>     rights
>     ++ * to use, copy, modify, merge, publish, distribute, sublicense, =
and/or sell
>     ++ * copies of the Software, and to permit persons to whom the Soft=
ware is
>     ++ * furnished to do so, subject to the following conditions:
>     ++ *
>     ++ * The above copyright notice and this permission notice shall be=
 included in
>     ++ * all copies or substantial portions of the Software.
>     ++ *
>     ++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND=
, EXPRESS OR
>     ++ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHA=
NTABILITY,
>     ++ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EV=
ENT SHALL
>     ++ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMA=
GES OR OTHER
>     ++ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE=
, ARISING
>     FROM,
>     ++ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER =
DEALINGS IN
>     ++ * THE SOFTWARE.
>     ++ */
>     ++
>     ++#include <sys/mman.h>
>     ++#include <errno.h>
>     ++
>     ++#ifndef MAP_FIXED_NOREPLACE
>     ++#include "mmap-fixed.h"
>     ++
>     ++void *mmap_fixed_noreplace(void *addr, size_t len, int prot, int =
flags,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int fd, off_t offset=
)
>     ++{
>     ++=C2=A0 =C2=A0 void *retaddr;
>     ++
>     ++=C2=A0 =C2=A0 if (!(flags & MAP_FIXED_NOREPLACE)) {
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* General case, use the regular mmap=
.=C2=A0 */
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return mmap(addr, len, prot, flags, f=
d, offset);
>     ++=C2=A0 =C2=A0 }
>     ++
>     ++=C2=A0 =C2=A0 /* Since MAP_FIXED_NOREPLACE is not implemented, tr=
y to emulate it.=C2=A0 */
>     ++=C2=A0 =C2=A0 flags =3D flags & ~(MAP_FIXED_NOREPLACE | MAP_FIXED=
);
>     ++=C2=A0 =C2=A0 retaddr =3D mmap(addr, len, prot, flags, fd, offset=
);
>     ++=C2=A0 =C2=A0 if ((retaddr =3D=3D addr) || (retaddr =3D=3D MAP_FA=
ILED)) {
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Either the map worked and we =
get the good address so it can be
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* returned, or it failed and wo=
uld have failed the same with
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* MAP_FIXED*, in which case ret=
urn MAP_FAILED.
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return retaddr;
>     ++=C2=A0 =C2=A0 } else {
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Page has been mapped but not =
at the requested address.. unmap
>     it and
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* return EEXIST.
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 munmap(retaddr, len);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D EEXIST;
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return MAP_FAILED;
>     ++=C2=A0 =C2=A0 }
>     ++}
>     ++
>     ++#endif
>     +Index: qemu-8.2.0/linux-user/mmap-fixed.h
>     +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     +--- /dev/null
>     ++++ qemu-8.2.0/linux-user/mmap-fixed.h
>     +@@ -0,0 +1,39 @@
>     ++/*
>     ++ * Workaround for MAP_FIXED_NOREPLACE
>     ++ *
>     ++ * Copyright (c) 2024, Advanced Micro Devices, Inc.
>     ++ * Developed by Fred Konrad <fkonrad@amd.com <mailto:fkonrad@amd.=
com>>
>     ++ *
>     ++ * Permission is hereby granted, free of charge, to any person ob=
taining a
>     copy
>     ++ * of this software and associated documentation files (the "Soft=
ware"),
>     to deal
>     ++ * in the Software without restriction, including without limitat=
ion the
>     rights
>     ++ * to use, copy, modify, merge, publish, distribute, sublicense, =
and/or sell
>     ++ * copies of the Software, and to permit persons to whom the Soft=
ware is
>     ++ * furnished to do so, subject to the following conditions:
>     ++ *
>     ++ * The above copyright notice and this permission notice shall be=
 included in
>     ++ * all copies or substantial portions of the Software.
>     ++ *
>     ++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND=
, EXPRESS OR
>     ++ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHA=
NTABILITY,
>     ++ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EV=
ENT SHALL
>     ++ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMA=
GES OR OTHER
>     ++ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE=
, ARISING
>     FROM,
>     ++ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER =
DEALINGS IN
>     ++ * THE SOFTWARE.
>     ++ */
>     ++
>     ++#ifndef MMAP_FIXED_H
>     ++#define MMAP_FIXED_H
>     ++
>     ++#ifndef MAP_FIXED_NOREPLACE
>     ++#define MAP_FIXED_NOREPLACE 0x100000
>     ++
>     ++void *mmap_fixed_noreplace(void *addr, size_t len, int prot, int =
flags,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int fd, off_t offset);
>     ++
>     ++#else /* MAP_FIXED_NOREPLACE */
>     ++#define mmap_fixed_noreplace mmap
>     ++#endif /* MAP_FIXED_NOREPLACE */
>     ++
>     ++#endif /* MMAP_FIXED_H */
>     +Index: qemu-8.2.0/linux-user/mmap.c
>     +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     +--- qemu-8.2.0.orig/linux-user/mmap.c
>     ++++ qemu-8.2.0/linux-user/mmap.c
>     +@@ -25,6 +25,7 @@
>     + #include "user-mmap.h"
>     + #include "target_mman.h"
>     + #include "qemu/interval-tree.h"
>     ++#include "mmap-fixed.h"
>     +
>     + #ifdef TARGET_ARM
>     + #include "target/arm/cpu-features.h"
>     +@@ -304,9 +305,9 @@ static bool mmap_frag(abi_ulong real_sta
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * outside of the fragment we ne=
ed to map.=C2=A0 Allocate a new host
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * page to cover, discarding wha=
tever else may have been present.
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 void *p =3D mmap(host_start, qemu_hos=
t_page_size,
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0target_to_host_prot(prot),
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0flags | MAP_ANONYMOUS, -1, 0);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 void *p =3D mmap_fixed_noreplace(host=
_start, qemu_host_page_size,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
target_to_host_prot(prot),
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
flags | MAP_ANONYMOUS, -1, 0);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (p !=3D host_start) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (p !=3D MAP_FAI=
LED) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0munm=
ap(p, qemu_host_page_size);
>     +@@ -405,8 +406,9 @@ abi_ulong mmap_find_vma(abi_ulong start,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 - mremap() with MREMAP_=
FIXED flag
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 - shmat() with SHM_REMA=
P flag
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptr =3D mmap(g2h_untagged(addr), size=
, PROT_NONE,
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0MAP_ANONYMOUS | MAP_PRIVATE | MAP_NORESERVE, -1, 0);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptr =3D mmap_fixed_noreplace(g2h_unta=
gged(addr), size, PROT_NONE,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MAP_ANONYMOUS =
| MAP_PRIVATE |
>     MAP_NORESERVE,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-1, 0);
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* ENOMEM, if host address space=
 has no memory */
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ptr =3D=3D MAP_FAILED) {
>     +@@ -600,16 +602,16 @@ abi_long target_mmap(abi_ulong start, ab
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * especially important if qemu_=
host_page_size >
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * qemu_real_host_page_size.
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D mmap(g2h_untagged(start), host_=
len, host_prot,
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fla=
gs | MAP_FIXED | MAP_ANONYMOUS, -1, 0);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D mmap_fixed_noreplace(g2h_untagg=
ed(start), host_len, host_prot,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags | MAP_FIXED | M=
AP_ANONYMOUS, -1, 0);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (p =3D=3D MAP_FAILED) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* update start so that it point=
s to the file position at 'offset' */
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host_start =3D (uintptr_t)p;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(flags & MAP_ANONYMOUS)) {
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D mmap(g2h_untagged=
(start), len, host_prot,
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0flags | MAP_FIXED, fd, host_offset);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D mmap_fixed_norepl=
ace(g2h_untagged(start), len, host_prot,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags |=
 MAP_FIXED, fd, host_offset);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (p =3D=3D MAP_F=
AILED) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0munm=
ap(g2h_untagged(start), host_len);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto=
 fail;
>     +@@ -734,8 +736,9 @@ abi_long target_mmap(abi_ulong start, ab
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len1 =3D real_last=
 - real_start + 1;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0want_p =3D g2h_unt=
agged(real_start);
>     +
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D mmap(want_p, len1=
, target_to_host_prot(target_prot),
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0flags, fd, offset1);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D mmap_fixed_norepl=
ace(want_p, len1,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_=
to_host_prot(target_prot),
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags, =
fd, offset1);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (p !=3D want_p)=
 {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (=
p !=3D MAP_FAILED) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0munmap(p, len1);
>     +@@ -837,9 +840,9 @@ static int mmap_reserve_or_unmap(abi_ulo
>     +=C2=A0 =C2=A0 =C2=A0host_start =3D g2h_untagged(real_start);
>     +
>     +=C2=A0 =C2=A0 =C2=A0if (reserved_va) {
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 void *ptr =3D mmap(host_start, real_l=
en, PROT_NONE,
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0MAP_FIXED | MAP_ANONYMOUS
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| MAP_PRIVATE | MAP_NORESERVE, -1, 0);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 void *ptr =3D mmap_fixed_noreplace(ho=
st_start, real_len, PROT_NONE,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0MAP_FIXED | MAP_ANONYMOUS
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| MAP_PRIVATE | MAP_NORESERVE,
>     -1, 0);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ptr =3D=3D host_start ? 0=
 : -1;
>     +=C2=A0 =C2=A0 =C2=A0}
>     +=C2=A0 =C2=A0 =C2=A0return munmap(host_start, real_len);
>     +Index: qemu-8.2.0/linux-user/syscall.c
>     +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     +--- qemu-8.2.0.orig/linux-user/syscall.c
>     ++++ qemu-8.2.0/linux-user/syscall.c
>     +@@ -145,6 +145,7 @@
>     + #include "qapi/error.h"
>     + #include "fd-trans.h"
>     + #include "cpu_loop-common.h"
>     ++#include "mmap-fixed.h"
>     +
>     + #ifndef CLONE_IO
>     + #define CLONE_IO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0x80000000=C2=A0 =C2=A0 =C2=A0 /* Clone io context */
>     diff --git
>     a/meta/recipes-devtools/qemu/qemu/0012-linux-user-workaround-for-mi=
ssing-MAP_SHARED_VALIDAT.patch b/meta/recipes-devtools/qemu/qemu/0012-lin=
ux-user-workaround-for-missing-MAP_SHARED_VALIDAT.patch
>     new file mode 100644
>     index 0000000000..081409f355
>     --- /dev/null
>     +++
>     b/meta/recipes-devtools/qemu/qemu/0012-linux-user-workaround-for-mi=
ssing-MAP_SHARED_VALIDAT.patch
>     @@ -0,0 +1,51 @@
>     +From 5c73e53997df800a742f9cd7355f3045861984bb Mon Sep 17 00:00:00 =
2001
>     +From: Frederic Konrad <fkonrad@amd.com <mailto:fkonrad@amd.com>>
>     +Date: Thu, 18 Jan 2024 10:43:44 +0000
>     +Subject: [PATCH 2/2] linux-user/*: workaround for missing MAP_SHAR=
ED_VALIDATE
>     +
>     +QEMU v8.1.0 recently requires MAP_SHARED_VALIDATE flags implementa=
tion for
>     mmap.
>     +
>     +This is missing from the Ubuntu 18.04 compiler but looks like to b=
e in the
>     +kernel source.
>     +
>     +Signed-off-by: Frederic Konrad <fkonrad@amd.com <mailto:fkonrad@am=
d.com>>
>     +Signed-off-by: Francisco Iglesias <francisco.iglesias@amd.com
>     <mailto:francisco.iglesias@amd.com>>
>     +
>     +Upstream-Status: Inappropriate [OE specific]
>     +
>     +The upstream only supports the last two major releases of an OS.=C2=
=A0 The ones
>     +they have declared all have kernel 4.17 or newer.
>     +
>     +See:
>     +https://xilinx.slack.com/archives/D04G2647CTV/p1705074697942019
>     <https://xilinx.slack.com/archives/D04G2647CTV/p1705074697942019>
>     +
>     +https://www.qemu.org/docs/master/about/build-platforms.html
>     <https://www.qemu.org/docs/master/about/build-platforms.html>
>     +
>     + The project aims to support the most recent major version at all =
times for up
>     + to five years after its initial release. Support for the previous=
 major
>     + version will be dropped 2 years after the new major version is re=
leased or
>     + when the vendor itself drops support, whichever comes first.
>     +
>     +Signed-off-by: Mark Hatle <mark.hatle@amd.com <mailto:mark.hatle@a=
md.com>>
>     +---
>     + linux-user/mmap-fixed.h | 4 ++++
>     + 1 file changed, 4 insertions(+)
>     +
>     +diff --git a/linux-user/mmap-fixed.h b/linux-user/mmap-fixed.h
>     +index ef6eef5114..ec86586c1f 100644
>     +--- a/linux-user/mmap-fixed.h
>     ++++ b/linux-user/mmap-fixed.h
>     +@@ -26,6 +26,10 @@
>     + #ifndef MMAP_FIXED_H
>     + #define MMAP_FIXED_H
>     +
>     ++#ifndef MAP_SHARED_VALIDATE
>     ++#define MAP_SHARED_VALIDATE 0x03
>     ++#endif
>     ++
>     + #ifndef MAP_FIXED_NOREPLACE
>     + #define MAP_FIXED_NOREPLACE 0x100000
>     +
>     +--
>     +2.34.1
>     +
>     --=20
>     2.34.1
>=20
>=20
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#194331):
>     https://lists.openembedded.org/g/openembedded-core/message/194331
>     <https://lists.openembedded.org/g/openembedded-core/message/194331>
>     Mute This Topic: https://lists.openembedded.org/mt/103962276/361715=
6
>     <https://lists.openembedded.org/mt/103962276/3617156>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe: https://lists.openembedded.org/g/openembedded-core/uns=
ub
>     <https://lists.openembedded.org/g/openembedded-core/unsub>
>     [martin.jansa@gmail.com <mailto:martin.jansa@gmail.com>]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

