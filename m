Return-Path: <jurobystricky@hotmail.com>
Received: from BAY004-OMC1S12.hotmail.com (bay004-omc1s12.hotmail.com
	[65.54.190.23])
	by mail.openembedded.org (Postfix) with ESMTP id 911BC72015
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Dec 2014 14:25:45 +0000 (UTC)
Received: from BAY179-W7 ([65.54.190.60]) by BAY004-OMC1S12.hotmail.com over
	TLS secured channel with Microsoft SMTPSVC(7.5.7601.22751); 
	Sun, 14 Dec 2014 06:25:45 -0800
X-TMN: [km5EvhneKyvi26XaA65V36wg0qoGtKa9]
X-Originating-Email: [jurobystricky@hotmail.com]
Message-ID: <BAY179-W73C7837C99907817B0A3BBB6E0@phx.gbl>
From: Juro Bystricky <jurobystricky@hotmail.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Sun, 14 Dec 2014 06:25:44 -0800
Importance: Normal
In-Reply-To: <387ED5C5-E7F1-47EF-8BC9-0D90656BB085@gmail.com>
References: <BAY179-W94EE5F805A59DEBDCC4035BB650@phx.gbl>,
	<387ED5C5-E7F1-47EF-8BC9-0D90656BB085@gmail.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 14 Dec 2014 14:25:45.0058 (UTC)
	FILETIME=[D8F4D420:01D017A9]
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Problems running glibc test suite...
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
X-List-Received-Date: Sun, 14 Dec 2014 14:25:46 -0000
Content-Type: multipart/alternative;
	boundary="_fb48a379-c364-4d92-9032-51028921a1ba_"

--_fb48a379-c364-4d92-9032-51028921a1ba_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I filed a bug report=20
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7081

I also proposed a fix. The fix is quite safe=2C it does not affect glibc bu=
ild=2C
only modifies the testing script glibc-testing.inc. =20
Incidentally=2C I believe there is a tiny bug in glibc-testing.inc:

fgrep tcbootstrap ${B}/config.make > ${B}/configparms

should be=20

fgrep tcbootstrap ${B}/config.make >> ${B}/configparms

Otherwise the just entered comments in configparms get immediately wiped-ou=
t.

Juro
Subject: Re: [OE-core] Problems running glibc test suite...
From: raj.khem@gmail.com
Date: Tue=2C 9 Dec 2014 09:39:55 -0800
CC: openembedded-core@lists.openembedded.org
To: jurobystricky@hotmail.com


On Dec 9=2C 2014=2C at 9:08 AM=2C Juro Bystricky <jurobystricky@hotmail.com=
> wrote:I tried to run the glibc test suite and encountered various problem=
s.
I build glibc as a part of core-image-minimal with libgcc and libstdc++=2C=
=20
both additional libraries are needed by the glibc test suite.

By far most tests run just fine=2C but there are several tests that fail
to build at all. The offenders are:

/elf/tst-unique3cc
/elf/tst-unique4cc=20
/elf/tst-unique3lib.cc=20
/elf/tst-unique3lib2.cc.=20

They all fail with an error:

 fatal error: cstdio: No such file or directory
 #include <cstdio>

The obvious reason is that the c++ header files were not found by the g++.
g++ was invoked with -nostdinc flag=2C and in that case the path to system =
include
files must be specified explicitly.

The failed build is a consequence of a series of unfortunate events.

First=2C when building the glibc for the first time=2C configure cannot fin=
d g++=20
compiler at all.  config.log states:

line 1594: arm-poky-linux-gnueabi-g++: command not found
configure:3165: $? =3D 127

Secondly=2C the g++ (which is not found) is then used to determine the loca=
tion of the
include headers=2C resulting in
CXX_SYSINCLUDES=3D''

Thirdly=2C even if g++ is found (it is found when re-building glibc=2C see =
below)=2C
the algorithm used to detect the CXX_SYSINCLUDES does not seem to work and=
=20
the headers are not detected. I "fixed" this  by adding the following to gi=
t/configure:

@@ -5184=2C6 +5197=2C14 @@
       test "x$cxxheaders" !=3D x &&
       CXX_SYSINCLUDES=3D"$CXX_SYSINCLUDES -isystem $cxxheaders"
     done
+    if test -z "$CXX_SYSINCLUDES"=3B then
+      cxxversion=3D`$CXX -dumpversion`=20
+      cxxmachine=3D`$CXX -dumpmachine`=20
+      CXX_SYSINCLUDES=3D" -isystem $sysheaders/c++/$cxxversion \
+-isystem $sysheaders/c++/$cxxversion/$cxxmachine"
+    { $as_echo "$as_me:${as_lineno-$LINENO}: guessing CXX_SYSINCLUDES: $CX=
X_SYSINCLUDES" >&5
+$as_echo_n "guessing CXX_SYSINCLUDE: $CXX_SYSINCLUDES... " >&6=3B }
+    fi
   fi
 fi

After the core-image-minimal is built=2C by the time the test suite is run=
=2C g++ is present=2C=20
but CXX_SYSINCLUDES  is still not correct (unless the "fix" above is applie=
d). However=2C=20
not all c++ tests require c++ headers=2C  so some will build correctly. I t=
ested the "fix"=20
successfully with qemux86-64=2C qemumips and qemuarm.=20
(qemuarm exposed some additional problems though).

The "fix" is just a proof of concept: with correct CXX system header paths =
all=20
the offending programs build correctly. But this "fix" only works when re-b=
uilding=20
glibc after the core-image-minimal is built.

The g++ compiler is not needed for glibc at all=2C it is only needed to bui=
ld=20
some of the tests in the testsuite.  Probably worth noting is that glibc ca=
nnot DEPEND on=20
g++  due to circular dependencies.

thats right. glibc is built using a bootstapped cross compiler where we dis=
able c++ support. This is to solve the catch-22 that glibc and gcc have. he=
nce the reason why you miss most of c++ probes.

The proper way to fix this would be to initialize CXX_SYSINCLUDES before bu=
ilding/running the test suite=20
and not before building the glibc.
A suitable place for this seems to be recipes-core/glibc/glibc-testing.inc

yes. Running the test suites should be done after gcc-cross is built and st=
aged. I would not prefer to doubly build glibcthats just waste of build tim=
e.=20

Any thoughts?

Thanks

Juro


-- _______________________________________________Openembedded-core mailing=
 listOpenembedded-core@lists.openembedded.orghttp://lists.openembedded.org/=
mailman/listinfo/openembedded-core
 		 	   		  =

--_fb48a379-c364-4d92-9032-51028921a1ba_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<style><!--
.hmmessage P
{
margin:0px=3B
padding:0px
}
body.hmmessage
{
font-size: 12pt=3B
font-family:Calibri
}
--></style></head>
<body class=3D'hmmessage'><div dir=3D'ltr'>I filed a bug report <br><a href=
=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7081" target=3D"_bl=
ank">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7081</a><br><br>I =
also proposed a fix. The fix is quite safe=2C it does not affect glibc buil=
d=2C<br>only modifies the testing script glibc-testing.inc.&nbsp=3B <br>Inc=
identally=2C I believe there is a tiny bug in glibc-testing.inc:<br><br>fgr=
ep tcbootstrap ${B}/config.make &gt=3B ${B}/configparms<br><br>should be <b=
r><br>fgrep tcbootstrap ${B}/config.make &gt=3B&gt=3B ${B}/configparms<br><=
br>Otherwise the just entered comments in configparms get immediately wiped=
-out.<br><br>Juro<br><div><hr id=3D"stopSpelling">Subject: Re: [OE-core] Pr=
oblems running glibc test suite...<br>From: raj.khem@gmail.com<br>Date: Tue=
=2C 9 Dec 2014 09:39:55 -0800<br>CC: openembedded-core@lists.openembedded.o=
rg<br>To: jurobystricky@hotmail.com<br><br><br><div><blockquote><div>On Dec=
 9=2C 2014=2C at 9:08 AM=2C Juro Bystricky &lt=3B<a href=3D"mailto:jurobyst=
ricky@hotmail.com">jurobystricky@hotmail.com</a>&gt=3B wrote:</div><br clas=
s=3D"ecxApple-interchange-newline"><div><div dir=3D"ltr" style=3D"font-fami=
ly:Calibri=3Bfont-size:16px=3Bfont-style:normal=3Bfont-variant:normal=3Bfon=
t-weight:normal=3Bletter-spacing:normal=3Bline-height:normal=3Btext-align:s=
tart=3Btext-indent:0px=3Btext-transform:none=3Bwhite-space:normal=3Bword-sp=
acing:0px=3B"><div dir=3D"ltr">I tried to run the glibc test suite and enco=
untered various problems.<br>I build glibc as a part of core-image-minimal =
with libgcc and libstdc++=2C<span class=3D"ecxApple-converted-space">&nbsp=
=3B</span><br>both additional libraries are needed by the glibc test suite.=
<br><br>By far most tests run just fine=2C but there are several tests that=
 fail<br>to build at all. The offenders are:<br><br>/elf/tst-unique3cc<br>/=
elf/tst-unique4cc<span class=3D"ecxApple-converted-space">&nbsp=3B</span><b=
r>/elf/<a href=3D"http://tst-unique3lib.cc/" target=3D"_blank">tst-unique3l=
ib.cc</a><span class=3D"ecxApple-converted-space">&nbsp=3B</span><br>/elf/<=
a href=3D"http://tst-unique3lib2.cc/" target=3D"_blank">tst-unique3lib2.cc<=
/a>.<span class=3D"ecxApple-converted-space">&nbsp=3B</span><br><br>They al=
l fail with an error:<br><br>&nbsp=3Bfatal error: cstdio: No such file or d=
irectory<br>&nbsp=3B#include &lt=3Bcstdio&gt=3B<br><br>The obvious reason i=
s that the c++ header files were not found by the g++.<br>g++ was invoked w=
ith -nostdinc flag=2C and in that case the path to system include<br>files =
must be specified explicitly.<br><br>The failed build is a consequence of a=
 series of unfortunate events.<br><br>First=2C when building the glibc for =
the first time=2C configure cannot find g++<span class=3D"ecxApple-converte=
d-space">&nbsp=3B</span><br>compiler at all.&nbsp=3B config.log states:<br>=
<br>line 1594: arm-poky-linux-gnueabi-g++: command not found<br>configure:3=
165: $? =3D 127<br><br>Secondly=2C the g++ (which is not found) is then use=
d to determine the location of the<br>include headers=2C resulting in<br>CX=
X_SYSINCLUDES=3D''<br><br>Thirdly=2C even if g++ is found (it is found when=
 re-building glibc=2C see below)=2C<br>the algorithm used to detect the CXX=
_SYSINCLUDES does not seem to work and<span class=3D"ecxApple-converted-spa=
ce">&nbsp=3B</span><br>the headers are not detected. I "fixed" this&nbsp=3B=
 by adding the following to git/configure:<br><br>@@ -5184=2C6 +5197=2C14 @=
@<br>&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B test "x$cxxheaders" !=
=3D x &amp=3B&amp=3B<br>&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B CX=
X_SYSINCLUDES=3D"$CXX_SYSINCLUDES -isystem $cxxheaders"<br>&nbsp=3B&nbsp=3B=
&nbsp=3B&nbsp=3B done<br>+&nbsp=3B&nbsp=3B&nbsp=3B if test -z "$CXX_SYSINCL=
UDES"=3B then<br>+&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B cxxversion=3D`$C=
XX -dumpversion`<span class=3D"ecxApple-converted-space">&nbsp=3B</span><br=
>+&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B cxxmachine=3D`$CXX -dumpmachine`=
<span class=3D"ecxApple-converted-space">&nbsp=3B</span><br>+&nbsp=3B&nbsp=
=3B&nbsp=3B&nbsp=3B&nbsp=3B CXX_SYSINCLUDES=3D" -isystem $sysheaders/c++/$c=
xxversion \<br>+-isystem $sysheaders/c++/$cxxversion/$cxxmachine"<br>+&nbsp=
=3B&nbsp=3B&nbsp=3B { $as_echo "$as_me:${as_lineno-$LINENO}: guessing CXX_S=
YSINCLUDES: $CXX_SYSINCLUDES" &gt=3B&amp=3B5<br>+$as_echo_n "guessing CXX_S=
YSINCLUDE: $CXX_SYSINCLUDES... " &gt=3B&amp=3B6=3B }<br>+&nbsp=3B&nbsp=3B&n=
bsp=3B fi<br>&nbsp=3B&nbsp=3B fi<br>&nbsp=3Bfi<br><br>After the core-image-=
minimal is built=2C by the time the test suite is run=2C g++ is present=2C<=
span class=3D"ecxApple-converted-space">&nbsp=3B</span><br>but CXX_SYSINCLU=
DES&nbsp=3B is still not correct (unless the "fix" above is applied). Howev=
er=2C<span class=3D"ecxApple-converted-space">&nbsp=3B</span><br>not all c+=
+ tests require c++ headers=2C&nbsp=3B so some will build correctly. I test=
ed the "fix"<span class=3D"ecxApple-converted-space">&nbsp=3B</span><br>suc=
cessfully with qemux86-64=2C qemumips and qemuarm.<span class=3D"ecxApple-c=
onverted-space">&nbsp=3B</span><br>(qemuarm exposed some additional problem=
s though).<br><br>The "fix" is just a proof of concept: with correct CXX sy=
stem header paths all<span class=3D"ecxApple-converted-space">&nbsp=3B</spa=
n><br>the offending programs build correctly. But this "fix" only works whe=
n re-building<span class=3D"ecxApple-converted-space">&nbsp=3B</span><br>gl=
ibc after the core-image-minimal is built.<br><br>The g++ compiler is not n=
eeded for glibc at all=2C it is only needed to build<span class=3D"ecxApple=
-converted-space">&nbsp=3B</span><br>some of the tests in the testsuite.&nb=
sp=3B<span class=3D"ecxApple-converted-space">&nbsp=3B</span><a href=3D"htt=
ps://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7003%29" target=3D"_blank"=
></a>Probably worth noting is that glibc cannot DEPEND on<span class=3D"ecx=
Apple-converted-space">&nbsp=3B</span><br>g++&nbsp=3B due to circular depen=
dencies.<br></div></div></div></blockquote><div><br></div><div>thats right.=
 glibc is built using a bootstapped cross compiler where we disable c++ sup=
port. This is to solve the catch-22 that glibc and gcc have. hence the reas=
on why you miss most of c++ probes.</div><br><blockquote><div><div dir=3D"l=
tr" style=3D"font-family:Calibri=3Bfont-size:16px=3Bfont-style:normal=3Bfon=
t-variant:normal=3Bfont-weight:normal=3Bletter-spacing:normal=3Bline-height=
:normal=3Btext-align:start=3Btext-indent:0px=3Btext-transform:none=3Bwhite-=
space:normal=3Bword-spacing:0px=3B"><div dir=3D"ltr"><br>The proper way to =
fix this would be to initialize CXX_SYSINCLUDES before building/running the=
 test suite<span class=3D"ecxApple-converted-space">&nbsp=3B</span><br>and =
not before building the glibc.<br>A suitable place for this seems to be rec=
ipes-core/glibc/glibc-testing.inc<br></div></div></div></blockquote><div><b=
r></div><div>yes. Running the test suites should be done after gcc-cross is=
 built and staged. I would not prefer to doubly build glibc</div><div>thats=
 just waste of build time.&nbsp=3B</div><br><blockquote><div><div dir=3D"lt=
r" style=3D"font-family:Calibri=3Bfont-size:16px=3Bfont-style:normal=3Bfont=
-variant:normal=3Bfont-weight:normal=3Bletter-spacing:normal=3Bline-height:=
normal=3Btext-align:start=3Btext-indent:0px=3Btext-transform:none=3Bwhite-s=
pace:normal=3Bword-spacing:0px=3B"><div dir=3D"ltr"><br>Any thoughts?<br><b=
r>Thanks<br><br>Juro<br><br><br></div></div><span style=3D"font-family:Cali=
bri=3Bfont-size:16px=3Bfont-style:normal=3Bfont-variant:normal=3Bfont-weigh=
t:normal=3Bletter-spacing:normal=3Bline-height:normal=3Btext-align:start=3B=
text-indent:0px=3Btext-transform:none=3Bwhite-space:normal=3Bword-spacing:0=
px=3Bdisplay:inline !important=3B">--<span class=3D"ecxApple-converted-spac=
e">&nbsp=3B</span></span><br style=3D"font-family:Calibri=3Bfont-size:16px=
=3Bfont-style:normal=3Bfont-variant:normal=3Bfont-weight:normal=3Bletter-sp=
acing:normal=3Bline-height:normal=3Btext-align:start=3Btext-indent:0px=3Bte=
xt-transform:none=3Bwhite-space:normal=3Bword-spacing:0px=3B"><span style=
=3D"font-family:Calibri=3Bfont-size:16px=3Bfont-style:normal=3Bfont-variant=
:normal=3Bfont-weight:normal=3Bletter-spacing:normal=3Bline-height:normal=
=3Btext-align:start=3Btext-indent:0px=3Btext-transform:none=3Bwhite-space:n=
ormal=3Bword-spacing:0px=3Bdisplay:inline !important=3B">__________________=
_____________________________</span><br style=3D"font-family:Calibri=3Bfont=
-size:16px=3Bfont-style:normal=3Bfont-variant:normal=3Bfont-weight:normal=
=3Bletter-spacing:normal=3Bline-height:normal=3Btext-align:start=3Btext-ind=
ent:0px=3Btext-transform:none=3Bwhite-space:normal=3Bword-spacing:0px=3B"><=
span style=3D"font-family:Calibri=3Bfont-size:16px=3Bfont-style:normal=3Bfo=
nt-variant:normal=3Bfont-weight:normal=3Bletter-spacing:normal=3Bline-heigh=
t:normal=3Btext-align:start=3Btext-indent:0px=3Btext-transform:none=3Bwhite=
-space:normal=3Bword-spacing:0px=3Bdisplay:inline !important=3B">Openembedd=
ed-core mailing list</span><br style=3D"font-family:Calibri=3Bfont-size:16p=
x=3Bfont-style:normal=3Bfont-variant:normal=3Bfont-weight:normal=3Bletter-s=
pacing:normal=3Bline-height:normal=3Btext-align:start=3Btext-indent:0px=3Bt=
ext-transform:none=3Bwhite-space:normal=3Bword-spacing:0px=3B"><a href=3D"m=
ailto:Openembedded-core@lists.openembedded.org" style=3D"font-family:Calibr=
i=3Bfont-size:16px=3Bfont-style:normal=3Bfont-variant:normal=3Bfont-weight:=
normal=3Bletter-spacing:normal=3Bline-height:normal=3Btext-align:start=3Bte=
xt-indent:0px=3Btext-transform:none=3Bwhite-space:normal=3Bword-spacing:0px=
=3B">Openembedded-core@lists.openembedded.org</a><br style=3D"font-family:C=
alibri=3Bfont-size:16px=3Bfont-style:normal=3Bfont-variant:normal=3Bfont-we=
ight:normal=3Bletter-spacing:normal=3Bline-height:normal=3Btext-align:start=
=3Btext-indent:0px=3Btext-transform:none=3Bwhite-space:normal=3Bword-spacin=
g:0px=3B"><a href=3D"http://lists.openembedded.org/mailman/listinfo/openemb=
edded-core" style=3D"font-family:Calibri=3Bfont-size:16px=3Bfont-style:norm=
al=3Bfont-variant:normal=3Bfont-weight:normal=3Bletter-spacing:normal=3Blin=
e-height:normal=3Btext-align:start=3Btext-indent:0px=3Btext-transform:none=
=3Bwhite-space:normal=3Bword-spacing:0px=3B" target=3D"_blank">http://lists=
.openembedded.org/mailman/listinfo/openembedded-core</a></div></blockquote>=
</div><br></div> 		 	   		  </div></body>
</html>=

--_fb48a379-c364-4d92-9032-51028921a1ba_--
