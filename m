Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5F2676CBB4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2014 20:58:02 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id p9so6781510lbv.20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Feb 2014 12:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=1AVIT0IgXyNHufhx8juTFMwAVuF4NXpmEyoGYHQcmlY=;
	b=EkohcFg4Lnttj74GQDZgrj3w24o49Cqi20jDzGN2I0wFtvy78bU+HIDPcNDX0BTPMO
	YyC2DAfN+CjxeQsvMUPSN8R/FlXUGkmigKY9J1fV010UF3iUHOMFDQuKtRISTi4kelkC
	EJYqLtpw1/6D3GCxyaIzGQDVdc3ofy8RbpvSirk/NjJVb2e4dMzPE+7eIZzdEv+shNlg
	rIukPoPKLnW2fGJpmSlbLoY75RNy+CGFHV+CKvd2VsE5Tqui86sgAwu1Q2Uyt8TnJvJE
	M1aJAuGwqoXiS1bYRqZmTpG+c0R47JRgOgWXTsaHTq/CidHtojs98nx1CPrDAYU23JAX
	+Vtw==
MIME-Version: 1.0
X-Received: by 10.112.131.100 with SMTP id ol4mr7126271lbb.38.1391547482238;
	Tue, 04 Feb 2014 12:58:02 -0800 (PST)
Received: by 10.112.145.6 with HTTP; Tue, 4 Feb 2014 12:58:02 -0800 (PST)
Date: Tue, 4 Feb 2014 21:58:02 +0100
Message-ID: <CAPbeDCnW5vdTHK2os11UdsOPrAcXv_3eqCepTe_ND_TTkq2hSw@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Busybox menuconfig on host without ncurse development package
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
X-List-Received-Date: Tue, 04 Feb 2014 20:58:03 -0000
Content-Type: multipart/alternative; boundary=047d7b3441b45df15604f19ae594

--047d7b3441b45df15604f19ae594
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I ran into this problem since I didn't happen to have ncurses development
package installed on my host at the time. "bitbake -c menuconfig busybox"
and "make menuconfig" in a busybox devshell fails:

make -f scripts/Makefile.build obj=scripts/kconfig/lxdialog
  gcc -Wp,-MD,scripts/kconfig/lxdialog/.checklist.o.d  -Wall
-Wstrict-prototypes -O2 -fomit-frame-pointer   -DCURSES_LOC="<curses.h>"
-DLOCALE    -c -o scripts/kconfig/lxdialog/checklist.o
scripts/kconfig/lxdialog/checklist.c
In file included from scripts/kconfig/lxdialog/checklist.c:24:0:
scripts/kconfig/lxdialog/dialog.h:31:20: fatal error: curses.h: No such
file or directory
 #include CURSES_LOC
                    ^
compilation terminated.

The following change fixes the problem on my system:

--- busybox-1.22.1.orig/scripts/kconfig/lxdialog/Makefile
+++ busybox-1.22.1/scripts/kconfig/lxdialog/Makefile
@@ -5,8 +5,8 @@ check-lxdialog  := $(srctree)/$(src)/che

 # Use reursively expanded variables so we do not call gcc unless
 # we really need to do so. (Do not call gcc as part of make mrproper)
-HOST_EXTRACFLAGS = $(shell $(CONFIG_SHELL) $(check-lxdialog) -ccflags)
-HOST_LOADLIBES   = $(shell $(CONFIG_SHELL) $(check-lxdialog) -ldflags
$(HOSTCC))
+HOST_EXTRACFLAGS += $(shell $(CONFIG_SHELL) $(check-lxdialog) -ccflags)
+HOST_LOADLIBES   += $(shell $(CONFIG_SHELL) $(check-lxdialog) -ldflags
$(HOSTCC))

But I'm no kconfig expert.. anyway, anyone have any comments on this ?

"make menuconfig" for the linux kernel works as expected.

  -- Jacob

--047d7b3441b45df15604f19ae594
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi,<br><br>I ran into this problem since I didn&=
#39;t happen to have ncurses development package installed on my host at th=
e time. &quot;bitbake -c menuconfig busybox&quot; and &quot;make menuconfig=
&quot; in a busybox devshell fails:<br>
<br>make -f scripts/Makefile.build obj=3Dscripts/kconfig/lxdialog<br>=A0 gc=
c -Wp,-MD,scripts/kconfig/lxdialog/.checklist.o.d=A0 -Wall -Wstrict-prototy=
pes -O2 -fomit-frame-pointer=A0=A0 -DCURSES_LOC=3D&quot;&lt;curses.h&gt;&qu=
ot; -DLOCALE=A0=A0=A0 -c -o scripts/kconfig/lxdialog/checklist.o scripts/kc=
onfig/lxdialog/checklist.c<br>
In file included from scripts/kconfig/lxdialog/checklist.c:24:0:<br>scripts=
/kconfig/lxdialog/dialog.h:31:20: fatal error: curses.h: No such file or di=
rectory<br>=A0#include CURSES_LOC<br>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 ^<br>compilation terminated.<br>
<br></div><div>The following change fixes the problem on my system:<br><br>=
--- busybox-1.22.1.orig/scripts/kconfig/lxdialog/Makefile<br>+++ busybox-1.=
22.1/scripts/kconfig/lxdialog/Makefile<br>@@ -5,8 +5,8 @@ check-lxdialog=A0=
 :=3D $(srctree)/$(src)/che<br>
=A0<br>=A0# Use reursively expanded variables so we do not call gcc unless<=
br>=A0# we really need to do so. (Do not call gcc as part of make mrproper)=
<br>-HOST_EXTRACFLAGS =3D $(shell $(CONFIG_SHELL) $(check-lxdialog) -ccflag=
s)<br>
-HOST_LOADLIBES=A0=A0 =3D $(shell $(CONFIG_SHELL) $(check-lxdialog) -ldflag=
s $(HOSTCC))<br>+HOST_EXTRACFLAGS +=3D $(shell $(CONFIG_SHELL) $(check-lxdi=
alog) -ccflags)<br>+HOST_LOADLIBES=A0=A0 +=3D $(shell $(CONFIG_SHELL) $(che=
ck-lxdialog) -ldflags $(HOSTCC))<br>
<br></div>But I&#39;m no kconfig expert.. anyway, anyone have any comments =
on this ?<br><br></div>&quot;make menuconfig&quot; for the linux kernel wor=
ks as expected.<br><br><div><div><div>=A0 -- Jacob
</div></div></div></div>

--047d7b3441b45df15604f19ae594--
