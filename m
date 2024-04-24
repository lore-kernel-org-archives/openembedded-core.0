Return-Path: <lukas.palme@swarco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C45C4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 16:41:03 +0000 (UTC)
Subject: Pseudo Abort due to path mismatch #pseudo #kirkstone
To: openembedded-core@lists.openembedded.org
From: lukas.palme@swarco.com
X-Originating-Location: US (136.226.198.119)
X-Originating-Platform: Windows Firefox 125
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 24 Apr 2024 09:41:01 -0700
Message-ID: <hF7u.1713976861889896557.dNAi@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Zqu1iGxcXjmsG3sTLC79"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 16:41:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198689

--Zqu1iGxcXjmsG3sTLC79
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello openembedded community!

I hope this is the right place to ask this question, https://wiki.yoctoproj=
ect.org/wiki/Pseudo_Abort ( https://wiki.yoctoproject.org/wiki/Pseudo_Abort=
 ) brought me here.

I have a custom recipe which builds fine on the first build, but fails on s=
ubsequent builds in the do_install step:
>=20
>=20
> ERROR: Task
> (/home/swarco/WindriverLinux22/build/../layers/meta-swarco/meta-vega/reci=
pes-kernel/mymodule/mymodule.bb:do_install)
> failed with exit code '1'
> Pseudo log:
> path mismatch [3 links]: ino 78038 db
> '/home/swarco/WindriverLinux22/build/tmp-glibc/work/vegamx8-wrs-linux/mym=
odule/1.0-r0/package/usr/src/debug/mymodule/1.0-r0/mymodule_public.h'
> req
> '/home/swarco/WindriverLinux22/build/tmp-glibc/work/vegamx8-wrs-linux/mym=
odule/1.0-r0/mymodule_public.h'.
>=20
> Setup complete, sending SIGUSR1 to pid 12937.

Yocto is the only one touching the files in between builds. Also the files =
questioned do exist with the noted inode:
>=20
>=20
> swarco@SWFPERWKS065:~/WindriverLinux22$ stat
> /home/swarco/WindriverLinux22/build/tmp-glibc/work/vegamx8-wrs-linux/mymo=
dule/1.0-r0/package/usr/src/debug/mymodule/1.0-r0/mymodule_public.h
>=20
> File:
> /home/swarco/WindriverLinux22/build/tmp-glibc/work/vegamx8-wrs-linux/mymo=
dule/1.0-r0/package/usr/src/debug/mymodule/1.0-r0/mymodule_public.h
>=20
> Size: 3146=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Blocks: 8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IO Bloc=
k: 4096=C2=A0=C2=A0 regular file
> Device: 820h/2080d=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Inode: 78038=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 Links: 3
> Access: (0644/-rw-r--r--)=C2=A0 Uid: ( 1000/=C2=A0=C2=A0 swarco)=C2=A0=C2=
=A0 Gid: ( 1000/=C2=A0=C2=A0 swarco)
>=20
> Access: 2024-04-24 18:17:21.182513722 +0200
> Modify: 2024-04-24 18:16:50.402199580 +0200
> Change: 2024-04-24 18:17:19.432495797 +0200
> Birth: 2024-04-24 18:11:59.419201062 +0200

>=20
> swarco@SWFPERWKS065:~/WindriverLinux22$ stat
> /home/swarco/WindriverLinux22/build/tmp-glibc/work/vegamx8-wrs-linux/mymo=
dule/1.0-r0/mymodule_public.h
> File:
> /home/swarco/WindriverLinux22/build/tmp-glibc/work/vegamx8-wrs-linux/mymo=
dule/1.0-r0/mymodule_public.h
>=20
> Size: 3146=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Blocks: 8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IO Bloc=
k: 4096=C2=A0=C2=A0 regular file
> Device: 820h/2080d=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Inode: 78038=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 Links: 3
> Access: (0644/-rw-r--r--)=C2=A0 Uid: ( 1000/=C2=A0=C2=A0 swarco)=C2=A0=C2=
=A0 Gid: ( 1000/=C2=A0=C2=A0 swarco)
>=20
> Access: 2024-04-24 18:17:21.182513722 +0200
> Modify: 2024-04-24 18:16:50.402199580 +0200
> Change: 2024-04-24 18:17:19.432495797 +0200
> Birth: 2024-04-24 18:11:59.419201062 +0200
>=20

This is the recipe mymodule.bb:
>=20
> SUMMARY =3D "mymodule"
> DESCRIPTION =3D "Recipe for building a mymodule Linux kernel module"
> LICENSE =3D "GPL-2.0-only"
> LIC_FILES_CHKSUM =3D
> "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=3D801f80980d171dd642561083=
3a22dbe6"
>=20
>=20
> inherit module
>=20
> SRC_URI =3D "file://Makefile \
> file://mymodule_core.c \
> file://mymodule.h \
> file://mymodule_public.h \
> file://mymodule_remote_public.h \
> "
>=20
> S =3D "${WORKDIR}"
>=20
> do_install:append() {
> install -d ${D}${includedir}
> install -m 0755 ${S}/mymodule_public.h ${D}${includedir}/
> }
> # The inherit of module.bbclass will automatically name module packages
> with
> # "kernel-module-" prefix as required by the oe-core build environment.
>=20
> RPROVIDES:${PN} +=3D "kernel-module-mymodule"
> FILES:${PN}-dev +=3D "${includedir}/*"

I am doing nothing unusual here.

Additional notes to my setup:

* Host machine: Ubuntu 22.04 on WSL
* Linux kernel: linux-imx (NXP)

Does someone have an idea what is happening here? Any help is appreciated!

Kind regards,

Lukas Palme

--Zqu1iGxcXjmsG3sTLC79
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello openembedded community!<br /><br />I hope this is the right place to =
ask this question, <a href=3D"https://wiki.yoctoproject.org/wiki/Pseudo_Abo=
rt" target=3D"_blank" rel=3D"noopener">https://wiki.yoctoproject.org/wiki/P=
seudo_Abort </a>brought me here.<br /><br />I have a custom recipe which bu=
ilds fine on the first build, but fails on subsequent builds in the do_inst=
all step:
<blockquote><span style=3D"font-family: courier_newregular, courier;">ERROR=
: Task (/home/swarco/WindriverLinux22/build/../layers/meta-swarco/meta-vega=
/recipes-kernel/mymodule/mymodule.bb:do_install) failed with exit code '1'<=
br />Pseudo log:<br />path mismatch [3 links]: ino 78038 db '/home/swarco/W=
indriverLinux22/build/tmp-glibc/work/vegamx8-wrs-linux/mymodule/1.0-r0/pack=
age/usr/src/debug/mymodule/1.0-r0/mymodule_public.h' req '/home/swarco/Wind=
riverLinux22/build/tmp-glibc/work/vegamx8-wrs-linux/mymodule/1.0-r0/mymodul=
e_public.h'.<br />Setup complete, sending SIGUSR1 to pid 12937.</span></blo=
ckquote>
Yocto is the only one touching the files in between builds. Also the files =
questioned do exist with the noted inode:
<blockquote><span style=3D"font-family: courier_newregular, courier;">swarc=
o@SWFPERWKS065:~/WindriverLinux22$ stat /home/swarco/WindriverLinux22/build=
/tmp-glibc/work/vegamx8-wrs-linux/mymodule/1.0-r0/package/usr/src/debug/mym=
odule/1.0-r0/mymodule_public.h</span><br /><span style=3D"font-family: cour=
ier_newregular, courier;">&nbsp; File: /home/swarco/WindriverLinux22/build/=
tmp-glibc/work/vegamx8-wrs-linux/mymodule/1.0-r0/package/usr/src/debug/mymo=
dule/1.0-r0/mymodule_public.h</span><br /><span style=3D"font-family: couri=
er_newregular, courier;">&nbsp; Size: 3146&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Blocks: 8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; IO Block: 4096&nbsp;&nbsp; regular file</span><br />=
<span style=3D"font-family: courier_newregular, courier;">Device: 820h/2080=
d&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Inode: 78038&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; Links: 3</span><br /><span style=3D"font-family: courier_newregular, =
courier;">Access: (0644/-rw-r--r--)&nbsp; Uid: ( 1000/&nbsp;&nbsp; swarco)&=
nbsp;&nbsp; Gid: ( 1000/&nbsp;&nbsp; swarco)</span><br /><span style=3D"fon=
t-family: courier_newregular, courier;">Access: 2024-04-24 18:17:21.1825137=
22 +0200</span><br /><span style=3D"font-family: courier_newregular, courie=
r;">Modify: 2024-04-24 18:16:50.402199580 +0200</span><br /><span style=3D"=
font-family: courier_newregular, courier;">Change: 2024-04-24 18:17:19.4324=
95797 +0200</span><br /><span style=3D"font-family: courier_newregular, cou=
rier;">&nbsp;Birth: 2024-04-24 18:11:59.419201062 +0200</span></blockquote>
<blockquote><span style=3D"font-family: courier_newregular, courier;"></spa=
n><span style=3D"font-family: courier_newregular, courier;">swarco@SWFPERWK=
S065:~/WindriverLinux22$ stat /home/swarco/WindriverLinux22/build/tmp-glibc=
/work/vegamx8-wrs-linux/mymodule/1.0-r0/mymodule_public.h</span><span style=
=3D"font-family: courier_newregular, courier;">&nbsp; File: /home/swarco/Wi=
ndriverLinux22/build/tmp-glibc/work/vegamx8-wrs-linux/mymodule/1.0-r0/mymod=
ule_public.h<br />&nbsp; Size: 3146&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; Blocks: 8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; IO Block: 4096&nbsp;&nbsp; regular file<br />Device: 820h/2=
080d&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Inode: 78038&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; Links: 3<br />Access: (0644/-rw-r--r--)&nbsp; Uid: ( 1000/&nbsp;&n=
bsp; swarco)&nbsp;&nbsp; Gid: ( 1000/&nbsp;&nbsp; swarco)<br />Access: 2024=
-04-24 18:17:21.182513722 +0200<br />Modify: 2024-04-24 18:16:50.402199580 =
+0200<br />Change: 2024-04-24 18:17:19.432495797 +0200<br />&nbsp;Birth: 20=
24-04-24 18:11:59.419201062 +0200<br /></span></blockquote>
This is the recipe mymodule.bb:
<blockquote><span style=3D"font-family: courier_newregular, courier;">SUMMA=
RY =3D "mymodule"</span><br /><span style=3D"font-family: courier_newregula=
r, courier;">DESCRIPTION =3D "Recipe for building a mymodule Linux kernel m=
odule"</span><br /><span style=3D"font-family: courier_newregular, courier;=
">LICENSE =3D "GPL-2.0-only"</span><br /><span style=3D"font-family: courie=
r_newregular, courier;">LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/=
GPL-2.0-only;md5=3D801f80980d171dd6425610833a22dbe6"</span><br /><br /><spa=
n style=3D"font-family: courier_newregular, courier;">inherit module</span>=
<br /><br /><span style=3D"font-family: courier_newregular, courier;">SRC_U=
RI =3D "file://Makefile \</span><br /><span style=3D"font-family: courier_n=
ewregular, courier;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; file://mymodule_core.c \</span><br /><span style=3D"font-family: cou=
rier_newregular, courier;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; file://mymodule.h \</span><br /><span style=3D"font-family: co=
urier_newregular, courier;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; file://mymodule_public.h \</span><br /><span style=3D"font-fa=
mily: courier_newregular, courier;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; file://mymodule_remote_public.h \</span><br /><span s=
tyle=3D"font-family: courier_newregular, courier;">&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "</span><br /><br /><span style=3D"font-fami=
ly: courier_newregular, courier;">S =3D "${WORKDIR}"</span><br /><br /><spa=
n style=3D"font-family: courier_newregular, courier;">do_install:append() {=
</span><br /><span style=3D"font-family: courier_newregular, courier;">&nbs=
p;&nbsp;&nbsp; install -d ${D}${includedir}</span><br /><span style=3D"font=
-family: courier_newregular, courier;">&nbsp;&nbsp;&nbsp; install -m 0755 $=
{S}/mymodule_public.h ${D}${includedir}/</span><br /><span style=3D"font-fa=
mily: courier_newregular, courier;">}</span><br /><span style=3D"font-famil=
y: courier_newregular, courier;"># The inherit of module.bbclass will autom=
atically name module packages with</span><br /><span style=3D"font-family: =
courier_newregular, courier;"># "kernel-module-" prefix as required by the =
oe-core build environment.</span><br /><br /><span style=3D"font-family: co=
urier_newregular, courier;">RPROVIDES:${PN} +=3D "kernel-module-mymodule"</=
span><br /><span style=3D"font-family: courier_newregular, courier;">FILES:=
${PN}-dev +=3D "${includedir}/*"</span></blockquote>
I am doing nothing unusual here. <br /><br />Additional notes to my setup:
<ul>
<li>Host machine: Ubuntu 22.04 on WSL</li>
<li>Linux kernel: linux-imx (NXP)</li>
</ul>
<p>Does someone have an idea what is happening here? Any help is appreciate=
d!<br /><br />Kind regards,</p>
<p>Lukas Palme</p>

--Zqu1iGxcXjmsG3sTLC79--

