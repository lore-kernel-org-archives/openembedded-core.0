Return-Path: <jurobystricky@hotmail.com>
Received: from BAY004-OMC3S18.hotmail.com (bay004-omc3s18.hotmail.com
	[65.54.190.156])
	by mail.openembedded.org (Postfix) with ESMTP id 90F4E724F1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 17:08:38 +0000 (UTC)
Received: from BAY179-W94 ([65.54.190.189]) by BAY004-OMC3S18.hotmail.com over
	TLS secured channel with Microsoft SMTPSVC(7.5.7601.22751); 
	Tue, 9 Dec 2014 09:08:38 -0800
X-TMN: [RbcCu18RUlzvYoUP9HJa81mGkrkvNY/8]
X-Originating-Email: [jurobystricky@hotmail.com]
Message-ID: <BAY179-W94EE5F805A59DEBDCC4035BB650@phx.gbl>
From: Juro Bystricky <jurobystricky@hotmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 9 Dec 2014 09:08:38 -0800
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 09 Dec 2014 17:08:38.0397 (UTC)
	FILETIME=[C64142D0:01D013D2]
Subject: Problems running glibc test suite...
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
X-List-Received-Date: Tue, 09 Dec 2014 17:08:41 -0000
Content-Type: multipart/alternative;
	boundary="_e7c80e84-495e-45e8-bb69-40099351b68d_"

--_e7c80e84-495e-45e8-bb69-40099351b68d_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

=0A=
=0A=
=0A=
I tried to run the glibc test suite and encountered various problems.
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

The proper way to fix this would be to initialize CXX_SYSINCLUDES before bu=
ilding/running the test suite=20
and not before building the glibc.
A suitable place for this seems to be recipes-core/glibc/glibc-testing.inc

Any thoughts?

Thanks

Juro


=0A=
 		 	   		  =

--_e7c80e84-495e-45e8-bb69-40099351b68d_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
</head>
<body class=3D'hmmessage'><div dir=3D'ltr'>=0A=
=0A=
<style><!--=0A=
.hmmessage P=0A=
{=0A=
margin:0px=3B=0A=
padding:0px=0A=
}=0A=
body.hmmessage=0A=
{=0A=
font-size: 12pt=3B=0A=
font-family:Calibri=0A=
}=0A=
--></style>=0A=
<div dir=3D"ltr">I tried to run the glibc test suite and encountered variou=
s problems.<br>I build glibc as a part of core-image-minimal with libgcc an=
d libstdc++=2C <br>both additional libraries are needed by the glibc test s=
uite.<br><br>By far most tests run just fine=2C but there are several tests=
 that fail<br>to build at all. The offenders are:<br><br>/elf/tst-unique3cc=
<br>/elf/tst-unique4cc <br>/elf/tst-unique3lib.cc <br>/elf/tst-unique3lib2.=
cc. <br><br>They all fail with an error:<br><br>&nbsp=3Bfatal error: cstdio=
: No such file or directory<br>&nbsp=3B#include &lt=3Bcstdio&gt=3B<br><br>T=
he obvious reason is that the c++ header files were not found by the g++.<b=
r>g++ was invoked with -nostdinc flag=2C and in that case the path to syste=
m include<br>files must be specified explicitly.<br><br>The failed build is=
 a consequence of a series of unfortunate events.<br><br>First=2C when buil=
ding the glibc for the first time=2C configure cannot find g++ <br>compiler=
 at all.&nbsp=3B config.log states:<br><br>line 1594: arm-poky-linux-gnueab=
i-g++: command not found<br>configure:3165: $? =3D 127<br><br>Secondly=2C t=
he g++ (which is not found) is then used to determine the location of the<b=
r>include headers=2C resulting in<br>CXX_SYSINCLUDES=3D''<br><br>Thirdly=2C=
 even if g++ is found (it is found when re-building glibc=2C see below)=2C<=
br>the algorithm used to detect the CXX_SYSINCLUDES does not seem to work a=
nd <br>the headers are not detected. I "fixed" this&nbsp=3B by adding the f=
ollowing to git/configure:<br><br>@@ -5184=2C6 +5197=2C14 @@<br>&nbsp=3B&nb=
sp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B test "x$cxxheaders" !=3D x &amp=3B&am=
p=3B<br>&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B CXX_SYSINCLUDES=3D=
"$CXX_SYSINCLUDES -isystem $cxxheaders"<br>&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B=
 done<br>+&nbsp=3B&nbsp=3B&nbsp=3B if test -z "$CXX_SYSINCLUDES"=3B then<br=
>+&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B cxxversion=3D`$CXX -dumpversion`=
 <br>+&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B cxxmachine=3D`$CXX -dumpmach=
ine` <br>+&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B CXX_SYSINCLUDES=3D" -isy=
stem $sysheaders/c++/$cxxversion \<br>+-isystem $sysheaders/c++/$cxxversion=
/$cxxmachine"<br>+&nbsp=3B&nbsp=3B&nbsp=3B { $as_echo "$as_me:${as_lineno-$=
LINENO}: guessing CXX_SYSINCLUDES: $CXX_SYSINCLUDES" &gt=3B&amp=3B5<br>+$as=
_echo_n "guessing CXX_SYSINCLUDE: $CXX_SYSINCLUDES... " &gt=3B&amp=3B6=3B }=
<br>+&nbsp=3B&nbsp=3B&nbsp=3B fi<br>&nbsp=3B&nbsp=3B fi<br>&nbsp=3Bfi<br><b=
r>After the core-image-minimal is built=2C by the time the test suite is ru=
n=2C g++ is present=2C <br>but CXX_SYSINCLUDES&nbsp=3B is still not correct=
 (unless the "fix" above is applied). However=2C <br>not all c++ tests requ=
ire c++ headers=2C&nbsp=3B so some will build correctly. I tested the "fix"=
 <br>successfully with qemux86-64=2C qemumips and qemuarm. <br>(qemuarm exp=
osed some additional problems though).<br><br>The "fix" is just a proof of =
concept: with correct CXX system header paths all <br>the offending program=
s build correctly. But this "fix" only works when re-building <br>glibc aft=
er the core-image-minimal is built.<br><br>The g++ compiler is not needed f=
or glibc at all=2C it is only needed to build <br>some of the tests in the =
testsuite.&nbsp=3B <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cg=
i?id=3D7003%29" target=3D"_blank"></a>Probably worth noting is that glibc c=
annot DEPEND on <br>g++&nbsp=3B due to circular dependencies.<br><br>The pr=
oper way to fix this would be to initialize CXX_SYSINCLUDES before building=
/running the test suite <br>and not before building the glibc.<br>A suitabl=
e place for this seems to be recipes-core/glibc/glibc-testing.inc<br><br>An=
y thoughts?<br><br>Thanks<br><br>Juro<br><br><br></div>=0A=
 		 	   		  </div></body>
</html>=

--_e7c80e84-495e-45e8-bb69-40099351b68d_--
