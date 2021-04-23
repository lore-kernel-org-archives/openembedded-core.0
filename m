Subject: Need suggestions: in case where linux-lib-headers and the kernel versions differ
To: openembedded-core@lists.openembedded.org
From: "Sourabh Banerjee" <sbanerje@codeaurora.org>
X-Originating-Location: Bengaluru, Karnataka, IN (122.172.123.151)
X-Originating-Platform: Windows Chrome 89
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 23 Apr 2021 08:03:08 -0700
Message-ID: <Gvtb.1619190188941654950.yc90@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="GS4eNPU63CHgb6TTVG6w"

--GS4eNPU63CHgb6TTVG6w
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi All,
I need your suggestion on how to reconcile if the linux-libc-headers and k=
ernel versions are different?
For this discussion let's consider we are using the LTS branch YP-3.1 (Dun=
fell).
With Dunfell let's consider following 3 cases:

1) Machine is supported on 5.4 kernel
*Kernel Recipe:* linux-yocto_5.4.bb
*libc-headers:* meta/recipes-kernel/linux-libc-headers/linux-libc-headers_=
5.4.bb
There is no conflict in this case as libc-headers and linux-yocto are on s=
ame version.

2) Machine is supported on a higher kernel (let's say 5.10)
*Kernel Recipe:* Let's assume provided by a BSP layer, linux_5.10.bb
*libc-headers:* meta/recipes-kernel/linux-libc-headers/linux-libc-headers_=
5.4.bb
The kernel version is higher in this case. But, should be okay as 5.10 UAP=
I is backward compatible and supports=C2=A0 linux-libc-headers_5.4=C2=A0com=
pletely.

3) Machine is supported on a lower kernel (let's say 4.19)
Kernel Recipe: Let's assume provided by a BSP layer, linux_4.19.bb
libc-headers: meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.=
4.bb
The kernel version is lower in this case. I suppose, this may lead to some=
 runtime issues? As the kernel built from 4.19 will not be able to support =
5.4 UAPI fully.
What's the recommendation here? Should the BSP provider port linux-libc-he=
ader_4.19.bb in BSP layer and set=C2=A0PREFERRED_VERSION_linux-libc-headers=
 =3D "4.19%"

I suspect this as UAPI headers such as following differ, and what if this =
leads to runtime issues in case #3
-=C2=A0 videodev2.h: This header is enhanced in 5.4
-=C2=A0 fsverity.h : this header is not present in 4.19

--
Regards,
Sourabh

--GS4eNPU63CHgb6TTVG6w
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi All,<br />I need your suggestion on how to reconcile if the linux-libc-h=
eaders and kernel versions are different?<br />For this discussion let's co=
nsider we are using the LTS branch YP-3.1 (Dunfell). <br />With Dunfell let=
's consider following 3 cases:<br /><br />1) Machine is supported on 5.4 ke=
rnel<br />&nbsp; &nbsp; <strong>Kernel Recipe:</strong>&nbsp;linux-yocto_5.=
4.bb<br />&nbsp; &nbsp; <strong>libc-headers:</strong>&nbsp;meta/recipes-ke=
rnel/linux-libc-headers/linux-libc-headers_5.4.bb<br />&nbsp; &nbsp; There =
is no conflict in this case as libc-headers and linux-yocto are on same ver=
sion.<br /><br />2) Machine is supported on a higher kernel (let's say 5.10=
)<br />&nbsp; &nbsp; <strong>Kernel Recipe:</strong> Let's assume provided =
by a BSP layer, linux_5.10.bb<br />&nbsp; &nbsp; <strong>libc-headers:</str=
ong>&nbsp;meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb<=
br />&nbsp; &nbsp; The kernel version is higher in this case. But, should b=
e okay as 5.10 UAPI is backward compatible and supports&nbsp; linux-libc-he=
aders_5.4&nbsp;completely.<br /><br />3) Machine is supported on a lower ke=
rnel (let's say 4.19)<br />&nbsp; &nbsp;&nbsp;<span style=3D"font-weight: b=
old;">Kernel Recipe:</span>&nbsp;Let's assume provided by a BSP layer, linu=
x_4.19.bb<br />&nbsp; &nbsp;&nbsp;<span style=3D"font-weight: bold;">libc-h=
eaders:</span>&nbsp;meta/recipes-kernel/linux-libc-headers/linux-libc-heade=
rs_5.4.bb<br />&nbsp; &nbsp; The kernel version is lower in this case. I su=
ppose, this may lead to some runtime issues? As the kernel built from 4.19 =
will not be able to support 5.4 UAPI fully.<br />&nbsp; &nbsp; What's the r=
ecommendation here? Should the BSP provider port linux-libc-header_4.19.bb =
in BSP layer and set&nbsp;PREFERRED_VERSION_linux-libc-headers =3D "4.19%"<=
br /><br />&nbsp; &nbsp; I suspect this as UAPI headers such as following d=
iffer, and what if this leads to runtime issues in case #3<br />&nbsp; &nbs=
p; &nbsp; -&nbsp; videodev2.h: This header is enhanced in 5.4&nbsp;<br />&n=
bsp; &nbsp; &nbsp; -&nbsp; fsverity.h : this header is not present in 4.19<=
br /><br />-- <br />Regards,<br />Sourabh

--GS4eNPU63CHgb6TTVG6w--
