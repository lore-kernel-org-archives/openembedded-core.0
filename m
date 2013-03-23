Received: from mail-ia0-f169.google.com ([209.85.210.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UJW9O-0007SS-0i
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Mar 2013 22:39:05 +0100
Received: by mail-ia0-f169.google.com with SMTP id j5so4527421iaf.14
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Mar 2013 14:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=GJi8SO9+49aZqO83ZCZkXnzaTswKXZ8PlCV1mUbJfmA=;
	b=IUcUbnkq75FamzNfP7sMyPyaoW/eG4X1QuOp0vetFFraSDQ67WjPJ4gww9hdCAHzLx
	hBowWkZrn7vGEIaKQR1VKuIpjNb6vLd/zhXZv+bBq9RBxz3xfkWiYW89yv1xigcr8+gK
	R6fx8jHMFCwNl+IhVd6M9KUtXeT98GiXZx5115MEsaa0fiFC2Et1f4BfWM9BGtQkDyD/
	U4tCjOaR4jfEoMAPv3O0JOohL7CL8PLEr9IC+WP9s6qZjlxoxuY7BiNv30uNyL6puNmq
	Xeei6ntflYn1EgJ78oa1rteX3CuZORHOxm6faA3xtz4n1UsbUP1LWOMJcdf06w2RS/MF
	H48w==
MIME-Version: 1.0
X-Received: by 10.50.188.135 with SMTP id ga7mr7809300igc.58.1364073717769;
	Sat, 23 Mar 2013 14:21:57 -0700 (PDT)
Received: by 10.50.185.134 with HTTP; Sat, 23 Mar 2013 14:21:57 -0700 (PDT)
In-Reply-To: <1364070660-13157-1-git-send-email-otavio@ossystems.com.br>
References: <1364070660-13157-1-git-send-email-otavio@ossystems.com.br>
Date: Sat, 23 Mar 2013 14:21:57 -0700
Message-ID: <CAMKF1spK6DrofoT3wXMbF=JOU+qWRJvE7vukNsdaFjEnS0XDnA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] linux-firmware: Use the included Makefile for install
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 23 Mar 2013 21:39:06 -0000
Content-Type: multipart/alternative; boundary=14dae9340b1365496904d89e29f8

--14dae9340b1365496904d89e29f8
Content-Type: text/plain; charset=UTF-8

On Saturday, March 23, 2013, Otavio Salvador <otavio@ossystems.com.br>
wrote:
> This uses the install procedure included in the Makefile which avoids
> code dupplication.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  .../linux-firmware/linux-firmware/makefile-fix.patch  | 19
+++++++++++++++++++
>  .../linux-firmware/linux-firmware_git.bb              |  6 +++---
>  2 files changed, 22 insertions(+), 3 deletions(-)
>  create mode 100644
meta/recipes-kernel/linux-firmware/linux-firmware/makefile-fix.patch
>
> diff --git
a/meta/recipes-kernel/linux-firmware/linux-firmware/makefile-fix.patch
b/meta/recipes-kernel/linux-firmware/linux-firmware/makefile-fix.patch
> new file mode 100644
> index 0000000..8a23284
> --- /dev/null
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware/makefile-fix.patch
> @@ -0,0 +1,19 @@
> +build: Avoid use of bashism and Makefile deployment
> +
> +Upstream-Status: Submitted
> +
> +Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> +
> +diff --git a/Makefile b/Makefile
> +index 321a4e2..9bdeef0 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -9,4 +9,7 @@ install:
> +       mkdir -p $(DESTDIR)$(FIRMWAREDIR)
> +       cp -r * $(DESTDIR)$(FIRMWAREDIR)
> +       rm -f $(DESTDIR)/usbdux/*dux $(DESTDIR)/*/*.asm
> +-      rm $(DESTDIR)$(FIRMWAREDIR)/{WHENCE,LICENSE.*,LICENCE.*}
> ++      rm $(DESTDIR)$(FIRMWAREDIR)/Makefile
> ++      rm $(DESTDIR)$(FIRMWAREDIR)/WHENCE
> ++      rm $(DESTDIR)$(FIRMWAREDIR)/LICENSE.*
> ++      rm $(DESTDIR)$(FIRMWAREDIR)/LICENCE.*

Can you explain this change ?

> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bbb/meta/recipes-kernel/linux-firmware/
linux-firmware_git.bb
> index b9e00fc..6842738 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> @@ -24,7 +24,8 @@ SRCREV = "c530a75c1e6a472b0eb9558310b518f0dfcd8860"
>  PE = "1"
>  PV = "0.0+git${SRCPV}"
>
> -SRC_URI = "git://
git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git;protocol=git
"
> +SRC_URI = "git://
git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git;protocol=git\
> +           file://makefile-fix.patch"
>
>  S = "${WORKDIR}/git"
>
> @@ -35,8 +36,7 @@ do_compile() {
>  }
>
>  do_install() {
> -       install -d  ${D}/lib/firmware/
> -       cp -r * ${D}/lib/firmware/
> +       oe_runmake install DESTDIR=${D}
>
>         # Libertas sd8686
>         ln -sf libertas/sd8686_v9.bin ${D}/lib/firmware/sd8686.bin
> --
> 1.8.1
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--14dae9340b1365496904d89e29f8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Saturday, March 23, 2013, Otavio Salvador &lt;<a href=3D"mailto:=
otavio@ossystems.com.br">otavio@ossystems.com.br</a>&gt; wrote:<br>&gt; Thi=
s uses the install procedure included in the Makefile which avoids<br>&gt; =
code dupplication.<br>
&gt;<br>&gt; Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@os=
systems.com.br">otavio@ossystems.com.br</a>&gt;<br>&gt; ---<br>&gt; =C2=A0.=
../linux-firmware/linux-firmware/makefile-fix.patch =C2=A0| 19 ++++++++++++=
+++++++<br>
&gt; =C2=A0.../linux-firmware/<a href=3D"http://linux-firmware_git.bb">linu=
x-firmware_git.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A06 +++---<br>&gt; =C2=A02 files changed, 22 insertions(+), 3 deletions(-)=
<br>&gt; =C2=A0create mode 100644 meta/recipes-kernel/linux-firmware/linux-=
firmware/makefile-fix.patch<br>
&gt;<br>&gt; diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware=
/makefile-fix.patch b/meta/recipes-kernel/linux-firmware/linux-firmware/mak=
efile-fix.patch<br>&gt; new file mode 100644<br>&gt; index 0000000..8a23284=
<br>
&gt; --- /dev/null<br>&gt; +++ b/meta/recipes-kernel/linux-firmware/linux-f=
irmware/makefile-fix.patch<br>&gt; @@ -0,0 +1,19 @@<br>&gt; +build: Avoid u=
se of bashism and Makefile deployment<br>&gt; +<br>&gt; +Upstream-Status: S=
ubmitted<br>
&gt; +<br>&gt; +Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio=
@ossystems.com.br">otavio@ossystems.com.br</a>&gt;<br>&gt; +<br>&gt; +diff =
--git a/Makefile b/Makefile<br>&gt; +index 321a4e2..9bdeef0 100644<br>&gt; =
+--- a/Makefile<br>
&gt; ++++ b/Makefile<br>&gt; +@@ -9,4 +9,7 @@ install:<br>&gt; + =C2=A0 =C2=
=A0 =C2=A0 mkdir -p $(DESTDIR)$(FIRMWAREDIR)<br>&gt; + =C2=A0 =C2=A0 =C2=A0=
 cp -r * $(DESTDIR)$(FIRMWAREDIR)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 rm -f $(DE=
STDIR)/usbdux/*dux $(DESTDIR)/*/*.asm<br>
&gt; +- =C2=A0 =C2=A0 =C2=A0rm $(DESTDIR)$(FIRMWAREDIR)/{WHENCE,LICENSE.*,L=
ICENCE.*}<br>&gt; ++ =C2=A0 =C2=A0 =C2=A0rm $(DESTDIR)$(FIRMWAREDIR)/Makefi=
le<br>&gt; ++ =C2=A0 =C2=A0 =C2=A0rm $(DESTDIR)$(FIRMWAREDIR)/WHENCE<br>&gt=
; ++ =C2=A0 =C2=A0 =C2=A0rm $(DESTDIR)$(FIRMWAREDIR)/LICENSE.*<br>
&gt; ++ =C2=A0 =C2=A0 =C2=A0rm $(DESTDIR)$(FIRMWAREDIR)/LICENCE.*<br><br>Ca=
n you explain this change ?<br><br>&gt; diff --git a/meta/recipes-kernel/li=
nux-firmware/<a href=3D"http://linux-firmware_git.bb">linux-firmware_git.bb=
</a> b/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmware_=
git.bb">linux-firmware_git.bb</a><br>
&gt; index b9e00fc..6842738 100644<br>&gt; --- a/meta/recipes-kernel/linux-=
firmware/<a href=3D"http://linux-firmware_git.bb">linux-firmware_git.bb</a>=
<br>&gt; +++ b/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-f=
irmware_git.bb">linux-firmware_git.bb</a><br>
&gt; @@ -24,7 +24,8 @@ SRCREV =3D &quot;c530a75c1e6a472b0eb9558310b518f0dfc=
d8860&quot;<br>&gt; =C2=A0PE =3D &quot;1&quot;<br>&gt; =C2=A0PV =3D &quot;0=
.0+git${SRCPV}&quot;<br>&gt;<br>&gt; -SRC_URI =3D &quot;git://<a href=3D"ht=
tp://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git;pr=
otocol=3Dgit">git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmwa=
re.git;protocol=3Dgit</a>&quot;<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://git.kernel.org/pub/scm/linu=
x/kernel/git/firmware/linux-firmware.git;protocol=3Dgit">git.kernel.org/pub=
/scm/linux/kernel/git/firmware/linux-firmware.git;protocol=3Dgit</a> \<br>&=
gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://makefile-fix.patch&quot;<br=
>
&gt;<br>&gt; =C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>&gt;<br>&gt; @@ -35,=
8 +36,7 @@ do_compile() {<br>&gt; =C2=A0}<br>&gt;<br>&gt; =C2=A0do_install(=
) {<br>&gt; - =C2=A0 =C2=A0 =C2=A0 install -d =C2=A0${D}/lib/firmware/<br>&=
gt; - =C2=A0 =C2=A0 =C2=A0 cp -r * ${D}/lib/firmware/<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 oe_runmake install DESTDIR=3D${D}<br>&gt;<br>&g=
t; =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Libertas sd8686<br>&gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ln -sf libertas/sd8686_v9.bin ${D}/lib/firmware/sd8686.bin<br>&g=
t; --<br>&gt; 1.8.1<br>&gt;<br>&gt;<br>&gt; _______________________________=
________________<br>
&gt; Openembedded-core mailing list<br>&gt; <a href=3D"mailto:Openembedded-=
core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><b=
r>&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/opene=
mbedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembed=
ded-core</a><br>
&gt;

--14dae9340b1365496904d89e29f8--
