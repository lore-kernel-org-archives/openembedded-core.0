Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id AD2E060125
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Aug 2015 08:39:38 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t758dbB0016821; Wed, 5 Aug 2015 03:39:38 -0500
Received: from us-aus-mail5.ni.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015080503393751-957793 ;
	Wed, 5 Aug 2015 03:39:37 -0500 
In-Reply-To: <CADkTA4PEZCM151f7Z72jcr-4H3MQqusdPr9WkO-jwUxrufPsTw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
From: "Adrian Ratiu" <adrian.ratiu@ni.com>
Message-ID: <OF2F3F95BE.08ECF07F-ONC2257E98.002DF696-C2257E98.002F92BC@ni.com>
Date: Wed, 5 Aug 2015 11:39:37 +0300
References: <1438674108-24258-1-git-send-email-adrian.ratiu@ni.com>
	<CADkTA4PEZCM151f7Z72jcr-4H3MQqusdPr9WkO-jwUxrufPsTw@mail.gmail.com>
MIME-Version: 1.0
X-KeepSent: 2F3F95BE:08ECF07F-C2257E98:002DF696;
	type=4; flags=0; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP3 November 16, 2012
X-Disclaimed: 48495
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 08/05/2015 03:39:37 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 08/05/2015 03:39:37 AM,
	Serialize complete at 08/05/2015 03:39:37 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-08-05_05:, , signatures=0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-yocto: do_configme: Add $TOOLCHAIN_OPTIONS to CFLAGS
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
X-List-Received-Date: Wed, 05 Aug 2015 08:39:42 -0000
Content-Type: multipart/alternative;
	boundary="=_alternative 002F925FC2257E98_="

--=_alternative 002F925FC2257E98_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"

Bruce Ashfield <bruce.ashfield@gmail.com> wrote on 05.08.2015 05:17:14:
=20
> On Tue, Aug 4, 2015 at 4:41 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com>=20
wrote:
> > The kernel configure step was broken by the sysroot poisoning in [1].
>=20
> Can you be more precise here ? Configuration certainly works for me ..=20
and
> has been working since last October.

This works because it was fixed in linux-yocto.inc *after* the sysroot=20
poisoning.
I've mentioned this in the next line :) But this is not what this fix is=20
for,
this fix should have been done at the same time with adding=20
$TOOLCHAIN=5FOPTIONS
to $KERNEL=5FCC in linux-yocto.inc.

This bug was missed because there is NO error reporting in=20
yocto-kernel-tools
merge=5Fconfigs.sh and the build continues despite the error. I've sent a=20
patch to
fail loudly in case merge=5Fconfigs.sh fails in yocto-kernel-tools. You kno=
w=20
about
it because you responded to that mail :) These issues are related.

> > In linux-yocto.inc this was fixed by appending $TOOLCHAIN=5FOPTIONS to
> > KERNEL=5FCC, TOOLCHAIN=5FOPTIONS containing the needed --sysroot arg.
> >
> > However, [1] also breaks the yocto configure fragment generation:
> > after parsing the fragments, when make is called on the merged file
> > to fill in any missing symbols with default values. The call chain is:
> >
> > do=5Fkernel=5Fconfigme() -> configme -> merge=5Fconfig.sh
> > -> make KCONFIG=5FALLCONFIG=3D$TMP=5FFILE
> >
> > This issue was uncaught until now because configme redirects all=20
stdout
> > and stderr to merge=5Flog.txt prior to calling merge=5Fconfigs.sh and=20
there
> > is no return value checking, so building continues and the silent=20
error
> > is ignored.
> >
> > Adding $TOOLCHAIN=5FOPTIONS to $CFLAGS before calling configme fixes=20
this.
> >
> > TODO: In a future patch this kind of error should be made loud and=20
cause
> > the build to fail.
> >
>=20
> That won't be required, I already have a queue of patches that changes
> things significantly.
>=20
> If you can elaborate on the type of breakage you were seeing, I'll add
> this to that queue.

The error I'm seeing is caused by merge=5Fconfigs.sh from yocto-kernel-tools
which calls make --alldefconfig | --allnoconfig with a poisoned sysroot.

The failure is caused by make not getting a --sysroot argument and this=20
error
fails silently because of not checking the return code in=20
yocto-kernel-tools
(again, I've sent a patch for this also, you responded to it yesterday).

The correct way to fix this IMO is to add the --sysroot ARG to the=20
environment
in kernel-yocto.bbacless do=5Fconfigme *before* calling the=20
yocto-kernel-tools,
thus the tools get called with a sane sysroot.

The exact error is this:

Partial contents of merge=5Flog.txt:
"
HOSTCC  scripts/basic/fixdep
/home/ovidiu/000/git/nilrt/build/tmp-glibc/work-shared/x64/kernel-source/sc=
ripts/basic/fixdep.c:106:23:=20
fatal error: sys/types.h: No such file or directory
 #include <sys/types.h>
                       ^
compilation terminated.
/home/ovidiu/000/git/nilrt/build/tmp-glibc/work-shared/x64/kernel-source/sc=
ripts/basic/Makefile:21:=20
recipe for target 'scripts/basic/x86=5F64-nilrt-linux-fixdep' failed
make[2]: *** [scripts/basic/x86=5F64-nilrt-linux-fixdep] Error 1
/home/ovidiu/000/git/nilrt/build/tmp-glibc/work-shared/x64/kernel-source/Ma=
kefile:428:=20
recipe for target 'scripts=5Fbasic' failed
make[1]: *** [scripts=5Fbasic] Error 2
Makefile:133: recipe for target 'sub-make' failed
make: *** [sub-make] Error 2
"




National Instruments Romania S.R.L.
------------------------------------------------------
B-dul 21 Decembrie 1989, nr. 77, A2
Cluj-Napoca 400604, Romania
C.I.F.: RO17961616  |  O.R.C.: J12/3337/2005
Telefon: +40 264 406428  |  Fax: +40 264 406429
E-mail: office.cluj@ni.com=20
Web: romania.ni.com=20
=20
Vanzari si suport tehnic:
Telefon gratuit : 0800 070071
E-mail vanzari: ni.romania@ni.com
E-mail suport tehnic: techsupport@ni.com

--=_alternative 002F925FC2257E98_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="US-ASCII"

<tt><font size=3D2>Bruce Ashfield &lt;bruce.ashfield@gmail.com&gt; wrote
on 05.08.2015 05:17:14:<br> <br>&gt; On Tue, Aug 4, 2015 at 4:41 AM, Ioan-A=
drian Ratiu &lt;adrian.ratiu@ni.com&gt;
wrote:<br>&gt; &gt; The kernel configure step was broken by the sysroot poi=
soning
in [1].<br>&gt; <br>&gt; Can you be more precise here ? Configuration certa=
inly works for me
.. and<br>&gt; has been working since last October.<br></font></tt><br><tt>=
<font size=3D2>This works because it was fixed in linux-yocto.inc
*after* the sysroot poisoning.</font></tt><br><tt><font size=3D2>I've menti=
oned this in the next line :) But this is
not what this fix is for,</font></tt><br><tt><font size=3D2>this fix should=
 have been done at the same time with
adding $TOOLCHAIN=5FOPTIONS</font></tt><br><tt><font size=3D2>to $KERNEL=5F=
CC in linux-yocto.inc.</font></tt><br><br><tt><font size=3D2>This bug was m=
issed because there is NO error reporting
in yocto-kernel-tools</font></tt><br><tt><font size=3D2>merge=5Fconfigs.sh =
and the build continues despite the
error. I've sent a patch to</font></tt><br><tt><font size=3D2>fail loudly i=
n case merge=5Fconfigs.sh fails in yocto-kernel-tools.
You know about</font></tt><br><tt><font size=3D2>it because you responded t=
o that mail :) These issues
are related.</font></tt><br><tt><font size=3D2><br>&gt; &gt; In linux-yocto=
.inc this was fixed by appending $TOOLCHAIN=5FOPTIONS
to<br>&gt; &gt; KERNEL=5FCC, TOOLCHAIN=5FOPTIONS containing the needed --sy=
sroot
arg.<br>&gt; &gt;<br>&gt; &gt; However, [1] also breaks the yocto configure=
 fragment generation:<br>&gt; &gt; after parsing the fragments, when make i=
s called on the merged
file<br>&gt; &gt; to fill in any missing symbols with default values. The c=
all
chain is:<br>&gt; &gt;<br>&gt; &gt; do=5Fkernel=5Fconfigme() -&gt; configme=
 -&gt; merge=5Fconfig.sh<br>&gt; &gt; -&gt; make KCONFIG=5FALLCONFIG=3D$TMP=
=5FFILE<br>&gt; &gt;<br>&gt; &gt; This issue was uncaught until now because=
 configme redirects
all stdout<br>&gt; &gt; and stderr to merge=5Flog.txt prior to calling merg=
e=5Fconfigs.sh
and there<br>&gt; &gt; is no return value checking, so building continues a=
nd the silent
error<br>&gt; &gt; is ignored.<br>&gt; &gt;<br>&gt; &gt; Adding $TOOLCHAIN=
=5FOPTIONS to $CFLAGS before calling configme
fixes this.<br>&gt; &gt;<br>&gt; &gt; TODO: In a future patch this kind of =
error should be made loud
and cause<br>&gt; &gt; the build to fail.<br>&gt; &gt;<br>&gt; <br>&gt; Tha=
t won't be required, I already have a queue of patches that changes<br>&gt;=
 things significantly.<br>&gt; <br>&gt; If you can elaborate on the type of=
 breakage you were seeing, I'll
add<br>&gt; this to that queue.</font></tt><br><br><tt><font size=3D2>The e=
rror I'm seeing is caused by merge=5Fconfigs.sh
from yocto-kernel-tools</font></tt><br><tt><font size=3D2>which calls make =
--alldefconfig | --allnoconfig with
a poisoned sysroot.</font></tt><br><br><tt><font size=3D2>The failure is ca=
used by make not getting a --sysroot
argument and this error</font></tt><br><tt><font size=3D2>fails silently be=
cause of not checking the return
code in yocto-kernel-tools</font></tt><br><tt><font size=3D2>(again, I've s=
ent a patch for this also, you responded
to it yesterday).</font></tt><br><br><tt><font size=3D2>The correct way to =
fix this IMO is to add the --sysroot
ARG to the environment</font></tt><br><tt><font size=3D2>in kernel-yocto.bb=
acless do=5Fconfigme *before* calling
the yocto-kernel-tools,</font></tt><br><tt><font size=3D2>thus the tools ge=
t called with a sane sysroot.</font></tt><br><br><tt><font size=3D2>The exa=
ct error is this:</font></tt><br><br><tt><font size=3D3>Partial contents of=
 merge=5Flog.txt:<br>&quot;<br>HOSTCC &nbsp;scripts/basic/fixdep<br>/home/o=
vidiu/000/git/nilrt/build/tmp-glibc/work-shared/x64/kernel-source/scripts/b=
asic/fixdep.c:106:23:
fatal error: sys/types.h: No such file or directory<br> #include &lt;sys/ty=
pes.h&gt;<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;
&nbsp; ^<br>compilation terminated.<br>/home/ovidiu/000/git/nilrt/build/tmp=
-glibc/work-shared/x64/kernel-source/scripts/basic/Makefile:21:
recipe for target 'scripts/basic/x86=5F64-nilrt-linux-fixdep' failed<br>mak=
e[2]: *** [scripts/basic/x86=5F64-nilrt-linux-fixdep] Error 1<br>/home/ovid=
iu/000/git/nilrt/build/tmp-glibc/work-shared/x64/kernel-source/Makefile:428:
recipe for target 'scripts=5Fbasic' failed<br>make[1]: *** [scripts=5Fbasic=
] Error 2<br>Makefile:133: recipe for target 'sub-make' failed<br>make: ***=
 [sub-make] Error 2<br>&quot;<br></font></tt><br><BR>
<BR>
National Instruments Romania S.R.L.<BR>
------------------------------------------------------<BR>
B-dul 21 Decembrie 1989, nr. 77, A2<BR>
Cluj-Napoca 400604, Romania<BR>
C.I.F.: RO17961616  |  O.R.C.: J12/3337/2005<BR>
Telefon: +40 264 406428  |  Fax: +40 264 406429<BR>
E-mail: office.cluj@ni.com <BR>
Web: romania.ni.com <BR>
 <BR>
Vanzari si suport tehnic:<BR>
Telefon gratuit : 0800 070071<BR>
E-mail vanzari: ni.romania@ni.com<BR>
E-mail suport tehnic: techsupport@ni.com<BR>

--=_alternative 002F925FC2257E98_=--
