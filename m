Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
 by mx.groups.io with SMTP id smtpd.web11.6751.1628070102189952763
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 02:41:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: soulik.info, ip: 108.61.200.231, mailfrom: ayaka@soulik.info)
Received: from [192.168.144.9] (unknown [192.147.44.15])
	by kozue.soulik.info (Postfix) with ESMTPSA id E882E100D85;
	Wed,  4 Aug 2021 18:40:11 +0900 (JST)
From: "Randy Li" <ayaka@soulik.info>
Mime-Version: 1.0 (1.0)
Date: Wed, 4 Aug 2021 17:41:35 +0800
Subject: meta-android-ndk: initial version that could build some simple utility
Message-Id: <7C282C74-5BC8-46A0-9452-E705672A55FF@soulik.info>
Cc: raj.khem@gmail.com
To: openembedded-core@lists.openembedded.org
X-Mailer: iPad Mail (16D57)
Content-Type: multipart/alternative;
	boundary=Apple-Mail-404D3B8C-9709-4B72-A1C6-C56CA9F67EEB
Content-Transfer-Encoding: 7bit

--Apple-Mail-404D3B8C-9709-4B72-A1C6-C56CA9F67EEB
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hello All:

It now could compile the libpng and its unit test, I could run it on an An=
droid 11 board. But there are still many problems waiting for solving.

The building above would fail the OE package QA test. There is not a libra=
ry linker file in Android, all the library files won't have a version suffi=
x, I am still finding a method to let this checking being disable for the A=
ndroid target.
You could try it here
https://github.com/hizukiayaka/meta-android-ndk

I am not sure I understand all the variables that were not recorded from t=
he reference manuals. So I didn't package the Android NDK toolchain into an=
 OE toolchain and I skip the canadian toolchain as I don't think an externa=
l toolchain would need it. I left many things hardcode in the tcmode file a=
s I have no idea how to make the meta-clang not try to build me a new clang=
 cross compiler. I am not familiar with LLVM as well, I don't much idea on =
which library comes from where and Google also lacks documents for it.

Let me list those things I am not sure whether I did it right here, please=
 help me solve them.
I have to export some variables globally, like HOST_SYS, TARGET_PREFIX, an=
d TARGET_OS. I thought the meta-external-clang would help me overwrite them=
 but it doesn't.
How would I deal with the package for development? As I said, there is not=
 a version suffix in Android's library name, only something likes company n=
ame would be used for export native libraries to general application. Those=
 development packages would have the headers files and some object files, c=
ould I just remove that QA checking ?
Both HOST_PREFIX and TARGET_PREFIX objdump would be used in some classes b=
ut android only provides a version. Also, there is an llvm-objcopy(and llvm=
-objdump), I didn't found meta-clang would use it;
Should I package the Android NDK toolchain into clang-cross-${TARGET_ARCH}=
 ? I could certainly skip the candian part right?
How to deal with those recipes depending on a kernel module? Although I co=
uld let the OE build a kernel image it just would not be used anywhere, cou=
ld I just make a dummy target?

Later we could move to the final packing, we should not ship those public =
libraries from the Android NDK and get rid of all the daemon service files.=
 But I could just copy what I need from the staging directory so far, we co=
uld think of this later.


ayaka

--Apple-Mail-404D3B8C-9709-4B72-A1C6-C56CA9F67EEB
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=
=
=3Dutf-8"></head><body dir=3D"auto"><p style=3D"margin-top: 0pt; margin-bo=
ttom: 0pt;"><span data-preserver-spaces=3D"true" style=3D"margin-top: 0pt; =
margin-bottom: 0pt; background-color: rgba(255, 255, 255, 0);">Hello All:</=
span></p><p style=3D"margin-top: 0pt; margin-bottom: 0pt;"><span data-prese=
rver-spaces=3D"true" style=3D"margin-top: 0pt; margin-bottom: 0pt; backgrou=
nd-color: rgba(255, 255, 255, 0);"><br></span></p><p style=3D"margin-top: 0=
pt; margin-bottom: 0pt;"><span data-preserver-spaces=3D"true" style=3D"marg=
in-top: 0pt; margin-bottom: 0pt; background-color: rgba(255, 255, 255, 0);"=
>It now could compile the libpng and its unit test, I could run it on an An=
droid 11 board. But there are still many problems waiting for solving.</spa=
n></p><p style=3D"margin-top: 0pt; margin-bottom: 0pt;"><span data-preserve=
r-spaces=3D"true" style=3D"margin-top: 0pt; margin-bottom: 0pt; background-=
color: rgba(255, 255, 255, 0);"><br></span></p><p style=3D"margin-top: 0pt;=
 margin-bottom: 0pt;"><span data-preserver-spaces=3D"true" style=3D"margin-=
top: 0pt; margin-bottom: 0pt; background-color: rgba(255, 255, 255, 0);">Th=
e building above would fail the OE package QA test. There is not a library =
linker file in Android, all the library files won't have a version suffix, =
I am still finding a method to let this checking being disable for the Andr=
oid target.</span></p><p style=3D"margin-top: 0pt; margin-bottom: 0pt;"><sp=
an data-preserver-spaces=3D"true" style=3D"margin-top: 0pt; margin-bottom: =
0pt; background-color: rgba(255, 255, 255, 0);">You could try it here</span=
></p><p style=3D"margin-top: 0pt; margin-bottom: 0pt;"><span data-preserver=
-spaces=3D"true" style=3D"margin-top: 0pt; margin-bottom: 0pt; background-c=
olor: rgba(255, 255, 255, 0);"><a href=3D"https://github.com/hizukiayaka/me=
ta-android-ndk">https://github.com/hizukiayaka/meta-android-ndk</a></span><=
/p><p style=3D"margin-top: 0pt; margin-bottom: 0pt;"><span data-preserver-s=
paces=3D"true" style=3D"margin-top: 0pt; margin-bottom: 0pt; background-col=
or: rgba(255, 255, 255, 0);"><br></span></p><p style=3D"margin-top: 0pt; ma=
rgin-bottom: 0pt;"><span data-preserver-spaces=3D"true" style=3D"margin-top=
: 0pt; margin-bottom: 0pt; background-color: rgba(255, 255, 255, 0);">I am =
not sure I understand all the variables that were not recorded from the ref=
erence manuals. So I didn't package the Android NDK toolchain into an OE to=
olchain and I skip the canadian toolchain as I don't think an external tool=
chain would need it. I left many things hardcode in the tcmode file as I ha=
ve no idea how to make the meta-clang not try to build me a new clang cross=
 compiler. I am not familiar with LLVM as well, I don't much idea on which =
library comes from where and Google also lacks documents for it.</span></p>=
<p style=3D"margin-top: 0pt; margin-bottom: 0pt;"><span data-preserver-spac=
es=3D"true" style=3D"margin-top: 0pt; margin-bottom: 0pt; background-color:=
 rgba(255, 255, 255, 0);"><br></span></p><p style=3D"margin-top: 0pt; margi=
n-bottom: 0pt;"><span data-preserver-spaces=3D"true" style=3D"margin-top: 0=
pt; margin-bottom: 0pt; background-color: rgba(255, 255, 255, 0);">Let me l=
ist those things I am not sure whether I did it right here, please help me =
solve them.</span></p><ol style=3D"margin-top: 0pt; margin-bottom: 0pt;"><l=
i style=3D"margin-top: 0pt; margin-bottom: 0pt; list-style-type: decimal;">=
<span data-preserver-spaces=3D"true" style=3D"margin-top: 0pt; margin-botto=
m: 0pt; background-color: rgba(255, 255, 255, 0);">I have to export some va=
riables globally, like HOST_SYS, TARGET_PREFIX, and TARGET_OS. I thought th=
e meta-external-clang would help me overwrite them but it doesn't.</span></=
li><li style=3D"margin-top: 0pt; margin-bottom: 0pt; list-style-type: decim=
al;"><span data-preserver-spaces=3D"true" style=3D"margin-top: 0pt; margin-=
bottom: 0pt; background-color: rgba(255, 255, 255, 0);">How would I deal wi=
th the package for development? As I said, there is not a version suffix in=
 Android's library name, only something likes company name would be used fo=
r export native libraries to general application. Those development package=
s would have the headers files and some object files, could I just remove t=
hat QA checking ?</span></li><li style=3D"margin-top: 0pt; margin-bottom: 0=
pt; list-style-type: decimal;"><span data-preserver-spaces=3D"true" style=
=3D"margin-top: 0pt; margin-bottom: 0pt; background-color: rgba(255, 255, =
255, 0);">Both HOST_PREFIX and TARGET_PREFIX objdump would be used in some =
classes but android only provides a version. Also, there is an llvm-objcopy=
(and llvm-objdump), I didn't found meta-clang would use it;</span></li><li =
style=3D"margin-top: 0pt; margin-bottom: 0pt; list-style-type: decimal;"><s=
pan data-preserver-spaces=3D"true" style=3D"margin-top: 0pt; margin-bottom:=
 0pt; background-color: rgba(255, 255, 255, 0);">Should I package the Andro=
id NDK toolchain into clang-cross-${TARGET_ARCH} ? I could certainly skip t=
he candian part right?</span></li><li style=3D"margin-top: 0pt; margin-bott=
om: 0pt; list-style-type: decimal;"><span data-preserver-spaces=3D"true" st=
yle=3D"margin-top: 0pt; margin-bottom: 0pt; background-color: rgba(255, 255=
, 255, 0);">How to deal with those recipes depending on a kernel module? Al=
though I could let the OE build a kernel image it just would not be used an=
ywhere, could I just make a dummy target?</span></li></ol><p style=3D"margi=
n-top: 0pt; margin-bottom: 0pt;"><span data-preserver-spaces=3D"true" style=
=
=3D"margin-top: 0pt; margin-bottom: 0pt; background-color: rgba(255, 255, =
255, 0);"><br></span></p><p style=3D"margin-top: 0pt; margin-bottom: 0pt;">=
<span data-preserver-spaces=3D"true" style=3D"margin-top: 0pt; margin-botto=
m: 0pt; background-color: rgba(255, 255, 255, 0);">Later we could move to t=
he final packing, we should not ship those public libraries from the Androi=
d NDK and get rid of all the daemon service files. But I could just copy wh=
at I need from the staging directory so far, we could think of this later.<=
/span></p><div><span style=3D"background-color: rgba(255, 255, 255, 0);"><b=
r></span></div><div><span style=3D"background-color: rgba(255, 255, 255, 0)=
;"><br></span></div><span style=3D"background-color: rgba(255, 255, 255, 0)=
;">ayaka</span><br><br><div id=3D"AppleMailSignature" dir=3D"ltr"></div></b=
ody></html>

--Apple-Mail-404D3B8C-9709-4B72-A1C6-C56CA9F67EEB--
