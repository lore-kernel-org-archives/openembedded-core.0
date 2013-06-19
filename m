Return-Path: <bruce.kumita@gmail.com>
Received: from mail-qe0-f51.google.com (mail-qe0-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 37F5660810
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 09:02:46 +0000 (UTC)
Received: by mail-qe0-f51.google.com with SMTP id a11so3132965qen.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 02:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=hpmN9tGtwTgll100WrLVJgpehVb0h4ZwB06IlekSRx8=;
	b=sOry192aklvJRESCu2ZSTtXaXcKtncHYYAclb3rXKLw9hnv7P7BpEcdG5F3pdgQC0i
	mqBlnP2SUf0BiJv9WsAPkVdLb7gwRd+9L/xUm/+UeE5xZ/YvHcWhbNbx2jZs86PDqdMs
	mCNjgEpO0ORxjkZ/cppWVV+OkoHXkrMR4d7ne289LSefO9wrwlbdJDEQ9Yl3MU73Pgt0
	c4bvgLsX9q9h6dWiZEAG3BueAEwlIyYgNPYQ5AgngYkDhPANt42c8Dsyeu7B33IcF6AW
	TmPLK8nUAuzF5XZQojAZwsiw69goHu8WVWtcrh3b4URFgyyEApgmLX4hgMQyPfzoIuaZ
	lQSQ==
MIME-Version: 1.0
X-Received: by 10.224.11.6 with SMTP id r6mr2660323qar.65.1371632566813; Wed,
	19 Jun 2013 02:02:46 -0700 (PDT)
Received: by 10.229.13.105 with HTTP; Wed, 19 Jun 2013 02:02:46 -0700 (PDT)
Date: Wed, 19 Jun 2013 17:02:46 +0800
Message-ID: <CALaXJ9nQCTk==sDA2UySBBwRd_g_gqvO0F=_r7gK14gQE-rKwQ@mail.gmail.com>
From: Kumita Bruce <bruce.kumita@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Issue of Yocto multilib sdk
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Jun 2013 09:02:46 -0000
Content-Type: multipart/alternative; boundary=001a11c2cc98e848a904df7e1725

--001a11c2cc98e848a904df7e1725
Content-Type: text/plain; charset=ISO-8859-1

Hi experts,

I use Yocto to generate multilib sdk, I append following content in my
local.conf.
    require conf/multilib.conf
    MULTILIBS = "multilib:lib64"
    DEFAULTTUNE_virtclass-multilib-lib64 = "x86-64"

    IMAGE_INSTALL_append = " \
        ${@multilib_pkg_extend(d, "binutils")} \
        ${@multilib_pkg_extend(d, "eglibc")} \
        ${@multilib_pkg_extend(d, "eglibc-dev")} \
        ${@multilib_pkg_extend(d, "eglibc-staticdev")} \
        ${@multilib_pkg_extend(d, "gcc")} \
        ${@multilib_pkg_extend(d, "glib-2.0")} \
        ${@multilib_pkg_extend(d, "glib-2.0-dev")} \
        ${@multilib_pkg_extend(d, "libgcc-dev")} \
        ${@multilib_pkg_extend(d, "libstdc++")} \
        ${@multilib_pkg_extend(d, "libstdc++-dev")} \
        ${@multilib_pkg_extend(d, "libstdc++-staticdev")} \
    "

The sdk is generated successfully, I
installed poky-eglibc-x86_64-i586-toolchain-gmae-1.4+snapshot-20130619.sh
in the default path(/opt/poky/1.4+snapshot/).
1. 32bit build for my test C program, it passed,
    $ source /opt/poky/1.4+snapshot/environment-setup-i586-poky-linux
    $ $CC mytest.c -o mytest.c
2. 64bit build for the same test C program, it failed.
    $
source /opt/poky/1.4+snapshot/environment-setup-x86_64-pokymllib64-linux
    $ $CC mytest.c -o mytest
/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld:
cannot find crtbegin.o: No such file or directory
/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld:
cannot find -lgcc
/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld:
skipping incompatible
/opt/poky/1.4+snapshot/sysroots/i586-poky-linux/lib/libgcc_s.so when
searching for -lgcc_s
/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld:
skipping incompatible
/opt/poky/1.4+snapshot/sysroots/i586-poky-linux/lib/libgcc_s.so when
searching for -lgcc_s
/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld:
cannot find -lgcc_s
/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld:
skipping incompatible
/opt/poky/1.4+snapshot/sysroots/i586-poky-linux/usr/lib/libc.so when
searching for -lc
/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld:
skipping incompatible
/opt/poky/1.4+snapshot/sysroots/i586-poky-linux/usr/lib/libc.so when
searching for -lc
/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld:
cannot find -lc
/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld:
cannot find -lgcc
/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld:
skipping incompatible
/opt/poky/1.4+snapshot/sysroots/i586-poky-linux/lib/libgcc_s.so when
searching for -lgcc_s
/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld:
skipping incompatible
/opt/poky/1.4+snapshot/sysroots/i586-poky-linux/lib/libgcc_s.so when
searching for -lgcc_s
/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld:
cannot find -lgcc_s
/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld:
cannot find crtend.o: No such file or directory
collect2: error: ld returned 1 exit status

Am I missing something?


Cheers,

Bruce

--001a11c2cc98e848a904df7e1725
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style>Hi experts,=A0</div><div style><br></div><div s=
tyle>I use Yocto to generate multilib sdk, I append following content in my=
 local.conf.=A0</div><div><div>=A0 =A0 require conf/multilib.conf</div><div=
>=A0 =A0 MULTILIBS =3D &quot;multilib:lib64&quot;</div>
<div>=A0 =A0 DEFAULTTUNE_virtclass-multilib-lib64 =3D &quot;x86-64&quot;</d=
iv><div><br></div><div>=A0 =A0 IMAGE_INSTALL_append =3D &quot; \</div><div>=
=A0 =A0 =A0 =A0 ${@multilib_pkg_extend(d, &quot;binutils&quot;)} \<br></div=
><div><div>=A0 =A0 =A0 =A0 ${@multilib_pkg_extend(d, &quot;eglibc&quot;)} \=
<br>
</div><div>=A0 =A0 =A0 =A0 ${@multilib_pkg_extend(d, &quot;eglibc-dev&quot;=
)} \</div><div>=A0 =A0 =A0 =A0 ${@multilib_pkg_extend(d, &quot;eglibc-stati=
cdev&quot;)} \</div></div><div>=A0 =A0 =A0 =A0 ${@multilib_pkg_extend(d, &q=
uot;gcc&quot;)} \</div>
<div><div>=A0 =A0 =A0 =A0 ${@multilib_pkg_extend(d, &quot;glib-2.0&quot;)} =
\</div><div>=A0 =A0 =A0 =A0 ${@multilib_pkg_extend(d, &quot;glib-2.0-dev&qu=
ot;)} \</div></div><div>=A0 =A0 =A0 =A0 ${@multilib_pkg_extend(d, &quot;lib=
gcc-dev&quot;)} \</div>
<div>=A0 =A0 =A0 =A0 ${@multilib_pkg_extend(d, &quot;libstdc++&quot;)} \<br=
></div><div>=A0 =A0 =A0 =A0 ${@multilib_pkg_extend(d, &quot;libstdc++-dev&q=
uot;)} \</div><div>=A0 =A0 =A0 =A0 ${@multilib_pkg_extend(d, &quot;libstdc+=
+-staticdev&quot;)} \</div>
<div>=A0 =A0 &quot;<br></div><div><br></div></div><div style>The sdk is gen=
erated successfully, I installed=A0poky-eglibc-x86_64-i586-toolchain-gmae-1=
.4+snapshot-20130619.sh in the default path(/opt/poky/1.4+snapshot/).=A0</d=
iv><div style>
1. 32bit build for my test C program, it passed,</div><div style>=A0 =A0 $ =
source=A0/opt/poky/1.4+snapshot/environment-setup-i586-poky-linux</div><div=
 style>=A0 =A0 $=A0$CC mytest.c -o mytest.c</div><div style>2. 64bit build =
for the same test C program, it failed.</div>
<div style>=A0 =A0 $ source=A0/opt/poky/1.4+snapshot/environment-setup-x86_=
64-pokymllib64-linux</div><div style>=A0 =A0 $ $CC mytest.c -o mytest</div>=
<div>/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_6=
4-pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: cannot find crtb=
egin.o: No such file or directory</div>
<div>/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_6=
4-pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: cannot find -lgc=
c</div><div>/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexe=
c/x86_64-pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: skipping =
incompatible /opt/poky/1.4+snapshot/sysroots/i586-poky-linux/lib/libgcc_s.s=
o when searching for -lgcc_s</div>
<div>/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_6=
4-pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: skipping incompa=
tible /opt/poky/1.4+snapshot/sysroots/i586-poky-linux/lib/libgcc_s.so when =
searching for -lgcc_s</div>
<div>/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_6=
4-pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: cannot find -lgc=
c_s</div><div>/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libe=
xec/x86_64-pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: skippin=
g incompatible /opt/poky/1.4+snapshot/sysroots/i586-poky-linux/usr/lib/libc=
.so when searching for -lc</div>
<div>/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_6=
4-pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: skipping incompa=
tible /opt/poky/1.4+snapshot/sysroots/i586-poky-linux/usr/lib/libc.so when =
searching for -lc</div>
<div>/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_6=
4-pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: cannot find -lc<=
/div><div>/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/=
x86_64-pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: cannot find=
 -lgcc</div>
<div>/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_6=
4-pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: skipping incompa=
tible /opt/poky/1.4+snapshot/sysroots/i586-poky-linux/lib/libgcc_s.so when =
searching for -lgcc_s</div>
<div>/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_6=
4-pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: skipping incompa=
tible /opt/poky/1.4+snapshot/sysroots/i586-poky-linux/lib/libgcc_s.so when =
searching for -lgcc_s</div>
<div>/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_6=
4-pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: cannot find -lgc=
c_s</div><div>/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libe=
xec/x86_64-pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: cannot =
find crtend.o: No such file or directory</div>
<div>collect2: error: ld returned 1 exit status</div><div><br></div><div st=
yle>Am I missing something?=A0</div><div style><br></div><div><br></div><di=
v style>Cheers,=A0</div><div style><br></div><div style>Bruce</div></div>

--001a11c2cc98e848a904df7e1725--
