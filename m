Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 91A6272392
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 17:39:57 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id y13so966749pdi.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Dec 2014 09:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Jb20mLPKFjEy2RmtC0t26zNAjSIkTQIHMkKbxF6TSso=;
	b=fSWXwvC9I2zVgec088JYqncE3w6Y5XKXeqJDV02PXqeneI0D37MhZm1eY/xkA3kJjD
	xeujM2CwleUUtZ8gPeGn74E7BYM2WCFpysVSd1ofskeePb4sfi8BQM+4BcujBejHpLmB
	rV4iq5HUZSBED3HQGNWEpPAD10fJ6A4G5WpP771a51N0JXumnVcCA72x3fTTPs9zBfTb
	BLxTUpl/Tcy01/9dC8CjCf9kUIi6a/glNtwiaI2cQSpKCb/YG6nCpRJ++AWckjfW5/sp
	ucpTphJjOKUIO4KWy3+ueXJnX8Hw/lqSvwmSH4jUfSZgve5uSYwj8LI+XqnjewVgF2MK
	vUGA==
X-Received: by 10.70.55.8 with SMTP id n8mr32747255pdp.95.1418146797693;
	Tue, 09 Dec 2014 09:39:57 -0800 (PST)
Received: from [192.168.0.27] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85]) by mx.google.com with ESMTPSA id
	jp15sm2052244pbb.17.2014.12.09.09.39.56 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 09 Dec 2014 09:39:56 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <BAY179-W94EE5F805A59DEBDCC4035BB650@phx.gbl>
Date: Tue, 9 Dec 2014 09:39:55 -0800
Message-Id: <387ED5C5-E7F1-47EF-8BC9-0D90656BB085@gmail.com>
References: <BAY179-W94EE5F805A59DEBDCC4035BB650@phx.gbl>
To: Juro Bystricky <jurobystricky@hotmail.com>
X-Mailer: Apple Mail (2.1993)
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
X-List-Received-Date: Tue, 09 Dec 2014 17:40:05 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_436B3444-EABD-44E5-A543-6C5DA3E31AD6"

--Apple-Mail=_436B3444-EABD-44E5-A543-6C5DA3E31AD6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


> On Dec 9, 2014, at 9:08 AM, Juro Bystricky <jurobystricky@hotmail.com> =
wrote:
>=20
> I tried to run the glibc test suite and encountered various problems.
> I build glibc as a part of core-image-minimal with libgcc and =
libstdc++,=20
> both additional libraries are needed by the glibc test suite.
>=20
> By far most tests run just fine, but there are several tests that fail
> to build at all. The offenders are:
>=20
> /elf/tst-unique3cc
> /elf/tst-unique4cc=20
> /elf/tst-unique3lib.cc <http://tst-unique3lib.cc/>=20
> /elf/tst-unique3lib2.cc <http://tst-unique3lib2.cc/>.=20
>=20
> They all fail with an error:
>=20
>  fatal error: cstdio: No such file or directory
>  #include <cstdio>
>=20
> The obvious reason is that the c++ header files were not found by the =
g++.
> g++ was invoked with -nostdinc flag, and in that case the path to =
system include
> files must be specified explicitly.
>=20
> The failed build is a consequence of a series of unfortunate events.
>=20
> First, when building the glibc for the first time, configure cannot =
find g++=20
> compiler at all.  config.log states:
>=20
> line 1594: arm-poky-linux-gnueabi-g++: command not found
> configure:3165: $? =3D 127
>=20
> Secondly, the g++ (which is not found) is then used to determine the =
location of the
> include headers, resulting in
> CXX_SYSINCLUDES=3D''
>=20
> Thirdly, even if g++ is found (it is found when re-building glibc, see =
below),
> the algorithm used to detect the CXX_SYSINCLUDES does not seem to work =
and=20
> the headers are not detected. I "fixed" this  by adding the following =
to git/configure:
>=20
> @@ -5184,6 +5197,14 @@
>        test "x$cxxheaders" !=3D x &&
>        CXX_SYSINCLUDES=3D"$CXX_SYSINCLUDES -isystem $cxxheaders"
>      done
> +    if test -z "$CXX_SYSINCLUDES"; then
> +      cxxversion=3D`$CXX -dumpversion`=20
> +      cxxmachine=3D`$CXX -dumpmachine`=20
> +      CXX_SYSINCLUDES=3D" -isystem $sysheaders/c++/$cxxversion \
> +-isystem $sysheaders/c++/$cxxversion/$cxxmachine"
> +    { $as_echo "$as_me:${as_lineno-$LINENO}: guessing =
CXX_SYSINCLUDES: $CXX_SYSINCLUDES" >&5
> +$as_echo_n "guessing CXX_SYSINCLUDE: $CXX_SYSINCLUDES... " >&6; }
> +    fi
>    fi
>  fi
>=20
> After the core-image-minimal is built, by the time the test suite is =
run, g++ is present,=20
> but CXX_SYSINCLUDES  is still not correct (unless the "fix" above is =
applied). However,=20
> not all c++ tests require c++ headers,  so some will build correctly. =
I tested the "fix"=20
> successfully with qemux86-64, qemumips and qemuarm.=20
> (qemuarm exposed some additional problems though).
>=20
> The "fix" is just a proof of concept: with correct CXX system header =
paths all=20
> the offending programs build correctly. But this "fix" only works when =
re-building=20
> glibc after the core-image-minimal is built.
>=20
> The g++ compiler is not needed for glibc at all, it is only needed to =
build=20
> some of the tests in the testsuite.   =
<https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7003%29>Probably =
worth noting is that glibc cannot DEPEND on=20
> g++  due to circular dependencies.

thats right. glibc is built using a bootstapped cross compiler where we =
disable c++ support. This is to solve the catch-22 that glibc and gcc =
have. hence the reason why you miss most of c++ probes.

>=20
> The proper way to fix this would be to initialize CXX_SYSINCLUDES =
before building/running the test suite=20
> and not before building the glibc.
> A suitable place for this seems to be =
recipes-core/glibc/glibc-testing.inc

yes. Running the test suites should be done after gcc-cross is built and =
staged. I would not prefer to doubly build glibc
thats just waste of build time.=20

>=20
> Any thoughts?
>=20
> Thanks
>=20
> Juro
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org =
<mailto:Openembedded-core@lists.openembedded.org>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core =
<http://lists.openembedded.org/mailman/listinfo/openembedded-core>

--Apple-Mail=_436B3444-EABD-44E5-A543-6C5DA3E31AD6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=iso-8859-1

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Diso-8859-1"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Dec 9, 2014, at 9:08 AM, Juro Bystricky &lt;<a =
href=3D"mailto:jurobystricky@hotmail.com" =
class=3D"">jurobystricky@hotmail.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
style=3D"font-family: Calibri; font-size: 16px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><div dir=3D"ltr" =
class=3D"">I tried to run the glibc test suite and encountered various =
problems.<br class=3D"">I build glibc as a part of core-image-minimal =
with libgcc and libstdc++,<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">both =
additional libraries are needed by the glibc test suite.<br class=3D""><br=
 class=3D"">By far most tests run just fine, but there are several tests =
that fail<br class=3D"">to build at all. The offenders are:<br =
class=3D""><br class=3D"">/elf/tst-unique3cc<br =
class=3D"">/elf/tst-unique4cc<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">/elf/<a =
href=3D"http://tst-unique3lib.cc/" class=3D"">tst-unique3lib.cc</a><span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">/elf/<a =
href=3D"http://tst-unique3lib2.cc/" =
class=3D"">tst-unique3lib2.cc</a>.<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D""><br =
class=3D"">They all fail with an error:<br class=3D""><br =
class=3D"">&nbsp;fatal error: cstdio: No such file or directory<br =
class=3D"">&nbsp;#include &lt;cstdio&gt;<br class=3D""><br class=3D"">The =
obvious reason is that the c++ header files were not found by the =
g++.<br class=3D"">g++ was invoked with -nostdinc flag, and in that case =
the path to system include<br class=3D"">files must be specified =
explicitly.<br class=3D""><br class=3D"">The failed build is a =
consequence of a series of unfortunate events.<br class=3D""><br =
class=3D"">First, when building the glibc for the first time, configure =
cannot find g++<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">compiler at all.&nbsp; config.log states:<br class=3D""><br =
class=3D"">line 1594: arm-poky-linux-gnueabi-g++: command not found<br =
class=3D"">configure:3165: $? =3D 127<br class=3D""><br =
class=3D"">Secondly, the g++ (which is not found) is then used to =
determine the location of the<br class=3D"">include headers, resulting =
in<br class=3D"">CXX_SYSINCLUDES=3D''<br class=3D""><br =
class=3D"">Thirdly, even if g++ is found (it is found when re-building =
glibc, see below),<br class=3D"">the algorithm used to detect the =
CXX_SYSINCLUDES does not seem to work and<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">the headers =
are not detected. I "fixed" this&nbsp; by adding the following to =
git/configure:<br class=3D""><br class=3D"">@@ -5184,6 +5197,14 @@<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test "x$cxxheaders" !=3D =
x &amp;&amp;<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
CXX_SYSINCLUDES=3D"$CXX_SYSINCLUDES -isystem $cxxheaders"<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp; done<br class=3D"">+&nbsp;&nbsp;&nbsp;=
 if test -z "$CXX_SYSINCLUDES"; then<br =
class=3D"">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cxxversion=3D`$CXX =
-dumpversion`<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cxxmachine=3D`$CXX =
-dumpmachine`<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CXX_SYSINCLUDES=3D" -isystem =
$sysheaders/c++/$cxxversion \<br class=3D"">+-isystem =
$sysheaders/c++/$cxxversion/$cxxmachine"<br class=3D"">+&nbsp;&nbsp;&nbsp;=
 { $as_echo "$as_me:${as_lineno-$LINENO}: guessing CXX_SYSINCLUDES: =
$CXX_SYSINCLUDES" &gt;&amp;5<br class=3D"">+$as_echo_n "guessing =
CXX_SYSINCLUDE: $CXX_SYSINCLUDES... " &gt;&amp;6; }<br =
class=3D"">+&nbsp;&nbsp;&nbsp; fi<br class=3D"">&nbsp;&nbsp; fi<br =
class=3D"">&nbsp;fi<br class=3D""><br class=3D"">After the =
core-image-minimal is built, by the time the test suite is run, g++ is =
present,<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">but CXX_SYSINCLUDES&nbsp; is still not correct (unless the =
"fix" above is applied). However,<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">not all c++ =
tests require c++ headers,&nbsp; so some will build correctly. I tested =
the "fix"<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">successfully with qemux86-64, qemumips and qemuarm.<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">(qemuarm =
exposed some additional problems though).<br class=3D""><br class=3D"">The=
 "fix" is just a proof of concept: with correct CXX system header paths =
all<span class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">the =
offending programs build correctly. But this "fix" only works when =
re-building<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">glibc after the core-image-minimal is built.<br class=3D""><br =
class=3D"">The g++ compiler is not needed for glibc at all, it is only =
needed to build<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">some of the tests in the testsuite.&nbsp;<span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7003%29" =
target=3D"_blank" class=3D""></a>Probably worth noting is that glibc =
cannot DEPEND on<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">g++&nbsp; due to circular dependencies.<br =
class=3D""></div></div></div></blockquote><div><br =
class=3D""></div><div>thats right. glibc is built using a bootstapped =
cross compiler where we disable c++ support. This is to solve the =
catch-22 that glibc and gcc have. hence the reason why you miss most of =
c++ probes.</div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><div dir=3D"ltr" style=3D"font-family: Calibri; font-size: =
16px; font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><div dir=3D"ltr" class=3D""><br class=3D"">The proper way to =
fix this would be to initialize CXX_SYSINCLUDES before building/running =
the test suite<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">and not before building the glibc.<br class=3D"">A suitable =
place for this seems to be recipes-core/glibc/glibc-testing.inc<br =
class=3D""></div></div></div></blockquote><div><br =
class=3D""></div><div>yes. Running the test suites should be done after =
gcc-cross is built and staged. I would not prefer to doubly build =
glibc</div><div>thats just waste of build time.&nbsp;</div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
dir=3D"ltr" style=3D"font-family: Calibri; font-size: 16px; font-style: =
normal; font-variant: normal; font-weight: normal; letter-spacing: =
normal; line-height: normal; orphans: auto; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: =
auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><div =
dir=3D"ltr" class=3D""><br class=3D"">Any thoughts?<br class=3D""><br =
class=3D"">Thanks<br class=3D""><br class=3D"">Juro<br class=3D""><br =
class=3D""><br class=3D""></div></div><span style=3D"font-family: =
Calibri; font-size: 16px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">--<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"font-family: Calibri; font-size: 16px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Calibri; font-size: 16px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" =
class=3D"">_______________________________________________</span><br =
style=3D"font-family: Calibri; font-size: 16px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Calibri; font-size: 16px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">Openembedded-core mailing list</span><br =
style=3D"font-family: Calibri; font-size: 16px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
style=3D"font-family: Calibri; font-size: 16px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
style=3D"font-family: Calibri; font-size: 16px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><a =
href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core" =
style=3D"font-family: Calibri; font-size: 16px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e</a></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_436B3444-EABD-44E5-A543-6C5DA3E31AD6--
